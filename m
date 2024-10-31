Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D584F9B7940
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 12:01:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23AB210E860;
	Thu, 31 Oct 2024 11:01:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ljones.dev header.i=@ljones.dev header.b="KPafeO0p";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="ARvn1g4T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 529 seconds by postgrey-1.36 at gabe;
 Thu, 31 Oct 2024 11:01:06 UTC
Received: from fhigh-b5-smtp.messagingengine.com
 (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93C8210E860
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 11:01:06 +0000 (UTC)
Received: from phl-compute-08.internal (phl-compute-08.phl.internal
 [10.202.2.48])
 by mailfhigh.stl.internal (Postfix) with ESMTP id E2AB025400C4;
 Thu, 31 Oct 2024 06:52:16 -0400 (EDT)
Received: from phl-imap-01 ([10.202.2.91])
 by phl-compute-08.internal (MEProxy); Thu, 31 Oct 2024 06:52:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm1; t=1730371936;
 x=1730458336; bh=h1DcXwp3ose9PAVevSGggMI/uLCHuHYOrWE9mX99Mfk=; b=
 KPafeO0pz/TGBLYkVAPr0VS0FFHrmIIpCpB0PCuLjG6u5m3VAZaKl5JVhAHg283J
 nIFKqjmSyG0Y5G34A8mX/rh0U6Rs5108FxmznHJyJYpXWbmiLiQ3HWcOAHfGJXjF
 v85gLi2LoLgDIb1zaGx28/iiyLdJxwKOJ5hjX4Rat0qJKzFkefC0Y0+owsvklCXx
 ZJ58JcyZiKHi297/TS0xLRw56uHIIQlAFjSNhCbL/JI7r68VN173DbFXhW5WBett
 33QXGH8S3PZfW2DUS97mCpy4CyhcxfS+PCZT/h2WC+7yN54n0x0dn1FaROj4Lrdc
 flxoskAljWqcngR8jHnIEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1730371936; x=
 1730458336; bh=h1DcXwp3ose9PAVevSGggMI/uLCHuHYOrWE9mX99Mfk=; b=A
 Rvn1g4T4qHNkrbz5VEBFZApqTbUZQo+p0DbHJxEKXH0nEqXs0UMcvt+a/6Zomacg
 jgn5UHtQLM5AhAyBZXrkD1rC9ai6WiHnak6N/DHq8z9bFxm6GMrCtl3AL9eTHp7I
 SBL9eQm3/m7t8ILhvaj+zz9DBypcJILQCTh9EeV87VdFxQcXwNJkku86KFuIWOIH
 Zf3RQ4RbJtkCDYJpK6lyvfTZrxAD3AAM/phUCTDJ/ADJUkaoBw7QcS7giUlpwUvW
 O4uHMWCUpzZTnRPCeJaP5urolKwKlv8n0gYEsTA1uWduhwuUT141VgfFyw3cZj0J
 IcEhtKro96BKx3Ekg7IhQ==
X-ME-Sender: <xms:YGEjZ2rh0Nf6aWubaTlrxh2B3KcQSll3O_L8dwPiiVmHTrDk-gWspA>
 <xme:YGEjZ0pSI5DsV-1mO2yKFBpFJMX09HBTLSmcNI7EIW3j-HcoWFGQjYfzV4BFvmBOl
 ggZUbZVj32oK_Kr25A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdekhedgudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
 rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
 htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdej
 necuhfhrohhmpedfnfhukhgvucflohhnvghsfdcuoehluhhkvgeslhhjohhnvghsrdguvg
 hvqeenucggtffrrghtthgvrhhnpeekieeftdeltdevudeukeefleejjeeitedttdfhteek
 jefhteduhffhjefhfeejjeenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrgh
 dpghhithhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
 rghilhhfrhhomheplhhukhgvsehljhhonhgvshdruggvvhdpnhgspghrtghpthhtoheple
 dpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghlvgigrghnuggvrhdruggvuhgt
 hhgvrhesrghmugdrtghomhdprhgtphhtthhopehmrghrihhordhlihhmohhntghivghllh
 hosegrmhgurdgtohhmpdhrtghpthhtoheprghlvgiguggvuhgthhgvrhesghhmrghilhdr
 tghomhdprhgtphhtthhopegshhgvlhhgrggrshesghhoohhglhgvrdgtohhmpdhrtghpth
 htohepshhuphgvrhhmudeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepughrihdquggv
 vhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopehkrg
 hihhgvnhhgfhesnhhvihguihgrrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhn
 vghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqphgtih
 esvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:YGEjZ7PdkBqBZi6Ut36ao10uaBpJkWRw-ICwMRCaXMyKjP7P673P1g>
 <xmx:YGEjZ16jxFb0cNMT-71ch1wQzROEdFTp0EpOndt9SSjjcaXulIxWuA>
 <xmx:YGEjZ17Ha_fTcvN2-Ox7MjfTqc-9GA_sdquqZCwO-YUlQ-ojNUjJyQ>
 <xmx:YGEjZ1jzkP02oADOVz2V62snVHa-Q_ju1TZcunE1kUGVkl3u-P3shg>
 <xmx:YGEjZwYDjtsWZyNwI2c7aRq-ecHfmrw4ZtNsbqjm-fUfN4MrRTui4m8X>
Feedback-ID: i5ec1447f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 6F9523360079; Thu, 31 Oct 2024 06:52:16 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Thu, 31 Oct 2024 11:51:56 +0100
From: "Luke Jones" <luke@ljones.dev>
To: "Kai-Heng Feng" <kaihengf@nvidia.com>,
 "Alex Deucher" <alexdeucher@gmail.com>
Cc: "Mario Limonciello" <superm1@kernel.org>,
 "Bjorn Helgaas" <bhelgaas@google.com>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 "open list" <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 "Mario Limonciello" <mario.limonciello@amd.com>,
 "Alex Deucher" <alexander.deucher@amd.com>
Message-Id: <52d9ff04-ef07-4251-b540-e3d3cdcd4c75@app.fastmail.com>
In-Reply-To: <33d7c0ca-8459-4b85-a0e6-97f2e1e8db91@nvidia.com>
References: <20241014152502.1477809-1-superm1@kernel.org>
 <20b48c6f-7ea9-4571-a39c-f20a9cf62319@app.fastmail.com>
 <f56c555f-7313-43ff-abe4-28fb246e31cc@nvidia.com>
 <CADnq5_OjfJzcOqa=NbWVw5ENvi+nmvNAZX0u_0hOvk3EVoh0bw@mail.gmail.com>
 <fd7cae9a-5ee1-4e18-915d-4115f0a6a156@nvidia.com>
 <CADnq5_NTBXPbW+u_AxTewH-aouLNn4gxebpzUSzsyev-VxOtcg@mail.gmail.com>
 <46b487ec-e8a6-43fb-85d5-f264618f2e5d@nvidia.com>
 <CADnq5_Mh7B8Kk144terpvV9kf2Z4xcQ0nhVakHOcDdwgd3Y1Fg@mail.gmail.com>
 <33d7c0ca-8459-4b85-a0e6-97f2e1e8db91@nvidia.com>
Subject: Re: [PATCH] PCI/VGA: Don't assume only VGA device found is the boot
 VGA device
Content-Type: text/plain; charset=utf-8
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

On Thu, 31 Oct 2024, at 1:58 AM, Kai-Heng Feng wrote:
> On 2024/10/25 8:55 PM, Alex Deucher wrote:
>> External email: Use caution opening links or attachments
>>=20
>>=20
>> On Fri, Oct 25, 2024 at 3:51=E2=80=AFAM Kai-Heng Feng <kaihengf@nvidi=
a.com> wrote:
>>>
>>>
>>>
>>> On 2024/10/23 11:27 PM, Alex Deucher wrote:
>>>> External email: Use caution opening links or attachments
>>>>
>>>>
>>>> On Tue, Oct 22, 2024 at 9:27=E2=80=AFPM Kai-Heng Feng <kaihengf@nvi=
dia.com> wrote:
>>>>>
>>>>>
>>>>>
>>>>> On 2024/10/22 9:04 PM, Alex Deucher wrote:
>>>>>> External email: Use caution opening links or attachments
>>>>>>
>>>>>>
>>>>>> On Tue, Oct 22, 2024 at 2:31=E2=80=AFAM Kai-Heng Feng <kaihengf@n=
vidia.com> wrote:
>>>>>>>
>>>>>>> Hi Luke,
>>>>>>>
>>>>>>> On 2024/10/15 4:04 PM, Luke Jones wrote:
>>>>>>>> On Mon, 14 Oct 2024, at 5:25 PM, Mario Limonciello wrote:
>>>>>>>>> From: Mario Limonciello <mario.limonciello@amd.com>
>>>>>>>>>
>>>>>>>>> The ASUS GA605W has a NVIDIA PCI VGA device and an AMD PCI dis=
play device.
>>>>>>>>>
>>>>>>>>> ```
>>>>>>>>> 65:00.0 VGA compatible controller: NVIDIA Corporation AD106M [=
GeForce
>>>>>>>>> RTX 4070 Max-Q / Mobile] (rev a1)
>>>>>>>>> 66:00.0 Display controller: Advanced Micro Devices, Inc. [AMD/=
ATI]
>>>>>>>>> Strix [Radeon 880M / 890M] (rev c1)
>>>>>>>>> ```
>>>>>>>>>
>>>>>>>>> The fallback logic in vga_is_boot_device() flags the NVIDIA dG=
PU as the
>>>>>>>>> boot VGA device, but really the eDP is connected to the AMD PC=
I display
>>>>>>>>> device.
>>>>>>>>>
>>>>>>>>> Drop this case to avoid marking the NVIDIA dGPU as the boot VG=
A device.
>>>>>>>>>
>>>>>>>>> Suggested-by: Alex Deucher <alexander.deucher@amd.com>
>>>>>>>>> Reported-by: Luke D. Jones <luke@ljones.dev>
>>>>>>>>> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3673
>>>>>>>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>>>>>>>> ---
>>>>>>>>>      drivers/pci/vgaarb.c | 7 -------
>>>>>>>>>      1 file changed, 7 deletions(-)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
>>>>>>>>> index 78748e8d2dba..05ac2b672d4b 100644
>>>>>>>>> --- a/drivers/pci/vgaarb.c
>>>>>>>>> +++ b/drivers/pci/vgaarb.c
>>>>>>>>> @@ -675,13 +675,6 @@ static bool vga_is_boot_device(struct vga=
_device *vgadev)
>>>>>>>>>                 return true;
>>>>>>>>>         }
>>>>>>>>>
>>>>>>>>> -    /*
>>>>>>>>> -     * Vgadev has neither IO nor MEM enabled.  If we haven't =
found any
>>>>>>>>> -     * other VGA devices, it is the best candidate so far.
>>>>>>>>> -     */
>>>>>>>>> -    if (!boot_vga)
>>>>>>>>> -            return true;
>>>>>>>>> -
>>>>>>>>>         return false;
>>>>>>>>>      }
>>>>>>>>>
>>>>>>>>> --
>>>>>>>>> 2.43.0
>>>>>>>>
>>>>>>>> Hi Mario,
>>>>>>>>
>>>>>>>> I can verify that this does leave the `boot_vga` attribute set =
as 0 for the NVIDIA device.
>>>>>>>
>>>>>>> Does the following diff work for you?
>>>>>>> This variant should be less risky for most systems.
>>>>>>>
>>>>>>> diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
>>>>>>> index 78748e8d2dba..3fb734cb9c1b 100644
>>>>>>> --- a/drivers/pci/vgaarb.c
>>>>>>> +++ b/drivers/pci/vgaarb.c
>>>>>>> @@ -675,6 +675,9 @@ static bool vga_is_boot_device(struct vga_de=
vice *vgadev)
>>>>>>>                     return true;
>>>>>>>             }
>>>>>>>
>>>>>>> +       if (vga_arb_integrated_gpu(&pdev->dev))
>>>>>>> +               return true;
>>>>>>> +
>>>>>>
>>>>>> The problem is that the integrated graphics does not support VGA.
>>>>>
>>>>> Right, so the check has to be used much earlier.
>>>>>
>>>>> I wonder does the integrated GFX have _DOD/_DOS while the discrete=
 one doesn't?
