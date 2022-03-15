Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDFF4D9C8E
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 14:43:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 915E310E48C;
	Tue, 15 Mar 2022 13:43:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F0E510E48C;
 Tue, 15 Mar 2022 13:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647351834; x=1678887834;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:reply-to:content-transfer-encoding: mime-version;
 bh=yCAKdh9oK9I+yD16E8ehJE+2wrbRgyIg1esdfvU4TOg=;
 b=jIrsUjVUvLF/5TsBAP8+FU/YLE3dXQv7HDpo1pUcQ4he6X8wxQFOqD6x
 Fb+yFqTLczLYWC0EcbWIEzwqMqdHkGmU71voPGYQZkmBmeERQrxxSjicx
 w5Io+BzjXpyUpDAN2JT/5Su8WVqbNr2yNHWD1N4Dk6JAsAbr2Wicb7BAo
 nIPbu7ahtwv/ybHTkcYX7DTP8QyBQGaw4KrDxIXaoUZkVjvtra4cOZrJR
 bqdHtDSgPQZ5DkEhaWmS5H6uJHADoSrH5IJQ4qX510Sc2lTCIZQdsX4nB
 92nNrrr+BtFB/ioItY45jX3BkCgqtncd+0XliiWJFtdgLkyO2qieK0dTo A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="256493629"
