Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B09B21EBF8
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 10:58:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1C656E81F;
	Tue, 14 Jul 2020 08:58:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E267E6E81F
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 08:58:53 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id s10so20301008wrw.12
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 01:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Xq+neimvk6HZT/Q39GtRWstkNYMMYBAY0Yje4sEgb/o=;
 b=VEo69UZb6oB/l6X5WEkHrMRDt7+pCnG1kOU0RDFn4tjSacottUkDf5TysuGbg6A5da
 niVAWRNrytgcuBI/EToRyOePBau6silQceyMecr8YxTZYrJ8VNw/QQq2b8aLWFlN89LT
 fARN0hBwTe7ugGPUrswWUx5MC3VHKNhMMIz3k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Xq+neimvk6HZT/Q39GtRWstkNYMMYBAY0Yje4sEgb/o=;
 b=eDX/x6gp6In91zO74I0h0oR3aZ+RUNUOnaUgdrWlLGkftdxHqTuJeCVDqBERCANbY6
 kum8s8oTslOa8p5ZXmtOXh3LzlC1i0+X1g2Q1cMtvsqoJar8jIVpi9zrj87b3AjCUmLJ
 mU5VgN/trSUYCA2FoAavLj8rUsL3JwjiNb4jBLPebTavbx8njshQ68QKEKKxcxcuM4U+
 slMc/NySc/sWXXKA/QN5AB7FHQU7GiPFbtLml+Jt9OxvIFY3PfK56nxJUaCJzzm3CKfO
 hVFwtWPGc0rd/lk2KFMIrRQNAXSeL5BtWe0xASqkK4ARylNVxdLpUnRRR/XljY/bLviK
 STuw==
X-Gm-Message-State: AOAM531FsZOgFPJcuMQBysf95fkJckc3AtF4uMoxpPyHf93NbWqHQUyk
 1UE3AT6KpQRgzBaPUTfF8Kix7Q==
X-Google-Smtp-Source: ABdhPJw8lYMC2gHSLTj5xV/HaZdpcbhLSpLKp16iVNCddAtDak+dkjo983BIbrAowVMQvqI9LS8/RA==
X-Received: by 2002:a05:6000:1cf:: with SMTP id
 t15mr4223119wrx.180.1594717132475; 
 Tue, 14 Jul 2020 01:58:52 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s15sm3282618wmj.41.2020.07.14.01.58.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 01:58:51 -0700 (PDT)