>>>>> If that's the case, vga_arb_integrated_gpu() can be used to differ=
entiate which
>>>>> one is the boot GFX.
>>>>
>>>> I think the problem is that the boot GPU is being conflated with vga
>>>> arb.  In this case the iGPU has no VGA so has no reason to be invol=
ved
>>>> in vga arb.  Trying to mess with any vga related resources on it co=
uld
>>>> be problematic.  Do higher levels of the stack look at vga arb to
>>>> determine the "primary" GPU?
>>>
>>> Hmm, I wonder if all those heuristic are needed for EFI based system?
>>>
>>> Can we assume that what being used by UEFI GOP is the primary GFX de=
vice?
>>=20
>> Yes, I believe so.  The SBIOS should use the GOP device as determined
>> by the user preference.  I.e.., in the bios configuration you can
>> generally select iGPU or PEG for the primary display.
>
> UEFI spec, 10.3.3.1 ACPI _ADR Device Path
>
> "The _ADR device path is used to contain video output device attribute=
s to=20
> support the Graphics Output Protocol. The device path can contain mult=
iple _ADR=20
> entries if multiple video output devices are displaying the same outpu=
t."
>
> Luke, can you please see what are the _ADR values of the iGPU and dGPU=
?=20
> Maybe we=20
> can find which one was used by GOP this way.

