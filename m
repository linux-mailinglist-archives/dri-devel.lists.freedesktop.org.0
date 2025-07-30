Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FC1B166BB
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 21:12:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DC5910E6D0;
	Wed, 30 Jul 2025 19:12:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="DTBPsBUk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 029BC10E6D0
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 19:12:08 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-55b72633aaeso85980e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 12:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1753902727; x=1754507527;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V1F+bXXlYQeXi5X4k/5ncJkOOvpM5ZuJh2NXOjU0lxQ=;
 b=DTBPsBUkJTEMxqcCNiTjP/GKE2Xj39RZSHy4WgjR2fMFTWAAYQBivtP74xH0OgT8bp
 NO4tQffzjjXpdW5sWHJONImM6cwpynvra0Br/fFEcfe5BF1lgJDLZtPB+fagn4Kyie48
 pN5/Ljhp9sD4ikAMSKXhrRMHaAuMh+mkvbfWtu0ESIJP4NZZutv6pUETDQ6g6LgWwKWT
 pybwFkHb5A6ZgwuCTp+M+eiWd8zzLC9CqCRGpRS+hy+JmkfJ52KNgHaDFqSKNLD1YfwX
 IIqtdbq7fS+P8ZpRSooC0pk/CfGVB1lO/JUQX8Xh9oedZsSE52pu91xW6p5LE7rIAjv9
 CMfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753902727; x=1754507527;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V1F+bXXlYQeXi5X4k/5ncJkOOvpM5ZuJh2NXOjU0lxQ=;
 b=JpRwcSLsXrRegML72L+PknygKfyIOASFNazZWlyrPy60/+COXT7a6AP8Rmipt8R5uC
 kNbFIpEdk7NXWme6+TQ+vKTy75Gx6N7IdtJJYBvOEuNwgaSErtxS0fmfjBXEVOblAkX7
 b5WoWxB+uZzT61Mf7z9/ksQsWyBv5liZVTZ9qrypKIs0KCfhEKDKXEHJ98tYNfeQNLW4
 MkCDdLpBy31mwpnnbaiaDdKPej1IP1WXHNrJL5eRDwhtbpaYHpTfrfzjEHk3rET6qYY4
 HJe701nQk98w0+ZAWe2EOoADKb9UtA2IP3IjY5FU6k+J+fB2vKtrKOJ6lj25eZzFi8C3
 eIHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXk4FR5JSafneADDrDKBxzyAHihr2naXMWm/q/BDqzWY9K9awFGoDe+a/7gJ8Sq9+IX5sbAugFHgGo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyS8BAqJy1p+wCVkvm5Ya62gJOdBHtmv2Qj+lKq69YmEckH4tKe
 /uamboI0855uMT3vaXl6EdghuIoHysZaD9hBSvgBgnpvqf+gHF/OVYScmf9uc7vHK4AdChdeUS2
 dqMdi47xt9F9+URKxq9/jr3ppaVvWSxq5ZIB5KbY=
X-Gm-Gg: ASbGncuFhOy6OthCg9qrVTIxmbDzZhPahBIEa6BtBiQOAIoHW8pJFc9/4eZtPHeyn2O
 2hph1uQGgg6CPBqwQL31sHQkNJN99PYVGmEL3itaGU9qUwJ/e2GVaQQtVfNIHl9Yj0atH+/pp5F
 fQOBU0bJEha01oenvopScNclF0DW3Z5VO6DJxGFTC6Gc+Y6C0Ad8yLYY4PTQiKLBW8amm4LYal9
 Vfhd5qC7c4FGkSiqfERSjclXPMuDA2AzKbgAVI5/+4yySE=
X-Google-Smtp-Source: AGHT+IHq3O02Isy9UO9EBNM2h/tgG1LradItYyY7WiGiYYCjnlChvIFaTIyvSt0KcCsrp/O3eMTcUwrT1XrBc1c3alM=
X-Received: by 2002:a05:6512:39d2:b0:55a:4f05:6e4c with SMTP id
 2adb3069b0e04-55b7c0885ecmr1469195e87.49.1753902726644; Wed, 30 Jul 2025
 12:12:06 -0700 (PDT)
