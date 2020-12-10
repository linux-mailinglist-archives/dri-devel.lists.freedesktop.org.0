Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A512D5767
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 10:41:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17B3F6E400;
	Thu, 10 Dec 2020 09:41:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 500F36E400
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 09:41:52 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id q25so4261388otn.10
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 01:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4Ta40PEWGL3YWQEyYt38dT0jfaxSo3kx42TQxkvQgAk=;
 b=IzyEkyyv3BfjDGDjkC/LNmceYmU6gvYe6FVTx5OWirwwvjnvUwqs7WBCdc7+3OUfb7
 wnTLN8qytqcLNZZSgHZBKaCHFq3o4WAm5RUmhHVMO3WjZTgRe9zCZY35NeKd+6Dxt9Un
 TKfsA6k2UxbCCbTEjEDe0pbV7UCR3Z/mf6BvY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4Ta40PEWGL3YWQEyYt38dT0jfaxSo3kx42TQxkvQgAk=;
 b=Z2SH44IwmMLyYBBik8HD7AfFTBt0JQes2dDLizfI8ewqovo1eLGXCwLXSuWzfulE1n
 ZSJLZ9NfeomxFqPAumP8xfnSimM5yXElLPnj7OQYCcu7r2nHOP5jrLUuNcWpZ0M3AFZl
 LIcjzS7HT/Bt+9F8v9QE/OnWlQlF3pCLtNmB7S87gCPyFp7xSRoqaO26lMilSMAlQp8I
 blPM6tY8+zBFwD7fIKbg+8RYVYhoiVf0VDRGUaakT1f9NiIcRos3d3ju9vonBtF8VRJz
 TSBL+cmNvYhKjpX10HQ8rLX5mmAZYCODcXQhUTnFVqNek1VwkooiOKwhbREJDqkTQizz
 CuIA==
X-Gm-Message-State: AOAM5329t1btl+O0s2lUQxHfol00CuHTLCXPx9j+LnF+nrt2XSbx3YdJ
 3ykfC1T8PNsuM7bbYnKnsnHFz9Q9uW1il9Zy7TOgug==
X-Google-Smtp-Source: ABdhPJx+u2zOTXJpsF+pD4OE++HRXNiqWSQFEsVF6VgWsJGkGYY2iKznZjtnNHFmtQrE4JS0lDOi2hMFqYTWCE1xseo=
X-Received: by 2002:a9d:470f:: with SMTP id a15mr5089104otf.303.1607593311578; 
 Thu, 10 Dec 2020 01:41:51 -0800 (PST)
MIME-Version: 1.0
References: <Flhw06CjNijpm6MrrEz900234gKBhcrhb-a095T_WgAIqIWrGPZXl96t5UvcGv1Xi5o8xkDGJDuC76MO8qgWw1sVHK-JQK7eFKKteB_NYEo=@emersion.fr>
In-Reply-To: <Flhw06CjNijpm6MrrEz900234gKBhcrhb-a095T_WgAIqIWrGPZXl96t5UvcGv1Xi5o8xkDGJDuC76MO8qgWw1sVHK-JQK7eFKKteB_NYEo=@emersion.fr>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 10 Dec 2020 10:41:40 +0100
Message-ID: <CAKMK7uFh4j8b7vsKrL84uDkUH=QH7NH43zFO3mXQOypUqMQGkg@mail.gmail.com>
Subject: Re: libdrm commit rights request
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
Cc: Eric Engestrom <eric.engestrom@intel.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 10, 2020 at 10:34 AM Simon Ser <contact@emersion.fr> wrote:
>
> Hi all,
>
> I've been contributing to libdrm [1] and core DRM [2] a few patches,
> mainly documentation and minor fixes. To continue this effort, I'd like
> to request libdrm commit rights. libdrm is the interface user-space
> developers will use to interact with the kernel, so I think improving
> documentation there and unifying it with the kernel could be
> beneficial.

Sounds good to me, but I'm not maintainer there so you need someone
else to approve the gitlab request for developer.
-Daniel

>
> Thanks,
>
> Simon
>
> [1]: https://gitlab.freedesktop.org/mesa/drm/-/commits/master?author=Simon%20Ser
> [2]: https://patchwork.freedesktop.org/project/dri-devel/patches/?submitter=17330&q=&archive=&delegate=&state=*



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
