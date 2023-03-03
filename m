Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E526A9970
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 15:32:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 700C010E609;
	Fri,  3 Mar 2023 14:32:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6A4B10E609
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Mar 2023 14:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677853964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5nYf8A+BlasX0vgFSOQ1j0UiJy81PWvKt/xuNhftYo8=;
 b=UP2xc9OCTZF6YBTqwOZSyVmimkK5/75G/s2xVKkblx/wW8rfS+dXtby5qKNfwv183LP2qm
 ji73x2yFyVdSurwdg9zwPsUvzdeWRkKRxgu2iOkjiH4uunKTbYKST6Wq4Ml9NIDukKZMV3
 419HI6yqBggniAfJmR7JdA2mJ89f4ig=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-80-kl0SUDGIO9uOTkMadCufcg-1; Fri, 03 Mar 2023 09:32:43 -0500
X-MC-Unique: kl0SUDGIO9uOTkMadCufcg-1
Received: by mail-lj1-f199.google.com with SMTP id
 a9-20020a05651c210900b0028b97d2c493so672106ljq.2
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Mar 2023 06:32:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677853962;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5nYf8A+BlasX0vgFSOQ1j0UiJy81PWvKt/xuNhftYo8=;
 b=yw2WUSCRuqOw1pWDLCo6ayrhUlINYO6P6wW5x8yKx00ozlK6cdwzIvbiLloYMXSC5f
 bD5fGJbDtRsxqGgjgglFfHv+ZV6F84Uoak8XPD9VZQuXK5x7WQ3HyZyKgThj9wZ+j5F6
 nOx9sKBq9FSps8U92X3DY613S2y30p/fPldlk7H2DJYQFN/a2lbAUI1l73xrMj1x74sc
 rARRADizfE9+8lXuZrb3tb72csMd4kBMcRgNhOop8Ywlmv6CbcQLOFhIluSoZHXsDdrw
 2wB61eQybAxJz8k7tP+N8GAwKvcpDs4YcBQKo8mEc7zLp8EWbUusgguSrpsqxmRKoJPT
 Es6A==
X-Gm-Message-State: AO0yUKW8A+NqZskXupspZmx4qKboe8DhPMjTHbIo/+UAbZ7m7tP8J1ia
 9B7IbI2joE7PgzzeadAnoE3m7lP55pf6rD+RuO0ZKLwc/h/p1nXlsjpbR21b9ugSVzJaCAzGI5g
 JJMJWMSpgwYOd8KHf5hfdI0CUzgr8mztVFVFhTE/0MKhL
X-Received: by 2002:a2e:a269:0:b0:295:ab47:119b with SMTP id
 k9-20020a2ea269000000b00295ab47119bmr615925ljm.8.1677853962141; 
 Fri, 03 Mar 2023 06:32:42 -0800 (PST)
X-Google-Smtp-Source: AK7set+DWS1/VMrWujeY8/SZOejIjQIqPNDKSiIgeHe0gYYaAUjs2lN9GALNmJeAifGyEzRnf0RmfAQRi/xYJQ2egSY=
X-Received: by 2002:a2e:a269:0:b0:295:ab47:119b with SMTP id
 k9-20020a2ea269000000b00295ab47119bmr615911ljm.8.1677853961896; Fri, 03 Mar
 2023 06:32:41 -0800 (PST)
MIME-Version: 1.0
References: <20230302124819.686469-1-trix@redhat.com>
In-Reply-To: <20230302124819.686469-1-trix@redhat.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 3 Mar 2023 15:32:29 +0100
Message-ID: <CACO55tuUzrxMio5ANBr46N+x4_=KqyC6Smt4hA=30xSZ-gqNRw@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/nvfw/acr: set wpr_generic_header_dump
 storage-class-specifier to static
To: Tom Rix <trix@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bskeggs@redhat.com, gsamaiya@nvidia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

will push in a moment

On Thu, Mar 2, 2023 at 1:48 PM Tom Rix <trix@redhat.com> wrote:
>
> gcc with W=3D1 reports
> drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c:49:1: error: no previous
>   prototype for =E2=80=98wpr_generic_header_dump=E2=80=99 [-Werror=3Dmiss=
ing-prototypes]
>    49 | wpr_generic_header_dump(struct nvkm_subdev *subdev,
>       | ^~~~~~~~~~~~~~~~~~~~~~~
>
> wpr_generic_header_dump is only used in acr.c, so it should be static
>
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c b/drivers/gpu/drm/no=
uveau/nvkm/nvfw/acr.c
> index 83a9c48bc58c..7ac90c495737 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c
> @@ -45,7 +45,7 @@ wpr_header_v1_dump(struct nvkm_subdev *subdev, const st=
ruct wpr_header_v1 *hdr)
>         nvkm_debug(subdev, "\tstatus        : %d\n", hdr->status);
>  }
>
> -void
> +static void
>  wpr_generic_header_dump(struct nvkm_subdev *subdev, const struct wpr_gen=
eric_header *hdr)
>  {
>         nvkm_debug(subdev, "wprGenericHeader\n");
> --
> 2.27.0
>

