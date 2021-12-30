Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 618D6481E90
	for <lists+dri-devel@lfdr.de>; Thu, 30 Dec 2021 18:18:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8360610E2D3;
	Thu, 30 Dec 2021 17:17:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17CEB10E2ED
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Dec 2021 05:30:46 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id x7so52245030lfu.8
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Dec 2021 21:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yC/MCLvkq0jgOYQF3ZLeqKHc/yJkw5VXAMTxeSh1jqE=;
 b=ZoTqRmVBr0o49x1iDBiM8xs/ZclzbacaJHsNDbh1g9dUWgx8YAn+zZPTDk/HGEi5Oe
 kilDaUYzUPEnwjr0a2zytYPHxzEO8SZRb9/HnO9ZCc71UICoWwS/WSmHamOmf795sOoe
 sFNa0AYVx0INxfw+axXR8NpCb4gD6WWHjHvTsxDPUH/rNYO/vdygw1cKOnDnQ7XlEgto
 3PU7l1PJZFF8m8TabMACd3LKd3s8D5CQ/TZrBXn1ER24FBzJSXcXE2OyYyPjV2mKSBML
 YMtPmTaidqv/8UopDt4+HDiUIJHBc4Dbmk2+k6Tv6B8V2O6+OG3DgpSkq6hm9q7D1Zzh
 enQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yC/MCLvkq0jgOYQF3ZLeqKHc/yJkw5VXAMTxeSh1jqE=;
 b=HDgFYHzLwuv/JC4j2QUeK/6KZ1Lv8fgB9oajP6nXck5n6b1e07AYcgzNbSa+VIsV5W
 KM3jm56W07tg3Z9jT14rXKfj/+Oz3NErPY0ea88YiszC8bYkXnKqHlNQNRA4lsvkU5Ui
 c6Udt29qMNwqGsK68U7PEHQuJzA8+6/DKknMA2QIohu0syaAFpm67aQLhVA+CLCqdfDV
 bOsTMzb4oZHKS7KWCrFzU/hadCw+qE19bX5KRLF8v8bnuFNA+R4lNKqRRkWyegsQh0Op
 y+0x5QR8YNFWETNkMFhtp/9pc1Ogs0nL3frWJuPYOOaBKWGtNEWBy7fWu9MTjaaSBAbp
 P/0A==
X-Gm-Message-State: AOAM532tn+/91DTaVimIfKuU0W95xJixUCDsRz/xzsynsnJ/hSzYXXbw
 AtnjocAS1+Rt0gobqTKNmmmAiA==
X-Google-Smtp-Source: ABdhPJwftSqfhSWtrRZJq1uTh5ApQT9aUecw59km9lfdL/IUeC2ineVEfRUPlcGDp30Eoz+kWiXerg==
X-Received: by 2002:a19:f806:: with SMTP id a6mr25845836lff.642.1640842244234; 
 Wed, 29 Dec 2021 21:30:44 -0800 (PST)
Received: from [192.168.112.17] (nikaet.starlink.ru. [94.141.168.29])
 by smtp.gmail.com with ESMTPSA id m2sm2380803lfu.254.2021.12.29.21.30.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Dec 2021 21:30:43 -0800 (PST)
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r8a77961: Add lvds0 device node
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20211224052309.1997096-1-nikita.yoush@cogentembedded.com>
 <20211224052309.1997096-3-nikita.yoush@cogentembedded.com>
 <YcyTV4fJqMHIeyYB@pendragon.ideasonboard.com>
 <87626d61-ada0-c220-bea5-5330f5256629@cogentembedded.com>
 <YcyXQxW3kRqQ2Yv0@pendragon.ideasonboard.com>
 <39f70781-831e-c86a-ec5f-68f2b4bd3d62@cogentembedded.com>
 <Ycy4AMAT53Uzf+K7@pendragon.ideasonboard.com>
 <bb6ef732-7cd2-5ba9-0eef-caf2fbfbf829@cogentembedded.com>
 <Ycze8wzD3Qi8YVAa@pendragon.ideasonboard.com>
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Message-ID: <123e3993-cb71-b6dc-e4f4-4cad1eb51b00@cogentembedded.com>
Date: Thu, 30 Dec 2021 08:30:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <Ycze8wzD3Qi8YVAa@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 30 Dec 2021 17:17:01 +0000
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
Cc: devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>> I'd prefer to make each DT fragment to use only either entities defined in that fragment itself, or
>> defined "interface entities" between this and "neighbor" DT fragment.
>>
>> Such as:
>> - SoC's DT fragment defines a named port/endpoint to export video stream at
>> - board's DT fragment defines a named panel node corresponding to panel plugged into board's physical
>> connector, and connects endpoints with SoC's video export,
>> - panel's DT fragment extends the panel node from board with video mode information for this particular
>> panel.
>> ...
 >
> I agree it's annoying, but we'll have a similar problem, just the other
> way around, with an endpoint defined in the SoC dtsi. Many R-Car SoCs
> have two LVDS encoders, and you can attach a panel to either of them.
> Some boards use LVDS0, some boards use LVDS1, and some boards could even
> use both.

The case of "some boards use LVDS0, some boards use LVDS1" is directly addressed by what I'm trying to 
suggest. The per-board DT fragment can completely hide board's connection details, without a need for 
any new concept.

The case of "some boards could even use both" indeed needs a some way to parametrize panel's DT 
fragment, and perhaps load two instances of it with different parameters. To some extent this is doable 
via preprocessor magic and multiple includes, although this approach has obvious disadvantages.

> A real solution for this problem will require a new concept. The "DT
> connector" proposal is related to this problem space. There's also a
> proprietary implementation in the Rapsberry Pi boot loader of a
> mechanism to support parametrized overlays ([2] and [3], or [4] for an
> example of how a panel reset or backlight GPIO can be parametrized).

So the problem is already recognized for years...  what stops from wider adoption of this or similar 
solutions?

And - if/while that is not being done - can't we at least try to follow more portable DT coding pattern 
while staying within existing concepts?

Nikita
