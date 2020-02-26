Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E38F5170270
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 16:29:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 057486EA86;
	Wed, 26 Feb 2020 15:29:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 914616EA64;
 Wed, 26 Feb 2020 15:29:51 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id a9so3611487wmj.3;
 Wed, 26 Feb 2020 07:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=42KHgmQ3WJJCDSs2lFdzrd9UKRI9CPBRK7iXYUlkDVM=;
 b=QoaIl+XWAFZQC/VaFm5Msd6O0gRMJQ6REYT1F7nA5BuySYBIGOCz5Y6fdf+3V7rFqm
 RWwgcNSNiYkQtGqEkYkzbg2r+WxYKsc0lV0Xk1pLvK7jU4MsWy3YcwByRjDDRKX7zH+b
 HN/tqg9OqnTGOjZNEnfNTSLqqzAC34b7k0aJ9RbF0llwB4rtXxuAI9X3OhlKPETH4K30
 0eg2GfNzzmUU8yjvhnpL3ekXnd2aPGxQ2cYFlb1hJPzNjbFBTf9HuhyTDl6RZ26/9l1s
 GG/i+uHPUVfCY3pVSPdBwwJE4O9Vx6tfHUJP+6Mqys3ngpEzimK6bEEnxi371zrRwPTL
 zCCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=42KHgmQ3WJJCDSs2lFdzrd9UKRI9CPBRK7iXYUlkDVM=;
 b=Yu4W4TeJ+smGVm8G8P2FvpBjkezfYNyae1enBv4GcmDhmhZmAnDkivnLAhEXNwClAi
 FuRKSeLtHRoVaeAGEeq+8timXBFlhc9uwmUlgvucBiyQoSlIzKUnDHj7keHAEUexB/iQ
 9D5OtntaDdWWR8YB1IT+AwUr9dYpWESeiPh2z1lxCcr8XNR3gGdiY626pcVbfEQEJ/YB
 TXeJ1s7L46R++CUco4ndJp7YlK6/vOp6MZ6tChux7ltcArYtCjvLpF9bUTWdievKl0sE
 HuzhUwEE+HR8f5rrxW5sw7tIiV5VrRyy53bx8GBB+1BkfA+di46U5a7SiMs2XEAKpipp
 GpWA==
X-Gm-Message-State: APjAAAWYP3bD5PDmsYlvHmoPNOYsFgX02HEGwmaSqFXFSvKZQ0X17GIM
 rF825m6FJHNUxWSQvQR6F7LK7LHuP6utfQmADnM=
X-Google-Smtp-Source: APXvYqw68SOvfcoaRlGQ3+wlhjdmVR5v2rwIPenz4+4L+x/03gaXTwxCJqpxRVduyHcZZ+0pR2kKQ+nNQdlc3w04hBI=
X-Received: by 2002:a1c:f009:: with SMTP id a9mr6131079wmb.73.1582730990267;
 Wed, 26 Feb 2020 07:29:50 -0800 (PST)
MIME-Version: 1.0
References: <99213368-5025-8435-502b-3d23b875ca60@redhat.com>
In-Reply-To: <99213368-5025-8435-502b-3d23b875ca60@redhat.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 26 Feb 2020 10:29:38 -0500
Message-ID: <CADnq5_OUt5XaJ_Nf23F2zsKeuPgoka8p2S6ny-H2WK==Ncg7vA@mail.gmail.com>
Subject: Re: 5.6 DP-MST regression: 1 of 2 monitors on TB3 (DP-MST) dock no
 longer light up
To: Hans de Goede <hdegoede@redhat.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 26, 2020 at 10:16 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi Lyude and everyone else,
>
> Lyude I'm mailing you about this because you have done a lot of
> work on DP MST, but if this rings a bell to anyone else feel
> free to weigh in on this.

Might be a duplicate of:
https://gitlab.freedesktop.org/drm/amd/issues/1052

Alex

>
> I'm currently using a Lenovo X1 7th gen + a Lenovo TB3 gen 2 dock
> as my daily rider for testing purposes. When 5.6-rc1 came out I
> noticed that only 1 of the 2 1920x1080@60 monitors on the dock
> lights up.
>
> There are no kernel errors in the logs, but mutter/gnome-shell says:
>
> gnome-shell[1316]: Failed to post KMS update: Page flip of 93 failed
>
> With 93 being the crtc-id of the crtc used for the monitor which is
> displaying black. Since then I've waited for 5.6-rc3 hoping that a
> fix was already queued up, but 5.6-rc3 still has this problem.
>
> gnome-shell does behave as if all monitors are connected, so the
> monitor is seen, but we are failing to actually send any frames
> to it.
>
> I've put a log collected with drm.debug=0x104 here:
> https://fedorapeople.org/~jwrdegoede/drm-debug.log
>
> This message stands out as pointing to the likely cause of this problem:
>
> [    3.309061] [drm:intel_dump_pipe_config [i915]] MST master transcoder: <invalid>
>
> Regards,
>
> Hans
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
