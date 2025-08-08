Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 742D9B1F0A8
	for <lists+dri-devel@lfdr.de>; Sat,  9 Aug 2025 00:28:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F11110E067;
	Fri,  8 Aug 2025 22:28:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gliL782Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 875E610E067
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Aug 2025 22:28:36 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-3b78bca0890so1248562f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Aug 2025 15:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754692115; x=1755296915; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bk4Z92vldvgPQRm+g46xxvwEKtrsTK5zc7BqRXD51dg=;
 b=gliL782QZONljR5z2BlhWstK4oPL8aVd652pzy+L5ePHLzs7aEe/ttrJMcRS0RnZnM
 IaD7Am9hlnBw1KxONFBecph1yANJ1CZf+SSSpC1SFPZqAQ8Jraj7Vdb35hcEIVYKninY
 7rjrw0QaGPoV5HPdoQdfyXcz0ShVuKClTJKtRgjXTUp5vQ7bwBpqKh8OO60Fv1ToK8Js
 tyabgQNFuLM+TUmTJi7LPjRzYFcxZ/gOxUMa2yp9uG2CamKS4yvy0wb0G5Se5AXYS5S9
 RGPD9i+0oj4m+KRyw8pHoH9C5m02ofPZ6xG1qLTJbxFKR+/BUe4Ki7cpBvvtWvD3rTct
 UGbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754692115; x=1755296915;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bk4Z92vldvgPQRm+g46xxvwEKtrsTK5zc7BqRXD51dg=;
 b=QILQpPaqmS6vh4QUiOtLfYLMEl87QWfuuXvFJQAUEMS7nLrjjJiaCyExQU09Fi74PK
 2KnzN/lBeRQvucqXdD30TuB2A2EhSpUzbQO9zxT5j978Y4z2XFkgBEtHi4I/LTU0wGCB
 O0bkNU1+7H1Z8/8/p8iibbIfYtqNu47PotTDLRbDkhmv1kaDfP8J6KqXiJmBq3SNKiDh
 ZzXnnCN1/X6sSFu6yM1dy5D5VP4Vznj4QplWo4vxHhUkoVgze1xCVmoUNinLguCO6f+/
 qN83hwhjkTedn3q4BMaQBYqlPA95mofryaGOVsWfpVjFkyugo/VsXwth9FJErEmAaujt
 7ahg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUimLB6Z4a5LTSfviHIF7OLazd3wSbvV+3PGt8LskfTdvkOU1m2WYxA9uHsOYUMLYd5bw/lv7OGGzk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw0DGK1gxQoaYsvqFMiSWvE++DEN5u/NICPpoZ+PWLz4iRsKu33
 eDvcVEC2/4UzuAgLiD2+V1YStLs+EEmpHg2xNcR/GScInRiBlh+uJUPAi7oDZQip2XqP9XIbZCY
 4upSRP5eic/9jeZggEe2VgEvacG3NwGyzgoIU4Y78fg==
X-Gm-Gg: ASbGncsryHDmguR/sL/jshwF6cQDieqhjggfZHl/2sjWmoAc98k9/sr3ilKlbIIFTWA
 0OKOhcknkwUfFdddCr4YGQCSrCfzKPQRXvS3c9LWPruFvDPy42fLFo6iei1/sCszlIJjHqqOl6A
 8DX1jM4I8l3HSvFmZuDLq+RKmPzU/mIvEpAZXNpPYkVB7WITNwj7rwaQVGTqum3JyJ7W9Rk9LPm
 BXwyvRWnw==
X-Google-Smtp-Source: AGHT+IGy+JfWioN1EZvauRq8fNVKD77kq7pV11eEmcSqXqQw+Ty2x4MuKZfeT7+cYgy3zueauhd1kIbBdcArMua29PY=
X-Received: by 2002:a05:6000:2f85:b0:3b7:8d70:e0ad with SMTP id
 ffacd0b85a97d-3b900b4d8c1mr3401099f8f.32.1754692114271; Fri, 08 Aug 2025
 15:28:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250731-wip-obbardc-qcom-t14s-oled-panel-v6-0-4782074104d1@linaro.org>
 <20250731-wip-obbardc-qcom-t14s-oled-panel-v6-1-4782074104d1@linaro.org>
 <aJCyBbwNjZvTHnjT@hovoldconsulting.com>
In-Reply-To: <aJCyBbwNjZvTHnjT@hovoldconsulting.com>
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Fri, 8 Aug 2025 23:28:23 +0100
X-Gm-Features: Ac12FXwR4FUrET6jv0_EOtK5Bc-B0SWbGu_iG6JN5BJKVMzOvOl3cxeCMpqOk-Q
Message-ID: <CACr-zFCq08Pu2=eLfe5=sYdGWEHmy7w+=Eo++9AjP96uCLCNcQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] arm64: dts: qcom: x1e78100-t14s: add hpd gpio to
 dp controller
To: Johan Hovold <johan@kernel.org>
Cc: Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Rui Miguel Silva <rui.silva@linaro.org>, Abel Vesa <abel.vesa@linaro.org>,
 devicetree@vger.kernel.org
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

Hi Johan,


On Mon, 4 Aug 2025 at 14:13, Johan Hovold <johan@kernel.org> wrote:
>
> On Thu, Jul 31, 2025 at 09:51:26PM +0100, Christopher Obbard wrote:
> > The eDP controller has an HPD GPIO. Describe it in the device tree
> > for the generic T14s model, as the HPD GPIO is used in both the
> > OLED and LCD models which inherit this device tree.
>
> > @@ -5779,6 +5779,11 @@ tlmm: pinctrl@f100000 {
> >                       gpio-ranges = <&tlmm 0 0 239>;
> >                       wakeup-parent = <&pdc>;
> >
> > +                     edp_hpd_active: edp-hpd-active-state {
>
> The node name and label needs an index as this SoC has two edp hpd pins
> as I already pointed out.

Sure. After looking at the schematics this should be called
edp0_hpd_active. I will fix this in the next revision.


> > +                             pins = "gpio119";
> > +                             function = "edp0_hot";
>
> And you also need to configure the bias somewhere as you should not rely
> on the firmware having configured things for you (as I also pointed out
> before).
>
> On my T14s the internal pull-up has been disabled.

I am still unsure of what else needs to be set here. Can you help me
with the correct settings?

Thanks,
Chris
