Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 884009AC193
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 10:28:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2A8410E790;
	Wed, 23 Oct 2024 08:28:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ljones.dev header.i=@ljones.dev header.b="EnqjKD4/";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="PlEBN4IM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh-a2-smtp.messagingengine.com
 (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B34B910E790
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 08:28:12 +0000 (UTC)
Received: from phl-compute-08.internal (phl-compute-08.phl.internal
 [10.202.2.48])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 3487B1140135;
 Wed, 23 Oct 2024 04:28:11 -0400 (EDT)
Received: from phl-imap-01 ([10.202.2.91])
 by phl-compute-08.internal (MEProxy); Wed, 23 Oct 2024 04:28:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm1; t=1729672091;
 x=1729758491; bh=Q99IEpRDwsQRu7/QpTx/OJI3t5lg9MCdu26wf4vKknI=; b=
 EnqjKD4/h8D8/l8WZO46e1ElVhjhcQDKpVSnLJ4BfRgbMrYVais8akyr2U0692ep
 zMF/JdT+kXwg2fHKWqHW8FYFdEx+3UBA6C31pNk8ff+XCnwGoC1rXiYhSSjUttI8
 x7MQA5xNwb0snxIJDI5Mx5FzuKsPuLGAtnJnSqs2joKj1g5VBtdr2mxmPgL8wuhP
 ERJRnec2IKfeQRJslleQavu2h9dr8lzlLXyumZHGSUpXSPyrKvNmHRr0BBqiVhSp
 xGLFFBHaR0vrTCGcaDArcNpn/c23Fdv0mvtA11MbN8HzZe24XsOejJUjJ4KYyB2W
 gNC646+qFkp8rWbhehFd1Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1729672091; x=
 1729758491; bh=Q99IEpRDwsQRu7/QpTx/OJI3t5lg9MCdu26wf4vKknI=; b=P
 lEBN4IM0J23/qTbvz4rnlNKapBm7qpFJCi2v1jIGUeXo8v/Oo502wwWIni7QD8Rc
 /n7kGuV2lGK4e9K5lhd64jRt00qmuD+RfxwARO971otT/xatnki+H4KLp21Xue2Q
 EnPbg1WuY74JV5w3zAG9EN9PfuwPS3/dhyzTIkEakF82mfxakotybWQjM2dmSWaL
 vH8A0J9fGN7Q5vx3y3mn5BJ+6hlw7kHnj/yGbdJTQi5fBFoLOTkwZgFqOeEzuQfS
 uojC6CFqeWPcqYi6GUag5n26pTY5TEFJEMMGDtmsFQXp1DYRDmr8L2Wj3tT0ubly
 HQ+GLctbYgPsqI1/vDk/g==
X-ME-Sender: <xms:mrMYZyKXUiDaKpV8SNe7SHC26_seOY_U8VcRGh8j24R3l-iTLcSJLQ>
 <xme:mrMYZ6IBQQ7R5vAobb7NNcRMOUEik4QhTS0dL0u-Rv9IS_GDbtiBhyXJICbWRgwGl
 nKOAOqYuH_Fja-6GWc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdeijedgtdefucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:mrMYZyuW3W0ma7h3VYDAUpt35VMBgnhLeQd_7vLkh_KOfMCG5wanuQ>
 <xmx:mrMYZ3b-ytoP3tvYoZ9oqvhzjW_h3Itluae8uXJbd_8FZSbB185aYg>
 <xmx:mrMYZ5YgGK7kE0WuxIaxBWGt_MpPh8oyeEBLWrwrfrKDgs5vOUdezQ>
 <xmx:mrMYZzBAu2wV-Swtd5bfuvdCmTgiEQIsR6YeSXgp-gynqN2OJSqhWQ>
 <xmx:m7MYZ144VpCsV5mA50Qdc7OjWgQHdGVdEeDnvFwarLP58Z4SX_FOneCZ>
Feedback-ID: i5ec1447f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id C3E47336007C; Wed, 23 Oct 2024 04:28:10 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Wed, 23 Oct 2024 10:27:49 +0200
From: "Luke Jones" <luke@ljones.dev>
To: "Kai-Heng Feng" <kaihengf@nvidia.com>,
 "Alex Deucher" <alexdeucher@gmail.com>
Cc: "Mario Limonciello" <superm1@kernel.org>,
 "Bjorn Helgaas" <bhelgaas@google.com>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 "open list" <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 "Mario Limonciello" <mario.limonciello@amd.com>,
 "Alex Deucher" <alexander.deucher@amd.com>
Message-Id: <eef7035c-2ffc-485f-b123-fffd3719be28@app.fastmail.com>
In-Reply-To: <fd7cae9a-5ee1-4e18-915d-4115f0a6a156@nvidia.com>
References: <20241014152502.1477809-1-superm1@kernel.org>
 <20b48c6f-7ea9-4571-a39c-f20a9cf62319@app.fastmail.com>
 <f56c555f-7313-43ff-abe4-28fb246e31cc@nvidia.com>
 <CADnq5_OjfJzcOqa=NbWVw5ENvi+nmvNAZX0u_0hOvk3EVoh0bw@mail.gmail.com>
 <fd7cae9a-5ee1-4e18-915d-4115f0a6a156@nvidia.com>
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



On Wed, 23 Oct 2024, at 3:27 AM, Kai-Heng Feng wrote:
> On 2024/10/22 9:04 PM, Alex Deucher wrote:
>> External email: Use caution opening links or attachments
>>=20
>>=20
>> On Tue, Oct 22, 2024 at 2:31=E2=80=AFAM Kai-Heng Feng <kaihengf@nvidi=
a.com> wrote:
>>>
>>> Hi Luke,
>>>
>>> On 2024/10/15 4:04 PM, Luke Jones wrote:
>>>> On Mon, 14 Oct 2024, at 5:25 PM, Mario Limonciello wrote:
>>>>> From: Mario Limonciello <mario.limonciello@amd.com>
>>>>>
>>>>> The ASUS GA605W has a NVIDIA PCI VGA device and an AMD PCI display=
 device.
>>>>>
>>>>> ```
>>>>> 65:00.0 VGA compatible controller: NVIDIA Corporation AD106M [GeFo=
rce
>>>>> RTX 4070 Max-Q / Mobile] (rev a1)
>>>>> 66:00.0 Display controller: Advanced Micro Devices, Inc. [AMD/ATI]
>>>>> Strix [Radeon 880M / 890M] (rev c1)
>>>>> ```
>>>>>
>>>>> The fallback logic in vga_is_boot_device() flags the NVIDIA dGPU a=
s the
>>>>> boot VGA device, but really the eDP is connected to the AMD PCI di=
splay
>>>>> device.
>>>>>
>>>>> Drop this case to avoid marking the NVIDIA dGPU as the boot VGA de=
vice.
>>>>>
>>>>> Suggested-by: Alex Deucher <alexander.deucher@amd.com>
>>>>> Reported-by: Luke D. Jones <luke@ljones.dev>
>>>>> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3673
>>>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>>>> ---
>>>>>    drivers/pci/vgaarb.c | 7 -------
>>>>>    1 file changed, 7 deletions(-)
>>>>>
>>>>> diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
>>>>> index 78748e8d2dba..05ac2b672d4b 100644
>>>>> --- a/drivers/pci/vgaarb.c
>>>>> +++ b/drivers/pci/vgaarb.c
>>>>> @@ -675,13 +675,6 @@ static bool vga_is_boot_device(struct vga_dev=
ice *vgadev)
>>>>>               return true;
>>>>>       }
>>>>>
>>>>> -    /*
>>>>> -     * Vgadev has neither IO nor MEM enabled.  If we haven't foun=
d any
>>>>> -     * other VGA devices, it is the best candidate so far.
>>>>> -     */
>>>>> -    if (!boot_vga)
>>>>> -            return true;
>>>>> -
>>>>>       return false;
>>>>>    }
>>>>>
>>>>> --
>>>>> 2.43.0
>>>>
>>>> Hi Mario,
>>>>
>>>> I can verify that this does leave the `boot_vga` attribute set as 0=
 for the NVIDIA device.
