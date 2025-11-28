Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DC2C91D0A
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 12:41:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78CF610E8E6;
	Fri, 28 Nov 2025 11:40:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qRg0E43D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC8DC10E8F4
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 11:40:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BE093440C9
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 11:40:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99343C4AF09
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 11:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764330056;
 bh=lgaSylTHzWsegHuSLFuVnn1Owfu0+yOkmtBh3Ohn2xw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=qRg0E43DVu82UynxLI+mhYhJxvc+AgQWBVl4ySnotFktsqtXDgpYRpPd6lSsXXHH4
 eADX1F9SghBf7d1Fm9FG08fx0KzaFHE/dPwpHBSqtWh15IrMSJayRluNlNBsKHEu8i
 e49OcLsWNYpp0AAO8TX0a6J1zhUPeyaFkDU5YxFV32kqzapRDlj4bDtUxptZAwNpYQ
 vHrqiERQDFXlBsD4rmy+epRii+DkqEOPOEioP2fwyH3g2b7+osx+G/M39nGVtTLS2s
 vIvCiNuh6ER8ES0MfbaXUkSCxMCe/brSXTa2gR3UMV5oR0zNBjgvGXuDDrUaPwuZx2
 d4hIggfVJ5YuA==
Received: by mail-oa1-f50.google.com with SMTP id
 586e51a60fabf-30cce892b7dso687752fac.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 03:40:56 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVf64pOed/sanEQm4aA0J5zS46GdnGuNT98dQgMfD/aK22Zkb/L/MstxjTdUQR3xtXEFkalvzclEO4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwpGnorWs6rS49gQmS5cKKH1jHLgr8TLvDYqfZqQgtvwoBm9HEi
 Fvd5mk5vv03wdmcPBFG18I47MnxU2MwQT7L64z5vzX5D6ED0pyZuvU2CBbdCKShkCO5/JMlOZrx
 9HV0dQrBzAPf1WtHMH+2Mg6nE0UeILwQ=
X-Google-Smtp-Source: AGHT+IF06B5RxAzGib+l3uhOnb5//EaVjJVSxxrEW3ayzCjty5qSP3tnWb9oPdMhw3rwDXVDdk2h08Pvu7TJcaT/4Zo=
X-Received: by 2002:a05:6808:3c48:b0:450:bbed:7a75 with SMTP id
 5614622812f47-451159cca74mr9317697b6e.28.1764330055398; Fri, 28 Nov 2025
 03:40:55 -0800 (PST)
MIME-Version: 1.0
References: <20251120-thermal-device-v1-0-bbdad594d57a@gmx.de>
 <CAJZ5v0jOPrBcozzJMsB1eE12MuZRWDAV-+=jfrhJbi=S0p5J9Q@mail.gmail.com>
 <5f3ef610-4024-4ca0-a934-2649f5d25f40@gmx.de>
 <CAJZ5v0iJVV=kf-aJBx8F8dtGfaZpGVyhfi6DBWEg4j3c_nH8_A@mail.gmail.com>
 <e360b9b3-ada4-4cd1-8971-097484cf3f5f@gmx.de>
 <CAJZ5v0ij_Frdrya3=FaekbU2DFHUyBJnBq-oe9jRsB9eqXDisA@mail.gmail.com>
 <ed619280-6f25-4df6-98ca-890bdc343435@gmx.de>
In-Reply-To: <ed619280-6f25-4df6-98ca-890bdc343435@gmx.de>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 28 Nov 2025 12:40:44 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0hMPCRU_p_krX3nKzB=5TX7hGU38iyNmhSJSHO2j7K3eA@mail.gmail.com>
X-Gm-Features: AWmQ_blsO-bjiwsq3G0QvTFpoBZAchhq9V5-3UdaeSTn0cJ4NHEETJ5wOmDSVTA
Message-ID: <CAJZ5v0hMPCRU_p_krX3nKzB=5TX7hGU38iyNmhSJSHO2j7K3eA@mail.gmail.com>
Subject: Re: [PATCH RFC RESEND 0/8] thermal: core: Allow setting the parent
 device of thermal zone/cooling devices
