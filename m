Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 424DB59CEEE
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 05:00:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67A1596F11;
	Tue, 23 Aug 2022 03:00:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ECFF92A64
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 03:00:16 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-10cf9f5b500so15302466fac.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 20:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc;
 bh=bjV5e2UkotDtwOzVATF34/U7fC7PX6CJAnehb3qpJfY=;
 b=bHx2Z/grCVb0PTuIK5PvVrWSZQOTpvcU4vPeAw8uHdD1AZWhLrGeaENHl9cLaIZyDp
 YXe6AqegtoZLhKtNGxcWGVzvT32gU8doei9PfA2REcjXeOIAdxSBTDO7e+tIbAA5c2EM
 4Wsxcoh9wYt2FJ62xjiIsrvsIHK4478WkvRFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc;
 bh=bjV5e2UkotDtwOzVATF34/U7fC7PX6CJAnehb3qpJfY=;
 b=o+0Q9/ys9Xf+1Xkr67D9LEK6fhjr3qY/tPZ6SwQN7FYFh5qsdxD26qtsdS9QqOuXTV
 BeyGXpg5R0IloMOSwo2UiioUSaWUy2kR/qGtYb4+hb5K9xmS1nrbcjOBjhusY3gwl59K
 0SwBImTPLgzYqOB327BSaeW/EtRBWE9m6ZfEqB5eczaHndo2KE398WNUsVRa90xC1iTE
 odB2mNAL/RTP2FslTFuTVXpmD2pBtbAlrSCqy345+nliOvZNBTJs/dwrLwVXrwCqXumZ
 c0J9V//ACiDJDI7DYCNyaLLEinyINua1ez/bGpd/D1+n77v4mOUi6N3Wo2YN3tuUw/MU
 bCCA==
X-Gm-Message-State: ACgBeo2hDt8u9q37Du1UgTj+SJQ9Vo6OazUYEKtsCLCClG3n1AJAgqKE
 Cz9n0RbKJVcHH431lL6n7uFVyaXAIYvw7uNo3g5Jeg==
X-Google-Smtp-Source: AA6agR6NuFJEoswZf0ydPYca5vlPJobYmiK3bvyMD5ngQqSkejjppZMeHrTnKI0kG94UUhEVO6QDseyu/ixpu/5VVqM=
X-Received: by 2002:a05:6870:e408:b0:11c:37ad:773a with SMTP id
 n8-20020a056870e40800b0011c37ad773amr555285oag.44.1661223615728; Mon, 22 Aug
 2022 20:00:15 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 22 Aug 2022 22:00:15 -0500
MIME-Version: 1.0
In-Reply-To: <20220822184900.307160-4-dmitry.baryshkov@linaro.org>
References: <20220822184900.307160-1-dmitry.baryshkov@linaro.org>
 <20220822184900.307160-4-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 22 Aug 2022 22:00:15 -0500
Message-ID: <CAE-0n51CNfAa1oRL4R1csdM6Q9nbAOX8UT14AOA33ZDZ-WmP+w@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] dt-bindings: msm/dp: handle DP vs eDP difference
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

Quoting Dmitry Baryshkov (2022-08-22 11:49:00)
> The #sound-dai-cells property should be used only for DP controllers. It
> doesn't make sense for eDP, there is no support for audio output. The
> aux-bus should not be used for DP controllers. Also p1 MMIO region
> should be used only for DP controllers.
>
> Take care of these differences.
>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
