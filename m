Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABC54667A5
	for <lists+dri-devel@lfdr.de>; Thu,  2 Dec 2021 17:09:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A72D36FAEE;
	Thu,  2 Dec 2021 16:09:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BADB56FAEE
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Dec 2021 16:09:40 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1msoeQ-0000jl-Pm; Thu, 02 Dec 2021 17:09:38 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1msoeO-00057P-NW; Thu, 02 Dec 2021 17:09:36 +0100
Date: Thu, 2 Dec 2021 17:09:36 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Heiko =?iso-8859-15?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 10/12] arm64: dts: rockchip: rk3568-evb: Enable VOP2 and
 hdmi
Message-ID: <20211202160936.GX28260@pengutronix.de>
References: <20211117143347.314294-1-s.hauer@pengutronix.de>
 <CAL_JsqL7C32FB47=xfUtndtCvfOQx7f3Gq0O0FqZxRoeS1fNSQ@mail.gmail.com>
 <20211202153449.GG25697@pengutronix.de> <6427725.puVkvWICD3@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6427725.puVkvWICD3@diego>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 17:03:14 up 287 days, 19:27, 151 users,  load average: 0.62, 0.47,
 0.25
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
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
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Peter Geis <pgwipeout@gmail.com>, devicetree@vger.kernel.org,
 Sandy Huang <hjc@rock-chips.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Sascha Hauer <kernel@pengutronix.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Heiko,

On Thu, Dec 02, 2021 at 04:41:17PM +0100, Heiko Stübner wrote:
> Hi Sascha,
> 
> Am Donnerstag, 2. Dezember 2021, 16:34:49 CET schrieb Sascha Hauer:
> > On Wed, Nov 17, 2021 at 09:19:38AM -0600, Rob Herring wrote:
> > > On Wed, Nov 17, 2021 at 8:34 AM Sascha Hauer <s.hauer@pengutronix.de> wrote:
> > > >
> > > > This enabled the VOP2 display controller along with hdmi and the
> > > > required port routes which is enough to get a picture out of the
> > > > hdmi port of the board.
> > > >
> > > > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> > > > ---
> > > >  .../boot/dts/rockchip/rk3568-evb1-v10.dts     | 24 +++++++++++++++++++
> > > >  1 file changed, 24 insertions(+)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts
> > > > index 184e2aa2416af..156e001492173 100644
> > > > --- a/arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts
> > > > +++ b/arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts
> > > > @@ -106,6 +106,12 @@ &gmac1m1_rgmii_clk
> > > >         status = "okay";
> > > >  };
> > > >
> > > > +&hdmi {
> > > > +       status = "okay";
> > > > +       avdd-0v9-supply = <&vdda0v9_image>;
> > > > +       avdd-1v8-supply = <&vcca1v8_image>;
> > > > +};
> > > > +
> > > >  &i2c0 {
> > > >         status = "okay";
> > > >
> > > > @@ -390,3 +396,21 @@ &sdmmc0 {
> > > >  &uart2 {
> > > >         status = "okay";
> > > >  };
> > > > +
> > > > +&vop {
> > > > +       status = "okay";
> > > > +       assigned-clocks = <&cru DCLK_VOP0>, <&cru DCLK_VOP1>;
> > > > +       assigned-clock-parents = <&pmucru PLL_HPLL>, <&cru PLL_VPLL>;
> > > > +};
> > > > +
> > > > +&vop_mmu {
> > > > +       status = "okay";
> > > > +};
> > > > +
> > > > +&hdmi_in_vp0 {
> > > > +       status = "okay";
> > > > +};
> > > > +
> > > > +&vp0_out_hdmi {
> > > > +       status = "okay";
> > > > +};
> > > 
> > > You can accomplish the same thing already with:
> > > 
> > > &vp0_out_hdmi {
> > >   remote-endpoint = <&hdmi_in_vp0>;
> > > };
> > 
> > My idea was to describe all possible connections in the dtsi file and
> > let the board dts writer only en/disable the needed connections. When
> > the connections are specified in the dts file then writing it is more
> > difficult and error prone.
> > 
> > > 
> > > or:
> > > 
> > > &vp0_out_hdmi {
> > >   /delete-property/ remote-endpoint;
> > > };
> > 
> > With this I have to change all connections that I don't need. With
> > status = "okay" I have to change all connections that I actually do
> > need, which will be much easier to read and write.
> > 
> > I'll stick to the status = "okay" method for the next round, maybe I can
> > still convince you ;)
> > 
> > If it's the 'status' property you don't like being used when it's not a
> > device that is enabled/disabled, then every other name would be fine
> > with me as well.
> 
> hmm, we do have code in the rockchip drm-driver to find out
> if the device at the end of a graph-connection is disabled or not [0] ,
> So on previous Rockchip socs, there are already all connections
> established, and the driver weeds out the disabled ones.
> 
> So I'm wondering what is missing to use that in a vop2 context?

The vop2 has three video ports (crtcs) instead of only one. All three are
described in the device tree and each of them has a of_graph connection
to the different encoders, so something like:

vp0 <-> hdmi
vp0 <-> mipi
vp1 <-> hdmi
vp1 <-> mipi
vp2 <-> hdmi
vp2 <-> mipi

Enabling just vp0 <-> hdmi means only the first video port is can do
hdmi. Different constraints in the clock tree (hdmi reference clock is
hardwired to hpll, not enough PLLs to put all video ports on independent
ones) prevent us from just allowing all connections.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