To: Armin Wolf <W_Armin@gmx.de>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
 Len Brown <lenb@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Ido Schimmel <idosch@nvidia.com>,
 Petr Machata <petrm@nvidia.com>, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-tegra@vger.kernel.org, linux-acpi@vger.kernel.org, 
 linux-doc@vger.kernel.org, netdev@vger.kernel.org, 
 linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, 
 ath11k@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, platform-driver-x86@vger.kernel.org, 
 linux-pci@vger.kernel.org, imx@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Nov 28, 2025 at 12:50=E2=80=AFAM Armin Wolf <W_Armin@gmx.de> wrote:
>
> Am 27.11.25 um 22:46 schrieb Rafael J. Wysocki:
>
> > On Thu, Nov 27, 2025 at 9:06=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wro=
te:
> >> Am 27.11.25 um 18:41 schrieb Rafael J. Wysocki:
> >>
> >>> On Sat, Nov 22, 2025 at 3:18=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> w=
rote:
> >>>> Am 21.11.25 um 21:35 schrieb Rafael J. Wysocki:
> >>>>
> >>>>> On Thu, Nov 20, 2025 at 4:41=E2=80=AFAM Armin Wolf <W_Armin@gmx.de>=
 wrote:
> >>>>>> Drivers registering thermal zone/cooling devices are currently una=
ble
> >>>>>> to tell the thermal core what parent device the new thermal zone/
> >>>>>> cooling device should have, potentially causing issues with suspen=
d
> >>>>>> ordering
> >>>>> This is one potential class of problems that may arise, but I would
> >>>>> like to see a real example of this.
> >>>>>
> >>>>> As it stands today, thermal_class has no PM callbacks, so there are=
 no
> >>>>> callback execution ordering issues with devices in that class and w=
hat
> >>>>> other suspend/resume ordering issues are there?
> >>>> Correct, that is why i said "potentially".
> >>>>
> >>>>> Also, the suspend and resume of thermal zones is handled via PM
> >>>>> notifiers.  Is there a problem with this?
> >>>> The problem with PM notifiers is that thermal zones stop working eve=
n before
> >>>> user space is frozen. Freezing user space might take a lot of time, =
so having
> >>>> no thermal management during this period is less than ideal.
> >>> This can be addressed by doing thermal zone suspend after freezing
> >>> tasks and before starting to suspend devices.  Accordingly, thermal
> >>> zones could be resumed after resuming devices and before thawing
> >>> tasks.  That should not be an overly complex change to make.
> >> AFAIK this is only possible by using dev_pm_ops,
> > Of course it is not the case.
> >
> > For example, thermal_pm_notify_prepare() could be called directly from
> > dpm_prepare() and thermal_pm_notify_complete() could be called
> > directly from dpm_complete() (which would require switching over
> > thermal to a non-freezable workqueue).
> >
> >> the PM notifier is triggered before tasks are frozen during suspend an=
d after they are thawed during resume.
> > I know that.
> >
> >> Using dev_pm_ops would also ensure that thermal zone devices are resum=
ed after their
> >> parent devices, so no additional changes inside the pm core would be n=
eeded.
> > Not really.  thermal_pm_suspended needs to be set and cleared from some=
where.
>
> thermal_pm_suspended is only used for initializing the state of thermal z=
one devices registered
> during a suspend transition. This is currently needed because user space =
tasks are still operational
> when the PM notifier callback is called, so we have to be prepared for ne=
w thermal zone devices
> being registered in the middle of a suspend transition.
>
> When using dev_pm_ops, new thermal zone devices cannot appear in the midd=
le of a suspend transition,
> as this would violate the restraints of the device core regarding device =
registrations. Because of
> this thermal_pm_suspended can be removed once we use dev_pm_ops.

No, we are not going to use dev_pm_ops for thermal zone suspend.  That
would be adding complexity just for the sake of it IMV.

> >>>> This problem would not occur when using dev_pm_ops, as thermal zones=
 would be
> >>>> suspended after user space has been frozen successfully. Additionall=
y, when using
> >>>> dev_pm_ops we can get rid of thermal_pm_suspended, as the device cor=
e already mandates
> >>>> that no new devices (including thermal zones and cooling devices) be=
 registered during
> >>>> a suspend/resume cycle.
> >>>>
> >>>> Replacing the PM notifiers with dev_pm_ops would of course be a opti=
mization with
> >>>> its own patch series.
> >>> Honestly, I don't see much benefit from using dev_pm_ops for thermal
> >>> zone devices and cooling devices.  Moreover, I actually think that
> >>> they could be "no PM" devices that are not even put on the
> >>> suspend-resume device list.  Technically, they are just interfaces on
> >>> top of some other devices allowing the user space to interact with th=
e
> >>> latter and combining different pieces described by the platform
> >>> firmware.  They by themselves have no PM capabilities.
> >> Correct, thermal zone devices are virtual devices representing thermal=
 management
