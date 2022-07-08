Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BF656AFD0
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 03:37:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A30A112536;
	Fri,  8 Jul 2022 01:36:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B7C3112536
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 01:36:00 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id
 by10-20020a056830608a00b0061c1ac80e1dso2192057otb.13
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jul 2022 18:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=NpN+oxcYp29c2mO0RL7bthtMEv81FAHmMW8Fv8F+Pyc=;
 b=iWl5UTV4BCL2ICWhQCz2OOigRh3v7wY1W8Fo7FiMGGBTj82rY7DdUTOXNCbMbdmr3e
 fEhHCAyaY7bD+shdmy/Av0dp0/0gcvn1VUZGihTb3Boe0eJQy9sOGQDtViPvgDqEVbSD
 BxbmWrcRSs83U5+lVau7kyba5MQQLRSk0IPoU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=NpN+oxcYp29c2mO0RL7bthtMEv81FAHmMW8Fv8F+Pyc=;
 b=YFQYg0B8SVVILRvuVjpsV47UtFFwpzGZN0VSLdrA54+7PiFv/flDgew+Oeb7Nx3quI
 rcJr9Cffxk7dUg6ap8OobEKsaeqg1XbNn/jPc9jwaPdwywEGQet10eZTS18N1tfodwsp
 C2mSnmEjWzojqNxf0npa3X5CjwU/k6odLxDhPNFIIPdgTdyW7baY4LGgTJU1FhnIGkxs
 BK8hvrAos6Rnjwpe60i+URdyYfFwDmmQNNlkV1LFzbObLNlIC4vDwG+qEdbDH5puuC2Y
 NsZCUIINvQjeqz7YjWhJjH4WxZgnn2ok/QXP/wSQ8eIWFB+W3F4DuDWqa1O+ieFTwUoq
 adqg==
X-Gm-Message-State: AJIora8IN86w+Qz4VOe5Azu5vksvtDDSWE77bNnQ83i4TIU8iRPK4mDG
 QiMSUQ8xFoOlBlDb6dzvuZKS7vr9DBNzyVIjNGCQJA==
X-Google-Smtp-Source: AGRyM1s5Z2KtVB89iVu23mBhAyGc7cfqJu2d7j28UxYQ5Kp5MhNC59CD9LiVgGmf7x8MOavnVj4gY38gxJKBcHQjIZ0=
X-Received: by 2002:a05:6830:d81:b0:616:c424:6f22 with SMTP id
 bv1-20020a0568300d8100b00616c4246f22mr490761otb.77.1657244099764; Thu, 07 Jul
 2022 18:34:59 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 7 Jul 2022 18:34:59 -0700
MIME-Version: 1.0
In-Reply-To: <20220707213204.2605816-10-dmitry.baryshkov@linaro.org>
References: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org>
 <20220707213204.2605816-10-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 7 Jul 2022 18:34:59 -0700
Message-ID: <CAE-0n50UePL5x8vJtymaY=i-Eo1PWUxMyLv+DPgY890KpBWaDg@mail.gmail.com>
Subject: Re: [PATCH 9/9] arm64: dts: qcom: sc7280: drop address/size-cells
 from eDP node
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

Quoting Dmitry Baryshkov (2022-07-07 14:32:04)
> Drop #address/#size-cells from eDP device node. For eDP the panels are
> not described directly under the controller node. They are either
> present under aux-bus child node, or they are declared separately (e.g.
> in a /soc node).
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
