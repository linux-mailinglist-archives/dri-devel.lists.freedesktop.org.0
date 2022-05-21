Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E93FA52F7FF
	for <lists+dri-devel@lfdr.de>; Sat, 21 May 2022 05:25:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8382310F4F3;
	Sat, 21 May 2022 03:25:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C31410F4F2
 for <dri-devel@lists.freedesktop.org>; Sat, 21 May 2022 03:25:12 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id b5so1729532plx.10
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 20:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=srHucyXa3M3L2xwtZzIWQdA+RV7TAlhAfzh/7sAefe8=;
 b=NTqXHE9UCcyj7Bih4sgeeQfhBLD7/niyepd8g2nJpwh3FEhdqVm1Lb13kRt+qOogHX
 owgvx4hSBva1Y9OvIwr3lxDFxN0quT7ul8Bn3r4xRK72lRAQsq+EkrgtbWmPuHWRK0NC
 F6qm2rsKnWWuIqSL0VChbsbwzF9+8rRSLV4wJALe2OQ5bShU3wXbGtUUk8INKcNplcn1
 XGKUi0cUDD5O160LpOhU91QAW8+nMiEd4JkBdWIN3tz8WsBj90ker8ZL5aTmzWWmUEtQ
 eBywN02hMHBhmc8lj22ZmpRGqb9LGM2cPYOtSdJlCd6A1zBO4dfbpedwHHcPTrYaoMFB
 KWiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=srHucyXa3M3L2xwtZzIWQdA+RV7TAlhAfzh/7sAefe8=;
 b=DkeNCSIKIde9LHfsR5WC/9qa/ahpKaq0fOETow7LrlmI85kPcb2k57rBDa9NjJndIN
 tOmdz214ubOIcYPIQxnf2sWTmmIT1u6TN3Qryf6pPQuRUuPIvTRpE68yZX/eI4aCyXA3
 TeMx67foXw2V7XZXGQUMJDOAApsq4j9YhTbBnwK/i9pB0nnVwfrRMIJ8TFWhbCeqz7Qu
 lfN4ZonYf3/jnFGRjXy/c2a2wJV4G5z+Bfu7oLSw+imNy6MtrbuOtKsTs9Xy06ctehug
 KbuB2H/UWM6hco8ujFVAP1EzNHH+ypjlAYh604Y/TWsjhRPSNCzTd7M47FjGo88TFE9y
 Z+6w==
X-Gm-Message-State: AOAM532rqDs40d4tBqS9jaytb2G2VIMkxNORZMlyZv7C7TPIlWzHA8z0
 z2CuJI33RYWRIwhLbBamf9Y=
X-Google-Smtp-Source: ABdhPJz7hkAsuMIxzrZUQvOGLFk7XGtePhFKoNgQzk26Rbwa+SGIYLu8hqxi0XatY3eNzsWsIrWgRg==
X-Received: by 2002:a17:903:3112:b0:161:80df:f11 with SMTP id
 w18-20020a170903311200b0016180df0f11mr12268414plc.68.1653103512206; 
 Fri, 20 May 2022 20:25:12 -0700 (PDT)
Received: from hyeyoo ([114.29.24.243]) by smtp.gmail.com with ESMTPSA id
 e1-20020a170902b78100b0015e8d4eb229sm448235pls.115.2022.05.20.20.24.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 20:25:11 -0700 (PDT)
Date: Sat, 21 May 2022 12:24:56 +0900
From: Hyeonggon Yoo <42.hyeyoo@gmail.com>
To: Byungchul Park <byungchul.park@lge.com>
Subject: Re: [PATCH RFC v6 02/21] dept: Implement Dept(Dependency Tracker)
Message-ID: <YohbiJquna5LlgVv@hyeyoo>
References: <1651652269-15342-1-git-send-email-byungchul.park@lge.com>
 <1651652269-15342-3-git-send-email-byungchul.park@lge.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1651652269-15342-3-git-send-email-byungchul.park@lge.com>
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

On Wed, May 04, 2022 at 05:17:30PM +0900, Byungchul Park wrote:
> CURRENT STATUS
> +/*

[...]

> + * Ensure it has been called on ON/OFF transition.
> + */
> +void dept_enirq_transition(unsigned long ip)
> +{
> +	struct dept_task *dt = dept_task();
> +	unsigned long flags;
> +
> +	if (unlikely(READ_ONCE(dept_stop) || in_nmi()))
> +		return;
> +
> +	/*
> +	 * IRQ ON/OFF transition might happen while Dept is working.
> +	 * We cannot handle recursive entrance. Just ingnore it.
> +	 * Only transitions outside of Dept will be considered.
> +	 */
> +	if (dt->recursive)
> +		return;
> +
> +	flags = dept_enter();
> +
> +	enirq_update(ip);
> +
> +	dept_exit(flags);
> +}

EXPORT_SYMBOL_GPL(dept_enirq_transition);

ERROR: modpost: "dept_enirq_transition" [arch/x86/kvm/kvm-amd.ko] undefined!
ERROR: modpost: "dept_enirq_transition" [arch/x86/kvm/kvm-intel.ko] undefined!

This function needs to be exported for modules.

Thanks.

-- 
Thanks,
Hyeonggon
