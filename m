Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 224B332F5C7
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 23:18:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C22E76EC7A;
	Fri,  5 Mar 2021 22:18:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02BEF6E1D3
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 22:18:29 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id 130so3585765qkh.11
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Mar 2021 14:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kEPdvK71SYnnYxU/iYMYQe/u4D1Hboa4Ycom7Yjf1Uw=;
 b=LAiu13ud2ieteI1GC7oTRufOmHJCXPRSrLKl5fh0T8ZtOH0SD/XlcVSIeqtPxBrL0v
 iorOjbfWYdI1rWZzDfENDWZx8rWebaQIaZN0iTWtJd+9UisdnfWvF0ZbBMn7/8T5RkXE
 /BvplMJpUvWr0rMw7G6eU9PvsjcrG7DHhnA8e9G2HaD31Up6Hhrnod7o+pyJem9nXIsv
 K1CQefEQsOIioZWB7+IYnXZLZkLGu0yxY44HFIDj+BNXPnXLC0BZQT4bOoPA/QB135zk
 p3SNWX8ZsmJeiCQG6SQZfV52KZp/A/Wi8b9PP/MEeArtw/cAjHY26STc9U0jeXtca+xb
 H2fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kEPdvK71SYnnYxU/iYMYQe/u4D1Hboa4Ycom7Yjf1Uw=;
 b=i2s4zBGONsDLQ7vd38HRtRJy12htR2L2X4cAIH9MwDnXgJXuGj6wWDIDnPVlT15s4n
 zHD/F8PU6jlbuThqY4IEAZ/JeN5/X0fuzaHyTj2hMmt+q2RC9ReUI9UmntPwcCjyMIg3
 /eBbRxVCR5BSPvuds2pvEMUfV5iYJKqxPrPtjfgi6F5184WBwPyp3hbMRWJ2tPYZbEFT
 2nOY/3i9+1aFuIeY696ycn3xykZ5CxMp5asAyBXbdJFEp6g+ErPl56Q+ZyWismFaK5RP
 13gNe4uxk5RkOI2kJ1aDNL9nb5esCNiKDqQgjPSivy0wJWLOKy9YITjY4xiXXvRQ7mFn
 lswg==
X-Gm-Message-State: AOAM5307ADry4YuXqBOtDqZ5CPdrlXY5kDv2qTBDFeUMQIZN5lujop0e
 +SKmbWCSOtimgoLq1+AhQIO5vg==
X-Google-Smtp-Source: ABdhPJzQrZBfsrI9YYiNPI9gMDvzV87Lgi/44erfU6o3ciulWwl/Z0QtFrZefcU5AlH8znMSAZt34w==
X-Received: by 2002:ae9:ef89:: with SMTP id
 d131mr11080051qkg.214.1614982709146; 
 Fri, 05 Mar 2021 14:18:29 -0800 (PST)
Received: from [192.168.0.189] (modemcable068.184-131-66.mc.videotron.ca.
 [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id z2sm2898711qkg.22.2021.03.05.14.18.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Mar 2021 14:18:28 -0800 (PST)
Subject: Re: [PATCH] drm/msm/dsi: support CPHY mode for 7nm pll/phy
To: Rob Herring <robh@kernel.org>
References: <20210215162805.21481-1-jonathan@marek.ca>
 <20210305214802.GA701567@robh.at.kernel.org>
From: Jonathan Marek <jonathan@marek.ca>
Message-ID: <cbaf67d2-d5b8-9684-061b-8de9382a438b@marek.ca>
Date: Fri, 5 Mar 2021 17:17:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20210305214802.GA701567@robh.at.kernel.org>
Content-Language: en-US
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jordan Crouse <jcrouse@codeaurora.org>,
 Rajendra Nayak <rnayak@codeaurora.org>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Douglas Anderson <dianders@chromium.org>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Konrad Dybcio <konradybcio@gmail.com>, Viresh Kumar <viresh.kumar@linaro.org>,
 "Kristian H. Kristensen" <hoegsberg@google.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Dave Airlie <airlied@redhat.com>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/5/21 4:48 PM, Rob Herring wrote:
> On Mon, Feb 15, 2021 at 11:27:44AM -0500, Jonathan Marek wrote:
>> Add the required changes to support 7nm pll/phy in CPHY mode.
>>
>> This adds a "qcom,dsi-phy-cphy-mode" property for the PHY node to enable
>> the CPHY mode.
>>
>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
>> ---
>>   .../devicetree/bindings/display/msm/dsi.txt   |  1 +
>>   drivers/gpu/drm/msm/dsi/dsi.c                 | 12 +--
>>   drivers/gpu/drm/msm/dsi/dsi.h                 |  6 +-
>>   drivers/gpu/drm/msm/dsi/dsi.xml.h             |  2 +
>>   drivers/gpu/drm/msm/dsi/dsi_host.c            | 34 +++++--
>>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         | 49 +++++++++-
>>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |  3 +
>>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     | 89 ++++++++++++++-----
>>   drivers/gpu/drm/msm/dsi/pll/dsi_pll.c         |  4 +-
>>   drivers/gpu/drm/msm/dsi/pll/dsi_pll.h         |  5 +-
>>   drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c     | 71 +++++++++------
>>   11 files changed, 210 insertions(+), 66 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/dsi.txt b/Documentation/devicetree/bindings/display/msm/dsi.txt
>> index b9a64d3ff184..7ffc86a9816b 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dsi.txt
>> +++ b/Documentation/devicetree/bindings/display/msm/dsi.txt
>> @@ -124,6 +124,7 @@ Required properties:
>>   Optional properties:
>>   - qcom,dsi-phy-regulator-ldo-mode: Boolean value indicating if the LDO mode PHY
>>     regulator is wanted.
>> +- qcom,dsi-phy-cphy-mode: Boolean value indicating if CPHY mode is wanted.
> 
> This is board or SoC dependent? The latter should be implied by an SoC
> specific compatible.
> 

It is board specific, 7nm dsi phy can operate in either D-PHY or C-PHY mode.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
