Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD11DA685DB
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 08:37:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3D4210E1A0;
	Wed, 19 Mar 2025 07:37:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Cmzv5gwp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com
 [209.85.160.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBAFA10E1A0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Mar 2025 07:37:50 +0000 (UTC)
Received: by mail-oa1-f49.google.com with SMTP id
 586e51a60fabf-2c11ddc865eso2187541fac.3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Mar 2025 00:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742369870; x=1742974670; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=owwDzzKUpGneXk0r6P0900oOLRuhEZkHOZ3jJ6/2920=;
 b=Cmzv5gwpfm408wo6D6yQiYztEQzCk2XmjZBY5NPZ/irLCF1WRNVix8wziREGsSxxZy
 TleiYqllHdKBCWnXIMLz4WnuJHOHC8JSn6bGNGoWifF+ucsyaw5MP3JLpSk7gObInliP
 g7DqHS5Bk44Cx4udY3G5jpoJja3PTkNibbATV9oBsqTUlCFZgjCTGsoOvlKvkBtu4i7z
 sdmBqNI2VljV6i9D/R0Bx08fkgmYAAQidsm8V87RG8bir6sIyfkj1sbrmVNzRU9s0pq3
 3360IG67VoYZbELexY+68TdZCrBipcJDlXLvzliJML9qvvN3GL71QgS0uJ+yL5W8mTGI
 PhXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742369870; x=1742974670;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=owwDzzKUpGneXk0r6P0900oOLRuhEZkHOZ3jJ6/2920=;
 b=rEx3Nbr09ZdyRfme4uiciel/hKJkrlenIrPedXAu9ygUnpCkamTfjxRgD/3oP6yE7H
 v6agFrwIxEyGTOUuJoWJ7YwXO/QqSdf83I3PeIUMYt+Z1lnbblZMWmLqZCap6ZVRiWrQ
 kGtKC6slT/E/pnIZSG+ivXvSkoGHwV6oGTEvok3viEiILGBMdO3Rms7Vb8XGc9XAzK13
 XWTbwmkg7AYbQ5sCNBv8ieMs1a3J1XwaKVCUVRYz6SoHLvfwOGBxiLAsb4Y2GsZJg4pj
 YJkNgsd1KmhQal4HqNRUeVZedKj90dERWbJ6jmyexlj+cwaVrY5jxcXY1sxk+5G50ZRK
 4tLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWERPo9YHZ31apgGacA5vb24Er0FqDn3qOUQFcHr1+gKXOIlv88X+V6VeKFk3/gAdMcIgnQHJuUxlw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3vGlqcOLqCEjpHvpD++1cnBT+lpF5VyPblpBktSll/NjFWtYe
 +t/soWt5jGS1BH4euRP7mG9mxfT5VFtDrR+Xwke4yjRqjRkaiIOxqeZ/DyipV2eGHekyvkyt67q
 tujGGpBRMwnKEBt7q5ZfVNnMEiiW7jjOh75livQ==
X-Gm-Gg: ASbGnct6BS3Wj5I/OyE6UDftUeuGDKKY3+WWVe6z0LQhk+Xd0vTYA6ucV57YBQWv1lk
 Eib5zPRT1yKPJwyEqq6442ljT6f41Mi93fu6HYqYh7IpHlIewM7Lfs6U3RSUZizcdGE1PeX9QKe
 WxEU9g60X+jI8vJ0kjreOT735pOBI=
X-Google-Smtp-Source: AGHT+IHhlr0ebpnI7ur3lSLDToxyweC0Ao9NnSXnP3sZR4rKFcxyBq8t5/yasVPUDL7hE6LOxReMuAl1+DoeTa0xu40=
X-Received: by 2002:a05:6871:710:b0:29e:290f:7aea with SMTP id
 586e51a60fabf-2c745785fb8mr1233815fac.34.1742369869734; Wed, 19 Mar 2025
 00:37:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAHUa44G9hw-z6wzxg=HkVAxPKEW1yES5JTEqRWMvJUJAtcUDkQ@mail.gmail.com>
 <CAPj87rPHnME5Osgnf5-FSAu22mDpLj=dzvhi_NqEcOwr1ThgGw@mail.gmail.com>
 <CAHUa44Gs0D1fBD0=+EDgcQUMeDv4knci9trUkYEc1J98qFV7HQ@mail.gmail.com>
 <CAFA6WYOuTwRPEh3L7+hMyARB_E73xmp+OwhKyS-r4+ryS7=9sw@mail.gmail.com>
 <20250214164856.0d2ead8a@collabora.com>
 <CAFA6WYPc6EHQwcPuMZRm4C1P6SoDrCzEPUmju_meupB6NXQ1sg@mail.gmail.com>
 <CAPj87rN-OYTzh5=Gdv619UQD5=x=U6Yt=uV4N1kCs4Zao4RVAg@mail.gmail.com>
 <CAFA6WYMLLLSuz3y5J+DuRFAGrmwpZoWax5sasfAUhXoQXmrNNA@mail.gmail.com>
 <CAPj87rN7J6u9NsviAdw8=OenEYc8t719Lds6u6-BhFKrtkLZ-A@mail.gmail.com>
 <CAHUa44FkG1NAWpoW8UVBywv44XW_mjAJa32PcC9mcmiOLdiRqw@mail.gmail.com>
 <Z8avsigZJ4vqmiA4@sumit-X1>
 <32c29526416c07c37819aedabcbf1e562ee98bf2.camel@ndufresne.ca>
In-Reply-To: <32c29526416c07c37819aedabcbf1e562ee98bf2.camel@ndufresne.ca>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 19 Mar 2025 08:37:38 +0100
X-Gm-Features: AQ5f1JoBpDEcbO9dlVRTjtWYtOyjNLGsFkNPj_PW0jLG2Dag8-4LN8wDdyWmUJE
Message-ID: <CAHUa44E11jYFrAFrZmNVTpLJ-XDs45QyTr-_DbeWBOQ0DjHPkQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] TEE subsystem for restricted dma-buf allocations
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Sumit Garg <sumit.garg@kernel.org>, Daniel Stone <daniel@fooishbar.org>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 op-tee@lists.trustedfirmware.org, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, 
 Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com, Florent Tomasin <florent.tomasin@arm.com>
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

