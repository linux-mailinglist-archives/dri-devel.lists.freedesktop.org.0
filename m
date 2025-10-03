Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E29BB657A
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 11:13:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B419B10E0AB;
	Fri,  3 Oct 2025 09:13:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com
 [209.85.222.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E86B10E0AB
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 09:13:17 +0000 (UTC)
Received: by mail-ua1-f45.google.com with SMTP id
 a1e0cc1a2514c-92cbfab6c0dso1305379241.3
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Oct 2025 02:13:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759482796; x=1760087596;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nDTd/A+GqnR1lLNB4+wupiD6xOJyJNrk+TkPyuTsiUw=;
 b=cyPfCwh/qr43JRkEC6Jt1z5xtemq5Y9CpXOM4DYATBDJhdgwwv1Y/iUi6d9k8hLAnR
 6N+6v5zZ+UZwYrolVBccmLrHJ2C2KtXMCdpeXJ33hlm8shlC0TsXA+Usav2YDYz2ir+e
 0+9wd2lssCbbMGcRSQrAenaCyJghJsCRwkTeO31z/UOgpp1DYfmaSOk9XVDpZ7Rd5UyU
 zjWEX0w3yYekIvoCx5gTa4JEZt6sZ8wEQULHUIHp7ci7bK2x/6hlda4fLbVIIHSmn0kB
 IiZJWb69Rh4SLQtKuMYCVzAuQBvQV87PrW0vCG5hfcEOGprQjvpNMSV2iARg5Mjx2JyF
 E0+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWCNwNxSlwfK08Ptv/iGLNSKxTRlqbR9jsmq2eor3B2DsegaOJkTXA/RKCKIFT1fMQ3vpyO+zCvmY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzLPARr/HOFGO6tp53ebOC66e6RSsHyUfsQmfbOcgPTzZDF2vbR
 h9vznYNa2JGmXJbuuw5kukDfL2mQWJEp4E88bb9PS1ApU0t+BxtwchBuHQ12sjwTcmg=
X-Gm-Gg: ASbGncuBnngqY/D1ycX/nxiUeEysw3lNk2cpEqXpYN0XUQ3mWyi5NPhdgA7m70MzV6I
 K8/Eg84aV2029GC+rjCRfoNYRU1u4P+OV5Boj//GPkPpW9q5aDyzWs8yep1CIda//hj39izw61V
 myL8OlP9O3q7jI+Kbb4NyUCbnLX6Hcc+Qm/hND3lRtTYipmUFTjrlReiCIutGZPuIOBNQfrmU68
 qTI/jafqUYqz9XRlpQjiaO3dZtyr3kDdry3kfrTDtyC8sGsi343jGznns8BVrQiQaNtr9Az2YYo
 yK1tmuInmP/9x46QZs9yzBAlzXzTy8mDX3JdBxzpjhRqawvIlp5iF3DOtmJPs5iSnvMsy2kvyoq
 W7HtxZeSHwwKl36gfbpN5ujfnCNEKewW+bklwiMYmWwpAa58ZQ2IQnqwgw7/mHDl2ONGRGMkAzg
 y6Qnn7hLLnQFTLOOR9YVo=
X-Google-Smtp-Source: AGHT+IH93Oryf37j4r2NKpWuq1li7ZLko98MQ02+x7feFaNl4M+uRf72TWO1yycwz5Co7XDEFv4whg==
X-Received: by 2002:a05:6102:512b:b0:5be:d04d:d2c6 with SMTP id
 ada2fe7eead31-5d41cfdb66amr720842137.9.1759482795846; 
 Fri, 03 Oct 2025 02:13:15 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com.
 [209.85.222.44]) by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-92eb4da2028sm1043706241.6.2025.10.03.02.13.15
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Oct 2025 02:13:15 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id
 a1e0cc1a2514c-890190d9f89so1403710241.2
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Oct 2025 02:13:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVSZuDvGlC+4xA/n+Ie2OUc20xQwxEFby39giQG/Yj1VSRAjGIlESofWi+cTZQb9M9ugOeKFciCFbY=@lists.freedesktop.org
X-Received: by 2002:a05:6102:1620:b0:5ae:f88:23eb with SMTP id
 ada2fe7eead31-5d41d1331aamr771897137.30.1759482795490; Fri, 03 Oct 2025
 02:13:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzYUBfz+YmifRDgdBsuTL=FpBxQVfxu23it48kGRzJNPQ@mail.gmail.com>
 <CAHk-=wgO7S_FZUSBbngG5vtejWOpzDfTTBkVvP3_yjJmFddbzA@mail.gmail.com>
In-Reply-To: <CAHk-=wgO7S_FZUSBbngG5vtejWOpzDfTTBkVvP3_yjJmFddbzA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Oct 2025 11:13:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWeR-LPLia_r3aYDNWBkQeUGUTp4rKmvc35P7SkmVuKwQ@mail.gmail.com>
X-Gm-Features: AS18NWBr-QYOaZF12vXWDi_gQ7JHEjluG3qUhyDxrhS1mgMAlr_QVRVkANhOWnc
Message-ID: <CAMuHMdWeR-LPLia_r3aYDNWBkQeUGUTp4rKmvc35P7SkmVuKwQ@mail.gmail.com>
Subject: Re: [git pull] drm for 6.18-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Dave Airlie <airlied@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Sima Vetter <sima@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>,
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

On Thu, 2 Oct 2025 at 22:19, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Tue, 30 Sept 2025 at 21:06, Dave Airlie <airlied@gmail.com> wrote:
> > As usual, let me know if there are any problems.
>
> You are still corrupting indentation in your explanations.
>
> I don't know *what* you are doing wrong, but it's wrong. You seem to
> have lost all indentation.

Pasting TAB-indented lists into the Gmail web interface?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
