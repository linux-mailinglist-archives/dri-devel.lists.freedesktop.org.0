Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3CAA3BFA2
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 14:15:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECA0310E2C5;
	Wed, 19 Feb 2025 13:15:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="HlrBpo4A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C48C10E2C5
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 13:15:18 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4399ca9d338so3608725e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 05:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1739970917; x=1740575717; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w3OTecTEqjsSEAES6uxVof8pmBHhzPdqSrjoAkg3hp8=;
 b=HlrBpo4Ac8rgNs4gy7YF20JAL22E6U6BydKEoCGcQ3F713I6eIYndOEd22KZrAUHsE
 sAqy1vqPfQUSUEqWLGEyBw+vT0zvTa5eFjiKJEb7xU22GzTKx6fvkVsHEtq/5ZW3PRG1
 brT6VVjvJI1h534H8D6CaoI+MOKiQXw6ldRc0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739970917; x=1740575717;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w3OTecTEqjsSEAES6uxVof8pmBHhzPdqSrjoAkg3hp8=;
 b=u6WISI1EDXJ79rAd+GEpXaOCyhBq/mz+QwNX+PLNoiPklPdDkkwjm5Sks1ZNaVqUlj
 SLFQEtpyTA6mBHcCKlQTORg3dlzzkZlmv8RXvH4C9zjjOugrU2i5cbHn5DFStJk+7dWl
 UIEKqOjZKx3QlrjNUOBA7zl7zRHP6QVH/QEyDXoLW6a8Dew6rn/bav8adUJ9XXuOcgxX
 U4HV4u74mgzzAKwEi6Nonl5fJMYZZReOe56+E+jMLp1SGnYLQMwfPnbboFoT8N4EZOk+
 q/hNS+ggervCukKS20yHfcKJ8kSSsXHiQuTpDnqU4p3adVAhVNLTHtWSFrbUZC3ShNPx
 Na9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNTISIObIwzXgRhaG2CMM9HtLs1WgCdyevmFhh4JNrpBoidlnMlX5chKBydSko0wnTSOOuc6ZntsE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwP8VJdKRGY+treJVDlGYyJbYNI4TZ6wPVCBs/G0Z0cJB4E520v
 vLOoAPP2wkB2uKfGbvEYeTtYpDHqDPQcxpWsg0ockmAAi6rzpw07GPKQDY/blaU=
X-Gm-Gg: ASbGncsPFm6Obtj+1XXInosnBbH0Ohq0Ro6AjlHGnP+foUcznrml2wGk2C5Nf323lID
 qJwFB6QJ2QVKPq3rost6hshG+tbjF96DxxSmGy72Svhx9VvTlczGa/Mc/Tik3WxQ2D7WuCxvemz
 pcFRVBeEufXf3tHpJAvKdent91TBiWaiolvaWWu1LU81xAYGgy4ByiZ4Lv6pNsB9lGqcNWy5rcZ
 GOCrfhmCrFiaADlTtmfKBHcIBLcj6rjfAbgBQS3g5c5BP6lQhtpXW1a7zKBqN3yccsAF3rTvPIO
 AIBUb1OQklTTLXOoS+FPFgXubeA=
X-Google-Smtp-Source: AGHT+IGE7fvrbOOFHZ/7Gk+I4AqiWQLSX38+VDZB/IUMJXu/cJWtD29Bl/wyN9Kx93jnGX+OJlLjRA==
X-Received: by 2002:a05:600c:a4e:b0:439:88bb:d035 with SMTP id
 5b1f17b1804b1-43988bbd4bemr105873155e9.5.1739970916658; 
 Wed, 19 Feb 2025 05:15:16 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258b4118sm18300450f8f.18.2025.02.19.05.15.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 05:15:16 -0800 (PST)
Date: Wed, 19 Feb 2025 14:15:13 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Maxime Ripard <mripard@kernel.org>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>, jose.exposito89@gmail.com,
 dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, nicolejadeyee@google.com
