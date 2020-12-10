Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7F42D58FB
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 12:12:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A98AB6EA61;
	Thu, 10 Dec 2020 11:12:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 861206EA61
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 11:12:29 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id 91so5033173wrj.7
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 03:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=SFeiWCONYDarnfPLxLW1GxMdDbdLJCJ6938SVXgGsFI=;
 b=Wow/eRHQYpgpieT0j7r5lB7tKLAF3Tt+hJrpqcDSjFfJYz20LQ+diyhM0ZVnoAV9Nz
 svMA/XHdPDg8QxFV7PEhxcfGReeiEUgPmb6pU1I1ghxf8TC4oO9RX5bxUeyUT62VV2g0
 MeA7PgP7E8mVqaNtxIkF0buWLHLP6fzp+U5bmL1E9RpYX20V4VyXERi5UtldErmgtGvV
 dA8ejSMjV7XL1am3sNk9btBuXWkGKGBKSiji43Y1XMqmrNGgndSZPFyvJjgcfgasHHWL
 Rlb/zOfsBBsnfG0VU6XfAmWkLV/oUt4TmMgNJtZuBTJ0Rdqro8xMF7XQV3L0YuCIe/yu
 7I1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SFeiWCONYDarnfPLxLW1GxMdDbdLJCJ6938SVXgGsFI=;
 b=Xb9ANYv57tP9cMudK2BdpV7RJxk70SLr1lm/UuuR/vFVfCdrDmSVQRunlKz47mE/Mc
 NYJ6t3F1BgQEgY+W0XnKAFx7rnFwJfGeUboqNAxmIgAVM0paPyRnKe1EtIn2/axusx2i
 vwfzDOKNyh/KnE+cEbKuxJyu7JdDqsowV80rgzudWmJF6wGAqiMB6ffLTz3lyTVE8THo
 CHNLf3C10+kQUoLjylk3OGsNKdpfNaXiUCBfo0JGZnPIWjsje91q7WCH72/CzeGPj+Wo
 iNXw5WXDhC8C835rWr7Gt4fTSLheLO7gbbMWrOp6AgjA2TkX5dS4u+KwmDOzevHtniox
 IP9Q==
X-Gm-Message-State: AOAM530ReENUPrOb2pAECeshI2MFfmDy4Fxo32E38BYbXv+8mhTA9Irb
 QiU5E8ZAdT39yImIPzObM0g=
X-Google-Smtp-Source: ABdhPJzmUHxiHT9O8COe36dsoLI4lCjNl/sTysqpXIA40FtgJDXGCipLSbimOGA6HLH+fnpPFq/+6A==
X-Received: by 2002:adf:f146:: with SMTP id y6mr7778814wro.298.1607598748151; 
 Thu, 10 Dec 2020 03:12:28 -0800 (PST)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id r2sm8799281wrn.83.2020.12.10.03.12.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 03:12:27 -0800 (PST)
Date: Thu, 10 Dec 2020 08:12:21 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: Sumera Priyadarsini <sylphrenadin@gmail.com>, hamohammed.sa@gmail.com,
 rodrigosiqueiramelo@gmail.com, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 corbet@lwn.net, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drm/vkms: Add setup and testing information
Message-ID: <20201210111221.evhku6xjhgxmu4ys@smtp.gmail.com>
References: <20201209190453.c6kp5winikr55n3i@adolin>
 <20201209221711.GC401619@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201209221711.GC401619@phenom.ffwll.local>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/09, Daniel Vetter wrote:
> On Thu, Dec 10, 2020 at 12:34:53AM +0530, Sumera Priyadarsini wrote:
> > Update the vkms documentation to contain steps to:
> > 
> >  - setup the vkms driver
> >  - run tests using igt
> > 
> > Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
> > ___
> > Changes in v2:
> >  - Change heading to title case (Daniel)
> >  - Add examples to run tests directly (Daniel)
> >  - Add examples to run subtests (Melissa)
> > 
> > Changes in v3:
> >  - Add example using run-tests.sh script(Daniel)
> 
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
Applied to drm-misc-next.

