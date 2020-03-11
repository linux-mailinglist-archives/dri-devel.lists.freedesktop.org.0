Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A065E181F9D
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 18:36:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 825646E4C7;
	Wed, 11 Mar 2020 17:36:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 467B66E4C7
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 17:36:10 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id w9so2756342iob.12
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 10:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lo4+B6ozxJ4JNAWwvMHkRJAIzyUvnk0hyA/hJutWo9M=;
 b=YjoyH8DfWj4Z3XLttAVuhtiwh1nwqVrCRmS7Ob3U+bASK0OiBLI4GVcmubqp0z8D2K
 6BNnjQFMWq/JeoHaVp+yVpFx7knxcbXLj8Hishplwmn1MKdF6Hs4vWfWEW+WxmxR+2BT
 wv+CXS2towam0/b0Nlpmu7lHViSq3txafTON7537t6vAyocdIQYN5sQkenjvvxFyBPOH
 nOVdrXE5vMARdLBvf2QfqjJLEZWDamwS3xjhk7TRH8ZMEnQ1QPo5lqmbTInaZBGcCV/k
 0X6yz8qE2BA2gIOzMs+VMVVX+H9twjx4Cvx2cQCmQqJ0Z7zphruscb0EDCxIvyNVVrqa
 UfrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lo4+B6ozxJ4JNAWwvMHkRJAIzyUvnk0hyA/hJutWo9M=;
 b=VlgfvtSqGsGxtTgexgst4hvOI7QvHNht43+RJ3UlJGE1EfNsBfDXj1q5kIyevNZVz3
 Nn03e4x9pm8LiUE+9cHzE/Gia/FQ/XidsQu8mcyBy9S77wZ0zMaVpOf57LRaNJKbIZtM
 CNhGj2b3x32oWIcF5nu6FDUTdDVsGDUDLfMEYnlRbM02hOebvushp84/gqOJ9G60Mf/V
 Qi8cTHbF0Bo0K0FFwqJ1swLoHXaErmx6gQzk17GimUw6hN0qLgT4bLW1D8l8t9uDKIRN
 iIrBLgzd8xDWopLnKQi/jQA2FncylXlzmL5edi2GmQvWK8zfEX37eiC7zGY8IjAa3hDm
 ieGQ==
X-Gm-Message-State: ANhLgQ3SqGIAo3kPYHFmQlUN0ruzFSLhuAwh6Oez/eTicrQ3GmfkmlEr
 yLLFyvNrbJVNDf5kVpvSwW1Exx5i7Mzr8Qp62zc=
X-Google-Smtp-Source: ADFU+vvzt3MQdojvR//OMmINaL22lJ9DNDUcryz6u9XpvFzSPpalwaOdp9ju5Ysi7njtuTdc7yYqp7VdR1Qfz8KOnGc=
X-Received: by 2002:a02:908a:: with SMTP id x10mr4116266jaf.16.1583948169489; 
 Wed, 11 Mar 2020 10:36:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200310010818.569-1-gurchetansingh@chromium.org>
 <20200310074302.yx6anlvqvsg37yzs@sirius.home.kraxel.org>
 <CAAfnVB=sw=u80mHnZUPf_+WDW-hGNTDSBWLfV+7y3KFN=s6beQ@mail.gmail.com>
 <20200311103609.ei446gelkvbqrdzm@sirius.home.kraxel.org>
In-Reply-To: <20200311103609.ei446gelkvbqrdzm@sirius.home.kraxel.org>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Wed, 11 Mar 2020 10:35:59 -0700
Message-ID: <CAPaKu7SCquWkY3x3EeuvJvjmn1hV-rqeaq4KM5X0tcfVbqNojg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/8] *** Per context fencing ***
To: Gerd Hoffmann <kraxel@redhat.com>
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
Cc: Chad Versace <chadversary@chromium.org>, John Bates <jbates@chromium.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 11, 2020 at 3:36 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>   Hi,
>
> > I should've been more clear -- this is an internal cleanup/preparation and
> > the per-context changes are invisible to host userspace.
>
> Ok, it wasn't clear that you don't flip the switch yet.  In general the
> commit messages could be a bit more verbose ...
>
> I'm wondering though why we need the new fence_id in the first place.
> Isn't it enough to have per-context (instead of global) last_seq?
>
> > Multi-queue sounds very interesting indeed, especially with VK
> > multi-threaded command submission.  That to me is V3 rather than V2.. let's
> > start easy!
>
> Having v2 if we plan to obsolete it with v3 soon doesn't look like a
> good plan to me.  It'll make backward compatibility more complex for
> no good reason ...
I agree we want to study multi-queue a little bit before doing v2.  If
we do decide that multi-queue will be v3, we should at least design v2
in a forward-compatible way.

Every VK context (or GL context if we go multi-process GL) is
isolated.  I think there will need to be at least one virtqueue for
each VK context.  Can virtqueues be added dynamically?  Or can we have
fixed but enough (e.g., 64) virtqueues?

Multi-threaded command submission is not helped by multi-queue unless
we go with one virtqueue for each VKQueue in a VK context.  Otherwise,
multi-queue only makes context scheduling easier, which is not a
priority yet IMO.


>
> Also: Does virglrenderer render different contexts in parallel today?
> Only in case it does we'll actually get benefits from per-context
> fences.  But I think it doesn't, so there is no need to rush.
>
> I think we should better have a rough plan for parallel rendering first,
> then go start implementing the pieces needed.
It will be soon.  Each VK context will be rendered by a different
renderer process.  Besides, VK contexts and GL contexts are not on the
same timeline.  We don't want one to delay another by presenting a
unified timeline.


>
> cheers,
>   Gerd
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
