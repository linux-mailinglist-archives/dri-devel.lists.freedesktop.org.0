Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED336583E79
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 14:17:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1541698EA0;
	Thu, 28 Jul 2022 12:17:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A983398EA0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 12:17:06 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id p22so1750898lji.10
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 05:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=SAWlWlo5GyVcE2aVGpSKqxbu1YUmv/l8IRZI6iKroOU=;
 b=BXCd3H2LIDg72mznLqVg5bCu0ydPWZ9vxSa+uouKxRIMrlEOyi6wiRbwpeI5l73R+O
 zlzDvu0U4f3TAGJvsEHQySn6MI7MaiGA6Qb8sLyjf1i9cSbqdQuhf6KOar0piZKkqhIw
 khEN2g/YMno9sKaTw/kbqVdlu20zUch89KBAAQNpMXN0kRs4ZspH8+Ngbw0EKao4z/Kh
 zAX/YTf2W0j9XVAMQn324gViKVkCrjnyIDndRZApF7blfneG+w5miK8qw5KFvcbOmWFi
 g+34B7gVdfQXWUMeVh3vfs23vDQOb7rhcgxrV+KI2FRmXNY4HS3QGPORkvgfFofZDGtu
 mJdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SAWlWlo5GyVcE2aVGpSKqxbu1YUmv/l8IRZI6iKroOU=;
 b=MWwgPO2VCPUNOfiUHN425HGMCtMLivz8DhlDotbXPq/EsU2cntOC+6mX4IDIuS0E5x
 1uoiCeOBnN8Qqt5ZMW6Vf48yqNTJAzFEdWujyKh8V5xf+thtJ1FLINEHEd/mLuldSOFy
 AtTXN75DLTM7r5edBHpKOAEYJXsgunWMnjkp9rW3z4+slyiL+w4ow+0Gp8Q21RAAbQIo
 8f7pNgzjnTh87qtu4O0Vnn0MZZpKjZ2ewZHmKSzDo9ooFtnaNiMVSHpwSp/KSfN4ev6v
 gKyYqGJE+jwkieIEZB7BUwG4wsbmbHLkNQ3InmzURy1oGdyz5BsS7e3ONg5doHr8U8O6
 KCIQ==
X-Gm-Message-State: AJIora9r8Mp2eeAcn1B54zzowfGaJ/6zG/QtmXeFwbTiV5+0oeW1pI9A
 eD0CyVqGhCdHJtU1CK2giosQGw==
X-Google-Smtp-Source: AGRyM1vI0ZKeUCG/yKFDtqirw8GvQ0KhX68RAHnYDcvxAh8pmNNCY3ml26WPiz6AEjbmu75zhj5hyA==
X-Received: by 2002:a2e:a177:0:b0:25e:2d69:391b with SMTP id
 u23-20020a2ea177000000b0025e2d69391bmr699026ljl.60.1659010624826; 
 Thu, 28 Jul 2022 05:17:04 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no.
 [78.26.46.173]) by smtp.gmail.com with ESMTPSA id
 r4-20020ac25c04000000b0048a9ec2ce46sm169134lfp.260.2022.07.28.05.17.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jul 2022 05:17:04 -0700 (PDT)
Message-ID: <5467d0ad-0285-f2ba-5366-68b0c30caed0@linaro.org>
Date: Thu, 28 Jul 2022 14:17:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v4 1/2] dt-bindings: display: panel: Add Novatek NT35596S
 panel bindings
Content-Language: en-US
To: Molly Sophia <mollysophia379@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220728023555.8952-1-mollysophia379@gmail.com>
 <20220728023555.8952-2-mollysophia379@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220728023555.8952-2-mollysophia379@gmail.com>
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
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28/07/2022 04:35, Molly Sophia wrote:
> Add documentation for "novatek,nt35596s" panel.
> 
> Changes in v4:
> - Correct numeric order of the items.
> 
> Changes in v3:
> - Embed the documentation into existing one (novatek,nt36672a).

This does not go to commit msg, but to changelog after ---

With this fixed:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
