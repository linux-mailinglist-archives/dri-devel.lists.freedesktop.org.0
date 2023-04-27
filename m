Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 347646F0528
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 13:49:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BEDA10EB28;
	Thu, 27 Apr 2023 11:49:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 303F210EB28
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 11:49:05 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-94f0dd117dcso1246770866b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 04:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682596143; x=1685188143;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :from:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=lqq87nOOqjNQpSncrD1wY6yEjwcOta9+zYujsta5YuQ=;
 b=Yu8NDxrVU8MYd7frlFBePB3GnCb+CnqQWF8hKDi20KOxBPZwOKAMK0TH3LlXEfeVwH
 djOQSBfjygKqmbNMjtqlkZqPcI/GJVFExSd7HgYTpGiNlM/+cubYKUymn9dj88ObQ33N
 Wlh58GTqxTDC9vMRuW9qc7BGqwTn/kG7Oa80oOzyhf7P/BDXrOWHNUnn0lsgGoRUcSmC
 X7PZJlp596U/lDdeUCaVRh9RkS0uoGZmDBKWN3osVdd9nW2QzDNVMcqlahKkg/xfYvfe
 L/2ZyXHLfBxaGjDVsespTMAQNok0Dx9ZpGjsGb2+gnyJiyQjH6WWYnOKAAOQk1lraANT
 F3Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682596143; x=1685188143;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :from:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lqq87nOOqjNQpSncrD1wY6yEjwcOta9+zYujsta5YuQ=;
 b=W7yRjGrk902vRbU296pHJNvP7VSQIlbUTBXI5m4V3Jh9OkSHJsxZEKNVJ2lzwW7/6z
 UivqGXR6/g14IGf/nRoyNp9z7vnFEwTHgyDVcsjdQW5fnvhbqE/Xi78EiBpwq+pJsWeP
 Ozsh31IjF35gvqMomoXBLCVlxFZNEHS0d+LDJvANzRPHhXqBxSdUHGHoheFm4GVBtFCL
 1qRPZVMJAJQNo4lLhvkGvmd2dZpfgolKL7XiQ7/I7LkyF/eMhuUREekgFXBKkxapaJ9E
 SYoVi39yiH6SbYbzOsejA5iFH+mWYO+iYK1cvXOzNn09lpUagml1tgDd6+a4Cl45R6gk
 LIhA==
X-Gm-Message-State: AC+VfDwCInfHYIonzUiRytwXOQOQKacrAxBZtuJO4FCZf005BIb67ZAg
 SNoO6e/WvOPcYI4xJXVuniqvGZC8Y8OjaBboagdXtA==
X-Google-Smtp-Source: ACHHUZ7Fib7pQRsnT6ykWvzFW3u2Kw+GWYsSIfB8eVpbkMZRmMnWUG9tNlUtLWO6kqAV/EvgP8Hhdg==
X-Received: by 2002:a17:907:8a01:b0:94f:5e17:e80d with SMTP id
 sc1-20020a1709078a0100b0094f5e17e80dmr1427536ejc.45.1682596143190; 
 Thu, 27 Apr 2023 04:49:03 -0700 (PDT)
Received: from [172.23.2.82] ([195.167.132.10])
 by smtp.gmail.com with ESMTPSA id
 bv13-20020a170907934d00b009584c5bcbc7sm6672978ejc.49.2023.04.27.04.49.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 04:49:02 -0700 (PDT)
Message-ID: <c67cafef-3d9b-df8e-f3bf-3205a3631d81@linaro.org>
Date: Thu, 27 Apr 2023 13:49:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH V3 0/3] drm/panel: Add Anbernic RG353V-V2 Panel
Content-Language: en-US
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, Chris Morgan <macroalpha82@gmail.com>
References: <20230426143213.4178586-1-macroalpha82@gmail.com>
 <168259603028.3049941.9313160410502762105.b4-ty@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <168259603028.3049941.9313160410502762105.b4-ty@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: megous@megous.com, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, agx@sigxcpu.org,
 Chris Morgan <macromorgan@hotmail.com>, robh+dt@kernel.org, sam@ravnborg.org,
 kernel@puri.sm
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27/04/2023 13:47, Neil Armstrong wrote:
> Hi,
> 
> On Wed, 26 Apr 2023 09:32:10 -0500, Chris Morgan wrote:
>> From: Chris Morgan <macromorgan@hotmail.com>
>>
>> Add the NewVision NV3051D panel as found on the second revision of the
>> RG353V. The underlying LCD panel itself is unknown (ST7703 is the
>> controller IC).
>>
>> Changes from V2:
>>   - Rebased patch series (to address removal of dsi_dcs_write_seq custom
>>     macro).
>>
>> [...]
> 
> Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next-fixes)

Ok, again b4 picks the wrong branch name, it's drm-misc-next here.

Neil

> 
> [1/3] dt-bindings: panel: Add Anbernic RG353V-V2 panel compatible
>        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=e41fef1e43ae86aecc466e8c9e449d7bf71596a7
> [2/3] drm/panel: st7703: Rename CMD_UNKNOWN_C6 to CMD_SETECO
>        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=e0310564a7e31d7359a6831226aa9b559c6728a0
> [3/3] drm/panel: st7703: Add Anbernic RG353V-V2 Panel Support
>        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=0ed9208cb120086f1b600199c548f00544406fa5
> 

