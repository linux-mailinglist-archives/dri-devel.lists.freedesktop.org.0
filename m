Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F009F8C4502
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 18:23:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84B2610E154;
	Mon, 13 May 2024 16:23:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="k2tYHHpH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A881D10E154
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 16:23:07 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a599a298990so1133068066b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 09:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715617386; x=1716222186; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=do8Ze4h0ioxHWgi223BvWvnwG6lXL2Rpq7UGOO6zuhE=;
 b=k2tYHHpH6TzqPfkN6AL/LyEDpU1EfMdlAXe7+oZbPdnSW2j1syGmzDrT+J3yv1z7Do
 WUuI+rAsVtRhXaSkNVOsJWmaIdR/ZP3yPshN/ViRbVKT1vozhEEeg7/3awE5GQPHFcWm
 xkngwbOdrPZZG3qQ742LFp6giUmZTjl4ey0McdkK8uNKA8hB7kCyZdMyCufoaKyY0bZn
 aNrTJNiLPA+jpzLMkwQdmpLyganFMlVp4UTtmk7r960YycR690hCNYkxRzELLoNXVm7B
 R7EYs6YG1r/ikSdfav1FYzmTuMC/8kU3lwAZSh65j7Txu2JJz9qM1HPsukCi/aSYHDkI
 Aycg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715617386; x=1716222186;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=do8Ze4h0ioxHWgi223BvWvnwG6lXL2Rpq7UGOO6zuhE=;
 b=EvqFkZ2SopGNH7dk+oK60i5ELKPh4VvPlJa1C/3QS9SB3OigTE0X9aoGA+lUegkwRg
 2i6CMHnvJTt136hq39hEKXqfhfIfrVcxruWQJICEOSrHHaiZAmwrMlL2EKABafG0P0Tm
 wgh2XVs49VUO2RUnttfVeSfqLdYvLJw6PT3gQD69VD/RG7aaaAB4vXC1kxVZV0LfSNJh
 +dOWh/uVxaKbOoa6RJjzQAW8/y59kf62gI3QOvphoxA2ndb7bj1guvl4P/nQvKnxLpCW
 VK1Tbqv/ci2mvR/mz3izWdPgfNVQo4/VTSFsm4cnvcwLdzMG/3Dp21nuGqX9nDT+XFOx
 69Xg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0dSGjCFxAJ99Ouct3V8kP6GocDocHN60Ar+P0ZCWy5x8CHsMv0oyYYgCdCwagEptaTi7KQqgbPbTTSCU33SBiGlhQ0Cbv6ENv2xtrEAzK
X-Gm-Message-State: AOJu0YxuKG4PFlUbOFGjYN/UKCIjdgx2JAilGKcP4jq2XwjGZbzwR/R1
 3N6/s9sTmJl6HQwWk10X8eYQvtL/rFIJmGAjpaqEc0RcMkhKqC1O
X-Google-Smtp-Source: AGHT+IHKC6CrHUOjOmuZQsPk6EGTrsHOWj8+gQvMSh7sQSxaD6YJXgmgkBvr6YUSEsKf5bV1e1GGNQ==
X-Received: by 2002:a17:906:a08:b0:a59:c3e2:712f with SMTP id
 a640c23a62f3a-a5a2d536941mr627228866b.9.1715617385345; 
 Mon, 13 May 2024 09:23:05 -0700 (PDT)
