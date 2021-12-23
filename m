Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2B747E497
	for <lists+dri-devel@lfdr.de>; Thu, 23 Dec 2021 15:40:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E19210E1F7;
	Thu, 23 Dec 2021 14:40:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A35C610E1F7
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Dec 2021 14:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640270429; x=1671806429;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:reply-to:content-transfer-encoding: mime-version;
 bh=TKxTPB9msQ23w804qIkdPitBAW8Td64z/M281Kg5qgg=;
 b=ExQo/mmbAGAJzpKJAzUiD2899cP48mSsQQGERJFXa4lpziB5U0Nm3YXF
 OmxWI23pPMhWAITiJqK3TCgVuNWl8ZuEDPe6NiVGgkeqsUcXUsW9VMt77
 w5sNMK3Uiw6MbMKs7otCGYy61Zt5BdrLFYZyg2+WS/BZW4ROE9Zyb9gmC
 71jmiGBtze8auaANXxcAhme+pvY1qoIiID0voKQAiS7uE0u51vsNA1ATn
 4dfHDijs3wDzaiwhN+CauB6hUpHO4we3DpqgeH8lxmnZfanrCIhraooOt
 ABROLuIiVKkaTByXzBXq+2zi+hPGz1AjYmUTt0aOyd5yQsS8w4jcfOrp6 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10206"; a="240636165"
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="240636165"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 06:40:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="587331731"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga004.fm.intel.com with ESMTP; 23 Dec 2021 06:40:27 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 23 Dec 2021 06:40:27 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 23 Dec 2021 06:40:26 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 23 Dec 2021 06:40:26 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 23 Dec 2021 06:40:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KeQIZI5fancw4xIrYpAwLRFcgT+9gFp3vGAgTFduFKOaSRGYMXFZ+ggKvbv53Aa81jB7eTPDwhO9bv6iMpj50fsEwK3MpsowUFcBfQ3/+KZaQ5sFAU3GeFvT6TyasNkVlcC5HOHaT3JQzoW7u8ZiYFOt3wJuMQcJfgdyQD332pSGjIUpKDPRf5uXHkx0aWS/HP91odPLZuzgN7hOX507GY5WKJuNw0kpxNzeoTaZI1TGQlJKP3kfshhDMmsArfRc0dSFQ8hchCHEcBqiJKGPVgUrFXwjM12ilFEGvRtUCFNYW8m5TklnbDGCBzgyXB600n1ae1DSwMyozKpBwyIUsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0fYywx9JpVyhIqEHPz+XwWPy7Oi/xe/S5AtoPZR3kTU=;
 b=JTZLKjlWNYZFay0SY7G7jTB1tZLoMvNDygyB9n5a6aBBFMPfY1Lmxu09KakTxua1KRgV140hL0ILisa7Y5uBMyKo3Ix3y95C5rT8bzj9HtdzkKVo2UyRf7/A6QpCr+SZGljknstqVAaRyFEsQOkCALRR4rmtSpLPa+IKNfuxNlCUNTgdAXGjpBd0kcId325SO2ZPYsyGuZ+blpKqf9XAughAahuy6drdSkjFCHuTShv+YBRYyEKnJk+oc4xXmmVYx7OCiZQGnxIGePfft0OKv303x5UySeo3KXi9ni5qRY/0/TcaQbPVXeiaJnMsd2CrOW/aRoZKx/ekJm0R0NfQLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CO6PR11MB5651.namprd11.prod.outlook.com (2603:10b6:5:356::20)
 by CO6PR11MB5585.namprd11.prod.outlook.com (2603:10b6:5:356::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Thu, 23 Dec
 2021 14:40:25 +0000
Received: from CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::4c98:111b:1f1e:898f]) by CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::4c98:111b:1f1e:898f%5]) with mapi id 15.20.4649.015; Thu, 23 Dec 2021
 14:40:25 +0000
From: "Lee, Shawn C" <shawn.c.lee@intel.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: RE: [PATCH] drm/edid: Refine HDMI VSDB detect
Thread-Topic: [PATCH] drm/edid: Refine HDMI VSDB detect
Thread-Index: AQHX72ykxEa6Eb2GEkqiPx+x1R/2/KxAG/iAgAAUhOA=
Date: Thu, 23 Dec 2021 14:40:24 +0000
Message-ID: <CO6PR11MB565121E2E2990F7F7CC20C2EA37E9@CO6PR11MB5651.namprd11.prod.outlook.com>
References: <20211212153331.15457-1-shawn.c.lee@intel.com>
 <YcRzg2ZcbyjSm1q/@intel.com>
