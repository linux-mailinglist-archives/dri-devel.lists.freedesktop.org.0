Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8AB3392E2
	for <lists+dri-devel@lfdr.de>; Fri, 12 Mar 2021 17:17:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BFEE6E037;
	Fri, 12 Mar 2021 16:17:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF07A6E030
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 16:17:35 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id z8so7458542ljm.12
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 08:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qtec.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=prrycCAyjpXO1sz+gbPPPtM0kLBCWyWmwvPCqn+xjf4=;
 b=dLnJriwcLiY4SKvzWCOd2x3Frl1VKoPcE+bq1BnMUjDmqAUVvSUhPDs3N4SJWtL4Vg
 S2GmH3hRNXQoZ7SssiLXommaDxBpb/NKqXk1RzX630ez+CQU6I8esUNCBFgH1dvmPH+k
 2n+deBc//FgnCjeB/91JBrjO4kEPeA4/7LoEkeia098COIePNq7ZldYkcQADe8V/VKZX
 Qsx183AphSXxdcuQe1uDgE0SwXWALHp13q9E+5uAG5YIGpTZNMGO0e9lP6IT83LY81ya
 JvV9wr7IIMhvQlBnoTF0MkiDi0BGD88qenrMsj4VSBg5PaHBFCPW2NXRW9+wVdfIZTfM
 j9xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=prrycCAyjpXO1sz+gbPPPtM0kLBCWyWmwvPCqn+xjf4=;
 b=p1j4kpo7sfPlMMTj4JRFnG875EZlLxu/OQMfkhI5ji/1UcnrfcenKZKY/zNYSlUiHc
 EXsLjx3w4TYcRo5mKOTTCOBQ3J2LeAf49OlKSHVEdvA9U8OhCWOiACeo/U4qlhkkZCuo
 OPJ5kQFt4ieySsriU+MYPYqYwDFIZqNWa+qqf2wmE8fFVLBu5FZA23EJqEXFxtcSLcuG
 Z6hdB15hYrRl208JwC9Ep39bW3pYGt67RkjFuFL3LIQt83pS0y4DEcDqmTxUXOv44P6y
 2lyVGAVmnkhh6XX1yKisKIrndfIbhsy8SrjgNLP+8ezfV96UnojcpJFnUn3Z2oih030b
 RzbA==
X-Gm-Message-State: AOAM532wVwX3o1E803YTe2JEIwwBDHACNonLk8sLnVptywHgLceU14jz
 RxBZAZK3yTukDY37NKvGVzO9IXp9Pbqg55D/u6Ql+g==
X-Google-Smtp-Source: ABdhPJwBwRWQ/0jxnO+8F7YWYkVKOvJjY2uQWr5retxBEJyyuyHjKuF306o5JZ3+ZsL72bC93wyoJ8GCyuzzHps4jCc=
X-Received: by 2002:a2e:557:: with SMTP id 84mr2850385ljf.480.1615565853991;
 Fri, 12 Mar 2021 08:17:33 -0800 (PST)
MIME-Version: 1.0
References: <20210310163655.2591893-1-daniel@qtec.com>
 <CADnq5_PmbXBaziCEqRODb_DvtKaw9ucXXjkdmdj9N_R8P-9Jcw@mail.gmail.com>
 <CAH1Ww+T4WwLzg_nnF=1sjm9LW9wCjFb0X9c=qmuubvMqJdW4PA@mail.gmail.com>
 <CAH1Ww+QiAyfQL_bf1u=zLiT=ayKFWA0Fr2n5sBHUxfpzxcPbrg@mail.gmail.com>
 <CAN22YZcnMzefgHu9FVPGEf73SKjar2tLJO-jvpYAqNJSH4F_qA@mail.gmail.com>
 <CADnq5_N0vvZZU9sNrfKSocXNzdMn8+PpVGNiPcE2XC6OkmJmwA@mail.gmail.com>
 <CAH1Ww+SLckpBjiH=6FOMoougjAfqWzO45qYoD1bb6s_fy=dr3A@mail.gmail.com>
In-Reply-To: <CAH1Ww+SLckpBjiH=6FOMoougjAfqWzO45qYoD1bb6s_fy=dr3A@mail.gmail.com>
From: Daniel Gomez <daniel@qtec.com>
Date: Fri, 12 Mar 2021 17:17:22 +0100
Message-ID: <CAH1Ww+R3xmZa2fE5mB4HBkn+XnHNX+jxZVcc_bLm00jY=ZdtAQ@mail.gmail.com>
Subject: Re: [PATCH]] drm/amdgpu/gfx9: add gfxoff quirk
To: Alex Deucher <alexdeucher@gmail.com>
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
Cc: Evan Quan <evan.quan@amd.com>, linux-media <linux-media@vger.kernel.org>,
 Guchun Chen <guchun.chen@amd.com>, David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Nirmoy Das <nirmoy.das@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Huang Rui <ray.huang@amd.com>, Monk Liu <Monk.Liu@amd.com>,
 Alexandre Desnoyers <alex@qtec.com>, Alex Deucher <alexander.deucher@amd.com>,
 Yintian Tao <yttao@amd.com>, Dennis Li <Dennis.Li@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: multipart/mixed; boundary="===============0212012516=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0212012516==
