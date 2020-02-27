Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5734917285D
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 20:12:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D27F26ED36;
	Thu, 27 Feb 2020 19:12:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16DEB6E07D;
 Thu, 27 Feb 2020 19:12:07 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id m16so98469wrx.11;
 Thu, 27 Feb 2020 11:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KkQe8mlSP5SADtIkQuuaOq1esIHKxDqiaQzPxc9O6SA=;
 b=W9KjGjqIN3CjehNKbl4BbdVczPfWcE5kRAmYTtHKLdz6gU9oxQp2b3h56YnO8WSHKc
 fmH9z54DyLhSljuNu6iOjUCPJM7OLVasQKJPZ2I0ANT+GyqQ/Y5UR+Pf7WF5UlQi51ON
 V/fDRfKaWXenxfEwHEAi8M0/kFlI+BbSKzk6B3DEPSiwoA2s+ozFB2mDASGDlvxU2w/y
 VX+p6fIO6x/5HwtXnuQWtfvCu2WC93w+IIa2mFyFMsfydeV88N9cuPdrYl8gq/2bcHpa
 eQ77e9vHzEaCYJvj08RwLb63XqlZSH3aT8Q1BRuSxhSn4BBUKdWL7B1XBKODON8hcl0A
 bbRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KkQe8mlSP5SADtIkQuuaOq1esIHKxDqiaQzPxc9O6SA=;
 b=F5HVWPYt9CtBRgJnjFlHIRd+c22fh6lezBJl7qrwZCIDC3tb8S5j0w+yn2fFTf6hl+
 tlw3z6K/M/7HL6b6WWEs9XBWDT4sJm7qAfbw/7mqcGoUZ1lbihptuwK8L3F61r3O0Y84
 MyC9i7MhDaC4kmJtB0z6yoMvp0PiDTF1D3T6yGtllhtKB98OjSrqz/ESnYzbGnY+5bPK
 7blJgZwRuJXWt7H5sjYrdnoSC2I/17vH2xCLB1G1Etsi85oOtQYgX/M/mfPiVYeg8Kod
 hDFxwH+tQIYD6NKSJBbhP2c752Mol/jOKK5sTQpzrPar0WB2ePIHsAKs4uo83B33ahpK
 FJLw==
X-Gm-Message-State: APjAAAVqb6m0FE+6Lwn/aWKu0j2/6z3PsedWq/CIjgMmj4P/SvAsr47i
 9JpX26clZyMxxDVmLrsHpSSMD4mqz7P4if15vGQ=
X-Google-Smtp-Source: APXvYqzpYc9tJz+jWc/GnaaUykaEkTnBmp3z5ng0KWPJ8dAcfDtstQJq1sVli5ZB4Y5xmsfzPEzqF6fdOwaYguWM1Uc=
X-Received: by 2002:adf:cc85:: with SMTP id p5mr341250wrj.196.1582830725676;
 Thu, 27 Feb 2020 11:12:05 -0800 (PST)
MIME-Version: 1.0
References: <20200109152028.28260-1-mario.kleiner.de@gmail.com>
 <20200109152028.28260-3-mario.kleiner.de@gmail.com>
 <9238371c-fc93-2a65-c3e5-df6b3d1270dd@amd.com>
 <CAEsyxygx+2p+i91bvYBLVfq-9qog-SLQ_KdHBTmSyq4Zfr09jg@mail.gmail.com>
 <6d481758-d0d9-8911-1473-4257b74a1e97@amd.com>
In-Reply-To: <6d481758-d0d9-8911-1473-4257b74a1e97@amd.com>
From: Mario Kleiner <mario.kleiner.de@gmail.com>
Date: Thu, 27 Feb 2020 20:11:53 +0100
Message-ID: <CAEsyxygQff4kcOweR_PTKSMf9wss5i+nGA=BwiUjSH+V-MXXAQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/amd/display: Allow current eDP link settings to
 override verified ones.
To: Harry Wentland <hwentlan@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Harry

Ok, back from various other emergencies and deadlines, sorry for the
late reply. I also fixed my e-mail address - it was mistyped, causing
all these delivery failures :/

On Thu, Jan 9, 2020 at 10:26 PM Harry Wentland <hwentlan@amd.com> wrote:
>
> On 2020-01-09 4:13 p.m., Mario Kleiner wrote:
> > On Thu, Jan 9, 2020 at 7:44 PM Harry Wentland <hwentlan@amd.com
> > <mailto:hwentlan@amd.com>> wrote:
> >
> >     On 2020-01-09 10:20 a.m., Mario Kleiner wrote:
> >     > If the current eDP link settings, as read from hw, provide a higher
> >     > bandwidth than the verified_link_cap ones (= reported_link_cap), then
> >     > override verified_link_cap with current settings.
> >     >
> >     > These initial current eDP link settings have been set up by
> >     > firmware during boot, so they should work on the eDP panel.
> >     > Therefore use them if the firmware thinks they are good and
> >     > they provide higher link bandwidth, e.g., to enable higher
> >     > resolutions / color depths.
> >     >
... snip ...
> >
> >
> > Tried that already (see other mail), replacing the whole if statement
> > with a if (true) to force reading DP_SUPPORTED_LINK_RATES. The whole
> > table reads back as all-zero, and versions are DP 1.1, eDP 1.3, not 1.4+
> > as what seems to be required. The use the classic link bw stuff, but
> > with a non-standard link bandwidth multiplier of 0xc, and a reported
> > DP_MAX_LINK_RATE of 0xa, contradicting the 0xc setting that the firmware
> > sets at bootup.
> >
> > Seems to be a very Apple thing...
>
> Indeed. I think it was a funky panel that was "ahead of its time" and
> ahead of the spec.
>
> I would prefer a DPCD quirk for this panel that updates the reported DP
> caps, rather than picking the "current" ones from the FW lightup.
>
> Harry
>

