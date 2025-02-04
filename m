Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0BFA27824
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 18:19:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41D1A10E6BA;
	Tue,  4 Feb 2025 17:19:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99E1D10E6C7
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 17:19:05 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1tfMZF-0005M0-My; Tue, 04 Feb 2025 18:18:33 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e]
 helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <p.zabel@pengutronix.de>) id 1tfMZC-003VAT-0S;
 Tue, 04 Feb 2025 18:18:30 +0100
Received: from pza by lupine with local (Exim 4.96)
 (envelope-from <p.zabel@pengutronix.de>) id 1tfMZC-000B3w-05;
 Tue, 04 Feb 2025 18:18:30 +0100
Message-ID: <48261cdfab6e0bc16e5327664b06728e1894422a.camel@pengutronix.de>
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
Date: Tue, 04 Feb 2025 18:18:29 +0100
In-Reply-To: <e83ea320-23f0-41ed-934c-2f1687b55ec1@samsung.com>
References: <20250128194816.2185326-1-m.wilczynski@samsung.com>
 <CGME20250128194836eucas1p151c4fc83a17173fd1b79bfc959976301@eucas1p1.samsung.com>
 <20250128194816.2185326-10-m.wilczynski@samsung.com>
 <816db99d-7088-4c1a-af03-b9a825ac09dc@imgtec.com>
 <e83ea320-23f0-41ed-934c-2f1687b55ec1@samsung.com>
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

On Mo, 2025-02-03 at 19:15 +0100, Michal Wilczynski wrote:
>=20
> On 1/31/25 16:39, Matt Coster wrote:
> > On 28/01/2025 19:48, Michal Wilczynski wrote:
> > > Add reset controller driver for the T-HEAD TH1520 SoC that manages
> > > hardware reset lines for various subsystems. The driver currently
> > > implements support for GPU reset control, with infrastructure in plac=
e
> > > to extend support for NPU and Watchdog Timer resets in future updates=
.
> > >=20
> > > Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> > > ---
> > >  MAINTAINERS                  |   1 +
> > >  drivers/reset/Kconfig        |  10 ++
> > >  drivers/reset/Makefile       |   1 +
> > >  drivers/reset/reset-th1520.c | 178 +++++++++++++++++++++++++++++++++=
++
> > >  4 files changed, 190 insertions(+)
> > >  create mode 100644 drivers/reset/reset-th1520.c
> > >=20
[...]
> > > diff --git a/drivers/reset/reset-th1520.c b/drivers/reset/reset-th152=
0.c
> > > new file mode 100644
> > > index 000000000000..48afbc9f1cdd
> > > --- /dev/null
> > > +++ b/drivers/reset/reset-th1520.c
> > > @@ -0,0 +1,178 @@
[...]
> > > +static void th1520_rst_gpu_enable(struct regmap *reg,
> > > +				  struct mutex *gpu_seq_lock)
> > > +{
> > > +	int val;
> > > +
> > > +	mutex_lock(gpu_seq_lock);
> > > +
> > > +	/* if the GPU is not in a reset state it, put it into one */
> > > +	regmap_read(reg, TH1520_GPU_RST_CFG, &val);
> > > +	if (val)
> > > +		regmap_update_bits(reg, TH1520_GPU_RST_CFG,
> > > +				   TH1520_GPU_RST_CFG_MASK, 0x0);

BIT(2) is not documented, but cleared here.

> > > +
> > > +	/* rst gpu clkgen */
> > > +	regmap_set_bits(reg, TH1520_GPU_RST_CFG, TH1520_GPU_SW_CLKGEN_RST);
> >=20
> > Do you know what this resets? From our side, the GPU only has a single
> > reset line (which I assume to be GPU_RESET).
>=20
> This is clock generator reset, as described in the manual 5.4.2.6.1
> GPU_RST_CFG. It does reside in the same register as the GPU reset line.
>=20
> I think this is required because the MEM clock gate is somehow broken
> and marked as 'reserved' in manual, so instead as a workaround, since we
> can't reliably enable the 'mem' clock it's a good idea to reset the
> whole CLKGEN of the GPU.

If this is a workaround for broken gating of the "mem" clock, would it
be possible (and reasonable) to make this a separate reset control that
is handled by the clock driver? ...

> > > +
> > > +	/*
> > > +	 * According to the hardware manual, a delay of at least 32 clock
> > > +	 * cycles is required between de-asserting the clkgen reset and
> > > +	 * de-asserting the GPU reset. Assuming a worst-case scenario with
> > > +	 * a very high GPU clock frequency, a delay of 1 microsecond is
> > > +	 * sufficient to ensure this requirement is met across all
> > > +	 * feasible GPU clock speeds.
> > > +	 */
> > > +	udelay(1);
> >=20
> > I don't love that this procedure appears in the platform reset driver.
> > I appreciate it may not be clear from the SoC TRM, but this is the
> > standard reset procedure for all IMG Rogue GPUs. The currently
> > supported TI SoC handles this in silicon, when power up/down requests
> > are sent so we never needed to encode it in the driver before.
> >=20
> > Strictly speaking, the 32 cycle delay is required between power and
> > clocks being enabled and the reset line being deasserted. If nothing
> > here touches power or clocks (which I don't think it should), the delay
> > could potentially be lifted to the GPU driver.

... This could be expressed as a delay between clk_prepare_enable() and
reset_control_deassert() in the GPU driver then.

> Yeah you're making excellent points here, I think it would be a good   =
=20
> idea to place the delay in the GPU driver, since this is specific to the
> whole family of the GPU's not the SoC itself.
>
> > Is it expected that if a device exposes a reset in devicetree that it
> > can be cleanly reset without interaction with the device driver itself?
> > I.E. in this case, is it required that the reset driver alone can clean=
ly
> > reset the GPU?

No, the "resets" property should just describe the physical
connection(s) between reset controller and the device.

It is fine for the device driver to manually assert the reset, enable
clocks and power, delay, and then deassert the reset, if that is the
device specific reset procedure.

> I'm not sure what the community as a whole thinks about that, so maybe
> someone else can answer this, but I would code SoC specific stuff in the
> reset driver for the SoC, and the GPU specific stuff (like the delay) in
> the GPU driver code. I wasn't sure whether the delay was specific to the
> SoC or the GPU so I've put it here.

I agree.

regards
Philipp
