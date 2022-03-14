Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 063094D9092
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 00:45:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F019E10E311;
	Mon, 14 Mar 2022 23:45:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E57010E311
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 23:45:41 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id qx21so37528130ejb.13
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 16:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mMcKlcLkl25csYGtmWB99GmowZ54MQeoPUbWxxcyFU0=;
 b=bp+YoIVGfFN/43D3vqHErY1NhIRJApUAhtw6o/hQeIyaDBqIfE66EIhFuNlzouKqsM
 ICMTNUqtiRAq88ITvYxr1uiF5OmdPGah32szvxsrVE8+TbWCoOGxOG6L25aPWaho7kdy
 3FU/jNh6QDkaRKObZiMMOkBlD8Aqv99swKSc8YZ9bFy6T0F/mbML6sVVYqbR6qCMVE6H
 bYhE/ZUbxEYhn6H6a+/VharXFDIBFPo45r3fdwvvEZ51SgbTUi25vilSjvica56rkM6I
 xTjLcOE3UXJzEYpLAj8t0ISFMLBTpHiYS87O0Yj4+2ZJb/rKhYVFzvJMGee+en585/rw
 GBaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mMcKlcLkl25csYGtmWB99GmowZ54MQeoPUbWxxcyFU0=;
 b=39GyRPGJ1bgOwIQ9I1KjNA4RnavR8EjZ94Z6ocgYvWKx0eKU65xixcAZbomtodmt7S
 b7fRnLwCnDffaxmqTYXzRUQWQ+V2g39oXdiyG/EVQ/mx8TVlExwSOQL14Ksr5DoS3/5h
 HsD5wFbFc+eONAKpBmtsv54az3fMD2NifKDoPmPX17hwDmoGo4xo+NMVirU4VglOkME1
 Jgd2+fHABo3oPNAVsmQg79Bxar5sBKTKwZofnY+u68bQPQ4f3xM2hEHEj0KaddlNpvNp
 K46Pq7Db/bbC7BtSOJQ724CxRr/qBBsASg5tp8Eq5xFLCs9lyXGyzTgrwgty+SsORNd8
 ONww==
X-Gm-Message-State: AOAM531nIZ2J1GjUm0fWa2ccqvRYDmzZ/aKONYf9vYl2zk2ejoR/kMYM
 xOeqvcNOJ9rmLY3nkDMGbus39pbbZpLx2GyYIKc/fA==
X-Google-Smtp-Source: ABdhPJzivdKSx3a2ptS01jjlhP74llQ2PdFx6OA83cn+BAtPtg6OtNsv++AhnKe1mUMAW8amvG7lkgIAO9oTvOh6yGc=
X-Received: by 2002:a17:906:5d08:b0:6da:b4ea:937 with SMTP id
 g8-20020a1709065d0800b006dab4ea0937mr20516098ejt.446.1647301539672; Mon, 14
 Mar 2022 16:45:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220309165222.2843651-1-tjmercier@google.com>
 <20220309165222.2843651-8-tjmercier@google.com>
 <CAHRSSEy5_h9LJB4q5_OJA7fSq=ROo68UaK+hdPz-Vj-wac1Qhg@mail.gmail.com>
In-Reply-To: <CAHRSSEy5_h9LJB4q5_OJA7fSq=ROo68UaK+hdPz-Vj-wac1Qhg@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Mon, 14 Mar 2022 16:45:28 -0700
Message-ID: <CABdmKX1G0Rwmz7=BP1ER+TmtrnkGiE0nROsPTHKxnj=6bHhY3Q@mail.gmail.com>
Subject: Re: [RFC v3 7/8] binder: use __kernel_pid_t and __kernel_uid_t for
 userspace
To: Todd Kjos <tkjos@google.com>
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
Cc: Zefan Li <lizefan.x@bytedance.com>, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Kalesh Singh <kaleshsingh@google.com>, Joel Fernandes <joel@joelfernandes.org>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Kenny.Ho@amd.com, Jonathan Corbet <corbet@lwn.net>,
 Martijn Coenen <maco@android.com>, Laura Abbott <labbott@redhat.com>,
 linux-media@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Todd Kjos <tkjos@android.com>, linaro-mm-sig@lists.linaro.org,
 Tejun Heo <tj@kernel.org>, cgroups@vger.kernel.org,
 Suren Baghdasaryan <surenb@google.com>, Christian Brauner <brauner@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Liam Mark <lmark@codeaurora.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Johannes Weiner <hannes@cmpxchg.org>,
 Hridya Valsaraju <hridya@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 10, 2022 at 11:33 AM Todd Kjos <tkjos@google.com> wrote:
>
> On Wed, Mar 9, 2022 at 8:52 AM T.J. Mercier <tjmercier@google.com> wrote:
> >
> > The kernel interface should use types that the kernel defines instead o=
f
> > pid_t and uid_t, whose definiton is owned by libc. This fixes the heade=
r
> > so that it can be included without first including sys/types.h.
> >
> > Signed-off-by: T.J. Mercier <tjmercier@google.com>
> > ---
> >  include/uapi/linux/android/binder.h | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/include/uapi/linux/android/binder.h b/include/uapi/linux/a=
ndroid/binder.h
> > index 169fd5069a1a..aa28454dbca3 100644
> > --- a/include/uapi/linux/android/binder.h
> > +++ b/include/uapi/linux/android/binder.h
> > @@ -289,8 +289,8 @@ struct binder_transaction_data {
> >
> >         /* General information about the transaction. */
> >         __u32           flags;
> > -       pid_t           sender_pid;
> > -       uid_t           sender_euid;
> > +       __kernel_pid_t  sender_pid;
> > +       __kernel_uid_t  sender_euid;
>
> Are we guaranteed that this does not affect the UAPI at all? Userspace
> code using this definition will have to run with kernels using the old
> definition and visa-versa.

A standards compliant userspace should be expecting a signed integer
type here. So the only way I can think userspace would be affected is
if:
1) pid_t is a long AND
2) sizeof(long) > sizeof(int) AND
3) Consumers of the pid_t definition actually attempt to mutate the
result to make use of extra bits in the variable (which are not there)

This seems extremely unlikely. For instance just on the topic of the
first item, all of the C library implementations with pid_t
definitions linked here use an int, except for Bionic which typdefs
pid_t to __kernel_pid_t and Sortix which uses long.
https://wiki.osdev.org/C_Library

However I would argue this is already broken and should count as a bug
fix since I can't do this:

$ cat binder_include.c ; gcc binder_include.c
#include <linux/android/binder.h>
int main() {}
In file included from binder_include.c:1:
/usr/include/linux/android/binder.h:291:9: error: unknown type name =E2=80=
=98pid_t=E2=80=99
  291 |         pid_t           sender_pid;
      |         ^~~~~
/usr/include/linux/android/binder.h:292:9: error: unknown type name =E2=80=
=98uid_t=E2=80=99
  292 |         uid_t           sender_euid;
      |         ^~~~~

This is also the only occurrence of pid_t in all of
include/uapi/linux. All 40+ other uses are __kernel_pid_t, and I don't
see why the binder header should be different.


>
> >         binder_size_t   data_size;      /* number of bytes of data */
> >         binder_size_t   offsets_size;   /* number of bytes of offsets *=
/
> >
> > --
> > 2.35.1.616.g0bdcbb4464-goog
> >
