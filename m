Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 533B04ACBFC
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 23:21:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D1F210E403;
	Mon,  7 Feb 2022 22:21:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8D6F10E445
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 22:21:35 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id t7so21748858ljc.10
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Feb 2022 14:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=dkktLNRU0zmH3cyCEBpe0WEVGWBqGQdfPJQTXBunhSM=;
 b=hc73tZIWVTZrpAaE4nYlhbUXTRHpuPeIsm/DVzNGGAtNIYKnqKJm38R3lHv/YAZZoe
 6dumvGazH/DcNklK7C/a2KYRilogiuQE67nQiwDTQXEW+h8RvnvutQUaPNDKrEtlqITV
 BQUYhHahwRfy9S+z4dGvDPbq4M4mN6v7hCchX7TuqbJVXcpp/4iu4x04EmUVEYxDQ4eT
 3SlGBwY/LeCES07hoFL1H3GGLx/WNmrpBowUEpuL8n9qkuD3pGLqmxYR/YUf4KpTIkCQ
 KHFz9BfHnfonI4We0ThJoKxWtfentbyXvGK4XE7po4M0mppcQIBhKbqokvllonrjEnfT
 ejAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=dkktLNRU0zmH3cyCEBpe0WEVGWBqGQdfPJQTXBunhSM=;
 b=ttap28H50MQ4oiFfsQrMbdhFnpj16Zh67+DtSxVO+EAdDyQww0X5xpzXQS0SPRULPH
 J5P+70cNBRqS1mUxrNM+EwXxzTtuEIUQLhjjpRR069z+aD9U4wsc/afC8R1OZ+OjLFSJ
 6xEFNRLM4ZVfUNGTKzFtgGb7lE7EzxuluRQLzmnSic9HAGIA/34kwQMo1dhNglFcEPFN
 c0xqHoyMfFsOJ9MLYYal3Elc+KHlCnE6c4CYIEysU/N5kb811LZFB3B9FgEotiPMWBRf
 6lEOhJxUu4/gOzkj53TN1A7Du1nsQLqgOHsPYS1dudSIeG+8lh25uRZ/ZPg42tXNLOqe
 vA/Q==
X-Gm-Message-State: AOAM5308kNuC8NY11fs4HW/zIZBhDki8ttHMoKLYLxM9UOyqYPQ1EI4p
 GGsOW+TgjKs8dqcXqi4A/MM=
X-Google-Smtp-Source: ABdhPJy0lK8u0HHeZcS4g5cUIhdkvfCDkT1m8RTeI08c9XX9m06IH6BoZaQ/qPjFO9p38tWv4GXRBQ==
X-Received: by 2002:a05:651c:17a7:: with SMTP id
 bn39mr960859ljb.26.1644272493832; 
 Mon, 07 Feb 2022 14:21:33 -0800 (PST)
Received: from [192.168.2.145] (109-252-138-165.dynamic.spd-mgts.ru.
 [109.252.138.165])
 by smtp.googlemail.com with ESMTPSA id d5sm117513lji.61.2022.02.07.14.21.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Feb 2022 14:21:33 -0800 (PST)
Message-ID: <4d1051bc-fbfa-48d8-79db-52406bc19018@gmail.com>
Date: Tue, 8 Feb 2022 01:21:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 0/3] Support Sharp LQ101R1SX03 and HannStar HSD101PWW2
 panels
Content-Language: en-US
From: Dmitry Osipenko <digetx@gmail.com>
To: Sam Ravnborg <sam@ravnborg.org>
References: <20220131181208.27101-1-digetx@gmail.com>
In-Reply-To: <20220131181208.27101-1-digetx@gmail.com>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Svyatoslav Ryhel <clamor95@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Anton Bambura <jenneron@protonmail.com>, linux-tegra@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

31.01.2022 21:12, Dmitry Osipenko пишет:
> This series adds support for Sharp LQ101R1SX03 and HannStar HSD101PWW2
> display panels that are used by Asus Transformer tablets, which we're
> planning to support since 5.17 kernel.
> 
> Changelog:
> 
> v4: - Added r-b from Rob Herring that he gave to the LQ101R1SX01 DT patch
>       of v2. I missed to add it to the v3 by accident.
> 
> v3: - No changes. Re-sending for 5.18. Device-trees of devices that use
>       these panels were merged to 5.17, so we're missing the display support.
> 
> v2: - Added ack from Rob Herring to the HSD101PWW2 binding.
> 
>     - Updated LQ101R1SX01 binding, like it was suggested by Rob Herring,
>       making LQ101R1SX03 directly compatible with the LQ101R1SX01.
>       Such that ["sharp,lq101r1sx03", "sharp,lq101r1sx01"] could be
>       used in DT. This removes need to update panel driver with the new
>       compatible.
> 
>     - Improved commit message of the LQ101R1SX03 patch.
> 
>     - Added my s-o-b to all patches.
> 
> Anton Bambura (1):
>   dt-bindings: sharp,lq101r1sx01: Add compatible for LQ101R1SX03
> 
> Svyatoslav Ryhel (2):
>   dt-bindings: display: simple: Add HannStar HSD101PWW2
>   drm/panel: simple: Add support for HannStar HSD101PWW2 panel
> 
>  .../bindings/display/panel/panel-simple.yaml  |  2 ++
>  .../display/panel/sharp,lq101r1sx01.yaml      |  7 ++++-
>  drivers/gpu/drm/panel/panel-simple.c          | 28 +++++++++++++++++++
>  3 files changed, 36 insertions(+), 1 deletion(-)
> 

Sam, could you please take care of this series? Will be great to see it
in 5.18 and have the panel to light up Asus TF201 tablet, thanks in advance!
