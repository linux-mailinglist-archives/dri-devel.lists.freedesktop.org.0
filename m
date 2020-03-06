Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0747717C08D
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 15:43:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB1216E46F;
	Fri,  6 Mar 2020 14:43:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0BAAE6E46F
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 14:43:43 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5F34831B;
 Fri,  6 Mar 2020 06:43:43 -0800 (PST)
Received: from arm.com (e112269-lin.cambridge.arm.com [10.1.195.32])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 132703F534;
 Fri,  6 Mar 2020 06:43:40 -0800 (PST)
Date: Fri, 6 Mar 2020 14:43:36 +0000
From: Steven Price <steven.price@arm.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/7] dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183
Message-ID: <20200306144336.GA9234@arm.com>
References: <20200207052627.130118-1-drinkcat@chromium.org>
 <20200207052627.130118-2-drinkcat@chromium.org>
 <20200225171613.GA7063@bogus>
 <CANMq1KAVX4o5yC7c_88Wq_O=F+MaSN_V4uNcs1nzS3wBS6A5AA@mail.gmail.com>
 <1583462055.4947.6.camel@mtksdaap41>
 <CAL_JsqLoUnxfrJh0WCs0jgro1KHAjWaYMsaKkKfAKA2KJ252_g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_JsqLoUnxfrJh0WCs0jgro1KHAjWaYMsaKkKfAKA2KJ252_g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <Mark.Rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Nicolas Boichat <drinkcat@chromium.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 lkml <linux-kernel@vger.kernel.org>, Sj Huang <sj.huang@mediatek.com>,
 Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Nick Fan <nick.fan@mediatek.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 06, 2020 at 02:13:08PM +0000, Rob Herring wrote:
> On Thu, Mar 5, 2020 at 8:34 PM Nick Fan <nick.fan@mediatek.com> wrote:
> >
> > Sorry for my late reply.
> > I have checked internally.
> > The MT8183_POWER_DOMAIN_MFG_2D is just a legacy name, not really 2D
> > domain.
> >
> > If the naming too confusing, we can change this name to
> > MT8183_POWER_DOMAIN_MFG_CORE2 for consistency.
> 
> Can you clarify what's in each domain? Are there actually 3 shader
> cores (IIRC, that should be discoverable)?

The cover letter from Nicolas includes:

> [  501.321752] panfrost 13040000.gpu: shader_present=0x7 l2_present=0x1

0x7 is three bits set, so it certainly looks like there are 3 shader
cores. Of course I wouldn't guarantee that it is as simple as each power
domain has a shader core in. The job manager and tiler also need to be
powered somehow, so they are either sharing with a shader core or
there's something more complex going on.

Steve

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
