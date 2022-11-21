Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0179A6327B2
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 16:19:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9216B10E2E9;
	Mon, 21 Nov 2022 15:19:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6914910E2D4
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 15:19:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E071FB810AF
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 15:19:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8363C4314A
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 15:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669043944;
 bh=hNvErq3/YI4nudexs9WhewJxFzxxT6n4zbIU2S0momQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=siXw93lDPd8wXGB3UTJDID/cFfKEeaSM81vj3f4Bh0cTHnK1iNHsVX8ieyeuoGld1
 ObiMAU7+P7l+/Ppqe7+w8vsBSoPAsouuVi5ECqACorxPFmYQaKu6WXPiv25Y+4gBmM
 j5gRNVTK+AfnlMylGKUUDrxXCvNB3l7OgiSjFqabm03OxMXPEYofspCHdAmTJvRhvi
 5PJ2kaS/uepqTUG+9YNtT8OIHMyqtLRqYhYRT+8KqKKL5FZS2xiDtst0uKwQmrHXJV
 322umduUFyKZv1zwHOtcTA+ZOyZvoWvT7MTzviQ/6HFiAYuSILag5doK7B8Qp4pOXt
 OGvW/79pkhrMg==
Received: by mail-yb1-f177.google.com with SMTP id 205so13933521ybe.7
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 07:19:04 -0800 (PST)
X-Gm-Message-State: ANoB5pnKdykcYQXg/4SNQz0n6v2ApyLAjHsrw6lsivluJzdltpRNJMMq
 cZuwQgKnGUZKZL496CeqaE+qPNcku+rpiFm4GLo=
X-Google-Smtp-Source: AA0mqf7ceDqe5Fjo8jJBqFSfaLx/euEtnK53FpMQ42IwjbflQaf3yYI7/FWG7jLwGOxHaGrVPara/PGuSQjb2PS2PuQ=
X-Received: by 2002:a25:c0d6:0:b0:6e6:619f:31f7 with SMTP id
 c205-20020a25c0d6000000b006e6619f31f7mr2575999ybf.642.1669043943527; Mon, 21
 Nov 2022 07:19:03 -0800 (PST)
MIME-Version: 1.0
References: <20221119204435.97113-1-ogabbay@kernel.org>
 <20221119204435.97113-5-ogabbay@kernel.org>
 <1e1cc8e3-8522-904f-6458-51dc8b212889@quicinc.com>
In-Reply-To: <1e1cc8e3-8522-904f-6458-51dc8b212889@quicinc.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Mon, 21 Nov 2022 17:18:37 +0200
X-Gmail-Original-Message-ID: <CAFCwf13KLp7SzNjDE_EuhVePQ5=a-KEmzd7ytt3zY+tO6RyOxw@mail.gmail.com>
Message-ID: <CAFCwf13KLp7SzNjDE_EuhVePQ5=a-KEmzd7ytt3zY+tO6RyOxw@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] doc: add documentation for accel subsystem
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
Cc: dri-devel@lists.freedesktop.org,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Christopher Friedt <chrisfriedt@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Christoph Hellwig <hch@infradead.org>,
 Jagan Teki <jagan@amarulasolutions.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Jiho Chu <jiho.chu@samsung.com>, Arnd Bergmann <arnd@arndb.de>,
 John Hubbard <jhubbard@nvidia.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 21, 2022 at 12:02 AM Jeffrey Hugo <quic_jhugo@quicinc.com> wrote:
