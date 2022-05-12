Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC17C5248AC
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 11:15:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77D0F10E537;
	Thu, 12 May 2022 09:15:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E08610E537
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 09:15:12 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id p8so4238682pfh.8
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 02:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=1yVCgY4QE8l5qFrVqFzJJ9uTK3QajC1JSeAXUrEX5mM=;
 b=MGUdJx5o67V+c7ivUhgeC/BUEADviIwlhokhBxj+J+gl6IETIqORALQLeC353MYEdq
 2Pv50dWwl1qTvK4mqNFOHI069/CG7FyZ13loxUH6lrmM2YVeNsaUmHum8Mp+TTRs/oeh
 ZBGlq/iUg4CymqPWX6MatUagIwHh9sqigv1U1pwp/IFJZbcDC/sE8Y+G0OKSNa80eWYW
 BLyjSxh1M6W5n5yjCmzKLV+ZcSFkjUbkiXtb+XgBTqTcLJ/SB7G8DkotwTzZEmEbSOsa
 oNAFvZbwt1QeW4GoMUD5qskyCou5gc5b1XU1x3Lv9xQyif6Bg+WLMnX/LxkveG9KxCuB
 sqAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=1yVCgY4QE8l5qFrVqFzJJ9uTK3QajC1JSeAXUrEX5mM=;
 b=uuWsUHZnXnU9jZntnPqmtAEJ4S7fXrtNlhrv0bBKDYAaPAS10OgH7d45LdZP/3PlDG
 OPduGyOnMx3P+eroqTIW5g1HV+nxLp59vXVjyLw4DJheDLE4o9P5j960OkbozH9aoPdx
 WspZcedtARBElywZ0+rSf7Y6S/7qzjhAMBkoCckfdTv6ClkmsmRJY6RF+UGwHFZj5SZ/
 iTdNJMvZep/Xnbct9vfT5Wk0nmaDuz9WzA6s4ZFkcA93yJFV/59+gcxXiyvZrAbRiWKT
 ZNkk4DNXMyPvFCtzV24z/89ncTY501urAtTLWCmKt4LU+Q6LqwWjWEhmvCyWcDvELXuj
 hCPw==
X-Gm-Message-State: AOAM530kXYc6kQmssVyPzO0mOMD+7O+aVrky6NvBDHpnmtGNGrf6djQe
 ZoE9ddSmUqmdTvNcmz+DQms=
X-Google-Smtp-Source: ABdhPJxaigst32EHE9ix2EpasU4GC9GvtV1b4JcFlMBs/Eobm4jyuO5205pcB0haARI31D6QIfoeng==
X-Received: by 2002:a05:6a00:885:b0:510:950f:f787 with SMTP id
 q5-20020a056a00088500b00510950ff787mr22839855pfj.83.1652346911472; 
 Thu, 12 May 2022 02:15:11 -0700 (PDT)
Received: from localhost ([2620:10d:c090:400::4:6c64])
 by smtp.gmail.com with ESMTPSA id
 c3-20020a170902724300b0015e8d4eb20esm3353001pll.88.2022.05.12.02.15.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 02:15:10 -0700 (PDT)
