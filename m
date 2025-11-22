Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E35BC7D28C
	for <lists+dri-devel@lfdr.de>; Sat, 22 Nov 2025 15:18:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4737110E187;
	Sat, 22 Nov 2025 14:18:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=w_armin@gmx.de header.b="Y1UpTHto";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29A0510E189;
 Sat, 22 Nov 2025 14:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1763821096; x=1764425896; i=w_armin@gmx.de;
 bh=Kc4yf/ip/zYhJKQehc/v1Ono+m+rQ7sS8fbaEIg4oWE=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=Y1UpTHto+ZoqLH5nQvLgtnB839wOH5s3ITuS1rBa0F5opUsqMNbpc05RvhNXdN+w
 LbP2H+cO5IdH6PqtSNGHEF0wlSpdifa3lUKxga5MHCcYij0kd1p3i2kmcuxyr5UQ5
 oGe/sP7emNQKmeW/rEv8Cvq8dL5crOw9wD+533pSWpiapdYfR9/sww4wBBoWvI303
 ko9K5byBMbCV91+W64U/ZMJVRN4NMrQJW46iRwfz8la0g21B5gAbcg9n72nkQ6yPd
 djLm9H5GxLznIw/0QBpCYsDwHP3840idibV2CETRLYzHOGszREUKs3+RFrJiyDlhX
 j6/yZOEhEn8SEgmJTw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([93.202.247.91]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MbAci-1vy58R25Qu-00ZeVB; Sat, 22
 Nov 2025 15:18:15 +0100
Message-ID: <5f3ef610-4024-4ca0-a934-2649f5d25f40@gmx.de>
Date: Sat, 22 Nov 2025 15:18:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC RESEND 0/8] thermal: core: Allow setting the parent
 device of thermal zone/cooling devices
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
 Len Brown <lenb@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Ido Schimmel <idosch@nvidia.com>, Petr Machata <petrm@nvidia.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-doc@vger.kernel.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
 ath11k@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, platform-driver-x86@vger.kernel.org,
 linux-pci@vger.kernel.org, imx@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org
References: <20251120-thermal-device-v1-0-bbdad594d57a@gmx.de>
 <CAJZ5v0jOPrBcozzJMsB1eE12MuZRWDAV-+=jfrhJbi=S0p5J9Q@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CAJZ5v0jOPrBcozzJMsB1eE12MuZRWDAV-+=jfrhJbi=S0p5J9Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:p1RNGZcFb7DMYC4pNIt+bKMVaFtCpVDJjA+b5GK6HVl6ii0Qvy6
 F02X8anlkVakkbi2OTFbnt8tYeJSvn6gGOs4ruxe4iOSm964VHeR0KGAfYYSOGHAkEHE1SL
 f+0kJN0U4H4TG67hcvhs8e2p+bBtnKPBsYGRBwzRgM45wOTh3XumwYG+ToUgVBnpYQ3YAqx
 wayKxHUnhSBUFp4PBU0OA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:vXFK1AWv0os=;NZUt21siNzvTNFU+NCb4ppbI26X
 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
 L4DlDx0w=
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

Am 21.11.25 um 21:35 schrieb Rafael J. Wysocki:

> On Thu, Nov 20, 2025 at 4:41=E2=80=AFAM Armin Wolf <W_Armin@gmx.de> wrot=
e:
>> Drivers registering thermal zone/cooling devices are currently unable
>> to tell the thermal core what parent device the new thermal zone/
>> cooling device should have, potentially causing issues with suspend
>> ordering
> This is one potential class of problems that may arise, but I would
> like to see a real example of this.
>
> As it stands today, thermal_class has no PM callbacks, so there are no
> callback execution ordering issues with devices in that class and what
> other suspend/resume ordering issues are there?

Correct, that is why i said "potentially".

>
> Also, the suspend and resume of thermal zones is handled via PM
> notifiers.  Is there a problem with this?

The problem with PM notifiers is that thermal zones stop working even befo=
re
user space is frozen. Freezing user space might take a lot of time, so hav=
ing
no thermal management during this period is less than ideal.

This problem would not occur when using dev_pm_ops, as thermal zones would=
 be
suspended after user space has been frozen successfully. Additionally, whe=
n using
dev_pm_ops we can get rid of thermal_pm_suspended, as the device core alre=
ady mandates
that no new devices (including thermal zones and cooling devices) be regis=
tered during
a suspend/resume cycle.

Replacing the PM notifiers with dev_pm_ops would of course be a optimizati=
on with
its own patch series.

>> and making it impossible for user space applications to
>> associate a given thermal zone device with its parent device.
> Why does user space need to know the parent of a given cooling device
> or thermal zone?

Lets say that we have two thermal zones registered by two instances of the
Intel Wifi driver. User space is currently unable to find out which therma=
l zone
belongs to which Wifi adapter, as both thermal zones have the (nearly) sam=
e type string ("iwlwifi[0-X]").

This problem would be solved once we populate the parent device pointer in=
side the thermal zone
device, as user space can simply look at the "device" symlink to determine=
 the parent device behind
a given thermal zone device.

