Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31877873A1B
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 16:05:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5738210F0AD;
	Wed,  6 Mar 2024 15:05:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="g+UwguYX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE8D010F090
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 15:05:02 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2d27fef509eso15026881fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Mar 2024 07:05:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709737500; x=1710342300; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=43GXM3Q8D5bmb35Ep8tlcjDpUea4lF28uw+na04zbs4=;
 b=g+UwguYX6zohpb783aRtTaRrm33MpIUxIr5NnaqHRs7G2hS74dEAirwgNeUp4sr/XN
 on+nCrcE3a8hfxDYthg3lYHiQtVvvVnxfoxGTtDqYia/lRZTkpZqZut4kjxSo+ZGHOFb
 AF3AXYs+ljRnIDeWkdN/lZ98O3z04e1gLLtiGqkb+SzPwWA61o++yEyWGBprJjfLpOJD
 9eR+GrZy3U7aBT2nwJCsKIyrZPnz2XwqkUpcC39d68aut5wTIpZ/SCnJkQwsEegbPmuq
 yf9QC/w2SFpHaxUM7lnVIA9pZaUE/bs+FOoIJtA3Zfj+ICuA1RnjCwCpBB2deXfW6p5M
 ApFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709737500; x=1710342300;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=43GXM3Q8D5bmb35Ep8tlcjDpUea4lF28uw+na04zbs4=;
 b=XKtzuwmghEvQ9FNShXFbJcpSevULDNHASLqCyv6Qcw94/OURYeo03uZiK9wKaXvovr
 L3Jqn+F8mlTijlE2Q0vzdwPuuYfTnLRbDW7AcarMVhAqGIwOtb/kA3gKjKmGypsit2kj
 2J7VqTpwDDcpo+kEv+TjTjfIB/zh/APEe2TF/bPxe4DSXSNpc1Hi7WnxpfAj+j4Ili1F
 i16pqAj2Rhvk2XIVfhx9/Kv/4GGj+KdOeG3sQNafa2KTVJ79l0gsZRNa9ECa2VA+6I6Z
 g94j8iRfRzfExcUW4VwEz22xCJ+QKBY2/QIWluHaXY81U8geY0iNKQlquTKtjozI/Yov
 lhAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUY3RaOgc2Elhzsl9/W/aM7UsEZ4obhTKO4Idm8Wi+RWJW5/H2m5gBJlCFz1Lu8NWnuC4+mgem1fdyMIL2IC0TdnabQ++APGqgBqXIIwaCo
X-Gm-Message-State: AOJu0Yy5Djv+v9L33uEJ39MYUaevTr5Jyyc/lSi/oWWeyR5SoJDvUzXY
 1syBlqpwk2D14IphqlOFqETzxFxulsSobH1nwKqfVB3AonNK7mHj1d9DU8VNjrBHnIhTSz6PB1X
 4f5Kt3/O3b4/r8K6oyDrJfk9bH0g=
X-Google-Smtp-Source: AGHT+IEEVeDiNEpHKSHTjKvhESMzneWqkwWwVGe8WoB74soHvGsOkOKPL5fYMktXsrfWue5FRmqbdFaGULj6kEl+Zug=
X-Received: by 2002:a2e:a99f:0:b0:2d3:87b:7e9e with SMTP id
 x31-20020a2ea99f000000b002d3087b7e9emr4317395ljq.39.1709737500066; Wed, 06
 Mar 2024 07:05:00 -0800 (PST)
MIME-Version: 1.0
References: <20240304-pinephone-pll-fixes-v3-0-94ab828f269a@oltmanns.dev>
 <20240304-pinephone-pll-fixes-v3-5-94ab828f269a@oltmanns.dev>
In-Reply-To: <20240304-pinephone-pll-fixes-v3-5-94ab828f269a@oltmanns.dev>
From: Erico Nunes <nunes.erico@gmail.com>
Date: Wed, 6 Mar 2024 16:04:47 +0100
Message-ID: <CAK4VdL0zWRg4hzUbuZsnabU53x3DrOiemH0tGnpbK9ECQvM1qg@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] arm64: dts: allwinner: a64: Run GPU at 432 MHz
To: Frank Oltmanns <frank@oltmanns.dev>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
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

On Mon, Mar 4, 2024 at 6:01=E2=80=AFPM Frank Oltmanns <frank@oltmanns.dev> =
wrote:
>
> The Allwinner A64's GPU has currently three operating points. However,
> the BSP runs the GPU fixed at 432 MHz. In addition, at least one of the
> devices using that SoC - the pinephone - shows unstabilities (see link)
> that can be circumvented by running the GPU at a fixed rate.
>
> Therefore, remove the other two operating points from the GPU OPP table,
> so that the GPU runs at a fixed rate of 432 MHz.

In addition to all of this, the A64 user manual does say explicitly
that "dynamic frequency scaling is not supported" on PLL_GPU. So I
think this is really needed for a reliable GPU experience on A64.

Acked-by: Erico Nunes <nunes.erico@gmail.com>

Thanks

Erico
