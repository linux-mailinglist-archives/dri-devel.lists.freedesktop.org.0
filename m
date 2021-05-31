Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 478B039679E
	for <lists+dri-devel@lfdr.de>; Mon, 31 May 2021 20:10:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB2B06E929;
	Mon, 31 May 2021 18:10:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54F596E929
 for <dri-devel@lists.freedesktop.org>; Mon, 31 May 2021 18:10:22 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id v5so15966082ljg.12
 for <dri-devel@lists.freedesktop.org>; Mon, 31 May 2021 11:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RqDyoSo09lPZO7GbOVPgOTHVdV/YSSWYh+JNDnVcsAM=;
 b=vy0uLjUP4b9/AdZSWCBIJkGYi4KqsFzlAguK9G1kq10RuG2QJ9SaCin/z40CAuN9N1
 Ny/vrCiMNiRFhNLvJpQsZYZINHFf3EaQct9tsqIhk5tAUsuxyy09Jt+MFTo1pb2DxMnI
 1mhuGM8ZMFNvXLG2phlK9NzBPLb3Sc3JtSvvZKZm+MyP/a9uTs2m53y9gSdGz1FPy9Zp
 irfZkJPLzEw5eyrLgj7PQlgSEwbb6I7tSu/8WspO4dXuoX2ho+xANIhvHef5g176dFCi
 3lou3RZZLIaFfJeZfbA0ikQgl/ZH1MLhSjVh8yTZE2in8m24BXFIdgP66V1SntHfTsA6
 U1mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RqDyoSo09lPZO7GbOVPgOTHVdV/YSSWYh+JNDnVcsAM=;
 b=YhOfUUI7D9DyElE6BIcKgTofVV+ixWGTH4oM1c5zoVQNQs27e0jucOvJvkmE/bmbcf
 +2F+iAJWqIhWmoX8nwaT+wBSvwDh9D5lpJ5x3XP9PjHbyw2vzR+S4CxJP8v4IIQdWepP
 LbUFMb7JElavKMNnYT5medA9E0Z+mmCP5OO85pq8oqvSjLfeyN8/G0LpJIs/davR0HJe
 94g5HL+jfUArFbljsOIf4sAR8Q0aqw4fJUmhBZJH48kSGXVhlwSbFlQCojVwsyEsFZb3
 7+rqJwTrcDcuUtbyyiZX79qDXqnRsnLcdjqI33vnEDJ+Pem7M4hkQJQiq8n8emdblfi0
 2I7w==
X-Gm-Message-State: AOAM533XbpBsxa/iwkSNH2q3NhE95FszpyBMOmN6w6sia4BaMDCK/Ah9
 o/XHk1wUj62Ca4sODCECZJ3BGA==
X-Google-Smtp-Source: ABdhPJx3O6rn5NqZMzkPeijKZJM/6wPEQfnrs07M3tXIRXQouQa/sGsKJEEBs84ooxP684SBQE0Vag==
X-Received: by 2002:a2e:bf20:: with SMTP id c32mr17459713ljr.311.1622484620655; 
 Mon, 31 May 2021 11:10:20 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id y1sm1331962lfl.68.2021.05.31.11.10.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 May 2021 11:10:20 -0700 (PDT)
Subject: Re: [Freedreno] [PATCH v2 2/2] dt-bindings: display: msm/dsi: add
 qcom, dsi-phy-cphy-mode option
To: Jonathan Marek <jonathan@marek.ca>, Rob Herring <robh@kernel.org>
References: <20210423172450.4885-1-jonathan@marek.ca>
 <20210423172450.4885-3-jonathan@marek.ca>
 <20210503171139.GA2011901@robh.at.kernel.org>
 <0e083e31-d349-6d5c-048f-258414492b2c@marek.ca>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <4e623554-bbe4-4d4a-7b14-0ca4f684c7fb@linaro.org>
Date: Mon, 31 May 2021 21:10:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <0e083e31-d349-6d5c-048f-258414492b2c@marek.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: Sean Paul <sean@poorly.run>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28/05/2021 15:57, Jonathan Marek wrote:
> On 5/3/21 1:11 PM, Rob Herring wrote:
>> On Fri, Apr 23, 2021 at 01:24:40PM -0400, Jonathan Marek wrote:
>>> Document qcom,dsi-phy-cphy-mode option, which can be used to control
>>> whether DSI will operate in D-PHY (default) or C-PHY mode.
>>
>> Given this is a standard MIPI thing, I think this needs to be a common
>> property. We already have phy bindings that use the phy cells to set the
>> phy type which I think you should use here. See
>> include/dt-bindings/phy/phy.h.
>>
> 
> Is it OK to simply change the option to something like "phy-mode = 
> <PHY_TYPE_DSI_CPHY>;"?
> 
> (using phy-cells would be annoying to implement, with no benefit IMO)


To add another feather to the balance scales:

- `phys = <&dsi0_phy PHY_TYPE_DSI_CPHY>;` would bring knowledge about 
PHY mode to the DSI host (which does not really care about PHY mode)

- `phy-mode = <PHY_TYPE_DSI_CPHY>;` would stay in the PHY node, where 
this information belongs.

-- 
With best wishes
Dmitry
