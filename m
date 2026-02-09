Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QG7ELeVAimmKIwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 21:17:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0454D1145BC
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 21:17:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0315510E16B;
	Mon,  9 Feb 2026 20:17:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Fnj5TRgK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1003010E47C
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Feb 2026 20:17:37 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id
 6a1803df08f44-896f6d4b6c1so23778616d6.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Feb 2026 12:17:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770668256; cv=none;
 d=google.com; s=arc-20240605;
 b=A6qLFWLZtSKhtW5XnojXPzo9Mnds1ggnG9BFjTpWhY1CAS8tLvTZipxCTLOEcY1Opu
 2NRXdbZGYpAltx+AfgpHHVWLVVZVwe2naUCsasLDRf+pCpodseRm1QryrnZVJXcvoCoT
 HgfNdHbwXduf/Uad+tEr99WGX6qZMN/rJeA0UdBBz3sbSu/GuPtNv2Jtr+BPTHEQkjJ7
 jdscCyeiIBNc3VCp8ZDFbGmw8zUsCQeexHsTg7JH2/b40ZVsY3uUm8DK4ClbVeDNYOMe
 Wzb51C6nZXo2ToTz0FPxyPCVeJLQ+KCX6AfzCAOGev4QyBkUazuzd/e0SyIQToZ9EzMi
 HEtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=JYWZ+GCkY2AkGjh7uhkMr4psIVWpC2lTVDCLIlZ9QsA=;
 fh=ha7gZRQUTjJjCydyB7G4fefWzlK0XTDr2l+WEWjUYjw=;
 b=b/VlmmSK97+nO/4sy5KJl66z55s8cu2WiMuOFlE/nM0wk/IlpCmiWI2rqu1Xph7KIs
 7zub5pwOP4Jl4OIq2lTYneEnIcwxERIeYb7JVpCJRAtmg8tMcBKU5PYZb17OV/8ggIUU
 NkcLo3VNzLpcoiKNoICDemUkrrDIlMwEk9zCVCLBDgOmjZ3R78A7DVU7yW9nRSGJ6UUf
 Q/asmkl8ydgM2Qe986Hm0fwzHVm0fGd6XAnAPUruH2jatv1Ps1oCn9xXTrCyTEds69jt
 uX2RNWEyXhiKizMIuJcYTiaypgOSPJHnEs7iYOme48VtZ7Tx5bWuD6i/rpcDuhRgp6sM
 OGrQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770668256; x=1771273056; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JYWZ+GCkY2AkGjh7uhkMr4psIVWpC2lTVDCLIlZ9QsA=;
 b=Fnj5TRgKtr5JQ4GqduEJ8Z2Pui6aw+FGvIANaZ883v13FtyzL5xMjd0Y2mGWbydiY6
 GqS09liagHELO+rBedbS8Uf27cjkjznKmJ3+Y8Ap41w84Yd9nyZynVaWEyVsCsleLDHU
 y9tcl/Wv7XtDNL3SQbzm3qIRX1yp3jwuHlV4xuTZJ/SBBB1HRdWpuLVIgHJ1IhrGdVcD
 iwqeUJr69P5ftT8GHmLVPlpOGphHL5WOfASdXkzukOLFppqPI3SlUqK7uzvf9igC8/uC
 jEdOJC8JuW/Jx2yiJ/xWXIQsOC2KXCNPJFQ5lU6JVwSRGyvYzIidHpwgcyAtlsY8l0+/
 CfjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770668256; x=1771273056;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JYWZ+GCkY2AkGjh7uhkMr4psIVWpC2lTVDCLIlZ9QsA=;
 b=gbHeecZTCCRsE79pUdGCnlTb3x9yMC8TIjUE+mIvSop+ZTAhm10Xa/93wiF35Ik55v
 vZalxXwVtcy9ttK2g1dWsLAru9u0biAnQSd9ZtIGK3mcltT3pwKTxwb020pjHkzxjuCc
 Rs0qzD8r+32CwGOeGmM4TUQ7Rzdvw/DVkwYlFH++5G6RWFuusVRSgyR/K/pcOtCuJLcC
 x6emCKxZmGPC93D7vWEKJLN9dqbJgnB20dOkCI1jwX9vG8At4SHuczi80uoBcITyH62D
 lDZxgGUs7pPduvgHeLmce3g9me+fy8pQy+mgJ6BaS01vA6JilgYxLWo63l1EK/kB7Mks
 nC0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0pOiXW08uH+BZzEqb1nw6RkDk8d3asdG2yh4yzxxr/bGfJVRCtJAIuFIj/4AytqhMJ2RPx4qiVd8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwnTmBgmsf+SpJ1sykjnmaiQ2qMfOCb2CI9qU8OkpDhR9BniNVq
 FHR4WNxfXOQeX4UGAXHFIP027PIHLbrJ22YUwi8zitLwo2bN1PNGsRakvGZz7kmpxx86QGBzO5E
 CVL4nPsJImmeuV603jCzn4HxADwJEWR0=
X-Gm-Gg: AZuq6aK9KcAUvYCXudWFPBei24PZumb0Sgd3Ge6y8TlLnYIzG6SK4Jd7I99GrdmVywL
 4Bo2Q6m05SfY+WDZ9M4QcSsBTWPA+mKUSaE55KajhSNu132LVjLskVkEt59Md9xDPxY2lZaHpif
 4uBa7YZKSLeWiSpBFIt5PktEacazRwQmuXEWXv6q6ODeboOs/CYATwHtmY8pp9sd0Zs+PZYmJ7R
 tSR9SsjL4yG/9VbZPp22WPPERljD3mHOtJslHriUY40at1I8d28XRg96fVxq2wBNGt+n+CW7xZ3
 tGa07/8HmxkZe+b5GpriK0gQdQ+k3Y004C6JFiBB6sjNk1Ja4U5ZRUEyRgOfLkluvw==
X-Received: by 2002:a05:6214:405:b0:895:369c:e3e5 with SMTP id
 6a1803df08f44-8953cd956famr185712496d6.64.1770668255902; Mon, 09 Feb 2026
 12:17:35 -0800 (PST)
MIME-Version: 1.0
References: <20260121113646.111561-1-me@linux.beauty>
In-Reply-To: <20260121113646.111561-1-me@linux.beauty>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 10 Feb 2026 06:17:23 +1000
X-Gm-Features: AZwV_Qj7lNdQXzRVBlBw-alzy0MCsWn6R3b3x1wducs68xJdjz6KdM2YooUTLw0
Message-ID: <CAPM=9tz8A7KXdAbXccn_9Qfich3YOXkZJifgUEfa8kMpqq_huQ@mail.gmail.com>
Subject: Re: [PATCH v2] nouveau: pci: quiesce GPU on shutdown
To: Li Chen <me@linux.beauty>
Cc: Dave Airlie <airlied@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:me@linux.beauty,m:airlied@redhat.com,m:lyude@redhat.com,m:dakr@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:simona@ffwll.ch,m:nouveau@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.beauty:email,mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 0454D1145BC
X-Rspamd-Action: no action

On Wed, 21 Jan 2026 at 21:37, Li Chen <me@linux.beauty> wrote:
>
> Kexec reboot does not reset PCI devices.
> Invoking the full DRM/TTM teardown from ->shutdown can trigger WARNs when
> userspace still holds DRM file descriptors.
>
> Quiesce the GPU through the suspend path and then power down the PCI
> function so the next kernel can re-initialize the device from a consistent
> state.
>
I've applied this to drm-misc-next, which means it's targeting 7.1

Dave.
