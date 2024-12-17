Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B45E9F514F
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 17:43:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FC7B10E279;
	Tue, 17 Dec 2024 16:43:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="GJ9vAQ/r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6D0B10E279
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 16:43:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A973D24000E;
 Tue, 17 Dec 2024 16:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1734453779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y3On92C8rwOU59YJ8LWHk+H1D2wQBNVBymTC7a95pjM=;
 b=GJ9vAQ/rwPcfcxoYjcP19kiCoZifzmpSw2T5cignF/Q6CI11xsZQHHpR7j5XXLQMlqjFWE
 dMN0Tx+W7lXjuJRTbxP1rqV9vRxSTMLJ50i2VP72OwD9Ln3C+CQBANspyBIhwMx5u6lOTY
 zP/wO30hthkzLOFHpH5MYMc/A9j63OF2Z9ZpE4iqSKDjsL+w5GbARqxJDmru2C6EBk8z8b
 M+sxZB2xTE1GXjKdeitB3z4nr+ma9HXw2Sj11vpScuJFh8GLpK7dWNPt/8GzXY4xXcOz8q
 WUdLwV7eJOEpUKX+Xhu6OMy4KQNYYmSx+xZXzNDQ4fiUmpXUgctOLjWUpsHP4w==
Date: Tue, 17 Dec 2024 17:42:56 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
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
Message-ID: <Z2GqEOiVkdgB3IXy@louis-chauvet-laptop>
Mail-Followup-To: Maxime Ripard <mripard@kernel.org>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
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
References: <20241122-google-config-fs-v2-0-4b7e6f183320@bootlin.com>
 <Z0DC8nd1ZFN4A82-@louis-chauvet-laptop>
 <20241126-overjoyed-knowing-cuttlefish-c8d0f6@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241126-overjoyed-knowing-cuttlefish-c8d0f6@houat>
X-GND-Sasl: louis.chauvet@bootlin.com
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

> > Hi all,
> > 
> > I am also currently working on MST emulation for VKMS. If someone can read 
> > what I already did and at tell me if my implementation seems on the right 
> > track it could be nice.
> > 
> > The current status is not very advanced: I can emulate a mst HUB, but not 
> > a screen. I am currently working on properly emulating the HUB by using an 
> > other hub.
> > 
> > You can find the branch for this work here:
> > https://gitlab.freedesktop.org/louischauvet/kernel/-/tree/b4/vkms-mst
> 
> I think this is exactly the kind of things where we'll want eBPF I
> think. There's no way you'll be able to model each possible test
> scenarios for MST through configfs, even more so with a stable
> interface.

I just spent some time to think about it. I agree that eBPF seems 
applicable: we want to allows userspace to emulate any MST device, and we 
don't want to create huge uAPI + whole emulation in the kernel.

As most of the protocol is similar accros device kind, I currently built 
my code around the struct vkms_mst_sideband_helpers to specify only the 
changed behavior (this way the "write to registers" "parse command"... is 
only done in one place). The choice of function is not definitive at all 
(it was just practical at this moment).

