Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C408E2DA344
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 23:21:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E240A6E0C6;
	Mon, 14 Dec 2020 22:21:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0A2A6E0C6
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 22:21:39 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id w13so34260410lfd.5
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 14:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wYwULZuE9ZcoNTMzzstOJL9WyUKGToS3upqN4M8b+zg=;
 b=NCghVkIrYyHcpOAJeIJotNe35g/Lkjm4iPEsXbEK25AcdYMqZ/sJy6Tmi3rlKMAEvs
 ek6chRDeTunpRTgKz0GGanP/sp3cB3IvX69AlEAun6ewXv36HnAdtFWqhc0nQluqDzrI
 DIMKfc+tz6rUeozWrM3e0fsOG9X1yag/SeT/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wYwULZuE9ZcoNTMzzstOJL9WyUKGToS3upqN4M8b+zg=;
 b=V5r7wb/8KGJ4t37r/D39BuRCBStwso3nWQEGW2MKVs5m6nCEJXv/yTvAXZiNHLGlON
 KXqDvXBG3I3a/7eVizWd5dANO4XpV5EBmNeXa+MozWOIsImDzf47RipThy4E26D/Lc8Y
 0AYEZ3PIjSpLhoopEoteFvar1+ZwJKafX8Arfjj7I/1TdyLNJcrnzO6GnsUYzywX1iaD
 gH75CH7atTWkimSPcOGkVbXgoq2VBitCPtblZhl5vNsANlHuYkiayRpX+F17TyFmosH4
 7gppa9X5uwMkGqo5KRSEeeD+kz18RLU79MHTJXQyY8fWEOrP6XcstY+25O3vv3NGJY35
 pNzw==
X-Gm-Message-State: AOAM530HfiolJBrCuORbVZQXANG8P6rS+h8kVig/sBER/sFslAvNJd5t
 UCpcOsftTguZy7Xx3DIKr2UwOAwQtC3oYw==
X-Google-Smtp-Source: ABdhPJyX6yTDSf9jUyAKp8Ppxa0IDsYuAkSHuoX08wkHsZ90u32G43m38dMxyC9PPWXijveKc4uwqg==
X-Received: by 2002:a2e:b8d0:: with SMTP id s16mr11636463ljp.423.1607984498003; 
 Mon, 14 Dec 2020 14:21:38 -0800 (PST)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com.
 [209.85.167.45])
 by smtp.gmail.com with ESMTPSA id e2sm2478868ljp.75.2020.12.14.14.21.36
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Dec 2020 14:21:36 -0800 (PST)
Received: by mail-lf1-f45.google.com with SMTP id o17so31335732lfg.4
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 14:21:36 -0800 (PST)
X-Received: by 2002:a19:7d85:: with SMTP id
 y127mr10754661lfc.253.1607984496318; 
 Mon, 14 Dec 2020 14:21:36 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9tyNrbap4FG6qstkC5YTznqVebD=ye+4+Z+t42yQnL325A@mail.gmail.com>
In-Reply-To: <CAPM=9tyNrbap4FG6qstkC5YTznqVebD=ye+4+Z+t42yQnL325A@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 14 Dec 2020 14:21:20 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjue4aOyQQq+C6SEurwe6XABhMyNtsfn1goU==Hf_QUqA@mail.gmail.com>
Message-ID: <CAHk-=wjue4aOyQQq+C6SEurwe6XABhMyNtsfn1goU==Hf_QUqA@mail.gmail.com>
Subject: Re: [git pull] drm for 5.11-rc1
To: Dave Airlie <airlied@gmail.com>
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

On Thu, Dec 10, 2020 at 7:52 PM Dave Airlie <airlied@gmail.com> wrote:
>
> This is an early pull request for drm for 5.11 merge window. I'm going
> to be out for most of the first week of the merge window so thought
> I'd just preempt things and send this early.

Ok, I've merged this, and Dave is likely gone already, but it _looks_
like there's a problem with the drm tree on my Radeon workstation.

It works fine on my i915 laptop.

The symptoms are that the boot just hangs after

   fb0: switching to amdgpudrmfb from EFI VGA

when on a working kernel the next lines are

  amdgpu 0000:49:00.0: vgaarb: deactivate vga console
  [drm] initializing kernel modesetting (POLARIS10 0x1002:0x67DF
0x1DA2:0xE353 0xE7).
  amdgpu 0000:49:00.0: amdgpu: Trusted Memory Zone (TMZ) feature not supported
  [drm] register mmio base: 0xE1C00000
  [drm] register mmio size: 262144

I'm bisecting for more details, but it might take a while, and I
thought I'd start the ball rolling with this initial report in case
somebody goes "Aahh.., we know about that case already, the fix is
XYZ"...

              Linus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
