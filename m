Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6565245AC99
	for <lists+dri-devel@lfdr.de>; Tue, 23 Nov 2021 20:36:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48EB56E0D9;
	Tue, 23 Nov 2021 19:36:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 058906E12C
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 19:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637696160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rZfv1IAB1L4OKPDv7Z7zl3z7pjV3ugHQdTctCyaDB7o=;
 b=QwryxxP27AkmZ0u8hNazhVijs7Y63O7OG8tElYLU8XTZBFYMx5ELvNWL551TsgQWw2kuTP
 ouGUG89dNVp5+6cjOxGACj3JjDODWHkh9fGvWJ1A9XAg6vV3r+TLlO3a1qeMbdNiwhQ1QL
 E756sjRykyPSsCX2vtStEQ7yFNgOcrc=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-435-lTilRh1jNv6Cu3I60KOGUQ-1; Tue, 23 Nov 2021 14:35:58 -0500
X-MC-Unique: lTilRh1jNv6Cu3I60KOGUQ-1
Received: by mail-qv1-f72.google.com with SMTP id
 kk1-20020a056214508100b003a9d1b987caso52725qvb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 11:35:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=rZfv1IAB1L4OKPDv7Z7zl3z7pjV3ugHQdTctCyaDB7o=;
 b=bgayXLVmr1hyTKAB4xoL0G2jL7/VyK23jfSS4ObxYx0u6ILfNrF3kuGLqTPI8YLf+j
 T5H/FrxDuNxEZ6kni2kdpd/ZHPHmWiNd0xvd3xhnNGe/NYNpn56cccMXhYOJrPY4GUzH
 o3y+FP9u1UQy+BJp/PhjUVXKBtwVE015fw12cuyL4P10y+IwQWoQc8nsjVJHrE2calel
 woHTHthV2QRJTy5wpHsdWsiSYEm8tFTTQsvyvqCcO9qWsHYjJ5WBE2bQxYT2LdbAnQs2
 eNQTqTjktoUvYvKapIteJ8qkNZf+tBU0vgpv8fT6Ed2Uvq/ju8eBa6qle0o5bC+LRo+X
 m0pA==
X-Gm-Message-State: AOAM531xrWYE9MklDYtHQ6zbIuv+ofeM3K/6cgc9hAeBEjhAg2Wezql8
 2xnCi0QN4o6ufxTmTrgPeJ/nFdiq44YcBy/SXrImGEwX1Wii7YCm06EkARbwrPaTMef+fuuM2Yy
 b6zcBoVpkj84SgrtM5KOPN8a+WdY7
X-Received: by 2002:a05:622a:13c9:: with SMTP id
 p9mr9530984qtk.47.1637696158311; 
 Tue, 23 Nov 2021 11:35:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwd9aJm8SZb+wfUFsxDgSU42rVqDIpUUlYw//me57YbMeMFl74fEpjtGIzlLmPaOts6c7+/Mg==
X-Received: by 2002:a05:622a:13c9:: with SMTP id
 p9mr9530939qtk.47.1637696158082; 
 Tue, 23 Nov 2021 11:35:58 -0800 (PST)
Received: from [192.168.8.138] (pool-96-230-249-157.bstnma.fios.verizon.net.
 [96.230.249.157])
 by smtp.gmail.com with ESMTPSA id m15sm6726097qkp.76.2021.11.23.11.35.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 11:35:57 -0800 (PST)
Message-ID: <4dd933d333194ff8a676fcafdd5c9ef19f002c92.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau/acr: fix a couple NULL vs IS_ERR() checks
From: Lyude Paul <lyude@redhat.com>
To: Dan Carpenter <dan.carpenter@oracle.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Tue, 23 Nov 2021 14:35:55 -0500
In-Reply-To: <20211118111314.GB1147@kili>
References: <20211118111314.GB1147@kili>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.1 (3.42.1-1.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push this to drm-misc in a bit

On Thu, 2021-11-18 at 14:13 +0300, Dan Carpenter wrote:
> The nvkm_acr_lsfw_add() function never returns NULL.  It returns error
> pointers on error.
> 
> Fixes: 22dcda45a3d1 ("drm/nouveau/acr: implement new subdev to replace
> "secure boot"")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/acr/gm200.c | 6 ++++--
>  drivers/gpu/drm/nouveau/nvkm/subdev/acr/gp102.c | 6 ++++--
>  2 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/gm200.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/gm200.c
> index cdb1ead26d84..82b4c8e1457c 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/gm200.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/gm200.c
> @@ -207,11 +207,13 @@ int
>  gm200_acr_wpr_parse(struct nvkm_acr *acr)
>  {
>         const struct wpr_header *hdr = (void *)acr->wpr_fw->data;
> +       struct nvkm_acr_lsfw *lsfw;
>  
>         while (hdr->falcon_id != WPR_HEADER_V0_FALCON_ID_INVALID) {
>                 wpr_header_dump(&acr->subdev, hdr);
> -               if (!nvkm_acr_lsfw_add(NULL, acr, NULL, (hdr++)->falcon_id))
> -                       return -ENOMEM;
> +               lsfw = nvkm_acr_lsfw_add(NULL, acr, NULL, (hdr++)-
> >falcon_id);
> +               if (IS_ERR(lsfw))
> +                       return PTR_ERR(lsfw);
>         }
>  
>         return 0;
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/gp102.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/gp102.c
> index fb9132a39bb1..fd97a935a380 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/gp102.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/gp102.c
> @@ -161,11 +161,13 @@ int
>  gp102_acr_wpr_parse(struct nvkm_acr *acr)
>  {
>         const struct wpr_header_v1 *hdr = (void *)acr->wpr_fw->data;
> +       struct nvkm_acr_lsfw *lsfw;
>  
>         while (hdr->falcon_id != WPR_HEADER_V1_FALCON_ID_INVALID) {
>                 wpr_header_v1_dump(&acr->subdev, hdr);
> -               if (!nvkm_acr_lsfw_add(NULL, acr, NULL, (hdr++)->falcon_id))
> -                       return -ENOMEM;
> +               lsfw = nvkm_acr_lsfw_add(NULL, acr, NULL, (hdr++)-
> >falcon_id);
> +               if (IS_ERR(lsfw))
> +                       return PTR_ERR(lsfw);
>         }
>  
>         return 0;

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

