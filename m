Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C07B8BCEC5
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 15:17:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1797410ECC5;
	Mon,  6 May 2024 13:17:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.3ffe.de (0001.3ffe.de [159.69.201.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F4B510ECC5
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 13:17:39 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a02:810b:4340:6430:4685:ff:fe12:5967])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.3ffe.de (Postfix) with ESMTPSA id 267831A7;
 Mon,  6 May 2024 15:17:37 +0200 (CEST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 May 2024 15:17:36 +0200
Message-Id: <D12LA0QKEFRQ.68TZEVQZ7FJB@kernel.org>
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
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Alexandre Mergnat" <amergnat@baylibre.com>, <chunkuang.hu@kernel.org>
X-Mailer: aerc 0.16.0
References: <20240409120211.321153-1-angelogioacchino.delregno@collabora.com>
 <1fc23530-89ba-4e36-9e9a-a1289f56a9bc@baylibre.com>
 <608fdbde-ad06-45ec-9771-18aa9f002f2d@collabora.com>
 <D12H4GDJJEUF.1Y91H9RMUIX20@kernel.org>
 <50be68dc-b86a-4334-9f83-43c6fda2c271@collabora.com>
 <1b8fa907-b48f-4ebe-bc17-3de1d7c0d062@collabora.com>
In-Reply-To: <1b8fa907-b48f-4ebe-bc17-3de1d7c0d062@collabora.com>
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

On Mon May 6, 2024 at 1:22 PM CEST, AngeloGioacchino Del Regno wrote:
> > The problem with this is that you need DDP_COMPONENT_DRM_OVL_ADAPTOR...=
 which is
> > a software thing and not HW, so that can't be described in devicetree.
> >=20
> > The only thing this series won't deal with is exactly that.
>
> Sorry, no, I got confused.
>
> The series *does* already deal with that, as the pipeline is built before=
 the check
> for OVL_ADAPTOR components, so that will get probed.

Are you sure? Because who is actually adding the OVL_ADAPTOR to the
path? It looks like your patch will walk the graph and add all the
components according to their compatible string. And since the
OVL_ADAPTOR is virtual and doesn't have a node..

-michael
