Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA0862F6DF
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 15:11:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AC5E10E74D;
	Fri, 18 Nov 2022 14:11:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D979E10E74D
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 14:11:26 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id l8so6882474ljh.13
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 06:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Qtp5Dpmra1/rOA49Eh+jNdwLgrIa5og9y5Ys93KPSHE=;
 b=vpE5DEJrG9SOD9w/HFMLfE+1HP8jFqbFKMfAWW2yiYMYsnFIimIAFmNcn+m4tALgkp
 LgHY1KAwVbOgdyTKjt7CvX1Y59QgCHQEle+seAwQZCt3houzT3w+2rSzCrrgqSHwPk29
 r8Hdzf0Iy/GEMs98J+C49B3ckS8l22abtCS1eyQwm7hv43xlrCLHnZ0D+BRoJew/NIc6
 SF7Fg8sdLhXejVfdYHpFJnGsqa8LbTugeMVNS2hW8H+8SoNg5/kxvgytJZF8kX1up8Hn
 BCdOGOCSEdzX4buLWUCi5BXQHqPDENkp560Do51lXcvNTk8zxeFGuPVpMrMIw5z2o4wY
 XGhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Qtp5Dpmra1/rOA49Eh+jNdwLgrIa5og9y5Ys93KPSHE=;
 b=A5rXLiC4rcGxkCbxqJBE+AAPR5E7eHSySRdA5uZtKLvvAqta2Xw90TWG0ic2s8aY2p
 fUfPrMu4YBnE0zwd0UZMePCf0dOSRNncxzA4O/eEM6FnPNs8njOml3QMtbEEoF7wnq2O
 3vC+VyqxOWoA+SkIxxuBCriYNTD85OE4lwWJCsF2rIBrdYCQyledI3xL/BMC0iDgjcWt
 tTyXbsuUxPOqqyVJRDuc3EOm+psa8rzlmUFzhGHMeLQf+2rUwYMOW12xijj9bfCgx5JU
 XIAOMmTcQjPblaPUKpZEj9AF4QTgeldiw96+3v8Rud1OBrloERXcIYt7c4447LAW4Lx7
 qzSg==
X-Gm-Message-State: ANoB5pljZw4oyKZ9m4Ks31RRByOFNtwKsQRxZxPsJfBCaI7JCSdlDP69
 VJ9gwqfWiuypq5j6eeiZMETLmg==
X-Google-Smtp-Source: AA0mqf6ugo5sJDhmwF3aEBoUOKms4A5DsAn015MW37RuR7hfvqxQ1IS4rM/frjVmlKUvKbpu2GIi+g==
X-Received: by 2002:a05:651c:50b:b0:26c:5db6:cd84 with SMTP id
 o11-20020a05651c050b00b0026c5db6cd84mr2545700ljp.114.1668780685230; 
 Fri, 18 Nov 2022 06:11:25 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 j8-20020ac253a8000000b004946a1e045fsm666659lfh.197.2022.11.18.06.11.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Nov 2022 06:11:24 -0800 (PST)
Message-ID: <07961c68-62d4-efee-5618-9e7f6342923b@linaro.org>
Date: Fri, 18 Nov 2022 15:11:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/2] dt-bindings: display: simple: add support for InnoLux
 G070ACE-L01
Content-Language: en-US
To: richard.leitner@linux.dev, linux-kernel@vger.kernel.org
References: <20221118075856.401373-1-richard.leitner@linux.dev>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221118075856.401373-1-richard.leitner@linux.dev>
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Richard Leitner <richard.leitner@skidata.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/11/2022 08:58, richard.leitner@linux.dev wrote:
> From: Richard Leitner <richard.leitner@skidata.com>
> 
> Add Innolux G070ACE-L01 7" WVGA (800x480) TFT LCD panel compatible
> string.


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

