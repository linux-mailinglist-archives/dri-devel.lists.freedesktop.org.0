Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E274CC967
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 23:46:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 982BE10E396;
	Thu,  3 Mar 2022 22:46:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 946F710E3AA
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 22:46:44 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 g6-20020a9d6486000000b005acf9a0b644so5880806otl.12
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Mar 2022 14:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=lAmfMh3siUWAbgiKtdrl2arKgopAvWxLPSUY8pwP5vo=;
 b=HJhZCrhxO1Pyzl6t9wzDXnMPLJxc3cVtgvpSg8wZBkv23iDjLvHwLafhXztd8HFsmH
 MwzIOrj2PTcTDGurmzZolflvediekuyuBXl79QFwBlJmkEwv/P7RcX1HKtj3/1CNso9X
 YzK6BZNXHtfmv8lFtHrCzOGQ+MZsx4+erym4A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=lAmfMh3siUWAbgiKtdrl2arKgopAvWxLPSUY8pwP5vo=;
 b=KfkXtd22GBQ1VZeYjApWZqyHm3EGD3+VbT0C8YiXSfv2gutuyU/D5wFWF8ut0iHVPG
 jq4WOVeKMqfGDlIbIk2O3NUSThqQ7HJCCLzMJpfWeBODg8YNMw8hUw3bG2BoRZKdFV/M
 K2XZRyFpIxlObVRGNyNdKHYRPQ8m1nF9lX+hyVRq/qxJxISVeZZmnIg4GqUXfwBWY+W1
 kpT/Cx/PhTNzVNIGOlInH51zn4yX7afT991cPew94snIwSO7AF2xLeSMuzSfEqN0aaXc
 HEHHY3Gh1zTctTCjBkT7X72cW5Rpu9EkoQkWKMXq4TTjjB9x5dbYTEDLj27a0yeghw6K
 s1Cw==
X-Gm-Message-State: AOAM531xDcf3qXSYv5uFlWauBrUfbwmvn4O7WIVbsvaY083+4a+wrgaX
 9aPGSkZTAQGfIIyOsgsG/59ROnHkLb1k4H7o3/UpqA==
X-Google-Smtp-Source: ABdhPJyNXFY30iI47VZgSxdtBNCRROM2D9HdHXLCfN3psV7sKNSNt6F40TbtroAvxxc4HUpyiSwvWzkxOd2O9Ee80u8=
X-Received: by 2002:a9d:22e9:0:b0:5ac:1754:342c with SMTP id
 y96-20020a9d22e9000000b005ac1754342cmr20092863ota.159.1646347603888; Thu, 03
 Mar 2022 14:46:43 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Mar 2022 14:46:43 -0800
MIME-Version: 1.0
In-Reply-To: <1644009445-17320-1-git-send-email-quic_abhinavk@quicinc.com>
References: <1644009445-17320-1-git-send-email-quic_abhinavk@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 3 Mar 2022 14:46:43 -0800
Message-ID: <CAE-0n53-9+t4ruY9hykzZmP4LXZzvQLjRWRtmY=Ksm-BVaT78w@mail.gmail.com>
Subject: Re: [PATCH 00/12] Add writeback block support for DPU
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org
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
Cc: linux-arm-msm@vger.kernel.org, nganji@codeaurora.org, seanpaul@chromium.org,
 markyacoub@chromium.org, dmitry.baryshkov@linaro.org,
 quic_jesszhan@quicinc.com, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Abhinav Kumar (2022-02-04 13:17:13)
> This series adds support for writeback block on DPU. Writeback
> block is extremely useful to validate boards having no physical displays
> in addition to many other use-cases where we want to get the output
> of the display pipeline to examine whether issue is with the display
> pipeline or with the panel.

Is this series going to be resent?
