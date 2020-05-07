Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7384B1C9940
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 20:27:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68CE26E1A2;
	Thu,  7 May 2020 18:27:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72FC66E1A2;
 Thu,  7 May 2020 18:27:40 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id g16so6394412eds.1;
 Thu, 07 May 2020 11:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QWr9DvvsMFmVxp+qAwg3fX2KrqX/x6aAo4AYWgOB5Qw=;
 b=Qq3s6nqqoirAAWmT8i1qcGBVqcM5eqsmvAZFMeO5bvnrgwHbozvVaIfvFH5hXFgipQ
 eHr+jvPnrHGtNTFv13OEhpHVxgtq8tMBxgzUHHLdrlqV+/FG9GzT8yu0FUjAVBpDHC1t
 ZQb3yEutLxMZZ6OBH6+waaxmfaWrDLTwOYJ1t4+m3MkvCZYBhXWobfNbyyStXO53ZSOf
 KRiG5bIeT/3KiIC5SJvaA6rH9jS7frfNfUEsxhVwvI9YpFltlkz5ZiiXfiFKuCl2DAic
 92fsK8OAqeAY3uO0iE4FQhkZLroaVGboZchzZdD76C2pcWwPV8qDQy+NqJGIxsyz0YiH
 DxsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QWr9DvvsMFmVxp+qAwg3fX2KrqX/x6aAo4AYWgOB5Qw=;
 b=pLrPa3UghCOIXhB3zOLfWB+5F624VVdHMM6Z9OMggEGdSNcSJ1UQoVtvDkaubTknkH
 UovG1bEwqB+fixueog6zt7Q4eM3K89JAMzsHBV79a4E0R6pDsHcCL32Fu35TGJK2cFoZ
 sp/OiDc9LfXRsp0eFY6reAWEl+QF7g4LYxW9CBhrnkT45LVIhKUJaINzQW+tLA3tF3VO
 0Xwd8A/IS2s4j4WHcAXNT8M3ejHYeUj4HFHqdYVBvh6zwjZ6WNXxMWoVzk0Ca/tKVxD5
 d437WBFd/BsXTyzhaTerL++hbzKwMnz5owFr9RgH65tG8jaoZ/G7EkddIpgvAtztimC6
 5Z1A==
X-Gm-Message-State: AGi0PubTt4jcysHbKxVfirb9l0LTpmyQZF3YABrcJIDAFllmBkFlXhDA
 zKK5K69KO67LesPuYimLpWIYw+MZVkBn58pldTo=
X-Google-Smtp-Source: APiQypIFjIE2vo4XeHmJyZb97yPbBOSylzyVFDiC7OpkOgyk6jxnlccOcS92g7BZTbYHhMSpTscRNbilT+QLNX3gqwI=
X-Received: by 2002:a50:a365:: with SMTP id 92mr13625862edn.220.1588876058972; 
 Thu, 07 May 2020 11:27:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200507153600.314454-1-jason@jlekstrand.net>
 <158886626795.20858.1870213936656066157@build.alporthouse.com>
In-Reply-To: <158886626795.20858.1870213936656066157@build.alporthouse.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 8 May 2020 04:27:27 +1000
Message-ID: <CAPM=9tyhj+KNDFdw1nk0GASwfY5dwq2kAcxQ4oSHMt2BNyycVw@mail.gmail.com>
Subject: Re: [PATCH] RFC: i915: Drop relocation support on Gen12+
To: Chris Wilson <chris@chris-wilson.co.uk>
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
Cc: Dave Airlie <airlied@redhat.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 8 May 2020 at 01:44, Chris Wilson <chris@chris-wilson.co.uk> wrote:
>
> Quoting Jason Ekstrand (2020-05-07 16:36:00)
> > The Vulkan driver in Mesa for Intel hardware never uses relocations if
> > it's running on a version of i915 that supports at least softpin which
> > all versions of i915 supporting Gen12 do.  On the OpenGL side, Gen12 is
> > only supported by iris which never uses relocations.  The older i965
> > driver in Mesa does use relocations but it only supports Intel hardware
> > through Gen11 and has been deprecated for all hardware Gen9+. The entire
> > relocation UAPI and related infrastructure, therefore, doesn't have any
> > open-source userspace consumer starting with Gen12.
> >
> > Rejecting relocations starting with Gen12 has the benefit that we don't
> > have to bother supporting it on platforms with local memory.  Given how
> > much CPU touching of memory is required for relocations, not having to
> > do so on platforms where not all memory is directly CPU-accessible
> > carries significant advantages.
>
> You are not supplying them, the kernel is not checking them [as they
> don't exist], so there is no material benefit. The only question is
> maintainability.
>
> How confident are you that you will never use them and rewrite the
> media-driver? The code exists, will be tested, and can just as easily
> expire with the rest of execbuffer2.

From an upstream POV I say hell yes, if the hw isn't generally available yet,
and the media-driver/intel-compute-runtime people are warned in advance,

I'm all in on ripping it out for new GENs.

Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