Content-Type: multipart/alternative; boundary="000000000000d6b6a905bd593c04"

--000000000000d6b6a905bd593c04
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 11 Mar 2021 at 21:00, Daniel Gomez <daniel@qtec.com> wrote:

> On Thu, 11 Mar 2021 at 17:10, Alex Deucher <alexdeucher@gmail.com> wrote:
> >
> > On Thu, Mar 11, 2021 at 10:02 AM Alexandre Desnoyers <alex@qtec.com>
> wrote:
> > >
> > > On Thu, Mar 11, 2021 at 2:49 PM Daniel Gomez <daniel@qtec.com> wrote:
> > > >
> > > > On Thu, 11 Mar 2021 at 10:09, Daniel Gomez <daniel@qtec.com> wrote:
> > > > >
> > > > > On Wed, 10 Mar 2021 at 18:06, Alex Deucher <alexdeucher@gmail.com=
>
> wrote:
> > > > > >
> > > > > > On Wed, Mar 10, 2021 at 11:37 AM Daniel Gomez <daniel@qtec.com>
> wrote:
> > > > > > >
> > > > > > > Disabling GFXOFF via the quirk list fixes a hardware lockup i=
n
> > > > > > > Ryzen V1605B, RAVEN 0x1002:0x15DD rev 0x83.
> > > > > > >
> > > > > > > Signed-off-by: Daniel Gomez <daniel@qtec.com>
> > > > > > > ---
> > > > > > >
> > > > > > > This patch is a continuation of the work here:
> > > > > > > https://lkml.org/lkml/2021/2/3/122 where a hardware lockup
> was discussed and
> > > > > > > a dma_fence deadlock was provoke as a side effect. To
> reproduce the issue
> > > > > > > please refer to the above link.
> > > > > > >
> > > > > > > The hardware lockup was introduced in 5.6-rc1 for our
> particular revision as it
> > > > > > > wasn't part of the new blacklist. Before that, in kernel v5.5=
,
> this hardware was
> > > > > > > working fine without any hardware lock because the GFXOFF was
> actually disabled
> > > > > > > by the if condition for the CHIP_RAVEN case. So this patch,
> adds the 'Radeon
> > > > > > > Vega Mobile Series [1002:15dd] (rev 83)' to the blacklist to
> disable the GFXOFF.
> > > > > > >
> > > > > > > But besides the fix, I'd like to ask from where this revision
> comes from. Is it
> > > > > > > an ASIC revision or is it hardcoded in the VBIOS from our
> vendor? From what I
> > > > > > > can see, it comes from the ASIC and I wonder if somehow we ca=
n
> get an APU in the
> > > > > > > future, 'not blacklisted', with the same problem. Then, shoul=
d
> this table only
> > > > > > > filter for the vendor and device and not the revision? Do you
> know if there are
> > > > > > > any revisions for the 1002:15dd validated, tested and
> functional?
> > > > > >
> > > > > > The pci revision id (RID) is used to specify the specific SKU
> within a
> > > > > > family.  GFXOFF is supposed to be working on all raven
> variants.  It
> > > > > > was tested and functional on all reference platforms and any OE=
M
> > > > > > platforms that launched with Linux support.  There are a lot of
> > > > > > dependencies on sbios in the early raven variants (0x15dd), so
> it's
> > > > > > likely more of a specific platform issue, but there is not a
> good way
> > > > > > to detect this so we use the DID/SSID/RID as a proxy.  The newe=
r
> raven
> > > > > > variants (0x15d8) have much better GFXOFF support since they al=
l
> > > > > > shipped with newer firmware and sbios.
> > > > >
> > > > > We took one of the first reference platform boards to design our
> > > > > custom board based on the V1605B and I assume it has one of the
> early 'unstable'
> > > > > raven variants with RID 0x83. Also, as OEM we are in control of
> the bios
> > > > > (provided by insyde) but I wasn't sure about the RID so, thanks
> for the
> > > > > clarification. Is there anything we can do with the bios to have
> the GFXOFF
> > > > > enabled and 'stable' for this particular revision? Otherwise we'd
> need to add
> > > > > the 0x83 RID to the table. Also, there is an extra ']' in the pat=
ch
> > > > > subject. Sorry
> > > > > for that. Would you need a new patch in case you accept it with
> the ']' removed?
> > > > >
> > > > > Good to hear that the newer raven versions have better GFXOFF
> support.
> > > >
> > > > Adding Alex Desnoyer to the loop as he is the electronic/hardware a=
nd
> > > > bios responsible so, he can
> > > > provide more information about this.
> > >
> > > Hello everyone,
> > >
> > > We, Qtechnology, are the OEM of the hardware platform where we
> > > originally discovered the bug.  Our platform is based on the AMD
> > > Dibbler V-1000 reference design, with the latest Insyde BIOS release
> > > available for the (now unsupported) Dibbler platform.  We have the
> > > Insyde BIOS source code internally, so we can make some modifications
> > > as needed.
> > >
> > > The last test that Daniel and myself performed was on a standard
> > > Dibbler PCB rev.B1 motherboard (NOT our platform), and using the
> > > corresponding latest AMD released BIOS "RDB1109GA".  As Daniel wrote,
> > > the hardware lockup can be reproduced on the Dibbler, even if it has =
a
> > > different RID that our V1605B APU.
> > >
> > > We also have a Neousys Technology POC-515 embedded computer (V-1000,
> > > V1605B) in our office.  The Neousys PC also uses Insyde BIOS.  This
> > > computer is also locking-up in the test.
> > >
> https://www.neousys-tech.com/en/product/application/rugged-embedded/poc-5=
00-amd-ryzen-ultra-compact-embedded-computer
> > >
> > >
> > > Digging into the BIOS source code, the only reference to GFXOFF is in
> > > the SMU and PSP firmware release notes, where some bug fixes have bee=
n
> > > mentioned for previous SMU/PSP releases.  After a quick "git grep -i
> > > gfx | grep -i off", there seems to be no mention of GFXOFF in the
> > > Insyde UEFI (inluding AMD PI) code base.  I would appreciate any
> > > information regarding BIOS modification needed to make the GFXOFF
> > > feature stable.  As you (Alex Deucher) mentionned, it should be
> > > functional on all AMD Raven reference platforms.
> > >
> >
> > It's handled by the firmwares carried by the sbios.  I'm not sure what
> > versions off hand.  Probably want to make sure you have the latest
> > ones.  Do you have an AMD partner contact?  It might be best to bring
> > this up with them.
> I'm sure we were using the latest but let us double-check with our
> AMD partner and insyde just in case.
> >
> > Regarding the issues you are seeing is this a general issue with all
> > workloads that use the GFX shader cores?  Or just specific workloads?
> > If it's just compute workloads, you might try this patch.  It may fix
> > the issue for you.
> Thanks Alex for the patch. I think it's kind of a general issue with all
> the
> workloads but the way we've been able to reproduce it was with the
> MatrixMultiplication test (from AMD) and clinfo. With the patch, I'm
> still able to reproduce the problem in our custom board. I'll check it
> tomorrow on the dribbler.
>
Quick update on this:
I've tested the patch on the dribbler and the hang also occurs. What
we are now trying to figure out if we actually have the latest bios
available for the V1605B (we think we do) but this might take a while
(already reported
to the AMD partner).
To add more info about our current bios:
Dibbler:
-  Version: RDB1109GA
-  AGESA version: RavenPi-FP5-AM4 1.1.0.9
-  VBIOS 0113
QT5222 (V1605B with Radeon Vega Gfx 8):
-  Version: 0.0.29
-  AGESA version: RavenPi-FP5-AM4 1.1.0.A
-  VBIOS 0115