With eBPF, I know three different way to attach programs to the kernel:
 - Using a kprobe/attaching to a function: I can change the behavior of 
   all the device, there is no way "attach prog1 to hub" and "attach prog2 
   to screen1", it will be "attach prog1 to the function 
   `vkms_mst_emulator_handle_transfer_write`, and all the device will be 
   affected. This should be very easy to implement (maybe it already 
   works without modification?), but very limited / make userspace stuff 
   very ugly => Not ideal at all
 - Creating a whole architecture to attach eBPF programs in vkms: VKMS 
   manage the list of attached eBPF programs, call them when it needs... 
   This is probably the "most flexible" option (in the sense "VKMS can do 
   whatever we need to fit our usecase"). This seems not trivial to 
   implement (drm complexity + MST complexity + BPF complexity in the same 
   driver seems a bad idea, espicially because VKMS don't have a lot of 
   maintainance and I don't feel confident introducing more complexity)
   => Can work, require some work, but may bring more complexity in VKMS
 - Using BPF struct_ops: I can "simply" create/complete a struct ops for 
   diverse mst callbacks (see the proposition bellow). I looked at some 
   example, this seems to be "easy" to do, and the work in VKMS should be 
   limited.
   => Can work, a bit less flexible than the previous solution, but avoid 
   a lot of complexity

I don't know if I will be able to finish the implementation but I imagine 
something like that may be a nice interface (may be not possible "as is"):

// vkms_mst.c struct_ops that can be filled by userspace with custom 
// functions
// Known limitation: maximum 64 functions in this table
struct vkms_mst_ops {
	// Completly overide the transfer function, so the userspace can 
	// do whatever he wants (even emulating a complex MST tree 
	// without using stuff in vkms)
	handle_transfer(drm_dp_aux_msg); 

	// If default transfer function is used, those are the callback 
	// you can use (again, they will come with default 
	// implementation)
	clear_payload_id_table(..);
	link_address(..);
	enum_path_ressources(..);
	[...]

	// Used to identify this kind of device, in my example the 
	// userspace could register "LG_screen", "dell dock", "HP screen", 
	// and then configure each mst device with the correct kind
	name = "<unique name for this device kind>",

	// If you want to use the default "hub" implementation, but only 
	// tweak one specific behavior, you can use this
	base = "<name of the other structops>"
}


// Needed to implement eBPF struct_ops, called when userspace registers a
// struct_ops of type vkms_mst_ops
void register_struct_ops(new_ops...) {
	vkms_registered_ops.append(new_ops).
}

// In vkms_connector.c
// Callback called by drm core to do transfer on the connector
void vkms_mst_transfer(aux, msg) {
	mst_emulator = get_mst_emulator(aux);

	ops = vkms_registered_ops.search_for(mst_emulator.name);
	ops->handle_transfer(msg);
}

// mst_ebpf.c In the BPF program, userspace side
void handle_transfer(...) {
	[...]
}
struct vkms_mst_ops {
	handle_transfer = handle_transfer;
	name = "lg-screen";
	base = "default-screen"
}

How to use it (screen directly connected to connector, or complete
emulation by the eBPF program):

	gcc mst_ebpf.c
	bpftool register structops mst_ebpf
	# Create vkms device + connector
	mkdir -p /configfs/vkms/mydev/connectors/connector1
	#[skipped initialization of plane/crtc...]
	mkdir -p /configfs/vkms/mydev/mst_devices/device1
	echo "lg-screen" > /configfs/vkms/mydev/mst_devices/device1/name
	ln -s /configfs/vkms/mydev/connectors/connector1/device /configfs/vkms/mydev/mst_devices/device1

How to use it (hub + two screens, using vkms scaffolding to make the
emulation easier) (the idea is to do something like the tcp_congestion 
algorithm, where a few of them are implemented in the kernel, but 
userspace can inject custom implementations):

	bpftool register mst_ebpf_screen1 # struct_ops with name=lg-screen
	bpftool register mst_ebpf_screen2 # struct_ops with name=hp-screen
	#[skiped initialization of vkms dev]
	mkdir -p /configfs/vkms/mydev/mst_devices/screen1
	mkdir -p /configfs/vkms/mydev/mst_devices/screen2
	mkdir -p /configfs/vkms/mydev/mst_devices/hub
	echo "lg-screen" > /configfs/vkms/mydev/mst_devices/screen1/name
	echo "hp-screen" > /configfs/vkms/mydev/mst_devices/screen2/name
	# default-hub is the default hub emulation provided by VKMS
	echo "default-hub" > configfs/vkms/mydev/mst_devices/hub/name
	ln -s /configfs/vkms/mydev/connectors/connector1/device /configfs/vkms/mydev/mst_devices/hub
	ln -s /configfs/vkms/mydev/mst_devices/hub/child1 /configfs/vkms/mydev/mst_devices/screen1
	ln -s /configfs/vkms/mydev/mst_devices/hub/child2 /configfs/vkms/mydev/mst_devices/screen2

A few things that this approach can bring:
 - Full emulation by userspace (just add one device and provide an eBPF
   program that emulates the whole MST chain)
 - Partial emulation of devices (e.g., the default-screen implementation is
   sufficient, but you want to tweak something inside)
 - Full emulation by the kernel, using default implementations (I think
   only hub and screen, just to be able to emulate the "basic"
   configurations)
 - And cool new to reduce the "it should be perfect from the start", if we 
   use kfunc + struct_ops, both can change a little bit over time (kfunc 
   are not part of uAPI and struct_ops allows to add argument/functions). 
   Stabilisation can come later.

What do you think about this idea ?

My current plan is to continue on the "kernel-only" implementation, so I 
can have a working poc, and then switch to the eBPF work after.

Thanks,
Louis Chauvet

> Maxime