X-IronPort-AV: E=Sophos;i="5.90,183,1643702400"; d="scan'208";a="256493629"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 06:43:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,183,1643702400"; d="scan'208";a="540441686"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga007.jf.intel.com with ESMTP; 15 Mar 2022 06:43:51 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 15 Mar 2022 06:43:51 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 15 Mar 2022 06:43:51 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Tue, 15 Mar 2022 06:43:51 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Tue, 15 Mar 2022 06:43:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lDclPz/rlJcIO9qflzu5xW80UbhUUGG5fiJaKJSgFTh/dy4NY14mwLA/SzKFcusEXHAepwxsiQpi5GNN5n6MWtyG7hhX+QxOJtg9f7714r2UI4ng4hv7XO9gpXldAf2wu6n9KTtw3D+DBrIe0zNxxW7C4Jkf4sLhB14x7ZM9aNhU+Y4iTWaebH2m4/wiWaenwsFKEFSb9m07dqkpfrNYkxDcl6uzsfl8kGW5cYajocHUqdj2U9ma5YIyDfSbz4WXrCCJ3xA4pPtwC0Q4LTiqr8G3Fud5DijuFujBlz7S9h/Q2O4656dXLCVgS7slfayC+yCVj4biN7ut5YX6RwqU6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E+DpqcSqZHYZrguYLnVUDS13Sd8efOQcy78wFZkkCRo=;
 b=FOZB7P6chzIqRwaIcTmOaETqZhOZPauELIQOE0+wcsYJn3zODDTx2aGIkkCZyevbYqPJU8n1FcbmKMTOVd5ViJsTS4Fj2/sYLW5WhBxzzc4E10cKdbyALqOni5Ra7rHB2t6/QPqumsdICUXRJ6EB3w5YQcwPaYtVLhpWDO7UtVlNItJatUpakW7lEMus5t80A3BZKIgS0RgoF1ZdLU9ikRyjC7LwN8ubaa6BkxdvC12PWr05THLD31GhAMKGpVh3ifmUm1+khptLhOoH2hXr8XZMGICEBq0Vq84y3U1mfUoLKiRYWAVdFtDZPLTmOaLVe6ZH1nCiJJSYqienrVXhbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB2710.namprd11.prod.outlook.com (2603:10b6:a02:c7::24)
 by BL0PR11MB3203.namprd11.prod.outlook.com (2603:10b6:208:63::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Tue, 15 Mar
 2022 13:43:46 +0000
Received: from BYAPR11MB2710.namprd11.prod.outlook.com
 ([fe80::48da:a7d6:83c1:7e22]) by BYAPR11MB2710.namprd11.prod.outlook.com
 ([fe80::48da:a7d6:83c1:7e22%7]) with mapi id 15.20.5061.028; Tue, 15 Mar 2022
 13:43:46 +0000
From: "Lee, Shawn C" <shawn.c.lee@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [v7 3/5] drm/edid: read HF-EEODB ext block
Thread-Topic: [v7 3/5] drm/edid: read HF-EEODB ext block
Thread-Index: AQHYOFxPaTuo0D4xEkKPpdxt6Wa+5azAcdWw
Date: Tue, 15 Mar 2022 13:43:46 +0000
Message-ID: <BYAPR11MB2710A7E2379E17F57E635901A3109@BYAPR11MB2710.namprd11.prod.outlook.com>
References: <20220313134702.24175-1-shawn.c.lee@intel.com>
 <20220313134702.24175-4-shawn.c.lee@intel.com> <87y21btr48.fsf@intel.com>
In-Reply-To: <87y21btr48.fsf@intel.com>
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
x-ms-office365-filtering-correlation-id: a35d1ec1-99e3-42ef-4eeb-08da0689d3f1
x-ms-traffictypediagnostic: BL0PR11MB3203:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BL0PR11MB320320F1193DDB564D205B73A3109@BL0PR11MB3203.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CYKWVBGUTF3XQgQ+jH/fBwCjElXVYrU5lD7XEu06UZkcWEo/KBEf0f1SNhFjrUT1w4z6F9ZeHJgGV7hhJ4/s2zG8Br9C9Q3YpNKZWKGIPhmZvLyToCNyVPA27Lv9koSBaIal42DJ0hQ5fBYu824yMtALZ5sb5S6qdNlmlkulDk8QB12+O5raYS2FM0WWLTjgP59Obt5d+QaqI5+ZQ1b6/vTKb4L7pEU1gth/ZqRhFP0atYPeySO1DnDcatB348CyDpKbw2SH22wliaeNoY2/eNokUXiVv2FuNBDmxv0qIsPV5H6B8Uy0q7wWULw5V0p91P8tXtHwlpgl3mveyWP8q0/YcAMomBFd0Qc6pkrDhjZwUztpXOe1JpjXJXCgsHZlN5mZism6RifRwRLJuWkrAtT58YN0qzytD0D38s+OFIoEE+F5Z6bW4WiOHFbnr4Of7Nut/l2uk6CZJIRw4/fIrIXQ22bXFUehpFS3n3uc2QLQawGS515hyaKVstjHAFK+qgxIjzOPiER5dZFre6A40Aj8iv/kgcMAgJT+fckPFOfvVquNehVkCjRyqsgCgvMoq67BWTD637j2PEvFH2SE++X1+mSGb2TXLwNdB1eXXl6mPYJs4a7OU23S0TQ+x/P4KryvtinjtvXogy2XBOdGJm7uWrIyWc+sbU8+2561ZFs0PIY7m9S40QXFdwZ/8vOXmv0FMQVRsHkhOcnF1iEayQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2710.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(86362001)(53546011)(55236004)(9686003)(7696005)(6506007)(33656002)(110136005)(55016003)(54906003)(316002)(66476007)(66446008)(64756008)(66946007)(66556008)(76116006)(38070700005)(38100700002)(8676002)(82960400001)(4326008)(26005)(186003)(52536014)(508600001)(5660300002)(2906002)(71200400001)(8936002)(8796002)(83380400001)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?z4zkLtDy1tBbUDDthCeg54Pid/Bmp5anBgRfcdwgyRAoUzvzjZ+9ikAPGkW9?=
 =?us-ascii?Q?vr9NwTA3DSJ3srX5wE7J44qR+Tr4fQKyO+5uQv5aCT/B7N+m/5Z6oC1VSzBW?=
 =?us-ascii?Q?TQPC6tcstqVFNVtVmScgoqJuN+6R4k9A4Sdb0+aZmG1KGAjIp/L50m2gYtdt?=
 =?us-ascii?Q?wa+/plwwY8TWTT9iAChb1/XQANttsRTMWs1kGxcsRbPtRr2HE1o2u0+65gqf?=
 =?us-ascii?Q?mr3LVqdR/WHSVzpeRJAYNsZDFzyS7VQRzMn1guyaBOeRVa9vQsShh+vCCd+S?=
 =?us-ascii?Q?kHaACcndoE1GbTV8/bH+qyS9cXDbXeLu+5y086BAMMSUnrS2jSQGMo6Zz+GQ?=
 =?us-ascii?Q?FdJCId9z6HAgyfm5MufPD7Itq+QRMWwYEQGfhHYSdbKXuTXIiGDuFtoYUp4o?=
 =?us-ascii?Q?8AxY8sU9RwaOonPwjc4givPaeqWR171lWcXSJ/ZclFaoZX6bKdODHltTpN+s?=
 =?us-ascii?Q?S330ziABk+mZm/NMBZmX4kOUlhWfV0oGQCw4T4q9zxBfLHPNwovVN6mWCQ7/?=
 =?us-ascii?Q?Fus1zK51qVsybdxZ8ysM4uQn7MhtWk9nfQwp/whfe4lyAZYLhTO4xCig5gKT?=
 =?us-ascii?Q?Aeu3YE3BLJeqjkhnh1CpYRg/ECjrEkFZVqem72j9FqhW+gQAGZMeeIDU3mTh?=
 =?us-ascii?Q?ZPhq48q75sx16+T7AcsI5WzVlY0igMBxWzeO+eS1DpFkcgDzGxya6gNlozRf?=
 =?us-ascii?Q?S2GHDI5VKMD6c7n3ng/afIgpWt5BO7x+byUVZQe44haIssKWCVhSH7KDmhpj?=
 =?us-ascii?Q?eMdiW2Apc8OeNUWM5qdZBuZwHnq+YE5o2YYQCGzQYU4Ca2ErABBujaLjl14D?=
 =?us-ascii?Q?Agb4EPZ/2M0fSZmV8i26lvTHhOAnqGWMlX3H4TIYeRz8ZnDaYO15Zwh93lcS?=
 =?us-ascii?Q?FEOdnfH/n53fuzuLB42E9T4gwMw+qdqZX1yEuWaiocK4Qn3XILjPMWtH+L9q?=
 =?us-ascii?Q?pQJ87Ldjd0+vd2kb6uJauogi6Ub8pvqVpbA20O7BYWnQVf6Mv4J/apvl5kXc?=
 =?us-ascii?Q?IgkR7im9vdVu64SJqiIzA2F68FAvOfpTHz97M3Tb2hzq0SzBxjc+aLbd/DeQ?=
 =?us-ascii?Q?mH0Iypi0MrK7CRxQpWTz/zbc9b6NhXUjKQUL4iQBKweixj5YojcH3MCnpAfk?=
 =?us-ascii?Q?oJUUbnA8wK7rHHhnQcIq1RNOWvVpI3+ytDzDHsNWBa+rQMxRZDepRVQciywN?=
 =?us-ascii?Q?zWuGy+5HjA9SxdC4K6bI7rGwqycKyJIMqgeda5hS2g2vuNg+u3SlLTlZ48NR?=
 =?us-ascii?Q?ZpN4XcYOp7wnEXGReis2/Q/uYXOXRcZ3o8+4ScTRVUMa/GaBtTiseTMHEGRV?=
 =?us-ascii?Q?j/Gk6Gz/AoAMNuEeX7tnOOIXWi3AuMfkfb4t7RJyd1DyIg3sourIy6x/fs1i?=
 =?us-ascii?Q?C3snyXBl0Or9j2TsPuZ5E9pJ8E03LjbAuoxcRMS0VzqoXTm2KnsSTEaIN88t?=
 =?us-ascii?Q?yMeZWSXgNzxPpDOTYM16qyohxAgIu+Da?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2710.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a35d1ec1-99e3-42ef-4eeb-08da0689d3f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2022 13:43:46.1033 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 57dyMXFePdl+5fEfXK2seVapkVogeCTvd6f69jnaCoVMF1Pm4uieAGjxCe32/pj89gSA4mWOnn1gHvGeJw3mjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3203
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
Reply-To: "20220313134702.24175-4-shawn.c.lee@intel.com"
 <20220313134702.24175-4-shawn.c.lee@intel.com>
Cc: Drew Davenport <ddavenport@chromium.org>, "Nautiyal,
 Ankit K" <ankit.k.nautiyal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, March 15, 2022 7:03 PM, Nikula, Jani <jani.nikula@intel.com> wr=
ote:
>On Sun, 13 Mar 2022, Lee Shawn C <shawn.c.lee@intel.com> wrote:
>> According to HDMI 2.1 spec.
>>
>> "The HDMI Forum EDID Extension Override Data Block (HF-EEODB) is=20
>> utilized by Sink Devices to provide an alternate method to indicate an=20
>> EDID Extension Block count larger than 1, while avoiding the need to=20
>> present a VESA Block Map in the first E-EDID Extension Block."
>>
>> It is a mandatory for HDMI 2.1 protocol compliance as well.
>> This patch help to know how many HF_EEODB blocks report by sink and=20
>> read allo HF_EEODB blocks back.
>>
>> v2: support to find CEA block, check EEODB block format, and return
>>     available block number in drm_edid_read_hf_eeodb_blk_count().
>>
>> Cc: Jani Nikula <jani.nikula@linux.intel.com>
>> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
>> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>> Cc: Drew Davenport <ddavenport@chromium.org>
>> Cc: intel-gfx <intel-gfx@lists.freedesktop.org>
>> Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
>> ---
>>  drivers/gpu/drm/drm_connector.c |  8 +++-
>>  drivers/gpu/drm/drm_edid.c      | 71 +++++++++++++++++++++++++++++++--
>>  include/drm/drm_edid.h          |  1 +
>>  3 files changed, 74 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_connector.c=20
>> b/drivers/gpu/drm/drm_connector.c index a50c82bc2b2f..16011023c12e=20
>> 100644
>> --- a/drivers/gpu/drm/drm_connector.c
>> +++ b/drivers/gpu/drm/drm_connector.c
>> @@ -2129,7 +2129,7 @@ int drm_connector_update_edid_property(struct drm_=
connector *connector,
>>  				       const struct edid *edid)
>>  {
>>  	struct drm_device *dev =3D connector->dev;
>> -	size_t size =3D 0;
>> +	size_t size =3D 0, hf_eeodb_blk_count;
>>  	int ret;
>>  	const struct edid *old_edid;
>> =20
>> @@ -2137,8 +2137,12 @@ int drm_connector_update_edid_property(struct drm=
_connector *connector,
>>  	if (connector->override_edid)
>>  		return 0;
>> =20
>> -	if (edid)
>> +	if (edid) {
>>  		size =3D EDID_LENGTH * (1 + edid->extensions);
>> +		hf_eeodb_blk_count =3D drm_edid_read_hf_eeodb_blk_count(edid);
>> +		if (hf_eeodb_blk_count)
>> +			size =3D EDID_LENGTH * (1 + hf_eeodb_blk_count);
>
>This approach does not scale. If the number of extensions and thus the tot=
al EDID size depend on HF-EEODB, this *must* be abstracted.
>
>Consider, for example, drm_edid_duplicate(), which only looks at
>edid->extensions. A subsequent HF-EEODB aware access on an EDID
>duplicated using drm_edid_duplicate() will access beyond the allocated buf=
fer.
>
>Yes, it's a lot of work to introduce drm_edid_size() and
>drm_edid_extension_count() or similar, and use them everywhere, but this i=
s what we must do. It's a lot more work to try to take HF-EEODB into accoun=
t everywhere. The latter is going to be riddled with bugs with everyone doi=
ng it a little different.
>

As you mentioned, we should have new functions to provide proper EDID byte =
size or extension counter.
And reuse them to handle/retrieve EDID more accurately in drm driver. Thank=
s for your comment!

>> +	}
>> =20
>>  	/* Set the display info, using edid if available, otherwise
>>  	 * resetting the values to defaults. This duplicates the work diff=20
>> --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c index=20
>> 9fa84881fbba..5ae4e83fa5e3 100644
>> --- a/drivers/gpu/drm/drm_edid.c
>> +++ b/drivers/gpu/drm/drm_edid.c
>> @@ -1992,6 +1992,7 @@ struct edid *drm_do_get_edid(struct=20
>> drm_connector *connector,  {
>>  	int i, j =3D 0, valid_extensions =3D 0;
>>  	u8 *edid, *new;
>> +	size_t hf_eeodb_blk_count;
>>  	struct edid *override;
>> =20
>>  	override =3D drm_get_override_edid(connector); @@ -2051,7 +2052,35 @@=
=20
>> struct edid *drm_do_get_edid(struct drm_connector *connector,
>>  		}
>> =20
>>  		kfree(edid);
>> +		return (struct edid *)new;
>> +	}
>> +
>> +	hf_eeodb_blk_count =3D drm_edid_read_hf_eeodb_blk_count((struct edid *=
)edid);
>> +	if (hf_eeodb_blk_count >=3D 2) {
>> +		new =3D krealloc(edid, (hf_eeodb_blk_count + 1) * EDID_LENGTH, GFP_KE=
RNEL);
>> +		if (!new)
>> +			goto out;
>>  		edid =3D new;
>> +
>> +		valid_extensions =3D hf_eeodb_blk_count - 1;
>> +		for (j =3D 2; j <=3D hf_eeodb_blk_count; j++) {
>> +			u8 *block =3D edid + j * EDID_LENGTH;
>> +
>> +			for (i =3D 0; i < 4; i++) {
>> +				if (get_edid_block(data, block, j, EDID_LENGTH))
>> +					goto out;
>> +				if (drm_edid_block_valid(block, j, false, NULL))
>> +					break;
>> +			}
>> +
>> +			if (i =3D=3D 4)
>> +				valid_extensions--;
>> +		}
>> +
>> +		if (valid_extensions !=3D hf_eeodb_blk_count - 1) {
>> +			DRM_ERROR("Not able to retrieve proper EDID contain HF-EEODB data.\n=
");
>> +			goto out;
>> +		}
>>  	}
>> =20
>>  	return (struct edid *)edid;
>> @@ -3315,15 +3344,17 @@ add_detailed_modes(struct drm_connector *connect=
or, struct edid *edid,
>>  #define VIDEO_BLOCK     0x02
>>  #define VENDOR_BLOCK    0x03
>>  #define SPEAKER_BLOCK	0x04
>> -#define HDR_STATIC_METADATA_BLOCK	0x6
>> -#define USE_EXTENDED_TAG 0x07
>> -#define EXT_VIDEO_CAPABILITY_BLOCK 0x00
>> +#define EXT_VIDEO_CAPABILITY_BLOCK	0x00
>> +#define HDR_STATIC_METADATA_BLOCK	0x06
>> +#define USE_EXTENDED_TAG		0x07
>>  #define EXT_VIDEO_DATA_BLOCK_420	0x0E
>> -#define EXT_VIDEO_CAP_BLOCK_Y420CMDB 0x0F
>> +#define EXT_VIDEO_CAP_BLOCK_Y420CMDB	0x0F
>> +#define EXT_VIDEO_HF_EEODB_DATA_BLOCK	0x78
>>  #define EDID_BASIC_AUDIO	(1 << 6)
>>  #define EDID_CEA_YCRCB444	(1 << 5)
>>  #define EDID_CEA_YCRCB422	(1 << 4)
>>  #define EDID_CEA_VCDB_QS	(1 << 6)
>> +#define HF_EEODB_LENGTH		2
>> =20
>>  /*
>>   * Search EDID for CEA extension block.
>> @@ -4274,9 +4305,41 @@ static bool cea_db_is_y420vdb(const u8 *db)
>>  	return true;
>>  }
>> =20
>> +static bool cea_db_is_hdmi_forum_eeodb(const u8 *db) {
>> +	if (cea_db_tag(db) !=3D USE_EXTENDED_TAG)
>> +		return false;
>> +
>> +	if (cea_db_payload_len(db) !=3D HF_EEODB_LENGTH)
>> +		return false;
>> +
>> +	if (cea_db_extended_tag(db) !=3D EXT_VIDEO_HF_EEODB_DATA_BLOCK)
>> +		return false;
>> +
>> +	return true;
>> +}
>> +
>>  #define for_each_cea_db(cea, i, start, end) \
>>  	for ((i) =3D (start); (i) < (end) && (i) +=20
>> cea_db_payload_len(&(cea)[(i)]) < (end); (i) +=3D=20
>> cea_db_payload_len(&(cea)[(i)]) + 1)
>> =20
>> +size_t drm_edid_read_hf_eeodb_blk_count(const struct edid *edid) {
>> +	const u8 *cea;
>> +	int i, start, end, cea_ext_index =3D 0, displayid_ext_index =3D 0;
>> +
>> +	if (edid->extensions) {
>> +		cea =3D drm_find_cea_extension(edid, &cea_ext_index,=20
>> +&displayid_ext_index);
>> +
>> +		if (cea && !cea_db_offsets(cea, &start, &end))
>> +			for_each_cea_db(cea, i, start, end)
>> +				if (cea_db_is_hdmi_forum_eeodb(&cea[i]))
>> +					return cea[i + 2];
>> +	}
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(drm_edid_read_hf_eeodb_blk_count);
>
>This should be static and not exported.
>
>BR,
>Jani.
>
>> +
>>  static void drm_parse_y420cmdb_bitmap(struct drm_connector *connector,
>>  				      const u8 *db)
>>  {
>> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h index=20
>> 144c495b99c4..585f0ed932d4 100644
>> --- a/include/drm/drm_edid.h
>> +++ b/include/drm/drm_edid.h
>> @@ -593,5 +593,6 @@ drm_display_mode_from_cea_vic(struct drm_device=20
>> *dev,  const u8 *drm_find_edid_extension(const struct edid *edid,
>>  				  int ext_id, int *ext_index);
>> =20
>> +size_t drm_edid_read_hf_eeodb_blk_count(const struct edid *edid);
>> =20
>>  #endif /* __DRM_EDID_H__ */
>
>--
>Jani Nikula, Intel Open Source Graphics Center
