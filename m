Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B049B1D58B1
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 20:10:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DF4E6ECED;
	Fri, 15 May 2020 18:10:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC8716ECED
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 18:10:12 +0000 (UTC)
Received: from lwn.net (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id A0FC572D;
 Fri, 15 May 2020 18:10:09 +0000 (UTC)
Date: Fri, 15 May 2020 12:10:08 -0600
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH 11/14] docs: move other kAPI documents to core-api
Message-ID: <20200515121008.4debe669@lwn.net>
In-Reply-To: <70cca102282ccd36b107487c60346f414011c684.1588345503.git.mchehab+huawei@kernel.org>
References: <cover.1588345503.git.mchehab+huawei@kernel.org>
 <70cca102282ccd36b107487c60346f414011c684.1588345503.git.mchehab+huawei@kernel.org>
Organization: LWN.net
MIME-Version: 1.0
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
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Peter Xu <peterx@redhat.com>, Masahiro Yamada <yamada.masahiro@socionext.com>,
 "Joel Fernandes \(Google\)" <joel@joelfernandes.org>,
 Daniel Jordan <daniel.m.jordan@oracle.com>, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Mike Rapoport <rppt@linux.ibm.com>,
 David Airlie <airlied@linux.ie>, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Dan Williams <dan.j.williams@intel.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>, Arnd Bergmann <arnd@arndb.de>,
 Frederic Weisbecker <frederic@kernel.org>,
 "Steven Rostedt \(VMware\)" <rostedt@goodmis.org>,
 Thomas Gleixner <tglx@linutronix.de>, Peter Collingbourne <pcc@google.com>,
 linux-mm@kvack.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Patrick Bellasi <patrick.bellasi@arm.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Tejun Heo <tj@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri,  1 May 2020 17:37:55 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> There are a number of random documents that seem to be
> describing some aspects of the core-api. Move them to such
> directory, adding them at the core-api/index.rst file.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/admin-guide/sysctl/vm.rst                     | 2 +-
>  Documentation/core-api/index.rst                            | 6 ++++++
>  Documentation/{mailbox.txt => core-api/mailbox.rst}         | 0
>  Documentation/{nommu-mmap.txt => core-api/nommu-mmap.rst}   | 0
>  .../{this_cpu_ops.txt => core-api/this_cpu_ops.rst}         | 0
>  .../unaligned-memory-access.rst}                            | 0
>  Documentation/gpu/drm-mm.rst                                | 2 +-
>  arch/Kconfig                                                | 2 +-
>  init/Kconfig                                                | 2 +-
>  mm/Kconfig                                                  | 2 +-
>  mm/nommu.c                                                  | 2 +-
>  11 files changed, 12 insertions(+), 6 deletions(-)
>  rename Documentation/{mailbox.txt => core-api/mailbox.rst} (100%)
>  rename Documentation/{nommu-mmap.txt => core-api/nommu-mmap.rst} (100%)
>  rename Documentation/{this_cpu_ops.txt => core-api/this_cpu_ops.rst} (100%)
>  rename Documentation/{unaligned-memory-access.txt => core-api/unaligned-memory-access.rst} (100%)

This one doesn't apply for me.  Beyond that, I'm not entirely convinced
about a couple of the moves...

 - mailbox.txt seems like driver-api stuff to me?
 - nommu-mmap.txt is mostly (though not completely) about the semantic of
   mmap() options as seen by user space, so perhaps belongs in that
   manual...?

Thanks,

jon
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
