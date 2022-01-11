Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4C748A4E8
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 02:21:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64A0310E4FB;
	Tue, 11 Jan 2022 01:21:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB3DC10E4FB
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 01:21:28 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id q25so52298490edb.2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 17:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VghT5Vb1bGkkfuhJyJBbYpfymLiEG6YlV0Ofo+lXSRs=;
 b=CuoC1S5DPEPzxhaI/t/Zt5/7ZnredBXUx63/7QgMSrKdR6dU+kjwkn5e4Y9dVXNX5l
 Vo7r+EcjrjXKC7eYS94RpKiX0PkhEoqLxQYqUn0fSn6sOhYsh649ExJNudF9PbHfqlwH
 HhetD8jit7LuyHbRhw8nh7NJ4t8W84qHpTvYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VghT5Vb1bGkkfuhJyJBbYpfymLiEG6YlV0Ofo+lXSRs=;
 b=VgR6cZwOdfQxFkhiMb0MAgp6goB4Pk1CrxW32f9kAWvw5Z8ZC8bcI81M/QuSX1vdPT
 KSXfZpTRyBoRkyoHFU26orKWGHuY8iPDFh4azj9ovb+YyoHpXTqvlSgT74uOz15r2GUs
 fe5IDTAzd8yAnAlAN6Y4rD/J2qRJcPYqp3wlob5w2JaV30jQuh3RXHNCZyQ5l3aPLfAh
 4Sjd6oXYlCBxniDoBgeJI5EcsyeB0R5vwtG5CUfX2Z8bOsnDfTCajP9jCWl7x2FhAiKz
 iGbjbZjhxi5PdJKTBP55W5GXkTM2uR0tNp4nfAa0cN8iXgDM8J7+10Su/VqY7kFmW4GB
 iibA==
X-Gm-Message-State: AOAM532zDiuXPXrBsSCH2VZkBJMFCojsHIqJatBBFjO+AdDpfVQ9mhxl
 SZPFrSPjTyEsWFuOMt/tqGG3MjTofLYbWmWsTKc=
X-Google-Smtp-Source: ABdhPJxylc8jk4y0h5PVluGFXZJVFTZtqTNa2V92cwn05EJ6LT+Fvvz/QADRQiZjgsvDIsQKQC0GSQ==
X-Received: by 2002:a17:907:7208:: with SMTP id
 dr8mr1773066ejc.697.1641864087058; 
 Mon, 10 Jan 2022 17:21:27 -0800 (PST)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com.
 [209.85.128.47])
 by smtp.gmail.com with ESMTPSA id qw4sm2978286ejc.55.2022.01.10.17.21.25
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 17:21:26 -0800 (PST)
Received: by mail-wm1-f47.google.com with SMTP id c66so9951028wma.5
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 17:21:25 -0800 (PST)
X-Received: by 2002:a05:600c:4c94:: with SMTP id
 g20mr337592wmp.26.1641864085524; 
 Mon, 10 Jan 2022 17:21:25 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9tz=_hRpQV1V3M-=KmVVEbr1K166qeb-ne64PHk9Sn-ozg@mail.gmail.com>
 <CAHk-=wg9hDde_L3bK9tAfdJ4N=TJJ+SjO3ZDONqH5=bVoy_Mzg@mail.gmail.com>
 <CAKMK7uEag=v-g6ygHPcT-uQJJx+5KOh2ZRzC2QtM-MCjjW67TA@mail.gmail.com>
 <CADnq5_P9n39RQ5+Nm8O=YKXXvXh1CEzwC2fOEzEJuS2zQLUWEw@mail.gmail.com>
 <CAHk-=wgDGcaRxUwRCR6p-rxDVO78Yj4YyM6ZsPRGiT2JOCoQ6A@mail.gmail.com>
 <CADnq5_OYO7kq+9DBnDvbSfpouFvdLB0LPSL6+f1ZPRBsV=qEqA@mail.gmail.com>
In-Reply-To: <CADnq5_OYO7kq+9DBnDvbSfpouFvdLB0LPSL6+f1ZPRBsV=qEqA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 10 Jan 2022 17:21:09 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiCCRG9Lwzr+Cur=K1V2GJ9ab_ket7EnG4RZhJ8jJM7xQ@mail.gmail.com>
Message-ID: <CAHk-=wiCCRG9Lwzr+Cur=K1V2GJ9ab_ket7EnG4RZhJ8jJM7xQ@mail.gmail.com>
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

On Mon, Jan 10, 2022 at 5:11 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> We are putting together a system to try and repro the issue.  Does it
> happen with a single monitor or only with two?

Nope. With a single monitor everything seems to look fine. And when I
plug in the second monitor, it immediately starts happening again.

It also seems to depend a bit on the screen contents - or possibly on
what else is going on. Hiding the browser window makes it happen less,
I think. But I suspect that's about "less gpu activity" than anything
else.

I'll see if I can bisect it at least partially.

                  Linus
