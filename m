Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE59830E3F
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 21:52:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E293A10E862;
	Wed, 17 Jan 2024 20:51:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A9E610E7E6
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 19:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1705518242; x=1706123042; i=w_armin@gmx.de;
 bh=bdLIPC15ej0v+zOIWbvmyn7ex0HPBw0c2Y8yrcRmgUE=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
 In-Reply-To;
 b=ZqUrB5+IF/pyfkruHesmKxOj/RBoFttlDhzJ4c0LLQfDwwccDfkEFd0hzO+jUybU
 mZ31mdOPv48bo66OTHo0ALAAgMMlXcIf02vXBRDowlTr6wWxiHDkMaRaa9ryqmSLg
 Z2AbAMCV7ewQXccEOH8cgsKKXJSPDvHGFPE0HMIAZQuFx+AVOBzXIWz2Rr4ObsP1E
 vIgClYrNr+eT99Ggmr8D6ampYSRlu3zcvcAAlz6LWcInq99RfzGrxLxXKZxge+ZTh
 m93846rMbvEP5tZyga0uUegwHiWHtJR9V6FIH9P9gvSelr+Zx4SKsEzQVKKEjJq7s
 BhAG/eGzU3p4g1RqZQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mo6qp-1qlL4b1jjf-00pZUw; Wed, 17
 Jan 2024 20:04:02 +0100
Message-ID: <6b32fb73-0544-4a68-95ba-e82406a4b188@gmx.de>
Date: Wed, 17 Jan 2024 20:03:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Userspace API for per key backlight for non HID (no hidraw)
 keyboards
To: Hans de Goede <hdegoede@redhat.com>,
 Werner Sembach <wse@tuxedocomputers.com>, Pavel Machek <pavel@ucw.cz>,
 Jani Nikula <jani.nikula@linux.intel.com>, jikos@kernel.org,
 Jelle van der Waa <jelle@vdwaa.nl>
References: <20231011190017.1230898-1-wse@tuxedocomputers.com>
 <ZSe1GYLplZo5fsAe@duo.ucw.cz>
 <0440ed38-c53b-4aa1-8899-969e5193cfef@tuxedocomputers.com>
 <ZSf9QneKO/8IzWhd@duo.ucw.cz>
 <a244a00d-6be4-44bc-9d41-6f9df14de8ee@tuxedocomputers.com>
 <ZSk16iTBmZ2fLHZ0@duo.ucw.cz>
 <aac81702-df1e-43a2-bfe9-28e9cb8d2282@tuxedocomputers.com>
 <ZSmg4tqXiYiX18K/@duo.ucw.cz>
 <CANiq72mfP+dOLFR352O0UNVF8m8yTi_VmOY1zzQdTBjPWCRowg@mail.gmail.com>
 <87sf61bm8t.fsf@intel.com> <ZVvHG/Q+V6kCnfKZ@duo.ucw.cz>
 <f4137e34-c7fb-4f21-bc93-1496cbf61fdf@tuxedocomputers.com>
 <8096a042-83bd-4b9f-b633-79e86995c9b8@redhat.com>
 <f416fbca-589b-4f6a-aad6-323b66398273@tuxedocomputers.com>
 <4222268b-ff44-4b7d-bf11-e350594bbe24@redhat.com>
 <ac02143c-d417-49e5-9c6e-150cbda71ba7@tuxedocomputers.com>
 <3040290f-9b26-4fd3-8e64-a03ec59921d6@redhat.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <3040290f-9b26-4fd3-8e64-a03ec59921d6@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:slnQSX0fSQ1Rlo9H0x1wbSLXQ437xLk6mAYc0Z78ttihROUnZG0
 eNyNIaA2sc7aNxXCB8a7h9rLigbblOf8Nhh0TyHN030UAA0bRrM2Am3mxzeJH/DM19V4V0i
 UYtvQh9+MFm/YQM3eNcDBZSndztz9o/5sFtC79/jKnAhsUifDamemC7G+kbj/DcPCRbsrNn
 C2BXtEbdXf7a/d5go9ZQQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:grnvNIq4uoo=;6YCsgOTz5hZp0T00nKJHjQEtS5d
 SxBKok9MuuPW6cBs7jcyc5Udvvpzpfy0HpHk7PgSk+ta09GlfNUBXtQ1KRaL4tPN/bhOWWSE/
 NcmpRK71/I1wVJ2rpsSmxtpfcc+qwRuTapyfQuwOo4Ga8YpaFEGsRnd3P8762QUGpkdAqSOo6
 WDB1q8sv5CoeyrSpgE2fzEMUk73j7OKNBk8GRS+UOxQl0Ey75V30zpYUFfL823h1nBp1iXUZO
 drfvRfutwdTV7pKSLTxwNPnn9h3Tnje6Po6Bpk8naOeksg2c9kYsiuXqK/MlK1qNghcak5Kkw
 Ai4DBucYenJxX4EkVGZq3+M4IQDAOLWfp2rBYEFuh186iCgMmb5y+X5poLhYNTUBLGe1jkLIl
 CrmM9MmI+KbtPLBBbFutd5UuSbfu+TB6/WqUFRfnKprGBT19dWrXyIs8g0UhMsfvsH/yEtQPt
 D6eJ2bxpmeYT+CoiqG5sRKBMvPVuZn0pf5O60Ffb6uBv9BFD3bI7tPd/fhy/Ebyc2ONP6RrhO
 Tdc6RE5x23ZBoTYva/k7NTwd5487cTd7eTbgyyfYWe4z/N6YwNnemCCDPxUnm4ZS7pQY8sdhQ
 ryTnsG0g8DJN6LFKT7QeBso4jDqlQl36aAnLRx5LDe9xGAwfhlgub76rwW7P0AZNDvUreSm+q
 iR81It4a+LhM6Wc/AE4rWyixQQFzTAkOF9iVXTfh+sD169oAGzK6yl1IN9TecEhOOGydW4uzE
 J74xtcA5zlI9UrLmqMOZy+Eqjq/xehS15+ohk3gFeciTx3vL3jIJ9hFzqSnVxrfpor75MWftS
 mJ1/aEokbsj11IsBJYper3UfiHFFoRe5J4rGaPLuzJgmslk621msSg6q5mlTQZj61QnNi472O
 XV5bqyw2GTUszYkb58OW7m5xQl8TKIoBfWc+fDzouHfb3zHcmhaNdMPm8Nijgpl7zh4D0zlZ0
 ykBBnGTw28PH66/pOYsv3Y6n7Zk=
