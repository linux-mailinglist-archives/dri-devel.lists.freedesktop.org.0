Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2A621F434
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 16:37:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E78AC6E978;
	Tue, 14 Jul 2020 14:37:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E624D6E978
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 14:37:04 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id a6so22065172wrm.4
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 07:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=wF/VaT8DAfIG5fED7pvNX/9WGcTfVpcYVq77cQoaxoo=;
 b=iuRVBH8+TRNyPgj+Z9z3lwVU0fIVd9H33GGjVBafz4Xx1FC+2lXGIpr8MR0ooJzeB/
 gWxZLKR8niHScPvZ8r74XEolr3j1PMWXkNBIbQ8nsrdCNWgyat52PgXSJFrNR+jW8g7p
 VnU/KJVj8JuNXbwcUeVvyzNzjjHy8h+x88eIE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=wF/VaT8DAfIG5fED7pvNX/9WGcTfVpcYVq77cQoaxoo=;
 b=qRXB8hO8hkySLbb5m9dXgmOQk6XdyjxruQc9uPBLy8U1bm/fPt3B6LMW7TpVuwREFF
 hibUkftsBPZdht71WzFWM1H6XaRZTAvlFBxSaEjFccks4p+jVsZ8X+gfLzyR30oqz90w
 c/x35AGPRX60Irskx5zHTITk+2X5iQbpQsRJlDDxxw6w7fAeyOBZvSh7pJDKQyw7w1LY
 2TUTTzsURpo5w/wxcXjLubJcLJbVqhBfaqGj60zIC6/M8GCWz/yqBXndyFU1nRML/7Rr
 sRo+Zm3lPdeW9XJMzcpTFfy+wlC0raERqHNSkhVOMvNqhGdZRnhOf4SnW13PlnqFYdct
 PM/w==
X-Gm-Message-State: AOAM533oUdeli9T6VIs7+pU04axo0UaDGhsPSE55B4ZFeLSANfJPxlVC
 G6kLeQuAXpf+881n/rpXr9i3Aw==
X-Google-Smtp-Source: ABdhPJwb8hfiCFzW/PO/PTBg270s2F2qovUkx1VslLeJazhOWdYpnCMOrVW0V1Ctjb2ViVgLds+1+w==
X-Received: by 2002:a5d:4e48:: with SMTP id r8mr5898211wrt.309.1594737423379; 
 Tue, 14 Jul 2020 07:37:03 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z8sm4882419wmg.39.2020.07.14.07.37.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 07:37:02 -0700 (PDT)
Date: Tue, 14 Jul 2020 16:37:00 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 1/1] drm/amdkfd: Add IPC API
Message-ID: <20200714143700.GH3278063@phenom.ffwll.local>
References: <20200714031435.13362-1-Felix.Kuehling@amd.com>
 <20200714031435.13362-2-Felix.Kuehling@amd.com>
 <CAPM=9tzjQGg2OMrptD6qJv0yEvY+S7mS6oXNxe21UoWk+6-Ung@mail.gmail.com>
 <4245d340-f4f6-eeb5-40a6-3afd7754852c@amd.com>
 <CAPM=9tz3UC8VuP=n_OAF5LnAmXSVR32LztqeEWtssnodMj70dQ@mail.gmail.com>
 <20200714085850.GX3278063@phenom.ffwll.local>
 <97e221e7-ea50-a02d-0791-0555a256e374@gmail.com>
 <20200714095338.GZ3278063@phenom.ffwll.local>
 <750c7d7a-1cd3-be20-df35-bc6265b4740f@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <750c7d7a-1cd3-be20-df35-bc6265b4740f@amd.com>
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

On Tue, Jul 14, 2020 at 01:36:41PM +0200, Christian K=F6nig wrote:
> Am 14.07.20 um 11:53 schrieb Daniel Vetter:
> > On Tue, Jul 14, 2020 at 11:28:12AM +0200, Christian K=F6nig wrote:
> > > Am 14.07.20 um 10:58 schrieb Daniel Vetter:
> > > > On Tue, Jul 14, 2020 at 02:26:36PM +1000, Dave Airlie wrote:
> > > > > On Tue, 14 Jul 2020 at 14:09, Felix Kuehling <felix.kuehling@amd.=
com> wrote:
> > > > > > Am 2020-07-13 um 11:28 p.m. schrieb Dave Airlie:
> > > > > > > On Tue, 14 Jul 2020 at 13:14, Felix Kuehling <Felix.Kuehling@=
amd.com> wrote:
> > > > > > > > This allows exporting and importing buffers. The API genera=
tes handles
> > > > > > > > that can be used with the HIP IPC API, i.e. big numbers rat=
her than
> > > > > > > > file descriptors.
> > > > > > > First up why? I get the how.
> > > > > > The "why" is compatibility with HIP code ported from CUDA. The
> > > > > > equivalent CUDA IPC API works with handles that can be communic=
ated
> > > > > > through e.g. a pipe or shared memory. You can't do that with fi=
le
> > > > > > descriptors.
> > > > > Okay that sort of useful information should definitely be in the =
patch
> > > > > description.
> > > > > =

