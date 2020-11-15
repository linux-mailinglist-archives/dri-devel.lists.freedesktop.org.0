Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 764EF2B392B
	for <lists+dri-devel@lfdr.de>; Sun, 15 Nov 2020 21:35:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28C956E9BC;
	Sun, 15 Nov 2020 20:35:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C7CD6E9BC
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Nov 2020 20:35:36 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id f20so21556282ejz.4
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Nov 2020 12:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ijg9lN4q+y1lKWWb0I210T2G+LZI/xVs/0TId95I5ng=;
 b=W4RjtnWI+BKHWNFpCfOvPpta63nqCPhbZ7c0m6ZzGyaCq9QyMuC/YqekjnwfgIdThW
 5HSVWNfrroeWYcXASxPhMJNLVINwYYJ8JvFdsUPYpspSkVDZR8IIjsrPZKy0WElubF6S
 qyXsNa4mCurwFnpdeeYUGlI4aAgras0OiNeQx9rnwbWXhYK1DPdwXigkJTplPkKXBvPw
 4WVIk+8DZq5ekCeaiXctRAEu04RY6xIDpjw66RBCcvmgx326LIffJW+aUkNT+LTyzNZp
 0ZgVkS+a+7mdIa4eCzlDQ6VcacMEkNKRncn2/W747wEx/TkpEEt5GbCyQS5foUrourJR
 qyIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ijg9lN4q+y1lKWWb0I210T2G+LZI/xVs/0TId95I5ng=;
 b=bHXvhuKnxiMSR0uoAgZ/ZJVJJ2JWbIgoR984MxUPoRCpCKUJ5mwtVPYjMhHjfbuuO/
 J6p+/MpFKfS7J/FKgwLsCHr6ICLyUkfA3I0p01QjVej2Lv7XP8/yBFcirfEDVMbOpnnJ
 W4A8gD7dUxAJLxkdBkErk6X705F51cGGuq/fsV1wYiq7mjC+S8aOjkeAJ+wMTShTK5xV
 Wb/mYKtJzTeR9SIu/6gQA8UKFzywgSfKJbD6Pn2ZBlOMImTi6Kjp9RN9BDEUZ7IHrddh
 t1JN8J7LDepCbJAROVeKC1KXMiGUv0QQo2mUppb/iQuyRRKQp3LSsVhCN+ZpANAtQnAB
 38OQ==
X-Gm-Message-State: AOAM530Za5rmLzsJQhvYtnNqZrl+/UV1lFnEcamBFppCgdCQMzZwcsku
 +LNpov5a0OxpzvxOIjR5A5x4R3xPS5+QSxJxtVI=
X-Google-Smtp-Source: ABdhPJxHshwuqi/yaOW02cHa96cuk2s8w5tE5RdJPO2rcxGDrZpH6KdRqzYXTPZvr5A21b7vculdOK9IfW5KLpF9uCQ=
X-Received: by 2002:a17:906:82d9:: with SMTP id
 a25mr11612572ejy.101.1605472534755; 
 Sun, 15 Nov 2020 12:35:34 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9txyMmW1DWhS--SuYQu4qDK1GPzgHJwxbAfhHT=hUsPODA@mail.gmail.com>
 <20201103222013.hypmzlq7uuqufe76@box>
 <CAHk-=whPqB1PUVCCcQMjm-YTBnTP7UD_ey2rbXzcJhQufJwcUQ@mail.gmail.com>
In-Reply-To: <CAHk-=whPqB1PUVCCcQMjm-YTBnTP7UD_ey2rbXzcJhQufJwcUQ@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 16 Nov 2020 06:35:22 +1000
Message-ID: <CAPM=9tySfv3vueCjR84MTzxiZdKZZwVuddb-GuuPyoVncoSPyg@mail.gmail.com>
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

On Mon, 16 Nov 2020 at 03:57, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, Nov 3, 2020 at 2:20 PM Kirill A. Shutemov <kirill@shutemov.name> wrote:
> >
> > On Thu, Oct 15, 2020 at 11:33:08AM +1000, Dave Airlie wrote:
> > >       drm/nouveau/kms: Search for encoders' connectors properly
> >
> > This commit (09838c4efe9a) broke boot for me. These two hunks in
> > particular:
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

I do have a fixes pull from Ben from Saturday in my inbox, I can send
it on this morning.

Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
