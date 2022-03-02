Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B244C9FFE
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 09:54:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA25E10EE76;
	Wed,  2 Mar 2022 08:54:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6389A10EAF9
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 04:53:54 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id o23so631718pgk.13
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Mar 2022 20:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=nNi4rMqg08CCrpEt9N8/H4Odr1aWwbhtB5E4unm3mVA=;
 b=aTK+2SIkmj0YCy3LfaTX7xI10dtEgXOhPOlOkEIAcRmYIhXTVrV+4obrF/HAC/E4RP
 thxxSltqgn80CKK/IsYyTe+37x3HMgPzvwNyTjQHXcxhGEMWPKIfIm8sq7Hcm5uDdlZW
 8mTvAXX2ZDpyOcW0Ipmbvf/oquLo6sUBSVok+Snsw/1O1aisT3Qr7ci4urU2Ghl4WhsM
 can3P6KDsKsQMUf3O4fIedCUVMxSpzs8kqfuwYSkgiyEXDcSaVbiXS8DKUbatpkLCnBL
 0lFlzYMn7OiLjidLwQZAT41PUKCbzY7aFFEFeS+95kobv6MlptrGnaw7GyKYQVJt2Ubb
 3OGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nNi4rMqg08CCrpEt9N8/H4Odr1aWwbhtB5E4unm3mVA=;
 b=WnBDqU3dZ6jqfJjXngXFgsvDU1jEk7JwRs8kNxSFqtQ/B3CyP+VK+TTIlPKU7gyBD2
 73jMUTYNfWFgY3lm1vbWxi4chC/+9oMGSWSxm/7P05RUn+1ViyTv0cORZx7t5RV6M16a
 vQqWYP7XGsBIQES+cIz3IgtN/uyVTn0ndzjp2YO1OB3CZK0zuDKcvu0jkeDToaFIqWHS
 ovC1J4EjREmaHjzNUxxR9mCq1xxPld0rJiAizEf8pPAyffSTt8LhEwEOjO80HJa2SzLP
 B/rgMlNe4jnYej1atYzjFEP08kOBtEjSGueqT5q+8xWkgWbSaqTmlVY0iWdLdZJ76MwO
 rhCg==
X-Gm-Message-State: AOAM530mb+WfUz3fb7W/qcFLjdJuM5FPq3xBVtwkpztSA48I+HS2yk66
 uJ0r8Kuq6VskMLW4ohRl+Og=
X-Google-Smtp-Source: ABdhPJxfU+Zk4/I1aHYGv00DHbooJyvOZzR43S+TPguw15+w148owaMwAlgFuPKmmKJnMgw9jCCjCg==
X-Received: by 2002:a05:6a00:130e:b0:4cc:3c7d:4dec with SMTP id
 j14-20020a056a00130e00b004cc3c7d4decmr31361435pfu.32.1646196833916; 
 Tue, 01 Mar 2022 20:53:53 -0800 (PST)
Received: from ip-172-31-19-208.ap-northeast-1.compute.internal
 (ec2-18-181-137-102.ap-northeast-1.compute.amazonaws.com. [18.181.137.102])
 by smtp.gmail.com with ESMTPSA id
 b1-20020a630c01000000b003758d1a40easm14175994pgl.19.2022.03.01.20.53.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 20:53:53 -0800 (PST)
Date: Wed, 2 Mar 2022 04:53:41 +0000
From: Hyeonggon Yoo <42.hyeyoo@gmail.com>
To: Byungchul Park <byungchul.park@lge.com>
Subject: Re: [PATCH v3 00/21] DEPT(Dependency Tracker)
Message-ID: <Yh74VbNZZt35wHZD@ip-172-31-19-208.ap-northeast-1.compute.internal>
References: <1646042220-28952-1-git-send-email-byungchul.park@lge.com>
 <Yh70VkRkUfwIjPWv@ip-172-31-19-208.ap-northeast-1.compute.internal>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yh70VkRkUfwIjPWv@ip-172-31-19-208.ap-northeast-1.compute.internal>
X-Mailman-Approved-At: Wed, 02 Mar 2022 08:54:41 +0000
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
 joel@joelfernandes.org, cl@linux.com, will@kernel.org, duyuyang@gmail.com,
 sashal@kernel.org, paolo.valente@linaro.org, damien.lemoal@opensource.wdc.com,
 willy@infradead.org, hch@infradead.org, airlied@linux.ie, mingo@redhat.com,
 djwong@kernel.org, vdavydov.dev@gmail.com, rientjes@google.com,
 dennis@kernel.org, linux-ext4@vger.kernel.org, linux-mm@kvack.org,
 ngupta@vflare.org, johannes.berg@intel.com, jack@suse.com,
 dan.j.williams@intel.com, josef@toxicpanda.com, rostedt@goodmis.org,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, jglisse@redhat.com,
 viro@zeniv.linux.org.uk, tglx@linutronix.de, mhocko@kernel.org, vbabka@suse.cz,
 melissa.srw@gmail.com, sj@kernel.org, tytso@mit.edu,
 rodrigosiqueiramelo@gmail.com, kernel-team@lge.com, gregkh@linuxfoundation.org,
 jlayton@kernel.org, linux-kernel@vger.kernel.org, penberg@kernel.org,
 minchan@kernel.org, hannes@cmpxchg.org, tj@kernel.org,
 akpm@linux-foundation.org, torvalds@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 02, 2022 at 04:36:38AM +0000, Hyeonggon Yoo wrote:
> On Mon, Feb 28, 2022 at 06:56:39PM +0900, Byungchul Park wrote:
> > I didn't want to bother you so I was planning to send the next spin
> > after making more progress. However, PATCH v2 reports too many false
> > positives because Dept tracked the bit_wait_table[] wrong way - I
> > apologize for that. So I decided to send PATCH v3 first before going
> > further for those who want to run Dept for now.
> > 
> > There might still be some false positives but not overwhelming.
> >
> 
> Hello Byungchul, I'm running DEPT v3 on my system
> and I see report below.
> 
> Looking at the kmemleak code and comment, I think
> kmemleak tried to avoid lockdep recursive warning
> but detected by DEPT?
>

Forgot to include another warning caused by DEPT.

And comment below might be useful for debugging:

in kmemleak.c:
  43  * Locks and mutexes are acquired/nested in the following order:
  44  *
  45  *   scan_mutex [-> object->lock] -> kmemleak_lock -> other_object->lock (SINGLE_DEPTH_NESTING)
  46  *
  47  * No kmemleak_lock and object->lock nesting is allowed outside scan_mutex
  48  * regions.

===================================================
DEPT: Circular dependency has been detected.
5.17.0-rc1+ #1 Tainted: G        W        
---------------------------------------------------
summary
---------------------------------------------------
*** DEADLOCK ***

context A
    [S] __raw_spin_lock_irqsave(&object->lock:0)
    [W] __raw_spin_lock_irqsave(kmemleak_lock:0)
    [E] spin_unlock(&object->lock:0)

context B
    [S] __raw_spin_lock_irqsave(kmemleak_lock:0)
    [W] _raw_spin_lock_nested(&object->lock:0)
    [E] spin_unlock(kmemleak_lock:0)

[S]: start of the event context
[W]: the wait blocked
[E]: the event not reachable

---------------------------------------------------
context A's detail
---------------------------------------------------
context A
    [S] __raw_spin_lock_irqsave(&object->lock:0)
    [W] __raw_spin_lock_irqsave(kmemleak_lock:0)
    [E] spin_unlock(&object->lock:0)

[S] __raw_spin_lock_irqsave(&object->lock:0):
[<ffffffc00810302c>] scan_gray_list+0x84/0x13c
stacktrace:
      dept_ecxt_enter+0x88/0xf4
      _raw_spin_lock_irqsave+0xf0/0x1c4
      scan_gray_list+0x84/0x13c
      kmemleak_scan+0x2d8/0x54c
      kmemleak_scan_thread+0xac/0xd4
      kthread+0xd4/0xe4
      ret_from_fork+0x10/0x20

[W] __raw_spin_lock_irqsave(kmemleak_lock:0):
[<ffffffc008102ebc>] scan_block+0x3c/0x128
stacktrace:
      __dept_wait+0x8c/0xa4
      dept_wait+0x6c/0x88
      _raw_spin_lock_irqsave+0xb8/0x1c4
      scan_block+0x3c/0x128
      scan_gray_list+0xc4/0x13c
      kmemleak_scan+0x2d8/0x54c
      kmemleak_scan_thread+0xac/0xd4
      kthread+0xd4/0xe4
      ret_from_fork+0x10/0x20

[E] spin_unlock(&object->lock:0):
[<ffffffc008102ee0>] scan_block+0x60/0x128

---------------------------------------------------
context B's detail
---------------------------------------------------
context B
    [S] __raw_spin_lock_irqsave(kmemleak_lock:0)
    [W] _raw_spin_lock_nested(&object->lock:0)
    [E] spin_unlock(kmemleak_lock:0)

[S] __raw_spin_lock_irqsave(kmemleak_lock:0):
[<ffffffc008102ebc>] scan_block+0x3c/0x128
stacktrace:
      dept_ecxt_enter+0x88/0xf4
      _raw_spin_lock_irqsave+0xf0/0x1c4
      scan_block+0x3c/0x128
      kmemleak_scan+0x19c/0x54c
      kmemleak_scan_thread+0xac/0xd4
      kthread+0xd4/0xe4
      ret_from_fork+0x10/0x20