>
> On 11/19/2022 1:44 PM, Oded Gabbay wrote:
> > Add an introduction section for the accel subsystem. Most of the
> > relevant data is in the DRM documentation, so the introduction only
> > presents the why of the new subsystem, how are the compute accelerators
> > exposed to user-space and what changes need to be done in a standard
> > DRM driver to register it to the new accel subsystem.
> >
> > Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
> > ---
> >   Documentation/accel/index.rst        |  17 +++++
> >   Documentation/accel/introduction.rst | 109 +++++++++++++++++++++++++++
> >   Documentation/subsystem-apis.rst     |   1 +
> >   MAINTAINERS                          |   1 +
> >   4 files changed, 128 insertions(+)
> >   create mode 100644 Documentation/accel/index.rst
> >   create mode 100644 Documentation/accel/introduction.rst
> >
> > diff --git a/Documentation/accel/index.rst b/Documentation/accel/index.rst
> > new file mode 100644
> > index 000000000000..2b43c9a7f67b
> > --- /dev/null
> > +++ b/Documentation/accel/index.rst
> > @@ -0,0 +1,17 @@
> > +.. SPDX-License-Identifier: GPL-2.0
> > +
> > +====================
> > +Compute Accelerators
> > +====================
> > +
> > +.. toctree::
> > +   :maxdepth: 1
> > +
> > +   introduction
> > +
> > +.. only::  subproject and html
> > +
> > +   Indices
> > +   =======
> > +
> > +   * :ref:`genindex`
> > diff --git a/Documentation/accel/introduction.rst b/Documentation/accel/introduction.rst
> > new file mode 100644
> > index 000000000000..5a3963eae973
> > --- /dev/null
> > +++ b/Documentation/accel/introduction.rst
> > @@ -0,0 +1,109 @@
> > +.. SPDX-License-Identifier: GPL-2.0
> > +
> > +============
> > +Introduction
> > +============
> > +
> > +The Linux compute accelerators subsystem is designed to expose compute
> > +accelerators in a common way to user-space and provide a common set of
> > +functionality.
> > +
> > +These devices can be either stand-alone ASICs or IP blocks inside an SoC/GPU.
> > +Although these devices are typically designed to accelerate Machine-Learning
> > +and/or Deep-Learning computations, the accel layer is not limited to handling
>
> You use "DL" later on as a short form for Deep-Learning.  It would be
> good to introduce that here.
>
> > +these types of accelerators.
> > +
> > +typically, a compute accelerator will belong to one of the following
>
> Typically
>
> > +categories:
> > +
> > +- Edge AI - doing inference at an edge device. It can be an embedded ASIC/FPGA,
> > +  or an IP inside a SoC (e.g. laptop web camera). These devices
> > +  are typically configured using registers and can work with or without DMA.
> > +
> > +- Inference data-center - single/multi user devices in a large server. This
> > +  type of device can be stand-alone or an IP inside a SoC or a GPU. It will
> > +  have on-board DRAM (to hold the DL topology), DMA engines and
> > +  command submission queues (either kernel or user-space queues).
> > +  It might also have an MMU to manage multiple users and might also enable
> > +  virtualization (SR-IOV) to support multiple VMs on the same device. In
> > +  addition, these devices will usually have some tools, such as profiler and
> > +  debugger.
> > +
> > +- Training data-center - Similar to Inference data-center cards, but typically
> > +  have more computational power and memory b/w (e.g. HBM) and will likely have
> > +  a method of scaling-up/out, i.e. connecting to other training cards inside
> > +  the server or in other servers, respectively.
> > +
> > +All these devices typically have different runtime user-space software stacks,
> > +that are tailored-made to their h/w. In addition, they will also probably
> > +include a compiler to generate programs to their custom-made computational
> > +engines. Typically, the common layer in user-space will be the DL frameworks,
> > +such as PyTorch and TensorFlow.
> > +
> > +Sharing code with DRM
> > +=====================
> > +
> > +Because this type of devices can be an IP inside GPUs or have similar
> > +characteristics as those of GPUs, the accel subsystem will use the
> > +DRM subsystem's code and functionality. i.e. the accel core code will
> > +be part of the DRM subsystem and an accel device will be a new type of DRM
> > +device.
> > +
> > +This will allow us to leverage the extensive DRM code-base and
> > +collaborate with DRM developers that have experience with this type of
> > +devices. In addition, new features that will be added for the accelerator
> > +drivers can be of use to GPU drivers as well.
> > +
> > +Differentiation from GPUs
> > +=========================
> > +
> > +Because we want to prevent the extensive user-space graphic software stack
> > +from trying to use an accelerator as a GPU, the compute accelerators will be
> > +differentiated from GPUs by using a new major number and new device char files.
> > +
> > +Furthermore, the drivers will be located in a separate place in the kernel
> > +tree - drivers/accel/.
> > +
> > +The accelerator devices will be exposed to the user space with the dedicated
> > +261 major number and will have the following convention:
> > +
> > +- device char files - /dev/accel/accel*
> > +- sysfs             - /sys/class/accel/accel*/
> > +- debugfs           - /sys/kernel/debug/accel/accel*/
> > +
> > +Getting Started
> > +===============
> > +
> > +First, read the DRM documentation. Not only it will explain how to write a new
>
> How about a link to the DRM documentation?
>
> > +DRM driver but it will also contain all the information on how to contribute,
> > +the Code Of Conduct and what is the coding style/documentation. All of that
> > +is the same for the accel subsystem.
> > +
> > +Second, make sure the kernel is configured with CONFIG_DRM_ACCEL.
> > +
> > +To expose your device as an accelerator, two changes are needed to
> > +be done in your driver (as opposed to a standard DRM driver):
> > +
> > +- Add the DRIVER_COMPUTE_ACCEL feature flag in your drm_driver's
> > +  driver_features field. It is important to note that this driver feature is
> > +  mutually exclusive with DRIVER_RENDER and DRIVER_MODESET. Devices that want
>
> I don't remember seeing code that validates a driver with
> DRIVER_COMPUTE_ACCEL does not also have DRIVER_MODESET.  What am I missing?

