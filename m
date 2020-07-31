Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B11234348
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 11:29:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 348626EA4B;
	Fri, 31 Jul 2020 09:29:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C3286EA4B
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 09:29:39 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id y3so27364313wrl.4
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 02:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=u6xFNB3TTyD1yb/8Ow31JuCFSzVGv8gDqRe9c/Y+jM4=;
 b=cQBdVs8hZyJ/IQxOCNWYGC9SdGeoYe875fD8Lb/QtKoNrEhNIJnNZd9GC2E/p5W32I
 s1z3xMk8KB+rbLbXdU613BYd0MCIWreQwU6u812/3XzP3+Ic6GXZeDYCGn1io/w9NfHN
 7wGwtV1LtOOHEz96LMIrg/buEPua8KaFimqL0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=u6xFNB3TTyD1yb/8Ow31JuCFSzVGv8gDqRe9c/Y+jM4=;
 b=ZyaGuPQy+sODhw7dMFqznnMFYt3gxFgHLzG2CQVEaYRjK39jyI55pSlxjjoTGvnKFj
 YaRpTO+nOMGd3IHhzRACiWfx2mS1OjfNztHuDlPc6nJA8GUmJzD4zs9h67xWRFFW9+hH
 mv9Qw0TCTlmtWIXZQd9GgzoSDNUdcGt6jrAocKq2o2iljo1WthB2gYI2UnAoCu0IQuhb
 pd/cZ5ZeNyUK3Ji3k7pFwC+1yBz/HjokOL7gZ4FzpvfFXVobiZXuExkG+IjDQsJSdjkh
 mCzc9Qyiyh+/xjNBDYOVdgOjFBumGuipVyfj//xE1CbQl97BmusOXvZVijqXp5TuqSFT
 NY0w==
X-Gm-Message-State: AOAM531hxN/4r7+b+mitvbVEDLtG62tqpdaHG4QuAUDoQ5ZW9lthvATR
 iryfvrEptqh5xRqaeqql6zwT1/idHWU=
X-Google-Smtp-Source: ABdhPJxd+AKokgrxXnQcM0hpdJSx42SgwT/+zjla4tBcR1r51eM4fMGPwNMwle8XiQH3ztDHBWnP1A==
X-Received: by 2002:a5d:480b:: with SMTP id l11mr2559012wrq.85.1596187777732; 
 Fri, 31 Jul 2020 02:29:37 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n5sm12464425wrx.22.2020.07.31.02.29.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2020 02:29:37 -0700 (PDT)
Date: Fri, 31 Jul 2020 11:29:35 +0200
From: daniel@ffwll.ch
To: 
Subject: Re: [PATCH 00/49] ttm mem manager refactoring.
Message-ID: <20200731092935.GZ6419@phenom.ffwll.local>
References: <20200731040520.3701599-1-airlied@gmail.com>
 <e4a040b5-8033-1f1d-7dbc-02341c0927e9@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e4a040b5-8033-1f1d-7dbc-02341c0927e9@amd.com>
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
Cc: sroland@vmware.com, bskeggs@redhat.com, dri-devel@lists.freedesktop.org,
 kraxel@redhat.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 31, 2020 at 11:17:26AM +0200, Christian K=F6nig wrote:
> Am 31.07.20 um 06:04 schrieb Dave Airlie:
> > I started pulling on a thread, and it led me down a hole.
> =

> We might want to make that hole even bigger :)
> =

> How about we rename the ttm_mem_reg into ttm_resource and
> ttm_mem_type_manager into ttm_resource_manager.

+1 on names I can understand, I alwas get confused about what exactly ttm
means with mem_reg and mem_type_manager.
-Daniel

> =

> Neither amdgpu's OA/GWS resources nor the IDs in VMGFX are really memory.
> =

> In the long term I also want to move the whole address handling into each
> backend.
> =

> Going to send comments on the individual patches as well.
> =

> > This series refactors the ttm ttm_mem_type_manager object into
> > a driver owned, allocated, subclassaed object.
> > =

> > It starts with two minor fixes for some bad assumptions in two drivers.
> > =

> > Enables a new init path, ports all the drivers to the new init
> > path, and cleans up the old init path.
> > Enables a new takedown path, ports all the drivers to the new takedown
> > path, and cleans up the old takedown path
> > Wraps all access to the memory managers in the bo_device in a wrapper
> > across all drivers.
> > Make debug callback optional
> > Enables driver to provide their own mem manager objects
> > Subclasses the objects in all drivers and makes them into driver owned =
object
> > Drops the bo_device arrays of pointers, and some unneeded links and
> > struct members
> > Cleans up one api.
> > =

> > I think I'd probably want to merge all this via drm-misc, so if I can c=
ollect
> > acks/r-b from driver maintainers that would be good.
> > =

> > This is also based on Chrisitan's work to remove init_mem_type, so it w=
on't
> > apply until he's finished getting all of that into drm-misc.
> =

> Preparing to push that to drm-misc-next just now.
> =

> Regards,
> Christian.
> =

> > =

> > https://nam11.safelinks.protection.outlook.com/?url=3Dhttps:%2F%2Fcgit.=
freedesktop.org%2F~airlied%2Flinux%2Flog%2F%3Fh%3Dttm-refactor-mem-manager&=
amp;data=3D02%7C01%7Cchristian.koenig%40amd.com%7Caa32512acf9f4bf455ef08d83=
506f9d2%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637317651361302583&amp=
;sdata=3D2sQt4A48ODl0Nq4P21YG3vRNdhkDZcZp0XHkQ930SAI%3D&amp;reserved=3D0
> > is the tree I've built this on top off, so it's probably going to get r=
ebased
> > but the code should stay mostly the same.
> > =

> > I've done some boot testing on nouveau, and I hope to test it on vmwgfx=
 and
> > amdgpu soon.
> > =

> > Dave.
> > =

> > =

> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
