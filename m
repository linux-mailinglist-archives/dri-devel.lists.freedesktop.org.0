Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D8A57BE1A
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 20:52:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF58110FA97;
	Wed, 20 Jul 2022 18:52:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE90F112623
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 18:52:31 +0000 (UTC)
Received: from notapiano (pool-98-113-53-228.nycmny.fios.verizon.net
 [98.113.53.228])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 907116601795;
 Wed, 20 Jul 2022 19:52:29 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1658343150;
 bh=va90EplYMG3DyUMu78yTVvvF39C/aIb5s4BDbKlppvI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FMS43N7XhHXUoBywTxfxyiQJENXZ/Thn7exStAh2dPf99x3n/vHJ1z6c90otMiUMn
 qulrSJ2f5pi+RPSvtwXe/MgAREjeKPe1qbqE5KQCllVy7WOEcG2mxwFCXz8SLTsp6z
 a3zRRwi5ApZK1wr8uMvmM6KU8AePS6JLBl3zRYVl3b9lyWgKWXAOiLYca/LIqzojkP
 Hq4twZq6zdw1UH5LN/Pcjtk1nvtoW/3GAF6Kk1oaBcQDyZ9h8nt4k8b5h+T3xbpWyB
 4IFH0ZQOaPqIYba6V0cCnxtOC6Tzi0/po4kqtjjNRa/IOZgI0A2zkJncCzaINfe70j
 IClrvjUS3Re3A==
Date: Wed, 20 Jul 2022 14:52:26 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 1/3] drm/panel-edp: Add panel entry for R140NWF5 RH
Message-ID: <20220720185226.tf4y2ofmuz3ifejr@notapiano>
References: <20220719203857.1488831-1-nfraprado@collabora.com>
 <20220719203857.1488831-2-nfraprado@collabora.com>
 <CAD=FV=XgWAMXGAfBw9dBoKB6Y6_AAT6ccAtLg=jy3qLa2HOxBA@mail.gmail.com>
 <194631de-2e3f-6e1f-65f6-76dbef04483e@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <194631de-2e3f-6e1f-65f6-76dbef04483e@collabora.com>
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
Cc: David Airlie <airlied@linux.ie>, Doug Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 kernel@collabora.com, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 20, 2022 at 09:49:35AM +0200, AngeloGioacchino Del Regno wrote:
> Il 20/07/22 00:40, Doug Anderson ha scritto:
> > Hi,
> > 
> > On Tue, Jul 19, 2022 at 1:39 PM Nícolas F. R. A. Prado
> > <nfraprado@collabora.com> wrote:
> > > 
> > > Add panel identification entry for the IVO R140NWF5 RH (product ID:
> > > 0x057d) panel.
> > > 
> > > Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> > > 
> > > ---
> > > The comments on the driver indicate that the T3 timing should be set on
> > > hpd_absent, while hpd_reliable would have a shorter time just while the
> > > HPD line stabilizes on low after power is supplied.
> > 
> > Right. Ideally hpd_reliable is 0 unless you've got a badly-designed panel.
> > 
> > 
> > > But can we really assume that the HPD line will be reliable at all
> > > before the DDIC is done booting up, at which point the HPD line is
> > > brought up? IOW, shouldn't we always delay T3 (by setting hpd_reliable =
> > > T3), since only then we're really sure that the DDIC is done setting up
> > > and the HPD line is reliable?
> > 
> > If the panel is hooked up properly, then the HPD pin should be pulled
> > low at the start and then should only go high after the panel is ready
> > for us to talk to it, right? So it's not like the DDIC has to boot up
> > and actively init the state. I would assume that the initial state of
> > the "HPD output" from the panel's IC would be one of the following:
> > * A floating input.
> > * A pulled down input.
> > * An output driven low.
> > 
> > In any of those cases just adding a pull down on the line would be
> > enough to ensure that the HPD line is reliable until the panel comes
> > around and actively drives the line high.
> > 
> > Remember, this is eDP and it's not something that's hot-plugged, so
> > there's no debouncing involved and in a properly designed system there
> > should be no time needed for the signal to stabilize. I would also
> > point out that on the oficial eDP docs the eDP timing diagram doesn't
> > show the initial state of "HPD" as "unknown". It shows it as low.
> > 
> > Now, that all being said, I have seen at least one panel that glitched
> > itself at bootup. After you powered it on it would blip its HPD line
> > high before it had actually finished booting. Then the HPD would go
> > low again before finally going high after the panel finished booting.
> > This is the reason for "hpd_reliable".
> > 
> > If you've got a board with a well-designed panel but the hookup
> > between the panel and the board is wrong (maybe the board is missing a
> > pulldown on the HPD line?) then you can just set the "no-hpd" property
> > for your board. That will tell the kernel to just always delay the
> > "hpd-absent" delay.
> > 

