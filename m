Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F70265BEE3
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 12:28:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 947BB10E25C;
	Tue,  3 Jan 2023 11:28:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43ECA10E25C
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jan 2023 11:28:15 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id p36so45236112lfa.12
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Jan 2023 03:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kE4qqRxLpxxCedBuUJYA+jounttnp3G/CGQUAy2owUc=;
 b=Ill95URu0ok8mTKcTGS2lBtZw4eZqXOgHuXYKVuUbo61K1thYXNo+Ruh9Glym7puZ0
 zX+XPzU9HkF5NtDV9G9rXGtsfzmAOJikoXWin/OvNxtIq8uqfGhYmtrAPSEAsiU7V1Y5
 oLVnULMbddELmoYJH5P78lCIHYZt6Xd4d5rGEnQ+jRQhTspmocjmECdaqb2f976PdL2z
 TzHa+su9MOIZrwYWj4CqUurmPyIyctOCVXkevmsCzEw1W+ZEN/+9kvMz0UXZ0GelNyM3
 ylERXrH6lkJrnMQzYqxWIvb8GHGOvWjgDwWntvVljGUDLd3hptx9gakn71TA3mAo2Yrd
 L9gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kE4qqRxLpxxCedBuUJYA+jounttnp3G/CGQUAy2owUc=;
 b=PLkB8q5r+88syJ/NyNDxjLgEXJA4vqnmV7bW0XIASTvjKKmMI9J+d/qLtFHLl3q6hl
 2KNpUbB7I8QsGotVM64TJM23qJ0sgy1z8vpaZN51xE2Jzpn5MqTPkZ+7zKPSW3v1VYpw
 bZfISOdEU5s5hYREpx0IEUhjxn0koR1EPbfIVS6/uMHGHR+r5oQXZOIvhqQQWmVbPkkD
 5jyiM/zmNieFnoVzWU5mqEGl0pniwq3a5/iQs4FPDnIdlCPtKKhrisNf16bipDkOwE5D
 L6r2l2CVs08WIV1IpFIxDbViGfDFOHZq/sCCMqbws8M0pxe2vkvJFZIGuAlKzwgnwO9v
 QRuw==
X-Gm-Message-State: AFqh2kojqKr/k2XVkw7J0G9PUcdr2nzlaZP6K+AbxPyYxMmJ5ukVuLJl
 ppsAYM/udotHH7GMPJSZ7C9Ieg==
X-Google-Smtp-Source: AMrXdXvivJCiSvdg7M62GVqjA581ZqA/tb1WZnOzpgmcCBvtTZ9QkS3notudi/QiV+FIM4Pn1tKE8Q==
X-Received: by 2002:a05:6512:3601:b0:4b7:13b:259d with SMTP id
 f1-20020a056512360100b004b7013b259dmr10839992lfs.48.1672745293524; 
 Tue, 03 Jan 2023 03:28:13 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 o10-20020ac24e8a000000b004b4fefacd89sm4798236lfr.139.2023.01.03.03.28.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Jan 2023 03:28:13 -0800 (PST)
Message-ID: <30423568-df03-1d72-81fe-3a4b33214e5c@linaro.org>
Date: Tue, 3 Jan 2023 12:28:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 3/4] dt-bindings: panel: Introduce dual-link LVDS panel
Content-Language: en-US
To: Aradhya Bhatia <a-bhatia1@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Tomi Valkeinen <tomba@kernel.org>, Jyri Sarha <jyri.sarha@iki.fi>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Matthias Brugger <matthias.bgg@gmail.com>, Guo Ren <guoren@kernel.org>
References: <20230103064615.5311-1-a-bhatia1@ti.com>
 <20230103064615.5311-4-a-bhatia1@ti.com>
 <85837957-f6d2-4722-7693-98c6cf932096@linaro.org>
 <32d66fb7-6c63-0985-222f-0bd3c36c165d@ti.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <32d66fb7-6c63-0985-222f-0bd3c36c165d@ti.com>
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
Cc: Nishanth Menon <nm@ti.com>, Devicetree List <devicetree@vger.kernel.org>,
 Jayesh Choudhary <j-choudhary@ti.com>, Jai Luthra <j-luthra@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Linux Mediatek List <linux-mediatek@lists.infradead.org>,
 Linux C-SKY Arch List <linux-csky@vger.kernel.org>,
 Linux RISC-V List <linux-riscv@lists.infradead.org>,
 Linux ARM Kernel List <linux-arm-kernel@lists.infradead.org>,
 Rahul T R <r-ravikumar@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/01/2023 12:02, Aradhya Bhatia wrote:
> But this is throwing an error. I am confused what else could be done.
> Can you please suggest what might be a more accurate check here?
> 
>>
>>> +              required:
>>> +                - dual-lvds-odd-pixels
>>> +        then:
>>> +          properties:
>>> +            port@1:
>>> +              properties:
>>> +                dual-lvds-even-pixels: true
>>> +                dual-lvds-odd-pixels: false
>>
>> Why do you need this? Your oneOf before already solves it.
> 
> I agree with your comment here. It makes sense to only have
> 
> 	dual-lvds-even-pixels: true
> 
> and have the oneOf condition take care of the other. But, I just tested
> this and it was unable to pick-up this intentionally-added error.
> 
> I added 'dual-lvds-odd-pixels' property to both the nodes, and
> dt_binding_check passes successfully (which it should have not.)
> 
> Instead, if I only keep this,
> 
> 	dual-lvds-odd-pixels: false
> 
> then the dt_binding_check detects the error as it should.
> 
> Regardless, I am curious why the first method doesn't work. Will try to
> explore more on that.

The check for presence of properties is only against required:, but you
added there properties. Like this:

https://elixir.bootlin.com/linux/v5.17-rc2/source/Documentation/devicetree/bindings/mfd/samsung,s5m8767.yaml#L155


Other way is to drop your both oneOf and entire allOf from ports and use:

oneOf:
  - properties:
      ports:
        $ref: /schemas/graph.yaml#/properties/ports
        properties:
          port@0:
            required:
              - dual-lvds-odd-pixels
          port@1:
            required:
              - dual-lvds-even-pixels
  - properties:
      ports:
        $ref: /schemas/graph.yaml#/properties/ports
        properties:
          port@1:
            required:
              - dual-lvds-odd-pixels
          port@0:
            required:
              - dual-lvds-even-pixels


Best regards,
Krzysztof

