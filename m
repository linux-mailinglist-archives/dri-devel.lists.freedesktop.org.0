Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEA3569CB2
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 10:12:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8477E11B858;
	Thu,  7 Jul 2022 08:12:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07E2711B858
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jul 2022 08:12:04 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id z12so15559343wrq.7
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jul 2022 01:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=5KfID2vuM9CP0pMWQOIDcQIWQounMtJmRp+vRLZPJ6g=;
 b=vXiTyYAYMh0EwfFiUwBp/Apr5OkbQGXt0OLPij1Xt8AeDJRdmS84oHyrZKfZwTPAWG
 g///yHMqtUNLS9XG9d7jbap2sF/2AkpcIy1PHGBCzbJqhgx83ElRx14WQFjNxpL6pguf
 hukDPr+JlrTg2jtEjMBP1CNn67CiJXpzDnpQwI2nuoVGh/cKOhmoh7tns7aQ+/Ol8aPb
 Av78TOeVoSI3aB3VsADL+XyAW7fRxBzdEVjL38Wvd9xEjJXA/hRkq8aLlMjXUFrAy8WF
 f5m5Abi3clYRYb4fOtfDzgmWJI0qdap5FBY/T1UrgKpfark383YbDitGo5GDHUj/D8Bn
 rIUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=5KfID2vuM9CP0pMWQOIDcQIWQounMtJmRp+vRLZPJ6g=;
 b=KzvCPS6nefb6mEp0f8xkWgkCnaR5ySm1EYMj9Xl4ahodDylSwO8LVcSmcOJadsWnEL
 8gOdYVp/rD5Q9Xfj988FbP6/n7nNgEHsWbLACIt6fc7uThoPcGrM3oLz8ZgG5FMU+AUC
 KxXWPD5szu+z8uoH1Go6OLCyfQGlIPz7EPv0TN7dPOERbKEjMfGoQNoCKBaXxJY4jzdd
 P+0LMHk4jtsfxVMrRhN8e2S5lOjJJyL6y+HNtvLheK+VFq+60yYEzVi243RRolmzdkg1
 BvJyDy/pkAyfJACTwAOmZjdgxQEndASwp9G1FV1206GeJBZqqpKvlvMBL7oim4bmG1an
 PnXQ==
X-Gm-Message-State: AJIora9IbA6wO7aFWScJZNIG4Tu4OS+1DdHCK0yYhQMzd038Hypmlco/
 h/5NrQkGFLv+E9ZP/SK37FmFDQ==
X-Google-Smtp-Source: AGRyM1uKML1qmvsrD8QZ1sHB4rThITkVFvlqHifUHsC9bHdadZZyiox3TC38A0dOfryc4q384xmqJQ==
X-Received: by 2002:a5d:584c:0:b0:21c:1395:f0c4 with SMTP id
 i12-20020a5d584c000000b0021c1395f0c4mr40937029wrf.24.1657181522410; 
 Thu, 07 Jul 2022 01:12:02 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:ae1e:293e:9510:6c36?
 ([2001:861:44c0:66c0:ae1e:293e:9510:6c36])
 by smtp.gmail.com with ESMTPSA id
 bq25-20020a5d5a19000000b0021d6d74a0ecsm9303406wrb.96.2022.07.07.01.12.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jul 2022 01:12:02 -0700 (PDT)
Message-ID: <08146e65-0189-b74a-5548-2a773da5d51f@baylibre.com>
Date: Thu, 7 Jul 2022 10:12:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/3] drm/bridge: fsl-ldb: Fix mode clock rate validation
Content-Language: en-US
To: Robert Foss <robert.foss@linaro.org>, Marek Vasut <marex@denx.de>
References: <20220701065634.4027537-1-victor.liu@nxp.com>
 <20220701065634.4027537-2-victor.liu@nxp.com>
 <201c6bb7-ad86-5b89-e9a1-20a5740b8869@denx.de>
 <CAG3jFyun7NkLCy+bM0XHNRPrk6_kt7z8aB4Ud+4HdeNhffQydA@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <CAG3jFyun7NkLCy+bM0XHNRPrk6_kt7z8aB4Ud+4HdeNhffQydA@mail.gmail.com>
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
Cc: jernej.skrabec@gmail.com, jonas@kwiboo.se, Liu Ying <victor.liu@nxp.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 airlied@linux.ie, Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 sam@ravnborg.org, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 06/07/2022 15:34, Robert Foss wrote:
> On Fri, 1 Jul 2022 at 13:00, Marek Vasut <marex@denx.de> wrote:
>>
>> On 7/1/22 08:56, Liu Ying wrote:
>>> With LVDS dual link, up to 160MHz mode clock rate is supported.
>>> With LVDS single link, up to 80MHz mode clock rate is supported.
>>> Fix mode clock rate validation by swapping the maximum mode clock
>>> rates of the two link modes.
>>>
>>> Fixes: 463db5c2ed4a ("drm: bridge: ldb: Implement simple Freescale i.MX8MP LDB bridge")
>>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>>> Cc: Neil Armstrong <narmstrong@baylibre.com>
>>> Cc: Robert Foss <robert.foss@linaro.org>
>>> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
>>> Cc: Jonas Karlman <jonas@kwiboo.se>
>>> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
>>> Cc: David Airlie <airlied@linux.ie>
>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>> Cc: Sam Ravnborg <sam@ravnborg.org>
>>> Cc: Marek Vasut <marex@denx.de>
>>> Cc: NXP Linux Team <linux-imx@nxp.com>
>>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>>
>> Reviewed-by: Marek Vasut <marex@denx.de>
> 
> Applied 1-2/3 to drm-misc-next. Picked Mareks patch for 3/3 since it
> was submitted first and is identical.

Seems we'll have a conflict when drm-misc-fixes is backmerged in drm-misc-next !

Neil
