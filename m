Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09224775EBF
	for <lists+dri-devel@lfdr.de>; Wed,  9 Aug 2023 14:19:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CE5210E092;
	Wed,  9 Aug 2023 12:19:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C51D910E423
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Aug 2023 12:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691583578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tMiDKnOt5oAwioWPsyF60HTEcf/nalReerPWwijU6Gk=;
 b=N3tcjnhWVZYtW6HpRLIVXxAUUBgH7OmDVKofaykaXUpEZ8lVqZPVMlPSY5iAfQTviytzpL
 pPd0pra4OEPEa2W1IwpYx+7eIGyEdor8Wk75hor6OC0s3ev/21R7OcBfSgWNLXAkKLBde+
 bX4JTqCKobd/nZmO9uTRyoaI9ORV1/4=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-HMUZsGOjOe-beqSROecNvQ-1; Wed, 09 Aug 2023 08:19:36 -0400
X-MC-Unique: HMUZsGOjOe-beqSROecNvQ-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-4fe56825815so1127215e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Aug 2023 05:19:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691583575; x=1692188375;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EnGYefSqp3RUJ1okIxDhgSoX43gjncyGYfDercd0w4M=;
 b=DDR29Q82axJIFgz28GZnCrLzsHZceyt6jithCPKEgA/vEdMXaPsUr0uSji9IYbqHe9
 K2BNxsc4oTHcYn5MeAmrdsXTLleYFg4eWDFSTyCtKBDtBmmy+n/uxmm5ItTyyABs+0bH
 E5MnHZt+m2HyOSXaypI4JATKt8AOaKAOQpNEif2VjuNZ8T/Py+FV3KpAcK/k29NxOiIa
 sU2D5bBmmgluJivIggYKpBEiFBgokt+jZHSrPyXE9lky/EHEMvEFRTEaaxw7az344jTC
 oUqCGCHeGuLbcmObSPzo9LFXnraBlSdTMXYEDk8XYDxLlGb716E/J72mUlSZJSaMA3vk
 O/Ww==
X-Gm-Message-State: AOJu0Yyhr5O4ti8/GE61P2ErQKvu3r0GTnRa7AfQ5Kya3XThwio8youw
 bNusFGlxDIeV1wmvd823LwFEhrGFaTUXpbAo1/OsoDlTwgVxKpvA3CO4j8HIuutd7no4s0zCfn/
 e3fwmbW7aTkH8HIt2azLXNqk8Du7CABhPOQwFLqNgjLMT
X-Received: by 2002:a2e:1504:0:b0:2b7:3a7e:9e89 with SMTP id
 s4-20020a2e1504000000b002b73a7e9e89mr1074691ljd.2.1691583574889; 
 Wed, 09 Aug 2023 05:19:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGPqq97u+pLpSVHo0FFU0I51as+nYdRNDhK73HtQK+NcefAY/J8XE/pCZ40/rLTWxoqQA1mobMWFkx36gkKRc=
X-Received: by 2002:a2e:1504:0:b0:2b7:3a7e:9e89 with SMTP id
 s4-20020a2e1504000000b002b73a7e9e89mr1074680ljd.2.1691583574554; Wed, 09 Aug
 2023 05:19:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230806213107.GFZNARG6moWpFuSJ9W@fat_crate.local>
 <CACO55tvZD5U4J8DawFTRVnV-dLYLngfhuqO29_sWNEGofKfnBg@mail.gmail.com>
 <20230807150521.GGZNEIMQ9rsyCmkpoA@fat_crate.local>
 <CACO55tvWuSdwdirj7S3Dk-r4NAw8jC8g5RHKFd62WXi43iQP-w@mail.gmail.com>
 <87fs4sfu54.wl-tiwai@suse.de>
 <CACO55tszwFEgt=8xn4auAE7KJVs3ybGG68OzL9HJt19XGVhhHQ@mail.gmail.com>
 <874jl8fngo.wl-tiwai@suse.de>
