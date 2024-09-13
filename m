Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD83978344
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 17:06:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23DA510EA95;
	Fri, 13 Sep 2024 15:06:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FXO8x/fH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFF4B10EA95
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 15:06:48 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id
 46e09a7af769-710dead5d2aso1147034a34.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 08:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726240007; x=1726844807; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s5xW7wFZXBPvsr8C7DrncpqkE2kHm1pCShCK0/i9/lc=;
 b=FXO8x/fHOFAno931fLdlFbMGEQxyWjYV9Aaz8L7iLWE7TJAvYB86P00GAVnNrkn+6a
 17hlfdllz2KAug0eOuJrYsj4WdwzWc+IuN1Jw8oV6kO92/ay9ZmxSTsuiPenCo5nkZbm
 QBfWO7hzl9w+Z69oRHz7Ty+WrNm/torHhzdhPCDQCMmrrq8FR++0pky1kvLto33csVej
 SjKLZRxfBi3N8BJhsKLZN+aed0LpwaniZmO3KiBSE5V/UxKSjegbGv0ks+qGV3YW55Rm
 2WCm2OyKtI5o+iF0HvMHAhfrec8eJGX7Iu8khFCPBB+ie5q6E35xzqntu4KPXtR4+3hh
 t9MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726240007; x=1726844807;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s5xW7wFZXBPvsr8C7DrncpqkE2kHm1pCShCK0/i9/lc=;
 b=vk23NrlcDUuwGYIU/nib1BR5uSOKe4DJEslFZDNRbm1ULwWXEAWdhVXK3HtFB+uHuY
 obmMVtW+sIcRjImVdr3y6QWOQLTpNeMwfM0wD5jnZWzIQcdQJ81Krj9SKru1OkoAq1no
 mXIojJJY7cYV75O/0kwOKS4VOcoTn8ZZumgCsv+/sgk4szW+4e3IB4rM9aDW8urbEao1
 GFtB0WI/3yMjObs3s5nZI09Amas3Efj2MY0VcU44a8jH9MWg4yDmiss4vzBKGsj1hjbu
 o20LAJ07owG/daxvMpdH0aZR+xWdnGgfgauRL2SEkZ4waAFgYthpUE/NEUxSVqX02/Qd
 6GIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVxCO6IIHkM2GoL63RmJQ02v0UJjuZ+HEJotp2s3FfKHLV7iUedRYdmGppd3Iazj0sg07l1hlCHLg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzYOqOqbAYJ1fOLAmFWqVUMa9I5QpO0Ngrgwf/7dKZJq2ttwwS7
 1/JJWqrQ2Fu4W+X8QjYX0qG3wSB3dO38vsadDJNgaUOlEIK9w+0R69KMDvgRJ8En+8xGxrmEWoE
 E+lRIzbSsBYcFledYLyqgWHrZdKI=
X-Google-Smtp-Source: AGHT+IHpQNpk1RPbqhgaZak33vQVpNCMrUXMzkQcxSmZLbxJpQEgL7VG8czofXsUN5d9oYR08U0ZzgsDFVqScsKOzcg=
X-Received: by 2002:a05:6808:220b:b0:3d9:245c:4225 with SMTP id
 5614622812f47-3e071a93899mr4047532b6e.6.1726240007552; Fri, 13 Sep 2024
 08:06:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240719-starqltechn_integration_upstream-v4-0-a7f644821941@gmail.com>
 <20240719-starqltechn_integration_upstream-v4-27-a7f644821941@gmail.com>
 <uevafpb6r7rfutiqrm5asfvv7zfxcb3acrlxqpispele5er52x@eegonpzqlm7j>
In-Reply-To: <uevafpb6r7rfutiqrm5asfvv7zfxcb3acrlxqpispele5er52x@eegonpzqlm7j>
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Fri, 13 Sep 2024 18:06:36 +0300
Message-ID: <CABTCjFA+4+37+gF2FcvGVMLmzwM01MVvSjBDinVJyRaw007jTg@mail.gmail.com>
Subject: Re: [PATCH v4 27/28] gcc-sdm845: Add general purpose clock ops
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: dmitry.baryshkov@linaro.org, Sebastian Reichel <sre@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Lee Jones <lee@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Pavel Machek <pavel@ucw.cz>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Chanwoo Choi <cw00.choi@samsung.com>, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-input@vger.kernel.org, 
 linux-leds@vger.kernel.org, linux-pwm@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org
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

=D0=B2=D1=82, 10 =D1=81=D0=B5=D0=BD=D1=82. 2024=E2=80=AF=D0=B3. =D0=B2 12:5=
9, Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>:
>
> Hello,
>
> On Fri, Jul 19, 2024 at 03:55:04PM +0300, Dzmitry Sankouski wrote:
> > SDM845 has "General Purpose" clocks that can be muxed to
> > SoC pins to clock various external devices.
> > Those clocks may be used as e.g. PWM sources for external peripherals.
> >
> > GPCLK can in theory have arbitrary value depending on the use case, so
> > the concept of frequency tables, used in rcg2 clock driver, is not
> > efficient, because it allows only defined frequencies.
> >
> > Introduce clk_rcg2_gp_ops, which automatically calculate clock
> > mnd values for arbitrary clock rate.
> >
> > Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> > ---
> >  drivers/clk/qcom/clk-rcg.h    |   1 +
> >  drivers/clk/qcom/clk-rcg2.c   | 162 ++++++++++++++++++++++++++++++++++=
++++++--
> >  drivers/clk/qcom/gcc-sdm845.c |  19 ++---
> >  drivers/pwm/pwm-clk.c         |   5 ++
>
> I don't understand why a change to some qcom clk implementation detail
> needs a change to drivers/pwm/pwm-clk.c in the same commit. I guess if
> the change to drivers/pwm/pwm-clk.c is needed it should better go into a
> separate patch with an appropriate commit log?!
>
You're right, I'll fix that. Also I heavily rewrote this patch, and
included it in
starqltechn patch series. Since this patch has the wrong version (sorry for=
 my
mistake) and order numbering, please consider the next patch a successor of=
 it.

--=20

Best regards,
Dzmitry
