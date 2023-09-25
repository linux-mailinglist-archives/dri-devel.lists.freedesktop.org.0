Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CBA7ADD40
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 18:33:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1710010E2A9;
	Mon, 25 Sep 2023 16:33:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA48E10E2A8;
 Mon, 25 Sep 2023 16:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695659585; x=1727195585;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EanrHgX7Je4vVzqvuDweNIXLAZWFP8O1ZYEc2WVt3T4=;
 b=Oi0PZKDc26ecUMK9VUECkuqfBdQhCOEVRAZ+r7AbK7oYkjq3JnmTKyVU
 rsgOZslaXeyprKdlgR0EgFRBTiTE+RHvHwZ95r0xK7xyt167YxBmC5OYy
 Y3u/e20HxBYb+53M1BQbtUumV9w4PxuHIFNj1ahZ87Q0gbVaP3kmgIQ9o
 ba/QDTskw760cApaOUdrhz602k1vjXeOpo/Rx6cICzlnxazWJOPPdkcDG
 BTrtawY4dgXgTd6Jzkr/J50+h2uro4Kw9iwVavktz35MQM4hHRzJjxbs2
 LYXyEiUsso19+qtVM4C+ZtcW5L6KBIoJICKdyHsXXpZLvf90P2Qe5Axpo w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="378580480"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; d="scan'208";a="378580480"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 09:32:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="751769565"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; d="scan'208";a="751769565"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Sep 2023 09:32:26 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 25 Sep 2023 09:32:26 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 25 Sep 2023 09:32:25 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 25 Sep 2023 09:32:25 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 25 Sep 2023 09:32:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lh8Dp688vB8Ur4qhPZZ7z3yAoaRtCF334kC/cDTJtz5FTo7lSUtVixN92K2Vh6Lv28LbCmNgfQrnMJdk7lFcH365AuBNtiUb/U+JeNI/xvV1N11b/NGALt+IP6J6+k7oM+ZvnwzfxpXT4rah//JoTiMGKNIt7IepObm6QV3d3IhLdNM0ZlDkqZB2PWIEw+f6p8VJ0s0BrZSKNuxbhbFiiyG8LQKOwxetlKou+K758Wr5stQ7nSbA5u5xiN/Abb14lwmxq3y+0MtTNtkuFM9ZsuTjh4E1Rdel0znxI2pD7luKYuePtsedaZkOadDPbksJqD3TuV/bARCnYGpbdPwD5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wCZGcAQyiof2olQYtrITKYXCW6MSkfRnpn+BPivV3iM=;
 b=iGS6eT/3HuPjOzW/eKugY8/FUT3ESImZVB5Usi110xyBC+Q+JdNPjBYYV8C6i2i85V+HKPPxJF3J7W+f/veQ2yZpZwov+xgyU/IKwMZMOU01jWuOskPhIa0qNi7QnY1UNBsvNBfNQ6zeUiRCK7USxEZcuzps4PMTz8FRNOn10+MzG0+1BJBrxD/Vx8sOGfizS/n0ZofY3VODzqTvB03aW1GhiqFhhhHmOrK416OSLzukzH6aOSrEsjBmoMiUVqDa5+7Ecpwt5O/mWpV38+6KSrpSx3mCIPRoMMERRyIqa15oJOYm/zbftqpegrDw2OdBE0s24iZI6fDUdlJjXiTuRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6348.namprd11.prod.outlook.com (2603:10b6:208:3af::16)
 by SA3PR11MB7626.namprd11.prod.outlook.com (2603:10b6:806:307::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Mon, 25 Sep
 2023 16:32:23 +0000
Received: from IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::4426:1551:a299:9a85]) by IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::4426:1551:a299:9a85%7]) with mapi id 15.20.6813.017; Mon, 25 Sep 2023
 16:32:22 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 2/6] drm/eld: replace uint8_t with u8
Thread-Topic: [PATCH 2/6] drm/eld: replace uint8_t with u8
Thread-Index: AQHZ4W28pDXeRtvlU0mSp5oMTilGpLAr2E2A
Date: Mon, 25 Sep 2023 16:32:22 +0000
Message-ID: <IA1PR11MB63486213596E2745496B0354B2FCA@IA1PR11MB6348.namprd11.prod.outlook.com>
References: <cover.1694078430.git.jani.nikula@intel.com>
 <ac358f6e84d80db208e78e0c7a892d4b30b073a8.1694078430.git.jani.nikula@intel.com>