>>>
>>> Does the following diff work for you?
>>> This variant should be less risky for most systems.
>>>
>>> diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
>>> index 78748e8d2dba..3fb734cb9c1b 100644
>>> --- a/drivers/pci/vgaarb.c
>>> +++ b/drivers/pci/vgaarb.c
>>> @@ -675,6 +675,9 @@ static bool vga_is_boot_device(struct vga_device=
 *vgadev)
>>>                   return true;
>>>           }
>>>
>>> +       if (vga_arb_integrated_gpu(&pdev->dev))
>>> +               return true;
>>> +
>>=20
>> The problem is that the integrated graphics does not support VGA.
>
> Right, so the check has to be used much earlier.
>
> I wonder does the integrated GFX have _DOD/_DOS while the discrete one=
 doesn't?=20
> If that's the case, vga_arb_integrated_gpu() can be used to differenti=
ate which=20
> one is the boot GFX.

Discrete might be missing the _DOS? I'm not sure how to interpret the gp=
u related DSL. You can see the dump here https://gitlab.com/asus-linux/r=
everse-engineering/-/tree/master/uncategorized/GA605WI?ref_type=3Dheads

ssdt1.dsl contains _DOD and looks to be the discrete unit, does not cont=
ain _DOS. the dsdt contains both under "Device (VGA)"

Regards,
Luke.

> Kai-Heng
>
>>=20
>> Alex
>>=20
>>>           /*
>>>            * Vgadev has neither IO nor MEM enabled.  If we haven't f=
ound any
>>>            * other VGA devices, it is the best candidate so far.
>>>
>>>
>>> Kai-Heng
>>>
>>>>
>>>> Tested-by: Luke D. Jones <luke@ljones.dev>
>>>
