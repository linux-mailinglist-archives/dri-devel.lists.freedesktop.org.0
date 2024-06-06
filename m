Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F3D8FF392
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 19:20:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0739010EA35;
	Thu,  6 Jun 2024 17:20:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HUujiJkO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2BCB10EA3A
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 17:20:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C581561E43;
 Thu,  6 Jun 2024 17:20:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F23DBC2BD10;
 Thu,  6 Jun 2024 17:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717694419;
 bh=HaZcjrOCRN6LrZvCxFlM99g5xcxdurTMUCw4ejQkan8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HUujiJkOokWTBojCTlf13HHjvAGkt3Er6Es3cEb8zMwUl1N4e9BRBmRHtu9ft2LP6
 3OTYRzWPdXGXZLHoCDV7xGrTBJBYA+uht4usZxSKsSyl2xObkQNkyy62oEbb/NQj3e
 a7pvCEXPU7E0bqg/d46H8WRetGGy2GLWffY3PhUcTecfI+Wa/G0QseOcKJwxoGksZP
 ZijwJ4N4robpWcOAQ9Q/hIQm2MZnpwsnzHyV1z6foLzI+slBvnuMpnJUp7G8plW7w3
 2rKCLKP13HytcY8HWjYMIAqREJx0u4BdCiK+hnyBOg7x75W6d2j+dP26EPDdhXesVV
 jUPxci/rLIkVQ==
Date: Thu, 6 Jun 2024 19:20:16 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Devarsh Thakkar <devarsht@ti.com>
Cc: Javier Martinez Canillas <javierm@redhat.com>, jyri.sarha@iki.fi, 
 tomi.valkeinen@ideasonboard.com, airlied@gmail.com,
 maarten.lankhorst@linux.intel.com, 
 tzimmermann@suse.de, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
 conor+dt@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, nm@ti.com,
 vigneshr@ti.com, 
 kristo@kernel.org, praneeth@ti.com, a-bhatia1@ti.com, j-luthra@ti.com
Subject: Re: [RFC PATCH 2/3] drm/tidss: Add support for display sharing
Message-ID: <20240606-puzzling-brainy-chital-4bf891@houat>
References: <20240116134142.2092483-3-devarsht@ti.com>
 <vgfzhamtiwkpdyk5ndagsb63subclinotoe6tsi3wu6z7454ec@igxfzjc5gyqm>
 <88018f5f-a7db-7278-e5c3-bb1dbf0e3f14@ti.com>
 <qiqrhpqtnox47wj6az7t3fjp4vc6k32fw42tp5slqggrhe6utb@i7lkpaf3v3od>
 <2f4cf2a7-ce7a-bb34-f722-7e66ea41def7@ti.com>
 <20240314-hospitable-attractive-cuttlefish-a2f504@houat>
 <03e2d653-731c-bb30-321b-b5477d7b82b2@ti.com>
 <87ikzf16dm.fsf@minerva.mail-host-address-is-not-set>
 <ZkYBWnQO8AbGAt06@phenom.ffwll.local>
 <b3b7fe51-ce9e-1dc4-27ee-e380c242d446@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="ukbfkqhfo7stgfft"
Content-Disposition: inline
In-Reply-To: <b3b7fe51-ce9e-1dc4-27ee-e380c242d446@ti.com>
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


--ukbfkqhfo7stgfft
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 29, 2024 at 08:16:46PM GMT, Devarsh Thakkar wrote:
> Hi Javier, Maxime, Daniel,
>=20
> Sorry for the delay. Please find response inline.
>=20
> On 16/05/24 18:21, Daniel Vetter wrote:
> > On Wed, May 15, 2024 at 04:45:09PM +0200, Javier Martinez Canillas wrot=
e:
> >> Devarsh Thakkar <devarsht@ti.com> writes:
>=20
> [..]
>=20
> >>
> >> If I understand you correctly, for now the only real use case is when =
the
> >> the RTOS owns / manages the complete display pipeline and Linux can on=
ly
> >> own video planes.
> >>
>=20
> Not exactly, What I mean is that this is the default configuration/exampl=
e we
> intend to provide to customer as an out-of-box demo . But flexibility is
> provided to customer to modify the display sharing configuration per their
> use-case, for e.g at RTOS side in place of device-tree, we have a sysconf=
ig
> menu [1] using which they can select the desired configuration, furthermo=
re
> they can go ahead and edit the code too, so Linux driver is expected to be
> flexible to support different configurations as supported by the HW.