X-Mailman-Approved-At: Wed, 17 Jan 2024 20:51:33 +0000
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
Cc: Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, linux-input@vger.kernel.org,
 ojeda@kernel.org, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 17.01.24 um 17:50 schrieb Hans de Goede:

> Hi All,
>
> On 11/27/23 11:59, Werner Sembach wrote:
>
> <snip>
>
>> I also stumbled across a new Problem:
>>
>> We have an upcoming device that has a per-key keyboard backlight, but d=
oes the control completely via a wmi/acpi interface. So no usable hidraw h=
ere for a potential userspace driver implementation ...
>>
>> So a quick summary for the ideas floating in this thread so far:
>>
>> 1. Expand leds interface allowing arbitrary modes with semi arbitrary o=
ptional attributes:
>>
>>  =C2=A0=C2=A0=C2=A0 - Pro:
>>
>>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 - Still offers all default attri=
butes for use with UPower
>>
>>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 - Fairly simple to implement fro=
m the preexisting codebase
>>
>>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 - Could be implemented for all (=
to me) known internal keyboard backlights
>>
>>  =C2=A0=C2=A0=C2=A0 - Con:
>>
>>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 - Violates the simplicity paradi=
gm of the leds interface (e.g. with this one leds entry controls possible =
multiple leds)
> So what you are suggesting here is having some way (a-z + other sysfs at=
tr?)
> to use a single LED class device and then extend that to allow setting a=
ll
> keys ?
>
> This does not seem like a good idea to me and this will also cause issue=
s
> when doing animations in software, since this API will likely be slow.
>
> And if the API is not slow, then it will likely involve some sort
> of binary sysfs file for setting multiple keys rather then 1
> file per key which would break the normal 1 file per setting sysfs
> paradigm.
>
>> 2. Implement per-key keyboards as auxdisplay
>>
>>  =C2=A0=C2=A0=C2=A0 - Pro:
>>
>>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 - Already has a concept for led =
positions
> With a "concept" you mean simple x,y positioning or is
> there something more advanced here that I'm aware of ?
>
>>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 - Is conceptually closer to "mul=
tiple leds forming a singular entity"
>>
>>  =C2=A0=C2=A0=C2=A0 - Con:
>>
>>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 - No preexisting UPower support
>>
>>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 - No concept for special hardwar=
e lightning modes
>>
>>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 - No support for arbitrary led o=
utlines yet (e.g. ISO style enter-key)
> Hmm, so there is very little documentation on this and what
> docs there is: Documentation/admin-guide/auxdisplay/cfag12864b.rst
> as well as the example program how to uses this suggests that
> this is using the old /dev/fb# interface which we are sorta
> trying to retire.
>
>
>> 3. Implement in input subsystem
>>
>>  =C2=A0=C2=A0=C2=A0 - Pro:
>>
>>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 - Preexisting concept for keys a=
nd key purpose
>>
>>  =C2=A0=C2=A0=C2=A0 - Con:
>>
>>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 - Not in scope for subsystem
>>
>>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 - No other preexisting light inf=
rastructure
> Dmitry actually recently nacked the addition of
> a LED_MIC_MUTE define to include/uapi/linux/input-event-codes.h
> which was intended to be able to allow the input LED support
> with standard HID mic-mute leds (spk-mute is already supported
> this way).
>
> Dmitry was very clear that no new LEDs must be added and
> that any new LED support should be done through the LED
> subsytem, so I do not think that something like this
> is going to fly.
>
>
>> 4. Implement a simple leds driver only supporting a small subset of the=
 capabilities and make it disable-able for a userspace driver to take over