How would i do this? I see various options:

I could rewrite my current patch, move it down inside
dc_link_detect_helper() until after the edid was read and we have
vendor/model id available, then say if(everything that's there now &&
(vendor=Apple) && (model=Troublesomepanel)) { ... }

Or i could add quirk code to detect_edp_sink_caps() after
retrieve_link_cap() [or inside retrieve_link_cap] to override the
reported_link_cap. But at that point we don't have edid yet and
therefore no vendor/model id. Is there something inside the dpcd one
can use to uniquely identify this display model?

struct dp_device_vendor_id sink_id; queried inside retrieve_link_cap()
sounds like it could be a unique id? I don't know about that.

My intention was to actually do nothing on the AMD side here, as my
photometer measurements suggest that the panel gives better quality
results for >= 10 bpc output if it is operated at 8 bit and then the
gpu's spatial dithering convincingly fakes the extra bits. Quality
seems worse if one actually switches the panel into 10 bpc, as it
doesn't seem to be a real 10 bit panel, just a 8 bit panel that
accepts 10 bit and then badly dithers it to 10 bit.

The situation has changed for Linux 5.6-rc, because of this recent
commit from Roman Li, which is already in 5.6-rc:
4a8ca46bae8affba063aabac85a0b1401ba810a3 "drm/amd/display: Default max
bpc to 16 for eDP"

While that commit supposedly fixes some darkness on some other eDP
panel, it now breaks my eDP panel. It leaves edid reported bpc
unclamped, so the driver uses 10 bpc as basis for required bandwidth
calculations and then the required bandwidth for all modes exceeds the
link bandwidth. I end with the eDP panel having no valid modes at all
==> Panel goes black, game over.

We either need to revert that commit for drm-fixes, or quirk it for
the specific panels that are troublesome, or need to get some solution
into 5.6-rc, otherwise there will be a lot of regressions for at least
Apple MBP users.

thanks,
-mario

> > -mario
> >
> >
> >
> >     Thanks,
> >     Harry
> >
> >     > This fixes a problem found on the MacBookPro 2017 Retina panel:
> >     >
> >     > The panel reports 10 bpc color depth in its EDID, and the
> >     > firmware chooses link settings at boot which support enough
> >     > bandwidth for 10 bpc (324000 kbit/sec aka LINK_RATE_RBR2),
> >     > but the DP_MAX_LINK_RATE dpcd register only reports 2.7 Gbps
> >     > as possible, so verified_link_cap is only good for 2.7 Gbps
> >     > and 8 bpc, not providing the full color depth of the panel.
> >     >
> >     > Signed-off-by: Mario Kleiner <mario.kleiner.de@gmail.com
> >     <mailto:mario.kleiner.de@gmail.com>>
> >     > Cc: Alex Deucher <alexander.deucher@amd.com
> >     <mailto:alexander.deucher@amd.com>>
> >     > ---
> >     >  drivers/gpu/drm/amd/display/dc/core/dc_link.c | 21
> >     +++++++++++++++++++
> >     >  1 file changed, 21 insertions(+)
> >     >
> >     > diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> >     b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> >     > index 5ea4a1675259..f3acdb8fead5 100644
> >     > --- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> >     > +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> >     > @@ -819,6 +819,27 @@ static bool dc_link_detect_helper(struct
> >     dc_link *link,
> >     >               case SIGNAL_TYPE_EDP: {
> >     >                       detect_edp_sink_caps(link);
> >     >                       read_current_link_settings_on_detect(link);
> >     > +
> >     > +                     /* If cur_link_settings provides higher
> >     bandwidth than
> >     > +                      * verified_link_cap, then use
> >     cur_link_settings as new
> >     > +                      * verified_link_cap, as it obviously works
> >     according to
> >     > +                      * firmware boot setup.
> >     > +                      *
> >     > +                      * This has been observed on the Apple
> >     MacBookPro 2017
> >     > +                      * Retina panel, which boots with a link
> >     setting higher
> >     > +                      * than what dpcd[DP_MAX_LINK_RATE] claims
> >     as possible.
> >     > +                      * Overriding allows to run the panel at 10
> >     bpc / 30 bit.
> >     > +                      */
> >     > +                     if (dc_link_bandwidth_kbps(link,
> >     &link->cur_link_settings) >
> >     > +                         dc_link_bandwidth_kbps(link,
> >     &link->verified_link_cap)) {
> >     > +                             DC_LOG_DETECTION_DP_CAPS(
> >     > +                             "eDP current link setting bw %d kbps
> >     > verified_link_cap %d kbps. Override.",
> >     > +                             dc_link_bandwidth_kbps(link,
> >     &link->cur_link_settings),
> >     > +                             dc_link_bandwidth_kbps(link,
> >     &link->verified_link_cap));
> >     > +
> >     > +                             link->verified_link_cap =
> >     link->cur_link_settings;
> >     > +                     }
> >     > +
> >     >                       sink_caps.transaction_type =
> >     DDC_TRANSACTION_TYPE_I2C_OVER_AUX;
> >     >                       sink_caps.signal = SIGNAL_TYPE_EDP;
> >     >                       break;
> >     >
> >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
