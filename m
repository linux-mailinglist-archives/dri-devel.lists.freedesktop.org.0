Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A97643251F0
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 16:06:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC7DC6ECBF;
	Thu, 25 Feb 2021 15:06:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 151266ECC0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Feb 2021 15:06:24 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id f33so5918081otf.11
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Feb 2021 07:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8X3d7AH7K+QUX1HOFus++mj3s5Je75s5RJZh6MvT3L4=;
 b=XRk5ulULiJaY05e1RegxtKFNw9malgHXFuO2NiuDECmEKeDQ3JqFDwwxDTtkWXdajW
 T04WkZgJeM26WKR9UzMABmB2rlSI9S/r7JU9ymKttt66yWOTqMCavGWTXbwyG5RaQF2s
 BVao4lPzXalDNZQT+jY8MtJGgqgrb+7in6DU8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8X3d7AH7K+QUX1HOFus++mj3s5Je75s5RJZh6MvT3L4=;
 b=VPvfyrAxgr1c4BzbL3YddLg/lhI2B1lYmtl3CCGMG4fOMujkREfrgRWXuNtNwW6OgA
 xmihuCULpw+oR9q/8VFMWhcrDq9MEDtNyW9mgMgQ7eqmnGbrccIfFKLhCzT9w8X3rnfp
 h6uQgk+Cvyje7X0IOZDFmM2gvNHYCGmbfSWoy3Ju8e3KcrC9/KXfHRlZecSdVzGgOVBf
 4dqG3XEss41N6Pu/4cQeFuB5hVrHA/8hxEbrFF6P2i3I1p7HBDTYntqh/1eZUUJsbsk0
 sZXMof8y6R8JbxknSuIlP6TXod/Rgj05JrDT1UopE5YzrSsZl/ZQaFB6r55Qy4xH47AF
 iJVw==
X-Gm-Message-State: AOAM533UruWU33z6r95jR+nNy98bqj239Hm9JhIgH6WCeMdn9sxIIVeo
 P1LLxj/YbEgQbBGPoG8KzYyfG7EaimcRY7Cxg768UA==
X-Google-Smtp-Source: ABdhPJx27Mfpb3Tcx0KPOWahwlh4en7igagQZuJVI/petsFC9Np2XpGcdmkdrXLsANh4L4kuKWypA0FIggT/+IzMzcg=
X-Received: by 2002:a9d:2265:: with SMTP id o92mr2608987ota.188.1614265583119; 
 Thu, 25 Feb 2021 07:06:23 -0800 (PST)
MIME-Version: 1.0
References: <20210224105509.yzdimgbu2jwe3auf@adolin>
 <CAKMK7uFwdHaaGs8BPSAah1Vp5pJWTzxoruLgOWxQu1aDAyCKLQ@mail.gmail.com>
 <20210225102520.uysa4muovemqi66n@sirius.home.kraxel.org>
 <YDd8qOETBy8z/qDh@phenom.ffwll.local>
 <20210225132722.s2deh35qwhan5kkf@sirius.home.kraxel.org>
