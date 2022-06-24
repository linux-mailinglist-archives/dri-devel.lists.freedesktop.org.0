Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC2855A3B9
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 23:39:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7771F10F51E;
	Fri, 24 Jun 2022 21:38:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51E9410F51D;
 Fri, 24 Jun 2022 21:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656106734; x=1687642734;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pBsYLttLORse88Zk3fF74Bu/QR9CgKzHsQSOh5M63bY=;
 b=m91H8VLhRp7z2T1urSM/TJLwwJjErhGgRcHh6ynz3YxTqTCXisqqrSQs
 OJnf+sYd0THkhyKGCEPKyc/NDEq3RyLJuzKKV956yPYt4he+6R7T5SlAF
 k0VUfzA6VeJGOFGmowzvKWbnHxHTh4phc6LTaSbJzZD1D4hLcNfGF3S7l
 tnqyu4deibWAK+tYw081Z2gapKqEwofTGlAPlcs9nG2wO03/1UBHt2Dgp
 jViDnhGKTJGxS9rq1h+Ipx10ZwR1RgCQtJwNcmy77RzHhnEasBqwmba36
 /nIVtDCzxYvCpILIVRzDb4vNjfpIbMT0BUOWhUvhg89pHey2M5mnQU12D w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10388"; a="345098198"
X-IronPort-AV: E=Sophos;i="5.92,220,1650956400"; d="scan'208";a="345098198"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2022 14:38:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,220,1650956400"; d="scan'208";a="586718906"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga007.jf.intel.com with ESMTP; 24 Jun 2022 14:38:53 -0700
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 24 Jun 2022 14:38:53 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 24 Jun 2022 14:38:53 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 24 Jun 2022 14:38:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hhklZ/NBDTU6KM2MnQAMtR57OAnueqJSp8kI/yubFaivvZCTzdbMF79MIxnlSdNjJmCaygqJig+oyUr/7aIv1xl1jY9ZQkznlipcqSTDNhqobc0ooGVOH/3d4iZLCiwt4Ur7ygLteqzw/bwl2cW6RrttCVH0RMPd4yiVR/jn4FDP9E4GXQBUWYojaU2yCm4lBnb2tasJKz/8ezG4pwqq+6AGET3ltNfTdS9lo8IofGJG9QrN/EB1SdUBLyN1T+XxJynSjz9rNpPlMODJHPnkJunvV3u+dpzonKjOQSMrtTnayDzqxxTyaiw4R9BHeDadNMVK2N3ukvfFcR1x8QZYzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A3hYM+/eTxaFE79X7nkqEpSFtvKc6VpBJKYWrU+osyc=;
 b=MW/DEXxayb9Yfxw08h/oqPOVnOMEMZUi78hiYWnUOBO7KDigObK0I0Lxhb2LSZOCS/Jfk/L8yJn0ZleV2js2SjxZdFz1BHdow3I7gNgC990h5ulN/0urLzUvmY5bS7rWeZz9UlPMpi7zio8qE0hczUiA/iEH8UbhxKRmCICX8ekyTO2YN60y0wStKWJhzqRSjj7zWnGSXjsnaJWViDBtpFhQ44mf1EC56mGPx7C4N6wWHj3am94x99L5fBZ1rzX4ywGly7evtb6drrklyS2rq9Lne0MF4v8CV7wv/8PesUNgyn3d7YpfkIabrglFRqpzopE1IbAtFGPMatZSbyzE0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5995.namprd11.prod.outlook.com (2603:10b6:8:5e::11) by
 PH0PR11MB5951.namprd11.prod.outlook.com (2603:10b6:510:145::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15; Fri, 24 Jun
 2022 21:38:50 +0000
Received: from DM4PR11MB5995.namprd11.prod.outlook.com
 ([fe80::29a2:9f6:b236:d021]) by DM4PR11MB5995.namprd11.prod.outlook.com
 ([fe80::29a2:9f6:b236:d021%3]) with mapi id 15.20.5373.016; Fri, 24 Jun 2022
 21:38:50 +0000
From: "Chery, Nanley G" <nanley.g.chery@intel.com>
To: "Deak, Imre" <imre.deak@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH] drm/fourcc: Document the Intel CCS modifiers' CC plane
 expected pitch
Thread-Topic: [PATCH] drm/fourcc: Document the Intel CCS modifiers' CC plane
 expected pitch
