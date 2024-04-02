Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37197894C8A
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 09:23:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9241010F3B3;
	Tue,  2 Apr 2024 07:23:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XD3d6TYa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08D7D10F3AF
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 07:23:34 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-dccb1421bdeso4192200276.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Apr 2024 00:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712042614; x=1712647414; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TabQ2YZKZbkFzivtnWN/s3P657uIJJTcK5H1sTgsFt8=;
 b=XD3d6TYaGia/pfEWTTIoQl/z94ESnMpgIo4hrhv9Gy9z5Lngi9plcBXc3/S0JTO7Fq
 sTho4YOnqVoGQidMvBXrX9w0PLoQQ34XGJQCeSJGUIPTU9D86z5CAjwChZ6BBcmzIvpy
 529tENKPOXU5dv652UvbBIrQ9xKbidnQkINOm6mEnfxq0KyakX5kXDV7BZ5ZYXWLUH/l
 y0Wi6ar4KQtGjZqEDLcFh/ALBehU75WEwOUht4HTJAxZuZ9Aukn3RP5KqDI539VY2hIL
 wIOEyJXvicSioKPjKme0xVAIxCQT5VQwtc7tFBScI9NZpk6PUzoiXakIibrevp17V0iE
 byXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712042614; x=1712647414;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TabQ2YZKZbkFzivtnWN/s3P657uIJJTcK5H1sTgsFt8=;
 b=j5jcNoaNj2W2klOtxhJ8v/M1UPGrX971SzbvSqAzA9VWTHQiiXyuE/lO44lj5tqVLv
 pbEu/ADSgqDpRlnFCTuRcAH0kxZvm85IPFabX9Abhb8gkFT9+WCewnNL3/8ILHo6LRoz
 gJIJ2OgABZapTUGwfPSXGb66sWzXTkt6zQHgmfESGYhMe3BcigtYh1wEIlK4osk19SOd
 0EpFfIEeEq8YYpIEbQu7w47ulw9gSTfHa8OuJxVxZo2W9l+ZydSpGU3zQ6tRXW5nCzOi
 h8XAdF68mMXKmftTzuQooZAjtL38CydQM6kFAGbTYWLvwYCgj15ywjsKImWZopkbfWK5
 LVdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCccRfr8PtrRbTFw37ug+XgOS6SyMevuKN0X9OqFVZSO7YR8ZgQlc6JDzBFJDN7GsiQITaFs55YBNK6bwSjGfHP4nvTn4f1ORGFCwCVWdr
X-Gm-Message-State: AOJu0Yxcd0faF8nzM36XSZUQ3cdb1fYfzsR8nOXMYpJBLTJ/munVXMrI
 BFZi+eBWBrkqIrtWJsoZk2KhzXUUjdu9TmMBSU5ZbT/RbhSXYb/CMjBM1XvCc0nbskVR6hvbYlP
 nTGXzL+7OPeR0+IznWUcaIqY77T7GHrlAgndSSg==
X-Google-Smtp-Source: AGHT+IFD86Uoe4DkZqNoswdbUsX4qLvBWlBIGcubcGElg6SvFLOP7pWe31TeIM97fq3YF8cj6wVYaY2qIVBhr6NNOiw=
X-Received: by 2002:a25:ab87:0:b0:dd0:c2a:26f9 with SMTP id
 v7-20020a25ab87000000b00dd00c2a26f9mr9419434ybi.27.1712042613940; Tue, 02 Apr
 2024 00:23:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240402-lg-sw43408-panel-v3-0-144f17a11a56@linaro.org>
 <20240402-lg-sw43408-panel-v3-1-144f17a11a56@linaro.org>
 <9fbb9058-ccfe-436d-b413-b3ba27e4e5f9@linaro.org>
In-Reply-To: <9fbb9058-ccfe-436d-b413-b3ba27e4e5f9@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 2 Apr 2024 10:23:22 +0300
Message-ID: <CAA8EJprwWd=ZtwnpTm3cVP8RBEqxCcSGyBu-bHj=iV=+X2=FyQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: panel: Add LG SW43408 MIPI-DSI panel
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Vinod Koul <vkoul@kernel.org>, Caleb Connolly <caleb@connolly.tech>
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

On Tue, 2 Apr 2024 at 09:31, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 02/04/2024 01:51, Dmitry Baryshkov wrote:
> > From: Sumit Semwal <sumit.semwal@linaro.org>
> >
> > LG SW43408 is 1080x2160, 4-lane MIPI-DSI panel present on Google Pixel 3
> > phones.
> >
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
> > [caleb: convert to yaml]
> > Signed-off-by: Caleb Connolly <caleb@connolly.tech>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
>
> Tags missing.
>
> `b4 trailers -u`

Excuse me, I keep on forgetting it.

-- 
With best wishes
Dmitry
