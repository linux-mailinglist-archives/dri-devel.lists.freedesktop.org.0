Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C777B3FE289
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 20:51:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA05A89B38;
	Wed,  1 Sep 2021 18:51:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 270BB89B38
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Sep 2021 18:51:46 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 i3-20020a056830210300b0051af5666070so961708otc.4
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Sep 2021 11:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WpMrHx2xrjALxDo2+qnSwUhR97fWUA7NiL67FnzoBbs=;
 b=e0RtJHV/x1N7itMnl6FhNdz+AWN7rEUsOba8pGEb/GUQf8QzzGBLO/6NdlnDBtHOAL
 mZTXK4KBBNp4du3di0UJDTtOGr2LkdET0W2eonjElLZhYtR3s4XT2F0/509vgq3dZUv/
 xpMndW6JBu3Uc/gxHrcFHsach9TXFR+W7WmwlaUBqId3hsBiXeqjSdJRjZwLBiBaApA3
 8AhN3BCUrjIgmcYriMpojx7fTh1kFKpSTudSN3SXNFsLwl50DSbqomsVHQ691wcTRzJz
 I0nEDJsrLfT7YBpSxVVmncx9NZdGd5+tKZVl2SuQ1G0r115AYm+uPOfDPTbFz8CNitj1
 1yFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WpMrHx2xrjALxDo2+qnSwUhR97fWUA7NiL67FnzoBbs=;
 b=LqG2iy2BCmv+/s6P4X4dwGyjt6VJoqcSqbarPjRptXL99A39c3M9xbcPJcGqKp0Axp
 Msl3cvj2srQRMu0cECfXv5bucmdHcGac4G2wdziWYgIEc1EV9ylw4kMhWfQCdiAkksOl
 f1GPBdyp2hBpZV4iDZ9sXT9nM9148J0I80pwUaUrrh8340obBBRBz33SD127Hu6hDFal
 3qhKU83EAGBD7kmVkR1JwMOAVGDRTVdJWmeeYM8VX8hRTg/O75BfApG8zeZqOLzRnUO3
 uIflyeoJPI2oqrz7y70oevmDpHppwHs5naXmvUxxFwp7rn+Kal+qRj1NdVfC8Dp+7XLC
 1vtQ==
X-Gm-Message-State: AOAM532+NhJfqh7P4ffdZantV+TcYWdblpXLh2/YmPETR3HXw2uDRJ/P
 nKteIl5drwFF3D5bstuhFWuI+CEQqKf+VISnPnQ=
X-Google-Smtp-Source: ABdhPJw8t4vsqP/7Q9PflPtjlczDwGn9Ca+aw7OmDyIMY4azGHA/6DyJI9o6HDQ2fy8EvZf613m/TDLq3FE8zD/9Jl0=
X-Received: by 2002:a05:6830:4:: with SMTP id c4mr765105otp.23.1630522305399; 
 Wed, 01 Sep 2021 11:51:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9txeN-qCRJvYV552zdo2H9iVy1ruVrq=YdZBP5Dmpc3Jmg@mail.gmail.com>
 <CAHk-=whP_v5nrK9B5vefnZS6Xz3-vZDFxUvSmW8W82hhNh67sA@mail.gmail.com>
 <CAHk-=wiyPpwYLBXTdXi0DyMFhTKsTstmqU-LLjgD5fNxUnB_WA@mail.gmail.com>
In-Reply-To: <CAHk-=wiyPpwYLBXTdXi0DyMFhTKsTstmqU-LLjgD5fNxUnB_WA@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 1 Sep 2021 14:51:33 -0400
Message-ID: <CADnq5_N9GgDuAdLmYED19Mx2z=5fhc1JCPj5_icFMZ-U1bO-Sg@mail.gmail.com>
Subject: Re: [git pull] drm for 5.15-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Dave Airlie <airlied@gmail.com>, John Clements <john.clements@amd.com>, 
 Hawking Zhang <Hawking.Zhang@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 1, 2021 at 2:33 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Wed, Sep 1, 2021 at 10:57 AM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > No worries. I enjoyed seeing the AMD code-names in the conflicts, they
> > are using positively kernel-level naming.
>
> Oh, I spoke too soon.
>
> The conflict in amdgpu_ras_eeprom.c is trivial to fix up, but the
> *code* is garbage.
>
> It does this (from commit 14fb496a84f1: "drm/amdgpu: set RAS EEPROM
> address from VBIOS"):
>
>         ...
>         control->i2c_address = 0;
>
>         if (amdgpu_atomfirmware_ras_rom_addr(adev,
> (uint8_t*)&control->i2c_address))
>         {
>                 if (control->i2c_address == 0xA0)
>                         control->i2c_address = 0;
>         ...
>
> and honestly, that just hurts to look at. It's completely wrong, even
> if it happens to work on a little-endian machine.
>
> Yes, yes, BE is irrelevant, and doubly so for an AMD GPU driver, but still.
>
> It's assigning a 8-bit value to a 32-bit entity by doing a pointer
> cast on the address, and then mixing things up by using/assigning to
> that same field.
>
> That's just *wrong* and nasty.
>
> Oh, the resolution would be easy - just take that broken code as-is -
> but I can't actually make myself do that.
>
> So I fixed it up to not be that incredibly ugly garbage.
>
> Please holler if I did something wrong.

Fix looks good.  Thanks,

Alex