>>
>>  =C2=A0=C2=A0=C2=A0 - Pro:
>>
>>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 - Most simple to implement basic=
 support
>>
>>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 - In scope for led subsystem sim=
plicity paradigm
>>
>>  =C2=A0=C2=A0=C2=A0 - Con:
>>
>>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 - Not all built in keyboard back=
lights can be implemented in a userspace only driver
> Right, so this is basically what we have been discussing in the other
> part of the thread with the:
>
> /sys/bus/hid/devices/0003:xxxx:xxxx.xxxx/disable_kbd_backlight_support
>
> proposal to unregister the kernel's LED class device and then
> allow userspace to do whatever it wants through /dev/hidraw
> without the kernel also trying to access the backlight
> functionality at the same time.
>
> AFAIK there already is a bunch of userspace support for
> per key addressable kbd RGB backlights using hidraw support,
> so this way we can use the momentum / code of these existing
> projects, at least for existing hidraw keyboards and adding
> support for:
>
> /sys/bus/hid/devices/0003:xxxx:xxxx.xxxx/disable_kbd_backlight_support
>
> to these existing projects should be simple.
>
> Yet this will not work for your mentioned "control completely
> via a wmi/acpi interface". Still I think we should go the same
> route for those adding a misc-char device or something like
> that to allow making WMI calls from userspace (like Windows
> can do). Maybe with an allow list per GUID to only allow
> specific calls, so that we can avoid possible dangerous calls.
>
> Armin Wolf recently became the WMI bus maintainer.
>
> Armin, we are discussing how to deal with (laptop) keyboards
> which have a separate RGB LED per key and how to control
> those LEDs.
>
> So far per key addressable keyboard backlighting has always
> been HID based, so any existing support is just userspace
> based using /dev/hidraw. In my experience the problem with
> supporting gaming peripherals is that there is interest in it,
> but not really enough interest to keep a sustained momentum
> behind projects, especially not when it comes to taking code
> from a fun weekend hack to upstreaming them into bigger
> projects like the kernel.
>
> So I would like to offer some sort of easy accessible
> API to userspace for accessing this, basically allowing
> userspace drivers for the LED part of the keyboard which
> in some cases will involve making WMI calls from userspace.
>
> So, Armin, what do you think about a way of allowing
> (filtered) WMI calls from userspace through say
> a misc-char device + ioctls or something like that?
>
> Werner atm I personally do think that option 4. from
> your list is the way to go. Mainly because designing
> a generic kernel API for all bells and whistles of gaming
> hw is very tricky and would require a large ongoing
> effort which I just don't see happening (based on
> past experience).
>
> Regards,
>
> Hans
>
Hi,

i can understand your concerns, but i strongly advise against a generic WM=
I userspace API.
The reasons for this are:

1. We are still unable to parse (and use) the binary MOF buffers describin=
g the WMI devices,
so all of that would require the driver parsing a raw byte buffer. In this=
 case a separate
misc device managed by the driver would basically do the same.

2. Many WMI implementations are like RWEverything implemented inside the A=
CPI firmware, so
most devices will require the driver to do excessive filtering. Many imple=
mentations also do
no proper input validation either so the driver has to know all possible u=
se cases since he
has to protect the buggy ACPI firmware from userspace attacks.

Regarding point number 2, i just had to contact Asus so that they remove a=
 broken WMI interface
from my motherboard or else a simple application could crash the Windows k=
ernel. This firmware
is (sadly) being designed as an internal API and thus unstable beyond all =
imagination.

For HID devices, a userspace driver might be OK since they are somewhat is=
olated from the remaining
hardware, but WMI is basically a kernel bypass for ACPI firmware calls, so=
 userspace could easily
attack the kernel is way.

Personally, i would prefer extending the LED subsystem to support zone-lik=
e devices with many LEDs,
as this would prevent userspace from having to tinker with the hardware be=
hind the kernels back.
Other highly device-specific features could be implemented with a driver-s=
pecific misc device.

Regarding the speed, it depends on the underlying WMI interface design if =
smooth animations are
even possible, since many WMI interfaces are quite slow. Can you share the=
 Binary MOF buffers
describing the WMI interfaces in question?

Thanks,
Armin Wolf