Also, in the release notes for the latest amdgpu release available in the
amd support page
says: "Disable the GFXOFF for OpenCL(ROCm 3.8) usage as below in the grub.
Workaround: add =E2=80=9Camdgpu.ppfeaturemask=3D0xffff3fff=E2=80=9Din the g=
rub." which
confirms the issue.
https://drivers.amd.com/relnotes/linux_driver_2020.40_release_notes.pdf

My final question would be if we can/should add the patch as there are
other raven
devices already added with different revision 0x1002:0x15dd {0xc8,0xc6} or
we
should wait forAMD-partner confirmation to know if the bios/raven is buggy
or not.

>
> > Alex
> >
> >
> > >
> > > Regards,
> > >
> > > Alexandre Desnoyers
> > >
> > >
> > > >
> > > > I've now done a test on the reference platform (dibbler) with the
> > > > latest bios available
> > > > and the hw lockup can be also reproduced with the same steps.
> > > >
> > > > For reference, I'm using mainline kernel 5.12-rc2.
> > > >
> > > > [    5.938544] [drm] initializing kernel modesetting (RAVEN
> > > > 0x1002:0x15DD 0x1002:0x15DD 0xC1).
> > > > [    5.939942] amdgpu: ATOM BIOS: 113-RAVEN-11
> > > >
> > > > As in the previous cases, the clocks go to 100% of usage when the
> hang occurs.
> > > >
> > > > However, when the gpu hangs, dmesg output displays the following:
> > > >
> > > > [ 1568.279847] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx
> > > > timeout, signaled seq=3D188, emitted seq=3D191
> > > > [ 1568.434084] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process
> > > > information: process Xorg pid 311 thread Xorg:cs0 pid 312
> > > > [ 1568.279847] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx
> > > > timeout, signaled seq=3D188, emitted seq=3D191
> > > > [ 1568.434084] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process
> > > > information: process Xorg pid 311 thread Xorg:cs0 pid 312
> > > > [ 1568.507000] amdgpu 0000:01:00.0: amdgpu: GPU reset begin!
> > > > [ 1628.491882] rcu: INFO: rcu_sched self-detected stall on CPU
> > > > [ 1628.491882] rcu:     3-...!: (665 ticks this GP)
> > > > idle=3Df9a/1/0x4000000000000000 softirq=3D188533/188533 fqs=3D15
> > > > [ 1628.491882] rcu: rcu_sched kthread timer wakeup didn't happen fo=
r
> > > > 58497 jiffies! g726761 f0x0 RCU_GP_WAIT_FQS(5) ->state=3D0x402
> > > > [ 1628.491882] rcu:     Possible timer handling issue on cpu=3D2
> > > > timer-softirq=3D55225
> > > > [ 1628.491882] rcu: rcu_sched kthread starved for 58500 jiffies!
> > > > g726761 f0x0 RCU_GP_WAIT_FQS(5) ->state=3D0x402 ->cpu=3D2
> > > > [ 1628.491882] rcu:     Unless rcu_sched kthread gets sufficient CP=
U
> > > > time, OOM is now expected behavior.
> > > > [ 1628.491882] rcu: RCU grace-period kthread stack dump:
> > > > [ 1628.491882] rcu: Stack dump where RCU GP kthread last ran:
> > > > [ 1808.518445] rcu: INFO: rcu_sched self-detected stall on CPU
> > > > [ 1808.518445] rcu:     3-...!: (2643 ticks this GP)
> > > > idle=3Df9a/1/0x4000000000000000 softirq=3D188533/188533 fqs=3D15
> > > > [ 1808.518445] rcu: rcu_sched kthread starved for 238526 jiffies!
> > > > g726761 f0x0 RCU_GP_WAIT_FQS(5) ->state=3D0x0 ->cpu=3D2
> > > > [ 1808.518445] rcu:     Unless rcu_sched kthread gets sufficient CP=
U
> > > > time, OOM is now expected behavior.
> > > > [ 1808.518445] rcu: RCU grace-period kthread stack dump:
> > > > [ 1808.518445] rcu: Stack dump where RCU GP kthread last ran:
> > > >
> > > > >
> > > > > Daniel
> > > > >
> > > > > >
> > > > > > Alex
> > > > > >
> > > > > >
> > > > > > >
> > > > > > > Logs:
> > > > > > > [   27.708348] [drm] initializing kernel modesetting (RAVEN
> > > > > > > 0x1002:0x15DD 0x1002:0x15DD 0x83).
> > > > > > > [   27.789156] amdgpu: ATOM BIOS: 113-RAVEN-115
> > > > > > >
> > > > > > > Thanks in advance,
> > > > > > > Daniel
> > > > > > >
> > > > > > >  drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c | 2 ++
> > > > > > >  1 file changed, 2 insertions(+)
> > > > > > >
> > > > > > > diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> > > > > > > index 65db88bb6cbc..319d4b99aec8 100644
> > > > > > > --- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> > > > > > > +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> > > > > > > @@ -1243,6 +1243,8 @@ static const struct amdgpu_gfxoff_quirk
> amdgpu_gfxoff_quirk_list[] =3D {
> > > > > > >         { 0x1002, 0x15dd, 0x103c, 0x83e7, 0xd3 },
> > > > > > >         /* GFXOFF is unstable on C6 parts with a VBIOS
> 113-RAVEN-114 */
> > > > > > >         { 0x1002, 0x15dd, 0x1002, 0x15dd, 0xc6 },
> > > > > > > +       /* GFXOFF provokes a hw lockup on 83 parts with a
> VBIOS 113-RAVEN-115 */
> > > > > > > +       { 0x1002, 0x15dd, 0x1002, 0x15dd, 0x83 },
> > > > > > >         { 0, 0, 0, 0, 0 },
> > > > > > >  };
> > > > > > >
> > > > > > > --
> > > > > > > 2.30.1
> > > > > > >
> > > > > > > _______________________________________________
> > > > > > > dri-devel mailing list
> > > > > > > dri-devel@lists.freedesktop.org
> > > > > > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>

