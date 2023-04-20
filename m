Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6A86E978C
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 16:48:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3730010EC80;
	Thu, 20 Apr 2023 14:48:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECE4710EC7E
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 14:48:08 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id n203so2296869ybg.6
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 07:48:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682002088; x=1684594088;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HmDRYCu7Jt3gKtDxjGvoyq8djfPIkMFFRvz5U28UbdA=;
 b=KSQRYxiSVaYd3zc0szJeb6Cgnx6zPmZLx7+zrjGdTI9l9BfQvPSJk4APGNgbnPEpkR
 RHab09CEluhJK934fl/10IBZU9MHz09z4mXHnMJZAzxTqov+S2pPTEkxwPYUTLu520Fx
 kYX5CoZPnW4vfYntnNXYyY9bRWni313L1oC9t1A4SHB/2pevbEFc1EfPE0lBrdIY1x80
 ZqDL1ateuACkflUqwDlI7al9poPVEQl64EZXciNCZJd4J0evfP+m6GSCvQDSu9rjtq+4
 9/qn+BvIMfrEQNKZrq1jz1xjbpQDVyiZOdiWRLlACK9Fh2nZLtFmxtvCjD9H0laJJ4N3
 IyJQ==
X-Gm-Message-State: AAQBX9eJUsO/c2Kx5tFGVHI6ZOJNgNxjZ914gnILmWY36X3VulpThu4J
 9hWg3g+erHR5tcDsADBLAVPJ2ABygS59RLjL
X-Google-Smtp-Source: AKy350Yn5wE4m/Lnf1gE+tXZwHwpBYWnbFBSbOjsFyoBzqaGgdjlcedn/HaPQMly5BziBWzG1GyE+A==
X-Received: by 2002:a25:343:0:b0:b67:3785:823c with SMTP id
 64-20020a250343000000b00b673785823cmr1340505ybd.36.1682002087659; 
 Thu, 20 Apr 2023 07:48:07 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com.
 [209.85.128.175]) by smtp.gmail.com with ESMTPSA id
 u2-20020a259f82000000b00b96a0d1a0a7sm341730ybq.11.2023.04.20.07.48.06
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 07:48:06 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-54fc337a650so45571747b3.4
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 07:48:06 -0700 (PDT)
X-Received: by 2002:a0d:df95:0:b0:54c:27e7:b1fd with SMTP id
 i143-20020a0ddf95000000b0054c27e7b1fdmr1072994ywe.37.1682002086443; Thu, 20
 Apr 2023 07:48:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230411120810.368437-1-biju.das.jz@bp.renesas.com>
 <20230411120810.368437-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230411120810.368437-5-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 20 Apr 2023 16:47:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU4NTcNL6MYEqTmRtPP3iTSNTfnoEttPwevFyXZ_Vk4aA@mail.gmail.com>
Message-ID: <CAMuHMdU4NTcNL6MYEqTmRtPP3iTSNTfnoEttPwevFyXZ_Vk4aA@mail.gmail.com>
Subject: Re: [PATCH v7 4/8] drm: rzg2l-du: Add RZ/V2L DU Support
To: Biju Das <biju.das.jz@bp.renesas.com>
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
Cc: devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Biju,

On Tue, Apr 11, 2023 at 2:08=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Add support for RZ/V2L DU. The RZ/V2L DU block is identical to
> RZ/G2L SoC.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v7:
>  * New patch.

Thanks for your patch!

> --- a/drivers/gpu/drm/rcar-du/rzg2l_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rzg2l_du_drv.c
> @@ -53,6 +53,7 @@ static const struct rcar_du_device_info rzg2l_du_r9a07g=
044_info =3D {
>
>  static const struct of_device_id rzg2l_du_of_table[] =3D {
>         { .compatible =3D "renesas,r9a07g044-du", .data =3D &rzg2l_du_r9a=
07g044_info },
> +       { .compatible =3D "renesas,r9a07g054-du", .data =3D &rzg2l_du_r9a=
07g044_info },
>         { /* sentinel */ }

So this change implies no fallback compatible value, OK.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
