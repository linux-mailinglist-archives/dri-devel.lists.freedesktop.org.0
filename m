Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 177488CAE23
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 14:26:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B918810E51D;
	Tue, 21 May 2024 12:26:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="L8mJoMu/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0CE610E691
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 12:26:02 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-574fd0306d0so1345109a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 05:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1716294361; x=1716899161; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=RdRNtZABzSdYhamYjWVVxK02xAUTnq7URjJCd5KnlOs=;
 b=L8mJoMu/0z+LE2vWOqtwL3FSpyGa2wX5thzGEO91GfngW7r5C9tjPkTxbYJswJFZP4
 Mp3cxe5hvV8uJm3H+snYmA8Au7rV6wnNieIiH7P9N1HrXbtkRFPboOCWoFKqMyEyCML2
 AwRdWPsCweNtZY3pXm4t+EPMvcNq3MTaSuQUc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716294361; x=1716899161;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RdRNtZABzSdYhamYjWVVxK02xAUTnq7URjJCd5KnlOs=;
 b=rRwYfbWx43/U/Xp95TJajso+5buzWd5HjbPPUncfwpMTaSy5p7uR9RTQmMGJYil2xI
 +IkT1E7ygVQYM/rMdcZ2XeFAuwutcDCrBQlWn2k5Iho63ci9ucKgBa4syyd1BxR538RX
 9GPWX3T+MCjMwenYCtsvbz7H497oLrpuzCcSQe6+y71yHRvNX9q+0qnmbEpN2Qe2n/rQ
 kVeKJScsiAmacoJIQbs1adJ01upCFKaeQSfPiZWfIY+XEwGj3LnLYDF2xT4gbFPPIi6V
 ygWZfTvcjQkbUc+DHzd8oGeUtBP4KF/sYJP/syklaZ2Fr5GtkNEEPRWA73atnN2bQNwr
 dJzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlwL2mwCb0Dl5oO7W31ZdHFLN6wfDuElrwytmatK10HFa+FkamExnvCXjSiR3lk7YNPu3P4xHAN12HaohsNRkS0lxqp8zibHoGkOwBIIT6
X-Gm-Message-State: AOJu0YwrcPMqnuEjcf7XJF9pnykeP7HQbDP/fyGQV9/65XoBAGwiwpld
 KF52dwgoBYHWMFs6xpmhf72l9AnhuQPOXs8IvhPugcfmP9OL4cKiOqYwITFW9WkniLYHNI0+nhG
 B
X-Google-Smtp-Source: AGHT+IHxhnAGFUScDl3IlqhfMmQn0o9GDUXBNO57XpFrPU+//uAG7drXpi7vj0AI2MW2rT7JliFGlQ==
X-Received: by 2002:a17:906:f591:b0:a5a:5bf2:b889 with SMTP id
 a640c23a62f3a-a5a5bf2b8b4mr2570842966b.0.1716294360690; 
 Tue, 21 May 2024 05:26:00 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a61c18561casm239391966b.91.2024.05.21.05.25.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 May 2024 05:25:56 -0700 (PDT)
Date: Tue, 21 May 2024 14:25:54 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Cc: Louis Chauvet <louis.chauvet@bootlin.com>,
 Jim Shargo <jshargo@google.com>, daniel@ffwll.ch,
 brpol@chromium.org, corbet@lwn.net, dri-devel@lists.freedesktop.org,
 hamohammed.sa@gmail.com, hirono@chromium.org, jshargo@chromium.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 mairacanal@riseup.net, marius.vlad@collabora.com,
 mduggan@chromium.org, melissa.srw@gmail.com, mripard@kernel.org,
 rodrigosiqueiramelo@gmail.com, tzimmermann@suse.de
Subject: Re: [PATCH v6 0/7] Adds support for ConfigFS to VKMS!
Message-ID: <ZkyS0q9GnCzla2EV@phenom.ffwll.local>
Mail-Followup-To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?=
 <jose.exposito89@gmail.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Jim Shargo <jshargo@google.com>, brpol@chromium.org, corbet@lwn.net,
 dri-devel@lists.freedesktop.org, hamohammed.sa@gmail.com,
 hirono@chromium.org, jshargo@chromium.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 mairacanal@riseup.net, marius.vlad@collabora.com,
 mduggan@chromium.org, melissa.srw@gmail.com, mripard@kernel.org,
 rodrigosiqueiramelo@gmail.com, tzimmermann@suse.de
References: <ZjCtgSaL50YrS-F-@phenom.ffwll.local>
 <20240508181744.7030-1-jose.exposito89@gmail.com>
 <CACmi3jF6Dp3PE8X=T5kTO2+eYJQi7jWACFdmp9jzKxUtcQphnQ@mail.gmail.com>
 <Zj5JIah0jWnIn2Ix@localhost.localdomain> <ZkHKhtBmyS12i3fH@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZkHKhtBmyS12i3fH@fedora>
X-Operating-System: Linux phenom 6.8.9-amd64 
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