Subject: Re: [PATCH RFC v2 00/16] drm/vkms: ConfigFS interface
Message-ID: <Z7XZYVs6LL1gEzIF@phenom.ffwll.local>
Mail-Followup-To: Maxime Ripard <mripard@kernel.org>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 jose.exposito89@gmail.com, dri-devel@lists.freedesktop.org,
 arthurgrillo@riseup.net, linux-kernel@vger.kernel.org,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, seanpaul@google.com,
 nicolejadeyee@google.com
References: <20241122-google-config-fs-v2-0-4b7e6f183320@bootlin.com>
 <Z0DC8nd1ZFN4A82-@louis-chauvet-laptop>
 <20241126-overjoyed-knowing-cuttlefish-c8d0f6@houat>
 <Z2GqEOiVkdgB3IXy@louis-chauvet-laptop>
 <20250219-versatile-smilodon-of-felicity-cbcc4d@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250219-versatile-smilodon-of-felicity-cbcc4d@houat>
X-Operating-System: Linux phenom 6.12.11-amd64 
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

On Wed, Feb 19, 2025 at 10:28:56AM +0100, Maxime Ripard wrote:
> On Tue, Dec 17, 2024 at 05:42:56PM +0100, Louis Chauvet wrote:
> > Hi,
> > 
> > > > Hi all,
> > > > 
> > > > I am also currently working on MST emulation for VKMS. If someone can read 
> > > > what I already did and at tell me if my implementation seems on the right 
> > > > track it could be nice.
> > > > 
> > > > The current status is not very advanced: I can emulate a mst HUB, but not 
> > > > a screen. I am currently working on properly emulating the HUB by using an 
> > > > other hub.
> > > > 
> > > > You can find the branch for this work here:
> > > > https://gitlab.freedesktop.org/louischauvet/kernel/-/tree/b4/vkms-mst

Can't look at this because it's private.

