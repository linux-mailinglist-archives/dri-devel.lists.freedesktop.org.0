Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B45662533
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 13:15:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6579310E3F3;
	Mon,  9 Jan 2023 12:15:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C49810E3FD
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 12:15:20 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 m8-20020a05600c3b0800b003d96f801c48so8833481wms.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 04:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Sf2TZznzR94HwbxPhrrDg7FkzybRt5Em8Lc/blKdqH8=;
 b=SzEGagKva5XOYlfYjF0turJTD/NqRAWhsxpnDTO8Bw/EzKXMjgL4qlfBv8D1TjmLyt
 IBozLxYW4mOY10zCNAdNj46Ur/AMrhKmQZ9fZe6dOHH6EJxc1seHhu+qVUFWYk3Q9eOS
 swgt02fhDMZYimDxUQ/rkescISOKQoKqMIP9HXwZ6jak84gktnrPCPPHaekZGxTdXiE3
 w9RkSPxRzDdhN7pTTrYe5Uv/etW/xaLclLIybO0+bJHUZqFQFmECqsjUpkC6HgMIW/QM
 SNF2meC7vaBtxQYWtXEYcRrb34LM18X3YSq9BhAYLFXKzrJA2782nSE+oY6j3MHnFMMZ
 YyWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Sf2TZznzR94HwbxPhrrDg7FkzybRt5Em8Lc/blKdqH8=;
 b=uSYtYR8a8ogJbLQViyZPXtimGUao3sTetkBtsVzSOsW3arrwR47dBcEJKAHhzQUGzW
 GmCEcIGEtDe2i371L0kZzwWEdOf1MkPSDacR0zT+03ox1IB5mcjr3wj2VcSmyROW/Urm
 kJcsZZ+kCq/L8KBKapxI/kANyy9YrNyau/pJ4eiyFXRMwHD4HRX7TROG5Qm/4WiWrPKP
 kTgQYzn9zx9NqSrYiRshtHjtCseT4dc8GM0vqPEbW3NfvMdSO/KDPyF9ZP2t7+1/qURH
 OwIhWUl0FhxEQ3zcEk0ELiTHk/ceIjlpdRrNPMkKoQQ2DpQaeBtIVRbHRBVPRolE/+nU
 BYIw==
X-Gm-Message-State: AFqh2krwSo8Rq0D0bohnBC9d7gmpZjSIIfvVlKYyp6CUMqf8MRbl8FaA
 zIXaqnLqciu1XpbTIZWqWwCpDg==
X-Google-Smtp-Source: AMrXdXtmVMaoiczR9d03qwRGWbgZHDTNvXuMvAvIqtS2eVUgL38gXdUkMeGdBX/TO4oTGIKbhnIUkw==
X-Received: by 2002:a05:600c:5022:b0:3c6:e61e:ae8c with SMTP id
 n34-20020a05600c502200b003c6e61eae8cmr56295366wmr.28.1673266518601; 
 Mon, 09 Jan 2023 04:15:18 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 az28-20020a05600c601c00b003cf57329221sm15656813wmb.14.2023.01.09.04.15.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 04:15:18 -0800 (PST)
Message-ID: <4b7458ce-18cf-8222-b5c7-349e07dc6b87@linaro.org>
Date: Mon, 9 Jan 2023 13:15:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/2] dt-bindings: display: panel: document the Visionox
 VTDR6130 AMOLED DSI Panel bindings
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230103-topic-sm8550-upstream-vtdr6130-panel-v2-0-dd6200f47a76@linaro.org>
 <20230103-topic-sm8550-upstream-vtdr6130-panel-v2-1-dd6200f47a76@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230103-topic-sm8550-upstream-vtdr6130-panel-v2-1-dd6200f47a76@linaro.org>
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
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/01/2023 09:49, Neil Armstrong wrote:
> Document the 1080x2400 Visionox VTDR6130 AMOLED DSI Panel bindings.
> 

If there is going to be resend:

Subject: drop last, redundant "bindings".

Best regards,
Krzysztof

