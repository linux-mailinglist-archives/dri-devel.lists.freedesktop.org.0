Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 741AF62D71F
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 10:35:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D692F10E590;
	Thu, 17 Nov 2022 09:35:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9703610E590
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 09:35:38 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id n12so3550788eja.11
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 01:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9FT4n1wjg5nORyNmE5mwITth+m4dxBnfwmgGDsONNwY=;
 b=FOWB3hyB3Kd8JoJLo5QF1W+7xmsqIjuDHTVD6rAXxB7bX7Y0LKlEyX84RuRXELLE0E
 5TS+kcfY6CvArwqES+0/oyD/l5GIuVupMqe0VMC5PBnMeZxRRIJBfvt7ASakYK7tjIrJ
 bEtsHwQXJhUGgZqtbbnDHTGV/ghpd+CKFyrVw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9FT4n1wjg5nORyNmE5mwITth+m4dxBnfwmgGDsONNwY=;
 b=BRgKMZIeh3DeIDZzYYpYpjoU1GEkZw+vvmTPH93gmGOauHz0OmQZpO9V1et1d974px
 j+Wuzp4gfgfwf82c33lthMiE71kahanNFsQieRYj0iUKio+UJahA+gRaC44S+TsH70JS
 A5yAO4RCVc62EnqKQEOjlQOQkRk+iYb1VTGEZYC/BqMvUYXw3iByB9NMmum6jEkkV/Ux
 zErTMxBPvR1k5RWfeys1e20qV1whVdIAGj0kJVDr3mBHaB+/xAwgXIzvr20KepSNZLbL
 oGQRmMV+hEx4F06Qzqm9rJIozNmLLmkSyERMq9SFbGAm5gsAf+LmRvTa9KDWgk1R8G3r
 96yg==
X-Gm-Message-State: ANoB5pl793JpvisGZ0mRWYPiMacTK5hvS8ZLQPiPZbviIxPgz08lJwKd
 kshIxUb2IsydCQR02RvWzJ3UHlKoMdyCIg==
X-Google-Smtp-Source: AA0mqf5qdSN7QT91sHmNnspXsH7UHk6AepIe+P18M3p/Dbxr+UCgomfLjxCaUFzgz9SVK029wFUj3Q==
X-Received: by 2002:a17:906:ef1:b0:78d:260d:a6e4 with SMTP id
 x17-20020a1709060ef100b0078d260da6e4mr1424453eji.93.1668677736912; 
 Thu, 17 Nov 2022 01:35:36 -0800 (PST)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com.
 [209.85.218.48]) by smtp.gmail.com with ESMTPSA id
 en20-20020a056402529400b00461bb7e7ef1sm294129edb.30.2022.11.17.01.35.34
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Nov 2022 01:35:34 -0800 (PST)
Received: by mail-ej1-f48.google.com with SMTP id t25so3589933ejb.8
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 01:35:34 -0800 (PST)
X-Received: by 2002:a17:906:a889:b0:7ad:bd02:f491 with SMTP id
 ha9-20020a170906a88900b007adbd02f491mr1470272ejb.703.1668677733356; Thu, 17
 Nov 2022 01:35:33 -0800 (PST)
MIME-Version: 1.0
References: <20221020121316.3946-1-christian.koenig@amd.com>
 <3d7353f3fa5905ce18e5b2d92f758f098189bc5a.camel@pengutronix.de>
 <7f5eff36-6886-bb06-061a-dd4263b61605@gmail.com>
 <f5de84cfe81fee828bbe0d47d379028d28ef6ca6.camel@pengutronix.de>
 <e02cedc2-6741-8813-a7a5-f8769e301745@gmail.com>
 <a53e5df51ec0f2f9d4c2d377c0cc5ba85f2e58ff.camel@ndufresne.ca>
 <9d716641-55c6-1590-26c2-1c3b14a28226@gmail.com>
 <CAPj87rMPkmimR_RJHhxYZokH__TVpPArk0h6drOUSx7Z9+oAHA@mail.gmail.com>
 <11a6f97c-e45f-f24b-8a73-48d5a388a2cc@gmail.com>
 <caf4d6b82843788db97555a58bc9e33915e5b50a.camel@ndufresne.ca>
 <b422be59-4b4b-2d0d-8e8c-b19f27c6832e@gmail.com>
 <4fa4e5d3b1f46e46139bad069cbf5e795e63afa8.camel@pengutronix.de>
 <cc091a11-d012-d998-b7e2-8b3d616867a7@gmail.com>
 <0abc6efddb8dfc1888de15a1bedaaac6688fd078.camel@pengutronix.de>
 <1e2a6750-9849-e9ee-69d6-e4bfdcfb64f3@gmail.com>