MIME-Version: 1.0
References: <68894443.a00a0220.26d0e1.0015.GAE@google.com>
 <8ab72592-7e16-4d79-9e26-f98a1938cb2a@linux.intel.com>
 <61b68b13-2482-499b-a550-a11580a61e9d@amd.com>
In-Reply-To: <61b68b13-2482-499b-a550-a11580a61e9d@amd.com>
From: John Stultz <jstultz@google.com>
Date: Wed, 30 Jul 2025 12:11:54 -0700
X-Gm-Features: Ac12FXyCBe3eZdHmtT03zQRJBw01rHa-_e76up8xxbhmJkSgGW8khZKY2csyOUw
Message-ID: <CANDhNCo+esbJpwqq0boTaKbEL5WBjwtuynH+jcNW1rzj65jJJw@mail.gmail.com>
Subject: Re: [syzbot] [dri?] WARNING in __ww_mutex_wound
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 syzbot <syzbot+602c4720aed62576cd79@syzkaller.appspotmail.com>,
 airlied@gmail.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 mripard@kernel.org, simona@ffwll.ch, syzkaller-bugs@googlegroups.com, 
 tzimmermann@suse.de, Valentin Schneider <valentin.schneider@arm.com>, 
 "Connor O'Brien" <connoro@google.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>
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

On Wed, Jul 30, 2025 at 2:50=E2=80=AFAM K Prateek Nayak <kprateek.nayak@amd=
.com> wrote:
> On 7/30/2025 1:57 PM, Maarten Lankhorst wrote:
> > Hey,
> >
> > This warning is introduced in linux-next as a4f0b6fef4b0 ("locking/mute=
x: Add p->blocked_on wrappers for correctness checks")
> > Adding relevant people from that commit.
> >
...
> >> ------------[ cut here ]------------
> >> WARNING: ./include/linux/sched.h:2173 at __clear_task_blocked_on inclu=
de/linux/sched.h:2173 [inline], CPU#1: syz.1.8698/395
> >> WARNING: ./include/linux/sched.h:2173 at __ww_mutex_wound+0x21a/0x2b0 =
kernel/locking/ww_mutex.h:346, CPU#1: syz.1.8698/395
> >> Modules linked in:
> >> CPU: 1 UID: 0 PID: 395 Comm: syz.1.8698 Not tainted 6.16.0-rc6-next-20=
250718-syzkaller #0 PREEMPT(full)
> >> Hardware name: Google Google Compute Engine/Google Compute Engine, BIO=
S Google 07/12/2025
> >> RIP: 0010:__clear_task_blocked_on include/linux/sched.h:2173 [inline]
> >> RIP: 0010:__ww_mutex_wound+0x21a/0x2b0 kernel/locking/ww_mutex.h:346
>
> When wounding the lock owner, could it be possible that the lock
> owner is blocked on a different nested lock? Lock owner implies it
> is not blocked on the current lock we are trying to wound right?
>
> I remember John mentioning seeing circular chains in find_proxy_task()
> which required this but looking at this call-chain I'm wondering if
> only the __ww_mutex_check_waiters() (or some other path) requires
> __clear_task_blocked_on() for that case.

So yeah, I have tripped over this a few times (fixing and often later
re-introducing the problem) but usually later in my full proxy-exec
series, and somehow missed that the single-rq hit this.

Obviously with __ww_mutex_die() we are clearing the blocked on
relationship for the lock waiter, but in __ww_mutex_wound() we are
waking the lock *owner*, who might be waiting on a different lock, so
passing the held lock to the clear_task_blocked_on() checks trips
these warnings.

Passing NULL instead of lock is the right call here, I'll just need to
loosen the __clear_task_blocked_on() check for null as well.

I'll spin up a quick patch.

thanks
-john
