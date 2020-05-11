Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 478F51CDDA7
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 16:49:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5305989A32;
	Mon, 11 May 2020 14:49:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA5CD890B2;
 Mon, 11 May 2020 14:49:38 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id f13so9374331qkh.2;
 Mon, 11 May 2020 07:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=gkrV0mSw419OC87OxKvOah2CgTI8JgcXYdLtKZtu+jI=;
 b=IZbkwj0dnYrfFciYxfmYFQ5udCQAC5qHRAPV9NNl0BoWruyERrJx3TquhZmI4vKroe
 bTPMv9wD6vIj8W55dt+aqU/X8/3frl3lNqZxFJjTsjkVU63G/mpVcOYbRJAsG6ftrYR8
 g/xpUNmnUFiFuwoNOEQtHFdIb/8b+UbRe7YsoKYIWSukk8twD4NgDyYEwFhtVIgvlpIT
 JqSCVJ6wok5wz5QnxN7pTC60Af6N0jD3c84DQp43B6zVkh40aBT5/whHXGLxQhb6XVWJ
 9Ddi8+64W/Wd1WjaALSO49zCtcKtaU7YziO8rguwnAY9T8WRNPQcYTbCQW2+e6ZEkYUD
 GK+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=gkrV0mSw419OC87OxKvOah2CgTI8JgcXYdLtKZtu+jI=;
 b=LkQZlSMUdpuAFxazDFPwCcrTvrKbxU4Z0ffA1UIj7tguM+AtSeuqx6Dg+I4haOnx9c
 zzVqk1e89NatcZD+LyjwblcIbIZIdnm46yFcetWITBkWuIS9zb/r8bKeNle+PyLg2lT6
 sHlfAd6Fegy+3x5Xuxp5tyZCgxyx7970gx7MYardeeOPVOcQwGHmicRhgSdMmx9AOKsY
 uFt7YBPOY1GCKsm2T9myQg9ew+ySnUXiVAQY1GOV0WcXAASoCc5CU0Gu4yitL5n9+CmV
 H1jO2iu4rfR+KQsNHycrAqCK8b9kdI846JXrebUrWmZhbkFd7nwja8Ae0p4nDjN7k5OK
 p6cQ==
X-Gm-Message-State: AGi0PuZ3WnbVQ+kc2zbnQZ2lcej7eR3ibAgs6pjLgLfEGGsB1ofoWknN
 1WFjdsXbSQ26sd8Mmgt4H7nsV1zm1K0=
X-Google-Smtp-Source: APiQypJoAuzVyc03cgE6RzbdljWE3MFT+haC+VE9LQTe3tyxSQRdD9fFW6Menc2CmBM6PpOz+553Hg==
X-Received: by 2002:a37:8302:: with SMTP id f2mr15691637qkd.220.1589208577620; 
 Mon, 11 May 2020 07:49:37 -0700 (PDT)
Received: from localhost ([199.96.181.106])
 by smtp.gmail.com with ESMTPSA id b198sm7594350qkg.37.2020.05.11.07.49.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 07:49:37 -0700 (PDT)
Date: Mon, 11 May 2020 10:49:35 -0400
From: Tejun Heo <tj@kernel.org>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [RFC v4 01/12] kthread: Add kthread_queue_flush_work()
Message-ID: <20200511144935.GD16815@mtj.duckdns.org>
References: <20200508204751.155488-1-lyude@redhat.com>
 <20200508204751.155488-2-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200508204751.155488-2-lyude@redhat.com>
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
Cc: Petr Mladek <pmladek@suse.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Dooks <ben.dooks@codethink.co.uk>,
 "Steven Rostedt \(VMware\)" <rostedt@goodmis.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, Liang Chen <cl@rock-chips.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

On Fri, May 08, 2020 at 04:46:51PM -0400, Lyude Paul wrote:
> +bool kthread_queue_flush_work(struct kthread_work *work,
> +			      struct kthread_flush_work *fwork);
> +void __kthread_flush_work_fn(struct kthread_work *work);

As an exposed interface, this doesn't seem great. What the user wants to say
is "wait for the current instance of this guy" and the interface is asking
them to queue an extra work item whose queueing return state should be
checked and depending on that result wait on its internal completion.

I'm skeptical this is a good idea in general given that unless you define
"this instance" at the time of queueing the work item which is being
waited-upon, there's no way to guarantee that the instance you're queueing
the flush work item on is the instance you want unless the queuer is holding
external synchronization which prevents the instance from running. That's a
really confusing semantics to expose in the interface.

What the above means is that the ordering that you want is only defined
through your own locking and that maybe suggests that the sequencing should
be implemented on that side too. It may be a bit more code but a sequence
counter + wait queue might be the better solution here.

Thanks.

-- 
tejun
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
