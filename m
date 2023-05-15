Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF1A702FEB
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 16:32:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 425B310E1F7;
	Mon, 15 May 2023 14:32:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DA7610E1F7
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 14:32:48 +0000 (UTC)
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown
 [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C3CEB66029DE;
 Mon, 15 May 2023 15:32:45 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1684161166;
 bh=bWZThDJSU0iT2g+zjqNeZ3/ILxoEj05Ce5sSgcKUe/o=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=U+eR1vgoJXvDzgRfU2ak0AcHjYq5CcRxGoLBcC++VJhYWXDmJ4sZ746fZ7zXTBnbw
 TBPemcV8v/KRvCQOroPb9vkpvNaWbXC0IJ0wztLD6RYdRJdGNcwuBX2QG5FBHa5cqe
 VX0TJJvEXBIqAqA5NpXh1yHIXyMQpYSREE9i7K8Ik66ybXu7ivAk/y5Rz7pse5naP+
 CUWiQQgXNZ6u0AAcyRsDSHEimkhbunfZOOvtKI1m4N3zaWGxw7vdT5DGLy+M/C5B81
 sHWNVY4Q9Y50BPgQx7y1D+/M+sByFaC5GTQxv8Dx3wnatXCeG+jSDv4vVsHp2Q/a3K
 kSL6TUU/EeGtg==
Message-ID: <54e6923c-729a-49de-8395-fbd0b8443aa8@collabora.com>
Date: Mon, 15 May 2023 16:32:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 2/2] phy: mtk-mipi-csi: add driver for CSI phy
Content-Language: en-US
To: Julien Stephan <jstephan@baylibre.com>
References: <20230515090551.1251389-1-jstephan@baylibre.com>
 <20230515090551.1251389-3-jstephan@baylibre.com>
 <cd6067b2-660a-8f2c-697d-26814a9dc131@collabora.com>
 <b2nk4jw2hpy4ndoq4cojazkn6h3tra2zjffhiswb7aqryabf7q@mkbtzhzcbivv>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <b2nk4jw2hpy4ndoq4cojazkn6h3tra2zjffhiswb7aqryabf7q@mkbtzhzcbivv>
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, chunkuang.hu@kernel.org,
 "open list:DRM DRIVERS FOR MEDIATEK" <dri-devel@lists.freedesktop.org>,
 Vinod Koul <vkoul@kernel.org>,
 "open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, krzysztof.kozlowski@linaro.org,
 linux-mediatek@lists.infradead.org, Andy Hsieh <andy.hsieh@mediatek.com>,
 Louis Kuo <louis.kuo@mediatek.com>, Phi-bang Nguyen <pnguyen@baylibre.com>,
 "moderated list:ARM/Mediatek USB3 PHY DRIVER"
 <linux-arm-kernel@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 15/05/23 16:07, Julien Stephan ha scritto:
> On Mon, May 15, 2023 at 02:22:52PM +0200, AngeloGioacchino Del Regno wrote:
>>> +#define CSIxB_OFFSET		0x1000
>>
>> What if we grab two (or three?) iospaces from devicetree?
>>
>> - base (global)
>> - csi_a
>> - csi_b
>>
>> That would make it possible to maybe eventually extend this driver to more
>> versions (older or newer) of the CSI PHY IP without putting fixes offsets
>> inside of platform data structures and such.
>>
> Hi Angelo,
> The register bank of the CSI port is divided into 2:
> * from base address to base + 0x1000 (port A)
> * from base + 0x1000 to base +0x2000 (port B)
> Some CSI port can be configured in 4D1C mode (4 data + 1 clock) using
> the whole register bank from base to base + 0x2000 or in 2D1C mode (2 data +
> 1 clock) and use either port A or port B.
> 
> For example  mt8365 has CSI0 that can be used either in 4D1C mode or in
> 2 * 2D1C and CSI1 which can use only 4D1C mode
> 
> 2D1C mode can not be tested and is not implemented in the driver so
> I guess adding csi_a and csi_b reg value may be confusing?
> 
> What do you think?

Ok so we're talking about two data lanes per CSI port... it may still be
beneficial to split the two register regions as

reg-names = "csi-a", "csi-b"; (whoops, I actually used underscores before,
                                and that was a mistake, sorry!)

....but that would be actually good only if we are expecting to get a CSI
PHY in the future with four data lanes per port.

If you do *not* expect at all such a CSI PHY, or you do *not* expect such
a PHY to ever be compatible with this driver (read as: if you expect such
a PHY to be literally completely different from this one), then it would
not change much to have the registers split in two.

Another case in which it would make sense is if we were to get a PHY that
provides more than two CSI ports: in that case, we'd avoid platform data
machinery to check the number of actual ports in the IP, as we would be
just checking how many register regions we were given from the devicetree,
meaning that if we got "csi-a", "csi-b", "csi-c", "csi-d", we have four
ports.

Besides, another thing to think about is... yes you cannot test nor implement
2D1C mode in your submission, but this doesn't mean that others won't ever be
interested in this and that other people won't be actually implementing that;
Providing them with the right initial driver structure will surely make things
easier, encouraging other people from the community to spend their precious
time on the topic.

Regards,
Angelo

