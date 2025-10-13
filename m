Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3BBBD11F7
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 03:52:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9599510E31B;
	Mon, 13 Oct 2025 01:52:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="M51VJscT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24C6610E1D1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 01:52:49 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id
 4fb4d7f45d1cf-63a10267219so7027943a12.0
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Oct 2025 18:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760320368; x=1760925168; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YRrC5ujv29o4Dn7uYuCsIN4DoTMp+m253g/eeBCZNpc=;
 b=M51VJscTzHTKbJDjAlrzRlY8huiQdUm3HMMMItQS0gqd2tXs2NRaVa0MVs2SU/4VSC
 Ru5a5L32SvLRFGrqZhVqjf+VOStGfHUzjy9AkHJ47iRx7Knf40M18lI1FVUL7CF/VR7u
 YEBLEbb+SxjlakwXgn0zrzytHzc7qx78vWnjzY4FM4NFMWlNRp78l5EiX7eL9VzrBLWu
 d8uh6PPnP1tcXy8iOf5+kAOuoT5gn4cVcdvG877bNLW88Cjje5DgxmspmxVOI6c3gAco
 Z9eoaUNlMTZ/V1ZVBqdPqAXWU50DnzVVzOwNkiBA/t1XAL/f92meMDsZ/UtYrkkSzNSU
 fwqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760320368; x=1760925168;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YRrC5ujv29o4Dn7uYuCsIN4DoTMp+m253g/eeBCZNpc=;
 b=Rx1/0sm4tQ0Efk54tllWBHeBnGvt5Ed6ATzKXknKi13adCSt4AV9jQb5tVuoU6JVUx
 x3aFm98DJcWFAB2RCbtO+5ccO2CYIb7RYGF7WB/B7W18cjdYkpqxVgapi9KDaXwvFPP0
 FJw7o3xwOn1fextYv2X9ma1GBDVNGXMzwdpK6YsosGIYnd+AaIHv6/3cK1OBXLxDDTQ3
 tJZa+wxmPeZGKA5qHjF9+61ZDG8nKZhqC7mdSrXlKkhIEGq6kyxgaBMAiXtDESkY43Gd
 K74k0RDGm4xbCzsPczEPFNnLvuCs/FSIJg2iyUxDvJOwGcF+PZEZoCL5/cf9iTLVs2DB
 miGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWujdCiDv1UY8qnnTcEPVYu59GVelV4ITX5LzMogQJjbMKJqVl54BlR1bUevX2XiItWFSLXTyOnYec=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyPAenrMFkJ/nKHVwbyhJYHghEqUo2SDcpFE4dzIE8NI7cThXtd
 pF73ISkr3O+7jbrh6mY7qKpuA00pslk2bWvYK5fY99eBES4tKmFfU1r4fe262JzUjZZhxW0BvfX
 ntAU9NMmPO+6OxgQH+vr+RqlNl+2MNsY=
X-Gm-Gg: ASbGncvnhmu7ny8XPNBpXroFHZgtOTZaX7cy45YFVyVrL343Ga4Oqq0/MDN5uK9payZ
 enl2UNr1m9AkOoUvcXAkZjOV9GHfgdkPjVyFXoU1Vk/Woic8watB0o6kd9VgEKWvo8ZLL+5jyEr
 H+SK6pQe7zgaXaNbAh5B8WzYZtTzADE9A2ATashH7S7LnZyrH2B7f/SquWCngMGMRNIamsxlc+x
 4AhjU6q2rJ8u+Vni4j6GbvZmA==
X-Google-Smtp-Source: AGHT+IGVwit7EnJqjWJCndPnOaagwjFwRfHJs7DHjGaz2CJNOtKY3nJ4z/ccrJw0qhRGNyC1RhAM+KOBqlgUZm2HII4=
X-Received: by 2002:aa7:c58e:0:b0:62f:c8fc:dce5 with SMTP id
 4fb4d7f45d1cf-639bb229269mr18330933a12.10.1760320367440; Sun, 12 Oct 2025
 18:52:47 -0700 (PDT)
MIME-Version: 1.0
References: <20251001135914.13754-1-caojunjie650@gmail.com>
 <20251001135914.13754-3-caojunjie650@gmail.com>
 <cwgn24f6tnmytd4omr2tul4e5jjin3ijji3ff3qkumqm2xe3t3@ntayu3m5kai3>
