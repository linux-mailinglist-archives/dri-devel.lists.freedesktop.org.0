Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0F1ACBB26
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 20:41:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F88D10E57B;
	Mon,  2 Jun 2025 18:41:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fossekall.de header.i=@fossekall.de header.b="fibYQmTc";
	dkim=permerror (0-bit key) header.d=fossekall.de header.i=@fossekall.de header.b="hH9TwSuo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [81.169.146.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A07010E57A
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 18:41:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1748889622; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=rM2P+CaRhGffqVq4tRviWSTbREPg5znvUJSQVLUsjAaLhBZVfrK1+Og6v62NQVqbMo
 MK4bqVz0mLm9QM0PMWe+pPNmhcq3rLjrzGQF0NOiHu4WV5OEncwpcouezQiF25BvUPk5
 otcw3k40frk0KYmk22Uih3Y3Do4HfD8GuF9WdHNQ1mdD4AnQCdZd+7DnGxqyjkSIx/L3
 Ci9NfS3RYL/YnkI2cdXMycGjyEk5Unu9ZdnLl71vIv0KlPIDciJoigXMtzhywlmA/K9J
 y2zR0FGHsOh6s3V3JGR5e1wazpoFjiEhED8l9BtAsq8jCyntXzoDyruVMdFZmz0pXzno
 w3nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1748889622;
 s=strato-dkim-0002; d=strato.com;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
 From:Subject:Sender;
 bh=Ll30kUAP5eRCFRJRemYe8NpfsMFwOGHDOe6WSTbd6a8=;
 b=a441mlLadlD0fbmfWUxWlwmb8TJhBV8Z/qrA8rtp7idRk/vFXhv3t6K3zPRudbPbxl
 C22AQuuxb2qMQbCV9D7NeKxo+zl8TW6zKsWsIeH+v5DpfYMwC5czFqtbMIcp51hT5G5c
 DrG3RGOU9qdxubVziqY92J0Pcj9wGB7pFHhUIC1pqvi9uA6EnPN93YBQaotLX+g/CN+o
 pZIaSTFkFqAsUfJsmPyok01xvQnOnOevPKty2NCf5U88p+aiBuYDDmPv/A8taqk2NhZF
 YtOg9KSONblrqvqedcft3+xvk2EBKRYXD/kYzxKonyPG75E+CgaqHtsQtstK7yXnqOrB
 +tkA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1748889622;
 s=strato-dkim-0002; d=fossekall.de;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
 From:Subject:Sender;
 bh=Ll30kUAP5eRCFRJRemYe8NpfsMFwOGHDOe6WSTbd6a8=;
 b=fibYQmTcvfRVQE1qje44LVdC3dq0LSSw79RK8eyXF2/fl8WEP4yPYMUx9cjCNLL3IB
 PbVTy/mmDzs7DZsD2K3hVDYjhCG2B0Qu7mCx3/PMk1QHPe1qoxL4f9wVpLKtajnMvjT+
 jFVJTDIzUJdasuEuFBVwRJq515dYaVzBazQLUnwgdL65QERnV6cRtRV45lSD7ZO+6HHx
 TXywYa8El7MSZPnmmnPgdfC7qkHafGCmI1sEsS/XHEJ60R8AGXTFv1XE19UD9axhSYdJ
 qZoSJGfxFb0fYla48gtvWC0Jzsq+N5D5pTmM4JLsONM3DfKanVd1XCkn/qCumo1lS8GH
 WPug==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1748889622;
 s=strato-dkim-0003; d=fossekall.de;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
 From:Subject:Sender;
 bh=Ll30kUAP5eRCFRJRemYe8NpfsMFwOGHDOe6WSTbd6a8=;
 b=hH9TwSuo8Rz5q4Ljw2UR98E8Uvs5v2ifM2IFF5SBIAeU5LjeRsYFkcSpx6ayyMeKvz
 E++JGWGHkYaawC6N11Aw==
