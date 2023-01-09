Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E096635A8
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 00:44:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E23C10E527;
	Mon,  9 Jan 2023 23:44:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9662910E51C
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 23:44:13 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id d30so10700805lfv.8
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 15:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Fcv1oFN64qJbUFhacrhJqgn8l/kgjLzAdWsUtFoBwMI=;
 b=yyqlLqmEad1Eoug+Pqw6mbGdEoWzi9i0T3BssEaafOlNHnw6xaGiWJ7pK5nwqc2J9I
 nCeo3sf8KEXXXjcma5Ag8FZ0k1k7AHvyx+7AQ8AvqEgWsSEFEIxKjlBrzP0bdojrjy1t
 6lCIzTPGrzSjxPMop7dj+ksrZYWKXyIQHWZiJQaHOwQPm9mtkRb38rYKXYH6OrQMxV9v
 Eo/gYeCL/8GFxfJae9UXXcn32c4bcZifjC5DblpUg1CIMdnGUnOggqgqJ1WD4SmZPqn1
 oYFy4VkF3YLJcwNAfAPWo5HlPP2M+oCDWOwsufXBFuG8w5zuhptkoii/XbdAq/vDM7cM
 ZhPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Fcv1oFN64qJbUFhacrhJqgn8l/kgjLzAdWsUtFoBwMI=;
 b=esRY471zjFDYAb600ZGoFg2XWqdjpFKDjqDgF3dF+64bWieC5R7nJKeU68MRfTBa/M
 O33rQIewErsoOhd/XNoZgEk2pqHTRN9n88r5Nzh5B98Wy3+Cz3VHPxONR3J6kUt/Zv7E
 kI9Jw+b1SOz2ssczOfZq6uPrGop3yJnelFhp7x3jfTE0qyxaUsLbMH5BtqPCpyw9KhAz
 VcCW+1mtN7JXuekqQYUwHJGOFsCf7SLa5oDskgRp9E6NCQsTt+tDX/Yr9bQO0X2XvONj
 OVbPkVK2d+jF8YTQUpm6A9me6MjEzdWrlKLiI5bbGo0Hxf/N2s8m0Or/lJfHyplfGmWw
 P75g==
X-Gm-Message-State: AFqh2koHOyDv9OKfsb1qHHu84Z3vLAfRjsCJ5swJmO1OkjRfn8xYklla
 f/ssG8i/DXVPGwQABQnKN8S1Yw==
X-Google-Smtp-Source: AMrXdXv9xequ4FXUhcniZT7Z+xF0zKqFw9XLkFAdfT6Tq7YNkvWypWehJR7aJcR04BckOI+BmqR4Qw==
X-Received: by 2002:a05:6512:3b91:b0:4a4:68b8:f4e5 with SMTP id
 g17-20020a0565123b9100b004a468b8f4e5mr23148873lfv.43.1673307853149; 
 Mon, 09 Jan 2023 15:44:13 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 s9-20020a056512214900b004b5a4cf69dfsm1835255lfr.261.2023.01.09.15.44.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 15:44:12 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Subject: Re: [PATCH v4 00/11] Enable Display for SM8350
Date: Tue, 10 Jan 2023 01:43:58 +0200
Message-Id: <167330408775.609993.7646803775858639381.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221230153554.105856-1-robert.foss@linaro.org>
References: <20221230153554.105856-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
