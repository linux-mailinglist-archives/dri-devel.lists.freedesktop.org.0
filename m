Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CCF59934E
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 05:05:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBFA910E342;
	Fri, 19 Aug 2022 03:05:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41CFA10E342
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 03:05:44 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id c24so2725233pgg.11
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 20:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc;
 bh=LPfXpj+FEBJ+yW3DuIoKZiPeyoOvD7ATifrj7SiRAq0=;
 b=NQ9XJzT8HZHhYioRTSbr+3mL6nvQ+54VTOyANi39zNn3wCIulTD1fRKANJHXB7Z1hD
 rUX1snl+hy8RO5wPpYOKae+kjbBMAiX92Ih3gPfpn7J5UUoNrbdZzkRUigB/94rMfQwF
 f2kDvWyafGDTnDPJmdCG7iVid4LqUlIPffYc6Dph1QgI+BxC//EAKCVUzMsC7R4mfZqP
 TS8+vpTrfoUNQKUG+uGCloaDGNx0czLce2afGRfY1/7f/ggFrxjAKu4VVWydTXsdvZvi
 Dr4a3E4jhr0iCqC8rZSd7RUgsLMmyXNPzAtvN/b4Frkgw2yc70LAPln2al2XdZp2X9dy
 LhYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc;
 bh=LPfXpj+FEBJ+yW3DuIoKZiPeyoOvD7ATifrj7SiRAq0=;
 b=bWM039BojXSN45BxurUTdQWi8s1NeHPgBNFbJJ0Wt4yDRlw6NJNvZAi1jo4fTiqR5J
 /BE9rCA81bETSOt/MPaW1LjrRVIBwRebaaaADFB0qd2Ic9GKlMKs5dsK3s2jJk7wsfCs
 EVkFmXdIk7JOx2A/wB/f8LDIRA2caYnWIJBFi5FQvwhxtXSieBK/CaOqY96FR1JYIuol
 n7WEE/XuB9Qx6/SprlywNB5Ond9QvMsxxFzdP7J3tUcHqqE9pyQ8LiOBzFQhlySFxFlN
 kgsadE3ptZ6oQvNvXV5+dKXDcWqSB1cv9QZZpnKfqOOUv4lLcTe1DB6TpNOSpMcxj5VW
 6ZIg==
X-Gm-Message-State: ACgBeo2j4/3knbedFySQ7LyZxW8Ah43CQO2yRetV+6nw5grZZfCnzsvy
 ASLJx93V8TiLUREWeC5erViiyg==
X-Google-Smtp-Source: AA6agR7DH7phg2+wV73JgLrmj4KOjSYQezBdQe0JdBFkDsvsvCC92aX0SqZ6j9rrdRw5x/6oLqfmUw==
X-Received: by 2002:a65:6e82:0:b0:41a:9b73:f0e6 with SMTP id
 bm2-20020a656e82000000b0041a9b73f0e6mr4790954pgb.371.1660878343757; 
 Thu, 18 Aug 2022 20:05:43 -0700 (PDT)
Received: from smtpclient.apple (napt.igel.co.jp. [219.106.231.132])
 by smtp.gmail.com with ESMTPSA id
 q16-20020aa78430000000b0052e78582aa2sm2338453pfn.181.2022.08.18.20.05.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 18 Aug 2022 20:05:43 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH v2 2/3] drm: rcar-du: Add DRM_MODE_BLEND_PREMULTI support
From: Takanari Hayama <taki@igel.co.jp>
In-Reply-To: <Yv7wjIx+NLe5iqQn@pendragon.ideasonboard.com>
Date: Fri, 19 Aug 2022 12:05:40 +0900
Content-Transfer-Encoding: quoted-printable
Message-Id: <034737B5-024D-4E65-B4E4-F63C873A2B4A@igel.co.jp>
References: <20220810083711.219642-1-taki@igel.co.jp>
 <20220810083711.219642-3-taki@igel.co.jp>
 <Yv7wjIx+NLe5iqQn@pendragon.ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, kieran.bingham+renesas@ideasonboard.com,
 mchehab@kernel.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

> 2022/08/19 11:08=E3=80=81Laurent Pinchart =
<laurent.pinchart@ideasonboard.com>=E3=81=AE=E3=83=A1=E3=83=BC=E3=83=AB:
>=20
> Hello Hayama-san,
>=20
> Thank you for the patch.
>=20
> On Wed, Aug 10, 2022 at 05:37:10PM +0900, Takanari Hayama wrote:
>> R-Car DU driver implicitly supports DRM_MODE_BLEND_COVERAGE only.
>> This adds a support for DRM_MODE_BLEND_PREMULTI. As a consequence,
>> DRM_MODE_BLEND_PREMULTI becomes the default. If =
DRM_MODE_BLEND_COVERAGE
>> is desired, it should be set explicitly.
>>=20
>> This behavior comes from how DRM blend mode is supported.
>> drm_plane_create_blend_mode_property() creates the blend mode =
property
>> with the default value of DRM_MODE_BLEND_PREMULTI. This default value
>> cannot be modified from the atomic driver.
>>=20
>> Signed-off-by: Takanari Hayama <taki@igel.co.jp>
>> ---
>> drivers/gpu/drm/rcar-du/rcar_du_vsp.c | 6 ++++++
>> 1 file changed, 6 insertions(+)
>>=20
>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c =
b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
>> index 8eb9b2b097ae..b9580fcfec7a 100644
>> --- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
>> @@ -167,6 +167,8 @@ static void rcar_du_vsp_plane_setup(struct =
rcar_du_vsp_plane *plane)
>> 		cfg.mem[i] =3D sg_dma_address(state->sg_tables[i].sgl)
>> 			   + fb->offsets[i];
>>=20
>> +	cfg.premult =3D (state->state.pixel_blend_mode =3D=3D =
DRM_MODE_BLEND_PREMULTI);
>=20
> I'll drop the parentheses here too, and if you don't mind, I'll move
> this down after setting cfg.pixelformat, as premult qualifies the =
format
> so it's more logical in that reading order (no change on the behaviour
> of course).

Thank you. I also agree with the proposed change in order.

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>=20
>> +
>> 	format =3D rcar_du_format_info(state->format->fourcc);
>> 	cfg.pixelformat =3D format->v4l2;
>>=20
>> @@ -444,6 +446,10 @@ int rcar_du_vsp_init(struct rcar_du_vsp *vsp, =
struct device_node *np,
>> 						       num_planes - 1);
>> 		}
>>=20
>> +		drm_plane_create_blend_mode_property(&plane->plane,
>> +					BIT(DRM_MODE_BLEND_PREMULTI) |
>> +					BIT(DRM_MODE_BLEND_COVERAGE));
>> +
>> 		vsp->num_planes++;
>> 	}
>>=20
>=20
> --=20
> Regards,
>=20
> Laurent Pinchart

Cheers,
Takanari Hayama, Ph.D. <taki@igel.co.jp>
IGEL Co., Ltd.
https://www.igel.co.jp/

