Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7902D6BEACA
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 15:13:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B45DF10E3C7;
	Fri, 17 Mar 2023 14:13:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98DAF10E3AA
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 14:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679062427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c3t3amNCtDqC/lfWvkx2OeWsv1F0lpA23KA/QFJT56c=;
 b=hSApxDA3UP5R0j1fjSr7bLYGMPlPMZuBmfI0wqfe7BNQSdICB2r5Ov0qlNO1X4St7/tmu3
 d6uYTvvlZbqK/Yz10DYC0ZhrJFecjr80IjiJ9a0TGlwSN/UhLswCmKrFzMpRkgYhi0ESkT
 SYrLpRKHreWqwqXaBsdVRBlQ0Bnhkgs=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-179-nZE1UjMjOleCmgFfe7k9Kw-1; Fri, 17 Mar 2023 10:13:46 -0400
X-MC-Unique: nZE1UjMjOleCmgFfe7k9Kw-1
Received: by mail-lf1-f69.google.com with SMTP id
 k7-20020ac257c7000000b004db20d1cf7fso2071933lfo.18
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 07:13:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679062425;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c3t3amNCtDqC/lfWvkx2OeWsv1F0lpA23KA/QFJT56c=;
 b=CEIYcwLT8MGle9hAng4akJg29bvs02uE7Iw0CreXCv94pfvC217PMawCCMf90w1wnf
 FVJ/w6jSQqSgSAUEdvxAActngRsE5knrcV8Q5wjcza7AEDCVepJP4PKnWWWoQDbKtAsD
 pmpTfE2b/Liq4zJTxANxJ0Y6FZzpch2Zz0Oyo6HUfYU7Rn5XNAq3kA/c59OQ78lWy3P4
 Y06tAzV+gGNI4NmsODHArQP3pPopupSF1nXCrQyemMEhBSk7CLcfnJNGsBQQ7feQ47FT
 7r2eIbyb3FBDYGNNBnhsspkeRzui4Jtnb6jsf40USlyteGE4Tid0CvcMqJCuKKlqmIl2
 AoEg==
X-Gm-Message-State: AO0yUKVb6cHci9zg7wDPVRke9RrIXPHl4iSYGC5cEcCJWqV+lVhRYo19
 aXvGLhUPPoJlaHU4LLL+uR9q0Q7DE8dP4O4J3j6lPiicGjq1NLdBC+F8p7LIdYD6rc8Hajn6jM9
 hVmufhuSAgbtfyS7VStcKjzny6FZS+vXu1T7GrFZ1goq+
X-Received: by 2002:a2e:7219:0:b0:299:a9db:9c with SMTP id
 n25-20020a2e7219000000b00299a9db009cmr1892442ljc.9.1679062425123; 
 Fri, 17 Mar 2023 07:13:45 -0700 (PDT)
X-Google-Smtp-Source: AK7set/UVaZlNRO6LvO15jv6aTQnuB6SzJ0szl6fC+WBTGAbN3WhmLWh7oNZLb7TFuLt94eePQ6MUGSYqhV29x+safI=
X-Received: by 2002:a2e:7219:0:b0:299:a9db:9c with SMTP id
 n25-20020a2e7219000000b00299a9db009cmr1892428ljc.9.1679062424881; 
 Fri, 17 Mar 2023 07:13:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230317081718.2650744-1-lee@kernel.org>
 <20230317081718.2650744-35-lee@kernel.org>
In-Reply-To: <20230317081718.2650744-35-lee@kernel.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 17 Mar 2023 15:13:33 +0100
Message-ID: <CACO55tuhLEdRxGGnpMwfvj0s4E2kR74xyYdGfeokD4xSR3G7cg@mail.gmail.com>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCAzNC8zN10gZHJtL25vdXZlYXUvbnZrbS9lbmdpbmUvZ3IvdHUxMDI6IA==?=
 =?UTF-8?B?Q29tcGxldGVseSByZW1vdmUgdW51c2VkIGZ1bmN0aW9uIOKAmHR1MTAyX2dyX2xvYWTigJk=?=
To: Lee Jones <lee@kernel.org>
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
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 17, 2023 at 9:23=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c:210:1: warning: =E2=80=98=
tu102_gr_load=E2=80=99 defined but not used [-Wunused-function]
>

mhh, this looks a little fishy and might be a mistake not using this functi=
on.

Ben, is it safe to remove it? The code seems to be slightly different
things, but also looks like it needs to be rewritten a little anyway.

> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
>  drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c | 13 -------------
>  1 file changed, 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c b/drivers/gpu=
/drm/nouveau/nvkm/engine/gr/tu102.c
> index 10a7e59482a6f..a7775aa185415 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c
> @@ -206,19 +206,6 @@ tu102_gr_av_to_init_veid(struct nvkm_blob *blob, str=
uct gf100_gr_pack **ppack)
>         return gk20a_gr_av_to_init_(blob, 64, 0x00100000, ppack);
>  }
>
> -static int
> -tu102_gr_load(struct gf100_gr *gr, int ver, const struct gf100_gr_fwif *=
fwif)
> -{
> -       int ret;
> -
> -       ret =3D gm200_gr_load(gr, ver, fwif);
> -       if (ret)
> -               return ret;
> -
> -       return gk20a_gr_load_net(gr, "gr/", "sw_veid_bundle_init", ver, t=
u102_gr_av_to_init_veid,
> -                                &gr->bundle_veid);
> -}
> -
>  static const struct gf100_gr_fwif
>  tu102_gr_fwif[] =3D {
>         {  0, gm200_gr_load, &tu102_gr, &gp108_gr_fecs_acr, &gp108_gr_gpc=
cs_acr },
> --
> 2.40.0.rc1.284.g88254d51c5-goog
>

