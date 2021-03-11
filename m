Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5DB3378D5
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 17:10:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D22C66E51A;
	Thu, 11 Mar 2021 16:10:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [IPv6:2607:f8b0:4864:20::c2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 766C36E212;
 Thu, 11 Mar 2021 16:10:47 +0000 (UTC)
Received: by mail-oo1-xc2f.google.com with SMTP id
 c13-20020a4ab18d0000b02901b5b67cff5eso801750ooo.2; 
 Thu, 11 Mar 2021 08:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dsVj1tbMCQQY03XaaBJkVTgd3uxndiFFvZTsqGrWJds=;
 b=BB9u1j/ywyApxy+fvQ6Y80GTWY6PEK6IszVm6uk/0oKc8cuKcbUGwpDCZdrA1l82kS
 GLUm3g/ZHaGXntznSqdNAPGVNFP0oVQ74JRTx3t1DB3/xrGMcxzCqYE5jyZ469tU+764
 LShxZwfm/b1+Zmub5EcObedm6jN9StjMAzLh1RUKwfhPWFqGCXzd3ixgR4B6Xusg95HW
 RWEM4W2V+EGZlTsIi2osngdmYqElZIhcqe2vFGGIX8CknahxflvCKJtcOEECGG5bjJJY
 wVoh/gKA8vZu5/+uFaOa1aNkl2yXjFq+1+of/H8VHAJ4PWsb1debwvdI7NVfwH9JqD4P
 TItg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dsVj1tbMCQQY03XaaBJkVTgd3uxndiFFvZTsqGrWJds=;
 b=qK/+wKKVdrFogbV/ODm1p2lMHK3WK12zBg5XncFbqpKmhYcVkhnmD3gi/XpYjLaF6g
 RCyVBMl/AL01tnoc1tXJh11oyqaBsg5dX/BPgPpxOZv/7Vf2ygrMLyq/iMwZg7koydic
 ZSIA78gPwV5SS5QctkNNA4lo2sJp6a1s9/L4vURzA1HFZ1sr8tTOl+Z/BZq8TFgnm73s
 McjegEeekG251LUfYxiPzcp6Br7j12Xu8R6lwRs3h65CDWEDAmzpfvz53CpaE3DyCsdG
 SX379q41QbnJB3IdHPi+AnwpsSjWjEI+U8TNbxFMBdhBs7KDKfBuDqurN4OmQqs1ov0N
 /yJQ==
X-Gm-Message-State: AOAM530dTorJbJglecL3oU8bTXWxo4XM8D0S4OXgMP1rftQwZEXrimAR
 jUGRoiiYNUwuGM96T9z6lGWHjs8radUcGiuiB9w=
X-Google-Smtp-Source: ABdhPJwF0lsHg0qgdaj8xAkw+D6+F+6KIHiQw8Nu0sMADNXDuNEuvyAZ0XcwCaPpWCS6uzTAImMkzmPYy5ubrFajraU=
X-Received: by 2002:a4a:8961:: with SMTP id g30mr5266790ooi.72.1615479046676; 
 Thu, 11 Mar 2021 08:10:46 -0800 (PST)
MIME-Version: 1.0
References: <20210310163655.2591893-1-daniel@qtec.com>
 <CADnq5_PmbXBaziCEqRODb_DvtKaw9ucXXjkdmdj9N_R8P-9Jcw@mail.gmail.com>
 <CAH1Ww+T4WwLzg_nnF=1sjm9LW9wCjFb0X9c=qmuubvMqJdW4PA@mail.gmail.com>
 <CAH1Ww+QiAyfQL_bf1u=zLiT=ayKFWA0Fr2n5sBHUxfpzxcPbrg@mail.gmail.com>
 <CAN22YZcnMzefgHu9FVPGEf73SKjar2tLJO-jvpYAqNJSH4F_qA@mail.gmail.com>
In-Reply-To: <CAN22YZcnMzefgHu9FVPGEf73SKjar2tLJO-jvpYAqNJSH4F_qA@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 11 Mar 2021 11:10:35 -0500
Message-ID: <CADnq5_N0vvZZU9sNrfKSocXNzdMn8+PpVGNiPcE2XC6OkmJmwA@mail.gmail.com>
Subject: Re: [PATCH]] drm/amdgpu/gfx9: add gfxoff quirk
To: Alexandre Desnoyers <alex@qtec.com>
Content-Type: multipart/mixed; boundary="000000000000b83e0205bd45069a"
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
 Alex Deucher <alexander.deucher@amd.com>, Daniel Gomez <daniel@qtec.com>,
 Yintian Tao <yttao@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Dennis Li <Dennis.Li@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000b83e0205bd45069a
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 11, 2021 at 10:02 AM Alexandre Desnoyers <alex@qtec.com> wrote:
>
> On Thu, Mar 11, 2021 at 2:49 PM Daniel Gomez <daniel@qtec.com> wrote:
> >
> > On Thu, 11 Mar 2021 at 10:09, Daniel Gomez <daniel@qtec.com> wrote:
> > >
> > > On Wed, 10 Mar 2021 at 18:06, Alex Deucher <alexdeucher@gmail.com> wrote:
> > > >
> > > > On Wed, Mar 10, 2021 at 11:37 AM Daniel Gomez <daniel@qtec.com> wrote:
> > > > >
> > > > > Disabling GFXOFF via the quirk list fixes a hardware lockup in
> > > > > Ryzen V1605B, RAVEN 0x1002:0x15DD rev 0x83.
> > > > >
> > > > > Signed-off-by: Daniel Gomez <daniel@qtec.com>
> > > > > ---
> > > > >
> > > > > This patch is a continuation of the work here:
> > > > > https://lkml.org/lkml/2021/2/3/122 where a hardware lockup was discussed and
> > > > > a dma_fence deadlock was provoke as a side effect. To reproduce the issue
> > > > > please refer to the above link.
> > > > >
> > > > > The hardware lockup was introduced in 5.6-rc1 for our particular revision as it
> > > > > wasn't part of the new blacklist. Before that, in kernel v5.5, this hardware was
> > > > > working fine without any hardware lock because the GFXOFF was actually disabled
> > > > > by the if condition for the CHIP_RAVEN case. So this patch, adds the 'Radeon
> > > > > Vega Mobile Series [1002:15dd] (rev 83)' to the blacklist to disable the GFXOFF.
> > > > >
> > > > > But besides the fix, I'd like to ask from where this revision comes from. Is it
> > > > > an ASIC revision or is it hardcoded in the VBIOS from our vendor? From what I
> > > > > can see, it comes from the ASIC and I wonder if somehow we can get an APU in the
> > > > > future, 'not blacklisted', with the same problem. Then, should this table only
> > > > > filter for the vendor and device and not the revision? Do you know if there are
> > > > > any revisions for the 1002:15dd validated, tested and functional?
> > > >
> > > > The pci revision id (RID) is used to specify the specific SKU within a
> > > > family.  GFXOFF is supposed to be working on all raven variants.  It
> > > > was tested and functional on all reference platforms and any OEM
> > > > platforms that launched with Linux support.  There are a lot of
> > > > dependencies on sbios in the early raven variants (0x15dd), so it's
> > > > likely more of a specific platform issue, but there is not a good way
> > > > to detect this so we use the DID/SSID/RID as a proxy.  The newer raven
> > > > variants (0x15d8) have much better GFXOFF support since they all
> > > > shipped with newer firmware and sbios.
> > >
> > > We took one of the first reference platform boards to design our
> > > custom board based on the V1605B and I assume it has one of the early 'unstable'
> > > raven variants with RID 0x83. Also, as OEM we are in control of the bios
> > > (provided by insyde) but I wasn't sure about the RID so, thanks for the
> > > clarification. Is there anything we can do with the bios to have the GFXOFF
> > > enabled and 'stable' for this particular revision? Otherwise we'd need to add
> > > the 0x83 RID to the table. Also, there is an extra ']' in the patch
> > > subject. Sorry
> > > for that. Would you need a new patch in case you accept it with the ']' removed?
> > >
> > > Good to hear that the newer raven versions have better GFXOFF support.
> >
> > Adding Alex Desnoyer to the loop as he is the electronic/hardware and
> > bios responsible so, he can
> > provide more information about this.
>
> Hello everyone,
>
> We, Qtechnology, are the OEM of the hardware platform where we
> originally discovered the bug.  Our platform is based on the AMD
> Dibbler V-1000 reference design, with the latest Insyde BIOS release
> available for the (now unsupported) Dibbler platform.  We have the
> Insyde BIOS source code internally, so we can make some modifications
> as needed.
>
> The last test that Daniel and myself performed was on a standard
> Dibbler PCB rev.B1 motherboard (NOT our platform), and using the
> corresponding latest AMD released BIOS "RDB1109GA".  As Daniel wrote,
> the hardware lockup can be reproduced on the Dibbler, even if it has a
> different RID that our V1605B APU.
>
> We also have a Neousys Technology POC-515 embedded computer (V-1000,
> V1605B) in our office.  The Neousys PC also uses Insyde BIOS.  This
> computer is also locking-up in the test.
> https://www.neousys-tech.com/en/product/application/rugged-embedded/poc-500-amd-ryzen-ultra-compact-embedded-computer
>
>
> Digging into the BIOS source code, the only reference to GFXOFF is in
> the SMU and PSP firmware release notes, where some bug fixes have been
> mentioned for previous SMU/PSP releases.  After a quick "git grep -i
> gfx | grep -i off", there seems to be no mention of GFXOFF in the
> Insyde UEFI (inluding AMD PI) code base.  I would appreciate any
> information regarding BIOS modification needed to make the GFXOFF
> feature stable.  As you (Alex Deucher) mentionned, it should be
> functional on all AMD Raven reference platforms.
>

