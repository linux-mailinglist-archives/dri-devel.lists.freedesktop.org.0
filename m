Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 144287EACD8
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 10:17:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F91810E433;
	Tue, 14 Nov 2023 09:17:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ECE210E1E6;
 Tue, 14 Nov 2023 09:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699953445; x=1731489445;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wYfipz6I7sk+GkMYfDWllWR50hV9zAAMCeani3n2RVc=;
 b=UJ3jBqu5WwIRcprRTZNt71WfpZvmg+c8GQMqnUE1hPnk+TBcMGp5ZfZa
 kN+Ol7OdRQdJh2ur8C+kH/GzWpBKhJtBxKf6ggJPQjbj5GgmRjETRF7+Y
 5CcUFdoFhMAl4GWXXNxYMvWgOaP/tq4MQ7EyMJkdVPlgRRXw/Z9jj83Nn
 urSj6GejMNYNowXgT22biezDJpdqCszAxK1VyI/Rj+kA0vGmtuboiNrkJ
 huyge9ol5ksMyL5zHzG80PvOvnGEXezAD55NuxP1o8cFfnlX1Uh9qz7z6
 NOxywbKlbyW0YMvwXTOm1BJtdaHftuGDhGycEiJVnuqVpfrkBv5Hz+Bx4 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="394533232"
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200"; d="scan'208";a="394533232"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 01:17:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="855228994"
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200"; d="scan'208";a="855228994"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 01:17:23 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 01:17:21 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 01:17:21 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 01:17:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JPNHOJWUpk4uThCQzqKkiUa1HCLy6AVLmaYD8iv9sYzjl1qv/XHPVF8Fn14Hy8DjL3ISVmElt4rxqZr+SsljK6rwqtvxcdXdtp0OKRkqyLZWPqT79qY7Wy6HkK2Xld+AbHv9H47E3GbnxDXN2ZgzD3IKHhGhluTRsJgzIJHDGmXUpu5rnr3amC3fYYEPkpfOI6uAw0OYljeweKKCKxKlLSbUDPrVzVSKV2vMhSvTCxx5s4Nyq4tfzf2I/qeO6G7AiYnHe9lI+gI8Gv8ncsKDeUfwzrePYDcMKDJBHiJtAPvvQYV9ESyi2G9uPwWVnfkSfXlXaLsGDPcmU+za8LOADg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2mzVspzZgZhBUgLuEkobBuSGFHeOC4dQslA6uXVHNQo=;
 b=b0uxgrntyKtFodb61ONWfqRj4PmXqfC/hRD6tYVWg5IZwH1lxPFpHrgvaBznSZGRXtoXou/59V0BdtBtkBVm3xWoVJDSv5GZ0a0eT+khWuTMfYfjbLQ5XELPdoTrH3ISybD1J6bshkoAI75fJjn65bXj8At4+94+qIcO8ghZdMIpJ7aUQKQ/AXtD+tdz7xUlFCspjGYPmdiZ3RGd7qOu/kNEyuySjXvFSROLkILVrkMmV7822JV0EbcCtfceVc9xXMHDdSy3kqcZQN3N8Ke6lDpENpzaT5pYrrg4zXwUAW12WREsdURXp3iSRDL5h/wtsBrVhqZqHuwRLuesW5+s9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by SN7PR11MB7975.namprd11.prod.outlook.com (2603:10b6:806:2eb::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Tue, 14 Nov
 2023 09:17:19 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::3f2c:c6e5:ae21:82cb]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::3f2c:c6e5:ae21:82cb%4]) with mapi id 15.20.6977.029; Tue, 14 Nov 2023
 09:17:19 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 03/11] drm/i915/display: Consider fractional vdsc bpp
 while computing m_n values
Thread-Topic: [PATCH 03/11] drm/i915/display: Consider fractional vdsc bpp
 while computing m_n values
Thread-Index: AQHaE776D9Tmsrn7u0W+DXZ2cLBBu7B5jxgg
Date: Tue, 14 Nov 2023 09:17:19 +0000
Message-ID: <SN7PR11MB675047F73A5FD6C82EE63296E3B2A@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20231110101020.4067342-1-ankit.k.nautiyal@intel.com>
 <20231110101020.4067342-4-ankit.k.nautiyal@intel.com>
