Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7348FA30AEE
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 13:00:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3E5410E2E8;
	Tue, 11 Feb 2025 12:00:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E47B310E2E8
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 12:00:14 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1thovX-0000Xi-9K; Tue, 11 Feb 2025 12:59:43 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e]
 helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <p.zabel@pengutronix.de>) id 1thovT-000PPU-3A;
 Tue, 11 Feb 2025 12:59:39 +0100
Received: from pza by lupine with local (Exim 4.96)
 (envelope-from <p.zabel@pengutronix.de>) id 1thovT-0005DW-2n;
 Tue, 11 Feb 2025 12:59:39 +0100
Message-ID: <945fb7e913a9c3dcb40697328b7e9842b75fea5c.camel@pengutronix.de>
Subject: Re: [PATCH v4 09/18] reset: thead: Add TH1520 reset controller driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Michal Wilczynski <m.wilczynski@samsung.com>, Matt Coster
 <Matt.Coster@imgtec.com>, "mturquette@baylibre.com"
 <mturquette@baylibre.com>,  "sboyd@kernel.org" <sboyd@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
 "drew@pdp7.com" <drew@pdp7.com>, "guoren@kernel.org" <guoren@kernel.org>,
 "wefu@redhat.com" <wefu@redhat.com>, "jassisinghbrar@gmail.com"
 <jassisinghbrar@gmail.com>,  "paul.walmsley@sifive.com"
 <paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, 
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, Frank Binns
 <Frank.Binns@imgtec.com>,  "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>,  "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>,  "simona@ffwll.ch"
 <simona@ffwll.ch>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, 
 "jszhang@kernel.org" <jszhang@kernel.org>, "m.szyprowski@samsung.com"
 <m.szyprowski@samsung.com>
Cc: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
 "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-pm@vger.kernel.org"
 <linux-pm@vger.kernel.org>
Date: Tue, 11 Feb 2025 12:59:39 +0100
In-Reply-To: <7d8a3f8d-f369-47dd-8c5f-dcff8d692ea8@samsung.com>
References: <20250128194816.2185326-1-m.wilczynski@samsung.com>
 <CGME20250128194836eucas1p151c4fc83a17173fd1b79bfc959976301@eucas1p1.samsung.com>
 <20250128194816.2185326-10-m.wilczynski@samsung.com>
 <816db99d-7088-4c1a-af03-b9a825ac09dc@imgtec.com>
 <e83ea320-23f0-41ed-934c-2f1687b55ec1@samsung.com>
 <48261cdfab6e0bc16e5327664b06728e1894422a.camel@pengutronix.de>
 <7d8a3f8d-f369-47dd-8c5f-dcff8d692ea8@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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

On Mo, 2025-02-10 at 19:17 +0100, Michal Wilczynski wrote:
> On 2/4/25 18:18, Philipp Zabel wrote:
> > On Mo, 2025-02-03 at 19:15 +0100, Michal Wilczynski wrote:
[...]
> > > I think this is required because the MEM clock gate is somehow broken
> > > and marked as 'reserved' in manual, so instead as a workaround, since=
 we
> > > can't reliably enable the 'mem' clock it's a good idea to reset the
> > > whole CLKGEN of the GPU.
> >=20
> > If this is a workaround for broken gating of the "mem" clock, would it
> > be possible (and reasonable) to make this a separate reset control that
> > is handled by the clock driver? ...
>=20
> Thank you for the detailed feedback, Philipp.
>=20
> After further consideration, I believe keeping the current reset driver
> implementation would be preferable to moving the CLKGEN reset handling
> to the clock driver. While it's technically possible to implement this
> in the clock driver, I have concerns about the added complexity:
>=20
> 1. We'd need to expose the CLKGEN reset separately in the reset driver

I'd expect this to simplify the reset driver.

> 2. The clock driver's dt-bindings would need modification to add an
>    optional resets property

If it describes the hardware correctly, that should be fine.

> 3. We'd need custom clk_ops for all three clock gates (including a dummy
>    'mem' gate)
> 4. Each clock gate's .enable operation would need to handle CLKGEN reset
>    deassertion

I accept these arguments, as I have no good feeling for how much
complexity this would actually add.

In my mind it shouldn't be much: the GPU clocks could all share the
same refcounted implementation. The first clock to get enabled would
ungate both GPU_CORE and GPU_CFG_ACLK gates and deassert
GPU_SW_CLKGEN_RST, all in one place. The remaining enable(s) would be
no-ops. Would that work?

Whether a separate "dummy" MEM clock for the DT bindings is added or
not would not make a difference.

> While the clock framework could theoretically handle this, there's no
> clean way to express the requirement that the CLKGEN reset should only
> be deasserted after all clocks in the group are enabled. We could
> implement this explicitly, but it would make the code more complex and
> harder to understand.

Doing this in the clock driver would have the advantage of clk_enabled
GPU clocks actually staying physically enabled, without the reset
driver disabling them via GPU_SW_CLKGEN_RST from the outside.

> The current solution in the reset driver is simpler and clearer - it
> treats this as what it really is: a TH1520-specific reset sequence.

Yes. What this also is: a workaround for a SoC specific defect in the
clock tree. I think it belongs in the clock driver because of this.


[...]
> Regarding the delay between clock enable and reset deassert - for SoCs
> like BPI-F3 with a single reset line, implementing this in the GPU
> consumer driver makes perfect sense. However, for the T-HEAD SoC, moving
> the delay there would actually complicate things since we need to manage
> both the CLKGEN and GPU reset lines in a specific sequence. Having this
> handled entirely within the reset driver keeps the implementation
> cleaner.

You could delay in both places, it's just a microsecond after all.
Whether the workaround is implemented in the reset driver or in the
clock driver,=C2=A0I wouldn't want the GPU driver to have to carry a specia=
l
case for TH1520.

> Does this reasoning align with your thoughts? I'm happy to explore the
> clock driver approach further if you still see significant advantages to
> that solution.

I won't object to carry this in the reset driver if the clock
implementation turns out to be unreasonably complex, but I currently
don't expect that to be the case. Please give it a shot.

regards
Philipp
