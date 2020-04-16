Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E081ABDBC
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 12:17:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32DDC6E2DF;
	Thu, 16 Apr 2020 10:17:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DF336E2DD
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 10:17:46 +0000 (UTC)
IronPort-SDR: UWVF6zZlxDMUH5gLQo8n4O/qWPtwQvlOqLKQrzYWfRU6MxAj/xLqRmvioVMFNLZbX4ZUHdv8DR
 fLqT8EwzT1GQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2020 03:17:42 -0700
IronPort-SDR: PabvyhK/GDPyBjaf0paWWd5oAAbGpqHHyicWhdVU0osJ1cJkrEV/y2jitUhatIDlUFj03yE+KQ
 +MY52IYzL9ng==
X-IronPort-AV: E=Sophos;i="5.72,390,1580803200"; d="scan'208";a="400622555"
Received: from ellenfax-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.249.44.122])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2020 03:17:34 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Arnd Bergmann <arnd@arndb.de>, Saeed Mahameed <saeedm@mellanox.com>
Subject: Re: [RFC 0/6] Regressions for "imply" behavior change
In-Reply-To: <CAK8P3a3Wx5_bUOKnN3_hG5nLOqv3WCUtMSq6vOkJzWZgsmAz+A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200408202711.1198966-1-arnd@arndb.de>
 <nycvar.YSQ.7.76.2004081633260.2671@knanqh.ubzr>
 <CAK8P3a2frDf4BzEpEF0uwPTV2dv6Jve+6N97z1sSuSBUAPJquA@mail.gmail.com>
 <20200408224224.GD11886@ziepe.ca> <87k12pgifv.fsf@intel.com>
 <7d9410a4b7d0ef975f7cbd8f0b6762df114df539.camel@mellanox.com>
 <20200410171320.GN11886@ziepe.ca>
 <16441479b793077cdef9658f35773739038c39dc.camel@mellanox.com>
 <20200414132900.GD5100@ziepe.ca>
 <CAK8P3a0aFQ7h4zRDW=QLogXWc88JkJJXEOK0_CpWwsRjq6+T+w@mail.gmail.com>
 <20200414152312.GF5100@ziepe.ca>
 <CAK8P3a1PjP9_b5NdmqTLeGN4y+3JXx_yyTE8YAf1u5rYHWPA9g@mail.gmail.com>
 <f6d83b08fc0bc171b5ba5b2a0bc138727d92e2c0.camel@mellanox.com>
 <CAK8P3a1-J=4EAxh7TtQxugxwXk239u8ffgxZNRdw_WWy8ExFoQ@mail.gmail.com>
 <834c7606743424c64951dd2193ca15e29799bf18.camel@mellanox.com>
 <CAK8P3a3Wx5_bUOKnN3_hG5nLOqv3WCUtMSq6vOkJzWZgsmAz+A@mail.gmail.com>
Date: Thu, 16 Apr 2020 13:17:32 +0300
Message-ID: <874ktj4tvn.fsf@intel.com>
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "jernej.skrabec@siol.net" <jernej.skrabec@siol.net>,
 "leon@kernel.org" <leon@kernel.org>,
 "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "masahiroy@kernel.org" <masahiroy@kernel.org>,
 "nico@fluxnic.net" <nico@fluxnic.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "a.hajda@samsung.com" <a.hajda@samsung.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "kieran.bingham+renesas@ideasonboard.com"
 <kieran.bingham+renesas@ideasonboard.com>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "jgg@ziepe.ca" <jgg@ziepe.ca>, "davem@davemloft.net" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 16 Apr 2020, Arnd Bergmann <arnd@arndb.de> wrote:
> On Thu, Apr 16, 2020 at 5:25 AM Saeed Mahameed <saeedm@mellanox.com> wrote:
>> BTW how about adding a new Kconfig option to hide the details of
>> ( BAR || !BAR) ? as Jason already explained and suggested, this will
>> make it easier for the users and developers to understand the actual
>> meaning behind this tristate weird condition.
>>
>> e.g have a new keyword:
>>      reach VXLAN
>> which will be equivalent to:
>>      depends on VXLAN && !VXLAN
>
> I'd love to see that, but I'm not sure what keyword is best. For your
> suggestion of "reach", that would probably do the job, but I'm not
> sure if this ends up being more or less confusing than what we have
> today.

Ah, perfect bikeshedding topic!

Perhaps "uses"? If the dependency is enabled it gets used as a
dependency.

Of course, this is all just talk until someone(tm) posts a patch
actually making the change. I've looked at the kconfig tool sources
before; not going to make the same mistake again.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
