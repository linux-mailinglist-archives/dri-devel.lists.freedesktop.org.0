Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0002D4171
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 12:54:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A139A6EA13;
	Wed,  9 Dec 2020 11:54:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AB5F6EA13
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 11:54:05 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id w3so1034784otp.13
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Dec 2020 03:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6K9mAP1Beqp+70UsfH1hWBqgYfQ6/jJCVxMp4Od9dXQ=;
 b=WKdOiNEfE025+NhMJCC590FBPhDDL1gRy0WjSNyvkYadzIexHP3ThUxvECLe1OuNFR
 gv8Stf1j5kWZLMbSVAWg3172rw0MOhLjpV6nkIjUZyiPnEz1MgvmkPV9P5VjzHgzLmis
 yhDvxljzamNcH+ChzOkE0EUK1i16q+nl7nWgQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6K9mAP1Beqp+70UsfH1hWBqgYfQ6/jJCVxMp4Od9dXQ=;
 b=l/YTRRWY4JAT3ElEz2LHzk/MFfYYosX+r5zo28iFVBbzmugTfSQZ656W+qmfCeEDx7
 QmVLbS3xZsl9BxPTdaSQHHna6o2MzphPQnER7P+DoMDSJ52sC/wv9R2DUNg5W/WnVFf/
 4vYXySpwTEXUkvLk8Q2tbG01Usi/IfXFdFjcpYcoAhvGX+Qq/ICRZz2LOd7NIxqHpSo5
 NJ0T8wRp6pamAgJ2wf1IZKv6yzb1nMykMZWPXes40Egrkoqs77bYxC6kKHU7+HneAKQl
 tdfuQGiXOhOA8l9ejZqKcOIPTSY4XCjP06NH2e/7xFLvxBW8RVUtyosrNNTixt1Qo7Cq
 Gp3A==
X-Gm-Message-State: AOAM531wZYXvU/KLAW986wO7Zx9ECKveaLBRazXo25xxhrkBZzIPKgxl
 pwHGMza4oAXad8DZvjVJP0VonWT8JoHqX/jtnbssnA==
X-Google-Smtp-Source: ABdhPJzeGRIzXNVOTiimF3+GkeRqnsYXqHCUbft7/hztuK4K5NeJSeu/FTxDfpAmy5OzxEeHBzG5Qex6uKs4bSeWuAc=
X-Received: by 2002:a9d:470f:: with SMTP id a15mr1324186otf.303.1607514844917; 
 Wed, 09 Dec 2020 03:54:04 -0800 (PST)
MIME-Version: 1.0
References: <20201208203735.ukqrgjmlntbvxc7e@adolin>
 <20201209005408.GP401619@phenom.ffwll.local>
 <CACAkLuqvHw898DBYo3TgaTr5_6Mr=p=CXaBzFo_7P8N5geOZyw@mail.gmail.com>
In-Reply-To: <CACAkLuqvHw898DBYo3TgaTr5_6Mr=p=CXaBzFo_7P8N5geOZyw@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 9 Dec 2020 12:53:53 +0100
Message-ID: <CAKMK7uEh1Z=H7HByVpp7WVM=AdURyRB0VtJpempLy4W3hMOH9g@mail.gmail.com>
Subject: Re: [PATCH V2] drm/vkms: Add setup and testing information
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
 Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@linux.ie>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Melissa Wen <melissa.srw@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 9, 2020 at 12:33 PM Sumera Priyadarsini
