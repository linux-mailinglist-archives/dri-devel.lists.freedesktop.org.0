Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D08A325D2
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 13:26:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0C0410E87C;
	Wed, 12 Feb 2025 12:26:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="AjHJnuv4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6636A10E87C
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 12:26:15 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-6f9625c0fccso60086457b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 04:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739363174; x=1739967974; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=46uMxi16ondgGccvYcEvXMpewkDX4CAYjnXalJ8+Fuk=;
 b=AjHJnuv4Mr8FB6/2LPdo27hS1TUquTrajlKzGfVzGbWow7NeOmGE2BAHS93u09rUN6
 45kuEWIJ5U3OeV+NYytpw3SuUeG9DuJu6yusDHNin6jU5M5J2VOElSn4K15IW3cuWnx0
 6uQBcKiLKxdyfNXkTBp6wo9kno1GOCpOn7ONI4C2U5RObNkvIOpycRW+sB0x/VGMNVjb
 j/JQl8IHc1i3Xj6B731IJ41fvZQCyoAPCSOe5/717pMyPXaStWuHoYVYYCRjN/qt3tUL
 EpYnvV8G4CuAfvZGArlETVi6ZJubgmKfj4vgF5eLfPf3crLWq5JPi0h9654Dqfx87AJ8
 kIyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739363174; x=1739967974;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=46uMxi16ondgGccvYcEvXMpewkDX4CAYjnXalJ8+Fuk=;
 b=rP/U20jqiQ+oZNUn9S1rBchbyR5qdCtSy7qA+OtdpcB8jfrawyFoIKVfrfSXtLcLeU
 Xlcq38BTu23FWFSUv6BUBKSxuY0gIzy/iwnBtdNW/kqSv4TRlRzAx94eMTEXfZZrbfPG
 BG+GN1W1DVQuBotmS3S6xZIdLebLY2GFKkYKpxyWWeOFio9lW1zs6ip5lLf2PvA/PbU9
 eM1avbijkjZWuwPleYYI1E1G6e32KyhWhizuFn03oI9YSYrVkB0r2aGvbH6KBFkYFicS
 rMsI/YOab2P9cFQDHe5toheM6BXKydxeYVTU2j3Z1ccx+1hA0EZ2ooydtuLHj+xWvDmH
 kYrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkWwa3ObaBajOnRobPELtQlj8YQep4TZYkuqwFAfbqJw4H/8o5rS9FVW9eIKwmszEoQmkZmohl2mI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyW6zmLiFgPcpQLYOhOh2dzdZ+3Fdf5BtBpcAhnCCm4o0YzGh5K
 EjtKyVM4I4les6XGD9gcRDb94G5ojhJpDJvyKfSe5NU4KcRngyfiLbr0vk1oqhcZGZ/5GNq9ODZ
 k3CkQ5dPjqf2W4neJ5y5F8TXUzCMZFlsPPzEKNA==
X-Gm-Gg: ASbGnctQ8OJNXJngl0c/wLxuUAFV+QtwRAqq+vkg2AP+i+fmUm6cYvm2TpBXS6/onJy
 5IWfplz771WHv5UR6Kt2Hg5X1cbQ7V8rRx3SnrjjFXtIosxK+WS/7397oZRgdUFSDt/r4iL5IOr
 qZlYghqMeOtAUQ477kSyCLGJ0XMdEs
X-Google-Smtp-Source: AGHT+IFO8HryvH361AtBzukKXHNwFD8iGdVHudVfUR5kStssIhbXkwBCk3h98SYdV45gucw51GK8rpDo/H/XBl0oEtA=
X-Received: by 2002:a05:690c:3687:b0:6f9:50ed:e6eb with SMTP id
 00721157ae682-6fb1f27c541mr33742567b3.27.1739363174466; Wed, 12 Feb 2025
 04:26:14 -0800 (PST)
MIME-Version: 1.0
References: <20250212-mst_qcs8300-v1-0-38a8aa08394b@quicinc.com>
 <20250212-mst_qcs8300-v1-1-38a8aa08394b@quicinc.com>
 <wyd7i47pkafa7n2yjohuvlh4btasxle4rw5xm55h4bhv24yvah@pfo224xz4xfl>
 <b4008932-ce56-4cc0-9b53-2253051514da@kernel.org>
In-Reply-To: <b4008932-ce56-4cc0-9b53-2253051514da@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 12 Feb 2025 14:26:02 +0200
X-Gm-Features: AWEUYZlVhAIT2AG6Qef-78nrtu6QQCvgOuZCQwLtZcDIi0z3rm5hNqs2iPwtYUM
Message-ID: <CAA8EJpoowyKcwDQgbWy4xGHzngNQOcWt_z_Xc49GFB1qYjYO6A@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: display/msm: Redocument the
 dp-controller for QCS8300
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Yongxing Mou <quic_yongmou@quicinc.com>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Wed, 12 Feb 2025 at 12:54, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 12/02/2025 11:41, Dmitry Baryshkov wrote:
> > On Wed, Feb 12, 2025 at 03:12:24PM +0800, Yongxing Mou wrote:
> >> We need to enable mst for qcs8300, dp0 controller will support 2 streams
> >> output. So not reuse sm8650 dp controller driver and will add a new driver
> >> patch for qcs8300 mst feature. Modify the corresponding dt-bingding file
> >> to compatible with the qcs8300-dp.
> >
> > NAK for a different reason: QCS8300 is still compatible with SM8650.
> > Enable features instead of randomly reshuffle compats. In this case,
> > enable MST for both architectures.
> >
> So the original patch was probably correct...

I have no idea. I'd let Yongxing Mou to comment on this. It would be
nice  instead of getting a lengthy explanation of obvious items to get
an answer to an actual question: is QCS8300 compatible with SM8650 or
not. In other words whether they can support the same number of MST
streams on each controller or not.

-- 
With best wishes
Dmitry
