Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BA76D2F77
	for <lists+dri-devel@lfdr.de>; Sat,  1 Apr 2023 11:45:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B79F910E03E;
	Sat,  1 Apr 2023 09:45:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DADF810E03E
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Apr 2023 09:45:11 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id v1so24716850wrv.1
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Apr 2023 02:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680342309;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=enLSXvC9cOIGUaRnMgYw4KnAx/zsnnPatWKBKRZeUhs=;
 b=DB4GBhIICc4dXx4AUyVmnX90Z5uhn16tnAF6/gW4OPxZ2Qh97CQpD2rmfa5kKZIfTa
 EwIleDu1NJTSBMjTbKSsSe4M0pQ8p9aBmZq/c0wLa5kkSR13wWYC2lj2LjsoPXnZKlwY
 +IhMIPdZV321uCwG8WERPBl5WTy5Fw6UeGb6OC3zsaYNVL3j6ruY75uBxQAk0qUZJhEj
 iMLGa/i9gXeZFbWtIYPD7o9mPTa/p6zjYmsRbZ165W4EFjkKOGP9xQM3ei1vySrfkZsS
 15P/YeZzn3+Jvcz+UuaMPr6CzyhilvbjmKDhRldVXoB8b21RxTWrdDspWcS/jOALG7vf
 jZcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680342309;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=enLSXvC9cOIGUaRnMgYw4KnAx/zsnnPatWKBKRZeUhs=;
 b=v0/+/TLdlZ/IKAoizmEgGoSwfRJVXl1WBhmzuehUJlFHzVXcyzAI9ax2MP+Ocm0yJv
 psA+pnsohkdMl/6CLoVYmy8AKKTtANttyOiGrKQ69AI5mXdKUC2FB0lEAbgHXmFYH/Hs
 d+5wUhClymo3v1DSB4FlGczITk7kmGbYgv4tXTDnoH+sUAkhT20rR5D13YhGhv/34Kb3
 ieGTVGVq1vRA/lG42Vwx7jGWYeJUNU/tWesOCFni2yYZssau6QN4OxsE7tIU82xnQdQf
 Yo/eh4n7sGAsTPVylkAoUd1wvyBzd5wuBdggT5FYpXYmbv2g+PlfcCw2bQ0SQIals7aR
 YxKA==
X-Gm-Message-State: AAQBX9foGlKt1FWfmtbA+xoZWjQ+gCBsvapmVldpEHczScgcYYflZEEn
 zv3umUXfY32K6ItMj05SNBoVwg==
X-Google-Smtp-Source: AKy350bdhrPXteAy14H6wTreJILApVyTmS/XDg66OMR/3heapL9ZmGdi17szArp0VJxBbQMcJI/m9A==
X-Received: by 2002:adf:e644:0:b0:2c5:4c9f:cf3b with SMTP id
 b4-20020adfe644000000b002c54c9fcf3bmr9084520wrn.7.1680342309583; 
 Sat, 01 Apr 2023 02:45:09 -0700 (PDT)
Received: from [172.50.14.32] (5-226-109-132.static.ip.netia.com.pl.
 [5.226.109.132]) by smtp.gmail.com with ESMTPSA id
 s11-20020a5d424b000000b002e5f6f8fc4fsm3877194wrr.100.2023.04.01.02.45.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 01 Apr 2023 02:45:09 -0700 (PDT)
Message-ID: <1d08d7a7-0682-cd05-f2a1-2b458a2eb25d@linaro.org>
Date: Sat, 1 Apr 2023 11:45:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2] ASoC: dt-bindings: maxim,max98371: DT schema
 improvement
Content-Language: en-US
To: =?UTF-8?Q?Andr=c3=a9_Morishita?= <andremorishita@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 anish kumar <yesanishhere@gmail.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230331020527.482991-1-andremorishita@gmail.com>
 <20230401035756.856752-1-andremorishita@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230401035756.856752-1-andremorishita@gmail.com>
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

On 01/04/2023 05:57, André Morishita wrote:
> Improve Maxim Integrated MAX98371 audio codec bindings DT schema conversion

Your patch changed much more than your commit log is saying. I don't
understand why. Previous subject was better than this, I only commented
on missing prefix.

Commit msg now is unspecific and misses full stop. I don't understand/

Do not attach (thread) your patchsets to some other threads (unrelated
or older versions). This buries them deep in the mailbox and might
interfere with applying entire sets.

> 
> Signed-off-by: André Morishita <andremorishita@gmail.com>
> ---
> Changes in v2
> - Generic node names - codec (Krzysztof)
> - Drop label max98371 (Krzysztof)
> - Add sound-dai-cells in example (Krzysztof)


Best regards,
Krzysztof

