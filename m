Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D067D1E80D6
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 16:49:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B56E46E922;
	Fri, 29 May 2020 14:49:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BD5A6E921
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 14:49:18 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id nu7so1423850pjb.0
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 07:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=IteRcXXajwbtNBJuddDZT526vs0ZDhNnSpFmn8yamV0=;
 b=N2lJ9F/4/3HpzR/J93sxrFdqGlVz2QNhGMFIycNuy00m6veP+w2xnnditHihQIFXnL
 XCqnug4fq5fbhUlWxzOjXXHpHuSdsRGl38B/e6pOTxpS3O0ArAhFReLuF1TrhT95SEC1
 m9Mxjr53v0I0p+Z26i7nqIoQoQyWYIDSUoGm8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IteRcXXajwbtNBJuddDZT526vs0ZDhNnSpFmn8yamV0=;
 b=lW/rb6xRFgy4zGn87soEUNzdP6nXgqyTWuyHcrWnvqgvO+i7ZggvewfyfcFiNZfF4J
 KEh/r7mGXvIykKAtuGThGGdPCBLsZCjgn3hbzbP8QPKqqDi9pnEZxCXyRSV9TpEISgFz
 +VMYUomqttdRn7/ScfHuukSx9MDUFMJhTi8zO7PgtDDADCB71r/37sSJr3xwnO6pTHAX
 IUnWEl+6kLSuUPBOTtVEbMcpNQhKuEF7gRH1X9sQTEbcfuVveBEqg3Gga/hMWXplubDZ
 L36joEgUqOZWpsmPz75PTTjFcijcirCjYWexM/xVsAahhIP+7sDoJsGAARYTbuv7FgP/
 a72Q==
X-Gm-Message-State: AOAM530Y5hZyMugj1wGxEH6rvxlsa+2T2Btmvs3xKOLW9Ed5Z82womjx
 YnCU6o7eeHNATgIKE5UrLHk89A==
X-Google-Smtp-Source: ABdhPJzFHib1KyRD9/QyczMF6fwrQXT/kFQagYx7n1WCZ6zEYqL92DxL1gm98yo73HrZ3ypBekLGug==
X-Received: by 2002:a17:902:ab8b:: with SMTP id
 f11mr9427824plr.145.1590763757769; 
 Fri, 29 May 2020 07:49:17 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id w185sm1049497pfw.145.2020.05.29.07.49.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 07:49:16 -0700 (PDT)
Date: Fri, 29 May 2020 07:49:15 -0700
From: Kees Cook <keescook@chromium.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: [Intel-gfx] [PATCH 06/13] ocfs2: use new sysctl subdir helper
 register_sysctl_subdir()
Message-ID: <202005290748.043EFFA3F@keescook>
References: <20200529074108.16928-1-mcgrof@kernel.org>
 <20200529074108.16928-7-mcgrof@kernel.org>
 <202005290121.C78B4AC@keescook>
 <20200529114912.GC11244@42.do-not-panic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200529114912.GC11244@42.do-not-panic.com>
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
Cc: jack@suse.cz, rafael@kernel.org, airlied@linux.ie, amir73il@gmail.com,
 clemens@ladisch.de, dri-devel@lists.freedesktop.org,
 joseph.qi@linux.alibaba.com, sfr@canb.auug.org.au, mark@fasheh.com,
 rdna@fb.com, yzaikin@google.com, arnd@arndb.de,
 intel-gfx@lists.freedesktop.org, julia.lawall@lip6.fr, jlbec@evilplan.org,
 nixiaoming@huawei.com, vbabka@suse.cz, axboe@kernel.dk, tytso@mit.edu,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ebiederm@xmission.com, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, ocfs2-devel@oss.oracle.com,
 viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 29, 2020 at 11:49:12AM +0000, Luis Chamberlain wrote:
> Yikes, sense, you're right. Nope, I left the random config tests to
> 0day. Will fix, thanks!

Yeah, I do the same for randconfig, but I always do an "allmodconfig"
build before sending stuff. It's a good smoke test.

-- 
Kees Cook
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
