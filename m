Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A29E6663B07
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 09:29:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF48610E560;
	Tue, 10 Jan 2023 08:29:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0E6510E096;
 Mon,  9 Jan 2023 23:16:31 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id y25so15529176lfa.9;
 Mon, 09 Jan 2023 15:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Fcv1oFN64qJbUFhacrhJqgn8l/kgjLzAdWsUtFoBwMI=;
 b=nBdqaJGPr/nRqiCZKqfaB1HQdy85AAh1ZQqHWisT9yDwtkhoPZXkKF7qRcING1Gzup
 Uwwla3Pj8/L696BkpNLVsLz7x6fei2MZy2fzk1P0wvqBSVqvT5sYt4feMLxjjjmLVEpJ
 e13sfdL4Yg7pkuIDOQsGNRn4d0RLWivD8Y2vHOSAb02bJyq12Naag37tHw56u7SlphtW
 vG8BhN0CmrFdC7wiB6Jijei+yfRFNGaMVHH/Hy5Bso8hQjsoT1Ezxgc4VA1wJh/avvIO
 R8Qp6sw54FQBsCc9HJmLB8BNumhP/pcVSKefZUQ+AEWAMFhwKcGIV2kUxyNZ6WyT5k/r
 1eug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Fcv1oFN64qJbUFhacrhJqgn8l/kgjLzAdWsUtFoBwMI=;
 b=Kq+8cbtrdW9ZBv0j/4Gi45S6V4qwGTm/clr5pZCZgnwRHmcRweJW/bX1KJrrTu4QUO
 jXzRJm7qQNhJsB1a/mH3lKYaRWnbNjKWDQgJa3Gi2WKfXKlrkpqj1EM+7rpyZU1mjwIr
 ZizvdqtS4FnUeVVuscfV89IYMqHf57Zt9h+bSq6IdK7FlfurFZBZF2aOgjdaXRpquxBO
 xMDLdtvFE3FPzwXl2abkpJL1ERn9Lxa9VwF/etbUaLH3Q/VBiS9wbDh47Y1R0VTSeXmP
 ssm3mynGas+4Ez3rjq/i4w5dQXHMgxUOCUi198MD0VKdfepc7Ye2RGwNOe0WmNPipvCZ
 AHoQ==
X-Gm-Message-State: AFqh2kp67qA/879cYWBHaTulRsZ3lCXCyOAU/XAcH0AyEnD8F4JPiIQd
 xJYSRI62hNGpQDRIkmmgFq8=
X-Google-Smtp-Source: AMrXdXtXMWbO88qPnq745Od9/2z5JfHQSbibEexSfpksdpgkjdwJBwliMQal1f7GVguXLEPln76qHQ==
X-Received: by 2002:ac2:52ba:0:b0:4cb:445c:dc7d with SMTP id
 r26-20020ac252ba000000b004cb445cdc7dmr5998193lfm.26.1673306191279; 
 Mon, 09 Jan 2023 15:16:31 -0800 (PST)
Received: from localhost (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 br11-20020a056512400b00b0048a934168c0sm1831364lfb.35.2023.01.09.15.16.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 15:16:30 -0800 (PST)
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
X-Google-Original-From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
 airlied@gmail.com, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, agross@kernel.org, andersson@kernel.org,
 konrad.dybcio@somainline.org, quic_jesszhan@quicinc.com,
 angelogioacchino.delregno@somainline.org, loic.poulain@linaro.org,
 vkoul@kernel.org, a39.skl@gmail.com, quic_khsieh@quicinc.com,
 quic_vpolimer@quicinc.com, swboyd@chromium.org, dianders@chromium.org,
 liushixin2@huawei.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jonathan Marek <jonathan@marek.ca>, vinod.koul@linaro.org,
 Robert Foss <robert.foss@linaro.org>
In-Reply-To: <20221230153554.105856-1-robert.foss@linaro.org>
References: <20221230153554.105856-1-robert.foss@linaro.org>
Subject: Re: [PATCH v4 00/11] Enable Display for SM8350
Message-Id: <167330408775.609993.7646803775858639381.b4-ty@linaro.org>
Date: Tue, 10 Jan 2023 00:41:27 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 10 Jan 2023 08:28:50 +0000
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


On Fri, 30 Dec 2022 16:35:43 +0100, Robert Foss wrote:
> Dependencies:
> https://lore.kernel.org/all/20221102231309.583587-1-dmitry.baryshkov@linaro.org/
> https://lore.kernel.org/all/20221024164225.3236654-1-dmitry.baryshkov@linaro.org/
> https://lore.kernel.org/all/20221104130324.1024242-5-dmitry.baryshkov@linaro.org/
> 
> Branch:
> https://git.linaro.org/people/robert.foss/linux.git/log/?h=sm8350_dsi_v4
> 
> [...]

Applied, thanks!

[01/11] dt-bindings: display: msm: Add qcom,sm8350-dpu binding
        https://gitlab.freedesktop.org/lumag/msm/-/commit/7a0c3d0025de
[02/11] dt-bindings: display: msm: Add qcom,sm8350-mdss binding
        https://gitlab.freedesktop.org/lumag/msm/-/commit/ddcf30003b92
[03/11] drm/msm/dpu: Add SM8350 to hw catalog
        https://gitlab.freedesktop.org/lumag/msm/-/commit/0a72f23f6ef8
[04/11] drm/msm/dpu: Add support for SM8350
        https://gitlab.freedesktop.org/lumag/msm/-/commit/a596a6078586
[05/11] drm/msm: Add support for SM8350
        https://gitlab.freedesktop.org/lumag/msm/-/commit/3d6287e64cbd

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
