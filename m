Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4643545EC2
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 10:22:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEC5811AFFA;
	Fri, 10 Jun 2022 08:22:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6688C11AFEF;
 Fri, 10 Jun 2022 08:22:19 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id w20so20019583lfa.11;
 Fri, 10 Jun 2022 01:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=w9pgw1jwWO7bdJ9CHLzmXKn5jqjBtqLxIb41V0zta8s=;
 b=C6KwyZ2lZw0qDb7/mIvD1mfXmPJopwBFo+NZ2CoRL1alVBXpyK2pxq6PhLqeRGlAlG
 ABwh38BU9l5bZL4fMAtZ9YItzNZ8jQLWbEZmf+BgQm3WY6ueHbZx6fF3A/pFzybs4OxZ
 GUCNhBC14nBBdpuVN1zWAcA/UspztqcQ2jjbKuc6KCechsmxVaBVohFCQ7oDG3JgKrnD
 nsBL8gTiOVmUPBwOypCVMi2HhhDsvbiIn2dOmOPeZL0of/fqtOiKKnDGYkB5YiTbiA78
 0heHmWDX0jhQWnuxD9BnI02m+azRyAjxnQqZqsko+WyR5TjI1qF+N528kmLHIJtwP+rc
 3CWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=w9pgw1jwWO7bdJ9CHLzmXKn5jqjBtqLxIb41V0zta8s=;
 b=IXoI963wWhB5fDDQsUyQQ9ktVJ6Vaoiiybrq3HEi/F1pstJFFb4m6tTbMm/+QRvlg6
 HeYBI8oITQuyhQGBpohYlngZc1WF3jK7g0/mf8lnU56GoGsb6klf6j77cjy5/UssXebu
 jnaktc7ufGB4LnC5RF6m8JC3R2MzREK+KPeU6Xkr4yAs0ccERQGr/vYECbkCYGwE+c+d
 yZUnoHR3fa6Pwxul1l2nOHIVNS+4rq/boJFOWK2PqZrGmWc8o1syp9UHVu9QWVm8kFGo
 boChDf5fdwE+23Zu4QKzaR9rx6KQmyWzISLahoegG86H31OBe6hVirDIQPBGvrTY09dW
 YzgQ==
X-Gm-Message-State: AOAM533Hmo8klV2wG/2NwUiBaep91qtaPKwb89eb08URYUEAhHxpa3Bz
 6uh+GGNHuNtXPiin6AXCG8M=
X-Google-Smtp-Source: ABdhPJxTJaJeKZYe1oc2D1VNNs2Z77mYadTL0WHW5sskb4/zT2pON4wgaAO4j8RunCEFcBQ3SrTovA==
X-Received: by 2002:a05:6512:2249:b0:478:f926:ad7 with SMTP id
 i9-20020a056512224900b00478f9260ad7mr31272334lfu.511.1654849337231; 
 Fri, 10 Jun 2022 01:22:17 -0700 (PDT)
Received: from gmail.com (host-78-79-230-198.mobileonline.telia.com.
 [78.79.230.198]) by smtp.gmail.com with ESMTPSA id
 u18-20020ac258d2000000b004796e1555eesm1483397lfo.199.2022.06.10.01.22.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 01:22:16 -0700 (PDT)
Date: Fri, 10 Jun 2022 10:22:14 +0200
From: Jonas =?iso-8859-1?Q?=C5dahl?= <jadahl@gmail.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH 0/6] drm: Add mouse cursor hotspot support to atomic KMS
Message-ID: <YqL/NrP/2Q+4Z3lA@gmail.com>
References: <20220602154243.1015688-1-zack@kde.org>
 <wRnf-Lm5zz6v1e-NlnFPteyARuLl-R98mOZZVjePHD5ue7QQNR_TSU7RwYBssgUa7xM5hf7Fe59-gMEj81ESrHY3mu_H7yE0dtGhFHFPTnc=@emersion.fr>
 <20220607110707.02eccda5@eldfell>
 <197201d5da2c504502b8c2225d6766338b18d732.camel@vmware.com>
 <20220608105338.22592a09@eldfell>
 <0485fdf9844f8c89cd5670096b78f8090378b2a1.camel@vmware.com>
 <20220610104931.29e1d172@eldfell>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220610104931.29e1d172@eldfell>
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
Cc: Martin Krastev <krastevm@vmware.com>, "airlied@linux.ie" <airlied@linux.ie>,
 Maaz Mombasawala <mombasawalam@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "gurchetansingh@chromium.org" <gurchetansingh@chromium.org>,
 "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "wayland-devel@lists.freedesktop.org" <wayland-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 10, 2022 at 10:49:31AM +0300, Pekka Paalanen wrote:
