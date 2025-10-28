Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4786C1442E
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 12:06:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4C5C10E386;
	Tue, 28 Oct 2025 11:06:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Pz/LzL+J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAAEF10E386
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 11:06:23 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-29490944023so40011045ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 04:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761649583; x=1762254383; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iUWmP3PhZ8tlgKqgNEzC2Ad8cbsR84+pstOsL3UQMkk=;
 b=Pz/LzL+JL6fOJyV27fsEeQE6kcxTblmmwMjjWJABiF21o39CWBsccSJ4OdQnn0nNRs
 9ziE2g8CQT6U4Tv7PhPySwN4ilI3Ip9tftAgKvpLfT1fD3BgSgr526iQcDn9Q+5grDwI
 PKGYKVrzD6Y9VjObpgSNcr+qtGYYePK1gY5fxhW0lulHMV/9PRkugYR7D1OCMs59K+xh
 qGVm4Oi7dEXGZI+B7FR2FausuHU50rwtrXpCbRX0CIqJS9i7rv6QShr1cIK5jbXbF/pe
 aRJirnASKYp/I5Lvy9C13oh9CUCL0RtLdE1SKVu7t2nxy510ogHZzSviPdhCA1Ypsq5c
 GeNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761649583; x=1762254383;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iUWmP3PhZ8tlgKqgNEzC2Ad8cbsR84+pstOsL3UQMkk=;
 b=PLDPgpf0wyu8GjbhptFMyme30U/KrUlFWuL7+UtXZXAegi/JMekK6Rh8dcYXlw4vyp
 sG01MfYRzlfvjNcdZp1TF38a2yGqkSBYJsYhJNKXPnW+kYRD0FTbXpBXfnJ0+IDQrQQW
 GZLvnnsIme2izjJOmHgj9c3Goxq6J+Ja0qVeKxwnZSUM90xFxBT5xAlpPNY+wsDPOPP0
 l5f9qTKF5xKzdwK3NjF9boQgirAeB5rrUwSZ8AyknG0RcRTdGLq6yg9ieWWNoy0FNUQq
 Kr3DSJbdlmmmCR7/aZJDVhI5YCxvOs7FVBZoPo8WpR2WH5Am80iZtHLS4TCIdBdHu/YN
 fsMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOl0OqvOeciIfLvdh32X3qug6LoNEGOs7fJanADxSmLrf/aruANsYJEk34giUmoAX2qTuPzeARvTw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyDEDZgqGBt2tKu8qWcZZeMGGlKs7OdxIkUcqjxHXaCUbPyt/DV
 sfUXX0oDKeSWHG8jk8RLobU6EJv/RUf3r9LioKQr36gGalifLDw0uHPJSvAtBTRZxZ3MPd1mxhs
 tjVK2ZihSb6nCKbbmVml+G81eimS+yws=
X-Gm-Gg: ASbGncu5vEy62NHziVAJZm+JEyOjOLZ6IuUf7O7+dDHoy/nZy+keFBuf5C2RioXNjNo
 BG7JGZJfib6b4xITI0ZxLdh4p0MT5cWBqDWKuIvUvfpDl2d+nkNF0Bmo4jbbYwpZAZghRs2GbNj
 96oVIudVejkDO23n5OVtPO3lwzNcqvzpkryFwGikCpG35Ff1oDrkDhyCEP8q67oZDF0JUq5o86k
 vGz7Yhctsd8WCUCa79GSDoLHutFYr4KtCkC0dOqYJE32jUwy+spMcvH7tPf+M3bO9e4PGaab+JS
 ktr0CbR5K2Dl1v8rhnnAteDXocflcnOfUyG2jT3TB5uZTM/JVjTLUMkAdALY01aGImK8EPubs0b
 Tjpo=
X-Google-Smtp-Source: AGHT+IF7FNORVzgaeQ1govCGZtEXJ05FSICIDDXxzpekPFmsjSkXmOeYH2v4GP77oi5zhp/UIA8gm9W95L73ZNdDHns=
X-Received: by 2002:a17:902:cec7:b0:283:c950:a76f with SMTP id
 d9443c01a7336-294cb67398fmr45724665ad.43.1761649583232; Tue, 28 Oct 2025
 04:06:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250928054913.7871-1-opensource206@gmail.com>
 <CABQX2QMgZ0VGQ+-RhF0suTyL9qkU1Hf5V7g2jvPQ+CwTEidZKQ@mail.gmail.com>
In-Reply-To: <CABQX2QMgZ0VGQ+-RhF0suTyL9qkU1Hf5V7g2jvPQ+CwTEidZKQ@mail.gmail.com>
From: opensource india <opensource206@gmail.com>
Date: Tue, 28 Oct 2025 16:36:12 +0530
X-Gm-Features: AWmQ_blOzU8MNjg24AK7wPsDJ9kJPnWwRA7YFclINRCUysc4TIihhoHenBhIG7M
Message-ID: <CAKPKb8_tHVEFrkWHF3ycuDXOCJ9-qr64_sii9O4bcUiu4uuvRQ@mail.gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: Replace schedule() with schedule_hrtimeout()
 in fallback wait
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, bcm-kernel-feedback-list@broadcom.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

Hi Zack Rusin,

On Mon, Oct 20, 2025 at 9:48=E2=80=AFAM Zack Rusin <zack.rusin@broadcom.com=
> wrote:
>

> I don't remember exactly the schedule family of functions but isn't
> schedule_hrtimeout leaving the task in a running state? In general it
> looks like with the patch the task's current state doesn't match what
> was expected, plus I'm not sure if I quite get why the uninterruptible
> non-lazy case is being replaced with a lazy wait of NSEC_PER_MSEC's.
> It'd be great if you could explain a little bit better what you're
> doing here because the commit message is missing an explanation for
> either of those.
>
> z

Thank you for checking the patch.

The existing code does not specify any fixed wait time during the
fence wait. It simply invokes schedule(),
which means the task can be rescheduled immediately to check the fence
status again.

By using the high-resolution timer family of functions, we can specify
an explicit sleep duration.
In this patch, the sleep time is set to 1 ms, ensuring that the fence
status is checked at fixed 1 ms intervals.

This approach allows the CPU to be released to other tasks for a
deterministic period,
thereby reducing unnecessary CPU wakeups while maintaining timely
fence checks(FIXME expected the same).
