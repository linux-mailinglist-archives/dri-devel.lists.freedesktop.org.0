Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B19B2393E
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 21:45:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D8D210E639;
	Tue, 12 Aug 2025 19:45:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="rtBraLiU";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="HoQrJVxX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39EA210E137
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 19:45:18 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4c1hYn40dRz9sZK;
 Tue, 12 Aug 2025 21:35:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1755027341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gEO4of1tDk5pyESbxLhghGpcN4wW9jV8MI6Qe8anx2U=;
 b=rtBraLiU9UPcJGAMfKhpOoEGj9XTsjTJtB2nrxANJJaaTOCDnGafJqPDaOMAP4G7LUcGxg
 jz689Uj3Ahh66s3DXwfmc5H6aYGUMHr+cP+1oo7ZWnHlyHtLEQZgJdHj2Oec1I1pLtHr8x
 xtttfmds1uE+3+CzU/uyNSNlUB4HeGZR67iCxyo+Ncov0QMDz3y6zAhY67IZQ25loXE7Zm
 1kYYt2R2Sj0+FXnhYW7psvi1XVpkdtInlxt/vaVYH1sH9zQfy4PgKWfrOHTXzRRaAszY2j
 NfxihXqezR+Z8fzFGSXYODLKYq09y8Y7KhAFXmJugcUMG51/VM4O+Hu1IohFkQ==
Authentication-Results: outgoing_mbo_mout;
 dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=HoQrJVxX;
 spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates
 2001:67c:2050:b231:465::102 as permitted sender)
 smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <1ae735be-3d07-4520-8013-c4b7a1b1c26a@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1755027339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gEO4of1tDk5pyESbxLhghGpcN4wW9jV8MI6Qe8anx2U=;
 b=HoQrJVxXU0kGqI2fNtwdWcE3VHts9InPlYRCZxZJ/Ly5JhQ2NxGI1AlQROzCDDcPX8fdzk
 0vHME8Ati2+F082o74xx2cEqHKG75FR8EcICBY5odnd5Lm0RS/B7Ptz5xj0QGY5hoErV15
 PyI6A49Eb+GFx94Rzf3md0EElKgOjMD9za9kxm0s7QNziyIwegzvNmVt2SKOQUqEDnmcoU
 o6j/5rNhW9ErE3AoljkRGsLZmkaG/kA7s9OFzIVSmypfEdhHc3hmvlAf4V5yKNyyPsn4TN
 qKu9IjIM5E3aAkiMEb4m/Uf+U00RtGwXyPPvGBw2k5xK5W6/uOQ1pllkNLe+sA==
Date: Tue, 12 Aug 2025 21:35:36 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 2/4] drm/rcar-du: dsi: Remove fixed PPI lane count setup
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
 <20250608142636.54033-3-marek.vasut+renesas@mailbox.org>
 <64b49da6-15ae-45e1-a4af-c1f08f80cf3a@ideasonboard.com>
 <87cc32a7-fe1d-4d8d-b793-e3bb7e12fb7d@ideasonboard.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <87cc32a7-fe1d-4d8d-b793-e3bb7e12fb7d@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 7daa446b7a83f7697af
X-MBO-RS-META: wudcw1kwc87tbfy16g5yq7id47pfsahx
X-Rspamd-Queue-Id: 4c1hYn40dRz9sZK
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

On 8/12/25 3:30 PM, Tomi Valkeinen wrote:

Hi,

>>> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
>>> index b3e57217ae63..cefa7e92b5b8 100644
>>> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
>>> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
>>> @@ -80,10 +80,7 @@
>>>    * PHY-Protocol Interface (PPI) Registers
>>>    */
>>>   #define PPISETR				0x700
>>> -#define PPISETR_DLEN_0			(0x1 << 0)
>>> -#define PPISETR_DLEN_1			(0x3 << 0)
>>> -#define PPISETR_DLEN_2			(0x7 << 0)
>>> -#define PPISETR_DLEN_3			(0xf << 0)
>>> +#define PPISETR_DLEN_MASK		(0xf << 0)
>>>   #define PPISETR_CLEN			BIT(8)
>>
>> Looks fine, but do you know what the TXSETR register does? It also has
>> LANECNT, but I don't see the driver touching that register at all.
>> TXSETR:LANECNT default value is 3 (4 lanes), which matches with the old
>> hardcoded behavior for PPISETR... So I wonder if that register should
>> also be set?
> 
> Ah, never mind, I now saw the patch 3 =). But should it be before patch
> 2? Hmm, I guess that ordering is no better. Should they be combined into
> "support 1,2,3 datalanes" patch?
I think each patch fixes slighly different issue, even if the issues are 
related. I tried to keep the issue description in each patch commit 
message for posterity. I can squash them if you think that's better, I 
don't mind either way.
