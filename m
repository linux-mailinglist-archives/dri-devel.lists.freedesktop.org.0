Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E5D368D2E
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 08:25:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4DD66EB45;
	Fri, 23 Apr 2021 06:25:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1A956EB43;
 Fri, 23 Apr 2021 06:25:52 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id h10so56179345edt.13;
 Thu, 22 Apr 2021 23:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GJ0OfejcSKcu5jMSXE+csw5jWV+060M5nxuJF3eMSt4=;
 b=QDT8KfpyL0E1RVf8TusCzRyncN8dpPpglZ1GN81/9b2LmLYic1i5wLKLO5O38Z2vGr
 SlPok3DRmINVQ6LKM6hoTKtriQe7+Gt30vvQMI5Y7JJsBdEauILunmknd42r6GXYMaWS
 aRMW0QQWHHmxYLFgOJ2zm7FC7pCMWN06VPYufh27qlpp7NJ4aaG+AuKfSXHL4nzduFGo
 GMh43By/RKQ1lm2MHllOnhaovzaWRAsrRS1iEFdAbl219nqtbCItiJO7srCGqIywTLqD
 m/MAoe4quSAAZy1RO2fs5H6lbTFdxLJA0rV6J2YtytCleCipnz1/g+wRMBRkS8sDN6gg
 5z/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GJ0OfejcSKcu5jMSXE+csw5jWV+060M5nxuJF3eMSt4=;
 b=sgigNf7cXGt8kQbJO7SzLLTEIDBQa/N8PSdHKMrq/cCDs5iCPK6jHppe8j2OXOW3kC
 XR6cmMycDZYY0EnjU758GMu4CPY1AHto5sWsPFfNOx0AWVjpamHER+TUpgCwxrTZKGOI
 eZHA5/kuKbdxIKzBNoYCacTjbfKmnPDi8TJ9KmSTPZJcMJHVlU7/mCtsKmJPh/Y4fC+Q
 sEHZBBeYWX5WNOpY5jdXQdhHJADrLnqzGXpp5Oj80ala0bhV6f8y4Eiy2N1MDp9vNPyS
 UvldpieMPFdo/MoLOcHepOcVGqJH5eu4teqQNojbcDkZwzyGW/Ef3XjznFAX6GTHCpnQ
 Go7g==
X-Gm-Message-State: AOAM531iLrYQxEzWvr1ji/W/7NX7CdL9EyluBBpf1JkwiricI98EH/wu
 vAaf4z/8cvD+l/X4WTgJkwgWbZgPvEK0dvdwSzqxDIap
X-Google-Smtp-Source: ABdhPJyFzyyFvl+ap11hNzvZjZZ0V0bj6+t8Lkp50t1gG1OVbKJkA7vIrhBrnHcGWoG8Vx1g6XXOQiTGywfLdqsNtgQ=
X-Received: by 2002:a05:6402:441:: with SMTP id
 p1mr2592204edw.298.1619159151619; 
 Thu, 22 Apr 2021 23:25:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210419164403.52470-1-matthew.auld@intel.com>
In-Reply-To: <20210419164403.52470-1-matthew.auld@intel.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 23 Apr 2021 16:25:40 +1000
Message-ID: <CAPM=9twy4NetwCmptDTvWZzL7ufC2xZ_nFgLGgXK9JqpmP=C3Q@mail.gmail.com>
Subject: Re: [PATCH v4] drm/doc/rfc: i915 DG1 uAPI
To: Matthew Auld <matthew.auld@intel.com>
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
Cc: Lionel Landwerlin <lionel.g.landwerlin@linux.intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Jordan Justen <jordan.l.justen@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Kenneth Graunke <kenneth@whitecape.org>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Jon Bloomfield <jon.bloomfield@intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>,
 mesa-dev <mesa-dev@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 20 Apr 2021 at 02:45, Matthew Auld <matthew.auld@intel.com> wrote:
>
> Add an entry for the new uAPI needed for DG1. Also add the overall
> upstream plan, including some notes for the TTM conversion.
>
> v2(Daniel):
>   - include the overall upstreaming plan
>   - add a note for mmap, there are differences here for TTM vs i915
>   - bunch of other suggestions from Daniel
> v3:
>  (Daniel)
>   - add a note for set/get caching stuff
>   - add some more docs for existing query and extensions stuff
>   - add an actual code example for regions query
>   - bunch of other stuff
>  (Jason)
>   - uAPI change(!):
>         - try a simpler design with the placements extension
>         - rather than have a generic setparam which can cover multiple
>           use cases, have each extension be responsible for one thing
>           only
> v4:
>  (Daniel)
>   - add some more notes for ttm conversion
>   - bunch of other stuff
>  (Jason)
>   - uAPI change(!):
>         - drop all the extra rsvd members for the region_query and
>           region_info, just keep the bare minimum needed for padding

Staying out of the ioctl's being over engineering, I hope they have a
good future use case.

The plan seems like a good plan.

Acked-by: Dave Airlie <airlied@redhat.com>

Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
