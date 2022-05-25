Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 322CD533442
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 02:21:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D2D410FA9F;
	Wed, 25 May 2022 00:21:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3B2910FA65
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 00:21:07 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id c12so25026725eds.10
 for <dri-devel@lists.freedesktop.org>; Tue, 24 May 2022 17:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=po9Z+ZnC7Ru+UUqihsKbLp4miOkDQWGaTskPH6Fy5Dg=;
 b=DogEVOs1h9Ij4NbEnwQCFgHrnO+6c/aG33k1MdmT+QsVZDGJ5A1Xid8Y6NhT55/YZB
 wcIwCwdH49o+G8LNtX6oQ89Hi/v8+WA2AYdKpNkXEYzqSv3TpfNn42nSqr/xaiyJvA1P
 K9imYTOTjx9raNfGaw0DwbkGCwB+CKBzlOR6A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=po9Z+ZnC7Ru+UUqihsKbLp4miOkDQWGaTskPH6Fy5Dg=;
 b=PyAD60uhgWoOm+vv6Oj1rRgGTvapWjHKILA/jOEaLT6mlnqJUlKgr+96xgOMtjkvH4
 XhgCWDUC/l/LppHxvJ/0jqrZcEc/6dbup0e307sZ9xvXhoLy7W1mNwzm8VlGUmoM1621
 yBJgb7cU6G2kaKeB3o05RW2rv1DecQZpWYZVCVnQ/+riOz6Nk1nHT8anWlTzpPc2lggz
 rIjuT9/ypvSk1LLN4a8MnoxEsXehjEcRm0PS7ir4SjwKfmVoMS1WP9ofNZrFTGVRtogF
 IT1+wU2OLvbCMUIgQxux1eh/TGizSp/YXiXqSrcOvKnpMbR1JwGv6j0AlGZaJtjZp4C/
 lAJQ==
X-Gm-Message-State: AOAM532ur4WqNd2FrSF1X/OsibLG9plRjNEButrJd1iT5XTtHHusL+9W
 ek8tZs9c8GW6Jia+AmNpO1cMHFxFl57Y1p4ARSw=
X-Google-Smtp-Source: ABdhPJzhy1dKdbItxfAyvcGh+oTDkqidR8z3tpbgsSgb7jmQb66uImZIreB/4o2GFVp3ngIPjPfKaQ==
X-Received: by 2002:a05:6402:3582:b0:42b:32a8:912b with SMTP id
 y2-20020a056402358200b0042b32a8912bmr22980563edc.137.1653438066215; 
 Tue, 24 May 2022 17:21:06 -0700 (PDT)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com.
 [209.85.221.41]) by smtp.gmail.com with ESMTPSA id
 kt1-20020a170906aac100b006fecb577060sm3299940ejb.119.2022.05.24.17.21.03
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 May 2022 17:21:04 -0700 (PDT)
Received: by mail-wr1-f41.google.com with SMTP id u27so27069540wru.8
 for <dri-devel@lists.freedesktop.org>; Tue, 24 May 2022 17:21:03 -0700 (PDT)
X-Received: by 2002:a5d:5009:0:b0:20d:846:f4da with SMTP id
 e9-20020a5d5009000000b0020d0846f4damr25355018wrt.301.1653438063415; Tue, 24
 May 2022 17:21:03 -0700 (PDT)
MIME-Version: 1.0
References: <1653082028-10211-1-git-send-email-quic_khsieh@quicinc.com>
 <1653082028-10211-2-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1653082028-10211-2-git-send-email-quic_khsieh@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 24 May 2022 17:20:51 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VRNAC3=VAZcw5H1jReGzdbTCbD83OqRcYztrzhPD3PAg@mail.gmail.com>
Message-ID: <CAD=FV=VRNAC3=VAZcw5H1jReGzdbTCbD83OqRcYztrzhPD3PAg@mail.gmail.com>
Subject: Re: [PATCH v11 1/3] phy: qcom-edp: add regulator_set_load to edp phy
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 David Airlie <airlied@linux.ie>, freedreno <freedreno@lists.freedesktop.org>,
 Vinod Koul <vkoul@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, May 20, 2022 at 2:28 PM Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> This patch add regulator_set_load() before enable regulator at
> eDP phy driver.
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
