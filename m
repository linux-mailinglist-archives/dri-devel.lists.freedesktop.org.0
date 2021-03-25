Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA756349B6B
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 22:09:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41F356EE3E;
	Thu, 25 Mar 2021 21:09:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABA846EE3B
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 21:09:50 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id p19so1941768wmq.1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 14:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=D6jgdCVEyK+inHE9cOQf76p/lV4ao2SuEIL5qX2f+ag=;
 b=cIGAlnmXM9wAevgq6pFP3e39RwcKzNPf/LMxqgs2aZKCQyZO18Hs50+XbQIfFhKrdP
 A3J7HITo1rmfQkwfgGSN7GI6eZx/CTliXY4gapGVswMZV8wKZAJFmWZPaKBKPk8dpO6n
 wT8Bmdo5nj8kVQKMFZ5WsJTymCUHcrueXiAJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=D6jgdCVEyK+inHE9cOQf76p/lV4ao2SuEIL5qX2f+ag=;
 b=n7P8zfRUXgkurDs/v6IczhQLdtD7eyRtbOYhjXtas5DejLxpN1VKbaZV10tNaHuUyZ
 P8SyLUfKgqCmcbclrVh3CYTk0jhNuEW4H7LiBd7U/Uut+rin+/Qcw+fT7l6NbuVR0jy8
 PY6NRk1D2mMBYy1jNa/u3Mars46NA7zJOHa6mR0/Qq5qIk+yCTjyl+PYV43fHmsFp1+O
 moFinNtazgOnprAPnFfhq6vdu+29ATlDyMQPlcH/cb1u2+dUpIpRMmf94df+SlITCJ5O
 XeWqjRpho+3dGnJmJL7BqOZIgq2ZdAkcIk+HgH4q6sIdoTnKJ0BlUZ3w9Agtogdv8B8/
 nlsw==
X-Gm-Message-State: AOAM530jQ0tDXqXzzEjPw+xpPYc1zzUFLSzJujG1gM/N79/pVMI5EeTG
 S6Ceke9EOAs4Bhb6vEtrO3CYt/cUqidrCT7z
X-Google-Smtp-Source: ABdhPJwEEsNSXI1y3HYQw4G9LlTb1RBpX6JXEmm5fqWfsqqJvVGXm3j62kuSywAJGdqa0JDVXXvuSQ==
X-Received: by 2002:a1c:3d8a:: with SMTP id k132mr9678246wma.71.1616706589395; 
 Thu, 25 Mar 2021 14:09:49 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l1sm7782004wrv.87.2021.03.25.14.09.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 14:09:48 -0700 (PDT)
Date: Thu, 25 Mar 2021 22:09:46 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Arkadiusz Hiler <arek@hiler.eu>
Subject: Re: [igt-dev] [PATCH i-g-t 2/5] tests: Build gem_concurrent_all with
 meson
Message-ID: <YFz8Gje1NPcu5ohy@phenom.ffwll.local>
References: <20210325185915.51590-1-arek@hiler.eu>
 <20210325185915.51590-2-arek@hiler.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210325185915.51590-2-arek@hiler.eu>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 25, 2021 at 08:59:12PM +0200, Arkadiusz Hiler wrote:
> ...and add it to test-list-full.txt just like we do when building with
> autotools.
> 
> Signed-off-by: Arkadiusz Hiler <arek@hiler.eu>

tbh it might be time to sunset this. I kinda started it, it grew to
astronomical combinatorial combinations, it's been on the skiplist since
ages, and there's even more stuff on the skiplist. Looking at the history
it started very benign to tests some pwrite/pread vs rendering
synchronization issues. But it's definitely not doing just that anymore.

But maybe in a next patch series.

On the series: Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  tests/meson.build | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/tests/meson.build b/tests/meson.build
> index 54a1a3c7..8e3cd390 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -402,6 +402,19 @@ test_list_target = custom_target('testlist',
>  	      install : true,
>  	      install_dir : libexecdir)
>  
> +test_executables += executable('gem_concurrent_all', 'i915/gem_concurrent_all.c',
> +	   dependencies : test_deps + [ libatomic ],
> +	   install_dir : libexecdir,
> +	   install_rpath : libexecdir_rpathdir,
> +	   install : true)
> +test_list += 'gem_concurrent_all'
> +
> +test_list_full_target = custom_target('testlist-full',
> +	      output : 'test-list-full.txt',
> +	      command : [ gen_testlist, '@OUTPUT@', test_list ],
> +	      install : true,
> +	      install_dir : libexecdir)
> +
>  test_script = find_program('igt_command_line.sh')
>  foreach prog : test_list
>  	test('testcase check ' + prog, test_script, args : prog)
> -- 
> 2.31.0
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
