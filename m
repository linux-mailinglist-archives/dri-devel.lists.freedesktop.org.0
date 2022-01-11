Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A9948A50F
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 02:29:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AFA710E507;
	Tue, 11 Jan 2022 01:29:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04CD910E50A
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 01:29:08 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id u25so61015412edf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 17:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NvnMrqyyprPM82tM0QymR8SVUNtcjFg9kaau7vLVoys=;
 b=bJYuXFund9ha/pHIpixqe7ZULRG3XbPW/bwVA7ekt6FXGMxCxnXxW4Fckng6N5csqk
 CyQhn5VacnnVs0QpdCxP+hbBvwGfQp/bqct74HUPFt2EyD1c2GPpLFRq3POifHGPxFQr
 PP+TEmIue3otyL9vk0BEUmsF4uO6DbqkrFWHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NvnMrqyyprPM82tM0QymR8SVUNtcjFg9kaau7vLVoys=;
 b=c97iwe2d7ZaL1Mj7hndw+mxHAdNaT0POy4XGrSmZTZAYZrZWCdBxG5Iobw+nVQWia4
 +DnH5yGKpIGimCXpGgdQmsvwB678tAy1iSx9G4S7DJ/wDq1v2rwg8bm0XIrYVms7tEjq
 FNZXrxi900nfDXKYbrqS8zK+9zTzmA/tT+Z16LVSggGPAhkDLsuJAKoPDkweSsvwjPku
 E/lx/B085+FS2WK9su57b2fS/lzb3lgiZuE2mTJcnAvzOsEsI98euCiRh1vI2MhCPQDh
 TzvPjZqkBEFCpFfzqd4D63749vVMnDsdshnaxmsj7bxar8z3+ZJiVg4sqXJlxkl8bUJ8
 u8Yg==
X-Gm-Message-State: AOAM531skhmUDtyZlSQot7UBhnjdK2oL+5GvBpnoEtST3vJ9/FYjR0kR
 Ypa1FO01xAXu87m3u7X6c0C332WTipA94jtdWv8=
X-Google-Smtp-Source: ABdhPJyhlutXtB3ykhWoDPpjDPQOkA9akMUJtAZNoqQ7qbeTHuKkxzVW+Epzcqiq1nVdynalIb+XjQ==
X-Received: by 2002:a17:906:7942:: with SMTP id
 l2mr1921997ejo.730.1641864546446; 
 Mon, 10 Jan 2022 17:29:06 -0800 (PST)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com.
 [209.85.128.50])
 by smtp.gmail.com with ESMTPSA id hw8sm2997495ejc.198.2022.01.10.17.29.05
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 17:29:05 -0800 (PST)
Received: by mail-wm1-f50.google.com with SMTP id c66so9958811wma.5
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 17:29:05 -0800 (PST)
X-Received: by 2002:a1c:19c6:: with SMTP id 189mr334541wmz.155.1641864544815; 
 Mon, 10 Jan 2022 17:29:04 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9tz=_hRpQV1V3M-=KmVVEbr1K166qeb-ne64PHk9Sn-ozg@mail.gmail.com>
 <CAHk-=wg9hDde_L3bK9tAfdJ4N=TJJ+SjO3ZDONqH5=bVoy_Mzg@mail.gmail.com>
 <CAKMK7uEag=v-g6ygHPcT-uQJJx+5KOh2ZRzC2QtM-MCjjW67TA@mail.gmail.com>
 <CADnq5_P9n39RQ5+Nm8O=YKXXvXh1CEzwC2fOEzEJuS2zQLUWEw@mail.gmail.com>
 <CAHk-=wgDGcaRxUwRCR6p-rxDVO78Yj4YyM6ZsPRGiT2JOCoQ6A@mail.gmail.com>
 <CADnq5_OYO7kq+9DBnDvbSfpouFvdLB0LPSL6+f1ZPRBsV=qEqA@mail.gmail.com>
 <CAHk-=wiCCRG9Lwzr+Cur=K1V2GJ9ab_ket7EnG4RZhJ8jJM7xQ@mail.gmail.com>
In-Reply-To: <CAHk-=wiCCRG9Lwzr+Cur=K1V2GJ9ab_ket7EnG4RZhJ8jJM7xQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 10 Jan 2022 17:28:48 -0800
X-Gmail-Original-Message-ID: <CAHk-=wj9EQdO=gdgrajp03xNf6dtcE03oYucXmJJst0GgSs=VA@mail.gmail.com>
Message-ID: <CAHk-=wj9EQdO=gdgrajp03xNf6dtcE03oYucXmJJst0GgSs=VA@mail.gmail.com>
Subject: Re: [git pull] drm for 5.17-rc1 (pre-merge window pull)
To: Alex Deucher <alexdeucher@gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Koenig,
 Christian" <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 10, 2022 at 5:21 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> It also seems to depend a bit on the screen contents - or possibly on
> what else is going on. Hiding the browser window makes it happen less,
> I think. But I suspect that's about "less gpu activity" than anything
> else.

Actually, sometimes "more activity" makes it go away too. Moving a
window around wildly with the mouse makes it *stop* happen.

But moving the mouse over different elements of the screen - or
writing text in the web browser email window - seems to make it worse.

Funky.

It does "feel" to me like some bandwidth limitation, it has kind of
the same behavior that I remember from the bad old times when you were
pushing the video card past a resolution that it could really handle.

But that can't be the case, this card has had no problems with this before.

               Linus
