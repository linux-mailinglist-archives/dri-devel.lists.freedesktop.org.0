Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30131652ECB
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 10:46:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 019BD10E09A;
	Wed, 21 Dec 2022 09:46:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E51110E09A
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 09:46:13 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id n6so9402113ljj.11
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 01:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RMN18TMuRJ15tNy7Rh8fHbbD5iNzzFMU1HwQ+6IR2jM=;
 b=OEF0uMUfj3e2EPEdiZgyHX3vKcqazjkPE6pCVext6HfTGZnZOT8FBMcvpIO1Vp9HYJ
 gihqyCNyL6czBPzjSYjfXicWUDeJbbFK+NCCeXQ25M7sTvGz6wv2ZQJocrDWLWo1YG5y
 u8lS2AbfV+2+TeSygX3DPQ8bqQotpPx2ef5VWN8sbpt5pPAQRrsrtf6UFcIzcLSpjCa7
 ZehkKKcOZc/cpDfxQeLwcV3l0HYXSAn5RKN+wmlGgzNBfZZcoVun4kMINTLBBxdIEcnM
 cQukSltSXHf9x+6y8XzSWXeOOULqUhrg+iNNTBvNJejTZJBDacm8x4wJpjbXIKhUxNXh
 AgTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RMN18TMuRJ15tNy7Rh8fHbbD5iNzzFMU1HwQ+6IR2jM=;
 b=0mAd4FCw8J4SGSJv3UU9N8m5LBzVL63ktjOq57YlSiRRfyjlhMl98gzPjWgLy1WAvf
 35EgHBAV6Z+DnUOtyP2L1uDnY2+W9dtH6FjoIuytioR6OXKMNRZKNhLShkET6VSvRHPI
 Cnqlsqp2HOtdX7kfadkIh2XlxzrK42SOX7gyFI35tX4AoqXKmjAhq1X8PXzZKjuRqOgi
 Yfqe8Yxk+hJtI2dtdvlg/NMAA9i0Thpn1Kus9kApit0XJ7scMNJ1sprCeR3kparzxMVm
 xostO5a23RUaaLSgefFcQykKX3XvlMNayWfgUoSu4vuiWbjtMfnI54P+vk+4wnWjqsBB
 ngMQ==
X-Gm-Message-State: AFqh2kpyBzceckRk2t1LaPpBmvEccdDLVU/1NuGEMHR5QKPGWIo1bC5z
 Xfjz9l5b9SI+ZFZEGsUj2b+XCA==
X-Google-Smtp-Source: AMrXdXsJhRRL1Is1++esuSIMzRXvs597RfjTTEXCUgLTZRRkoQlwb6sHZ2TeuiIHbxzAzhDGiXldYg==
X-Received: by 2002:a2e:b6d4:0:b0:26e:8d03:c3db with SMTP id
 m20-20020a2eb6d4000000b0026e8d03c3dbmr418039ljo.0.1671615971759; 
 Wed, 21 Dec 2022 01:46:11 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 v18-20020a2ea612000000b0027a197d8247sm1296361ljp.16.2022.12.21.01.46.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Dec 2022 01:46:11 -0800 (PST)
Message-ID: <cb84a044-0508-2b5b-13aa-a081d0e90afd@linaro.org>
Date: Wed, 21 Dec 2022 10:46:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/2] dt-bindings: leds: backlight: add binding for Kinetic
 KTZ8866 backlight
Content-Language: en-US
To: jianhua lu <lujianhua000@gmail.com>
References: <20221221070216.17850-1-lujianhua000@gmail.com>
 <d37e0f2d-eaa5-4eaa-72bb-ead349235d6d@linaro.org>
 <CAEo_cxGK_m_VM1k0EWerfS2b2DF5ucvftQj68h3kBZz2=L=YGQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAEo_cxGK_m_VM1k0EWerfS2b2DF5ucvftQj68h3kBZz2=L=YGQ@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Pavel Machek <pavel@ucw.cz>, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/12/2022 10:40, jianhua lu wrote:
> Thanks for review, I will resend this path.

Are you going to test it, before sending?

Best regards,
Krzysztof

