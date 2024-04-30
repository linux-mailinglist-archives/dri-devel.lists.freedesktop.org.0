Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 672848B74C6
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2024 13:45:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB09210EA1C;
	Tue, 30 Apr 2024 11:45:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XFNWrm/P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4651510EA1C
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 11:45:38 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-61b4cbb8834so55670087b3.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 04:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714477537; x=1715082337; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LMWMwIrhoja/mjJ97z4DdQVv6xt1vL+14RxvDcfeu+U=;
 b=XFNWrm/PCHJBzJTqhAbDPfmyDazSRSKDGR/FAW1kRiwboc5Rqlcu7iCF+dXYn+0sek
 56boxfF2DWjgvVH64HYJmiMktIpgGabOTSSc+oRflU9sqhfvgGLUBXMSPW1TTxJiCbjE
 WPQ8sZmr9MaPY+nS1+ysspyfqAPEgbwqif8q76n+NjehewLVMvJ/MPe/mQaCXUxqShm2
 QoBf+QEYFN5Vp4fkMms9LjGoRbdu5bDh6D68Zzt+AUKJYHgQvgIw3bRAs5fGEb0Dr1kg
 CK3hE/Vbt4TDk7FV+hnF1rH5JMWSkip4LSYISel8vl5L8wvXqIuQFLtHeCntj5TcPQIM
 8Tuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714477537; x=1715082337;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LMWMwIrhoja/mjJ97z4DdQVv6xt1vL+14RxvDcfeu+U=;
 b=fwmFfPtc51H3YjpjTyeShgRFGVbgaYytwaJEq/HHiSTfDlU4hP08R9cMHErf4Nik7f
 zs3KMm+yvCs6kp2Qgg9SzqHwQ5iLsXKwV58dzyX665VBnz6zf+OyhjP01kZMk/qXzITa
 72Shvea4tMSfFqpXr/sCYv6vDjqyYlzo6A8utiw4QcZs4rvVa0wjYjXXSNVR4bV1oDAb
 2QoS0Fp+OVTFEt7DludTBzPiB5TvMY4jLkX0Cq2xjnVq1FUtHu8GsCY5KmJEWvB16rlC
 RLYcnjSqoJRFKlDm1EdPpoUsg2EmkNd67SmC8Oe8Sof2agBtnvR7QSpbRWu+cnTPSYG8
 1AUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpLB7JERVcEuAgMFyCCPT3O8c9RjMdO8WCoMGdUmeZF3N5jOi7TiOeu5hp7SvFqNPnqC4D4y1Xn/NwOaqb8fHM1mN2KORVgLjdmc8oiBFJ
X-Gm-Message-State: AOJu0Yzfu5nRioLWY/icj2RrWnDuJo6aCv7rDh2/QjX7CKK4xLW9reWb
 CyTvLRYnqlf0xq9Eg00wm57+Nhq4peufSSrflTsnqAHlOI00Qpezfa56UBG0SZz7nVe/qlrXuz9
 HE69n1kNgwcYFyGhAAaZQjxpuIQQ=
X-Google-Smtp-Source: AGHT+IFWLTsceRYhi9/QmpyJz0woosjkTHL1KGvFF1YijYKO8GYKfCOxMxGlv6J7qjRlI6WEtNMdz4TuS1BN+EvgbfE=
X-Received: by 2002:a05:6902:2304:b0:dcc:693e:b396 with SMTP id
 do4-20020a056902230400b00dcc693eb396mr14627529ybb.2.1714477537033; Tue, 30
 Apr 2024 04:45:37 -0700 (PDT)
MIME-Version: 1.0
References: <271372d6-e665-4e7f-b088-dee5f4ab341a@oracle.com>
 <20240418160652.68df1a86@namcao> <87ttjywxv5.wl-tiwai@suse.de>
 <a7843657-c3f6-4d2e-8c36-5541d4c52956@gmx.de> <878r19voks.wl-tiwai@suse.de>
 <5febb249-1d4d-4ea7-b031-1df4d14620d2@oracle.com>
 <8734rhvlr2.wl-tiwai@suse.de>
 <CAMeQTsbEjUyOYDAF-kFwTcovLr+8gHQGa27jPkeeJqmLhwbTag@mail.gmail.com>
 <20240419173443.6c49706e@namcao>
In-Reply-To: <20240419173443.6c49706e@namcao>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Tue, 30 Apr 2024 13:45:25 +0200
Message-ID: <CAMeQTsZJdiyLZvY07gup0ib4SvTQ83p36mLDMRv4C6BH5M69XA@mail.gmail.com>
Subject: Re: [bug-report] task info hung problem in fb_deferred_io_work()
To: Nam Cao <namcao@linutronix.de>
Cc: Takashi Iwai <tiwai@suse.de>,
 Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>, 
 Helge Deller <deller@gmx.de>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel@ffwll.ch>, 
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 bigeasy@linutronix.de, LKML <linux-kernel@vger.kernel.org>, 
 Vegard Nossum <vegard.nossum@oracle.com>,
 George Kennedy <george.kennedy@oracle.com>, 
 Darren Kenny <darren.kenny@oracle.com>, chuansheng.liu@intel.com
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

On Fri, Apr 19, 2024 at 5:34=E2=80=AFPM Nam Cao <namcao@linutronix.de> wrot=
e:
>
> On 2024-04-19 Patrik Jakobsson wrote:
> > Neither cancel_delayed_work_sync() or flush_delayed_work() prevent new
> > work from being scheduled after they return.
>
> flush_delayed_work() is called during device closing. And because no
> writes are performed after the device has been closed, no new work
> should be queued after flush_delayed_work().

Yes, nothing should write after the device is closed but the events
are asynchronous so in theory the order is not guaranteed. I also find
it unlikely but I have no other theory at this point.

>
> > But
> > cancel_delayed_work_sync() at least makes sure the queue is empty so
> > the problem becomes less apparent.
> >
> > Could this explain what we're seeing?
>
> I suspect that cancel_delayed_work_sync() is only treating the symptoms
> by preventing the deferred work from running. The real bug is "someone"
> giving fb_deferred_io_work() invalid pages to work with. But that's
> just a blind guess.

Trying to figure out when the page goes away in relation to when the
work is triggered might be a good place to start.

>
> Best regards,
> Nam