In-Reply-To: <20231110101020.4067342-4-ankit.k.nautiyal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|SN7PR11MB7975:EE_
x-ms-office365-filtering-correlation-id: ca5fa087-abbc-44bf-5b70-08dbe4f280bb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: y1yclIl7VfifbNuK/6muQWvSzjXmwcrYMejjFhdWkH4cGwpxC65+enZPhBI+uY4SNE1ncdkcEG6K/536/LYqTOHpfVBUX3b0t9pLxbXiWQWO8qKp/d4hRwtweGO/HmQ9AdRRYaFdm3bi0uo7OnEPD6i5D3eB4W/abmPKvEZpX0UX7ElqoxTF/Dn80zgpS4IPEUZ2B8RkukDtZpj7HRsGopbt78e/WrJME+XbelUDbZWvGUgL1taskvN8upTNa4fKCmeAS7uOHPxJCzZmD9y3gM5FPYZQ/PNrLVdctDLcVzURQzKj5UPcMV9TAI+uRZ2ehaQ7H2M1zaalzT+PpFEbN3ayzNw4ng8JjtAfyBNjER2FvArLxWFj5Z368I9MJgap+o2pDvwoe+5ukBmqqFIpyNPy1mycQQPVdYw9Z6f0KdC4SOr2Pcp1xKfTR8sKLeFfB7ZU8Rm5STStfK1TrXvORFidxWwffaVWP2rcnzBygDJxCrvWClNiFR/q619y9YwEtB4m49cAeCMda2ZnxH3nM0l+/k36LyNblA70Q/agBSBOvAWXZuv0BhmXAoA9iHr0HXaU+MIyXmgcEUioqNSp7+I5fiOTkXc9n2aiQG1yfnuOo6IY3wZT5DC7Xa9te78Q
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(366004)(396003)(39860400002)(136003)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(86362001)(5660300002)(478600001)(2906002)(71200400001)(4326008)(8936002)(8676002)(52536014)(316002)(66446008)(66946007)(66556008)(64756008)(66476007)(54906003)(76116006)(110136005)(82960400001)(26005)(83380400001)(33656002)(55016003)(41300700001)(122000001)(9686003)(38070700009)(7696005)(6506007)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4jJkFSuuGB5ObPViSH8adHMRTVcenLRgGqpQw/t53G8dXCapy8m8USm/Ibbl?=
 =?us-ascii?Q?7t+GuiG5GW2EmdPbNZJUjc3YcBdpeOiPHOYTDpFcvG/7MPNa18jt0rbG0nLN?=
 =?us-ascii?Q?/9jwRvG00n+Z4EcERcqaBO6/AePNz7yhB4/N4KFbQnMmyjoiqRg44Ur5Pwtz?=
 =?us-ascii?Q?X12xNrb6VR+5ghuuaZ0oNuWpS8LqsKGCm6XrexOk7tdmwve0e95/VN8c1V4L?=
 =?us-ascii?Q?YEIPcp+y8FbTK32ZeosaVLLCAbXqYS9gKB79Gk+lueqDynbmZ4zmKnOYCESB?=
 =?us-ascii?Q?yoPIymtCgFhvV/ok3QV7iQ2EeMK0NBRe+sHYUIlmah/zLjSqayFJmbk4PzyV?=
 =?us-ascii?Q?MEeKm6k7z/qk+MyV+GaHsIGaaaubD3vO/fX2alUG7RwvWFUMpSkxg64ovrY7?=
 =?us-ascii?Q?Xg4KUtueuDVttm4KePDzk88oIkdalg4TTsJmpAfsF77S0kWBzontxECELn0U?=
 =?us-ascii?Q?2IMCJ6qTTkv/0bbNrLeW4Qm2DDf0PKIm/icV7RknMYMlO/+WqiW2GRYb3ouX?=
 =?us-ascii?Q?oMbFE6RvPQFzvX/DeBWPjLMGbC9HwXYVKnYeigOFX6lF94a57imyjqXhk+iR?=
 =?us-ascii?Q?qziGUG2a7XavHpMTxzBczQWBl6ml51Q7En2oMtsnEcZMOGklo2l44cd3koe0?=
 =?us-ascii?Q?5xHFBcqk93XmKuN830uNjFWULgkwbrdC1WOJyTQJjifFQNnuEEK3Y8vIAvH1?=
 =?us-ascii?Q?JZVDQKiixBj4D3S8yCP+SvsKi557fcubHcJi0lC9vXEmqoPyJtjZ78vUsh1c?=
 =?us-ascii?Q?8zNG+I6qF54YcMbOxGkeBQ9fiVr3mi6nIKoxnFFVW3049PHx2xMo5+KN626O?=
 =?us-ascii?Q?NuZqzDgwWk5PPx4nMzAjCaNCo/peUwS08PLCUbMqRyjlm9UQw31zA0xCkW4p?=
 =?us-ascii?Q?hidPYZvw7bsX6AQqRkTG5Qm8HCv7sYxAgaAZrrQeDHg/YRnk5sBGtkGZdSMD?=
 =?us-ascii?Q?KJo3gl9QdIIqhBluZEY4xy2/YtjkZDzwEwWN70xS6jD/U+TFcZsxXpP1p0ut?=
 =?us-ascii?Q?a/aCpp5C2NNhyxePquDyozZifdFj/iONXT2TNsY9R20cgoKaX1+JDHpLQYqw?=
 =?us-ascii?Q?B46DQRl5vFqi44zeX/jAE4Kq/OGz6urknlspCf/VE8FgQ6C9g9Yul+QriRkd?=
 =?us-ascii?Q?h9LgwqyCi2vETE1ju91b1BMVThj09saQHIx47m3o6luhKf6M6aDBsh4/jq7B?=
 =?us-ascii?Q?Ek+GUz9jbqL3qjR/XU5IjI4NpMahCs3shBjdtGyAM6EWNCasqKDSA+3t+yu5?=
 =?us-ascii?Q?lrsJm068xl9wl7AlJstQZYigNrRlc2nsDP+kG/8y8TE5Ox2v77E3RY+Pw00I?=
 =?us-ascii?Q?IcUZSZI1LTyIuvJD8+7fDFxb4v4x7U8ypeyFynNGbgWB4NdZrFBk89kZeVjO?=
 =?us-ascii?Q?dDIT0j3gSFfKb6ncFLq0O38Gtimzqe5mnyhxMEgbrdhRvJBqwxJp+Wx+tkbU?=
 =?us-ascii?Q?SB6UAVR5ErVKXF8sXZO3bSrjJDmuMXeVdNVdPR35Wj3nwsKBN1HWzmMIeV1v?=
 =?us-ascii?Q?1RUDLNPTD376SLUnVJMeSYbhc+QhM3XwFN2A13iw+qg5uP/F5Pdo1UtmVC/L?=
 =?us-ascii?Q?fUYh5kbGV9PjLE9n+wGIeR2iJ4YcWWRkTJppG35Y?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca5fa087-abbc-44bf-5b70-08dbe4f280bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2023 09:17:19.5724 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HxOMctK6XYKxI/DsgvpIwMCBTtuwwzvD67W0Z9bxaTWVlfM/6lUIc+tN0BxZQqDnvHNe8+uVglqdWMBwPmFJ9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7975
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
Cc: "Kulkarni, Vandita" <vandita.kulkarni@intel.com>,
 "suijingfeng@loongson.cn" <suijingfeng@loongson.cn>, "Sharma,
 Swati2" <swati2.sharma@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


