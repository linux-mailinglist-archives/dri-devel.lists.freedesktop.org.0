Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CCE78485A
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 19:22:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85B0A10E3B7;
	Tue, 22 Aug 2023 17:22:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1F5F10E3B7
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 17:22:15 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id
 3f1490d57ef6-d650a22abd7so4775672276.3
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 10:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692724935; x=1693329735;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Que2yIbRJrk/qAKPnu985gDCHaDuWM2c+IiMxTSOqFo=;
 b=iXf3z4PpDI16KmgLfqdzWF1xg8whrVf+mqjrNLmygLnJwi6YuRYvpVxzRrTBVuMIOf
 2/JRDNjZ/5hLV11p2A0Xj3oF2S6V3V+qZJikfyG9JhBiMNdm4jVM1YP56QbgTfx0n/XB
 a/O93HWoxixX6hzNKB10ghZU/McnvWF265/Qlj+RUTngsouCFk/e+5lzMxJSybtObVbJ
 lxFhbWg2R8ZwJ//d8PhmAi1b/vTGdF1C3jZV95AaAxg+UsgTepvW/tKR/KJIeMryJ+hS
 8dMhoo59ZNIEELkBnhkS5jO1vtzhmEDEbXDxygTCGKf1fX4qPJZnZM/fHf9Hs4GMexEW
 Dvug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692724935; x=1693329735;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Que2yIbRJrk/qAKPnu985gDCHaDuWM2c+IiMxTSOqFo=;
 b=f3hRKBEP0p/dq/YIfT59O2UyVcPLpcescPp+AYgbH0sBHqE8178afYxrSIyd8CKnpp
 36cuLfKbE2Oe3wA5nrmDIhE20g8OjmoXv1+eBGxdHz+qkD/syab++PZl3KUamdof3h7V
 Q9pkZjlZAmnnTtcLj+r5TpkKKlxSuoGzb/Kc3zkiI9xOOwhIr3Fe7NQT+OMw9Kiw7rzA
 0CabkbcXQmw0bOxjb3hHEasplKOmrzsJEINxq4XOMSjoov83s9EXHZCZFmaom3eKjRz6
 aaRGCS5EIdXjRBhBVM8Byv8r7eq7IaYbnXD0MzjOJxuC2qNG7PhB481CUoSAq74kWpcD
 AzCw==
X-Gm-Message-State: AOJu0YxW7PcJ8u/IEyTmB3LgvOOQFMuNSMm7bbMLViFNxs02JOSj+j4Z
 L1amKQu7A4s27FM+DUKyLh/wQ5iJ7uq+1YKDUvWVgQ==
X-Google-Smtp-Source: AGHT+IGl3KL+2s+dmYMMSJu5+XMxTurRENZU4VmX6zHmymyLIA+9IDxMCbHBbSaAqr/Q/s2izbtmiLqSIM5T8l0q6DI=
X-Received: by 2002:a25:f606:0:b0:c6f:b843:c502 with SMTP id
 t6-20020a25f606000000b00c6fb843c502mr11502039ybd.25.1692724934702; Tue, 22
 Aug 2023 10:22:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230808083243.3113192-1-Sandor.yu@nxp.com>
 <20230808083243.3113192-3-Sandor.yu@nxp.com>
 <c485b64e-3c83-4616-b8d8-76c2c7d56b0e@linaro.org> <ZOS+IQgFZYxN503B@matsya>
In-Reply-To: <ZOS+IQgFZYxN503B@matsya>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 22 Aug 2023 20:22:03 +0300
Message-ID: <CAA8EJpokkjw_Q36YMh4p6NR+r4JGgM7_b+_QXtbmcPr6GzA=ug@mail.gmail.com>
Subject: Re: [PATCH v8 2/7] phy: Add HDMI configuration options
To: Vinod Koul <vkoul@kernel.org>
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
Cc: andrzej.hajda@intel.com, sam@ravnborg.org, alexander.stein@ew.tq-group.com,
 dri-devel@lists.freedesktop.org, Laurent.pinchart@ideasonboard.com,
 krzysztof.kozlowski+dt@linaro.org, linux-phy@lists.infradead.org,
 Sandor Yu <Sandor.yu@nxp.com>, jernej.skrabec@gmail.com, linux-imx@nxp.com,
 devicetree@vger.kernel.org, kernel@pengutronix.de, jonas@kwiboo.se,
 s.hauer@pengutronix.de, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, oliver.brown@nxp.com,
 neil.armstrong@linaro.org, linux-kernel@vger.kernel.org, shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/08/2023 16:54, Vinod Koul wrote:
> On 17-08-23, 13:05, Dmitry Baryshkov wrote:
>> On 08/08/2023 11:32, Sandor Yu wrote:
>>> Allow HDMI PHYs to be configured through the generic
>>> functions through a custom structure added to the generic union.
>>>
>>> The parameters added here are based on HDMI PHY
>>> implementation practices.  The current set of parameters
>>> should cover the potential users.
>>>
>>> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
>>> ---
>>>    include/linux/phy/phy-hdmi.h | 24 ++++++++++++++++++++++++
>>>    include/linux/phy/phy.h      |  7 ++++++-
>>>    2 files changed, 30 insertions(+), 1 deletion(-)
>>>    create mode 100644 include/linux/phy/phy-hdmi.h
>>
>> I think this looks good now, thank you!
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> Should this go thru drm or phy...?

I'd say, PHY, together with the other PHY patches. If you can merge
them into an immutable branch, then it can also be merged into
drm-misc (?) to provide the dependency between drm and phy parts.


--
With best wishes
Dmitry
