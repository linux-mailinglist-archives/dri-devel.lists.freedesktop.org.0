Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E38F812D4A
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 11:47:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07FC710E18D;
	Thu, 14 Dec 2023 10:47:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D80510E05D;
 Thu, 14 Dec 2023 10:46:56 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 7ED1740E00CB; 
 Thu, 14 Dec 2023 10:46:53 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
 header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id eG3kVSdlahUh; Thu, 14 Dec 2023 10:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1702550810; bh=L2vMmAOGeK4XXf4uIdKf7i7xOS6WQMJFH45XLJ5dnps=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aaFLt/qv2lW9e8lrMgtv8LMguSrVYp/ipVA/Ma61sjzoSv/AvPn9BrJeEC4eakuhi
 hw6g70+vMxzae3hOpFkjLomFGCtVj0VjVz4m6B9fcAq7+TjMu7TYl8xWiWNeizNct0
 Oqxmx/6WjydPFac+lzLm0eD9RRdSoFgCbzsvM688lcfDMIu6H0poj6csYQqi5BZdHX
 ysEIc0tqr0MmoMVPeebm7biPTNw0t8ft3sr05CzkPIP+BNTLiTuoCqS5A20rucnRf8
 7atj64M0+ln7apcJ/r0PBTt48nrJb9HHMm8RkYmkcMldotgp+tdf/MCm3Ev9F0kBG5
 adqhTV/PMJnvjBBOvXQPbCO7fP5qQWt2chkX19lLhyWSZcIcbUxTGhUVIL+r6Pde4z
 RJ9Gu7p51J/3f/9QZCc7RLMxYMU2XkzVF4jZlmxnR/aNk5kLzQpqwruoZbbHFb2ADf
 soD33oBbpzzP6hg8zxJOoIDRYY7BiY39eZN0EJidksXjkHdMf22Os4DwbbaOSZTUyv
 dJpsphaB+wJn8RyKYsSOk8t8aEJKvCWflKLHeQhZtCkgoqzOTr+T122uoa5E7WRYFx
 eCQXarGUg/hOLal0/rJQeGZThi0kp94MEVGye6R6SWrV3aCtrhAY23r9on2HzoKmbX
 c9eKx1rjeqpwjxmMr7IrF1w8=
Received: from zn.tnic (pd95304da.dip0.t-ipconnect.de [217.83.4.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 760C340E00A9;
 Thu, 14 Dec 2023 10:46:41 +0000 (UTC)
Date: Thu, 14 Dec 2023 11:46:35 +0100
From: Borislav Petkov <bp@alien8.de>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH] drm/nouveau/kms/nv50-: Don't allow inheritance of
 headless iors
Message-ID: <20231214104635.GAZXrdC7G6RMlIjxE/@fat_crate.local>
References: <20231214004359.1028109-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231214004359.1028109-1-lyude@redhat.com>
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
Cc: Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Danilo Krummrich <dakr@redhat.com>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 13, 2023 at 07:43:57PM -0500, Lyude Paul wrote:
> Turns out we made a silly mistake when coming up with OR inheritance on
> nouveau. On pre-DCB 4.1, iors are statically routed to output paths via the
> DCB. On later generations iors are only routed to an output path if they're
> actually being used. Unfortunately, it appears with NVIF_OUTP_INHERIT_V0 we
> make the mistake of assuming the later is true on all generations, which is
> currently leading us to return bogus ior -> head assignments through nvif,
> which causes WARN_ON().
> 
> So - fix this by verifying that we actually know that there's a head
> assigned to an ior before allowing it to be inherited through nvif. This
> -should- hopefully fix the WARN_ON on GT218 reported by Borislav.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> ---
>  drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
> index e4279f1772a1b..377d0e0cef848 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
> @@ -385,7 +385,7 @@ nvkm_uoutp_mthd_inherit(struct nvkm_outp *outp, void *argv, u32 argc)
>  
>  	/* Ensure an ior is hooked up to this outp already */
>  	ior = outp->func->inherit(outp);
> -	if (!ior)
> +	if (!ior || !ior->arm.head)
>  		return -ENODEV;
>  
>  	/* With iors, there will be a separate output path for each type of connector - and all of
> -- 

Thanks, that fixes it!

Reported-by: Borislav Petkov (AMD) <bp@alien8.de>
Tested-by: Borislav Petkov (AMD) <bp@alien8.de>

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
