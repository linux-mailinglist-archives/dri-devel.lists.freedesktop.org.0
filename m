Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E02759C0E
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 19:10:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBBBD88CFA;
	Wed, 19 Jul 2023 17:10:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C489888CFA
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 17:10:46 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4f95bf5c493so11768830e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 10:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689786643; x=1692378643;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=s9fgt2KGcRUVdeDNFEB9QhU3B6RPAni2b92fxJRERKI=;
 b=m0odFjE/t7Carm6qsKat9e6zZDr8tYvaRgRy2/qHKfwYwKm1AvHRlknqHd/u7GwZxI
 3ey46dEGwU4FY9K2iy0cklzhtq5bTwH14i7a3qjPzE47bWff0v38f/AfPPy5dhin1hBg
 eSARqihMXjiC1EBgosuzxmOqrDHTAAuXBiR7O4m3JRucAHuz5cE/MQshpQeeXgNr5uY2
 D6iU+8ejr5Cr31sIwCyuKwpHQC6lExfEMcVshRHYkSNrPVdXjs2K/5Z9slMw+YUxqgIc
 Ha1meyFn1RsT43yAMeh8KgQw5KmFQ8jK14vS02YMPw2AVvvL4l3exGwuVVs/622OLNO2
 XJcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689786643; x=1692378643;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s9fgt2KGcRUVdeDNFEB9QhU3B6RPAni2b92fxJRERKI=;
 b=KadVUG5mpZOlA1iTx1tscXepKYx34+A1VPurN8sIgA5E8fWEhHerFJb6/MeeRsLyD4
 1L/xzFqrMS3n0qc0Nb8qiY+/b28f/PUC9FDCw+N4yoVdpU0Dqf8E1TThTx8ij+dghClT
 6DagSo71LaKm/ddaeexrd0UzAaMppUqATsm+Cj85hbuUsoW8C/To5fyhrhTCKDhutJD1
 LG49zO8LYs1dLcLMxsttbxY4fKTWtYd7V4dPmoF0TEy7P6JnohEIbRZSAPYf6TtWVOtn
 mQgjpogyyCSLRJXrQ4hFf+KUOBmM1fmgEdf07aFKxS24myuNdjkO232XPVcpvdQgjqoc
 r5dg==
X-Gm-Message-State: ABy/qLbeMFYTWE3OvDpHopTCdtWLtPsnd/h7C7BSv5EnN33Rw398jdsC
 xOghNmvnHhAS+3OJdCYAztmSEQ==
X-Google-Smtp-Source: APBJJlHT3RjczWqeN0o1AVJznQrcW55dSevRN/ebSN67gRx9wtPP9BGZUIn6GNvldWh6cg1TX2YZWA==
X-Received: by 2002:a2e:984d:0:b0:2b7:2f2:231d with SMTP id
 e13-20020a2e984d000000b002b702f2231dmr410408ljj.27.1689786643328; 
 Wed, 19 Jul 2023 10:10:43 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
 by smtp.gmail.com with ESMTPSA id
 o1-20020a05600c378100b003fbd9e390e1sm2083821wmr.47.2023.07.19.10.10.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jul 2023 10:10:42 -0700 (PDT)
Message-ID: <53e7df75-afdd-9bb0-aa45-f39d0756b139@linaro.org>
Date: Wed, 19 Jul 2023 19:10:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/2] dt-bindings: add bindings for pcd8544 displays
To: Viktar Simanenka <viteosen@gmail.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230719154450.620410-1-viteosen@gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230719154450.620410-1-viteosen@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/07/2023 17:44, Viktar Simanenka wrote:
> Signed-off-by: Viktar Simanenka <viteosen@gmail.com>

You still miss commit msg.

> 
> V2: deleted oneOf property from compatible
> changed prefix from 'philips' to existing vendor prefix 'nxp'
> placed `reg = <0>` right after `compatible`

That's not where the changelog is put. Please read again the patch, I
gave you link to.

> 
> About parameters exposed for controller:
> inverted - I had an unbranded display that after reset had all pixels black,
> while register was in 'normal operation'. The display I have now is opposite:
> all white after reset in normal mode. This parameter should help user keep
> same settings in KMS(?) for diverse displays;

OK, it was enough to respond to my comment.

> voltage-op & temperature-coeff - adjusts contrast for display. voltage-op
> cannot be expressed in real units, because resulting equation looks like
> V = a + Vop * b, where a and b varies with ambient temperature. Vop is a
> coefficient. same story for temperature-coeff - it shifts resulting voltage
> curve depending on display usage invironment;
> bias - relates to waveforms for LCD segments. default is 4 and should be
> changed only if you use external oscillator for display.

Most of this could be in property description, not here.

Best regards,
Krzysztof

