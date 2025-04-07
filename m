Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE5CA7E7B3
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 19:03:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFBB310E525;
	Mon,  7 Apr 2025 17:03:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dGs05caz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com
 [209.85.221.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5A2710E525
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 17:03:37 +0000 (UTC)
Received: by mail-vk1-f175.google.com with SMTP id
 71dfb90a1353d-51eb1823a8eso2515474e0c.3
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Apr 2025 10:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744045417; x=1744650217; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fpseVAhEseWnTo61VbEwVPRmzrBf+CuzEXB31RDWwHE=;
 b=dGs05cazXdCnz/Z7RV29TqXiQxkK3KhDexr608uZituSG25noD+r81w0sFZBEtXERy
 awpRBa47vi3HeLJiXv6Pgp158dbUXKR8QtsAUXJisn6GFpauAElvHEeEGCC7y7o+h+At
 Fc+XwIIZxdjuJX8GT/7a4xmNaDku9v/gOco557JmRBzb0h6rTcYO3biS0TU8gsOkflWa
 bcsTOqTUfwAvuw+vPL0zvYaAyj/y9Yp/IWEnkLa8sScIKWpoV1cgJTU33KW/5HPKEO9n
 bl+EOZTti4fX1Y86N5Lld9WCbyVs2dElfSE2MgQZUWDiwiojhIiY3pyIjlj8R/LPeuiP
 /vOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744045417; x=1744650217;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fpseVAhEseWnTo61VbEwVPRmzrBf+CuzEXB31RDWwHE=;
 b=gmMSfTBNHIJHjmEJW1/WTimf1xVhLzXEWhDH7x3Q9cox+NIvqC3ggPkQkOSUP3I5HW
 kKlswjOviM4dc8YjUrinApUS6X8CEmk6cmmQI0BgjWs/36uwHfQkX+52F3XCn5x6q2dR
 MhjvqzaPCOujoYtUY8fq2mj2n1MwjTvArDb43EB1oV8L+J22hMSDqgD+OamRL0jmmsqQ
 OCtonZhl9F5WaE6hDA95S+IlyR7nLuICg/7D7aUDN+wBz1dWtFwSGjRCPbJ2V1vUa56Y
 /6rlmfp1kjp1u9BgkzAOVPRduSuZslA2P6Yfzg2PdX2I5tEq1QvjN/LRSoDYi5RFaIU/
 BCWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8NXz4AFuGVLgMOuqMktMkCh+Nyb9SSiWoc4s1NKuD23rgAqMkU7yZs/zPtzQAL4pNWzo0h4EpLOE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCuioINr7Gz36HpfNoIZw+2Pa/ezOwJJUCsayQoDiecbn0bCNu
 traw3rJ+oiqWVFbek8QT9+mVrcBe18SNG2PnTWo4cPWKbkWYRpsirnAkQVBrmHj7HDIzmGfdY+F
 wOB/KvgrK7Nwve/r1/Zgq4185QEM=
X-Gm-Gg: ASbGncueRF/k3K2CNPqc61hiCxbZc9foNfmI9yjuRUpkaj8P6jGEU8Ji/R474hNfxJL
 T/L4pCfNPVZlJ8vnPN8HbDo/b5/e9pCBDyVn2LzJVVdpgDvrim/xr77FSDfZ43YcxINhf1/Tpcr
 pS19HfszUE0xFa9TmtWhIW73MD5g==
X-Google-Smtp-Source: AGHT+IGxbAVyVf2xA8LPwk7l2JB0DfGDrOCLCNVHquxc4ButTdJVyVMQctTheAzeOya9s0lUWHSHj8atxG1Q25XTjxA=
X-Received: by 2002:a05:6122:4f91:b0:527:67da:74ee with SMTP id
 71dfb90a1353d-52767da815amr9489566e0c.5.1744045416847; Mon, 07 Apr 2025
 10:03:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250404133047.172080-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250404133047.172080-1-biju.das.jz@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 7 Apr 2025 17:03:07 +0000
X-Gm-Features: ATxdqUGQhJZ4PWoV6QIPQdENxYFj6YSpbw2paP05alJ-PbIXiRXrqN8C_GzJXsk
Message-ID: <CA+V-a8vk2A80gJGDHe_j4deYqfAUT22SJe6TcGTW3G5L60SfSw@mail.gmail.com>
Subject: Re: [PATCH] drm: renesas: Add zpos, alpha and blend properties to
 RZ/G2L DU
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das.au@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 4, 2025 at 2:32=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.com=
> wrote:
>
> Add support for zpos, alpha and blend properties to RZ/G2L DU
> driver as the IP supports all these properties.
>
> It is tested by the below modetest commands:
>
> modetest -M rzg2l-du -s 44@42:1920x1080@AR24 -d -P \
> 37@42:512x300+200+200@XR15
>
> modetest -M rzg2l-du -w {32,37}:alpha:{0,65535}
> modetest -M rzg2l-du -w {32,37}:zpos:{0,1}
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> #On RZ/V=
2H

Cheers,
Prabhakar

> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c b/drivers/gpu/d=
rm/renesas/rz-du/rzg2l_du_vsp.c
> index 8643ff2eec46..040d4e4aff00 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c
> @@ -340,6 +340,15 @@ int rzg2l_du_vsp_init(struct rzg2l_du_vsp *vsp, stru=
ct device_node *np,
>
>                 drm_plane_helper_add(&plane->plane,
>                                      &rzg2l_du_vsp_plane_helper_funcs);
> +
> +               drm_plane_create_alpha_property(&plane->plane);
> +               drm_plane_create_zpos_property(&plane->plane, i, 0,
> +                                              num_planes - 1);
> +
> +               drm_plane_create_blend_mode_property(&plane->plane,
> +                                       BIT(DRM_MODE_BLEND_PIXEL_NONE) |
> +                                       BIT(DRM_MODE_BLEND_PREMULTI) |
> +                                       BIT(DRM_MODE_BLEND_COVERAGE));
>         }
>
>         return 0;
> --
> 2.43.0
>
>
