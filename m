Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AB16532DA
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 16:03:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BD8D10E119;
	Wed, 21 Dec 2022 15:03:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4789010E119
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 15:03:48 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id p36so23847570lfa.12
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 07:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=K2l6cewJUPRniIKeMkNSdCkIiOTYnjbP46uLNNT69g4=;
 b=MudIaipiKdBALhnv3xCVHFsTmKEK5Lgprh4ZlztzuNrWekMnRO39wSGC545djVUghZ
 z1gvH+QA1cvj4WFt2k72u7d5kUNTT7nKm28L8mw9LlcBCskuJb0yxipq6GJWvjhEEwko
 P0WIlDAJ+bh/x9Hg1epyyLywpYy/dIvRHdoYNM7xCS2Wvx4Qm2T+PIAQusAoE+c72H+e
 /A8o9+zLQZ/cEJCscQk7L13ZWvAVWinAX7c8UJpV3J0Fej+vV6xu6wDDhLkyhE0oW83n
 U4KQUFBJsy6jEdMrqBcxtdkTpeYQMvQ1iuDfx+qZHJRcOXSfBriAaZ6CYw8HVm3c82VR
 ycfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K2l6cewJUPRniIKeMkNSdCkIiOTYnjbP46uLNNT69g4=;
 b=0qt6SMpAq2xqcn7M1UEUMEJ8EdNmOm5hicBBgG36BGSTvOC4Cp4sHw4PrgZAhdXrrl
 kaQQe+V1C8XvpxCaYtYokL7IoT7ZYnBP07rkT0/az1irF7U9TJ8oGhlWQOuVie9PjVTH
 DtrWrL7wao9Ps0boERf/SoJCjjEUl5q509eQr5uiTY8LrArhA42B/3Ot4puHygB/VTzo
 +BOs96GghhR8cekRNKT6rABK4OKHfdS3abq6pYb6qxyROn6frfmDTNhA8UMhLAPmqYx6
 lyF7J8tWHEKSUZQz73o5VlUIHVDx08U0ypTjrizXlYhE/mJzNmwkMuz1kswgy6O+ORtv
 dFkQ==
X-Gm-Message-State: AFqh2koyAfd8zWiMe347siPPYWKyxNh/tL1Ytc5ghEjYBnDN9KR/ZCtt
 5sotyNR4hUM5UAUTv9/EZe7DRw==
X-Google-Smtp-Source: AMrXdXtbhO7QRkUe2U864JJ/dN3IRzN7x/8klCacqm4gLMX785oEXfttZCalrmBUBMRIxAHk4cKL9g==
X-Received: by 2002:a05:6512:224d:b0:4ab:d632:788b with SMTP id
 i13-20020a056512224d00b004abd632788bmr823628lfu.54.1671635026489; 
 Wed, 21 Dec 2022 07:03:46 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 r7-20020a19ac47000000b004b58ebf0399sm1866078lfc.132.2022.12.21.07.03.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Dec 2022 07:03:45 -0800 (PST)
Message-ID: <4c37d74d-aaa2-242f-a25f-bf5f92d50756@linaro.org>
Date: Wed, 21 Dec 2022 16:03:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RESEND] dt-bindings: leds: backlight: Add Kinetic KTZ8866
 backlight
To: Jianhua Lu <lujianhua000@gmail.com>, Lee Jones <lee@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221221132428.702-1-lujianhua000@gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221221132428.702-1-lujianhua000@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/12/2022 14:24, Jianhua Lu wrote:
> Add Kinetic KTZ8866 backlight binding documentation.
> 
> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>

Do not resend. You need to fix everything, test and send a new patchset
(entire) with the changelog.

Best regards,
Krzysztof

