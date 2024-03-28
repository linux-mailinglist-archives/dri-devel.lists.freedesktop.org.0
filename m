Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C241C89012D
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 15:08:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA66710E1D2;
	Thu, 28 Mar 2024 14:08:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DTtdfvpl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11D2810E1D2;
 Thu, 28 Mar 2024 14:08:02 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-2a07b092c4fso842727a91.0; 
 Thu, 28 Mar 2024 07:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711634881; x=1712239681; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BDHeiy5x4l219ebTle1HBlwon+DJR86izkGnTQaTTqY=;
 b=DTtdfvplnRruFbteEncYJTz+3Z8Iy35pqZGNaAZNI84X9r11MrwuO2uMcMzuXfvmnF
 WKt25sgJs/xdGl2VZvRC2xCc11I6RDcSMWqxZWFZhLwbejlOa5cnspOWb+v0HGuTWjIR
 yDIe5VNlmDqPQCqVWaMQHKeUL2NbjNCqNHcYvN13f1oi+SgI5qnTaFGI/t5RSvXrsfQ3
 B2rzOY7hOZUcqngxjhscNbAUx8wz6xf3RHa+o6gM4XcSVIHzJyBzkRnEPkwtO4f8Mbuq
 aYbji4qSYZDdryUJ8PX8CHfCOPjUr8J2tg6udAdYdCk/BVYTQZXELP1I6pb1mQRmDyOu
 dSPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711634881; x=1712239681;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BDHeiy5x4l219ebTle1HBlwon+DJR86izkGnTQaTTqY=;
 b=V0OG3uWYrHu7mvlEns3xYVSufO6ZAEZGKl7QZLUuwTOKl3pdSmkXxJZfLOip7EpQbC
 ijjAo5svvYjcHzQsl71A6fPvJ3uQqgEvKnVjmU/eAAekEZj609CFqcIKQVe0nMj3QCpo
 EOWx+utbvczYkJ8Fc+rqnecNSCsOJSRx546CV+aT483ONrtQatWdAcT//sFniZCYZ2zH
 546G5dGanQFQrFLfuZK3kOnjHTtcTUHjI3LyftLdxZWOcATHmlfhct3PqiOwLH1slqLc
 tRrjTFykrf8+zuNGshkMxKEY8ImYJZnJFjyYtiUtnC7ahSUgCb8+/CZNe7b9QWL5ZwzB
 HPYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjCz5pWw+EGtY6Ku1r+FdSO4voNTavCsJzgeUVGbRLUmrEUP9+76/MWSz8uVONDRst9cQj67uCSfS+gyeylhUliifFPZDgSLOzay41MCQ3NX9fP4bPPMp8dkBkdvScyTGbHRbbbE+nDr08SmYHT2tvm4c=
X-Gm-Message-State: AOJu0YwCZYU70xm6CEtIHAhmWMRA42b6rmPQDhwHpo4oMbXxoQfpzHCQ
 RZeefUJAFUchun4YeClrqZ40KrdvKZs/pmNcW7y4ap6FguITjFrUO3FMSMBA6LghmwGiBy6Q8as
 m1CBT/UgVxBr2jrAGdlMZl2gcNy0=
X-Google-Smtp-Source: AGHT+IFIWrhKeX7ce8KjxR2/tVtAq3kXc8zJr8TS91l7PXkMz9P3mtiS4Y6NCckBLcO3qKsiyOW+wSty0gx2JmJTJMA=
X-Received: by 2002:a17:90b:2d8b:b0:2a0:310b:2cac with SMTP id
 sj11-20020a17090b2d8b00b002a0310b2cacmr2519425pjb.25.1711634881431; Thu, 28
 Mar 2024 07:08:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240327175556.233126-1-ojeda@kernel.org>
 <CANiq72=kGWSQR7TgKDnAaef+FS3VGQeo3ri5vv1wxpW_88vdqA@mail.gmail.com>
 <20240328-quantum-bettong-of-contentment-7c7841@houat>
In-Reply-To: <20240328-quantum-bettong-of-contentment-7c7841@houat>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 28 Mar 2024 15:07:32 +0100
Message-ID: <CANiq72m65iv8VpwvuZvW-VOewZ2-Mf3knJf-tPAzfwY7F-ZBLQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/qxl: remove unused `count` variable from
 `qxl_surface_id_alloc()`
To: Maxime Ripard <mripard@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Dave Airlie <airlied@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Alon Levy <alevy@redhat.com>, Frediano Ziglio <fziglio@redhat.com>,
 virtualization@lists.linux.dev, 
 spice-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
 Tom Rix <trix@redhat.com>, Colin Ian King <colin.i.king@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Mar 28, 2024 at 11:18=E2=80=AFAM Maxime Ripard <mripard@kernel.org>=
 wrote:
>
> "a while ago" here being 2 hours before your message :)

Ah, I meant the original reports that Nathan mentioned in his message.
Yeah, the message itself from Nathan happened right before :)

> I've added a Closes tag for that report too.
>
> I've applied both patches to drm-misc-fixes, thanks!

My pleasure!

Cheers,
Miguel