In-Reply-To: <1e2a6750-9849-e9ee-69d6-e4bfdcfb64f3@gmail.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Thu, 17 Nov 2022 18:35:21 +0900
X-Gmail-Original-Message-ID: <CAAFQd5B+VHs62M5Wf2L-xOw=_PoaXT+akAySkeZc75HeA3d0jQ@mail.gmail.com>
Message-ID: <CAAFQd5B+VHs62M5Wf2L-xOw=_PoaXT+akAySkeZc75HeA3d0jQ@mail.gmail.com>
Subject: Re: Try to address the DMA-buf coherency problem
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: Nicolas Dufresne <nicolas@ndufresne.ca>, linaro-mm-sig@lists.linaro.org,
 ppaalanen@gmail.com, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, sumit.semwal@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian and everyone,

On Thu, Nov 3, 2022 at 4:14 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 02.11.22 um 18:10 schrieb Lucas Stach:
> > Am Mittwoch, dem 02.11.2022 um 13:21 +0100 schrieb Christian K=C3=B6nig=
:
> > [SNIP]
> >> It would just be doing this for the importer and exactly that
> >> would be bad design because we then have handling for the display driv=
er
> >> outside of the driver.
> >>
> > The driver would have to do those cache maintenance operations if it
> > directly worked with a non-coherent device. Doing it for the importer
> > is just doing it for another device, not the one directly managed by
> > the exporter.
> >
> > I really don't see the difference to the other dma-buf ops: in
> > dma_buf_map_attachment the exporter maps the dma-buf on behalf and into
> > the address space of the importer. Why would cache maintenance be any
> > different?
>
> The issue here is the explicit ownership transfer.
>
> We intentionally decided against that because it breaks tons of use
> cases and is at least by me and a couple of others seen as generally
> design failure of the Linux DMA-API.

First of all, thanks for starting the discussion and sorry for being
late to the party. May I ask you to keep me on CC for any changes that
touch the V4L2 videobuf2 framework, as a maintainer of it? I'm okay
being copied on the entire series, no need to pick the specific
patches. Thanks in advance.

I agree that we have some design issues in the current DMA-buf
framework, but I'd try to approach it a bit differently. Instead of
focusing on the issues in the current design, could we write down our
requirements and try to come up with how a correct design would look
like? (A lot of that has been already mentioned in this thread, but I
find it quite difficult to follow and it might not be a complete view
either.)

That said, let me address a few aspects already mentioned, to make
sure that everyone is on the same page.

>
> DMA-Buf let's the exporter setup the DMA addresses the importer uses to
> be able to directly decided where a certain operation should go. E.g. we
> have cases where for example a P2P write doesn't even go to memory, but
> rather a doorbell BAR to trigger another operation. Throwing in CPU
> round trips for explicit ownership transfer completely breaks that concep=
t.

It sounds like we should have a dma_dev_is_coherent_with_dev() which
accepts two (or an array?) of devices and tells the caller whether the
devices need explicit ownership transfer. Based on that, your drivers
would install the DMA completion (presumably IRQ) handlers or not.
It's necessary since it's not uncommon that devices A and B could be
in the same coherency domain, while C could be in a different one, but
you may still want them to exchange data through DMA-bufs. Even if it
means the need for some extra round trips it would likely be more
efficient than a full memory copy (might not be true 100% of the
time).

>
> Additional to that a very basic concept of DMA-buf is that the exporter
> provides the buffer as it is and just double checks if the importer can
> access it. For example we have XGMI links which makes memory accessible
> to other devices on the same bus, but not to PCIe device and not even to
> the CPU. Otherwise you wouldn't be able to implement things like secure
> decoding where the data isn't even accessible outside the device to
> device link.

