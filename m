Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 714B21850EC
	for <lists+dri-devel@lfdr.de>; Fri, 13 Mar 2020 22:20:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE2786EC70;
	Fri, 13 Mar 2020 21:20:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE0726EC70
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Mar 2020 21:20:40 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id d8so11003147ion.7
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Mar 2020 14:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pEBtwxY29YeCp/Amy8qiIRIT+WeHuX6rknq9yRt8ir0=;
 b=CuW8TZw51FX2OtMEZtWAc1HqKy3xHHtGdrgUjQgVdBnGDzQHS9XsGoaIfKtw1L0cPX
 6tS59huqbvovlQ69YQNk5c4M9Dqxl1+1LLR4EjRm//E26XOxySIffdXiME7hGxsJgz0d
 +pvN2fxrQ0/iBADdwHrtceMS7nNznXfUwvjF4PnWzHuEa7yKK1YAwWvhO+vMpV0BKjSN
 cJvIgOrNSck0yk3ICVAidN2LoHx8vTDoJNKuo8WVUri1MCLdPadz+PVRTuC7JghSZJg0
 QYs/+N6U+3mG7Sh9lEmslKsEiW8UHEbvCjTY3aC+ayIoCfIQ71peoQRjOrlh/WgOLdSa
 yKbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pEBtwxY29YeCp/Amy8qiIRIT+WeHuX6rknq9yRt8ir0=;
 b=XaM8hCLp49KussbDI9m0DOSmMXhAtRDX48mvgQMs6HMFAgMjz/IyKsSiIllP9Swqkm
 R6I4vHeQF8iO81iLKyD6uoq57JJzefaGs/zpWe0BCmS81copq9YvT8ZaNsmZ/mhV06/q
 6Pta6psJ6efLDnop4FQJ50xN3ANk7tZtwmFu1qPY79pwDmXKTulSwFg/drcnhA6RCJVI
 Z74mfOTlhJcPITfSwKh1VvRW/ENGwkyLi/2UBKqxx0r7mFPt8ZEXx2POujU/pJXHHcQ4
 3i21JXS3lA9sBf/uh+NI996YKT6RwOpkrg8BjfgPTqOy8+KtS7TGXtXM+llp4+8EFFuZ
 9ylQ==
X-Gm-Message-State: ANhLgQ3U9aizLfMY4vE2N70RXY+iFXFUxjMHToU/yy65ZvHFPKBoDm1K
 4EEuMJ7CwUcJnNyrOV15rCbvv+vk4nwNHXM3nRw=
X-Google-Smtp-Source: ADFU+vtxOvLCinqhOTsTkJzm1vPxMJBxTptqqRzwzoagB9CgLrNC0BCvx6JPSHFOgkjmhh2bKym/cAf8x/gIYfLyo/A=
X-Received: by 2002:a5d:8f96:: with SMTP id l22mr14137639iol.19.1584134440036; 
 Fri, 13 Mar 2020 14:20:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200310010818.569-1-gurchetansingh@chromium.org>
 <20200310074302.yx6anlvqvsg37yzs@sirius.home.kraxel.org>
 <CAAfnVB=sw=u80mHnZUPf_+WDW-hGNTDSBWLfV+7y3KFN=s6beQ@mail.gmail.com>
 <20200311103609.ei446gelkvbqrdzm@sirius.home.kraxel.org>
 <CAAfnVBm1eoGZY7yB8eqEC1eLk=v4dq--O2biQOnWDHCkmguOeA@mail.gmail.com>
 <20200312092940.xioyjloil3f25ccv@sirius.home.kraxel.org>
 <CAAfnVBkTWy2pohv5kWWYwAa1yq14fRJrtN4GD7sF-h4inabH6Q@mail.gmail.com>
In-Reply-To: <CAAfnVBkTWy2pohv5kWWYwAa1yq14fRJrtN4GD7sF-h4inabH6Q@mail.gmail.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Fri, 13 Mar 2020 14:20:27 -0700
Message-ID: <CAPaKu7SgkdBaFcDU1O7T+mMyzqO5iR8qYJxFJmcYGp_Hfe3S0g@mail.gmail.com>
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
Cc: Chad Versace <chadversary@chromium.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 David Stevens <stevensd@chromium.org>, John Bates <jbates@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 12, 2020 at 4:08 PM Gurchetan Singh
<gurchetansingh@chromium.org> wrote:
>
>
>
> On Thu, Mar 12, 2020 at 2:29 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>>
>> On Wed, Mar 11, 2020 at 04:36:16PM -0700, Gurchetan Singh wrote:
>> > On Wed, Mar 11, 2020 at 3:36 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>> >
>> > >   Hi,
>> > >
>> > > > I should've been more clear -- this is an internal cleanup/preparation
>> > > and
>> > > > the per-context changes are invisible to host userspace.
>> > >
>> > > Ok, it wasn't clear that you don't flip the switch yet.  In general the
>> > > commit messages could be a bit more verbose ...
>> > >
>> > > I'm wondering though why we need the new fence_id in the first place.
>> > > Isn't it enough to have per-context (instead of global) last_seq?
>> > >
>> >
>> > Heh, that was to leave open the possibility of multiple timelines per
>> > context.  Roughly speaking,
>> >
>> > V2 -- multiple processes
>> > V3 -- multiple processes and multiple threads (due to VK multi-threaded
>> > command buffers)
>> >
>> > I think we all agree on V2.  It seems we still have to discuss V3
>> > (multi-queue, thread pools, a fence context associated with each thread) a
>> > bit more before we start landing pieces.
>>
>> While thinking about the whole thing a bit more ...
>> Do we need virtio_gpu_ctrl_hdr->fence_id at all?
>
>
> A fence ID could be useful for sharing fences across virtio devices.  Think FENCE_ASSIGN_UUID, akin to  RESOURCE_ASSIGN_UUID (+dstevens@).
>
>>
>> At virtio level it is pretty simple:  The host completes the SUBMIT_3D
>> virtio command when it finished rendering, period.
>>
>>
>> On the guest side we don't need the fence_id.  The completion callback
>> gets passed the virtio_gpu_vbuffer, so it can figure which command did
>> actually complete without looking at virtio_gpu_ctrl_hdr->fence_id.
>>
>> On the host side we depend on the fence_id right now, but only because
>> that is the way the virgl_renderer_callbacks->write_fence interface is
>> designed.  We have to change that anyway for per-context (or whatever)
>> fences, so it should not be a problem to drop the fence_id dependency
>> too and just pass around an opaque pointer instead.

I am still catching up, but IIUC, indeed I don't think the host needs
to depend on fence_id.  We should be able to repurpose fence_id.  On
the other hand, the VIRTIO_GPU_FLAG_FENCE flag is interesting, and it
indicates that the vbuf is on the host GPU timeline instead of the
host CPU timeline.

>
>
> For multiple GPU timelines per context, the (process local) sync object handle looks interesting:
>
> https://patchwork.kernel.org/patch/9758565/
>
> Some have extended EXECBUFFER to support this flow:
>
> https://patchwork.freedesktop.org/patch/msgid/1499289202-25441-1-git-send-email-jason.ekstrand@intel.com

I think this only affects the kernel/userspace interface?  I know
there were works being done to support VK_KHR_timeline semaphore,
which is something we definitely want.  I don't know if it is the only
way for the userspace to gain the extension support.  I need to do my
homework...



>
>>
>> cheers,
>>   Gerd
>>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
