Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C8C361EE5
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 13:39:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 813A56E1CF;
	Fri, 16 Apr 2021 11:39:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A5176E1CF
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 11:39:02 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id p6so19660740wrn.9
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 04:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ch3B1QB839TpxbyTCaHh7+PjqFlJHeFp/HZU3MiGscw=;
 b=EkzQjer0WgUEgQkZ/WCQ1qZSR+xOL8CYkmgyGZqX8M/cpDnJ3Jdq7NAUhqBGqi3yjA
 RvxLBAhdzA+iPTcZCJ9eRsGEGviRSKwt63OrvHOCS0KWJWgntOZuiNpq0t2/LzV1v7RI
 XdY+G5TuRKGbvh/bK/vA+nuoL3oWvnx81/1QcUl0hPVXiX6lne0wZcU39Dnw01eexj4/
 aAmRmD45JLqraflxN0P9n9NRW+tOLy31DVmNZNxB1sJtCQ6rBU4/vaMe3bZ/bjGdQU/c
 vNXcsAyBt2CKFWL7r7Dzm/htr5Q83g2zk0NzsSft44P0UdjSeRe0LKdJOehBAf0HNf2D
 7mvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Ch3B1QB839TpxbyTCaHh7+PjqFlJHeFp/HZU3MiGscw=;
 b=GealNR+kPTvMGFwXfc30S6cJsAC5akWaYmYClL+m0oKrNICbCLqdZF4snXRp+k87Pq
 HRSL6xf/hcAb0mvAMCiMv1Pm5hN7pAEB6OHrG4sJJN1qa9M5u9YwUDeLBT4KBhc6Bw37
 KBktao5Kz6WWf2FqYeer9XKhlZgZqWi0BbQaDhn74SaBgqXqf51Nwxl/+gn91he+mDJv
 Hi5fbI3Od62y5XqiKfcbNmiWj/LaN8g/Gy8QlSFJcJqN0HE0xUA1V9+7cEeZyzVL+1LC
 mugeyaszZ19ADlnCkrQjstyL/d6ULmrgXreFbejwTldcn1ZjvUOhHplXLwioAwsunQm+
 hdKw==
X-Gm-Message-State: AOAM532JyKJP+lnvJmOhh8aCzyZlVTGUDIIxin7OK1ihBRmJ8FUzgsfP
 zHp0+6O9jWeDkkYkzZlQ3tEhQw==
X-Google-Smtp-Source: ABdhPJxV3W8/JmRRJjOYH3rbQ9IP5SnGF8wi+6Gmv+4bzOiXNfk7ypsXlDfWMH46OpTJMpcWlMSOlg==
X-Received: by 2002:a5d:4d46:: with SMTP id a6mr8565355wru.3.1618573140641;
 Fri, 16 Apr 2021 04:39:00 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:6e70:fd4e:dfdb:68d7?
 ([2a01:e0a:90c:e290:6e70:fd4e:dfdb:68d7])
 by smtp.gmail.com with ESMTPSA id n2sm9756992wmb.32.2021.04.16.04.38.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Apr 2021 04:39:00 -0700 (PDT)
Subject: Re: [PATCH 0/2] drm/bridge: dw-hdmi: disable loading of DW-HDMI CEC
 sub-driver
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20210416092737.1971876-1-narmstrong@baylibre.com>
 <YHlfqJIlUh7eytty@pendragon.ideasonboard.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <96b9e144-0791-4c19-3e3c-b0e9efb86138@baylibre.com>
Date: Fri, 16 Apr 2021 13:38:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YHlfqJIlUh7eytty@pendragon.ideasonboard.com>
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
Cc: jernej.skrabec@siol.net, jonas@kwiboo.se, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robert.foss@linaro.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/04/2021 11:58, Laurent Pinchart wrote:
> Hi Neil,
> 
> On Fri, Apr 16, 2021 at 11:27:35AM +0200, Neil Armstrong wrote:
>> This adds DW-HDMI driver a glue option to disable loading of the CEC sub-driver.
>>
>> On some SoCs, the CEC functionality is enabled in the IP config bits, but the
>> CEC bus is non-functional like on Amlogic SoCs, where the CEC config bit is set
>> but the DW-HDMI CEC signal is not connected to a physical pin, leading to some
>> confusion when the DW-HDMI CEC controller can't communicate on the bus.
> 
> If we can't trust the CEC config bit, would it be better to not use it
> at all, and instead let each platform glue logic tell whether to enable
> CEC or not ?

Actually, the CEC config bit is right, the HW exists and should be functional, but
this bit doesn't tell if the CEC signal is connected to something.

This lies in the IP integration, like other bits under the "amlogic,meson-*-dw-hdmi"
umbrella.

The first attempt was by Hans using DT, but adding a property in DT for a vendor
specific compatible doesn't make sense. Another idea would be to describe the
CEC signal endpoint like we do for video signal, but I think this is out of scope and
this solution is much simpler and straightforward, and it's more an exception than
a general use case to solve.

Neil

> 
>> Jernej Skrabec (1):
>>   drm/bridge/synopsys: dw-hdmi: Add an option to suppress loading CEC
>>     driver
>>
>> Neil Armstrong (1):
>>   drm/meson: dw-hdmi: disable DW-HDMI CEC sub-driver
>>
>>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 2 +-
>>  drivers/gpu/drm/meson/meson_dw_hdmi.c     | 1 +
>>  include/drm/bridge/dw_hdmi.h              | 2 ++
>>  3 files changed, 4 insertions(+), 1 deletion(-)
>>
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
