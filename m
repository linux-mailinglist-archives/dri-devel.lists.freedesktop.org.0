Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9A94AF50C
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 16:20:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A9F010E1EC;
	Wed,  9 Feb 2022 15:20:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59E8F10E2A5
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 15:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644420051; x=1675956051;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1qF9ZzEYHSVAbbuXXq6Cc2EQ1ZCdoWN2hl6SvPjqJd0=;
 b=mG9AbxjhNS0AL1X6661I6gTd4JJ7gALjQtzVrHSP0ts2VFi5KmgQjttY
 w71s1ufJ7dmikch6WErH9mgaS9wD1hyGlk6GPsGjXOeuyQGFxBejx5cYV
 mMquakGhTd08/H/UodYyfnHKGYyDnPYMKnRpbjA24Cwwe30AlbTJEMWQS
 0kjF5x1i4Icj5+9/FvGvB/gxo0vHaEYBh85c6mRSLHXivNIbqSjFjq9Uh
 42lurZ5jn6Sr2Rk1rF+XS+k/41cGFVWRJAwYgDz8mGvojmKYsZb6MXa1P
 zO1PpQvIBpniN2Fq80IQ1uMO2pNYoR7vGI+N/F1IBM+rv8pAFXICUpjqv Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="312519488"
X-IronPort-AV: E=Sophos;i="5.88,356,1635231600"; d="scan'208";a="312519488"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 07:20:50 -0800
X-IronPort-AV: E=Sophos;i="5.88,356,1635231600"; d="scan'208";a="701284968"
Received: from smile.fi.intel.com ([10.237.72.61])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 07:20:48 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nHol4-002ebE-4m; Wed, 09 Feb 2022 17:19:50 +0200
Date: Wed, 9 Feb 2022 17:19:49 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v3 5/7] (WIP) drm/solomon: Add SSD130X OLED displays SPI
 support
Message-ID: <YgPbleB+LAQ5ZXyB@smile.fi.intel.com>
References: <20220209090314.2511959-1-javierm@redhat.com>
 <20220209091204.2513437-1-javierm@redhat.com>
 <CAMuHMdWSDBjpYJv6JtgvyaKiFKh_eqbvH78TR6VBtpDeFJvqFQ@mail.gmail.com>
 <e6efb2fd-300e-5282-1f2e-a68130d0b45a@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e6efb2fd-300e-5282-1f2e-a68130d0b45a@redhat.com>
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 09, 2022 at 02:04:17PM +0100, Javier Martinez Canillas wrote:
> On 2/9/22 13:25, Geert Uytterhoeven wrote:
> > On Wed, Feb 9, 2022 at 10:12 AM Javier Martinez Canillas
> > <javierm@redhat.com> wrote:

> Yes, I know. Didn't feel like it, because the patch is a WIP anyways
> (I haven't tested it but was included just for illustration purposes).
> 
> If someone confirms that works then I will include a proper DT binding
> in the next revision.

In a few weeks I hope I can do this.

But you know Linux is almost always broken (*) on the certain embedded device
if nobody keep an eye each rc cycle. It might take time to return it in shape
first.

*) Speaking out of my own experience with device(s) that I possess.

-- 
With Best Regards,
Andy Shevchenko


