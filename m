Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D977A21ED42
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 11:53:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 974EB6E0A8;
	Tue, 14 Jul 2020 09:53:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 041866E7F1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 09:53:43 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id r12so20464425wrj.13
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 02:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=zaSYM/qw1ksFU87P3s68GN96btH40hmproprU4x0zKA=;
 b=AwNPx9VT3/TyBdgOcz9fyZjdmot3L7Vu2cvFSe6BT0hFLQI84TP1cxnDXYjpaYuFFQ
 0eIolLrMZL3GBPA85sUJFxBTve1a1pmrKMR5ynXirQ1xW2DxdQEdwlCmI9vXx985nrkN
 ThFNSjAHFDqhZbYv18iMbioxACynwLbsF2AU8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=zaSYM/qw1ksFU87P3s68GN96btH40hmproprU4x0zKA=;
 b=mxZ1Ntzuow2g8NcEUNXRbkQ3TkBQJAzKYpbrIRlVMxrT/WGB+JDH8Mtao7QAkh6ARr
 zfBbAAw6kcwyS+tOEyhuB6zJ54TRJm7X6Km2DW9MXoGmY51IftaR6ft0xTJ+exGT17Zg
 br/A2adl2lfJXICoX9+fLA7eOuQSQ2V2i+zYv9AJP9SXVaGbz0/TdCUsabzor2M7aI9M
 raHBlhdOgjzOp541PD4ae1dsvFEsncPDk1W14HzyFE9b9/9mvSxsRzcxMJZZgzLNNaZd
 OkNiTC/jV0mbo5xTkdzsMnqywJXqUTfWKvvZBoG2EJ0dhuXW03b4kdOpckfDAxUrP8gf
 XBSA==
X-Gm-Message-State: AOAM532ZFvCDU700iuxKMySN9IpeqO5f33EqXqFwfNlATgAGGBfmlTfS
 WHRJKTeDvEUuzEIKE8zOIRB2JQ==
X-Google-Smtp-Source: ABdhPJze8DCHXkBu0adWg+Pz2th+uGPVa1vkWx8NnwANfNbGW5A0xNe34f9dBQTLBV87qW3TQTgseA==
X-Received: by 2002:adf:f6cb:: with SMTP id y11mr4179394wrp.100.1594720421487; 
 Tue, 14 Jul 2020 02:53:41 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k126sm3909591wme.17.2020.07.14.02.53.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 02:53:40 -0700 (PDT)
Date: Tue, 14 Jul 2020 11:53:38 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: christian.koenig@amd.com
Subject: Re: [PATCH 1/1] drm/amdkfd: Add IPC API
Message-ID: <20200714095338.GZ3278063@phenom.ffwll.local>
References: <20200714031435.13362-1-Felix.Kuehling@amd.com>
 <20200714031435.13362-2-Felix.Kuehling@amd.com>
 <CAPM=9tzjQGg2OMrptD6qJv0yEvY+S7mS6oXNxe21UoWk+6-Ung@mail.gmail.com>
 <4245d340-f4f6-eeb5-40a6-3afd7754852c@amd.com>
 <CAPM=9tz3UC8VuP=n_OAF5LnAmXSVR32LztqeEWtssnodMj70dQ@mail.gmail.com>
 <20200714085850.GX3278063@phenom.ffwll.local>
 <97e221e7-ea50-a02d-0791-0555a256e374@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <97e221e7-ea50-a02d-0791-0555a256e374@gmail.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Felix Kuehling <felix.kuehling@amd.com>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 14, 2020 at 11:28:12AM +0200, Christian K=F6nig wrote:
> Am 14.07.20 um 10:58 schrieb Daniel Vetter:
> > On Tue, Jul 14, 2020 at 02:26:36PM +1000, Dave Airlie wrote:
> > > On Tue, 14 Jul 2020 at 14:09, Felix Kuehling <felix.kuehling@amd.com>=
 wrote:
> > > > Am 2020-07-13 um 11:28 p.m. schrieb Dave Airlie:
> > > > > On Tue, 14 Jul 2020 at 13:14, Felix Kuehling <Felix.Kuehling@amd.=
com> wrote:
> > > > > > This allows exporting and importing buffers. The API generates =
handles
> > > > > > that can be used with the HIP IPC API, i.e. big numbers rather =
than
> > > > > > file descriptors.
> > > > > First up why? I get the how.
> > > > The "why" is compatibility with HIP code ported from CUDA. The
> > > > equivalent CUDA IPC API works with handles that can be communicated
> > > > through e.g. a pipe or shared memory. You can't do that with file
> > > > descriptors.
> > > Okay that sort of useful information should definitely be in the patch
> > > description.
> > > =

> > > > https://docs.nvidia.com/cuda/cuda-runtime-api/group__CUDART__DEVICE=
.html#group__CUDART__DEVICE_1g8a37f7dfafaca652391d0758b3667539
> > > > =

> > > > https://docs.nvidia.com/cuda/cuda-runtime-api/group__CUDART__DEVICE=
.html#group__CUDART__DEVICE_1g01050a29fefde385b1042081ada4cde9
> > > > =

> > > > > > + * @share_handle is a 128 bit random number generated with
> > > > > > + * @get_random_bytes. This number should be very hard to guess.
> > > > > > + * Knowledge of the @share_handle implies authorization to acc=
ess
> > > > > > + * the shared memory. User mode should treat it like a secret =
key.
> > > > > > + * It can be used to import this BO in a different process con=
text
> > > > > > + * for IPC buffer sharing. The handle will be valid as long as=
 the