--000000000000d6b6a905bd593c04
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, 11 Mar 2021 at 21:00, Daniel =
Gomez &lt;<a href=3D"mailto:daniel@qtec.com" target=3D"_blank">daniel@qtec.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">On Thu, 11 Mar 2021 at 17:10, Alex Deucher &lt;<a href=3D"mailto:alexdeu=
cher@gmail.com" target=3D"_blank">alexdeucher@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Thu, Mar 11, 2021 at 10:02 AM Alexandre Desnoyers &lt;<a href=3D"ma=
ilto:alex@qtec.com" target=3D"_blank">alex@qtec.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; On Thu, Mar 11, 2021 at 2:49 PM Daniel Gomez &lt;<a href=3D"mailt=
o:daniel@qtec.com" target=3D"_blank">daniel@qtec.com</a>&gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Thu, 11 Mar 2021 at 10:09, Daniel Gomez &lt;<a href=3D"ma=
ilto:daniel@qtec.com" target=3D"_blank">daniel@qtec.com</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; On Wed, 10 Mar 2021 at 18:06, Alex Deucher &lt;<a href=
=3D"mailto:alexdeucher@gmail.com" target=3D"_blank">alexdeucher@gmail.com</=
a>&gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; On Wed, Mar 10, 2021 at 11:37 AM Daniel Gomez &lt;=
<a href=3D"mailto:daniel@qtec.com" target=3D"_blank">daniel@qtec.com</a>&gt=
; wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Disabling GFXOFF via the quirk list fixes a h=
ardware lockup in<br>
&gt; &gt; &gt; &gt; &gt; &gt; Ryzen V1605B, RAVEN 0x1002:0x15DD rev 0x83.<b=
r>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Signed-off-by: Daniel Gomez &lt;<a href=3D"ma=
ilto:daniel@qtec.com" target=3D"_blank">daniel@qtec.com</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; This patch is a continuation of the work here=
:<br>
&gt; &gt; &gt; &gt; &gt; &gt; <a href=3D"https://lkml.org/lkml/2021/2/3/122=
" rel=3D"noreferrer" target=3D"_blank">https://lkml.org/lkml/2021/2/3/122</=
a> where a hardware lockup was discussed and<br>
&gt; &gt; &gt; &gt; &gt; &gt; a dma_fence deadlock was provoke as a side ef=
fect. To reproduce the issue<br>
&gt; &gt; &gt; &gt; &gt; &gt; please refer to the above link.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; The hardware lockup was introduced in 5.6-rc1=
 for our particular revision as it<br>
