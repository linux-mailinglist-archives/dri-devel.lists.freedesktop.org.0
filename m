Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A99916A1EF
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 10:21:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D8D96E249;
	Mon, 24 Feb 2020 09:20:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2E346E4B7
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2020 00:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=IoauFu+SPVxJ/QgMkD5H70t6W74upwBHouoPWlRKDBs=; b=mlZk+5DHPSke/pQ6XCytBfGkjH
 hkIgPJ+WZD70eJKDNBWwAy9MSR8hIq6WZ2I3LBjGVsjOVdMZlPU3nFzTPi6C8vFZYM4masCDI5A/M
 MCydby8lJ2dnhxOTkf2kTNzbTmVlYfO+kfMRMj1NN5HqKnpwjnzGPWiJHgh7S0nc1Jncl4iSVtEUx
 xtXS5ven+MNBNrhjRAY5CrOWTYTggZ61qDjrdfkmrqGcqbl9rSJEei60nQDhM+lOnXvVvGHwVnUhr
 qW5PgludRb3NWWqKCTfcQVul57sEuSJ3O6PdAyYm5UVBblNcN2yKCTH+WCpme3XZvdwnjrUtIoILk
 At1JJZMw==;
Received: from [2601:1c0:6280:3f0::19c2]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j5Is1-0000Tu-Eh; Sat, 22 Feb 2020 00:42:19 +0000
Subject: Re: [PATCH v3 1/4] PM / EM: add devices to Energy Model
To: Lukasz Luba <lukasz.luba@arm.com>, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-imx@nxp.com
References: <20200221194731.13814-1-lukasz.luba@arm.com>
 <20200221194731.13814-2-lukasz.luba@arm.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <4ac6a187-1a09-335d-5c05-bf810ff81aaa@infradead.org>
Date: Fri, 21 Feb 2020 16:42:10 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200221194731.13814-2-lukasz.luba@arm.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 24 Feb 2020 09:20:26 +0000
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
Cc: nm@ti.com, juri.lelli@redhat.com, peterz@infradead.org,
 viresh.kumar@linaro.org, liviu.dudau@arm.com, bjorn.andersson@linaro.org,
 bsegall@google.com, Morten.Rasmussen@arm.com, amit.kucheria@verdurent.com,
 lorenzo.pieralisi@arm.com, vincent.guittot@linaro.org, khilman@kernel.org,
 daniel.lezcano@linaro.org, steven.price@arm.com, cw00.choi@samsung.com,
 mingo@redhat.com, mgorman@suse.de, rui.zhang@intel.com,
 alyssa.rosenzweig@collabora.com, orjan.eide@arm.com, b.zolnierkie@samsung.com,
 s.hauer@pengutronix.de, rostedt@goodmis.org, matthias.bgg@gmail.com,
 Dietmar.Eggemann@arm.com, airlied@linux.ie, javi.merino@arm.com,
 tomeu.vizoso@collabora.com, qperret@google.com, sboyd@kernel.org,
 rjw@rjwysocki.net, agross@kernel.org, kernel@pengutronix.de,
 sudeep.holla@arm.com, patrick.bellasi@matbug.net, shawnguo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,
One minor nit. Please see inline:

On 2/21/20 11:47 AM, Lukasz Luba wrote:
> Add support of other devices into the Energy Model framework not only the
> CPUs. Change the interface to be more unified which can handle other
> devices as well.
> 
> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
> ---
>  Documentation/power/energy-model.rst     | 133 ++++----
> 
> diff --git a/Documentation/power/energy-model.rst b/Documentation/power/energy-model.rst
> index 90a345d57ae9..7576820664e5 100644
> --- a/Documentation/power/energy-model.rst
> +++ b/Documentation/power/energy-model.rst

> @@ -85,13 +89,20 @@ API.
>  2.3 Accessing performance domains
>  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>  
> +There is two API functions which provide the access to the energy model:

   There are two

> +em_cpu_get() which takes CPU id as an argument and em_pd_get() with device
> +pointer as an argument. It depends on the subsystem which interface it is
> +going to use, but in case of CPU devices both functions return the same
> +performance domain.
> +


cheers.
-- 
~Randy

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
