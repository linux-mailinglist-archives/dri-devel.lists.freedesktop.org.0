Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99050472C82
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 13:42:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40B4F10E6E0;
	Mon, 13 Dec 2021 12:42:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 023BC10E6E0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 12:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639399359; x=1670935359;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:reply-to:content-transfer-encoding: mime-version;
 bh=ci8uKHhS456Fwckh4hQNn6rMYHzTKpgWVHKkqlzvEIg=;
 b=BZd9gfhM4GZTzJwY7sztlvAEAIGdJqVmnPAZujqMCjIxy0VvdVdaxFPH
 Qzr+I9xlgcu+5rMaXmmHrM4NVeMBlhbZmTpTo9tlwo5HGM+sze1R/lXYk
 s/ZqdrZ/Ankr0+ztTJBt6wb5e7ZXL4N9vM2QRqOp2JPvh7nZFw8Nq6X+8
 Fs+RB1zB9yjjItBdKq3VTb1IVtVRUIXcdgjhj7v5LhJb1pzMNpVjwJUI5
 Q27fj5FLVZ44/lyoPjHA5QxIFiPrRuu/7sev7om5+6l6eXyNq2nQX4iG+
 rZg/bSt85yOk9riISwwZ2xkPCd3kBKizyqD/11hkkI6H0syqKpJQmpjFA g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10196"; a="262847923"
X-IronPort-AV: E=Sophos;i="5.88,202,1635231600"; d="scan'208";a="262847923"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 04:42:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,202,1635231600"; d="scan'208";a="517732535"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga008.jf.intel.com with ESMTP; 13 Dec 2021 04:42:24 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 13 Dec 2021 04:42:23 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Mon, 13 Dec 2021 04:42:23 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Mon, 13 Dec 2021 04:42:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SCIk64yCoPRHgZVAB8GhkQzSU2Frdq+oEjad1gq4dkD2Sid0bsIMZmB4n628aiy53pkSsxonazh646ivwBebrDpSOSqa92h79vnQ11yylR2KNSt7giZyu4OFwiBzxKB5HdEKgXF1Jr6cC/Y2TDQF6kXn1pVcwqoNk76zzChH6ML44Y4xe2ly/b0SVMYJGM0TNc1+lOLFLzOQfbmEQYvAgF4KHiF6nVu1sfpBhRPsugGI1VlZROWqWkaXR1SqNZU8oaC9aQgXSrRV47VV2SIluf9SoFofE/uWN5EWQqZfyJhTQOWrhpnC0MFjrRp+KvtTT+8eeRwRK+HIe0dpKJZGSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J000p/3BknqXMB2eMGQppb2RDfqERon597RIbuZzmY0=;
 b=CKcGPeBdEpFVxr1DwyWZgvV+9Q6T5mm5Q+xCS0h+Rc7hzaSr1WlcSYZ3MxSucPu5bdOmgKUnsQlxpG+vP+ES92WY0u1qm1M/pltex2VRirg36PSOvnK5Wa+y8N37wzf2MxbHjIGrkypUR+KoulsZfYwS1DzPCWIeTN7WnJ0UUgpGzhits6fs0M8j4M5cF6JR00U02OXZKVKJiUKnk3jo8ZBj/qd1RwRfxz1yrHh4cMLuwHsYBIaiGIBZn9/v1eDPxRG3L20e+wcdiGiOGG5fztBiYG4BtaEtLN7TurQa7FUXhFjO98qqQSKSZYPD9GSpDQHWCKjwDiGuWrHQwsEjFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J000p/3BknqXMB2eMGQppb2RDfqERon597RIbuZzmY0=;
 b=iPy8dZ/TgcZ1BiHGDZ+bcLGKvvzMDkTv+xljil5yjUtKtQPxMiya/KVooI1clc9rvYkTEFaEu/aCNn1qfJG91DqK8h7+zY6BKRK63gObKyUFEve0VYbegLjraYB1mFBKPrzxHnVcfYbOBHegscZmBqFu3TiOCdG8yrtKwCNIwZk=
Received: from CO6PR11MB5651.namprd11.prod.outlook.com (2603:10b6:5:356::20)
 by CO6PR11MB5636.namprd11.prod.outlook.com (2603:10b6:5:357::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Mon, 13 Dec
 2021 12:42:22 +0000
Received: from CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::4c98:111b:1f1e:898f]) by CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::4c98:111b:1f1e:898f%5]) with mapi id 15.20.4649.015; Mon, 13 Dec 2021
 12:42:22 +0000
