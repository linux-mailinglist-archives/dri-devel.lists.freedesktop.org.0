Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F526B01726
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 11:04:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB9DB10E9D7;
	Fri, 11 Jul 2025 09:04:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="I2R+75rX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E316D10E9D6
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 09:04:35 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-45363645a8eso13495815e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 02:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1752224674; x=1752829474; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=azkWYqIfD0IX3c6trMXIH2mHQXBlbPclhfsws1MJpdM=;
 b=I2R+75rXhrFUB7omrs5dUnaGe5fGJUfl3RdC0dI441c36/7yj/BIqlwg+5GKLFDyJc
 fc/ToCArokVYnzmQ+sPIo2zRs/u2USOtPciK6Ji78xkOZ4O8HuCNtzf6JBC+4XnYHwWU
 VM7mdIE96u0Cz2TTnXZu/18tTTTOCUdsB1n+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752224674; x=1752829474;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=azkWYqIfD0IX3c6trMXIH2mHQXBlbPclhfsws1MJpdM=;
 b=R3jvRemfd6Fwy35E/7SmU+s+VotMUATIN6GL5poGVkbTA2NI3jhHxmFR82PsVMt4Cm
 xvCoZaxQKt8I2B9XpTh6Qiy/2SwwcOmhgtwVLRcwCTXYhbZtN0RSj6eZP62kiv0oBfgP
 3LRnnY0EkjIxdf6kpudFMoOwW0tX4zd/d4HewiCAEIJHjPWcc1lCx53YHKAJ62MAWRSy
 r011T1zC43fpc6tv+2vodLLojGEBSCdVYGNdRQopMFTUtPJ+0zjdjQIiYt88wDfwYQky
 Av9ruvnyjH4Lgc+QIZymHSRpnOGXh3FkGu+uSwmfKFX1hp1UNMRx1wOgfbvaaK5nbS9x
 3tLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjnjA31j8feGvaZxCMm6HoRAuA6IagjObLVXvlPc1XZoefbMtcklnejkdei0TrhnRQ+KmP2JltqFo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzxFDBQnRTtpxBWIBSZsZpRBimkwQYO73Jm+sMdeJItTFWlDfdo
 NsOnAjwtYZpJtuSUmf+nu1j9uqwF7M7jagYgS/WKBb7GR08ScuJAVEsemAu9Afv4YNY=
X-Gm-Gg: ASbGnct8ASAUTgZhJj3s98lGYqUT2oYQlAoe/r5yxw/x7F9EuXhPjvDEL+CL3rBhffs
 NRlI5deP1UKfd1SM080qyjPRHQLR+nemwLtcSouvTk9nxHlKxHRdHxV7oKgVWDiQGYdfLAuPNUM
 2Jffhs+w0juL8YZ+Kvcz7G84aIzsEJfhDyc2eVIYB3sbjJsW7peD0sYJRhrbBBq/JBy7gXqSm/q
 uupDQ0zduXKk+o/Vq5eskMuyZAJ0K4EcBT9YPDCUoekXL99vZBnFUdr83h6KRiVSu+g6EtFRlyd
 vNYg2zPJIigmW2DBMoqrdnr8j/VA8nBSFat0KxLqjLRwYzO6d98F6oBsAURkEATUNszvGWsaRk2
 Eo0BdFhyN5xW3XYybJdmtRYNGmYSyoUn7PA==
X-Google-Smtp-Source: AGHT+IFGUXwZZxphgJZiWA8T7e58NqagXtzk90hoNDnBiUkxa4v1W5VvgPBRSAu+F+hnZton6PqeNA==
X-Received: by 2002:a05:600c:6095:b0:453:c39:d0a7 with SMTP id
 5b1f17b1804b1-454ec15a9fcmr17912895e9.5.1752224674202; 
 Fri, 11 Jul 2025 02:04:34 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454dd55b1absm41564565e9.40.2025.07.11.02.04.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 02:04:33 -0700 (PDT)
Date: Fri, 11 Jul 2025 11:04:31 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Christian Brauner <brauner@kernel.org>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Maarten Lankhorst <dev@lankhorst.se>,
 Natalie Vock <natalie.vock@gmx.de>, linux-kernel@vger.kernel.org,
 rcu@vger.kernel.org, cgroups@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Frederic Weisbecker <frederic@kernel.org>,
 Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Josh Triplett <josh@joshtriplett.org>, Boqun Feng <boqun.feng@gmail.com>,
 Uladzislau Rezki <urezki@gmail.com>, Steven Rostedt <rostedt@goodmis.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Lai Jiangshan <jiangshanlai@gmail.com>,
 Zqiang <qiang.zhang@linux.dev>, Maxime Ripard <mripard@kernel.org>,
 Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>