Date: Tue, 14 Jul 2020 10:58:50 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH 1/1] drm/amdkfd: Add IPC API
Message-ID: <20200714085850.GX3278063@phenom.ffwll.local>
References: <20200714031435.13362-1-Felix.Kuehling@amd.com>
 <20200714031435.13362-2-Felix.Kuehling@amd.com>
 <CAPM=9tzjQGg2OMrptD6qJv0yEvY+S7mS6oXNxe21UoWk+6-Ung@mail.gmail.com>
 <4245d340-f4f6-eeb5-40a6-3afd7754852c@amd.com>
 <CAPM=9tz3UC8VuP=n_OAF5LnAmXSVR32LztqeEWtssnodMj70dQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPM=9tz3UC8VuP=n_OAF5LnAmXSVR32LztqeEWtssnodMj70dQ@mail.gmail.com>
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Felix Kuehling <felix.kuehling@amd.com>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 14, 2020 at 02:26:36PM +1000, Dave Airlie wrote:
> On Tue, 14 Jul 2020 at 14:09, Felix Kuehling <felix.kuehling@amd.com> wrote:
> >
> > Am 2020-07-13 um 11:28 p.m. schrieb Dave Airlie:
> > > On Tue, 14 Jul 2020 at 13:14, Felix Kuehling <Felix.Kuehling@amd.com> wrote:
> > >> This allows exporting and importing buffers. The API generates handles
> > >> that can be used with the HIP IPC API, i.e. big numbers rather than
> > >> file descriptors.
> > > First up why? I get the how.
> >
> > The "why" is compatibility with HIP code ported from CUDA. The
> > equivalent CUDA IPC API works with handles that can be communicated
> > through e.g. a pipe or shared memory. You can't do that with file
> > descriptors.
> 
> Okay that sort of useful information should definitely be in the patch
> description.
> 
> >
> > https://docs.nvidia.com/cuda/cuda-runtime-api/group__CUDART__DEVICE.html#group__CUDART__DEVICE_1g8a37f7dfafaca652391d0758b3667539
> >
> > https://docs.nvidia.com/cuda/cuda-runtime-api/group__CUDART__DEVICE.html#group__CUDART__DEVICE_1g01050a29fefde385b1042081ada4cde9
> >
> > >
> > >> + * @share_handle is a 128 bit random number generated with
> > >> + * @get_random_bytes. This number should be very hard to guess.
> > >> + * Knowledge of the @share_handle implies authorization to access
> > >> + * the shared memory. User mode should treat it like a secret key.
> > >> + * It can be used to import this BO in a different process context
> > >> + * for IPC buffer sharing. The handle will be valid as long as the
> > >> + * underlying BO exists. If the same BO is exported multiple times,
> > > Do we have any examples of any APIs in the kernel that operate like
> > > this? That don't at least layer some sort of file permissions  and
> > > access control on top?
> >
> > SystemV shared memory APIs (shmget, shmat) work similarly. There are
> > some permissions that can be specified by the exporter in shmget.
> > However, the handles are just numbers and much easier to guess (they are
> > 32-bit integers). The most restrictive permissions would allow only the
> > exporting UID to attach to the shared memory segment.
> >
> > I think DRM flink works similarly as well, with a global name IDR used
> > for looking up GEM objects using global object names.
> 
> flink is why I asked, because flink was a mistake and not one I'd care
> to make again.
> shm is horrible also, but at least has some permissions on what users
> can attack it.

Yeah this smells way too much like flink. I had the same reaction, and
kinda sad that we have to do this because nvidia defines how this works
with 0 input from anyone else. Oh well, the world sucks.

> > > The reason fd's are good is that combined with unix sockets, you can't
> > > sniff it, you can't ptrace a process and find it, you can't write it
> > > out in a coredump and have someone access it later.
> >
> > Arguably ptrace and core dumps give you access to all the memory
> > contents already. So you don't need the shared memory handle to access
> > memory in that case.
> 
> core dumps might not dump this memory though, but yeah ptrace would
> likely already mean you have access.
> 
> > > Maybe someone who knows security can ack merging this sort of uAPI
> > > design, I'm not confident in what it's doing is in any ways a good
> > > idea. I might have to ask some people to take a closer look.
> >
> > Please do. We have tried to make this API as secure as possible within
> > the constraints of the user mode API we needed to implement.
> 
> I'll see if I hear back, but also if danvet has any input like I
> suppose it's UUID based buffer access, so maybe 128-bit is enough and
> you have enough entropy not to create anything insanely predictable.

So one idea that crossed my mind is if we don't want to do this as a
generic dma-buf handle converter.

Something like /dev/dri/cuda_is_nasty (maybe slightly nicer name) which
provides a generic dma-buf <-> cuda uuid converter. With separate access
restrictions, so admins can decide whether they want to allow this
silliness, or not. Anyone else who wants to reimplement cuda will need
this too, so that's another reason for splitting this out.

Wrt security: I think assuming that there's none and the lookup has a
side-channel you can use to efficiently scan the entire range is probably
the safe approach here. This is way out of my league, but I think people
who know how to do this won't have a much harder time scanning this than
the flink space.

Also, if we have one common uuid->dma-buf converter, we might actually
have a chance to proof the "it's not secure" assumption wrong. Also, we
might be able to tie this into cgroups or namespaces or similar that way.

Just some thoughts to give my initial "eek, why this" reaction a bit more
substance :-) No idea whether this would work or make more sense.

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
