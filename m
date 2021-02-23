Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8E13230F2
	for <lists+dri-devel@lfdr.de>; Tue, 23 Feb 2021 19:50:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47E4E6EA22;
	Tue, 23 Feb 2021 18:50:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FFD96EA22
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Feb 2021 18:50:21 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id v1so23630199wrd.6
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Feb 2021 10:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UNzpelxOUm9gemU7mzyeXuP921hBYsw6d3/DgmI/o1o=;
 b=U//jMsYdlc/uaNjTNeMr+0EiX4fYzqqnrf3SHF4XCJ4gLEBFUZbV2B0u9gx3s4vTpB
 h4Yncv8Yh1QiXVSGuMPr0zJhBJ+70m6ydETKc4a5oav5cCXBRUcKFdGxQ7Lj0i6PwbJW
 pRv+s3TQh/1XjzBSts04vmQsOBhmIOvOyCasf+uaQXuHaLkZOhqkNVzCGWfDrkwOQJmv
 866oZCO11cRMU5EFU7CJO5Aj1gsvD0y8Fj2jks5VrSlUUMMc09Y09peQ1FloKBeaVQJm
 WhEw4oV//3rUqmc8algpRD4u7DY8WQStG/H0wXI894lmZsUUoTpqOvGhybuSI0TM0n9l
 XSlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UNzpelxOUm9gemU7mzyeXuP921hBYsw6d3/DgmI/o1o=;
 b=Rz8m1nIa8kxEScMUgioJmrTk43a0EtU1KtSz6qLrAYRGWW1X5Sp2KqkCzuHJNSNMRO
 LI8AuUQqcSRY4x9o66al/l1GSq7vD9g/UYE7BXVJuo2jG/ruZWKoUo92OxIKmOFc8I0D
 JpdsoFmWirgITBsfYcxyu2YJqxsXgNWjX64SBSPpoJbv6AJY9V8dGHFhUsCc6cZQ64Kf
 Dg36Xulo/SuNwMIkUGwF0bBl9dNXGvFE6Vp7eHpEYyhO5AOQoo15CsN0133aFXSAIORi
 8Msspqe/eR9fsAb39evWd+X3ugYo0qOvMyD/8U9D1uJeezc3YPQM2nAaQ5BKYOE6aINC
 HF9Q==
X-Gm-Message-State: AOAM532i8CQcDkDhXLUdwIieAM007YWT7MDDoYDD3P848NLCooLyObdU
 /609jpu/z1y+0BXNyvFDLyLDOItXCkZtGvvfoYssURVYxHg=
X-Google-Smtp-Source: ABdhPJyF7qufeip5RXK+PwlO8QKov1rkPn4a+1cTHobjlUDKMPgg7QX+ihyTA9QNaLv1cSDveGdY8kJRXnvtSyJtsRQ=
X-Received: by 2002:a5d:4bce:: with SMTP id l14mr27572309wrt.256.1614106220002; 
 Tue, 23 Feb 2021 10:50:20 -0800 (PST)
MIME-Version: 1.0
References: <20200811202631.3603-1-alyssa.rosenzweig@collabora.com>
 <CAPj87rMS5zxY6sK4N8zVZF9MHThmURj6kuso=G5+MQDVmNjC4Q@mail.gmail.com>
 <20210223145143.7bfayhp32tzdj637@DESKTOP-E1NTVVP.localdomain>
 <CAPj87rMkSdtrHnoLzK6zAVvST2KH8SprNnp5bS92qpr84g=fPg@mail.gmail.com>
 <20210223165348.edghgglgx4g2lvfw@DESKTOP-E1NTVVP.localdomain>
 <YDU2+A0MNJnrWxPs@maud>
 <20210223183404.jmdw5rojy4s64xfd@DESKTOP-E1NTVVP.localdomain>
In-Reply-To: <20210223183404.jmdw5rojy4s64xfd@DESKTOP-E1NTVVP.localdomain>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 23 Feb 2021 18:50:09 +0000
Message-ID: <CAPj87rOVTd7YhbPoYyxhDD1+S7xG23L2v8Hujdh6tGFBq+n+Hg@mail.gmail.com>
Subject: Re: [PATCH] drm/rockchip: Require the YTR modifier for AFBC
To: Brian Starkey <brian.starkey@arm.com>
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
Cc: nd <nd@arm.com>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 linux-rockchip <linux-rockchip@lists.infradead.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Alyssa Rosenzweig <alyssa@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Brian,

On Tue, 23 Feb 2021 at 18:34, Brian Starkey <brian.starkey@arm.com> wrote:
> On Tue, Feb 23, 2021 at 05:10:16PM +0000, Alyssa Rosenzweig wrote:
> > But it seems to me allowing
> > both BGR+YTR and RGB+YTR upstream is the better route than simply
> > preventing hardware from using AFBC at all, and there are natural
> > encodings for both with fourcc modifiers.
>
> Are those the only options? I see XBGR8888, ABGR8888, BGR888 and
> BGR565 are all handled in vop_convert_afbc_format(), which are all
> "valid" for use with YTR, and all except XBGR are on the "preferred"
> AFBC format list in afbc.rst.

The issue is a userspace one though, not a kernel one. Userspace (e.g.
GNOME Shell, Weston, Xorg) decides ahead of time that it's going to
use XRGB8888, then use the modifiers available to it for that format.
There's no logic in those projects to look at the list of 8bpc
non-alpha formats, examine XRGB vs. XBGR, decide that XBGR is 'better'
since it has more modifiers available, then go use XBGR.

So whilst removing XRGB+AFBC wouldn't technically remove the
possibility to use AFBC, the practical effect is that it wouldn't be
used.

Cheers,
Daniel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