&gt; &gt; &gt; &gt; &gt; &gt; wasn&#39;t part of the new blacklist. Before =
that, in kernel v5.5, this hardware was<br>
&gt; &gt; &gt; &gt; &gt; &gt; working fine without any hardware lock becaus=
e the GFXOFF was actually disabled<br>
&gt; &gt; &gt; &gt; &gt; &gt; by the if condition for the CHIP_RAVEN case. =
So this patch, adds the &#39;Radeon<br>
&gt; &gt; &gt; &gt; &gt; &gt; Vega Mobile Series [1002:15dd] (rev 83)&#39; =
to the blacklist to disable the GFXOFF.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; But besides the fix, I&#39;d like to ask from=
 where this revision comes from. Is it<br>
&gt; &gt; &gt; &gt; &gt; &gt; an ASIC revision or is it hardcoded in the VB=
IOS from our vendor? From what I<br>
&gt; &gt; &gt; &gt; &gt; &gt; can see, it comes from the ASIC and I wonder =
if somehow we can get an APU in the<br>
&gt; &gt; &gt; &gt; &gt; &gt; future, &#39;not blacklisted&#39;, with the s=
ame problem. Then, should this table only<br>
&gt; &gt; &gt; &gt; &gt; &gt; filter for the vendor and device and not the =
revision? Do you know if there are<br>
&gt; &gt; &gt; &gt; &gt; &gt; any revisions for the 1002:15dd validated, te=
sted and functional?<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; The pci revision id (RID) is used to specify the s=
pecific SKU within a<br>
&gt; &gt; &gt; &gt; &gt; family.=C2=A0 GFXOFF is supposed to be working on =
all raven variants.=C2=A0 It<br>
&gt; &gt; &gt; &gt; &gt; was tested and functional on all reference platfor=
ms and any OEM<br>
&gt; &gt; &gt; &gt; &gt; platforms that launched with Linux support.=C2=A0 =
There are a lot of<br>
&gt; &gt; &gt; &gt; &gt; dependencies on sbios in the early raven variants =
(0x15dd), so it&#39;s<br>
&gt; &gt; &gt; &gt; &gt; likely more of a specific platform issue, but ther=
e is not a good way<br>
&gt; &gt; &gt; &gt; &gt; to detect this so we use the DID/SSID/RID as a pro=
xy.=C2=A0 The newer raven<br>
&gt; &gt; &gt; &gt; &gt; variants (0x15d8) have much better GFXOFF support =
since they all<br>
&gt; &gt; &gt; &gt; &gt; shipped with newer firmware and sbios.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; We took one of the first reference platform boards to d=
esign our<br>
&gt; &gt; &gt; &gt; custom board based on the V1605B and I assume it has on=
e of the early &#39;unstable&#39;<br>
&gt; &gt; &gt; &gt; raven variants with RID 0x83. Also, as OEM we are in co=
ntrol of the bios<br>
&gt; &gt; &gt; &gt; (provided by insyde) but I wasn&#39;t sure about the RI=
D so, thanks for the<br>
&gt; &gt; &gt; &gt; clarification. Is there anything we can do with the bio=
s to have the GFXOFF<br>
&gt; &gt; &gt; &gt; enabled and &#39;stable&#39; for this particular revisi=
on? Otherwise we&#39;d need to add<br>
&gt; &gt; &gt; &gt; the 0x83 RID to the table. Also, there is an extra &#39=
;]&#39; in the patch<br>
&gt; &gt; &gt; &gt; subject. Sorry<br>
&gt; &gt; &gt; &gt; for that. Would you need a new patch in case you accept=
 it with the &#39;]&#39; removed?<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Good to hear that the newer raven versions have better =
