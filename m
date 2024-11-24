Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6A79D7643
	for <lists+dri-devel@lfdr.de>; Sun, 24 Nov 2024 18:00:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16E7E10E0D2;
	Sun, 24 Nov 2024 17:00:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="egz3rfQa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32D9410E0D2
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Nov 2024 17:00:05 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-7250844b0ecso229911b3a.1
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Nov 2024 09:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1732467605; x=1733072405;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Wl6qaCA4FjrSrOlL89IvgGS74AwUKWEk0HxCEUUlHiI=;
 b=egz3rfQaFiiOVVMdizpYLhKePKWO4J4wOOIiCLO8yKXIT7Vm7GKGSPzcgFqG8TPIZ4
 vrTn+diHJ4YfCPYGP2ZtBQAbrId6TmbQBUnE7gzcMIO7o5/jtV0LewqTnVbj0bI0vir4
 FlRlKEJc1HtAuPp1Q3/aVbZf5XpZlUNrq/QkY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732467605; x=1733072405;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wl6qaCA4FjrSrOlL89IvgGS74AwUKWEk0HxCEUUlHiI=;
 b=Www2bfq7pFM69ugclODltsCyJ8lScwUj24RLVdFMzu0OgO0qEenvkI5ircDv1CmfyT
 ePzQ6yiXiw5S2ZvSXKWXqGmovfwlWhy96YMaL+IXhQteGhScvJfK/2KZCWjT/jFRrKlE
 TKw68fdd0oXfS8nDpg9+xMfwIsvKuYbAybzEVOiIMC2Z0FlLNSEvNCmDQ7oCSkyyCpXW
 HnHbj8IiLuvIpKjRtOwOuSRm4pwQzhbOzveqJbnId4eJryiRpRgX0Nxg52Gc1J6+4XcT
 5JD/S8GQT81Q4DEgc735L1zTINYIePHlTrrPjVTTmVVhxlLzNErkIFWlymCxYwfBGm0y
 UGjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7a+dC5hYc5nG4Sy9/3F8p/bmpy9+56J3kG8oc0MLkyahfKhvdhv31JYrMRgSfSjIUdEaXsldiyPg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy12Mfmn7tgNXzjmPlo5GPhGsILWvWU/TI5pcXL6tCrV51XNjAK
 TsMa59VDvEq1TdfAfpdbpwFEDhjOwCBhHucObzgCJqt/+p9GCb0nnf0pi6xJYw==
X-Gm-Gg: ASbGnctHrmxB9BZm6OZkUWRey2OCFAtH1hIf78e0KgJAk3LwQ/vFZgnOx0rSQcnoiBA
 qmmUadQWv68dx0V+aJLqdPiupUr2JsrjZE/y2TVFKQaYRzE1aS/URGlDs7fBWppVse5QDaHizy6
 u0zCTWXGl0zcZkhsIxdjPKvuQlUaIKCnMHxCS4xFcyCCMI/OSfrGbICE3XjqjagZ35nbpjiZyOx
 FMRhrLwHe4xrS3ULZdtVOwruoVSuJD7EP8BH6BDZO3LyuXe6PX0H17mcLJN4wtlB3WX2NCJniAn
 iU8WHJeiLjdim0jTuqrxXCLJ
X-Google-Smtp-Source: AGHT+IGwv6ltXszkTZNKWR1hqsTL9YkMtEQbN3d+uSOBBmXjG7uY/W92zTYfcHtsdsBE3RwDiVg++Q==
X-Received: by 2002:a17:903:22c2:b0:212:20c2:387f with SMTP id
 d9443c01a7336-2129f28ed87mr137598525ad.49.1732467605125; 
 Sun, 24 Nov 2024 09:00:05 -0800 (PST)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2129dc22344sm48729285ad.253.2024.11.24.09.00.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Nov 2024 09:00:04 -0800 (PST)
Message-ID: <13cfb66b-f904-4720-8829-a6d9db85aaa5@broadcom.com>
Date: Sun, 24 Nov 2024 09:00:01 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/37] drm/vc4: Add support for BCM2712 / Pi5 display
 hardware
To: Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Javier Martinez Canillas <javierm@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Stefan Wahren <wahrenst@gmx.net>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, Dom Cobley <popcornmix@gmail.com>
References: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
 <CAPY8ntBM=34pTiQ=t-CjtYEE5Ax6D=EtiY-sLT1keUkUMXuLeA@mail.gmail.com>
 <20241122-orthodox-mantis-of-reading-2dcdcf@houat>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20241122-orthodox-mantis-of-reading-2dcdcf@houat>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/22/2024 12:06 AM, Maxime Ripard wrote:
> On Thu, Nov 21, 2024 at 03:37:00PM +0000, Dave Stevenson wrote:
>> On Wed, 23 Oct 2024 at 17:50, Dave Stevenson
>> <dave.stevenson@raspberrypi.com> wrote:
>>>
>>> This series adds the required DRM, clock, and DT changes
>>> required to support the display hardware on Pi5.
>>> There are a couple of minor fixes first before the main patches.
>>>
>>> Many of the patches were authored by Maxime whilst working
>>> for us, however there have been a number of fixes squashed
>>> into his original patches as issues have been found. I also
>>> reworked the way UBM allocations are done to avoid double
>>> buffering of the handles as they are quite a limited resource.
>>>
>>> There are 2 variants of the IP. Most Pi5's released to date
>>> have used the C1 step of the SoC, whilst the 2GB Pi5 released
>>> in August is using the D0 step, as will other boards in future.
>>>
>>> Due to various reasons the register map got reworked between
>>> the steps, so there is extra code to handle the differences.
>>> Which step is in use is read out of the hardware, so they
>>> share a compatible string.
>>
>> A gentle ping on the patches for clk-raspberrypi (patches 29-33) and
>> Broadcom DT (patches 34-36).
>>
>> All the DRM and dtbinding ones are reviewed or acked (thank you!).
> 
> If the bindings and DRM patches are all merged, you can merge these at
> least.

I will be taking in the DTS patche shortly. Thanks!
-- 
Florian