It's handled by the firmwares carried by the sbios.  I'm not sure what
versions off hand.  Probably want to make sure you have the latest
ones.  Do you have an AMD partner contact?  It might be best to bring
this up with them.

Regarding the issues you are seeing is this a general issue with all
workloads that use the GFX shader cores?  Or just specific workloads?
If it's just compute workloads, you might try this patch.  It may fix
the issue for you.

Alex


>
> Regards,
>
> Alexandre Desnoyers
>
>
> >
> > I've now done a test on the reference platform (dibbler) with the
> > latest bios available
> > and the hw lockup can be also reproduced with the same steps.
> >
> > For reference, I'm using mainline kernel 5.12-rc2.
> >
> > [    5.938544] [drm] initializing kernel modesetting (RAVEN
> > 0x1002:0x15DD 0x1002:0x15DD 0xC1).
> > [    5.939942] amdgpu: ATOM BIOS: 113-RAVEN-11
> >
> > As in the previous cases, the clocks go to 100% of usage when the hang occurs.
> >
> > However, when the gpu hangs, dmesg output displays the following:
> >
> > [ 1568.279847] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx
> > timeout, signaled seq=188, emitted seq=191
> > [ 1568.434084] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process
> > information: process Xorg pid 311 thread Xorg:cs0 pid 312
> > [ 1568.279847] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx
> > timeout, signaled seq=188, emitted seq=191
> > [ 1568.434084] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process
> > information: process Xorg pid 311 thread Xorg:cs0 pid 312
> > [ 1568.507000] amdgpu 0000:01:00.0: amdgpu: GPU reset begin!
> > [ 1628.491882] rcu: INFO: rcu_sched self-detected stall on CPU
> > [ 1628.491882] rcu:     3-...!: (665 ticks this GP)
> > idle=f9a/1/0x4000000000000000 softirq=188533/188533 fqs=15
> > [ 1628.491882] rcu: rcu_sched kthread timer wakeup didn't happen for
> > 58497 jiffies! g726761 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402
> > [ 1628.491882] rcu:     Possible timer handling issue on cpu=2
> > timer-softirq=55225
> > [ 1628.491882] rcu: rcu_sched kthread starved for 58500 jiffies!
> > g726761 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402 ->cpu=2
> > [ 1628.491882] rcu:     Unless rcu_sched kthread gets sufficient CPU
> > time, OOM is now expected behavior.
> > [ 1628.491882] rcu: RCU grace-period kthread stack dump:
> > [ 1628.491882] rcu: Stack dump where RCU GP kthread last ran:
> > [ 1808.518445] rcu: INFO: rcu_sched self-detected stall on CPU
> > [ 1808.518445] rcu:     3-...!: (2643 ticks this GP)
> > idle=f9a/1/0x4000000000000000 softirq=188533/188533 fqs=15
> > [ 1808.518445] rcu: rcu_sched kthread starved for 238526 jiffies!
> > g726761 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x0 ->cpu=2
> > [ 1808.518445] rcu:     Unless rcu_sched kthread gets sufficient CPU
> > time, OOM is now expected behavior.
> > [ 1808.518445] rcu: RCU grace-period kthread stack dump:
> > [ 1808.518445] rcu: Stack dump where RCU GP kthread last ran:
> >
> > >
> > > Daniel
> > >
> > > >
> > > > Alex
> > > >
> > > >
> > > > >
> > > > > Logs:
> > > > > [   27.708348] [drm] initializing kernel modesetting (RAVEN
> > > > > 0x1002:0x15DD 0x1002:0x15DD 0x83).
> > > > > [   27.789156] amdgpu: ATOM BIOS: 113-RAVEN-115
> > > > >
> > > > > Thanks in advance,
> > > > > Daniel
> > > > >
> > > > >  drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c | 2 ++
> > > > >  1 file changed, 2 insertions(+)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> > > > > index 65db88bb6cbc..319d4b99aec8 100644
> > > > > --- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> > > > > +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> > > > > @@ -1243,6 +1243,8 @@ static const struct amdgpu_gfxoff_quirk amdgpu_gfxoff_quirk_list[] = {
> > > > >         { 0x1002, 0x15dd, 0x103c, 0x83e7, 0xd3 },
> > > > >         /* GFXOFF is unstable on C6 parts with a VBIOS 113-RAVEN-114 */
> > > > >         { 0x1002, 0x15dd, 0x1002, 0x15dd, 0xc6 },
> > > > > +       /* GFXOFF provokes a hw lockup on 83 parts with a VBIOS 113-RAVEN-115 */
> > > > > +       { 0x1002, 0x15dd, 0x1002, 0x15dd, 0x83 },
> > > > >         { 0, 0, 0, 0, 0 },
> > > > >  };
> > > > >
> > > > > --
> > > > > 2.30.1
> > > > >
> > > > > _______________________________________________
> > > > > dri-devel mailing list
> > > > > dri-devel@lists.freedesktop.org
> > > > > https://lists.freedesktop.org/mailman/listinfo/dri-devel

