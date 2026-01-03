Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2484CF04FD
	for <lists+dri-devel@lfdr.de>; Sat, 03 Jan 2026 20:27:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00E8610E0E4;
	Sat,  3 Jan 2026 19:27:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="oME+GmLI";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="T1NWBlSg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C72DE10E0E4
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Jan 2026 19:27:19 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dk9Yf1440z9sv3;
 Sat,  3 Jan 2026 20:27:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1767468438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2XP6qw4a7+uuVk2H+Mf5Ib+nVhrZP+yHz8tm4VwbuXM=;
 b=oME+GmLIvYIV4xX9ApUXWFvxXXtrMqR7OJa0qexmleEQFn9kZhFFxDhsEh7Fx9GwC4mk3f
 97+VR8fXV3aEfOZxqQ0iCe8dJI3Od1jdGsiEiPEj3FVGB3OT9tmHm113A67f9PJ8xajGTQ
 lQVOQCDJ+hMdmuhi0eTV/fyUArky7L5OcBhcfdwQQPZZHF2u5/Qd0SMOpduRmEi/YOnHTf
 Cnvp929qbvbP5ySEG/a8aGcxjPU7ZyaLV54KQHsZwkFevkfqEd26qedSSPRrjuGgXgZV6q
 BmSmvxkR3mtQlVCjuGcl/u5rbilyBzzF2gPuGC7YsEGGa4QbJe7I6Tzp8TzXcg==
Authentication-Results: outgoing_mbo_mout;
 dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=T1NWBlSg;
 spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates
 2001:67c:2050:b231:465::1 as permitted sender)
 smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <e92e22a5-5cb3-442d-9a91-8d66a247ba9a@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1767468436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2XP6qw4a7+uuVk2H+Mf5Ib+nVhrZP+yHz8tm4VwbuXM=;
 b=T1NWBlSguX37B1M/jTmqq65T34vovB6Jjht0+e0NlD6hiMLfFGrjvuEOIdlLBWPbg8phtm
 okA3CYE+z4oUi8p4B/j1+ZlEAXxJlO7sThHBfzM6nwyLW0As+MoPzF12Vx23aymIUCRank
 Mb0517UUXQQ1vnMtdyYjbGsoq7M43nTMW3XRLQjPhifl/fOR+MXJ/f6N8qwhqwdsBK1Z5B
 BY7IbVip7Nsy7tluxaJh2juldnyd9sL1JKLvlv2mLROOKQyOZ6DsOmejYYm7a6acwxW1u8
 AbASBJYEa1tAO3y+ZXYXlDLs1nmgN48hFSrWbX2dptWPgZTf1Y/HySspRHY1pQ==
Date: Sat, 3 Jan 2026 20:27:06 +0100
MIME-Version: 1.0
Subject: Re: [PATCH 0/4] drm: Revert and fix enable/disable sequence
To: Linus Walleij <linusw@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jyri Sarha <jyri.sarha@iki.fi>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Aradhya Bhatia <aradhya.bhatia@linux.dev>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, Vicente Bergas
 <vicencb@gmail.com>, Marek Vasut <marek.vasut+renesas@mailbox.org>,
 stable@vger.kernel.org
References: <20251205-drm-seq-fix-v1-0-fda68fa1b3de@ideasonboard.com>
 <3b13c7a2-f7e6-49fd-b3bb-3e0a1fe9acf3@ideasonboard.com>
 <CAD++jLk8-0Rkh16T+R1dh6=e_f9U1i=AKOk1Y8dLGV4bxzRtFg@mail.gmail.com>
 <817b2358-0920-4b7a-abb1-133103d0f9fe@ideasonboard.com>
 <CAD++jLm_0xweD4tRJ8ZfwmcOe2BBGCsUuL1UWUiNM+Gpbq3Zuw@mail.gmail.com>
 <6be8aaf6-b01d-4444-9850-967f8e316896@ideasonboard.com>
 <CAD++jLkWH8xxT+bTXseuJv+pXeEGy7qqE7Z1Mid2CwRg8O5D7A@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAD++jLkWH8xxT+bTXseuJv+pXeEGy7qqE7Z1Mid2CwRg8O5D7A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 77nc8ht34szpzk9sqmo8ndpt41mmhnkh
X-MBO-RS-ID: 65adf9a1f053822655f
X-Rspamd-Queue-Id: 4dk9Yf1440z9sv3
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

On 1/3/26 8:12 PM, Linus Walleij wrote:
> On Tue, Dec 23, 2025 at 12:48 PM Tomi Valkeinen
> <tomi.valkeinen@ideasonboard.com> wrote:
>> On 23/12/2025 01:18, Linus Walleij wrote:
>>> On Sun, Dec 14, 2025 at 1:42 PM Tomi Valkeinen
>>> <tomi.valkeinen@ideasonboard.com> wrote:
>>>
>>>>>> Should we merge this series as a fix for 6.18 rcs?
>>>>>
>>>>> Too late now, so let's merge it as a fix for v6.19 rcs!
>>>>
>>>> Ah, right. Indeed, I meant v6.19 rcs.
>>>
>>> Are you applying it or should I?
>>> Not sure if you want some special timing, like outside of
>>> holidays.
>>
>> Oh. No, I'm not a DRM maintainer, so I was waiting for someone to merge
>> this. From my point of view it's ready for merging.
> 
> Aha OK, I applied and pushed it now. I added the same Fixes: tag as on
> patch 1/4 to all 4 patches in the process.
Thank you !