Hi,

On Tue, Mar 18, 2025 at 7:38=E2=80=AFPM Nicolas Dufresne <nicolas@ndufresne=
.ca> wrote:
>
> Le mardi 04 mars 2025 =C3=A0 13:15 +0530, Sumit Garg a =C3=A9crit :
> > On Tue, Mar 04, 2025 at 08:17:23AM +0100, Jens Wiklander wrote:
> > > Hi Daniel,
> > >
> > > On Fri, Feb 21, 2025 at 3:12=E2=80=AFPM Daniel Stone <daniel@fooishba=
r.org> wrote:
> > > >
> > > > Hi Sumit,
> > > >
> > > > On Fri, 21 Feb 2025 at 11:24, Sumit Garg <sumit.garg@linaro.org> wr=
ote:
> > > > > On Tue, 18 Feb 2025 at 21:52, Daniel Stone <daniel@fooishbar.org>=
 wrote:
> > > > > > dma-heaps was created to solve the problem of having too many
> > > > > > 'allocate $n bytes from $specialplace' uAPIs. The proliferation=
 was
> > > > > > painful and making it difficult for userspace to do what it nee=
ded to
> > > > > > do. Userspace doesn't _yet_ make full use of it, but the soluti=
on is
> > > > > > to make userspace make full use of it, not to go create entirel=
y
> > > > > > separate allocation paths for unclear reasons.
> > > > > >
> > > > > > Besides, I'm writing this from a platform that implements SVP n=
ot via
> > > > > > TEE. I've worked on platforms which implement SVP without any T=
EE,
> > > > > > where the TEE implementation would be at best a no-op stub, and=
 at