Thank you for the detailed explanation, this does clear all doubts from what me
and Angelo were discussing.

> 
> We were concerned exactly about glitchy HPD during DDIC init, as I didn't
> want to trust it because the only testing we could do was on just two units...
> 
> ...but if you're sure that I was too much paranoid about that, that's good,
> as it means I will be a bit more "relaxed" on this topic next time :-)
> 
> > > I've set the T3 delay to hpd_absent in this series, following what's
> > > instructed in the comments, but I'd like to discuss whether we shouldn't
> > > be setting T3 on hpd_reliable instead, for all panels, to be on the
> > > safer side.
> > 
> > The way it's specified right now is more flexible, though, isn't it?
> > This way if you're on a board where the HPD truly _isn't_ stable then
> > you can just set the "no-hpd" and it will automatically use the
> > "hpd_absent" delay, right?
> > 

Yes, indeed. I just wasn't sure that flexibility brought us anything, but after
your explanation above it makes much more sense now, thanks!

> 
> For Chromebooks, that's totally doable, thanks to the bootloader seeking for
> proper machine compatibles, so yes I agree with that.
> 
> > 
> > >   drivers/gpu/drm/panel/panel-edp.c | 8 ++++++++
> > >   1 file changed, 8 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
> > > index 3626469c4cc2..675d793d925e 100644
> > > --- a/drivers/gpu/drm/panel/panel-edp.c
> > > +++ b/drivers/gpu/drm/panel/panel-edp.c
> > > @@ -1854,6 +1854,12 @@ static const struct panel_delay delay_100_500_e200 = {
> > >          .enable = 200,
> > >   };
> > > 
> > > +static const struct panel_delay delay_200_500_e200 = {
> > > +       .hpd_absent = 200,
> > > +       .unprepare = 500,
> > > +       .enable = 200,
> > > +};
> > > +
> > >   #define EDP_PANEL_ENTRY(vend_chr_0, vend_chr_1, vend_chr_2, product_id, _delay, _name) \
> > >   { \
> > >          .name = _name, \
> > > @@ -1882,6 +1888,8 @@ static const struct edp_panel_entry edp_panels[] = {
> > > 
> > >          EDP_PANEL_ENTRY('C', 'M', 'N', 0x114c, &innolux_n116bca_ea1.delay, "N116BCA-EA1"),
> > > 
> > > +       EDP_PANEL_ENTRY('I', 'V', 'O', 0x057d, &delay_200_500_e200, "R140NWF5 RH"),
> > > +
> > 
> > This looks fine to me:
> > 
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > 
> > I'm happy to apply this in a day or two assuming you're OK with my
> > explanation above.
> 
> Thank you for the long mail, your explanation was truly helpful!
> (especially for me being paranoid :-P)
> 
> So, I agree to go with that one, for which:
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> Nic, green light?

Yep.

I haven't seen any issues with keeping the hpd_reliable as 0 in the machine I
have access to, and Douglas' explanation cleared up all the doubts of how this
all works, so, Douglas, please feel free to merge this as is.

In that case, since patch 3 was also merged already I'll send a v2 just for
patch 2 separately.

Thanks,
Nícolas
