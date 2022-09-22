Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B11A65E66EC
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 17:21:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6064110EC0B;
	Thu, 22 Sep 2022 15:21:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31C6510EC0A
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 15:21:36 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id x29so11430270ljq.2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 08:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=G2tn8FkiA4QtG75xuiqZmLv7ElA87FmtU3DNYDf0oEQ=;
 b=gvtOtWwbd6XN7lgeIP4TcEsuTjvhDaz6SCfI5YZ1QCOvoifx/6Tv9EwRay+ZlQlzuk
 uuFokyZYzwce10lvYBft9Za6AamLCeVayMeFL1NHuERDEzgzrvdV7272uRHACK7xR6cU
 gXh5SuFUCY+AscEmRfjHBGeJZvejJCBOQaw9+mySxDSy/sU5dqWaJ+e4yJAU90t5O5GD
 jjTMynCKnVYTgfyAjee+g+jHLgR/fYRZi8EjMJ5QWXUnkfNvc/fCzSTOjQCUqXOwDseg
 7lfcH2kck+YAkOhEVpoBEI5q+BHsHd7lWRR9KstIk+IymtgbGYdhO20XI2IUNjiyMgXU
 4h7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=G2tn8FkiA4QtG75xuiqZmLv7ElA87FmtU3DNYDf0oEQ=;
 b=Wq4CKGoRi3lBfsuQDa5/rC4VmVJQU5uauTGLGwHCw1IjALZf1rqbmpqipcoc6ET9rc
 Wd6VVGRtQndPk1wYBFUO6YTsK478Lv02VDXJ3XtrHiwXzpilJ05plY1eVJKuNpUKje60
 IW2KqqxfjNzpjCwEzyldsYSHDiByPcsSNa7cbQH18/m9pFYh2nx7Ml2N6H2xyouHrI5k
 QnkngBFCvImjOoAJWuNUFb2zKj0zYVY0QVlrwSeo3oJznfa3aF5Rx3xFBiA2fithdx+Z
 58h1mrTnzkR8GabRhV4AYn11ZnQQoxkWzBevWU5SucYN9ZJh7vdXtbzbteAWkWept/eb
 agSw==
X-Gm-Message-State: ACrzQf3hGMuQoHyUP3jwl6O5YWlagZgzFwSbULL69U4+S/UDRTiRhx7P
 t3JLK863SlAgn6Yv8vyZD1k+iQ==
X-Google-Smtp-Source: AMsMyM4j9ZJPh60peGli03Ceol3vlKlTckxECwq4CxNGTazKeqt1QdZGVrjF+gHjFYIiAGq0IxbYng==
X-Received: by 2002:a2e:8e27:0:b0:26c:259:e4d2 with SMTP id
 r7-20020a2e8e27000000b0026c0259e4d2mr1357778ljk.215.1663860094410; 
 Thu, 22 Sep 2022 08:21:34 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 t13-20020ac24c0d000000b0048b064707ebsm985686lfq.103.2022.09.22.08.21.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 08:21:33 -0700 (PDT)
Message-ID: <825bb400-fc7e-8564-f8d3-d294114b1ba7@linaro.org>
Date: Thu, 22 Sep 2022 17:21:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 1/2] dt-bindings: display/panel: Add Sony Tama TD4353
 JDI display panel
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20220922135902.129760-1-konrad.dybcio@somainline.org>
 <02f44228-866a-f096-1e90-dfbd31660491@linaro.org>
 <e9d55a49-e3c6-a6b2-43e1-8e643dc49d58@somainline.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <e9d55a49-e3c6-a6b2-43e1-8e643dc49d58@somainline.org>
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
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 jamipkettunen@somainline.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, martin.botka@somainline.org,
 dri-devel@lists.freedesktop.org, angelogioacchino.delregno@somainline.org,
 marijn.suijten@somainline.org, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/09/2022 17:16, Konrad Dybcio wrote:
>>
>> How about bringing them closer to common GPIOs:
>> panel-reset-gpios
>> ?
>>
>>> +    description: Display panel reset pin
>>> +
>>> +  treset-gpios:
>>
>> touch-reset-gpios
>>
> I can do that. I will however wait with resending in case somebody has comments
> on the .c driver.

Sure, makes sense.

Best regards,
Krzysztof

