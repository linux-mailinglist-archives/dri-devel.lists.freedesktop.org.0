Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B16C4B7D00
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 03:00:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D54210E5F7;
	Wed, 16 Feb 2022 02:00:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [IPv6:2607:f8b0:4864:20::c30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87ABC10E5F0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 02:00:16 +0000 (UTC)
Received: by mail-oo1-xc30.google.com with SMTP id
 o128-20020a4a4486000000b003181707ed40so827321ooa.11
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 18:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=Y39GGSzmxBUHOwxgKdq6ykyZOrHUIJsCDTwfMhkJMyo=;
 b=DgMTmya6/M0gMhg3H7XHoavHD5THzZHhmJog19F7nTTDjjqNjdnFc8kEiKO5OmryM1
 ZExHNdw/YhLTVdd/r39ymYadzzUyH+FwpW7XRvuy3zg7WHcArO1BJXl/7C7Si20NANPz
 9ngK3tfttC7JAkiZLd44R4Ck4If1Lf1c/FUGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=Y39GGSzmxBUHOwxgKdq6ykyZOrHUIJsCDTwfMhkJMyo=;
 b=Aqecj2AneRY0jshK1GwQ557yfZlvwqQsyaqoeJWC88pxNh3q40TIc5OV8yAAs/ct3P
 98on+bOLEk+WCOsPKW6DeHCMJAggE3lTsmUEp4Z9mbuK5lHyGFIq1QsyKY4Rj5zXQ97c
 wUvjkhtBr2ywYrIqKQZzk0ZMyX6vdt4yw6+TfUcE71P1X8YpHyUsOdASzX+9MXNZElvF
 VhtaPov9fFDHijPA+ipvSvlucb+yKNwMPsEDKElrcdvrKw6RMguYC3BOHM4emFweqE+F
 UBHn4lwIN3985dfYZkft3Rs/KfR2PHJuQ6tXOhQy/WG0tpipt02qvCV9oyOa2BgIxGDK
 pbGQ==
X-Gm-Message-State: AOAM530cuHQqizruWxxR3LOq4qn2ynhPdKYNvkesxrPWLsVMt+UDCqfe
 0SM585REjYzrt4gLnz2q3TPCdhfG3prSLGYXVo+n7A==
X-Google-Smtp-Source: ABdhPJwdV21EEUJFlMWgJeVNAtf4tA1g3nuw0qBk6FBZAxwGFFZ/I/0I+Ue+GCLgLME2YDh8bl+g9B8Ahc2JRkcq55E=
X-Received: by 2002:a4a:d58b:0:b0:319:8746:ac3e with SMTP id
 z11-20020a4ad58b000000b003198746ac3emr207163oos.1.1644976815890; Tue, 15 Feb
 2022 18:00:15 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Feb 2022 18:00:15 -0800
MIME-Version: 1.0
In-Reply-To: <20220215141643.3444941-8-dmitry.baryshkov@linaro.org>
References: <20220215141643.3444941-1-dmitry.baryshkov@linaro.org>
 <20220215141643.3444941-8-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 15 Feb 2022 18:00:15 -0800
Message-ID: <CAE-0n53y6x+4aqQMjwgQ=W-m2v5BjaFQptLB+D8dh0R8n-pzhQ@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] drm/msm/dpu: pull connector from dpu_encoder_phys
 to dpu_encoder_virt
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
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
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-02-15 06:16:42)
> All physical encoders used by virtual encoder share the same connector,
> so pull the connector field from dpu_encoder_phys into dpu_encoder_virt
> structure.

What is the benefit? Less code? Clearer association?
