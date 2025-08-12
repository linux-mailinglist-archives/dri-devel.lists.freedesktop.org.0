Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F28E8B23933
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 21:42:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 275E010E631;
	Tue, 12 Aug 2025 19:42:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="isGLSVFf";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="v8Oo9xmn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 589 seconds by postgrey-1.36 at gabe;
 Tue, 12 Aug 2025 19:42:33 UTC
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDD2910E631
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 19:42:33 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4c1hVL2C70z9tT2;
 Tue, 12 Aug 2025 21:32:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1755027162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l/WiFwrTsFdNOCl1ddmrghHUFlzQt17sb2ZxRbYTeDo=;
 b=isGLSVFf2AFKMRvKxV/rlbqTj4VwZLqj4t/psB/HgARbh53EdsetHMe4rdznGNmFW9LX91
 ZY0QyrVNwzCpk7qUCPkCLdpY8kiRKnrtlnpE4R94ilG0WI3+HliuuVXPia/tAWTCmtGfAb
 VSo17PwY7WI7pDQ4lpoH/D5HPIGFeR+x6mMgj7VAk/X3qBv3zgfn8kWU+4BZgR49aPS8ER
 tNqYzCJNDRgRD+OUD1Br9jIJ2TKf5h4A7WguT+LCxklNli+g0wZy6bZCNaGVHl0XYoWjTW
 bLubtBGk8w3W1e2DU4rQcKVgkwdqEWx9ByC4YxlhcOAfFnKz4BqWpBO0bNQZWw==
Authentication-Results: outgoing_mbo_mout;
 dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=v8Oo9xmn;
 spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates
 2001:67c:2050:b231:465::202 as permitted sender)
 smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <7dc2c17d-9879-41c8-b90d-19f92a2d9c1e@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1755027160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l/WiFwrTsFdNOCl1ddmrghHUFlzQt17sb2ZxRbYTeDo=;
 b=v8Oo9xmnrfPuUYEj3ltfP+ZRVuakOtUx1du3rKgkAxzqEiXGoH7LmEDEqLwdhxF5qekS+i
 MtBDkG/2Z+QDcPSl9gPp3BPEDOEN/HsbxuyRgo0qVstbwmi6uhdL8lTgINwCTEYwlQb0MU
 WuPbNGAFbSESy4FRoeOLoG+KKLZbSdz2eKLEX8vTJly3TnqIuJaVCeu8CGjDm430i9HYGT
 eo5q8W++CcaZIXpINucSZVDQ2A8Rj6YJZy7BYaBcSMAuup2EZ6/aOt4w/o9IggzFFfI7Mk
 ZwJAgT6lTcdGmgo34YHF3D1TSA5sZ2dXIFHEgRzJLAA/5fyiHRIIGMnCKu8eFQ==
Date: Tue, 12 Aug 2025 21:32:36 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 1/4] drm/rcar-du: dsi: Convert register bits to BIT() macro
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-renesas-soc@vger.kernel.org
References: <20250608142636.54033-1-marek.vasut+renesas@mailbox.org>
 <20250608142636.54033-2-marek.vasut+renesas@mailbox.org>
 <bc31d938-847d-46a5-af1e-29de3ac21504@ideasonboard.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <bc31d938-847d-46a5-af1e-29de3ac21504@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 4dekj3h9rz5srpbr8wk5tx9mxxag6pap
X-MBO-RS-ID: 25962b9a37ccb198382
X-Rspamd-Queue-Id: 4c1hVL2C70z9tT2
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

On 8/12/25 3:26 PM, Tomi Valkeinen wrote:

Hi,

>> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
>> index a6b276f1d6ee..b3e57217ae63 100644
>> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
>> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h

[...]

>> @@ -51,11 +51,11 @@
>>   
>>   #define TXVMVPRMSET0R			0x1d0
>>   #define TXVMVPRMSET0R_HSPOL_HIG		(0 << 17)
>> -#define TXVMVPRMSET0R_HSPOL_LOW		(1 << 17)
>> +#define TXVMVPRMSET0R_HSPOL_LOW		BIT(17)
> 
> I'm not sure about this (and below). We have two defines for the HSPOL,
> high and low. If one of them is (x << y), shouldn't the other one be of
> that style too?
It is inconsistent, but one macro describes bit set to 0 and the other 
bit set to 1 (i.e. the actual bit) which is converted to BIT(n) macro. I 
would be tempted to remove the bits set to 0, that's probably the real 
discussion that should happen here. But that would also be a much bigger 
patch. What do you think ?
