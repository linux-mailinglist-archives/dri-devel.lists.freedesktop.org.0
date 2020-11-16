Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE21B2B50FB
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 20:25:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05EB289CDD;
	Mon, 16 Nov 2020 19:25:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A56089CDD
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 19:25:35 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id d12so19987496wrr.13
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 11:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=06PNoz2MN9NL0Ap0YfgBDy6wfkksYH6ttzHim7ihGJI=;
 b=hoK3SqGKcWqwAzDDj4Y/qZBCnvG3rPUj+5DcN1iEqKMEljGIgMf2MMSeRVcQfAPNmY
 eyHOFFBm3ipNxxc8AKIbQ24MaKmYa8oR+dAl12JPRqaUk3TEt2nxFbt9g+b51Zm94Qc/
 LFuRWyRu7prr/t+QJGXADttAsqS1iWM4eh7O03F4RhtcIxeiH7qowaRiuSRKp4JImvnw
 Fil+QjLOCEr6uYdTe/R+pcieDquLMWTXu5RGgBpI7CWFiAjBD+WqjU2Fo8l+MYEl52Ul
 shj8aS4VkZN9XsZmwM3ED9LJlOhX7uCyXruDH3+byfmQ09UptUysyIV+9uyub1FjRCf6
 uG/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=06PNoz2MN9NL0Ap0YfgBDy6wfkksYH6ttzHim7ihGJI=;
 b=GJpbZhtsY3Dh7jOKf6ZbO4SqGvPFEq6eiOYQ9cBQwtO7njlq3EWMZDR+0LhXUDLAia
 GBaMnfa/HFFcDtj5A1V7MY9LOqVKtZxEOSUUH1OCPXqfyb6WSoYiOvdxsaGty18PIwcQ
 nC+CMGydBFXRKT7+tbW2DAHupxTaMHwTI9L09o7B5vSkZBDZSvHtG9Z6RQPLk9sJQ9pS
 RdApka1qPtIZsKPZIPUI9NqyKtACVTPDmq5zIJ71NfxNzPqL+IxRjd2edmbj0X7nvNPr
 im51W8RlhjCX9cRyw7Uk3mXMnNOuJ1pIKneY95MBQ299eGpwAx8CHfXhIWqRMb87FSYF
 BFBg==
X-Gm-Message-State: AOAM5332WqOmbygnIQksLPdNNO7+bId/nFl9bWQ9modlKnkfpz6xs4pb
 kaEYQdgPsmiw79LvcB1haBQ2X+1GQOsAKAxrFss=
X-Google-Smtp-Source: ABdhPJwjM1C7W8G9WB/ODyDwl5zVHnjYSWS1TKarFzu60Cg33izm479TVnzaNh91JhNJdgsfRkD/zHHn0icH5vVUD90=
X-Received: by 2002:adf:9163:: with SMTP id j90mr20138671wrj.323.1605554733830; 
 Mon, 16 Nov 2020 11:25:33 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9txyMmW1DWhS--SuYQu4qDK1GPzgHJwxbAfhHT=hUsPODA@mail.gmail.com>
 <20201103222013.hypmzlq7uuqufe76@box>
 <CAHk-=whPqB1PUVCCcQMjm-YTBnTP7UD_ey2rbXzcJhQufJwcUQ@mail.gmail.com>
In-Reply-To: <CAHk-=whPqB1PUVCCcQMjm-YTBnTP7UD_ey2rbXzcJhQufJwcUQ@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 17 Nov 2020 05:25:21 +1000
Message-ID: <CAPM=9tycx27H9tG3zSRjzz8kUW6FWSASMn3ywCbz9D+yFtzWCQ@mail.gmail.com>
Subject: Re: [git pull] drm next pull for 5.10-rc1
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
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>
> Christ. It's been two weeks. I'm doing -rc4 today, and I still don't
> have the fix.
>
> The problem seems entirely obvious, as reported by Kirill: the nv50
> code unconditionally calls the "atomic_{dis,en}able()" functions, even
> when not everybody was converted.
>
> The fix seems to be to either just do the conversion of the remaining
> cases (which looks like just adding an argument to the remaining
> functions, and using that for the "atomic" callback), or the trivial
> suggestion by Kirill from two weeks ago:
>
> > I hacked up patch to use help->disable/help->enable if atomic_ versions
> > are NULL. It worked.
>
> Kirill, since the nouveau people aren't fixing this, can you just send
> me your tested patch?
>
> Lyude/Ben - let me just say that I think this is all a huge disgrace.
>
> You had a problem report with a bisected commit, a suggested fix, and
> two weeks later there's absolutely _nothing_.

I would like to say when you sent this, there was patches on the
mailing lists with Kirill cc'ed, a pull request outstanding to me on
the mailing list from Ben, with the patches reviewed in it.

Maybe you weren't cc'ed on it, but stuff has certainly happened, in
the timeframe, and I was keeping track of it from falling down a hole.

_nothing_ is a lot more a reflection on your research than the ongoing
process, there was some delays here and maybe we need to communicate
when we are flat out dealing with other more urgent tasks that pay the
actual wages.

Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