> On Thu, 9 Jun 2022 19:39:39 +0000
> Zack Rusin <zackr@vmware.com> wrote:
> 
> > On Wed, 2022-06-08 at 10:53 +0300, Pekka Paalanen wrote:
> > > On Tue, 7 Jun 2022 17:50:24 +0000
> > > Zack Rusin <zackr@vmware.com> wrote:
> > >   
> > > > On Tue, 2022-06-07 at 11:07 +0300, Pekka Paalanen wrote:  
> > > > > On Fri, 03 Jun 2022 14:14:59 +0000
> > > > > Simon Ser <contact@emersion.fr> wrote:
> > > > >     
> > > > > > Hi,
> > > > > > 
> > > > > > Please, read this thread:
> > > > > > https://lists.freedesktop.org/archives/dri-devel/2020-March/thread.html#259615
> > > > > > 
> > > > > > It has a lot of information about the pitfalls of cursor hotspot and
> > > > > > other things done by VM software.
> > > > > > 
> > > > > > In particular: since the driver will ignore the KMS cursor plane
> > > > > > position set by user-space, I don't think it's okay to just expose
> > > > > > without opt-in from user-space (e.g. with a DRM_CLIENT_CAP).
> > > > > > 
> > > > > > cc wayland-devel and Pekka for user-space feedback.
> > > > > > 
> > > > > > On Thursday, June 2nd, 2022 at 17:42, Zack Rusin <zack@kde.org> wrote:
> > > > > >     
> > > > > > > - all userspace code needs to hardcore a list of drivers which require
> > > > > > > hotspots because there's no way to query from drm "does this driver
> > > > > > > require hotspot"      
> > > > > > 
> > > > > > Can you elaborate? I'm not sure I understand what you mean here.
> > > > > >     
> > > > > 
> > > > > Hi Zack and everyone,
> > > > > 
> > > > > I would like to try to reboot this discussion and explain where I come
> > > > > from. Maybe I have misunderstood something.    
> > > > 
> > > > <snip> First of all thanks for restarting the discussions. I think Gerd did a good
> > > > job responding to individual points, so let me take a step back and explain the big
> > > > picture here so we can reboot.
> > > >   
> > > > > Which root problems do you want to solve exactly?    
> > > > 
> > > > The problem that this patch set is solving is the relatively trivial problem of not
> > > > having a way of setting the hotspot in the atomic kms interface. When we
> > > > (virtualized drivers) are using the native cursor we need to know not only the image  
> > > 
> > > Could you clarify what is "native cursor" here?
> > > I guess it is the host window system pointer's cursor?  
> > 
> > Right, exactly. I'm a little hesitant to call it "host" because it gets tricky in
> > remote scenarios, where the host is some ESXi server but the local machine is the
> > one that's actually interacting with the guest. So it's the cursor of the machine
> > where the guest screen is displayed.
> > 
> > 
> > > > Now, where the disagreements come from is from the fact that all virtualized drivers
> > > > do not implement the atomic KMS cursor plane contract exactly as specified. In
> > > > atomic kms with universal planes the "cursor" plane can be anything so asking for
> > > > hotspot's for something that's not a cursor is a bit silly (but arguably so is
> > > > calling it a cursor plane and then complaining that people expect cursor in it).
> > > > 
> > > > So the argument is that we can't put hotspot data into atomic kms without first
> > > > rewriting all of the virtualized drivers cursor code to fix the underlying contract
> > > > violation that they all commit. That would likely be a lot easier sell if not that
> > > > gnome/kde don't put none cursor stuff in the cursor plane, so all this work is to
> > > > fix breakages that seem to affect 0 of our users (and I completely understand that
> > > > we'd still like all the drivers to be correct and unified in terms of their
> > > > behaviour, I'm just saying it's a hard sell without something that we can point to
> > > > and say "this fixes/improves things for our customers")   
> > > 
> > > What's the cost of making paravirtualized drivers honour the UAPI contract?
> > > Can't you do that on the side of implementing these new hotspot
> > > properties, with the little addition to allowing guest userspace to be
> > > explicit about whether it supports commandeering or not?  
> > 
> > I'm reluctant here because "fixing" here seems to be a bit ephemeral as we move from
> > one solution to the next. I'm happy to write a patch that's adding a
> > DRM_CLIENT_CAP_VIRTUAL_CURSOR_AWARE flag and hiding the cursor plane in virtualized
> > drivers for clients that advertise DRM_CLIENT_CAP_ATOMIC but not
> > DRM_CLIENT_CAP_VIRTUAL_CURSOR_AWARE, but that doesn't solve Weston on virtualized
> > drivers.
> 
> Mind, I have not talked about hiding cursor planes. I have talked
> *only* about stopping commandeering cursor planes if guest userspace
> does not indicate it is prepared for commandeering.
> 
> I don't understand how it does not "solve on Weston on virtualized
> drivers". Can you explain what is not solved?
> 
> As far as I can see, it does solve Weston: it makes cursor plane
> behaviour correct from KMS UAPI contract point of view. Anything that
> is not quite optimal after that with cursor planes you can blame on
> Weston not making use of additional optional features.
> 
> Cursor plane itself is an additional optional feature. Userspace has no
> obligation to use one at all, but if it does, it better behave by the
> UAPI contract.
> 
> > I feel like that's a larger discussion. One that we need to have in general - it's
> > about standardising on behaviour of userspace with virtualized drivers, e.g. on
> > Weston even the most basic functionality of virtualized drivers which is resizing a
> > window doesn't work correctly (virtualized drivers send drm_kms_helper_hotplug_event
> > which sends a HOTPLUG=1 event with a changed preferred width/height but Weston
> > doesn't seem to resize the fb on them which results in Weston not resizing to the
> > new size of the window) or even considering the suggested_x and suggested_y
> > properties. It seems like we might need to have a wider discussion on standardising
> > those common issues on virtualized drivers because currently, I'm guessing, that
> > apart from Gnome and KDE most compositors are completely broken on virtualized
> > drivers.
> 
> You say "broken", I say "not implemented yet". *Those* problems are
> Weston's own problems. They are new features that require explicit
> support in Weston. No driver should try to implement those behind guest
> userspace back.
> 
> This "not resizing" is not at all the same as the cursor plane
> commandeering. Weston not supporting KMS-induced resizing does not
> silently result in fundamentally incorrect behaviour. The CRTC size
> remains the same, and nothing is actually broken. Only the end user
> cannot seem to resize the viewer window, but everything works fine
> otherwise. OTOH, when the VM stack commandeers the cursor plane without
> permission, it breaks things so bad that user interaction is near
> impossible. And it's a violation of the KMS UAPI contract.
> 
> If we are looking at things virtual drivers make strange, another thing
> is that Weston is not expecting KMS pageflips to complete always
> immediately regardless of the programmed refresh rate and "hardware"
> refresh cycle phase. It is only luck that Weston does not end up in a
> busy-loop updating the screen on virtual drivers, not intentional. We
> can have a similar discussion there, are KMS drivers in general allowed
> to complete atomic flips always immediately even if userspace asks for
> vsync'd flips, or does it require explicit userspace opt-in.
> 
> > I'd prefer not blocking fixing hotspots until all those issues are resolved so if we
> > can agree on what we'd like to fix before hotspots go in, that'd be great.
> 
> I think you are confusing things here. In my mind there is no doubt
> about the KMS UAPI contract on cursor planes: commandeering is not
> allowed. You have to add new UAPI to allow the VM stack to commandeer
> cursor planes, and guest userspace must opt-in for that.
> 
> How you design that is up to you. Maybe a new client cap, or maybe you
> inspect every atomic commit did the userspace set the hotspot
> properties this time or not. The main thing is that this has been
> thought about and documented.
> 
> I really do not see why adding that detail is so big deal, while not
> adding that will leave virtual drivers fundamentally broken (incorrect
> behaviour resulting from violating the KMS UAPI contract) for cursor
> planes.
> 
> -----
> 
> Maybe we need to take another step back. Why are virtual drivers
> specifically DRM KMS drivers? Was the idea not that if virtual drivers
> pretend to be KMS drivers, we would not need to patch userspace? But
> now we need to patch userspace anyway, so why bother with KMS and its
> design limitations that are well appropriate for hardware drivers but
> not for virtual drivers? If you had your own winsys virtualization
> protocol, you could do so much more than KMS is ever going to allow
> you, and so much better.