> > > > > > https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Fdocs.nvidia.com%2Fcuda%2Fcuda-runtime-api%2Fgroup__CUDART__DEVICE.html=
%23group__CUDART__DEVICE_1g8a37f7dfafaca652391d0758b3667539&amp;data=3D02%7=
C01%7Cchristian.koenig%40amd.com%7C2e0b8a6d2aac49e0f6c908d827dbcb46%7C3dd89=
61fe4884e608e11a82d994e183d%7C0%7C0%7C637303172250574336&amp;sdata=3DmDWVED=
sP%2BKTvvhqYp%2BSstczPtEV9l7n%2B%2BuNj30de0sQ%3D&amp;reserved=3D0
> > > > > > =

> > > > > > https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Fdocs.nvidia.com%2Fcuda%2Fcuda-runtime-api%2Fgroup__CUDART__DEVICE.html=
%23group__CUDART__DEVICE_1g01050a29fefde385b1042081ada4cde9&amp;data=3D02%7=
C01%7Cchristian.koenig%40amd.com%7C2e0b8a6d2aac49e0f6c908d827dbcb46%7C3dd89=
61fe4884e608e11a82d994e183d%7C0%7C0%7C637303172250574336&amp;sdata=3Dyb80LA=
1csqkctuF1rAXBpYgJT%2BkS0Nmfilnd8%2BjQSW4%3D&amp;reserved=3D0
> > > > > > =

> > > > > > > > + * @share_handle is a 128 bit random number generated with
> > > > > > > > + * @get_random_bytes. This number should be very hard to g=
uess.
> > > > > > > > + * Knowledge of the @share_handle implies authorization to=
 access
> > > > > > > > + * the shared memory. User mode should treat it like a sec=
ret key.
> > > > > > > > + * It can be used to import this BO in a different process=
 context
> > > > > > > > + * for IPC buffer sharing. The handle will be valid as lon=
g as the
> > > > > > > > + * underlying BO exists. If the same BO is exported multip=
le times,
> > > > > > > Do we have any examples of any APIs in the kernel that operat=
e like
> > > > > > > this? That don't at least layer some sort of file permissions=
  and
> > > > > > > access control on top?
> > > > > > SystemV shared memory APIs (shmget, shmat) work similarly. Ther=
e are
> > > > > > some permissions that can be specified by the exporter in shmge=
t.
> > > > > > However, the handles are just numbers and much easier to guess =
(they are
> > > > > > 32-bit integers). The most restrictive permissions would allow =
only the
> > > > > > exporting UID to attach to the shared memory segment.
> > > > > > =

> > > > > > I think DRM flink works similarly as well, with a global name I=
DR used
> > > > > > for looking up GEM objects using global object names.
> > > > > flink is why I asked, because flink was a mistake and not one I'd=
 care
> > > > > to make again.
> > > > > shm is horrible also, but at least has some permissions on what u=
sers
> > > > > can attack it.
> > > > Yeah this smells way too much like flink. I had the same reaction, =
and
> > > > kinda sad that we have to do this because nvidia defines how this w=
orks
> > > > with 0 input from anyone else. Oh well, the world sucks.
> > > > =

> > > > > > > The reason fd's are good is that combined with unix sockets, =
you can't
> > > > > > > sniff it, you can't ptrace a process and find it, you can't w=
rite it
> > > > > > > out in a coredump and have someone access it later.
> > > > > > Arguably ptrace and core dumps give you access to all the memory
> > > > > > contents already. So you don't need the shared memory handle to=
 access
> > > > > > memory in that case.
> > > > > core dumps might not dump this memory though, but yeah ptrace wou=
ld
> > > > > likely already mean you have access.
> > > > > =

> > > > > > > Maybe someone who knows security can ack merging this sort of=
 uAPI
> > > > > > > design, I'm not confident in what it's doing is in any ways a=
 good
> > > > > > > idea. I might have to ask some people to take a closer look.
> > > > > > Please do. We have tried to make this API as secure as possible=
 within
> > > > > > the constraints of the user mode API we needed to implement.
> > > > > I'll see if I hear back, but also if danvet has any input like I
> > > > > suppose it's UUID based buffer access, so maybe 128-bit is enough=
 and
> > > > > you have enough entropy not to create anything insanely predictab=
le.
> > > > So one idea that crossed my mind is if we don't want to do this as a
> > > > generic dma-buf handle converter.
> > > > =

> > > > Something like /dev/dri/cuda_is_nasty (maybe slightly nicer name) w=
hich
> > > > provides a generic dma-buf <-> cuda uuid converter. With separate a=
ccess
> > > > restrictions, so admins can decide whether they want to allow this
> > > > silliness, or not. Anyone else who wants to reimplement cuda will n=
eed
> > > > this too, so that's another reason for splitting this out.
> > > > =

