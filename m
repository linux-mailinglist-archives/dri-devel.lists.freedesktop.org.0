Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E646D3334
	for <lists+dri-devel@lfdr.de>; Sat,  1 Apr 2023 20:41:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67A8810E118;
	Sat,  1 Apr 2023 18:41:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D79F10E118
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Apr 2023 18:41:26 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id x3so102195675edb.10
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Apr 2023 11:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680374485;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=J3CX0tphHwucVQy/XBMHzMB2OpwqIu91GQKmtAUHW5M=;
 b=mHydUQdLtrrja7rpwWgXxy5mypWihyqXUP8jESwZXYQ+UMo6cyf4ARIpqPZt9seg3I
 viD8SINsrNFJTY+slyuegQUNoXoyUgGWNqNVbcgVwIxihQmrdkXVXvGZpaqvQ4qtGyhn
 ZaTg1OeZqPsnFvfI8KPO2vXotEmS84P8VD/aowhwkz4zu+Gs1dEz5PvvBG0+IBWouKmw
 L9yNjPA4eb8unexMMTlJIKBjfLSGvMAEBV5YJysQGgz7iV0MwdSCRo2BfI7N8tG2RPXh
 lG0tgpCZrnrW6gB1CVl7u9EUrxINDXJztBVjy4PIQQuPu/r7NvVibcJma2TtbIX2gDp/
 sApw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680374485;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J3CX0tphHwucVQy/XBMHzMB2OpwqIu91GQKmtAUHW5M=;
 b=whOGRlZhS1Qpbku7WE8aRX6nCzyjIi+DCnqO8cSwCsxYlUcBJsNTGpkLLi90JhOSON
 U9qJqLGZQ+ImVepD5shY7WVBLff4YroqikJaDxLor8P4fS8IP7Q5hw/fLNtu2pGVSuBu
 ++9V3yaAWlSuvT5YUr5uwaKCkjeKFEYYXuaGbsH8T6U8MQGFWlF9jEK/NCgOliMmUN7l
 ya9mXLAFBrG3ma96aKDy2xL5iMpBnmOOu8h7E0kyIUMHrY26KYHrLv/IEDDMN/qb12L6
 mENnwOEKpEIfP32q3Oe+WoYNnETVN/NS4wiyuVxEHViJHVAlDbVkuXmGNoIE/UNdIQFR
 q9IQ==
X-Gm-Message-State: AAQBX9fy2FqXbI4f6ufC5pMjpqgFq9q1QClY4vdrzpq1yyBzBTu1xBjh
 XouYgXpRhxNJtJ1AIe3ovAMddg==
X-Google-Smtp-Source: AKy350ZiZuxr3nGNpPlOhGyuV5/ZXciTT5jaK/TheV5lAt/QXLE6MfBHCobXTB/i0A5limdD5B7WdA==
X-Received: by 2002:aa7:c94c:0:b0:4fc:eee9:417 with SMTP id
 h12-20020aa7c94c000000b004fceee90417mr27190427edt.18.1680374484789; 
 Sat, 01 Apr 2023 11:41:24 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:ec00:3acd:519:c7c2?
 ([2a02:810d:15c0:828:ec00:3acd:519:c7c2])
 by smtp.gmail.com with ESMTPSA id
 p9-20020a50cd89000000b004c0c5864cc5sm2389927edi.25.2023.04.01.11.41.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 01 Apr 2023 11:41:24 -0700 (PDT)
Message-ID: <5b0f9fc9-45ef-e501-6840-df4b03d9dab7@linaro.org>
Date: Sat, 1 Apr 2023 20:41:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3] ASoC: dt-bindings: maxim,max98371: Convert to DT schema
To: =?UTF-8?Q?Andr=c3=a9_Morishita?= <andremorishita@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 anish kumar <yesanishhere@gmail.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230401181930.533067-1-andremorishita@gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230401181930.533067-1-andremorishita@gmail.com>
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
Cc: mairacanal@riseup.net, daniel.baluta@nxp.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/04/2023 20:19, André Morishita wrote:
> Convert the Maxim Integrated MAX98371 audio codec bindings to DT schema.
> 
> Signed-off-by: André Morishita <andremorishita@gmail.com>
> ---
> Changes in v3:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

