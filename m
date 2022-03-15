Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7C24D90F2
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 01:11:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11FAB10E28D;
	Tue, 15 Mar 2022 00:11:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3007010E33C
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Mar 2022 00:11:40 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id s29so8753813lfb.13
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 17:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wKU4ZRqHh+/7R0KNuwH0gJELjq2wS0wK12KdzbWieg8=;
 b=pdvGf9PQdPL+jc2z0MSpu+kjnnZ0nHo4cryyXO4GFzrOWzzVTepjpBoNHTaE5+75bw
 d4VQEWt7imtT/TZ1UoujoFiquSI+9E7m+ThkkWoyWi+NQdu+QjPDRjH5KIfNJ/ZJCqHe
 wjyXN2uVrnZm+UyCFSacS1mv7NDERQ6PhQESj4QO2FkimAccprmrU6pc52zKBsITFDja
 gC5Oaweu+0IukaAZaELGkgb/0HwzwXkztXvDRCSedoxtmzVa5na/Iqy+oufxaPnjMp//
 X2NpOHkJ2Xep3wu3lyieE5LytahX0zC0ab4HUWMmTOWR6NF6gC0IihKhyOGQSkwmUu/9
 EmUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wKU4ZRqHh+/7R0KNuwH0gJELjq2wS0wK12KdzbWieg8=;
 b=JD27P9OWIJ7+jbAxcOWID+NWfwpZdgREDuvEYVG0Z5rcPajeSQSD6WT4e0Y9GmDlCP
 avNsfG1g49wuifnwgl8hyS+oxTakLYNQn4ESVHiUEfsW072CB2o6nRo8G0d4JLiPjLyJ
 dbwv2apDPO4zIFH8mhZYaDBk6m4WEWrtd9oL5lwFfvPk6M/R6SEyAn1fVSCD3VwqcKMy
 ynT0GwTIy4PX7qETpojld5OaBd7EFYBwQX7cAG7jvqAjFSLgkdnKYsDpLzD4xH6vgydW
 x8wdW+MMDLbMgzuLKX4LPMWotvtzT2tIDJlPfaKMdhnjdjYgtwi1Vi4fP7YtxT0IMuv5
 hBJQ==
X-Gm-Message-State: AOAM532QreS9ptu5OAv67Rkso0UUXK88GpO2yBNTHmiz4y7QL7zSvaM0
 h88PFpvjje06/4preu01xhKq001c1bWYyEvCOmqlMw==
X-Google-Smtp-Source: ABdhPJxPtvXRGpRay/asNi1i55O48lEOmE5yWTDcG4DlXbCoDcVr3r6f/V+w4+w607DlldBSh6to9lYM41nQDiqqXho=
X-Received: by 2002:ac2:5fe3:0:b0:448:5ba2:445f with SMTP id
 s3-20020ac25fe3000000b004485ba2445fmr15394525lfg.682.1647303098171; Mon, 14
 Mar 2022 17:11:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220309165222.2843651-1-tjmercier@google.com>
 <20220309165222.2843651-8-tjmercier@google.com>
 <CAHRSSEy5_h9LJB4q5_OJA7fSq=ROo68UaK+hdPz-Vj-wac1Qhg@mail.gmail.com>
 <CABdmKX1G0Rwmz7=BP1ER+TmtrnkGiE0nROsPTHKxnj=6bHhY3Q@mail.gmail.com>
In-Reply-To: <CABdmKX1G0Rwmz7=BP1ER+TmtrnkGiE0nROsPTHKxnj=6bHhY3Q@mail.gmail.com>
From: Todd Kjos <tkjos@google.com>
Date: Mon, 14 Mar 2022 17:11:25 -0700
Message-ID: <CAHRSSEx0ggFW5JqvQKJLzOLsSK4A4gERM62aXNU6XVkJn8QK7Q@mail.gmail.com>
Subject: Re: [RFC v3 7/8] binder: use __kernel_pid_t and __kernel_uid_t for
 userspace
To: "T.J. Mercier" <tjmercier@google.com>
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

On Mon, Mar 14, 2022 at 4:45 PM T.J. Mercier <tjmercier@google.com> wrote:
>
> On Thu, Mar 10, 2022 at 11:33 AM Todd Kjos <tkjos@google.com> wrote:
> >
> > On Wed, Mar 9, 2022 at 8:52 AM T.J. Mercier <tjmercier@google.com> wrot=
e:
> > >
> > > The kernel interface should use types that the kernel defines instead=
 of
> > > pid_t and uid_t, whose definiton is owned by libc. This fixes the hea=
der
> > > so that it can be included without first including sys/types.h.
> > >
> > > Signed-off-by: T.J. Mercier <tjmercier@google.com>
> > > ---
> > >  include/uapi/linux/android/binder.h | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/include/uapi/linux/android/binder.h b/include/uapi/linux=
/android/binder.h
> > > index 169fd5069a1a..aa28454dbca3 100644
> > > --- a/include/uapi/linux/android/binder.h
> > > +++ b/include/uapi/linux/android/binder.h
> > > @@ -289,8 +289,8 @@ struct binder_transaction_data {
> > >
> > >         /* General information about the transaction. */
> > >         __u32           flags;
> > > -       pid_t           sender_pid;
> > > -       uid_t           sender_euid;
> > > +       __kernel_pid_t  sender_pid;
> > > +       __kernel_uid_t  sender_euid;
> >
> > Are we guaranteed that this does not affect the UAPI at all? Userspace
> > code using this definition will have to run with kernels using the old
> > definition and visa-versa.
>
> A standards compliant userspace should be expecting a signed integer
> type here. So the only way I can think userspace would be affected is
> if:
> 1) pid_t is a long AND
> 2) sizeof(long) > sizeof(int) AND
> 3) Consumers of the pid_t definition actually attempt to mutate the
> result to make use of extra bits in the variable (which are not there)
>
> This seems extremely unlikely. For instance just on the topic of the
> first item, all of the C library implementations with pid_t
> definitions linked here use an int, except for Bionic which typdefs
> pid_t to __kernel_pid_t and Sortix which uses long.
> https://wiki.osdev.org/C_Library
>
> However I would argue this is already broken and should count as a bug
> fix since I can't do this:
>
> $ cat binder_include.c ; gcc binder_include.c
> #include <linux/android/binder.h>
> int main() {}
> In file included from binder_include.c:1:
> /usr/include/linux/android/binder.h:291:9: error: unknown type name =E2=
=80=98pid_t=E2=80=99
>   291 |         pid_t           sender_pid;
>       |         ^~~~~
> /usr/include/linux/android/binder.h:292:9: error: unknown type name =E2=
=80=98uid_t=E2=80=99
>   292 |         uid_t           sender_euid;
>       |         ^~~~~
>
> This is also the only occurrence of pid_t in all of
> include/uapi/linux. All 40+ other uses are __kernel_pid_t, and I don't
> see why the binder header should be different.

It looks like those other cases used to be pid_t, but were changed to
__kernel_pid_t.

Acked-by: Todd Kjos <tkjos@google.com>

>
>
> >
> > >         binder_size_t   data_size;      /* number of bytes of data */
> > >         binder_size_t   offsets_size;   /* number of bytes of offsets=
 */
> > >
> > > --
> > > 2.35.1.616.g0bdcbb4464-goog
> > >
