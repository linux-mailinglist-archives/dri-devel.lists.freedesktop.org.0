Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CAF6DDEB4
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 17:01:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CA2410E582;
	Tue, 11 Apr 2023 15:01:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1A3810E582
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 15:01:14 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-2efbab477a6so113771f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 08:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1681225273; x=1683817273;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p5X6MAk0ycdyWUIs+bI10cqIdEaTFo7OsdLJazRF6W4=;
 b=I5dJGkU+8/zCsX059XnDP41lbfObXsEprjlJwOEdjXnaMwmF/xe4879vsPOSYbvLeN
 GjOI4IuIHRrfsIYOhkeGkS1pTC10qm94MV82STUC5efmZvozDMMfs/NXdg2W1JSjXn8L
 HJj7rUW7GOULQiR9TtLDhNb0/nN8O4XhvIqN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681225273; x=1683817273;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p5X6MAk0ycdyWUIs+bI10cqIdEaTFo7OsdLJazRF6W4=;
 b=ChFF7IhM74NfxxHsgXA2PvsE5OQzWP/o68bDCl7XnsctmTfgcfaCu65VWsOyYm6nCZ
 TNfKw6BRWbujbRXOkpC3QFz1CoZ6ci3MhjTo3fUmva6YCHkrzDbp37l6L5I2/NpavSGo
 4g1HOycG+ZoVudbxzU4szebOM0k8CUvfMTn3hsHsGq/zVpnreEC71YekcngpDfeYLNK1
 WZMav29routHX3C9JEhV9/Riqp55XwyXGXzdywzPqEeuUsv3b9ynXjBn3mVN89Cno+Ny
 4hxZ84p+Zpj3BpAvSCdK/gJr4cGJO5lyOm2iveg03Ho5cnQcn6UtXUUmWvzfdVPrxels
 Gh4g==
X-Gm-Message-State: AAQBX9egQQ38cdQnpFi07Yq1uLzkRRJNNg5FVBRk4ZwGWZgzkP/6qYjQ
 iQ3RCraFJVs4lDK7exEMPTqDRg==
X-Google-Smtp-Source: AKy350Y2w1T0rz4N/FvRZIpzEHOepBmJZn8uoGYoxs2MFy7RDHglu0yv8BxU4chJkRQTTJGEfaLenA==
X-Received: by 2002:a05:600c:3ca3:b0:3eb:2e2a:be95 with SMTP id
 bg35-20020a05600c3ca300b003eb2e2abe95mr8317833wmb.2.1681225273221; 
 Tue, 11 Apr 2023 08:01:13 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 u14-20020a05600c00ce00b003ed243222adsm17186003wmm.42.2023.04.11.08.01.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 08:01:12 -0700 (PDT)
Date: Tue, 11 Apr 2023 17:01:10 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Greg KH <greg@kroah.com>, Oded Gabbay <ogabbay@kernel.org>
Subject: Re: linux-next: build failure after merge of the driver-core tree
Message-ID: <ZDV2Nvs57Orx47tj@phenom.ffwll.local>
Mail-Followup-To: Greg KH <greg@kroah.com>, Oded Gabbay <ogabbay@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Dave Airlie <airlied@redhat.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
References: <20230411143812.11a4b00d@canb.auug.org.au>
 <ZDUuiB+E1tIJ95LY@phenom.ffwll.local>
 <2023041123-tractor-quake-c44d@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023041123-tractor-quake-c44d@gregkh>
X-Operating-System: Linux phenom 6.1.0-7-amd64
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Oded Gabbay <ogabbay@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 11, 2023 at 12:40:28PM +0200, Greg KH wrote:
> On Tue, Apr 11, 2023 at 11:55:20AM +0200, Daniel Vetter wrote:
> > On Tue, Apr 11, 2023 at 02:38:12PM +1000, Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > After merging the driver-core tree, today's linux-next build (x86_64
> > > allmodconfig) failed like this:
> > > 
> > > In file included from include/linux/linkage.h:7,
> > >                  from include/linux/kernel.h:17,
> > >                  from drivers/accel/qaic/mhi_qaic_ctrl.c:4:
> > > drivers/accel/qaic/mhi_qaic_ctrl.c: In function 'mhi_qaic_ctrl_init':
> > > include/linux/export.h:27:22: error: passing argument 1 of 'class_create' from incompatible pointer type [-Werror=incompatible-pointer-types]
> > >    27 | #define THIS_MODULE (&__this_module)
> > >       |                     ~^~~~~~~~~~~~~~~
> > >       |                      |
> > >       |                      struct module *
> > > drivers/accel/qaic/mhi_qaic_ctrl.c:544:38: note: in expansion of macro 'THIS_MODULE'
> > >   544 |         mqc_dev_class = class_create(THIS_MODULE, MHI_QAIC_CTRL_DRIVER_NAME);
> > >       |                                      ^~~~~~~~~~~
> > > In file included from include/linux/device.h:31,
> > >                  from include/linux/mhi.h:9,
> > >                  from drivers/accel/qaic/mhi_qaic_ctrl.c:5:
> > > include/linux/device/class.h:229:54: note: expected 'const char *' but argument is of type 'struct module *'
> > >   229 | struct class * __must_check class_create(const char *name);
> > >       |                                          ~~~~~~~~~~~~^~~~
> > > drivers/accel/qaic/mhi_qaic_ctrl.c:544:25: error: too many arguments to function 'class_create'
> > >   544 |         mqc_dev_class = class_create(THIS_MODULE, MHI_QAIC_CTRL_DRIVER_NAME);
> > >       |                         ^~~~~~~~~~~~
> > > include/linux/device/class.h:229:29: note: declared here
> > >   229 | struct class * __must_check class_create(const char *name);
> > >       |                             ^~~~~~~~~~~~
> > > 
> > > Caused by commit
> > > 
> > >   1aaba11da9aa ("driver core: class: remove module * from class_create()")
> > > 
> > > interacting with commit
> > > 
> > >   566fc96198b4 ("accel/qaic: Add mhi_qaic_cntl")
> > > 
> > > from the drm tree.
> > > 
> > > I have applied the following merge fix patch for today.
> > > 
> > > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > > Date: Tue, 11 Apr 2023 14:16:57 +1000
> > > Subject: [PATCH] fixup for "driver core: class: remove module * from class_create()"
> > > 
> > > interacting with "accel/qaic: Add mhi_qaic_cntl"
> > > 
> > > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > 
> > Thanks for the fixup. Since Dave is out I've made a note about this in my
> > handover mail so it won't get lost in the drm-next merge window pull. I
> > don't think we need any other coordination than mention it in each pull to
> > Linus, topic tree seems overkill for this. Plus there's no way I can
> > untangle the drm tree anyway :-).
> 
> Want me to submit a patch for the drm tree that moves this to use
> class_register() instead, which will make the merge/build issue go away
> for you?  That's my long-term goal here anyway, so converting this new
> code to this api today would be something I have to do eventually :)

We kinda closed drm-next for feature work mostly already (just pulling
stuff in from subtrees), so won't really help for this merge window.

For everything else I think this is up to Oded, I had no idea qaic needed
it's entire own dev class and I don't want to dig into this for the risk I
might freak out :-)

Adding Oded.

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
