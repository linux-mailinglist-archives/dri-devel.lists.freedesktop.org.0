Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC999A12A08
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 18:40:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0388410E098;
	Wed, 15 Jan 2025 17:40:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="ny2nd8ek";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F5D910E097
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 17:40:36 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-542af38ecd6so67183e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 09:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1736962834; x=1737567634;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mz73g5TcvrvBHPsdJaagdGFSpXGt17yEX2lFAO6eWS8=;
 b=ny2nd8ek7yGGuCXj8WWuPWCwTWmMO8E7HIpS2ko40bRXxcx1OSsEZPu00sIi9hsHXx
 D9huQW+uqLi+Hq6vsUH+CmA00kY4PdsRXzkzRehqTdCa6JNvUli8bF9PuKEMDLO2fF+X
 YOVWX6GZMy/oiKhmxVH8o/KXb7Rwo5p+3QDFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736962834; x=1737567634;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mz73g5TcvrvBHPsdJaagdGFSpXGt17yEX2lFAO6eWS8=;
 b=Mm2NG+N9SJTjkEdLHD7+5kPomkraiGqhoJIlkkW37+Y6c5MEzGUpfMP1pEvh57zwUm
 Dgn3kZyrq6HS97E25BZd9DKqnx1Wn6FewXiCAAvLYzi3pKGdDzEfbXKqiuwpEwLEItd3
 u0ooCrgtEGlgg/u4ElZzG/Z2PYwIfYRoMORHgTquRbjuA0PCpa2UWy8SYIbw+ZnAm+ov
 DbV4WJ+lCrYngG8FUKJDoQmRVtprwrcZU7O3IKgM+GBORu1yWfaEUL3I9+tfT8QbWndl
 HuP0J6LyQqbqrLDtZlOBHHXCM/aGC+hLUexR80XcLp51L5pU199Trhd2N8IatqRxHb/p
 4eog==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCkmm2hz7p6hTNH5AnMxWCE/AyGyy3fXvwU4xawxLhHGfFhdgZsWqDem0nwSvjJvs/hlU7bsMgGaA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxePZ98nedfr4cXcz95kdAVrDGiqhFS9irE5t0S81TrmaEy1lVS
 Fo6OG7Fk4s4R4KHlytYNS3Ce/iFwjggfN6pwtsj5TqB/lz1omxzVutiwv2c4FBUiiVEYqx4OC4T
 sDQ==
X-Gm-Gg: ASbGncsOae6sFKDuaGyMF4RYCBXTBxnF2U/u6P1ohf/eRDMxs+IdtWf97CB7kIrHq28
 f74d+loG+PT0NiI5sIiP4o6hkV8d0/i3+apqwQ+dmRIeZvvhTN0X+1DPW7MgL21/YlCn3fk/p0O
 KrWWtw7LnxAduL21wXNOBgtKy9iYGwQKhEzyUMh5BX1xeoKNKf7J7bX4TeRjx//XnOe3t4nQIcg
 nXuEiI6pz81hLzX/drE7zfB8bdPM74gWBZ6DJES4m2NBpUM2jPIMJQvt1vgARyq3E3R7IWhcToN
 ouBISZ9MtwRAh3qG3/Qi/pMH
X-Google-Smtp-Source: AGHT+IH75WBDXf0LR/YQdeOhzj9nm7qALCEkP7ODEc66/6PEDaiTZhM2pyGY+g+4GsCNuZ/itqpQCQ==
X-Received: by 2002:a05:6512:3192:b0:53e:335e:7756 with SMTP id
 2adb3069b0e04-54284815d10mr9259669e87.46.1736962833878; 
 Wed, 15 Jan 2025 09:40:33 -0800 (PST)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com.
 [209.85.208.177]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54298287db5sm1391024e87.130.2025.01.15.09.40.32
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jan 2025 09:40:32 -0800 (PST)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-3047818ac17so316461fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 09:40:32 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWM+rTErUUAY4CQuQ1Sg/V2SQ95zJYaWv+SjcNT/sLuAyHlY7XFo84Od4dlxwPcVEeDfCHA2oZv+oQ=@lists.freedesktop.org
X-Received: by 2002:a05:651c:1595:b0:306:f7b:20b with SMTP id
 38308e7fff4ca-3060f7b02b1mr73624081fa.24.1736962831693; Wed, 15 Jan 2025
 09:40:31 -0800 (PST)
