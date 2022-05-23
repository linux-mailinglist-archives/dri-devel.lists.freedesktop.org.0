Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49247531EBF
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 00:45:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E50BE10E86C;
	Mon, 23 May 2022 22:45:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [IPv6:2607:f8b0:4864:20::f2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07B8710E3CD
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 22:45:03 +0000 (UTC)
Received: by mail-qv1-xf2e.google.com with SMTP id v5so13131527qvs.10
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 15:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rypfduMofq52o9Cw4bRVJ4YmnkHY5oYB2ohQA+ESkAI=;
 b=k21oHGm0XlDpBA85Iv8KLMxGl747dSSdXE/EQyrLw9mufTBWj0M6QTD5xziStZGSax
 rsRSKgHWBLMlhZ92G8QYix9zssd7roGkDcKcOVZ78tx2ubdiDauy3Vbkx008q6bxygJ4
 DUmQ26ZXi3O2lWLDlZDoUFt85gOIQ6f1dlS2AhQ9k28X+yfGX3ow6kOvQNJgZHpnnzvF
 FWbQfK8KuSu9LWM1QZyd6uCIrhja4Y/y3XPc/g+P4FxJwERhcMptBoMl3Xb/l+rYfkJh
 8rebEvtWe+YSg431tnavm1SWe+NxnNWr/h9TNjHOIcf+Fj+ppVEv6ttuw9iIYwaoBIu5
 4SKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rypfduMofq52o9Cw4bRVJ4YmnkHY5oYB2ohQA+ESkAI=;
 b=M0/2wgsDgDw4f48PpoQLossAxbVkQrYOmpESyWWNVFuYX4S2G5Jzj0Vcj/Bl3w6FRd
 tUpAIHhJozWNrRyMJ2hEB0TS+Zt1LTaxRhFsgBUGGAxknau39BoqcVG5H+s81dTrTvPS
 1pXHdsJPcU3JZ7cOewYUFMsT6kihdICr6mexX3bu0C6/d3nMpB6UuLqCRXPbBrjuIAN5
 50QSqP1+giptJf9V+QWm134WCvTJCgE3NU8ML1vbUjDNmyu+hAmPqmGAilItGU9VTc+o
 99C0T4opkJwZ/vgJTDKbWBYqq5aRCz2blhi7qbLJvmcMKhUKmwybTpypgR0JhNAtgNzn
 l69Q==
X-Gm-Message-State: AOAM532Ap6UGWyLRIL7lwtMClWLS9GB+AVBfSGsHnYq8VqFN2L5l7qO7
 wlfu9ZnoCFfdpyTRe+k/jmselsMgTAYpr/JIwFk1zg==
X-Google-Smtp-Source: ABdhPJzz71U22o77PPLCWll4LOjtW5ov17NvyPyylFN9GoUFs7JpXdQIQhFptHaspJJWWce0ytJssabLtNao3p4Y8No=
X-Received: by 2002:a05:6214:3e1:b0:461:f0b1:6b12 with SMTP id
 cf1-20020a05621403e100b00461f0b16b12mr18964358qvb.122.1653345900868; Mon, 23
 May 2022 15:45:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220523213837.1016542-1-marijn.suijten@somainline.org>
 <20220523213837.1016542-6-marijn.suijten@somainline.org>
 <CAA8EJprN833M+KOZXOyuaL_KqzEV61P69VXw7mfWo5OiXjE2FA@mail.gmail.com>
In-Reply-To: <CAA8EJprN833M+KOZXOyuaL_KqzEV61P69VXw7mfWo5OiXjE2FA@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 May 2022 01:44:49 +0300
Message-ID: <CAA8EJpqB4wAZo_EVX9dgTvAyX7yqTUUPNeEUsG58nckdDKxr-A@mail.gmail.com>
Subject: Re: [PATCH 5/9] drm/msm/dsi_phy_28nm_8960: Replace parent names with
 clk_hw pointers
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
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Stephen Boyd <sboyd@kernel.org>, Vladimir Lypak <vladimir.lypak@gmail.com>,
 linux-kernel@vger.kernel.org, Jami Kettunen <jami.kettunen@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 24 May 2022 at 01:44, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Tue, 24 May 2022 at 00:38, Marijn Suijten
> <marijn.suijten@somainline.org> wrote:
> >
> > parent_hw pointers are easier to manage and cheaper to use than
> > repeatedly formatting the parent name and subsequently leaving the clk
> > framework to perform lookups based on that name.
>
> Can you please add a followup patch (or a preface one) removing the
> rest of devm_kzalloc()'ed clock names.

Argh, stupid me, you did that in the next patch. Please ignore this.

>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