Everything you stated above can be achieved with the solutions we've
been suggesting too.

> I have a limited view of all possible use-cases which customer may try out
> with different configurations

I think that's a problem in itself. In order to properly reflect and
discuss a solution, we first need to have a problem. "Flexible
solutions" in practice never really work because you always end up not
flexible enough and still have to rework the whole thing. Except it's
now harder to do since you created something complicated first.

> few examples are shared below part from the one discussed earlier :
>=20
> [Examples]:
> 1) Customer is running Linux as main OS but using RTOS to control some
> external peripherals like temperature sensor, motion sensor e.t.c. In that
> case if they want to display the sensor data too on the same monitor, then
> they can use the configuration where RTOS use single plane and Linux as t=
he
> DSS master.

How would that work in real-world? If Linux is in charge of the display,
it can shut down the output whenever it wants too, including shutting
down the clocks or power domains, which then would probably make the
firmware crash?

A much more robust solution here would be to have either the firmware in
charge of the display and delegate a few planes, or provide some way for
Linux to access those sensors while being fully in charge of the
display.

> 2) Another configuration could be where RTOS want to control one full
> end-to-end pipeline going to one connector and Linux want to control full
> end-to-end pipeline going to another connector, that can be supported too
> using this scheme (as shared in this series).

That one is easy: you make the firmware adjust the DT when it boots
Linux and thus restrict the part of the display controller it can use.

It's mostly a DT binding issue.

> 3) Also I think, this device-tree based scheme could be leveraged in
> virtualization too with static partitioning based scheme using Xen for e.=
g. we
> split the DSS resources between host (DOM0) and the guest (DOMU).

I'm not sure you can leverage virtio at the firmware level, but
otherwise, it's pretty much what we've been suggesting the whole time:
make a generic interface between the firmware and Linux, and then write
a KMS driver for that interface.

Then the firmware can delegate planes to Linux, just like the hypervisor
would to a guest VM.

> >> The opposite is supported by the DSS hardware (thanks to its feature t=
hat
> >> allows partitioning the register space and having multiple per-host IR=
Qs)=20
> >> but it's not a real use case yet. The reason why this case is added to=
 the
> >> DT binding is as you said for flexiblity and make the design future-pr=
oof.
>
> Not really, as explained above we are documenting all possible configurat=
ions
> which hardware supports as supported in software in the SDK and that's wh=
at we
> are aiming for upstream too.

Generally speaking, not all hardware configurations make sense to run
with in Linux, and there's tons of drivers were we support only a
limited set of capabilities precisely because some simply don't work
well with Linux. I'm glad you're (and your organization) is that
committed to Linux, but I don't think having that as an absolute goal is
reasonable.

Let's work on usecases, and make the most of it instead. In your
examples, 2 and 3 make total sense to be supported in Linux. I'm not
sure 1) does.