GFXOFF support.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Adding Alex Desnoyer to the loop as he is the electronic/har=
dware and<br>
&gt; &gt; &gt; bios responsible so, he can<br>
&gt; &gt; &gt; provide more information about this.<br>
&gt; &gt;<br>
&gt; &gt; Hello everyone,<br>
&gt; &gt;<br>
&gt; &gt; We, Qtechnology, are the OEM of the hardware platform where we<br=
>
&gt; &gt; originally discovered the bug.=C2=A0 Our platform is based on the=
 AMD<br>
&gt; &gt; Dibbler V-1000 reference design, with the latest Insyde BIOS rele=
ase<br>
&gt; &gt; available for the (now unsupported) Dibbler platform.=C2=A0 We ha=
ve the<br>
&gt; &gt; Insyde BIOS source code internally, so we can make some modificat=
ions<br>
&gt; &gt; as needed.<br>
&gt; &gt;<br>
&gt; &gt; The last test that Daniel and myself performed was on a standard<=
br>
&gt; &gt; Dibbler PCB rev.B1 motherboard (NOT our platform), and using the<=
br>
&gt; &gt; corresponding latest AMD released BIOS &quot;RDB1109GA&quot;.=C2=
=A0 As Daniel wrote,<br>
&gt; &gt; the hardware lockup can be reproduced on the Dibbler, even if it =
has a<br>
&gt; &gt; different RID that our V1605B APU.<br>
&gt; &gt;<br>
&gt; &gt; We also have a Neousys Technology POC-515 embedded computer (V-10=
00,<br>
&gt; &gt; V1605B) in our office.=C2=A0 The Neousys PC also uses Insyde BIOS=
.=C2=A0 This<br>
&gt; &gt; computer is also locking-up in the test.<br>
&gt; &gt; <a href=3D"https://www.neousys-tech.com/en/product/application/ru=
gged-embedded/poc-500-amd-ryzen-ultra-compact-embedded-computer" rel=3D"nor=
eferrer" target=3D"_blank">https://www.neousys-tech.com/en/product/applicat=
ion/rugged-embedded/poc-500-amd-ryzen-ultra-compact-embedded-computer</a><b=
r>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Digging into the BIOS source code, the only reference to GFXOFF i=
s in<br>
&gt; &gt; the SMU and PSP firmware release notes, where some bug fixes have=
 been<br>
&gt; &gt; mentioned for previous SMU/PSP releases.=C2=A0 After a quick &quo=
t;git grep -i<br>
&gt; &gt; gfx | grep -i off&quot;, there seems to be no mention of GFXOFF i=
n the<br>
&gt; &gt; Insyde UEFI (inluding AMD PI) code base.=C2=A0 I would appreciate=
 any<br>
&gt; &gt; information regarding BIOS modification needed to make the GFXOFF=
<br>
&gt; &gt; feature stable.=C2=A0 As you (Alex Deucher) mentionned, it should=
 be<br>
&gt; &gt; functional on all AMD Raven reference platforms.<br>
&gt; &gt;<br>
&gt;<br>
&gt; It&#39;s handled by the firmwares carried by the sbios.=C2=A0 I&#39;m =
not sure what<br>
&gt; versions off hand.=C2=A0 Probably want to make sure you have the lates=
t<br>
&gt; ones.=C2=A0 Do you have an AMD partner contact?=C2=A0 It might be best=
 to bring<br>
&gt; this up with them.<br>
I&#39;m sure we were using the latest but let us double-check with our<br>
AMD partner and insyde just in case.<br>
&gt;<br>
&gt; Regarding the issues you are seeing is this a general issue with all<b=
r>
&gt; workloads that use the GFX shader cores?=C2=A0 Or just specific worklo=
ads?<br>
&gt; If it&#39;s just compute workloads, you might try this patch.=C2=A0 It=
 may fix<br>