In-Reply-To: <874jl8fngo.wl-tiwai@suse.de>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 9 Aug 2023 14:19:23 +0200
Message-ID: <CACO55ts9YWF7nLi3Zs4xKySpdHyUFgf4r566cKx3FwNTCaz0Sg@mail.gmail.com>
Subject: Re: 2b5d1c29f6c4 ("drm/nouveau/disp: PIOR DP uses GPIO for HPD, not
 PMGR AUX interrupts")
To: Takashi Iwai <tiwai@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="00000000000011eb5806027c7e5f"
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
Cc: nouveau@lists.freedesktop.org, lkml <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, regressions@leemhuis.info,
 Borislav Petkov <bp@alien8.de>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000011eb5806027c7e5f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 9, 2023 at 1:46=E2=80=AFPM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Wed, 09 Aug 2023 13:42:09 +0200,
> Karol Herbst wrote:
> >
> > On Wed, Aug 9, 2023 at 11:22=E2=80=AFAM Takashi Iwai <tiwai@suse.de> wr=
ote:
> > >
> > > On Tue, 08 Aug 2023 12:39:32 +0200,
> > > Karol Herbst wrote:
> > > >
> > > > On Mon, Aug 7, 2023 at 5:05=E2=80=AFPM Borislav Petkov <bp@alien8.d=
e> wrote:
> > > > >
> > > > > On Mon, Aug 07, 2023 at 01:49:42PM +0200, Karol Herbst wrote:
> > > > > > in what way does it stop? Just not progressing? That would be k=
inda
> > > > > > concerning. Mind tracing with what arguments `nvkm_uevent_add` =
is
> > > > > > called with and without that patch?
> > > > >
> > > > > Well, me dumping those args I guess made the box not freeze befor=
e
> > > > > catching a #PF over serial. Does that help?
> > > > >
> > > > > ....
> > > > > [    3.410135] Unpacking initramfs...
> > > > > [    3.416319] software IO TLB: mapped [mem 0x00000000a877d000-0x=
00000000ac77d000] (64MB)
> > > > > [    3.418227] Initialise system trusted keyrings
> > > > > [    3.432273] workingset: timestamp_bits=3D56 max_order=3D22 buc=
ket_order=3D0
> > > > > [    3.439006] ntfs: driver 2.1.32 [Flags: R/W].
> > > > > [    3.443368] fuse: init (API version 7.38)
> > > > > [    3.447601] 9p: Installing v9fs 9p2000 file system support
> > > > > [    3.453223] Key type asymmetric registered
> > > > > [    3.457332] Asymmetric key parser 'x509' registered
> > > > > [    3.462236] Block layer SCSI generic (bsg) driver version 0.4 =
loaded (major 250)
> > > > > [    3.475865] efifb: probing for efifb
> > > > > [    3.479458] efifb: framebuffer at 0xf9000000, using 1920k, tot=
al 1920k
> > > > > [    3.485969] efifb: mode is 800x600x32, linelength=3D3200, page=
s=3D1
> > > > > [    3.491872] efifb: scrolling: redraw
> > > > > [    3.495438] efifb: Truecolor: size=3D8:8:8:8, shift=3D24:16:8:=
0
> > > > > [    3.502349] Console: switching to colour frame buffer device 1=
00x37
> > > > > [    3.509564] fb0: EFI VGA frame buffer device
> > > > > [    3.514013] ACPI: \_PR_.CP00: Found 4 idle states
> > > > > [    3.518850] ACPI: \_PR_.CP01: Found 4 idle states
> > > > > [    3.523687] ACPI: \_PR_.CP02: Found 4 idle states
> > > > > [    3.528515] ACPI: \_PR_.CP03: Found 4 idle states
> > > > > [    3.533346] ACPI: \_PR_.CP04: Found 4 idle states
> > > > > [    3.538173] ACPI: \_PR_.CP05: Found 4 idle states
> > > > > [    3.543003] ACPI: \_PR_.CP06: Found 4 idle states
> > > > > [    3.544219] Freeing initrd memory: 8196K
> > > > > [    3.547844] ACPI: \_PR_.CP07: Found 4 idle states
> > > > > [    3.609542] Serial: 8250/16550 driver, 4 ports, IRQ sharing en=
abled
> > > > > [    3.616224] 00:05: ttyS0 at I/O 0x3f8 (irq =3D 4, base_baud =
=3D 115200) is a 16550A
> > > > > [    3.625552] serial 0000:00:16.3: enabling device (0000 -> 0003=
)
> > > > > [    3.633034] 0000:00:16.3: ttyS1 at I/O 0xf0a0 (irq =3D 17, bas=
e_baud =3D 115200) is a 16550A
> > > > > [    3.642451] Linux agpgart interface v0.103
> > > > > [    3.647141] ACPI: bus type drm_connector registered
> > > > > [    3.653261] Console: switching to colour dummy device 80x25
> > > > > [    3.659092] nouveau 0000:03:00.0: vgaarb: deactivate vga conso=
le
> > > > > [    3.665174] nouveau 0000:03:00.0: NVIDIA GT218 (0a8c00b1)
> > > > > [    3.784585] nouveau 0000:03:00.0: bios: version 70.18.83.00.08
> > > > > [    3.792244] nouveau 0000:03:00.0: fb: 512 MiB DDR3
> > > > > [    3.948786] nouveau 0000:03:00.0: DRM: VRAM: 512 MiB
> > > > > [    3.953755] nouveau 0000:03:00.0: DRM: GART: 1048576 MiB
> > > > > [    3.959073] nouveau 0000:03:00.0: DRM: TMDS table version 2.0
> > > > > [    3.964808] nouveau 0000:03:00.0: DRM: DCB version 4.0
> > > > > [    3.969938] nouveau 0000:03:00.0: DRM: DCB outp 00: 02000360 0=
0000000
> > > > > [    3.976367] nouveau 0000:03:00.0: DRM: DCB outp 01: 02000362 0=
0020010
> > > > > [    3.982792] nouveau 0000:03:00.0: DRM: DCB outp 02: 028003a6 0=
f220010
> > > > > [    3.989223] nouveau 0000:03:00.0: DRM: DCB outp 03: 01011380 0=
0000000
> > > > > [    3.995647] nouveau 0000:03:00.0: DRM: DCB outp 04: 08011382 0=
0020010
> > > > > [    4.002076] nouveau 0000:03:00.0: DRM: DCB outp 05: 088113c6 0=
f220010
> > > > > [    4.008511] nouveau 0000:03:00.0: DRM: DCB conn 00: 00101064
> > > > > [    4.014151] nouveau 0000:03:00.0: DRM: DCB conn 01: 00202165
> > > > > [    4.021710] nvkm_uevent_add: uevent: 0xffff888100242100, event=
: 0xffff8881022de1a0, id: 0x0, bits: 0x1, func: 0x0000000000000000
> > > > > [    4.033680] nvkm_uevent_add: uevent: 0xffff888100242300, event=
: 0xffff8881022de1a0, id: 0x0, bits: 0x1, func: 0x0000000000000000
> > > > > [    4.045429] nouveau 0000:03:00.0: DRM: MM: using COPY for buff=
er copies
> > > > > [    4.052059] stackdepot: allocating hash table of 1048576 entri=
es via kvcalloc
> > > > > [    4.067191] nvkm_uevent_add: uevent: 0xffff888100242800, event=
: 0xffff888104b3e260, id: 0x0, bits: 0x1, func: 0x0000000000000000
> > > > > [    4.078936] nvkm_uevent_add: uevent: 0xffff888100242900, event=
: 0xffff888104b3e260, id: 0x1, bits: 0x1, func: 0x0000000000000000
> > > > > [    4.090514] nvkm_uevent_add: uevent: 0xffff888100242a00, event=
: 0xffff888102091f28, id: 0x1, bits: 0x3, func: 0xffffffff8177b700
> > > > > [    4.102118] tsc: Refined TSC clocksource calibration: 3591.345=
 MHz
> > > > > [    4.108342] clocksource: tsc: mask: 0xffffffffffffffff max_cyc=
les: 0x33c4635c383, max_idle_ns: 440795314831 ns
> > > > > [    4.108401] nvkm_uevent_add: uevent: 0xffff8881020b6000, event=
: 0xffff888102091f28, id: 0xf, bits: 0x3, func: 0xffffffff8177b700
> > > > > [    4.129864] clocksource: Switched to clocksource tsc
> > > > > [    4.131478] [drm] Initialized nouveau 1.3.1 20120801 for 0000:=
03:00.0 on minor 0
> > > > > [    4.143806] BUG: kernel NULL pointer dereference, address: 000=
0000000000020
> > > >
> > > > ahh, that would have been good to know :) Mind figuring out what's
> > > > exactly NULL inside nvif_object_mthd? Or rather what line
> > > > `nvif_object_mthd+0x136` belongs to, then it should be easy to figu=
re
> > > > out what's wrong here.
> > >
> > > FWIW, we've hit the bug on openSUSE Tumbleweed 6.4.8 kernel:
> > >   https://bugzilla.suse.com/show_bug.cgi?id=3D1214073
> > > Confirmed that reverting the patch cured the issue.
> > >
> > > FWIW, loading nouveau showed a refcount_t warning just before the NUL=
L
> > > dereference:
> > >
> >
> > mh, I wonder if one of those `return -EINVAL;` branches is hit where
> > it wasn't before. Could some of you check if `nvkm_uconn_uevent`
> > returns -EINVAL with that patch where it didn't before? I wonder if
> > it's the `if (&outp->head =3D=3D &conn->disp->outps) return -EINVAL;` a=
nd
> > if remove that fixes the crash?
>
> Please give a patch, then I can build a kernel and let the reporter
> testing it :)
>