> >> aspects of the underlying parent device. This however does not mean th=
at thermal zone
> >> devices have no PM capabilities, because they contain state. Some part=
 of this state
> >> (namely TZ_STATE_FLAG_SUSPENDED and TZ_STATE_FLAG_RESUMING) is affecte=
d by power management,
> >> so we should tell the device core about this by using dev_pm_ops inste=
ad of the PM notifier.
> > Changing the zone state to anything different from TZ_STATE_READY
> > causes __thermal_zone_device_update() to do nothing and this is the
> > whole "suspend".  It does not need to be done from a PM callback and I
> > see no reason why doing it from a PM callback would be desirable.
> > Sorry.
> >
> > Apart from the above, TZ_STATE_FLAG_SUSPENDED and
> > TZ_STATE_FLAG_RESUMING are only used for coordination between
> > thermal_zone_pm_prepare(), thermal_zone_device_resume() and
> > thermal_zone_pm_complete(), so this is not a state anything other then
> > the specific thermal zone in question cares about.
>
> AFAIK this is not completely true, once TZ_STATE_FLAG_SUSPENDED is set,
> __thermal_zone_device_update() will stop polling said device (as you said=
).
> This is not only important for the thermal zone device itself, but also f=
or
> the underlying device driver as he has to make sure that the thermal zone
> callbacks do not access an already suspended hardware device.

Which callbacks in particular do you mean?  That would need to be
something that is not called from either
__thermal_zone_device_update() because it is going to bail out early
or user space because it is frozen.  So what is left?

Seriously, if the only problem with the existing thermal zone suspend
and resume is that they are done from a PM notifier, I don't think
addressing this requires involving dev_pm_ops and it will be very hard
to convince me otherwise.

> > Moreover, resuming a thermal zone before resuming any cooling devices
> > bound to it would almost certainly break things and I'm not sure how
> > you would make that work with dev_pm_ops.  BTW, using device links for
> > this is not an option as far as I'm concerned.
>
> We could simply resume the thermal zones inside the .complete callback.
> The cooling devices will already be operational when said complete callba=
ck
> is being called by the PM core, due to the resume phase having been compl=
eted
> already.

But then it would be synchronous, wouldn't it?  Or if you want to
start async handling from a .complete callback then I don't see a
point.

> >>>>>> and making it impossible for user space applications to
> >>>>>> associate a given thermal zone device with its parent device.
> >>>>> Why does user space need to know the parent of a given cooling devi=
ce
> >>>>> or thermal zone?
> >>>> Lets say that we have two thermal zones registered by two instances =
of the
> >>>> Intel Wifi driver. User space is currently unable to find out which =
thermal zone
> >>>> belongs to which Wifi adapter, as both thermal zones have the (nearl=
y) same type string ("iwlwifi[0-X]").
> >>> But the "belong" part is not quite well defined here.  I think that
> >>> what user space needs to know is what devices are located in a given
> >>> thermal zone, isn't it?  Knowing the parent doesn't necessarily
> >>> address this.
> >> The device exposing a given thermal zone device is not always a member=
 of the thermal zone itself.
> >> In case of the Intel Wifi adapters, the individual Wifi adapters are i=
ndeed members of the thermal zone
> >> associated with their thermal zone device. But thermal zones created t=
hru a system management controller
> >> for example might only cover devices like the CPUs and GPUs, not the s=
ystem management controller device itself.
> > Well, exactly.
> >
> >> The parent device of a child device is the upstream device of the chil=
d device. The connection between parent
> >> and child can be physical (SMBus controller (parent) -> i2c device (ch=
ild)) or purely logical
> >> (PCI device (parent) -> thermal zone device (child)). There exists a p=
arent-child dependency between a parent
> >> and a child device (the child device cannot function without its paren=
t being operational), and user space
> >> might want to be able to discover such dependencies.
> > But this needs to be consistent.
> >
> > If the parent of one thermal zone represents the device affected by it
> > and the parent of another thermal zone represents something else, user
> > space will need platform-specific knowledge to figure this out, which
> > is the case today.  Without consistency, this is just not useful.
>
> I think there is a misunderstanding here, describing the devices affected=
 by a given thermal zone
