Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 107DC342F24
	for <lists+dri-devel@lfdr.de>; Sat, 20 Mar 2021 20:10:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 755366E096;
	Sat, 20 Mar 2021 19:10:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEA206E096
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Mar 2021 19:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:Content-Type:MIME-Version:
 References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=WVbziHs+8RJjPkXPEqnAbYqzwG8L6icYzQ9QJIEx+Ik=; b=Y7kO3A/x6+co6U9X2TY/Yu32rZ
 BU2r9E/eHjzuWtsFYz4FASj558I8rn0zTyAMkBRw4z05EAsuChJ01OpIqf22c+IJKyAaFP9kTLqxd
 AYZB9MO0Hwdm1NhdSfBc1kxSaPoFEQ0D35uasyTSlzYCwbwd/XMGUT9FdIycxmnR7tIFdGo9fYxY0
 1wf+hjC8RPf+zt6OjKHeKam3n6hComiBiRjzMBEi8heyUtpr+j5WIQShjFCcunL15LR2pGlpHAStG
 1vNl9TnZTlzRwu56Txnf7bPdTorMv6+VfdF2rennaY2WX8x8AhYjVvqko8p/rleG/a670nUOmWbue
 SE8SZBow==;
Received: from rdunlap (helo=localhost)
 by bombadil.infradead.org with local-esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lNgzX-001zoH-NJ; Sat, 20 Mar 2021 19:10:32 +0000
Date: Sat, 20 Mar 2021 12:10:31 -0700 (PDT)
From: Randy Dunlap <rdunlap@bombadil.infradead.org>
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: Re: [PATCH] drm/atomic: Couple of typo fixes
In-Reply-To: <20210320183642.10886-1-unixbhaskar@gmail.com>
Message-ID: <5cb1810-152-7ec3-ffd2-4a6fd1d6c01c@bombadil.infradead.org>
References: <20210320183642.10886-1-unixbhaskar@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210320_121031_783414_18C09EB7 
X-CRM114-Status: GOOD (  15.09  )
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "bombadil.infradead.org", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sun, 21 Mar 2021,
 Bhaskar Chowdhury wrote: > > s/seralization/serialization/
 > s/parallism/parallelism/ > > Signed-off-by: Bhaskar Chowdhury
 <unixbhaskar@gmail.com>
 Acked-by: Randy Dunlap <rdunlap@infradead.org> 
 Content analysis details:   (-0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 NO_RELAYS              Informational: message was not relayed via SMTP
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
Cc: tzimmermann@suse.de, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On Sun, 21 Mar 2021, Bhaskar Chowdhury wrote:

>
> s/seralization/serialization/
> s/parallism/parallelism/
>
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>


> ---
> drivers/gpu/drm/drm_atomic.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index dda60051854b..e1e4500aaca4 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -1148,7 +1148,7 @@ EXPORT_SYMBOL(drm_atomic_add_encoder_bridges);
>  * This function walks the current configuration and adds all connectors
>  * currently using @crtc to the atomic configuration @state. Note that this
>  * function must acquire the connection mutex. This can potentially cause
> - * unneeded seralization if the update is just for the planes on one CRTC. Hence
> + * unneeded serialization if the update is just for the planes on one CRTC. Hence
>  * drivers and helpers should only call this when really needed (e.g. when a
>  * full modeset needs to happen due to some change).
>  *
> @@ -1213,7 +1213,7 @@ EXPORT_SYMBOL(drm_atomic_add_affected_connectors);
>  *
>  * Since acquiring a plane state will always also acquire the w/w mutex of the
>  * current CRTC for that plane (if there is any) adding all the plane states for
> - * a CRTC will not reduce parallism of atomic updates.
> + * a CRTC will not reduce parallelism of atomic updates.
>  *
>  * Returns:
>  * 0 on success or can fail with -EDEADLK or -ENOMEM. When the error is EDEADLK
> --
> 2.26.2
>
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
