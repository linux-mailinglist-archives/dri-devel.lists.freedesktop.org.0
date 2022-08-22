Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8878759CB7D
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 00:31:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9707291A24;
	Mon, 22 Aug 2022 22:31:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 505B618A1C9
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 22:31:11 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 m21-20020a9d6ad5000000b00638df677850so8676712otq.5
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 15:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc;
 bh=Uze3mrVtxDFOcmt/i3yDaS8brRCL06O+UHridDKP8uo=;
 b=ZKpYpsYM/o2jCq4rm/aUeXUa93Rb0CMhl5VbaCfX6JMtiO3ennKIUovhafoX45YR9l
 i3Tep+H3h7UvRRZ4u6KuS+r3OCLFJjf2mIeEoenknI403RvbYjGG/kcs2lW5Mlp7iMu0
 9tbEi1zXfALiNre8cHiCTtHyOo/AReyfMAIWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc;
 bh=Uze3mrVtxDFOcmt/i3yDaS8brRCL06O+UHridDKP8uo=;
 b=4yt/g/6J7Fgok4PqJeqNXVlkTu49isxkIoyYe5FJkgMqCJHbZa02afgERM7htGFXrG
 4fuSlupFM46qYp0dIEmpYYpAHUS1ndbRfWMWcd5ahDqS96YyayWNsofvabqY3JfNCOOo
 q4pv8O3wClDZmnmhfMSsEB3mgqtDGrBDGXxwuqocjgZK2ectCX+Git7w0lRnFhE4iKD9
 o0YYp9vaBRfFeIcMuJnWBHcVdpUKFFMV617jdLxYt3SgtVDADJ10Zy+MtYHkKRU3jxp9
 7D1tSvcAOOvmouJNgZw65EUQw6Ues+eMGVFJk+iHc1+6PIJ+fCWdjiKK2UGOhwsKehvp
 3F2w==
X-Gm-Message-State: ACgBeo0xM/tKKKhBrmln1PjrPE8b3NS24+rv46Oq0OZ6Ae3NXO+1kdyO
 qSeSY6JuaZ9Rqz4Zpl1v0Lyyc9i8/v7CEqGXGQB19A==
X-Google-Smtp-Source: AA6agR5yVAK+oIZ1GWb2i1iV3WJcnW9FOaXtzHjX2k5tPGFm581PTcReO2HhFtk6zsZQzHNkTiKAHHtDQDlSEEXMb0o=
X-Received: by 2002:a9d:53cb:0:b0:637:1ddc:615c with SMTP id
 i11-20020a9d53cb000000b006371ddc615cmr8858507oth.3.1661207470142; Mon, 22 Aug
 2022 15:31:10 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 22 Aug 2022 17:31:09 -0500
MIME-Version: 1.0
In-Reply-To: <20220710084133.30976-7-dmitry.baryshkov@linaro.org>
References: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
 <20220710084133.30976-7-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 22 Aug 2022 17:31:09 -0500
Message-ID: <CAE-0n53rQ-_3wgH-QDyVnMhja2LW0_2nLUdy==6wQOTP9VA36g@mail.gmail.com>
Subject: Re: [PATCH v2 6/9] arm64: dts: qcom: sc7280: drop unused clocks from
 eDP node
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
 Kuogee Hsieh <quic_khsieh@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-07-10 01:41:30)
> The eDP node includes two clocks which are used by the eDP PHY rather
> than eDP controller itself. Drop these clocks to remove extra difference
> between eDP and DP controllers.
>
> Suggested-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
