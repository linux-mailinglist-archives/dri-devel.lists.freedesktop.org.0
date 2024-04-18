Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B59548A9D2F
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 16:34:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B336310FCA4;
	Thu, 18 Apr 2024 14:34:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SUI0Y1Yp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 380C810FCA4
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 14:34:35 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-61874a5b8ecso10273057b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 07:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713450874; x=1714055674; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AWhqJ/PhhN6VwcvGP4fb2OzJCE4W/q26RaYjel+sdg0=;
 b=SUI0Y1YpNnwmmD69nP9K93r+OyaL9xyOIBYSJ7z+MkKlx2OTGujcyHfdxUo/tfb5C5
 6YDACAEgmlvzbHZcuVhHj+W8LS/KemrG4Yk7qOG/PtsbvCREu3RgI5YIGBVLeIU+hGFP
 uhhvYdloih2rdyROZIneyIP8dPq/1uJPcOQek3MxLpaNWvN81+f3EwPKcdlODAGJgqlK
 lm9SP4joxLbzry/9ntmbK+R29px65FAaNvq98HYxoPJYQDN4xgclzBBdu1O4Yz+kOKO/
 EM+veuwSNzSc7jhsuiExdQER8qSTEpTbWTv4g7NMG6b95ckahrUlUh2VJh1MLFhhPV72
 tClg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713450874; x=1714055674;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AWhqJ/PhhN6VwcvGP4fb2OzJCE4W/q26RaYjel+sdg0=;
 b=snIeOoKd17kE+f6ac1EEA5lnmMogYqiKOVfYDwSsq6VedD9dyKLrMT/EtjN7Au4BDe
 zN6KxazB0ZSrXrFFMr0B68eEi1Fz4I3EreSz0CE9foODJDyoWfwfOzPPxaBPa0WadX1k
 7f8KkdEJ5whDehJiBR5NUnl8ZA+qla6Vdq7hcv7fPXEdihil4YqP6dNvwkvTehjT4LOH
 XvpDtsKiMBIdwSG38GqYvMhIxu9jJ7EWiFtF4aa2QaeWNfgFFj7x6efr7cnGdjHOSiZJ
 vcsgOczd/A/Tg3SuFc7UKZlIiGCiJYBqIlayOBmTzmGAJHQiUSsIeYaHmhvzWlD1Wm0+
 YSRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5X8RUW77MFGUAW7PXPDS+YSCwVeCa2v4MnTGjUAmOLFDEcDerj9wl0PWZ2prRd/XLbbZoChccvumffo2HMd9tTubhzHVdlp01uzIXYFQz
X-Gm-Message-State: AOJu0Ywewj/hWyJuNEH0hzlkYeS1Tub6FKlkglnZtUHfKBNz8saASSLJ
 jbCkJEihW2FL+Zfug73esO8YIUUQtNQaxUWhy0cGr06fOwqBsPFc4CBbRjV+4YNaRzQjYuSKr2U
 OneoM/6r1EJHYkPey70y1hVRFDSo=
X-Google-Smtp-Source: AGHT+IHPljfyR5qozrc6exU2JcpOuPMAZ8pZtMm0j+hGfBQ8TM8Ir1vjxTKtwDJRN4TQtvGjjcG18rN15x9F7IeAmPc=
X-Received: by 2002:a05:690c:d18:b0:61a:af67:1cfd with SMTP id
 cn24-20020a05690c0d1800b0061aaf671cfdmr3008285ywb.5.1713450874003; Thu, 18
 Apr 2024 07:34:34 -0700 (PDT)
MIME-Version: 1.0
References: <271372d6-e665-4e7f-b088-dee5f4ab341a@oracle.com>
 <CAMeQTsbCESSTrEyHgqF9HreSuzQ9kMBnGpKLT0QNJ+n4hv9qOw@mail.gmail.com>
 <20240418160526.3b3c385f@namcao>
In-Reply-To: <20240418160526.3b3c385f@namcao>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Thu, 18 Apr 2024 16:34:22 +0200
Message-ID: <CAMeQTsaGXv6hUmXg3ROLb83JZEAfoSuQGCQgz0wG38Me8UtQYA@mail.gmail.com>
Subject: Re: [bug-report] task info hung problem in fb_deferred_io_work()
To: Nam Cao <namcao@linutronix.de>
Cc: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>, jayalk@intworks.biz,
 Daniel Vetter <daniel@ffwll.ch>, deller@gmx.de, linux-fbdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, tiwai@suse.de, bigeasy@linutronix.de, 
 LKML <linux-kernel@vger.kernel.org>, Vegard Nossum <vegard.nossum@oracle.com>, 
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

On Thu, Apr 18, 2024 at 4:05=E2=80=AFPM Nam Cao <namcao@linutronix.de> wrot=
e:
>
> On 2024-04-18 Patrik Jakobsson wrote:
> > This sounds similar to the SUSE bug [1]. We fixed it by reverting [2]
> > in the SUSE kernel. The problem seems to be that flush_delayed_work()
> > kills the timer and re-queues the work but doesn't guarantee that it
> > is finished when returning. So when the device is closed, the
> > fb_deferred_io_work() function can still be queued and tries to access
> > memory that's been freed.
>
> flush_delayed_work() *does* guarantee the work is finished before
> returning.

Right, flush_work() does guarantee that the work is finished, but it
doesn't guarantee that the queue is idle if work has been requeued
since flush started. So fb_deferred_io_work() should be able to happen
after the device is closed. Or am I missing something?

>
> > Patch [2] tries to solve the problem of not throwing away pending data
> > when closing the device. Perhaps calling cancel_delayed_work_sync()
> > and then follow up with a manual call to fb_deferred_io_work() would
> > be enough to flush the remaining data?
> >
> > -Patrik
> >
> > [1] https://bugzilla.suse.com/show_bug.cgi?id=3D1221814
> > [2] 33cd6ea9c067 fbdev: flush deferred IO before closing
> >
> > >
> > >
> > > Thanks,
> > > Harshit
>
