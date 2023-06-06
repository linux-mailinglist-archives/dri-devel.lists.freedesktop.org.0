Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA12724696
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 16:43:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6547B10E363;
	Tue,  6 Jun 2023 14:43:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC86610E363
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 14:43:25 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-514924ca903so8764247a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jun 2023 07:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686062603; x=1688654603;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DIlTHwqKf8fPlLoHMVIGGWaQ8exTlPIjxSSytyTFW+k=;
 b=l8q2z06xu2crICmLcCl4xTYML23aq8seNXR7OWdQPkIvS9BXcilF+V7+sCLQEIXv+o
 Y/a0eDP2PY0PrWS2TGq9kAWYSjajLRQAtmbWQExKaSIlv9I9BSm6kTKtKc/x1/0ZCSkU
 Il/NomYkgqjoaThTEQpYztiLg3IMCvHeRMLzWfCtwlm2FC6++7rrfy+Hr3hmbNIo9TW4
 t5HugA/4Lzf4/LhhqNKRF+dmLT8ozZ3//TD3ltxW7qqkyddxC7/eHBb4gnWogj/u3Yph
 BqHUF8ZgR/YmH3Cr+X3a5u+33YM1WeWwRkjj1T+LgI0aeLYHmvQ5OBc32SJ4U1rrP7MI
 B69A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686062603; x=1688654603;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DIlTHwqKf8fPlLoHMVIGGWaQ8exTlPIjxSSytyTFW+k=;
 b=Dft0LKWDYTG1scDt3bFSRQqsrC3fEluTz4BEgWtw2CNp/lg2NXAaeh4RpMghJdAVvf
 9VeOs2HdQkGQJjklXnrO3Kfcrhrgj3+SmArUXBHQMpxEBF46kXzXmKlaUdPE11INB7sU
 t1DmoWGc1RK6H5W/DSxcQP9o5nZm30rKx93HSCibxboqzwRqTS+3+jNDcveCKLsM6PKv
 70ukLtek57QG0Z5mJXLweeSbM8bG2/TfGW84pPtZ5AmMcT5L97Nr3UZiY18J/ZWESssD
 8+U8FFld0dMY4mYF/W2vR0555KKPgaGARJSb4f6ySJdJQfT4fGaQwBgewb9FcDe+jCmp
 Ob6A==
X-Gm-Message-State: AC+VfDz5QywBk6rXAR4IRl+iexqA7XOcCmJBDDP8c91lwFeu6C13L8eF
 qTq/4FeIyb/T/8eT8faIgQZvMw==
X-Google-Smtp-Source: ACHHUZ5Lgn4F1Hvld3oRgiKguBmLKnwbIruenb4AT6gfG5zweY5WjxmnBMWT7asU9/KFdnr+CTLmhw==
X-Received: by 2002:a17:907:a0c8:b0:96a:861:a2ac with SMTP id
 hw8-20020a170907a0c800b0096a0861a2acmr3030862ejc.0.1686062603560; 
 Tue, 06 Jun 2023 07:43:23 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
 by smtp.gmail.com with ESMTPSA id
 y18-20020a1709060a9200b00977cfa6ff46sm3391586ejf.103.2023.06.06.07.43.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jun 2023 07:43:23 -0700 (PDT)
Message-ID: <cac57af0-aa0f-0a60-3376-234e1da7f4eb@linaro.org>
Date: Tue, 6 Jun 2023 16:43:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v3 2/3] dt-bindings: display: panel: add fannal,c3004
Content-Language: en-US
To: Paulo Pavacic <pavacic.p@gmail.com>, neil.armstrong@linaro.org,
 sam@ravnborg.org, airlied@gmail.com, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
References: <20230606140757.818705-1-pavacic.p@gmail.com>
 <20230606140757.818705-3-pavacic.p@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230606140757.818705-3-pavacic.p@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/06/2023 16:07, Paulo Pavacic wrote:
> Added fannal to vendor-prefixes and dt bindings for Fannal C3004.
> Fannal C3004 is a 480x800 MIPI DSI Panel which requires
> DCS initialization sequences with certain delays between certain
> commands.
> 
> Signed-off-by: Paulo Pavacic <pavacic.p@gmail.com>
> ---
> v4 changelog:
>   - add spaces between properties

???

I pointed out last incorrect versioning. This is v3, not v4. Or is it v4?

What about my tag?

What about my comment?

Best regards,
Krzysztof

