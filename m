Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2E656BB6C
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 16:03:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB2DA10E1EA;
	Fri,  8 Jul 2022 14:03:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F18810E0C4
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 14:03:30 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id B0F3382119;
 Fri,  8 Jul 2022 16:03:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1657289008;
 bh=lquRbXR0fWr14Hab+5iUnMRmuIHs2VhIrqBgOrVAm4s=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=VPMio42iFCOkHKpqzLtDMjy27INV/z6f5yqtuBMf32u1AfAei6XUQaEX+kl0m56lZ
 u6BcrQvTe2gkKgxsMt3piOYLIEY4N3OS7B/iTBbcL6WA7JghH84ZvcRRVQI+MkuQIE
 RfLweDhKxku4/q6W/c9rD9EpnaxPo1JTXHDsRN2xpD9ejMvkbZkPw0Lv/EiEWR1lJn
 EubOLpJXZrS9EMfSCxE6cXLlvgNPsXVtezPGFueMhEm2zD1ftndmR0PbTdATfsnq7l
 CmHd2UklNsWD18ixWWL+LX77OwwxuRQqErvzEFn7zBmUNMdvSbj2RAYzqviKAJfDUj
 QnkTPq/GWpxWw==
Message-ID: <8b8d8320-806c-90a5-a253-308052475afa@denx.de>
Date: Fri, 8 Jul 2022 16:03:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi83: Add a sysfs entry for the
 pattern generator
Content-Language: en-US
To: Fabio Estevam <festevam@gmail.com>, robert.foss@linaro.org
References: <20220708140009.1665714-1-festevam@gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220708140009.1665714-1-festevam@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Fabio Estevam <festevam@denx.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/8/22 16:00, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> The sn65dsi83 chip has a test pattern generator capability.
> 
> Add a sysfs entry to allow enabling and disabling it in runtime.
> 
> This is helpful during the MIPI DSI/LVDS bringup.
> 
> To enable the test pattern generator:
> 
> echo 1 >  /sys/bus/i2c/devices/0-002c/pattern_generator
> 
> To disable the test pattern generator:
> 
> echo 0 >  /sys/bus/i2c/devices/0-002c/pattern_generator

I have more of a design question here:
- Shouldn't we implement some sort of standardized helper to set test
   pattern on various other bridges ? There are other bridges which do
   support test pattern generation too.
- The API should be able to select different test patterns, since some
   bridges support more than one.

Thoughts ?
