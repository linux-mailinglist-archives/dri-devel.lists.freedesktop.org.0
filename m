Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A97C5F6FBC
	for <lists+dri-devel@lfdr.de>; Thu,  6 Oct 2022 22:50:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67B6210E8A0;
	Thu,  6 Oct 2022 20:50:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69E3810E8A0;
 Thu,  6 Oct 2022 20:50:11 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id nb11so7229714ejc.5;
 Thu, 06 Oct 2022 13:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Lw3hcZYCbSXQECyfjcrQpfoqdXxxo96LRjkxgjmynTg=;
 b=kAE5TejQzSw+caQhIkmZcd1nyaZXxYIEyK3iZIyJoF/2VlguNLzyQL1mOCh1HsiObI
 5EDpCdf1lINvFZf3XskyCyZ6BfVm+pq9R6xYB7GiRoGcvyrxyurWiQXJsLTD5xiM9VQ8
 NKnINdJqgsmB8nB2yl3OZvR+AlPbVEMzTFWx6dMb299Wpmep2q94XorBeGE5gqFO0piy
 cIqLyI9BbxXAQsSz5pz6nhdAPhloZoll955Q1G0i26iRCdiIVNVjuz7drfjjlvOVSibx
 g4W6Rkt7jS4o1t8Q3Ri0qN7ahT4htZdy55LRZWdSHEEVQxwXphzlxjwjv9lTddLFhVE5
 Iwbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Lw3hcZYCbSXQECyfjcrQpfoqdXxxo96LRjkxgjmynTg=;
 b=KsR/0O1lNTGaK1FoVd5LY7o4VgUxkujcaCMxT8YHnLnXmFDvK1+2+MlEyqb2gPY0lR
 kZ5ViMhuL6JPLV5K3TYRRBH/9mwuHVDebiNds6dEswuYsTVps3ZuOGQUgzoW7QhASN09
 YWuSU9vUgQeTvOx0QT6eHY9K3F570FbflvHjHHTXi0uNEPWr+omv9aoMQwQGdBmNUIJG
 abrQg3dXYwG3ix9VJ8cbjHlgn5B3V/gPpeBlEWC/V28jV6BZQ7XSaB6eutxJmyzR/VKy
 yM07OjJmOHV8VCMRS3c7jVKWbdR60Ntkokd3ok+zaiVasimEjv/ZXtrj2D8v3zdFYuek
 c+ug==
X-Gm-Message-State: ACrzQf0yrsvS8KxdVQyNYpeF5lv6jIAkLJfl81BbeIevRUAybla0QiDM
 +LCiPXyJs7pGI3t6xWheepYj/73b2igRPaLLklc=
X-Google-Smtp-Source: AMsMyM4P91fpDljNrDMbFUDOVbFY03lG2h0mEvfbsXCHDDWdXCu9iyeVIP+ZTD/jq+OGeQ59K+AkwxHkTF0COate9gg=
X-Received: by 2002:a17:907:3daa:b0:782:1053:ccb5 with SMTP id
 he42-20020a1709073daa00b007821053ccb5mr1402440ejc.312.1665089409864; Thu, 06
 Oct 2022 13:50:09 -0700 (PDT)
MIME-Version: 1.0
References: <Yz6W+j+l0cJbr5dX@debian>
 <CAHk-=whR8T1x6DRnOMJsorajT3A-y9+j5Mpeh0zcUXcJiJWheg@mail.gmail.com>
 <202210061328.37FCC30@keescook>
In-Reply-To: <202210061328.37FCC30@keescook>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Thu, 6 Oct 2022 21:49:33 +0100
Message-ID: <CADVatmMOEtX_vpR2iv9r7n5x76xjuyHwx6duERqjMutb=AKrhA@mail.gmail.com>
Subject: Re: mainline build failure due to 5d8c3e836fc2 ("drm/amd/display: fix
 array-bounds error in dc_stream_remove_writeback()")
To: Kees Cook <keescook@chromium.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, dri-devel@lists.freedesktop.org, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Nathan Chancellor <nathan@kernel.org>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 6, 2022 at 9:37 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Thu, Oct 06, 2022 at 12:39:40PM -0700, Linus Torvalds wrote:
> > What confuses me is that error message ("array subscript [0, 0] is
> > outside array bounds of 'struct dc_writeback_info[1]') which seems to
> > be aware that the value is actually 0.
>
> I've seen bugs in the tracker where the reporting is broken but the
> range checker is working "correctly", which seems to be the case here.
>
> > If somebody cannot come up with a fix, I suspect the solution is "gcc
> > array bounds analysis is terminally buggy" and we just need to disable
> > it for gcc-11 too.
>
> It does continue to find bugs, so I'd rather keep it on. GCC has fixed
> all the issues we've run into so far (though not all have been back
> ported to GCC 12 yet, so yes, let's keep -Warray-bounds disabled there).
>
> Specifically, I've been tracking:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=105679     Fixed 13+
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99578      Fixed 12+, 11.3

Thats odd, the bug report says its fixed but I am using:
gcc version 11.3.1 20220925 (GCC)

>
> And it looks like Sudip's proposed fix for this particular code is
> additionally fixing unsigned vs signed as well. I think -Warray-bounds
> did its job (though, with quite a confusing index range in the report).

Not my. Linus's. I just tested. :)


-- 
Regards
Sudip