From: "Lee, Shawn C" <shawn.c.lee@intel.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: RE: [PATCH] drm/edid: Refine HDMI VSDB detect
Thread-Topic: [PATCH] drm/edid: Refine HDMI VSDB detect
Thread-Index: AQHX72ykxEa6Eb2GEkqiPx+x1R/2/KwwW62AgAAASYA=
Date: Mon, 13 Dec 2021 12:42:22 +0000
Message-ID: <CO6PR11MB5651F2A61786E1945FC0B1CEA3749@CO6PR11MB5651.namprd11.prod.outlook.com>
References: <20211212153331.15457-1-shawn.c.lee@intel.com>
 <Ybc8+3YonPSH99kl@intel.com>
In-Reply-To: <Ybc8+3YonPSH99kl@intel.com>
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
x-ms-office365-filtering-correlation-id: 621aa20c-bca4-4e40-fdf8-08d9be360280
x-ms-traffictypediagnostic: CO6PR11MB5636:EE_
x-microsoft-antispam-prvs: <CO6PR11MB56363BEC4499676D37F8E092A3749@CO6PR11MB5636.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7H3c6K8yCH4VNDZlLMj6EHyx41hs2jQEiJedFymgIGMrmVr1U1JHwUWU9ba6u2+3UfqHKxlbIHITzYTVYIhIzo9pJUupIuftsD4tybwbW7vvCmIeRhimc3rNEho5INjaIeaXXA6QN+ds+tWTVehy/ffmXRldlN2mBiOFDvAsj8VpFticFMjiAHRUZdMTh8pHzd3aoiHxOXF388ySwpOciuXGxDm4J57qyf1c8g2lc23zp7sq73uxGS2PRtXWYHaAJYgJF5v6yWe7EgNk4dDgKV3k1LzPQRh8kcyWxrRLsIddLnMqoqWjf97r+b1pYGb1V89rp7L0p5B6cP3g1MN58AGdEw3HFWE0JwymxOno9xHSIT9DYdvQdhnTfKatyUxr+IGb1npgh37cnkRgYqXT/K+p6v/tDFA0obPS6a7hh5hPj5PrVpAVs28wOIb2NRK66j2FNRhiB/RtzSqRSJsaXcmOBUlXckYEI37wBoFfyFnMJM5ukKbZlAEiDRHNOtC9Jl914TMMW8DpeQaW1O8ERia8hqAHo7w4hBgmyYqP1/c/6xpHA0UKdbXSBtSoleeEbmy8Of1tefowu4hssIcGdfJcAb3SiUp7dQAlKFAZMWqNYgMjzkvP+zfXySIPKcRWlIYYlB23fevK4c8hMbjpa3IhYbyyMEJa4Bo/gry7SjovbwvcgjuwTYoN/ePAF3KGZw+aGINL127X4mfY3OsF+g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5651.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66556008)(6916009)(55016003)(9686003)(186003)(38070700005)(64756008)(38100700002)(5660300002)(7696005)(316002)(66446008)(54906003)(66476007)(8796002)(26005)(83380400001)(53546011)(8936002)(8676002)(76116006)(71200400001)(86362001)(508600001)(4326008)(66946007)(52536014)(82960400001)(2906002)(66574015)(33656002)(6506007)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?fc3kT/ah9YknDaAiS4KLoPaY2ebwYOtgFUF60FXoKJP/Qj/4BhtzG9ixCU?=
 =?iso-8859-1?Q?+6HLCSl7rBtyhoeZvYiGJMW5TGWGtYYFKO4p/4JSQUmP7h88w+mEra5rvG?=
 =?iso-8859-1?Q?P0xwEowJYin7kletYVuVRXtSFjvYLJpqqnZtq11rsql2SLhYNwZ/Es3i8A?=
 =?iso-8859-1?Q?WZy1001znfmUjEVK8ksyoiGzzN9j+rtHyaXHlRTDimdAbpUFFSs6rwYttt?=
 =?iso-8859-1?Q?1mVz07GffrQWIYfa54D8qas6Gvdm9LsH19eTVnWmNLzehJAEicfxWS1SB2?=
 =?iso-8859-1?Q?xwMnjKJvDITB/N9ZXWSwQD7cMChc738RY8oaXQecm5aJI3gVV73XGMlz0+?=
 =?iso-8859-1?Q?hqds4V+zBu13K6kyi9v2yAG6FPNRjCkKnPEw0/U81cJouV+96aoN/4LNII?=
 =?iso-8859-1?Q?iEEt8YyZ7n7G4TQOylZ1Jjfu5DSg5LNAC8Y89ntgGpjrhnS0E684MSL4/j?=
 =?iso-8859-1?Q?qWnPP3HqdPKh9+m1TzHJEK65RjZ2wFz9RYpYOK+KG2tq9eHQJyl1Pa//ht?=
 =?iso-8859-1?Q?axZxHSzLxbzN5pwkfUmRtdPBJQWmyVbRfps3efvb/zmRPtCQg2qzYuXUbX?=
 =?iso-8859-1?Q?qsTyFt1G4ILv3ZjZUbqL5ufWNi35TFJh65V2mhGEp9BCenYqjik/AtdzlU?=
 =?iso-8859-1?Q?m3S8+tuHArcyvaK61acf7woAeoChb86gcG91z7fpYd2BZzmRTLsRMxQV31?=
 =?iso-8859-1?Q?e9neUwezQA851+hwZMSNTYgiOrBG+CMP5nHbIgvyz1Mm55ZcOkQihgOYo2?=
 =?iso-8859-1?Q?ZYH2p8MiqBCdWa3V3oKk2Ftmfv83mddSGzFeaIjmJnhkIu9WhFzh+X3XQ1?=
 =?iso-8859-1?Q?HVtIErHG9vodqRi5lKE0gaPObq0ZH/yBvg8OxF8+a53HJDGlzeotcgrZFg?=
 =?iso-8859-1?Q?Y9RnFhAqS9VGnz3ubGhsn9S7RQwn/8zjiRFx21zI4k7XtMWvjNisAkdjT3?=
 =?iso-8859-1?Q?941nBi76zT8A3jyHuBVXZTWNNvY3h4B1rcG3Y89BdgTiNX8Wqj4r+Wqk4+?=
 =?iso-8859-1?Q?Z2CqsJcJFn1qdpZLZEdKQkyAc4omHafydLdhSDgbHGsc40+XqE0As6rquq?=
 =?iso-8859-1?Q?amOYlHGO0nOPnHDm7PtW+7E1359pv+42ykBQj+Ng/0QSHDzZByK7xjwaOh?=
 =?iso-8859-1?Q?hH2oyalJmaS+WYX0TWO0sf4eXxSvn3ixm1YIhy/TQArcOY1VmpAp3q/4g2?=
 =?iso-8859-1?Q?mN6B/eVQjKfpXYY3qaY2RsAYkHG5za+q3b85dLMQ00Nh4owm9CB5E5DvlQ?=
 =?iso-8859-1?Q?Mih8XM5EDScuO+j+cF764mzwM7C2Wwip6QWVDN2jps/JtJK7mDzuIpd+zw?=
 =?iso-8859-1?Q?oLaceSL6vmQXmg3MhmTFtfysiBAlxDU8NmmjgGvWTo70y+64mdDPrm8ZkT?=
 =?iso-8859-1?Q?kO5+8vZXMuQtcc9AuOOJhT5dRNEttII9kWaM+8wnBniteWet73TQxIfzS5?=
 =?iso-8859-1?Q?4fC5YpB+Mr3Jd/KTeccL+0WaMuQzzVkvDX8IJk3m0oIWxhsVWMnZgxAk9J?=
 =?iso-8859-1?Q?2SsRIbFBFGJAEHiY24kLY0C+d0GsOzepeaT1Q0tlQQKxSqO2AMRC/4AtAZ?=
 =?iso-8859-1?Q?UyVNXh/X/6PasHQ3xnnRsHcOy12U2ytbK3PIaLVkNNBXv8UwgogQbwU8za?=
 =?iso-8859-1?Q?3eGFM43azmQgJy6UNqGjt8YhWchVrSa8u2K1Qru48il6WFMS8kTEdBKA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 621aa20c-bca4-4e40-fdf8-08d9be360280
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2021 12:42:22.7950 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k7HGBIj9wkVB1Cis2ocr6QRCFWa6cA5BPQCWEpFR5uFNfydNFMuV5iq9IC3RbVvZM59Ramfrcr0DrBl8jjzajQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5636
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
Cc: Dave Airlie <airlied@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Monday, December 13, 2021 8:31 PM, Ville Syrj=E4l=E4 wrote:
>On Sun, Dec 12, 2021 at 11:33:31PM +0800, Lee Shawn C wrote:
>> According to CEA-861-F chapter 7.5.4. It says "The VSDB shall contain=20
>> the
>> 3 bytes of the IEEE OUI as well as any additional payload bytes needed."
>> Now DRM driver check HDMI OUI but VSDB payload size at least five bytes.
>> That may caused some HDMI monitors' audio feature can't be enabled.
>> Because of they only have three bytes payload (OUI only) in VSDB.
>
>HDMI 1.4a says
>"Sinks shall contain an HDMI VSDB minimally containing a 2-byte Source  Ph=
ysical Address field following the 24-bit identifier. ...
> The minimum value of N (length) is 5 and the maximum value of N is 31."
>
>Do you actually have an EDID that violates that?
>

Yes! User report when connect to HDMI port on Acer V226HQL. Audio is not wo=
rking.
But windows system did not have the same problem. We found its VSDB just ha=
ve 3 bytes
payload (OUI). Then we share this patch to user then they report audio work=
s properly
with this patch.

Best regards,
Shawn

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
>> =20
>>  	return oui(db[3], db[2], db[1]) =3D=3D HDMI_IEEE_OUI;
>> --
>> 2.31.1
>
>--
>Ville Syrj=E4l=E4
>Intel
>