> > > > > > worst flat-out impossible.
> > > > >
> > > > > Can you elaborate the non-TEE use-case for Secure Video Path (SVP=
) a
> > > > > bit more? As to how the protected/encrypted media content pipelin=
e
> > > > > works? Which architecture support does your use-case require? Is =
there
> > > > > any higher privileged level firmware interaction required to perf=
orm
> > > > > media content decryption into restricted memory? Do you plan to
> > > > > upstream corresponding support in near future?
> > > >
> > > > You can see the MTK SVP patches on list which use the MTK SMC to me=
diate it.
> > > >
> > > > There are TI Jacinto platforms which implement a 'secure' area
> > > > configured statically by (IIRC) BL2, with static permissions define=
d
> > > > for each AXI endpoint, e.g. CPU write + codec RW + dispc read. I've
> > > > heard of another SoC vendor doing the same, but I don't think I can
> > > > share those details. There is no TEE interaction.
> > > >
> > > > I'm writing this message from an AMD laptop which implements
> > > > restricted content paths outside of TEE. I don't have the full pict=
ure
> > > > of how SVP is implemented on AMD systems, but I do know that I don'=
t
> > > > have any TEE devices exposed.
> > > >
> > > > > Let me try to elaborate on the Secure Video Path (SVP) flow requi=
ring
> > > > > a TEE implementation (in general terms a higher privileged firmwa=
re
> > > > > managing the pipeline as the kernel/user-space has no access
> > > > > permissions to the plain text media content):
> > > > >
> > > > > - [...]
> > > >
> > > > Yeah, I totally understand the TEE usecase. I think that TEE is a g=
ood
> > > > design to implement this. I think that TEE should be used for SVP
> > > > where it makes sense.
> > > >
> > > > Please understand that I am _not_ arguing that no-one should use TE=
E for SVP!
> > > >
> > > > > > So, again, let's
> > > > > > please turn this around: _why_ TEE? Who benefits from exposing =
this as
> > > > > > completely separate to the more generic uAPI that we specifical=
ly
> > > > > > designed to handle things like this?
> > > > >
> > > > > The bridging between DMA heaps and TEE would still require user-s=
pace
> > > > > to perform an IOCTL into TEE to register the DMA-bufs as you can =
see
> > > > > here [1]. Then it will rather be two handles for user-space to ma=
nage.
> > > >
> > > > Yes, the decoder would need to do this. That's common though: if yo=
u
> > > > want to share a buffer between V4L2 and DRM, you have three handles=
:
> > > > the V4L2 buffer handle, the DRM GEM handle, and the dmabuf you use =
to
> > > > bridge the two.
> > > >
> > > > > Similarly during restricted memory allocation/free we need anothe=
r
> > > > > glue layer under DMA heaps to TEE subsystem.
> > > >
> > > > Yep.
> > > >
> > > > > The reason is simply which has been iterated over many times in t=
he
> > > > > past threads that:
> > > > >
> > > > >     "If user-space has to interact with a TEE device for SVP use-=
case
> > > > > then why it's not better to ask TEE to allocate restricted DMA-bu=
fs
> > > > > too"
> > > >
> > > > The first word in your proposition is load-bearing.
> > > >
> > > > Build out the usecase a little more here. You have a DRMed video
> > > > stream coming in, which you need to decode (involving TEE for this
> > > > usecase). You get a dmabuf handle to the decoded frame. You need to
> > > > pass the dmabuf across to the Wayland compositor. The compositor ne=
eds
> > > > to pass it to EGL/Vulkan to import and do composition, which in tur=
n
> > > > passes it to the GPU DRM driver. The output of the composition is i=
n
> > > > turn shared between the GPU DRM driver and the separate KMS DRM
> > > > driver, with the involvement of GBM.
> > > >
> > > > For the platforms I'm interested in, the GPU DRM driver needs to
> > > > switch into protected mode, which has no involvement at all with TE=
E -
> > > > it's architecturally impossible to have TEE involved without moving
> > > > most of the GPU driver into TEE and destroying performance. The
> > > > display hardware also needs to engage protected mode, which again h=
as
> > > > no involvement with TEE and again would need to have half the drive=
r
> > > > moved into TEE for no benefit in order to do so. The Wayland
> > > > compositor also has no interest in TEE: it tells the GPU DRM driver
> > > > about the protected status of its buffers, and that's it.
> > > >
> > > > What these components _are_ opinionated about, is the way buffers a=
re
> > > > allocated and managed. We built out dmabuf modifiers for this useca=
se,
> > > > and we have a good negotiation protocol around that. We also really
> > > > care about buffer placement in some usecases - e.g. some display/co=
dec
> > > > hardware requires buffers to be sourced from contiguous memory, oth=
er
> > > > hardware needs to know that when it shares buffers with another
> > > > device, it needs to place the buffers outside of inaccessible/slow
> > > > local RAM. So we built out dma-heaps, so every part of the componen=
t
> > > > in the stack can communicate their buffer-placement needs in the sa=
me
> > > > way as we do modifiers, and negotiate an acceptable allocation.
> > > >
> > > > That's my starting point for this discussion. We have a mechanism t=
o
> > > > deal with the fact that buffers need to be shared between different=
 IP
