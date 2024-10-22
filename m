Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1423F9AB3B0
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 18:19:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 810EF10E1CC;
	Tue, 22 Oct 2024 16:19:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="A3YJ3xq2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADDE210E1CC
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 16:19:18 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-a99e3b3a411so1114186766b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 09:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1729613957; x=1730218757;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O010jrXbVVYc/oBTmTv82BWnbf0mEg5IgHol5Aj0+vg=;
 b=A3YJ3xq2SBSE5x45G2flFAqSwJWZx9lVC/lK/8uEmmrPJqg6PHySM4lA8KBKiYgOQC
 vNZws/0b+ccXN78gLT2TXGXUIzS/gIg8ERUo9FCulLFFvuIvESzulFD2HSie94POEhZc
 0NPViv8FhedM1iHZK0Z5uBmwP4diaR3JBXR5UjnB23WUAhArsxm1NBJe/6Ka2tGODDcf
 2o/dAq7pqs4UByQZ+gQyc3vk97etNbi+Nbxbva9XWb5i5gOHBJ6WoLI/W1mr/9pTGgOi
 y1robtC4/jL+w/wx3RqIEnsD0DwlFYG6JmTol6Ly0SwxIC/Q08Ckrwr1Vbkk7fd7hBNN
 HfhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729613957; x=1730218757;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O010jrXbVVYc/oBTmTv82BWnbf0mEg5IgHol5Aj0+vg=;
 b=cc9KJTMG8lP+CjJaGrvqtcYpPitahfNo7ILPepzh/wKH2Je6S/pvC+7tKPkD/24diI
 DGqloP9qNVQl5OWwAQgqZcvc9HjK8pyxKRl8Rkx9SHiGaBZy4ClBaDdOCqJPfS2c/Gv1
 WXAqfnTLo3qohPCYh6Nkc0IGwvCSrJ/DdhLDE48fG82wZ2j6sqA9N3a+XuHUUSREXC1W
 osbEgJluf5XzBmYZEtNSqTMyKOOD5C1IPIe/1LqDzNiUgfOOdxgb7V0B6MNzaSKqKF+/
 IEFCOH62hN7F87SB8hU53Y3Q/ciHB4dyUf633CwOr3Jg30xFaSeqy5qAgq+mvjZQVg/Y
 CiLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6uuHZpJBM6I9otiR0J9nBP5oczviMCUZNmk/LocFJtQ6VLAHEqJb6PsCDZtB1N+AbNr8q0RZngro=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwDcE4jh8BoSKbIihE7kE5w69/lZ1NO/sETtpYlpigj7xCLuRQG
 LzJVOGdDvWdEO5z3vMQ0qeZcfDnXkd4zPqx4mA9N0oXiu0DbLII5NA5c7hQ5qCQ0mhCf3vrHrp/
 ixGva+C+hS4xz2+joL125Pq14ltyM6b8DG3M=
X-Google-Smtp-Source: AGHT+IE2UWF9akIjKN3CLcsBih/tjrcN+DK2fnaCGfTRq+l4mjlUsUQFO0mOXVfH5O+jRzv/E6HKLsTurAdaP0J2Ixw=
X-Received: by 2002:a17:907:6096:b0:a9a:4b51:9e7 with SMTP id
 a640c23a62f3a-a9aaa53a59amr424231966b.16.1729613956687; Tue, 22 Oct 2024
 09:19:16 -0700 (PDT)
MIME-Version: 1.0
References: <20241022-macaw-of-spectacular-joy-8dcefa@houat>
In-Reply-To: <20241022-macaw-of-spectacular-joy-8dcefa@houat>
From: John Stultz <jstultz@google.com>
Date: Tue, 22 Oct 2024 09:19:05 -0700
Message-ID: <CANDhNCoLgzy=CPBWjBKLiJzRdnf=SS3AgtFJNB-CBYAo=UEQJA@mail.gmail.com>
Subject: Re: Requirements to merge new heaps in the kernel
To: Maxime Ripard <mripard@redhat.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 "T.J. Mercier" <tjmercier@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
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

On Tue, Oct 22, 2024 at 1:38=E2=80=AFAM Maxime Ripard <mripard@redhat.com> =
wrote:
>
> I wanted to follow-up on the discussion we had at Plumbers with John and
> T.J. about (among other things) adding new heaps to the kernel.
>
> I'm still interested in merging a carve-out driver[1], since it seems to =
be
> in every vendor BSP and got asked again last week.
>
> I remember from our discussion that for new heap types to be merged, we
> needed a kernel use-case. Looking back, I'm not entirely sure how one
> can provide that given that heaps are essentially facilities for
> user-space.
>
> Am I misremembering or missing something? What are the requirements for
> you to consider adding a new heap driver?

It's basically the same as the DRM subsystem rules.
https://docs.kernel.org/gpu/drm-uapi.html#open-source-userspace-requirement=
s
ie: There has to be opensource user for it, and the user has to be
more significant than a "toy" implementation (which can be a bit
subjective and contentious when trying to get out of a chicken and egg
loop).

thanks
-john
