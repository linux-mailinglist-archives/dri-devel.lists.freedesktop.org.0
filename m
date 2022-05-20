Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B69952E226
	for <lists+dri-devel@lfdr.de>; Fri, 20 May 2022 03:50:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 438A011A3AA;
	Fri, 20 May 2022 01:50:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1A1011A321
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 01:50:00 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 l7-20020a17090aaa8700b001dd1a5b9965so6705072pjq.2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 18:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=bSYkUjPvAsu074e/VjNGWfjNftItgD9OU7BKxmchNu0=;
 b=IctWEQwULe+HOgPbU7d0NJ3bNOOh3R/ed9A6ET0Gs/piG+Bes/Utvzo/JOuyGD8RRU
 RcDWQ8n8fK3gVNdg7zOFFUdQGbLx/Yeu4mzOrLYeaNU76aARYW0jjqtvRRXuDmBVfrna
 g7qU8icOdLj7kU6hSvSdtAKN4mYIBgh28Dejc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bSYkUjPvAsu074e/VjNGWfjNftItgD9OU7BKxmchNu0=;
 b=pjwipSko4VHjvm6R+Fs5DBlCCyHelDz4IBfIiJLlWM4F6TBE7gjHaLC7726A6yaP2Y
 TMU2ZPT1j1qJz3SXtO63HAV+uw+u3Hpo6MFt3KZBuJmM1M61uIE1LRn33vEHm+D+JrZz
 MsaDMsbQGJRB04ZVn/aihT1+1K7jKQzoDgtYZ9+yVm254++2xHWzPAUshXWwPLPhB4zH
 F2Hc1tP3oZ3xsEQEeMWC87uXpw+xspicifgfzGRVmCpnRu5q15ziRTvcFHarjVLyzEvr
 vyZhcvA0SG8WN7wkZ2aGoWme788/NENqHTRdJmug+9pb3FYqkYFUQsm9SpeHlSAfWv3C
 iNFw==
X-Gm-Message-State: AOAM531AZfWRGlhtOAe23PQJErWBUApTsEupy+eWV3fMU7ne5/a4p5y3
 uFdxsKQuIQehkKg5tD3CmQwwcQ==
X-Google-Smtp-Source: ABdhPJxYCaKfJrQpyhnMwy4bw/c5zkQ+q174lh8wbUasjk9l4ZAUxrQCXZ8SzukBnlB3+yq5G+ayIg==
X-Received: by 2002:a17:902:9887:b0:151:6e1c:7082 with SMTP id
 s7-20020a170902988700b001516e1c7082mr7427960plp.162.1653011400364; 
 Thu, 19 May 2022 18:50:00 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 a23-20020a056a001d1700b0050dc76281ddsm329776pfx.183.2022.05.19.18.49.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 18:50:00 -0700 (PDT)
Date: Thu, 19 May 2022 18:49:59 -0700
From: Kees Cook <keescook@chromium.org>
To: Kalesh Singh <kaleshsingh@google.com>
Subject: Re: [RFC PATCH] procfs: Add file path and size to /proc/<pid>/fdinfo
Message-ID: <202205191848.DEE05F6@keescook>
References: <20220519214021.3572840-1-kaleshsingh@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220519214021.3572840-1-kaleshsingh@google.com>
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
Cc: linux-doc@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Christoph Anton Mitterer <mail@christoph.anton.mitterer.name>,
 kernel-team@android.com, Randy Dunlap <rdunlap@infradead.org>,
 ilkos@google.com, linux-kernel@vger.kernel.org,
 Colin Cross <ccross@google.com>, tjmercier@google.com,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-fsdevel@vger.kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 surenb@google.com, Sumit Semwal <sumit.semwal@linaro.org>,
 Mike Rapoport <rppt@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 19, 2022 at 02:40:15PM -0700, Kalesh Singh wrote:
> [...]
> +	seq_file_path(m, file, "\n");
> +	seq_putc(m, '\n');
>  
>  	/* show_fd_locks() never deferences files so a stale value is safe */
>  	show_fd_locks(m, file, files);

This comment implies "file" might be stale? Does that mean anything for
the above seq_file_path()?

-- 
Kees Cook