> has nothing to do with the parent-child dependency between a thermal zone=
 device and its parent device.
> This parent-child dependency only states that:
>
>         "This thermal zone device is descended from this parent device. I=
t might thus depend on
>          said parent device to be operational."

So you are postulating that the parent of a thermal zone should be the
device providing the thermal sensor or otherwise a mechanism allowing
temperature to be read.  That is precise enough as far as I'm
concerned.

> >>>> This problem would be solved once we populate the parent device poin=
ter inside the thermal zone
> >>>> device, as user space can simply look at the "device" symlink to det=
ermine the parent device behind
> >>>> a given thermal zone device.
> >>> I'm not convinced about this.
> >>>
> >>>> Additionally, being able to access the acpi_handle of the parent dev=
ice will be necessary for the
> >>>> ACPI thermal zone driver to support cooling devices other than ACPI =
fans and ACPI processors.
> >>> I guess by the "parent" you mean the device represented in the ACPI
> >>> namespace by a ThermalZone object, right?  But this is not the same a=
s
> >>> the "parent" in the Wifi driver context, is it?
> >> In the context of a ACPI ThermalZone, the parent device of the thermal=
 cooling device would currently
> >> be the ACPI device bound to the "thermal" ACPI driver. In the context =
of the Intel Wifi card, the parent
> >> device would be PCI device bound to the corresponding Intel Wifi drive=
r.
> >>
> >> I think you misunderstood what kind of parent device i was referring t=
o. You likely though that i was referring
> >> to the parent device of the ACPI ThermalZone, right?
> > No.  I thought that you were referring to the ACPI ThermalZone itself.
> > Or rather, a platform device associated with the ACPI ThermalZone
> > (that is, the device the ACPI ThermalZone in the ACPI_COMPAION() of).
>
> That is correct.
>
> >> That however is not the case , with "parent device" i was
> >> referring to the device responsible for creating a given struct therma=
l_zone_device instance.
> > So I was not confused.
> >
> >>>>>> This patch series aims to fix this issue by extending the function=
s
> >>>>>> used to register thermal zone/cooling devices to also accept a par=
ent
> >>>>>> device pointer. The first six patches convert all functions used f=
or
> >>>>>> registering cooling devices, while the functions used for register=
ing
> >>>>>> thermal zone devices are converted by the remaining two patches.
> >>>>>>
> >>>>>> I tested this series on various devices containing (among others):
> >>>>>> - ACPI thermal zones
> >>>>>> - ACPI processor devices
> >>>>>> - PCIe cooling devices
> >>>>>> - Intel Wifi card
> >>>>>> - Intel powerclamp
> >>>>>> - Intel TCC cooling
> >>>>> What exactly did you do to test it?
> >>>> I tested:
> >>>> - the thermal zone temperature readout
> >>>> - correctness of the new sysfs links
> >>>> - suspend/resume
> >>>>
> >>>> I also verified that ACPI thermal zones still bind with the ACPI fan=
s.
> >>> I see, thanks.
> >>>
> >>>>>> I also compile-tested the remaining affected drivers, however i wo=
uld
> >>>>>> still be happy if the relevant maintainers (especially those of th=
e
> >>>>>> mellanox ethernet switch driver) could take a quick glance at the
> >>>>>> code and verify that i am using the correct device as the parent
> >>>>>> device.
> >>>>> I think that the above paragraph is not relevant any more?
> >>>> You are right, however i originally meant to CC the mellanox maintai=
ners as
> >>>> i was a bit unsure about the changes i made to their driver. I will =
rework
> >>>> this section in the next revision and CC the mellanox maintainers.
> >>>>
> >>>>>> This work is also necessary for extending the ACPI thermal zone dr=
iver
> >>>>>> to support the _TZD ACPI object in the future.
> >>>>> I'm still unsure why _TZD support requires the ability to set a
> >>>>> thermal zone parent device.
> >>>> _TZD allows the ACPI thermal zone to bind to cooling devices other t=
han ACPI fans
> >>>> and ACPI processors, like ACPI batteries.
> >>> No, it is not for cooling devices if my reading of the specification
> >>> is correct.  It says:
> >>>
> >>> "_TZD (Thermal Zone Devices)
> >>>
> >>> This optional object evaluates to a package of device names. Each nam=
e
> >>> corresponds to a device in the ACPI namespace that is associated with
> >>> the thermal zone. The temperature reported by the thermal zone is
> >>> roughly correspondent to that of each of the devices."
> >>>
> >>> And then
> >>>
> >>> "The list of devices returned by the control method need not be a
> >>> complete and absolute list of devices affected by the thermal zone.
> >>> However, the package should at least contain the devices that would
> >>> uniquely identify where this thermal zone is located in the machine.
> >>> For example, a thermal zone in a docking station should include a
> >>> device in the docking station, a thermal zone for the CD-ROM bay,
> >>> should include the CD-ROM."
> >>>
> >>> So IIUC this is a list of devices allowing the location of the therma=
l
> >>> zone to be figured out.  There's nothing about cooling in this
> >>> definition.
> >> Using _TZD to figure out the location of a given thermal zone is anoth=
er usage
> >> of this ACPI control method, but lets take a look at section 11.6:
> >>
> >> - If _PSV is defined then either the _PSL or _TZD objects must exist. =
The _PSL and _TZD objects may both exist.
> >> - If _PSV is defined and _PSL is not defined then at least one device =
in thermal zone, as indicated by either the
> >>     _TZD device list or devices=E2=80=99 _TZM objects, must support de=
vice performance states.
> >>
> >> So according to my understanding, _TZD can also be used to discover ad=
ditional cooling devices used for passive cooling.
> > But it doesn't actually say how those "device performance states" are
> > supposed to be used for cooling, does it?
>
> Well, ACPI specifies how passive cooling should be done using percentage =
values between 0% and 100%,
> so this part is actually specified.