X-RZG-AUTH: ":O2kGeEG7b/pS1EzgE2y7nF0STYsSLflpbjNKxx7cGrBdao6FTL4AJcMdm+lap4JEHkzok9eyEg=="
Received: from aerfugl by smtp.strato.de (RZmta 51.3.0 AUTH)
 with ESMTPSA id f28b35152IeLr39
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 2 Jun 2025 20:40:21 +0200 (CEST)
Received: from koltrast.home ([192.168.1.32] helo=a98shuttle.de)
 by aerfugl with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.96) (envelope-from <michael@fossekall.de>)
 id 1uMA56-0000lr-23; Mon, 02 Jun 2025 20:40:20 +0200
Date: Mon, 2 Jun 2025 20:40:19 +0200
From: Michael Klein <michael@fossekall.de>
To: Maxime Ripard <mripard@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [REGRESSION] [BISECTED] drm/sun4i: hdmi: No HDMI output with
 BananaPI M1 on 6.9
Message-ID: <aD3wE_mkfYA2XqA6@a98shuttle.de>
References: <aCJZmm8rC0RwbcBX@a98shuttle.de>
 <20250526-refined-dog-of-blizzard-b48f11@houat>
 <aDTZXagQ28OdNtLh@a98shuttle.de>
 <20250602-psychedelic-purring-poodle-900a5b@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250602-psychedelic-purring-poodle-900a5b@houat>
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

On Mon, Jun 02, 2025 at 11:55:44AM +0200, Maxime Ripard wrote:
>On Mon, May 26, 2025 at 11:13:01PM +0200, Michael wrote:
>> On Mon, May 26, 2025 at 07:30:35PM +0200, Maxime Ripard wrote:
>> > On Mon, May 12, 2025 at 10:27:06PM +0200, Michael wrote:
>> > > with v6.9 and later there is no output on the BananaPI HDMI connector.
>> > >
>> > > I have bisected the issue to the following commit:
>> > >
>> > >   358e76fd613a ("drm/sun4i: hdmi: Consolidate atomic_check and mode_valid")
>> > >
>> > > With this patch, sun4i_hdmi_connector_clock_valid() is occasionally called
>> > > with clock=0, causing the function to return MODE_NOCLOCK.
>> > > In the old sun4i_hdmi_mode_valid() before the patch, mode->clock is
>> > > always!=0, maybe that gives someone a hint.
>> >
>> > This doesn't make sense to me, if only because the two callers of
>> > tmds_char_rate_valid (hdmi_compute_clock and
>> > drm_hdmi_connector_mode_valid) have, right before calling it, checks to
>> > make sure the clock rate isn't 0, and would return MODE_ERROR or EINVAL
>> > in such a case.
>> >
>> > https://elixir.bootlin.com/linux/v6.15/source/drivers/gpu/drm/display/drm_hdmi_state_helper.c#L234
>> > https://elixir.bootlin.com/linux/v6.15/source/drivers/gpu/drm/display/drm_hdmi_state_helper.c#L553
>>
>> Before 6.14, sun4i_hdmi_connector_clock_valid() was also called from
>> sun4i_hdmi_connector_atomic_check()...
>>
>> > Do you have some logs (with dri.devel=0xff)? Does it happen with 6.15 as
>> > well?
>>
>> It does not happen with 6.15, as it was fixed in 6.14 with 84e541b1e58e
>> ("drm/sun4i: use drm_atomic_helper_connector_hdmi_check()").
>
>Then we might still need to backport that patch.
>
>Does applying it to 6.9 alone makes it work, or do you need some additional ones (I'm thinking of
>ae048fc4f96d in particular, which in turn would require 47368ab437fd)

No way to apply this to anything 6.9. The closest I can get it into is 
6.11, which requires both ae048fc4f96d and 47368ab437fd (with one 
trivial conflict) to make it work. Anthing earlier lacks the entire HDMI 
connector framework.

-- 
Michael
