Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F5E4B741E
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 18:35:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81CD910E300;
	Tue, 15 Feb 2022 17:35:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 647A410E300
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 17:35:26 +0000 (UTC)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B63B73F33A
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 17:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1644946524;
 bh=+P9PcpKT0xdbty/hJ1bxhDi4Mvr/vrZbJ+31zABw+Os=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=MbRw2Ve1X/XfWjVfW69aWnIHbQnCdkusELs8x/o/Z+j2d33oozjvjFivXBHD//Ns7
 JaPj6G7n0sUA2G31wKU1sDJTUGlOMHPyztsPg+3rpvv6YoxOEmM1llt1kEX8ne51HR
 YHFO9pgVDC1Be/XC8RAhFrgHWkvb/c5TefolV9svt8MPBKOhYV9Pe6jSWoJuDDemqs
 7GkavfZsK9MupVej/ptlO4GgD+SeYla0Az6Buq5BFzqPIcE6thnQzl/c9XMyDTX0Ly
 S1czT2KzvFqJ6UrVjw3TsafYTF3v0tL2TUnxLzPZeNeDeLP2Gaa0QKFnZGqyJAhPWr
 RpHHMLqS9Bw5A==
Received: by mail-wr1-f71.google.com with SMTP id
 w26-20020adf8bda000000b001e33dbc525cso8595803wra.18
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 09:35:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+P9PcpKT0xdbty/hJ1bxhDi4Mvr/vrZbJ+31zABw+Os=;
 b=ityU1IJ3aB2eTWqxXOfjwERQiq3xdhb17bVoEbIoLTRklIRji/yJLWJiTwSlyC/5MC
 Yrs1kNVDupoND8wC+xsyKGzVVsa2IN6+4ROP3WrfUrOJQZeiuVUhZ3A/KMj4k1mseWyz
 hxLdOiHIEwVEGxIopbkVk8nH4Ibm3wbmZfd9eJRTzOpZ6A3ZmjHz5ijJwkHF/atJ7AQ+
 p4ksWzezqAzhpFqwLEMyGqci6IFtt5ShMEIqnCVYSg1OUdisNVqHajD2Bv5Ry8QXJ3zi
 l2JFn+8pwSjX6PLJEAUk3rUY5HfIGrOwpk37hj7twT/LLADafuQsXesFDZbd75QreL+g
 WSmw==
X-Gm-Message-State: AOAM53180czTRXXH1uTKAQH4CbpssDlGhg5GvzUgJvkIReFNYwOXhNMB
 F5LAWgcxlSfMESPdgf33uWJaXYPktgPM4Vqmcr6bigCo3TiuP7zUFocP7AlMkXGhUvR/12p2B18
 FvoKZO/7kiTVJPlJ8IG0e7oN6LPvKCm5JV9h6Azphv1E1ug==
X-Received: by 2002:a5d:68cd:: with SMTP id p13mr25432wrw.537.1644946524401;
 Tue, 15 Feb 2022 09:35:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwHVvxLlKwb0vEtmbBdnfyiKN8+jTxOLmhaciEyPHxsyHO6/CWWCijyKhPRtdxqziX1NdO0/Q==
X-Received: by 2002:a5d:68cd:: with SMTP id p13mr25416wrw.537.1644946524266;
 Tue, 15 Feb 2022 09:35:24 -0800 (PST)
Received: from [192.168.0.110] (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id s7sm16804963wrw.71.2022.02.15.09.35.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Feb 2022 09:35:23 -0800 (PST)
Message-ID: <d1ce6c2b-e1f3-1c2e-a6fd-d506848b2c12@canonical.com>
Date: Tue, 15 Feb 2022 18:35:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 25/35] iommu/mediatek: Migrate to aggregate driver
Content-Language: en-US
To: Yong Wu <yong.wu@mediatek.com>, Stephen Boyd <swboyd@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Douglas Anderson <dianders@chromium.org>
References: <20220127200141.1295328-1-swboyd@chromium.org>
 <20220127200141.1295328-26-swboyd@chromium.org>
 <7c517b787d1dd768372d0141f5078e3089e883cb.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <7c517b787d1dd768372d0141f5078e3089e883cb.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: freedreno@lists.freedesktop.org, Saravana Kannan <saravanak@google.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-arm-msm@vger.kernel.org,
 Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Russell King <rmk+kernel@arm.linux.org.uk>, Will Deacon <will@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/02/2022 12:03, Yong Wu wrote:
> On Thu, 2022-01-27 at 12:01 -0800, Stephen Boyd wrote:
>> Use an aggregate driver instead of component ops so that we can get
>> proper driver probe ordering of the aggregate device with respect to
>> all
>> the component devices that make up the aggregate device.
>>
>> Cc: Yong Wu <yong.wu@mediatek.com>
>> Cc: Joerg Roedel <joro@8bytes.org>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
>> Cc: Rob Clark <robdclark@gmail.com>
>> Cc: Russell King <rmk+kernel@arm.linux.org.uk>
>> Cc: Saravana Kannan <saravanak@google.com>
>> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> 
> + Krzysztof
> 
> The memory/mtk-smi.c is expected to get Ack from Krzysztof.
> 

Please resend with cc-ing me. I don't have the patch in my mailbox (wes
not on address list) and I also cannot find it in linux-arm-kernel.

Best regards,
Krzysztof
