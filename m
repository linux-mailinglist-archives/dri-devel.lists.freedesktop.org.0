Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F553BBCC9D
	for <lists+dri-devel@lfdr.de>; Sun, 05 Oct 2025 23:33:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 748B310E28D;
	Sun,  5 Oct 2025 21:33:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="AGLjU0nY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EED9E10E28D
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Oct 2025 21:33:25 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-b4539dddd99so510806866b.1
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Oct 2025 14:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1759700004; x=1760304804;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=o5xflicGk4SRWq4uI9IRaqV35+qaPk/Vs0aIHyFIGYo=;
 b=AGLjU0nYMF49aibDwOcudKhdZcTzD1SqoWN03WiryLnbArWjIUhOyXTIKZ8PJD35kY
 3/qPSsqnH6uFCFJmaONiC6YXXSzeeUhIgsvwb7e1D1oXnnvZnXDRd1AUojy7/5qLGDlz
 31gUs4xD72+y26cu9opoxm9gR27iI57zqA22k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759700004; x=1760304804;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o5xflicGk4SRWq4uI9IRaqV35+qaPk/Vs0aIHyFIGYo=;
 b=LXYetmVwFUjS1Emk/VciB9tBx9ntYCblvGF96hLCMD7GAJCrr/h6hkc6qJpaqljxNz
 21yJPt/738ADKdMnvRc+oQlQkAf88YF4JkWqj8OguHGHEoX6aJwBZrrqhUMQaU8O5xYc
 ncExiktm6fRkLQ+VLXo0XWzrVUbjQCkY01eRSLRITdqZrRH4bJzlXWAHc1Qv8U+CwOJh
 q8nTxhXHSFwrjKm3pzhL/wvlg6848H3WfI1en7ghltxKCDInW0W7LvDoQnOZidPR2pxd
 0RrQQawnuyhtXLULDOUO5vALNxyMSaK+4/bDAw6vYpNZCmJn/I1OTWRiDPs0dUabQW2E
 Kjzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzIrGCc2yA1ePidouSBF16ZIG747vD29ypi9NSjCz2u51D6Fx0hR6Wy0Nw7CqA7zcsxXjasf72IgI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTwRQAhbPNbe5sikr7kOWACxgsuXKBVlzOpzx7EB21bqJJOooy
 sIRoTjd+Q/jMBnfwhR/euaJRHpc6ffcSZqUywIeXO4UPKHt3alSV3RukvABK36ayWL2FKNgmWYc
 xb1ReN5E=
X-Gm-Gg: ASbGncsojpwSP6LofqRPMt1qp3utsXsDmV2IlMTaiz4rktpqufM4L+0bowsBB4YdWGd
 rQCVQKWUTdxWYy4QUe56Mmtl2SXPzKMdUfl52j2r9brU+kY7UZ6/EopOQyxw5ErG14qi5tIQeCA
 amyoOOAaMaMW28pQX4DtMLqbJu7XblK//3xj/8nqQhxZ3BXUkoDPEBuBOc0WgcRTkphxvcIahox
 MInW4DGChMd4uinPTKfsLiXrD9V82wRtm1ef9pdO0Bf0WCeLhHBN6aUJ58dZvhOy8NIDoebYEDk
 DGsfyuFHG+W0Mn6me1eHgnr+NWps5AmAmxhxtyZ4J1wiAHKcsn7eUGvlL4YIHZIq8HBeumcyVGU
 u3rceHsXGMTPR8qPQyGwYKQoteh0sVG91jhVxqdRz3q4jnrG9w00SARucQmtYbmHbL8nGEfqskT
 RtnyDdQAEkKfTaunQ6Sve8
X-Google-Smtp-Source: AGHT+IEekKkYD/TmpaokP0V5sQUn4wVDxhPjFJDQUJvKaluGQfkk/VqFPwNoB6q2vsmXBsMuGRjvmQ==
X-Received: by 2002:a17:907:2d1e:b0:b3e:151b:849b with SMTP id
 a640c23a62f3a-b49c27611f5mr1364401366b.33.1759700004049; 
 Sun, 05 Oct 2025 14:33:24 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com.
 [209.85.208.53]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b48652a9f11sm989082966b.4.2025.10.05.14.33.23
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Oct 2025 14:33:23 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-637e9f9f9fbso5636576a12.0
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Oct 2025 14:33:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVok05tQfKFN3yohMrnlWAL68AexRssqh2jAKFDgsMo0izN053becnf4AkA9h3/m8L2F5roxr5GfhA=@lists.freedesktop.org
X-Received: by 2002:a17:906:c102:b0:b40:5463:3afd with SMTP id
 a640c23a62f3a-b49c0f6e11emr1249670266b.26.1759700002833; Sun, 05 Oct 2025
 14:33:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzYUBfz+YmifRDgdBsuTL=FpBxQVfxu23it48kGRzJNPQ@mail.gmail.com>
 <CANiq72kq5YHovH=_a9c0JQgfrAx9gRsQvVo1VfHd-FaupOp7rQ@mail.gmail.com>
 <bd004ac5-9e51-4e90-a3a4-025d74941a38@nvidia.com>
 <3771775.lGaqSPkdTl@hyperion>
In-Reply-To: <3771775.lGaqSPkdTl@hyperion>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 5 Oct 2025 14:33:06 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj4_zaYJ9ieazt9dnL69R+SL1PEfJtquGVOqsNCVt_rDA@mail.gmail.com>
X-Gm-Features: AS18NWBQQKqi5I2xncYfg6Cw_82qONOSAn3HSxJQcAmMyr9b8ndXyO8q6Tf7U6s
Message-ID: <CAHk-=wj4_zaYJ9ieazt9dnL69R+SL1PEfJtquGVOqsNCVt_rDA@mail.gmail.com>
Subject: Re: [git pull] drm for 6.18-rc1
To: Maarten ter Huurne <maarten@treewalker.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 John Hubbard <jhubbard@nvidia.com>, 
 Dave Airlie <airlied@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
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

On Sun, 5 Oct 2025 at 14:31, Maarten ter Huurne <maarten@treewalker.org> wrote:
>
> The Black and Ruff formatting tools for Python use a "magic comma" rule
> that works well in practice: if the last item has a trailing comma, the
> items are guaranteed to be formatted multi-line, while if there is no
> trailing comma, single-line formatting is attempted.

Oh, that sounds like a good heuristic, because that "comma after last
entry" is very much "I expect this list to be expanded upon later".

              Linus