> [..]>>>> I'm probably missing something then here, but if the Linux side =
of
> >>>> things is expected to keep the current configuration and keep it act=
ive
> >>>> for it to work, what use-case would it be useful for?
> >>>>
> >>>
> >>> It's just one of the partitioning possibilities that I mentioned here=
, that
> >>> Linux is in control of DSS as a whole and the user want the other hos=
t (be it
> >>> RTOS or any other core) to control a single plane. For e.g it could b=
e Linux
> >>> (with GPU rendering) displaying the graphics and RTOS overlaying a re=
al time
> >>> clock or any other signs which need to be displayed in real-time.
> >>> But more than the use-case this is inspired by the fact that we want =
to be
> >>> flexible and support in the linux driver whatever partitioning scheme
> >>> possibilities are there which are supported in hardware and we let us=
er decide
> >>> on the partitioning scheme.
> >>>
> >>
> >> A possible use case here could be if Linux is safer than the other host
> >> owning a single plane, right? Then in that case the RTOS could fail but
> >> the display pipeline won't be teared down.
> >>
> >> That is, if your safety tell-tales would be driven by Linux and having
> >> other OS dislay the GPU-rendered QT based application on another plane.
> >>
> >> But as said, for now that's a theorethical use case since the one you
> >> mentioned is the opposite.
> >>
> >> [....]
> >>
>=20
> Yes that could be a possible use-case too, we want to provide customer
> the flexibility in their app design to select different configuration,
> as we say all these configurations as supported in the driver.
>=20
> [..]
> >>>>> If there is a more complex use-case which requires dynamic
> >>>>> assignment/arbitration of resources then I agree those require some=
 sort of
> >>>>> IPC scheme but this is not what we target with these series. This s=
eries is
> >>>>> simply to support static partitioning feature (separate register sp=
ace,
> >>>>> separate irq, firewalling support etc) of TI DSS hardware across th=
e multiple
> >>>>> hosts and there are use-cases too for which this scheme suffices.
> >>>>
> >>>> I think you're right and we have a misunderstanding. My initial
> >>>> assumption was that it was to prevent the Linux side of sides from
> >>>> screwing up the output if it was to crash.
> >>>>
> >>>> But it looks like it's not the main point of this series, so could y=
ou
> >>>> share some use-cases you're trying to address?
> >>>>
> >>>
> >>> The end use-case we have demonstrated right now with this series is a
> >>> proof-of-concept display cluster use-case where RTOS boots early on M=
CU core
> >>> (launched at bootloader stage) and initializes the display (using the=
 global
> >>> common0 register space and irq) and starts displaying safety tell-tal=
es on one
> >>> plane, and once Linux boots up on application processor,
> >>> Linux (using common1 register space and irq) controls the other plane=
 with GPU
> >>> rendering using a QT based application. And yes, we also support the =
scenario
> >>> where Linux crashes but RTOS being the DSS master and in control of D=
SS power,
> >>> clock domain and global register space is not impacted by the crash.
> >>
> >> You mention 2 scenarios but are actually the same? Or did I misunderst=
and?
> >>
>=20
> I have explained the other examples (where Linux is the master) above wit=
h tag
> [Examples].
>=20
> >> In both cases the RTOS own the display pipeline and Linux can just dis=
play
> >> using a single plane.
> >>
> >> That's why I think that agree with Maxime, that a fwkms could be a sim=
pler
> >> solution to your use case instead of adding all this complexity to the=
 DSS
> >> driver. Yes, I understand the HW supports all this flexibility but the=
re's
> >> no real use case yet (you mentioned that don't even have firmware for =
this
> >> single plane owned by the RTOS in the R5F case).
> >>
>=20
> I analyzed the fwkms driver [2] from the RPi repo (as seems like it is not
> upstream), here the firmware is the entity owning the display register sp=
ace
> completely and the fwkms driver simply acts as a translating layer which
> translates the incoming DRM/KMS ioctls into IPC messages (having unique
> message tags) sent over mailbox which the firmware receives and programs
> corresponding registers accordingly, so there is no display sharing achie=
ved
> here as there is only single display context as coming from Linux and no
> separate display context running at firmware side.

That's somewhat correct, but also a simplification: while the driver and
firmware indeed never do any kind of segmentation (iirc), the protocol
between the firmware and the kernel leaves that door opened so you could
very well do that with some work on the firmware.

