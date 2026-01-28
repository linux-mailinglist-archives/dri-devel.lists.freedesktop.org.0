Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mL+wGpsOemmS2AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 14:26:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7874A21C1
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 14:26:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C24F10E282;
	Wed, 28 Jan 2026 13:26:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Wi30YdRJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCA6610E282
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 13:26:46 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-47ff94b46afso7977835e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 05:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769606805; x=1770211605; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=loXdXykH2/xF3NA+Uwx4RfRbCLma9XM176QXX5TmjYg=;
 b=Wi30YdRJuqO4WhnGGsDWf4Xz4kJrO4KPcQnfj1SSCOpzidI5pphEPmUK5Ccnp57khD
 WxE2Riy9SgNzneSuEruzYcd2QYCSeyFD27fmXJfJt8Qmm2izoznbm6Eb4mvmo2GvjL/X
 25NBLswLkkas9+gF7wplNJqsjB7UM2JZ0vXSbg17g/E4VWuw6BVEqT1QmtI5z/hcwX8y
 g+xULlwa4IvE5szpydgyD6j/SsXNLMysAFV3o95A+2vhHZv35Y+/KU8pyVCpIEk6emK1
 wf/II4A9tvKbKbf8GD+Tp0PNH7yS8yxNSvGM2z09ljCpVuVz+XXW6OO7HjrKJNKb3pcN
 gBjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769606805; x=1770211605;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=loXdXykH2/xF3NA+Uwx4RfRbCLma9XM176QXX5TmjYg=;
 b=M9gmG7/3VFFy2DNKSBvyzljPsNYnxk7vuIc+J7vE5Kj25RhflaTQvz96364gRAsEXe
 SD7pAE5lZ+8TqX/bWHi0ZhHo/Zs6BAcOt2TIohr+/RolMLEcTI2EtsGgzARn12UCAmwx
 sABxW/1SfbcTtdquXNR3SBVAqs1+adNt4ZX8xcfXP2GkUXrzCBY4V3FRrbAHwZLzlsuV
 4N/Jb2XkXS5qG5f5SI7AifSLwNpiwIrAR/4CwAJ6YSjGR4YTEDG8nEI6+OthqglBqqKj
 /DEqo1ZVA1Hpq+JTa3zql2HtI0+Haq3XotOZloAxaCVIFTpzs6P8zQSKae6Dfk7sk+6P
 c89w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWs1Ym96/eOC7LLNkWm4oXW0w5YFsiTExPqQwfOQ1QQBQwBJwEv5/C/j9R0mN54bpxSn9l/NVhO03c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZN9n761tHiSfY4CvJwOxwdXgzihAFHMBPT15XYwmBCbqogLrp
 jMvGl2z4kYbpdI1JM6dtoixfmavBxOoDHqCUQW9RwR+vp8jLXXj5b/DpoIiIJsBtVzQ5VkWTY4H
 Ok78k
X-Gm-Gg: AZuq6aK1xzVm8ai845bV0GVcvyTwfOd5Cr6lmQn49uneqs/Qpfvq7eYMDf3g0b8o2E1
 8blvoowlUF2id058HTr7uWTfLKotpzpDQsIr2K3HbWY78cDAsevnSnqAOrckvKXXOF1mqgft+pk
 DGmkGMVAFP5+ik+LwtkYWiS/WNAIT4XDswOloKTX5u7K3tGJV0UTfBXDoI2Eg0FgqLER+6hddTS
 J6bpeD2QPrEitzkJ5B8zslmZYxQh4NVoE8n54pYfDANuxRMyRSG4/8AW3X3LYAtOAV2ayZt9ZLD
 1yyKMiXljnVrdBeLl4XAZjVjJtbPYFDMGpbAGqKVyxZSGzvMUDbIaLJPnVCbVIQFYVcwADvio1D
 g24PEdYbhzAsrFCulfMZf0Y50WSMXZrnzqPla3y9AkAub4LhWEeKzGh7fuLAktcPNk6M2wSl69a
 n5aTImuxcE2g6l+Uit
X-Received: by 2002:a05:600c:4587:b0:47d:403a:277 with SMTP id
 5b1f17b1804b1-48069e24034mr70902875e9.4.1769606805009; 
 Wed, 28 Jan 2026 05:26:45 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4806cde00e8sm66387125e9.6.2026.01.28.05.26.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 05:26:44 -0800 (PST)
Date: Wed, 28 Jan 2026 16:26:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Waffle0823 <csshin9928@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH] fbtft: Improve damage_range to mark only changed rows
Message-ID: <aXoOkXRK2e44W_nm@stanley.mountain>
References: <20260128085720.862399-1-csshin9928@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128085720.862399-1-csshin9928@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:csshin9928@gmail.com,m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[dan.carpenter@linaro.org,dri-devel-bounces@lists.freedesktop.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stanley.mountain:mid,linaro.org:dkim]
X-Rspamd-Queue-Id: D7874A21C1
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 05:57:20PM +0900, Waffle0823 wrote:
> Instead of marking the entire display as dirty, calculate
> start_row and end_row based on off/len and mark only those rows.
> This improves performance for partial framebuffer updates.
> 
> Signed-off-by: Waffle0283 csshin9928@gmail.com

Please use your real name that you use to sign legal documents.  The
email address is in the wrong format.

Have you tested this patch?  What was the speedup?

regards,
dan carpenter

