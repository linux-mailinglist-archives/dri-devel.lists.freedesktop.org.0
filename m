Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6210811FF7
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 21:29:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6259E10E80C;
	Wed, 13 Dec 2023 20:29:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9061010E80C
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 20:29:49 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40c2718a768so72494635e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 12:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702499388; x=1703104188; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Zw2AbkoN/4FIKkUWexE+EWqV2AcpdmgqKqjwrsLePhs=;
 b=T2ZcCIox//gi/42Xhm8xwe9KV0hOSn3aKkA+8ulAQkuZ6u9YiJt2ORQCrFA8r5166G
 gQ+lwLEXgQPromS0xdIFpTqb8spcTW5XbFthyoZYw3F+p056/oUkLuqKCbkKLL0WVqnK
 apD0pYta5SDT6WdJ4c2adk0CVtSYhNp5rM583LQCmeJXBJ/Jrhg1q+AOyYiIeqUUhnyB
 TXW+RH+zSHpv/lCzEfpzXK+p+mTlfZIZ76wdQxN79VDGaUgbYR9rtVs0U+N4ZEl//HJF
 awJU5r/KzIfmsyT7F2vQrotrtfaZCUo+UIk00i0sA/MeyjEBEyVeFtxR29PV2M3thZfF
 +K/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702499388; x=1703104188;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Zw2AbkoN/4FIKkUWexE+EWqV2AcpdmgqKqjwrsLePhs=;
 b=WQjKnQQ7V+fQTGThCYro0UjPkuLDwD3mRke1W/plCMrIW66U8uBIxlaV0fTvlLZJ3A
 A4NTdW6ZZhOWLKHvTE5TgVi1mvYHvjbXQixwq5Q3tgyNBLIgbMcpyf/tqZdIj1q90SaT
 hjn3D2vHXDWJg7moY3F10HkHou7G97G+V6l8ihAWYlLX64TU75YbE2GqDc6GkPw+Ph2a
 bQwOcmccW/01UUvbejKiFf4SbVWKiPkGnjnrwpO6cZ6ndxV5Zo/VmqDXUCze6s5ADf5U
 dosQVcyn/VAPRXNE+ZdZTFit5uec23iiszUFyG7VsbU33ZgGTRzMB+dPHcf5GeZ8tcB/
 IJUw==
X-Gm-Message-State: AOJu0Yxc2e1Aty3kL7u8FLuE7HYXAiIiN5Z08UAEO/uL6WBfiXvlihc9
 Bu1bM00j/jNEoIIm60iCMg==
X-Google-Smtp-Source: AGHT+IG20yw7g9GqI9IbadFk19Exl/zGderaqPqj/VFPT7HLhLixQNc2+B3uD+potrr7JRkM+oOFEA==
X-Received: by 2002:a05:600c:3648:b0:40b:4812:22e2 with SMTP id
 y8-20020a05600c364800b0040b481222e2mr5226786wmq.11.1702499387771; 
 Wed, 13 Dec 2023 12:29:47 -0800 (PST)
Received: from ?IPV6:2a02:810b:f40:4300:3bf6:bcc0:fe50:883f?
 ([2a02:810b:f40:4300:3bf6:bcc0:fe50:883f])
 by smtp.gmail.com with ESMTPSA id
 n21-20020a05600c4f9500b0040b36ad5413sm21179364wmq.46.2023.12.13.12.29.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Dec 2023 12:29:47 -0800 (PST)
Message-ID: <a5889aba-75b6-4671-918b-26a4b9ec12c5@gmail.com>
Date: Wed, 13 Dec 2023 21:29:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/31] Fix and improve Rockchip RK3128 support
Content-Language: en-US, de-DE
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lee Jones <lee@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>
References: <20230829171647.187787-1-knaerzche@gmail.com>
 <2167016.irdbgypaU6@phil>
From: Alex Bee <knaerzche@gmail.com>
In-Reply-To: <2167016.irdbgypaU6@phil>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Elaine Zhang <zhangqing@rock-chips.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-phy@lists.infradead.org, Johan Jonker <jbx6244@gmail.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Heiko

Am 12.12.23 um 21:03 schrieb Heiko Stuebner:
> Hi Alex,
>
> Am Dienstag, 29. August 2023, 19:16:16 CET schrieb Alex Bee:
>> this series fixes some issues I found when testing my "new" RK3128 board
>> with the mainline kernel and adds some core functionality like SMP bringup,
>> usb and networking.
> before I discard this thread, is everything from here migrated to
> separate serieses or are there patches in this big pile that are still
> relevant on their own, that haven't been applied?
> [I lost track of what did go where ;-) ]

No worries - I kept track :)

Not everything is re-sent yet (sound nodes, RK3126/RK3128 split-up) but 
you can discard this and will re-send everything left in separate series 
(as I said [0])

[0] 
https://lore.kernel.org/linux-arm-kernel/170109134007.42627.12929766893521974712.b4-ty@kernel.org/T/#m63efa1c1379353b5cf764d2f9a260cf0329c864c

Regards,

Alex

>
>
> Thanks
> Heiko
>
>
