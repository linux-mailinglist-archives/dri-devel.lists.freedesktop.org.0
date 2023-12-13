Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A34812113
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 22:59:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DC1B10E844;
	Wed, 13 Dec 2023 21:59:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8B0610E844
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 21:59:38 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40c2c65e6aaso77390225e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 13:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702504777; x=1703109577; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5R8Y7jc9NLGPyREc0JUtb8eKm2rIjrA9+VPMF6ejgso=;
 b=iiYlzalXtb+Gc5nde5QQW/3MJUkGA9G8mjElLqcJw3enhSdd9AJDeJZgNY/RI4Gn9d
 TVOmY03sIdN9/eJutS2kMDR3l03N+0yE5e0j4DPM2kGP+wyqSzOWHCp0ipK1jJkwQezI
 p/AFSojGQi7gNmPe4J/dBewMgvqQ1vIkl0Syda8ay948QB8MLPghFYDMd8LxBsKPGUpF
 m+/6ojh+fO6U2rA5y9W9103heEr9JH1tEh4FyoUwmsjhD7sh4/m/AeAjtyeWo4zWZwoD
 qid7sAAPV5QwJ1zVH3brJo89QKsE+0H+0zGcsmfDn6nb6B1fPPNI/XfpTRdokZ8NWqLh
 2xoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702504777; x=1703109577;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5R8Y7jc9NLGPyREc0JUtb8eKm2rIjrA9+VPMF6ejgso=;
 b=m8ZPuK0GH2wTrqdGO1spBVEJOTZuZBCrgPfaQzeWFp8I/alGdTDbfE9gAsYi0dF77Z
 BJnVRc2u5uEuurqKbuqfg27rE9B1P5don7PmbTWZ7Xc7e2v23MYeMUsFMz9V4AHb9v6o
 C2jXd7sQ36zGM7SXPNpxdsA8WyaL+BPpeyEQPIuCm6iM+lg+YRTQvIUo4rkI8kM2S0f3
 cUWJnUWpdNhfVKRn4Xbl8ii27+qqP85qtsjOjfBuznhj5XcVBFURN18ZomSAe+18oeDi
 H1CTfp8J0A/O6s8NwveR1MnM0vs862grSUvDL7ScD0MQuFe3gG9/0s/UeS57MVAQK/j5
 BGyg==
X-Gm-Message-State: AOJu0YyLjtVjQk2emxKDodNUWdxpLgtxXTaCwpcu3gWZfBKX/kHUbZBP
 e0knpxa/e5gxM4qvB+tpsUafUw==
X-Google-Smtp-Source: AGHT+IH8WBMrcy2RpgDyVtXzThQj76QcUxVNUDU/RnHWzVkOCspImqThjEx7TAvmErkgFn+mKeaRYg==
X-Received: by 2002:a05:600c:1f1a:b0:40c:314a:42e with SMTP id
 bd26-20020a05600c1f1a00b0040c314a042emr4345008wmb.246.1702504777134; 
 Wed, 13 Dec 2023 13:59:37 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:ac4e:a5fe:7f71:8d59?
 ([2a01:e0a:982:cbb0:ac4e:a5fe:7f71:8d59])
 by smtp.gmail.com with ESMTPSA id
 k40-20020a05600c1ca800b0040b45356b72sm24189351wms.33.2023.12.13.13.59.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Dec 2023 13:59:36 -0800 (PST)
Message-ID: <98e93632-45e2-4d7b-bde2-4326d07b3c25@linaro.org>
Date: Wed, 13 Dec 2023 22:59:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/4] Add displays support for bsh-smm-s2/pro boards
Content-Language: en-GB
To: Rob Herring <robh@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
References: <20231213140437.2769508-1-dario.binacchi@amarulasolutions.com>
 <20231213175330.GA1582432-robh@kernel.org>
From: Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <20231213175330.GA1582432-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Peng Fan <peng.fan@nxp.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Robert Foss <rfoss@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, michael@amarulasolutions.com,
 Jagan Teki <jagan@amarulasolutions.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Sascha Hauer <s.hauer@pengutronix.de>, Maxime Ripard <mripard@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Shawn Guo <shawnguo@kernel.org>, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Amarula patchwork <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le 13/12/2023 à 18:53, Rob Herring a écrit :
> On Wed, Dec 13, 2023 at 03:03:41PM +0100, Dario Binacchi wrote:
>> The series adds drivers for the displays used by bsh-smm-s2/pro boards.
>> This required applying some patches to the samsung-dsim driver.
>>
>> Changes in v6:
>> - Drop patches:
>>    - [06/10] drm/panel: Add Synaptics R63353 panel driver
> 
> The binding should have gone with this. I'll apply it then.
> 
> Rob

Oops I missed it,

Thanks for applying it

Neil
