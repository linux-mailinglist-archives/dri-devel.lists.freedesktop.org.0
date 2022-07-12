Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 963E1571BF6
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 16:08:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A99F911A746;
	Tue, 12 Jul 2022 14:08:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5B9F10EE15
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 14:08:10 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id e28so10548776lfj.4
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 07:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=IUDupCeEXQ/0U2Mq+8j8TVT3HkTwF7WNPO4buPs4r6M=;
 b=QYvKlU7dEHkaxWeAgxfsF7vxBdm/zDsF+uuntI0ZjZp2eHQW3sdICr52wnSvfAAqk/
 xqPicfiGubAHcZxPV0vqcT7lcEqnZI8C7Q0mwu+pDS0gH9qj+XmkB8OxDjDi561+v38E
 C+sElDXj830YwXWoYoAqURjSNfMYBVM2zw/QUM2x9489UNhtzbCZ5+a5BSVAZEQQbc8Z
 ThNy5NFkPiYV+DIle2PSnvuqSlll+S8ql+SEjRPKQYzuqfXwduHzAYcpxcJRsqUCLqPI
 Akbpi8mXiuBQYdtH/68IF5DKjpEfFw+oUXv8BB8hMaQv9Uk2cJ754oyLE645GWMGbij/
 9Kdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IUDupCeEXQ/0U2Mq+8j8TVT3HkTwF7WNPO4buPs4r6M=;
 b=qgKOvpqDK0pfyfBNDnZHIKTKTNcOIJQGCcgHcP6dnurG0ffpka2QW+tH3EVTQO0qrT
 0M46xokrD+3F2hwsx98Rg5Rji8i2ZlUrXhM13inUOa0jvqBvVEDZhre4k9AHzaDd/3mf
 odV1uSklepSB6OQUgSxKr6ghSQ+Qtn2IIZwGpc7eGg3TI9vib/lZHFgzdEmWPH1iGWON
 UataERJESWnjazDt97VWT6tllQ0tnMUC9EcrKLfnAObVxK5Vare2lzG+a7TlQvsWPCu1
 oA5DhZ+By/kbS658ghabcPYnzfgKdKsOpW/6BfPbYeNqzLVXs/Y6fZsK3kYVEQnxg0iR
 dIew==
X-Gm-Message-State: AJIora+yeYJqeBaiWNK04vcIrEW6tRYqujqMoUIkgy/guj0/FI+DXYPT
 WK62PIg2vTskWYG2Frb3XdweCg==
X-Google-Smtp-Source: AGRyM1tCEXL8eb8yUBVXFnt5nQBt+dmZ3X4wqpUocjCz9IgpH1o5xI4GOGU1U4fDZ6ZvjrzDPG72Mg==
X-Received: by 2002:a05:6512:2394:b0:489:e432:bca5 with SMTP id
 c20-20020a056512239400b00489e432bca5mr5786126lfv.537.1657634888923; 
 Tue, 12 Jul 2022 07:08:08 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
 by smtp.gmail.com with ESMTPSA id
 y3-20020a056512044300b0047e789b9700sm2187900lfk.118.2022.07.12.07.08.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 07:08:08 -0700 (PDT)
Message-ID: <1c90df71-4db0-9d20-e41b-2dfdce8d6456@linaro.org>
Date: Tue, 12 Jul 2022 16:08:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/2] dt-bindings: display: panel: Add Novatek NT35596S
 panel bindings
Content-Language: en-US
To: MollySophia <mollysophia379@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220709141136.58298-1-mollysophia379@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220709141136.58298-1-mollysophia379@gmail.com>
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
Cc: linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/07/2022 16:11, MollySophia wrote:
> Add documentation for "novatek,nt35596s" panel.
> 
> Signed-off-by: MollySophia <mollysophia379@gmail.com>

I see now three different patchsets, twice v1 and once v2 (send shortly
after v1). This is confusing.

Best regards,
Krzysztof
