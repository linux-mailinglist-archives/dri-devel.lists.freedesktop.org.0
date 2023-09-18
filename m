Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AFD7A5596
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 00:01:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BACE210E103;
	Mon, 18 Sep 2023 22:01:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C714C10E103
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 22:01:21 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3214d4ecd39so1539118f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 15:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695074480; x=1695679280; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=28L3b3LgO4dSGT7nPX8WAFQW8XZe7uZK0YDgAHn+49c=;
 b=UHZQLSNLNcIPSKND2S9ESsiFBTm0AAwrPDABMsrNORt6uRrYElOeoXq8nthh8pSZX+
 ZKY+RKL3F/QOLBNWmVRFoUM+dep2E3wsr+UNTzNfoL6JWWo8JNeDuLNLD73G27WKSleS
 GLt3XBjhmc4UVR/rgrWF7dOEDzH6aoEKx48s55W8CQju0IehjV/LGXE6Iu3nJa3w8SXu
 5rJYrMrPq9i/KG/d+Ygh1rxLZnD6TWp90rHTl08DurxbwH5FMWA56HWia5bXhbbbB7iE
 nod5TJnFUXpL+ttf8+bt5MpKvMq5tdsamuiSVfZ9nLazZdzUeqvz/+2W5UplouZIpyCR
 bO2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695074480; x=1695679280;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=28L3b3LgO4dSGT7nPX8WAFQW8XZe7uZK0YDgAHn+49c=;
 b=LaNdXdEaUyPNr0lO2jhVHTA3ZB6Iw4H4tx+rZIy5ynacap/eHlaGYYZsBh91tNUSCB
 Ok3+dHFCp5y00cbnNkqKZ2xEWwLZgQdJ+qBc79zdF9UcUreII594Iag89vIofLRI/X7a
 Gph2/1BfwNew5Loj87elm9wFlhSSOUB4t6x03e6gnFeOjFRzKzczO9iuyTKpXLVqxyS1
 kpYaUaEy6nQAwBoQFnTfXVNrTvtcz/WyEjYqLzf+hsqzz5ftDysA57BALrz9UQ2kxfm3
 HqNU59Jw9PiSJNbchF5ezsDptzs4Lmj5rQ50IOxmEun33R5/SX+YcSGlwhwyy+pv4BFy
 nELg==
X-Gm-Message-State: AOJu0Yynr7GvSfRE0v1fupBrLaIhq2tl/bpBE9owDyXj6rf8tPbLmZLd
 vOpYYG7ko3gQAr/i4Bo18qE=
X-Google-Smtp-Source: AGHT+IH2UFa49DtdyamG5yUSfknKQZJStRs6qw3xl7JLBXb7QNt0RMC9JPqUZOrGR/bIZOJt/+JegQ==
X-Received: by 2002:a5d:444a:0:b0:31d:da10:e47e with SMTP id
 x10-20020a5d444a000000b0031dda10e47emr8949546wrr.57.1695074479899; 
 Mon, 18 Sep 2023 15:01:19 -0700 (PDT)
Received: from [192.168.1.167] ([37.165.191.167])
 by smtp.gmail.com with ESMTPSA id
 f16-20020a5d4dd0000000b0031c6cc74882sm13634566wru.107.2023.09.18.15.01.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Sep 2023 15:01:19 -0700 (PDT)
Message-ID: <8dc0e1c3-b132-4c31-a0c1-de78221985b0@gmail.com>
Date: Tue, 19 Sep 2023 00:01:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge/analogix/anx78xx: Add missing definition
Content-Language: en-US
To: Robert Foss <rfoss@kernel.org>
References: <ZPvagaXnQ/TlNEkJ@tora>
 <CAN6tsi7K6JqvaBcNrM2KhB=_Wg7JffGu+zWb13DeNrOwF_xrGw@mail.gmail.com>
From: Alicja Michalska <ahplka19@gmail.com>
In-Reply-To: <CAN6tsi7K6JqvaBcNrM2KhB=_Wg7JffGu+zWb13DeNrOwF_xrGw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: neil.armstrong@linaro.org, jonas@kwiboo.se, jernej.skrabec@gmail.com,
 dri-devel@lists.freedesktop.org, andrzej.hajda@intel.com,
 Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Oops, my bad. I'm new to ARM development, so I forgot to update dt-bindings.

You should see a patch dropping soon (or already did), although I decided to move to a new email address (which hopefully shouldn't cause any issues).

On 18/09/2023 12:07, Robert Foss wrote:
> On Sat, Sep 9, 2023 at 4:43 AM Alicja Michalska <ahplka19@gmail.com> wrote:
> This compatible string needs to be added to
> Documentation/devicetree/bindings/ in a separate patch before this
> one.
> 
> 
> Rob.
