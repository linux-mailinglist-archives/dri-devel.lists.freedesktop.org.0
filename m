Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 029CCB06E8D
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 09:13:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DB2510E648;
	Wed, 16 Jul 2025 07:13:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=scandent.com header.i=@scandent.com header.b="Oj5yAEYV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E776C10E20D
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 13:09:28 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-60c5b7cae8bso8890263a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 06:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=scandent.com; s=google; t=1752584967; x=1753189767;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=loIwKuVLc28liuZ9j8AtQx7mS2D+eRawqdRmKZBLteA=;
 b=Oj5yAEYVT6SJKmSBaSvN4El27XnoUoFGDRU/SJIJX5eWPdes8TEFQl7FddiOc4S8IT
 OO7Uret9QQEkAS4l9vd5US5lL6MLGLa80prYpcJTRWJm9ulgPXdCQfUiuUCi9VdGq+9I
 yIyzfjmPB1sW1TZZu8lqlU6qvYKjetQSIrEt2nU8abD1Ca5aDQVsL1PZE5PuG4U5F8eD
 N+idinhWsbxsEwrSfVKvTpuND7ge7kb/9ScQk4CMP1K3lXOqs4FGWqvSsCr4NR52NAOZ
 IRQkniAtsxMkTFCSLO2H3PKqbfqVGE2OUbxsz5sKFTllWufLvn5DEf9YKF/IXwuVpxfZ
 /K5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752584967; x=1753189767;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=loIwKuVLc28liuZ9j8AtQx7mS2D+eRawqdRmKZBLteA=;
 b=QTLZOMJMT8s3xeoKeMw0x6GC6y9y2eA2McmmFMnEQUxIDSc/7yca58HeAKk2Iq5e8i
 og9Z62jBVGybSmzRFK6n7P7rjEAzoN4+jEz1oVyJvxOfgOffPCjCFmRtvh0rNdbiBkHe
 pbZ536pMyaiq61uFkX9alm8BvT9S0gVbCDFgscYOSHJ6hVDWP1LouFohDK1GZU/mFJjk
 QUgMwptz7sUcl+OLNgs/xEcJOg+Q5opgzHCr1GMTHpv18c55WOnmb7bWhe2aTTuq9Tg/
 grwrV6oMwkOzNX1mmbYBjP3hUd+3ymMApYLlTEnGHfV9dV5YkKRVFJIyZNaW/CapWqFL
 /JlQ==
X-Gm-Message-State: AOJu0Yx6m10anm/ci+IpCPhVvbHo5pOihyg+3t0lixN+2ZUTmNqer8A1
 nc+GvJTyRC7tXFgc6FAvuaKdndHtJzuTsKsx93V0EZKONj52F95U4UboDY2ulVITo3g/ugehCBI
 mY1it2//3UPAa7+h6YSSmRzuW5tQrKFWriZIpOhekrw==
X-Gm-Gg: ASbGnctB9RXBtaURmoGnHaHnAe3vlT963otpJfjOuC5tQC7/RkWZ8ZSa3IjU9WjxJ0Z
 xjNDHMNsfNr0U9g1mg7yHbGDOqT4lHbV+3Qu/2uGW5ghqYQmskjaPK0YAbcTa2cR0I+oA/nGjyv
 cdeIZoP1pBQ3o41QafHROVhYua7qm2khRBXG3XzXrvHoP/rC00TX5yFOZd871w94xT/TyOU8N9a
 EpB9t6iBEKCcVLfwuq77iFTcw==
X-Google-Smtp-Source: AGHT+IF++lUmzlNxha9tGx75YXAm4HZFe3VAjjUi8aqp6gc2YeO6hMq9fGbFHVnvjshSZenTVkSjAwhnnmVYojKPIl4=
X-Received: by 2002:a05:6402:4308:b0:60c:4667:b29e with SMTP id
 4fb4d7f45d1cf-611e8614c8bmr14553995a12.31.1752584963147; Tue, 15 Jul 2025
 06:09:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250714221804.25691-1-richard@scandent.com>
 <20250714221804.25691-4-richard@scandent.com>
 <20250715-tasteful-thoughtful-aardwark-1c2550@krzk-bin>
In-Reply-To: <20250715-tasteful-thoughtful-aardwark-1c2550@krzk-bin>
From: Richard Yao <richard@scandent.com>
Date: Tue, 15 Jul 2025 09:09:12 -0400
X-Gm-Features: Ac12FXyqc1P8nJbwIdRTXnouR3a3YjzEvmKAVAl2HOON6yi7yUGxi3MejcgXxtU
Message-ID: <CAHCiSahu=Ly=38PPCZ6so=3__M2w7AgDnd4cUrb+sKcfJoBYEg@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] drm/panel: ilitek-ili9881c: Add Tianxianwei
 TWX700100S0 support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Akshay Athalye <akshay@scandent.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Content-Type: multipart/alternative; boundary="0000000000002b13550639f77cdb"
X-Mailman-Approved-At: Wed, 16 Jul 2025 07:13:52 +0000
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

--0000000000002b13550639f77cdb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 15, 2025 at 4:07=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:

> On Mon, Jul 14, 2025 at 06:18:01PM -0400, Richard Yao wrote:
> > +static const struct ili9881c_desc txw700100s0_desc =3D {
> > +     .init =3D txw700100s0_init,
> > +     .init_length =3D ARRAY_SIZE(txw700100s0_init),
> > +     .mode =3D &txw700100s0_default_mode,
> > +     .mode_flags =3D MIPI_DSI_MODE_VIDEO_SYNC_PULSE | MIPI_DSI_MODE_VI=
DEO,
> > +     .lanes =3D 4,
>
> So you did not resolve build failure report? You need to address it,
> one way or another. Not just ignore.

The build report came after the submissions. I will fix it after waiting at
least 24h for more comments and then resubmit.

>
>
> Best regards,
> Krzysztof
>
>

--0000000000002b13550639f77cdb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><span style=3D"font-family:-apple-system,sans-serif">On Tue, Jul 15, 2=
025 at 4:07=E2=80=AFAM Krzysztof Kozlowski &lt;<a href=3D"mailto:krzk@kerne=
l.org">krzk@kernel.org</a>&gt; wrote:</span><br></div><div><div class=3D"gm=
ail_quote gmail_quote_container"><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Mon, Jul=
 14, 2025 at 06:18:01PM -0400, Richard Yao wrote:<br>
&gt; +static const struct ili9881c_desc txw700100s0_desc =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.init =3D txw700100s0_init,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.init_length =3D ARRAY_SIZE(txw700100s0_init),<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0.mode =3D &amp;txw700100s0_default_mode,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.mode_flags =3D MIPI_DSI_MODE_VIDEO_SYNC_PULSE | =
MIPI_DSI_MODE_VIDEO,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.lanes =3D 4,<br>
<br>
So you did not resolve build failure report? You need to address it,<br>
one way or another. Not just ignore.</blockquote><div dir=3D"auto">The buil=
d report came after the submissions. I will fix it after waiting at least 2=
4h for more comments and then resubmit.</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
 dir=3D"auto"><br>
<br>
Best regards,<br>
Krzysztof<br>
<br>
</blockquote></div></div>

--0000000000002b13550639f77cdb--
