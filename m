Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0DD4ABD1F
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 12:57:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D730710F954;
	Mon,  7 Feb 2022 11:57:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA6A110F953;
 Mon,  7 Feb 2022 11:57:15 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id a28so26291026lfl.7;
 Mon, 07 Feb 2022 03:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=qT4t7C5hlBWUS2Qpnn3V7J8roQL7i/m1ege9fv5/FIY=;
 b=IGC/NdZ5L8zpryzgat9+XnhIju/fpkAY1x6PdYhahuqGvTwQBI2y1U7P6JrD3NGUdu
 ZzYFXb9C9o9ETCpWn6K8MkOqIbEZSm5qyTyWN+MfniSdpmFKNXNY4I9UXSlpL7IW3RwP
 YqH/YkeJRAaEj9cG2upOozsT8gqhV7CwlDHvAE4GyLAvyzZ3O20kQmtBFJo8rcGNz4kQ
 mTD6G9PogIqDyjVRO5K6cL7NwCqAD/cI4SoR4htwwOiTrGnI+ZhmPgJoTlJkiNZ03dY9
 uznqOKX86lSw4kujlsFrj9OZSg6MkBSQZ2HDtJWxPUTCB9q6RmUrKJE+MmbGqjhsBpVv
 yglA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qT4t7C5hlBWUS2Qpnn3V7J8roQL7i/m1ege9fv5/FIY=;
 b=PUmByoQQkAJi/84FPr32MnZ+oG8g40vg5sS+QbZsJhtLAtlsK1kX6D0SOa2c7YQe8P
 UGe+9MuHQEUQEDBVzBNs57VTPCmTCSeyjm93vAS51iyJopbBIqCyQSMITGk8355iSA1m
 NlpsJNyEzwX2A8V3ncmH7hH5bbkXPp8MPSk8ua7ZYmzek9FlfqVJH6bgmwWrdKtbrCeN
 TtXyy0McYN/NgT20Rzgf0JDjDIHeDfukY+dywycCxDmwLuYBDd1TOapmoZt9r51cZ2HF
 szDaGuVAlmX7KAL3jMwkzomQut7hy5TwNP/svlXvHiWG7bw5ihk/khP8BeYRE2RZzkbO
 Iw0g==
X-Gm-Message-State: AOAM530jcMbchNMHSU9zvQd5LReLn8c/zRDGJnv5wkL4OrMZUSD6Cz8S
 mzmlgtIqqDSJ15j+dU5xG0o=
X-Google-Smtp-Source: ABdhPJxN9dwKTdnsmwtngX/qp+mmD/PXm5D2zQAG1HohVxwrQ0CrlsDAYhtoniHUNGpiuZwoX+c+4A==
X-Received: by 2002:ac2:4c4b:: with SMTP id o11mr8200833lfk.253.1644235034111; 
 Mon, 07 Feb 2022 03:57:14 -0800 (PST)
Received: from [10.10.10.122] (88-115-161-74.elisa-laajakaista.fi.
 [88.115.161.74])
 by smtp.gmail.com with ESMTPSA id a16sm123991lfb.63.2022.02.07.03.57.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Feb 2022 03:57:13 -0800 (PST)
Message-ID: <5c916187-8a8c-323a-adb4-8bce141180cc@gmail.com>
Date: Mon, 7 Feb 2022 06:57:13 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/3] i915/gvt: Introduce the mmio_table.c to support VFIO
 new mdev API
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>, Christoph Hellwig
 <hch@lst.de>, "Wang, Zhi A" <zhi.a.wang@intel.com>
References: <20220127120508.11330-1-zhi.a.wang@intel.com>
 <20220207073247.GA24327@lst.de>
 <DM4PR11MB5549FE45F8098368114ADE75CA2C9@DM4PR11MB5549.namprd11.prod.outlook.com>
 <20220207083535.GA25345@lst.de> <877da7rlzr.fsf@intel.com>
From: Zhi Wang <zhi.wang.linux@gmail.com>
In-Reply-To: <877da7rlzr.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "jgg@nvidia.com" <jgg@nvidia.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/7/22 05:48, Jani Nikula wrote:

> On Mon, 07 Feb 2022, Christoph Hellwig <hch@lst.de> wrote:
>> On Mon, Feb 07, 2022 at 08:28:13AM +0000, Wang, Zhi A wrote:
>>> 1) About having the mmio_table.h, I would like to keep the stuff in a
>>> dedicated header as putting them in intel_gvt.h might needs i915 guys
>>> to maintain it.
>>> 2) The other one is about if we should move the mmio_table.c into
>>> i915 folder. I guess we need the some comments from Jani. In the
>>> current version that I am testing, it's still in GVT folder. Guess we
>>> can submit a patch to move it to i915 folder later if Jani is ok
>>> about that.
>> Yes, let's have Jani chime in on these.  They're basically one and the
>> same issue.  This code will have to be built into into the core i915
>> driver even with my planned split, which is kindof the point of this
>> exercise.  I think it makes sense to use the subdirectories as boundaries
>> for where the code ends up and not to declarare maintainership boundaries,
>> but it will be up to the i915 and gvt maintainers to decide that.
> Agreed. If there's going to be a gvt.ko, I think all of gvt/ should be
> part of that module, nothing more, nothing less.
>
> The gvt related files in i915/ should probably be named intel_gvt* or
> something, ditto for function naming, and we'll probably want patches
> touching them be Cc'd to intel-gfx list.
>
> Joonas, Rodrigo, Tvrtko, thoughts?
>
> BR,
> Jani.

Hi Christoph and Jani:

Thanks for the comments. It would be nice that people can achieve a 
agreement. I am OK with both of the options and also moving some files 
into different folders doesn't needs me to do the full test run again. :)


Thanks,

Zhi.