In-Reply-To: <cwgn24f6tnmytd4omr2tul4e5jjin3ijji3ff3qkumqm2xe3t3@ntayu3m5kai3>
From: =?UTF-8?B?5pu55L+K5p2w?= <caojunjie650@gmail.com>
Date: Mon, 13 Oct 2025 09:52:34 +0800
X-Gm-Features: AS18NWAwf-hT5rzEa8wZmFlK7aIZOX32p7ZERcY3_A8yYvmRn0M2ZAgY7d92ZDE
Message-ID: <CAK6c68jBwykcWZm3ckm3nwab-X9Are4rD-eauE4rXA2+XvuX1w@mail.gmail.com>
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
Content-Type: multipart/alternative; boundary="0000000000003136b206410086f8"
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

--0000000000003136b206410086f8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2025=E5=B9=
=B410=E6=9C=882=E6=97=A5=E5=91=A8=E5=9B=9B 10:04=E5=86=99=E9=81=93=EF=BC=9A
>On Wed, Oct 01, 2025 at 09:59:13PM +0800, Junjie Cao wrote:
>> From: Jun Nie <jun.nie@linaro.org>
>>
>> Some panels support multiple slice to be sent in a single DSC packet. An=
d
>> this feature is a must for specific panels, such as JDI LPM026M648C. Add
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

--0000000000003136b206410086f8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&gt;Dmitry Baryshkov &lt;<a href=3D"mailto:dmitry.baryshko=
v@oss.qualcomm.com">dmitry.baryshkov@oss.qualcomm.com</a>&gt; =E4=BA=8E2025=
=E5=B9=B410=E6=9C=882=E6=97=A5=E5=91=A8=E5=9B=9B 10:04=E5=86=99=E9=81=93=EF=
=BC=9A<br>&gt;On Wed, Oct 01, 2025 at 09:59:13PM +0800, Junjie Cao wrote:<b=
r>&gt;&gt; From: Jun Nie &lt;<a href=3D"mailto:jun.nie@linaro.org">jun.nie@=
linaro.org</a>&gt;<br>&gt;&gt;<br>&gt;&gt; Some panels support multiple sli=
ce to be sent in a single DSC packet. And<br>&gt;&gt; this feature is a mus=
t for specific panels, such as JDI LPM026M648C. Add a<br>&gt;&gt; dsc_slice=
_per_pkt member into struct mipi_dsi_device and support the<br>&gt;&gt; fea=
ture in msm mdss driver.<br>&gt;&gt;<br>&gt;&gt; Co-developed-by: Jonathan =
Marek &lt;<a href=3D"mailto:jonathan@marek.ca">jonathan@marek.ca</a>&gt;<br=
>&gt;&gt; Signed-off-by: Jonathan Marek &lt;<a href=3D"mailto:jonathan@mare=
k.ca">jonathan@marek.ca</a>&gt;<br>&gt;&gt; Signed-off-by: Jun Nie &lt;<a h=
ref=3D"mailto:jun.nie@linaro.org">jun.nie@linaro.org</a>&gt;<br>&gt;&gt; Si=
gned-off-by: Junjie Cao &lt;<a href=3D"mailto:caojunjie650@gmail.com">caoju=
njie650@gmail.com</a>&gt;<br>&gt;&gt; ---<br>&gt;&gt; =C2=A0drivers/gpu/drm=
/msm/dsi/dsi_host.c | 25 ++++++++++---------------<br>&gt;&gt; =C2=A0includ=
e/drm/drm_mipi_dsi.h =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A02 ++<br>&gt;&gt; =
=C2=A02 files changed, 12 insertions(+), 15 deletions(-)<br>&gt;<br>&gt;Ple=
ase extract the generic part, so that it can be merged through a<br>&gt;gen=
eric tree.<br>&gt;<br><br>Sorry, I don&#39;t get it.=C2=A0 The generic part=
, generic tree? Do you mean<br>the drm tree? `slice_per_pkt &gt;=3D 2` is s=
een on the panels of these<br>tablets that are equipped with qcom chips. I =
don&#39;t know if these<br>panels are used on other platforms, and if it is=
 necessary to do it<br>in drm.<br><br>&gt;-- <br>&gt;With best wishes<br>&g=
t;Dmitry <br><br>Regards,<br>Junjie</div>

--0000000000003136b206410086f8--
