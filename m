Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7491B2563E7
	for <lists+dri-devel@lfdr.de>; Sat, 29 Aug 2020 03:11:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14E826E16D;
	Sat, 29 Aug 2020 01:11:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FEE66E169;
 Sat, 29 Aug 2020 01:11:27 +0000 (UTC)
IronPort-SDR: AqBQGoTMTnGG0qgjniQ/u/OlOpcaJ7B+lAHUA3ZfNbBNAXRLzv9ElcUVZaJ+NanPyr7n4KNqzG
 5O/KcTkgqLZA==
X-IronPort-AV: E=McAfee;i="6000,8403,9727"; a="156030319"
X-IronPort-AV: E=Sophos;i="5.76,365,1592895600"; d="scan'208";a="156030319"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2020 18:11:26 -0700
IronPort-SDR: 8XKr402pDMeWK7gEmQD5xxksZ4Ahvm4WNu5HdK4b4iIc2+2Ue8RLNHxZTUaChm8mBFjg67LmMY
 PwhzpuBP9gVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,365,1592895600"; d="scan'208";a="282549523"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga008.fm.intel.com with ESMTP; 28 Aug 2020 18:11:26 -0700
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 28 Aug 2020 18:10:52 -0700
Received: from fmsmsx151.amr.corp.intel.com (10.18.125.4) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 28 Aug 2020 18:10:52 -0700
Received: from fmsmsx107.amr.corp.intel.com ([169.254.6.136]) by
 FMSMSX151.amr.corp.intel.com ([169.254.7.84]) with mapi id 14.03.0439.000;
 Fri, 28 Aug 2020 18:10:52 -0700
From: "Souza, Jose" <jose.souza@intel.com>
To: "airlied@linux.ie" <airlied@linux.ie>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "Srivatsa, Anusha" <anusha.srivatsa@intel.com>, "Laxminarayan Bharadiya,
 Pankaj" <pankaj.laxminarayan.bharadiya@intel.com>, "trix@redhat.com"
 <trix@redhat.com>, "wambui.karugax@gmail.com" <wambui.karugax@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>, "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Subject: Re: [PATCH] drm/i915/display: fix uninitialized variable
Thread-Topic: [PATCH] drm/i915/display: fix uninitialized variable
Thread-Index: AQHWezZyFQ6O6CxC8EepYMeUJRKygKlOwiWA
Date: Sat, 29 Aug 2020 01:10:51 +0000
Message-ID: <3a93ddc0727676afc8878ca11d0afbebe8e5e4ab.camel@intel.com>
References: <20200825232057.31601-1-trix@redhat.com>
In-Reply-To: <20200825232057.31601-1-trix@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.240.12]
Content-ID: <EA13B763D4D41D4BB2E7EE3CFF27B0EC@intel.com>
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Just merged the first patch that fixed this issue, thanks anyways.

2034c2129bc4a91d471815d4dc7a2a69eaa5338d - drm/i915/display: Ensure that ret is always initialized in icl_combo_phy_verify_state


On Tue, 2020-08-25 at 16:20 -0700, trix@redhat.com wrote:
> From: Tom Rix <
> trix@redhat.com
> >
> 
> clang static analysis flags this error
> 
> intel_combo_phy.c:268:7: warning: The left expression of the
>   compound assignment is an uninitialized value.
>   The computed value will also be garbage
>                 ret &= check_phy_reg(...
>                 ~~~ ^
> 
> ret has no initial values, in icl_combo_phy_verify_state() ret is
> set by the next statment and then updated by similar &= logic.
> 
> Because the check_phy_req() are only register reads, reorder the
> statements.
> 
> Fixes: 239bef676d8e ("drm/i915/display: Implement new combo phy initialization step")
> Signed-off-by: Tom Rix <
> trix@redhat.com
> >
> ---
>  drivers/gpu/drm/i915/display/intel_combo_phy.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_combo_phy.c b/drivers/gpu/drm/i915/display/intel_combo_phy.c
> index 6968de4f3477..7622ef66c987 100644
> --- a/drivers/gpu/drm/i915/display/intel_combo_phy.c
> +++ b/drivers/gpu/drm/i915/display/intel_combo_phy.c
> @@ -264,6 +264,8 @@ static bool icl_combo_phy_verify_state(struct drm_i915_private *dev_priv,
>  	if (!icl_combo_phy_enabled(dev_priv, phy))
>  		return false;
>  
> +	ret = cnl_verify_procmon_ref_values(dev_priv, phy);
> +
>  	if (INTEL_GEN(dev_priv) >= 12) {
>  		ret &= check_phy_reg(dev_priv, phy, ICL_PORT_TX_DW8_LN0(phy),
>  				     ICL_PORT_TX_DW8_ODCC_CLK_SEL |
> @@ -276,8 +278,6 @@ static bool icl_combo_phy_verify_state(struct drm_i915_private *dev_priv,
>  				     DCC_MODE_SELECT_CONTINUOSLY);
>  	}
>  
> -	ret = cnl_verify_procmon_ref_values(dev_priv, phy);
> -
>  	if (phy_is_master(dev_priv, phy)) {
>  		ret &= check_phy_reg(dev_priv, phy, ICL_PORT_COMP_DW8(phy),
>  				     IREFGEN, IREFGEN);
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
