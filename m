Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D83C02B377E
	for <lists+dri-devel@lfdr.de>; Sun, 15 Nov 2020 18:57:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D817A6E9AA;
	Sun, 15 Nov 2020 17:57:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAC686E9AA
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Nov 2020 17:57:49 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id y16so17262211ljk.1
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Nov 2020 09:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o59BZdkVJF2tiujufffJlPZ8vaTkpZCTYRuWU0rId2Q=;
 b=OahrTwfET9qGvsGfM2qZcnSTlFGXDpok0Pv37BGC91uw5hOdQ0MBZCFKkoMi/+jdKb
 xg5FOJAYHxPZAujCc4xW7YooGGtrxA0fXbqESgjc0nV0qclmyBHkKHXcDEm077ZlGMz+
 /3cahwVB7ry5OCnNL4ggJVU6XedTOqajdmRbo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o59BZdkVJF2tiujufffJlPZ8vaTkpZCTYRuWU0rId2Q=;
 b=hgc+7tXgW9MPQEsi7/GBmGZY6Qbp1Tq0Srephh5GO8JZtkGkhk2/NgU3DVjP45or+p
 74XjIr7tZFvr/yEDTzZzI6VWeG3jMszTyj+wZMiLA0JdW1PcXFtDdCcbDUjIo7S+0cS5
 qxSf2YDfQt+cqwQKBG6yi2oJpenT1d7+PaKrEfApt5aPKAnCWJeLIR4BnUlC2QB7q84S
 ALth7rfUh6pA6g0nlMsYAPELDsN1E1zDL4c64HFEqCv8/7hJiwUNCX7CLQUbnTyLJX4Z
 Ub7jYz5mXesqeGcv1E/Fo8IBgIIvTk6onUvGcYJ/LFzRuY4nM4aX/nsv2bBwOvtarVO2
 TGJQ==
X-Gm-Message-State: AOAM530+IwyjbtFt7yboUJqs066lmTbd8VP1uBVUS+lrXh8aKgVed/AB
 dWKjSxB16IvMlmyrS4MyfmbKuzaXWg4RyA==
X-Google-Smtp-Source: ABdhPJzRdwVNhs1NGcLIwmoo6NUyvgD2PiisUHW54SAzxfGwRVdvRapigSnjmU+bUpe0WZGD7tRQgg==
X-Received: by 2002:a2e:1657:: with SMTP id 23mr5215259ljw.12.1605463067509;
 Sun, 15 Nov 2020 09:57:47 -0800 (PST)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com.
 [209.85.167.42])
 by smtp.gmail.com with ESMTPSA id c12sm2407947lfj.44.2020.11.15.09.57.45
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Nov 2020 09:57:46 -0800 (PST)
Received: by mail-lf1-f42.google.com with SMTP id f11so21678705lfs.3
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Nov 2020 09:57:45 -0800 (PST)
X-Received: by 2002:a19:ae06:: with SMTP id f6mr51360lfc.133.1605463065313;
 Sun, 15 Nov 2020 09:57:45 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9txyMmW1DWhS--SuYQu4qDK1GPzgHJwxbAfhHT=hUsPODA@mail.gmail.com>
 <20201103222013.hypmzlq7uuqufe76@box>
In-Reply-To: <20201103222013.hypmzlq7uuqufe76@box>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 15 Nov 2020 09:57:29 -0800
X-Gmail-Original-Message-ID: <CAHk-=whPqB1PUVCCcQMjm-YTBnTP7UD_ey2rbXzcJhQufJwcUQ@mail.gmail.com>
Message-ID: <CAHk-=whPqB1PUVCCcQMjm-YTBnTP7UD_ey2rbXzcJhQufJwcUQ@mail.gmail.com>
Subject: Re: [git pull] drm next pull for 5.10-rc1
To: "Kirill A. Shutemov" <kirill@shutemov.name>
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
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 3, 2020 at 2:20 PM Kirill A. Shutemov <kirill@shutemov.name> wrote:
>
> On Thu, Oct 15, 2020 at 11:33:08AM +1000, Dave Airlie wrote:
> >       drm/nouveau/kms: Search for encoders' connectors properly
>
> This commit (09838c4efe9a) broke boot for me. These two hunks in
> particular:

Christ. It's been two weeks. I'm doing -rc4 today, and I still don't
have the fix.

The problem seems entirely obvious, as reported by Kirill: the nv50
code unconditionally calls the "atomic_{dis,en}able()" functions, even
when not everybody was converted.

The fix seems to be to either just do the conversion of the remaining
cases (which looks like just adding an argument to the remaining
functions, and using that for the "atomic" callback), or the trivial
suggestion by Kirill from two weeks ago:

> I hacked up patch to use help->disable/help->enable if atomic_ versions
> are NULL. It worked.

Kirill, since the nouveau people aren't fixing this, can you just send
me your tested patch?

Lyude/Ben - let me just say that I think this is all a huge disgrace.

You had a problem report with a bisected commit, a suggested fix, and
two weeks later there's absolutely _nothing_.

              Linus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
