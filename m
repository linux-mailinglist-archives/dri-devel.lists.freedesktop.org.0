Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBCA337484
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 14:49:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B38D6ECDD;
	Thu, 11 Mar 2021 13:49:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8A796ECAC
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 13:49:04 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id r3so31679166lfc.13
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 05:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qtec.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kNyayz1ynLaXs0RxPu12eHqwVdIQUw51jeFoThSwD7s=;
 b=eRB5p3RH481LNZAhm/BdCEnIjN0fQjiylPoxlKiHrNO22LBYvHH9Q0kIUpI89sSpYx
 yUf9zwDTiVhH5osACr7/m8BHm06jpOubzmhVd1qyYvwAZS2V5AcIRdACOYDEjSSAYHo3
 E0B+oCzBeZyByTIMR61sAlNcGiwspQdqisfYBTXlJmjLfffm5m6/2fFnfygbuCiJQYea
 CwWh5E6ZEPONTXXmx1ZIEl751jMFxVu1YxtNpKKnxFCdmfBa0SbRLQlnELpQf6s580aJ
 8zMuM5uGdUicXgGIVsoK7i6K3hCSrSAxxMuvZswSb/KL86W6U55Voin82601jcZiM3eB
 9ofw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kNyayz1ynLaXs0RxPu12eHqwVdIQUw51jeFoThSwD7s=;
 b=TymOf/iJYr714cxJKSfmiF+K7PBNORJK3fJrpb0dUtE1/XX/1JjIRg0mCx0HF6xQoC
 75d+4/aRa0aAN3OrnkTRFtf4yyPWZ8XRPReJFfA9OdSZwUZXLbjfUgsD4coeVWKQZT62
 adB6AeEDl2kQtHsX9zW6wVLRjO72ptOkOTmUlnw63ykCse7xaAp3EP7AJfDfa/qKpMeE
 pTWUZIxkXJRqO8sM2OBMlYmMFqxgv1LgWMPs5EYRadHriBsLSUvyTwPpjhpHPH3NhDTn
 b719zHsimkbSnUuZC4PTJ+Vqaao6i09zsOd9a88KbxitGdHgpZE2xP3R4aVMofXDnNl0
 ob8w==
X-Gm-Message-State: AOAM532GmL/e3cchTpMlQw9Ofm45XXDellqlC4u9z/9VxfKyc5ZmPmvy
 OVHhGBGKVfeJr6nmdaxEXz4tU3MRjSfsnhW6ngNOig==
X-Google-Smtp-Source: ABdhPJyu0O6KEYyFOIqFedvrhYJRkgEtRmSUTzgsPtEsSBxve03TOWrnzsX5ozRcSoMvpdMwkjBW+tyWp9QxReToZWg=
X-Received: by 2002:a05:6512:32ab:: with SMTP id
 q11mr2377230lfe.106.1615470542956; 
 Thu, 11 Mar 2021 05:49:02 -0800 (PST)
MIME-Version: 1.0
References: <20210310163655.2591893-1-daniel@qtec.com>
 <CADnq5_PmbXBaziCEqRODb_DvtKaw9ucXXjkdmdj9N_R8P-9Jcw@mail.gmail.com>
 <CAH1Ww+T4WwLzg_nnF=1sjm9LW9wCjFb0X9c=qmuubvMqJdW4PA@mail.gmail.com>
In-Reply-To: <CAH1Ww+T4WwLzg_nnF=1sjm9LW9wCjFb0X9c=qmuubvMqJdW4PA@mail.gmail.com>
From: Daniel Gomez <daniel@qtec.com>
Date: Thu, 11 Mar 2021 14:48:52 +0100
Message-ID: <CAH1Ww+QiAyfQL_bf1u=zLiT=ayKFWA0Fr2n5sBHUxfpzxcPbrg@mail.gmail.com>
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
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Huang Rui <ray.huang@amd.com>, Monk Liu <Monk.Liu@amd.com>,
 Alex Desnoyers <alex@qtec.com>, Alex Deucher <alexander.deucher@amd.com>,
 Yintian Tao <yttao@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Dennis Li <Dennis.Li@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 11 Mar 2021 at 10:09, Daniel Gomez <daniel@qtec.com> wrote:
>
> On Wed, 10 Mar 2021 at 18:06, Alex Deucher <alexdeucher@gmail.com> wrote:
> >
> > On Wed, Mar 10, 2021 at 11:37 AM Daniel Gomez <daniel@qtec.com> wrote:
> > >
> > > Disabling GFXOFF via the quirk list fixes a hardware lockup in
> > > Ryzen V1605B, RAVEN 0x1002:0x15DD rev 0x83.
> > >
> > > Signed-off-by: Daniel Gomez <daniel@qtec.com>
> > > ---
> > >
> > > This patch is a continuation of the work here:
> > > https://lkml.org/lkml/2021/2/3/122 where a hardware lockup was discussed and
> > > a dma_fence deadlock was provoke as a side effect. To reproduce the issue
> > > please refer to the above link.
> > >
> > > The hardware lockup was introduced in 5.6-rc1 for our particular revision as it
> > > wasn't part of the new blacklist. Before that, in kernel v5.5, this hardware was
> > > working fine without any hardware lock because the GFXOFF was actually disabled
> > > by the if condition for the CHIP_RAVEN case. So this patch, adds the 'Radeon
> > > Vega Mobile Series [1002:15dd] (rev 83)' to the blacklist to disable the GFXOFF.
> > >
> > > But besides the fix, I'd like to ask from where this revision comes from. Is it
> > > an ASIC revision or is it hardcoded in the VBIOS from our vendor? From what I
> > > can see, it comes from the ASIC and I wonder if somehow we can get an APU in the
> > > future, 'not blacklisted', with the same problem. Then, should this table only
> > > filter for the vendor and device and not the revision? Do you know if there are
> > > any revisions for the 1002:15dd validated, tested and functional?
> >
> > The pci revision id (RID) is used to specify the specific SKU within a
> > family.  GFXOFF is supposed to be working on all raven variants.  It
> > was tested and functional on all reference platforms and any OEM
> > platforms that launched with Linux support.  There are a lot of
> > dependencies on sbios in the early raven variants (0x15dd), so it's
> > likely more of a specific platform issue, but there is not a good way
> > to detect this so we use the DID/SSID/RID as a proxy.  The newer raven
> > variants (0x15d8) have much better GFXOFF support since they all
> > shipped with newer firmware and sbios.
>
> We took one of the first reference platform boards to design our
> custom board based on the V1605B and I assume it has one of the early 'unstable'
> raven variants with RID 0x83. Also, as OEM we are in control of the bios
> (provided by insyde) but I wasn't sure about the RID so, thanks for the
> clarification. Is there anything we can do with the bios to have the GFXOFF
> enabled and 'stable' for this particular revision? Otherwise we'd need to add
> the 0x83 RID to the table. Also, there is an extra ']' in the patch
> subject. Sorry
> for that. Would you need a new patch in case you accept it with the ']' removed?
>
> Good to hear that the newer raven versions have better GFXOFF support.

Adding Alex Desnoyer to the loop as he is the electronic/hardware and
bios responsible so, he can
provide more information about this.

I've now done a test on the reference platform (dibbler) with the
latest bios available
and the hw lockup can be also reproduced with the same steps.

For reference, I'm using mainline kernel 5.12-rc2.

[    5.938544] [drm] initializing kernel modesetting (RAVEN
0x1002:0x15DD 0x1002:0x15DD 0xC1).
[    5.939942] amdgpu: ATOM BIOS: 113-RAVEN-11

As in the previous cases, the clocks go to 100% of usage when the hang occurs.

However, when the gpu hangs, dmesg output displays the following:

[ 1568.279847] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx
timeout, signaled seq=188, emitted seq=191
[ 1568.434084] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process
information: process Xorg pid 311 thread Xorg:cs0 pid 312
[ 1568.279847] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx
timeout, signaled seq=188, emitted seq=191
[ 1568.434084] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process
information: process Xorg pid 311 thread Xorg:cs0 pid 312
[ 1568.507000] amdgpu 0000:01:00.0: amdgpu: GPU reset begin!
[ 1628.491882] rcu: INFO: rcu_sched self-detected stall on CPU
[ 1628.491882] rcu:     3-...!: (665 ticks this GP)
idle=f9a/1/0x4000000000000000 softirq=188533/188533 fqs=15
[ 1628.491882] rcu: rcu_sched kthread timer wakeup didn't happen for
58497 jiffies! g726761 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402
[ 1628.491882] rcu:     Possible timer handling issue on cpu=2
timer-softirq=55225
[ 1628.491882] rcu: rcu_sched kthread starved for 58500 jiffies!
g726761 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402 ->cpu=2
[ 1628.491882] rcu:     Unless rcu_sched kthread gets sufficient CPU
time, OOM is now expected behavior.
[ 1628.491882] rcu: RCU grace-period kthread stack dump:
[ 1628.491882] rcu: Stack dump where RCU GP kthread last ran:
[ 1808.518445] rcu: INFO: rcu_sched self-detected stall on CPU
[ 1808.518445] rcu:     3-...!: (2643 ticks this GP)
idle=f9a/1/0x4000000000000000 softirq=188533/188533 fqs=15
[ 1808.518445] rcu: rcu_sched kthread starved for 238526 jiffies!
g726761 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x0 ->cpu=2
[ 1808.518445] rcu:     Unless rcu_sched kthread gets sufficient CPU
time, OOM is now expected behavior.
[ 1808.518445] rcu: RCU grace-period kthread stack dump:
[ 1808.518445] rcu: Stack dump where RCU GP kthread last ran:

>
> Daniel
>
> >
> > Alex
> >
> >
> > >
> > > Logs:
> > > [   27.708348] [drm] initializing kernel modesetting (RAVEN
> > > 0x1002:0x15DD 0x1002:0x15DD 0x83).
> > > [   27.789156] amdgpu: ATOM BIOS: 113-RAVEN-115
> > >
> > > Thanks in advance,
> > > Daniel
> > >
> > >  drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> > > index 65db88bb6cbc..319d4b99aec8 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> > > @@ -1243,6 +1243,8 @@ static const struct amdgpu_gfxoff_quirk amdgpu_gfxoff_quirk_list[] = {
> > >         { 0x1002, 0x15dd, 0x103c, 0x83e7, 0xd3 },
> > >         /* GFXOFF is unstable on C6 parts with a VBIOS 113-RAVEN-114 */
> > >         { 0x1002, 0x15dd, 0x1002, 0x15dd, 0xc6 },
> > > +       /* GFXOFF provokes a hw lockup on 83 parts with a VBIOS 113-RAVEN-115 */
> > > +       { 0x1002, 0x15dd, 0x1002, 0x15dd, 0x83 },
> > >         { 0, 0, 0, 0, 0 },
> > >  };
> > >
> > > --
> > > 2.30.1
> > >
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
