Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 608BC4CD3A7
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 12:39:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 122EF10EA0E;
	Fri,  4 Mar 2022 11:39:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B259F10EA0E
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 11:39:42 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 mr24-20020a17090b239800b001bf0a375440so5028957pjb.4
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Mar 2022 03:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=T0KWcfrVhfRiQuPhzFUu+oUHR0+0iQuCKbqqyufUMXA=;
 b=BS4C5Y1tL4r8PWIRqTmC6gS0HaL1ikR+470ZGcTaIa4wFQYparRJpFgi8byBxYfS+3
 h+/0V9Om3+A1FxjtUhzi8xUX8SQHq+v8HkFoG+J6SemhINeDJSnxowDMKlAz8H8duGxN
 dQUqq+1LAnYBfNHP7SN7AA2Kj/WI0bj5UMk5D1tTDQS+yqA1Cfs9LXdRBoRhuywGMkHh
 uxofCQJrdhXypoU+Kck6or68lCBk3WDfd06ViBAREudViDBHavC9dOljVk6YKVx+g6tI
 ywHzdC7NPv1PVpGFaSAGB5AQ+PPtoXYZIHynTx/iBcL2C16vxnOubx0fFVbm7AZnrUe7
 ko/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=T0KWcfrVhfRiQuPhzFUu+oUHR0+0iQuCKbqqyufUMXA=;
 b=i3OG1hJDh1hP6kD3mn2r7ZYrbDqlEpnJUuNYF0FV7ZWLCE8AtvsMr+KY3Vi052XLlu
 JafyDooWiCN9gBEzytAxlaZfMJ/FxP1oAn2GLW1Bh86enlOeP+onwrZDDlEvdAkSqyhY
 RekhgWrghYr5QtjaWY8oP/WAX4OC5OX1uwqZt2+2NeQk4NO1MTrKBYQGBotPHseB20DI
 0m4kcHFvcDYNyF9/1BlvBRYSlBEW+tp+26RV61dTZ1WT32XW95X6GX7Wq5FATZC+5wbj
 vNSiLUtDeWGNvkR9hQu6ltATBErhsiMAGBte4qPydZK0+w65f++46Xxb5IP9ou3QlZyd
 9ZWg==
X-Gm-Message-State: AOAM532DaA9jL2h5gwP+HvJTvE3fPlGfncw7aeH3i3+K/p28J/V5GReH
 rl7ojJX2bthvmnVspZp8nCs=
X-Google-Smtp-Source: ABdhPJwUeGy/HJBpt8MjGZ13EzUfgfohEC7mxxbk5v1dgWi77zTAJpDwQo+/X8i3EoW7ntQ/oQ2ZNw==
X-Received: by 2002:a17:90b:390c:b0:1bf:2d83:c70c with SMTP id
 ob12-20020a17090b390c00b001bf2d83c70cmr1346393pjb.217.1646393982299; 
 Fri, 04 Mar 2022 03:39:42 -0800 (PST)
Received: from ip-172-31-19-208.ap-northeast-1.compute.internal
 (ec2-18-181-137-102.ap-northeast-1.compute.amazonaws.com. [18.181.137.102])
 by smtp.gmail.com with ESMTPSA id
 e18-20020a63d952000000b00372a1295210sm4394691pgj.51.2022.03.04.03.39.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 03:39:41 -0800 (PST)
Date: Fri, 4 Mar 2022 11:39:29 +0000
From: Hyeonggon Yoo <42.hyeyoo@gmail.com>
To: Byungchul Park <byungchul.park@lge.com>
Subject: Re: [PATCH v4 22/24] dept: Don't create dependencies between
 different depths in any case
Message-ID: <YiH6cXo1qThA1X6B@ip-172-31-19-208.ap-northeast-1.compute.internal>
References: <1646377603-19730-1-git-send-email-byungchul.park@lge.com>
 <1646377603-19730-23-git-send-email-byungchul.park@lge.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1646377603-19730-23-git-send-email-byungchul.park@lge.com>
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

On Fri, Mar 04, 2022 at 04:06:41PM +0900, Byungchul Park wrote:
> Dept already prevents creating dependencies between different depths of
> the class indicated by *_lock_nested() when the lock acquisitions happen
> consecutively.
> 
>    lock A0 with depth
>    lock_nested A1 with depth + 1
>    ...
>    unlock A1
>    unlock A0
> 
> Dept does not create A0 -> A1 dependency in this case, either.
> 
> However, once another class cut in, the code becomes problematic. When
> Dept tries to create real dependencies, it does not only create real
> ones but also wrong ones between different depths of the class.
> 
>    lock A0 with depth
>    lock B
>    lock_nested A1 with depth + 1
>    ...
>    unlock A1
>    unlock B
>    unlock A0
> 
> Even in this case, Dept should not create A0 -> A1 dependency.
> 
> So let Dept not create wrong dependencies between different depths of
> the class in any case.
> 
> Reported-by: 42.hyeyoo@gmail.com
> Signed-off-by: Byungchul Park <byungchul.park@lge.com>
> ---
>  kernel/dependency/dept.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/kernel/dependency/dept.c b/kernel/dependency/dept.c
> index 5d4efc3..cc1b3a3 100644
> --- a/kernel/dependency/dept.c
> +++ b/kernel/dependency/dept.c
> @@ -1458,14 +1458,7 @@ static void add_wait(struct dept_class *c, unsigned long ip,
>  
>  		eh = dt->ecxt_held + i;
>  		if (eh->ecxt->class != c || eh->nest == ne)
> -			break;
> -	}
> -
> -	for (; i >= 0; i--) {
> -		struct dept_ecxt_held *eh;
> -
> -		eh = dt->ecxt_held + i;
> -		add_dep(eh->ecxt, w);
> +			add_dep(eh->ecxt, w);
>  	}
>  
>  	if (!wait_consumed(w) && !rich_stack) {
> -- 
> 1.9.1
> 
> 

Works as expected, Thanks!
I would report if there is anything else interesting.

Tested-by: Hyeonggon Yoo <42.hyeyoo@gmail.com>

-- 
Thank you, You are awesome!
Hyeonggon :-)
