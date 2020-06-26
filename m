Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE6220B726
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jun 2020 19:35:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BA8E6ECEC;
	Fri, 26 Jun 2020 17:35:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C75766ECEC
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 17:35:04 +0000 (UTC)
Received: from lwn.net (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id C7637374;
 Fri, 26 Jun 2020 17:35:00 +0000 (UTC)
Date: Fri, 26 Jun 2020 11:34:59 -0600
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH v3 0/7] Convert the remaining text files to ReST
Message-ID: <20200626113459.413c3843@lwn.net>
In-Reply-To: <cover.1592918949.git.mchehab+huawei@kernel.org>
References: <cover.1592918949.git.mchehab+huawei@kernel.org>
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Stephen Kitt <steve@sk2.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Pragat Pandya <pragat.pandya@gmail.com>, dri-devel@lists.freedesktop.org,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Harry Wei <harryxiyou@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, "Joel
 Fernandes \(Google\)" <joel@joelfernandes.org>,
 Alex Shi <alex.shi@linux.alibaba.com>, Will Deacon <will@kernel.org>,
 Alexandre Ghiti <alex@ghiti.fr>, Jason Gunthorpe <jgg@ziepe.ca>,
 Phong Tran <tranmanphong@gmail.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 "Frank A. Cancio Bello" <frank@generalsoftwareinc.com>,
 Harald Seiler <hws@denx.de>,
 Ricardo =?UTF-8?B?Q2HDsXVlbG8=?= <ricardo.canuelo@collabora.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>, devicetree@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jonathan =?UTF-8?B?TmV1c2Now6RmZXI=?= <j.neuschaefer@gmx.net>,
 "Steven Rostedt \(VMware\)" <rostedt@goodmis.org>,
 Rob Herring <robh+dt@kernel.org>, Nitin Gupta <nigupta@nvidia.com>,
 Thomas Gleixner <tglx@linutronix.de>, Peter Collingbourne <pcc@google.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@linux.ibm.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-mm@kvack.org,
 Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
 Patrick Bellasi <patrick.bellasi@arm.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Leach <mike.leach@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 23 Jun 2020 15:31:33 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> The main goal of this series is to finish the ReST conversion. After this
> series, we have just those files still in plain old format:
> 
> 	- Documentation/RCU/RTFP.txt
> 	- Documentation/atomic_bitops.txt
> 	- Documentation/memory-barriers.txt
> 	- Documentation/atomic_t.txt
> 	- Documentation/filesystems/dax.txt
> 	- Documentation/filesystems/path-lookup.txt
> 	- Documentation/virt/kvm/devices/README

OK, I've applied this set - glad to see the last one!

Still *not* glad to see the LaTeX markup in the staging stuff; hopefully
we can do something about that soon.

Thanks,

jon
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