Thread-Index: AQHYhxCGJ9Q/cdfmOkWDJdgLp3HCJK1fFj6g
Date: Fri, 24 Jun 2022 21:38:50 +0000
Message-ID: <DM4PR11MB59952D0A2E4B2CA1B01E9BAFDCB49@DM4PR11MB5995.namprd11.prod.outlook.com>
References: <20220623144955.2486736-1-imre.deak@intel.com>
In-Reply-To: <20220623144955.2486736-1-imre.deak@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.500.17
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 25890f5a-074c-46f3-2c06-08da5629ed47
x-ms-traffictypediagnostic: PH0PR11MB5951:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oN7EQxOAQyQTze9QclvhsC6Hzqpgk81NZxgd3VY1TJUcS29zLhhGuP+da2gk8qLHdZxH8N15wETSEu9V1Hi8GqCCWCI9OOveqLJvkU6VN0kf2wsGr3TeGWtWNKKh7F3QGXBIpgxH7Opm0BARblKX0kjc9OflknjjTzS5pH3oYzh17lZTiTRP0hwzbzSNXjXJrXxqdhMEf4HdEXLx1jAgNhm4ME2E/gWF8bg9+X/a7U0KdXOkXzbFNrgFfu1PKwedxLUUu7EG552gb8h9pjO5M3PIvvl+HGuTerS8HIjiYOZe3S6cfpmMxm+7YdJ3Y6vfox1JCzsbLjSbC81sIEkBV51wgWOiiPaKo1+GuZ+PCYgPforFonU6ThNMPsUqKYS1vfNBNgfMvLn2FTyh2c99gTB32kc26CoPDeqEKjyZe/WJkGuiT6qhS/nesyeG9/M+Y/ZXOwG0sS2iugqHwaoQZUXfafBlcfuyYakv5mYN1UOuYgI3FqoQnTXniQ3H4Bkc3NpQIzbDND/a1e4ELtK8UqNI8cHQ6o6ALKUk86u2m79sj0AZDL6JueEftKotnqAAqOdl3/g/wbS5gj/wkJo/bZzgrA7aXTPbVIhJ4UeH7PpKVtiacK6/GSM+5V9znqyPiDB1uSnq4DEJzMQj130mBYauaEhX3RyTsZYsheQQC6o36D9FPDdxocRZPwdb6INoz6GKdamxurM9CHTvFgKAohY166jwKCNWeLhMWwK8Et/V0jQ/5QkUGKQOzxN+l0fRM6BP0fbVsruwkfRCOmv59Ryx22El8rykcAHccUOZs5g=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5995.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(39860400002)(366004)(136003)(346002)(376002)(83380400001)(186003)(66946007)(110136005)(38100700002)(38070700005)(316002)(33656002)(53546011)(7696005)(66476007)(9686003)(86362001)(122000001)(71200400001)(6506007)(8676002)(2906002)(41300700001)(52536014)(66556008)(76116006)(8936002)(55016003)(450100002)(26005)(4326008)(66446008)(5660300002)(64756008)(82960400001)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tMZnhKD49cdC6rahGtA+G1FodqtOVM0IcNQTdVKu8eZMgEoQRvP8el2QkXS+?=
 =?us-ascii?Q?4aNpjBBdJMVNrrTY9FPpPDNemxBUP2swl/rVA16c/Oe3RgbHKvdhXC5+bOuf?=
 =?us-ascii?Q?5gb4D4DEfY+RVNY1+69WbZVrh1GhlJn/VTbdxfC67pQCWZM+I/rR/SR2lmC4?=
 =?us-ascii?Q?DSDorUVPVoTLaJVABW1UZ6xe3XeqesVZAPw54NVqI9USw2GHOMvW4V7sGvs4?=
 =?us-ascii?Q?ayWYeMlY9i97bWn5cAawuTNV6n9DC5i6Wd2qKYuCHK3g2biKoAx70bmnyyo5?=
 =?us-ascii?Q?u0PPXakE9Y4ECe27lWatokOWYYRp40ZYd9+56gLmZaoUMLrw1UEw6n7uuZkN?=
 =?us-ascii?Q?BoBSxTK9B/J1r4EfoaRKMI7HKp4nSlv3am3k7iJjTJTfA/b+g6I4kaKE0peH?=
 =?us-ascii?Q?pTeTXGqAQhGADVtVjrS6Q30hHIYX/mgf/3wmpsyzyUJzD+Efb7CYIoBNmjqw?=
 =?us-ascii?Q?9dsTZ6gdBMiWG7wD786XmXgYkLblZludgZR+/0YUmMMMnDoyq4/Nfb9lCAN+?=
 =?us-ascii?Q?FMB3K0sYwKXeDwF4kf3WOToIMrlENVJd75kzlIfo+Z0XwBTTP1BudPHs1/mN?=
 =?us-ascii?Q?P9tt+8qu+XZpnssx0m8AwmdDAHUfB+AFGmaNobr1EHYdxcjEJjq/13pnDuAN?=
 =?us-ascii?Q?XSRBIQedfNds907fVPm2haOoYMfqb4agvu1QqJdpwfWfXOAd2y99CW2bCoux?=
 =?us-ascii?Q?KMpExYIl8pmjDrdJvzrUQESWRTrqrhICfCowHogdT9gWNbmx2H2YLNVgum3Z?=
 =?us-ascii?Q?g42r87aWUyUyR0p+vTk8NNhQdEgUmUnnlsHzzNHcuSD/2yyXhbkn7xLqYpnu?=
 =?us-ascii?Q?FjL4tZofv768SRcgZirRReCjeaHLLCf0mxQVyF5Q3WXC7HPDoDrf1v6P1o9U?=
 =?us-ascii?Q?BudjHpuaD/EV6wrA04rNYN0RnLzl/r/Hxr5nZuLK1BLtOuJIP2h4of+2K19c?=
 =?us-ascii?Q?psmZ/6BDUs4tEs8coE4tlQfqmMV2LbFIoDlL5zfswV49IdyHvq1/UOK5E+tO?=
 =?us-ascii?Q?ZhZHtdtn2Esha/yhW9qTrkDBz+96XYwB3nwiM6K8lHAb6YbJKMGw4RUVigPa?=
 =?us-ascii?Q?62gYeUZoBTGFtSYCloePUF543HrPMXJzpidx3J2UPvWUciSS9bv02BnpC+WV?=
 =?us-ascii?Q?4dN8z4SWtmupK3mNoKZ8pJBe7M4lBXwMO6C1OvyA+tRYZrUv94Y124YXvmKA?=
 =?us-ascii?Q?0MH2UcT+cGj5jhZIlhijLTT/gJFgt/m7qxp3Elqe4n+k/IH7ADMlduzkBltZ?=
 =?us-ascii?Q?zo5XaobKou7lVXUWjkAuPP1rtQ42NJkYNvvgHzwk8+y6mmAypmY1nYOy0Tyx?=
 =?us-ascii?Q?LJQJJ5pgCE7kwg3uXQuo6TPVR9GRXABLTNH11j999a/vHimGN3LmWylVd6vY?=
 =?us-ascii?Q?DgapqEKRXAHxfgxTfBNWsNOGyvT57PBazuO7D38gnxfKxBEfgncouQa/XG/c?=
 =?us-ascii?Q?A8S1rTXXEJbYjsyyLdPT17oNBxEfEjDwPH4Gmu98HPl2w6NthT+uBarIDN6N?=
 =?us-ascii?Q?0DmixPTJXxQwLBRlh4ucux/pfhWK/jiv2CikGY954gqsu8PdA7MHQQ+ukoFW?=
 =?us-ascii?Q?msTOu7MLIFdolJ4F45TYI1SGTrQ1pl7Lev1K2ggT?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5995.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25890f5a-074c-46f3-2c06-08da5629ed47
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2022 21:38:50.0389 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hWfdow4hnuPrWNW9urPhSD2yErdXtTPFpf7BL9ds8yzEypUV/7mhSDAvwzQ9Qxk4dKTZbn4AzNezuOqVLKMFmxWUKb49AtcK8pgeNwcvB5U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5951
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+Jordan (FYI)