I'm not sure what I'm looking at here, but initial search shows:

                Device (VGA)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (DOSA, Zero)
                    Method (_DOS, 1, NotSerialized)  // _DOS: Disable Ou=
tput Switching
                    {
                        DOSA =3D Arg0
                    }

                    Method (_DOD, 0, NotSerialized)  // _DOD: Display Ou=
tput Devices
                    {
                        M460 ("PLA-ASL-\\_SB.PCI0.GPPA.VGA._DOD\n", Zero=
, Zero, Zero, Zero, Zero, Zero)
                        Return (Package (0x07)
                        {
                            0x00010110,=20
                            0x00010210,=20
                            0x00010220,=20
                            0x00010230,=20
                            0x00010240,=20
                            0x00031000,=20
                            0x00032000
                        })
                    }

                    Device (LCD)
                    {
                        Name (_ADR, 0x0110)  // _ADR: Address
                        Name (BCLB, Package (0x34)
                        {

https://gitlab.com/asus-linux/reverse-engineering/-/blob/master/uncatego=
rized/GA605WI/dsdt.dsl?ref_type=3Dheads#L4666

And:

            Method (_DOD, 0, NotSerialized)  // _DOD: Display Output Dev=
ices
            {
                Return (Package (0x01)
                {
                    0x8000A450
                })
            }

            Device (LCD0)
            {
                Method (_ADR, 0, Serialized)  // _ADR: Address
                {
                    Return (0x8000A450)
                }

https://gitlab.com/asus-linux/reverse-engineering/-/blob/master/uncatego=
rized/GA605WI/ssdt1.dsl?ref_type=3Dheads#L411

The links are direct to the lines I thought were relevant in the dumped =
DSDT.

Luke.

>
> Kai-Heng
>
>>=20
>> Alex
>>=20
>>>
>>> Kai-Heng
>>>
>>>>
>>>> Alex
>>>>
>>>>>
>>>>> Kai-Heng
>>>>>
>>>>>>
>>>>>> Alex
>>>>>>
>>>>>>>             /*
>>>>>>>              * Vgadev has neither IO nor MEM enabled.  If we hav=
en't found any
>>>>>>>              * other VGA devices, it is the best candidate so fa=
r.
>>>>>>>
>>>>>>>
>>>>>>> Kai-Heng
>>>>>>>
>>>>>>>>
>>>>>>>> Tested-by: Luke D. Jones <luke@ljones.dev>
>>>>>>>
>>>>>
>>>
