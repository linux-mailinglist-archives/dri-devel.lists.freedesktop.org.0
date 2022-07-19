Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B86578EE3
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 02:13:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE5571139B4;
	Tue, 19 Jul 2022 00:12:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD798112412
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 00:12:55 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 w6-20020a056830410600b0061c99652493so5357797ott.8
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 17:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=uQR+n69n3dnYzqYwl3ly3mEn2ZxY8NPwKeE+kxZpS2M=;
 b=fJcui/2VkpHokc0d1YV8OjT923oZ5Oc+KoVy7FjZmyH1L/6cmgxWpbexuOmc0YKmZk
 QDyyZc7KOfterT0xRHhb4S5PTWC2f+MIFb0+d3F3b3jmiii9CDrUVfi8zFGi+DpWYrSi
 LylhOa2dqucibVAMfjQS8IJGOkt8dNfjrC9NI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=uQR+n69n3dnYzqYwl3ly3mEn2ZxY8NPwKeE+kxZpS2M=;
 b=kb7YXzlZzFoBhlz9p7/uwqXBz9KntrOOhVFPdu8unYSCo8BXnyrRZWPxIT7lhrabpr
 w2bOjSChcMLEc7pyiGx2VPPzwC/7/AwxuYps9NYI86X5yLurqK7rHC1JGOpGTGkwLztw
 hom96e7iBc6ROAienP8NB2ZluXOd8q6MU86JS6PN4YJbaT90B+pv0D/TX/vIBvq9ECVt
 hcPIi+NTYdcB+cyj1ZeHUJm1JROVka9Z7OIVN+h2vE5nqL21bSqPLTeab3K6ADUVaXlY
 3qoelqEB8XAW5fuvCNYCzgRZYvphEDFOoc8Ae2JpeENYpSIdLbg+0ynTmBlrBicnZisk
 5/sA==
X-Gm-Message-State: AJIora87QVRnymZSD3ggaNP71TytDgcqAcNSnHY6yNLNo0DnPJLySQcq
 m44jMr7OKaIbmLrtQzMSYifmdualaci1ToALQ+WMbA==
X-Google-Smtp-Source: AGRyM1tj45Y8RF+Rd3jNFk+0LcP8DpTPSuHkSuaqNuMLN/z98asVBWyEOSMFjlQpphhLUMzVXQGKWxbYTin3OQ1opFA=
X-Received: by 2002:a05:6830:2aa0:b0:61c:9501:bb26 with SMTP id
 s32-20020a0568302aa000b0061c9501bb26mr5172172otu.73.1658189575184; Mon, 18
 Jul 2022 17:12:55 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 18 Jul 2022 20:12:54 -0400
MIME-Version: 1.0
In-Reply-To: <20220710084133.30976-2-dmitry.baryshkov@linaro.org>
References: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
 <20220710084133.30976-2-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 18 Jul 2022 20:12:54 -0400
Message-ID: <CAE-0n53StEjfWrNwmSZ5U-6M-EqEbaXHU+A69a-9-CTxw5GdiA@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] arm64: dts: qcom: sc7180: split register block for
 DP controller
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

Quoting Dmitry Baryshkov (2022-07-10 01:41:25)
> Follow the schema for the DP controller and declare 5 register regions
> instead of using a single region for all the registers. Note, this
> extends the dts by adding p1 region to the DP node (to be used for DP
> MST).
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
