Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3595D3B6C5
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 20:08:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE95410E4ED;
	Mon, 19 Jan 2026 19:08:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="nAlJpI8+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA66510E4ED
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 19:08:13 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dw0N95hsKz9tfx;
 Mon, 19 Jan 2026 20:08:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1768849689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9H8nBGgFVL91FP93JHfkjVwv7xUFyqUQw76ZtrBZ/LA=;
 b=nAlJpI8+f+GbVqBtJXHTc9jgoQhITv0Yp/9IGgnAoKMm6kX3setz/pdCJ08xUe+no/DU8g
 nIb/yge3IB3iFjC35uJ7g3kIk+npNebiJL6TcRaXB9MQ59AIl80O8wLug9yPiKUdwPhH0C
 BcIafKAzM+N4wZaqshe/7nXI2D7BPNk+2bE5n86ic/wuJJ/NSETkNOKLIsfmGWT4DfNSR+
 1b4yZwftdADN5akvGiJjvqT35bNag4XXSxVwKgd4xnROo90aJ+OYhEXzxhnX/FSBnoOYTU
 9f7B9XQ7TnlUu8RJUqRuOmbyojWGInhCFZ9XNlPSQXqIfhINTrUd2ZSLwzKeww==
Message-ID: <926a0b23-5159-4f4e-b278-b545ae281410@mailbox.org>
Date: Mon, 19 Jan 2026 20:08:04 +0100
MIME-Version: 1.0
Subject: Re: [PATCH v3 1/2] drm/panel: simple: Add Waveshare 13.3" panel
 support
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Jessica Zhang <jesszhan0024@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, Simona Vetter <simona@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260117005028.126361-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdXHKJYcP78WLUfGrN8v+PmChj7jEsjhnVXYnSOzZ7mkpw@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdXHKJYcP78WLUfGrN8v+PmChj7jEsjhnVXYnSOzZ7mkpw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 73tz3ja79h57j79bgs1gw4jdpfmor78o
X-MBO-RS-ID: 8b5673dbed978ea5937
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/19/26 4:56 PM, Geert Uytterhoeven wrote:

Hello Geert,

>> --- a/drivers/gpu/drm/panel/panel-simple.c
>> +++ b/drivers/gpu/drm/panel/panel-simple.c
>> @@ -4998,6 +4998,33 @@ static const struct panel_desc vl050_8048nt_c01 = {
>>          .bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE,
>>   };
>>
>> +static const struct drm_display_mode waveshare_133inch_mode = {
>> +       .clock = 148500,
>> +       .hdisplay = 1920,
>> +       .hsync_start = 1920 + 88,
>> +       .hsync_end = 1920 + 88 + 44,
>> +       .htotal = 1920 + 88 + 44 + 148,
>> +       .vdisplay = 1080,
>> +       .vsync_start = 1080 + 4,
>> +       .vsync_end = 1080 + 4 + 5,
>> +       .vtotal = 1080 + 4 + 5 + 36,
>> +       .flags = DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PHSYNC,
>> +};
> 
> That looks like the plain standard 60Hz Full HD mode.
> Is there really no other copy of that structure available in the kernel?
> 
> auo_t215hvn01_mode is almost the same, except for .clock and .flags.
> drivers/video/fbdev/core/modedb.c has the same mode, but in a different
> structure.

The panel-simple.c is full of similar-ish panel timings . The timings 
above are adapted from the waveshare DTO for this panel. What else would 
you suggest I do/use for this device ?