Received: from fedora ([213.94.26.172]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17b016e2sm611980666b.155.2024.05.13.09.23.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 May 2024 09:23:04 -0700 (PDT)
Date: Mon, 13 May 2024 18:23:02 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Marius Vlad <marius.vlad@collabora.com>
Cc: Louis Chauvet <louis.chauvet@bootlin.com>,
 Jim Shargo <jshargo@google.com>, daniel@ffwll.ch,
 brpol@chromium.org, corbet@lwn.net, dri-devel@lists.freedesktop.org,
 hamohammed.sa@gmail.com, hirono@chromium.org, jshargo@chromium.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 mairacanal@riseup.net, mduggan@chromium.org, melissa.srw@gmail.com,
 mripard@kernel.org, rodrigosiqueiramelo@gmail.com, tzimmermann@suse.de
Subject: Re: [PATCH v6 0/7] Adds support for ConfigFS to VKMS!
Message-ID: <ZkI-ZjAYCJaMvmQD@fedora>
References: <ZjCtgSaL50YrS-F-@phenom.ffwll.local>
 <20240508181744.7030-1-jose.exposito89@gmail.com>
 <CACmi3jF6Dp3PE8X=T5kTO2+eYJQi7jWACFdmp9jzKxUtcQphnQ@mail.gmail.com>
 <Zj5JIah0jWnIn2Ix@localhost.localdomain> <ZkHKhtBmyS12i3fH@fedora>
 <ZkHXS6iBLgRoApNl@xpredator>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZkHXS6iBLgRoApNl@xpredator>
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

On Mon, May 13, 2024 at 12:03:07PM +0300, Marius Vlad wrote:
> Hi all,
> On Mon, May 13, 2024 at 10:08:38AM +0200, José Expósito wrote:
> > On Fri, May 10, 2024 at 06:19:45PM +0200, Louis Chauvet wrote:
> > > Le 09/05/24 - 18:18, Jim Shargo a écrit :
> > > > Sima--thanks SO MUCH for going through with everything leaving a
> > > > detailed review. I am excited to go through your feedback.
> > > > 
> > > > It makes me extremely happy to see these patches get people excited.
> > > > 
> > > > They've bounced between a few people, and I recently asked to take
> > > > them over again from the folks who were most recently looking at them
> > > > but haven't since had capacity to revisit them. I'd love to contribute
> > > > more but I am currently pretty swamped and I probably couldn't
> > > > realistically make too much headway before the middle of June.
> > > > 
> > > > José--if you've got capacity and interest, I'd love to see this work
> > > > get in! Thanks!! Please let me know your timeline and if you want to
> > > > split anything up or have any questions, I'd love to help if possible.
> > > > But most important to me is seeing the community benefit from the
> > > > feature.
> > > > 
> > > > And (in case it got lost in the shuffle of all these patches) the IGT
> > > > tests really make it much easier to develop this thing. Marius has
> > > > posted the most recent patches:
> > > > https://lore.kernel.org/igt-dev/?q=configfs
> > > > 
> > > > Thanks!
> > > > -- Jim
> > > > 
> > > > 
> > > > 
> > > > On Wed, May 8, 2024 at 2:17 PM José Expósito <jose.exposito89@gmail.com> wrote:
> > > > >
> > > > > Hi everyone,
> > > > >
> > > > > I wasn't aware of these patches, but I'm really glad they are getting
> > > > > some attention, thanks a lot for your review Sima.
> > > > >
> > > > > Given that it's been a while since the patches were emailed, I'm not
> > > > > sure if the original authors of the patches could implement your
> > > > > comments. If not, I can work on it. Please let me know.
> > > > >
> > > > > I'm working on a Mutter feature that'd greatly benefit from this uapi
> > > > > and I'm sure other compositors would find it useful.
> > > > >
> > > > > I'll start working on a new version in a few days if nobody else is
> > > > > already working on it.
> > > > >
> > > > > Best wishes,
> > > > > José Expósito
> > > 
> > > Hi all!
> > > 
> > > Very nice to see other people working on this subject. As the series 
> > > seemed inactive, I started two weeks ago to rebase it on top of [1]. I 
> > > also started some work to use drmm_* helpers instead of using lists in 
> > > vkms. I currently struggle with a deadlock during rmmod.
> > > 
> > > I need to clean my commits, but I can share a WIP version.
> > 
> > Hi Louis,
> > 
> > If you could share a RFC/WIP series it would be awesome!
> > 
> > Since you are already working on the kernel patches (and I guess IGT?),
> > I'll start working on a libdrm high level API to interact with VKMS from
> > user-space on top of your patches. I'll share a link as soon as I have a
> > draft PR.
> 
> Just out of curiosity what API would that be? These should fairly
> simple that they can be configured from a shell script 
> (mount/mkdir/rm/echo/umount). Believe should be easy enough to test stuff with 
> bunch scripts like that.

My plan is to add a very thin C API around mkdir/rmdir/etc.

It is true that VKMS can be configure easily using a bash script; however,
compositors with test suites written in C (or with bindings to libdrm) would
have to write similar wrappers around the mkdir/rmdir/etc calls.
I think that it could be beneficial for them to have a shared wrapper available
in libdrm.
 
> Perphas landing the I-G-T tests first (assuming we're settled 
> on how exactly this would work) might be of greated help to get a green lit 
> the kernel driver side? Skip if vkms/configfs/something else that tells
> us VKMS doesn't have ConfigFS eneabled, and run it when that is on.
> 
> The lastest iteration was shared by Jim at 
> https://lore.kernel.org/igt-dev/20230901092819.16924-1-marius.vlad@collabora.com/
> 
> That way sub-sequent BAT CI would pick up issues, and can also used
> independently by Louis. Should also divide the work-load evenly with
> Louis focusing on the just the driver. Happy to review and test it.
> 
> > 
> > > Maybe we can discuss a bit the comment from Daniel (split init between 
> > > default/configfs, use or not a real platform device...)
> > > 
> > > For the split, I think the first solution (struct vkms_config) can be 
> > > easier to understand and to implement, for two reasons:
> > > - No need to distinguish between the "default" and the "configfs" devices 
> > >   in the VKMS "core". All is managed with only one struct vkms_config.
> > > - Most of the lifetime issue should be gone. The only thing to 
> > >   synchronize is passing this vkms_config from ConfigFS to VKMS.
> > 
> > I agree, this seems like the easiest solution.
> > 
> > > The drawback of this is that it can become difficult to do the "runtime" 
> > > configuration (today only hotplug, but I plan to add more complex stuff 
> > > like DP emulation, EDID selection, MST support...). Those configuration 
> > > must be done "at runtime" and will require a strong synchronization with 
> > > the vkms "core".
> > > 
> > > Maybe we can distinguish between the "creation" and the "runtime 
> > > configuration", in two different configFS directory? Once a device is 
> > > created, it is moved to the "enabled" directory and will have a different 
> > > set of attribute (connection status, current EDID...)
> > 
> > Once the device is enabled (i.e, `echo 1 > /config/vkms/my-device/enabled`),
> > would it make sense to use sysfs instead of another configfs directory?
> > The advantage is that with sysfs the kernel controls the lifetime of the
> > objects and I think it *might* simplify the code, but I'll need to write a
> > proof of concept to see if this works.
> Can indeed sysfs be used similar to ConfigFS? To me it sounds like sysfs is a
> view into a kernel objects, mostly for viewing and slight modifications
> but not manipulating, adding/removing, on the fly, various things. Sort
> of see it the other way around, device enabled with sysfs but
> configuration happens through ConfigFS. At least from a user-space pov.
> > 
> > > For the platform driver part, it seems logic to me to use a "real" 
> > > platform driver and a platform device for each pipeline, but I don't have 
> > > the experience to tell if this is a good idea or not.
> > 
> > I'm afraid I don't know which approach could work better. Trusting Sima and
> > Maíra on this one.
> > 
> > Jose
> > 
> > > [1]: https://lore.kernel.org/dri-devel/20240409-yuv-v6-0-de1c5728fd70@bootlin.com/
> > > 
> > > Thanks,
> > > Louis Chauvet
> > > 
> > > -- 
> > > Louis Chauvet, Bootlin
> > > Embedded Linux and Kernel engineering
> > > https://bootlin.com