MIME-Version: 1.0
References: <20250113085956.2150207-1-andyshrk@163.com>
 <34a1058f.9829.1945f2b448c.Coremail.andyshrk@163.com>
 <341c653.7fa6.194640f0f37.Coremail.andyshrk@163.com>
 <CAD=FV=VdtA+4AsdoKeig4hheS0CX9d9wk7+ksi0_TC-R6px2UQ@mail.gmail.com>
 <1302120.8c5b.194695aad26.Coremail.andyshrk@163.com>
In-Reply-To: <1302120.8c5b.194695aad26.Coremail.andyshrk@163.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 15 Jan 2025 09:40:20 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XU6Jij=ddAcq3F=VjP=Ls6DxSQ8VY6o+QHXHmagAkUFg@mail.gmail.com>
X-Gm-Features: AbW1kvanDvNK5NFQ7b3yVQObEHyCYHBBYizwfFzgb-yspK76t1_loCCzdCm4Huk
Message-ID: <CAD=FV=XU6Jij=ddAcq3F=VjP=Ls6DxSQ8VY6o+QHXHmagAkUFg@mail.gmail.com>
Subject: Re: Re: Re:[PATCH] drm/panel-edp: Add BOE NV140FHM-N4Z panel entry
To: Andy Yan <andyshrk@163.com>
Cc: quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, neil.armstrong@linaro.org, tzimmermann@suse.de, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

Hi,

On Wed, Jan 15, 2025 at 1:45=E2=80=AFAM Andy Yan <andyshrk@163.com> wrote:
>
>
> Hi Doug,
>
> =E5=9C=A8 2025-01-15 00:44:41=EF=BC=8C"Doug Anderson" <dianders@chromium.=
org> =E5=86=99=E9=81=93=EF=BC=9A
> >Hi,
> >
> >On Tue, Jan 14, 2025 at 1:05=E2=80=AFAM Andy Yan <andyshrk@163.com> wrot=
e:
> >>
> >>
> >> Hi All,
> >>
> >> At 2025-01-13 18:17:38, "Andy Yan" <andyshrk@163.com> wrote:
> >> >
> >> >Sorry, please don't merge this patch. after further testing,
> >> >I found that there are still some changce, it can't read edid.
> >>
> >> It turns out that we need set hpd-reliable-delay-ms =3D 120 in dts to =
ensure
> >> the right time to access edid.
> >
> >That seems awfully high and feels likely to be a problem with your
> >board design and not the panel. Are you sure HPD is even hooked up
> >properly on your board? Maybe you're missing a pullup/pulldown config
> >somewhere? Would it be better to just specify "no-hpd" and get the
> >full "HPD absent" delay?
> >
>
> Yes, you are right, after checking the schematic, I found that the HDP in=
deed does not
> hooked up on the board.
>
> I do more tests with hpd-reliable-delay-ms to a short value, From the cur=
rent tests, this
> value can be set below 10, even lower, but I need to do more tests to con=
firm how low
> it can actually be set=E3=80=82

If HPD isn't hooked up on your board then I would suggest using the
"no-hpd" + "hpd-absent-delay-ms" instead of "hpd-reliable-delay-ms".
That more accurately describes your hardware. I'd personally pick "200
ms" for your "hpd-absent-delay-ms" unless you know for sure that all
the panels you might hook up have less or more. 200 ms is very common
for the max HPD time.

-Doug
