Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31879BF92AA
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 01:00:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F34D610E655;
	Tue, 21 Oct 2025 23:00:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=yahoo.com header.i=@yahoo.com header.b="uVPzpxeD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic313-9.consmr.mail.ne1.yahoo.com
 (sonic313-9.consmr.mail.ne1.yahoo.com [66.163.185.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E52310E0FB
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 20:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1761078163; bh=+qU2vcN541UGYB33IHwPZz2xTN7BvKjf4TwHbds2f04=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To;
 b=uVPzpxeDEH2Z7QqTdc1Xa15A2HlJy6pDdC+konv4USzCaGh0rdMiZbto0yi6wulI4Q9iJeswUmfOAWAokQhOS+BBRzm/xjiHWouqqEg6TehMl27lU29bt5xMGTfg1betbzHuyieR6BOabS5nY8NuyJjUumiatBH3AKJ/G1q2k0B08VY8Fp8EVl8oRrBROncINNP3yOj/q0P4aN/q5E6G91G5eIuRaBdPfHINfODn4+COAu+DOgw+rnd5KCLkoEzVt/koKSZ5OpKq0PH6J3Hmzz/2Ho5C8XYJKGpdXoQv/adirXS02A1FktFb/nWY2X/KGzVgbomjsc/RS6DOAmX7Vw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1761078163; bh=8FjtTI8i+dNCwuFPh2T4ncETxOq/f3sYD2xaRll05Ep=;
 h=X-Sonic-MF:Date:Subject:To:From:From:Subject;
 b=CYG7dQN1XvSXIpMkftxMIZJyXnBwjqjSfO00qsWO2xDb78cMhcpQvhY30P/oqk+vvXAiHXwaTvoBjBnhTmsVqS38VFYUpYKg8LRxIIghUd361+7YZAsKXsuw+0nPPRuUWq6Xro4u4wot/JWWN6IBdh+FPhxWclyzgZbDQ3Qrw4wHCj+viLZsy8jsT+ecaMumdUaQqf/u598N/XxKrcy5hmVStWRggpf2TlLLFavEpWLSLnMZJSsoTX7nEfx+1PiZXZ+FT9xlYdSHNnApj9j4e2UYBOlj4aC9ItqvyXCV9NSBa7mmPx+1TJIYyY/njVfFElbN4h9iFBG9x//8Uxn98A==
X-YMail-OSG: 4xvKBJMVM1kehxOE8bOYQU15B.LpwrJNx.kBwYcopwuPmyUgUIV86fLx53VYQGr
 5RxWOf95G5VqewfQmNu5lUu.ipsxHP7og8xLnwuwlvU5t42b09cGctI1h5EzDo7X89x8JFJPPc84
 rTd22QuYAjGlN5TnQqe08WJhksMFF5olIljVYhX8sdqIDKlv34qtWxGtFKOO9iuNVQTVZL39o4Zx
 RBJPTEq7UJAjmaAkvQuyIM9g_GECnudTPVACq5boyytdjzUfNnviSV2lR9GFVPlIPqZaB1QP26Y3
 9aKtcWEsGh_qIZfgaGWXXTLds9EKvcWjmpHcmd8bLTLFTvyBX57x_jTebfzopMTbKT3c8wKxIWcG
 ciFwpQOwuvmYnQZWDJiKUsL1IOSalrCiM8SswSlbUZNO7hVJEqMsgpfzE7WpIX2HGai0DQoptEo9
 7DYt74TIbeJo8UyRXEIYc.7mOOa3ZKA_OER6h2ZCbQk5Z_p8d03RuB_xXfJdWOQ_AnCNk_MLquf.
 pVzBp12xrm9Bk55YCJoY6BaYOVWLRzZAITN1efdgHl9jd4PvaIrgjsSdIPB6_mvtab7LCF.WGLW7
 LmNb.L687BaGjw6TlhZhC7I5U6SVTHwFKow8gBaQCeClqG7R81Dn6.z8j9erIrfEI_yJnQITM0eM
 ddXMmKrc9hx5PsQ1tYUSvrevkKMJaiEepglu2blseU.UBTBU0O1pzlgLCyZ8Lk2Q.IMTSx_uUSIr
 DeGJTGfKwhmBT9E17pPZB50L35J5t6ZBFTTPdjHYZui3Xg_cAZITHXnoC7YgSOzlYOxp71csKjj6
 QiL.9cqCWuuErOL20VAuakyohs9fBvwq3kOWXMK2iFXUONvukFZsXp6Sh0GKkpBzNA_UlvyVlQvb
 o931TKmI7VMKi7fajgZjY8FmPNvq.ZTNduiMIU_Qa65oAecTUg5HmLfFpm4P3yzhPJIwwkn1_zw9
 hnQNKwOrvReimCZKqM75atDYJLNJASIKaZp90G8ahu7bUcDKb2Meah048b67t5YB1x1SYfHEOIdb
 80xRFAnpfTWq2V27hzwp.4QNjp27KGGY579NJKKbBVopGMjJm3R1s0sD2NOgaKJmFrDxA7pVmRCW
 Hmb7yFflJtm7dtPFoyaQY5HGuLzFCbDpyQj7xuI24cI2hVd8bEn_ASuJYgRSOGOp4E6zIKFPEJ2.
 mZlRURUvcesV4ligy9q5V92AJSm5SkwV3T3rwwiYvXt4RVcOEBiGwRFgnMg3NRk6XVgkObXGcBgw
 x1eBEEDqaVkbvfPFgHrV92HRO5JZWy4wJgcE2s0rhGg_yhrmHPpLpnqxu8tSrkh0SPTgS17NQ8pp
 DamNQCONkWbjISGzpvbVN4jgeFUWQMXVFDrONeAZlof6hWCqLHWiOxA_rP07rjPe8R.1koGoA94W
 zerFZI.tCttnGznA4M0gTPhhVTc76Bqg5p5jvY6lX1G65yjZxcx4uUaQ0WQ1sTd71eeKCYZcA7SN
 I_Xr3.ZreCHRbhOsLpQ0P_dEBTxJelOSSVBjklCaGa049dKdA0o2Ir31vWxN0e_vraLUsD0_SOlX
 .IwZqypZZZJ7UlZ3XZE9C_atW6dKsSKWl.ye3WjhtL.nCx8vfRpRGTsME8T4NtuF49JGC.uqooPa
 doDhq.EMv6VnjHY8fCq_2WdRNYEu6LK1IKE5xoe16rUORkOwVi_f9jJFNXFzZ2j58Sgl0.Y7p6pk
 p31NbtG873dCMsDFW3qdYOhMJw2mviMMa6ZSXXMypphJbVqAB4JhgshYBOXAB1ENc9EYI3eQiaz.
 Vepl5z7FEXUuwE7NrD5MUYiCXvG1i3qKup5QahRlZyem_vF_KI.fh5Vi7mRbE.JU7hX5z83thwAj
 Gl6KgCU6OlVL.eqsqZYv1GEvW3nywc9ZLmXh06PopwBZHCEximekXhpSbVxK0LCl7Yml.nNdUp0u
 yedjo7k7lsEGzQhOKQD_VM5u0KKUxXB_Hve6Mr_HW1EjwKolOmp.izvNkdG4V33PIQsPL8fjpJBd
 5pAeZb.wsp7GKDvo_46VC7ilCVDP98D4Vztt9i7Jz_6aBQDUGcVsFD.KGukUDJR4vOFcMcwvqrtR
 cqPhq_W5TIx_W.OOf_tiBzi2O.k_DHBSaqPZ8Nbbcz4eERi7An7B83Dey.4XxCx07afZ5FYuh4AX
 SOkwcI5Uk.U7MTHdr8MhwpAESH0D5tQH.PJsBIOXM6j7XXjQjeJf_BgOv01qCzhOlVVzkKEjQPUh
 woB3kAEMKl5.P8iNS8HeTYKsWAgvDPzMH4iTlZbbsXrsY8ilQ6DJnijBxagi6kGKIIFvZ_C10j5C
 i2vj0L3E7QYlxWYVEVVgT9kQ6wuYr7rkN2ORkfG9g
X-Sonic-MF: <adelodunolaoluwa@yahoo.com>
X-Sonic-ID: f67d61b1-ada2-42a2-8af5-224d50fac4d8
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic313.consmr.mail.ne1.yahoo.com with HTTP; Tue, 21 Oct 2025 20:22:43 +0000
Received: by hermes--production-bf1-554b85575-dfm4w (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 5ac397cd68ad3abcccfcc5e9735fbabb; 
 Tue, 21 Oct 2025 20:22:41 +0000 (UTC)
Message-ID: <0e93a7f9-ae77-471a-b14d-2626cca0fb0e@yahoo.com>
Date: Tue, 21 Oct 2025 21:22:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: rename drm_ioctl_flags() to drm_ioctl_get_flags() to
 fix kernel-doc name conflict
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 zack.rusin@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, david.hunter.linux@gmail.com,
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org
References: <20251010002520.359824-1-adelodunolaoluwa.ref@yahoo.com>
 <20251010002520.359824-1-adelodunolaoluwa@yahoo.com>
Content-Language: en-US
From: Sunday Adelodun <adelodunolaoluwa@yahoo.com>
In-Reply-To: <20251010002520.359824-1-adelodunolaoluwa@yahoo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.24652
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
X-Mailman-Approved-At: Tue, 21 Oct 2025 23:00:18 +0000
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

On 10/10/25 01:25, Sunday Adelodun wrote:
> The function `drm_ioctl_flags()` defined in `drm_ioctl.c` shares the same
> identifier name as the `enum drm_ioctl_flags` defined in
> `drm_ioctl.h`. Although this naming overlap is perfectly valid in C —
> since functions and enumerations exist in separate namespaces and do
> not affect compilation or linkage — it causes a symbol collision in the
> kernel-doc build system.
>
> During `make htmldocs`, Sphinx reports the following warning:
>    ./Documentation/gpu/drm-uapi:574: ./drivers/gpu/drm/drm_ioctl.c:915:
>    WARNING: Duplicate C declaration, also defined at gpu/drm-uapi:69.
>    Declaration is '.. c:function::
>    bool drm_ioctl_flags (unsigned int nr, unsigned int *flags)'.
>
> This happens because kernel-doc processes both identifiers (the enum and
> the function) under the same name, leading to a duplicate symbol entry
> in the generated documentation index. The build system therefore treats
> them as conflicting declarations, even though they represent different
> entities in code.
>
> To resolve this, the function has been renamed to
> `drm_ioctl_get_flags()`, which both removes the naming collision and
> better describes the function’s purpose—retrieving ioctl permission
> flags associated with a given command number.
>
> All affected references have been updated accordingly in:
>    - `drivers/gpu/drm/drm_ioctl.c`
>    - `drivers/gpu/drm/vmwgfx/vmwgfx_drv.c`
>    - `include/drm/drm_ioctl.h`
>
> No other symbols or behavior are modified.
>
> Signed-off-by: Sunday Adelodun <adelodunolaoluwa@yahoo.com>
> ---
>   drivers/gpu/drm/drm_ioctl.c         | 6 +++---
>   drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 2 +-
>   include/drm/drm_ioctl.h             | 2 +-
>   3 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index f593dc569d31..313e8bb7986a 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -912,7 +912,7 @@ long drm_ioctl(struct file *filp,
>   EXPORT_SYMBOL(drm_ioctl);
>   
>   /**
> - * drm_ioctl_flags - Check for core ioctl and return ioctl permission flags
> + * drm_ioctl_get_flags - Check for core ioctl and return ioctl permission flags
>    * @nr: ioctl number
>    * @flags: where to return the ioctl permission flags
>    *
> @@ -923,7 +923,7 @@ EXPORT_SYMBOL(drm_ioctl);
>    * Returns:
>    * True if the @nr corresponds to a DRM core ioctl number, false otherwise.
>    */
> -bool drm_ioctl_flags(unsigned int nr, unsigned int *flags)
> +bool drm_ioctl_get_flags(unsigned int nr, unsigned int *flags)
>   {
>   	if (nr >= DRM_COMMAND_BASE && nr < DRM_COMMAND_END)
>   		return false;
> @@ -935,4 +935,4 @@ bool drm_ioctl_flags(unsigned int nr, unsigned int *flags)
>   	*flags = drm_ioctls[nr].flags;
>   	return true;
>   }
> -EXPORT_SYMBOL(drm_ioctl_flags);
> +EXPORT_SYMBOL(drm_ioctl_get_flags);
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> index 8ff958d119be..fa4644067d46 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> @@ -1257,7 +1257,7 @@ static long vmw_generic_ioctl(struct file *filp, unsigned int cmd,
>   			goto out_io_encoding;
>   
>   		flags = ioctl->flags;
> -	} else if (!drm_ioctl_flags(nr, &flags))
> +	} else if (!drm_ioctl_get_flags(nr, &flags))
>   		return -EINVAL;
>   
>   	return ioctl_func(filp, cmd, arg);
> diff --git a/include/drm/drm_ioctl.h b/include/drm/drm_ioctl.h
> index 171760b6c4a1..585dda7550b0 100644
> --- a/include/drm/drm_ioctl.h
> +++ b/include/drm/drm_ioctl.h
> @@ -164,7 +164,7 @@ long drm_compat_ioctl(struct file *filp, unsigned int cmd, unsigned long arg);
>   /* Let drm_compat_ioctl be assigned to .compat_ioctl unconditionally */
>   #define drm_compat_ioctl NULL
>   #endif
> -bool drm_ioctl_flags(unsigned int nr, unsigned int *flags);
> +bool drm_ioctl_get_flags(unsigned int nr, unsigned int *flags);
>   
>   int drm_noop(struct drm_device *dev, void *data,
>   	     struct drm_file *file_priv);

Hi all,

Just a gentle ping on this patch,
please let me know if there’s any feedback or further changes needed.

Thanks,
Sunday

