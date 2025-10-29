Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 030E7C1BA1F
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 16:25:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA85A10E121;
	Wed, 29 Oct 2025 15:25:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="xdMGHRXF";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="HX5Xism4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 620CD10E121
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 15:25:40 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cxWKG5zztz9tCG;
 Wed, 29 Oct 2025 16:25:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1761751538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RhUcv1IL0upcpQTK944Koz2Faz/o5idxFnloyVhGwxs=;
 b=xdMGHRXFuQZ4tPB/JkOuSmnPC1BHNi8/kXGpzw0qXhuzihdhNzq4rQo4Etfb0tw0tYboUT
 yPDECIM5iA7/qnBTcc1PTcz7EANJ50YnzXHCa7Db+QkcdZdiErWrQaKGaadV+wTOeeXEMm
 MX/oD0b8I4zbBl7b5wlRbqX+PMtmgLEzcFomj5AnPeWBAoQWuavjW+6RouIWOfdOvcUb6o
 EjNQy4pSQadd0dJvQU2eLGVrwkSsOz+uH9c6jiJkQZRdtT3KRyoxPBOgG2AxwE3wPDBaP/
 0jaym0nkr0vRFURnsQmjme1tOzq8IGjhRB09eCMfMZ3J6QQlhKV/qzNLnXzjOg==
Authentication-Results: outgoing_mbo_mout;
 dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=HX5Xism4;
 spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates
 2001:67c:2050:b231:465::1 as permitted sender)
 smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <795893ce-c7b1-4128-a28c-1b5b5633f400@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1761751537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RhUcv1IL0upcpQTK944Koz2Faz/o5idxFnloyVhGwxs=;
 b=HX5Xism4Va6eRcYVj7xQJMUjIFIB+n+XxbjoVF6s7S4cREdpmrlNnOXz9FT4T1zFjagXbm
 It18d29BVDl1FhUaUJAximO+r8e1B8iqGMeqwKLgH2RG3Uw1eiSlR+JfVmuROKWxMJ4SlE
 BXIuta68O+DAJsv55pPiZ4aFG5Rb7BJtSuKWKr+VcylTBbqVmVEHMhsaUYjks7j+KjT9md
 c4Lp3IU4Y9T0BwwwKWl7rUHtCpiQqVlWFPyJm1k1efB5HNmlgg18M7qkdaTLu3hDWpMT7N
 OZlaWoha3TmfzZY+ZiWbqwOJyo8gkqmanJrN6kqrTzf8Pv+yl1AQHmVFvDaRuA==
Date: Wed, 29 Oct 2025 16:18:43 +0100
MIME-Version: 1.0
Subject: Re: [PATCH v4 00/11] drm/rcar-du: dsi: Convert register bits to
 BIT()/GENMASK() macros
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
References: <20251028232959.109936-1-marek.vasut+renesas@mailbox.org>
 <b44112ed-2c41-4e33-953b-8031fd29a97d@ideasonboard.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <b44112ed-2c41-4e33-953b-8031fd29a97d@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: db20519cf3726ca7137
X-MBO-RS-META: 7b1gu4eoscuir7wtezqeeiqmuq9in5ke
X-Rspamd-Queue-Id: 4cxWKG5zztz9tCG
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

On 10/29/25 10:38 AM, Tomi Valkeinen wrote:

Hello Tomi,

> On 29/10/2025 01:28, Marek Vasut wrote:
>> Convert register bits to BIT() macro and bitfields to GENMASK()/FIELD_PREP() macros.
>> Most of this patchset is boring mechanical conversion.
>>
>> Noteworthy patches are 8 and 9 , those introduce handling of DSI mode flags
>> and convert use of DRM_MODE_FLAG_P.SYNC into DRM_MODE_FLAG_N.SYNC, but that
>> should not have any adverse effect on existing hardware.
>>
>> Marek Vasut (11):
>>    drm/rcar-du: dsi: Fix missing parameter in RXSETR_...EN macros
>>    drm/rcar-du: dsi: Document TXVMSETR PIXWDTH as bitfield
>>    drm/rcar-du: dsi: Document PHTR TESTDOUT as bitfield
>>    drm/rcar-du: dsi: Deduplicate mipi_dsi_pixel_format_to_bpp() usage
>>    drm/rcar-du: dsi: Clean up VCLKSET register macros
>>    drm/rcar-du: dsi: Clean up CLOCKSET1 CLKINSEL macros
>>    drm/rcar-du: dsi: Clean up TXVMPSPHSETR DT macros
>>    drm/rcar-du: dsi: Respect DSI mode flags
>>    drm/rcar-du: dsi: Clean up handling of DRM mode flags
>>    drm/rcar-du: dsi: Convert register bits to BIT() macro
>>    drm/rcar-du: dsi: Convert register bitfields to GENMASK() macro
>>
>>   .../gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c   |  50 ++-
>>   .../drm/renesas/rcar-du/rcar_mipi_dsi_regs.h  | 387 +++++++++---------
>>   2 files changed, 237 insertions(+), 200 deletions(-)
>>
> 
> Thanks, pushed to drm-misc-next.

Thank you

-- 
Best regards,
Marek Vasut
