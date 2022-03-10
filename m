Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BF94D4970
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 15:32:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4355610E7CA;
	Thu, 10 Mar 2022 14:32:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E0F410E7CA
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 14:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646922768; x=1678458768;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:reply-to:content-transfer-encoding: mime-version;
 bh=q3PCvoP0sg6RvFQk4lbbQJCNCwaOxsX/CY0bBvnVDMY=;
 b=gOE/oRzjcRh1reL3aIMpdlT+yDqp85GodaehuABzDZ9AnA89UnpJaHm5
 DIG4zu0J/0ibFd0i/SWtfHS0lMloaCB2EG35EaFWIWVaOAizA0eUXJpJL
 byqOXNxH1cW7FdqZAAMsdlB7KP+Bn74XKUlON6wlm3RNqE8HAwb2KCI6y
 cbaJxw0RFSmK+6I+ByxSaoMI2Ut1OEhR399Zg12L1WZjko+FNe+eBWgKo
 mZgExjY37qbbj0zNoNGc5YHwPurOs5ZNwO4l7W0jSAL0P67EGjXI3zgRo
 HGhEX4U1teAxJoP0YhJO22YPF1+PfF9NUxPXl7lABehp3hjZ+NuphzsOo A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="254999040"
X-IronPort-AV: E=Sophos;i="5.90,170,1643702400"; d="scan'208";a="254999040"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 06:32:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,170,1643702400"; d="scan'208";a="712379828"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga005.jf.intel.com with ESMTP; 10 Mar 2022 06:32:46 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 10 Mar 2022 06:32:45 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 10 Mar 2022 06:32:45 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Thu, 10 Mar 2022 06:32:45 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Thu, 10 Mar 2022 06:32:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BPhrfxggABpVX82x1eJu1GD+2zywBtaFgTg/58yI9CiJCcxdodxLZLMLdmzrXW/7s8vGTIBq1u9xrvi/n0XU20RHej7mR8YfcMRprwNYJPENTAkkOa4ySrY8dEBNVgcEoUBKvS1q16JXYZUEGQVCaaFEBSlfvUDdMG46DaNz6H+LPpY2K/XYH6iR8OhO58zI+u5OJ6dKQB1F/NDmIiEwLW9mqP9pUci5P4Pr0nv18V4agBF73gmiaFlA5cleZOHJrkrmZTWPFgQOEc6wW+RSpNEgK36pCdvdo65N2rxLDEoA5guz7p7Q8jj7GJuEW9PfcsY9pnh8d7Do8Ga8EIqZbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zyhcfwweMR/GH9Q4Yp6EROftuLJW8OE7OLdnyvCJO4Y=;
 b=eF5CQmC0AiFt3W6p+itAdLOvlYlGJ4m27eO4TX1TShdMG3ZrT1P0IS2JNLNN0MS/HhJ5cK2yPTZOdPRIPh5YWOkiaTgiSzqjcbyVysKuKJrcFFq69rlWIACid110i6JJlI77mlV9u+M0KYz5r+m9pNWUnZgxKz8tlYi63wlGv6VaSPlqRzD/en9BEpyuBIf4PzixxjAATMBYcetc1Esuyjerpkc3oOQUEgulO1mV3AnLfsUKRwaw20UVMhUJ9s+2MxljfmRBsg41t7rU5axQp5wIHRtEZs4v7iNBFRpKX78Dm8PNN1r1zobw3hEs5hvSY/BjNcLoJzyqUl6bpJZOJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB2710.namprd11.prod.outlook.com (2603:10b6:a02:c7::24)
 by CH0PR11MB5217.namprd11.prod.outlook.com (2603:10b6:610:e0::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Thu, 10 Mar
 2022 14:32:42 +0000
Received: from BYAPR11MB2710.namprd11.prod.outlook.com
 ([fe80::48da:a7d6:83c1:7e22]) by BYAPR11MB2710.namprd11.prod.outlook.com
 ([fe80::48da:a7d6:83c1:7e22%7]) with mapi id 15.20.5038.027; Thu, 10 Mar 2022
 14:32:42 +0000
From: "Lee, Shawn C" <shawn.c.lee@intel.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: RE: [v4 5/5] drm/edid: check for HF-SCDB block
Thread-Topic: [v4 5/5] drm/edid: check for HF-SCDB block
Thread-Index: AQHYNGymu5hVeS/KfEeJmcTYl0AI1qy4rXbw
Date: Thu, 10 Mar 2022 14:32:42 +0000
Message-ID: <BYAPR11MB2710F4A645244AE242BB48C2A30B9@BYAPR11MB2710.namprd11.prod.outlook.com>
References: <20220302093511.30299-1-shawn.c.lee@intel.com>
 <20220302093511.30299-6-shawn.c.lee@intel.com> <YinX1pX56kZTJp4L@intel.com>
In-Reply-To: <YinX1pX56kZTJp4L@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.6.401.20
dlp-product: dlpe-windows
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 05631114-9f42-4c7b-11d1-08da02a2d5f8
x-ms-traffictypediagnostic: CH0PR11MB5217:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <CH0PR11MB52174632376B94DE45B4A221A30B9@CH0PR11MB5217.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gWvHq1T4//chcuh2Pb5rQ6n9x5PFn3rYgdZ6PQhuivKG+Z5YVKpT2uYw8W4976W8QDRphHy4th/xffKjLqGnHe8U7TcOg1QT53OwrqgVQhc8a/BeCoTNNOF87or1G7U+IUNs+RvsV0Cg75xjWHy+5fCE+GKH3+52oExqunCesMmoVdtTMvWotxsBv13hmIPWVgqMGNAH+NHpNsc/pBZxJmtYjE4/yeUGITdnucXd/VpR3SZtRmp1lEO7SQq3ig3/rxCRFZVuyHEPDeKeI5I4KiGagzeYDeUAsLA2YSArhZ7rxX/zCOw+YViPNMXd/rmYZiwMi0PNulkQzso2iAZG9luV68nEJGGhLo1pHvVN3aVeS7ZNt+7B6ve05HWh5JDlYmDR+jkpYglgI3V/B4bnQE8zr4J/vevs8wN+SnGy5db6Irh/unNAjtQo7Y6uiZJr8B4WlrdsZC+Q/40axq/EhjJ9p/VkYrPkBADtKxv2XMr14Lz0AYDIhKBxfoOb8IHN2PBRL1yPNXUe9Bp6Zufq203aoCnOlcsfNNZY0HztOWFCwQsEcyDts5TePoGiRkLmYT4il8NrU8PJasr0JOrqF2BgOww8vYVl5IxF+tsUUs5vFqN3o1Auca6IbiPUJTr/r2MLvbQmQyjkyvARPiqxe/SWNMf4p+Gw2uJZbJLLwq4mIGAT9kG4dlpBTGICOHtFzSdOsfKFc/8ZQDaSnqX21w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2710.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(4326008)(66574015)(83380400001)(53546011)(8936002)(82960400001)(2906002)(26005)(8796002)(52536014)(9686003)(122000001)(6916009)(186003)(316002)(71200400001)(33656002)(86362001)(6506007)(7696005)(54906003)(38100700002)(66446008)(66476007)(66946007)(66556008)(5660300002)(76116006)(55236004)(508600001)(38070700005)(8676002)(64756008)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Ql2eRKHmXgU5g25CeRf5pl5nyc47BI980iTn7aRZ8qCNxeFA6tZ2VKH7qY?=
 =?iso-8859-1?Q?GEQq3t2F5b2C0e7yWktliJwNv9SGJ6vvN9hAVjZtcBBvVGZJHzUeC/L9sM?=
 =?iso-8859-1?Q?y5Vpswqlzq2G4niavm3/K9zb9osvUjWX6L2ALVPebZaJoiXfBhT/CgANEK?=
 =?iso-8859-1?Q?Bp4DWFo9UT/4DpR8XfkEe17bE1pNVJ75+QxptXcC2sefxZVLtTekBRcsc2?=
 =?iso-8859-1?Q?mQtLFpGCGZt4cuRlbm7qFQxAvGtprzSv8jelMw/GBl4rB+FgQCmubIDBdo?=
 =?iso-8859-1?Q?DzWwX8H58wfuVxY9UBjLgTCsfvhT5S1fLDkr5SfDG1vtBPi1JRRjbSS//w?=
 =?iso-8859-1?Q?1Nq6+Y6G7JjYHwbV7+PwFNnFr9UM0sNa+yJUVIstr8KkJjG5l5H4lF6y5E?=
 =?iso-8859-1?Q?x9X4+qCfAazON0uxcIbckXRgT9+SD0XBTtgQy7FGFO3xUksAdUbIJUKb7I?=
 =?iso-8859-1?Q?hft9nsgvmI5h5aFOtMdaLXJyvvZHb131+MFdc2y9GNLjW0CUdDTxmWPMCN?=
 =?iso-8859-1?Q?sliRcCP2cMPnRwMO2WTCme8/LZJpTps8oSkAA88hDy5fIVVGXqocLHA554?=
 =?iso-8859-1?Q?oPeEfFLDelU8lVYFbGOIdnLNcgjA3zaB9ZU23W1VP9qwuJ1WT1wBMQH8DT?=
 =?iso-8859-1?Q?y2gubOoZcU+FxFtRzKtx4qpSyDYBAcFRpHSDalewlgIxp+c0yDNPk81Y++?=
 =?iso-8859-1?Q?2Lo+vQ1vlUIni/DEqrTkwn2q560ljOUlXxiE/2damEJv3sgxIJ6yspqwCm?=
 =?iso-8859-1?Q?5vG2U5gisoRh8RcIdZK2qqN5U+1mJRdehJhMFJyDmtQLmuqx0s7zmhe5+v?=
 =?iso-8859-1?Q?tn/iBXcmPHxYE6S66Zdz7hN1pzHmDO4AITGfLI0JDOPz2L77qd37oiq3tE?=
 =?iso-8859-1?Q?2LkUdEA2g6gt/+pyyeyrhRNP97bJWdl6gn9cRAuwi5+aqLr8ZsJ4Sa8AaS?=
 =?iso-8859-1?Q?/6I32G+dgnBfIrlWQshezJ2FV+LmMg4vIkytR0M9SZP0qwxJXY0NjEhBWm?=
 =?iso-8859-1?Q?bKUsfDo/hurvkrUY4O1XOk6ZiXApUvl1hUPq3ssKlbkiiaD0ZtcZuOwjnF?=
 =?iso-8859-1?Q?KsPQYCRblEEVSAm5AzAK1Z99dPEGUZzR1HQz3b2g3VuDZDqvxK2JpmPbAA?=
 =?iso-8859-1?Q?Q8H0MB1UEfLBLZl7v0rIpBbBoZaEPcfShqtRjJvjMrF3r675Som86WLXL/?=
 =?iso-8859-1?Q?mGrFjq0qElzl9H3Fmkkz2VelJw+H1LyG1jnAo6onHAxxUzQ1oGwjopzI1n?=
 =?iso-8859-1?Q?kVZW9iWJljGBb0A69TvUADPZF8fCaH5HdBTdpTSRIY7tkRpHPx5xqY9mT0?=
 =?iso-8859-1?Q?MreLWB+ANuAAsFTddiql9OgpAImQPRQXXd9pgywk16PsKY2N3c0rTBk8PQ?=
 =?iso-8859-1?Q?C9RRDMygELvEj25sDOJQs9VX37BOGJsk8StVP7B3mOo2YHLZWgQBT2/Zvt?=
 =?iso-8859-1?Q?Eh5kNOFu9PqGQ6YXUi8INrW46ECCP0iGvwGQkq4RxTAc/p/Y2sndWaVTIM?=
 =?iso-8859-1?Q?ekpYjFyNB9KV94DEmJCdVs?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2710.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05631114-9f42-4c7b-11d1-08da02a2d5f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2022 14:32:42.3014 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lXbsjQkzDRqXAfOZ81V1QaJqs7zUZWswhoY9FvsXQ7akCK1rx8eoDBvdtMWFWrIHhBxgCjLn/tkTHT5o37ujPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5217
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
Reply-To: "20220302093511.30299-6-shawn.c.lee@intel.com"
 <20220302093511.30299-6-shawn.c.lee@intel.com>
Cc: "Nikula, Jani" <jani.nikula@intel.com>, "Nautiyal,
 Ankit K" <ankit.k.nautiyal@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, March 10, 2022 6:50 PM, Ville Syrj=E4l=E4 <ville.syrjala@linux=
.intel.com> wrote:
>On Wed, Mar 02, 2022 at 05:35:11PM +0800, Lee Shawn C wrote:
>> Find HF-SCDB information in CEA extensions block. And retrieve=20
>> Max_TMDS_Character_Rate that support by sink device.
>>=20
>> Cc: Jani Nikula <jani.nikula@linux.intel.com>
>> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
>> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>> Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
>> ---
>>  drivers/gpu/drm/drm_edid.c | 36 ++++++++++++++++++++++++++++++++++++
>>  1 file changed, 36 insertions(+)
>>=20
>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c=20
>> index 2b8ddc956ce2..d6b48c543c23 100644
>> --- a/drivers/gpu/drm/drm_edid.c
>> +++ b/drivers/gpu/drm/drm_edid.c
>> @@ -3350,6 +3350,7 @@ add_detailed_modes(struct drm_connector *connector=
, struct edid *edid,
>>  #define EXT_VIDEO_DATA_BLOCK_420	0x0E
>>  #define EXT_VIDEO_CAP_BLOCK_Y420CMDB	0x0F
>>  #define EXT_VIDEO_HF_EEODB_DATA_BLOCK	0x78
>> +#define EXT_VIDEO_HF_SCDB_DATA_BLOCK	0x79
>>  #define EDID_BASIC_AUDIO	(1 << 6)
>>  #define EDID_CEA_YCRCB444	(1 << 5)
>>  #define EDID_CEA_YCRCB422	(1 << 4)
>> @@ -4277,6 +4278,20 @@ static bool cea_db_is_vcdb(const u8 *db)
>>  	return true;
>>  }
>> =20
>> +static bool cea_db_is_hf_scdb(const u8 *db) {
>> +	if (cea_db_tag(db) !=3D USE_EXTENDED_TAG)
>> +		return false;
>> +
>> +	if (cea_db_payload_len(db) < 7)
>> +		return false;
>> +
>> +	if (cea_db_extended_tag(db) !=3D EXT_VIDEO_HF_SCDB_DATA_BLOCK)
>> +		return false;
>> +
>> +	return true;
>> +}
>> +
>>  static bool cea_db_is_y420cmdb(const u8 *db)  {
>>  	if (cea_db_tag(db) !=3D USE_EXTENDED_TAG) @@ -4987,6 +5002,25 @@=20
>> static void drm_parse_vcdb(struct drm_connector *connector, const u8 *db=
)
>>  		info->rgb_quant_range_selectable =3D true;  }
>> =20
>> +static void drm_parse_hf_scdb(struct drm_connector *connector, const=20
>> +u8 *db) {
>> +	struct drm_display_info *info =3D &connector->display_info;
>> +	u32 max_tmds_clock;
>> +
>> +	DRM_DEBUG_KMS("HF-SCDB version 0x%02x\n", db[4]);
>> +
>> +	max_tmds_clock =3D db[5] * 5000;
>> +	if (info->max_tmds_clock < max_tmds_clock) {
>> +		info->max_tmds_clock =3D max_tmds_clock;
>> +		DRM_DEBUG_KMS("HF-SCDB: max TMDS clock %d kHz\n",
>> +			      info->max_tmds_clock);
>> +	}
>> +
>> +	/*
>> +	 * ToDo: Parse the remaining SCDB data if needed
>> +	 */
>
>If I'm reading the spec right this block should contain the exact same stu=
ff as the HF-VSDB. We should reuse the same code for parsing both.
>

Yes, you are right! HF-SCDB contain the same SCDS data packet as VSDB. I wi=
ll fix it later.

Best regards,
Shawn

>> +}
>> +
>>  static
>>  void drm_get_max_frl_rate(int max_frl_rate, u8 *max_lanes, u8=20
>> *max_rate_per_lane)  { @@ -5282,6 +5316,8 @@ static void=20
>> drm_parse_cea_ext(struct drm_connector *connector,
>>  			drm_parse_y420cmdb_bitmap(connector, db);
>>  		if (cea_db_is_vcdb(db))
>>  			drm_parse_vcdb(connector, db);
>> +		if (cea_db_is_hf_scdb(db))
>> +			drm_parse_hf_scdb(connector, db);
>>  		if (cea_db_is_hdmi_hdr_metadata_block(db))
>>  			drm_parse_hdr_metadata_block(connector, db);
>>  	}
>> --
>> 2.17.1
>
>--
>Ville Syrj=E4l=E4
>Intel
>