If you refer to Section 11.1.5, this is based on _TC1 and _TC2 and has
limitations.  So you are saying that Section 11.1.5 should be extended
to _TZD devices.  Is this also there in the MSFT document?

> >> This makes sense as _PSL is defined to only contain processor objects =
(see section 11.4.10), so _TZD can act like an
> >> extension of _PSL for things like ACPI control method batteries (see 1=
0.2.2.12).
> > But not everything in _TZD needs to be a potential "cooling device"
> > and how you'll decide which one is?
>
> Devices in _TZD that have no cooling capability will simply never registe=
r any cooling devices. This means that
> the .should_bind callback of the ACPI thermal zone will never see those d=
evices. Only devices in _TZD that also
> have the ability for (passive) cooling will register a cooling device, so=
 only those devices will end up with
> the .should_bind callback of the ACPI thermal zone.
>
> The ACPI thermal zone treats _TZD as a list of ACPI handles. If some of t=
hose handles are unused, then this is
> totally fine.
>
> >> Microsoft also follows this approach (see https://learn.microsoft.com/=
en-us/windows-hardware/design/device-experiences/design-guide
> >> section "Thermally managed devices" paragraph "Processor aggregator").
> > Interesting.
> >
> > I agree that it would make sense to follow them because there will be
> > platform dependencies on that, if there aren't already.
>
> My primary goal is to improve the Linux thermal subsystem to be as powerf=
ul as
> the Windows thermal subsystem. This means that we must stop viewing _PSL,=
 _ALx and _TZD
> as something that only works with a predefined set of devices. Instead we=
 must view
> _PSL, _ALx and _TZD as something similar to the cooling-maps used for con=
necting
> thermal zones and cooling devices on OF-based systems.
>
> >>>> This however will currently not work as
> >>>> the ACPI thermal zone driver uses the private drvdata of the cooling=
 device to
> >>>> determine if said cooling device should bind. This only works for AC=
PI fans and
> >>>> processors due to the fact that those drivers store a ACPI device po=
inter inside
> >>>> drvdata, something the ACPI thermal zone expects.
> >>> I'm not sure I understand the above.
> >>>
> >>> There is a list of ACPI device handles per trip point, as returned by
> >>> either _PSL or _ALx.  Devices whose handles are in that list will be
> >>> bound to the thermal zone, so long as there are struct acpi_device
> >>> objects representing them which is verified with the help of the
> >>> devdata field in struct thermal_cooling_device.
> >> AFAIK devdata is meant to be used by the thermal zone device callbacks=
 to access the state
> >> container struct of the associated device driver instance. Assuming th=
at a given device driver
> >> will populate devdata with a pointer to is ACPI companion device is an=
 implementation-specific
