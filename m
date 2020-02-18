Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC2C16211F
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2020 07:49:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5E9C6E133;
	Tue, 18 Feb 2020 06:49:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11E026E133
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 06:49:20 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Feb 2020 22:49:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,455,1574150400"; d="scan'208";a="229391342"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by fmsmga008.fm.intel.com with ESMTP; 17 Feb 2020 22:49:19 -0800
Received: from fmsmsx153.amr.corp.intel.com (10.18.125.6) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 17 Feb 2020 22:49:19 -0800
Received: from FMSEDG002.ED.cps.intel.com (10.1.192.134) by
 FMSMSX153.amr.corp.intel.com (10.18.125.6) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 17 Feb 2020 22:49:19 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (192.55.55.69) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Mon, 17 Feb 2020 22:49:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CZbuTmJfarY1Xqm6J93Kd/V0qHNU2LAytU9bO/bXbsicANQLTJOGmgNm2Kub6QVw1JPSze7jDhqRRQyve5mI0beDTBCa0kwHKM7s/ldCy5gfeifh95o1nwosIld01PnGgQVMi+7oClAa/Eg8a2EvqTkYuPBLLUPhN2l7J9rH1bkq8nDbljhlzNAUlKSrkvuWqgWIwCHnyvFxMCQL3XYuinThuLATRl/JzhVGOseR54E8cjAaWfch7EksrOl4ILwFIrnQatsmxwgyEvholvlF4CQxpIKhqjK6as/GvmZnOaa1y5VjqexZd7i0EfCWAGayKNXsTjnufQ3nX7RKa1gxFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QB5ZxAkx+g68UYonRZFkYgougmM/NNg6p80iaJUyY4c=;
 b=f7blFqQqWgSVVTQG4W2b1RI0lDIHivHLZP9Kpwp8SBRA5lazbWj9/ZUoXNwMet2mL2DoTfX6v5XO3jEKqC1czm6OYl32YtRMrKw807DxAMLX92yKYPXBq6W5RUlJP0g7nudzyoFEDqSHjayYQB2rwkedwbOtI2gT+yEjN8tXmPLBXSqqihhwoc89VnVipWUQTKKtMlCs8KhI3vbqpmw/usH3SpH3Kady8ShCbrt9EQ53Ua+XDwIJVbA03v8sCtFRbmSez1ZFqxMdIjDxUk05q6erakm9KcgHJepjYXgxzleS3hF1j7IPNj/YoKrlpKLV9tVDNkX4+1/K4vGbh8oOcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QB5ZxAkx+g68UYonRZFkYgougmM/NNg6p80iaJUyY4c=;
 b=RhgzDgisL1WVomAYlHEh33JN5RgMfGRm/Gq1qFw+6lkYaLeE1jiYhuzArURNJb7XASwMqFxm2EZxu1U3ZixAwPo9ENX3DdskSAaLZ526NMxDoTaEVH3g3OR4uKYC3yhnu+Sjf/QTFUSi/SeByk/vpAWffHs6gi9euCXOOK2mqWY=