Fully agreed.

>
> So if a device driver uses cached system memory on an architecture which
> devices which can't access it the right approach is clearly to reject
> the access.

I'd like to accent the fact that "requires cache maintenance" !=3D "can't a=
ccess".

>
> What we can do is to reverse the role of the exporter and importer and
> let the device which needs uncached memory take control. This way this
> device can insert operations as needed, e.g. flush read caches or
> invalidate write caches.
>

(Putting aside the cases when the access is really impossible at all.)
Correct me if I'm wrong, but isn't that because we don't have a proper
hook for the importer to tell the DMA-buf framework to prepare the
buffer for its access?

> This is what we have already done in DMA-buf and what already works
> perfectly fine with use cases which are even more complicated than a
> simple write cache invalidation.
>
> >>>> This is just a software solution which works because of coincident a=
nd
> >>>> not because of engineering.
> >>> By mandating a software fallback for the cases where you would need
> >>> bracketed access to the dma-buf, you simply shift the problem into
> >>> userspace. Userspace then creates the bracket by falling back to some
> >>> other import option that mostly do a copy and then the appropriate
> >>> cache maintenance.
> >>>
> >>> While I understand your sentiment about the DMA-API design being
> >>> inconvenient when things are just coherent by system design, the DMA-
> >>> API design wasn't done this way due to bad engineering, but due to th=
e
> >>> fact that performant DMA access on some systems just require this kin=
d
> >>> of bracketing.
> >> Well, this is exactly what I'm criticizing on the DMA-API. Instead of
> >> giving you a proper error code when something won't work in a specific
> >> way it just tries to hide the requirements inside the DMA layer.
> >>
> >> For example when your device can only access 32bits the DMA-API
> >> transparently insert bounce buffers instead of giving you a proper err=
or
> >> code that the memory in question can't be accessed.
> >>
> >> This just tries to hide the underlying problem instead of pushing it
> >> into the upper layer where it can be handled much more gracefully.
> > How would you expect the DMA API to behave on a system where the device
> > driver is operating on cacheable memory, but the device is non-
> > coherent? Telling the driver that this just doesn't work?
>
> Yes, exactly that.
>
> It's the job of the higher level to prepare the buffer a device work
> with, not the one of the lower level.

What are higher and lower levels here?

As per the existing design of the DMA mapping framework, the framework
handles the system DMA architecture details and DMA master drivers
take care of invoking the right DMA mapping operations around the DMA
accesses. This makes sense to me, as DMA master drivers have no idea
about the specific SoCs or buses they're plugged into, while the DMA
mapping framework has no idea when the DMA accesses are taking place.

>
> In other words in a proper design the higher level would prepare the
> memory in a way the device driver can work with it, not the other way
> around.
>
> When a device driver gets memory it can't work with the correct response
> is to throw an error and bubble that up into a layer where it can be
> handled gracefully.
>
> For example instead of using bounce buffers under the hood the DMA layer
> the MM should make sure that when you call read() with O_DIRECT that the
> pages in question are accessible by the device.
>

I tend to agree with you if it's about a costly software "emulation"
like bounce buffers, but cache maintenance is a hardware feature
existing there by default and it's often much cheaper to operate on
cached memory and synchronize the caches rather than have everything
in uncached (or write-combined) memory.

> > It's a use-case that is working fine today with many devices (e.g. netw=
ork
> > adapters) in the ARM world, exactly because the architecture specific
> > implementation of the DMA API inserts the cache maintenance operations
> > on buffer ownership transfer.
>
> Yeah, I'm perfectly aware of that. The problem is that exactly that
> design totally breaks GPUs on Xen DOM0 for example.
>
> And Xen is just one example, I can certainly say from experience that
> this design was a really really bad idea because it favors just one use
> case while making other use cases practically impossible if not really
> hard to implement.

Sorry, I haven't worked with Xen. Could you elaborate what's the
problem that this introduces for it?

Best regards,
Tomasz
