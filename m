Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C37E061E1C2
	for <lists+dri-devel@lfdr.de>; Sun,  6 Nov 2022 11:54:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D94C510E0E3;
	Sun,  6 Nov 2022 10:54:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C1658920E
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Nov 2022 10:54:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 01EE460C44
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Nov 2022 10:54:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8025C43470
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Nov 2022 10:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667732073;
 bh=DGWITShguY2YvDwT2F/Zt1p4K6E4TZdBWjm0qvd7Y5c=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=jtg3YNva6eR97+CKcl2lU4MZakiRXGxBnD8cqRXo2jA3ubAsAokvwHJHoxI5Q6ckr
 xxgWcqTnT2MSmSpKhhnM7EKt7eWZqlmB13PGa+bqTL9e4zpY7LhNdqJnH4/Dvztq3R
 TeO+JbCAD6DB2mFqDuIOtIyngVklXLzX060KDMUSD3e+C44DBRwUpT4fWcl1duQTQY
 p/G64KpiN/F4dB/+x4j6CO36Ktj7p1x+trI7fHQlmuJ8owjfoOOpQmPemOPIe6Q4Zy
 MvqyIq95aIK9M+RIPI3yxaQEu1bRUJ+OS4usLPCA4imQctMwY9xe4Y+fzYU9HAZv6u
 aRRddZEuTgt5A==
Received: by mail-yb1-f174.google.com with SMTP id y186so5905486yby.10
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Nov 2022 02:54:33 -0800 (PST)
X-Gm-Message-State: ACrzQf36ADieZKOo+sF1xrkJzfmB2D790U/zW78yJlMNhs3T//LDGS7f
 WuOFRWtN0tkxdu/nbgNBgNratRHffcVPe3v0aV8=
X-Google-Smtp-Source: AMsMyM4FcFut+LU4VdTnrVzBfv6cltrpShWVNbuucVGQUt4hr2pnnb6JqFc2yeeMG3KRDMdP48BI892EZF4vx48UqWM=
X-Received: by 2002:a25:1e89:0:b0:6bf:9e55:5cb4 with SMTP id
 e131-20020a251e89000000b006bf9e555cb4mr44196756ybe.642.1667732072872; Sun, 06
 Nov 2022 02:54:32 -0800 (PST)
MIME-Version: 1.0
References: <20221102203405.1797491-1-ogabbay@kernel.org>
 <CGME20221102203430epcas1p380845d7a6ebc38ab1f41acf8c48a4480@epcas1p3.samsung.com>
 <20221102203405.1797491-3-ogabbay@kernel.org>
 <20221103142554.6310a60f0f6dad1a59fa7644@samsung.com>
In-Reply-To: <20221103142554.6310a60f0f6dad1a59fa7644@samsung.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Sun, 6 Nov 2022 12:54:06 +0200
X-Gmail-Original-Message-ID: <CAFCwf124PAis_PJjswUdGbpRJ=SGsPpAOQbjuRzvfM7VZyS8Dg@mail.gmail.com>
Message-ID: <CAFCwf124PAis_PJjswUdGbpRJ=SGsPpAOQbjuRzvfM7VZyS8Dg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/3] accel: add dedicated minor for accelerator
 devices
To: Jiho Chu <jiho.chu@samsung.com>
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
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Arnd Bergmann <arnd@arndb.de>, Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Jagan Teki <jagan@amarulasolutions.com>, John Hubbard <jhubbard@nvidia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christoph Hellwig <hch@infradead.org>,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 3, 2022 at 7:26 AM Jiho Chu <jiho.chu@samsung.com> wrote:
>
> On Wed,  2 Nov 2022 22:34:04 +0200
> Oded Gabbay <ogabbay@kernel.org> wrote:
>
> > +/**
> > + * accel_open - open method for ACCEL file
> > + * @inode: device inode
> > + * @filp: file pointer.
> > + *
> > + * This function must be used by drivers as their &file_operations.open method.
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
>
> Hi,
> It needs to consider drm_global_mutex to access open_count.
> please check doxy of open_count.
Now that I'm changing the code back to be part of drm.ko, I can return
all the code that is in drm_copy which I removed for this to compile.

>
>
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
> > +
> >  static int accel_stub_open(struct inode *inode, struct file *filp)
> >  {
> > -     DRM_DEBUG("Operation not supported");
> > +     const struct file_operations *new_fops;
> > +     struct drm_minor *minor;
> > +     int err;
> > +
> > +     DRM_DEBUG("\n");
>
> It seems useless.
Correct, I removed it in v3.
Thanks,
Oded
>
> Thanks.
> Jiho Chu
