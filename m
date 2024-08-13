Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A67B950F9A
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 00:19:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E43BD10E2C3;
	Tue, 13 Aug 2024 22:19:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="0XeGw1jt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
 [209.85.166.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6FAE10E2C3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 22:19:29 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id
 ca18e2360f4ac-81f9339e534so212666139f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 15:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1723587569; x=1724192369;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+QN8X+bBf4e4pg8ECVJmLV7aoGPPE4M9h9y5SfDnco4=;
 b=0XeGw1jt9rg0T8pQ+8hHZ/p958Y+syWmrFKGSP7WIdIcme4DJYGsdkMCcX5hvdB7yq
 /m+1M71lD4NsVk0MsQutSR5lYOKIW9rAdHlumgRw4VRIJMTDMjz1cVNvZGTWrSQ3Tejr
 ubUQnGmWI/3mC/UMBju6kDXpWZ/pLBydlaXB6/dp5IeLBswVm8QVcqgz0crtUlQTziHi
 5upK/qURHu7tz8U62rvSHS3zuURznRLctRHvUuwp4ritNZYNL0UKLHgod+3tcm0vNnJi
 5pFwJ0MIdSb1csTL5XXjSYIBIHlFWSmhykYg/yZs2KCym4McUFVlN3ioHuBDGdZJcDzf
 cTRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723587569; x=1724192369;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+QN8X+bBf4e4pg8ECVJmLV7aoGPPE4M9h9y5SfDnco4=;
 b=wnFh9BVdUgzuoKoRu41yNyy8QvOQsGUSZX+LAxoD5gvfVzSIzYPsMty0rqfCJA0uSb
 wVL6eFrZ0pI5V4wWoOTlVxgQM0L7vSqje7/hieDslELcjPuBvW2dkDtLOpSO+FqR4x+I
 VFtVNvjaGq7CJ7nvx27jzPynOjJgcW35V7olzIo5ZYiXBDcdVi6ZKCbZ8pTYNbt0quAE
 Td15XVLq7qTvvuHDMhnXnIewsatcGpSS67wJ33G7VHr7+ZWYnociD0ar1uN25zhf7I/V
 QSNK751H9S8TAyn3iTM2VXaY2M1HwaSJlO41+mEt2iCE88jFjsffJYhiF+o3xOINf4T5
 oVjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHdndqU2auhMNL31X2Z0cnymVtogPGZF+nOcMHTJSXePyS2H7OU7zA/717c8Uw0G3BnMxGcbnEcqo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwAay/Fulu3DvWiIU69tSdUEhcyGEX1dyXv5B/9+ZRadxNcwUEn
 2qw76Vf6VVwgZE9YiDV/BBNApWyBc37eN0Yuu1747NjbSjcttKJvK/8k3FPBiw==
X-Google-Smtp-Source: AGHT+IH+Vc3rvDiFEg5ElrB7bMI7N4hpSdsoFZYx8k23AbxObZpcHIjRmC/uICTdWR81lxtCEKl/zQ==
X-Received: by 2002:a05:6602:27c1:b0:824:d58c:ec9 with SMTP id
 ca18e2360f4ac-824dad3f48bmr165323439f.10.1723587568538; 
 Tue, 13 Aug 2024 15:19:28 -0700 (PDT)
Received: from google.com (194.225.68.34.bc.googleusercontent.com.
 [34.68.225.194]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ca769f9d7dsm2773101173.118.2024.08.13.15.19.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Aug 2024 15:19:28 -0700 (PDT)
Date: Tue, 13 Aug 2024 15:19:25 -0700
From: Justin Stitt <justinstitt@google.com>
To: Yafang Shao <laoar.shao@gmail.com>
Cc: akpm@linux-foundation.org, torvalds@linux-foundation.org, 
 ebiederm@xmission.com, alexei.starovoitov@gmail.com, rostedt@goodmis.org, 
 catalin.marinas@arm.com, penguin-kernel@i-love.sakura.ne.jp, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 audit@vger.kernel.org, 
 linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
 bpf@vger.kernel.org, 
 netdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: Re: [PATCH v6 7/9] tracing: Replace strncpy() with strscpy()
Message-ID: <hbjxkyhugi27mbrj5zo2thfdg2gotz6syz6qoeows6l6qwbzkt@c3yb26z4pn62>
References: <20240812022933.69850-1-laoar.shao@gmail.com>
 <20240812022933.69850-8-laoar.shao@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240812022933.69850-8-laoar.shao@gmail.com>
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

Hi,

On Mon, Aug 12, 2024 at 10:29:31AM GMT, Yafang Shao wrote:
> Using strscpy() to read the task comm ensures that the name is
> always NUL-terminated, regardless of the source string. This approach also
> facilitates future extensions to the task comm.

Thanks for sending patches replacing str{n}cpy's!

I believe there's at least two more instances of strncpy in trace.c as
well as in trace_events_hist.c (for a grand total of 6 instances in the
files you've touched in this specific patch).

It'd be great if you could replace those instances in this patch as well :>)

This would help greatly with [1].

> 
> Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
> Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> ---
>  kernel/trace/trace.c             | 2 +-
>  kernel/trace/trace_events_hist.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
> index 578a49ff5c32..1b2577f9d734 100644
> --- a/kernel/trace/trace.c
> +++ b/kernel/trace/trace.c
> @@ -1907,7 +1907,7 @@ __update_max_tr(struct trace_array *tr, struct task_struct *tsk, int cpu)
>  	max_data->critical_start = data->critical_start;
>  	max_data->critical_end = data->critical_end;
>  
> -	strncpy(max_data->comm, tsk->comm, TASK_COMM_LEN);
> +	strscpy(max_data->comm, tsk->comm, TASK_COMM_LEN);

If max_data->comm wants to be NUL-terminated then this is the right
replacement. Without knowing how the trace stack works at all, it's hard
for me to tell if that is the case.

There's a length-supplied format specifier for which this comm field is
used with; Either this is just another safeguard against spilling over
the buffer or this field really doesn't care about NUL-termination.
| seq_printf(m, "#    | task: %.16s-%d "
|       "(uid:%d nice:%ld policy:%ld rt_prio:%ld)\n",
|       data->comm, data->pid,

In the event this field doesn't need to be NUL-terminated then we are
introducing an off-by-one error where we are copying one less useful
byte with strscpy -- Linus pointed out earlier [2] that these things all
just want to be c-strings so this is probably the right change :>)

>  	max_data->pid = tsk->pid;
>  	/*
>  	 * If tsk == current, then use current_uid(), as that does not use
> diff --git a/kernel/trace/trace_events_hist.c b/kernel/trace/trace_events_hist.c
> index 6ece1308d36a..4cd24c25ce05 100644
> --- a/kernel/trace/trace_events_hist.c
> +++ b/kernel/trace/trace_events_hist.c
> @@ -1599,7 +1599,7 @@ static inline void save_comm(char *comm, struct task_struct *task)
>  		return;
>  	}
>  
> -	strncpy(comm, task->comm, TASK_COMM_LEN);
> +	strscpy(comm, task->comm, TASK_COMM_LEN);
>  }
>  
>  static void hist_elt_data_free(struct hist_elt_data *elt_data)
> -- 
> 2.43.5
> 

Link: https://github.com/KSPP/linux/issues/90 [1]
Link: https://lore.kernel.org/all/CAHk-=whWtUC-AjmGJveAETKOMeMFSTwKwu99v7+b6AyHMmaDFA@mail.gmail.com/ [2]

Thanks
Justin
