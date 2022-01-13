Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCA248D5AA
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 11:27:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD7C110F96B;
	Thu, 13 Jan 2022 10:26:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 664 seconds by postgrey-1.36 at gabe;
 Thu, 13 Jan 2022 10:26:57 UTC
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49CA210F96B
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 10:26:57 +0000 (UTC)
X-KPN-MessageId: b2220258-7459-11ec-9a2e-005056abbe64
Received: from smtp.kpnmail.nl (unknown [10.31.155.37])
 by ewsoutbound.so.kpn.org (Halon) with ESMTPS
 id b2220258-7459-11ec-9a2e-005056abbe64;
 Thu, 13 Jan 2022 11:15:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=xs4all01;
 h=content-type:from:to:subject:mime-version:date:message-id;
 bh=gDVXsjFxRvpjVOimhsqczbSYEgs92OjIY8q3HQ0xZLo=;
 b=HBr/18+Ajg3wdobbfWiqxNHvlD5i0q1fqXDA/Hd6sXbGh1VIvyCHpK08n/9w1Gb+CSo6G3/2+QYgh
 6D7DjgaCmpgmWNmn42nFiXcnqeWwFneTX2hFv5YkafeaAN8dL5/bS7kJYqwLF8oFL5LOH/DYFC2Xaw
 z5khnE9cYoIjJOWI43E5RtaLFz99+hrR107PUMVKQcoBO0na3FMPXEDUkQMcWIBcGs658HYp913aLt
 m6IiJ6/e/+N1z5xEO4Xds2vDDKkwI7t77pHPUpFWQ7yyyhuh9s9mbSvIdLJyIvhMqWnqKIHrw38aaX
 rjz44ENw3ycdGfIor0BEqqupi6EIUCw==
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|E3dVle7ORv8LVtMgyR7kL3/O5bzeh7Y0MMGEunRsfjRJEHWcSAEdfVoLox9zTgP
 iTmLz1DX0F5kFZJzXWyZNow==
X-Originating-IP: 193.91.129.219
Received: from [192.168.2.10] (cdb815bc1.dhcp.as2116.net [193.91.129.219])
 by smtp.xs4all.nl (Halon) with ESMTPSA
 id c77cf44a-7459-11ec-83ab-005056ab1411;
 Thu, 13 Jan 2022 11:15:50 +0100 (CET)
Message-ID: <fa9b2b73-c6bb-5737-93ac-ba2ab6b3b771@xs4all.nl>
Date: Thu, 13 Jan 2022 11:15:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.1
Subject: Re: [PATCH v9 12/15] media: mtk-vcodec: enc: Remove
 mtk_vcodec_release_enc_pm
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yong Wu <yong.wu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 David Airlie <airlied@linux.ie>, Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20211112105509.12010-1-yong.wu@mediatek.com>
 <20211112105509.12010-13-yong.wu@mediatek.com>
 <68c3a573-8453-38e9-93b2-2067bedcd06f@collabora.com>
 <4bd9e849-96dd-6f1c-2841-979459366ee5@collabora.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <4bd9e849-96dd-6f1c-2841-979459366ee5@collabora.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 devicetree@vger.kernel.org, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 anthony.huang@mediatek.com, youlin.pei@mediatek.com,
 Irui Wang <irui.wang@mediatek.com>, Evan Green <evgreen@chromium.org>,
 Eizan Miyamoto <eizan@chromium.org>, Matthias Kaehlcke <mka@chromium.org>,
 mingyuan.ma@mediatek.com, linux-media@vger.kernel.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, libo.kang@mediatek.com,
 yi.kuo@mediatek.com, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, anan.sun@mediatek.com,
 acourbot@chromium.org, srv_heupstream@mediatek.com, yf.wang@mediatek.com,
 Tomasz Figa <tfiga@chromium.org>, iommu@lists.linux-foundation.org,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/01/2022 11:11, AngeloGioacchino Del Regno wrote:
> Il 11/01/22 11:57, AngeloGioacchino Del Regno ha scritto:
>> Il 12/11/21 11:55, Yong Wu ha scritto:
>>> After this patchset, mtk_vcodec_release_enc_pm has only one line.
>>> then remove that function, use pm_runtime_disable instead.
>>>
>>> meanwhile, mtk_vcodec_init_enc_pm only operate for the clocks,
>>> rename it from the _pm to _clk.
>>>
>>> No functional change.
>>>
>>> CC: Tiffany Lin <tiffany.lin@mediatek.com>
>>> CC: Irui Wang <irui.wang@mediatek.com>
>>> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
>>
>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>
> 
> Hello Yong,
> the mtk-vcodec patches were merged in Yunfei's vcodec patch series and Hans has
> scheduled that for v5.18.
> 
> Can you please send a v10 and drop patches 10/15, 11/15, 12/15 (all of the
> media: mtk-vcodec: *) from this series?
> 
> For the records, I think that after sending v10 this series is ready to be merged,
> as it was well reviewed and also tested on many MTK platforms.

Good to know. When I have the v10 I'll try to prioritize reviewing it and running
my usual tests.

Yong, please make sure you run 'checkpatch.pl --strict' over the v10 patches and fix
any issues (using common sense).

Regards,

	Hans

> 
> Thank you,
> - Angelo

