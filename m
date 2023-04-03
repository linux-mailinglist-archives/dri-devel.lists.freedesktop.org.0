Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F057E6D3D6E
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 08:38:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B234010E13C;
	Mon,  3 Apr 2023 06:38:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB70310E135;
 Mon,  3 Apr 2023 06:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680503892; x=1712039892;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YEXhV0uzaSiFsmG4l1VvJPWQxhFEPUlWOxEKz7d1G2c=;
 b=mQ88q/QXps4fBTLVozHMQopEyyBsZTKsR/f/tS2TXk9XRS7V2fBkNDf4
 YD78oRzzG3H77xSrNE1FAQMDw00IGYvpMtvkaV6kaf4vvSDGfnfhXPI2/
 plvBB3jJ6fPwQ1RY0lFj1px1h57dsAWIgpYc4+U2LPsdG/SCbuaEfASB/
 L6bb5qZXrH1t0UWLoYmD8ro2jLvIkreEavd3UiZkcUeY0J4jcFHhpdrWk
 gmlC5SV037BgSmnWquT2ZNnpc0A62AFtc2aHeGia+muKyu4OCB5n/Ze1Z
 OgzuDwTpR++fp+e1G9c/pZM2lbAxC0uYZyyhDSlLHaHC0MtUicieRb5PA A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="344377800"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400"; d="scan'208";a="344377800"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2023 23:38:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="718426379"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400"; d="scan'208";a="718426379"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP; 02 Apr 2023 23:38:11 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Sun, 2 Apr 2023 23:38:10 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Sun, 2 Apr 2023 23:38:10 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Sun, 2 Apr 2023 23:38:10 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Sun, 2 Apr 2023 23:38:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m1qqFwAl8JyNrgI40U6+VkHLgF/MNp1SMc1wvGCEiKymAnm1pP6t2M9InG6eiNtNKGDvHHjO8glqb/GZ8HI4mkBAAitb/bCQHGeKsAVdaoyKeNowXsq4BRD0PtotoJCEcwSK9bl77gJ02d8e5VnO3QI/rHp2ROTQoiku7pNvsw5kXjAEyhmQUpS8wgNUb+lD2Tz8jsWSJmQ69BAhp10mGbrhNvdg5K7M/WXZYYKs9JZIsd1zz2XNOEbE0lp0Jk0OIDktLtom4eMY28VhY992GcRTCO/Mpd/OkPMqGjTR7I7EBIWSnq1Qct1QUCYRrMqEKzdegVN1xR3G4Feu+oMEjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/BFue3v3RoA+6u++xxpWcNRvyHJLoRXj7pdB3Pjdx1M=;
 b=ZQr1DKUglVuYvpeFH/+Px30gS4SPBTOsON8w6T4UYwFhaD6bHqEYWkMMjgJWxdSQD1F0uK4z20oMV1mJN3WOL3OJCJalkgwXCXA/J69MKJkfcVxKQe4FTGKrADQ1OTNPghm1oDjsL7mycHvdoAKpgNVcXrVu7xKWE3TC6XOFbZVSzmTjdSdLF0Zw1B3hr73lr37/RN+9WbCaVE0rVYkhI3T2y/rH82YC8sv93Tx1F7XGUtSQMEB6KfXsgJwsp1itCoJOBb5DakTGS5HtgLIawXBNJlEGjpt+Rv2Mc5elqSFQXGm4pnbSPBYnd5Kh5lUfyzyeWQj8LGwH+ixaYBOmCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by CH0PR11MB5707.namprd11.prod.outlook.com (2603:10b6:610:110::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Mon, 3 Apr
 2023 06:38:04 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::3541:e31b:6f64:d993]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::3541:e31b:6f64:d993%9]) with mapi id 15.20.6254.033; Mon, 3 Apr 2023
 06:38:04 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Mark Yacoub <markyacoub@chromium.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: RE: [PATCH v8 04/10] drm/hdcp: Expand HDCP helper library for
 enable/disable/check
Thread-Topic: [PATCH v8 04/10] drm/hdcp: Expand HDCP helper library for
 enable/disable/check
Thread-Index: AQHZZB3nILf5jDDOD02iEcWcHfbhvq8ZIyEQ
Date: Mon, 3 Apr 2023 06:38:04 +0000
Message-ID: <SN7PR11MB67502316C626397D2000115EE3929@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20230331221213.1691997-1-markyacoub@google.com>
 <20230331221213.1691997-5-markyacoub@google.com>