> > > > > > + * underlying BO exists. If the same BO is exported multiple t=
imes,
> > > > > Do we have any examples of any APIs in the kernel that operate li=
ke
> > > > > this? That don't at least layer some sort of file permissions  and
> > > > > access control on top?
> > > > SystemV shared memory APIs (shmget, shmat) work similarly. There are
> > > > some permissions that can be specified by the exporter in shmget.
> > > > However, the handles are just numbers and much easier to guess (the=
y are
> > > > 32-bit integers). The most restrictive permissions would allow only=
 the
> > > > exporting UID to attach to the shared memory segment.
> > > > =

> > > > I think DRM flink works similarly as well, with a global name IDR u=
sed
> > > > for looking up GEM objects using global object names.
> > > flink is why I asked, because flink was a mistake and not one I'd care
> > > to make again.
> > > shm is horrible also, but at least has some permissions on what users
> > > can attack it.
> > Yeah this smells way too much like flink. I had the same reaction, and
> > kinda sad that we have to do this because nvidia defines how this works
> > with 0 input from anyone else. Oh well, the world sucks.
> > =

> > > > > The reason fd's are good is that combined with unix sockets, you =
can't
> > > > > sniff it, you can't ptrace a process and find it, you can't write=
 it
> > > > > out in a coredump and have someone access it later.
> > > > Arguably ptrace and core dumps give you access to all the memory
> > > > contents already. So you don't need the shared memory handle to acc=
ess
> > > > memory in that case.
> > > core dumps might not dump this memory though, but yeah ptrace would
> > > likely already mean you have access.
> > > =

> > > > > Maybe someone who knows security can ack merging this sort of uAPI
> > > > > design, I'm not confident in what it's doing is in any ways a good
> > > > > idea. I might have to ask some people to take a closer look.
> > > > Please do. We have tried to make this API as secure as possible wit=
hin
> > > > the constraints of the user mode API we needed to implement.
> > > I'll see if I hear back, but also if danvet has any input like I
> > > suppose it's UUID based buffer access, so maybe 128-bit is enough and
> > > you have enough entropy not to create anything insanely predictable.
> > So one idea that crossed my mind is if we don't want to do this as a
> > generic dma-buf handle converter.
> > =

> > Something like /dev/dri/cuda_is_nasty (maybe slightly nicer name) which
> > provides a generic dma-buf <-> cuda uuid converter. With separate access
> > restrictions, so admins can decide whether they want to allow this
> > silliness, or not. Anyone else who wants to reimplement cuda will need
> > this too, so that's another reason for splitting this out.
> > =

> > Wrt security: I think assuming that there's none and the lookup has a
> > side-channel you can use to efficiently scan the entire range is probab=
ly
> > the safe approach here. This is way out of my league, but I think people
> > who know how to do this won't have a much harder time scanning this than
> > the flink space.
> > =

> > Also, if we have one common uuid->dma-buf converter, we might actually
> > have a chance to proof the "it's not secure" assumption wrong. Also, we
> > might be able to tie this into cgroups or namespaces or similar that wa=
y.
> > =

> > Just some thoughts to give my initial "eek, why this" reaction a bit mo=
re
> > substance :-) No idea whether this would work or make more sense.
> =

> Yeah, my initial reaction was the same. On the pro side is that we use mo=
re
> than the 32bits flink did as identifier.

flink started at 0, so in practice it was trivial to enumerate. Not even
randomized.

But the thing is if your uuid lookup isn't guaranteed to be const and
side-channel free, then you can use that to guess where ids are. Doesn't
need to be much until you can brute-force the remaining bits. Engineering
an implementation (not just the theory) that relies on the assumption that
full brute-force is the fastes option is very hard engineering. And I
think here in the gpu world we just don't have any of that expertise.

> What we could maybe do to improve this is to link DMA-buf file descriptors
> into the file system from userspace. And then we could just do something
> like:
> =

> open("/tmp/dma-buf-0x0123-4567-89AB-CDEF-0123-4567-89AB-CDEF", "rw");
> =

> But to be honest I don't really know the fs code that well enough to judge
> if this is possible or not.
> =

> =

> Or we let DMA-bufs appear under some directory of /sys by their name so t=
hat
> applications can open and use them.

Yeah dmabuffs might be another option, but not sure how that would work,
since we want a creat() that takes in a dma-buf fd and then freezes those
two together forever. Maybe something like devpts, but I think that's also
somewhat considered a design mistake (because namespace or something else,
I dunno). Since if we link all dma-buf by default into the fs, we again
have the flink "free for everyone" security issues.

Hm I guess one option could be such a dmabufs, but still with an explicit
export step. And the export amounts to a creat() in dmabufs, using the
uid/gid and entire security context of the process that has done the
dmabuf2uuid export.

That would also give us namespacing for free, using fs namespaces. All
we'd need is multiple instances of this dmabuffs. Plus I guess we'd need a
canonical mount point for this thing, and then a special ioctl on the root
node for creating a file from a dma-buf fd.

Feels mildly overengineered, but I think this would at least make the cuda
uuid stuff fit reasonably well into the overall linux architecture we
have. Only bikeshed left would be to figure out where to mount this fs.
Maybe /dev/dma-buf-uuids or something like that as the canonical thing.
/sys feels misplaced, and we alread have /dev/pts for similar stuff.

Wrt typing up an entire fs, I thought with all the libfs work that
shouldn't be too hard to pull off.
-Daniel
-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