Date: Wed, 11 May 2022 23:15:09 -1000
From: Tejun Heo <tj@kernel.org>
To: Byungchul Park <byungchul.park@lge.com>
Subject: Re: [REPORT] syscall reboot + umh + firmware fallback
Message-ID: <YnzQHWASAxsGL9HW@slm.duckdns.org>
References: <1651652269-15342-1-git-send-email-byungchul.park@lge.com>
 <20220512052557.GD18445@X58A-UD3R>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220512052557.GD18445@X58A-UD3R>
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
Cc: hamohammed.sa@gmail.com, jack@suse.cz, peterz@infradead.org,
 daniel.vetter@ffwll.ch, amir73il@gmail.com, david@fromorbit.com,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 bfields@fieldses.org, linux-ide@vger.kernel.org, adilger.kernel@dilger.ca,
 joel@joelfernandes.org, 42.hyeyoo@gmail.com, cl@linux.com, will@kernel.org,
 duyuyang@gmail.com, sashal@kernel.org, paolo.valente@linaro.org,
 damien.lemoal@opensource.wdc.com, willy@infradead.org, hch@infradead.org,
 airlied@linux.ie, mingo@redhat.com, djwong@kernel.org, vdavydov.dev@gmail.com,
 rientjes@google.com, dennis@kernel.org, linux-ext4@vger.kernel.org,
 linux-mm@kvack.org, ngupta@vflare.org, johannes.berg@intel.com, jack@suse.com,
 dan.j.williams@intel.com, josef@toxicpanda.com, rostedt@goodmis.org,
 linux-block@vger.kernel.org, jglisse@redhat.com, viro@zeniv.linux.org.uk,
 tglx@linutronix.de, mhocko@kernel.org, vbabka@suse.cz, melissa.srw@gmail.com,
 sj@kernel.org, tytso@mit.edu, rodrigosiqueiramelo@gmail.com,
 kernel-team@lge.com, gregkh@linuxfoundation.org, jlayton@kernel.org,
 linux-kernel@vger.kernel.org, penberg@kernel.org, minchan@kernel.org,
 mcgrof@kernel.org, holt@sgi.com, hannes@cmpxchg.org,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 torvalds@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

Just took a look out of curiosity.

On Thu, May 12, 2022 at 02:25:57PM +0900, Byungchul Park wrote:
> PROCESS A	PROCESS B	WORKER C
> 
> __do_sys_reboot()
> 		__do_sys_reboot()
>  mutex_lock(&system_transition_mutex)
>  ...		 mutex_lock(&system_transition_mutex) <- stuck
> 		 ...
> 				request_firmware_work_func()
> 				 _request_firmware()
> 				  firmware_fallback_sysfs()
> 				   usermodehelper_read_lock_wait()
> 				    down_read(&umhelper_sem)
> 				   ...
> 				   fw_load_sysfs_fallback()
> 				    fw_sysfs_wait_timeout()
> 				     wait_for_completion_killable_timeout(&fw_st->completion) <- stuck
>  kernel_halt()
>   __usermodehelper_disable()
>    down_write(&umhelper_sem) <- stuck
> 
> --------------------------------------------------------
> All the 3 contexts are stuck at this point.
> --------------------------------------------------------
> 
> PROCESS A	PROCESS B	WORKER C
> 
>    ...
>    up_write(&umhelper_sem)
>  ...
>  mutex_unlock(&system_transition_mutex) <- cannot wake up B
> 
> 		 ...
> 		 kernel_halt()
> 		  notifier_call_chain()
> 		   hw_shutdown_notify()
> 		    kill_pending_fw_fallback_reqs()
> 		     __fw_load_abort()
> 		      complete_all(&fw_st->completion) <- cannot wake up C
> 
> 				   ...
> 				   usermodeheler_read_unlock()
> 				    up_read(&umhelper_sem) <- cannot wake up A

I'm not sure I'm reading it correctly but it looks like "process B" column
is superflous given that it's waiting on the same lock to do the same thing
that A is already doing (besides, you can't really halt the machine twice).
What it's reporting seems to be ABBA deadlock between A waiting on
umhelper_sem and C waiting on fw_st->completion. The report seems spurious:

1. wait_for_completion_killable_timeout() doesn't need someone to wake it up
   to make forward progress because it will unstick itself after timeout
   expires.

2. complete_all() from __fw_load_abort() isn't the only source of wakeup.
   The fw loader can be, and mainly should be, woken up by firmware loading
   actually completing instead of being aborted.

I guess the reason why B shows up there is because the operation order is
such that just between A and C, the complete_all() takes place before
__usermodehlper_disable(), so the whole thing kinda doesn't make sense as
you can't block a past operation by a future one. Inserting process B
introduces the reverse ordering.

Thanks.

-- 
tejun