Look at drm_dev_init() (patch 3/4):

if (drm_core_check_feature(dev, DRIVER_COMPUTE_ACCEL) &&
               (drm_core_check_feature(dev, DRIVER_RENDER) ||
                 drm_core_check_feature(dev, DRIVER_MODESET))) {
            DRM_ERROR("DRM driver can't be both a compute acceleration
and graphics driver\n");
             return -EINVAL;
}

Thanks for your other comments, I'll fix them before sending the PR.
Oded

>
> > +  to expose both graphics and compute device char files should be handled by
> > +  two drivers that are connected using the auxiliary bus framework.
> > +
> > +- Change the open callback in your driver fops structure to accel_open().
> > +  Alternatively, your driver can use DEFINE_DRM_ACCEL_FOPS macro to easily
> > +  set the correct function operations pointers structure.
> > +
> > +External References
> > +===================
> > +
> > +email threads
> > +-------------
> > +
> > +* `Initial discussion on the New subsystem for acceleration devices <https://lkml.org/lkml/2022/7/31/83>`_ - Oded Gabbay (2022)
> > +* `patch-set to add the new subsystem <https://lkml.org/lkml/2022/10/22/544>`_ - Oded Gabbay (2022)
> > +
> > +Conference talks
> > +----------------
> > +
> > +* `LPC 2022 Accelerators BOF outcomes summary <https://airlied.blogspot.com/2022/09/accelerators-bof-outcomes-summary.html>`_ - Dave Airlie (2022)
> > diff --git a/Documentation/subsystem-apis.rst b/Documentation/subsystem-apis.rst
> > index af65004a80aa..b51f38527e14 100644
> > --- a/Documentation/subsystem-apis.rst
> > +++ b/Documentation/subsystem-apis.rst
> > @@ -43,6 +43,7 @@ needed).
> >      input/index
> >      hwmon/index
> >      gpu/index
> > +   accel/index
> >      security/index
> >      sound/index
> >      crypto/index
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 4d752aac3ec0..6ba7bb35208a 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -6837,6 +6837,7 @@ L:      dri-devel@lists.freedesktop.org
> >   S:  Maintained
> >   C:  irc://irc.oftc.net/dri-devel
> >   T:  git https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/accel.git
> > +F:   Documentation/accel/
> >   F:  drivers/accel/
> >
> >   DRM DRIVERS FOR ALLWINNER A10
>
