Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB485B6D63
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 14:36:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5384E10E67F;
	Tue, 13 Sep 2022 12:36:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07F5310E67F
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 12:36:27 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id v16so27127944ejr.10
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 05:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=sbb0BJfxSJ0bvHV5wkGwxNNxQE++mNh72PtFxZYdbyw=;
 b=fKbUU7RNxlQl+VA9rK9x6fuo4I5OHpjbBX6iooSmH8j2dhxcAOmNSE8zqOmavODS+m
 LuxcXt3P9JkKEwEVC1MiOt78KIlqAKdBtMugt8WZ8+Zhu/nr/u+MJoeUAV0iQdju4EET
 zR91JVo8I8Tz+zapJ5jTBrH5mexNnTqVyfEsY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=sbb0BJfxSJ0bvHV5wkGwxNNxQE++mNh72PtFxZYdbyw=;
 b=o9hEHKnJcPZFy3zPrMpywQLg67NlXIZFa7VHCV4rpU5eXUwEqw1GLoUyLVk9mSH3vA
 8d4DRPq0O6rmZXCp97S0BzPOS4MPVQ5q626X67Rq5gZprrjDOUB+Fbsq0li546d2vt5Q
 fHtVkmL4JfFpOLCSFRFuChNFNDlwro0ZrlLWjv880GDrCFpUU7If8rZkbqRMk6kBYSqg
 LvOY/1KLeP3XCByF7D+M0SgIH9+FzadjmDm5a3aYlAqyXzx2fucLemV4yEwIK8alIZxy
 egESYGE66ZrY4UOVrreRPGdIbG+8z5ePgUlDyBoHPqj4YSnrbTuVxZr2n2TSjO1eewyp
 nhLg==
X-Gm-Message-State: ACgBeo2HGgFLG2MHM4vc1Pa2CXvyy+OKqonUcDI7dChUAZW+ca10qwo7
 wJ0Cy+P9F8USuPYxvxfmw04iqREmeBDgfoHjB5A=
X-Google-Smtp-Source: AA6agR6nSU3SF5M+kGMtAcNBGhMNmMYpaxTvAj6A/vZyGKZUWo5/YnyNSD+xqmrk6W46TMBHGNO4VQ==
X-Received: by 2002:a17:907:2bdd:b0:77d:e0f3:81e5 with SMTP id
 gv29-20020a1709072bdd00b0077de0f381e5mr6074840ejc.328.1663072585296; 
 Tue, 13 Sep 2022 05:36:25 -0700 (PDT)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com.
 [209.85.128.54]) by smtp.gmail.com with ESMTPSA id
 q10-20020a1709063d4a00b0073c74bee6eesm5932976ejf.201.2022.09.13.05.36.21
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Sep 2022 05:36:23 -0700 (PDT)
Received: by mail-wm1-f54.google.com with SMTP id
 n35-20020a05600c502300b003b4924c6868so775627wmr.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 05:36:21 -0700 (PDT)
X-Received: by 2002:a05:600c:4e8b:b0:3a5:f5bf:9c5a with SMTP id
 f11-20020a05600c4e8b00b003a5f5bf9c5amr2359963wmq.85.1663072581167; Tue, 13
 Sep 2022 05:36:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220913085320.8577-1-johan+linaro@kernel.org>
 <20220913085320.8577-7-johan+linaro@kernel.org>
In-Reply-To: <20220913085320.8577-7-johan+linaro@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 13 Sep 2022 13:36:09 +0100
X-Gmail-Original-Message-ID: <CAD=FV=XXCOgRwdsHxnH5DhoNb5QAT6n9m8iUNOQ5at4YAKd-cw@mail.gmail.com>
Message-ID: <CAD=FV=XXCOgRwdsHxnH5DhoNb5QAT6n9m8iUNOQ5at4YAKd-cw@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] drm/msm/dp: fix aux-bus EP lifetime
To: Johan Hovold <johan+linaro@kernel.org>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Robert Foss <robert.foss@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "# 4.0+" <stable@vger.kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Sean Paul <sean@poorly.run>, Steev Klimaszewski <steev@kali.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Sep 13, 2022 at 9:58 AM Johan Hovold <johan+linaro@kernel.org> wrote:
>
> Device-managed resources allocated post component bind must be tied to
> the lifetime of the aggregate DRM device or they will not necessarily be
> released when binding of the aggregate device is deferred.
>
> This can lead resource leaks or failure to bind the aggregate device
> when binding is later retried and a second attempt to allocate the
> resources is made.
>
> For the DP aux-bus, an attempt to populate the bus a second time will
> simply fail ("DP AUX EP device already populated").
>
> Fix this by tying the lifetime of the EP device to the DRM device rather
> than DP controller platform device.
>
> Fixes: c3bf8e21b38a ("drm/msm/dp: Add eDP support via aux_bus")
> Cc: stable@vger.kernel.org      # 5.19
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)

This seems fine to me as a short term fix until we get the DP AUX
populating moved to probe.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