In-Reply-To: <ac358f6e84d80db208e78e0c7a892d4b30b073a8.1694078430.git.jani.nikula@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6348:EE_|SA3PR11MB7626:EE_
x-ms-office365-filtering-correlation-id: 09152c86-1e9f-4798-5a89-08dbbde4feda
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Y2+t7zi7awHG2YhdR77n/2pcaxgIiqgoIB7zQnjG6iZYg1JfdKo8IwFgWXQILpvGvvwmaJ8+qGHw4uCNt6RyX2Lnw8dZq3uhPnh56uFtz3o1ApAzQX9IwDyshFdG8OOSCNFIe9pubYyEL28BuNlE/2dSRZqHU6E8rxjh6qkmti/l0Kk8V6BA4OMRucNrmQPDB4ScNMhV50yupIYlq1TkKzuYAgHCgosd3xr/KgTnUnxNbh7SvN2h2IbgP35lVWMPhngvoe8VFM6PxIcg36741mA+bJowNA/bLNRirhwf8Pg/pygyCCIr0jwv1tukVawpwxkz6qNjweKXY2KefrpXsWbMEObGJ5U6doiOvKfdiq4DLW8ZwuumT+dUQ0JuPmnRkMMfIqpBeuvAFS//bLKtewD8Un4nunG6mkJnyxtJAMeHQauuLTo+vc30FLhceamz3tYkQqQwNGWvn5Jw5fPt53GdVv2eXarNYFtU2JFvMslc8QzjxNAW0ybjwnat48yo1ckQqGrlPitCddCBfmooQzkZlraa9HbEG44HLcdpM/IW8ndRiPqx+OzHlQO6f4lSUpOt/MFtbZbC4I6fsUNx25OeUwCM2ZLLTPhZiPomcWo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6348.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(346002)(136003)(366004)(376002)(230922051799003)(451199024)(186009)(1800799009)(9686003)(4326008)(53546011)(7696005)(478600001)(26005)(450100002)(83380400001)(6506007)(55236004)(8936002)(8676002)(82960400001)(122000001)(2906002)(66446008)(41300700001)(66556008)(52536014)(66946007)(5660300002)(76116006)(110136005)(316002)(38100700002)(64756008)(38070700005)(66476007)(33656002)(86362001)(71200400001)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mKJXNbqIY2GYwgMxjx6RKg9Affjlme8Gh99L7j5axZqxeOUOQA4xV1NEKhTe?=
 =?us-ascii?Q?l4vLmc6gtLJDzM/EOFEhDm4YSHa9E5SotYRhBsYTUlcy/BLf06LyHE2ZbfmU?=
 =?us-ascii?Q?dhRYYM5fu420K/0e9GoEdZi0FzQeQXG39x9rheYmo1EiRjTIYiOCNkPzcr3e?=
 =?us-ascii?Q?BNnsVb+4INnydM8l/lHjabCJyc1ruWswKoAmdmX3QtqaH+K6G5JYvR/nr93S?=
 =?us-ascii?Q?j7oXhTcicrX88fNqWwMEwmYIiNVk6ikBsI2sYnf3bbQa1+X4waWh8FcrPtMK?=
 =?us-ascii?Q?iqjG/2V2+GNn0vaRjU7+8I7X71ZRlaVv+buduYRKN4XGS337x1HSU0K/JjM0?=
 =?us-ascii?Q?8MxrPzKM9DyU2nS5umK2gi4WkqrZUaGLYmG32YKhpCa270+XHfUV9uP8oves?=
 =?us-ascii?Q?MkMyBDVd3A9si7t2BZTHj/tup3FgZuFH5TTgX2Nyl7tnvK51tSO4fPKNkJNy?=
 =?us-ascii?Q?sMMVSxTtnDgPP+LTeoUnftxTlzvZPnANno+xBYaaI1F+IrOsqv6cIjMVFYRq?=
 =?us-ascii?Q?exxfq7xLpT5c3dGJVKbmQjtOgW6g9NjCi83uE+ofiA1LJD+AU7VogK8x1asS?=
 =?us-ascii?Q?R4PMirig5/SP35FSzKQAIB0wvFL7c/xUJR3w34vp08cpGHdqU7HTaSaqd1pJ?=
 =?us-ascii?Q?1n8VTqJXjHUNgFU5nJ2EQmb8GzHsN01rV0W7WYS3TlxgRq3QJwOKPgQiwc/T?=
 =?us-ascii?Q?YIxuNuz/RIHNQ2iRWfsNKCkdjDwfKVyaj5D/Q88RLoqksCPTTjTNo+C6uoM8?=
 =?us-ascii?Q?o0pfY0ghiVwCRl/NfdabySojgWH0ADsVwOZePAAqFc1YEAoMxMRzZZp9vdrq?=
 =?us-ascii?Q?vfWo5hYz78rzlisS4HA63MfE7fprfp9hHc3DlBhyRSAZLXQKEcFqUEUF+Rok?=
 =?us-ascii?Q?FcJWFU83ku1nvgQDZEZ+R6ZHCMcd8Z5oqgz1vTCxzDYGpIq1N4rkz41vkzhB?=
 =?us-ascii?Q?E4Kl6Ch3vcupyWpJl2pt5J4Wl+3C/Pz7aDhI71d7f2ypFgezPhxQlwsziaQK?=
 =?us-ascii?Q?yei3CxEcA1gDRqo/OlXczu1FGGDXHTSGEc5jdweJLhLJ+vPBOyHZ9J+1yBLd?=
 =?us-ascii?Q?GKWMT592LjEbRGL5FMRJ9KmGkZJCMPJWxuaEXSts2sQkmnVRcJFNZTXwx28G?=
 =?us-ascii?Q?f2PLgMJtX0H74uzB1lyt7oUD5Mefeu72ulRZjAdmfQ+u8UflGkoIzDWlap+q?=
 =?us-ascii?Q?vpvmbPWeTsTyljdpUBOhDzhPfWPvDYlYw2J25PP/c8Oaz5w42YfBAViz0npQ?=
 =?us-ascii?Q?bMt4UpAYIK5tAjTwZcmP/aMyNrSWmeMe2tJzcfTZTGNBOv7bYtsfnELHvBxs?=
 =?us-ascii?Q?NgFXuvI+VnGnfzbz9EResnB6hloPCVRrjjyNG2EK3l4IBfxSLW6MxttZ2Kcq?=
 =?us-ascii?Q?OEE9HK9ls6pnJdrX3KmOM+6/b6d2g1/rgYTHoZ+uD6NfjRxqweaAz1DTVCAT?=
 =?us-ascii?Q?YowQfMkR+zh1Gfdogrxl+23k3pnHSRNBlvD4iRaEwxSilWN4ZfxSTzYVDHyD?=
 =?us-ascii?Q?lY/01oIPlayn590e968RkDwEPqMvJKMg+jmjAX1eDufFiOO8EtvnVU17tQ5N?=
 =?us-ascii?Q?RLeAYVFvek9BRctKoDlgTS1CK37lj9NE805dXJxwVwraUBWvfpLm9BRYtClT?=
 =?us-ascii?Q?cuxLsP7iTusZVKCiRl8ajMc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09152c86-1e9f-4798-5a89-08dbbde4feda
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2023 16:32:22.8945 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9QtxVJ0bNEZc2Na85ztj3qrWFrKeTfzoZZXgH84HZHvOCojkYa2pSFmA7DSNgSTUgYQcDpMZ7ZuI7XnNS83letRYggWX45OBSisAaUNPYmRSCC1syEo+VokEDWsb7FKs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7626
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



