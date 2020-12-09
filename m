Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5B62D4D65
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 23:17:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C98816E1F2;
	Wed,  9 Dec 2020 22:17:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 319DB6E1F2
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 22:17:16 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id r14so3430274wrn.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Dec 2020 14:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=79KmwtjGYcYf9XiMvPhz4ZWUJEGfLsXRhQWD7gmiScs=;
 b=XLibbmtJVcyb9IQyblkkdG+HmmOyY34UgFZe2EWav2EYy8vQntysX5S44/cqSRqXI/
 WbxNLNHVD2qVwZl9/pLdM+b/Xxxj7bfJcveeh6XUx43Fsceznqw32/O3vm5pN/fKswhM
 nZ2ZYCVJxruUjAhp6rT7Ags4QDp+hL96as8QU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=79KmwtjGYcYf9XiMvPhz4ZWUJEGfLsXRhQWD7gmiScs=;
 b=c43/3mzPJmnC2hmLZTu+Hn6U9T3x6+nEyw3SZ2Z+WDdnctqEmshqVm/RxdSlQEA99E
 a480gskFTONF3sGpN/0UJa6bROLWvEgOr5XF2CjkoW/V8SvZfbaPPLIojzqLkrAzj0P6
 fDCrsrK60776TJ6IOi58Qy8G0QXDIWpwlMNbQhzCUlByaHsvx8NzWpDMFpna09TvUV0C
 i0KvFrHaBtq3f5ciibKvGX3EDMJrtiVnQ3W7FIcWAG+bBReSC+jsY6QkXYTz7saI4eOh
 BvBmc3EYTPItbqlpzh0QfTeKJOkhf4W0t/quUD4HHhyzfnfgamPqFPzGxL+GZB0lfZ6f
 DdIQ==
X-Gm-Message-State: AOAM531sckcP7USTwxc5iAtmgIDUhO8Kkru9V2hE8jmgHwi4j68XjtHa
 gzYW9Irrn4PjdBSLYMzQLABHUw==
X-Google-Smtp-Source: ABdhPJzpEoul1GN1qEB+vlnjNX2OsBJ/3OG5hYZd35Shr1mkpe0IGwF4WK5RjVsEHBVLInviEAGw3g==
X-Received: by 2002:adf:e705:: with SMTP id c5mr4709810wrm.303.1607552234937; 
 Wed, 09 Dec 2020 14:17:14 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r2sm5802355wrn.83.2020.12.09.14.17.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 14:17:13 -0800 (PST)
Date: Wed, 9 Dec 2020 23:17:11 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Sumera Priyadarsini <sylphrenadin@gmail.com>
Subject: Re: [PATCH v3] drm/vkms: Add setup and testing information
Message-ID: <20201209221711.GC401619@phenom.ffwll.local>
Mail-Followup-To: Sumera Priyadarsini <sylphrenadin@gmail.com>,
 melissa.srw@gmail.com, hamohammed.sa@gmail.com,
 rodrigosiqueiramelo@gmail.com, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 corbet@lwn.net, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201209190453.c6kp5winikr55n3i@adolin>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201209190453.c6kp5winikr55n3i@adolin>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: hamohammed.sa@gmail.com, tzimmermann@suse.de, rodrigosiqueiramelo@gmail.com,
 corbet@lwn.net, airlied@linux.ie, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, melissa.srw@gmail.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 10, 2020 at 12:34:53AM +0530, Sumera Priyadarsini wrote:
> Update the vkms documentation to contain steps to:
> 
>  - setup the vkms driver
>  - run tests using igt
> 
> Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
> ___
> Changes in v2:
>  - Change heading to title case (Daniel)
>  - Add examples to run tests directly (Daniel)
>  - Add examples to run subtests (Melissa)
> 
> Changes in v3:
>  - Add example using run-tests.sh script(Daniel)

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  Documentation/gpu/vkms.rst | 70 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
> 
> diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> index 13bab1d93bb3..9e030c74a82e 100644
> --- a/Documentation/gpu/vkms.rst
> +++ b/Documentation/gpu/vkms.rst
> @@ -7,6 +7,76 @@
>  .. kernel-doc:: drivers/gpu/drm/vkms/vkms_drv.c
>     :doc: vkms (Virtual Kernel Modesetting)
>  
> +Setup
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
> +kernel config file. Do::
> +
> +  make nconfig
> +
> +  Go to `Device Drivers> Graphics support`
> +
> +  Enable `Virtual KMS (EXPERIMENTAL)`
> +
> +Compile and build the kernel for the changes to get reflected.
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
> +Testing With IGT
> +================
> +
> +The IGT GPU Tools is a test suite used specifically for debugging and
> +development of the DRM drivers.
> +The IGT Tools can be installed from
> +`here <https://gitlab.freedesktop.org/drm/igt-gpu-tools>`_ .
> +
> +The tests need to be run without a compositor, so you need to switch to text
> +only mode. You can do this by::
> +
> +  sudo systemctl isolate multi-user.target
> +
> +To return to graphical mode, do::
> +
> +  sudo systemctl isolate graphical.target
> +
> +Once you are in text only mode, you can run tests using the --device switch
> +or IGT_DEVICE variable to specify the device filter for the driver we want
> +to test. IGT_DEVICE can also be used with the run-test.sh script to run the
> +tests for a specific driver::
> +
> +  sudo ./build/tests/<name of test> --device "sys:/sys/devices/platform/vkms"
> +  sudo IGT_DEVICE="sys:/sys/devices/platform/vkms" ./build/tests/<name of test>
> +  sudo IGT_DEVICE="sys:/sys/devices/platform/vkms" ./scripts/run-tests.sh -t <name of test>
> +
> +For example, to test the functionality of the writeback library,
> +we can run the kms_writeback test::
> +
> +  sudo ./build/tests/kms_writeback --device "sys:/sys/devices/platform/vkms"
> +  sudo IGT_DEVICE="sys:/sys/devices/platform/vkms" ./build/tests/kms_writeback
> +  sudo IGT_DEVICE="sys:/sys/devices/platform/vkms" ./scripts/run-tests.sh -t kms_writeback
> +
> +You can also run subtests if you do not want to run the entire test::
> +
> +  sudo ./build/tests/kms_flip --run-subtest basic-plain-flip --device "sys:/sys/devices/platform/vkms"
> +  sudo IGT_DEVICE="sys:/sys/devices/platform/vkms" ./build/tests/kms_flip --run-subtest basic-plain-flip
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