attached a patch.

Anyway, I'll be on PTO for the rest of the week and I kinda wished
somebody else would have time to figure out what's going wrong there,
or at least simply figuring out what the difference is. Not having
direct access to such a GPU also makes it a bit harder. Once I'm back
I'll check with all my GPUs if there is one hitting a difference here,
but the ones I've tested it with so far were all fine sadly.

>
> thanks,
>
> Takashi
>

--00000000000011eb5806027c7e5f
Content-Type: text/x-patch; charset="US-ASCII"; name="tmp.patch"
Content-Disposition: attachment; filename="tmp.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_ll3p2n330>
X-Attachment-Id: f_ll3p2n330

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vZW5naW5lL2Rpc3AvdWNv
bm4uYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vZW5naW5lL2Rpc3AvdWNvbm4uYwpp
bmRleCA0NmIwNTdmZTE0MTJlLi4zNjY2ZGZiN2VjYmY0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9udmttL2VuZ2luZS9kaXNwL3Vjb25uLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL25vdXZlYXUvbnZrbS9lbmdpbmUvZGlzcC91Y29ubi5jCkBAIC04NSw4ICs4NSw4IEBAIG52
a21fdWNvbm5fdWV2ZW50KHN0cnVjdCBudmttX29iamVjdCAqb2JqZWN0LCB2b2lkICphcmd2LCB1
MzIgYXJnYywgc3RydWN0IG52a21fCiAJCQlicmVhazsKIAl9CiAKLQlpZiAoJm91dHAtPmhlYWQg
PT0gJmNvbm4tPmRpc3AtPm91dHBzKQotCQlyZXR1cm4gLUVJTlZBTDsKKy8vCWlmICgmb3V0cC0+
aGVhZCA9PSAmY29ubi0+ZGlzcC0+b3V0cHMpCisvLwkJcmV0dXJuIC1FSU5WQUw7CiAKIAlpZiAo
b3V0cC0+ZHAuYXV4ICYmICFvdXRwLT5pbmZvLmxvY2F0aW9uKSB7CiAJCWlmIChhcmdzLT52MC50
eXBlcyAmIE5WSUZfQ09OTl9FVkVOVF9WMF9QTFVHICApIGJpdHMgfD0gTlZLTV9JMkNfUExVRzsK

--00000000000011eb5806027c7e5f--