> >> detail that does not apply to all cooling device implementations. It j=
ust so happens that the
> >> ACPI processor and fan driver do this, likely because they where desig=
ned specifically to work
> >> with the ACPI thermal zone driver.
> >>
> >> The documentation of thermal_cooling_device_register() even describes =
devdata as "device private data", so any meaning of devdata purely depends =
on the
> >> given device driver.
> > Yes, and these particular drivers decide to store a pointer to struct
> > acpi_device in it.
> >
> > But this is not super important, they might as well set the
> > ACPI_COMPANION() of the cooling device to the corresponding struct
> > acpi_device and the ACPI thermal driver might use that information.
> >
> > I'm not opposed to using parents for this purpose, but it doesn't
> > change the big picture that the ACPI thermal driver will need to know
> > the ACPI handle corresponding to each cooling device.
> >
> > If you want to use _TZD instead of or in addition to _PSL for this, it
> > doesn't change much here, it's just another list of ACPI handles, so
> > saying that parents are needed for supporting this is not exactly
> > accurate IMV.
>
> My idea was something like this:
>
> /* Cooling devices without a parent device cannot be referenced using ACP=
I */
> if (!cdev->device.parent)
>         return false;
>
> /* Not all devices are described inside the ACPI tables */
> acpi_handle cdev_handle =3D ACPI_HANDLE(cdev->device.parent);
> if (!cdev_handle)
>         return false;
>
> for (i =3D 0; i < acpi_trip->devices.count; i++) {
>         acpi_handle handle =3D acpi_trip->devices.handles[i];
>
>         if (handle =3D=3D cdev_handle)
>                 return true;
> }
>
> This only works if the parent device pointer of the cooling device is pop=
ulated.

Sure, but it looks reasonable to me.

> >>> IOW, cooling device drivers that create struct thermal_cooling_device
> >>> objects representing them are expected to set devdata in those object=
s
> >>> to point to struct acpi_device objects corresponding to their ACPI
> >>> handles, but in principle acpi_thermal_should_bind_cdev() might as
> >>> well just use the handles themselves.  It just needs to know that
> >>> there is a cooling driver on the other side of the ACPI handle.
> >>>
> >>> The point is that a cooling device to be bound to an ACPI thermal zon=
e
> >>> needs an ACPI handle in the first place to be listed in _PSL or _ALx.
> >> Correct, i merely change the way the ACPI thermal zone driver retrieve=
s the
> >> ACPI handle associated with a given cooling device.
> > Right.
> >
> >>>> As we cannot require all cooling devices to store an ACPI device poi=
nter inside
> >>>> their drvdata field in order to support ACPI,
> >>> Cooling devices don't store ACPI device pointers in struct
> >>> thermal_cooling_device objects, ACPI cooling drivers do, and there ar=
e
> >>> two reasons to do that: (1) to associate a given struct
> >>> thermal_cooling_device with an ACPI handle and (2) to let
> >>> acpi_thermal_should_bind_cdev() know that the cooling device is
> >>> present and functional.
> >>>
> >>> This can be changed to store an ACPI handle in struct
> >>> thermal_cooling_device and acpi_thermal_should_bind_cdev() may just
> >>> verify that the device is there by itself.
> >> I can of course extend thermal_cooling_device_register() to accept a f=
wnode_handle that
> >> can be used for both ACPI and OF based cooling device identification, =
if this is what you
> >> prefer.
> > I'm not sure about this ATM and see below.
> >
> >> This patch series would then turn into a cleanup series, focusing on p=
roperly adding
> >> thermal zone devices and cooling devices into the global device hierar=
chy.
> > I'd prefer to do one thing at a time though.
> >
> > If you want cooling devices to get parents, fine.  I'm not
> > fundamentally opposed to that idea, but let's have clear rules for
> > device drivers on how to set those parents for the sake of
> > consistency.
> >
> > As for the ACPI case, one rule that I want to be followed (as already
> > stated multiple times) is that a struct acpi_device can only be a
> > parent of another struct acpi_device.  This means that the parent of a
> > cooling device needs to be a platform device or similar representing
> > the actual device that will be used for implementing the cooling.
>
> OK.
>
> > A separate question is how acpi_thermal_should_bind_cdev() will match
> > cooling devices with the ACPI handles coming from _PSL, _ALx, _TZD
> > etc. and the rule can be that it will look at the ACPI_COMPANION() of
> > the parent of the given cooling device.
>
> See the example code i pasted above, the whole matching is done using ACP=
I handles,
> so we can completely leave ACPI_COMPANION() out of this.