&gt; the issue for you.<br>
Thanks Alex for the patch. I think it&#39;s kind of a general issue with al=
l the<br>
workloads but the way we&#39;ve been able to reproduce it was with the<br>
MatrixMultiplication test (from AMD) and clinfo. With the patch, I&#39;m<br=
>
still able to reproduce the problem in our custom board. I&#39;ll check it<=
br>
tomorrow on the dribbler.<br></blockquote><div>Quick update on this:</div><=
div>I&#39;ve tested the patch on the dribbler and the hang also occurs. Wha=
t</div><div>we are now trying to figure out if we actually have the latest =
bios</div><div>available for the V1605B (we think we do) but this might tak=
e a while (already reported</div><div>to the AMD partner).<br></div><div>To=
 add more info about our current bios:</div><div>Dibbler: <br></div><div>-=
=C2=A0 Version: RDB1109GA</div><div>-=C2=A0 AGESA version: RavenPi-FP5-AM4 =
1.1.0.9</div><div>-=C2=A0 VBIOS 0113</div><div>QT5222 (V1605B with Radeon V=
ega Gfx 8):</div><div>-=C2=A0 Version: 0.0.29<div>-=C2=A0 AGESA version: Ra=
venPi-FP5-AM4 1.1.0.A</div><div>-=C2=A0 VBIOS 0115</div><div><br></div><div=
>Also, in the release notes for the latest amdgpu release available in the =
amd support page</div><div>says: &quot;Disable the GFXOFF for OpenCL(ROCm 3=
.8) usage as below in the grub.</div><div>Workaround: add =E2=80=9Camdgpu.p=
pfeaturemask=3D0xffff3fff=E2=80=9Din the grub.&quot; which confirms the iss=
ue.<br></div><div><a href=3D"https://drivers.amd.com/relnotes/linux_driver_=
2020.40_release_notes.pdf">https://drivers.amd.com/relnotes/linux_driver_20=
20.40_release_notes.pdf</a></div><div><br></div>My final question would be =
if we can/should add the patch as there are other raven</div><div>devices a=
lready added with different revision 0x1002:0x15dd {0xc8,0xc6} or we <br></=
div><div>should wait forAMD-partner confirmation to know if the bios/raven =
is buggy or not.</div><div><div><br></div></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
&gt;<br>
&gt; Alex<br>
&gt;<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; Regards,<br>
&gt; &gt;<br>
&gt; &gt; Alexandre Desnoyers<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I&#39;ve now done a test on the reference platform (dibbler)=
 with the<br>
