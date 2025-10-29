Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CAAC1A144
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 12:40:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A41D610E7A0;
	Wed, 29 Oct 2025 11:40:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=dwurp.de header.i=@dwurp.de header.b="RIWF8YjL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.dwurp.de (mail.dwurp.de [185.183.156.149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80AAD89954
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 11:40:28 +0000 (UTC)
Message-ID: <ffd5081c-2193-4ae2-9b2c-c32b276fe1d9@dwurp.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dwurp.de; s=mail;
 t=1761738025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TTyQI4Tts9+775CKf5cVmQAALYTRwiiX2bdCP1i30PM=;
 b=RIWF8YjLxwcXkhBKw+7pNZycLwm/ZZayfmE7J38UjnIz3a7T4yurK+pjTF3cy3whhqmnxp
 TI4VjKPAKk/CS+1NbZETT3NUZDcFk3MM7CRIcVPinbfJZD5fvLRCccFszWc1Zd+zCV23D5
 2IHO3pC2zWqUGvQ0qlkUoOZGeYGmkw4=
Date: Wed, 29 Oct 2025 12:40:21 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] drm/panel: kingdisplay-kd097d04: Disable EoTp
To: Christoph Fritz <chf.fritz@googlemail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251028214045.1944956-1-dev@dwurp.de>
 <aeee5f47ef2842fde66bc66fc598ee4f007fc1c2.camel@googlemail.com>
 <33e255dc-64f9-4e4f-82eb-6f5e9c1d63d4@dwurp.de>
 <5465f445fe9e230f1f37cbb22a97ff2b7c9c3d2e.camel@googlemail.com>
Content-Language: en-US, de-DE
From: Sebastian Fleer <dev@dwurp.de>
In-Reply-To: <5465f445fe9e230f1f37cbb22a97ff2b7c9c3d2e.camel@googlemail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/29/25 09:15, Christoph Fritz wrote:
> It's not a workaround, it's the actual fix.
> 
>> However, I'm in favor of keeping the "Fixes:" line since using bisect,
>> commit d97e71e44937 ("drm/bridge: synopsys: dw-mipi-dsi: enable EoTp by
>> default") is found as the first commit that shows distorted output for
>> that panel.
> Documentation states:
> 
>   || A Fixes: tag indicates that the patch fixes a bug in a previous
>   || commit
> 
> You are quoting the wrong commit in your Fixes: tag.

OK, now I got it. I'll send v2 with Fixes: 2a994cbed6b2 ("drm/panel: Add 
Kingdisplay KD097D04 panel driver").

Thank you for your guidance.

Best regards
Sebastian
