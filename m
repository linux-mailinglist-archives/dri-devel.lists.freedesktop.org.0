Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B9F6E7A5F
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 15:14:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78DA010E97A;
	Wed, 19 Apr 2023 13:13:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1F3710E97A;
 Wed, 19 Apr 2023 13:13:53 +0000 (UTC)
Received: by mail-qv1-xf33.google.com with SMTP id
 6a1803df08f44-5ef6cd8d50bso3366656d6.1; 
 Wed, 19 Apr 2023 06:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681910032; x=1684502032;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YRldcBVidDTHSdySyAJIkaPyXZDLrSYOn69E5Iym9mk=;
 b=bAbKIJTuPkk+qi/lN+WYch1K0c0RIuMw+qdV3TwUk/FfgMlrEOZXAcdY0ahZ5jGXuX
 T+E2yXekGP1/mtq0OiG5Ltc1eL14hJujvM5RQjLL8kzTCpRfNDEIC2DrIXd83war+CCX
 00Ss/pvGHb0UNIaz2ow4OfH3kEg8DR2fFjTyeDs98cPTijkxezravEiArPeJmWjCQLcA
 qvP2YHvcCozI8zkECl4Ne6ClOb/DSRKQ6aEm28/jZZ7zwIFjxBSDEhPN8pZcDgJsbz7Q
 d9l0+wGTC1g2blCw2IdWA675k+mPUr1ZZPbjISEfB/6RFERK8Hj/5HdtruEHJXsNfM4k
 C9pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681910032; x=1684502032;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YRldcBVidDTHSdySyAJIkaPyXZDLrSYOn69E5Iym9mk=;
 b=IvCDgA5u+QoU9LebiRYW9gqGDOFkf3EX/3N+tz2PlCEKvRGXjusiBhQTXpy/Q31+Ue
 4xFOYyHagENF0yfQe3pFr/WyUjGIYesw6SI6kFvpbjqq+wmbOzBSEjDvd2fmTahCcrzL
 wiSxaBBVrt4dYoh4Q9Gg3jg1d72ndvs50QJeUuZlx276pPQ4BMn57e7b2NcA4i9xMuQA
 WWYPBn2AEJ7KZM9h1E4UNIBF3F8RvTYwK3CLVKDK5Z7bjPD9qgr3JH02YLTH9eI238K5
 h/twTeTvBQ6LwkfffSmq7uBse51YLACXVat86RtTUsYUC/ekgkDXAePH+zv6lDjP44Tx
 rzDQ==
X-Gm-Message-State: AAQBX9c5KBXd/jE3+rOowHMXnUiW0TU8cI+ZAFn5wW9U8+ry4sjzEArP
 x6dzsepX65Lx8QGkFKlDYY2QNa4TGBYP0FnuSzAXkAWbEI9srdX1NchaCQ==
X-Google-Smtp-Source: AKy350Yb9EsEtVq4PNdlbLUqMmSHVv9A3Gx1fizcLz6axORlMx/dyNwjRt1zy+OUWREoLi0ZlXA2Ng9muqzj3+a4MuU=
X-Received: by 2002:a05:6214:d6c:b0:5da:b965:1efd with SMTP id
 12-20020a0562140d6c00b005dab9651efdmr27969461qvs.2.1681910031616; Wed, 19 Apr
 2023 06:13:51 -0700 (PDT)
MIME-Version: 1.0
References: <CABXGCsPZxgpFzAVN=eFXu0WV+Jk0vB4rv4p+Jt31C841LcqV=A@mail.gmail.com>
 <CABXGCsO0sST8+MvQs=T1JP49ogRsaHPT9gMQZGJ3dY7v3m0H8g@mail.gmail.com>
 <CABXGCsOTEpJG_0NWdGXRvcXQ4iTav6AUJm-U4SQb-vVzjoL6rA@mail.gmail.com>
 <10b2570f-a297-d236-fa7b-2e001a4dff12@gmail.com>
In-Reply-To: <10b2570f-a297-d236-fa7b-2e001a4dff12@gmail.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Wed, 19 Apr 2023 18:13:40 +0500
Message-ID: <CABXGCsPcPY8dqZm0aF4c1p0ZvMYHy+NksMrZi9xK0=WdE5_osA@mail.gmail.com>
Subject: Re: BUG: KASAN: null-ptr-deref in drm_sched_job_cleanup+0x96/0x290
 [gpu_sched]
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <Christian.Koenig@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 19, 2023 at 1:12=E2=80=AFPM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> I'm already looking into this, but can't figure out why we run into
> problems here.
>
> What happens is that a CS is aborted without sending the job to the
> scheduler and in this case the cleanup function doesn't seem to work.
>
> Christian.

I can easily reproduce it on any AMD GPU hardware.
You can add more logs to debug and I return with new logs which explains th=
is.
Thanks.

--=20
Best Regards,
Mike Gavrilov.