In-Reply-To: <YcRzg2ZcbyjSm1q/@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.6.200.16
dlp-product: dlpe-windows
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cd63f6ec-8fb3-46a2-92db-08d9c62227f5
x-ms-traffictypediagnostic: CO6PR11MB5585:EE_
x-microsoft-antispam-prvs: <CO6PR11MB5585A2A20B6BA2C05E6D916CA37E9@CO6PR11MB5585.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: R6pq5yA7vUDRRDImfX5CZHfVQWFdjixnQ2teRwiOHvVoT3yg3UCNuX1xNB+0ty0eLlxxwaLwcXgLUX6KpkzbxaJ96gOo6kLO5eo7Yqh7t2J1wqI59zUETIVkm0oQ4aigV3sCdoZcmM+RrMdKkT6hWgdTh09m94Jge3Nc8/fZhs0fFT5K46N7KsRxUdx8FkFFUGY91WTfg8ZsY0IZD7mhRJo65oYVLLRaQlaEuNFdbCQRNUJ2PptEClDG3NuTE2Zf++LQOiK9RvaD4RxN5oiDFKzPWgFau/Fg0DGERyDmxwey8D/RSIaCS9GJGYiYdcgrdDMZDfPW98ia7ZUzbMHbt/YIo0qOEwbHBesRx3bPTeocUsUQqxdDJtYypTm0PCW7VvY6bjQXURqPn2DKWc3dJDWW3eqQEpTGyNzDhjyt3KyZYKnxE3/Z4zdVZJdPfFQcPjoUxujjTBpsljJExhogKhX+X4nHYWnOUMy/TexBGKEeFm+Ct/IhmQM8zYDk55urRu5fOSltps6UbWzF51oPoXsX5kz6zhomSe2iexDtHwSGcpFHa4dumgNQspBog1C5NU8b8ctpb227X/m2eP0mf1nqZjQ7Lxs0HG6jptwnbQba1o7NMtxEyP1SN9Lo8RPb+aJhSEqhomLwOX0JZkeUp2/OJ70j24nqeciFazhCWpY+eJaQfdW9As1t+U3KPE/Wn9Cp2qbQztqKOZWe8tOivw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5651.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(82960400001)(4326008)(38100700002)(54906003)(7696005)(122000001)(38070700005)(2906002)(86362001)(5660300002)(55016003)(83380400001)(33656002)(71200400001)(9686003)(8676002)(66476007)(53546011)(316002)(52536014)(966005)(66946007)(66556008)(8936002)(8796002)(64756008)(66446008)(6916009)(186003)(508600001)(26005)(76116006)(66574015)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Mkbbkmztq/iDmB+8FidSKYnID+C6nQzgMBaiGX8Z3eaT3n0Stvg7n1DRRo?=
 =?iso-8859-1?Q?Kxq6CxD74cKjUUH/sa0NBSDHRpW1BFqPbu++HgdV+L/Xs/P2FqWUWwhY14?=
 =?iso-8859-1?Q?bN+SL4Z3izPivwlkf0V/4XN70zuSdyWLhOR6+m9yy54dsTegtA1YHWJIKd?=
 =?iso-8859-1?Q?AhYNInDjZlMUPYC+wdSKvbwl+i2DY7SrF1JBq4tGkFZGB8QERvBC1dBPKW?=
 =?iso-8859-1?Q?VmRlOxdFyRDE/qaMV20tU3vkbcPjAbFOEi7FDIAKCSdKeOUCgtxEFvBCyX?=
 =?iso-8859-1?Q?9EuaYY1P7OXk2u36unuJsdIsMeIaGRnjAUz5TpWJkx+EThe50toO0t4gtj?=
 =?iso-8859-1?Q?oyZlhYVEcERBN2CBG8uLzqwtTTuIAGzHulH1bVBdlVMswSCxUu1KPBPk7X?=
 =?iso-8859-1?Q?Ayn0ANE2RRNb7IK8UgigkNdBEsU4c1aaY0V2IXtTPlPv5mdRigFbLI+r0t?=
 =?iso-8859-1?Q?jaRqWyAzzOu2scAwmpNNOiqWgfp2Mdl3NUTQAByuUfth5odX2OvLs/mcfo?=
 =?iso-8859-1?Q?I5vJvNC71j7r2Uglr/eVHw6RG5TXLMIPg4Gux0Nw6gxHoimocbvfxIDDEk?=
 =?iso-8859-1?Q?PD71z0jqNULaEErl4chnoEYMPRpT/M/0HSfn77Xu/ObX9ADWkkPP3UyG9B?=
 =?iso-8859-1?Q?47ri5xyTuftZLxQTIRtxd3aG3sf6Cg2SNHtsXO5os/3zOtaQHMdvnUaf1A?=
 =?iso-8859-1?Q?Ib5msPexaWNr95QAbQqaoi0GJ+eE/BbZcSxadAstv+6PkXmRmycOl9K15d?=
 =?iso-8859-1?Q?bJvslw9cUUpwL0526XdGyYH8YInC+jZ6ymfw3lRX6gp77pxR5AmN31+pBb?=
 =?iso-8859-1?Q?TAh3F44TnNWfskrnW9ChScVIQTih5dL143fKK2Zd2M4Vx6ed+/9WX/cxP1?=
 =?iso-8859-1?Q?xmWU/+q0r3PQCEQ5gTOGyCeX0Kut/VNUOWcSSBosNUXWuGUgj9x/EKS0e6?=
 =?iso-8859-1?Q?63H2SlAuxeyAO1tmma76jfO6fdZX3zUHQEuHRW2VIXWLMCsWk9s4m6xbwv?=
 =?iso-8859-1?Q?kWgj+N7SXgMwugTJNZsFss4IJq0bLn1kEKzDZfF+WUECpXRjHoQruQJMoI?=
 =?iso-8859-1?Q?OOknrnMPsNJTm4elFvmknFuUEngFOUkJp/uPPvNTwDYdQjkzSqzb4xjfqi?=
 =?iso-8859-1?Q?lXdkGbmgU7auJGrSsJNpv+HVvFM1Bewt7UtXO2z/45lBwH0HtG8iXdpip2?=
 =?iso-8859-1?Q?RZZL0xcSvgx8FDu1vEUBNOa+e8EiORM431H5v9JAEg4p7SVCfsw2LMFFpJ?=
 =?iso-8859-1?Q?E0G/Gn0v0zEyXvglQLByGOfQSA1RP5mrA89qDbMPjcs+oaIKRLEOmOmDhf?=
 =?iso-8859-1?Q?a2hPEQ8EN7awYU0DyD22MJHfBfDnxlEAXJBp1FlhsgV+BysamLRYTW/59s?=
 =?iso-8859-1?Q?7mMB/CK/FwGDIZJCLev1jXHb/LP1nJdUJS58NfM+jsgEYxo43mjH5Sylyr?=
 =?iso-8859-1?Q?q8jeb6F1Hbuv7S8/yOPx+Wg0ANXpWIXV662MqmPWjexc1cVyxTeYo/vr0a?=
 =?iso-8859-1?Q?YqeccAh+25HWyEzpIKNpUE0MGpzFyDo822/uT8xr4IIi5nw8gxnO0I2QOu?=
 =?iso-8859-1?Q?iPwnZWZQMUOcV5/ppFnq8nFLAnl0ynzl1pnFsAmdtX3BVtmQJwV9xqH4dw?=
 =?iso-8859-1?Q?6+untFVIuwIWhl7e1utYeFusQaQjKrg1hEjXGykp4+H7xjtwnOPOQEcA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd63f6ec-8fb3-46a2-92db-08d9c62227f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Dec 2021 14:40:25.0810 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FPjiMt/yaFFPKdPWIT1S38okn69YnJPVZy65JZId3bnlufkXpYX8bVCIFro6cBzJCLXW0L5HI+nxVwqeHl9GHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5585
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
Reply-To: "20211212153331.15457-1-shawn.c.lee@intel.com"
 <20211212153331.15457-1-shawn.c.lee@intel.com>
