Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CBD25AB55
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 14:44:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEDA86E4F9;
	Wed,  2 Sep 2020 12:44:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C69E6E4F9
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 12:44:43 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id i4so4128889ota.2
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Sep 2020 05:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XggPijnaL/FuwihGOsie/H71xn4dqXKWWLBhhTci8wk=;
 b=VhIv6m7i/h5+SBkZRRZCJiZBnUypXC4JbKQPh37SlVBODZ1WN2xuwxO9GCqj0dgK7B
 BQR2fKQ+cI+m3pr9P14w6t0JNlGOCOAmsyWTNcyR7PUCRU6ynr8giq0vM2RevPjf8hp/
 bKh5w5QZQj55amMXR7tHffA1nre1ibDM6txUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XggPijnaL/FuwihGOsie/H71xn4dqXKWWLBhhTci8wk=;
 b=UyzOnjaS5xygJapX4LXy18ktnR/7O5vjaH6oCKJya/tp+5s+W8c3yoe3Jh2yzCj+19
 rnNYIMK82dLpSMMHjkPggra+ArHC2VBXBeh0ZBV9pBYGnyro0HiFu9WSEmS8z4sFmtc6
 6bOpHNGHZkUlG7slSgOXKnovx+cFPUpJ9ydnyqdimmwrP50yDZ9vmFGm1ACjghc7Gb1F
 WP1FjfsqFKwNLcrqHEIdqTVK0ttyOfQo7hhHdkXDO+73k4RbWfq8M+EO1NAZAMjQyAaY
 kmWtS9UOaPYIbb35pi/3ED1p2IWT8Cth/f+tAOS0osFs5/KTSfYBixXbk/ERnxK57X51
 2Trw==
X-Gm-Message-State: AOAM530j1YtCXnz6q+zhtVmcWAnZSSfdJLFHv5lgXDZQa0rDsK7KsHQS
 /MX5dUdiXKx4O+FvazJyZXDmfFOwFnP4feRbfmWVhQ==
X-Google-Smtp-Source: ABdhPJzbYE1r6boY5xYrQ8AseNqDojacYNphkcIzcm+nBrfUYy0f2oR/fmv30OEO9hHfAXsHfbOm7yODmLVMPkMu6gY=
X-Received: by 2002:a9d:7a52:: with SMTP id z18mr3866640otm.281.1599050682542; 
 Wed, 02 Sep 2020 05:44:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200902102440.3621733-1-daniel.vetter@ffwll.ch>
 <t3hHLqZ0yNm5FdxpyJovgjEVzs-OD7qD5nYrYXug8UhkBykhekB0_hOqPltEvFH3daJ3HYtY_3FInv3U5xIHprg1FS7b2SP8fCf48r7DvVg=@emersion.fr>
In-Reply-To: <t3hHLqZ0yNm5FdxpyJovgjEVzs-OD7qD5nYrYXug8UhkBykhekB0_hOqPltEvFH3daJ3HYtY_3FInv3U5xIHprg1FS7b2SP8fCf48r7DvVg=@emersion.fr>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 2 Sep 2020 14:44:31 +0200
Message-ID: <CAKMK7uFztTjjvQvM-toeZv3hps+NMJFXV7s=Dzs5PwG3J+7wjw@mail.gmail.com>
Subject: Re: [PATCH] drm/doc: Document that modifiers are always required for
 fb
To: Simon Ser <contact@emersion.fr>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 Juston Li <juston.li@intel.com>, Daniel Stone <daniels@collabora.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 2, 2020 at 2:40 PM Simon Ser <contact@emersion.fr> wrote:
>
> Looks fine to me!
>
> Acked-by: Simon Ser <contact@emersion.fr>
>
> I suppose something similar happens in user-space: gbm_bo_create
> without modifiers needs to properly set the implicit modifier, ie.
> gbm_bo_get_modifier needs to return the effective modifier. Is this
> something already documented?

I don't think that happens, but it has come up in discussions. It's
kinda different scenario though: getfb2 is for cross-compositor stuff,
enabling smooth transitions at boot-up and when switching. So you have
a legit reason for mixing modifier-aware userspace with
non-modifier-aware userspace. And the modifier-aware userspace would
like that everything works with modifiers consistently, including
getfb2. But gbm is just within a single process, and that should
either run all with modifiers, or not at all, since these worlds just
dont mix well. Hence I'm not seeing much use for that, -modesetting
being a confused mess nonwithstanding :-)

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
