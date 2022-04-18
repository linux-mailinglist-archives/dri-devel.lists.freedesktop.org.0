Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE245065FB
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 09:34:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67A2210E763;
	Tue, 19 Apr 2022 07:34:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11B9210ED7E
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Apr 2022 04:00:26 +0000 (UTC)
X-UUID: c534c924e3c34077a7c5b8e37404ecd4-20220418
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:40b29494-b0db-432f-bf0d-a6a91d7c82ed, OB:0,
 LO
 B:0,IP:0,URL:8,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:8
X-CID-META: VersionHash:faefae9, CLOUDID:eb2709f0-da02-41b4-b6df-58f4ccd36682,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: c534c924e3c34077a7c5b8e37404ecd4-20220418
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <allen-kh.cheng@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1359478923; Mon, 18 Apr 2022 12:00:19 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 18 Apr 2022 12:00:11 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 18 Apr 2022 12:00:11 +0800
Message-ID: <a6e827749d8b3bce059e4df7d84b524ebddcf20c.camel@mediatek.com>
Subject: Re: [PATCH v8, 00/15] media: mtk-vcodec: support for M8192 decoder
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Nicolas Dufresne <nicolas@ndufresne.ca>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, "yunfei.dong@mediatek.com"
 <yunfei.dong@mediatek.com>, Alexandre Courbot <acourbot@chromium.org>, "Hans
 Verkuil" <hverkuil-cisco@xs4all.nl>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
Date: Mon, 18 Apr 2022 12:00:11 +0800
In-Reply-To: <2031e84425f0aa8df03328057c394551c30a38f5.camel@ndufresne.ca>
References: <20220331024801.29229-1-yunfei.dong@mediatek.com>
 <fbfe4572296a133492310f13e3f41db56218fc17.camel@ndufresne.ca>
 <0f385e6e2d0687c3e6de12a576d1617af9504cee.camel@mediatek.com>
 <c5dc9f759054418082849233639f727e39329550.camel@ndufresne.ca>
 <cdcaf769ee162658e3bbb0c30bb8c4cbb168c6d6.camel@mediatek.com>
 <1d9a6259-b1f6-5c4f-7e91-0529b77b6a44@collabora.com>
 <2031e84425f0aa8df03328057c394551c30a38f5.camel@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MTK: N
X-Mailman-Approved-At: Tue, 19 Apr 2022 07:34:04 +0000
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
Cc: Irui Wang <irui.wang@mediatek.com>, George Sun <george.sun@mediatek.com>,
 Steve Cho <stevecho@chromium.org>, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz
 Koenig <frkoenig@chromium.org>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, 2022-04-13 at 14:30 -0400, Nicolas Dufresne wrote:
> Le mercredi 13 avril 2022 à 09:57 +0200, AngeloGioacchino Del Regno a
> écrit :
> > Il 13/04/22 09:03, allen-kh.cheng ha scritto:
> > > Hi Nicolas,
> > > 
> > > On Tue, 2022-04-12 at 10:48 -0400, Nicolas Dufresne wrote:
> > > > Le lundi 11 avril 2022 à 11:41 +0800, yunfei.dong@mediatek.com
> > > > a
> > > > écrit :
> > > > > Hi Nicolas,
> > > > > 
> > > > > On Thu, 2022-03-31 at 16:48 -0400, Nicolas Dufresne wrote:
> > > > > > Hi Yunfei,
> > > > > > 
> > > > > > thanks for the update, I should be testing this really
> > > > > > soon.
> > > > > > 
> > > > > > Le jeudi 31 mars 2022 à 10:47 +0800, Yunfei Dong a écrit :
> > > > > > > This series adds support for mt8192 h264/vp8/vp9 decoder
> > > > > > > drivers.
> > > > > > > Firstly, refactor
> > > > > > > power/clock/interrupt interfaces for mt8192 is lat and
> > > > > > > core
> > > > > > > architecture.
> > > > > > 
> > > > > > Similarly to MT8173 and MT8183, a shared* firmware is
> > > > > > needed for
> > > > > > this
> > > > > > CODEC to
> > > > > > work (scp.img). I looked into linux-firmware[1] it has not
> > > > > > been
> > > > > > added
> > > > > > for mt8192
> > > > > > yet. As your patches are getting close to be ready, it
> > > > > > would be
> > > > > > important to
> > > > > > look into this so the patchset does not get blocked due to
> > > > > > that.
> > > > > > 
> > > > > > best regards,
> > > > > > Nicolas
> > > > > > 
> > > > > > [1]
> > > > > > 
> > > 
> > > 
https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/mediatek__;!!CTRNKA9wMg0ARbw!zy4N6JDroSXtumXXa7MuxAgYAPAink8uyW-978vpWct8S3vOjBqXirFE8uTEHopHCovbSl0FNP9LPgWCEBrZfMIcvQ$
> > > > > >   
> > > > > > * Shared at least between MDP3 and MTK VCODEC from my
> > > > > > knowledge
> > > > > > 
> > > > > 
> > > > > Thanks for your remind.
> > > > > 
> > > > > I have already sent mt8192 scp.img to github.
> > > > > 
> > > > > 
> > > 
> > > 
https://urldefense.com/v3/__https://github.com/yunfeidongmediatek/linux_fw_scp_8192/commit/3ac2fc85bc7dfcebdb92b5b5808b0268cdfb772d__;!!CTRNKA9wMg0ARbw!zy4N6JDroSXtumXXa7MuxAgYAPAink8uyW-978vpWct8S3vOjBqXirFE8uTEHopHCovbSl0FNP9LPgWCEBpf9F_nWA$
> > > > >   
> > > > > 
> > > > > Waiting for to be merged.
> > > > 
> > > > On boards I have, the firmware is loaded from
> > > > /lib/firmware/scp.img,
> > > > but with
> > > > this submission it will be in
> > > > lib/firmware/mediatek/mt8192/scp.img .
> > > > I haven't
> > > > found anything around:
> > > > 
> > > >   drivers/remoteproc/mtk_scp.c:812:       char *fw_name =
> > > > "scp.img";
> > > > 
> > > > That would use the platform path. This seems like a problem to
> > > > me,
> > > > the
> > > > upstreaming of the firmware isn't being aligned with the were
> > > > the
> > > > firmware is
> > > > picked by the upstream driver. Correct me if I got this wrong,
> > > > but
> > > > I'd really
> > > > like to clarify this.
> > > > 
> > > > Nicolas
> > > > 
> > > 
> > > I am not sure why it's accepted the fw path of scp is
> > > /lib/firmware/scp.img in mt8173/8183 but we upload scp.ing in
> > > /lib/firmware/mediatek/mt8173(mt8183)/scp.img to
> > > 
> > > 
https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/mediatek__;!!CTRNKA9wMg0ARbw!0m0Cb9U6Xgnofw4ggJUaMzkm2gsZ6thjlvWu0pVGeeckYXcnIh7sz7C_NqNu96GAUaR1WA$
> > >  
> > > 
> > > Currently, the scp driver will load firmware in
> > > /lib/firmware/scp.img.
> > > that means there is only one firmware for a specific platform.
> > > I think we can send a PATCH to make firmware name of scp being
> > > more
> > > flexible.
> > > 
> > > Maybe get firmware name from dts. e.g.,
> > > &scp {
> > > 	status = "okay";
> > > 	firmware-name = "mediatek/mt81xx/scp.img";
> > > };
> > > 
> > > Do you think it feasible?
> > > If you have any concerns, please let us know.
> > > 
> > > Thanks,
> > > Allen
> > > 
> > 
> > Hello Allen,
> > 
> > what you proposed is exactly what has been done for other platforms
> > because of
> > both per-device firmware differences (different signatures) and
> > per-SoC (different
> > firmware entirely), found on TI K3, iMX DSP, Qualcomm MSS/DSP
> > remoteproc and
> > others.
> > 
> > Of course this is an accepted way to resolve this situation: please
> > go on!
> 
> Looks good to me! (don't forget to keep a fallback to
> /lib/firmware/scp.img to
> maintain backward compatibility).
> 

No problem. I have sent an upstream PATCH for scp firmware path.

patchwork.kernel.org/project/linux-mediatek/list/?series=632268

thanks for your comments,
Allen

> > 
> > Cheers,
> > Angelo
> > 
> 
> 

