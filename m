Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 522A0201C49
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jun 2020 22:20:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D8026EA51;
	Fri, 19 Jun 2020 20:20:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E124B6EA51
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jun 2020 20:20:34 +0000 (UTC)
Received: from lwn.net (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 642172CD;
 Fri, 19 Jun 2020 20:20:31 +0000 (UTC)
Date: Fri, 19 Jun 2020 14:20:30 -0600
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH 00/22] ReST conversion patches (final?)
Message-ID: <20200619142030.6feed35e@lwn.net>
In-Reply-To: <cover.1592203650.git.mchehab+huawei@kernel.org>
References: <cover.1592203650.git.mchehab+huawei@kernel.org>
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
Cc: Rich Felker <dalias@libc.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Catalin Marinas <catalin.marinas@arm.com>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, linux-pci@vger.kernel.org,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 David Howells <dhowells@redhat.com>, linux-mm@kvack.org,
 Harry Wei <harryxiyou@gmail.com>, Paul Mackerras <paulus@samba.org>,
 Alex Shi <alex.shi@linux.alibaba.com>, Will Deacon <will@kernel.org>,
 Javi Merino <javi.merino@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>, linux-sh@vger.kernel.org,
 Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Derek Kiernan <derek.kiernan@xilinx.com>, linux-crypto@vger.kernel.org,
 Ohad Ben-Cohen <ohad@wizery.com>, devicetree@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>, linux-pm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, Bjorn Helgaas <bhelgaas@google.com>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Amit Daniel Kachhap <amit.kachhap@gmail.com>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, tee-dev@lists.linaro.org,
 Vinod Koul <vkoul@kernel.org>, keyrings@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Masami Hiramatsu <mhiramat@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dmaengine@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Jens Wiklander <jens.wiklander@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 15 Jun 2020 08:50:05 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> That's my final(*) series of conversion patches from .txt to ReST.
> 
> (*) Well, running the script I'm using to check, I noticed a couple of new *.txt files.
> If I have some time, I'll try to address those last pending things for v5.9.

OK, I've applied the set except for parts:

 1: |copy| as mentioned before
 18: because of the license boilerplate
 19: doesn't apply at all (perhaps because of one of the above)
 22: because I don't like the latex markup.

Also, I took the liberty of just reverting the |copy| change in #10.

Getting there..!

Thanks,

jon
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
