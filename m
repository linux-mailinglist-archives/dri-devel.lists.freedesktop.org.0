Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3A65B2117
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 16:46:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 837A310E401;
	Thu,  8 Sep 2022 14:46:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 987E910E401
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 14:46:16 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id q21so13890928lfo.0
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Sep 2022 07:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=0g7jm1tfMeS37DuswgCHsZL4cnMeiZpu8DKcWfcPMs4=;
 b=dk0WmkaktqSTA/4u8/wXgL/F5Tz7UEWPdORoVfc618TgX1XHw+OtVIDs7ycXUMfAUV
 8ALm5Z9GqOFENm5lwWu7juE/SlD+2v0xGw2BmGSZjBJvBHF5pbfqv4wazLU3/x35fRw1
 iBuXwKaRqlpNU2SfGnMk6LDGwtAM7/DCT83/LN8Uen/0X7fjRwfQPLBvupBHGH7CPQgb
 1R5TtdXqBAh+mgpei6KUozbWayptzTwRIMYogQ3YwRNCZ4zUSf2UnshYUkasKx9nV9UK
 JP0W6EzjakzDjMl+f7BdB+m2dhYLBbHVZG7eJ1vm3hl9xVAghafW1FapfmimPpY6fcdp
 oEHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=0g7jm1tfMeS37DuswgCHsZL4cnMeiZpu8DKcWfcPMs4=;
 b=B5Ezc/2ZhiYhfSm2JJ4G/j9l0fA2aK5t9y5NCtChbWmtEny31GS4ge5cqjB9n/8GJ7
 XsLZZ64Y+VSdsW8Ckwd/5oOhlpRrYyrVfk2Gc9DtO4ZcHInXVbMT3on/lRIVD0kvYf8P
 ZBkUahKwkBZ5IPIPWH0+Js8yML/kExk0JzO3b0ib53lVOZehou3kUxIpY+Z6JXHwHqLT
 fqyKlbosuNNsdQ/YCgg4rScJtG1jZ4Uj2GwaDklKF/UbXcTyus+x1EaZYQArRjtp1+OO
 aDobg5njCIvHynL0AzLJxRRQ4rncz2AnCxL/lbEYVsns1Q8RFwu+3DEeKVubIO318A6W
 KBRQ==
X-Gm-Message-State: ACgBeo2VOvaJ4N/tUJqoqC3oaY4A/+SvpESHllUuKvANt8iSYInKhjIC
 NyIOzNMr+9e6aVcu3uEizsZuhQ==
X-Google-Smtp-Source: AA6agR50EzklNl1HXu9tN8I/TO/HfpAqxxK5ACablQY07eWbAvOhdafOZVGz18+SZBIzH0T8mDMgiw==
X-Received: by 2002:a05:6512:3f01:b0:491:9b9f:a54a with SMTP id
 y1-20020a0565123f0100b004919b9fa54amr3042107lfa.160.1662648374976; 
 Thu, 08 Sep 2022 07:46:14 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 o13-20020a05651205cd00b00492dba3c85asm3062317lfo.220.2022.09.08.07.46.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Sep 2022 07:46:14 -0700 (PDT)
Message-ID: <9fa2fc18-9cbf-6f21-f850-68ce2b0331a4@linaro.org>
Date: Thu, 8 Sep 2022 17:46:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [RFC PATCH 2/3] drm/msm: filter out modes for DSI bridge having
 unsupported clock
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org
References: <1661830389-22439-1-git-send-email-quic_abhinavk@quicinc.com>
 <1661830389-22439-3-git-send-email-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1661830389-22439-3-git-send-email-quic_abhinavk@quicinc.com>
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
Cc: dianders@chromium.org, dri-devel@lists.freedesktop.org, swboyd@chromium.org,
 seanpaul@chromium.org, quic_jesszhan@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/08/2022 06:33, Abhinav Kumar wrote:
> DSI interface used with a bridge chip connected to an external
> display is subject to the same pixel clock limits as one
> which is natively pluggable like DisplayPort.
> 
> Hence filter out DSI modes having an unsupported pixel clock
> if its connected to a bridge which is pluggable.
> 
> Ideally, this can be accommodated into msm_dsi_modeset_init()
> by passing an extra parameter but this will also affect non-dpu
> targets. Till we add the same logic for non-dpu chipsets, lets
> have this as a separate call.

I think this makes DP/DSI depend too much on the DPU and DPU internals. 
Can we instead use clk_round_rate() in the .mode_valid in DSI/DP/HDMI 
drivers in order to check that the requested rate can be achieved?

-- 
With best wishes
Dmitry