And now that I think about it, I think the RPi firmware can in some
situations (like overheating) add an overlay on top of the current
output.

Also, we're not advocating for you to use the RPi driver as is: we
suggested to use a similar solution, but we can totally use a different
transport mechanism or protocol (and we probably should if we want to
make it somewhat generic).

> But yes, in general for simple display controllers having single register
> space and single IRQ, I think that a standard IPC based scheme would be
> required for sharing the display between Linux and RTOS where for e.g. RT=
OS
> would be in full control of display register space and the interrupt line.
> Linux would send messages to RTOS via IPC scheme (similar to RPi fwkms) to
> commit the framebuffer and RTOS would send a frame done message to LInux =
on
> receiving vblank irq which would eventually call drm_crtc_handle_vblank.
> Although the IPC layer would need to be standardized (virtio_kms?)

rpmsg is another candidate, but yeah, that's what in mind too (I think?).

> >> The DT binding for a fwkms driver would be trivial, in fact maybe we m=
ight
> >> even leverage simpledrm for this case and not require a new driver at =
all.
> >=20
> > I guess you can still do things like pageflipping and maybe use some of
> > the color/blending hardware? Maybe even have more than one plane
> > available? fwkms/simpledrm conceptually cannot really support pageflipp=
ing
> > even, so that's a much, much reduced feature set.
> >
>=20
> Yes exactly, fwkms, simpledrm are not related to display sharing.
>=20
> > That all aside I do think we should limit the support to just the first
> > case, where linux gets a few pieces assigned to it and is not the DSS
> > master. From what I'm understanding you could assign entire crtc with
> > planes and everything to linux, so this shouldn't really constraint
> > real-world usage?
> >=20
> > At least until there's support in firmware for this it's all way too
> > theoretical, and I agree with Maxime and Javier that there's some serio=
us
> > design questions about how this kind of static leasing should work with
> > drm sitting on top.
>=20
> To summarize, as per my understanding there are two schemes for display
> sharing possible
>=20
> 1) IPC based scheme  -> This would be useful for simple display controlle=
rs
> having single register space and single irq line to one host)
> 2) Static partitioning scheme -> This would require some support in displ=
ay
> controller (per host irq e.t.c) as explained below :
>=20
> And I think each one has it's own uniqueness and holds on it's own and bo=
th
> solutions can be pursued independently and development for one scheme sho=
uld
> not block development for another.

Agreed.

> As TI display controller supports robust partitioning of DSS processing b=
locks
> (Pipelines, overlays, interrupts etc) among multiple processors allowing
> parallel and independent control of the DSS resources in an interference =
free
> environment, the static partitioning scheme was possible to implement and=
 it
> sufficed the requirements of display sharing use-case without incurring a=
ny
> extra overhead and complexity of IPC.
>=20
> And If there is another display controller having similar feature-set as =
above
> then the bindings for the static partitioning scheme (or at-least some of
> them) could be generalized.
>=20
> 	drm,shared-mode;
> 	drm,shared-mode-crtc =3D "..";
> 	drm,shared-mode-crtc-owned =3D "..";
> 	drm,shared-mode-planes =3D "..";
>=20
> But I could not find any other display controller support above static
> partitioning feature and hence I put the bindings as specific to TI.

I think the binding would make more sense to me using child nodes to
describe the available planes, CRTCs, etc.

But that's something to discuss with the DT maintainers.

Maxime

--ukbfkqhfo7stgfft
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZmHvxwAKCRAnX84Zoj2+
dkQvAX4u2DBBUnbt8iCa9UyqmKVMSEE04hUCcRZ8uCUti9c6zW+8cWz6Yf1hiqdS
E+MIpAkBf1GnvxZ1c5HlrcKyT5mcaloNsYDAEtUEnby2UJeCLEEOSAMM5hy0yhMN
ccGS2fAAtg==
=WAIs
-----END PGP SIGNATURE-----

--ukbfkqhfo7stgfft--
