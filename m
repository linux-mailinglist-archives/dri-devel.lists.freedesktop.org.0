Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 799BB4C03B3
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 22:23:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B95310E7AB;
	Tue, 22 Feb 2022 21:23:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E27110E7AB
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 21:23:06 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id y24so15015348lfg.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 13:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=jtBVx2Q/oC2O51WQvIZoigpKLKNp7EeBw9E1UoJ7r14=;
 b=mAa8bFMjWfWT9TC79LezRPpW/O5teRZRBGOhGeyZlyPSn1RHq2IC87Lql6EkKB7Q9m
 mWTGKLknMy42DlWk53dfq8vebjptcTZh6UxaO0cddBDBmquX3n9al0Dqy9jX0rj7IZ02
 1VZKBc9lz4Sk37aQVP8iDCiQOm/V2CeoounJUpha1YMvihrLHinMviFRB7MLSZyWzBoj
 VIpbYCKPeZGB9rygAk59ibEocVP51rrPpEeTfuMsqlHME1qioGGOfoITrhi9YsPi/Ylt
 KFL/EJ8TWFhqkvM2YB8Qszca7EvBlru9P36GBNQ3E39PGwe9YvcU2QIurKKcVl1MHHNW
 l4pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jtBVx2Q/oC2O51WQvIZoigpKLKNp7EeBw9E1UoJ7r14=;
 b=XtIkSqEy+unvyM5RgPjcEcplMC2n1ebj2UaaNdLes+rONjGbuL01KIsoFMjv/hqDsk
 YY880sLoqxxbYy0AIgVa8jNqgkgCl6lAKmsCEaKRM0mW4qW/jhTWvXiMUeAxxY80IZzO
 00IqwNAwdnRs/EaFRc+fKWNuK3Ke4XlzOhQ0fW/k6DI3X4PsfzZciA1EpDenTnaf1ynn
 mBgIqHegvFhR2QZKbpDKUkYV2Cwa5VZ/0F/NhpdDvVe3rQD+dtvqylh7uGKOODPbM0tG
 qVRwPEeskLsP80EYXSPOL3VzOCMVVxvXB6nt4JfN4DswtjxOXffCf+7zrTcK3aKrQHud
 gBWg==
X-Gm-Message-State: AOAM531kUsZTQFDYK7Rk/ZowdUCF4I3jBU6d3PlGDpDmyDDO0b6ulqHl
 UxWMNRA3Ij/2ul5NBlBBO6olIQ==
X-Google-Smtp-Source: ABdhPJzpuqxZyPb0Aal7oIwfG1XVN3zZsfnOTv+F0lFTZPwG9KQdFdeL5m54z3cXCPgTPAfvJx5dzw==
X-Received: by 2002:ac2:51d0:0:b0:43a:df78:18c with SMTP id
 u16-20020ac251d0000000b0043adf78018cmr18410052lfm.168.1645564984361; 
 Tue, 22 Feb 2022 13:23:04 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id k14sm1847626ljh.82.2022.02.22.13.23.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 13:23:03 -0800 (PST)
Message-ID: <c388d91c-ea00-8fa8-3fcf-4ce754edb1b4@linaro.org>
Date: Wed, 23 Feb 2022 00:23:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 1/4] drm/msm/dp: Add basic PSR support for eDP
Content-Language: en-GB
To: Doug Anderson <dianders@chromium.org>
References: <1645455086-9359-1-git-send-email-quic_vpolimer@quicinc.com>
 <1645455086-9359-2-git-send-email-quic_vpolimer@quicinc.com>
 <CAA8EJppRUZ5OHSMS1NdFXDDvRXJFNsdoJDWgU7ZPUoAW9OD+eQ@mail.gmail.com>
 <CAD=FV=W2wi47egKmWDS+BZGSy85K+A8jX0gvi6CYhmFgoBBRmw@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAD=FV=W2wi47egKmWDS+BZGSy85K+A8jX0gvi6CYhmFgoBBRmw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: quic_kalyant@quicinc.com,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, quic_vproddut@quicinc.com,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Andy Gross <agross@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/02/2022 22:25, Doug Anderson wrote:
> Hi,
> 
> On Mon, Feb 21, 2022 at 7:12 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>>> +static int dp_link_psr_status(struct dp_link_private *link)
>>> +{
>>> +       u8 status[2];
>>> +
>>> +       drm_dp_dpcd_read(link->aux, DP_PSR_ERROR_STATUS, status, 2);
>>> +
>>> +       if (status[0] & DP_PSR_LINK_CRC_ERROR)
>>> +               DRM_ERROR("PSR LINK CRC ERROR\n");
>>> +       else if (status[0] & DP_PSR_RFB_STORAGE_ERROR)
>>> +               DRM_ERROR("PSR RFB STORAGE ERROR\n");
>>> +       else if (status[0] & DP_PSR_VSC_SDP_UNCORRECTABLE_ERROR)
>>> +               DRM_ERROR("PSR VSC SDP UNCORRECTABLE ERROR\n");
>>> +       else if (status[1] & DP_PSR_CAPS_CHANGE)
>>> +               DRM_INFO("PSR Capability Change\n");
>>
>> DRM_DEBUG_DP
> 
> Not sure I'll have time to go back and review the series, but one
> thing that caught my eye as this flashed through my inbox is that I
> think all of these "shouting" are deprecated. It's even officially
> documented now as of commit d2f0a8afc1be ("UPSTREAM: drm/print: Add
> deprecation notes to DRM_...() functions").

Agreed. But not the DRM_INFO too.


-- 
With best wishes
Dmitry
