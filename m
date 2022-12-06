Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5976445DA
	for <lists+dri-devel@lfdr.de>; Tue,  6 Dec 2022 15:38:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C801B89F08;
	Tue,  6 Dec 2022 14:38:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F3E489F08
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Dec 2022 14:38:16 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id h10so10506468qvq.7
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Dec 2022 06:38:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MoCQfxJ5i6j85vIMn+stwCyxBvgczcZworKXH87DwQw=;
 b=cmaZ4klYj7bl74U1dTtK5IKqVg188NcaNYB5V1kc4LilIbFOtY48bG9GY/I21qPU7L
 dC9xFYn3AELZbpRW4XjgRJaYlTSRCPMNqAPpqXWuNHUInx8fXX8fnpu+n4BASMDLoMwo
 g0oR+ZGvEyVe7ubhqXkF0r5ww3RZ5kG+7ziIkzMeUGPJaXEv5BImFYOqp+k/1MqrBEz3
 H4fxUp/J5GtLXPUKVT8Ytz+JQXdXwaINSoTtzq9oHSelNnYpgv0RuM1zmZWiEMBtUupo
 Q0GlS880Tm+ysdwXLdaTT9FEdHlZtO3e+RsEoxgvNcCJWtGc2DSyIuTKgqqICdcS+eXO
 hp1g==
X-Gm-Message-State: ANoB5plBT+W/siaaaWadkRcTuZhjAkQSh3TfEt0OMjdr7DOkCeWeF7qX
 ZxgBpQ4iFp6TP3L5ycX8I4NiMpsO7n7k0g==
X-Google-Smtp-Source: AA0mqf44/fS0DTmJ90CSUkFSBrakoMVPYqKlStCxns004F0OqA+zJCyJXiSm0kszDnUhnRN6X+4Fvw==
X-Received: by 2002:a05:6214:330d:b0:4c7:b9b:eaa7 with SMTP id
 mo13-20020a056214330d00b004c70b9beaa7mr29847574qvb.127.1670337495141; 
 Tue, 06 Dec 2022 06:38:15 -0800 (PST)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com.
 [209.85.219.177]) by smtp.gmail.com with ESMTPSA id
 l11-20020a05620a28cb00b006f9e103260dsm15721103qkp.91.2022.12.06.06.38.14
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Dec 2022 06:38:15 -0800 (PST)
Received: by mail-yb1-f177.google.com with SMTP id o127so18806866yba.5
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Dec 2022 06:38:14 -0800 (PST)
X-Received: by 2002:a25:9:0:b0:6f9:29ef:a5ee with SMTP id
 9-20020a250009000000b006f929efa5eemr29679939yba.380.1670337494447; 
 Tue, 06 Dec 2022 06:38:14 -0800 (PST)
MIME-Version: 1.0
References: <20221206133954.397098-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20221206133954.397098-6-tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <20221206133954.397098-6-tomi.valkeinen+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 6 Dec 2022 15:38:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWVXCy_CEjv2c_ke6x+HNfndNci1c3m1Tn5ROy_mvNhmw@mail.gmail.com>
Message-ID: <CAMuHMdWVXCy_CEjv2c_ke6x+HNfndNci1c3m1Tn5ROy_mvNhmw@mail.gmail.com>
Subject: Re: [PATCH 5/7] media: renesas: vsp1: Add new formats (2-10-10-10
 ARGB, Y210)
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
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
Cc: linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

On Tue, Dec 6, 2022 at 2:44 PM Tomi Valkeinen
<tomi.valkeinen+renesas@ideasonboard.com> wrote:
> Add new pixel formats: XBGR2101010, ABGR2101010, BGRA1010102 and Y210.
>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Thanks for your patch!

> --- a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
> @@ -109,6 +109,56 @@ static void rpf_configure_stream(struct vsp1_entity *entity,
>         vsp1_rpf_write(rpf, dlb, VI6_RPF_INFMT, infmt);
>         vsp1_rpf_write(rpf, dlb, VI6_RPF_DSWAP, fmtinfo->swap);
>
> +       if ((entity->vsp1->version & VI6_IP_VERSION_MODEL_MASK) == VI6_IP_VERSION_MODEL_VSPD_GEN4) {
> +               u32 ext_infmt0;
> +               u32 ext_infmt1;
> +               u32 ext_infmt2;
> +
> +               switch (fmtinfo->fourcc) {
> +               case V4L2_PIX_FMT_XBGR2101010:
> +                       ext_infmt0 = VI6_RPF_EXT_INFMT0_BYPP_M1_RGB10;
> +                       ext_infmt1 = (0 << 24)  | (10 << 16) |
> +                                    (20 << 8)  | (30 << 0);

Introducing PACK_CPOS(a, b, c, d)...

> +                       ext_infmt2 = (10 << 24) | (10 << 16) |
> +                                    (10 << 8)  | (0 << 0);

... and PACK_CLEN(a, b, c, d) macros (or a single PACK4() macro)
can make this less error-prone.

> +                       break;
> +
> +               case V4L2_PIX_FMT_ABGR2101010:
> +                       ext_infmt0 = VI6_RPF_EXT_INFMT0_BYPP_M1_RGB10;
> +                       ext_infmt1 = (0 << 24)  | (10 << 16) |
> +                                    (20 << 8)  | (30 << 0);
> +                       ext_infmt2 = (10 << 24) | (10 << 16) |
> +                                    (10 << 8)  | (2 << 0);
> +                       break;
> +
> +               case V4L2_PIX_FMT_BGRA1010102:
> +                       ext_infmt0 = VI6_RPF_EXT_INFMT0_BYPP_M1_RGB10;
> +                       ext_infmt1 = (2 << 24)  | (12 << 16) |
> +                                    (22 << 8)  | (22 << 0);
> +                       ext_infmt2 = (10 << 24) | (10 << 16) |
> +                                    (10 << 8)  | (2 << 0);
> +                       break;
> +
> +               case V4L2_PIX_FMT_Y210:
> +                       ext_infmt0 = VI6_RPF_EXT_INFMT0_F2B_MSB |
> +                                    VI6_RPF_EXT_INFMT0_IPBD_Y_10 |
> +                                    VI6_RPF_EXT_INFMT0_IPBD_C_10;
> +                       ext_infmt1 = 0x0;
> +                       ext_infmt2 = 0x0;
> +                       break;
> +
> +               default:
> +                       ext_infmt0 = 0;
> +                       ext_infmt1 = 0;
> +                       ext_infmt2 = 0;
> +                       break;
> +               }
> +
> +               vsp1_rpf_write(rpf, dlb, VI6_RPF_EXT_INFMT0, ext_infmt0);
> +               vsp1_rpf_write(rpf, dlb, VI6_RPF_EXT_INFMT1, ext_infmt1);
> +               vsp1_rpf_write(rpf, dlb, VI6_RPF_EXT_INFMT2, ext_infmt2);
> +       }
> +

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
