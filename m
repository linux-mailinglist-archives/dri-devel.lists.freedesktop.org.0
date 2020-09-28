Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 220B727B875
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 01:50:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33C5C89E50;
	Mon, 28 Sep 2020 23:50:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 770D589E50
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Sep 2020 23:50:54 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id k8so2751970pfk.2
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Sep 2020 16:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=PCAUgmN81IcYAHnWNhW9isLm7rbDzjVGyanWkN6tKwA=;
 b=a3QFXOgMPz3RSiSDW47BSACzZ+lN+UDtHLgnGyi0Wz7PMmdNYaJpkYj6lhZU59Kqr9
 bZAn6moKqH/16Z2IjS4blzsuDT1bj+fTcnw2D2pLVimX/85VaK0/DUKZe5iixrWpSJcv
 n9czm3J4mpWUTcX7yUTXPm7wv8P/5++lyUF1rxOD/EHiIQRNSiF70LElCuT5VatFsJ/g
 QvhT9KMYQ/wBA6Nv3yA6PNRxd6YgxJzdpLxZrbzC6OQJHEcrY1YFv5b2B2VML9XK44eA
 8Odmukrz0Nnu5PPj9mXykyfNlQCO6BaKvZADoyXP3+7Y4N4tJTGtbyrEHzAhiJp83EFg
 v2HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=PCAUgmN81IcYAHnWNhW9isLm7rbDzjVGyanWkN6tKwA=;
 b=NNNcIEMGxf+aw+lrjNKFaggfbG6yGb2Jsnjb43l1dUZTUuKGUzu6zNm6KiUhGjehbl
 n3aXfO6PHHmNDP9ZYZJG8adYwtujnllxibetav4l5ACMHm1OcDTxLSHhM1DWLEP7jp4F
 NPCppr7DFYK7HXKNGt8u2oHAsjI4K3I4ySD1wojM/EI/1fJ35e4JacWeTpM/xc9ZKwW0
 X7ni0Q199m65cO+i76vtPwVzF5kMYxhLASpE6jxm4dgTHiVag44iNNvD3QmPZzRrWIRV
 zR11SbzgidTOge6GIzES/Up1bQ4U7O4YljZ09Lc3EjBJAcGjIeQ6gYwex+MSpdEaTGqx
 n87A==
X-Gm-Message-State: AOAM5305I2o/I6mgc/q287lgKftqw07rSK9O1jhieScXmspmx9O1k1Pd
 Us3n9q2iJRyuir0xG+2pKOc=
X-Google-Smtp-Source: ABdhPJwXzc51MZz1CeTs+djanje5iH0/4kmI+KmxFurjdIf4ShczmfC1Fe92b9wOEEEd2ppFENX6mA==
X-Received: by 2002:a17:902:c14c:b029:d2:4345:5a9 with SMTP id
 12-20020a170902c14cb02900d2434505a9mr1734375plj.0.1601337053781; 
 Mon, 28 Sep 2020 16:50:53 -0700 (PDT)
Received: from localhost ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
 by smtp.gmail.com with ESMTPSA id w195sm2938435pff.74.2020.09.28.16.50.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2020 16:50:52 -0700 (PDT)
Date: Tue, 29 Sep 2020 08:50:52 +0900
From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [External] Re: [PATCH 2/2] sched: mark
 PRINTK_DEFERRED_CONTEXT_MASK in __schedule()
Message-ID: <20200928235052.GB871730@jagdpanzerIV.localdomain>
References: <20200927161130.33172-1-zhouchengming@bytedance.com>
 <20200927161130.33172-2-zhouchengming@bytedance.com>
 <20200928073202.GA2611@hirez.programming.kicks-ass.net>
 <40ab934e-5b8b-735b-da65-3043efab9fdc@bytedance.com>
 <20200928090143.GA2628@hirez.programming.kicks-ass.net>
 <688eadd7-4ca3-3e32-3520-25977ff059a6@bytedance.com>
 <20200928102559.GF2611@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200928102559.GF2611@hirez.programming.kicks-ass.net>
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
Cc: juri.lelli@redhat.com, pmladek@suse.com, vincent.guittot@linaro.org,
 tzimmermann@suse.de, john.ogness@linutronix.de, airlied@linux.ie,
 songmuchun@bytedance.com, linux-kernel@vger.kernel.org, bsegall@google.com,
 sergey.senozhatsky@gmail.com, mingo@redhat.com, rostedt@goodmis.org,
 dri-devel@lists.freedesktop.org, mgorman@suse.de, dietmar.eggemann@arm.com,
 Chengming Zhou <zhouchengming@bytedance.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On (20/09/28 12:25), Peter Zijlstra wrote:
[..]
> > printk
> > =A0 vprintk_emit
> > =A0=A0=A0 console_unlock
> > =A0 =A0 =A0 vt_console_print
> > =A0 =A0 =A0 =A0 hide_cursor
> > =A0 =A0 =A0 =A0 =A0 bit_cursor
> > =A0 =A0 =A0 =A0 =A0 =A0 soft_cursor
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 queue_work_on
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 __queue_work
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 try_to_wake_up
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 _raw_spin_lock
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 native_queued_spin_lock_slo=
wpath
> > =

> > Looks like it's introduced by this commit:
> > =

> > eaa434defaca1781fb2932c685289b610aeb8b4b
> > =

> > "drm/fb-helper: Add fb_deferred_io support"
> =

> Oh gawd, yeah, all the !serial consoles are utter batshit.
> =

> Please look at John's last printk rewrite, IIRC it farms all that off to
> a kernel thread instead of doing it from the printk() caller's context.

Not yet. Scheduler is still part of the printk() - either in the
form of !serial consoles or console_sem, or both.

	-ss
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