On Mon, May 13, 2024 at 10:08:38AM +0200, José Expósito wrote:
> On Fri, May 10, 2024 at 06:19:45PM +0200, Louis Chauvet wrote:
> > Le 09/05/24 - 18:18, Jim Shargo a écrit :
> > > Sima--thanks SO MUCH for going through with everything leaving a
> > > detailed review. I am excited to go through your feedback.
> > > 
> > > It makes me extremely happy to see these patches get people excited.
> > > 
> > > They've bounced between a few people, and I recently asked to take
> > > them over again from the folks who were most recently looking at them
> > > but haven't since had capacity to revisit them. I'd love to contribute
> > > more but I am currently pretty swamped and I probably couldn't
> > > realistically make too much headway before the middle of June.
> > > 
> > > José--if you've got capacity and interest, I'd love to see this work
> > > get in! Thanks!! Please let me know your timeline and if you want to
> > > split anything up or have any questions, I'd love to help if possible.
> > > But most important to me is seeing the community benefit from the
> > > feature.
> > > 
> > > And (in case it got lost in the shuffle of all these patches) the IGT
> > > tests really make it much easier to develop this thing. Marius has
> > > posted the most recent patches:
> > > https://lore.kernel.org/igt-dev/?q=configfs
> > > 
> > > Thanks!
> > > -- Jim
> > > 
> > > 
> > > 
> > > On Wed, May 8, 2024 at 2:17 PM José Expósito <jose.exposito89@gmail.com> wrote:
> > > >
> > > > Hi everyone,
> > > >
> > > > I wasn't aware of these patches, but I'm really glad they are getting
> > > > some attention, thanks a lot for your review Sima.
> > > >
> > > > Given that it's been a while since the patches were emailed, I'm not
> > > > sure if the original authors of the patches could implement your
> > > > comments. If not, I can work on it. Please let me know.
> > > >
> > > > I'm working on a Mutter feature that'd greatly benefit from this uapi
> > > > and I'm sure other compositors would find it useful.
> > > >
> > > > I'll start working on a new version in a few days if nobody else is
> > > > already working on it.
> > > >
> > > > Best wishes,
> > > > José Expósito
> > 
> > Hi all!
> > 
> > Very nice to see other people working on this subject. As the series 
> > seemed inactive, I started two weeks ago to rebase it on top of [1]. I 
> > also started some work to use drmm_* helpers instead of using lists in 
> > vkms. I currently struggle with a deadlock during rmmod.
> > 
> > I need to clean my commits, but I can share a WIP version.
> 
> Hi Louis,
> 
> If you could share a RFC/WIP series it would be awesome!
> 
> Since you are already working on the kernel patches (and I guess IGT?),
> I'll start working on a libdrm high level API to interact with VKMS from
> user-space on top of your patches. I'll share a link as soon as I have a
> draft PR.

Great to see all the enthusiasm here, this is awesome.

Note that I'm out of office for two weeks next week, so if I miss any
patches please ping me again (sima in #dri-devel on oftc tends to work
best) when I'm back.

> > Maybe we can discuss a bit the comment from Daniel (split init between 
> > default/configfs, use or not a real platform device...)
> > 
> > For the split, I think the first solution (struct vkms_config) can be 
> > easier to understand and to implement, for two reasons:
> > - No need to distinguish between the "default" and the "configfs" devices 
> >   in the VKMS "core". All is managed with only one struct vkms_config.
> > - Most of the lifetime issue should be gone. The only thing to 
> >   synchronize is passing this vkms_config from ConfigFS to VKMS.
> 
> I agree, this seems like the easiest solution.
> 
> > The drawback of this is that it can become difficult to do the "runtime" 
> > configuration (today only hotplug, but I plan to add more complex stuff 
> > like DP emulation, EDID selection, MST support...). Those configuration 
> > must be done "at runtime" and will require a strong synchronization with 
> > the vkms "core".
> > 
> > Maybe we can distinguish between the "creation" and the "runtime 
> > configuration", in two different configFS directory? Once a device is 
> > created, it is moved to the "enabled" directory and will have a different 
> > set of attribute (connection status, current EDID...)
> 
> Once the device is enabled (i.e, `echo 1 > /config/vkms/my-device/enabled`),
> would it make sense to use sysfs instead of another configfs directory?
> The advantage is that with sysfs the kernel controls the lifetime of the
> objects and I think it *might* simplify the code, but I'll need to write a
> proof of concept to see if this works.

sysfs is very opinionated about lifetime, so we might actually make this
more complicated. Plus for the only thing we can hotplug (connectors) we
already have sysfs directories, so there could be a lifetime/name fight
between the sysfs interfaces to prepare a hotplugged connector, and the
connector sysfs files which are part of the existing uapi.

Also the second issue I'm seeing is that we're mixing up
testing/configuration apis with the generic uapi that should hold for
every kms driver. This could make the code in igt testcase or for driving
compositor end-to-end testcases a lot more confusing. I think separation
would be better.

The third point I'm seeing is that connectors can be created both before
we create the device, and at runtime. If we have two totally separate
interfaces for this, we might end up with needless code duplication.

But it's a complex topic, I think it does make sense to give sysfs some
serious thought. But maybe as part of the vkms driver directory, and not
in the drm_device chardev directories. So we could have some separation
that way maybe?

> > For the platform driver part, it seems logic to me to use a "real" 
> > platform driver and a platform device for each pipeline, but I don't have 
> > the experience to tell if this is a good idea or not.
> 
> I'm afraid I don't know which approach could work better. Trusting Sima and
> Maíra on this one.

As I've said, I'm not opposed to a switch. I just think it's an orthogonal
issue to the configfs and should be separately justified.

We're trying hard to get away from kms userspace sneaking too much under
the hood of the driver, and have gone a long way from the o.g. drm days
where "everything is pci" was encoded into uapi. So from that pov I kinda
like the fact that vkms is special and fairly free-floating.

But maybe userspace does want to be able to test their device enumeration
more like a real device, so if vkms currently sticks out there that would
be a really good reason to change things and make it look more like a real
driver/device.

Cheers, Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
