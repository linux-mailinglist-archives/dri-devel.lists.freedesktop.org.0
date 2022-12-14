Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B84064C916
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 13:34:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5091D10E3CD;
	Wed, 14 Dec 2022 12:34:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AAFE10E3CD;
 Wed, 14 Dec 2022 12:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671021254; x=1702557254;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gLUmLxK/mwLgHaeh9UkBdZ9YGpWxeUp7JgHpb5LXdic=;
 b=Kc8ofrMAROV/GHCMIe845KKqAg5nG5w1Sq/xbiwHeOMaSpdGs3MH4Ymn
 8IB/0AHC8yQfmPyhOFGvJVhzU5pIfpCq6H2QMm4jNQxEaMgp8PPs2UzTa
 w5JSmGofyNpS17+oUB4KYI9zInMwvH5hXuq3PVsO+tKdh/D2KZrGzuHCs
 nCWEEHARafv+Q7TQuS9/oy92jX5yGcn9tkUjyRZ6yLGweD4u/EPgoMtPO
 ReSnscCE7Wkljehw/o9uKBLN7NG5ZoWe19l1h2XENkemLYckAghrm5GtZ
 Jp2UUgyI6b9H4/1bLzmWY7vUYGc0qPPejd2LX09kBnQcW2ZvngTBnjpN7 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10560"; a="345460232"
X-IronPort-AV: E=Sophos;i="5.96,244,1665471600"; d="scan'208";a="345460232"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2022 04:34:12 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10560"; a="823243981"
X-IronPort-AV: E=Sophos;i="5.96,244,1665471600"; d="scan'208";a="823243981"
Received: from joe-255.igk.intel.com (HELO localhost) ([172.22.229.67])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2022 04:34:00 -0800
Date: Wed, 14 Dec 2022 13:33:58 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH 1/5] Renaming weak prng invocations -
 prandom_bytes_state, prandom_u32_state
Message-ID: <20221214123358.GA1062210@linux.intel.com>
References: <cover.1670778651.git.david.keisarschm@mail.huji.ac.il>
 <b3caaa5ac5fca4b729bf1ecd0d01968c09e6d083.1670778652.git.david.keisarschm@mail.huji.ac.il>
 <Y5c8KLzJFz/XZMiM@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y5c8KLzJFz/XZMiM@zx2c4.com>
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Peter Zijlstra <peterz@infradead.org>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Alexei Starovoitov <ast@kernel.org>, dri-devel@lists.freedesktop.org,
 Song Liu <song@kernel.org>, Eric Dumazet <edumazet@google.com>,
 linux-mtd@lists.infradead.org, Stanislav Fomichev <sdf@google.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Hyeonggon Yoo <42.hyeyoo@gmail.com>,
 Christoph Lameter <cl@linux.com>, Daniel Borkmann <daniel@iogearbox.net>,
 Richard Weinberger <richard@nod.at>, x86@kernel.org,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 ilay.bahat1@gmail.com, Ingo Molnar <mingo@redhat.com>,
 David Rientjes <rientjes@google.com>, Yonghong Song <yhs@fb.com>,
 Paolo Abeni <pabeni@redhat.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Petr Mladek <pmladek@suse.com>, david.keisarschm@mail.huji.ac.il,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, intel-gfx@lists.freedesktop.org,
 Steven Rostedt <rostedt@goodmis.org>, KP Singh <kpsingh@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Borislav Petkov <bp@alien8.de>, Hannes Reinecke <hare@suse.de>,
 Andy Lutomirski <luto@kernel.org>, Jiri Pirko <jiri@nvidia.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, bpf@vger.kernel.org,
 Vlastimil Babka <vbabka@suse.cz>, Hao Luo <haoluo@google.com>,
 linux-scsi@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-mm@kvack.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Pekka Enberg <penberg@kernel.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, aksecurity@gmail.com,
 Jiri Olsa <jolsa@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 12, 2022 at 03:35:20PM +0100, Jason A. Donenfeld wrote:
> Please CC me on future revisions.
> 
> As of 6.2, the prandom namespace is *only* for predictable randomness.
> There's no need to rename anything. So nack on this patch 1/5.

It is not obvious (for casual developers like me) that p in prandom
stands for predictable. Some renaming would be useful IMHO.

Regards
Stanislaw
