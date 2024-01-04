Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 603C88240C4
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 12:38:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2343910E43C;
	Thu,  4 Jan 2024 11:38:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E59B10E421
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 11:38:11 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-50e7dff3e9fso439162e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jan 2024 03:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704368290; x=1704973090; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3aSj2Wvbjbi5E5bDKrVHlCSPZkdk0j/7KkRsBSDvxsw=;
 b=tBRLn8PLbiUSf4spUauMJuZxZG4p4r9LaLiFqFj8o6HOnTGjUuWRXgdpbW6tnfySb7
 LmgNSKxi0AQaVmRyNsBuh2AMH4yzpeWEQMRdOU0VAUY0bh5LYoF44ameCC1tvSdLjATf
 wVtfykSEzeKn3Wp8S9+fZASp2CNnraFOSXCnUjbpN86aJizxxexG0nMxW4qHwqMccdwk
 gr9KHnIwXhpiIJ+lT7bWAeRFrROmiz2pekHpRiYt3BKScSzMf4hzsJWynWkYsHZjytfi
 pNC3vwTdvVqDATvbh2GxgOrRoDR+C0N4kqctWheDYTb45UBt1UZx/cGtsAZLp0/TjE21
 6qew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704368290; x=1704973090;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3aSj2Wvbjbi5E5bDKrVHlCSPZkdk0j/7KkRsBSDvxsw=;
 b=Iv+LjUO47JDyvEl8LiwLrBG6CGQuFkKJvjpoZkqcB68iFB2nMUqoCKPBOzRNq9o92k
 sKS9Amh/jYHl15Ehn8hy/yjVLDDaKF2PHKN1NUpJlrdkvesX+vvp8bCwOw+ETof7RW4D
 1kLyIUsuev6f75tLVS6YTipJVufNdtg1avCrfzBwGl6z2dHAXFR1Rtbnzht5j/Sa6wb4
 avhQ4bt1WYzWegVE3oLZkAcUlEKnObdSxikSGVMUPOh3Ix7G2MgDHXA6Q8D99hoBvgvN
 qNotepEvjAdY1Xj6Xkysrgitqzma/TWWssW+JHP9ClJyQt4Z/jGI+bgwP42k2N6LweTz
 YliA==
X-Gm-Message-State: AOJu0Yw4wbnlAk+baKGVIFkEFx2Xl6b8cc8hEpkj+y+jzrciSkcDgZpN
 YML6R5t6T+r3hl2JpwcPgB3xaWsMfQnZ4A==
X-Google-Smtp-Source: AGHT+IEvl/qWWM+TJNFvW9USIRn2xPrQUlGgqQcM8IEfQZNkvJzxQiI8+wx96bRXJq5GGPpxXAf35w==
X-Received: by 2002:a05:6512:3050:b0:50e:7718:d4b8 with SMTP id
 b16-20020a056512305000b0050e7718d4b8mr319633lfb.96.1704368289559; 
 Thu, 04 Jan 2024 03:38:09 -0800 (PST)
Received: from localhost ([102.140.209.237]) by smtp.gmail.com with ESMTPSA id
 zz16-20020a170907351000b00a26e0236191sm10694696ejb.208.2024.01.04.03.38.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jan 2024 03:38:09 -0800 (PST)
Date: Thu, 4 Jan 2024 14:38:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH 08/11] nouveau/gsp: don't free ctrl messages on errors
Message-ID: <da677c9a-1863-4ee7-904f-5226276c4102@moroto.mountain>
References: <20231222043308.3090089-9-airlied@gmail.com>
 <f8594217-59b7-431c-9fdc-15e2ef6197ab@moroto.mountain>
 <CAPM=9txv+ULnX-f-dG=Ki2iZH5L7Sge-Jcd-asyPiBpVH962=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPM=9txv+ULnX-f-dG=Ki2iZH5L7Sge-Jcd-asyPiBpVH962=g@mail.gmail.com>
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
Cc: nouveau@lists.freedesktop.org, oe-kbuild-all@lists.linux.dev,
 oe-kbuild@lists.linux.dev, dri-devel@lists.freedesktop.org, lkp@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 04, 2024 at 10:41:50AM +1000, Dave Airlie wrote:
> On Thu, 4 Jan 2024 at 00:47, Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > Hi Dave,
> >
> > kernel test robot noticed the following build warnings:
> >
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Airlie/nouveau-gsp-drop-some-acpi-related-debug/20231222-180432
> > base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
> > patch link:    https://lore.kernel.org/r/20231222043308.3090089-9-airlied%40gmail.com
> > patch subject: [PATCH 08/11] nouveau/gsp: don't free ctrl messages on errors
> > config: powerpc-randconfig-r071-20231226 (https://download.01.org/0day-ci/archive/20231227/202312271917.55xuDMdc-lkp@intel.com/config)
> > compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project d3ef86708241a3bee902615c190dead1638c4e09)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > | Closes: https://lore.kernel.org/r/202312271917.55xuDMdc-lkp@intel.com/
> 
> This is a false positive, I think the code is operating like I'd
> expect, we maybe could restructure it to avoid this warning?
> 
> The idea is you send an rpc msg, if there's a reply you get a reply,
> if no reply you get NULL and if an error you get an error.
> 
> So in the case you get an error or NULL you just want to return 0 for
> the NULL as it's successful, and error otherwise.
> 
> Would using PTR_ERR_OR_ZERO make smatch happy? (even if it's not
> really what we want).

Hm...  You're using the API correctly.  Linus has complained about this
warning before but in new code over 90% of the warnings are correct.
It's a high quality warning.

I looked around for an explanation to see what the NULL meant but
couldn't find it documented in the code.  The NULL vs error pointer comes
from a function pointer and it's not always clear where the
documentation should be with a function pointer.  So perhaps I missed it.

Let's not use PTR_ERR_OR_ZERO.  Perhaps I should introduce a
PTR_ERR_OR_NULL() macro to silence this warning.  But most of the code
which does this correctly is in fs/ and they probably are like Linus and
would be surprised to learn that people get it wrong...

regards,
dan carpenter

