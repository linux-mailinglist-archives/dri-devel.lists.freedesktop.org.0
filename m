Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5104A23D5D9
	for <lists+dri-devel@lfdr.de>; Thu,  6 Aug 2020 05:47:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 556AB6E871;
	Thu,  6 Aug 2020 03:46:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0B546E871
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Aug 2020 03:46:55 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id v22so23293029edy.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Aug 2020 20:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f2kb8WT6iJUpQoGUmjdEKWB1j0Md48P0Y6vHOyGo29M=;
 b=B3s3hBXcbfQCf3Uz5Dg4ixywxCm49c2oaMaBQG7zGnPK376hBCW64xzquLDI41FrXt
 M82Bb/AHXRn2uiGkJUzuHa9P+h5geMuGRQRi/a6GhlUB1xYTdE0WqZtYYJ6smvDLL9fX
 vN2bllEExePKU2ZLiLGEajHxQeHCAgRCC1iU0mnk+f3Y3p82Yg/opALuBFsHnFW3aqQX
 fIJxy5yI7JOu6h0eK3o5m7YGYQ7D5qTor5QEnka4zk6b3j7GGjRxU48zZWH2wHZ+kOv5
 o60WKW1FrYaqnjvxXrxu0KhB595y5CAzPG79CuroLo3l6XcGN4CrqCyKpMs/tvnzS2W3
 ZzDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f2kb8WT6iJUpQoGUmjdEKWB1j0Md48P0Y6vHOyGo29M=;
 b=lEwp5Cd7Ul8+GYNKGA98xskNyR1zNw8bCqFvNpWkS8qfVwvW61p+DWVvvM6fROZGQk
 wGgO4urubjzMspU0lWJvQOFVoe54b3L9NUGKJ87HqrEYM3TJPGbVqcToIXZrniZhFR6h
 U1hSJO27kQJ3O/+6fJbrE563mPUaeXeGefWaMaPyVAtGkpajuaFDV0u9iKcE8FJPg3ge
 G8E5R9mN976pae10QGfL2q1Rw8hYmk4EFQIK6d2iCWLr+panh4aky5OofnOE7yyIK3Qx
 TQgzyUPElAu6bGlGJ7MFPW/4OZOdIK4uDP3zINoTMjRqjpJe0aICbSxAsD0mOGbVGb3k
 imjA==
X-Gm-Message-State: AOAM533kf9BloCz1a2477Mbkf6NdbxfUuEmVXvszXWkjoJkGL1+ni0HW
 CpD1XQhV2x/v8C3tamdVwKcE0dlkmj63IdjF2OY=
X-Google-Smtp-Source: ABdhPJyBvJUB9ah9AT1r4E58cEy13MVS9hV52YQM2gFnCxBeSnJjX8nAXoIpo6PDUb6M9/HXD/8t3DasIrQ+tb9KVC0=
X-Received: by 2002:aa7:cc10:: with SMTP id q16mr2158257edt.298.1596685614550; 
 Wed, 05 Aug 2020 20:46:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200731040520.3701599-1-airlied@gmail.com>
 <20200731040520.3701599-40-airlied@gmail.com>
 <ed4f79bc-d01e-bc78-77ef-5120ae70a64f@amd.com>
 <CAPM=9tydAjSwOWf_CRUYqM5HzuhWPH8HUYOmn0P1ufGFCB=Gvg@mail.gmail.com>
 <b39fd32c-0c22-70c6-5abd-22eea744c769@amd.com>
In-Reply-To: <b39fd32c-0c22-70c6-5abd-22eea744c769@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 6 Aug 2020 13:46:42 +1000
Message-ID: <CAPM=9tz4dfr3CSPoyBKL-zxCfVW7N3Yj==G=T9MB_2RRUwzsGg@mail.gmail.com>
Subject: Re: [PATCH 39/49] drm/ttm: make ttm_bo_man_init/takedown take type +
 args
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Roland Scheidegger <sroland@vmware.com>, Ben Skeggs <bskeggs@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> That was not what I was talking about. Take a look at what those fields
> are used for :)
>
>
> As far as I see the only usage of the size is in
> ttm_resource_manager_debug(). But this size is actually totally opaque
> to TTM, it could be pages, bytes, fried chicken wings or whatever. In
> other words it would be much better to print it in the debug callback of
> each resource manager.

Size is a bit trickier as the drivers use in a couple of funky places, radeon
pokes inside the range manager and adjust its size post init, and amdgpu
uses size to validate a bunch of bo sizing. These shouldn't be too messy to
workaround.

> The available_caching is completely superfluous as well. The original
> idea what that a driver could specify multiple placements as flags in
> one entry, but no driver ever used that as far as I know and it became
> completely deprecated in 2014 when I moved the lpfn and fpfn into each
> place.
>
>
> The default_caching is used in ttm_bo_select_caching(), but this is
> complete utterly nonsense. It just results in multiple possible cache
> behaviors being selected, which are then fortunately ignored by
> ttm_tt_set_placement_caching :)
>
>
> To be honest I think just removing those parameters and the associated
> caching flags all together is the next logical step.

Definitely something to burn down alright.

Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