Additionally, being able to access the acpi_handle of the parent device wi=
ll be necessary for the
ACPI thermal zone driver to support cooling devices other than ACPI fans a=
nd ACPI processors.

>> This patch series aims to fix this issue by extending the functions
>> used to register thermal zone/cooling devices to also accept a parent
>> device pointer. The first six patches convert all functions used for
>> registering cooling devices, while the functions used for registering
>> thermal zone devices are converted by the remaining two patches.
>>
>> I tested this series on various devices containing (among others):
>> - ACPI thermal zones
>> - ACPI processor devices
>> - PCIe cooling devices
>> - Intel Wifi card
>> - Intel powerclamp
>> - Intel TCC cooling
> What exactly did you do to test it?

I tested:
- the thermal zone temperature readout
- correctness of the new sysfs links
- suspend/resume

I also verified that ACPI thermal zones still bind with the ACPI fans.

>> I also compile-tested the remaining affected drivers, however i would
>> still be happy if the relevant maintainers (especially those of the
>> mellanox ethernet switch driver) could take a quick glance at the
>> code and verify that i am using the correct device as the parent
>> device.
> I think that the above paragraph is not relevant any more?

You are right, however i originally meant to CC the mellanox maintainers a=
s
i was a bit unsure about the changes i made to their driver. I will rework
this section in the next revision and CC the mellanox maintainers.

>
>> This work is also necessary for extending the ACPI thermal zone driver
>> to support the _TZD ACPI object in the future.
> I'm still unsure why _TZD support requires the ability to set a
> thermal zone parent device.

_TZD allows the ACPI thermal zone to bind to cooling devices other than AC=
PI fans
and ACPI processors, like ACPI batteries. This however will currently not =
work as
the ACPI thermal zone driver uses the private drvdata of the cooling devic=
e to
determine if said cooling device should bind. This only works for ACPI fan=
s and
processors due to the fact that those drivers store a ACPI device pointer =
inside
drvdata, something the ACPI thermal zone expects.

As we cannot require all cooling devices to store an ACPI device pointer i=
nside
their drvdata field in order to support ACPI, we must use a more generic a=
pproach.
I was thinking about using the acpi_handle of the parent device instead of=
 messing
with the drvdata field, but this only works if the parent device pointer o=
f the
cooling device is populated.

(Cooling devices without a parent device would then be ignored by the ACPI=
 thermal
zone driver, as such cooling devices cannot be linked to ACPI).

>
>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>> ---
>> Armin Wolf (8):
>>        thermal: core: Allow setting the parent device of cooling device=
s
>>        thermal: core: Set parent device in thermal_of_cooling_device_re=
gister()
>>        ACPI: processor: Stop creating "device" sysfs link
> That link is not to the cooling devices' parent, but to the ACPI
> device object (a struct acpi_device) that corresponds to the parent.
> The parent of the cooling device should be the processor device, not
> its ACPI companion, so I'm not sure why there would be a conflict.

 From the perspective of the Linux device core, a parent device does not h=
ave to be
a "physical" device. In the case of the ACPI processor driver, the ACPI de=
vice is used,
so the cooling device registered by said driver belongs to the ACPI device=
. I agree
that using the Linux processor device would make more sense, but this will=
 require
changes inside the ACPI processor driver.

As for the "device" symlink: The conflict would be a naming conflict, as b=
oth "device" symlinks
(the one created by the ACPI processor driver and the one created by the d=
evice core) will
be created in the same directory (which is the directory of the cooling de=
vice).

>>        ACPI: fan: Stop creating "device" sysfs link
>>        ACPI: video: Stop creating "device" sysfs link
> Analogously in the above two cases AFAICS.
>
> The parent of a cooling device should be a "physical" device object,
> like a platform device or a PCI device or similar, not a struct
> acpi_device (which in fact is not a device even).

 From the perspective of the Linux device core, a ACPI device is a perfect=
ly valid device.
I agree that using a platform device or PCI device is better, but this alr=
eady happens
inside the ACPI fan driver (platform device).

Only the ACPI video driver created a "device" sysfs link that points to th=
e ACPI device
instead of the PCI device. I just noticed that i accidentally changed this=
 by using the
PCI device as the parent device for the cooling device.

If you want then we can keep this change.

>>        thermal: core: Set parent device in thermal_cooling_device_regis=
ter()
>>        ACPI: thermal: Stop creating "device" sysfs link
> And this link is to the struct acpi_device representing the thermal zone=
 itself.

Correct, the ACPI thermal zone driver is a ACPI driver, meaning that he bi=
nds to
ACPI devices. Because of this all (thermal zone) devices created by an ins=
tance of
said driver are descendants of the ACPI device said instance is bound to.

We can of course convert the ACPI thermal zone driver into a platform driv=
er, but
this would be a separate patch series.

>>        thermal: core: Allow setting the parent device of thermal zone d=
evices
> I'm not sure if this is a good idea, at least until it is clear what
> the role of a thermal zone parent device should be.

Take a look at my explanation with the Intel Wifi driver.

Thanks,
Armin Wolf

