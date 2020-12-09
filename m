Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 211472D37FE
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 01:54:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6BC06E201;
	Wed,  9 Dec 2020 00:54:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD2176E201
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 00:54:12 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id q75so30968wme.2
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Dec 2020 16:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=l5gzTC7AC2N1XraPt/fdhIFbZxuzybNPj/HRm5T2Z3w=;
 b=ip3kTggH1oiJ0wlJxFia9JdGxaEVCC9zJudD3Jmy8dZGbiHuDlBmGaqpaqSbcIEW/c
 5F8KBzJANmrqbj9I8gkfG+q81tlyVstdY0EI5gQh6XcZjkRF0X18MZBX1dlEDrB4Uu3A
 sVRAViWMntuyTkWnhwrDXMFA1pk24Im5G09bg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=l5gzTC7AC2N1XraPt/fdhIFbZxuzybNPj/HRm5T2Z3w=;
 b=me64aCyJVYK/LZLO8OfBiweKJGIdApq8+zC8KzYRFifKQTuMyCtQIRmDjeSRhtOOZI
 J7uvncwf8lA/OKbq2zIg+GFryRf0LffK4tKBfC+ScA0QlILeapiRe/uPxgDk4fRIRjL5
 xuAR1Wi6SU5Hh0/IYJtptcwABtTJmQx5Qwo1/zY1a9riT3uoUZ5cMZlHURHhj0tEEWgt
 tnxcyZjFpBOpt1cs7Ysgzghjg8f1751zj9Y2fWxHqgG3/Kgb4cGDE/mWSeQTWx6+vpup
 JpucLEFMoJGeTWwmXvQYjigJSuqqz7u05gfBptDxOyuKbj5aYEW/sS7F2xoFYxI0ZOXi
 RXqw==
X-Gm-Message-State: AOAM533leXfwaYVqCBPMyo4zg6kibBP4Fzg3A0brbvlUf/0s/O9K49fq
 NT69XQ8mE53MtrWisywNbjeJQQ==
X-Google-Smtp-Source: ABdhPJxFrB0aU0ddMqvI3X+AydBtBa1ZHYEdU75BMNhwrUV7CXlexPc1d7/bVNAYhS6kHXte9/cuPg==
X-Received: by 2002:a1c:e445:: with SMTP id b66mr36663wmh.187.1607475251414;
 Tue, 08 Dec 2020 16:54:11 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j15sm1048145wrr.85.2020.12.08.16.54.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 16:54:10 -0800 (PST)
Date: Wed, 9 Dec 2020 01:54:08 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Sumera Priyadarsini <sylphrenadin@gmail.com>
Subject: Re: [PATCH V2] drm/vkms: Add setup and testing information
Message-ID: <20201209005408.GP401619@phenom.ffwll.local>
Mail-Followup-To: Sumera Priyadarsini <sylphrenadin@gmail.com>,
 melissa.srw@gmail.com, hamohammed.sa@gmail.com,
 rodrigosiqueiramelo@gmail.com, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 corbet@lwn.net, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201208203735.ukqrgjmlntbvxc7e@adolin>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201208203735.ukqrgjmlntbvxc7e@adolin>
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

On Wed, Dec 09, 2020 at 02:07:35AM +0530, Sumera Priyadarsini wrote:
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
> ---
>  Documentation/gpu/vkms.rst | 67 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
> 
> diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> index 13bab1d93bb3..d6739fbbe503 100644
> --- a/Documentation/gpu/vkms.rst
> +++ b/Documentation/gpu/vkms.rst
> @@ -7,6 +7,73 @@
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
> +to test::
> +
> +  sudo ./build/tests/<name of test> --device "sys:/sys/devices/platform/vkms"
> +  sudo IGT_DEVICE="sys:/sys/devices/platform/vkms" ./build/tests/<name of test>
> +
> +For example, to test the functionality of the writeback library,
> +we can run the kms_writeback test::
> +
> +  sudo ./build/tests/kms_writeback --device "sys:/sys/devices/platform/vkms"
> +  sudo IGT_DEVICE="sys:/sys/devices/platform/vkms" ./build/tests/kms_writeback
> +
> +You can also run subtests if you do not want to run the entire test::
> +
> +  sudo ./build/tests/kms_flip --run-subtest basic-plain-flip --device "sys:/sys/devices/platform/vkms"
> +  sudo IGT_DEVICE="sys:/sys/devices/platform/vkms" ./build/tests/kms_flip --run-subtest basic-plain-flip

Does IGT_DEVICE also work with run-tests.sh? Aside from my curious
question, patch looks good to me, thanks a lot.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

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
