Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D00486C4875
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 12:03:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC1F210E913;
	Wed, 22 Mar 2023 11:03:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E62310E913
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 11:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679482987; x=1711018987;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Wjvnemr7K7GxTkw8tU1ZW+8hQE4iFHIRWuoX+ttiHQY=;
 b=XNDSWmxt/5Mtx+nzc91/Rz2c1o8jygTdjVJQ0vkdKvxGLV0JcSoXby2Q
 A7E1F7MIE7d5yna3nxl6VI/ZyDU+vhK09TVu+f6U7/8YqcuZl+77RUiR2
 ucoPzmY+fqg/hnArDMwtsa15RxrRUYqvl4Wq2z1gRR3boSrApyHNU/Tlv
 GkRGUzTp30gPUc792F1gC3Dyc01XG0jbJ6hfutPF6EE6AwNjRj7Z6dL11
 gNcUTfgFZsc7cHmRyKQ8WmiMh+27dMjMQl2iUn5Nwn5Ka/6lG5SrLP7P1
 x5dXNF1NnnPmmKI9egtQ8YQQxl5TmaH5zL2jylNXUGe4Cb/9OMM/bR7OR g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="327564761"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; d="scan'208";a="327564761"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 04:03:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="681856602"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; d="scan'208";a="681856602"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga002.jf.intel.com with ESMTP; 22 Mar 2023 04:02:58 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1pewF4-0076sm-1u; Wed, 22 Mar 2023 13:02:54 +0200
Date: Wed, 22 Mar 2023 13:02:54 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Subject: Re: [PATCH v5 0/8] Support ROHM BU27034 ALS sensor
Message-ID: <ZBrgXgJ8AooUSRVW@smile.fi.intel.com>
References: <cover.1679474247.git.mazziesaccount@gmail.com>
 <ZBrSCYp+QrHK47dS@smile.fi.intel.com>
 <87edphnkg1.fsf@minerva.mail-host-address-is-not-set>
 <8fe9fea1-b7b8-ee46-9534-de7e2b1726f9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8fe9fea1-b7b8-ee46-9534-de7e2b1726f9@gmail.com>
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 linux-kselftest@vger.kernel.org, Emma Anholt <emma@anholt.net>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Brendan Higgins <brendan.higgins@linux.dev>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Zhigang Shi <Zhigang.Shi@liteon.com>, Masahiro Yamada <masahiroy@kernel.org>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, devicetree@vger.kernel.org,
 Paul Gazzillo <paul@pgazz.com>, Liam Beguin <liambeguin@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 David Gow <davidgow@google.com>, kunit-dev@googlegroups.com,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 linux-kernel@vger.kernel.org,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Shreeya Patel <shreeya.patel@collabora.com>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 22, 2023 at 12:59:33PM +0200, Matti Vaittinen wrote:
> On 3/22/23 12:34, Javier Martinez Canillas wrote:
> > > On Wed, Mar 22, 2023 at 11:05:23AM +0200, Matti Vaittinen wrote:

...

> > > > - copy code from DRM test helper instead of moving it to simplify
> > > >    merging
> > > 
> > > 1) Why do you think this is a problem?
> > > 2) How would we avoid spreading more copies of the same code in the future?
> > > 
> > > 
> > > 1) Merge conflicts is not a bad thing. It shows that people tested their code
> > > in isolation and stabilized it before submitting to the upper maintainer.
> > > 
> > > https://yarchive.net/comp/linux/git_merges_from_upstream.html
> > > 
> > > 2) Spreading the same code when we _know_ this, should be very well justified.
> > > Merge conflict is an administrative point, and not a technical obstacle to
> > > avoid.
> 
> I definitely agree. This is also why I did the renaming and not copying in
> the first version. In this version I did still add the subsequent patch 2/8
> - which drops the duplicates from DRM tree.
> 
> > I believe this was suggested by Maxime and the rationale is that by just
> > copying the helpers for now, that would make it easier to land instead of
> > requiring coordination between different subystems.
> 
> This is correct.
> 
> > Otherwise the IIO tree will need to provide an inmutable branch for the
> > DRM tree to merge and so on.
> 
> Or, if we carry the patch 1/8 via self-test tree, then we get even more
> players here.
> 
> Still, I am not opposing immutable branch because that would allow fast
> applying of the patch 2/8 as well. Longer that is delayed, more likely we
> will see more users of the DRM helpers and harder it gets to remove the
> duplicates later.
> 
> > I agree with Maxime that a little bit of duplication (that can be cleaned
> > up by each subsystem at their own pace) is the path of least resistance.
> 
> I'd say this depends. It probably is the path of least resistance for people
> maintaining the trees. It can also be the path of least resistance in
> general - but it depends on if there will be no new users for those DRM
> helpers while waiting the new APIs being merged in DRM tree. More users we
> see in DRM, more effort the clean-up requires.
> 
> I have no strong opinion on this specific case. I'd just be happy to see the
> IIO tests getting in preferably sooner than later - although 'soon' and
> 'late' does also depend on other factors besides these helpers...

Since I'm not a maintainer of either, and one of them requires something,
I can't oppose.

-- 
With Best Regards,
Andy Shevchenko


