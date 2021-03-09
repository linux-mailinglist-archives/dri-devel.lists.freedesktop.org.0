Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1AA1332D90
	for <lists+dri-devel@lfdr.de>; Tue,  9 Mar 2021 18:51:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45EC36E0E7;
	Tue,  9 Mar 2021 17:51:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92DF66E0E7
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Mar 2021 17:50:59 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id e10so17366904wro.12
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Mar 2021 09:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=PSGONzx2Ya+di7nElWWfqOMSTg8+wvD3eIGbn+Kjutk=;
 b=xQYm8NA5H7xR0Mb/UnWTUAqPBBTN8AGqoPttojus/GNCJws2+bpQ9yNGNu/0AxSNO+
 0wui42n9GgfEW2bMQ4prZM6EsW6SXP7mibj9cP7VwgB4Jds2ts9cLMwU7R3cjLsUcEXv
 msZCftTl2tT4sLHrTfVYUbPfWTGrNfqzzrte2A9RpIuM1xJAiu2IDWLkL1fvIO+mlZ6f
 5ztWF0gqafsJpHa4+pN4cbYnKaEbh3rCzehR9f+8Iue4sA8+NKHwkYmchYy5ELF//4UR
 39mzQUbHx88gsoAdqKuQ3qPLus/cUYbLrksvGevzTafRuN3TxGqYjk/+tL6qrQKaRXTl
 ikrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=PSGONzx2Ya+di7nElWWfqOMSTg8+wvD3eIGbn+Kjutk=;
 b=pKQJtAw2WPADoG+Mzl01fvEl4BzvyGRyjsT4hpIQ1e3ZprTiWR2CnpGskTIAIaSJDt
 pEhXU2IJNtPybLGIwDlQ2ZQ/EYlbxuvuksmNH31vaL9CtTqc4r0Kcw763izXwIxHvsBd
 XNucAfVqQ+oO3lUOIyM5E7OlFuz+VYGyezuLYb0ifqkBxC9qKZHegpG5YA0CYqtJK8ZX
 WrfsKjIs6OLuWYgcJTpxa83Fr8XED0Xes6pJXPABptUQ0huSksgRtWJ3QPidt13LAK+Q
 cFoifHGvd5U0IqnoDSiNBM/zMRGllWu3c7w9JNFh3gMlAvHLS9Tp5xnhRmNyi/Zi3+5Y
 387w==
X-Gm-Message-State: AOAM532GP6pbfZpXjduwo0TqHRGR7hgT+31uvFZzu6GtVE2gS1pAwejp
 w9frw0WMtcAG6wuhekpQCjYhaQ==
X-Google-Smtp-Source: ABdhPJx6O1YNb6LTVAzGe9AUvxoHuTLhAIagg8uSiEpnK4QkbVPjoX9N4aSrcaXhp0uzi/qs8arR6g==
X-Received: by 2002:adf:de92:: with SMTP id w18mr29187690wrl.217.1615312258048; 
 Tue, 09 Mar 2021 09:50:58 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id u23sm5155822wmn.26.2021.03.09.09.50.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 09:50:57 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, Artem Lapkin
 <email2tema@gmail.com>
Subject: Re: [PATCH] drm: meson_drv add shutdown function
In-Reply-To: <875c606f-baf9-f92a-4820-39d3d7312607@baylibre.com>
References: <20210302042202.3728113-1-art@khadas.com>
 <e033540e-3a4f-3dd7-a1b0-d5a0241e845a@baylibre.com>
 <7h35x42qtt.fsf@baylibre.com>
 <875c606f-baf9-f92a-4820-39d3d7312607@baylibre.com>
Date: Tue, 09 Mar 2021 09:50:55 -0800
Message-ID: <7hsg541aio.fsf@baylibre.com>
MIME-Version: 1.0
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
Cc: gouwa@khadas.com, martin.blumenstingl@googlemail.com,
 christianshewitt@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nick@khadas.com,
 linux-amlogic@lists.infradead.org, art@khadas.com,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Neil Armstrong <narmstrong@baylibre.com> writes:

> On 09/03/2021 18:13, Kevin Hilman wrote:
>> Hi Neil,
>> 
>> Neil Armstrong <narmstrong@baylibre.com> writes:
>> 
>>> On 02/03/2021 05:22, Artem Lapkin wrote:
>>>> Problem: random stucks on reboot stage about 1/20 stuck/reboots
>>>> // debug kernel log
>>>> [    4.496660] reboot: kernel restart prepare CMD:(null)
>>>> [    4.498114] meson_ee_pwrc c883c000.system-controller:power-controller: shutdown begin
>>>> [    4.503949] meson_ee_pwrc c883c000.system-controller:power-controller: shutdown domain 0:VPU...
>>>> ...STUCK...
>>>>
>>>> Solution: add shutdown function to meson_drm driver 
>>>> // debug kernel log
>>>> [    5.231896] reboot: kernel restart prepare CMD:(null)
>>>> [    5.246135] [drm:meson_drv_shutdown]
>>>> ...
>>>> [    5.259271] meson_ee_pwrc c883c000.system-controller:power-controller: shutdown begin
>>>> [    5.274688] meson_ee_pwrc c883c000.system-controller:power-controller: shutdown domain 0:VPU...
>>>> [    5.338331] reboot: Restarting system
>>>> [    5.358293] psci: PSCI_0_2_FN_SYSTEM_RESET reboot_mode:0 cmd:(null)
>>>> bl31 reboot reason: 0xd
>>>> bl31 reboot reason: 0x0
>>>> system cmd  1.
>>>> ...REBOOT...
>>>>
>>>> Tested: on VIM1 VIM2 VIM3 VIM3L khadas sbcs - 1000+ successful reboots
>>>> and Odroid boards, WeTek Play2 (GXBB)
>>>>
>>>> Tested-by: Christian Hewitt <christianshewitt@gmail.com>
>>>> Signed-off-by: Artem Lapkin <art@khadas.com>
>>>>
>>>> ---
>>>>  drivers/gpu/drm/meson/meson_drv.c | 11 +++++++++++
>>>>  1 file changed, 11 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
>>>> index 42c5d3246..693bb1293 100644
>>>> --- a/drivers/gpu/drm/meson/meson_drv.c
>>>> +++ b/drivers/gpu/drm/meson/meson_drv.c
>>>> @@ -482,6 +482,16 @@ static int meson_probe_remote(struct platform_device *pdev,
>>>>  	return count;
>>>>  }
>>>>  
>>>> +static void meson_drv_shutdown(struct platform_device *pdev)
>>>> +{
>>>> +	struct meson_drm *priv = dev_get_drvdata(&pdev->dev);
>>>> +	struct drm_device *drm = priv->drm;
>>>> +
>>>> +	DRM_DEBUG_DRIVER("\n");
>>>> +	drm_kms_helper_poll_fini(drm);
>>>> +	drm_atomic_helper_shutdown(drm);
>>>> +}
>>>> +
>>>>  static int meson_drv_probe(struct platform_device *pdev)
>>>>  {
>>>>  	struct component_match *match = NULL;
>>>> @@ -553,6 +563,7 @@ static const struct dev_pm_ops meson_drv_pm_ops = {
>>>>  
>>>>  static struct platform_driver meson_drm_platform_driver = {
>>>>  	.probe      = meson_drv_probe,
>>>> +	.shutdown   = meson_drv_shutdown,
>>>>  	.driver     = {
>>>>  		.name	= "meson-drm",
>>>>  		.of_match_table = dt_match,
>>>>
>>>
>>> Applied to drm-misc-fixes,
>> 
>> Could you submit this as a fix to stable (v5.10+) also?
>
> It should be done automagically since I added the Fixes tag

Oh, I didn't see the fixes tag, sorry.

Thanks!

Kevin
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
