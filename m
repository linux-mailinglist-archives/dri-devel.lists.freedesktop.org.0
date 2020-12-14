Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCDF2DA360
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 23:29:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2F256E0C6;
	Mon, 14 Dec 2020 22:29:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C28A06E0C6
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 22:28:59 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id o11so17419596ote.4
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 14:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lQJ31nxgRFNp8EZMZx7FpPO6Zey0SIdb/j3Aj9RQw50=;
 b=k5EFIvrMkJbEa+nK4q3JlJtULb4oIuWXZdnkEt4LnpFVI+TxG2Jnfz0fPBbLKC5eu9
 6RbYVvc6lMGoLbEJi9s8qKo+dXDFtWvsS/B25mqkuJC9hvnLqxZZbjirD+PJznv/f9Ve
 GIlFqFYORvcO4RSSbWHaHryZm/j4P+dYbBzeB8D7rvtGAV2pEWnrKVwG4gAwbPR9cahs
 54Jw5pZi/XPWQH/nbj9N5wVXCOk0mdQLMtPP/vc93QpVAZS+bM3lisrJrD/RukYnhOyJ
 yFR6Ms38ryp/uevoKuiskLbkORJZfXnHCSyFGuoc21ippsVhFurKa0cE3IBd7HaiPMBP
 zSug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lQJ31nxgRFNp8EZMZx7FpPO6Zey0SIdb/j3Aj9RQw50=;
 b=cokqBMMoVg2Wy0GQlIAjwa7n6f2RmgB3ZzGCQ7+65Uz25BFZCt2scRiWZk/Wsc19V9
 fczbrYqZ8WJa7LFwHkVU0Y8/ZyzL70CTcZh59D3Jwni5dYwCHP+WMGa+FHululK7W/PZ
 CXkiUZWc5vv6yfzIHn/WlVC1YSzvn+WF4XiAs/DJs6dkn78TE3qVo2zYuBHEjzZrD1S1
 oMwzGSYluo4SIfgXRNn6uubmXG1P+zXH0S8JbUu1cShmH4M1Uttbar5EhLE2MZcAvoiR
 ei4D1sbntQl3LGibgqT0gMRzDcdmOphCsKBUNGiddtWVUCSgbo7ezQii/dcIS7HbM6yO
 wcEQ==
X-Gm-Message-State: AOAM532QklftDZGafz6zTmJ3tMtBad34Q2IQcmI1J4N20Tbgfx/nMEm1
 klT/7vLWF80OL+xngOo85g1tDsNUJ0LhuUgQRpo=
X-Google-Smtp-Source: ABdhPJz4xCYDEx6ZevgUKDDg/umaaRlXBpiemsW3Y0HOAK/v6cPBraxTcPoES/oo9oSLJyGxEDM5dvWueoFZRAehe8I=
X-Received: by 2002:a05:6830:1d66:: with SMTP id
 l6mr4788158oti.23.1607984939076; 
 Mon, 14 Dec 2020 14:28:59 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9tyNrbap4FG6qstkC5YTznqVebD=ye+4+Z+t42yQnL325A@mail.gmail.com>
 <CAHk-=wjue4aOyQQq+C6SEurwe6XABhMyNtsfn1goU==Hf_QUqA@mail.gmail.com>
In-Reply-To: <CAHk-=wjue4aOyQQq+C6SEurwe6XABhMyNtsfn1goU==Hf_QUqA@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 14 Dec 2020 17:28:48 -0500
Message-ID: <CADnq5_MyMm+FmmbKHccDDOBryEdgbQHdw3rtuhUv=cvJrirHFg@mail.gmail.com>
Subject: Re: [git pull] drm for 5.11-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 14, 2020 at 5:21 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Thu, Dec 10, 2020 at 7:52 PM Dave Airlie <airlied@gmail.com> wrote:
> >
> > This is an early pull request for drm for 5.11 merge window. I'm going
> > to be out for most of the first week of the merge window so thought
> > I'd just preempt things and send this early.
>
> Ok, I've merged this, and Dave is likely gone already, but it _looks_
> like there's a problem with the drm tree on my Radeon workstation.
>
> It works fine on my i915 laptop.
>
> The symptoms are that the boot just hangs after
>
>    fb0: switching to amdgpudrmfb from EFI VGA
>
> when on a working kernel the next lines are
>
>   amdgpu 0000:49:00.0: vgaarb: deactivate vga console
>   [drm] initializing kernel modesetting (POLARIS10 0x1002:0x67DF
> 0x1DA2:0xE353 0xE7).
>   amdgpu 0000:49:00.0: amdgpu: Trusted Memory Zone (TMZ) feature not supported
>   [drm] register mmio base: 0xE1C00000
>   [drm] register mmio size: 262144
>
> I'm bisecting for more details, but it might take a while, and I
> thought I'd start the ball rolling with this initial report in case
> somebody goes "Aahh.., we know about that case already, the fix is
> XYZ"...
>

The relevant fixes are:
https://cgit.freedesktop.org/drm/drm-misc/commit/?h=drm-misc-next-fixes&id=aefec40938e4a0e1214f9121520aba4d51697cd9
https://cgit.freedesktop.org/drm/drm-misc/commit/?h=drm-misc-next-fixes&id=95e3d610d35c9c5b51e12c5c8ac18061ae08cf97

Alex



>               Linus
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