--000000000000b83e0205bd45069a
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-drm-amdgpu-disable-gfxoff-for-ROCm-workloads-on-Rave.patch"
Content-Disposition: attachment; 
	filename="0001-drm-amdgpu-disable-gfxoff-for-ROCm-workloads-on-Rave.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_km52gtq70>
X-Attachment-Id: f_km52gtq70

RnJvbSA5ZmMxZWM5YTFhZGRhMmEzMzNhNGVjYTEyMGEwZjU2MTk5ZWE4MGRlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5j
b20+CkRhdGU6IFRodSwgMTEgTWFyIDIwMjEgMTE6MDI6NTEgLTA1MDAKU3ViamVjdDogW1BBVENI
XSBkcm0vYW1kZ3B1OiBkaXNhYmxlIGdmeG9mZiBmb3IgUk9DbSB3b3JrbG9hZHMgb24gUmF2ZW4x
CgpDYXVzZXMgaGFuZ3MuCgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5k
ZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Ft
ZGtmZC5jIHwgNCArKystCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Ft
ZGtmZC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZC5jCmluZGV4
IGZhMjcyNjJiNWMyYS4uODk0MjE1Y2UzNDZhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2FtZGtmZC5jCkBAIC02NDIsNyArNjQyLDkgQEAgdm9pZCBhbWRncHVfYW1ka2Zk
X3NldF9jb21wdXRlX2lkbGUoc3RydWN0IGtnZF9kZXYgKmtnZCwgYm9vbCBpZGxlKQogCS8qIFRl
bXAgd29ya2Fyb3VuZCB0byBmaXggdGhlIHNvZnQgaGFuZyBvYnNlcnZlZCBpbiBjZXJ0YWluIGNv
bXB1dGUKIAkgKiBhcHBsaWNhdGlvbnMgaWYgR0ZYT0ZGIGlzIGVuYWJsZWQuCiAJICovCi0JaWYg
KGFkZXYtPmFzaWNfdHlwZSA9PSBDSElQX1NJRU5OQV9DSUNITElEKSB7CisJaWYgKChhZGV2LT5h
c2ljX3R5cGUgPT0gQ0hJUF9TSUVOTkFfQ0lDSExJRCkgfHwKKwkgICAgKChhZGV2LT5hc2ljX3R5
cGUgPT0gQ0hJUF9SQVZFTikgJiYKKwkgICAgIChhZGV2LT5hcHVfZmxhZ3MgJkFNRF9BUFVfSVNf
UkFWRU4pKSkgewogCQlwcl9kZWJ1ZygiR0ZYT0ZGIGlzICVzXG4iLCBpZGxlID8gImVuYWJsZWQi
IDogImRpc2FibGVkIik7CiAJCWFtZGdwdV9nZnhfb2ZmX2N0cmwoYWRldiwgaWRsZSk7CiAJfQot
LSAKMi4yOS4yCgo=
--000000000000b83e0205bd45069a
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--000000000000b83e0205bd45069a--
