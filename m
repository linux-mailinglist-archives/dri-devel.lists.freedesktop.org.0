Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7F317DA6D
	for <lists+dri-devel@lfdr.de>; Mon,  9 Mar 2020 09:14:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81BD66E359;
	Mon,  9 Mar 2020 08:13:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id BC9776E2BE
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2020 07:55:44 +0000 (UTC)
X-UUID: 7119ba7b7a6e46bcb84bdaed4b5b366d-20200309
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=d0wnLlS3PKlRwicESnqS4F2qX7BxraxwO4F/6cuzvFM=; 
 b=TvTU+oyqCuvB/dpVbfvu0kKeOdvaGuR0TXe4LK1eGwi+8IKZUxta4cn+iy/5g+zeKnkRjwu+zxKtOpDKhPOj8g83vj3cYLKgXzbFFMCAWt7WKoAAPWeeqSD4hxIZdJM8Dz8JxsMHj2HNr8FsY6UMor/pZY3sCobhsi8+7X0TdxI=;
X-UUID: 7119ba7b7a6e46bcb84bdaed4b5b366d-20200309
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
 (envelope-from <nick.fan@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1475847732; Mon, 09 Mar 2020 15:55:40 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 9 Mar 2020 15:54:27 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 9 Mar 2020 15:55:55 +0800
Message-ID: <1583740539.3995.15.camel@mtksdaap41>
Subject: Re: [PATCH v4 1/7] dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183
From: Nick Fan <nick.fan@mediatek.com>
To: Steven Price <steven.price@arm.com>
Date: Mon, 9 Mar 2020 15:55:39 +0800
In-Reply-To: <20200306144336.GA9234@arm.com>
References: <20200207052627.130118-1-drinkcat@chromium.org>
 <20200207052627.130118-2-drinkcat@chromium.org>
 <20200225171613.GA7063@bogus>
 <CANMq1KAVX4o5yC7c_88Wq_O=F+MaSN_V4uNcs1nzS3wBS6A5AA@mail.gmail.com>
 <1583462055.4947.6.camel@mtksdaap41>
 <CAL_JsqLoUnxfrJh0WCs0jgro1KHAjWaYMsaKkKfAKA2KJ252_g@mail.gmail.com>
 <20200306144336.GA9234@arm.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Mon, 09 Mar 2020 08:13:37 +0000
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
Cc: Mark Rutland <Mark.Rutland@arm.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Devicetree List <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 lkml <linux-kernel@vger.kernel.org>, Sj Huang <sj.huang@mediatek.com>,
 Mark Brown <broonie@kernel.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias
 Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2020-03-06 at 14:43 +0000, Steven Price wrote:
> On Fri, Mar 06, 2020 at 02:13:08PM +0000, Rob Herring wrote:
> > On Thu, Mar 5, 2020 at 8:34 PM Nick Fan <nick.fan@mediatek.com> wrote:
> > >
> > > Sorry for my late reply.
> > > I have checked internally.
> > > The MT8183_POWER_DOMAIN_MFG_2D is just a legacy name, not really 2D
> > > domain.
> > >
> > > If the naming too confusing, we can change this name to
> > > MT8183_POWER_DOMAIN_MFG_CORE2 for consistency.
> > 
> > Can you clarify what's in each domain? Are there actually 3 shader
> > cores (IIRC, that should be discoverable)?
> 
> The cover letter from Nicolas includes:
> 
> > [  501.321752] panfrost 13040000.gpu: shader_present=0x7 l2_present=0x1
> 
> 0x7 is three bits set, so it certainly looks like there are 3 shader
> cores. Of course I wouldn't guarantee that it is as simple as each power
> domain has a shader core in. The job manager and tiler also need to be
> powered somehow, so they are either sharing with a shader core or
> there's something more complex going on.
> 
> Steve
> 
There are actually five power domains in total for MT8183 GPU.

There are 3 shader cores in MT8183.

They can be listed as following for each power domain:
1.MT8183_POWER_DOMAIN_MFG_ASYNC : SOC bus logic
2.MT8183_POWER_DOMAIN_MFG : GPU job manager & tiler
3.MT8183_POWER_DOMAIN_MFG_CORE0 : GPU shader core 0
4.MT8183_POWER_DOMAIN_MFG_CORE1 : GPU shader core 1
5.MT8183_POWER_DOMAIN_MFG_2D : GPU shader core 2

There are other power domain dependency can be reference in the
following link.
https://lkml.org/lkml/2019/2/1/166

You can check the power domain dependencies as following
==========================================================
+static const struct scp_subdomain scp_subdomain_mt8183[] = {
+	{MT8183_POWER_DOMAIN_MFG_ASYNC, MT8183_POWER_DOMAIN_MFG},
+	{MT8183_POWER_DOMAIN_MFG, MT8183_POWER_DOMAIN_MFG_2D},
+	{MT8183_POWER_DOMAIN_MFG, MT8183_POWER_DOMAIN_MFG_CORE0},
+	{MT8183_POWER_DOMAIN_MFG, MT8183_POWER_DOMAIN_MFG_CORE1},
==========================================================

Thanks

Nick Fan

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
