Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED746B04F7
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 11:50:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6628510E10A;
	Wed,  8 Mar 2023 10:50:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1A4410E0D8;
 Wed,  8 Mar 2023 10:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678272604; x=1709808604;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KMxO/9N3PmVxZMxCHPK65d7qa1O7HL3LdZUQ15z/zXM=;
 b=AFCLcQlLru8BT377O05t3iQRr95HPAup3j7S3Y4Wg+4w0bHaywJBIzVb
 fbqRnNhfUZkXqR4o5DP3S5QDo3VaWtLmQKsN49Je9m2ynAxNYgHZqgQJo
 wZsnz4OoT9LbRGkxMvufkaAwBdRU9f8fwzk4sROj2CAceE3WjugY8P+Kq
 C5NzLk1Wrdgxhiq+HukdknQ7/QG+WimeU3FZZho69VT9z/gsNSH+oKSyL
 6rE8TOCxfblvqiMEEOtGkVQ5+daACqF6AMIONmlNtzK4P7h6xG1b4oNCX
 4KCSpFHdwi3vID9fpcYejrExI+k/c4yLi/6sNgAOhPZwRNcm1KdLxrR+Z Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="363758713"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; d="scan'208";a="363758713"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 02:50:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="1006290074"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; d="scan'208";a="1006290074"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP; 08 Mar 2023 02:50:04 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 02:50:03 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 02:50:03 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 8 Mar 2023 02:50:03 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 8 Mar 2023 02:50:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cDGLiSOu0rLoDCDNzLmSS2CJHXol86y+b4XaqPZhW+fw3yiX3pecUeImGAG36u+CZOexIEucpn+ooKJND/rktSCPvVRApt4WbaUEHH4bWflbkQg/7cFTjIGgCWXZT4BpJKGyU1kfw5MOpnZcUpFjdai7BOTPPrwBGh1ABXEEFxrGEv/rojfGwHEXjUaaRuETOfogW8mfj1zKSiYP1Pj3G6LAcP93yYbR9gplE0P5qSiSpfM/ABXNHiz9EUc0sbfKa2PBLcxFphY/l1khgkN8XdHo92qIncKu59IFzM7fITRzMhwaA8XKhXZf/e5y135dGBvXxo1NLvWICLhbwobXTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5EDv+PzqXN2ZiOUf3m0k+aH761iZb0Xe37kFmcSRJ/U=;
 b=O+x+SHF6fn/1/NviNUK1GBMqDaF1ZuKYakgbf3p2l8sHC09HtKBqjC3ujIgMtLAxdnOx4ARivOhZsxUcP4WnTjlVa3QuYlhP+wFdtHjqF+vJhgVf6b+SpjKLDafl/8ut2NJ+UJ9n/dqnc222mdg0mZKzD8I9awBwMU0ZC95+FZou0DopNyNGEYjAkfBwW6rGl+CTyj1E7foBLVf589749g94JHd1CmVWhlsTHPB+KPO7hl7YKe1cmOxEGUBwTEh7jq+FcaGfSb70s4M+gXvpvRSw6CGt8VGBfjBf7BUsH+xpSvjU+d5qgwpLRel1rFIMLDMF8tJwH31X2r+8t4XDLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 MN2PR11MB4518.namprd11.prod.outlook.com (2603:10b6:208:24f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.19; Wed, 8 Mar
 2023 10:50:01 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::f677:36e:9fae:b45e]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::f677:36e:9fae:b45e%6]) with mapi id 15.20.6178.017; Wed, 8 Mar 2023
 10:50:01 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 1/7] drm/dp_helper: Add helper to check DSC support with
 given o/p format
Thread-Topic: [PATCH 1/7] drm/dp_helper: Add helper to check DSC support with
 given o/p format
Thread-Index: AQHZRn8ogy3mOM/XwUqgos5yFmtAbK7wyhFQ
Date: Wed, 8 Mar 2023 10:50:00 +0000
Message-ID: <DM4PR11MB63603E90F28746BE957CC98AF4B49@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20230222053153.3658345-1-suraj.kandpal@intel.com>
 <20230222053153.3658345-2-suraj.kandpal@intel.com>
