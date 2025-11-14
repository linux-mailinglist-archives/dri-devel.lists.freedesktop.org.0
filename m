Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A39C5F81F
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 23:20:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56A3D10EB38;
	Fri, 14 Nov 2025 22:20:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=yahoo.com header.i=@yahoo.com header.b="jVP3BKmH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic316-55.consmr.mail.gq1.yahoo.com
 (sonic316-55.consmr.mail.gq1.yahoo.com [98.137.69.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A18B710EB38
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 22:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1763158836; bh=iaO/GQHIWCg+Hr9D5m3jX5yvTCqb1XRrkZhoE4MkWjo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To;
 b=jVP3BKmH6AKNNviujJYjUa6BaxEx27Aa8103d1WLrWuJnXndv1h15fz4x3arpKWg08tRJ50gTFzX87Z69MLdM/IxmSbkm/SA7AYiGckGQi+/iVZNeC3Uo2cMB3WG3HR1zDMZQtBYneOBuVMvjpYjnvKsi8gnHIEzArc4cIPbiqvK58svpTDiPKlsp/vYl7+LmZerNhPMGVnnvtUMQjFSU5uZPnvI9Jg1dO/lZX2UYjloFJrQEeF0g5xFbvFTqaXNRXj/O1xFBIYfcebtlm/BpqhKByLlCaX5qa572TRQOc5GALw/kbyAVxVyrOgaU9JGC4F2JlAaJQP0c54eR1tGFw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1763158836; bh=UYfJ5m7hJxegx7I/LhUosjc2kUTpr1qL2qZHEvz0WRS=;
 h=X-Sonic-MF:Date:Subject:To:From:From:Subject;
 b=ANFClzBBBE61raeDXdOI/Jrkb7QZ/OJzy0P3CO0zqOKoxY6c0Aaw0s5vyP8YpbEFI+993wdE5jor5DvGZQ8Yza/YFqEowpndF7D8JIbVJx4NrtrLc91+rRf4NSpEra9Ck95abgmyCL9JdPppdJii9V0Plb14dOFHAq+6zAWvDMOXBtVKrX3JnqxadaBgYp5J7bKJ+mYvmgSB8fQAScbuXzEfoHm3D55Bju+Pjrdt83ELDq7PazLabkoWExKQpbu69RfGFuBGYO68JluXe9zlf8E0qk/i+Q0xm1N+rhGKsk0BC4AkUaXB4mwlQC2nKekmWOyvFkjbm8tzIZJScmDjcQ==
X-YMail-OSG: 4FfyHgQVM1l7C.5Szl5k__iV_mDnh830DH56pSboKIDzQwidApP.29oiG.QpVKJ
 FGiKG_upW0I5Zvae4oTmVB.5FbO2TPIPYgBQaLsQU700CAJM9Sb9wi8wo00k3Mlf7ivuHPEuQDel
 Ju54NvoTsUTs602TCvEYPMfSrQaORJBoSIqksDCqewYnc7fdGwUwYuSipzEV.RemIHmFb1uKOk6T
 1zr33gmYXldgnuuEwDS_78WQ1WobtwNCjjplfgrz1YCkgEs7Gf6NDMfwVyGWCznqi0Hb07GoDhYt
 e0QQuzgw.RgpxBDIoKg84DFzYdGB77Ky8P_9e4M.jqJT2qGRNALN6s_X.1VjlVInsT42oZvPmlvQ
 CcvDDrdUl_pq_KDdMUlzBmymYo16aZtWJC_r4ZZNSVkAlKKg9yf4gnKUk90MiSS8eKuXP7k2BW8H
 uNXyAvMZrmkJ2JJyHRswmdMjXnaZ0YaQD1dV7WsU4GxWtkHdmCegkjtABlWAYMmP5pjWVJFCjdDf
 fxuVzXwjhdVvp7dqIKwIjoudFY1lrWs0o17eiWVcEO7r.04uAQNfUzLyY74IH3lyXKpsl.x3FkFt
 ZvLVkKAbOb11tamxPEHlKKM0I6llfMwdO7p_cEYqf8odBmTDLQUHC87xrcWRCH.zZprKMy7O_qBb
 1wYScI6Y2h1FIraoDggxVUTnmxX.wlnQqmb9Nmzi6.K1fBFJ2Kg3_PLxPYDuXEzO7GIcbmTSshPV
 T25o8LyxgIEoQtzGTyiUnowsSitgHhvHMsQjFV3s0WQYO1AGBcxbP0WjIiiRMeqC_.u50Efqjy7U
 3g0LJwOFzc2mW_YG9SZGLwDgPbobRQpO7W.ndvDst2bgGMrTLRaV4Qq2gbOa2JnfgbPARknhwYPh
 Zuv1NNMg4VYy1FpUt69kHZLGWuiogJOifZJATi__SDBpRsRUjbHfDOn.ajk1BC_RhGDRtTDXmIvQ
 cUAYl6F7TgvUrGpaKQBvxKYlVZucWIe.MOvxmbetpZZaJeYC5BnORm1Tz..hnqDuqTZeQKFn5dQV
 r2lNvQwUInmvZSrN1NdbM14JvaR.6_eUztxZ6lndb8_W3PSDGOwcvS9DbA2X1VRJ7w1uJdm8I96J
 2cErCoCfnWQfyacEHvAOsBx5AH6brOg0iFq0WekOmnKKwphbIUVNK5.oFPZn52YD_1.Bassq8RSu
 8RsDTuKWcCDDzhzd.oLZD70dCQUD0jUrnXRR0P4vRIXqIVGPT_qNIYy97SmOnHc1_V5xb1LYEwos
 I2T.2mJqktwWjmPXsTcYIvuaB5N59.bG_VpYwwWtwPXlKb1WE3jEhK8zP49UHozHFN5KNJGGZfE_
 QTqSYTVwtFutNTqTlKh6F3g8WjGQKsEKv_kEm5YV6ZKtnIfux31BlbMD_co3SWUphVNpiYHzSNzQ
 X6pFJixd._POctZA4IMM5edEQePcmeF7aBkznOQYezb7vgNO06VnXkgylpZyN0wTKgo4MS.IWV9o
 Eri89iXSKFmcWYqj.RWpJPNIdVCm0vM9OzwyeO6W6b0xxPMTlOw7t.sVD3ppXDFWNQlEPoJawulF
 BpPDNAwrHM4ph091j7fKnVE1OR.jJCda0Sesf4QlYVPHplT1ZYKqECs5AbAsTOaxEI_b662GR8fK
 Ke4iZyZ5EmN3lRDyIXQfIrKD8.yR2nqN4cezVrW9QWQt9B0kGqIJsQnCZJICu4A2YplpPGpXbADS
 BuZH6QKvJhnFXQhxdpG378GrIxcH5km0PcSRwcNzqYQFxLLkTS6aC_vM4HGTAI0c6Yz_tJtzdfcw
 hbB5ZPvyY13NzOYb6EhFseyXUaCnDV9HXpSyvDNChmI663XdqKktY7rGZhLDbq7aZ8ytRijP.YDw
 3dW8wMHXRBEQltVkiNBI2eaM.p5B_KZCov3_pmaPuUNla.UWQun3xP4V12BySmCDkemR6CqwFjzi
 uHRyuvy9Yaiw0htvkRvCQ48IZ9EBeyPZ9ecIM.VFmWvZZt304uix8EL74fPeCYricKQ0NTLl45XM
 Xm1UI0F3PQcfadrqe_jwsEdeZDMgkGEOKq3q7CAcOwg9wcKvyjdngkh2sprJOuVIgHGnoWcLJ9kt
 tW2czl2kzCuytc0fDLo58NSA1_5IrwkLIY_KNhhe8ChBr7VZycu1CjMhsJkwDfYQ.SsVcOgeFSTp
 dAqgKON2YWDXei7VCYfZluBGfLrF7H8Y.5qENVU1cVhxVrdtyl4my3LlgS8WtIvmTZeMaVl4o57n
 dS8F4pe01mu2t4mM2tM0YKidRZ45l2lXcW.aN9X6rguVDO4SXgxDxmGq27qqVAvTG64ZBJnkmPVg
 VTS82yKgF.WaIKfCKR0knYfA-
X-Sonic-MF: <adelodunolaoluwa@yahoo.com>
X-Sonic-ID: 33d2b546-738f-416b-973d-321f9834d415
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic316.consmr.mail.gq1.yahoo.com with HTTP; Fri, 14 Nov 2025 22:20:36 +0000
Received: by hermes--production-bf1-58477f5468-vjcpj (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID fdd2b53d4999915145ebe89b3164e7d5; 
 Fri, 14 Nov 2025 22:20:34 +0000 (UTC)
Message-ID: <dc441690-914a-487e-9867-c2012f74f498@yahoo.com>
Date: Fri, 14 Nov 2025 23:20:26 +0100
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

I hope this meets you well.

I wanted to check if there's any update or if any further changes are 
needed from my side

regarding this patch.

Thank you for your time.

Best regards,
Sunday Adelodun

