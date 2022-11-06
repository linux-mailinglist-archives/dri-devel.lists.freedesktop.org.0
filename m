Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8E561E1BF
	for <lists+dri-devel@lfdr.de>; Sun,  6 Nov 2022 11:52:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F94910E0AC;
	Sun,  6 Nov 2022 10:52:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B72B10E0AC
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Nov 2022 10:52:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 37EEFB80B34
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Nov 2022 10:52:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40AF6C43145
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Nov 2022 10:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667731939;
 bh=zZXlka8XT0jQaPkciMFldTLZtAMw7JFqIJd9Pf545QE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Y2V4328ZVop5zSPYMbnVBTVFNfHfFl+chIXZhpO3/zXuc77NPWVLdHRiTycGuYLy3
 OQbUBXlQWlcy4fOP0D5fVyCaK1MmlrXGd3P62LZtmNp8qrmfzslkYWTadXKvypzQHj
 nuFIGYLJxI3Zmgn+fkji9quyQVjcuXEjHVglP9ZZrIcbNXZqQkY22tMRB3HZzpmk+N
 ntw6n7OWV/T1t8nbGFYfzJJ3knROgXviZLu8JCdIFdPcA5MKh+0t6OQ4hf2D7Kb7lK
 ThJPmyQF4mRQFCzb2I2zJMaTGOGFh3RH04hlAYqJAWJJQPry4/lRvLo/ygZ19/8VyQ
 Cq6axWmp+BdzQ==
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-367cd2807f2so80763597b3.1
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Nov 2022 02:52:19 -0800 (PST)
X-Gm-Message-State: ACrzQf2MpkLcPvLs53g89+rLJcvGW30tt3l1Xibnm0i8NeWQChGHZ0xj
 OB2Mzvn61gGC+3nAeWZlnHFLdJgniR08hTjJmiU=
X-Google-Smtp-Source: AMsMyM7whTmcg306z1pjEJrFbNEeVSy7uMLjOJgY0HfUfOsFdMfzjOY9hDUp6Y+85iouOs3uQS7VnQILBs8heSGodHE=
X-Received: by 2002:a81:9214:0:b0:36c:7b94:aa57 with SMTP id
 j20-20020a819214000000b0036c7b94aa57mr41538976ywg.221.1667731938334; Sun, 06
 Nov 2022 02:52:18 -0800 (PST)
MIME-Version: 1.0
References: <20221102203405.1797491-1-ogabbay@kernel.org>
 <20221102203405.1797491-3-ogabbay@kernel.org>
 <7654d9c0-c181-ae6b-96ee-349f20f24b18@quicinc.com>
In-Reply-To: <7654d9c0-c181-ae6b-96ee-349f20f24b18@quicinc.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Sun, 6 Nov 2022 12:51:51 +0200
X-Gmail-Original-Message-ID: <CAFCwf10SLEd3dKXYEhyX0E95b66Qfok2Rou=6tOE_j2LCpOc6A@mail.gmail.com>
Message-ID: <CAFCwf10SLEd3dKXYEhyX0E95b66Qfok2Rou=6tOE_j2LCpOc6A@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/3] accel: add dedicated minor for accelerator
 devices
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jiho Chu <jiho.chu@samsung.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Arnd Bergmann <arnd@arndb.de>, Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 John Hubbard <jhubbard@nvidia.com>, Alex Deucher <alexander.deucher@amd.com>,
 Christoph Hellwig <hch@infradead.org>,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 2, 2022 at 11:17 PM Jeffrey Hugo <quic_jhugo@quicinc.com> wrote:
>
> On 11/2/2022 2:34 PM, Oded Gabbay wrote:
> > @@ -24,16 +33,6 @@ static char *accel_devnode(struct device *dev, umode_t *mode)
> >
> >   static CLASS_ATTR_STRING(accel_version, 0444, "accel 1.0.0 20221018");
> >
> > -/**
> > - * accel_sysfs_init - initialize sysfs helpers
> > - *
> > - * This is used to create the ACCEL class, which is the implicit parent of any
> > - * other top-level ACCEL sysfs objects.
> > - *
> > - * You must call accel_sysfs_destroy() to release the allocated resources.
> > - *
> > - * Return: 0 on success, negative error code on failure.
> > - */
>
> Why are we removing this?
It should have been removed at the first patch, and will be fixed in v3.
I'm removing it as it is a static function. We don't document every
static function.
>
> >   static int accel_sysfs_init(void)
> >   {
> >       int err;
> > @@ -54,11 +53,6 @@ static int accel_sysfs_init(void)
> >       return 0;
> >   }
> >
> > -/**
> > - * accel_sysfs_destroy - destroys ACCEL class
> > - *
> > - * Destroy the ACCEL device class.
> > - */
>
> Again, why remove this?  Adding it in one patch than immediately
> removing it in the next patch seems wasteful.
Correct, will be removed from the first patch in the next version.
>
> >   static void accel_sysfs_destroy(void)
> >   {
> >       if (IS_ERR_OR_NULL(accel_class))
> > @@ -68,11 +62,185 @@ static void accel_sysfs_destroy(void)
> >       accel_class = NULL;
> >   }
> >
> > +static void accel_minor_release(struct drm_minor *minor)
> > +{
> > +     drm_dev_put(minor->dev);
> > +}
> > +
> > +/**
> > + * accel_open - open method for ACCEL file
> > + * @inode: device inode
> > + * @filp: file pointer.
> > + *
> > + * This function must be used by drivers as their &file_operations.open method.
>
> Feels like it would be helpful to have an accel version of
> DEFINE_DRM_GEM_FOPS() which helps accel drivers to get this right
Yeah, I also thought about it. I'll add it.
thanks,
oded
>
> > + * It looks up the correct ACCEL device and instantiates all the per-file
> > + * resources for it. It also calls the &drm_driver.open driver callback.
> > + *
> > + * Return: 0 on success or negative errno value on failure.
> > + */
> > +int accel_open(struct inode *inode, struct file *filp)
> > +{
> > +     struct drm_device *dev;
> > +     struct drm_minor *minor;
> > +     int retcode;
> > +
> > +     minor = accel_minor_acquire(iminor(inode));
> > +     if (IS_ERR(minor))
> > +             return PTR_ERR(minor);
> > +
> > +     dev = minor->dev;
> > +
> > +     atomic_fetch_inc(&dev->open_count);
> > +
> > +     /* share address_space across all char-devs of a single device */
> > +     filp->f_mapping = dev->anon_inode->i_mapping;
> > +
> > +     retcode = drm_open_helper(filp, minor);
> > +     if (retcode)
> > +             goto err_undo;
> > +
> > +     return 0;
> > +
> > +err_undo:
> > +     atomic_dec(&dev->open_count);
> > +     accel_minor_release(minor);
> > +     return retcode;
> > +}
> > +EXPORT_SYMBOL_GPL(accel_open);
