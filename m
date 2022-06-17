Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 991EC54FE92
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 22:56:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39F9210E4F3;
	Fri, 17 Jun 2022 20:56:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2E3310E4CF
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 20:56:32 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-1016409cf0bso6922081fac.12
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 13:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=MH/iAqLtqToQAlEnXkpP3+J+Zy8At+koA/Z9dM2NOZc=;
 b=kyEDKtsqodmuTT86QxhNaU7tgoCtWme2N7wlYwiTpVGVYAYBBqt1DAq/mT9BFnwPWo
 bQ1PITdzjrSdMZlt5iD9XIjog5xhqmEIF916e+ohiHDHLGfApEbwoww3ZTPADsLwjxZ2
 TEwBBCfZPVd4+eGNaGntLIlezdWVPhYRn3l0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=MH/iAqLtqToQAlEnXkpP3+J+Zy8At+koA/Z9dM2NOZc=;
 b=4A9MxZDGSzafNElff7CVMH3eaCn71RlkJE+cdVnO3x95U7VMvLnPpt77mqM1t5c5j+
 ltb6qTGS9RY4EEe55nQGAZEzHe3vihlpBermlSmudT8bWEG/xilB5TLvlhbqDHz81bq5
 04gQY8JUZY4f9fVQrXY3qVtgyj7LFWCXTlFMTmDm1+F0AdyCwuT22o0yQBn2OaOoYy3e
 nrHUWPRUne+tc9G9JBE0NQ9N1KFDT8WMjRX2lWcu4/d4tMnnhGgpOwaFMmURwsjql46Y
 QSxCiA5RXUtzBr5itYWas1nXxdO3lgihhGisBL7B3gAztMq/IgyufWs6MPhKH2WBhUea
 m3Dw==
X-Gm-Message-State: AJIora9CpJFhj8UveOlJ8LmGcMjUid3Gmj0oDKcbmAmh5ymPE/7/Fc91
 uSByI5SujVdlPabaMPye3uiOQtFfSiK2TftJO3CEzQ==
X-Google-Smtp-Source: AGRyM1vd690rXJ51SuzzgfI8BhKCCRgUEbObgJqZvik2f2hM6fajZLbLknhknAJbbPVwWpZOvXMPEzWPFbnPZniESuA=
X-Received: by 2002:a05:6870:b48a:b0:101:40eb:63a3 with SMTP id
 y10-20020a056870b48a00b0010140eb63a3mr6284144oap.193.1655499392048; Fri, 17
 Jun 2022 13:56:32 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 17 Jun 2022 13:56:31 -0700
MIME-Version: 1.0
In-Reply-To: <20220617103608.605898-3-dmitry.baryshkov@linaro.org>
References: <20220617103608.605898-1-dmitry.baryshkov@linaro.org>
 <20220617103608.605898-3-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 17 Jun 2022 13:56:31 -0700
Message-ID: <CAE-0n53pK-YDLkBTyHiF_AL_BEdOjCAt2RdqLemONzVsXx+Asw@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/msm/hdmi: make hdmi_phy_8996 OF clk provider
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-06-17 03:36:07)
> On MSM8996 the HDMI PHY provides the PLL clock to the MMCC. As we are
> preparing to convert the MSM8996 to use DT clocks properties (rather
> than global clock names), register the OF clock provider.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
