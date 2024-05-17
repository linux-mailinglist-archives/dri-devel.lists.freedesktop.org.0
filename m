Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B03E08C8B17
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 19:36:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D39910EF3C;
	Fri, 17 May 2024 17:36:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RB5PiJp6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A97510EF37;
 Fri, 17 May 2024 17:36:39 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-1eeabda8590so15115185ad.0; 
 Fri, 17 May 2024 10:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715967399; x=1716572199; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=rzMfxbAB8QJEcJdIySGROcUOqAKXWq8nqUdcExbi1Zk=;
 b=RB5PiJp6QFwFLKg+b7D4SwL0yoN4nsX69s/iIDOwYan1XKgYWnSNKSk/5xOFSBrK+P
 Pj1+ZqF7/rPCGwG2j+chcWb+Z4rnNlL5VaC0/3Q/e03XjPMDODyFWK7z1mHturBowJPc
 ZaAJmXhglBQjo3ZFjeXAsuIoE1QSj4Xi1n5YPlITmxOxW02Kceu3+t9bX5wvgLduXGnC
 YOSKG65CZaQzSwPLoZuT19hE0vtncnGtW1572LqUW965QNwy/vGwiNPoiWcDW6J98lzO
 qcTpwLTQs0UFUqEY79tlJ7/wnKrhdllNXs2W/OnYoBqmRJE8IXKk9f4VjQeUiZVLQsGp
 ztCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715967399; x=1716572199;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rzMfxbAB8QJEcJdIySGROcUOqAKXWq8nqUdcExbi1Zk=;
 b=wp/lu6ZqyViFGfyDQgpiojvMnPacUSdmPbygb79J7oUl75XyF0HUBspgUCzIe/ibOn
 Pb6yDU+Q5kBjrUdEH+BXaUtdZnmYGTqfQz7z/8BFi2uOHjX4IPgMK4ljcyLC9gjsS8Cr
 BHq5uvTRxsC0Mq4i6ez9r91xf9yNCurdstRqGFZafIzpl0QloxoedBS5KOb5T5Q+wOJw
 hzS6qV6WI4iNRcvCXIXfgtYBy1iHLQKuYcm1QMm+c5dvC5E9T/xqlPUnc85RTOgf+nao
 fNR+eqyOPrMFens2eZUtuxFsQy2R5pXR8DE424p8Lf6h3CITSz3I14UH8eDZi5mHya1L
 WowQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMGypGSdZu/gd6V1nFzWwgVfgfjxFBmjyqGc7hlc7npj1WQYvoe/Uf64xJ0wQUewYpi9U7IiviZ3b+cnaZycUvi6RbnxOGtq3YkyqYG/HTdZrLIhDt3jZgAllMH11yY/6tFuqtjy3I/5yBd/ltH9O7FFcMkj9D3vWbzn5UHV6bxns0hsWU2fS2uz2OyQ05UsHCtktXt/2eDvCWscQ+kVTGKBvbwWPvvBvg/2OalNH1btaPgT59jQ27zI64PvU6OMkpE2+maU98Nvy6T7UOEnPf
X-Gm-Message-State: AOJu0YyvsM8nXLvr6OfDRkdxtD4h8FgEPl0lxsUV6AS45D+BR45BNZXh
 DDwzF0ePLL+1jjT/h8f2xU0nEpUnr3P/sq8ZsQqy1CTVQ7CkAMLWjiYDUA==
X-Google-Smtp-Source: AGHT+IHJ9PZtASiLb9HJkYrHy1DRhdQlVEuKbRr0NYIRv4Tx+av91BIA0wx1gBcIQQlm9sd2COIQnQ==
X-Received: by 2002:a17:90a:9606:b0:2b9:a299:928e with SMTP id
 98e67ed59e1d1-2b9a29994c9mr10436893a91.24.1715967398710; 
 Fri, 17 May 2024 10:36:38 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2b67105666csm15749258a91.8.2024.05.17.10.36.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 May 2024 10:36:38 -0700 (PDT)
Date: Fri, 17 May 2024 10:36:37 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Linux trace kernel <linux-trace-kernel@vger.kernel.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
 linux-block@vger.kernel.org, linux-cxl@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-rdma@vger.kernel.org, linux-pm@vger.kernel.org,
 iommu@lists.linux.dev, linux-tegra@vger.kernel.org,
 netdev@vger.kernel.org, linux-hyperv@vger.kernel.org,
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org, ath12k@lists.infradead.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 linux-usb@vger.kernel.org, linux-bcachefs@vger.kernel.org,
 linux-nfs@vger.kernel.org, ocfs2-devel@lists.linux.dev,
 linux-cifs@vger.kernel.org, linux-xfs@vger.kernel.org,
 linux-edac@vger.kernel.org, selinux@vger.kernel.org,
 linux-btrfs@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-hwmon@vger.kernel.org,
 io-uring@vger.kernel.org, linux-sound@vger.kernel.org,
 bpf@vger.kernel.org, linux-wpan@vger.kernel.org,
 dev@openvswitch.org, linux-s390@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net, Julia Lawall <Julia.Lawall@inria.fr>
Subject: Re: [PATCH] tracing/treewide: Remove second parameter of
 __assign_str()
Message-ID: <5080f4c5-e0b3-4c2e-9732-f673d7e6ca66@roeck-us.net>
References: <20240516133454.681ba6a0@rorschach.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240516133454.681ba6a0@rorschach.local.home>
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

On Thu, May 16, 2024 at 01:34:54PM -0400, Steven Rostedt wrote:
> From: "Steven Rostedt (Google)" <rostedt@goodmis.org>
> 
> [
>    This is a treewide change. I will likely re-create this patch again in
>    the second week of the merge window of v6.10 and submit it then. Hoping
>    to keep the conflicts that it will cause to a minimum.
> ]
> 
> With the rework of how the __string() handles dynamic strings where it
> saves off the source string in field in the helper structure[1], the
> assignment of that value to the trace event field is stored in the helper
> value and does not need to be passed in again.
> 
> This means that with:
> 
>   __string(field, mystring)
> 
> Which use to be assigned with __assign_str(field, mystring), no longer
> needs the second parameter and it is unused. With this, __assign_str()
> will now only get a single parameter.
> 
> There's over 700 users of __assign_str() and because coccinelle does not
> handle the TRACE_EVENT() macro I ended up using the following sed script:
> 
>   git grep -l __assign_str | while read a ; do
>       sed -e 's/\(__assign_str([^,]*[^ ,]\) *,[^;]*/\1)/' $a > /tmp/test-file;
>       mv /tmp/test-file $a;
>   done
> 
> I then searched for __assign_str() that did not end with ';' as those
> were multi line assignments that the sed script above would fail to catch.
> 

Building csky:allmodconfig (and others) ... failed
--------------
Error log:
In file included from include/trace/trace_events.h:419,
                 from include/trace/define_trace.h:102,
                 from drivers/cxl/core/trace.h:737,
                 from drivers/cxl/core/trace.c:8:
drivers/cxl/core/./trace.h:383:1: error: macro "__assign_str" passed 2 arguments, but takes just 1

This is with the patch applied on top of v6.9-8410-gff2632d7d08e.
So far that seems to be the only build failure.
Introduced with commit 6aec00139d3a8 ("cxl/core: Add region info to
cxl_general_media and cxl_dram events"). Guess we'll see more of those
towards the end of the commit window.

Guenter