Cc: Dave Airlie <airlied@redhat.com>, Hans Verkuil <hans.verkuil@cisco.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, December 23, 2021 1:02 PM, Ville Syrj=E4l=E4 wrote:
>On Sun, Dec 12, 2021 at 11:33:31PM +0800, Lee Shawn C wrote:
>> According to CEA-861-F chapter 7.5.4. It says "The VSDB shall contain=20
>> the
>> 3 bytes of the IEEE OUI as well as any additional payload bytes needed."
>> Now DRM driver check HDMI OUI but VSDB payload size at least five bytes.
>> That may caused some HDMI monitors' audio feature can't be enabled.
>> Because of they only have three bytes payload (OUI only) in VSDB.
>>=20
>> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
>> Cc: Adam Jackson <ajax@redhat.com>
>> Cc: Dave Airlie <airlied@redhat.com>
>> Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
>> ---
>>  drivers/gpu/drm/drm_edid.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c=20
>> index 12893e7be89b..5aa4a6bf4a13 100644
>> --- a/drivers/gpu/drm/drm_edid.c
>> +++ b/drivers/gpu/drm/drm_edid.c
>> @@ -4205,7 +4205,7 @@ static bool cea_db_is_hdmi_vsdb(const u8 *db)
>>  	if (cea_db_tag(db) !=3D VENDOR_BLOCK)
>>  		return false;
>> =20
>> -	if (cea_db_payload_len(db) < 5)
>> +	if (cea_db_payload_len(db) < 3)
>>  		return false;
>
>I was a a bit worried that we are now assuming that we can parse some
>stuff without further length checks, but looks like that's just the
>"source physical address" stuff which we do not parse in drm_edid.c,
>and the other fields we do parse are actually optional and so already
>have the require length checks. So this seems fine.
>

Thanks for the comments! We will share the information to customer.

Best regards,
Shawn

>Closes: https://gitlab.freedesktop.org/drm/misc/-/issues/28
>Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
>
>Note that there is a second edid parser in cec_get_edid_spa_location()
>that does parse the source physical address. You may want to double
>check that it doesn't make any bad assumptions about the length
>of the vsdb either. I think we should probably get rid of that
>second parser and just have drm_edid.c extract the source physical
>address and pass that on directly to the cec code instead. But I
>guess the cec code still couldn't remove the second parser
>since some media drivers need it :( Though it could then perhaps
>be moved into the media code instead of having it as a massive
>inline function in the cec headers.
>
>--
>Ville Syrj=E4l=E4
>Intel
