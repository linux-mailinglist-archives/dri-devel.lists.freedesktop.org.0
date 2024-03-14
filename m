Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 726C387BEFF
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 15:34:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9F0D10FBAB;
	Thu, 14 Mar 2024 14:34:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bmxVw2SO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7568C10E2EC
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 14:34:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 48CA8614F0;
 Thu, 14 Mar 2024 14:34:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2718C433A6;
 Thu, 14 Mar 2024 14:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710426885;
 bh=sSnxi5WSt6gyUFM+WAw3MhPN1oYNuq2rDCYmKVgRryg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bmxVw2SOZBdLDDrdZalAIZWW+aSvCGssUzEVqoUo3RonaT9tuWOQeePyJzxYG0Tqy
 bUg4FYtxeHJa6Kc7s9Tl+Cyg2S02LLc9bDhtx/6Jy+1NOmyFal0j68XgRzu849HZ08
 tXXKykQgCMMGPA+ZRalR5AhmbfTG45l4LAaBCQfWmGNEfHYI1EvyU9irh8fFRPFHJm
 ldq5Y9iF125vZFPgakuCL/LH/QgM6OkA/xCmv5ZPd/HeELHD6EzLCHRKffqwrsR+v2
 0YXG/T/C/erjzpNWUXzhuO8o5GDNYpZk+Q3J+oNLhIQWgoe+sJCs3+4JeXHCgB206B
 0Nf09EXWoFtIA==
Date: Thu, 14 Mar 2024 15:34:42 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Devarsh Thakkar <devarsht@ti.com>
Cc: jyri.sarha@iki.fi, tomi.valkeinen@ideasonboard.com, airlied@gmail.com, 
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, nm@ti.com, vigneshr@ti.com,
 kristo@kernel.org, praneeth@ti.com, a-bhatia1@ti.com, j-luthra@ti.com
Subject: Re: [RFC PATCH 2/3] drm/tidss: Add support for display sharing
Message-ID: <20240314-hospitable-attractive-cuttlefish-a2f504@houat>
References: <20240116134142.2092483-1-devarsht@ti.com>
 <20240116134142.2092483-3-devarsht@ti.com>
 <vgfzhamtiwkpdyk5ndagsb63subclinotoe6tsi3wu6z7454ec@igxfzjc5gyqm>
 <88018f5f-a7db-7278-e5c3-bb1dbf0e3f14@ti.com>
 <qiqrhpqtnox47wj6az7t3fjp4vc6k32fw42tp5slqggrhe6utb@i7lkpaf3v3od>
 <2f4cf2a7-ce7a-bb34-f722-7e66ea41def7@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="shvmea62ktx4kkvx"
Content-Disposition: inline
In-Reply-To: <2f4cf2a7-ce7a-bb34-f722-7e66ea41def7@ti.com>
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


--shvmea62ktx4kkvx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Feb 14, 2024 at 09:17:12PM +0530, Devarsh Thakkar wrote:
> On 13/02/24 19:34, Maxime Ripard wrote:
> > On Thu, Feb 08, 2024 at 06:26:17PM +0530, Devarsh Thakkar wrote:
> >> On 26/01/24 17:45, Maxime Ripard wrote:
> >>> Hi,
> >>>
> >>> Thanks a lot for working on that.
> >>>
> >>> On Tue, Jan 16, 2024 at 07:11:41PM +0530, Devarsh Thakkar wrote:
> >>>> Display subsystem present in TI Keystone family of devices supports =
sharing
> >>>> of display between multiple hosts as it provides separate register s=
pace
> >>>> (common* region) for each host to programming display controller and=
 also a
