Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFED8681B7
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 21:08:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4A9810E7C3;
	Mon, 26 Feb 2024 20:08:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BgeSsiqT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 411EA10E7C3
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 20:08:10 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-512a65cd2c7so4891033e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 12:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708978088; x=1709582888; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P8qiXwV5MVkQofH+MaxU2bpzvzo39pZRh7erGITANy8=;
 b=BgeSsiqT0tN6GOUPoqnVM+AL7sssdrRSyDHAJNDv1NKXCAW3amr6eLEco2b2sknnIT
 hIEeZxbBJJTsfbbi8bk8UARCV2A/Vl2WzA+nlGWmKoTF33283DmcfajTx4vyM1K//Oc9
 3Rm7QqKOeHgrk9WuoPUgZQPDD7gn4SH0hfhmNkQXLhfQT4mMDpTJ3nmzHoxq5C8B20+8
 4E8y5j8uEiHuQi2LeeQgAhKZVVZb0sdNhuBbwire/byPU02qZu/omivv0O9T80UO1U/e
 sc/KXsNdGymWZm5Az4WgAPmI9T539uLsxlvlzrpyKudtY4Zfdfb2qTPzQlVaeJFMWaqe
 fjvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708978088; x=1709582888;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P8qiXwV5MVkQofH+MaxU2bpzvzo39pZRh7erGITANy8=;
 b=qTsJSF/p8k9Oqo3lPpOYzMtqk5jT7gK7r4EqiyqhMswgG6Zwh6GhQuF3NxTWz4jwLQ
 a1Ph2URNN/mF8WrokCHoRC9V5ErYEZHy4kiTR90NnsVG8eoPtX9yrWwpeztxK+4aF6UX
 fj+vwFvHG78WYs2kT65wIJeHGpM8gtJb40XWo5N55/3/4oxXY9BWRL8iXhE0h697A04A
 5m3qEuBJb41tiBl2a5D+3VD0cJ7lXS+moSfCGaJTgHYcee6vPZK0R0QoSubNraIO6LH7
 J+6Twyp4RzPdSEYfQfsFJNhfFU7JRWNvmAYbtaa5oT+tbBnbViUXmrvSQaP/zpUvcevN
 Z2eA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSN5jVldS7dNXtWWALv8fQsoZwNZNcrq7dX8mJEqKnKyC4hY6J/JisOmCG8fS0CAaA/iu4qYUkfFy+X1bkG0mTXeymoi6+iZrcmqNiHpbp
X-Gm-Message-State: AOJu0YzEjk10bu39JpIFZIQdlThBo/VcFRhyO3FLM0d8gvIuDNRpsuy9
 zS2xaEM386IRRYwJQrtPRlTiy2pdHy5qi44KYYilJsTrRyqf5DPhg3LNJcC4yXW5oxol9hSZ8Vr
 uEvr5OSp4ybrDczTjoJnF0drFpds=
X-Google-Smtp-Source: AGHT+IFpmJYBm2bJLEhvPMIHTu7tdzlLyLLX59ipQuXs0/4omd7yWBrPgt5GQRSg5HsFGvCU9oJ/g+VP5Bvtf6W0Osw=
X-Received: by 2002:a05:6512:3087:b0:512:e1c3:5ab with SMTP id
 z7-20020a056512308700b00512e1c305abmr5473467lfd.45.1708978088002; Mon, 26 Feb
 2024 12:08:08 -0800 (PST)
MIME-Version: 1.0
References: <20240205-pinephone-pll-fixes-v2-0-96a46a2d8c9b@oltmanns.dev>
 <87r0h8n64g.fsf@oltmanns.dev> <875xybr93t.fsf@oltmanns.dev>
 <3546609.iIbC2pHGDl@jernej-laptop>
In-Reply-To: <3546609.iIbC2pHGDl@jernej-laptop>
From: Erico Nunes <nunes.erico@gmail.com>
Date: Mon, 26 Feb 2024 21:07:55 +0100
Message-ID: <CAK4VdL0oHE72_fJpoL1oQs4y=xP=8MPQq_6DHsARWVZUdQ3qCw@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] Pinephone video out fixes (flipping between two
 frames)
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megi@xff.cz>, 
 Maxime Ripard <mripard@kernel.org>, Frank Oltmanns <frank@oltmanns.dev>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Purism Kernel Team <kernel@puri.sm>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
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

Hello,

On Mon, Feb 26, 2024 at 6:29=E2=80=AFPM Jernej =C5=A0krabec <jernej.skrabec=
@gmail.com> wrote:
>
> Dne ponedeljek, 26. februar 2024 ob 08:13:42 CET je Frank Oltmanns napisa=
l(a):
> > It seems to me that all options for changing the GPU's rate in a stable
> > manner have been exhausted. There seems to be no common interpretation
> > what the phrase "Clock output of PLL_GPU can be used for GPU;and dynami=
c
> > frequency scaling is not supported" in the Allwinner A64 manual (chapte=
r
> > 3.3.3) means.
> >
> > The BSP uses a fixed rate of 432 MHz. Unless one of you has a clever
> > idea, I suggest to remove the OPPs from the device tree and set the GPU
> > to 432 MHz.
> >
> > What are your thoughts on that?
>
> I can't find original source of these points. So I'm good with removing
> them. But instead of fully removing table, you can just leave one point a=
nd
> it should work.

I had posted in
https://gitlab.freedesktop.org/mesa/mesa/-/issues/8410#note_2216628
that I also noticed the A64 datasheet specifically claims that except
for PLL_CPUX and PLL_DDR1, other PLLs don't support frequency scaling.
I was never able to find any evidence that it is actually supposed to
work anyway (perhaps it was hope?). Since you also looked in the BSP
and there is still no evidence that it is supported, I support that we
should likely just remove the OPPs.

Also, I wanted to point out that my series
https://patchwork.freedesktop.org/series/128856/#rev2 was merged to
lima recently. That was the root cause of the "flipping between two
frames" issue that people most probably hit. I highly recommend that
people using the Pinephone update their kernel to include those fixes
to fix that issue. As you mentioned about that symptom here, I just
wanted to point out that it wouldn't be possible to fix the "flipping
frames" issue with just fixes to A64 clock, it does need lima driver
fixes.

Thanks

Erico
