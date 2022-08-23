Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 110D359CEDA
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 04:58:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30D21928C4;
	Tue, 23 Aug 2022 02:57:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 092A314B9FE
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 02:57:42 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-f2a4c51c45so15283726fac.9
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 19:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc;
 bh=k9bh85zEwdXnkIg7OqvJbsldra6EITvqvq3BXqIAXKk=;
 b=Aea2giar/rgR4x1lgytCyCxTVv8f9PDlrDOAdnxyS0IGj61DMS3sV8sanZX2svonJj
 K1oEkGtUtKsI4/pbZQL2I4p8KcwnDbfE6/n5SEAearxyLxGcevAnEyB3PcJ+ER5gf+VU
 uFKzLOQ9Ds264e37UhQhFWu8pF5utN6r2MUAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc;
 bh=k9bh85zEwdXnkIg7OqvJbsldra6EITvqvq3BXqIAXKk=;
 b=VdU4v9eP7QV9Pb4HX7Vb8TBjX+fDxlVEtYle4Zx/WPpz3pvT5b1DauYuonFhN3Cm9p
 9+u7KWeLyas85dKZz8UYqMAKlEurZ4HiPwYrvJ6XLMdTslvCH5txEsAlvrsuMj87PSIe
 oozntwEAGFEQBpLBWCh2rMNrCpm314uljdkHLMG8H+3C5uotLE8qtXdOosMjTNkPOQy5
 iL83N4j2ppfdvVqnS0z8TEJq7TBOHOJOhS/tT8hg7OMMZRR/MucgTbBZF9sQtU+vomVC
 /XgQSFJWWwt3XSoEsRc8FPVXIMN8nBOCawQk3jZf7zyEhudiiN42ZlAQFdepvSyPqh4j
 m5yw==
X-Gm-Message-State: ACgBeo0r32Nc/pizPoS1f1DxofKgYHAtEgHdjlT+aV93pFwhQM9wwtj3
 31m3ZgXwMP/YA/ZNabricgIoCZ4t1/JuT5Hpt+Z+Vw==
X-Google-Smtp-Source: AA6agR5r49UulfMOnXRzzL5cO1NYpo0SpanybCWC1I8v58Dp0GMjmdbnk5reWM17/kcgTAgkupqBW/lMsNT2CUZwOtQ=
X-Received: by 2002:a05:6870:a99c:b0:11c:2c37:3d03 with SMTP id
 ep28-20020a056870a99c00b0011c2c373d03mr547267oab.0.1661223461927; Mon, 22 Aug
 2022 19:57:41 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 22 Aug 2022 21:57:41 -0500
MIME-Version: 1.0
In-Reply-To: <20220822172204.281045-1-dmitry.baryshkov@linaro.org>
References: <20220822172204.281045-1-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 22 Aug 2022 21:57:41 -0500
Message-ID: <CAE-0n53wZLe73-f+zt2kPNWHNp+zGHx127e=gH=Vi+et4aAmEg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: drop unused variable from
 dpu_kms_mdp_snapshot()
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
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-08-22 10:22:04)
> Follow up the merge of address fields and drop the variable that became
> unused after the commit 9403f9a42c88 ("drm/msm/dpu: merge base_off with
> blk_off in struct dpu_hw_blk_reg_map").
>
> Fixes: 9403f9a42c88 ("drm/msm/dpu: merge base_off with blk_off in struct dpu_hw_blk_reg_map")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