Thanks for these improvements,

Melissa
> > ---
> >  Documentation/gpu/vkms.rst | 70 ++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 70 insertions(+)
> > 
> > diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> > index 13bab1d93bb3..9e030c74a82e 100644
> > --- a/Documentation/gpu/vkms.rst
> > +++ b/Documentation/gpu/vkms.rst
> > @@ -7,6 +7,76 @@
> >  .. kernel-doc:: drivers/gpu/drm/vkms/vkms_drv.c
> >     :doc: vkms (Virtual Kernel Modesetting)
> >  
> > +Setup
> > +=====
> > +
> > +The VKMS driver can be setup with the following steps:
> > +
> > +To check if VKMS is loaded, run::
> > +
> > +  lsmod | grep vkms
> > +
> > +This should list the VKMS driver. If no output is obtained, then
> > +you need to enable and/or load the VKMS driver.
> > +Ensure that the VKMS driver has been set as a loadable module in your
> > +kernel config file. Do::
> > +
> > +  make nconfig
> > +
> > +  Go to `Device Drivers> Graphics support`
> > +
> > +  Enable `Virtual KMS (EXPERIMENTAL)`
> > +
> > +Compile and build the kernel for the changes to get reflected.
> > +Now, to load the driver, use::
> > +
> > +  sudo modprobe vkms
> > +
> > +On running the lsmod command now, the VKMS driver will appear listed.
> > +You can also observe the driver being loaded in the dmesg logs.
> > +
> > +To disable the driver, use ::
> > +
> > +  sudo modprobe -r vkms
> > +
> > +Testing With IGT
> > +================
> > +
> > +The IGT GPU Tools is a test suite used specifically for debugging and
> > +development of the DRM drivers.
> > +The IGT Tools can be installed from
> > +`here <https://gitlab.freedesktop.org/drm/igt-gpu-tools>`_ .
> > +
> > +The tests need to be run without a compositor, so you need to switch to text
> > +only mode. You can do this by::
> > +
> > +  sudo systemctl isolate multi-user.target
> > +
> > +To return to graphical mode, do::
> > +
> > +  sudo systemctl isolate graphical.target
> > +
> > +Once you are in text only mode, you can run tests using the --device switch
> > +or IGT_DEVICE variable to specify the device filter for the driver we want
> > +to test. IGT_DEVICE can also be used with the run-test.sh script to run the
> > +tests for a specific driver::
> > +
> > +  sudo ./build/tests/<name of test> --device "sys:/sys/devices/platform/vkms"
> > +  sudo IGT_DEVICE="sys:/sys/devices/platform/vkms" ./build/tests/<name of test>
> > +  sudo IGT_DEVICE="sys:/sys/devices/platform/vkms" ./scripts/run-tests.sh -t <name of test>
> > +
> > +For example, to test the functionality of the writeback library,
> > +we can run the kms_writeback test::
> > +
> > +  sudo ./build/tests/kms_writeback --device "sys:/sys/devices/platform/vkms"
> > +  sudo IGT_DEVICE="sys:/sys/devices/platform/vkms" ./build/tests/kms_writeback
> > +  sudo IGT_DEVICE="sys:/sys/devices/platform/vkms" ./scripts/run-tests.sh -t kms_writeback
> > +
> > +You can also run subtests if you do not want to run the entire test::
> > +
> > +  sudo ./build/tests/kms_flip --run-subtest basic-plain-flip --device "sys:/sys/devices/platform/vkms"
> > +  sudo IGT_DEVICE="sys:/sys/devices/platform/vkms" ./build/tests/kms_flip --run-subtest basic-plain-flip
> > +
> >  TODO
> >  ====
> >  
> > -- 
> > 2.25.1
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
