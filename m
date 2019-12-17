Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB728122200
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 03:36:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A59DD6E92E;
	Tue, 17 Dec 2019 02:36:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8FF7D6E92E
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 02:36:11 +0000 (UTC)
X-UUID: e13cdd72e4de492892361dde16a04669-20191217
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=QUrWbAhGkXEzK49AtRA3Hajj8h7XjHkta9yKbDxW5+M=; 
 b=owkCJ402T21tIn4nypVdUaUe9lYIX4U1Zgebi2n9YHLfUyLHS1RWxx1YRByXry4mqXVrNj2/KDi/NKO+fkMeJnaHO2AfC68JIxtTfnXAEgxr5uV3Wg5wQyx9mqKoaa0nzo7ICK0FkROKHUhwfBZsyqbW15YjGQhYeJ7GdD/6F5Y=;
X-UUID: e13cdd72e4de492892361dde16a04669-20191217
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 2142914757; Tue, 17 Dec 2019 10:36:06 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 17 Dec 2019 10:35:49 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 17 Dec 2019 10:36:07 +0800
Message-ID: <1576550165.20788.1.camel@mtksdaap41>
Subject: Re: [PATCH] drm/mediatek: reduce the hbp and hfp for phy timing
From: CK Hu <ck.hu@mediatek.com>
To: Enric Balletbo Serra <eballetbo@gmail.com>, Hsin-Yi Wang
 <hsinyi@chromium.org>, Jitao Shi <jitao.shi@mediatek.com>
Date: Tue, 17 Dec 2019 10:36:05 +0800
In-Reply-To: <CAFqH_5209EaEzoPBHGM=GiS+v7znZR-XzvQ5L_ThQhhuGc1bXg@mail.gmail.com>
References: <20191213095215.17068-1-jitao.shi@mediatek.com>
 <CAJMQK-iZq0SRR7Q1cyh033xDXwD+MY-utO05+KqFR=ZRuaVUDg@mail.gmail.com>
 <CAFqH_5209EaEzoPBHGM=GiS+v7znZR-XzvQ5L_ThQhhuGc1bXg@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
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
Cc: srv_heupstream <srv_heupstream@mediatek.com>,
 David Airlie <airlied@linux.ie>, stonea168@163.com,
 cawa cheng <cawa.cheng@mediatek.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, sj.huang@mediatek.com,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>, Eddie Huang
 =?UTF-8?Q?=28=E9=BB=83=E6=99=BA=E5=82=91=29?= <eddie.huang@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, 2019-12-16 at 11:30 +0100, Enric Balletbo Serra wrote:
> Hi all,
> 
> Missatge de Hsin-Yi Wang <hsinyi@chromium.org> del dia dl., 16 de des.
> 2019 a les 3:42:
> >
> > On Fri, Dec 13, 2019 at 9:52 AM Jitao Shi <jitao.shi@mediatek.com> wrote:
> > >
> > > There are some extra data transfer in dsi.
> > > ex. LPX, hs_prepare, hs_zero, hs_exit and the sof/eof of dsi packet.
> > > This signal will enlarge the line time. So the real frame on dsi bus
> > > will be lower than calc by video timing.
> > >
> > > So dsi driver reduces the hbp and hfp to keep the line time.
> > >
> 
> This patch not only reduces the hbp and hfp for phy timing, it also
> fixes an actual issue for MT8173 boards (i.e. Acer Chromebook R 13)
> which is that the display is not working anymore (black screen) after
> 7a5bc4e22ecfd74dc3662342beaa909770a3b786 "drm/mediatek: change the dsi
> phytiming calculate method". So the patch is probably missing a:
> 
> Fixes: 7a5bc4e22ecf ("drm/mediatek: change the dsi phytiming calculate method")
> 
> And would be nice to have this patch applied for 5.5
> 
> > > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > Tested-by: Hsin-Yi Wang <hsinyi@chromium.org>
> 
> If it helps, you can also add my
> 
> Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> 
> Thanks,
>  Enric

Applied to mediatek-drm-fixes-5.5 [1], thank you all.

[1]
https://github.com/ckhu-mediatek/linux.git-tags/commits/mediatek-drm-fixes-5.5

Regards,
CK

> 
> > > ---
> >
> > Tested on mt8183 and mt8173
> >
> > _______________________________________________
> > Linux-mediatek mailing list
> > Linux-mediatek@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
