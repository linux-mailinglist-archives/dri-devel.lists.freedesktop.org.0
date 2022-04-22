Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C2150BCA4
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 18:10:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01F3310E13F;
	Fri, 22 Apr 2022 16:10:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEDED10E13F
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 16:10:53 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id i27so17276095ejd.9
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 09:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TO6k5Eg+5Nqe4CCIAN4ROGKgZysMxXNX64mWMEm2504=;
 b=oY3R9eMENeA4yFgfxxAh0CIL63NfU/4cQZy0VBfnWqdkaQCrjP1OSsrzairEuqTc8h
 dCnx5NBV16wwOh8IExGkxkRthS5yV1+uEB61rOzpqQGfyzUlUPRRrILpKog4hvbptgGe
 HyH8ZzQX9V8+aRsclZdqqy2LK9aUqTNtjPWfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TO6k5Eg+5Nqe4CCIAN4ROGKgZysMxXNX64mWMEm2504=;
 b=tC1AFLkXWBdlSuCPersr+1N07BV40lY/dXoaLNktfMh+B5O0c1RimbyBOg4/JhvW9N
 BSWr75Yr9I3of+ZwXrJR05OEJVmcyVa9zxZND7lEGCVSuOjyX0PnvN8CrVxT7kd5GO4m
 o11f2uGoXKCCPf26KR3Ba2XNXC2bg6iGY9RpuKrPLnRrFpY0X3NhQW5/3X/tN4dFJDsS
 65NJPVWKY9EJ/ywXVTAtNojlSJJrG7nLPsU354R3wXu0TwL9AvqajHFaH0/ELimUEVHu
 vfAfwefu6JneQZXQ0YWnuLGzYvWtmw3bkaQgPlRupFwtKXMTBBJOuhlf2Tsrdvur+jqx
 wLgA==
X-Gm-Message-State: AOAM5339USqFal4XcEcNe4wC30D9tPOg61g78UFTkImd3LWmSDYc9OWK
 eI7oxLWRLiz1dZ2d28ejxHZTczx5+DrjrttqR/s=
X-Google-Smtp-Source: ABdhPJziHKYxF70xio2xlfupXbXnRNf24+y9NU6BtoQ4RTk5dZkZ1o4/jSVt07MlOcaTvJCiOmRF5w==
X-Received: by 2002:a17:907:6d81:b0:6eb:f837:9077 with SMTP id
 sb1-20020a1709076d8100b006ebf8379077mr4894834ejc.328.1650643852047; 
 Fri, 22 Apr 2022 09:10:52 -0700 (PDT)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com.
 [209.85.221.53]) by smtp.gmail.com with ESMTPSA id
 s3-20020a1709067b8300b006e4a6dee49dsm889703ejo.184.2022.04.22.09.10.51
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 09:10:51 -0700 (PDT)
Received: by mail-wr1-f53.google.com with SMTP id bv16so11715207wrb.9
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 09:10:51 -0700 (PDT)
X-Received: by 2002:adf:a29c:0:b0:20a:a246:a826 with SMTP id
 s28-20020adfa29c000000b0020aa246a826mr4418755wra.422.1650643850709; Fri, 22
 Apr 2022 09:10:50 -0700 (PDT)
MIME-Version: 1.0
References: <1650618666-15342-1-git-send-email-quic_sbillaka@quicinc.com>
 <1650618666-15342-3-git-send-email-quic_sbillaka@quicinc.com>
 <CAD=FV=WWa8n0MJB8ks7bgrSj1Qop1Z5hvfEAOWtFcmsz38eR_w@mail.gmail.com>
 <83129bad-44a9-bec7-f931-8067ef1b9d4d@quicinc.com>
In-Reply-To: <83129bad-44a9-bec7-f931-8067ef1b9d4d@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 22 Apr 2022 09:10:37 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vu_0vxb_D+8n3qhNZ66nRXBp5vxshChmOM-ToPJxk=aA@mail.gmail.com>
Message-ID: <CAD=FV=Vu_0vxb_D+8n3qhNZ66nRXBp5vxshChmOM-ToPJxk=aA@mail.gmail.com>
Subject: Re: [PATCH v9 2/4] drm/msm/dp: Support only IRQ_HPD and REPLUG
 interrupts for eDP
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
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
Cc: quic_kalyant <quic_kalyant@quicinc.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 quic_vproddut <quic_vproddut@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Sean Paul <seanpaul@chromium.org>, Steev Klimaszewski <steev@kali.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Apr 22, 2022 at 9:05 AM Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Hi Doug
>
> For the lockdep error, the splat looks similar to what kuogee fixed
> recently.
>
> Can you please check if below patch is present in your tree?
>
> https://patchwork.freedesktop.org/patch/481396/

Indeed I did have that in my tree already, but the lockdep splat is
still there. I think the problem is that we're now calling
dp_hpd_plug_handle() directly in dp_bridge_enable()

-Doug