&gt; &gt; &gt; latest bios available<br>
&gt; &gt; &gt; and the hw lockup can be also reproduced with the same steps=
.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; For reference, I&#39;m using mainline kernel 5.12-rc2.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; [=C2=A0 =C2=A0 5.938544] [drm] initializing kernel modesetti=
ng (RAVEN<br>
&gt; &gt; &gt; 0x1002:0x15DD 0x1002:0x15DD 0xC1).<br>
&gt; &gt; &gt; [=C2=A0 =C2=A0 5.939942] amdgpu: ATOM BIOS: 113-RAVEN-11<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; As in the previous cases, the clocks go to 100% of usage whe=
n the hang occurs.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; However, when the gpu hangs, dmesg output displays the follo=
wing:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; [ 1568.279847] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ri=
ng gfx<br>
&gt; &gt; &gt; timeout, signaled seq=3D188, emitted seq=3D191<br>
&gt; &gt; &gt; [ 1568.434084] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Pr=
ocess<br>
&gt; &gt; &gt; information: process Xorg pid 311 thread Xorg:cs0 pid 312<br=
>
&gt; &gt; &gt; [ 1568.279847] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ri=
ng gfx<br>
&gt; &gt; &gt; timeout, signaled seq=3D188, emitted seq=3D191<br>
&gt; &gt; &gt; [ 1568.434084] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Pr=
ocess<br>
&gt; &gt; &gt; information: process Xorg pid 311 thread Xorg:cs0 pid 312<br=
>
&gt; &gt; &gt; [ 1568.507000] amdgpu 0000:01:00.0: amdgpu: GPU reset begin!=
<br>
&gt; &gt; &gt; [ 1628.491882] rcu: INFO: rcu_sched self-detected stall on C=
PU<br>
&gt; &gt; &gt; [ 1628.491882] rcu:=C2=A0 =C2=A0 =C2=A03-...!: (665 ticks th=
is GP)<br>
&gt; &gt; &gt; idle=3Df9a/1/0x4000000000000000 softirq=3D188533/188533 fqs=
=3D15<br>
&gt; &gt; &gt; [ 1628.491882] rcu: rcu_sched kthread timer wakeup didn&#39;=
t happen for<br>
&gt; &gt; &gt; 58497 jiffies! g726761 f0x0 RCU_GP_WAIT_FQS(5) -&gt;state=3D=
0x402<br>
&gt; &gt; &gt; [ 1628.491882] rcu:=C2=A0 =C2=A0 =C2=A0Possible timer handli=
ng issue on cpu=3D2<br>
&gt; &gt; &gt; timer-softirq=3D55225<br>
&gt; &gt; &gt; [ 1628.491882] rcu: rcu_sched kthread starved for 58500 jiff=
ies!<br>
&gt; &gt; &gt; g726761 f0x0 RCU_GP_WAIT_FQS(5) -&gt;state=3D0x402 -&gt;cpu=
=3D2<br>
&gt; &gt; &gt; [ 1628.491882] rcu:=C2=A0 =C2=A0 =C2=A0Unless rcu_sched kthr=
ead gets sufficient CPU<br>
&gt; &gt; &gt; time, OOM is now expected behavior.<br>
&gt; &gt; &gt; [ 1628.491882] rcu: RCU grace-period kthread stack dump:<br>
&gt; &gt; &gt; [ 1628.491882] rcu: Stack dump where RCU GP kthread last ran=
:<br>
&gt; &gt; &gt; [ 1808.518445] rcu: INFO: rcu_sched self-detected stall on C=
PU<br>
&gt; &gt; &gt; [ 1808.518445] rcu:=C2=A0 =C2=A0 =C2=A03-...!: (2643 ticks t=
his GP)<br>
&gt; &gt; &gt; idle=3Df9a/1/0x4000000000000000 softirq=3D188533/188533 fqs=
=3D15<br>
&gt; &gt; &gt; [ 1808.518445] rcu: rcu_sched kthread starved for 238526 jif=
fies!<br>
&gt; &gt; &gt; g726761 f0x0 RCU_GP_WAIT_FQS(5) -&gt;state=3D0x0 -&gt;cpu=3D=
2<br>
&gt; &gt; &gt; [ 1808.518445] rcu:=C2=A0 =C2=A0 =C2=A0Unless rcu_sched kthr=
ead gets sufficient CPU<br>
&gt; &gt; &gt; time, OOM is now expected behavior.<br>
&gt; &gt; &gt; [ 1808.518445] rcu: RCU grace-period kthread stack dump:<br>
&gt; &gt; &gt; [ 1808.518445] rcu: Stack dump where RCU GP kthread last ran=
:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Daniel<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Alex<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Logs:<br>
&gt; &gt; &gt; &gt; &gt; &gt; [=C2=A0 =C2=A027.708348] [drm] initializing k=
ernel modesetting (RAVEN<br>
&gt; &gt; &gt; &gt; &gt; &gt; 0x1002:0x15DD 0x1002:0x15DD 0x83).<br>
&gt; &gt; &gt; &gt; &gt; &gt; [=C2=A0 =C2=A027.789156] amdgpu: ATOM BIOS: 1=
13-RAVEN-115<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Thanks in advance,<br>
&gt; &gt; &gt; &gt; &gt; &gt; Daniel<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c |=
 2 ++<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 1 file changed, 2 insertions(+)<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v=
9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c<br>
&gt; &gt; &gt; &gt; &gt; &gt; index 65db88bb6cbc..319d4b99aec8 100644<br>
&gt; &gt; &gt; &gt; &gt; &gt; --- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c<b=
r>
&gt; &gt; &gt; &gt; &gt; &gt; +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c<b=
r>
&gt; &gt; &gt; &gt; &gt; &gt; @@ -1243,6 +1243,8 @@ static const struct amd=
gpu_gfxoff_quirk amdgpu_gfxoff_quirk_list[] =3D {<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ 0x1002, 0x=
15dd, 0x103c, 0x83e7, 0xd3 },<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* GFXOFF is=
 unstable on C6 parts with a VBIOS 113-RAVEN-114 */<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ 0x1002, 0x=
15dd, 0x1002, 0x15dd, 0xc6 },<br>
&gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* GFXOFF provoke=
s a hw lockup on 83 parts with a VBIOS 113-RAVEN-115 */<br>
&gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{ 0x1002, 0x15dd,=
 0x1002, 0x15dd, 0x83 },<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ 0, 0, 0, 0=
, 0 },<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 };<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; &gt; &gt; 2.30.1<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; _____________________________________________=
__<br>
&gt; &gt; &gt; &gt; &gt; &gt; dri-devel mailing list<br>
&gt; &gt; &gt; &gt; &gt; &gt; <a href=3D"mailto:dri-devel@lists.freedesktop=
.org" target=3D"_blank">dri-devel@lists.freedesktop.org</a><br>
&gt; &gt; &gt; &gt; &gt; &gt; <a href=3D"https://lists.freedesktop.org/mail=
man/listinfo/dri-devel" rel=3D"noreferrer" target=3D"_blank">https://lists.=
freedesktop.org/mailman/listinfo/dri-devel</a><br>
</blockquote></div></div>

--000000000000d6b6a905bd593c04--

--===============0212012516==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0212012516==--
