Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BE74AF701
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 17:42:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 427AD10E3AB;
	Wed,  9 Feb 2022 16:42:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D310010E3AB
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 16:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644424968; x=1675960968;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=AopMkDTLeEwKPAPbEXhSp8It23rc+LgvM/ZoX0ip1zg=;
 b=OyaFeK12ymzIMWg8u8HH6LDULdZQnE0xKNZD+MjmdwPorrdoHLVQgwzJ
 gK466eCxw1SrYu5jvzQe44/9SU9YJP9flmOEGjMiQo5hHC/jQ5BZO8doR
 nBaVTIWU9Yi0oCnojmTVGfNObd/VgJ3dsF7tN7LVL/rq7wWzV83S1ID5c
 pvNZcqgENjtsGvowqcBqDsVuCXUNJ9VWKrjqchBlohhHu8KAW0rp9ox7s
 ktiKL5yG7uSUPdHmpATXgcFKACuVdm5t3iEowvQtN/1ZBw0EwBRjbT1x+
 FuAFEiJLWj7HQ0DBF89+G5OTQw7XOJfOgKAfl/0sXc9wa03stckWwXKnT Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="312540155"
X-IronPort-AV: E=Sophos;i="5.88,356,1635231600"; d="scan'208";a="312540155"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 08:42:48 -0800
X-IronPort-AV: E=Sophos;i="5.88,356,1635231600"; d="scan'208";a="633275913"
Received: from smile.fi.intel.com ([10.237.72.61])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 08:42:46 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nHq2N-002g5H-U8; Wed, 09 Feb 2022 18:41:47 +0200
Date: Wed, 9 Feb 2022 18:41:47 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 5/7] (WIP) drm/solomon: Add SSD130X OLED displays SPI
 support
Message-ID: <YgPuy1QVv9A7rcCh@smile.fi.intel.com>
References: <20220209090314.2511959-1-javierm@redhat.com>
 <20220209091204.2513437-1-javierm@redhat.com>
 <CAMuHMdWSDBjpYJv6JtgvyaKiFKh_eqbvH78TR6VBtpDeFJvqFQ@mail.gmail.com>
 <YgPbAL0I8Wn7nnNb@smile.fi.intel.com>
 <d32c731b-c06f-2dcb-5a6d-1a84351719b2@redhat.com>
 <CAMuHMdXsAyp18ivtSe-ZVmu6xbBBnvjMuZ=H1w9Gk=Ys4rkCeg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXsAyp18ivtSe-ZVmu6xbBBnvjMuZ=H1w9Gk=Ys4rkCeg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 09, 2022 at 05:25:03PM +0100, Geert Uytterhoeven wrote:
> On Wed, Feb 9, 2022 at 5:07 PM Javier Martinez Canillas
> <javierm@redhat.com> wrote:

...

> Are they all broken?

I guess it's incorrect question. The one we need to ask is is OF code broken?
B/c ACPI can easily cope with this (they are different buses, can't clash).

-- 
With Best Regards,
Andy Shevchenko