[W] _raw_spin_lock_nested(&object->lock:0):
[<ffffffc008102f34>] scan_block+0xb4/0x128
stacktrace:
      dept_wait+0x74/0x88
      _raw_spin_lock_nested+0xa8/0x1b0
      scan_block+0xb4/0x128
      kmemleak_scan+0x19c/0x54c
      kmemleak_scan_thread+0xac/0xd4
      kthread+0xd4/0xe4
      ret_from_fork+0x10/0x20
[E] spin_unlock(kmemleak_lock:0):
[<ffffffc008102ee0>] scan_block+0x60/0x128
stacktrace:
      dept_event+0x7c/0xfc
      _raw_spin_unlock_irqrestore+0x8c/0x120
      scan_block+0x60/0x128
      kmemleak_scan+0x19c/0x54c
      kmemleak_scan_thread+0xac/0xd4
      kthread+0xd4/0xe4
      ret_from_fork+0x10/0x20
---------------------------------------------------
information that might be helpful
---------------------------------------------------
CPU: 1 PID: 38 Comm: kmemleak Tainted: G        W         5.17.0-rc1+ #1
Hardware name: linux,dummy-virt (DT)
Call trace:
 dump_backtrace.part.0+0x9c/0xc4
 show_stack+0x14/0x28
 dump_stack_lvl+0x9c/0xcc
 dump_stack+0x14/0x2c
 print_circle+0x2d4/0x438
 cb_check_dl+0x6c/0x70
 bfs+0xc0/0x168
 add_dep+0x88/0x11c
 add_wait+0x2d0/0x2dc
 __dept_wait+0x8c/0xa4
 dept_wait+0x6c/0x88
 _raw_spin_lock_irqsave+0xb8/0x1c4
 scan_block+0x3c/0x128
 scan_gray_list+0xc4/0x13c
 kmemleak_scan+0x2d8/0x54c
 kmemleak_scan_thread+0xac/0xd4
 kthread+0xd4/0xe4
 ret_from_fork+0x10/0x20

> ===================================================
> DEPT: Circular dependency has been detected.
> 5.17.0-rc1+ #1 Tainted: G        W
> ---------------------------------------------------
> summary
> ---------------------------------------------------
> *** AA DEADLOCK ***
> 
> context A
>     [S] __raw_spin_lock_irqsave(&object->lock:0)
>     [W] _raw_spin_lock_nested(&object->lock:0)
>     [E] spin_unlock(&object->lock:0)
> 
> [S]: start of the event context
> [W]: the wait blocked
> [E]: the event not reachable
> ---------------------------------------------------
> context A's detail
> ---------------------------------------------------
> context A
>     [S] __raw_spin_lock_irqsave(&object->lock:0)
>     [W] _raw_spin_lock_nested(&object->lock:0)
>     [E] spin_unlock(&object->lock:0)
> 
> [S] __raw_spin_lock_irqsave(&object->lock:0):
> [<ffffffc00810302c>] scan_gray_list+0x84/0x13c
> stacktrace:
>       dept_ecxt_enter+0x88/0xf4
>       _raw_spin_lock_irqsave+0xf0/0x1c4
>       scan_gray_list+0x84/0x13c
>       kmemleak_scan+0x2d8/0x54c
>       kmemleak_scan_thread+0xac/0xd4
>       kthread+0xd4/0xe4
>       ret_from_fork+0x10/0x20
> 
> [E] spin_unlock(&object->lock:0):
> [<ffffffc008102ee0>] scan_block+0x60/0x128
> ---------------------------------------------------
> information that might be helpful
> ---------------------------------------------------
> CPU: 1 PID: 38 Comm: kmemleak Tainted: G        W         5.17.0-rc1+ #1
> Hardware name: linux,dummy-virt (DT)
> Call trace:
>  dump_backtrace.part.0+0x9c/0xc4
>  show_stack+0x14/0x28
>  dump_stack_lvl+0x9c/0xcc
>  dump_stack+0x14/0x2c
>  print_circle+0x2d4/0x438
>  cb_check_dl+0x44/0x70
>  bfs+0x60/0x168
>  add_dep+0x88/0x11c
>  add_wait+0x2d0/0x2dc
>  __dept_wait+0x8c/0xa4
>  dept_wait+0x6c/0x88
>  _raw_spin_lock_nested+0xa8/0x1b0
>  scan_block+0xb4/0x128
>  scan_gray_list+0xc4/0x13c
>  kmemleak_scan+0x2d8/0x54c
>  kmemleak_scan_thread+0xac/0xd4
>  kthread+0xd4/0xe4
>  ret_from_fork+0x10/0x20
>
[...]

--
Thank you, You are awesome!
Hyeonggon :-)