Subject: Re: [PATCH v1 1/1] rculist: move list_for_each_rcu() to where it
 belongs
Message-ID: <aHDTn5JgXOpiG_zd@phenom.ffwll.local>
Mail-Followup-To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Christian Brauner <brauner@kernel.org>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Maarten Lankhorst <dev@lankhorst.se>,
 Natalie Vock <natalie.vock@gmx.de>, linux-kernel@vger.kernel.org,
 rcu@vger.kernel.org, cgroups@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Frederic Weisbecker <frederic@kernel.org>,
 Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Josh Triplett <josh@joshtriplett.org>,
 Boqun Feng <boqun.feng@gmail.com>,
 Uladzislau Rezki <urezki@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Lai Jiangshan <jiangshanlai@gmail.com>,
 Zqiang <qiang.zhang@linux.dev>, Maxime Ripard <mripard@kernel.org>,
 Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>
References: <20250710121528.780875-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710121528.780875-1-andriy.shevchenko@linux.intel.com>
X-Operating-System: Linux phenom 6.12.30-amd64 
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

On Thu, Jul 10, 2025 at 03:15:28PM +0300, Andy Shevchenko wrote:
> The list_for_each_rcu() relies on the rcu_dereference() API which is not
> provided by the list.h. At the same time list.h is a low-level basic header
> that must not have dependencies like RCU, besides the fact of the potential
> circular dependencies in some cases. With all that said, move RCU related
> API to the rculist.h where it belongs.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>

Also ack for the dmem part for merging through your tree.
-Sima

> ---
>  include/linux/list.h    | 10 ----------
>  include/linux/rculist.h | 10 ++++++++++
>  kernel/cgroup/dmem.c    |  1 +
>  3 files changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/include/linux/list.h b/include/linux/list.h
> index e7e28afd28f8..e7bdad9b8618 100644
> --- a/include/linux/list.h
> +++ b/include/linux/list.h
> @@ -686,16 +686,6 @@ static inline void list_splice_tail_init(struct list_head *list,
>  #define list_for_each(pos, head) \
>  	for (pos = (head)->next; !list_is_head(pos, (head)); pos = pos->next)
>  
> -/**
> - * list_for_each_rcu - Iterate over a list in an RCU-safe fashion
> - * @pos:	the &struct list_head to use as a loop cursor.
> - * @head:	the head for your list.
> - */
> -#define list_for_each_rcu(pos, head)		  \
> -	for (pos = rcu_dereference((head)->next); \
> -	     !list_is_head(pos, (head)); \
> -	     pos = rcu_dereference(pos->next))
> -
>  /**
>   * list_for_each_continue - continue iteration over a list
>   * @pos:	the &struct list_head to use as a loop cursor.
> diff --git a/include/linux/rculist.h b/include/linux/rculist.h
> index 1b11926ddd47..2abba7552605 100644
> --- a/include/linux/rculist.h
> +++ b/include/linux/rculist.h
> @@ -42,6 +42,16 @@ static inline void INIT_LIST_HEAD_RCU(struct list_head *list)
>   */
>  #define list_bidir_prev_rcu(list) (*((struct list_head __rcu **)(&(list)->prev)))
>  
> +/**
> + * list_for_each_rcu - Iterate over a list in an RCU-safe fashion
> + * @pos:	the &struct list_head to use as a loop cursor.
> + * @head:	the head for your list.
> + */
> +#define list_for_each_rcu(pos, head)		  \
> +	for (pos = rcu_dereference((head)->next); \
> +	     !list_is_head(pos, (head)); \
> +	     pos = rcu_dereference(pos->next))
> +
>  /**
>   * list_tail_rcu - returns the prev pointer of the head of the list
>   * @head: the head of the list
> diff --git a/kernel/cgroup/dmem.c b/kernel/cgroup/dmem.c
> index 10b63433f057..e12b946278b6 100644
> --- a/kernel/cgroup/dmem.c
> +++ b/kernel/cgroup/dmem.c
> @@ -14,6 +14,7 @@
>  #include <linux/mutex.h>
>  #include <linux/page_counter.h>
>  #include <linux/parser.h>
> +#include <linux/rculist.h>
>  #include <linux/slab.h>
>  
>  struct dmem_cgroup_region {
> -- 
> 2.47.2
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
