Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F0C9C6F0B
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2024 13:28:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3DBA10E095;
	Wed, 13 Nov 2024 12:27:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="j8V9y4C2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEC1C10E6E8
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2024 12:27:57 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-e28fe07e97dso6883012276.3
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2024 04:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731500877; x=1732105677; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KImKDqWq4s21FhX0T9TYJY9R8T8zry6WhOX4TLZUuNk=;
 b=j8V9y4C2/dQ3Lyh9KbTsMlE+FGzSSyeOcfGHYcoxWzqhz4LCgHLyv8WUhH+zvlQkyP
 hGNx9gGI1aQiOn8INIIpCsh09y6dQlW6pi0T4U4CSYETVuTeFidadmQjGKKftaSbKu7B
 9ffIYvb3tQmyy2fpqhI51EXCmMLwgF0GzbqAIFTiKyAvxaIKiuxKPmCwsmd9XnsshtBA
 kxz08U8ax056Q7RpbWW810BVffLaP+GhF5OWTLXX53cj6m7SPNNBGogfbmcWzoI3oGHb
 An0J9XPTzIml7rs6XP+GCLsIpcvrRv0OJX2N6JvwPN8KlDKlRjDefffLwPvQwv0mZVHH
 KVwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731500877; x=1732105677;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KImKDqWq4s21FhX0T9TYJY9R8T8zry6WhOX4TLZUuNk=;
 b=I9aj6XGr4l1nW5AbGknXTc0RDH0nWky5cTdWSTGYKSEgwqxndJINOAjodPyg+pmevw
 OJzcCaiwifwCExA5Mqer3KOdIBZaENZh7ST3CH38Kivln68nPgpTqc71TvY4r8qKSCZl
 Pzupgrm0n44qeZnIiFoNrkg21/Q5X3T7f+LYpjla1OrCtqfMF+jDoIZDP0+if34TYyhk
 z50bulvKugCR5xQHtOOupbZIAVGIn7cZJ/TcdSSQBOIl2dPmHR5ex+04cggLF6yXCfp5
 UTGgn/S4zoJYsj4HjfgGRRVLL5EWPMsXv1sp9hjBwUAxysoLqEExMsjZvQIlBsFV2lsD
 +8HA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsgUWfYqmglbDZGOEkfSsxrfKFmRtKgXzl/9fY40D8lg7LJ8HP7lWi5MNxcyRVBXO8HGW75QeVsis=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxYVUCHKlLMQZ3IRQLgCsFA0MpJ09pQ3ur/qPDCejcMjD5Z44X7
 UAH5hNbMCaVVzJzSuZSmS7+Cl+AvN7azcHpq2GAa4m/T90or8TfDBC9Xr5yxyU3oxuMlu57iYiU
 b/I2xTjJ6vZGz8fAwWr8L0MdYKX73tx+yNmjnqg==
X-Google-Smtp-Source: AGHT+IHaAWOdAgML2ba4DzOA4z4U2wezC3VkawX20A2dPxMskv1IqJdFG+uwKU9K7bhxa9QyXticQbkM331fssKDcLk=
X-Received: by 2002:a05:690c:30b:b0:6e3:16da:e74 with SMTP id
 00721157ae682-6eaddd9418emr194176117b3.16.1731500876873; Wed, 13 Nov 2024
 04:27:56 -0800 (PST)
MIME-Version: 1.0
References: <20241113-add-display-support-for-qcs615-platform-v2-0-2873eb6fb869@quicinc.com>
 <20241113-add-display-support-for-qcs615-platform-v2-8-2873eb6fb869@quicinc.com>
In-Reply-To: <20241113-add-display-support-for-qcs615-platform-v2-8-2873eb6fb869@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 13 Nov 2024 14:27:45 +0200
Message-ID: <CAA8EJprBxL0KuOm4f1peRCw9Y=bzXo=Vt-QEv37RzJ62zJriNw@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] arm64: dts: qcom: Add display support for QCS615
 RIDE board
To: Fange Zhang <quic_fangez@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Li Liu <quic_lliu6@quicinc.com>, 
 Xiangxu Yin <quic_xiangxuy@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 13 Nov 2024 at 13:53, Fange Zhang <quic_fangez@quicinc.com> wrote:
>
> From: Li Liu <quic_lliu6@quicinc.com>
>
> Add display MDSS and DSI configuration for QCS615.
> QCS615 has a DP port, and DP support will be added in a later patch.
>
> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts | 109 +++++++++++++++++++++++++++++++
>  1 file changed, 109 insertions(+)


This patch has even more feedback that was ignored at v1. Please go to
the v1 discussion, respond to _all_ the items, so that we can actually
see what got ignored and why. Usually I don't require this (we can all
make a mistake and miss an item or two), but with this patchset the
number of the comments that were ignored is extremely high.

-- 
With best wishes
Dmitry