> -----Original Message-----
> From: Nikula, Jani <jani.nikula@intel.com>
> Sent: Thursday, September 7, 2023 2:58 PM
> To: dri-devel@lists.freedesktop.org
> Cc: intel-gfx@lists.freedesktop.org; Nikula, Jani <jani.nikula@intel.com>=
;
> Golani, Mitulkumar Ajitkumar <mitulkumar.ajitkumar.golani@intel.com>
> Subject: [PATCH 2/6] drm/eld: replace uint8_t with u8
>=20
> Unify on kernel types.
>=20
> Cc: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  include/drm/drm_eld.h | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/include/drm/drm_eld.h b/include/drm/drm_eld.h index
> 9bde89bd96ea..7b674256b9aa 100644
> --- a/include/drm/drm_eld.h
> +++ b/include/drm/drm_eld.h
> @@ -70,7 +70,7 @@
>   * drm_eld_mnl - Get ELD monitor name length in bytes.
>   * @eld: pointer to an eld memory structure with mnl set
>   */
> -static inline int drm_eld_mnl(const uint8_t *eld)
> +static inline int drm_eld_mnl(const u8 *eld)
>  {
>  	return (eld[DRM_ELD_CEA_EDID_VER_MNL] &
> DRM_ELD_MNL_MASK) >> DRM_ELD_MNL_SHIFT;  } @@ -79,7 +79,7 @@
> static inline int drm_eld_mnl(const uint8_t *eld)
>   * drm_eld_sad - Get ELD SAD structures.
>   * @eld: pointer to an eld memory structure with sad_count set
>   */
> -static inline const uint8_t *drm_eld_sad(const uint8_t *eld)
> +static inline const u8 *drm_eld_sad(const u8 *eld)
>  {
>  	unsigned int ver, mnl;
>=20
> @@ -98,7 +98,7 @@ static inline const uint8_t *drm_eld_sad(const uint8_t
> *eld)
>   * drm_eld_sad_count - Get ELD SAD count.
>   * @eld: pointer to an eld memory structure with sad_count set
>   */
> -static inline int drm_eld_sad_count(const uint8_t *eld)
> +static inline int drm_eld_sad_count(const u8 *eld)
>  {
>  	return (eld[DRM_ELD_SAD_COUNT_CONN_TYPE] &
> DRM_ELD_SAD_COUNT_MASK) >>
>  		DRM_ELD_SAD_COUNT_SHIFT;
> @@ -111,7 +111,7 @@ static inline int drm_eld_sad_count(const uint8_t
> *eld)
>   * This is a helper for determining the payload size of the baseline blo=
ck, in
>   * bytes, for e.g. setting the Baseline_ELD_Len field in the ELD header =
block.
>   */
> -static inline int drm_eld_calc_baseline_block_size(const uint8_t *eld)
> +static inline int drm_eld_calc_baseline_block_size(const u8 *eld)
>  {
>  	return DRM_ELD_MONITOR_NAME_STRING -
> DRM_ELD_HEADER_BLOCK_SIZE +
>  		drm_eld_mnl(eld) + drm_eld_sad_count(eld) * 3; @@ -127,7
> +127,7 @@ static inline int drm_eld_calc_baseline_block_size(const uint8_=
t
> *eld)
>   *
>   * The returned value is guaranteed to be a multiple of 4.
>   */
> -static inline int drm_eld_size(const uint8_t *eld)
> +static inline int drm_eld_size(const u8 *eld)
>  {
>  	return DRM_ELD_HEADER_BLOCK_SIZE +
> eld[DRM_ELD_BASELINE_ELD_LEN] * 4;  } @@ -139,7 +139,7 @@ static inline
> int drm_eld_size(const uint8_t *eld)
>   * The returned value is the speakers mask. User has to use
> %DRM_ELD_SPEAKER
>   * field definitions to identify speakers.
>   */
> -static inline u8 drm_eld_get_spk_alloc(const uint8_t *eld)
> +static inline u8 drm_eld_get_spk_alloc(const u8 *eld)
>  {
>  	return eld[DRM_ELD_SPEAKER] & DRM_ELD_SPEAKER_MASK;  } @@ -
> 151,7 +151,7 @@ static inline u8 drm_eld_get_spk_alloc(const uint8_t *eld=
)
>   * The caller need to use %DRM_ELD_CONN_TYPE_HDMI or
> %DRM_ELD_CONN_TYPE_DP to
>   * identify the display type connected.
>   */
> -static inline u8 drm_eld_get_conn_type(const uint8_t *eld)
> +static inline u8 drm_eld_get_conn_type(const u8 *eld)

Changes LGTM
Reviewed-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>

>  {
>  	return eld[DRM_ELD_SAD_COUNT_CONN_TYPE] &
> DRM_ELD_CONN_TYPE_MASK;  }
> --
> 2.39.2

