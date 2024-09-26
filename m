Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A16C987865
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 19:35:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF95F10EBBE;
	Thu, 26 Sep 2024 17:35:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="e1ov4yc/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5A6710EBBE
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 17:35:45 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-5389917ef34so1424181e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 10:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727372144; x=1727976944; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xtR89bH5Z//239xnT5kCrki/umqFGhowZSxev9N5vn4=;
 b=e1ov4yc/L6Btk3et/WSwSSsP9ix19UlU4GGksoLyQR6E1HQqHpQKlJspH24tziAURy
 e+aVJ6g4HXvXsyhx5vVxOtcpFkwa1WV67QJA//VvgPh2Pm4x3ytTb4g2+FM7UdxjDofP
 qA1RdeFIC0esu/vj2eWexUm5MCvKaajWotCpVcr4lXK7kIAy2Vzd9lpfFlZhlSQHbzmk
 Inhx8oq9FdNbNOioUd5XnPNvf6VFoEaV7JIk4ODuJyf1Vf0LjSQS5+dIMaClIN7JxQgI
 kHwtYViwERLwKvz7YKKZO31nOO4AdO5247hM7eI0od9fQncCiBU06qN3cZKIYClu7eg9
 33qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727372144; x=1727976944;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xtR89bH5Z//239xnT5kCrki/umqFGhowZSxev9N5vn4=;
 b=mngz223PsT06m01kmYApPlPs215cH3SkTRXnI+VQhHXLaaLKR8dTaKxGNqJOdmWFjt
 rakiOcBwn59xAIZ24oDS1PcSBGOWkVR422X664Qk/yMYtXJZYx3zowGuZRtgJT7id2wt
 jyULGP8xLBzkNmWzdCoquJV2nJVxajsTZ07B5Da2KeXdt0j+2RtTH97T0RppRT23hjnl
 brWW9LSvnmVDZnNQcrLxfqem6m4yNMRhKCQerDcOhUKupk92mLSMWVv7ZnkZsP7CmakB
 7RRHynz7XXBUHsroTYDjnytObNi+ALmNcADvfYcTGyPNkDBDO1hLH9s0U9olYsAvshag
 Nalw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyoSPC2Tf7Oe82Ork2LUy3olwXxYA3zZZ1N298U3lTf/51Hr0C+y/ejVJUi/xPy57YaonDmRTl86I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzVvmjlq/89ix7XrgFh+ht5Aq4ch/JBDLvgtfgTBQs2H7g3ovln
 dQMSecr74YcsIBkQy5o507ZvjH/j5YAVmARZV58RWN+K+qoC7UBuEVmq19hUfxf3fC6HSeyeZCz
 6IF3XVxxlwjQax7brRejdU7bOijDANfoipbJ8Nw==
X-Google-Smtp-Source: AGHT+IHf75DxkntTvBkZGDev4x95K+giFUe8FZhnZLvsyGMJj8v524+ofSRAoRSBODfKCXI8yelsxdzzM7LxitSB/UQ=
X-Received: by 2002:a05:6512:2310:b0:536:536a:3854 with SMTP id
 2adb3069b0e04-5389fc70f56mr217205e87.60.1727372143545; Thu, 26 Sep 2024
 10:35:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240817025624.13157-1-laoar.shao@gmail.com>
 <20240817025624.13157-6-laoar.shao@gmail.com>
In-Reply-To: <20240817025624.13157-6-laoar.shao@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 26 Sep 2024 20:35:06 +0300
Message-ID: <CAHp75VdpG=yQVaJLR3J5puwj4FYWtXzaHkC1TdmiqfJu1s9PpA@mail.gmail.com>
Subject: Re: [PATCH v7 5/8] mm/util: Fix possible race condition in kstrdup()
To: Yafang Shao <laoar.shao@gmail.com>
Cc: akpm@linux-foundation.org, torvalds@linux-foundation.org, alx@kernel.org, 
 justinstitt@google.com, ebiederm@xmission.com, alexei.starovoitov@gmail.com,
 rostedt@goodmis.org, catalin.marinas@arm.com, 
 penguin-kernel@i-love.sakura.ne.jp, linux-mm@kvack.org, 
 linux-fsdevel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 audit@vger.kernel.org, linux-security-module@vger.kernel.org, 
 selinux@vger.kernel.org, bpf@vger.kernel.org, netdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
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

On Thu, Sep 26, 2024 at 7:44=E2=80=AFPM Yafang Shao <laoar.shao@gmail.com> =
wrote:
>
> In kstrdup(), it is critical to ensure that the dest string is always
> NUL-terminated. However, potential race condidtion can occur between a

condition

> writer and a reader.
>
> Consider the following scenario involving task->comm:
>
>     reader                    writer
>
>   len =3D strlen(s) + 1;
>                              strlcpy(tsk->comm, buf, sizeof(tsk->comm));
>   memcpy(buf, s, len);
>
> In this case, there is a race condition between the reader and the
> writer. The reader calculate the length of the string `s` based on the

calculates

> old value of task->comm. However, during the memcpy(), the string `s`
> might be updated by the writer to a new value of task->comm.
>
> If the new task->comm is larger than the old one, the `buf` might not be
> NUL-terminated. This can lead to undefined behavior and potential
> security vulnerabilities.
>
> Let's fix it by explicitly adding a NUL-terminator.

memcpy() is not atomic AFAIK, meaning that the new string can be also
shorter and when memcpy() already copied past the new NUL. I would
amend the explanation to include this as well.

...

> +               /* During memcpy(), the string might be updated to a new =
value,
> +                * which could be longer than the string when strlen() is
> +                * called. Therefore, we need to add a null termimator.

/*
 * The wrong comment style. Besides that a typo
 * in the word 'terminator'. Please, run codespell on your changes.
 * Also use the same form: NUL-terminator when you are talking
 * about '\0' and not NULL.
 */

> +                */


--=20
With Best Regards,
Andy Shevchenko
