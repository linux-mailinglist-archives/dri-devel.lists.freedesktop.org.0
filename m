Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6862C1CDE0A
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 17:02:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8DD46E488;
	Mon, 11 May 2020 15:02:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44AD46E488;
 Mon, 11 May 2020 15:02:56 +0000 (UTC)
Received: by mail-qv1-xf33.google.com with SMTP id d1so140946qvl.6;
 Mon, 11 May 2020 08:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=J4uyWElSmmKaxd8Y7Hrt+yky6sisNiPUP3S3AyJYIE0=;
 b=TZ+MqzO4CQm/iAe5QqQybTl13BatZPT3cFASk8rIjwM92U6gr98iCpw6vh07s1Ogfj
 fnGdSk4VjTlUrMQgIhe0+aeZ5fHt0z4IdiAisI3XRA7gz+eaSYKtbpAZy4CayagjESqN
 iQSgzY3AOwyofH+xAZtSEGG0GYdWCVDnPU7705kMQN54DY1a/BhXVZUiPSFYSXJOJ1Og
 2f4ULbIBLnkP30TE6MBuUgrPNG0bBTy2hUgym3U3S3IvysQcdx4iH73NDwO9dG4QhDWx
 3B2lwLZDBboZR9drD783OFzUpIocAckq+bE/0TBXbbbYGbrO1Ikp+gMwXv/ERTRcCN+b
 NEEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=J4uyWElSmmKaxd8Y7Hrt+yky6sisNiPUP3S3AyJYIE0=;
 b=hm8Z0iOVWXyUsrz7SO2TxlXL/JSAaHlE/b43DNvQ0eUC3sLcPkGyyRc3mSopZCxtdn
 aNErApb7wZq/aKCay/WYJJSo+rqo26Vu0seJKMSARlYaIM15fLcfC+nu7nsWplHe39qS
 DJoTDVSesqXtSR3dDEhamKnWsuIbIYrhgid3bMQ0IzKOdlV31SE5ayCNCsJO9z5/T7Gj
 ze0dIEuKIM2FRT7Np/9qEoG/KYNjUDiz3XFaA0na6VY3SFw5oV+BkY2L8gDvc/uTQN62
 ei743Zro3dRD17qmOUKVtn0zkOAP+ClLEj4nUfuu35ikCj5O58/tTbB0wtndK6+Qwbfe
 H6yQ==
X-Gm-Message-State: AGi0Pub70wRHgvdWwkAqwzi4yBK8DZUQJkiQ47US4AsU6WVbtIPdmnQj
 cwGT/KM1frc9CJQd+ckRbMc=
X-Google-Smtp-Source: APiQypLnPvgBUeyGBOEkrNHpMwu92fvMkq0NiRki3v6tGAI0dxnyEUhKlNYCkFNryl2NQrnC8dSGGg==
X-Received: by 2002:ad4:45a7:: with SMTP id y7mr6051944qvu.184.1589209374213; 
 Mon, 11 May 2020 08:02:54 -0700 (PDT)
Received: from localhost ([199.96.181.106])
 by smtp.gmail.com with ESMTPSA id m6sm1054576qkc.4.2020.05.11.08.02.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 08:02:53 -0700 (PDT)
Date: Mon, 11 May 2020 11:02:51 -0400
From: Tejun Heo <tj@kernel.org>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [RFC v4 02/12] kthread: Add kthread_(un)block_work_queuing() and
 kthread_work_queuable()
Message-ID: <20200511150251.GE16815@mtj.duckdns.org>
References: <20200508204751.155488-1-lyude@redhat.com>
 <20200508204751.155488-3-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200508204751.155488-3-lyude@redhat.com>
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
Cc: Petr Mladek <pmladek@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Dooks <ben.dooks@codethink.co.uk>, Liang Chen <cl@rock-chips.com>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 08, 2020 at 04:46:52PM -0400, Lyude Paul wrote:
> Add some simple wrappers around incrementing/decrementing
> kthread_work.cancelling under lock, along with checking whether queuing
> is currently allowed on a given kthread_work, which we'll use want to
> implement work cancelling with DRM's vblank work helpers.

Am I correct in assuming that what you want is "cancel this and block
further queueing until the state is cleared"? I agree that'd be something
really useful to have. That said, There are a few areas that I think can be
improved upon:

* It'd be better if we separate this state into its own thing rather than
  mixing with canceling state which has potential to make things really
  confusing. It doesn't have to be a separate field unless you want disable
  depth for work item disable (and I don't think you do). It can just be a
  high bit in the same field but I think the two states should be separate
  one way or the other.

* I'm always a bit skeptical about state querying interfaces which aren't
  synchronized to anything. They're useful in many cases but also prone to
  being misused. If you absoultely have to have them, can you please add
  explicit comment explaining the lack of synchronization around it - ie.
  unless you're the one setting and clearing the flag and queueing the task,
  it isn't synchronized against anything.

* In the same vein, I'm not too sure about stand-alone block interface.
  Unless I'm the sole queuer or there are further locking around queueing,
  what good does setting blocking do? There's no way to guarantee that the
  flag is seen by someone else trying to queue it and trying to flush the
  work item after queueing doesn't help either. The only way to make that
  interface meaningful is doing it together with cancel - so, you say "block
  further queueing and cancel / flush whatever is in flight or queued",
  which actually gives you a useful invariant.

* A simliar argument can be made about unblock too although that's an a lot
  more relaxed situation in that unblocking and queueing oneself always
  works and that the user might not care which future instance of queueing
  will start succeeding.

Thanks.

-- 
tejun
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