I think the commit message has an extra "color" next to "CC".=20
With or without that dropped,

Reviewed-by: Nanley Chery <nanley.g.chery@intel.com>

Thanks for the fix.

> -----Original Message-----
> From: Deak, Imre <imre.deak@intel.com>
> Sent: Thursday, June 23, 2022 10:50 AM
> To: dri-devel@lists.freedesktop.org
> Cc: intel-gfx@lists.freedesktop.org; Chery, Nanley G <nanley.g.chery@inte=
l.com>
> Subject: [PATCH] drm/fourcc: Document the Intel CCS modifiers' CC plane e=
xpected pitch
>=20
> The driver expects the pitch of the Intel CCS CC color planes to be
> 64 bytes aligned, adjust the modifier descriptions accordingly.
>=20
> Cc: Nanley Chery <nanley.g.chery@intel.com>
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  include/uapi/drm/drm_fourcc.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.=
h
> index f1972154a5940..c1b4cfda75075 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -559,7 +559,7 @@ extern "C" {
>   *
>   * The main surface is Y-tiled and is at plane index 0 whereas CCS is li=
near
>   * and at index 1. The clear color is stored at index 2, and the pitch s=
hould
> - * be ignored. The clear color structure is 256 bits. The first 128 bits
> + * be 64 bytes aligned. The clear color structure is 256 bits. The first=
 128 bits
>   * represents Raw Clear Color Red, Green, Blue and Alpha color each repr=
esented
>   * by 32 bits. The raw clear color is consumed by the 3d engine and gene=
rates
>   * the converted clear color of size 64 bits. The first 32 bits store th=
e Lower
> @@ -612,9 +612,9 @@ extern "C" {
>   * outside of the GEM object in a reserved memory area dedicated for the
>   * storage of the CCS data for all RC/RC_CC/MC compressible GEM objects.=
 The
>   * main surface pitch is required to be a multiple of four Tile 4 widths=
. The
> - * clear color is stored at plane index 1 and the pitch should be ignore=
d. The
> - * format of the 256 bits of clear color data matches the one used for t=
he
> - * I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC modifier, see its description
> + * clear color is stored at plane index 1 and the pitch should be 64 byt=
es
> + * aligned. The format of the 256 bits of clear color data matches the o=
ne used
> + * for the I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC modifier, see its des=
cription
>   * for details.
>   */
>  #define I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC fourcc_mod_code(INTEL, 12)
> --
> 2.30.2

