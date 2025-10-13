Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B3EBD12C2
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 04:09:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8D9C10E025;
	Mon, 13 Oct 2025 02:09:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="feY7Lr9O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C32310E025
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 02:09:14 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id
 4fb4d7f45d1cf-62fa062a1abso6862744a12.2
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Oct 2025 19:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760321353; x=1760926153; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X7LwVVt+oIonXpTgbR8cBIFBDId8LwLF2NsksQagWtM=;
 b=feY7Lr9OIelC3UfPbPkJGEalfDYk1uL/nKaQ5XFsorww3WLRkYHs9PQ1ZOvcTSzyHL
 6L6nevWjy0a/Ml7wzf9IR2T+Vlrh5V8cVM3Df9cVdP9ttjYBFUl9RYT1gfrqVThr7EQs
 a1LnUtQtQKHmuyvtnpV6DvsVk0cS+slfe48Mfq4lBEEWLmmcOQSLrnV6xoARSDZnX87J
 z4M2eC9pfx0XvuUZIjhEnJJa2EgHrcsG3SwWnBzDDWaLfovrPXi2kzJp+SBdOq4dCcUw
 jG44dBDrRLsPc2fbaYLDDQANIPInZeNYazpIuwtYu45cnynIV/6+AijHgClxrvl41XUK
 Biyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760321353; x=1760926153;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X7LwVVt+oIonXpTgbR8cBIFBDId8LwLF2NsksQagWtM=;
 b=vgdiZmzMF2YVh/HH9SbYu4xKmkI3VupflxFBJa0KsMGl3acPXAyfqow0kbTPTBjWY0
 XmSIfK/pjerpIZkBObalkyG04o57bieukydfzNJP5xi5o6RTUexnwqcWwTwZJMRoScR3
 wJRw7/osbaJp8r3bzG4R7QHsySs843JJ+rQABUCNJUMnVCU+8ojkKPlTW1vinzcujoBy
 z3Hl6J+P5L304MFHX0TnJfN0cesjfejQYS4VS7fbnhp7+Dx0/lXEHjuK2gvHA9hJ1C0R
 2hZseeCMP6Dh+PRVu6vHAj2vs6boKtU4bGdNzFIkecjEG0KNFQ+0UVJrYzp0KWMnT6Xt
 8gfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWIpQuKk7TIffqbRqZ8lVIa9shKgURe70dtr1Dz/3kCfR0/un3/Y/8XKmSpgGLc4sQ1W546HmL0N8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyHX86FB5UcvjxqQn3LHNPcbX1cxbvPT7/XseSr3eWkCTA0g7Qi
 dhbST+y2n5sKmMQ2U6oHggCVIhTM9LSL1yzG7hNntMDSi0O4N1P2/7x0P2j4NHfkeEIW0kW7doB
 q4+VKuVpYvVu4WEk7yJHRgVsF3+aoqIk=
X-Gm-Gg: ASbGnct66cUbKBONDvzaunp1PJuS3rKpcSce74YG+3RuvROHeTwwFfYmJUJKUobYEMN
 UOLhFyQLjAvgkj/gaBcHVfSEPzdCbtJ9iGEP/vSTj6qCvHLEuOUmXXIZhEH6RWsFc46wVHFo1O6
 7kb5Q+kvlBtoxgE44Jst6TGDDYiaQL8FegbZnaG45GfX54ro+vya0cUd0tufUNQoTjq2BqHnoeA
 OUBbcvl9RENw6VAl/eq/tvUqOzMsCYxAniW
X-Google-Smtp-Source: AGHT+IHVNbPGb048RDwqDj3lyAGwhgF/NMREQX2ImeZH2JgNCDST+u6RIr04BMZZplROx4+MGMoD+CNhHbPvpufAoho=
X-Received: by 2002:a05:6402:144c:b0:639:ffb5:3606 with SMTP id
 4fb4d7f45d1cf-639ffb539d3mr11793727a12.33.1760321352764; Sun, 12 Oct 2025
 19:09:12 -0700 (PDT)
MIME-Version: 1.0
References: <20251001135914.13754-1-caojunjie650@gmail.com>
 <20251001135914.13754-3-caojunjie650@gmail.com>
 <cwgn24f6tnmytd4omr2tul4e5jjin3ijji3ff3qkumqm2xe3t3@ntayu3m5kai3>
In-Reply-To: <cwgn24f6tnmytd4omr2tul4e5jjin3ijji3ff3qkumqm2xe3t3@ntayu3m5kai3>
From: =?UTF-8?B?5pu55L+K5p2w?= <caojunjie650@gmail.com>
Date: Mon, 13 Oct 2025 10:09:00 +0800
X-Gm-Features: AS18NWC3lE60pFWwk3f8ArZQPSoc7l5pOk_MADcRyruwf3oXoyqNAhiZmduKRSQ
Message-ID: <CAK6c68jzWLYgrFXRUsYkvSWE9CRSGVmeyOp7cNhixhyBZBC=1Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/msm/dsi: support DSC configurations with
 slice_per_pkt > 1
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Antonino Maniscalco <antomani103@gmail.com>, 
 Jonathan Marek <jonathan@marek.ca>, Eugene Lepshy <fekz115@gmail.com>,
 Jun Nie <jun.nie@linaro.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org
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

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2025=E5=B9=B4=
10=E6=9C=882=E6=97=A5=E5=91=A8=E5=9B=9B 10:04=E5=86=99=E9=81=93=EF=BC=9A
>On Wed, Oct 01, 2025 at 09:59:13PM +0800, Junjie Cao wrote:
>> From: Jun Nie <jun.nie@linaro.org>
>>
>> Some panels support multiple slice to be sent in a single DSC packet. An=
d
>> this feature is a must for specific panels, such as JDI LPM026M648C. Add=
 a
>> dsc_slice_per_pkt member into struct mipi_dsi_device and support the
>> feature in msm mdss driver.
>>
>> Co-developed-by: Jonathan Marek <jonathan@marek.ca>
>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
>> Signed-off-by: Jun Nie <jun.nie@linaro.org>
>> Signed-off-by: Junjie Cao <caojunjie650@gmail.com>
>> ---
>>  drivers/gpu/drm/msm/dsi/dsi_host.c | 25 ++++++++++---------------
>>  include/drm/drm_mipi_dsi.h         |  2 ++
>>  2 files changed, 12 insertions(+), 15 deletions(-)
>
>Please extract the generic part, so that it can be merged through a
>generic tree.
>

Sorry, I don't get it.  The generic part, generic tree? Do you mean
the drm tree? `slice_per_pkt >=3D 2` is seen on the panels of these
tablets that are equipped with qcom chips. I don't know if these
panels are used on other platforms, and if it is necessary to do it
in drm.

>--
>With best wishes
>Dmitry

Regards,
Junjie
