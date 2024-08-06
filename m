Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7CB9487C0
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 05:01:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80D2D10E07B;
	Tue,  6 Aug 2024 03:01:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="azGQTPBO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC83110E07B
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2024 03:01:15 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id
 6a1803df08f44-6bb96ef0e8eso1204626d6.2
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2024 20:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722913275; x=1723518075; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KZR4E8D89jwg4yvmIjI2zPRIKoU2AHuL/vFtEuJY3nU=;
 b=azGQTPBO1/sXlXgqVOva2WUr+ihtqwdv+34CJbLJBdESdKKvdoqdYWO2Ui5kOtoNzF
 8fnvTdLPqSbVwr3zg0WDMhpIN1QMZmbhJWoFV+6BTHT3PDBmHNBM69P54QFBJT4gcjKq
 oRJ0usvjWw1+yJwVRXggI3iwUm4ed9/ViwdVi0qYMEFSPrKV/pXtOT9iP7PAx5j3lwDZ
 lHWqZVGNPkTS+A90IIKi5gc0I+qi+4RqIVFun4OY2979ixMSpdFpy50C+acyQn4M4VjH
 1ridHNT2DI8cvGSe9grbXFAUsZJjDBWiPlyXovzOlGxKmUIDGtjd9sqYpJqfkosZ45II
 oN/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722913275; x=1723518075;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KZR4E8D89jwg4yvmIjI2zPRIKoU2AHuL/vFtEuJY3nU=;
 b=VHiRHyLFnoEYPDpOv4Zg0GBvYWo7hUvzgF6yvY+D44aNcNwS7frqEtb6ZjKCQydxUK
 drLP6qt+p5QHBrk1DOWQ8R2fPxMG/vB+Lu6hRHkZLvRPpIZfMmcaNYClMc0FwBltDwTH
 HKmzydLYfdkg8W1j2XoCj1TmBIXsPwEpUNaYtOvTNR5WCuWVh14Jun52XtDGOJQRjoIA
 eXBDEsEmhYnGVhmxgecEfjd5ehyp0Lp+jaBFN8XhVuO5kGeAlaVKDZGF5pHZTdQARbhu
 mYb97842DGh8W2mWKGBLeGPceZJDf1p4wyEUz2e2qLDfKbaQdLaah+NIbWxvNuKiYMYT
 c49A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwqVbaULC2Sa4Aqg2aYxWwPXm22bB6mqKjoBgXn1DGtNcEA9w8E6rgSuyf342sC/QGpOQRLvkoawizC0FLz10KtWDJPHs35GBqLJWO6bNQ
X-Gm-Message-State: AOJu0YzHhmVZUkh8J7WY5/tJ6bPFxAVPpKUyrWKUY+jLjZv8f/csNWaH
 3zhgmCH+L8/nXyXHl/KeXCEKldQPA+UQwX010uYi/1QvOtMieT10Zzzq3chBT1iIDLnh5B2yFP1
 oydJh6qr+Js2dSmqLvwkD5QsXRbE=
X-Google-Smtp-Source: AGHT+IH5UetJykoQ+AA9lUd/PNGcF9CreQ+CKGIYQr4sa6NtWmr6AOpHiEKJTnDf738MR+GOImNMUHgXoQCs1IfVbM8=
X-Received: by 2002:a05:6214:440b:b0:6b7:aed6:8470 with SMTP id
 6a1803df08f44-6bb983f7560mr162583526d6.28.1722913274688; Mon, 05 Aug 2024
 20:01:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240804075619.20804-1-laoar.shao@gmail.com>
 <CAHk-=whWtUC-AjmGJveAETKOMeMFSTwKwu99v7+b6AyHMmaDFA@mail.gmail.com>
In-Reply-To: <CAHk-=whWtUC-AjmGJveAETKOMeMFSTwKwu99v7+b6AyHMmaDFA@mail.gmail.com>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Tue, 6 Aug 2024 11:00:36 +0800
Message-ID: <CALOAHbCVk08DyYtRovXWchm9JHB3-fGFpYD-cA+CKoAsVLNmuw@mail.gmail.com>
Subject: Re: [PATCH v5 0/9] Improve the copy of task comm
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: akpm@linux-foundation.org, ebiederm@xmission.com, 
 alexei.starovoitov@gmail.com, rostedt@goodmis.org, catalin.marinas@arm.com, 
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

On Tue, Aug 6, 2024 at 5:28=E2=80=AFAM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Sun, 4 Aug 2024 at 00:56, Yafang Shao <laoar.shao@gmail.com> wrote:
> >
> > There is a BUILD_BUG_ON() inside get_task_comm(), so when you use
> > get_task_comm(), it implies that the BUILD_BUG_ON() is necessary.
>
> Let's just remove that silly BUILD_BUG_ON(). I don't think it adds any
> value, and honestly, it really only makes this patch-series uglier
> when reasonable uses suddenly pointlessly need that double-underscore
> version..
>
> So let's aim at
>
>  (a) documenting that the last byte in 'tsk->comm{}' is always
> guaranteed to be NUL, so that the thing can always just be treated as
> a string. Yes, it may change under us, but as long as we know there is
> always a stable NUL there *somewhere*, we really really don't care.
>
>  (b) removing __get_task_comm() entirely, and replacing it with a
> plain 'str*cpy*()' functions
>
> The whole (a) thing is a requirement anyway, since the *bulk* of
> tsk->comm really just seems to be various '%s' things in printk
> strings etc.
>
> And once we just admit that we can use the string functions, all the
> get_task_comm() stuff is just unnecessary.
>
> And yes, some people may want to use the strscpy_pad() function
> because they want to fill the whole destination buffer. But that's
> entirely about the *destination* use, not the tsk->comm[] source, so
> it has nothing to do with any kind of "get_task_comm()" logic, and it
> was always wrong to care about the buffer sizes magically matching.
>
> Hmm?

One concern about removing the BUILD_BUG_ON() is that if we extend
TASK_COMM_LEN to a larger size, such as 24, the caller with a
hardcoded 16-byte buffer may overflow. This could be an issue with
code in include/linux/elfcore.h and include/linux/elfcore-compat.h,
posing a risk. However, I believe it is the caller's responsibility to
explicitly add a null terminator if it uses a fixed buffer that cannot
be changed. Therefore, the following code change is necessary:

diff --git a/fs/binfmt_elf.c b/fs/binfmt_elf.c
index 5ae8045f4df4..e4b0b7cf0c1f 100644
--- a/fs/binfmt_elf.c
+++ b/fs/binfmt_elf.c
@@ -1579,6 +1579,7 @@ static int fill_psinfo(struct elf_prpsinfo
*psinfo, struct task_struct *p,
        SET_GID(psinfo->pr_gid, from_kgid_munged(cred->user_ns, cred->gid))=
;
        rcu_read_unlock();
        get_task_comm(psinfo->pr_fname, p);
+       psinfo->pr_fname[15] =3D '\0';

        return 0;
 }

However, it is currently safe to remove the BUILD_BUG_ON() since
TASK_COMM_LEN is still 16.

--
Regards
Yafang