In-Reply-To: <20230331221213.1691997-5-markyacoub@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|CH0PR11MB5707:EE_
x-ms-office365-filtering-correlation-id: ea494dec-97c8-40d7-fa02-08db340dfa93
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZP589uLnC6CeyH8W/MSh4xuuFDhONoXGbTXJ3kfRDSHn6GFpWPeYGbl9fx/ibHKAzscnRQ2HeSinhD85GJp2y6pk1HlKx4ff7RcGGI6NMq0JssnVItCHgy/LfDnskNE1P6m6tG+0EjzwoEh5EzXMvWWveN0i25yNt0PwK/VlABtiQA5SYYTISeV8rFjTX+C/q58fZvsxPBLm4vV47PF/Lv3F4PUd08l6clkv4Y5G0jwJSrlDAZnhXdg7bUo9czkZK0i3xe5fuLPtkL+Q3msmgxR4oaVEfh9atx+mvIZ85miVqVRQDuOn3UnHAbDt1fTwD11awqQtynOUh5GBBw0zr812meyWVBlq64xALQA3NcWYeyIhKsIgs09fiminlpsv5ULZF0vRxMxM17WC39HrYvLIG/F+JivXHeBRAxvAxKnXXrVZaTZH8B/al0hLV+1CO8diRVGsOXU+Mmtp9taxG8L0frf4t2rmR1C5WK+FLUSj9ocu4xY2gpFTG0SPNQ6eQzaic4vAKVbSynCsd4lhok+4AT58UM3Nk4OsgyHkBetIN7nEclPb1aX24XUr34AT7nucRsN7olGiSBwLt+KRYsS3RtMUDU1Ps/aCuURzhqAIrsPrN4co3nRqaRy/pbHt
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(136003)(39860400002)(346002)(376002)(396003)(451199021)(9686003)(53546011)(6506007)(26005)(7696005)(83380400001)(186003)(71200400001)(4326008)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(8936002)(8676002)(5660300002)(52536014)(41300700001)(478600001)(30864003)(2906002)(110136005)(54906003)(316002)(55016003)(33656002)(38070700005)(86362001)(122000001)(82960400001)(38100700002)(559001)(579004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CgZZXZZsZYfIVGFYyPn43cQXIhbkdKjO2l8BmxUqiRdzU7r+X2Hw0DJynQCk?=
 =?us-ascii?Q?/Kr/Gn745va8e2Wg22LMVdHkkXQwi3f9hV2dzQ9L3ojxvY48onFHkRxU3gvp?=
 =?us-ascii?Q?qUndwyVodeY189RrKkFtzf5d5vpNdSYyul+Ql8N4m/uR/P29ecXyHWsB3ew4?=
 =?us-ascii?Q?0D5Ak9cGvGXRfw1+BRtaaz4Z2BZJtGg1mTSzV++AfkWZERMWLudOVuDloRSF?=
 =?us-ascii?Q?efvWQQbn2gUkjrJkNbyl2tSSWVKaUVBsH2k+W+NQDN3ODbwcjh+4gFDAuu3K?=
 =?us-ascii?Q?98XDaQWpw1n9Ja7ynVTfre1QnqebA1zuhaYnLZ+Rb2vkO2M6HLCPXmcBKitY?=
 =?us-ascii?Q?5FCjCalBwZyaEvUqKynb+mHaVBIPwsVxL9xsnDbmxBL+HHKCxNN43ftKTQfk?=
 =?us-ascii?Q?ZyHPzw1fmA3oi/CiXJpuorQuEbVFgEqLCNDhp8iCspyYihr7CvLnBnghN9+a?=
 =?us-ascii?Q?YsMZQCvGxIxvTgTII/dbhwvq2A+y9C3IyeeM8vwwYU+Py44QTd6e6/LaT381?=
 =?us-ascii?Q?Fx0pLEqMjxbtAS1N3lEIFdLAOAO1fH6C10au8Mwlx7VGoremScLjGktywchq?=
 =?us-ascii?Q?19qm0jnE3Uwgnk6P/GpqUb71X8JHIghswv8JK6ECVhVC/4V+r7M5gyIO/ZYl?=
 =?us-ascii?Q?/ZfC5WhtkkvOBuV/Y/CvFQiSMeVd4PqY409D3LCnEaW/NrlXJm1XEQ2S3BHk?=
 =?us-ascii?Q?PU4Z/2fZYhNAQ1mGFQ0TkybazEGA1En54tsYC9YeJnbFwuqc/m1G6EUwdZa8?=
 =?us-ascii?Q?7iEtP9zRsfvCKMcO3dbSxoCGeIdX5esc+2+1+3hmnHEa78HL1IqbzNGAHtrw?=
 =?us-ascii?Q?/1g3va3SE9s3dJU7G5Egayr3WjoBiBU+tVammvH+0COLbzig2bR771NSOeub?=
 =?us-ascii?Q?oFaIPCGUyZHMdcoKjaHBz9+4NbQpB9rXdkZt4vre53L5NjumqU35NlurZuOt?=
 =?us-ascii?Q?XqwrVj1tD+tCS699J4ZgmGJVufP1zvftAz5OyRQAFE9gfqDNhFL8xc5SbmDO?=
 =?us-ascii?Q?F4N9iJuNU8PQoKsvvqd8uhIpc2is1aK7W2aUUozdaXnhHPOABSYlmWMvsTGf?=
 =?us-ascii?Q?A4yGKj2sbNgkZl3fQ+hk6VxND4YHn8IPyEgxHxAWN1W2C0CrD7W6DvG5ZcUI?=
 =?us-ascii?Q?NYos0L+bl9EFXBey/u7hGcsMCr5Zd+pt0MY3uj4F7bH2HNWZECAfRKCVDjjD?=
 =?us-ascii?Q?2b/Ay7JmmTDSZl8wd2uK/S3T6g2EVyWOJthqSZUyD3AtjTRh3rjqMhfk1g22?=
 =?us-ascii?Q?ajhcT1dmrLs2yiQXiCFgOd6XI4DeGGwHp7SMyR/3N46F2AYC1oibYyQT+199?=
 =?us-ascii?Q?HZA3yYlb39k5zOBBu1noYslptBG2YFOsfqPrFpr1Ekv7mbj5th/eDzHxqKbx?=
 =?us-ascii?Q?kjjIsh8KXZbO/pLpgBlJEsX0SWQA+V2P1WO3wBCUKsvZxNK21CeY6urPz12O?=
 =?us-ascii?Q?gLQ7LWdErXe9u3e3XwPk/+Lz3o9z6fW/ngwt2lykDcOB/Y0Rd1yQzdwBsSK1?=
 =?us-ascii?Q?PtJBUMvFiTVNMECYpP0SLlKbkCfqOH4F6Rp7i8tBNBQjUq9dWlqByeNO6g9Q?=
 =?us-ascii?Q?WnpDcJo5+2eIdBbnNNEOrB9VndKVWXx1FtyJTpq4?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea494dec-97c8-40d7-fa02-08db340dfa93
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2023 06:38:04.6228 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6ZcNQhiTiG+SkE3FtUpNYGKrIESuYlV1EP8p8Ow9cxs81VulooKtITDnIeXtYGa2EhI5b1952qbIK6krRpivMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5707
X-OriginatorOrg: intel.com
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dianders@chromium.org" <dianders@chromium.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Mark Yacoub <markyacoub@chromium.org>
> Sent: Saturday, April 1, 2023 3:42 AM
> To: David Airlie <airlied@gmail.com>; Daniel Vetter <daniel@ffwll.ch>
> Cc: seanpaul@chromium.org; Kandpal, Suraj <suraj.kandpal@intel.com>;
> dianders@chromium.org; dri-devel@lists.freedesktop.org;
> freedreno@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; Nikula,=
 Jani
> <jani.nikula@intel.com>; Mark Yacoub <markyacoub@chromium.org>; linux-
> kernel@vger.kernel.org
> Subject: [PATCH v8 04/10] drm/hdcp: Expand HDCP helper library for
> enable/disable/check
>=20
> From: Sean Paul <seanpaul@chromium.org>
>=20
> Expand upon the HDCP helper library to manage HDCP enable, disable, and
> check.
>=20
> Previous to this patch, the majority of the state management and sink
> interaction is tucked inside the Intel driver with the understanding
> that once a new platform supported HDCP we could make good decisions
> about what should be centralized. With the addition of HDCP support
> for Qualcomm, it's time to migrate the protocol-specific bits of HDCP
> authentication, key exchange, and link checks to the HDCP helper.
>=20
> In terms of functionality, this migration is 1:1 with the Intel driver,
> however things are laid out a bit differently than with intel_hdcp.c,
> which is why this is a separate patch from the i915 transition to the
> helper. On i915, the shim vtable is used to account for HDMI vs. DP
> vs. DP-MST differences whereas the helper library uses a LUT to
> account for the register offsets and a remote read function to route
> the messages. On i915, storing the sink information in the source is
> done inline whereas now we use the new drm_hdcp_helper_funcs vtable
> to store and fetch information to/from source hw. Finally, instead of
> calling enable/disable directly from the driver, we'll leave that
> decision to the helper and by calling drm_hdcp_helper_atomic_commit()
> from the driver. All told, this will centralize the protocol and state
> handling in the helper, ensuring we collect all of our bugs^Wlogic
> in one place.
>=20
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
>=20
> ---
> Changes in v2:
> -Fixed set-but-unused variable identified by 0-day
> Changes in v3:
> -Fixed uninitialized variable warning identified by 0-day
> Changes in v4:
> -None
> Changes in v5:
> -None
> Changes in v6:
> -Fixed typo in function descriptions
> -Rebased: Moved the new code between drm_hdcp.h and
> drm_hdcp_helper.c/h
> -Add missing headers. Reported-by: kernel test robot <lkp@intel.com>
> Changes in v7:
> - Add a |driver_data| field to some functions in drm_hdcp_helper_funcs
>   that are called by the driver so drivers can pass anything they such
>   as bridges
> - Isolate all non-common code between HDMI and DP into separate
>   functions instead of manually checking for datra->aux
> Changes in v8 (suraj):
> -Try hdcp 1.x if hdcp2_capable returns an error instead of goto out.
> -set the enabled type to either 1 or 0 depending on the prop as hdcp2
> can support either.
>=20
>  drivers/gpu/drm/display/drm_hdcp_helper.c | 1215
> +++++++++++++++++++++
>  include/drm/display/drm_hdcp.h            |  287 +++++
>  include/drm/display/drm_hdcp_helper.h     |   51 +-
>  3 files changed, 1552 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/display/drm_hdcp_helper.c
> b/drivers/gpu/drm/display/drm_hdcp_helper.c
> index 3ee1a6ae26c53..3bc0308cc95d8 100644
> --- a/drivers/gpu/drm/display/drm_hdcp_helper.c
> +++ b/drivers/gpu/drm/display/drm_hdcp_helper.c
> @@ -6,13 +6,18 @@
>   * Ramalingam C <ramalingam.c@intel.com>
>   */
>=20
> +#include <linux/delay.h>
>  #include <linux/device.h>
>  #include <linux/err.h>
>  #include <linux/gfp.h>
> +#include <linux/i2c.h>
> +#include <linux/iopoll.h>
>  #include <linux/export.h>
>  #include <linux/slab.h>
>  #include <linux/firmware.h>
> +#include <linux/workqueue.h>
>=20
> +#include <drm/display/drm_dp_helper.h>
>  #include <drm/display/drm_hdcp_helper.h>
>  #include <drm/drm_sysfs.h>
>  #include <drm/drm_print.h>
> @@ -507,3 +512,1213 @@ bool drm_hdcp_has_changed(struct
> drm_connector *connector,
>  	return old_hdcp !=3D new_hdcp;
>  }
>  EXPORT_SYMBOL(drm_hdcp_has_changed);
> +
> +struct drm_hdcp_hdcp1_receiver_reg_lut {
> +	unsigned int bksv;
> +	unsigned int ri;
> +	unsigned int aksv;
> +	unsigned int an;
> +	unsigned int ainfo;
> +	unsigned int v[5];
> +	unsigned int bcaps;
> +	unsigned int bcaps_mask_repeater_present;
> +	unsigned int bstatus;
> +};
> +
> +static const struct drm_hdcp_hdcp1_receiver_reg_lut
> drm_hdcp_hdcp1_ddc_lut =3D {
> +	.bksv =3D DRM_HDCP_DDC_BKSV,
> +	.ri =3D DRM_HDCP_DDC_RI_PRIME,
> +	.aksv =3D DRM_HDCP_DDC_AKSV,
> +	.an =3D DRM_HDCP_DDC_AN,
> +	.ainfo =3D DRM_HDCP_DDC_AINFO,
> +	.v =3D { DRM_HDCP_DDC_V_PRIME(0), DRM_HDCP_DDC_V_PRIME(1),
> +	       DRM_HDCP_DDC_V_PRIME(2), DRM_HDCP_DDC_V_PRIME(3),
> +	       DRM_HDCP_DDC_V_PRIME(4) },
> +	.bcaps =3D DRM_HDCP_DDC_BCAPS,
> +	.bcaps_mask_repeater_present =3D
> DRM_HDCP_DDC_BCAPS_REPEATER_PRESENT,
> +	.bstatus =3D DRM_HDCP_DDC_BSTATUS,
> +};
> +
> +static const struct drm_hdcp_hdcp1_receiver_reg_lut
> drm_hdcp_hdcp1_dpcd_lut =3D {
> +	.bksv =3D DP_AUX_HDCP_BKSV,
> +	.ri =3D DP_AUX_HDCP_RI_PRIME,
> +	.aksv =3D DP_AUX_HDCP_AKSV,
> +	.an =3D DP_AUX_HDCP_AN,
> +	.ainfo =3D DP_AUX_HDCP_AINFO,
> +	.v =3D { DP_AUX_HDCP_V_PRIME(0), DP_AUX_HDCP_V_PRIME(1),
> +	       DP_AUX_HDCP_V_PRIME(2), DP_AUX_HDCP_V_PRIME(3),
> +	       DP_AUX_HDCP_V_PRIME(4) },
> +	.bcaps =3D DP_AUX_HDCP_BCAPS,
> +	.bcaps_mask_repeater_present =3D DP_BCAPS_REPEATER_PRESENT,
> +
> +	/*
> +	 * For some reason the HDMI and DP HDCP specs call this register
> +	 * definition by different names. In the HDMI spec, it's called
> BSTATUS,
> +	 * but in DP it's called BINFO.
> +	 */
> +	.bstatus =3D DP_AUX_HDCP_BINFO,
> +};
> +
> +/*
> + * Read a DPCD register.
> + *
> + * @data: drm_hdcp_helper_data containing the DisplayPort AUX channel
> (SST or MST)
> + * @offset: address of the (first) register to read
> + * @value: buffer to store the register values
> + * @len: number of bytes in @value
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int drm_hdcp_remote_dpcd_read(struct drm_hdcp_helper_data *data,
> +			      unsigned int offset, u8 *value, size_t len)
> +{
> +	ssize_t ret;
> +	struct drm_dp_aux *aux =3D data->aux;
> +
> +	ret =3D drm_dp_dpcd_read(aux, offset, value, len);
> +	if (ret !=3D len) {
> +		if (ret >=3D 0)
> +			return -EIO;
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_hdcp_remote_dpcd_read);
> +
> +/*
> + * Read a value from a remote DDC bus.
> + *
> + * @data: drm_hdcp_helper_data containing the i2c_adapter.
> + * @offset: Offset of the value to read.
> + * @value: Pointer to the value to read.
> + * @len: Length of the value to read.
> + *
> + * Returns 0 on success or a negative error code on failure.
> + */
> +
> +int drm_hdcp_remote_ddc_read(struct drm_hdcp_helper_data *data,
> +			     unsigned int offset, u8 *value, size_t len)
> +{
> +	int ret;
> +	struct i2c_adapter *i2c =3D data->connector->ddc;
> +	u8 start =3D offset & 0xff;
> +	struct i2c_msg msgs[] =3D { { .addr =3D DRM_HDCP_DDC_ADDR,
> +				    .flags =3D 0,
> +				    .len =3D 1,
> +				    .buf =3D &start },
> +				  { .addr =3D DRM_HDCP_DDC_ADDR,
> +				    .flags =3D I2C_M_RD,
> +				    .len =3D len,
> +				    .buf =3D value } };
> +	ret =3D i2c_transfer(i2c, msgs, ARRAY_SIZE(msgs));
> +	if (ret =3D=3D ARRAY_SIZE(msgs))
> +		return 0;
> +	return ret >=3D 0 ? -EIO : ret;
> +}
> +EXPORT_SYMBOL(drm_hdcp_remote_ddc_read);
> +
> +/*
> + * Write to a DPCD register.
> + *
> + * @data: drm_hdcp_helper_data containing the DisplayPort AUX channel
> (SST or MST)
> + * @offset: Offset of the DPCD register to read from
> + * @value: Pointer to store the DPCD register data
> + * @len: Number of bytes to read
> + *
> + * Returns:
> + * Zero on success or a negative error code on failure
> + */
> +int drm_hdcp_remote_dpcd_write(struct drm_hdcp_helper_data *data,
> +			       unsigned int offset, u8 *value, size_t len)
> +{
> +	ssize_t ret;
> +	struct drm_dp_aux *aux =3D data->aux;
> +
> +	ret =3D drm_dp_dpcd_write(aux, offset, value, len);
> +	if (ret !=3D len) {
> +		if (ret >=3D 0)
> +			return -EIO;
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_hdcp_remote_dpcd_write);
> +
> +/*
> + * Write data to the HDCP DDC slave device
> + *
> + * @data: drm_hdcp_helper_data containing the i2c_adapter.
> + * @offset: the offset to write to
> + * @buffer: the data to write
> + * @size: the size of the data
> + *
> + * Returns 0 on success or a negative error code on failure.
> + */
> +int drm_hdcp_remote_ddc_write(struct drm_hdcp_helper_data *data,
> +			      unsigned int offset, u8 *buffer, size_t len)
> +{
> +	int ret;
> +	u8 *write_buf;
> +	struct i2c_msg msg;
> +	struct i2c_adapter *i2c =3D data->connector->ddc;
> +
> +	write_buf =3D kzalloc(len + 1, GFP_KERNEL);
> +	if (!write_buf)
> +		return -ENOMEM;
> +
> +	write_buf[0] =3D offset & 0xff;
> +	memcpy(&write_buf[1], buffer, len);
> +
> +	msg.addr =3D DRM_HDCP_DDC_ADDR;
> +	msg.flags =3D 0, msg.len =3D len + 1, msg.buf =3D write_buf;
> +
> +	ret =3D i2c_transfer(i2c, &msg, 1);
> +	if (ret =3D=3D 1)
> +		ret =3D 0;
> +	else if (ret >=3D 0)
> +		ret =3D -EIO;
> +
> +	kfree(write_buf);
> +	return ret;
> +}
> +EXPORT_SYMBOL(drm_hdcp_remote_ddc_write);
> +
> +static bool drm_hdcp_is_ksv_valid(struct drm_hdcp_ksv *ksv)
> +{
> +	/* Valid Ksv has 20 0's and 20 1's */
> +	return hweight32(ksv->words[0]) + hweight32(ksv->words[1]) =3D=3D 20;
> +}
> +
> +static int drm_hdcp_read_valid_bksv(struct drm_hdcp_helper_data *data,
> +				    struct drm_hdcp_ksv *bksv)
> +{
> +	int ret, i, tries =3D 2;
> +
> +	/* HDCP spec states that we must retry the bksv if it is invalid */
> +	for (i =3D 0; i < tries; i++) {
> +		ret =3D data->funcs->remote_read(data, data->hdcp1_lut-
> >bksv,
> +					       bksv->bytes,
> DRM_HDCP_KSV_LEN);
> +		if (ret)
> +			return ret;
> +
> +		if (drm_hdcp_is_ksv_valid(bksv))
> +			break;
> +	}
> +	if (i =3D=3D tries) {
> +		drm_dbg_kms(data->connector->dev, "Bksv is invalid
> %*ph\n",
> +			    DRM_HDCP_KSV_LEN, bksv->bytes);
> +		return -ENODEV;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * Check if the sink is capable of HDCP 1.x. DisplayPort has a dedicated=
 bit
> + * for this in DPCD.
> + *
> + * @data: pointer to the HDCP helper data.
> + * @capable: pointer to a bool which will contain true if the sink is ca=
pable.
> + *
> + * Returns:
> + * -errno if the transacation between source and sink fails.
> + */
> +int drm_hdcp_helper_hdcp1_capable_dp(struct drm_hdcp_helper_data
> *data,
> +				     bool *capable)
> +{
> +	int ret;
> +	u8 bcaps;
> +
> +	ret =3D data->funcs->remote_read(data, data->hdcp1_lut->bcaps,
> &bcaps, 1);
> +	*capable =3D !ret && (bcaps & DP_BCAPS_HDCP_CAPABLE);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_hdcp_helper_hdcp1_capable_dp);
> +
> +/**
> + * Check if the sink is capable of HDCP 1.x. HDMI spec states that
> transmitters
> + * should use bksv to determine capability
> + *
> + * @data: pointer to the HDCP helper data.
> + * @capable: pointer to a bool which will contain true if the sink is ca=
pable.
> + *
> + * Returns:
> + * -errno if the transacation between source and sink fails.
> + */
> +int drm_hdcp_helper_hdcp1_capable_hdmi(struct drm_hdcp_helper_data
> *data,
> +				       bool *capable)
> +{
> +	struct drm_hdcp_ksv bksv;
> +	*capable =3D drm_hdcp_read_valid_bksv(data, &bksv) =3D=3D 0;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_hdcp_helper_hdcp1_capable_hdmi);
> +
> +static void drm_hdcp_update_value(struct drm_hdcp_helper_data *data,
> u64 value,
> +				  bool update_property)
> +{
> +	WARN_ON(!mutex_is_locked(&data->mutex));
> +
> +	data->value =3D value;
> +	if (update_property) {
> +		drm_connector_get(data->connector);
> +		schedule_work(&data->prop_work);
> +	}
> +}
> +
> +int drm_hdcp_helper_hdcp1_ksv_fifo_ready_dp(struct
> drm_hdcp_helper_data *data)
> +{
> +	u8 val;
> +	u8 mask =3D DP_BSTATUS_READY;
> +	int ret =3D drm_hdcp_remote_dpcd_read(data,
> DP_AUX_HDCP_BSTATUS, &val, 1);
> +
> +	if (ret)
> +		return ret;
> +	if (val & mask)
> +		return 0;
> +
> +	return -EAGAIN;
> +}
> +EXPORT_SYMBOL(drm_hdcp_helper_hdcp1_ksv_fifo_ready_dp);
> +
> +int drm_hdcp_helper_hdcp1_ksv_fifo_ready_hdmi(struct
> drm_hdcp_helper_data *data)
> +{
> +	u8 val;
> +	u8 mask =3D DRM_HDCP_DDC_BCAPS_KSV_FIFO_READY;
> +	int ret =3D drm_hdcp_remote_ddc_read(data,
> DRM_HDCP_DDC_BCAPS, &val, 1);
> +
> +	if (ret)
> +		return ret;
> +	if (val & mask)
> +		return 0;
> +
> +	return -EAGAIN;
> +}
> +EXPORT_SYMBOL(drm_hdcp_helper_hdcp1_ksv_fifo_ready_hdmi);
> +
> +/* Read the KSV FIFO of the HDCP receive of DP.
> + * Read via 15 byte window (3 entries @ 5 bytes each)
> + *
> + * @fifo: buffer to store the KSV FIFO
> + * @num_downstream: number of devices in the KSV FIFO
> + */
> +int drm_hdcp_helper_hdcp1_read_ksv_fifo_dp(struct
> drm_hdcp_helper_data *data,
> +					   u8 *fifo, u8 num_downstream)
> +{
> +	struct drm_device *dev =3D data->connector->dev;
> +	int i;
> +
> +	for (i =3D 0; i < num_downstream; i +=3D 3) {
> +		size_t len =3D min(num_downstream - i, 3) *
> DRM_HDCP_KSV_LEN;
> +		int ret =3D drm_hdcp_remote_dpcd_read(data,
> DP_AUX_HDCP_KSV_FIFO,
> +						    fifo + i *
> DRM_HDCP_KSV_LEN,
> +						    len);
> +		if (ret) {
> +			drm_err(dev, "Read ksv[%d] from DP/AUX failed
> (%d)\n",
> +				i, ret);
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_hdcp_helper_hdcp1_read_ksv_fifo_dp);
> +
> +/* Read the KSV FIFO of the HDCP receive of HDMI.
> + * Over HDMI, read the whole thing at once.
> + *
> + * @fifo: buffer to store the KSV FIFO
> + * @num_downstream: number of devices in the KSV FIFO
> + */
> +int drm_hdcp_helper_hdcp1_read_ksv_fifo_hdmi(struct
> drm_hdcp_helper_data *data,
> +					     u8 *fifo, u8 num_downstream)
> +{
> +	struct drm_device *dev =3D data->connector->dev;
> +
> +	int ret =3D drm_hdcp_remote_ddc_read(data,
> DRM_HDCP_DDC_KSV_FIFO, fifo,
> +					   num_downstream *
> DRM_HDCP_KSV_LEN);
> +	if (ret)
> +		drm_err(dev, "DDC ksv fifo read failed (%d)\n", ret);
> +	return ret;
> +}
> +EXPORT_SYMBOL(drm_hdcp_helper_hdcp1_read_ksv_fifo_hdmi);
> +
> +static int drm_hdcp_helper_hdcp1_read_v_prime(struct
> drm_hdcp_helper_data *data,
> +					      u32 *v_prime)
> +{
> +	struct drm_device *dev =3D data->connector->dev;
> +	int ret, i;
> +
> +	for (i =3D 0; i < DRM_HDCP_V_PRIME_NUM_PARTS; i++) {
> +		ret =3D data->funcs->remote_read(data, data->hdcp1_lut->v[i],
> +					       (u8 *)&v_prime[i],
> +
> DRM_HDCP_V_PRIME_PART_LEN);
> +		if (ret) {
> +			drm_dbg_kms(dev, "Read v'[%d] from failed (%d)\n",
> i,
> +				    ret);
> +			return ret >=3D 0 ? -EIO : ret;
> +		}
> +	}
> +	return 0;
> +}
> +
> +static int
> +drm_hdcp_helper_hdcp1_authenticate_downstream(struct
> drm_hdcp_helper_data *data)
> +{
> +	struct drm_connector *connector =3D data->connector;
> +	struct drm_device *dev =3D connector->dev;
> +	u32 v_prime[DRM_HDCP_V_PRIME_NUM_PARTS];
> +	u8 bstatus[DRM_HDCP_BSTATUS_LEN];
> +	u8 num_downstream, *ksv_fifo;
> +	int ret, i, tries =3D 3;
> +
> +	ret =3D read_poll_timeout(data->funcs->hdcp1_ksv_fifo_ready, ret,
> !ret,
> +				10 * 1000, 5 * 1000 * 1000, false, data);
> +	if (ret) {
> +		drm_err(dev, "Failed to poll ksv ready, %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret =3D data->funcs->remote_read(data, data->hdcp1_lut->bstatus,
> bstatus,
> +				       DRM_HDCP_BSTATUS_LEN);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * When repeater reports 0 device count, HDCP1.4 spec allows
> disabling
> +	 * the HDCP encryption. That implies that repeater can't have its own
> +	 * display. As there is no consumption of encrypted content in the
> +	 * repeater with 0 downstream devices, we are failing the
> +	 * authentication.
> +	 */
> +	num_downstream =3D DRM_HDCP_NUM_DOWNSTREAM(bstatus[0]);
> +	if (num_downstream =3D=3D 0) {
> +		drm_err(dev, "Repeater with zero downstream devices,
> %*ph\n",
> +			DRM_HDCP_BSTATUS_LEN, bstatus);
> +		return -EINVAL;
> +	}
> +
> +	ksv_fifo =3D kcalloc(DRM_HDCP_KSV_LEN, num_downstream,
> GFP_KERNEL);
> +	if (!ksv_fifo)
> +		return -ENOMEM;
> +
> +	ret =3D data->funcs->hdcp1_read_ksv_fifo(data, ksv_fifo,
> num_downstream);
> +	if (ret) {
> +		drm_err(dev, "Failed to read ksv fifo, %d/%d\n",
> num_downstream,
> +			ret);
> +		goto out;
> +	}
> +
> +	if (drm_hdcp_check_ksvs_revoked(dev, ksv_fifo, num_downstream))
> {
> +		drm_err(dev, "Revoked Ksv(s) in ksv_fifo\n");
> +		ret =3D -EPERM;
> +		goto out;
> +	}
> +
> +	/*
> +	 * When V prime mismatches, DP Spec mandates re-read of
> +	 * V prime at least twice.
> +	 */
> +	for (i =3D 0; i < tries; i++) {
> +		ret =3D drm_hdcp_helper_hdcp1_read_v_prime(data,
> v_prime);
> +		if (ret)
> +			continue;
> +
> +		ret =3D data->funcs->hdcp1_store_ksv_fifo(connector, ksv_fifo,
> +							num_downstream,
> bstatus,
> +							v_prime,
> +							data->driver_data);
> +		if (!ret)
> +			break;
> +	}
> +	if (ret)
> +		drm_err(dev, "Could not validate KSV FIFO with V' %d\n",
> ret);
> +
> +out:
> +	if (!ret)
> +		drm_dbg_kms(dev, "HDCP is enabled (%d downstream
> devices)\n",
> +			    num_downstream);
> +
> +	kfree(ksv_fifo);
> +	return ret;
> +}
> +
> +static int drm_hdcp_helper_hdcp1_validate_ri(struct
> drm_hdcp_helper_data *data)
> +{
> +	union {
> +		u32 word;
> +		u8 bytes[DRM_HDCP_RI_LEN];
> +	} ri_prime =3D { .word =3D 0 };
> +	struct drm_connector *connector =3D data->connector;
> +	struct drm_device *dev =3D connector->dev;
> +	int ret;
> +
> +	ret =3D data->funcs->remote_read(data, data->hdcp1_lut->ri,
> +				       ri_prime.bytes, DRM_HDCP_RI_LEN);
> +	if (ret) {
> +		drm_err(dev, "Failed to read R0' %d\n", ret);
> +		return ret;
> +	}
> +
> +	return data->funcs->hdcp1_match_ri(connector, ri_prime.word,
> +					   data->driver_data);
> +}
> +
> +/*
> + * Wait for the DP receiver to set the R0' ready bit in the Bstatus regi=
ster.
> + * This bit is set to 1 when the receiver has received and validated the
> + * receiver ID list and receiver capability list.
> + * The receiver must set this bit to 1 within 200 ms of the receiver ID
> + * list and receiver capability list being received.
> + *
> + * @data: DRM HDCP helper data structure
> + * @r0_prime_remaining_us: timeout for the R0' ready bit
> + *
> + * Return: 0 on success, error code on failure
> + */
> +int drm_hdcp_helper_wait_r0_dp(struct drm_hdcp_helper_data *data,
> +			       unsigned long r0_prime_remaining_us)
> +{
> +	u8 val;
> +	int ret =3D 0;
> +
> +	ret =3D read_poll_timeout(drm_hdcp_remote_dpcd_read, ret,
> +				!ret && (val &
> DP_BSTATUS_R0_PRIME_READY), 1000,
> +				r0_prime_remaining_us, false, data,
> +				DP_AUX_HDCP_BSTATUS, &val, 1);
> +	return ret;
> +}
> +EXPORT_SYMBOL(drm_hdcp_helper_wait_r0_dp);
> +
> +/*
> + * drm_hdcp_helper_wait_r0_hdmi - Wait for R0 to be ready on HDMI
> + * @data: DRM HDCP helper data
> + * @r0_prime_remaining_us: Remaining time to wait for R0 in microseconds
> + *
> + * HDMI doesn't have a R0_READY bit, so we just have to wait the
> remainder of the
> + * 300 ms timeout.
> + *
> + * Returns:
> + * 0 on success, negative error code on failure
> + */
> +
> +int drm_hdcp_helper_wait_r0_hdmi(struct drm_hdcp_helper_data *data,
> +				 unsigned long r0_prime_remaining_us)
> +{
> +	usleep_range(r0_prime_remaining_us, r0_prime_remaining_us +
> 1000);
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_hdcp_helper_wait_r0_hdmi);
> +
> +static int drm_hdcp_helper_hdcp1_authenticate(struct
> drm_hdcp_helper_data *data)
> +{
> +	union {
> +		u32 word;
> +		u8 bytes[DRM_HDCP_BSTATUS_LEN];
> +	} bstatus;
> +	const struct drm_hdcp_helper_funcs *funcs =3D data->funcs;
> +	struct drm_connector *connector =3D data->connector;
> +	struct drm_device *dev =3D connector->dev;
> +	unsigned long r0_prime_timeout, r0_prime_remaining_us =3D 0,
> tmp_jiffies;
> +	struct drm_hdcp_ksv aksv;
> +	struct drm_hdcp_ksv bksv;
> +	struct drm_hdcp_an an;
> +	bool repeater_present;
> +	int ret, i, tries =3D 3;
> +	u8 bcaps;
> +
> +	if (funcs->hdcp1_read_an_aksv) {
> +		ret =3D funcs->hdcp1_read_an_aksv(connector, an.words,
> aksv.words,
> +						data->driver_data);
> +		if (ret) {
> +			drm_err(dev, "Failed to read An/Aksv values, %d\n",
> +				ret);
> +			return ret;
> +		}
> +
> +		ret =3D funcs->remote_write(data, data->hdcp1_lut->an,
> an.bytes,
> +					  DRM_HDCP_AN_LEN);
> +		if (ret) {
> +			drm_err(dev, "Failed to write An to receiver, %d\n",
> +				ret);
> +			return ret;
> +		}
> +
> +		ret =3D funcs->remote_write(data, data->hdcp1_lut->aksv,
> +					  aksv.bytes, DRM_HDCP_KSV_LEN);
> +		if (ret) {
> +			drm_err(dev, "Failed to write Aksv to receiver,
> %d\n",
> +				ret);
> +			return ret;
> +		}
> +	} else {
> +		ret =3D funcs->hdcp1_send_an_aksv(connector, data-
> >driver_data);
> +		if (ret) {
> +			drm_err(dev, "Failed to read An/Aksv values, %d\n",
> +				ret);
> +			return ret;
> +		}
> +	}
> +
> +	/*
> +	 * Timeout for R0' to become available. The spec says 100ms from
> Aksv,
> +	 * but some monitors can take longer than this. We'll set the timeout
> at
> +	 * 300ms just to be sure.
> +	 */
> +	r0_prime_timeout =3D jiffies + msecs_to_jiffies(300);
> +
> +	memset(&bksv, 0, sizeof(bksv));
> +
> +	ret =3D drm_hdcp_read_valid_bksv(data, &bksv);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (drm_hdcp_check_ksvs_revoked(dev, bksv.bytes, 1)) {
> +		drm_err(dev, "BKSV is revoked\n");
> +		return -EPERM;
> +	}
> +
> +	ret =3D funcs->remote_read(data, data->hdcp1_lut->bcaps, &bcaps, 1);
> +	if (ret)
> +		return ret;
> +
> +	memset(&bstatus, 0, sizeof(bstatus));
> +
> +	ret =3D funcs->remote_read(data, data->hdcp1_lut->bstatus,
> bstatus.bytes,
> +				 DRM_HDCP_BSTATUS_LEN);
> +	if (ret)
> +		return ret;
> +
> +	if (DRM_HDCP_MAX_DEVICE_EXCEEDED(bstatus.bytes[0]) ||
> +	    DRM_HDCP_MAX_CASCADE_EXCEEDED(bstatus.bytes[1])) {
> +		drm_err(dev, "Max Topology Limit Exceeded,
> bstatus=3D%*ph\n",
> +			DRM_HDCP_BSTATUS_LEN, bstatus.bytes);
> +		return -EPERM;
> +	}
> +
> +	repeater_present =3D bcaps & data->hdcp1_lut-
> >bcaps_mask_repeater_present;
> +
> +	ret =3D funcs->hdcp1_store_receiver_info(connector, bksv.words,
> +					       bstatus.word, bcaps,
> +					       repeater_present,
> +					       data->driver_data);
> +	if (ret) {
> +		drm_err(dev, "Failed to store bksv, %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret =3D funcs->hdcp1_enable_encryption(connector, data-
> >driver_data);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D funcs->hdcp1_wait_for_r0(connector, data->driver_data);
> +	if (ret)
> +		return ret;
> +
> +	tmp_jiffies =3D jiffies;
> +	if (time_before(tmp_jiffies, r0_prime_timeout))
> +		r0_prime_remaining_us =3D
> +			jiffies_to_usecs(r0_prime_timeout - tmp_jiffies);
> +
> +	ret =3D funcs->wait_r0(data, r0_prime_remaining_us);
> +	if (ret) {
> +		drm_err(dev, "R0' did not become ready %d\n", ret);
> +		return ret;
> +	}
> +
> +	/*
> +	 * DP HDCP Spec mandates the two more reattempt to read R0, in
> case
> +	 * of R0 mismatch.
> +	 */
> +	for (i =3D 0; i < tries; i++) {
> +		ret =3D drm_hdcp_helper_hdcp1_validate_ri(data);
> +		if (!ret)
> +			break;
> +	}
> +	if (ret) {
> +		drm_err(dev, "Failed to match R0/R0', aborting HDCP %d\n",
> ret);
> +		return ret;
> +	}
> +
> +	if (repeater_present)
> +		return
> drm_hdcp_helper_hdcp1_authenticate_downstream(data);
> +
> +	drm_dbg_kms(dev, "HDCP is enabled (no repeater present)\n");
> +	return 0;
> +}
> +
> +static int drm_hdcp_helper_hdcp1_enable(struct drm_hdcp_helper_data
> *data)
> +{
> +	struct drm_connector *connector =3D data->connector;
> +	struct drm_device *dev =3D connector->dev;
> +	int i, ret, tries =3D 3;
> +
> +	drm_dbg_kms(dev, "[%s:%d] HDCP is being enabled...\n", connector-
> >name,
> +		    connector->base.id);
> +
> +	/* In case of authentication failures, HDCP spec expects reauth. */
> +	for (i =3D 0; i < tries; i++) {
> +		ret =3D drm_hdcp_helper_hdcp1_authenticate(data);
> +		if (!ret)
> +			return 0;
> +
> +		drm_dbg_kms(dev, "HDCP Auth failure (%d)\n", ret);
> +
> +		/* Ensuring HDCP encryption and signalling are stopped. */
> +		data->funcs->hdcp1_disable(data->connector, data-
> >driver_data);
> +	}
> +
> +	drm_err(dev, "HDCP authentication failed (%d tries/%d)\n", tries,
> ret);
> +	return ret;
> +}
> +
> +static inline void
> +drm_hdcp_helper_driver_lock(struct drm_hdcp_helper_data *data)
> +{
> +	if (data->driver_mutex)
> +		mutex_lock(data->driver_mutex);
> +}
> +
> +static inline void
> +drm_hdcp_helper_driver_unlock(struct drm_hdcp_helper_data *data)
> +{
> +	if (data->driver_mutex)
> +		mutex_unlock(data->driver_mutex);
> +}
> +
> +static int drm_hdcp_helper_enable_hdcp(struct drm_hdcp_helper_data
> *data,
> +				       struct drm_atomic_state *state,
> +				       struct mutex *driver_mutex)
> +{
> +	struct drm_connector *connector =3D data->connector;
> +	struct drm_connector_state *conn_state;
> +	struct drm_device *dev =3D connector->dev;
> +	unsigned long check_link_interval =3D
> DRM_HDCP2_CHECK_PERIOD_MS;
> +	bool capable;
> +	int ret =3D 0;
> +
> +	conn_state =3D drm_atomic_get_new_connector_state(state,
> connector);
> +
> +	mutex_lock(&data->mutex);
> +
> +	if (data->value =3D=3D DRM_MODE_CONTENT_PROTECTION_ENABLED) {
> +		drm_hdcp_update_value(data,
> DRM_MODE_CONTENT_PROTECTION_ENABLED,
> +				      true);
> +		goto out_data_mutex;
> +	}
> +
> +	drm_WARN_ON(dev, data->driver_mutex !=3D NULL);
> +	data->driver_mutex =3D driver_mutex;
> +
> +	drm_hdcp_helper_driver_lock(data);
> +
> +	if (data->funcs->setup) {
> +		ret =3D data->funcs->setup(connector, state, data-
> >driver_data);
> +		if (ret) {
> +			drm_err(dev, "Failed to setup HDCP %d\n", ret);

Is drm_err the right print here since a monitor may just not be capable of =
it maybe keep it as
A debug statement.

> +			goto out;
> +		}
> +	}
> +
> +	if (!data->funcs->are_keys_valid ||
> +	    !data->funcs->are_keys_valid(connector, data->driver_data)) {
> +		if (data->funcs->load_keys) {
> +			ret =3D data->funcs->load_keys(connector,
> +						     data->driver_data);
> +			if (ret) {
> +				drm_err(dev, "Failed to load HDCP keys
> %d\n",
> +					ret);
> +				goto out;
> +			}
> +		}
> +	}
> +
> +	/*
> +	 * Considering that HDCP2.2 is more secure than HDCP1.4, If the
> setup
> +	 * is capable of HDCP2.2, it is preferred to use HDCP2.2.
> +	 */
> +	ret =3D data->funcs->hdcp2_capable(connector, &capable,
> +					 data->driver_data);
> +	if (ret)
> +		drm_err(dev, "HDCP 2.x capability check failed %d\n", ret);
> +
> +	if (!ret && capable) {
> +		if (conn_state->content_type =3D=3D
> DRM_MODE_HDCP_CONTENT_TYPE1) {
> +			data->enabled_type =3D
> DRM_MODE_HDCP_CONTENT_TYPE1;
> +		} else {
> +			data->enabled_type =3D
> DRM_MODE_HDCP_CONTENT_TYPE0;
> +		}

Why don't we just assign the enabled type directly with what's in conn_stat=
e->content_type,
we do not require the if else statement here according to me.

> +
> +		ret =3D data->funcs->hdcp2_enable(connector, data-
> >driver_data);
> +		if (!ret) {
> +			check_link_interval =3D
> DRM_HDCP2_CHECK_PERIOD_MS;
> +			goto out;
> +		}
> +	}
> +
> +	/*
> +	 * When HDCP2.2 fails and Content Type is not Type1, HDCP1.4 will
> +	 * be attempted.
> +	 */
> +	ret =3D data->funcs->hdcp1_capable(data, &capable);
> +	if (ret) {
> +		drm_err(dev, "HDCP 1.x capability check failed %d\n", ret);
> +		goto out;
> +	}

Same here can we make this a debug print.

Regards,
Suraj Kandpal
> +	if (capable &&
> +	    conn_state->content_type !=3D
> DRM_MODE_HDCP_CONTENT_TYPE1) {
> +		data->enabled_type =3D DRM_MODE_HDCP_CONTENT_TYPE0;
> +		ret =3D drm_hdcp_helper_hdcp1_enable(data);
> +		if (!ret)
> +			check_link_interval =3D
> DRM_HDCP_CHECK_PERIOD_MS;
> +	}
> +
> +out:
> +	if (!ret) {
> +		schedule_delayed_work(&data->check_work,
> check_link_interval);
> +		drm_hdcp_update_value(data,
> DRM_MODE_CONTENT_PROTECTION_ENABLED,
> +				      true);
> +	}
> +
> +	drm_hdcp_helper_driver_unlock(data);
> +	if (ret)
> +		data->driver_mutex =3D NULL;
> +
> +out_data_mutex:
> +	mutex_unlock(&data->mutex);
> +	return ret;
> +}
> +
> +static int drm_hdcp_helper_disable_hdcp(struct drm_hdcp_helper_data
> *data)
> +{
> +	int ret =3D 0;
> +
> +	mutex_lock(&data->mutex);
> +	drm_hdcp_helper_driver_lock(data);
> +
> +	if (data->value =3D=3D DRM_MODE_CONTENT_PROTECTION_UNDESIRED)
> +		goto out;
> +
> +	drm_dbg_kms(data->connector->dev, "[%s:%d] HDCP is being
> disabled...\n",
> +		    data->connector->name, data->connector->base.id);
> +
> +	drm_hdcp_update_value(data,
> DRM_MODE_CONTENT_PROTECTION_UNDESIRED,
> +			      true);
> +
> +	if (data->enabled_type =3D=3D DRM_MODE_HDCP_CONTENT_TYPE1)
> +		ret =3D data->funcs->hdcp2_disable(data->connector,
> +						 data->driver_data);
> +	else
> +		ret =3D data->funcs->hdcp1_disable(data->connector,
> +						 data->driver_data);
> +
> +	drm_dbg_kms(data->connector->dev, "HDCP is disabled\n");
> +
> +out:
> +	drm_hdcp_helper_driver_unlock(data);
> +	data->driver_mutex =3D NULL;
> +	mutex_unlock(&data->mutex);
> +	cancel_delayed_work_sync(&data->check_work);
> +	return ret;
> +}
> +
> +/**
> + * drm_hdcp_helper_atomic_commit - Helper for drivers to call during
> commit to
> + * enable/disable HDCP
> + *
> + * @data: pointer to the @drm_hdcp_helper_data for the connector
> + * @state: pointer to the atomic state being committed
> + * @driver_mutex: driver-provided lock to be used while interacting with
> the driver
> + *
> + * This function can be used by display drivers to determine when HDCP
> should be
> + * enabled or disabled based on the connector state. It should be called
> during
> + * steady-state commits as well as connector enable/disable. The functio=
n
> will
> + * handle the HDCP authentication/encryption logic, calling back into th=
e
> driver
> + * when source operations are necessary.
> + *
> + * @driver_mutex will be retained and used for the duration of the HDCP
> session
> + * since it will be needed for link checks and retries. This mutex is us=
eful if
> + * the driver has shared resources across connectors which must be
> serialized.
> + * For example, driver_mutex can be used for MST connectors sharing a
> common
> + * encoder which should not be accessed/changed concurrently. When the
> + * connector's session is torn down, the mutex will be forgotten by the
> helper
> + * for this connector until the next session.
> + */
> +void drm_hdcp_helper_atomic_commit(struct drm_hdcp_helper_data
> *data,
> +				   struct drm_atomic_state *state,
> +				   struct mutex *driver_mutex)
> +{
> +	struct drm_connector *connector =3D data->connector;
> +	struct drm_connector_state *conn_state;
> +	bool type_changed;
> +
> +	conn_state =3D drm_atomic_get_new_connector_state(state,
> connector);
> +	if (!conn_state)
> +		return;
> +
> +	type_changed =3D conn_state->hdcp_content_type !=3D data-
> >enabled_type;
> +
> +	if (conn_state->content_protection =3D=3D
> +	    DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
> +		drm_hdcp_helper_disable_hdcp(data);
> +		return;
> +	}
> +
> +	if (!conn_state->crtc) {
> +		drm_hdcp_helper_disable_hdcp(data);
> +
> +		/* Restore property to DESIRED so it's retried later */
> +		if (conn_state->content_protection =3D=3D
> +		    DRM_MODE_CONTENT_PROTECTION_ENABLED) {
> +			mutex_lock(&data->mutex);
> +			drm_hdcp_update_value(
> +				data,
> DRM_MODE_CONTENT_PROTECTION_DESIRED,
> +				true);
> +			mutex_unlock(&data->mutex);
> +		}
> +		return;
> +	}
> +
> +	/* Already enabled */
> +	if (conn_state->content_protection =3D=3D
> +	    DRM_MODE_CONTENT_PROTECTION_ENABLED)
> +		return;
> +
> +	/* Disable and re-enable HDCP on content type change */
> +	if (type_changed)
> +		drm_hdcp_helper_disable_hdcp(data);
> +
> +	drm_hdcp_helper_enable_hdcp(data, state, driver_mutex);
> +}
> +EXPORT_SYMBOL(drm_hdcp_helper_atomic_commit);
> +
> +static void drm_hdcp_helper_prop_work(struct work_struct *work)
> +{
> +	struct drm_hdcp_helper_data *data =3D
> +		container_of(work, struct drm_hdcp_helper_data,
> prop_work);
> +	struct drm_connector *connector =3D data->connector;
> +	struct drm_device *dev =3D connector->dev;
> +
> +	drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
> +	mutex_lock(&data->mutex);
> +
> +	/*
> +	 * This worker is only used to flip between ENABLED/DESIRED. Either
> of
> +	 * those to UNDESIRED is handled by core. If value =3D=3D UNDESIRED,
> +	 * we're running just after hdcp has been disabled, so just exit
> +	 */
> +	if (data->value !=3D DRM_MODE_CONTENT_PROTECTION_UNDESIRED)
> +		drm_hdcp_update_content_protection(connector, data-
> >value);
> +
> +	mutex_unlock(&data->mutex);
> +	drm_modeset_unlock(&dev->mode_config.connection_mutex);
> +}
> +
> +/*
> + * Check the link registers for HDCP 1.x for DP.
> + */
> +int drm_hdcp_hdcp1_check_link_registers_dp(struct drm_device *dev,
> +					   struct drm_hdcp_helper_data
> *data,
> +					   bool *shoud_retry)
> +{
> +	u8 bstatus;
> +	int ret =3D drm_hdcp_remote_dpcd_read(data,
> DP_AUX_HDCP_BSTATUS, &bstatus,
> +					    1);
> +	*shoud_retry =3D true;
> +
> +	if (ret) {
> +		*shoud_retry =3D false;
> +		drm_err(dev, "Failed to read dpcd bstatus, %d\n", ret);
> +		return ret;
> +	}
> +	if (bstatus & (DP_BSTATUS_LINK_FAILURE |
> DP_BSTATUS_REAUTH_REQ))
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_hdcp_hdcp1_check_link_registers_dp);
> +
> +/*
> + * Check the link registers for HDCP 1.x for HDMI.
> + */
> +int drm_hdcp_hdcp1_check_link_registers_hdmi(struct drm_device *dev,
> +					     struct drm_hdcp_helper_data
> *data,
> +					     bool *shoud_retry)
> +{
> +	int ret =3D drm_hdcp_helper_hdcp1_validate_ri(data);
> +	*shoud_retry =3D true;
> +
> +	if (ret)
> +		drm_err(dev, "Ri' mismatch, check failed (%d)\n", ret);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(drm_hdcp_hdcp1_check_link_registers_hdmi);
> +
> +static int drm_hdcp_hdcp1_check_link(struct drm_hdcp_helper_data *data)
> +{
> +	struct drm_connector *connector =3D data->connector;
> +	struct drm_device *dev =3D connector->dev;
> +	int ret;
> +	bool should_retry =3D false;
> +
> +	if (data->funcs->hdcp1_check_link) {
> +		ret =3D data->funcs->hdcp1_check_link(connector,
> +						    data->driver_data);
> +		if (ret)
> +			goto retry;
> +	}
> +
> +	ret =3D data->funcs->hdcp1_check_link_registers(connector->dev, data,
> +						      &should_retry);
> +	if (!ret)
> +		return 0;
> +	else if (!should_retry)
> +		return ret;
> +
> +retry:
> +	drm_err(dev, "[%s:%d] HDCP link failed, retrying authentication\n",
> +		connector->name, connector->base.id);
> +
> +	ret =3D data->funcs->hdcp1_disable(connector, data->driver_data);
> +	if (ret) {
> +		drm_err(dev, "Failed to disable hdcp (%d)\n", ret);
> +		drm_hdcp_update_value(data,
> DRM_MODE_CONTENT_PROTECTION_DESIRED,
> +				      true);
> +		return ret;
> +	}
> +
> +	ret =3D drm_hdcp_helper_hdcp1_enable(data);
> +	if (ret) {
> +		drm_err(dev, "Failed to enable hdcp (%d)\n", ret);
> +		drm_hdcp_update_value(data,
> DRM_MODE_CONTENT_PROTECTION_DESIRED,
> +				      true);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int drm_hdcp_hdcp2_check_link(struct drm_hdcp_helper_data *data)
> +{
> +	struct drm_connector *connector =3D data->connector;
> +	struct drm_device *dev =3D connector->dev;
> +	int ret;
> +
> +	ret =3D data->funcs->hdcp2_check_link(connector, data->driver_data);
> +	if (!ret)
> +		return 0;
> +
> +	drm_err(dev, "[%s:%d] HDCP2 link failed, retrying authentication\n",
> +		connector->name, connector->base.id);
> +
> +	ret =3D data->funcs->hdcp2_disable(connector, data->driver_data);
> +	if (ret) {
> +		drm_err(dev, "Failed to disable hdcp2 (%d)\n", ret);
> +		drm_hdcp_update_value(data,
> DRM_MODE_CONTENT_PROTECTION_DESIRED,
> +				      true);
> +		return ret;
> +	}
> +
> +	ret =3D data->funcs->hdcp2_enable(connector, data->driver_data);
> +	if (ret) {
> +		drm_err(dev, "Failed to enable hdcp2 (%d)\n", ret);
> +		drm_hdcp_update_value(data,
> DRM_MODE_CONTENT_PROTECTION_DESIRED,
> +				      true);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void drm_hdcp_helper_check_work(struct work_struct *work)
> +{
> +	struct drm_hdcp_helper_data *data =3D container_of(
> +		to_delayed_work(work), struct drm_hdcp_helper_data,
> check_work);
> +	unsigned long check_link_interval;
> +
> +	mutex_lock(&data->mutex);
> +	if (data->value !=3D DRM_MODE_CONTENT_PROTECTION_ENABLED)
> +		goto out_data_mutex;
> +
> +	drm_hdcp_helper_driver_lock(data);
> +
> +	if (data->enabled_type =3D=3D DRM_MODE_HDCP_CONTENT_TYPE1) {
> +		if (drm_hdcp_hdcp2_check_link(data))
> +			goto out;
> +		check_link_interval =3D DRM_HDCP2_CHECK_PERIOD_MS;
> +	} else {
> +		if (drm_hdcp_hdcp1_check_link(data))
> +			goto out;
> +		check_link_interval =3D DRM_HDCP_CHECK_PERIOD_MS;
> +	}
> +	schedule_delayed_work(&data->check_work, check_link_interval);
> +
> +out:
> +	drm_hdcp_helper_driver_unlock(data);
> +out_data_mutex:
> +	mutex_unlock(&data->mutex);
> +}
> +
> +/**
> + * drm_hdcp_helper_schedule_hdcp_check - Schedule a check link cycle.
> + *
> + * @data: Pointer to the HDCP helper data.
> + *
> + * This function will kick off a check link cycle on behalf of the calle=
r. This
> + * can be used by DP short hpd interrupt handlers, where the driver must
> poke
> + * the helper to check the link is still valid.
> + */
> +void drm_hdcp_helper_schedule_hdcp_check(struct
> drm_hdcp_helper_data *data)
> +{
> +	schedule_delayed_work(&data->check_work, 0);
> +}
> +EXPORT_SYMBOL(drm_hdcp_helper_schedule_hdcp_check);
> +
> +static struct drm_hdcp_helper_data *
> +drm_hdcp_helper_initialize(struct drm_connector *connector,
> +			   const struct drm_hdcp_helper_funcs *funcs,
> +			   bool hdcp_content_type)
> +{
> +	struct drm_hdcp_helper_data *out;
> +	int ret;
> +
> +	out =3D kzalloc(sizeof(*out), GFP_KERNEL);
> +	if (!out)
> +		return ERR_PTR(-ENOMEM);
> +
> +	out->connector =3D connector;
> +	out->funcs =3D funcs;
> +
> +	mutex_init(&out->mutex);
> +	out->value =3D DRM_MODE_CONTENT_PROTECTION_UNDESIRED;
> +
> +	INIT_DELAYED_WORK(&out->check_work,
> drm_hdcp_helper_check_work);
> +	INIT_WORK(&out->prop_work, drm_hdcp_helper_prop_work);
> +
> +	ret =3D drm_connector_attach_content_protection_property(
> +		connector, hdcp_content_type);
> +	if (ret) {
> +		drm_hdcp_helper_destroy(out);
> +		return ERR_PTR(ret);
> +	}
> +
> +	return out;
> +}
> +
> +/**
> + * drm_hdcp_helper_initialize_dp - Initializes the HDCP helpers for a
> + * DisplayPort connector
> + *
> + * @connector: pointer to the DisplayPort connector.
> + * @funcs: pointer to the vtable of HDCP helper funcs for this connector=
.
> + * @hdcp_content_type: True if the content_type property should be
> attached.
> + *
> + * This function initializes the HDCP helper for the given DisplayPort
> connector.
> + * This involves creating the Content Protection property as well as the
> Content
> + * Type property (if desired). Upon success, it will return a pointer to=
 the
> + * HDCP helper data. Ownership of the underlying memory is ttransferredt=
o
> the
> + * caller and should be freed using drm_hdcp_helper_destroy().
> + *
> + * Returns:
> + * Pointer to newly created HDCP helper data. PTR_ERR on failure.
> + */
> +struct drm_hdcp_helper_data *drm_hdcp_helper_initialize_dp(
> +	struct drm_connector *connector, struct drm_dp_aux *aux,
> +	const struct drm_hdcp_helper_funcs *funcs, bool
> hdcp_content_type)
> +{
> +	struct drm_hdcp_helper_data *out;
> +
> +	out =3D drm_hdcp_helper_initialize(connector, funcs,
> hdcp_content_type);
> +	if (IS_ERR(out))
> +		return out;
> +
> +	out->aux =3D aux;
> +	out->hdcp1_lut =3D &drm_hdcp_hdcp1_dpcd_lut;
> +
> +	return out;
> +}
> +EXPORT_SYMBOL(drm_hdcp_helper_initialize_dp);
> +
> +/**
> + * drm_hdcp_helper_initialize_hdmi - Initializes the HDCP helpers for an
> HDMI
> + * connector
> + *
> + * @connector: pointer to the HDMI connector.
> + * @funcs: pointer to the vtable of HDCP helper funcs for this connector=
.
> + * @hdcp_content_type: True if the content_type property should be
> attached.
> + *
> + * This function initializes the HDCP helper for the given HDMI connecto=
r.
> This
> + * involves creating the Content Protection property as well as the Cont=
ent
> Type
> + * property (if desired). Upon success, it will return a pointer to the =
HDCP
> + * helper data. Ownership of the underlying memory is transferred to the
> caller
> + * and should be freed using drm_hdcp_helper_destroy().
> + *
> + * Returns:
> + * Pointer to newly created HDCP helper data. PTR_ERR on failure.
> + */
> +struct drm_hdcp_helper_data *
> +drm_hdcp_helper_initialize_hdmi(struct drm_connector *connector,
> +				const struct drm_hdcp_helper_funcs *funcs,
> +				bool hdcp_content_type)
> +{
> +	struct drm_hdcp_helper_data *out;
> +
> +	out =3D drm_hdcp_helper_initialize(connector, funcs,
> hdcp_content_type);
> +	if (IS_ERR(out))
> +		return out;
> +
> +	out->hdcp1_lut =3D &drm_hdcp_hdcp1_ddc_lut;
> +
> +	return out;
> +}
> +EXPORT_SYMBOL(drm_hdcp_helper_initialize_hdmi);
> +
> +/**
> + * drm_hdcp_helper_destroy - Destroys the given HDCP helper data.
> + *
> + * @data: Pointer to the HDCP helper data.
> + *
> + * This function cleans up and destroys the HDCP helper data created by
> + * drm_hdcp_helper_initialize_dp() or drm_hdcp_helper_initialize_hdmi().
> + */
> +void drm_hdcp_helper_destroy(struct drm_hdcp_helper_data *data)
> +{
> +	struct drm_connector *connector;
> +
> +	if (!data)
> +		return;
> +
> +	connector =3D data->connector;
> +
> +	/*
> +	 * If the connector is registered, it's possible userspace could kick
> +	 * off another HDCP enable, which would re-spawn the workers.
> +	 */
> +	drm_WARN_ON(connector->dev,
> +		    connector->registration_state =3D=3D
> DRM_CONNECTOR_REGISTERED);
> +
> +	/*
> +	 * Now that the connector is not registered, check_work won't be
> run,
> +	 * but cancel any outstanding instances of it
> +	 */
> +	cancel_delayed_work_sync(&data->check_work);
> +
> +	/*
> +	 * We don't cancel prop_work in the same way as check_work since it
> +	 * requires connection_mutex which could be held while calling this
> +	 * function. Instead, we rely on the connector references grabbed
> before
> +	 * scheduling prop_work to ensure the connector is alive when
> prop_work
> +	 * is run. So if we're in the destroy path (which is where this
> +	 * function should be called), we're "guaranteed" that prop_work is
> not
> +	 * active (tl;dr This Should Never Happen).
> +	 */
> +	drm_WARN_ON(connector->dev, work_pending(&data-
> >prop_work));
> +
> +	kfree(data);
> +}
> +EXPORT_SYMBOL(drm_hdcp_helper_destroy);
> diff --git a/include/drm/display/drm_hdcp.h
> b/include/drm/display/drm_hdcp.h
> index 96a99b1377c0e..6ff28db964f13 100644
> --- a/include/drm/display/drm_hdcp.h
> +++ b/include/drm/display/drm_hdcp.h
> @@ -9,8 +9,12 @@
>  #ifndef _DRM_HDCP_H_
>  #define _DRM_HDCP_H_
>=20
> +#include "linux/mutex.h"
> +#include "linux/workqueue.h"
>  #include <linux/types.h>
>=20
> +#include <drm/drm_device.h>
> +
>  /* Period of hdcp checks (to ensure we're still authenticated) */
>  #define DRM_HDCP_CHECK_PERIOD_MS		(128 * 16)
>  #define DRM_HDCP2_CHECK_PERIOD_MS		500
> @@ -36,6 +40,7 @@
>  #define DRM_HDCP_DDC_BKSV			0x00
>  #define DRM_HDCP_DDC_RI_PRIME			0x08
>  #define DRM_HDCP_DDC_AKSV			0x10
> +#define DRM_HDCP_DDC_AINFO			0x15
>  #define DRM_HDCP_DDC_AN				0x18
>  #define DRM_HDCP_DDC_V_PRIME(h)			(0x20 + h * 4)
>  #define DRM_HDCP_DDC_BCAPS			0x40
> @@ -123,6 +128,19 @@
>  #define HDCP_2_2_DEV_COUNT_HI(x)		((x) & BIT(0))
>  #define HDCP_2_2_DEPTH(x)			(((x) & (0x7 << 1)) >> 1)
>=20
> +struct drm_hdcp_ksv {
> +	union {
> +		u32 words[2];
> +		u8 bytes[DRM_HDCP_KSV_LEN];
> +	};
> +};
> +struct drm_hdcp_an {
> +	union {
> +		u32 words[2];
> +		u8 bytes[DRM_HDCP_AN_LEN];
> +	};
> +};
> +
>  struct hdcp2_cert_rx {
>  	u8	receiver_id[HDCP_2_2_RECEIVER_ID_LEN];
>  	u8	kpub_rx[HDCP_2_2_K_PUB_RX_LEN];
> @@ -295,4 +313,273 @@ struct hdcp_srm_header {
>  #define DRM_MODE_HDCP_CONTENT_TYPE0		0
>  #define DRM_MODE_HDCP_CONTENT_TYPE1		1
>=20
> +struct drm_connector;
> +struct drm_atomic_state;
> +
> +struct drm_hdcp_helper_data {
> +	struct mutex mutex;
> +	struct mutex *driver_mutex;
> +
> +	struct drm_connector *connector;
> +	const struct drm_hdcp_helper_funcs *funcs;
> +
> +	u64 value;
> +	unsigned int enabled_type;
> +
> +	struct delayed_work check_work;
> +	struct work_struct prop_work;
> +
> +	struct drm_dp_aux *aux;
> +	const struct drm_hdcp_hdcp1_receiver_reg_lut *hdcp1_lut;
> +
> +	void *driver_data;
> +};
> +
> +/**
> + * struct drm_hdcp_helper_funcs - A vtable of function hooks for the hdc=
p
> helper
> + *
> + * These hooks are used by the hdcp helper to call into the driver/conne=
ctor
> + * code to read/write to hw.
> + */
> +struct drm_hdcp_helper_funcs {
> +	/**
> +	 * @setup - Performs driver-specific setup before hdcp is enabled
> +	 *
> +	 * Returns: 0 on success, -errno on failure
> +	 */
> +	int (*setup)(struct drm_connector *connector,
> +		     struct drm_atomic_state *state, void *driver_data);
> +
> +	/**
> +	 * @are_keys_valid - Checks if the HDCP transmitter keys are valid
> +	 *
> +	 * Returns: true if the display controller has valid keys loaded
> +	 */
> +	bool (*are_keys_valid)(struct drm_connector *connector,
> +			       void *driver_data);
> +
> +	/**
> +	 * @load_keys - Instructs the driver to load its HDCP transmitter keys
> +	 *
> +	 * Returns: 0 on success, -errno on failure
> +	 */
> +	int (*load_keys)(struct drm_connector *connector, void
> *driver_data);
> +
> +	/**
> +	 * @hdcp2_capable - Checks if both source and sink support HDCP
> 2.x
> +	 *
> +	 * Returns: 0 on success, -errno on failure
> +	 */
> +	int (*hdcp2_capable)(struct drm_connector *connector, bool
> *capable,
> +			     void *driver_data);
> +
> +	/**
> +	 * @hdcp2_enable - Enables HDCP 2.x on the specified connector
> +	 *
> +	 * Since we don't have multiple examples of HDCP 2.x enablement,
> we
> +	 * provide the bare minimum support for HDCP 2.x help. Once we
> have
> +	 * more examples, perhaps we can be more helpful.
> +	 *
> +	 * Returns: 0 on success, -errno on failure
> +	 */
> +	int (*hdcp2_enable)(struct drm_connector *connector, void
> *driver_data);
> +
> +	/**
> +	 * @hdcp2_check_link - Checks the HDCP 2.x link on a specified
> connector
> +	 *
> +	 * Returns: 0 on success, -errno on failure
> +	 */
> +	int (*hdcp2_check_link)(struct drm_connector *connector,
> +				void *driver_data);
> +
> +	/**
> +	 * @hdcp2_disable - Disables HDCP 2.x on the specified connector
> +	 *
> +	 * Returns: 0 on success, -errno on failure
> +	 */
> +	int (*hdcp2_disable)(struct drm_connector *connector,
> +			     void *driver_data);
> +
> +	/**
> +	 * @hdcp1_read_an_aksv - Reads transmitter's An & Aksv from
> hardware
> +	 *
> +	 * Use this function if hardware allows reading the transmitter's An
> and
> +	 * Aksv values from the kernel. If your hardware will not allow this,
> +	 * use hdcp1_send_an_aksv() and implement the transmission in the
> +	 * driver.
> +	 *
> +	 * Returns: 0 on success, -errno on failure
> +	 */
> +	int (*hdcp1_read_an_aksv)(struct drm_connector *connector, u32
> *an,
> +				  u32 *aksv, void *driver_data);
> +
> +	/**
> +	 * @hdcp1_send_an_aksv - Sends transmitter's An & Aksv to the
> receiver
> +	 *
> +	 * Only implement this on hardware where An or Aksv are not
> accessible
> +	 * from the kernel. If these values can be read, use
> +	 * hdcp1_read_an_aksv() instead.
> +	 *
> +	 * Returns: 0 on success, -errno on failure
> +	 */
> +	int (*hdcp1_send_an_aksv)(struct drm_connector *connector,
> +				  void *driver_data);
> +
> +	/**
> +	 * @hdcp1_store_receiver_info - Stores the receiver's info in the
> transmitter
> +	 *
> +	 * Returns: 0 on success, -errno on failure
> +	 */
> +	int (*hdcp1_store_receiver_info)(struct drm_connector *connector,
> +					 u32 *ksv, u32 status, u8 caps,
> +					 bool repeater_present,
> +					 void *driver_data);
> +
> +	/**
> +	 * @hdcp1_enable_encryption - Enables encryption of the outgoing
> signal
> +	 *
> +	 * Returns: 0 on success, -errno on failure
> +	 */
> +	int (*hdcp1_enable_encryption)(struct drm_connector *connector,
> +				       void *driver_data);
> +
> +	/**
> +	 * @hdcp1_wait_for_r0 - Wait for transmitter to calculate R0
> +	 *
> +	 * Returns: 0 on success, -errno on failure
> +	 */
> +	int (*hdcp1_wait_for_r0)(struct drm_connector *connector,
> +				 void *driver_data);
> +
> +	/**
> +	 * @hdcp1_match_ri - Matches the given Ri from the receiver with Ri
> in
> +	 * the transmitter
> +	 *
> +	 * Returns: 0 on success, -errno on failure
> +	 */
> +	int (*hdcp1_match_ri)(struct drm_connector *connector, u32
> ri_prime,
> +			      void *driver_data);
> +
> +	/**
> +	 * @hdcp1_post_encryption - Allows the driver to confirm encryption
> and
> +	 * perform any post-processing
> +	 *
> +	 * Returns: 0 on success, -errno on failure
> +	 */
> +	int (*hdcp1_post_encryption)(struct drm_connector *connector,
> +				     void *driver_data);
> +
> +	/**
> +	 * @hdcp1_store_ksv_fifo - Write the receiver's KSV list to
> transmitter
> +	 *
> +	 * Returns: 0 on success, -errno on failure
> +	 */
> +	int (*hdcp1_store_ksv_fifo)(struct drm_connector *connector,
> +				    u8 *ksv_fifo, u8 num_downstream,
> +				    u8 *bstatus, u32 *vprime,
> +				    void *driver_data);
> +
> +	/**
> +	 * @hdcp1_check_link - Allows the driver to check the HDCP 1.x
> status
> +	 * on a specified connector
> +	 *
> +	 * Returns: 0 on success, -errno on failure
> +	 */
> +	int (*hdcp1_check_link)(struct drm_connector *connector,
> +				void *driver_data);
> +
> +	/**
> +	 * @hdcp1_disable - Disables HDCP 1.x on the specified connector
> +	 *
> +	 * Returns: 0 on success, -errno on failure
> +	 */
> +	int (*hdcp1_disable)(struct drm_connector *connector,
> +			     void *driver_data);
> +
> +	/**
> +	 * @remote_read - Read HDCP keys from the remote HDCP engine
> +
> +	 * @data: drm_hdcp_helper_data containing the adapter
> +	 * @offset: address of the register to read
> +	 * @value: Pointer to the value to be filled
> +	 * @len: The length of the data to be read
> +	 *
> +	 * Return 0 on success
> +	 */
> +	int (*remote_read)(struct drm_hdcp_helper_data *data,
> +			   unsigned int offset, u8 *value, size_t len);
> +
> +	/**
> +	 * @remote_write - Write HDCP keys to the remote HDCP engine
> +
> +	 * @data: drm_hdcp_helper_data containing the adapter
> +	 * @offset: address of the register to read
> +	 * @value: Pointer to the value to be filled
> +	 * @len: The length of the data to be read
> +	 *
> +	 * Return 0 on success
> +	 */
> +	int (*remote_write)(struct drm_hdcp_helper_data *data,
> +			    unsigned int offset, u8 *value, size_t len);
> +
> +	/**
> +	 * @hdcp1_capable - Checks if the sink is capable of HDCP 1.x.
> +	 *
> +	 * @data: pointer to the HDCP helper data.
> +	 * @capable: pointer to a bool which will contain true if the sink is
> capable.
> +	 *
> +	 * Returns:
> +	 * -errno if the transacation between source and sink fails.
> +	 */
> +	int (*hdcp1_capable)(struct drm_hdcp_helper_data *data, bool
> *capable);
> +
> +	/**
> +	 * @hdcp1_ksv_fifo_ready - Read KSV FIFO ready bit.
> +	 *
> +	 * @data: pointer to the HDCP helper data.
> +	 *
> +	 * Returns:
> +	 * -errno if the transacation between source and sink fails.
> +	 * 0 on success.
> +	 * -EAGAIN otherwise.
> +	 */
> +	int (*hdcp1_ksv_fifo_ready)(struct drm_hdcp_helper_data *data);
> +
> +	/**
> +	 * @wait_r0 - Wait for R0' to become available.
> +	 *
> +	 * @data: pointer to the HDCP helper data.
> +	 * @r0_prime_remaining_us: time remaining for R0' to become
> available.
> +	 *
> +	 * Returns 0 on success.
> +	 */
> +	int (*wait_r0)(struct drm_hdcp_helper_data *data,
> +		       unsigned long r0_prime_remaining_us);
> +
> +	/*
> +	 * @hdcp1_check_link_registers - This function checks the HDCP1
> +	 * link registers and returns true if the link is valid and false
> otherwise.
> +	 *
> +	 * @dev: DRM device for printing error messages
> +	 * @data: HDCP helper data
> +	 * @should_retry: if true, the caller will retry checking the registers
> +	 *
> +	 * Returns 0 on success.
> +	 */
> +	int (*hdcp1_check_link_registers)(struct drm_device *dev,
> +					  struct drm_hdcp_helper_data
> *data,
> +					  bool *shoud_retry);
> +
> +	/**
> +	 * @hdcp1_read_ksv_fifo - Read HDCP1.x KSV FIFO
> +	 * @data: Helper data
> +	 * @fifo: Buffer to store values
> +	 * @num_downstream: Number of downstream devices
> +	 *
> +	 * Return: Zero on success or negative error code on failure.
> +	 */
> +	int (*hdcp1_read_ksv_fifo)(struct drm_hdcp_helper_data *data, u8
> *fifo,
> +				   u8 num_downstream);
> +};
> +
>  #endif
> diff --git a/include/drm/display/drm_hdcp_helper.h
> b/include/drm/display/drm_hdcp_helper.h
> index 703421fcdf96c..a2e25bad78dbd 100644
> --- a/include/drm/display/drm_hdcp_helper.h
> +++ b/include/drm/display/drm_hdcp_helper.h
> @@ -15,11 +15,60 @@ struct drm_atomic_state;
>  struct drm_device;
>  struct drm_connector;
>=20
> +struct drm_hdcp_helper_data;
> +struct drm_dp_aux;
> +struct i2c_adapter;
> +struct mutex;
> +
>  int drm_hdcp_check_ksvs_revoked(struct drm_device *dev, u8 *ksvs, u32
> ksv_count);
>  int drm_connector_attach_content_protection_property(struct
> drm_connector *connector,
>  						     bool hdcp_content_type);
>  void drm_hdcp_update_content_protection(struct drm_connector
> *connector, u64 val);
>  bool drm_hdcp_has_changed(struct drm_connector *connector,
> -			   struct drm_atomic_state *state);
> +			  struct drm_atomic_state *state);
> +
> +int drm_hdcp_remote_dpcd_read(struct drm_hdcp_helper_data *data,
> +			      unsigned int offset, u8 *value, size_t len);
> +int drm_hdcp_remote_ddc_read(struct drm_hdcp_helper_data *data,
> +			     unsigned int offset, u8 *value, size_t len);
> +int drm_hdcp_remote_dpcd_write(struct drm_hdcp_helper_data *data,
> +			       unsigned int offset, u8 *value, size_t len);
> +int drm_hdcp_remote_ddc_write(struct drm_hdcp_helper_data *data,
> +			      unsigned int offset, u8 *buffer, size_t len);
> +
> +int drm_hdcp_helper_hdcp1_capable_dp(struct drm_hdcp_helper_data
> *data,
> +				     bool *capable);
> +int drm_hdcp_helper_hdcp1_capable_hdmi(struct drm_hdcp_helper_data
> *data,
> +				       bool *capable);
> +int drm_hdcp_helper_hdcp1_ksv_fifo_ready_dp(struct
> drm_hdcp_helper_data *data);
> +int drm_hdcp_helper_hdcp1_ksv_fifo_ready_hdmi(struct
> drm_hdcp_helper_data *data);
> +int drm_hdcp_helper_hdcp1_read_ksv_fifo_dp(struct
> drm_hdcp_helper_data *data,
> +					   u8 *fifo, u8 num_downstream);
> +int drm_hdcp_helper_hdcp1_read_ksv_fifo_hdmi(struct
> drm_hdcp_helper_data *data,
> +					     u8 *fifo, u8 num_downstream);
> +int drm_hdcp_helper_wait_r0_dp(struct drm_hdcp_helper_data *data,
> +			       unsigned long r0_prime_remaining_us);
> +int drm_hdcp_helper_wait_r0_hdmi(struct drm_hdcp_helper_data *data,
> +				 unsigned long r0_prime_remaining_us);
> +void drm_hdcp_helper_atomic_commit(struct drm_hdcp_helper_data
> *data,
> +				   struct drm_atomic_state *state,
> +				   struct mutex *driver_mutex);
> +
> +int drm_hdcp_hdcp1_check_link_registers_dp(struct drm_device *dev,
> +					   struct drm_hdcp_helper_data
> *data,
> +					   bool *shoud_retry);
> +int drm_hdcp_hdcp1_check_link_registers_hdmi(struct drm_device *dev,
> +					     struct drm_hdcp_helper_data
> *data,
> +					     bool *shoud_retry);
> +void drm_hdcp_helper_schedule_hdcp_check(struct
> drm_hdcp_helper_data *data);
> +
> +struct drm_hdcp_helper_data *drm_hdcp_helper_initialize_dp(
> +	struct drm_connector *connector, struct drm_dp_aux *aux,
> +	const struct drm_hdcp_helper_funcs *funcs, bool
> hdcp_content_type);
> +struct drm_hdcp_helper_data *
> +drm_hdcp_helper_initialize_hdmi(struct drm_connector *connector,
> +				const struct drm_hdcp_helper_funcs *funcs,
> +				bool hdcp_content_type);
> +void drm_hdcp_helper_destroy(struct drm_hdcp_helper_data *data);
>=20
>  #endif
> --
> 2.40.0.348.gf938b09366-goog

