Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 025DB6E1D11
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 09:24:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A475C10E050;
	Fri, 14 Apr 2023 07:24:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43CDF10E15C;
 Thu, 13 Apr 2023 17:16:09 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id u13so16311665ybu.5;
 Thu, 13 Apr 2023 10:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681406167; x=1683998167;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=01u2RSetmwdr6j5URpo3R1w4ezs7Fk00UyijVasf6GU=;
 b=oZLJ+jTrUqDJjU+ptRIzgR8blRolbPS4dtnpbHYrU1FG2egztMNAZLdnTS7zeAf7BK
 oGAMbZheRCsTGNViFHoJxhvvQHuQ99+bmlOuzRG/COVIzezThUM9E5HGbDWddD/vVdjX
 DuYiTVfHhKTuRKgTDwCf6sXsSbNl5LjVQ3o81BW1bj3vJI86F1c4LMHL2qotX8Sr4G6e
 kyaYiZ5Q9uEFz+vuPMXjbTDZfm3pHS+fPeFwdZn7kBxw8vIQnmzhstx47zJsjFw7QUmg
 ul3pKxhxxJAJpBTKPs93NCcl3YiBzlLP8NjMij8JTALuowp8rmFe+tIcsj+fmNhYqdD/
 d6cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681406167; x=1683998167;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=01u2RSetmwdr6j5URpo3R1w4ezs7Fk00UyijVasf6GU=;
 b=C1O57bkQ7vQE8jPkEOOPH7c2xShXGhptl6zZX8/iZimt9nP0e5Ek+ULHMhC4tDA4te
 tmNTF/0/0V8j4DbLKP0s4HwAxNRvU2mvKptgOEZHHmnl5aKwEC2TJI+3mNERWKImCDiG
 Pd/1x0DNfEj1owSPmqgUEtmb045j9alEorbRBDISDXAF6xlK7Gt2+DO7DvI+iKs4kjWw
 ostqj18Ny8OwJNiH0rOL/hWwE+yfWKLl7AJdg48s90Q77mCF1AuQTk9Q+Wjjx4vAdD70
 A8eikkmlwK6/vpwVTRGiAyzHYgRWdT5z8bPpGz7xBbtGo0Gz5HYPEOjsYEmci2MPuA9y
 rtrQ==
X-Gm-Message-State: AAQBX9cPUiNzKcP+ZPLy0WLhmQQLB0k6NjoCnI//UQ+wCLMsjGE7w4tP
 xe8JoqxMp9WYqRJFUKm7YPYjf7jOPRnBSe6IuI2eOzoZMQ==
X-Google-Smtp-Source: AKy350bN9z/h6v597xP8mdXeV5hOF4vvOZNQzjaLMemAL7d9EG5xx/SK8iopAqO8uh1rjXkGdKSY9DVJwvbA4pcgrIs=
X-Received: by 2002:a25:748e:0:b0:b6c:2d28:b3e7 with SMTP id
 p136-20020a25748e000000b00b6c2d28b3e7mr1851661ybc.9.1681406167525; Thu, 13
 Apr 2023 10:16:07 -0700 (PDT)
MIME-Version: 1.0
References: <CALjTZvZ=Y1psyd0nmfzm6GhqMKvq5V_NQCWb_X02nasp1CpfcQ@mail.gmail.com>
 <87r0spcuvi.fsf@intel.com>
 <CALjTZvao=N7wxyj_DpqzWUhdJwEsWSKUo3ddi-3ubgMp8BXi_Q@mail.gmail.com>
 <CALjTZvaf1cwcZc9O8g24SnZXsoQaWB97UVQW=g6M0coaudLr6w@mail.gmail.com>
 <2495408f-a644-4e56-aaca-e6915cbda179@paulmck-laptop>
 <CALjTZva=JHsckrBeHgJcd-_TDMgYgmZGcXavJ=GhPr7VQCOF5g@mail.gmail.com>
 <1384f15b-228f-4a6b-8ac3-d0437db8bc1c@paulmck-laptop>
In-Reply-To: <1384f15b-228f-4a6b-8ac3-d0437db8bc1c@paulmck-laptop>
From: Rui Salvaterra <rsalvaterra@gmail.com>
Date: Thu, 13 Apr 2023 18:15:56 +0100
Message-ID: <CALjTZvZUmrkrnPb0=pqT8C-KsQ64bFKBdzpuaV0_O0-m2xEV7g@mail.gmail.com>
Subject: Re: [BUG?] INFO: rcu_sched detected expedited stalls on CPUs/tasks: {
 0-.... } 3 jiffies s: 309 root: 0x1/.
To: paulmck@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 14 Apr 2023 07:24:14 +0000
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
Cc: tvrtko.ursulin@linux.intel.com, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Paul,

On Thu, 13 Apr 2023 at 17:21, Paul E. McKenney <paulmck@kernel.org> wrote:
>
> Been there, done that!
>
> And actually, it is kind of reassuring that the Linux kernel avoids
> tens-of-milliseocnds latency blows in the common case on your system.

Especially since we're talking about a HZ=100 non-preemptive kernel. :)

Rui