In-Reply-To: <20230222053153.3658345-2-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|MN2PR11MB4518:EE_
x-ms-office365-filtering-correlation-id: f335c74f-382e-4d07-35fc-08db1fc2dddd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ar3km9bMBPtqcmQIR2n+HXqYE8oYrbtibL3C6aUG3CivkTRvw3+bJUbMVuWwgtxl14j3rKivlbOz/huCXC94+dSv/bjurImANqMeC2t/L02BtDnyMrfYgmhdh9lh/Pf+msaSbNiZhcjmDi3z1WcVGaD/JKFHufVbjFyogpXQRGtgEsW/OvI/fG3z0147aWPfU1LgVaO0fltxeFtLeKQPukScmTlZ25F1BlhFtRd/HfDjhvsFLQvkmnUKKKOCuDpdsXmawplbV8en0gyj+J8L//CgrVDpoTLPtBXy7vQOrDTjoZ4AUEX858ZAXmeJWt6dWLJP/YyAvIbLnajNuh/ha0O0ZmB9YnQkky9eD9sT7oPXi9VHVMnsJLcEkq13zTualvWnP6DUp4R09CeOZGiRuSr9LHnY0Dnr+JMznuPGZ1XRObry2jJOu9enC8QhkhRVYujvJHUIeeKYiifBmRlKY+ZbikdzaMufoYNBVous3BgI2+tC8TxBaRJLOZJACmxRj88BOSFm3JqYSSqPMQ8RNM6P/zEEdHWe3NYelkCyb6JL2pIQsxwKVJrmCNfjdOtEbHd5Wlfc/Y/EjXd5JSVs63WqwksPbSInRTiVV1BtnZI68sUrIWEfthJvz72Ns5wNQCmRt2DsCNC5zr8Yyt8eepdE6ouq5cIoI2FvFHs7qksUflYvK9SbFWEPHzVlr8dEgF1821Ph68F/vj5ZaV/t6w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(376002)(39860400002)(346002)(366004)(136003)(451199018)(107886003)(33656002)(478600001)(83380400001)(110136005)(2906002)(9686003)(6506007)(76116006)(26005)(450100002)(53546011)(66476007)(82960400001)(5660300002)(41300700001)(66946007)(52536014)(4326008)(8936002)(64756008)(8676002)(86362001)(186003)(66446008)(66556008)(55016003)(316002)(7696005)(122000001)(71200400001)(38100700002)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?SEoKUSwTCetgU+m858pGyOX4IvAUava9Efjx6O+SkZLQnNSvkunIuHhC+WZJ?=
 =?us-ascii?Q?hT8rQ7KQMKX/8WJRr/gy9so7UzW3N8DbQ0U1/6xemPqiOmO8KE3Cnym6G0FM?=
 =?us-ascii?Q?uSOxqS28ZEFHHB3ufP41Nsk8LRUziEMMeJ/du3qt3zwF+4dvDm96OGYt/eUL?=
 =?us-ascii?Q?1+XAp4NPA3nL8yC5LhqmJL6vRcLUan6i4ADLNPa34Hy/XFhrnmpcCq+GqDNe?=
 =?us-ascii?Q?BlqrkBGPUad96Y6/Fyt0qR/96k95utqSrjFHdYIQ5aHjOiP4Ouzlrg0N0zC/?=
 =?us-ascii?Q?Nz1P7/UMh3YIfboX+nzBhFsOg4+yiM1O0uuDEWgQOzel0ewmb+7QvWkIVmcL?=
 =?us-ascii?Q?ggk1pe8u8tGB1/l5f13yjiyk/mWpSYdla/4yQn2VfGXb/LWpaALtbEMbPRmX?=
 =?us-ascii?Q?WGgfL0TBkhjbI3ze/ZdZl9smIde6gz0BXXSMdzPxNgEFtAZX9e8/cFOV8SnU?=
 =?us-ascii?Q?IW+VUXiWzxSCyyraSDfU9Bde0XcXU/ql7C/cQXIt/B66cdgjQ9SF3bXIX/ug?=
 =?us-ascii?Q?kd71M5I0M3dwjkIpO6t+ySLngANyj79tO5NcAmTcqL4n7meuMdu2Eil3KBXy?=
 =?us-ascii?Q?07pAnl6Wy0xEWtlvrah6jIHClz2tjLe2hH+VCD0TZAYwx/gSNqfH3pYynSFl?=
 =?us-ascii?Q?9m3Ij+BGfyr4fvjghAuX+LrXe5ycIcNFNHis8BFgih+Nrrn3C1fuPBSfGJh1?=
 =?us-ascii?Q?gztGpf/6CO6djuyPEsnhCN0Q4dSzT66wAwp8OtjAjM8buXREDyPlhPtwWoQd?=
 =?us-ascii?Q?bsMrX7JHy9Je4b5XZsgnRr0Nnm4RljHCnxU0Fq/aJPVC1/RHyMLe6J+bZelU?=
 =?us-ascii?Q?eJKSGhZBdXsWbpo7ax4MPxxWmswXLg9ouSzoLJKtJ4+0GnA6ZzqqjyDTk0vS?=
 =?us-ascii?Q?rSoVqcop6q18Il+lcCUizWLEpMaLozPFImibTZYzENaUemr3aXlbIVykEs9U?=
 =?us-ascii?Q?5aY4tqKXctv0MdVYXV75N0lO2QS5CQvunobyl3VKrRMbBt6kCHHhwEXcQvWY?=
 =?us-ascii?Q?g0exO69IO43QL+GtqsGR91ty+0M3wdXYWp1UoTOFgzkVlJdTxP9jkF0jZy4I?=
 =?us-ascii?Q?SFlWGx1ZhNhOEQzBVl2dUl0qavK10CYufp93Wz7IjQPtiMmKkDrES9ct4zhj?=
 =?us-ascii?Q?ayG5fhBdFpuMl20KS0HkcnJC8UGrA6Z88EEhO/Giz0UkERKqEG5jyk98aQBk?=
 =?us-ascii?Q?wvVKfW5J/nWCZ3nLWk0A+wfGguYcGEe9Hb4TGmEuxm03kobARDHGins1/kUE?=
 =?us-ascii?Q?FgaEl5NXKeAste9G55iW8xDqz1GzOSceyf6g7QGL+Yq4cDlyeG4LjkP+Nnev?=
 =?us-ascii?Q?Rz5FG7Y+/F49cBd82JhBdamLCJlhHTgDucY+ZXuZTTpcehc+3H51y/OK0U4m?=
 =?us-ascii?Q?z7ABrIO3tky3brLCV+EEIoCL7deM6gdyfN154ZFwQU7lTMEBgh9ZBOjFiYRb?=
 =?us-ascii?Q?KpAxn7JYF1+v/4cIgWY2OE59EeZKMIOepAsBHjrhiSyA2VLHbH77RTHd9/1X?=
 =?us-ascii?Q?vlpXUnK8/K5z+q3HlZG0dZrVyX//g2ei+sX8gLHIjLOQj0NtYqWUTa5nq7lQ?=
 =?us-ascii?Q?ZQfWNUoekFKxY+UVVWF1EttczvMg0n57hmYD8qVG?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f335c74f-382e-4d07-35fc-08db1fc2dddd
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2023 10:50:00.8966 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1IoYRnFe8QPiL8s4HutGBtdMg3j7zjdjM9biLo0ooUOe4W5wCP1GDHIObGVIfyfC4nUtqcCeCEUG+25QzMLqOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4518
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
Cc: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Kandpal, Suraj <suraj.kandpal@intel.com>
> Sent: Wednesday, February 22, 2023 11:02 AM
> To: dri-devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
> Cc: Shankar, Uma <uma.shankar@intel.com>; Nautiyal, Ankit K
> <ankit.k.nautiyal@intel.com>
> Subject: [PATCH 1/7] drm/dp_helper: Add helper to check DSC support with =
given
> o/p format
>=20
> From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>=20
> Add helper to check if the DP sink supports DSC with the given o/p format=
.
>=20
> v2: Add documentation for the helper. (Uma Shankar)
>=20
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  include/drm/display/drm_dp_helper.h | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>=20
> diff --git a/include/drm/display/drm_dp_helper.h
> b/include/drm/display/drm_dp_helper.h
> index ab55453f2d2c..41da8eb4801e 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -194,6 +194,19 @@ drm_dp_dsc_sink_max_slice_width(const u8
> dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE])
>  		DP_DSC_SLICE_WIDTH_MULTIPLIER;
>  }
>=20
> +/*

Use /** instead of /*

With that fixed, this is
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> + * drm_dp_dsc_sink_supports_format() - check if sink supports DSC with
> +given output format
> + * @dsc_dpcd : DSC-capability DPCDs of the sink
> + * @output_format: output_format which is to be checked
> + *
> + * Returns true if the sink supports DSC with the given output_format, f=
alse
> otherwise.
> + */
> +static inline bool
> +drm_dp_dsc_sink_supports_format(const u8
> +dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE], u8 output_format) {
> +	return dsc_dpcd[DP_DSC_DEC_COLOR_FORMAT_CAP - DP_DSC_SUPPORT]
> &
> +output_format; }
> +
>  /* Forward Error Correction Support on DP 1.4 */  static inline bool
> drm_dp_sink_supports_fec(const u8 fec_capable)
> --
> 2.25.1