ACPI_HANDLE() is a wrapper around ACPI_COMPANION() so your code
effectively does what I said above.

> >>>> we must use a more generic approach.
> >>> I'm not sure what use case you are talking about.
> >>>
> >>> Surely, devices with no representation in the ACPI namespace cannot b=
e
> >>> bound to ACPI thermal zones.  For devices that have a representation
> >>> in the ACPI namespace, storing an ACPI handle in devdata should not b=
e
> >>> a problem.
> >> See my above explanations for details, drvdata is defined to hold devi=
ce private data,
> >> nothing more.
> > This is related to the discussion below.
> >
> >>>> I was thinking about using the acpi_handle of the parent device inst=
ead of messing
> >>>> with the drvdata field, but this only works if the parent device poi=
nter of the
> >>>> cooling device is populated.
> >>>>
> >>>> (Cooling devices without a parent device would then be ignored by th=
e ACPI thermal
> >>>> zone driver, as such cooling devices cannot be linked to ACPI).
> >>> It can be arranged this way, but what's the practical difference?
> >>> Anyone who creates a struct thermal_cooling_device and can set its
> >>> parent pointer to a device with an ACPI companion, may as well set it=
s
> >>> devdata to point to that companion directly - or to its ACPI handle i=
f
> >>> that's preferred.
> >> Yes, but this would require explicit support for ACPI in every driver =
that registers cooling devices.
> > So you want to have generic drivers that may work on ACPI platforms
> > and on DT platforms to be able to create cooling devices for use with
> > ACPI thermal zones.  Well, had you started the whole discussion with
> > this statement, it would have been much easier to understand your
> > point.
>
> Sorry for the messy discussion, i intended to have two separate patch ser=
ies. This one was meant to
> simply be a preparation, with the important changes inside the ACPI therm=
al zone driver being implemented
> with the second patch series.
>
> That was also the reason why i send this series as an RFC.
>
> >> Using the parent device to retrieve the acpi_handle or allowing all dr=
ivers to just submit a fwnode_handle
> >> of their choice when creating a cooling device will fix this.
> > If you go the parents route, this is an important consideration for
> > the rules on how to set those parents.  Namely, they would need to be
> > set so that the fwnode_handle of the parent could be used for binding
> > the cooling device to a thermal zone either on ACPI or on DT systems.
> >
> > Of course, there are also cooling devices whose parents will not have
> > an fwnode_handle and they would still need to work in this brave new
> > world.
> >
> True, i did not think of that. In this case extending thermal_of_cooling_=
device_register() and friends to accept
> a generic fwnode_handle instead of a OF-specific device_node would make m=
ore sense. Most drivers can simply
> pass the result of dev_fwnode() instead of dev->of_node, only those that =
support multiple cooling device child
> nodes would need additional work to also support ACPI.
>
> Basically, thermal_of_get_cooling_spec() could handle the fwnode_handle i=
n the following manner:
>
> if (cooling_spec.np->fwnode !=3D cdev->fwnode)
>         return false;
>
> And the ACPI thermal zone driver could then simply use ACPI_HANDLE_FWNODE=
() to retrieve the ACPI handle from
> the fwnode_handle (together with a NULL check of course).
>
> If you are OK with this approach, i will forget about the whole parent de=
vice stuff for now and focus on extending
> (devm_)thermal_of_cooling_device_register(). There are some additional ch=
anges needed for reliably associating
> cooling devices to ACPI trip points using fwnode handles, but those are n=
ot that intrusive.
>
> What do you think?

One advantage of using parents is that it will help user space to
figure out connections between the abstract cooling devices and the
associated hardware or firmware entities.  I think that this is an
important one.

It also doesn't prevent fwnode_handle from being used because the
fwnode_handle may just be stored in the parent.  I like this more than
associating fwnode_handles directly with abstract cooling devices.

If the cooling device parent (that is, the provider of the cooling
mechanism used by it) does not have an fwnode_handle, then either it
needs to be driven directly from user space, or the driver creating a
thermal zone device needs to provide a specific .should_bind()
callback that will know what to look for.
