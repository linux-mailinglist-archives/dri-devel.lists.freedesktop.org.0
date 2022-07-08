Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F1556AFC2
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 03:31:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE9E510E6AC;
	Fri,  8 Jul 2022 01:30:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92ED110E6AC
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 01:30:53 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id be10so25408171oib.7
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jul 2022 18:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=PpvA7vQA+z5udKCHSpv+s9htl2aBC/iRxeWyaMCuGEU=;
 b=mPZbe8dmikNK7UvVbyxLe30aFtXeZfHb2mwKSxi7WHI0ELKEgTN0v0ScL6BkIwehW8
 wCWNKgYNusYXoK29wKcexwFVvLFlVIo5QxyBPwIms0NpFFihQyvPzAab05XAVl/5g0Qx
 KQwxzGXZubTTVlNLDIOZblaTDoM8m7okKqsdw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=PpvA7vQA+z5udKCHSpv+s9htl2aBC/iRxeWyaMCuGEU=;
 b=yzb6XXY+rwDmXOVi1yST0Kd7B4CZ1MBzDkoCrbHCIAmebtrcFKvses/kuSyKiTEv2R
 HmWOOx+tRylaan6JVscvyMO7c6h+F+rq+HlIFBuLU7UeVtB8A1yfCCFg8nD2PXf2KOm6
 cQhhblSfYuY5QkE1kDyRr74u/cJQm5Qse1G9yrQJVdlovI4rB+O7tiVyRoBP3S/GrBz/
 cPTu5/12jjBUYhTyAeKAiWhiV3piwGDYUw2mh+37o262p2ruNhIJQg3sh3eiD76nskkW
 3kWN77ET4fRb+KUtho72SdVwGZQ8KwgrRwhQcrbi7Aj2iTm8Ylc7RMFhF8ij8Bq0e1Cv
 FcUQ==
X-Gm-Message-State: AJIora/c3ukqfdvNbvH5NZ/VEkIYxdQ/fEotglJlLqY4MsL4AZbcc4Mq
 lBCeOTlAllxvGoPPYby5jA3CqcBW229P0aDxtQk+Mw==
X-Google-Smtp-Source: AGRyM1sG9aigMbjMOM2ftKDyZpg/JcbL4BqzsFm0snHRfp+ujnNkRfj/Vrv6x4lsFZLIELBbixkV9cqrKRK4Hvo8zQI=
X-Received: by 2002:a05:6808:e87:b0:32e:4789:d2c with SMTP id
 k7-20020a0568080e8700b0032e47890d2cmr459094oil.193.1657243792902; Thu, 07 Jul
 2022 18:29:52 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 7 Jul 2022 18:29:52 -0700
MIME-Version: 1.0
In-Reply-To: <20220707213204.2605816-3-dmitry.baryshkov@linaro.org>
References: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org>
 <20220707213204.2605816-3-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 7 Jul 2022 18:29:52 -0700
Message-ID: <CAE-0n519u3S0WK-712aM-2zhZXrRvr7gh9aDSvRfMtkh-f4eUQ@mail.gmail.com>
Subject: Re: [PATCH 2/9] dt-bindings: msm/dp: bring back support for legacy DP
 reg property
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Clark <robdclark@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-07-07 14:31:57)
> The commit 687825c402f1 ("dt-bindings: msm/dp: Change reg definition")
> changed reg property to list separate register blocks, which broke
> validation of DT files using single register block. Restore
> compatibility with older (single register block) DT files by declaring
> it as a deprecated alternative.

I think the intention was to quickly migrate the dts files to the
multiple register regions. Why not just do that and drop this
deprecation binding update?