<sylphrenadin@gmail.com> wrote:
>
> On Wed, Dec 9, 2020 at 6:24 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Wed, Dec 09, 2020 at 02:07:35AM +0530, Sumera Priyadarsini wrote:
> > > Update the vkms documentation to contain steps to:
> > >
> > >  - setup the vkms driver
> > >  - run tests using igt
> > >
> > > Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
> > > ___
> > > Changes in v2:
> > >  - Change heading to title case (Daniel)
> > >  - Add examples to run tests directly (Daniel)
> > >  - Add examples to run subtests (Melissa)
> > > ---
> > >  Documentation/gpu/vkms.rst | 67 ++++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 67 insertions(+)
> > >
> > > diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> > > index 13bab1d93bb3..d6739fbbe503 100644
> > > --- a/Documentation/gpu/vkms.rst
> > > +++ b/Documentation/gpu/vkms.rst
> > > @@ -7,6 +7,73 @@
> > >  .. kernel-doc:: drivers/gpu/drm/vkms/vkms_drv.c
> > >     :doc: vkms (Virtual Kernel Modesetting)
> > >
> > > +Setup
> > > +=====
> > > +
> > > +The VKMS driver can be setup with the following steps:
> > > +
> > > +To check if VKMS is loaded, run::
> > > +
> > > +  lsmod | grep vkms
> > > +
> > > +This should list the VKMS driver. If no output is obtained, then
> > > +you need to enable and/or load the VKMS driver.
> > > +Ensure that the VKMS driver has been set as a loadable module in your
> > > +kernel config file. Do::
> > > +
> > > +  make nconfig
> > > +
> > > +  Go to `Device Drivers> Graphics support`
> > > +
> > > +  Enable `Virtual KMS (EXPERIMENTAL)`
> > > +
> > > +Compile and build the kernel for the changes to get reflected.
> > > +Now, to load the driver, use::
> > > +
> > > +  sudo modprobe vkms
> > > +
> > > +On running the lsmod command now, the VKMS driver will appear listed.
> > > +You can also observe the driver being loaded in the dmesg logs.
> > > +
> > > +To disable the driver, use ::
> > > +
> > > +  sudo modprobe -r vkms
> > > +
> > > +Testing With IGT
> > > +================
> > > +
> > > +The IGT GPU Tools is a test suite used specifically for debugging and
> > > +development of the DRM drivers.
> > > +The IGT Tools can be installed from
> > > +`here <https://gitlab.freedesktop.org/drm/igt-gpu-tools>`_ .
> > > +
> > > +The tests need to be run without a compositor, so you need to switch to text
> > > +only mode. You can do this by::
> > > +
> > > +  sudo systemctl isolate multi-user.target
> > > +
> > > +To return to graphical mode, do::
> > > +
> > > +  sudo systemctl isolate graphical.target
> > > +
> > > +Once you are in text only mode, you can run tests using the --device switch
> > > +or IGT_DEVICE variable to specify the device filter for the driver we want
> > > +to test::
> > > +
> > > +  sudo ./build/tests/<name of test> --device "sys:/sys/devices/platform/vkms"
> > > +  sudo IGT_DEVICE="sys:/sys/devices/platform/vkms" ./build/tests/<name of test>
> > > +
> > > +For example, to test the functionality of the writeback library,
> > > +we can run the kms_writeback test::
> > > +
> > > +  sudo ./build/tests/kms_writeback --device "sys:/sys/devices/platform/vkms"
> > > +  sudo IGT_DEVICE="sys:/sys/devices/platform/vkms" ./build/tests/kms_writeback
> > > +
> > > +You can also run subtests if you do not want to run the entire test::
> > > +
> > > +  sudo ./build/tests/kms_flip --run-subtest basic-plain-flip --device "sys:/sys/devices/platform/vkms"
> > > +  sudo IGT_DEVICE="sys:/sys/devices/platform/vkms" ./build/tests/kms_flip --run-subtest basic-plain-flip
> >
> > Does IGT_DEVICE also work with run-tests.sh? Aside from my curious
> > question, patch looks good to me, thanks a lot.
>
> Good catch, it does.
>
> Melissa, IGT_FORCE_DRIVER also works. I think I was used test/kms_flip
> earlier instead of
> ./build/test/kms_flip hence the fluke.
>
> Should I add these also to the docs, was wondering if it will get too
> confusing....

I think IGT_FORCE_DRIVER is deprecated, so better not to mention that.
IGT_DEVICE and --device are the new thing. I think just adding a
sentence that IGT_DEVICE also works with the run-tests scripts would
be good perhaps.
-Daniel

>
> >
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> >
> > > +
> > >  TODO
> > >  ====
> > >
> > > --
> > > 2.25.1
> > >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