> > > > blocks which have their own constraints on buffer placement, avoidi=
ng
> > > > the current problem of having every subsystem reinvent their own
> > > > allocation uAPI which was burying us in impedance mismatch and
> > > > confusion. That mechanism is dma-heaps. It seems like your starting
> > > > point from this discussion is that you've implemented a TEE-centric
> > > > design for SVP, and so all of userspace should bypass our existing
> > > > cross-subsystem special-purpose allocation mechanism, and write
> > > > specifically to one implementation. I believe that is a massive ste=
p
> > > > backwards and an immediate introduction of technical debt.
> > > >
> > > > Again, having an implementation of SVP via TEE makes a huge amount =
of
> > > > sense. Having _most_ SVP implementations via TEE still makes a lot =
of
> > > > sense. Having _all_ SVP implementations eventually be via TEE would
> > > > still make sense. But even if we were at that point - which we aren=
't
> > > > - it still doesn't justify telling userspace 'use the generic dma-h=
eap
> > > > uAPI for every device-specific allocation constraint, apart from SV=
P
> > > > which has a completely different way to allocate some bytes'.
> > >
> > > I must admit that I don't see how this makes a significant difference=
,
> > > but then I haven't hacked much in the stacks you're talking about, so
> > > I'm going to take your word for it.
> > >
> > > I've experimented with providing a dma-heap replacing the TEE API. Th=
e
> > > implementation is more complex than I first anticipated, adding about
> > > 400 lines to the patch set.
> >
> > I did anticipated this but let's give it a try and see if DMA heaps
> > really adds any value from user-space point of view. If it does then it
> > will be worth the maintenence overhead.
> >
> > > From user space, it looks like another
> > > dma-heap. I'm using the names you gave earlier,
> > > protected,secure-video, protected,trusted-ui, and
> > > protected,secure-video-record. However, I wonder if we shouldn't use
> > > "restricted" instead of "protected" since we had agreed to call it
> > > restricted memory earlier.
> >
> > Let's stick with "restricted" memory buffer references only.
>
> Until now, we didn't have a standard to balance our naming choice, we
> simply wanted to move away from "secure" which didn't mean much, and
> restricted met our needs. I think the discussion is worth having again,
> now that there is a standard that decided toward "protected". Matchcing
> the Khronos standard means reducing a lot of confusion.
>
> https://docs.vulkan.org/guide/latest/protected.html

Yeah, that's fine with me. I don't mind changing the name again as
long as we progress. The latest version of the patchset is here [1].
I've published a demo and changed the patchset to provide a heap
interface instead of a special interface in the TEE subsystem for
memory allocations as requested. I'm interested in feedback on the
patches in general, but in particular, on how the heap interface is
provided.

[1] https://lore.kernel.org/lkml/20250305130634.1850178-1-jens.wiklander@li=
naro.org/

Cheers,
Jens
