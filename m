Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E1B9888BE
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 18:07:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B48F10ECE6;
	Fri, 27 Sep 2024 16:07:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="shlQdyXk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8FF310ECEC
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2024 16:07:41 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-6dbbe7e51bbso19577937b3.3
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2024 09:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727453261; x=1728058061; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EHFkGhEsQhdZACKa6pRYflE/XTK6NMY4RSG4EsLdttE=;
 b=shlQdyXkTFUVkVVdOHz79neMdHeSrmsXmPCr/NE0DD6Dg+EyN8KD420MqPhu9QF5KF
 SusKLLkAaUdFJHHQeuNmLkUmP4bybNwgc1iZij9Mo0ypJvYBvNj4zsd6Uo5la3t2As14
 qtBo2jlYsuX2PN9G1BMFXGbH5JoY5PoD7wDCDFHZUDAG39U82/lZM7PEzisP9DMGK8ny
 ZcP4Rh1zL8jEAF7z9pfGs9oJlhcDcxqR84dY4rHr6JjegBSeALSdNrFOxL5vtBqdSrPr
 LMeGw3c8N/X9wnIs5ZfpcxS/xwEggdadyy+aZGtblkzK+++xYB/+nLFLy5fHbT754Ld4
 XelA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727453261; x=1728058061;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EHFkGhEsQhdZACKa6pRYflE/XTK6NMY4RSG4EsLdttE=;
 b=M4PcAKmMWODlX22B2EwVCDCnpN2ZUOCIhO0JPQJ0RKHOAUUDCa59gwgi3Yj2c3RLv5
 lCvruSumZfy3j2BJ/aF6Ue2BZBmDte0mWWgsEEo4rPl6d00pSt6J90HtnkMqbl7ji1yV
 aQE2E3XFg5pWCggc+mMVSd8OZvfbAk5+MjteGYgpKGUxnlUesl/1HaHMCs+WLv3WKID/
 NRAxezR21KxWcD1UfWBP6EN4XY7lFlCwUgvEAjg3cxnV4yVBUsK4hoFulfyM9q1+zYVk
 E3v1q2gqtOMQ8SPUpysGudeUUDoOXaRPX3Vp+krsYLCefRQ1cK7WNwXE+ty1z36nyNiO
 C0rw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzMpREE9UDFCreBGXdq4aj8Z7tj1cSgmWt0MxmLb2cIiBozrnBwRkT2wajqlqUpJ282LqADn/4ox4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCRi2f8oHWylERwXZezajP0LpmZgO/KYqOkOg2eVkGJdLgHP0w
 eYXHfQWnmQlIh1CXpXkAk77KnG77pLS1VqQmMl5DzqoM7dOLllEPTIdbcACwt8wB/3U9i+MRXV9
 ySD69EMBI+Hkos0GAGWXRHi6V1AcKoZB7O6qdCA==
X-Google-Smtp-Source: AGHT+IGzx/qK9UYxRzV3lT0jsfbrNXpOxjZ3LgmKAoBZnS1e/5cYjHGIXlrJ/VoSeio0nf1YAgFk8rGuS3JdImONTdg=
X-Received: by 2002:a05:690c:60c5:b0:6de:1e2:d66a with SMTP id
 00721157ae682-6e2474f4adamr30196557b3.2.1727453260762; Fri, 27 Sep 2024
 09:07:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240628-dpu-msm8953-msm8996-v1-0-a31c77248db7@mainlining.org>
 <20240628-dpu-msm8953-msm8996-v1-1-a31c77248db7@mainlining.org>
 <540ce2add6b1975502e898cc332275a6248aa1bc.camel@icenowy.me>
 <dd94e7fb72cf85800fbd46758010ea64@mainlining.org>
In-Reply-To: <dd94e7fb72cf85800fbd46758010ea64@mainlining.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 27 Sep 2024 18:07:30 +0200
Message-ID: <CAA8EJppHXUE=zhw=h7qM1iP3oLK6K9=Rqte5hKHtRGmT-5SWhA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm/dpu: Add MSM8996 support
To: barnabas.czeman@mainlining.org
Cc: Icenowy Zheng <uwu@icenowy.me>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>
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

On Fri, 27 Sept 2024 at 17:44, <barnabas.czeman@mainlining.org> wrote:
>
> On 2024-08-18 09:16, Icenowy Zheng wrote:
> > =E5=9C=A8 2024-06-28=E6=98=9F=E6=9C=9F=E4=BA=94=E7=9A=84 16:39 +0200=EF=
=BC=8CBarnab=C3=A1s Cz=C3=A9m=C3=A1n=E5=86=99=E9=81=93=EF=BC=9A
> >> From: Konrad Dybcio <konrad.dybcio@linaro.org>
> >>
> >> Add support for MSM8996, which - fun fact - was the SoC that this
> >> driver
> >> (or rather SDE, its downstream origin) was meant for and first tested
> >> on.
> >>
> >> It has some hardware that differs from the modern SoCs, so not a lot
> >> of
> >> current structs could have been reused. It's also seemingly the only
> >> SoC
> >> supported by DPU that uses RGB pipes.
> >>
> >> Note, by default this platform is still handled by the MDP5 driver
> >> unless the `msm.prefer_mdp5=3Dfalse' parameter is provided.
> >
> > For curiosity, will this driver makes DSC possible on MSM8996?
> As far as i know yes, but if i know correctly there are some DSC
> support also in MDP5.

No, MDP5 doesn't support DSC. mdp5_cfg.c defines corresponding
capabilities, but there is no actual support.

> > I think the Google Pixel device uses a panel that needs DSC, which
> > makes mainlining it currently impossible.

I hope we can look at the DSC support for those platforms at some
point. No particular dates and/or plans yet.

--=20
With best wishes
Dmitry
