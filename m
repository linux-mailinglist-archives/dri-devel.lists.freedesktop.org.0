Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 351538BCB85
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 12:02:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F327112F48;
	Mon,  6 May 2024 10:02:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.3ffe.de (0001.3ffe.de [159.69.201.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 288D7112F48
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 10:02:19 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a02:810b:4340:6430:4685:ff:fe12:5967])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.3ffe.de (Postfix) with ESMTPSA id 9D9976F4;
 Mon,  6 May 2024 12:02:16 +0200 (CEST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 May 2024 12:02:16 +0200
Message-Id: <D12H4GDJJEUF.1Y91H9RMUIX20@kernel.org>
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Alexandre Mergnat" <amergnat@baylibre.com>, <chunkuang.hu@kernel.org>
Subject: Re: [PATCH v2 0/3] drm/mediatek: Add support for OF graphs
Cc: <robh@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <conor+dt@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <matthias.bgg@gmail.com>,
 <shawn.sung@mediatek.com>, <yu-chang.lee@mediatek.com>,
 <ck.hu@mediatek.com>, <jitao.shi@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <wenst@chromium.org>,
 <kernel@collabora.com>
From: "Michael Walle" <mwalle@kernel.org>
X-Mailer: aerc 0.16.0
References: <20240409120211.321153-1-angelogioacchino.delregno@collabora.com>
 <1fc23530-89ba-4e36-9e9a-a1289f56a9bc@baylibre.com>
 <608fdbde-ad06-45ec-9771-18aa9f002f2d@collabora.com>
In-Reply-To: <608fdbde-ad06-45ec-9771-18aa9f002f2d@collabora.com>
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

Hi Angelo,

On Tue Apr 30, 2024 at 1:33 PM CEST, AngeloGioacchino Del Regno wrote:
> >> This series was tested on MT8195 Cherry Tomato and on MT8395 Radxa
> >> NIO-12L with both hardcoded paths, OF graph support and partially
> >> hardcoded paths (meaning main display through OF graph and external
> >> display hardcoded, because of OVL_ADAPTOR).
> >=20
> > Is that make sense for you to add the DTS changes of these boards into =
this serie ?
> > I asked because, IMHO, that could help to understand the serie.
> >=20
>
> Yes and no... but I imagine that you're asking this because you're trying=
 to
> prepare something with a different SoC+board(s) combination :-)
>
> In that case, I'm preventively sorry because what follows here is not 100=
%
> perfectly tidy yet as I didn't mean to send the devicetree commits upstre=
am
> before this series got picked....
>
> ... but there you go - I'm sure that you won't mind and that the example =
will
> be more than good enough for you.

I've tested this series with the DSI0 output and it works. Nice! No
need for my DSI0 patch for the MT8395 anymore.

But I can't get it to work with the DisplayPort output, that is the
dp_intf1/dp_tx interface. I don' know how the pipeline have to look
like. The functional spec seems to be ambiguous on this. The text
seem to refer to the second vdosys but there is also a diagram where
you can use the first vdosys and dsc0. If you have any pointers for
me, I'm all ears :)

-michael