> >>>> unique interrupt line for each host.
> >>>>
> >>>> This adds support for display sharing, by allowing partitioning of
> >>>> resources either at video port level or at video plane level as
> >>>> described below :
> >>>>
> >>>> 1) Linux can own (i.e have write access) completely one or more of v=
ideo
> >>>> ports along with corresponding resources (viz. overlay managers,
> >>>> video planes) used by Linux in context of those video ports.
> >>>> Even if Linux is owning
> >>>> these video ports it can still share this video port with a remote c=
ore
> >>>> which can own one or more video planes associated with this video po=
rt.
> >>>>
> >>>> 2) Linux owns one or more of the video planes with video port
> >>>> (along with corresponding overlay manager) associated with these pla=
nes
> >>>> being owned and controlled by a remote core. Linux still has read-on=
ly
> >>>> access to the associated video port and overlay managers so that it =
can
> >>>> parse the settings made by remote core.
> >>>
> >>> So, just to make sure we're on the same page. 1) means Linux drives t=
he
> >>> whole display engine, but can lend planes to the R5? How does that wo=
rk,
> >>> is Linux aware of the workload being there (plane size, format, etc) ?
> >>>
> >>
> >> Well, there is no dynamic procedure being followed for lending. The
> >> partitioning scheme is decided and known before hand, and the remote
> >> core firmware updated and compiled accordingly, and similarly the
> >> device-tree overlay for Linux is also updated with partitioning
> >> information before bootup.
> >>
> >> What would happen here is that Linux will know before-hand this
> >> partitioning information via device-tree properties and won't enumerate
> >> the plane owned by RTOS, but it will enumerate the rest of the display
> >> components and initialize the DSS, after which user can load the DSS
> >> firmware on remote core and this firmware will only have control of
> >> plane as it was compiled with that configuration.
> >=20
> > Right. If the RTOS is in control of a single plane, how it is expected
> > to deal with Linux shutting the CRTC down, or enforcing a configuration
> > that isn't compatible with what the RTOS expects (like a plane with a
> > higher zpos masking its plane), what is the mechanism to reconcile it?
> >=20
>=20
> Just for the note, for this "RTOS control single plane" mode, we don't ha=
ve a
> firmware available to test (right now we are only supporting example for =
"RTOS
> controlling the display mode" as shared here [1]) and hence this is not
> validated but the idea was to keep dt-bindings generic enough to support =
them
> in future and that's why I referred to it here.
>=20
> Coming back to your questions, with the current scheme the Linux (tidss) =
would
> be expected to make sure the CRTC being shared with RTOS is never shutdow=
n and
> the RTOS plane should never gets masked.

I'm probably missing something then here, but if the Linux side of
things is expected to keep the current configuration and keep it active
for it to work, what use-case would it be useful for?

> I think the IPC based scheme would have been mainly needed for the case w=
here
> you have a single entity controlling the display for e.g you have a single
> display controller register space and a single IRQ but you have multiple
> planes and say you want to divide these planes to different host processo=
rs.

And with, I assume, different OS on those host processors? Otherwise why
would we need to handle some planes at the firmware level?

> In that case you want a single entity to act as a main entity and be in
> control of DSS and rest of the processors communicate with the "main enti=
ty"
> to request display resources and plane updates and main entity also progr=
ams
> dss on their behalf.
>=20
> But unlike above, TI DSS7 is designed to support static partitioning of
> display resources among multiple hosts, where each host can program the
> display hardware independently using separate register space and having a
> separate irq and without requirement of any communication between the hos=
ts.
> Now as this feature is unique to TI DSS7 we want to support this feature =
in
> tidss driver. The DSS resource partitioning feature is described in detail
> here [2]

So, if I understand this properly, and in KMS terms, DSS7 can assign the
planes, CRTCs or encoders to a given VM or CPU, and you can segment the
hardware that way. It looks like a good way to split encoders between
VMs, but going back to the discussion about one plane being handled by
the firmware, I don't really see how it can work with something else
than splitting away the whole pipeline and having a VM claiming a CRTC
and encoder, and another VM claiming another pipeline.

Like, if they share either a CRTC or encoder, we will still go back to
the discussion about arbitration about who has the final word if the two
have conflicting requirements, or if it changes something the other
probably has to know about it.

> >>> And 2) would mean that the display engine is under the R5 control and
> >>> Linux only gets to fill the plane and let the firmware know of what it
> >>> wants?
> >>>
> >>
> >> Here too the partitioning information is pre-decided and remote core
> >> firmware and device-tree overlay for Linux updated accordingly. But in
> >> this case as remote core firmware owns the display (minus the plane
> >> owned by Linux) it is started and initialized during the bootloader
> >> phase itself where it initializes the DSS and starts rendering using t=
he
> >> plane owned by it and Linux just latches to the DSS without
> >> re-initializing it, with write access only to the plane that is owned =
by
> >> Linux. You can refer [1] for more details on this.
> >>
> >>> If so, do we even need the tidss driver in the second case? We could
> >>> just write a fwkms driver of some sorts that could be used by multiple
> >>> implementations of the same "defer to firmware" logic.
> >>>
> >>
> >> This feature of static partitioning of DSS resources is specific to DS=
S7
> >> hardware (which is controlled by tidss driver) which supports dedicated
> >> register space and interrupt line for each of the hosts [0], so that
> >> multiple hosts can drive the display controller simultaneously as  per
> >> the desired static partitioning of resources, and so I don't think a
> >> separate driver is required here and tidss seems the right place to
> >> support this, where using this device-tree approach different resource
> >> partitioning schemas can be achieved as described here [1]. This was
> >> also aligned with Tomi too where we discussed that tidss is the right
> >> place to support this as we are simply leveraging the DSS hardware
> >> capabilities of static partitioning here.
> >=20
> > If the only thing tidss does in the "owned by RTOS" is forwarding KMS
> > atomic states to the RTOS, then I'm still not sure why we need to
> > involve tidss at all.
>
> I think maybe here is the point of misunderstanding. We are not forwarding
> atomic states to RTOS here. Linux (tidss) is infact, accessing the display
> register space assigned to it (common1 assigned to Linux, commmon0 assign=
ed to
> RTOS) and also writing to DSS plane registers for the plane assigned to it
> (say VID assigned to Linux and VIDL assigned to RTOS).
>=20
> > It's not just about interrupts, it's also about how your arbitrate
> > between what Linux wants and what the RTOS wants. Like if the RTOS still
> > wants to output something but Linux wants to disable it, how do you
> > reconcile the two?
> >=20
>=20
> The scheme involves static partitioning of display resource which are ass=
igned
> compile-time to RTOS and Linux. Here the RTOS firmware is compiled with
> specific ownership/display resources as desired by user and this assignme=
nt
> stays intact.
>=20
> If there is a more complex use-case which requires dynamic
> assignment/arbitration of resources then I agree those require some sort =
of
> IPC scheme but this is not what we target with these series. This series =
is
> simply to support static partitioning feature (separate register space,
> separate irq, firewalling support etc) of TI DSS hardware across the mult=
iple
> hosts and there are use-cases too for which this scheme suffices.

I think you're right and we have a misunderstanding. My initial
assumption was that it was to prevent the Linux side of sides from
screwing up the output if it was to crash.

But it looks like it's not the main point of this series, so could you
share some use-cases you're trying to address?

Thanks!
Maxime

--shvmea62ktx4kkvx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZfMLAQAKCRDj7w1vZxhR
xeGMAP4r0lpVwmY+kZhOFJHZEcaWnCVRAr3kS47Ct2yARVzcywEAj6hfGk0qV1mH
RxL2jiwOA1Td9L/tW13xuI5ed5FeiwM=
=XWJo
-----END PGP SIGNATURE-----

--shvmea62ktx4kkvx--