> > > I think this is exactly the kind of things where we'll want eBPF I
> > > think. There's no way you'll be able to model each possible test
> > > scenarios for MST through configfs, even more so with a stable
> > > interface.
> > 
> > I just spent some time to think about it. I agree that eBPF seems 
> > applicable: we want to allows userspace to emulate any MST device, and we 
> > don't want to create huge uAPI + whole emulation in the kernel.
> > 
> > As most of the protocol is similar accros device kind, I currently built 
> > my code around the struct vkms_mst_sideband_helpers to specify only the 
> > changed behavior (this way the "write to registers" "parse command"... is 
> > only done in one place). The choice of function is not definitive at all 
> > (it was just practical at this moment).
> > 
> > With eBPF, I know three different way to attach programs to the kernel:
> >  - Using a kprobe/attaching to a function: I can change the behavior of 
> >    all the device, there is no way "attach prog1 to hub" and "attach prog2 
> >    to screen1", it will be "attach prog1 to the function 
> >    `vkms_mst_emulator_handle_transfer_write`, and all the device will be 
> >    affected. This should be very easy to implement (maybe it already 
> >    works without modification?), but very limited / make userspace stuff 
> >    very ugly => Not ideal at all
> >  - Creating a whole architecture to attach eBPF programs in vkms: VKMS 
> >    manage the list of attached eBPF programs, call them when it needs... 
> >    This is probably the "most flexible" option (in the sense "VKMS can do 
> >    whatever we need to fit our usecase"). This seems not trivial to 
> >    implement (drm complexity + MST complexity + BPF complexity in the same 
> >    driver seems a bad idea, espicially because VKMS don't have a lot of 
> >    maintainance and I don't feel confident introducing more complexity)
> >    => Can work, require some work, but may bring more complexity in VKMS
> >  - Using BPF struct_ops: I can "simply" create/complete a struct ops for 
> >    diverse mst callbacks (see the proposition bellow). I looked at some 
> >    example, this seems to be "easy" to do, and the work in VKMS should be 
> >    limited.
> >    => Can work, a bit less flexible than the previous solution, but avoid 
> >    a lot of complexity
> > 
> > I don't know if I will be able to finish the implementation but I imagine 
> > something like that may be a nice interface (may be not possible "as is"):
> > 
> > // vkms_mst.c struct_ops that can be filled by userspace with custom 
> > // functions
> > // Known limitation: maximum 64 functions in this table
> > struct vkms_mst_ops {
> > 	// Completly overide the transfer function, so the userspace can 
> > 	// do whatever he wants (even emulating a complex MST tree 
> > 	// without using stuff in vkms)
> > 	handle_transfer(drm_dp_aux_msg); 
> > 
> > 	// If default transfer function is used, those are the callback 
> > 	// you can use (again, they will come with default 
> > 	// implementation)
> > 	clear_payload_id_table(..);
> > 	link_address(..);
> > 	enum_path_ressources(..);
> > 	[...]
> > 
> > 	// Used to identify this kind of device, in my example the 
> > 	// userspace could register "LG_screen", "dell dock", "HP screen", 
> > 	// and then configure each mst device with the correct kind
> > 	name = "<unique name for this device kind>",
> > 
> > 	// If you want to use the default "hub" implementation, but only 
> > 	// tweak one specific behavior, you can use this
> > 	base = "<name of the other structops>"
> > }
> > 
> > 
> > // Needed to implement eBPF struct_ops, called when userspace registers a
> > // struct_ops of type vkms_mst_ops
> > void register_struct_ops(new_ops...) {
> > 	vkms_registered_ops.append(new_ops).
> > }
> > 
> > // In vkms_connector.c
> > // Callback called by drm core to do transfer on the connector
> > void vkms_mst_transfer(aux, msg) {
> > 	mst_emulator = get_mst_emulator(aux);
> > 
> > 	ops = vkms_registered_ops.search_for(mst_emulator.name);
> > 	ops->handle_transfer(msg);
> > }
> > 
> > // mst_ebpf.c In the BPF program, userspace side
> > void handle_transfer(...) {
> > 	[...]
> > }
> > struct vkms_mst_ops {
> > 	handle_transfer = handle_transfer;
> > 	name = "lg-screen";
> > 	base = "default-screen"
> > }
> 
> I don't think MST is the right abstraction there. We should have MST
> related helper functions available to eBPF programs, but we should load
> them at the connector level, ie, implement a full blown connector
> atomic_check for example. It's more flexible and will allow to implement
> other use-cases people have been interested in (like panels).

So since I can't look at the code I'll just drop my thoughts here.

- I think validating the MST helpers implementation should be done with
  kunit tests. So these are out of scope for vkms testing I think
  entirely.

- Next up are the driver implementations. There we might want to be able
  to inject fake mst devices to stress-test driver corner cases. But I
  don't think that's a job for vkms either.

- Now for vkms itself, I think the interesting case here is being able to
  test compositors against funny mst corner-cases, but for that we don't
  really need an mst operation at all. So no dp-aux or anything like that,
  we just hotplug-create connectors with names and PATH property and MST
  type, without any of the kernel-internal presentations for hubs/branch
  points and all that stuff. Because userspace doesn't ever see that.

- Next up is expressing all the funny constraints that can result in,
  across different drivers. For that I think we want ebpf to implement the
  various atomic_check hooks, so that you can implement all the funny
  constraints of mst link bw limitations, but also host-side display
  limitations. And I concur with Maxime that this ebpf support should be
  entirely agnostic and just allow you to attach atomic_check
  implementations to connectors, planes and crtcs. And then maybe one for
  the overall commit, so that global constraints are easier to implement.

So summary: MST testing in vkms only needs to look like MST to userspace.
Internally we'll just hand-roll the entire connector hotplug and leave out
everything else. Because testing driver dp mst implementations and the
helpers is better covered through different means.

Eventually we might want to implement fake i2c and dp-aux implementations
for additional features like TV remote control and fun stuff like that (I
forgot the CEA/HDMI name for these). But I think that's waaaayyyyyy down
the road.

Cheers, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
