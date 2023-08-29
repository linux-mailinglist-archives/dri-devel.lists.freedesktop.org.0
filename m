Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC39A78CC3A
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 20:36:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7FCC10E47C;
	Tue, 29 Aug 2023 18:36:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1C5410E47D
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 18:36:28 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-500a398cda5so7630522e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 11:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693334187; x=1693938987;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=d7WlyYzqen5MI4P1iAbKBmvgwbKop0nGPA7AULKnw6o=;
 b=M7jKN5n3mbxOj6lToXlIBhPfrGvC6yd0H/btRqbTG5GN77QQEHXEnWUgB/u9h37HEM
 aQ3Yh0h+zDVLmyJK1+FIDzgTteH8rmbZviHp/ff61hTQgrTcyy0nUiodskPcy/wcBh5n
 NIuaedyS4vgw2lhchhMUJW5L3lUOqkq8ajWK5jlq3m2SAdam1bwzA4e90x5TL4aZpkSM
 YWobFR2JHrACTFmlppIlFi7ZjN29jj0Mal8JFRUSPqudgAs54EYml17nc/0bF0TlJu6K
 124Lf8rCO4uKn9XVkhJWCryQagTVCb81ZFN8UFsc7Vzw1IrjJXssjEykqsPrreIM0fBF
 8CXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693334187; x=1693938987;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d7WlyYzqen5MI4P1iAbKBmvgwbKop0nGPA7AULKnw6o=;
 b=C14hJoXkSq0KwzcROYh0iVOaofieDPO3OOHcdRUEsmsOrurfyr9d1PaGr3ocrBZNaI
 qA2TbMbyHioHHKtzKjWE3Sej6Sk0qcAGpmd8H+YQVLupFLTPcq3sf5XztRZMnE71aneo
 DavEXPbusLkTYT346hj3Bw/pxro5vr7m0MwXTP4mp9nB8Djb7RpVu0MfLu+BsGfUHvQd
 0V4jA3FcCgImfvu4NaORLKUWUDGJpgPUg4EXqu8angiXt6nV1fpI0voUZYBKLzR3Ywuy
 TpOezzCxNGAddRHy9u0WQ2GmYUpv+wA9Xok3WSgygaL34CfQHdas42OOxJlpuxbUT5uV
 aEmw==
X-Gm-Message-State: AOJu0YxFvMO30BtXSkCwPuW3Uvfh2w6RUmPBYvTMWapCNNjs4zEGoQwp
 yLJgrgrCHMOVDWXBuhhN2A==
X-Google-Smtp-Source: AGHT+IEjZeDr07xYkGFW1xI0KR3jmlLbN0sEkoa4/s1YsvQ7klaZ7CTwLESdDc6wxza92JGAV/2Zkg==
X-Received: by 2002:a05:6512:282c:b0:4ff:8f29:4411 with SMTP id
 cf44-20020a056512282c00b004ff8f294411mr23976106lfb.9.1693334186618; 
 Tue, 29 Aug 2023 11:36:26 -0700 (PDT)
Received: from ?IPV6:2001:9e8:b958:3410:8e0c:ed68:cd6c:7cb8?
 ([2001:9e8:b958:3410:8e0c:ed68:cd6c:7cb8])
 by smtp.gmail.com with ESMTPSA id
 p22-20020a05640210d600b00525683f9b2fsm5961948edu.5.2023.08.29.11.36.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Aug 2023 11:36:25 -0700 (PDT)
Message-ID: <9954d57c-d864-0215-2efc-67440ce86563@gmail.com>
Date: Tue, 29 Aug 2023 20:36:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 05/31] clk: rockchip: rk3128: Fix aclk_peri_src parent
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20230829171647.187787-1-knaerzche@gmail.com>
 <20230829171647.187787-6-knaerzche@gmail.com>
 <dc2f32d3-001c-746f-6dc5-58a2a6a4a8e6@linaro.org>
From: Alex Bee <knaerzche@gmail.com>
In-Reply-To: <dc2f32d3-001c-746f-6dc5-58a2a6a4a8e6@linaro.org>
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
Cc: alsa-devel@alsa-project.org, Michael Turquette <mturquette@baylibre.com>,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 Finley Xiao <finley.xiao@rock-chips.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org,
 Kishon Vijay Abraham I <kishon@kernel.org>, Lee Jones <lee@kernel.org>,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Elaine Zhang <zhangqing@rock-chips.com>,
 Rob Herring <robh+dt@kernel.org>, Johan Jonker <jbx6244@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Krzysztof,

thanks for your quick feedback.

You're right: This series mixes up too many things. I'll split up and 
re-send.

(And fix my typos, indeed)

Best Regards,

Alex

Am 29.08.23 um 19:40 schrieb Krzysztof Kozlowski:
> On 29/08/2023 19:16, Alex Bee wrote:
>> From: Finley Xiao <finley.xiao@rock-chips.com>
>>
>> According to the TRM there are no specific cpll_peri, gpll_div2_peri or
>> gpll_div3_peri gates, but a single clk_peri_src gate and the peri mux
>> directly connects to the plls respectivly the pll divider clocks.
>> Fix this by creating a single gated composite.
>>
>> Also rename all occurrences of "aclk_peri_src*" to clk_peri_src, since it
>> is the parent for both peri aclks and hclks and that also matches the
>> naming in the TRM.
>>
>> Fixes: f6022e88faca ("clk: rockchip: add clock controller for rk3128")
>> Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
>> [renamed aclk_peri_src -> clk_peri_src and added commit message]
>> Signed-off-by: Alex Bee <knaerzche@gmail.com>
> Please send fixes as separate patchset. Don't mix it with other work and
> definitely it should not be in the middle of the patchset.
>
> Best regards,
> Krzysztof
>