> MTL+ supports fractional compressed bits_per_pixel, with precision of
> 1/16. This compressed bpp is stored in U6.4 format.
> Accommodate this precision while computing m_n values.
>=20
> v1:
> Replace the computation of 'data_clock' with 'data_clock =3D
> DIV_ROUND_UP(data_clock, 16).' (Sui Jingfeng).
>=20
> v2:
> Rebase and pass bits_per_pixel in U6.4 format.
>=20

LGTM.

Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
> Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c |  4 ++--
>  drivers/gpu/drm/i915/display/intel_dp.c      | 16 ++++++++--------
>  drivers/gpu/drm/i915/display/intel_dp_mst.c  | 14 +++++++-------
>  drivers/gpu/drm/i915/display/intel_fdi.c     |  3 ++-
>  4 files changed, 19 insertions(+), 18 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> b/drivers/gpu/drm/i915/display/intel_display.c
> index b4a8e3087e50..125903007a29 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -2415,12 +2415,12 @@ add_bw_alloc_overhead(int link_clock, int
> bw_overhead,  }
>=20
>  void
> -intel_link_compute_m_n(u16 bits_per_pixel, int nlanes,
> +intel_link_compute_m_n(u16 bits_per_pixel_x16, int nlanes,
>  		       int pixel_clock, int link_clock,
>  		       int bw_overhead,
>  		       struct intel_link_m_n *m_n)
>  {
> -	u32 data_clock =3D bits_per_pixel * pixel_clock;
> +	u32 data_clock =3D DIV_ROUND_UP(bits_per_pixel_x16 * pixel_clock,
> 16);
>  	u32 data_m;
>  	u32 data_n;
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index 4ad3718c3c7d..246f50d1f030 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -2663,7 +2663,7 @@ static bool can_enable_drrs(struct intel_connector
> *connector,  static void  intel_dp_drrs_compute_config(struct intel_conne=
ctor
> *connector,
>  			     struct intel_crtc_state *pipe_config,
> -			     int link_bpp)
> +			     int link_bpp_x16)
>  {
>  	struct drm_i915_private *i915 =3D to_i915(connector->base.dev);
>  	const struct drm_display_mode *downclock_mode =3D @@ -2688,7
> +2688,7 @@ intel_dp_drrs_compute_config(struct intel_connector
> *connector,
>  	if (pipe_config->splitter.enable)
>  		pixel_clock /=3D pipe_config->splitter.link_count;
>=20
> -	intel_link_compute_m_n(link_bpp, pipe_config->lane_count,
> pixel_clock,
> +	intel_link_compute_m_n(link_bpp_x16, pipe_config->lane_count,
> +pixel_clock,
>  			       pipe_config->port_clock,
>  			       intel_dp_bw_fec_overhead(pipe_config-
> >fec_enable),
>  			       &pipe_config->dp_m2_n2);
> @@ -2792,7 +2792,7 @@ intel_dp_compute_config(struct intel_encoder
> *encoder,
>  	struct intel_dp *intel_dp =3D enc_to_intel_dp(encoder);
>  	const struct drm_display_mode *fixed_mode;
>  	struct intel_connector *connector =3D intel_dp->attached_connector;
> -	int ret =3D 0, link_bpp;
> +	int ret =3D 0, link_bpp_x16;
>=20
>  	if (HAS_PCH_SPLIT(dev_priv) && !HAS_DDI(dev_priv) && encoder-
> >port !=3D PORT_A)
>  		pipe_config->has_pch_encoder =3D true;
> @@ -2841,10 +2841,10 @@ intel_dp_compute_config(struct intel_encoder
> *encoder,
>  		drm_dp_enhanced_frame_cap(intel_dp->dpcd);
>=20
>  	if (pipe_config->dsc.compression_enable)
> -		link_bpp =3D to_bpp_int(pipe_config-
> >dsc.compressed_bpp_x16);
> +		link_bpp_x16 =3D pipe_config->dsc.compressed_bpp_x16;
>  	else
> -		link_bpp =3D intel_dp_output_bpp(pipe_config-
> >output_format,
> -					       pipe_config->pipe_bpp);
> +		link_bpp_x16 =3D
> to_bpp_x16(intel_dp_output_bpp(pipe_config->output_format,
> +							      pipe_config-
> >pipe_bpp));
>=20
>  	if (intel_dp->mso_link_count) {
>  		int n =3D intel_dp->mso_link_count;
> @@ -2868,7 +2868,7 @@ intel_dp_compute_config(struct intel_encoder
> *encoder,
>=20
>  	intel_dp_audio_compute_config(encoder, pipe_config, conn_state);
>=20
> -	intel_link_compute_m_n(link_bpp,
> +	intel_link_compute_m_n(link_bpp_x16,
>  			       pipe_config->lane_count,
>  			       adjusted_mode->crtc_clock,
>  			       pipe_config->port_clock,
> @@ -2884,7 +2884,7 @@ intel_dp_compute_config(struct intel_encoder
> *encoder,
>=20
>  	intel_vrr_compute_config(pipe_config, conn_state);
>  	intel_psr_compute_config(intel_dp, pipe_config, conn_state);
> -	intel_dp_drrs_compute_config(connector, pipe_config, link_bpp);
> +	intel_dp_drrs_compute_config(connector, pipe_config,
> link_bpp_x16);
>  	intel_dp_compute_vsc_sdp(intel_dp, pipe_config, conn_state);
>  	intel_dp_compute_hdr_metadata_infoframe_sdp(intel_dp,
> pipe_config, conn_state);
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index 31461ea25f7c..5c7e9d296483 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -70,7 +70,7 @@ static int intel_dp_mst_check_constraints(struct
> drm_i915_private *i915, int bpp
>=20
>  static int intel_dp_mst_bw_overhead(const struct intel_crtc_state *crtc_=
state,
>  				    const struct intel_connector *connector,
> -				    bool ssc, bool dsc, int bpp)
> +				    bool ssc, bool dsc, int bpp_x16)
>  {
>  	const struct drm_display_mode *adjusted_mode =3D
>  		&crtc_state->hw.adjusted_mode;
> @@ -94,7 +94,7 @@ static int intel_dp_mst_bw_overhead(const struct
> intel_crtc_state *crtc_state,
>  	overhead =3D drm_dp_bw_overhead(crtc_state->lane_count,
>  				      adjusted_mode->hdisplay,
>  				      dsc_slice_count,
> -				      to_bpp_x16(bpp),
> +				      bpp_x16,
>  				      flags);
>=20
>  	/*
> @@ -107,16 +107,16 @@ static int intel_dp_mst_bw_overhead(const struct
> intel_crtc_state *crtc_state,  static void intel_dp_mst_compute_m_n(const
> struct intel_crtc_state *crtc_state,
>  				     const struct intel_connector *connector,
>  				     bool ssc, bool dsc,
> -				     int bpp,
> +				     int bpp_x16,
>  				     struct intel_link_m_n *m_n)
>  {
>  	const struct drm_display_mode *adjusted_mode =3D
>  		&crtc_state->hw.adjusted_mode;
>  	int overhead =3D intel_dp_mst_bw_overhead(crtc_state,
>  						connector,
> -						ssc, dsc, bpp);
> +						ssc, dsc, bpp_x16);
>=20
> -	intel_link_compute_m_n(bpp, crtc_state->lane_count,
> +	intel_link_compute_m_n(bpp_x16, crtc_state->lane_count,
>  			       adjusted_mode->crtc_clock,
>  			       crtc_state->port_clock,
>  			       overhead,
> @@ -180,9 +180,9 @@ static int intel_dp_mst_find_vcpi_slots_for_bpp(struc=
t
> intel_encoder *encoder,
>  		link_bpp =3D dsc ? bpp :
>  			intel_dp_output_bpp(crtc_state->output_format,
> bpp);
>=20
> -		intel_dp_mst_compute_m_n(crtc_state, connector, false, dsc,
> link_bpp,
> +		intel_dp_mst_compute_m_n(crtc_state, connector, false, dsc,
> +to_bpp_x16(link_bpp),
>  					 &crtc_state->dp_m_n);
> -		intel_dp_mst_compute_m_n(crtc_state, connector, true, dsc,
> link_bpp,
> +		intel_dp_mst_compute_m_n(crtc_state, connector, true, dsc,
> +to_bpp_x16(link_bpp),
>  					 &remote_m_n);
>=20
>  		/*
> diff --git a/drivers/gpu/drm/i915/display/intel_fdi.c
> b/drivers/gpu/drm/i915/display/intel_fdi.c
> index 1d87fbc1e813..295a0f24ebbf 100644
> --- a/drivers/gpu/drm/i915/display/intel_fdi.c
> +++ b/drivers/gpu/drm/i915/display/intel_fdi.c
> @@ -339,7 +339,8 @@ int ilk_fdi_compute_config(struct intel_crtc *crtc,
>=20
>  	pipe_config->fdi_lanes =3D lane;
>=20
> -	intel_link_compute_m_n(pipe_config->pipe_bpp, lane, fdi_dotclock,
> +	intel_link_compute_m_n(to_bpp_x16(pipe_config->pipe_bpp),
> +			       lane, fdi_dotclock,
>  			       link_bw,
>  			       intel_dp_bw_fec_overhead(false),
>  			       &pipe_config->fdi_m_n);
> --
> 2.40.1

