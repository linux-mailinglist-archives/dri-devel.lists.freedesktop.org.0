Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FA5757965
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 12:41:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C57D810E0D8;
	Tue, 18 Jul 2023 10:41:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB5E210E0D8
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 10:41:02 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-51e29ede885so7909027a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 03:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689676859; x=1692268859;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ySxdaKxinHnxtok4kPt2QKJLKgvXBmWckhE525HMK+o=;
 b=vfGx/0V2Zf4RLi7t0d8MpAZCz1qK+SGlszU0rPsdz+vUGmouHLHXSIAJzh44d26DdB
 t7eUT4IbSlC8Z1FSubfIWQyWvj8U2RTueelqtPKZ8JxwhtFdLS1MgMa/FuvLP1DU3HeK
 i44LniUrG8Lugmar3VNozZ7/U1sJ0IjLYnYHgYbf1mIjZVRrOKSCpoAlHNJhxC9cJyZ+
 2jf/hPsW60P4YFVBNGCIOFNwGsHus81ZuGj14R3dk/88UmrYtrUtcCKOhM85OoMb1wN6
 FGtgtDMFftfQK4/A5rtCq0o1AQju6cUBubPPNn8YLsHvO7bzr94rtHi2XEJmZc4Vrdkv
 h1sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689676859; x=1692268859;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ySxdaKxinHnxtok4kPt2QKJLKgvXBmWckhE525HMK+o=;
 b=BWRzfOsKDyHBpAS/T0brqbHJyuPawz/mm4EgAzx6MXfM7wfuKI+TabebPnf1Yir03s
 SFECpRo917Kj2cPpBHpZt7cEG0WzkiVXxQivCAwKKh/Io+E5Z0yDoIGiSgRL5llmSjDg
 7L0L6nMtWxPqXeUxRAUYiQ+aRELNGwF4BNWsdP5OedhntZ3iJHAarNevRfgBOeNA4Q8S
 g521gTLxmaOGpgh4Vlax/buZioVeC+J4RLdkpxoH0kOvpLl0QLxK28ZRd+KhwsZns0y2
 GiSLNfL6QOyd1aZmSFQcEDX57DNM0MKFHZOaub81Ry4sWX10HLml2Y+jDh2bYdkctO/i
 Ux0Q==
X-Gm-Message-State: ABy/qLZN+LXrLVUztdz5E8Sl6/bYhngoGhjLT+qzoDPMfzJwGthxCLr8
 wBXgmRPasknG8wqX7Kyvll0jwA==
X-Google-Smtp-Source: APBJJlEvYdzJVIwj+oR7D5wPofb9jasp8U17KbQHSV3MLL5ISPlscbIoJIxpEjW+Yg/3OvEUG3JiyA==
X-Received: by 2002:aa7:d8d4:0:b0:51d:8ab1:5df4 with SMTP id
 k20-20020aa7d8d4000000b0051d8ab15df4mr13464444eds.21.1689676858881; 
 Tue, 18 Jul 2023 03:40:58 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
 by smtp.gmail.com with ESMTPSA id
 n17-20020aa7c791000000b005215eb17bb7sm1009515eds.88.2023.07.18.03.40.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jul 2023 03:40:58 -0700 (PDT)
Message-ID: <8e368283-b921-2e92-0aa6-204c0f17c8d7@linaro.org>
Date: Tue, 18 Jul 2023 12:40:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/1] dt-bindings: display: bridge: tc358867: Add interrupt
 property
Content-Language: en-US
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20230718084411.1189831-1-alexander.stein@ew.tq-group.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230718084411.1189831-1-alexander.stein@ew.tq-group.com>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/07/2023 10:44, Alexander Stein wrote:
> This bridge has an interrupt line for event signaling. Add the
> corresponding property.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

