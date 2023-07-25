Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 903957618D6
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 14:51:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3F9010E11A;
	Tue, 25 Jul 2023 12:51:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 133D810E110;
 Tue, 25 Jul 2023 12:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690289488; x=1721825488;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=eC9JYYny7fzTWzMint7Bf1073AJMuH1Fj6VitKBlCJs=;
 b=QOD6+StajrLJsOzZ3DPaewJqEVlsqZM/3l64ZxDlyg3hprHQCVJjQVcY
 KTQ1DlfbK1GiWbSWaNetPDRomVYgDlzP4lwATqQCzhy97+fqKD3oL4Q+v
 ok0KqjNb0U4HvGoq8Cd38j4c7fa5Xq5VbZ0kwvWd4nlO1bF5h5JdKTnYm
 CdZ04QX2ME3eoTcZYNhZb9kqN+VniGd8Cos1EZ5DwR/LGY9lIbjpyMMMS
 WfwL3ETFcQA/uBHTwOZ43YoP0O8B4kDBsUmdIGcc+mv7Nz5lJyYnbN+1G
 MIE7XpNcxyKhhL+FlNnz89aMVKuIGlBkLRhObF8M+4z2d9k/msl6Kb4Sy w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="431512469"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="431512469"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 05:51:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="720056033"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="720056033"
Received: from kshutemo-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.249.37.237])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 05:51:21 -0700
Date: Tue, 25 Jul 2023 14:51:18 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v3 1/1] drm/i915: Move abs_diff() to math.h
Message-ID: <ZL/FRsllUVUhruAZ@ashyti-mobl2.lan>
References: <20230724082511.3225-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230724082511.3225-1-andriy.shevchenko@linux.intel.com>
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
Cc: linux-fbdev@vger.kernel.org, Nikita Shubin <nikita.shubin@maquefel.me>,
 Jani Nikula <jani.nikula@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <sboyd@kernel.org>,
 Nikita Shubin via B4 Relay <devnull+nikita.shubin.maquefel.me@kernel.org>,
 linux-serial@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Ilpo =?iso-8859-15?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Jiri Slaby <jirislaby@kernel.org>, Alexey Dobriyan <adobriyan@gmail.com>,
 Helge Deller <deller@gmx.de>, Andi Shyti <andi.shyti@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andy,

On Mon, Jul 24, 2023 at 11:25:11AM +0300, Andy Shevchenko wrote:
> abs_diff() belongs to math.h. Move it there.
> This will allow others to use it.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Jiri Slaby <jirislaby@kernel.org> # tty/serial

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
