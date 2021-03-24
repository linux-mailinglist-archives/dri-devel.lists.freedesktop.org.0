Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5972E348546
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 00:29:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4872C6EAC5;
	Wed, 24 Mar 2021 23:29:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 669D16EAC1;
 Wed, 24 Mar 2021 23:29:04 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id x189so373068ybg.5;
 Wed, 24 Mar 2021 16:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=szMyrlVIzLgkuWOdfnjXqAD83OmSXPmtaUZglnnq0Iw=;
 b=U1Wb1zOKrEBdqaW8up8hYUOKhLJOii3QLZEBREfU6wiLpwHRSg721PdIN2QEmhKpSu
 Q4iZAyLmtlSjLIXvfyGhaN9kwjgF7OdcrWkv8CRNB26WCWcFbvU9eheYY783bUNX8MWj
 cnkO8eJmaR5S1ETumlGVDkbnZSuclmpqcjaESJxyDeMQYsFwunkoUXYKjEw2Yduqrnyx
 l/k6UCfTC2gpx5oEtC8B17v2DjYSzIWDokLeVqgoCo+DhYDvJQsGeMvysMKu8Fhf7IRB
 5DwfdlWd8Qav2VZafgi9CtexdsYullmmY0XNi2Ng6W5o35dW++W8lJrDlOB9Sm3TfNAw
 +z/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=szMyrlVIzLgkuWOdfnjXqAD83OmSXPmtaUZglnnq0Iw=;
 b=uSrfup/axQHmFkEv5IMTb/A8fa+YluxFHCbjTZRr/5hC06fhy95TXiXvmwnWk3aCxP
 AVWNROhxlDUNouq8hobeqVmbMyCNmN7Flo2GZ5I2/vYVXO19RrKFYLOG6Vw9I+Swl2R4
 S0k0tIg2Mj7JXJRLg9K0tYli1DcVdyv487751ZjMpF5+1lSqjYv06LEL0Mkziwf9Q19b
 jRUhJrxL9ciVQcm24u2GxvS8d7crjJWeVMa+lR5h2aAXZZl4coHX6ZMQu5PBaeGq46dH
 94UoQANgWJRIeXYJG59zJoGYEekcds1XrWY/OqJhDUwkoWmSDpDMbu0dXTv3oyLWuNq0
 fFtw==
X-Gm-Message-State: AOAM530y6YLW5GdusPTHmGf4F9rQunoaXC59zDeasKwO1C+oCdRXY014
 z+j+kD195nDCkvh68pPVtbb8cylscuazzxov3eg=
X-Google-Smtp-Source: ABdhPJyOs9xaGa+QOKUSOuI31tkhHjwgr5dxjeryBWUSHHVi7wTeTF4Stk2Ysp67G6woc0dQ0qgfpRTJ0VGQLHnGRPA=
X-Received: by 2002:a5b:591:: with SMTP id l17mr8407393ybp.60.1616628543635;
 Wed, 24 Mar 2021 16:29:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210317093545.354-1-tangchunyou@163.com>
In-Reply-To: <20210317093545.354-1-tangchunyou@163.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Thu, 25 Mar 2021 09:28:52 +1000
Message-ID: <CACAvsv6ixo422jtf+KRQj9P1bs3LCqMB3JhSnVhQ0wyQrUa84g@mail.gmail.com>
Subject: Re: [PATCH] nouveau/nvkm/subdev/devinit/mcp89.c:Unneeded variable
To: ChunyouTang <tangchunyou@163.com>
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
Cc: Dave Airlie <airlied@linux.ie>, ML nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>, tangchunyou@yulong.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 17 Mar 2021 at 19:51, ChunyouTang <tangchunyou@163.com> wrote:
>
> From: tangchunyou <tangchunyou@yulong.com>
>
> disable,delete disable and return 0
>
> Signed-off-by: tangchunyou <tangchunyou@yulong.com>
Thanks!

> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/mcp89.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/mcp89.c b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/mcp89.c
> index fb90d47..a9cdf24 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/mcp89.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/mcp89.c
> @@ -32,7 +32,6 @@
>         struct nvkm_device *device = init->subdev.device;
>         u32 r001540 = nvkm_rd32(device, 0x001540);
>         u32 r00154c = nvkm_rd32(device, 0x00154c);
> -       u64 disable = 0;
>
>         if (!(r001540 & 0x40000000)) {
>                 nvkm_subdev_disable(device, NVKM_ENGINE_MSPDEC, 0);
> @@ -48,7 +47,7 @@
>         if (!(r00154c & 0x00000200))
>                 nvkm_subdev_disable(device, NVKM_ENGINE_CE, 0);
>
> -       return disable;
> +       return 0;
>  }
>
>  static const struct nvkm_devinit_func
> --
> 1.9.1
>
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
