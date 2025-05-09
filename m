Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C46AAB176B
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 16:30:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5C3210E02E;
	Fri,  9 May 2025 14:30:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4C3410E02E
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 14:30:08 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-54b10594812so2786190e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 May 2025 07:30:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746801006; x=1747405806;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=L6HNDVpBlroLh+j3E6orAQRVPy/hUZu10Ujgmb+3j10=;
 b=A11SyifQzB7DvSLzZKUDH/jrI1jgT8ZkryWjkB4BQmn4LauZIbBLegFhQPhXYhSz5A
 vVeOH6bV4DZoPOclHv/laUiAVFhUmQN37WqGxtk8N6AioZCosEEqrvfawl+xZIZYrPQe
 2PNhBF79uWEfFn3hgSNvmXyd8WcDNraXHO1lMzNZoDfyvguQ8cX8m8jaUS8JOldgB3In
 OGU2h2iriMdWN85LmHpbXcauRTXETf55xYfO1axSFCIZc7jkP1JgXcIvMPet6DJFt2yL
 p2gpeqboEFoLxvgLlFRpnFEDnw7YKAsHw5GFteZrXUHh+DKsG+cEqPFPyR32Oyf9VMnX
 WTJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrRuLyeaP2C7ds2CtmnaNzNy0/53TrRjn8OvdavFY+Mj8UrfazEpYAXBeLYg8Dn7TiFdlFwwkw93o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyXDtgJBy7Mu8evAzMUL3uo49HkHX3fE97ntAKDwMUyAsMv8cTv
 hSVswfqfYbH+tn2KeR4r5pDzmoqHTvLKQ5OE5dkXTZcZlv1mB3JL8GvDISBM
X-Gm-Gg: ASbGncvS5SLthav4J7ih5FERcKIMqTBHfwN6GXz7W2xuYiT44sADgnPXjsJa6SzDM3d
 M0bkvWiJS8QFyqF9CbfAbn1ZsFHpgxLK6hD/tj0Uv1fnVoaccOQTbl0HThvL79VBvWNRRb45Hak
 Bo57CE1pVrg5cURejpzuw0ek3K9XOCJti8EnxNFaZa1KkarGsAIHDemg3EdQOV2Ewr21liKOvxX
 47WlL1GViVLu14HfI3p11ESlRp+fvr4VeNqmeAZDBhaPfczSrxedILSjB48tLKZHd55toSPSge0
 HUfXYt3h8Wol7iM7J13TP6Ms7PdfQT7O3U7qx1CLEiSov2x3nNQQOkKmx8gpCClzjLVncVTk7g=
 =
X-Google-Smtp-Source: AGHT+IFkPo0WB8w8xZTtIWuqwDK9m9IZOMX+Ce/F6X4JMUwkzgyJtt+A6zjtF2+NeNh+p/FHHr8OmQ==
X-Received: by 2002:a05:6512:6703:b0:54a:cc75:6a9d with SMTP id
 2adb3069b0e04-54fc67e46e6mr1020307e87.42.1746801005283; 
 Fri, 09 May 2025 07:30:05 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com.
 [209.85.208.180]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54fc645cf45sm293497e87.74.2025.05.09.07.30.03
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 May 2025 07:30:03 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-3106217268dso19758551fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 May 2025 07:30:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVJrC8FlE333wZ9Nvf45CPQOIdxR0StNDvR1ugW0S6HZEd+U2zgzzs/NAIffAZOeqkkM/MM+ZdL6zI=@lists.freedesktop.org
X-Received: by 2002:a2e:a542:0:b0:30b:f15f:1c02 with SMTP id
 38308e7fff4ca-326c45a7873mr15824391fa.18.1746801002903; Fri, 09 May 2025
 07:30:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250507201943.330111-1-macroalpha82@gmail.com>
 <20250507201943.330111-3-macroalpha82@gmail.com>
 <20250509151448.3191a3d8@donnerap.manchester.arm.com>
In-Reply-To: <20250509151448.3191a3d8@donnerap.manchester.arm.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 9 May 2025 23:29:50 +0900
X-Gmail-Original-Message-ID: <CAGb2v65ZhA3_pdgbq9aVdy-0rQcTNfrHoE_AvJxOvin0a6tnMA@mail.gmail.com>
X-Gm-Features: AX0GCFvJ_vLbDqqJ-IqQuPGDdkvp9YHoqLCtAkJwkmoZo8ZiJNtlDsE7n8dATBw
Message-ID: <CAGb2v65ZhA3_pdgbq9aVdy-0rQcTNfrHoE_AvJxOvin0a6tnMA@mail.gmail.com>
Subject: Re: [PATCH V9 02/24] clk: sunxi-ng: h616: Add LVDS reset for LCD TCON
To: Andre Przywara <andre.przywara@arm.com>
Cc: Chris Morgan <macroalpha82@gmail.com>, linux-sunxi@lists.linux.dev, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 ryan@testtoast.com, macromorgan@hotmail.com, p.zabel@pengutronix.de, 
 tzimmermann@suse.de, maarten.lankhorst@linux.intel.com, simona@ffwll.ch, 
 airlied@gmail.com, mripard@kernel.org, samuel@sholland.org, 
 jernej.skrabec@gmail.com, conor+dt@kernel.org, krzk+dt@kernel.org, 
 robh@kernel.org
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
Reply-To: wens@csie.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 9, 2025 at 11:14=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> On Wed,  7 May 2025 15:19:21 -0500
> Chris Morgan <macroalpha82@gmail.com> wrote:
>
> Hi,
>
> despite the slightly ill fate of this series, I was wondering if we could
> get the non-controversial clock parts for instance already merged, to
> reduce the number of patches and mitigate the churn with dependencies?

Sure. Are we expecting any of the DT bits to go in this cycle?
If not I won't have to split the DT header patch on a separate
branch.

ChenYu

> > From: Chris Morgan <macromorgan@hotmail.com>
> >
> > Add the required LVDS reset for the LCD TCON. Note that while this
> > reset is exposed for the T507, H616, and H700 only the H700 has
> > an LCD controller.
> >
> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > Signed-off-by: Ryan Walklin <ryan@testtoast.com>
>
> Matches the T507 manual:
>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
>
> Cheers,
> Andre
>
> > ---
> >  drivers/clk/sunxi-ng/ccu-sun50i-h616.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c b/drivers/clk/sunxi=
-ng/ccu-sun50i-h616.c
> > index daa462c7d477..955c614830fa 100644
> > --- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> > +++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> > @@ -1094,6 +1094,7 @@ static const struct ccu_reset_map sun50i_h616_ccu=
_resets[] =3D {
> >       [RST_BUS_TCON_LCD1]     =3D { 0xb7c, BIT(17) },
> >       [RST_BUS_TCON_TV0]      =3D { 0xb9c, BIT(16) },
> >       [RST_BUS_TCON_TV1]      =3D { 0xb9c, BIT(17) },
> > +     [RST_BUS_LVDS]          =3D { 0xbac, BIT(16) },
> >       [RST_BUS_TVE_TOP]       =3D { 0xbbc, BIT(16) },
> >       [RST_BUS_TVE0]          =3D { 0xbbc, BIT(17) },
> >       [RST_BUS_HDCP]          =3D { 0xc4c, BIT(16) },
>
>