In-Reply-To: <20210225132722.s2deh35qwhan5kkf@sirius.home.kraxel.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 25 Feb 2021 16:06:12 +0100
Message-ID: <CAKMK7uHSFzq6kw9-1Bhw0RdP524umz9Z3jrqBB-PQfyxCvtixQ@mail.gmail.com>
Subject: Re: [RFC PATCH] drm/vkms: Add support for virtual hardware mode
To: Gerd Hoffmann <kraxel@redhat.com>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Sumera Priyadarsini <sylphrenadin@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Dave Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Melissa Wen <melissa.srw@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 25, 2021 at 2:27 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> On Thu, Feb 25, 2021 at 11:32:08AM +0100, Daniel Vetter wrote:
> > On Thu, Feb 25, 2021 at 11:25:20AM +0100, Gerd Hoffmann wrote:
> > > On Thu, Feb 25, 2021 at 10:09:42AM +0100, Daniel Vetter wrote:
> > > > On Wed, Feb 24, 2021 at 11:55 AM Sumera Priyadarsini
> > > > <sylphrenadin@gmail.com> wrote:
> > > > >
> > > > > Add a virtual hardware or vblank-less mode as a module to enable
> > > > > VKMS to emulate virtual graphic drivers. This mode can be enabled
> > > > > by setting enable_virtual_hw=1 at the time of loading VKMS.
> > > > >
> > > > > A new function vkms_crtc_composer() has been added to bypass the
> > > > > vblank mode and is called directly in the atomic hook in
> > > > > vkms_atomic_begin(). However, some crc captures still use vblanks
> > > > > which causes the crc-based igt tests to crash. Currently, I am unsure
> > > > > about how to approach one-shot implementation of crc reads so I am
> > > > > still working on that.
> > > >
> > > > Gerd, Zack: For virtual hw like virtio-gpu or vmwgfx that does
> > > > one-shot upload and damage tracking, what do you think is the best way
> > > > to capture crc for validation? Assuming that's even on the plans
> > > > anywhere ...
> > > >
> > > > Ideally it'd be a crc that the host side captures, so that we really
> > > > have end-to-end validation, including the damage uploads and all that.
> > >
> > > Disclaimer:  Not knowing much about the crc thing beside having noticed
> > > it exists and seems to be used for display content checking.
> > >
> > > > For vkms we're going for now with one-shot crc generation after each
> > > > atomic flip (or DIRTYFB ioctl call). Will need a pile of igt changes,
> > > > but seems like the most fitting model.
> > > > Other option would be that we'd wire up something on the kernel side
> > > > that generates a crc on-demand every time igt reads a new crc value
> > > > (maybe with some rate limiting). But that's not really how virtual hw
> > > > works when everything is pushed explicitly to the host side.
> > >
> > > igt runs inside the guest, right?
> >
> > Yup. There's some debugfs files for capture crc on a specific CRTC. So
> > supporting this would mean some virtio-gpu revision so you could ask the
> > host side for a crc when you do a screen update, and the host side would
> > send that back to you on a virtio channel as some kind of message.
>
> Waded through the source code a bit.  So, the vkms crc code merges all
> planes (specifically the cursor plane) before calculating the crc.
> Which is a bit of a problem, we try to avoid that and rarely actually
> merge the planes anywhere in the virtualization stack.  Instead we
> prefer to pass through the cursor plane separately, so we can -- for
> example -- use that to simply set the cursor sprite of the qemu gtk
> window.  It's much more snappy because moving+rendering the pointer
> doesn't need a round-trip to the guest then.
>
> So, it would be quite some effort on the host side, we would have to
> merge planes just for crc calculation.
>
> > > You can ask qemu to write out a screen dump.
>
> Hmm, the (hardware) cursor is not in the screen dump either.
>
> A software cursor (when using for example cirrus which has no cursor
> plane) would be there.
>
> > > Another option to access the screen would be vnc.
>
> vnc clients can get the cursor sprite.  They can't get the position
> though, only set it (it's a one-way ticket in the vnc protocol).
> Typically not a problem because desktops set the position in response
> to the pointer events so guest + host position match nevertheless.
> But for test cases which don't look at input events and set the cursor
> to a fixed place this is a problem ...

Hm yeah that sounds like a bit too much to wire through, and kinda
defeats end-to-end testing if qemu would take a separate path for crc
generation.
-Daniel

> > > On-demand crc via debugfs or ioctl would work too, but yes that wouldn't
> > > verify the host-side.  At least not without virtio protocol extensions.
> > > We could add a new command asking the host to crc the display and return
> > > the result for on-demand crc.  Or add a crc request flag to an existing
> > > command (VIRTIO_GPU_CMD_RESOURCE_FLUSH probably).
> >
> > Yup, I think that's what would be needed. The question here is, what do
> > you think would be the most natural way for virtio host side stack to
> > support this?
>
> virtio has feature flags, so we can easily introduce an extension in a
> backward compatible way.  Each command sends a reply, with optional
> payload, so it would make sense to send the crc with the
> VIRTIO_GPU_CMD_RESOURCE_FLUSH reply.
>
> Alternatively introduce a communication channel independent of the gpu,
> using for example virtio-serial or vsock, let the guest send crc
> requests to qemu that way.  Which would work with all qemu display
> devices, not only virtio-gpu.
>
> take care,
>   Gerd
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
