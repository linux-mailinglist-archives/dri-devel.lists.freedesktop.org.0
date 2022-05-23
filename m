Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1EED531EE0
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 00:52:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B42110F42E;
	Mon, 23 May 2022 22:52:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D0E210F42E
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 22:52:44 +0000 (UTC)
Received: by mail-qv1-xf2a.google.com with SMTP id h18so321098qvj.11
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 15:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CUVpHrGsWFdpmHijjTHWgW3zbODgXYO9/RKM5yTRDuI=;
 b=dbwT19t5cpVruIALgVmfGy44+S5C32idyjwxhDCuTYIvCRilH0ylGpz6YxpJPRg+xn
 MEg4hduZqdTC46dHgHZNetXKPRkJT+V0xntPmDgNck+9MGz049AyhRjDVo+T9DdR0nyH
 rkxTcTti1/4X39o14uHqaGdH/w3KW/zqoIfUlMWVbR6VcJhXsytkmfjtPNI2IGVze1IE
 0Q+oyv1yhdkLWhjIKaI7oLbk1edD+liaDjWF4+Lv35Rxgt8/r9VircuNHbltNvVsadcx
 0izyRQYCDe7bUrJvl/zQrTR2TSPnv5/fVQpNV4ONkyk3sqAJxl6mz8GyruRIIOjwECNb
 mo+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CUVpHrGsWFdpmHijjTHWgW3zbODgXYO9/RKM5yTRDuI=;
 b=JoGnSo48wHdPy2kYgDWXgD+l89L3B9VEzzJJVG+QfaAzjldd0/Xd4EqSbYTEOqphij
 P2zrp2YaQgi6PE3JLskEDuSrmqJXSVwkej3gv0VjrazLEfqkfuRhLvro0phOkqDVQx4C
 dIwLGE8Co8YUyRo3L7V+F7h1GMKR6jhtfFdGewwDNm1oyEv5yg0B/o9YWZQco+jIDkf3
 M83GZ84rNmiJtYhJQNs38kOVeFCDL5DdGfsyxtPRCkXHwDr3dvTExVH5v75M9UcjAUAb
 F4nIwT9nBJn9+0E6ZEvXI45ecytvmaEbIc0tusAkVk1dkA7cg2bg0ndx8x5I69spcHB3
 scfg==
X-Gm-Message-State: AOAM533E71yKS1JZQ0lEPeTiKdLsr/K2eFLKo+XGE3No8QMknX3uiUd6
 BSszaNjl26NklZF80lfPEwdouzc7BLfoaNfyCI7l1Q==
X-Google-Smtp-Source: ABdhPJz0L862d4LbPRYNVicS2bt3U+l7geWkMJ97OKfiAKAymqSQWmgMZll4IQHbb+ItHL14MvPGMGWpODDcIwbZ36g=
X-Received: by 2002:a05:6214:931:b0:461:d289:b7f6 with SMTP id
 dk17-20020a056214093100b00461d289b7f6mr19245958qvb.55.1653346363592; Mon, 23
 May 2022 15:52:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220523213837.1016542-1-marijn.suijten@somainline.org>
 <20220523213837.1016542-10-marijn.suijten@somainline.org>
In-Reply-To: <20220523213837.1016542-10-marijn.suijten@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 May 2022 01:52:32 +0300
Message-ID: <CAA8EJpqfS6xi40Zewm+v7La=jER5CR6s1=htn1C7jLka5SuKGQ@mail.gmail.com>
Subject: Re: [PATCH 9/9] drm/msm/dsi_phy_7nm: Replace parent names with clk_hw
 pointers
To: Marijn Suijten <marijn.suijten@somainline.org>
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
Cc: David Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, dri-devel@lists.freedesktop.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 phone-devel@vger.kernel.org, linux-clk@vger.kernel.org,
 Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Rajeev Nandan <quic_rajeevny@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Stephen Boyd <swboyd@chromium.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Stephen Boyd <sboyd@kernel.org>, Vladimir Lypak <vladimir.lypak@gmail.com>,
 linux-kernel@vger.kernel.org, Jami Kettunen <jami.kettunen@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 24 May 2022 at 00:39, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> parent_hw pointers are easier to manage and cheaper to use than
> repeatedly formatting the parent name and subsequently leaving the clk
> framework to perform lookups based on that name.
>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 92 +++++++++++------------
>  1 file changed, 42 insertions(+), 50 deletions(-)
>

-- 
With best wishes
Dmitry
