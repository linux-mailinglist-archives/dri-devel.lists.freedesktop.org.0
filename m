Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D442AC4330
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 18:57:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4E7310E162;
	Mon, 26 May 2025 16:57:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fossekall.de header.i=@fossekall.de header.b="NmKL7wLG";
	dkim=permerror (0-bit key) header.d=fossekall.de header.i=@fossekall.de header.b="GBRC65P7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [81.169.146.165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB65B10E162
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 16:57:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1748278598; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=i7AcLzz45flSV8SSZmZhvXwGgwbDoaHEs7uIFRTZue5U7aVa4QdjLD7zNTOGxmhfwg
 gmBvwAJjp6JoLI8dHJ8Pi7KGWSYOOFFe0LpySIaReDxGoRYU194TuOx2JX/vAOPnaJ7R
 /Z/OMA2Bfu4pDwOy3i6UXM2XGfWA169ZX+mqfFGAHP7LOGe9Lg1mel/WTsiJhwjF8g7C
 Mo0Gihryn8av4+8kbNO3gElJQYKwsxcmuWjic1skFDsD2B51d8ktcEFiF0jRY+bf2Odk
 FeD8c6Hl2EDq9elcA2B3gUzRSkYiQsGDVE5ZUoIZ6XgZZUT4p6ZYJ+Afddv5Z4jpOtmd
 cMlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1748278598;
 s=strato-dkim-0002; d=strato.com;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
 From:Subject:Sender;
 bh=nhNexaZwGrSTtPYexPk0Wd9pTu46clPu7eQ6bt8QEfQ=;
 b=X+BrlcPZdYrxCBUfjGWCIXg0epVbk6dTLloW47KedVLOY0X4y3RmaHwH8RGaM54TgM
 gNKl9Sdjwez7x15ZMjgl9yDhgVVA4ZZ3oCWz7hutH+Brvc7ovfR4pR3AQPV/j4itJVBq
 TudP1aAU7hRN3fEHCg/r/RkGpReI1MBQghJEAxJrL6oLTkBjJDFBkNBMMSPIXjQVJVsj
 FTTigrU+lpc05KpDi2hzVfbRAjRVQoJIAarxX026SGDkyXIelDh0bbqyxLEVMVL4BXCD
 0QQBZTKGxs/x6ZEJSOSU4AHXxH7HT0nIxY34POHm0O84qt1g2PkqPBKYSzQ2DrbsVNMN
 45iA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1748278598;
 s=strato-dkim-0002; d=fossekall.de;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
 From:Subject:Sender;
 bh=nhNexaZwGrSTtPYexPk0Wd9pTu46clPu7eQ6bt8QEfQ=;
 b=NmKL7wLGsztWlXp2jeEPXJPwGnXXt3hWCoew4C0Gsvn4WPlEgMJbng7u51FwAOOxta
 BwWAAcOb3KSwoZJLMtM3vdWmy4tfhF17Ekxgg0TLQSYqPB3eZFsw8YtURqdXb/qztD8J
 SWc7+EikE9U+Bl+9I2LFcG/SKCHzUwcX5QVTAB0MKHLmnqnKwTUMtjxv5VPWEZQuM2bS
 QsUkckZGVgXN3URkS0xwQLQaJkoljr78Jfj65bV0lxJl4DE3asDbyi/N6Qx92uXxDITW
 NVjtj+ngsbxNW3XG7gbltmYPpDZHu5lqCxQ4GNIm1do+b+W3eTDdiLLzcGsv3rAbhCs3
 k49A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1748278598;
 s=strato-dkim-0003; d=fossekall.de;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
 From:Subject:Sender;
 bh=nhNexaZwGrSTtPYexPk0Wd9pTu46clPu7eQ6bt8QEfQ=;
 b=GBRC65P7hVOrFVkuy6GQ6ePZePBDujRGvGAspMk7n78OkCQpc4tlZWFnBtOLkP7FTB
 1VcTXatBNDy7sihriyDg==
X-RZG-AUTH: ":O2kGeEG7b/pS1EzgE2y7nF0STYsSLflpbjNKxx7cGrBdao6FTL4AJcMdm+lap4JEHkzok9eyEg=="
Received: from aerfugl by smtp.strato.de (RZmta 51.3.0 AUTH)
 with ESMTPSA id f28b3514QGubYuV
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 26 May 2025 18:56:37 +0200 (CEST)
Received: from koltrast.home ([192.168.1.32] helo=a98shuttle.de)
 by aerfugl with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.96) (envelope-from <michael@fossekall.de>)
 id 1uJb7s-0002DX-1y; Mon, 26 May 2025 18:56:36 +0200
Date: Mon, 26 May 2025 18:56:35 +0200
From: Michael Klein <michael@fossekall.de>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev
Subject: Re: [REGRESSION] [BISECTED] drm/sun4i: hdmi: No HDMI output with
 BananaPI M1 on 6.9
Message-ID: <aDSdQwwMYQHYX5Rn@a98shuttle.de>
References: <aCJZmm8rC0RwbcBX@a98shuttle.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <aCJZmm8rC0RwbcBX@a98shuttle.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 12, 2025 at 10:27:07PM +0200, Michael wrote:
>with v6.9 and later there is no output on the BananaPI HDMI connector.
>
>I have bisected the issue to the following commit:
>
>  358e76fd613a ("drm/sun4i: hdmi: Consolidate atomic_check and mode_valid")
>
>With this patch, sun4i_hdmi_connector_clock_valid() is occasionally 
>called with clock=0, causing the function to return MODE_NOCLOCK.
>In the old sun4i_hdmi_mode_valid() before the patch, mode->clock is 
>always!=0, maybe that gives someone a hint.

#regzbot introduced: 358e76fd613a
