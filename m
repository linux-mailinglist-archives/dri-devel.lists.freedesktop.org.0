Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E73182651
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 01:43:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 590B66E433;
	Thu, 12 Mar 2020 00:43:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 404166E433
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 00:43:44 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id n21so3879962ioo.10
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 17:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zzNB0xA3OK0SH1M4BkXZlrlxOPjmKk37vBD806jKH5A=;
 b=IMQg4OtAfJsvpk+UobLiWpaCpQXUtAk4qW3LOnpPIByMtbLyzgrJ6q+MzODmTWtB0k
 CZ3CtQVgio+FJc4qgT6IrAuyFac1dV39NqN2zM5Dxlptro13BLFZi8pLJz4sk868Rrmp
 DG0Uts0EFDwZNbIixMjx8HeEB+R/zYl3jH7sIwhlQ9zp5oG8cMGamnWLXRhkGU/+YSPY
 mfhCYVO6XH0nKqrZmA767zn1vlwHhf1MSlad6vgvqbqgs+yG8brvVs7LrPXMon9Dr3A5
 ZUAxZuKxoml7JMnxYuXLaaQL7TE2nyQgrcj3F/GiRoIxEHcdOFpsprELQggVXLwj6g69
 CoLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zzNB0xA3OK0SH1M4BkXZlrlxOPjmKk37vBD806jKH5A=;
 b=aAYodF5emGyPuS0LW4PUmBxIUkx1FXIXEArG6z+SHqq6RiMyAKCxsM4+7CdenkPG8V
 lh8sWHZQXogUXSZIHDyhBGjiCWoQDMXsXksvW+iD/sOANiTDvTALStcRaEjNoJdWVUI+
 UMEzi9e1e8mJsJL2WJnUUfdrEEIOGUGRDo9a5tB51EbOahj/f/YAe8DtoT9Bq8EEk6CI
 RwPDbAsLqAuiXBWQqMUkoNKh6UpEfmdoPD3Aj66KpUravC0HPT5YvWZfII5N2KudnhRo
 ltuhhWFNLw4X6GI7Hg5t6mBsXkRca7yAtjsL5UEcw1FPZOUdpyiHZ3o0dM53ioCc0oTG
 Zz1A==
X-Gm-Message-State: ANhLgQ1tIqVzpi92lMzBp59VgDLldxLggWcNfjYcmr7Tz8xiKN2FhGW9
 C3gER4P+v2TZH7N2OV5fNYX4fmJETGltlMBlm4A=
X-Google-Smtp-Source: ADFU+vv7az+Hm+EbieZU71P1S8Z6MXbYPn+INaHiCnTblAH5u7rKi7YeesBrA2r5RrsofSZQBqd37UKhU7MaqJSKn9k=
X-Received: by 2002:a6b:8fd8:: with SMTP id r207mr5211564iod.158.1583973823559; 
 Wed, 11 Mar 2020 17:43:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200310010818.569-1-gurchetansingh@chromium.org>
 <20200310074302.yx6anlvqvsg37yzs@sirius.home.kraxel.org>
 <CAAfnVB=sw=u80mHnZUPf_+WDW-hGNTDSBWLfV+7y3KFN=s6beQ@mail.gmail.com>
 <20200311103609.ei446gelkvbqrdzm@sirius.home.kraxel.org>
 <CAAfnVBm1eoGZY7yB8eqEC1eLk=v4dq--O2biQOnWDHCkmguOeA@mail.gmail.com>
In-Reply-To: <CAAfnVBm1eoGZY7yB8eqEC1eLk=v4dq--O2biQOnWDHCkmguOeA@mail.gmail.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Wed, 11 Mar 2020 17:43:32 -0700
Message-ID: <CAPaKu7SjeN+8Grr_hopG=pDcigV52YQeUnAYmumTVY0=RBR5Ng@mail.gmail.com>
Subject: Re: [RFC PATCH 0/8] *** Per context fencing ***
To: Gurchetan Singh <gurchetansingh@chromium.org>
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
Cc: Chad Versace <chadversary@chromium.org>, Gerd Hoffmann <kraxel@redhat.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 John Bates <jbates@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 11, 2020 at 4:36 PM Gurchetan Singh
<gurchetansingh@chromium.org> wrote:
>
>
>
> On Wed, Mar 11, 2020 at 3:36 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>>
>>   Hi,
>>
>> > I should've been more clear -- this is an internal cleanup/preparation and
>> > the per-context changes are invisible to host userspace.
>>
>> Ok, it wasn't clear that you don't flip the switch yet.  In general the
>> commit messages could be a bit more verbose ...
>>
>> I'm wondering though why we need the new fence_id in the first place.
>> Isn't it enough to have per-context (instead of global) last_seq?
>
>
> Heh, that was to leave open the possibility of multiple timelines per context.  Roughly speaking,
Yeah, I think we will need multiple timelines per context.

>
> V2 -- multiple processes
> V3 -- multiple processes and multiple threads (due to VK multi-threaded command buffers)
>
> I think we all agree on V2.  It seems we still have to discuss V3 (multi-queue, thread pools, a fence context associated with each thread) a bit more before we start landing pieces.
In addition to multiple threads, we should also consider multiple VkQueues.

I will start with... how many timelines do we want to expose per
context?  In my mind, it goes like

V1: 1 timeline per virtqueue (there is one timeline for ctrlq right now)
V2: 1 timeline per context (VK and GL on different timelines)
V3: N timelines per context (each VkQueue in a VK context gets a timeline?)
V4: N+M timelines per context (each CPU thread also gets a timeline?!?!)

I certainly don't know if V4 is a good idea or not...



>
>>
>> > Multi-queue sounds very interesting indeed, especially with VK
>> > multi-threaded command submission.  That to me is V3 rather than V2.. let's
>> > start easy!
>>
>> Having v2 if we plan to obsolete it with v3 soon doesn't look like a
>> good plan to me.  It'll make backward compatibility more complex for
>> no good reason ...
>>
>> Also: Does virglrenderer render different contexts in parallel today?
>> Only in case it does we'll actually get benefits from per-context
>> fences.  But I think it doesn't, so there is no need to rush.
>>
>> I think we should better have a rough plan for parallel rendering first,
>> then go start implementing the pieces needed.
>>
>> cheers,
>>   Gerd
>>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
