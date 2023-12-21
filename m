Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDAE81B99C
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 15:33:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 914A610E087;
	Thu, 21 Dec 2023 14:33:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-175.mta0.migadu.com (out-175.mta0.migadu.com
 [91.218.175.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BEE510E087
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Dec 2023 14:33:39 +0000 (UTC)
Message-ID: <29c8523b-6554-4716-91dd-b4e7c0697b33@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1703169217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ER5Li4YUkTrQ5sLdp19RWCOPTn5sa6zUgZcNZaJrI98=;
 b=tTb44zhc57HP8nj4wGnPm9XDpK6WEm1NDG0J3VJnI9oYIVy4ikdNSYtIFJDz8MIu70dstZ
 bScMCNxyEMQTs/88WUrnZpJSEtGXRZqM4S/xaGV2jjujJH+KUltz3Yr+TLFnmtg4idmoIL
 QETW309M/cEm7fq9jZ/qFcY2x8G4YHs=
Date: Thu, 21 Dec 2023 22:33:21 +0800
MIME-Version: 1.0
Subject: Re: [v5,40/44] drm/sun4i: hdmi: Convert encoder to atomic
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>,
 Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
References: <20231207-kms-hdmi-connector-state-v5-40-6538e19d634d@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20231207-kms-hdmi-connector-state-v5-40-6538e19d634d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


LGTM,


On 2023/12/7 23:50, Maxime Ripard wrote:
> The sun4i_hdmi driver still uses the non-atomic variants of the encoder
> hooks, so let's convert to their atomic equivalents.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Acked-by: Sui Jingfeng <sui.jingfeng@linux.dev>