> > > > Wrt security: I think assuming that there's none and the lookup has=
 a
> > > > side-channel you can use to efficiently scan the entire range is pr=
obably
> > > > the safe approach here. This is way out of my league, but I think p=
eople
> > > > who know how to do this won't have a much harder time scanning this=
 than
> > > > the flink space.
> > > > =

> > > > Also, if we have one common uuid->dma-buf converter, we might actua=
lly
> > > > have a chance to proof the "it's not secure" assumption wrong. Also=
, we
> > > > might be able to tie this into cgroups or namespaces or similar tha=
t way.
> > > > =

> > > > Just some thoughts to give my initial "eek, why this" reaction a bi=
t more
> > > > substance :-) No idea whether this would work or make more sense.
> > > Yeah, my initial reaction was the same. On the pro side is that we us=
e more
> > > than the 32bits flink did as identifier.
> > flink started at 0, so in practice it was trivial to enumerate. Not even
> > randomized.
> > =

> > But the thing is if your uuid lookup isn't guaranteed to be const and
> > side-channel free, then you can use that to guess where ids are. Doesn't
> > need to be much until you can brute-force the remaining bits. Engineeri=
ng
> > an implementation (not just the theory) that relies on the assumption t=
hat
> > full brute-force is the fastes option is very hard engineering. And I
> > think here in the gpu world we just don't have any of that expertise.
> =

> Well being able to look up up ids is not necessary a problem. See that ro=
ot
> can see all buffers for debugging purposes is most likely not even a bad
> idea.
> =

> When we manage it as an fs we can just add/remove the executable bit from
> the directory to control enumeration.
> =

> And we can still have normal r/w permissions on the individual buffers as
> well.

Yeah id look-up isn't a problem, it's that the uuid comes with nothing
else like a fd or inode attached which would allows people to add some
security checks and namespacing to it. Which means that the entire
security boils down to "you can't guess the uuid", which means the
hashtable lookup must be sidechannel proof. Which we're not going to be
able to pull off I think :-)

> > > What we could maybe do to improve this is to link DMA-buf file descri=
ptors
> > > into the file system from userspace. And then we could just do someth=
ing
> > > like:
> > > =

> > > open("/tmp/dma-buf-0x0123-4567-89AB-CDEF-0123-4567-89AB-CDEF", "rw");
> > > =

> > > But to be honest I don't really know the fs code that well enough to =
judge
> > > if this is possible or not.
> > > =

> > > =

> > > Or we let DMA-bufs appear under some directory of /sys by their name =
so that
> > > applications can open and use them.
> > Yeah dmabuffs might be another option, but not sure how that would work,
> > since we want a creat() that takes in a dma-buf fd and then freezes tho=
se
> > two together forever. Maybe something like devpts, but I think that's a=
lso
> > somewhat considered a design mistake (because namespace or something el=
se,
> > I dunno). Since if we link all dma-buf by default into the fs, we again
> > have the flink "free for everyone" security issues.
> > =

> > Hm I guess one option could be such a dmabufs, but still with an explic=
it
> > export step. And the export amounts to a creat() in dmabufs, using the
> > uid/gid and entire security context of the process that has done the
> > dmabuf2uuid export.
> > =

> > That would also give us namespacing for free, using fs namespaces. All
> > we'd need is multiple instances of this dmabuffs. Plus I guess we'd nee=
d a
> > canonical mount point for this thing, and then a special ioctl on the r=
oot
> > node for creating a file from a dma-buf fd.
> > =

> > Feels mildly overengineered, but I think this would at least make the c=
uda
> > uuid stuff fit reasonably well into the overall linux architecture we
> > have. Only bikeshed left would be to figure out where to mount this fs.
> > Maybe /dev/dma-buf-uuids or something like that as the canonical thing.
> > /sys feels misplaced, and we alread have /dev/pts for similar stuff.
> =

> Yeah a dmabuffs sounds overengineered to me as well.
> =

> It's a pity that we can't just open anonymous inodes under
> /proc/$pid/fd/$fd.
> =

> This way we would just need to encode the pid and fd number in the id
> transmitted to the other process and could solve it this way.
> =

> That an application changes the permissions of its own file descriptors
> because it needs to implement some questionable API design is not a probl=
em
> of the kernel.

Hm could we fix this by making the inode non-anon? Maybe also quite a pile
of overkill ...

Another classic issue is lifetime of these names, I guess these are
supposed to be weak references, i.e. the uuid disappears with the last
buffer reference (like flink) and doesn't hold a reference of its own
(like dma-buf fd). Implementing that in a dmabuffs would be quite a pile
of fun.

So maybe it's a lot more nasty in the implementation, but dmabuffs feels a
pile cleaner for all this. Also gives us a clear thing to throw at the
next cuda reimplementation.
-Daniel

> =

> Regards,
> Christian.
> =

> > =

> > Wrt typing up an entire fs, I thought with all the libfs work that
> > shouldn't be too hard to pull off.
> > -Daniel
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
