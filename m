Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MFfaG/oOemmS2AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 14:28:26 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E362AA2204
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 14:28:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44D7510E2AE;
	Wed, 28 Jan 2026 13:28:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bGfsZguf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D327910E2AE
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 13:28:22 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-658b7d13f09so1411636a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 05:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769606901; x=1770211701; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ZagjdEHQ21hUp48jB8mdfWlYbNhCwoXWZ/IjA+v/NaQ=;
 b=bGfsZguf1vbaj7n5Dgpns462NCUnzoWXIMa9ewKLSvi+U2XA3fEFby1CU2Yi2945ZU
 DBlkbR9KYnVoX2SnL4NWXMhR+OrRm8eeCj8JQm+RGA35ibj0SnUh5dM8vFrlAo/25h3m
 Ubyppx9V/awJ/ngwExBbNbEaVZPTZP86AaR3W3fATn4DU5TkdoeBweO3gG13wvisoAjD
 JwjWv77C5byJOejkJAXLB3atLUo8GgT+seS22a8END4IRealhgl4602FMrsCvtC80ph1
 JHEF0S5Y7ZCE29T/mETwKs2xACXhG2zUSYKNFJfyYipe9gqeESurAQPkUmUpqIFW7iKk
 +/Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769606901; x=1770211701;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZagjdEHQ21hUp48jB8mdfWlYbNhCwoXWZ/IjA+v/NaQ=;
 b=iXgfaLoiq2X+lrQb3zb/7Y847SVLkr+Hv6It01c+y8PQ/HjCDlOKoVrwMgcILnPFhk
 n8louHXkExGLjafS2KiknmTncnSn+4PFrE1NB0jKeQrQoNn6xThQDUqbeCSemqjlr7Fa
 rwKnyBvLkdVSiC8EhRmi2KXboDSahkSLMKpYnh01Z1PuamgnL2kXi6N1KDhRiNcOBnEP
 vM8YwgRt417m05Nx4/bGoDplb2Nv0X9iqUQEzw6rtxq37KtGWYtlNVTV3u0pHCQAUxoZ
 ipqNuB6xh6/IVZxreBbIO9k4Kiqm+tqPVhaQhEPNFTyVrUF/dEk1GCrVzceG/j0pEZDB
 y03w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUJeDV+aoaZ59uzLKyrvJyPdy/JfRfektbZEUz9Lc5xIJ5XFiS2O1q0syjnrMrJnp1t27u6bWSTrk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyAAdQRLwG1vWlLS9asRvZZTOZjftWWa4mAym5mgklWXR2wY1Pp
 mR5DvamlqHvUx2jnZPT2FGnoe9OyGqwXrspM4XkS0gz4mdWapJwYOY3a/rf9xDoVvss=
X-Gm-Gg: AZuq6aIOCLivkiepis6vuzw8I+pqvsg4+DvvsqNWeXLT3iJ/THWZgHuiha/zUFYeFGb
 tNAEkdcAfDXkgUUHHwsxKTgpKsNCvXQ6+K1ma06NDQQ7QxtglhACTguMISh29Vb0r3PZCw3aAs+
 2Nugz7AxeO7rSAAH6N4arKIN0V7fIOp4O9xr3Hc6aSL5ud4FB4fNtMk0Cc6UaL2Lv4dytL/2NML
 +wfY1dA19loMauonM/122oPLrYlEUK7b+DlzudVtxPpKQvq3uV3P6/HmpbX9MtaN7Ne0Uz6BoJK
 oKNh+tQUE7ON1a8ev8HKoMeC4l4TsGVOQCmEV+QvjsPoqn/JnH/IYT7+RXl7NYeTR/gQ2cQQUyM
 alnyvqv9whwy8oYAIDkAwoTLnLgwwaXUyqdw1WT8KapUt6i0gCNuxkr+IeohO2p3D3j5QAqCvle
 b9kZBiPCzBPKExYYpM
X-Received: by 2002:a17:907:3e0c:b0:b88:38e9:8f89 with SMTP id
 a640c23a62f3a-b8daae2b120mr380653366b.0.1769606901119; 
 Wed, 28 Jan 2026 05:28:21 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8dbecea68dsm131504166b.0.2026.01.28.05.28.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 05:28:20 -0800 (PST)
Date: Wed, 28 Jan 2026 16:28:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: ChanSoo Shin <csshin9928@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH] fbtft: Improve damage_range to mark only changed rows
Message-ID: <aXoO8Yn9JibNVs-b@stanley.mountain>
References: <20260128130503.868466-1-csshin9928@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128130503.868466-1-csshin9928@gmail.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:csshin9928@gmail.com,m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dan.carpenter@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,stanley.mountain:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: E362AA2204
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 10:05:03PM +0900, ChanSoo Shin wrote:
> Instead of marking the entire display as dirty, calculate
> start_row and end_row based on off/len and mark only those rows.
> This improves performance for partial framebuffer updates.
> 
> Signed-off-by: ChanSoo Shin <csshin9928@gmail.com>
> ---

This is v3 but it's not marked or described.

Have you tested this patch?  What was the speed up?

regards,
dan carpenter

