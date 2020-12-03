Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 142A82CE06E
	for <lists+dri-devel@lfdr.de>; Thu,  3 Dec 2020 22:16:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D31056E088;
	Thu,  3 Dec 2020 21:16:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36AC36E088
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Dec 2020 21:16:05 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id z24so3182795oto.6
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Dec 2020 13:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zE2K/CILOD7x/mQFo0Rz+6Lwz9iUEQy1K2ey3j7mIvY=;
 b=RJvFpvNVdQHgoMCdGEJOrXTglxIdvZWaCGMEkkFNj5+/KVvxUKXNczdE5ARGh/r+X9
 kRN9dZlFLDoQIULz9HzkGbo0WG33na8+2Az/iu3B5aSisUYemDodBckMjlQMW0Hul9u9
 vDvOMQ7yewLVQhXF0RNF7q6iKv9e8vGalRbQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zE2K/CILOD7x/mQFo0Rz+6Lwz9iUEQy1K2ey3j7mIvY=;
 b=F6SlctpVI/QCPVCnPGJ8KXyRZ+8MaV1DXfUx8fCOwAdHBm3GsJBOAxo+Nb378hk/Iv
 iolPwIDWn34Wnpwe41WxQ06rX90mFuB0wahCTCXi2CUyJrUCx0dZaoKMOViYIswTqHx4
 vbKbIif3+J4GJWg34aExp8tIgWL8kwE/t2RE4mAlv4BaA1+ZjH+C0KTyS+S/neaQRyVe
 2b7WAOh3XxlLCO97czeTv8UMfrqHAJQB7eEWE7wJyozcUNpmQOttlQSCYeMK7PQkSb+Y
 je6DqezYcbQXXi4iimhjLmUcjGlJJR/mkDTLnTamZYryUUDomlRtkcAqZ/hSLbx92RAB
 qAOw==
X-Gm-Message-State: AOAM532d+RDIkPFEuCprKSlk6qr1hiyqk5u42ATrrQpnXV/cyWeOMX4d
 YQJiup3D0TXJjPNl7R3kkDtJFZbtp7ELqSNt6MYyug==
X-Google-Smtp-Source: ABdhPJwja/l4kUHtGAIlv6RL6aUgPiP7VSPC3Nl7pi1/Z1gf00h+gOaHAH90utQ+YTf9v60rVzhn7EE9I/kZrwvwO/Q=
X-Received: by 2002:a9d:23ca:: with SMTP id t68mr978736otb.281.1607030164448; 
 Thu, 03 Dec 2020 13:16:04 -0800 (PST)
MIME-Version: 1.0
References: <20201203191339.u5hfwy6ycrrzeb3z@adolin>
In-Reply-To: <20201203191339.u5hfwy6ycrrzeb3z@adolin>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 3 Dec 2020 22:15:53 +0100
Message-ID: <CAKMK7uFWb-4pGPMJyM7wwLkA-ayv1Axcs9+RNyM1q2SzwxHSBQ@mail.gmail.com>
Subject: Re: [PATCH] drm/vkms: Add setup and testing information
To: Sumera Priyadarsini <sylphrenadin@gmail.com>
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
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, Dave Airlie <airlied@linux.ie>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Melissa Wen <melissa.srw@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 3, 2020 at 8:13 PM Sumera Priyadarsini
<sylphrenadin@gmail.com> wrote:
>
> Update the vkms documentation to contain steps to:
>
>  - setup the vkms driver
>  - run tests using igt
>
> Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
> ---
>  Documentation/gpu/vkms.rst | 47 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>
> diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> index 13bab1d93bb3..d6782174d23f 100644
> --- a/Documentation/gpu/vkms.rst
> +++ b/Documentation/gpu/vkms.rst
> @@ -7,6 +7,53 @@
>  .. kernel-doc:: drivers/gpu/drm/vkms/vkms_drv.c
>     :doc: vkms (Virtual Kernel Modesetting)
>
> +SETUP

Absolute bikeshed, but we generally stick to titlecase for titles, so
just "Setup" and "Testing with IGT".
> +=====
> +
> +The VKMS driver can be setup with the following steps:
> +
> +To check if VKMS is loaded, run::
> +
> +  lsmod | grep vkms
> +
> +This should list the VKMS driver. If no output is obtained, then
> +you need to enable and/or load the VKMS driver.
> +Ensure that the VKMS driver has been set as a loadable module in your
> +kernel config file. The following line should be present in the .config
> +file in your kernel root::
> +
> +  CONFIG_DRM_VKMS=m
> +
> +Compile and build the kernel for the changes to get reflected.
> +If your existing config already has VKMS available as a loadable module,
> +then there is no need to build the kernel again.
> +Now, to load the driver, use::
> +
> +  sudo modprobe vkms
> +
> +On running the lsmod command now, the VKMS driver will appear listed.
> +You can also observe the driver being loaded in the dmesg logs.
> +
> +To disable the driver, use ::
> +
> +  sudo modprobe -r vkms
> +
> +TESTING WITH IGT
> +================
> +
> +The IGT GPU Tools is a test suite used specifically for debugging and
> +development of the DRM drivers.
> +The IGT Tools can be installed from
> +`here <https://gitlab.freedesktop.org/drm/igt-gpu-tools>`_ .
> +Once you have installed IGT, you can run tests using::
> +
> +  ./scripts/run-tests.sh -t <name of test>
> +
> +For example, to test the functionality of the igt_draw library,
> +we can run the kms_draw_crc test::
> +
> +  ./scripts/run-tests.sh -t kms_draw_crc

If we run igt tests directly, there's an option to select the right
device. This is important if you have more than one gpu driver
(usually the case if you run this directly, but even on virtual
machines there should usually be a drm driver around).  E.g. when I
run a test directly:

# tests/kms_flip --device drm:/dev/dri/card0

I'm not sure whether there's an option that's always going to select
the vkms device. I'm also not sure you can pass these options to
run-tests.sh, I kinda don't use that one myself ...

Aside from that looks all good to me.
-Daniel

> +
>  TODO
>  ====
>
> --
> 2.25.1
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
