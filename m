Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 887A3909386
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 22:43:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9127010EE68;
	Fri, 14 Jun 2024 20:43:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jc72K1Vz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CE0910E1F5
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 11:46:18 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id
 6a1803df08f44-6b06e63d288so10618766d6.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 04:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718365577; x=1718970377; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YhZTA0P9EB3vGdWtMZhD6+owrd3MXBYsoXYXThbWv8c=;
 b=jc72K1VzdYs1rhqgmCfnSvtlV5GN0aXrYnWm+tG5/daRfd5ZcruhoqLHNy/8IK7qym
 EvC/oGC2zZeqRNhluFlb97f71pf0xAljaDOj90awIePHveDj+diKhQ1JCS9OVr5C2Rvs
 rV7iuPKJeEseeWQPmDJ6vfdtuYOhRxN61dxJMcS1MeptRWtY5mmRb5KyIoE3Aazu2aPW
 hDcgCg2KA4bmxUyBKPaCXdmRv0w4aR3+6FXV6wL09VuXB2ZxClPEwNT6Cl3G7m6SC+mm
 ja0T66s8CLLam2o8X1qFtEfAt+NfoJdzo/+jvmk8T4pgKU9V0PHr3IMDRvSqqN0O7qcX
 sJ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718365577; x=1718970377;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YhZTA0P9EB3vGdWtMZhD6+owrd3MXBYsoXYXThbWv8c=;
 b=AVr7ZBufbTR3xsW/haBq+xx84g4sf9Nx/Z+wPOrFb4OrDzNnYWm/Wm26ukNGJCNRBF
 1IuyU4jMF0UBoYki18+v8iida1LUXbzIth6AJAouyUPh3qOdrK4dkzIPQDKC0gx1js8I
 TOIUHsX73SLZE2gfzmqvrt2kJhARDSvwfcGNTkJQhGUIhMJbnWNF+WrEYMqTcy2pQ7Tn
 pGsoAUdiBMh4mzyv82VCXR3mby0J5QV8c5rznxUaJNRqSUBavQcBO4O+zXcxj8ZIG+6G
 e/Hv5Hn0nkXAHZk+Fv40jW4bmXh61ecLeZGv6vuJDsMdZWPWO2JdtsbVQroxJdYo0VBc
 NblA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVz1t+InJXa6AFOv+Zu4gHHHsqpb5OQsuDgeb7mP5vq5xC5KXMJXsHktFg8jd+JSIS0IzoVjWEMOpI0F7KN+3LY07biQKSDUR1FOyxdIVC2
X-Gm-Message-State: AOJu0YwAlMjovCEDRfFmLFNq0OnfWegnTfHahpQCFwoajZh19/SDDwza
 nx/YXcGZyuozia41hw9QvKQhW0re6Oq703cp/CPnjAn0aWZ4SypsVAuOQqptyt8H+QoJPUoUoJV
 udfKoKC6hYrJHCbu3IYvVKI0ql9Q=
X-Google-Smtp-Source: AGHT+IFaFnMNLjJYSYrMKDyE9tX4zgL8n/jhcGz01q5yiY/JXZZX7mC42E5kkQyr9LsVQPUZ9vqhx86BbZKpLx0rTA8=
X-Received: by 2002:a0c:c203:0:b0:6b0:77fb:8f19 with SMTP id
 6a1803df08f44-6b2afd6cb2cmr22836486d6.47.1718365577138; Fri, 14 Jun 2024
 04:46:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240613023044.45873-1-laoar.shao@gmail.com>
 <20240613023044.45873-7-laoar.shao@gmail.com>
 <Zmqvu-1eUpdZ39PD@arm.com>
 <CALOAHbB3Uiwsp2ieiPZ-_CKyZPgW6_gF_y-HEGHN3KWhGh0LDg@mail.gmail.com>
 <ZmwiEbCcovJ8fdr5@arm.com>
In-Reply-To: <ZmwiEbCcovJ8fdr5@arm.com>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Fri, 14 Jun 2024 19:45:40 +0800
Message-ID: <CALOAHbAvUPf5_ryDNm=Ujqmg_XycK0Sh23dr_62gFch9NhRGng@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] mm/kmemleak: Replace strncpy() with
 __get_task_comm()
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: torvalds@linux-foundation.org, ebiederm@xmission.com, 
 alexei.starovoitov@gmail.com, rostedt@goodmis.org, linux-mm@kvack.org, 
 linux-fsdevel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 audit@vger.kernel.org, linux-security-module@vger.kernel.org, 
 selinux@vger.kernel.org, bpf@vger.kernel.org, netdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 14 Jun 2024 20:43:41 +0000
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

On Fri, Jun 14, 2024 at 6:57=E2=80=AFPM Catalin Marinas <catalin.marinas@ar=
m.com> wrote:
>
> On Thu, Jun 13, 2024 at 08:10:17PM +0800, Yafang Shao wrote:
> > On Thu, Jun 13, 2024 at 4:37=E2=80=AFPM Catalin Marinas <catalin.marina=
s@arm.com> wrote:
> > > On Thu, Jun 13, 2024 at 10:30:40AM +0800, Yafang Shao wrote:
> > > > Using __get_task_comm() to read the task comm ensures that the name=
 is
> > > > always NUL-terminated, regardless of the source string. This approa=
ch also
> > > > facilitates future extensions to the task comm.
> > > >
> > > > Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
> > > > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > > > Cc: Andrew Morton <akpm@linux-foundation.org>
> > > > ---
> > > >  mm/kmemleak.c | 8 +-------
> > > >  1 file changed, 1 insertion(+), 7 deletions(-)
> > > >
> > > > diff --git a/mm/kmemleak.c b/mm/kmemleak.c
> > > > index d5b6fba44fc9..ef29aaab88a0 100644
> > > > --- a/mm/kmemleak.c
> > > > +++ b/mm/kmemleak.c
> > > > @@ -663,13 +663,7 @@ static struct kmemleak_object *__alloc_object(=
gfp_t gfp)
> > > >               strncpy(object->comm, "softirq", sizeof(object->comm)=
);
> > > >       } else {
> > > >               object->pid =3D current->pid;
> > > > -             /*
> > > > -              * There is a small chance of a race with set_task_co=
mm(),
> > > > -              * however using get_task_comm() here may cause locki=
ng
> > > > -              * dependency issues with current->alloc_lock. In the=
 worst
> > > > -              * case, the command line is not correct.
> > > > -              */
> > > > -             strncpy(object->comm, current->comm, sizeof(object->c=
omm));
> > > > +             __get_task_comm(object->comm, sizeof(object->comm), c=
urrent);
> > > >       }
> > >
> > > You deleted the comment stating why it does not use get_task_comm()
> > > without explaining why it would be safe now. I don't recall the detai=
ls
> > > but most likely lockdep warned of some potential deadlocks with this
> > > function being called with the task_lock held.
> > >
> > > So, you either show why this is safe or just use strscpy() directly h=
ere
> > > (not sure we'd need strscpy_pad(); I think strscpy() would do, we jus=
t
> > > need the NUL-termination).
> >
> > The task_lock was dropped in patch #1 [0]. My apologies for not
> > including you in the CC for that change. After this modification, it
> > is now safe to use __get_task_comm().
> >
> > [0] https://lore.kernel.org/all/20240613023044.45873-2-laoar.shao@gmail=
.com/
>
> Ah, great. For this patch:
>
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>
>
> You may want to add a comment in the commit log that since
> __get_task_comm() no longer takes a long, it's safe to call it from
> kmemleak.

I will add it. Thanks for your suggestion.

--=20
Regards
Yafang
