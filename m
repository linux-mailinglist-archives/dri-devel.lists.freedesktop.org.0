Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9446902B51
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 00:05:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E07C10E253;
	Mon, 10 Jun 2024 22:05:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OQK6mhjm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A583210E253;
 Mon, 10 Jun 2024 22:05:15 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id
 6a1803df08f44-6ad7d08c045so6463416d6.0; 
 Mon, 10 Jun 2024 15:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718057114; x=1718661914; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rP+ricIK5YBlNx+/fEIyVLa5KkTZrxTMhtE1WPEqf4M=;
 b=OQK6mhjm8tBQ+6sunzqdPfMrh2neL06Krtnq/RqwkkqzueVVh9bhYc3kTcBU8g2iQ8
 VPFind5420Qh4EipNTvUFWchZdiIGvk9V6OfK+HDwOUk4JIpjGeCO4I3w8acss2niz74
 dLYXHLa7a26YIOTyRH7EPK1ZC6xYRHoabzF8GPmf2S93wxoQqLNEUSuAiYCKBkFFOeHf
 6j6D7xR17VZVgez7MV0cqf0qHRyQXq9YttZDBWYWxQhwqzCRB5XTt+KnNnrHMQuG2ky7
 aMuxj0Fi0VNUnmRHCtDyyW2kt/DdRzeVZThsYpbE18bJ9t/2CCvjdbg1EkhwVZez/dIe
 Mazg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718057114; x=1718661914;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rP+ricIK5YBlNx+/fEIyVLa5KkTZrxTMhtE1WPEqf4M=;
 b=M5QCRrDCkAJB9i3J9wJV/RE2MZz7V30qu0wJNpNzk6IBDxrZwpXjdBW7LS/XsydVSi
 WLjxRQ1/kHL+0kyewqcrKb1urbDrq7TD/fJAmlSRUZ5f0UcEAWkBioDllcBCo51e3yG/
 7+s8V6GyR3OpcRdE0fUxLOP2wqjwGeJ/VI47wZFwk3pWvHEjoMZiAVdfVaJPf0uvrQZe
 k/yaD+Sg7tGqxPh3NJnZ8HOmo5wyVrQfk387h9Xp4q9SpRCSoN5EBhJ55RUp444GSsmt
 G0XHoXl8LrX7TEz4xusQErVMGmWhhOip5J2ebYrp0tJXIcoBi8pUyc1M2htXX4IcmBgt
 dlrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCULUXDkt2j/3w9sCVjHGawUv9pVQG1BLK6/tNlk37KQipbQqv1gvkKhWO9q+/xSwDqlLQio+m+pLfGl5ayAl/4/QDQAGl1VtyAT8qwYkkLUWmPVpyrnp15BbpsyEHKf6o4GEEuat4icOzJbkqgXEA==
X-Gm-Message-State: AOJu0Yyxv0NNZLjyQXWdAVOqVHzfN/9XdQeci9lb1b8g/47bqqHX0q4A
 n+5i8UdxRAt3LiwbaiIOAft9zZkAwxFaJEYwYaThhUwBPJa3e5e4x7L6XRrdfEf6ja0vCnOQ4R3
 I/bG0c30JD3Z8TL9hIHoB4F6bNTU=
X-Google-Smtp-Source: AGHT+IGQ20EsaNML79UmilV2KhIHb9TaWTviOWcBxEXXPuuWWdBV50/ZYy5/0HVkaRbg9Sl0MYe/UbHQP7ro8jTYxgU=
X-Received: by 2002:ad4:4b30:0:b0:6b0:6370:28d4 with SMTP id
 6a1803df08f44-6b063702b48mr99825636d6.6.1718057114072; Mon, 10 Jun 2024
 15:05:14 -0700 (PDT)
MIME-Version: 1.0
References: <CABXGCsNptxsQO=5=qi-JYiFX=rX8Ok5inK80Gn0qrUFWbtBGng@mail.gmail.com>
 <CABXGCsN=9UFvGgKztzkkAM1c8cVN-h=TKLLxWhKgTm11h+H-eg@mail.gmail.com>
 <907df295-61b2-4cb4-9bcc-608d1ff2cf18@leemhuis.info>
In-Reply-To: <907df295-61b2-4cb4-9bcc-608d1ff2cf18@leemhuis.info>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Tue, 11 Jun 2024 03:05:02 +0500
Message-ID: <CABXGCsMRb3Lx=twRyi75MqgTEfMwxsEwTQg-MR0GNconhDt0pA@mail.gmail.com>
Subject: Re: 6.10/bisected/regression - commits bc87d666c05 and 6d4279cb99ac
 cause appearing green flashing bar on top of screen on Radeon 6900XT and 120Hz
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Rodrigo.Siqueira@amd.com, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
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

On Fri, Jun 7, 2024 at 5:29=E2=80=AFPM Linux regression tracking (Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
> [CCing the other amd drm maintainers]
>
> Mikhail: are those details in any way relevant? Then in the future best
> leave them out (or make things easier to follow), they make the bug
> report confusing and sounds like this is just a bug, when it fact from
> your bisection is sounds like this is a regression.

Apologies if my pre-story is confused. I just wanna say I completely
moved to the 7900XTX more than a year ago and I was surprised to see
this regression on the old 6900XT. An accident helped me find this
issue because I didn't plan to use old hardware.

--=20
Best Regards,
Mike Gavrilov.
