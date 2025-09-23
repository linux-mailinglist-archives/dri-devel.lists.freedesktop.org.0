Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C7DB95188
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 10:58:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52FFB10E5A9;
	Tue, 23 Sep 2025 08:58:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="aEqAxnlb";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="I21IKLyd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24C8A10E5A9
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 08:58:39 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cWDRK5bj8z9svK;
 Tue, 23 Sep 2025 10:58:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1758617917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n5r/u7Mp6BK9X1rjwcYLYF/ePixUf4KU9AWPaRMbcoU=;
 b=aEqAxnlbObeuBGWH9TzhRM/cJzh8xWsjzLIsIb5now39zCl7gChTvbnZeTJuGVnvPqgO7O
 ZpTTRNQJZbFfKdKZ70MFMvzttb12YaglPaG+/QlFhPGx9DAxrnGIEh/Mju7iJRGQif0cF6
 f6+Az66IVSCe1+W+bhwLK3M680RsPWgLDSfw5bk/jlWNrgPlQHslM2HT+TITt71PfUwX+8
 bTN1kWqF/XrQvQ96V3RPZ0WjKuCWxYFLocxf6kqUlNGe4brZdy/B/CyaPIp7cazKeyjqtu
 M12OolfHYyGhoJbsD1wOmjLT1Hp3XKnLA+Dw7dUypBW9RUHXfkTebqTNUvG10Q==
Message-ID: <ce2b5734-4a5c-4d63-be62-fc4c4cf7cfea@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1758617915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n5r/u7Mp6BK9X1rjwcYLYF/ePixUf4KU9AWPaRMbcoU=;
 b=I21IKLydQRRFfxxkb/3hZ7XXwxHNkYQnLyN+nX7GgjQQJt2Wkh0H//mXysQEWZFGPmo1B1
 6EA7j6o12rto4vhk+uGTcCsgjvAhUFJwOU7tSMUJHOreH8Jr5bGPxKrmhr1iLzyWWNqHWl
 DKFT5RZkxRl75qHjpwtqsIuiCTHMtiF5EkVyMp4qUZHqTUr1YILiz5UG6ztByMOhyymNHg
 zYrv7hRSQHT8t1Y8rwxg6QgENizMfqQWKoovmfWbMr+rTdnJ4SEGyt07OUPWTYeylL7GXJ
 4AQNjTW+knrwH0xsWVeImuuAn2Hj7eDrkn4qPemKQiEX6DIkZLOzf63cDGUtkw==
Date: Tue, 23 Sep 2025 10:58:31 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 4/9] drm/rcar-du: dsi: Clean up CLOCKSET1 CLKINSEL macros
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 "magnus.damm" <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
References: <20250922185740.153759-1-marek.vasut+renesas@mailbox.org>
 <20250922185740.153759-5-marek.vasut+renesas@mailbox.org>
 <TY3PR01MB11346FE123074366946A24C26861DA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <TY3PR01MB11346FE123074366946A24C26861DA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: bea685a478041a0408f
X-MBO-RS-META: dr4b7uh8mdii73tengfw14mggq71esd9
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

On 9/23/25 7:45 AM, Biju Das wrote:

Hello Biju,

>> Introduce CLOCKSET1_CLKINSEL_MASK macro and remove bitshift from values to make this bitfield usable
>> with FIELD_PREP(). There are no users of this bitfield, hence no updates to the DSI driver.

...

>> -#define CLOCKSET1_CLKINSEL_EXTAL	(0 << 2)
> 
> 0
>> -#define CLOCKSET1_CLKINSEL_DIG		(1 << 2)
> 4
>> -#define CLOCKSET1_CLKINSEL_DU		(1 << 3)
> 8
>> +#define CLOCKSET1_CLKINSEL_MASK		(3 << 2)
>> +#define CLOCKSET1_CLKINSEL_EXTAL	0
>> +#define CLOCKSET1_CLKINSEL_DIG		1
>> +#define CLOCKSET1_CLKINSEL_DU		2
> 
> 
> Looks like this patch breaks existing functionality,

There are no users of this bitfield, hence no updates to the DSI driver. 
(see commit message). Therefore there is no breakage.

> as the macro values are different.
Use FIELD_PREP(CLOCKSET1_CLKINSEL_MASK, 
CLOCKSET1_CLKINSEL_{EXTAL,DIG,DU}) with these updated macros, that will 
place the value in the correct location .
