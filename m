Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A11493F463
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 13:46:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F80610E39A;
	Mon, 29 Jul 2024 11:46:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DHko7642";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50D0A10E39A
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 11:46:05 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id
 6a1803df08f44-6b7aed340daso20293136d6.3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 04:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722253564; x=1722858364; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nkcVycGOmjZ53vAR9tu+gTOhYnSE5zhPRCcc2FArpjU=;
 b=DHko7642cdYDkbdLMjF3Kkjmv6V9TgINn8c9urZGFslnU6mPVhu01OuU0NbLGwoVPd
 SSJNlKbZb2zcPY8Ip0nCulmlSIDsiVwuPfT7QOYIzn44365gmaOzvD+0ZVOx0L9y6OBV
 Q8Onbg63Xhn7qeuqmbOkWpQ5fu5XDms1i35YDSh2KkKyaumQKxJNINoLHcupstYKF7hV
 xa9I7Mx4A8HF/v2meJ4XpIcYPxywQwRv4IMtXRHvGfoDBe93C4GT879FBSmzaeeXApvL
 4AVUWwAWBB9Tc3KgV/BTAGrNbSjS9oYC0PBoIzm3D4KApYun40f4sQ5rKfdpECybV/Jr
 jkSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722253564; x=1722858364;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nkcVycGOmjZ53vAR9tu+gTOhYnSE5zhPRCcc2FArpjU=;
 b=FJPvanpEyQiDJGsqGEIJId71yLcu8UM4Sr6NgPQ6B4vTvQCp514Kd9n3JFp2hS1QQp
 hH0OYhTwCbZAV0o9jp9QW5l2RDim1F/kzfVWANbvaeTPcqZXze21RM54m5w6Qn7VQPO3
 otbXitUDzTQX2Phtd+GCOeqecdWsX1ONYWxYJ9Va89Z17tmFJGwfGEgV+HF2weyRmCUK
 yuaAHVyn4jwdNEel54ybeN+BMMeKZhqN94uDOxwRArYBnsYxaojKDjWB9LHUqACmAPeO
 jbCSmlmjW5rUQFypHoFFBxRIS0/IsZ1KmpSX61StbSwzFDiNZvFVhL3giLSvtdHx1gd1
 0L3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWad71lL9Md7R8tXceiusNLX3VLWDdf2MND2BJhhyaByfw/sqZtbw9t3I4rNCVLvsWTxKX3TI+vaYn+QB2fdGJcOy+fL01R1M/hP1xMVNi9
X-Gm-Message-State: AOJu0YwDPo7JA4pHMBnWL9HmR3+831Zfo++Vf02xEdL4B/46US7wuYha
 QcqShY2EJ0ZOkls3QaIJHlNT/ltDZQIwZbhFHLslTU+2T+xpqvCmSZVw5Uuas02wt7igYr7v9Lc
 Bh6FeJ4Ab5qixL1q+MsN7UpgH6bw=
X-Google-Smtp-Source: AGHT+IF5UmpKUFOnvoAK9lYxcwohmtfgqa1lFzGyA8Akl+YSskrOYOXqexc6VvI8Xmv0jJTGVagDPu5fB/SRGumTpvw=
X-Received: by 2002:a05:6214:2425:b0:6b7:944f:3cef with SMTP id
 6a1803df08f44-6bb55aa2fc3mr125032596d6.44.1722253564270; Mon, 29 Jul 2024
 04:46:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240729023719.1933-1-laoar.shao@gmail.com>
 <87bk2gzgu0.fsf@intel.com>
In-Reply-To: <87bk2gzgu0.fsf@intel.com>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Mon, 29 Jul 2024 19:45:27 +0800
Message-ID: <CALOAHbCAKEwkDQSmyUqRs-EjM9=aF-QcORr1g=_CnFLoVXsSVg@mail.gmail.com>
Subject: Re: [PATCH resend v4 00/11] Improve the copy of task comm
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: akpm@linux-foundation.org, torvalds@linux-foundation.org, 
 ebiederm@xmission.com, alexei.starovoitov@gmail.com, rostedt@goodmis.org, 
 catalin.marinas@arm.com, penguin-kernel@i-love.sakura.ne.jp, 
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, audit@vger.kernel.org, 
 linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
 bpf@vger.kernel.org, netdev@vger.kernel.org, dri-devel@lists.freedesktop.org
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

On Mon, Jul 29, 2024 at 5:29=E2=80=AFPM Jani Nikula <jani.nikula@linux.inte=
l.com> wrote:
>
> On Mon, 29 Jul 2024, Yafang Shao <laoar.shao@gmail.com> wrote:
> > Hello Andrew,
> >
> > Is it appropriate for you to apply this to the mm tree?
> >
> > Using {memcpy,strncpy,strcpy,kstrdup} to copy the task comm relies on t=
he
> > length of task comm. Changes in the task comm could result in a destina=
tion
> > string that is overflow. Therefore, we should explicitly ensure the des=
tination
> > string is always NUL-terminated, regardless of the task comm. This appr=
oach
> > will facilitate future extensions to the task comm.
>
> Why are we normalizing calling double-underscore prefixed functions all
> over the place? i.e. __get_task_comm().
>
> get_task_comm() is widely used. At a glance, looks like it could be used
> in many of the patches here too.

There is a BUILD_BUG_ON() inside get_task_comm(), so when you use
get_task_comm(), it implies that the BUILD_BUG_ON() is necessary.
However, we don't want to impose this restriction on code where the
length can be dynamically changed.

One use case of get_task_comm() is in code that has already exposed
the length to userspace. In such cases, we specifically add the
BUILD_BUG_ON() to prevent developers from changing it. For more
information, see commit 95af469c4f60 ("fs/binfmt_elf: replace
open-coded string copy with get_task_comm").

--=20
Regards
Yafang
