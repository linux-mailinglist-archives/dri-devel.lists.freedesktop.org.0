Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B35B522E37
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 10:22:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66D0910EEE7;
	Wed, 11 May 2022 08:22:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54EAC10EEE7
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 08:22:27 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id ks9so2517327ejb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 01:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=IIOcJgbS1/hMQQvn2DCFX+BHhbtb4xhB0glTejG9nd0=;
 b=nN+tvnytLjTaJLXUpNkGlrL31C7UW1pB6NFTtmXaTXEc/E6YrG1OIKgpwVMC8S+kVK
 D0zGHuOSWn6VMDT5RVsCrOPzqDPn+ynX+2xgsLJ+esu5HFhKI1L1FfojyWFbLtSNbXuS
 1qXyVZ1jTq1c48DPsEHHWi1ElZ8UTZzr57W1iPjRSdUmmWlSe8Hm8Pc0jYi+i4kpwRAW
 hH+yxI/z9Cc1NoWL0nAk+IMz8mhUv1TWwTqWJaA1lqsWAnJvZ/pbzRI35MVvlcqiK0bh
 yq9FIOhP2dWozNqsyasJ2s6B/nnu1uuSBahdmKMJDmas8sdvCmBeg2zvG6YZlvRLOBiP
 0WMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IIOcJgbS1/hMQQvn2DCFX+BHhbtb4xhB0glTejG9nd0=;
 b=dCpy3s9KSpzUSEKbFUvX1jY7jXCXTP7swt5qXWtgNgX3OVpQN3nSisotJiRQCB9M51
 0qcgneLPfj/5BllsQ5DX+MeR34Y8+Q2+lSTlmyFvq++0kdUeHob2/TkVkqivlvbCGLME
 zIiEtvJg9V5tC9v/PEf9msVTcRp6DatBF4q61LPcMsKchuSNW7FZ7md8EbJDW6kXonSv
 rptznmvT0zH5hOgCYOx2BbF9vFD6rACvFsKWiisrcId5njSeCknQSN6/gRLuHE2p1XHg
 R2ei/29qhMlCWafDI4DubNpMjq4lKtanzw69z2tBsvYlkyYgWFTceKxO0Kz66c+8BniK
 nnxA==
X-Gm-Message-State: AOAM5304/VaH9cjmuvw3eJUT8PHdKZrPWVQjC3E7RVqAfdkv7xh/m4v8
 5A5NY/CcP5ql8Ah/AKl6TcOkMQ==
X-Google-Smtp-Source: ABdhPJyQl+2i2St5QQZxqWfls/5xIarQ0xgPypRKf/p7aX8oprL7xHpOkr9jt2CVt3KlxWwPkWf+7Q==
X-Received: by 2002:a17:907:16a2:b0:6f4:eeb1:f7de with SMTP id
 hc34-20020a17090716a200b006f4eeb1f7demr23680710ejc.446.1652257345815; 
 Wed, 11 May 2022 01:22:25 -0700 (PDT)
Received: from [192.168.0.254] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 q20-20020a17090676d400b006f3ef214dddsm686150ejn.67.2022.05.11.01.22.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 01:22:25 -0700 (PDT)
Message-ID: <7783d64c-e48c-5e3d-9560-51197234051a@linaro.org>
Date: Wed, 11 May 2022 10:22:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 2/3] dt-bindings: display: Add bindings for EBBG FT8719
Content-Language: en-US
To: Joel Selvaraj <jo@jsfamily.in>, Thierry Reding
 <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Stanislav Jakubek <stano.jakubek@gmail.com>,
 Corentin Labbe <clabbe@baylibre.com>, Oleksij Rempel
 <linux@rempel-privat.de>, Linus Walleij <linus.walleij@linaro.org>,
 Hao Fang <fanghao11@huawei.com>
References: <cover.1652245767.git.jo@jsfamily.in>
 <BY5PR02MB7009F6D4CC6CA1C433912C56D9C89@BY5PR02MB7009.namprd02.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <BY5PR02MB7009F6D4CC6CA1C433912C56D9C89@BY5PR02MB7009.namprd02.prod.outlook.com>
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
Cc: devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/05/2022 07:28, Joel Selvaraj wrote:
> Add bindings for the EBBG FT8719 6.18" 2246x1080 DSI video mode panel,
> which can be found on some Xiaomi Poco F1 phones. The backlight is
> managed through the QCOM WLED driver.
> 
> Signed-off-by: Joel Selvaraj <jo@jsfamily.in>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
