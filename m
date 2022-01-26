Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAEC49C5CA
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 10:06:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D80810E7D3;
	Wed, 26 Jan 2022 09:05:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D29810E7CF;
 Wed, 26 Jan 2022 09:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643187954; x=1674723954;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ggEHQETAv3lIPyDtUG98X3fyvSWeMQrZEDGtYqjDGro=;
 b=mJqXQYE/FWhnZwBPgwVcfapxr3ImCeiy7fkV+Rczx4vE1J9y2pJL0lB3
 waz50JK+QnKVESILDJJsDOAjI+9npdv/K5YcjAIC4iBpTGF3n+kp6e1hy
 bQVdLn4ejSNg+GsT4+LLhC6+MjWostQDisPmSiWD0M1Cdypar5jTlAt1C
 7BO/+OMQbe7g0rw/kVwJMkRlX8/Xn4A7I+6U0S9M1KtRR9NDm0XhicDWp
 c5z6x0QJszlMluTVIj2m426iIMa/57T4sDMdbJ7gaotX6w0Nu9lUgk3zZ
 xQrEx90JATlkMC9PghNsmdrgdSzpNUo4VzjG4rYrB4KDmbHDThGtElVvp A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="309826127"
X-IronPort-AV: E=Sophos;i="5.88,317,1635231600"; d="scan'208";a="309826127"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 01:05:28 -0800
X-IronPort-AV: E=Sophos;i="5.88,317,1635231600"; d="scan'208";a="628246433"
Received: from richardt-mobl1.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.212.143.219])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 01:05:28 -0800
Date: Wed, 26 Jan 2022 01:05:27 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 3/3] drm: Convert open yes/no strings to yesno()
Message-ID: <20220126090527.ksuah5m6xctx7jjo@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220119072450.2890107-1-lucas.demarchi@intel.com>
 <20220119072450.2890107-4-lucas.demarchi@intel.com>
 <Yehm5/DJ5Ljo1EWs@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <Yehm5/DJ5Ljo1EWs@smile.fi.intel.com>
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
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Vishal Kulkarni <vishal@chelsio.com>, netdev@vger.kernel.org,
 Francis Laniel <laniel_francis@privacyrequired.com>,
 Kentaro Takeda <takedakn@nttdata.co.jp>, amd-gfx@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Petr Mladek <pmladek@suse.com>, Leo Li <sunpeng.li@amd.com>,
 intel-gfx@lists.freedesktop.org, Steven Rostedt <rostedt@goodmis.org>,
 Julia Lawall <julia.lawall@lip6.fr>,
 Rahul Lakkireddy <rahul.lakkireddy@chelsio.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 linux-security-module@vger.kernel.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Raju Rangoju <rajur@chelsio.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 19, 2022 at 09:30:47PM +0200, Andy Shevchenko wrote:
>On Tue, Jan 18, 2022 at 11:24:50PM -0800, Lucas De Marchi wrote:
>> linux/string_helpers.h provides a helper to return "yes"/"no"
>> strings. Replace the open coded versions with yesno(). The places were
>> identified with the following semantic patch:
>>
>> 	@@
>> 	expression b;
>> 	@@
>>
>> 	- b ? "yes" : "no"
>> 	+ yesno(b)
>>
>> Then the includes were added, so we include-what-we-use, and parenthesis
>> adjusted in drivers/gpu/drm/v3d/v3d_debugfs.c. After the conversion we
>> still see the same binary sizes:
>>
>>    text    data     bss     dec     hex filename
>> 1442171   60344     800 1503315  16f053 ./drivers/gpu/drm/radeon/radeon.ko
>> 1442171   60344     800 1503315  16f053 ./drivers/gpu/drm/radeon/radeon.ko.old
>> 5985991  324439   33808 6344238  60ce2e ./drivers/gpu/drm/amd/amdgpu/amdgpu.ko
>> 5985991  324439   33808 6344238  60ce2e ./drivers/gpu/drm/amd/amdgpu/amdgpu.ko.old
>>  411986   10490    6176  428652   68a6c ./drivers/gpu/drm/drm.ko
>>  411986   10490    6176  428652   68a6c ./drivers/gpu/drm/drm.ko.old
>> 1970292  109515    2352 2082159  1fc56f ./drivers/gpu/drm/nouveau/nouveau.ko
>> 1970292  109515    2352 2082159  1fc56f ./drivers/gpu/drm/nouveau/nouveau.ko.old
>
>...
>
>>  #include <linux/module.h>
>>  #include <linux/sched.h>
>>  #include <linux/slab.h>
>> +#include <linux/string_helpers.h>
>
>+ blank line?
>
>> +#include <linux/string_helpers.h>
>
>...
>
>>  	seq_printf(m, "\tDP branch device present: %s\n",
>> -		   branch_device ? "yes" : "no");
>> +		   yesno(branch_device));
>
>Now it's possible to keep this on one line.
>
>...
>
>>  	drm_printf_indent(p, indent, "imported=%s\n",
>> -			  obj->import_attach ? "yes" : "no");
>> +			  yesno(obj->import_attach));
>
>81 here, but anyway, ditto!
>
>...
>
>>   */
>
>+blank line here?
>
>> +#include <linux/string_helpers.h>
>> +
>>  #include "aux.h"
>>  #include "pad.h"
>
>...
>
>>  	seq_printf(m, "MMU:        %s\n",
>> -		   (ident2 & V3D_HUB_IDENT2_WITH_MMU) ? "yes" : "no");
>> +		   yesno(ident2 & V3D_HUB_IDENT2_WITH_MMU));
>>  	seq_printf(m, "TFU:        %s\n",
>> -		   (ident1 & V3D_HUB_IDENT1_WITH_TFU) ? "yes" : "no");
>> +		   yesno(ident1 & V3D_HUB_IDENT1_WITH_TFU));
>>  	seq_printf(m, "TSY:        %s\n",
>> -		   (ident1 & V3D_HUB_IDENT1_WITH_TSY) ? "yes" : "no");
>> +		   yesno(ident1 & V3D_HUB_IDENT1_WITH_TSY));
>>  	seq_printf(m, "MSO:        %s\n",
>> -		   (ident1 & V3D_HUB_IDENT1_WITH_MSO) ? "yes" : "no");
>> +		   yesno(ident1 & V3D_HUB_IDENT1_WITH_MSO));
>>  	seq_printf(m, "L3C:        %s (%dkb)\n",
>> -		   (ident1 & V3D_HUB_IDENT1_WITH_L3C) ? "yes" : "no",
>> +		   yesno(ident1 & V3D_HUB_IDENT1_WITH_L3C),
>>  		   V3D_GET_FIELD(ident2, V3D_HUB_IDENT2_L3C_NKB));
>
>I believe it's fine to join back to have less LOCs (yes, it will be 83 or so,
>but I believe in these cases it's very much okay).

now that we are converting to str_yes_no(), we will have a few more
chars. Some maintainers may be more strict on the 80 or 100 chars. I
will assume whatever is in the code base is the preferred form.

thanks
Lucas De Marchi

>
>-- 
>With Best Regards,
>Andy Shevchenko
>
>