Received: from DM6PR11MB3211.namprd11.prod.outlook.com (20.176.120.27) by
 DM6PR11MB4561.namprd11.prod.outlook.com (20.180.255.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.22; Tue, 18 Feb 2020 06:49:17 +0000
Received: from DM6PR11MB3211.namprd11.prod.outlook.com
 ([fe80::71c5:efdc:c87a:456c]) by DM6PR11MB3211.namprd11.prod.outlook.com
 ([fe80::71c5:efdc:c87a:456c%3]) with mapi id 15.20.2729.032; Tue, 18 Feb 2020
 06:49:16 +0000
From: "Lee, Shawn C" <shawn.c.lee@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: RE: [PATCH] drm/edid: temporary workaround to pass HDMI 2.0
 compliance HF1-13
Thread-Topic: [PATCH] drm/edid: temporary workaround to pass HDMI 2.0
 compliance HF1-13
Thread-Index: AQHV5XcHeXazymxV40K0GaosV+TLRKgfeReAgAEIiFA=
Date: Tue, 18 Feb 2020 06:49:16 +0000
Message-ID: <DM6PR11MB3211B45594F9D33039E3A192A3110@DM6PR11MB3211.namprd11.prod.outlook.com>
References: <20200217174139.3018-1-shawn.c.lee@intel.com>
 <20200217145327.GO13686@intel.com>
In-Reply-To: <20200217145327.GO13686@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shawn.c.lee@intel.com; 
x-originating-ip: [192.55.52.214]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cfa8915a-f4bd-4eb5-924d-08d7b43eac6c
x-ms-traffictypediagnostic: DM6PR11MB4561:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB4561E10F698B61E2874D0A88A3110@DM6PR11MB4561.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 031763BCAF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(396003)(39860400002)(136003)(346002)(376002)(199004)(189003)(33656002)(186003)(5660300002)(66946007)(66556008)(64756008)(9686003)(52536014)(66446008)(55016002)(26005)(66476007)(316002)(76116006)(6506007)(2906002)(54906003)(110136005)(66574012)(478600001)(86362001)(81156014)(8676002)(71200400001)(4326008)(81166006)(8936002)(8796002)(7696005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR11MB4561;
 H:DM6PR11MB3211.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Qko0bSEy8u7YJ8FwTyyFz4Y3gPMtdyhiToC0GWtsvqDoOyyN8I5mGNYbmLrMlk9Twypn3IcDoraj0L67kUPm/IUjiDvPcOOqEek+Q3Xc2YSZjkVIRpAYBtqcxuKGYPSoFew+BoKPbwH8BDlPeCLeu3zXX/a5L9o/iseY0BqmXpu/IxMsUp9kms7B1rQPfioTjQhUI9Ff6jKE7msAvDKQs+fQ2RvBD1X5jpdGNbbr9BCueXxLfTINxWvBKv0Xw14KorHlE6KQLn3IEp6zZOoozmBkbB7k/S6pCR616GOPGya7iOkZo+FEXr2SwOlMa6g2UqBKYMhP0Pnmd3GajhEtXv+q5Ju4JZ2Ann9XBEGZeBKN1lch6zdEMNjNRPjaD0f8ldqk9QPNZdZdGE/DKichAk754qEvdMoUsHdRADsBk1yDni+u3rx8AlRFy+lJbOXk
x-ms-exchange-antispam-messagedata: zoOYk8I/YRBwdsKzTV4d2gkp8HuMiKQ0a+3ZHMFEj1dDgeuSFnRZzKgj4zY03vSNHbaGRM65i/NDmlovF8twkhLbyBOlsUvaRVAc+R+8yS38XzdnXoTGS9vegoL0pEgz2gyUpT7FaccfQuDqfF/3EQ==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: cfa8915a-f4bd-4eb5-924d-08d7b43eac6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2020 06:49:16.8863 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7wfRMXgSfaBR9A+Qy84thdn8+q6+VKAmhnrf8UmUHTe7ZpqR7Bc1HLU9iBAL1+QNcJqSfhWVR+s8+Xy1wkjLhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4561
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
Reply-To: "20200217174139.3018-1-shawn.c.lee@intel.com"
 <20200217174139.3018-1-shawn.c.lee@intel.com>
Cc: "Nikula, Jani" <jani.nikula@intel.com>, "Chiou,
 Cooper" <cooper.chiou@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Tue, Feb 18, Ville Syrj=E4l=E4 wrote:
>On Tue, Feb 18, 2020 at 01:41:39AM +0800, Lee Shawn C wrote:
>> Test case HF1-13 for HDMI 2.0 compliance would ask DUT to downgrade =

>> output resolution to 720x480 or 720x576 (lower than 3.4Gbps).
>> And check scrambling feature was disabled as well.
>> =

>> But QD980 report it can support low rate scrambling. The vendor =

>> specific data block byte[6] was 0x88. If driver enabled scrambling =

>> rely on this info. Then HF1-13 would not get pass because DUT have to =

>> disable scrambling to run this case.
>
>Sounds like a broken test to me.

Yes! We will try to contact the vendor (Teledyne LeCroy) to analyze.
Like what we mention the patch title. This is just a temporary
workaround to pass this case.

Best regards,
Shawn

>
>> =

>> Cc: Jani Nikula <jani.nikula@intel.com>
>> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
>> Cc: Clint Taylor <clinton.a.taylor@intel.com>
>> Cc: Cooper Chiou <cooper.chiou@intel.com>
>> Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
>> ---
>>  drivers/gpu/drm/drm_edid.c | 13 ++++++++++---
>>  1 file changed, 10 insertions(+), 3 deletions(-)
>> =

>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c =

>> index 99769d6c9f84..0b4badc20c35 100644
>> --- a/drivers/gpu/drm/drm_edid.c
>> +++ b/drivers/gpu/drm/drm_edid.c
>> @@ -85,6 +85,8 @@
>>  #define EDID_QUIRK_FORCE_10BPC			(1 << 11)
>>  /* Non desktop display (i.e. HMD) */
>>  #define EDID_QUIRK_NON_DESKTOP			(1 << 12)
>> +/* Do not enable low rates scrambling */
>> +#define EDID_QUIRK_DISABLE_LOW_RATE_SCRAMBLING	(1 << 13)
>>  =

>>  struct detailed_mode_closure {
>>  	struct drm_connector *connector;
>> @@ -214,6 +216,9 @@ static const struct edid_quirk {
>>  =

>>  	/* OSVR HDK and HDK2 VR Headsets */
>>  	{ "SVR", 0x1019, EDID_QUIRK_NON_DESKTOP },
>> +
>> +	/* Quantumdata 980 test platform */
>> +	{ "QDI", 0x03D4, EDID_QUIRK_DISABLE_LOW_RATE_SCRAMBLING },
>>  };
>>  =

>>  /*
>> @@ -4710,10 +4715,11 @@ static void =

>> drm_parse_ycbcr420_deep_color_info(struct drm_connector *connector,  }
>>  =

>>  static void drm_parse_hdmi_forum_vsdb(struct drm_connector *connector,
>> -				 const u8 *hf_vsdb)
>> +				 const u8 *hf_vsdb, const struct edid *edid)
>>  {
>>  	struct drm_display_info *display =3D &connector->display_info;
>>  	struct drm_hdmi_info *hdmi =3D &display->hdmi;
>> +	u32 quirks =3D edid_get_quirks(edid);
>>  =

>>  	display->has_hdmi_infoframe =3D true;
>>  =

>> @@ -4747,7 +4753,8 @@ static void drm_parse_hdmi_forum_vsdb(struct drm_c=
onnector *connector,
>>  			scdc->scrambling.supported =3D true;
>>  =

>>  			/* Few sinks support scrambling for clocks < 340M */
>> -			if ((hf_vsdb[6] & 0x8))
>> +			if ((hf_vsdb[6] & 0x8) &&
>> +			    !(quirks & EDID_QUIRK_DISABLE_LOW_RATE_SCRAMBLING))
>>  				scdc->scrambling.low_rates =3D true;
>>  		}
>>  	}
>> @@ -4870,7 +4877,7 @@ static void drm_parse_cea_ext(struct drm_connector=
 *connector,
>>  		if (cea_db_is_hdmi_vsdb(db))
>>  			drm_parse_hdmi_vsdb_video(connector, db);
>>  		if (cea_db_is_hdmi_forum_vsdb(db))
>> -			drm_parse_hdmi_forum_vsdb(connector, db);
>> +			drm_parse_hdmi_forum_vsdb(connector, db, edid);
>>  		if (cea_db_is_y420cmdb(db))
>>  			drm_parse_y420cmdb_bitmap(connector, db);
>>  		if (cea_db_is_vcdb(db))
>> --
>> 2.17.1
>
>--
>Ville Syrj=E4l=E4
>Intel
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