From a user space perspective and distribution developer perspective,
having virtual machines virtualize not only disks, memory and network
cards but also GPUs and input devices is very helpful. Naturally there
are alternative methods to getting content of a graphical session from a
virtualized environment, e.g. RDP, without involving KMS, but when a
virtual machine is used for running arbitrary distributions, e.g. for
testing purposes, one wouldn't test the actual distribution if the
graphical session didn't use the APIs otherwise used, so discussing
whether we need this or not seems quite orthogonal to the issue at hand.

I get that using the cursor plane the way virtual machines use them is
problematic right now and method to get the expected behavior from both
sides is needed, but the fact that there is minor differences in how
hardware is virtualized and how it behaves in the real world (the same
applies to e.g. pointer devices) is not a reason to say virtualization
via KMS and evdev isn't needed, and it should be unblocked to allow
using atomic mode setting to get the expected behavior.

No matter what, to use atomic mode setting together with virtual
machines, user space needs patching, but patching by enabling a client
cap or equivalent is not comparable to introducing a whole new subsystem
using something other than KMS.

From mutter's perspective, all we need is a way to set hotspots on
cursor planes, and we can use atomic mode setting instead of the
non-atomic paths that we currently fall back to for virtual machine
drivers.

Simon's suggestion of using a client capability for exposing the hotspot
property, and not exposing the x,y coordinate of the cursor plane would
be a completely acceptable, as it'd allow us to eventually migrate away
from the deny list we have in place.



Jonas

> 
> Or just, you know, use RDP, VNC, and whatnot there already exists.
> 
> Why KMS?
> 
> That's probably obvious to you, but not me.
> 
> I would also like to point out that I am not a kernel developer and I
> have no NAK/veto rights on any kernel patches. I can only explain how
> things look like from userspace perspective.
> 
> I suspect there is nothing more I can say. Those were my opinions, but
> the decisions are up to kernel maintainers. Hence, I can agree to
> disagree with you.
> 
> 
> Thanks,
> pq


