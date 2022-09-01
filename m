Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A505A9309
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 11:21:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A302110E670;
	Thu,  1 Sep 2022 09:21:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8650F10E670
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Sep 2022 09:21:39 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id j14so13171817lfu.4
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Sep 2022 02:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=JjiYojy0Mwz3pYQJAf6nrTE41i34ENgZHI5xsaPwkbs=;
 b=QgAVOF+/vTR23gXiTAAucIMrT6xpBgRluRcyan6ZkbCBcvfK9t7qM/oscy5mxbGgW6
 yiHVcseXrNhwyZRwcje8hiK34BS/ZgwXTOdR2ba0BbrvVPvmnUmDmQj1HPfupjOkywfx
 XPMnS70CqhpwVZCNHpJleXKtZY9LNVrIYreW9p42W2mKoJZZCZVCVHYqqXSu6Xdnw6qA
 vc9Fk4Zuwoc0D9TT9C2iuHkdz6AahWd1MlPxIBTN7RtZwDoYCfTZpNTVrxKxHuGruVM3
 2KgfRak+QpSWD3OgRJXAAVmLE+//leXzwgE+1ZXfcExDDl3hvS1j849RBo0mC9iwzPqE
 1Tqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=JjiYojy0Mwz3pYQJAf6nrTE41i34ENgZHI5xsaPwkbs=;
 b=2GDDwBE5lFN9JXW0T22ontr2atzjec//Bj/DXcXgYnhRxamu1yLAFtrVd5zTzmL4rD
 vn3EleFHPH1bn1sXJ6j7r5ZQ6AGUhxWQXHlGfgvZrfvXAM/wOMt3ETKjoNePwQO/8Z7g
 MI1/Otj7qVPE4RPXxMMjcIUoyIgAqGJ6jlrU/C9PhkAAbXrPg3paLjI/ZWTYM0Ng994w
 LnSkZgZWnUjGIo2Ui6I6gvxUAAuj/e5lHVR7zeg+nXHDhJGvuPp545oxvpp3i/WrlFCi
 XTouErIi8IikJV+kOAOSWo//IifttDaoiZtntm1yed6hJuyZNzieXBYHJ1KrybG+l/FF
 qvyA==
X-Gm-Message-State: ACgBeo0k9zgweAUmhYo6bqO5loU8t2sCHXxnG1+Th497wIYi5GFO2qlF
 f+5BHuddmcVgCUQHT0zrLr5DFQ==
X-Google-Smtp-Source: AA6agR5xBKtqNVBobHsboicM3GsM+gKu8FjT9rT6Hgc1fgYbyDDsJMPvBhpW0VBSx8Ht3bv9lehQ9Q==
X-Received: by 2002:a05:6512:2293:b0:492:f04f:2ff9 with SMTP id
 f19-20020a056512229300b00492f04f2ff9mr9908720lfu.95.1662024097903; 
 Thu, 01 Sep 2022 02:21:37 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 10-20020ac2568a000000b0048a9e18ae67sm2293466lfr.84.2022.09.01.02.21.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Sep 2022 02:21:37 -0700 (PDT)
Message-ID: <f6868bf1-445b-e350-5032-09595666449b@linaro.org>
Date: Thu, 1 Sep 2022 12:21:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [RFC PATCH 0/3] drm/msm/dp: several fixes for the IRQ handling
Content-Language: en-GB
To: Johan Hovold <johan@kernel.org>
References: <20220901091527.1992208-1-dmitry.baryshkov@linaro.org>
 <YxB5R/6u9/ERyUSP@hovoldconsulting.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <YxB5R/6u9/ERyUSP@hovoldconsulting.com>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/09/2022 12:20, Johan Hovold wrote:
> On Thu, Sep 01, 2022 at 12:15:24PM +0300, Dmitry Baryshkov wrote:
>> Johan Hovold has reported that returning a probe deferral from the
>> msm_dp_modeset_init() can cause issues because the IRQ is not freed
>> properly. This (compile-tested only) series tries to fix the issue by
>> moving devm_request_irq() to the probe callback.
> 
> Please try to reproduce the issue yourself before posting untested RFCs.
> We're all short on time.

I do not have a working DP setup. Thus it's either this, or nothing.

-- 
With best wishes
Dmitry

