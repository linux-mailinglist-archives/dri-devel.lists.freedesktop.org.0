Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 388D5472E9C
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 15:12:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29EEF10E7B3;
	Mon, 13 Dec 2021 14:12:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9141510E7B3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 14:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639404744; x=1670940744;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:reply-to:content-transfer-encoding: mime-version;
 bh=m2ajhMwBGkFySweAexpe/L44EAhbIoQjgunFT1D86pc=;
 b=EJgbfy+GcMWsG5LmkqgLq6AWocfN7cskDzbQF8D6fF+BEMpXdQD7LBWq
 SULK6qU9NQTGNkdojf3hfovdAFtPZZQWBvb8/HFhDlj0WnmMEr0a2Uehc
 uKF6LOeMbPisRAnEHBSbqp92lEf935GwpdNvgHXyhxXHOc0TIELBhcEWv
 yXvL8hrfTSn/9zqSPNE9n6C8bcop71yE++UJcz6VLOr38gVUMh6P8FhJL
 IIyo37Kd9p+fHfSwCen4eelC6GSoZ7MfViY76jPUoDQjPXexwJrAoc+2D
 jqHnKF0uryXAdGspPJeoWnPSKH6teCdaJyJqeo8zi++SQynhxQpKxLXyR g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10196"; a="218753003"
X-IronPort-AV: E=Sophos;i="5.88,202,1635231600"; d="scan'208";a="218753003"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 06:09:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,202,1635231600"; d="scan'208";a="603707519"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP; 13 Dec 2021 06:09:40 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 13 Dec 2021 06:09:39 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Mon, 13 Dec 2021 06:09:39 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Mon, 13 Dec 2021 06:09:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hsRNpRUiBUwUHKhKCr8oFQdlmt87bba//X/dDZPMVwqf6UpTUN+gMVptIbaYDNeJEU57rK84BFE/tvsYPEJw6m8E6lRu8iGZy2jScHiVtH3LtYxVYiRk4rbri3CWgGkCcCnY5TAMb8f4/h2bXrjCQYwICLeAnDAVxfuENczhyCsrrqN1VZWCcCGspdbB/Q00rgqtDZyiwdpEwWo+g9VclVbDzHbQ1inotzSBMELHxQCEJQ+C2DsU/vTfXEN36ilncVVjBGdOkSGNy1GYQn21JJkwwcxYShYvF8N5ZWDD0D58LKTYoZ+JquvOoGufY4jnl9PPaMGUWuGKP1mXgi5Djg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ev2FhRMnP+j/Nw63yPAZahnFsQwJ6M+eIONn7Y+TZg=;
 b=gJFrhPu6BSiS8+I9dONYAkovn6gHiQXp9mXHBJwOjwLfbtZVY5MPpLm2ps/p8JfQwLgXXz3OB5WcR8Ai0XV3bbDve4jP+6Qs+m6e+BU+49X7H3pEFIMqjBXM6q0rufsddOGHGn/fhMbeuafW6ZCPT7Gnm0uCEuB6e2AscfiYj+OuUXW0VGx23/2iFiRJcUtw+HAU7wSb0L+nxYT6i9QlQK4w4ynZCHhdzEbGPLaW3pNDeFF6hc5N2DJgv4vm+PSL2FaFHwKXp/vty5ZoZ4viZxy49yyO7Y3dyVaK5ttwoqVVqWHPkDJHlvBgZfD+tnVVJ8sqGfgDns/iQDiD3LKMTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ev2FhRMnP+j/Nw63yPAZahnFsQwJ6M+eIONn7Y+TZg=;
 b=e9LLesgy5fc3+n+7WBi5GKlB0xxIJjtgf8LPlHpr/hKjXdcsV2G3f9AR7o3o6DhRwlzTfIGaEhiYwzlNsJ2dygadHv4zhSETII6IClxyTbcW/cExmNG6ZU48TUHXZ8KvCcy6uMbQkZak8vOwiPZSe09xlLHTUsHho59z6uwjDu0=
Received: from CO6PR11MB5651.namprd11.prod.outlook.com (2603:10b6:5:356::20)
 by CO6PR11MB5618.namprd11.prod.outlook.com (2603:10b6:303:13f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.13; Mon, 13 Dec
 2021 14:09:33 +0000
Received: from CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::4c98:111b:1f1e:898f]) by CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::4c98:111b:1f1e:898f%5]) with mapi id 15.20.4649.015; Mon, 13 Dec 2021
 14:09:33 +0000
From: "Lee, Shawn C" <shawn.c.lee@intel.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: RE: [PATCH] drm/edid: Refine HDMI VSDB detect
Thread-Topic: [PATCH] drm/edid: Refine HDMI VSDB detect
Thread-Index: AQHX72ykxEa6Eb2GEkqiPx+x1R/2/KwwW62AgAAASYCAABsPoA==
Date: Mon, 13 Dec 2021 14:09:33 +0000
Message-ID: <CO6PR11MB565132763B1362B379FB1F9BA3749@CO6PR11MB5651.namprd11.prod.outlook.com>
References: <20211212153331.15457-1-shawn.c.lee@intel.com>
 <Ybc8+3YonPSH99kl@intel.com>
 <CO6PR11MB5651F2A61786E1945FC0B1CEA3749@CO6PR11MB5651.namprd11.prod.outlook.com>
In-Reply-To: <CO6PR11MB5651F2A61786E1945FC0B1CEA3749@CO6PR11MB5651.namprd11.prod.outlook.com>
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
x-ms-office365-filtering-correlation-id: 5326399c-2d32-42c1-dae5-08d9be423031
x-ms-traffictypediagnostic: CO6PR11MB5618:EE_
x-microsoft-antispam-prvs: <CO6PR11MB5618E3197CD38ACF3A41C5FCA3749@CO6PR11MB5618.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hi1l+YX5Ke/IwKHPxsWP5g0sFA6XEcukT0zYDrMkA/hEf3xruyFc9YNS+2ngS/yYi+LnZmQ+XKmOCbiqxQCjgnGE2a8dww5FiDgSmVrqlkd7ne5ksyBWFbycHtJR+i/SEQNMSzQrMz1LqrbQbZxSRQZU5yGp+sWyQzkPdcSST0QfakQyXavlIkeb42VIdvTArMMg7Q8bfFzUDXSgW0YYjY3k91DtTahcBuZdfvXWnwi7DRMwM0Hz1C9lU4j2yTnryF48DKdEu6GsbnnEpCr8Qig4rM/xxh/G7qiYNgfCw/UMgbBEPCQd4YUEJpg6tBz5cyQm39aYkg4VPfwFO9r11kGne3SpZ1v9j5kLBMQcISaRszF7xKnr0jhx+ndvo64ZT7Oc3bwgQhgI6qsamZtAfqDiBDXQ+CWVVUoGz7Jz7FqyRs/1Va9IgH4dkptBGL5dBVBav8BO+bK/bp5ZJD1v7dedn8SEcz2pMHqmQNt4NfkjIg7L79s2ZOwMh3UmYWYfsi9Xr9pOA38qmx2lPQ6uv6NI40EfMdhYO8IZlx3rf2dVSrlmzLc7cTs10go0PbWfH8uMU+/FSj8ifgNacGWkAaXMTrMEdQXFwQQpfKRL9VZ2G6zZPEEmoJSIKRoUQFKLcAby4XuEEL2AZ4WJLc6tkR4CLJ1QY+K0OwQ87ax5vI0zaCsFtExo2T5uUhUVlYvb8q9aSKJa/d2+b2N8jzfigA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5651.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(53546011)(83380400001)(9686003)(508600001)(966005)(2906002)(71200400001)(52536014)(82960400001)(54906003)(6916009)(26005)(8676002)(6506007)(186003)(86362001)(316002)(7696005)(66446008)(8936002)(122000001)(55016003)(66574015)(2940100002)(8796002)(66476007)(66556008)(38070700005)(33656002)(4326008)(66946007)(38100700002)(76116006)(64756008)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?R36RNKRhYgFWZIn8VBctdZxRATKpyCy8qDi79h/9ET1FRYiyzloamKgBNW?=
 =?iso-8859-1?Q?Dwb7fO2Oa+ky61v8i0eXgJfekMe1pLP95F4alHzmWiXUi2yTn2/xDZe9tp?=
 =?iso-8859-1?Q?+q+CCHwYROqddicmLtPo+xWorD4VQaFWL/ht6TS87K/h/Rq3TBqmNTb7R9?=
 =?iso-8859-1?Q?LXDqMnkeOgoCZRV3nuqduAhXe77fDfyIUMMQVjx8gU8/t/1Za5AjdJFWwK?=
 =?iso-8859-1?Q?gj204cJKzY7HZsBMG3E8uwL0ygdJbefs82hrn8KXD1P3U4ptEYbz8FgqRK?=
 =?iso-8859-1?Q?NPA0g8Ssrs0LES2K1CH/CzK+T5CBhMqxAG0K+NVrVVcZOMR3hkW08g5w1P?=
 =?iso-8859-1?Q?MgH/8jaDAMyHTgjIpg1kuPj9GlPVUCMeTLJQZOVlkwBBPMW0suqwsPBlNQ?=
 =?iso-8859-1?Q?4kojIC3+SGCWgOO86wlNqrgXS1nmycaWe+AJxzS8l99nYaihVcw0em+m6u?=
 =?iso-8859-1?Q?VP+3RqM2iKqXOdSLqmspb+4gDgV4J0x67srnf+GOr13KXDn6Est1plZtHP?=
 =?iso-8859-1?Q?rIt/y+/UX9nur5ALBX1fJ/x44Gv7uZhwkxmNNST4KvCdgOqmHBbpsXg2or?=
 =?iso-8859-1?Q?4gMnkVEbnPAM5u2uJB3GnFD14yDLZ1pfNzZ6I3Nw0U1o8UXhUhVOUY4/g0?=
 =?iso-8859-1?Q?nbJ9dY2MUttcztj/BLbknOkPEIVbNdqvLtanOVFhrrnh+MSrInlMV/5OY2?=
 =?iso-8859-1?Q?kgjE9r6/tIz5+Ql5NKHsMTR02IBY/LI+6ACSkCoHiygZLakP0ut272M4MW?=
 =?iso-8859-1?Q?CYCLssnLgGZfQh4SPKIUzboCIIDkERNnHZUKt6kCbSAHmPswCa6TmaPdHl?=
 =?iso-8859-1?Q?NEXU+j1IeshNBDZu7UgPI1m6iB4jrsUjWuEF++m/orI/VXC1iDIVCxh1Zu?=
 =?iso-8859-1?Q?tUuT4Kt/yEwTL/XxKzpzSkmaOR4Fi5rh4YvhOXqJoYcuo4y5UEHkgPxCYn?=
 =?iso-8859-1?Q?YiPGbzECSu4xitc33uqL9KJFsBg+BDx8uJyREsyhRplP/+nThpmdZFcdo1?=
 =?iso-8859-1?Q?X7GQjW5eRlamZbSdQGRormoLwUfo967hVgYNEAO0QZn3FGzEc2a9ZGNQPF?=
 =?iso-8859-1?Q?sSJtmNFIr6IJZAS0wSK6aq+EpYIQxwmsGwSGzfR7NiqUVkhtuudsz43lo0?=
 =?iso-8859-1?Q?NWn9Ba8qmrTv/5Rts3p8INmPhEo82EGCSmTZ+bp87u13Y/P9BQ2xKV7otE?=
 =?iso-8859-1?Q?7bopP/Lb36d4ld+MeoQ6CWAAUf9JS7bZsfP+diGX5F95lao0AX6UTE/A1V?=
 =?iso-8859-1?Q?StcWDmxTLve51A3rrXitp2nHYCXi5Y/FrPmU4JzKLPcl3HzAIqejEk6njD?=
 =?iso-8859-1?Q?4/OfazYEtc8znhk3x9hXZxGHd4I1RZ4rWbc3et6cTpR0TfvFqhuXJYumih?=
 =?iso-8859-1?Q?II4bapb6f22rmaahGkZg4M+h++MbEOmmGhq8zL0t0466iabBv+6grBz9tO?=
 =?iso-8859-1?Q?unx4ZMsbuJgcQQ8vQy4FalXQ/cAHoh5SRRZZTC3yla2kBL0yP/MwsZMu28?=
 =?iso-8859-1?Q?OlMkFg/lK1ijfK1NJ1eE/M1064I1zwtM73pm1nPPFro8MeQRYNw1i6wx3g?=
 =?iso-8859-1?Q?C/NFsTMc52fE9qVTO4BsLH8JZmes1ZPgRCOK5fZxV5VGYTRwZ4oU1xGb2p?=
 =?iso-8859-1?Q?aRN6vOlfpS/mEW27hrakzxOdAUPV9G1n1pbca/tOdd01E2l0qoj05qpw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5326399c-2d32-42c1-dae5-08d9be423031
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2021 14:09:33.4701 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QLh7Zgyp34GLqUyJE9E8qYUpNlS1PPx9Fdwg5Rq85LmHlWqpJS5+39uEW1UKVMV//qQjZulwTZpWdaUihjpeaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5618
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


On Monday, December 13, 2021 at 12:45 p.m, Ville Syrj=E4l=E4 wrote:
>On Mon, Dec 13, 2021 at 12:42:22PM +0000, Lee, Shawn C wrote:
>>=20
>> On Monday, December 13, 2021 8:31 PM, Ville Syrj=E4l=E4 wrote:
>> >On Sun, Dec 12, 2021 at 11:33:31PM +0800, Lee Shawn C wrote:
>> >> According to CEA-861-F chapter 7.5.4. It says "The VSDB shall contain=
=20
>> >> the
>> >> 3 bytes of the IEEE OUI as well as any additional payload bytes neede=
d."
>> >> Now DRM driver check HDMI OUI but VSDB payload size at least five byt=
es.
>> >> That may caused some HDMI monitors' audio feature can't be enabled.
>> >> Because of they only have three bytes payload (OUI only) in VSDB.
>> >
>> >HDMI 1.4a says
>> >"Sinks shall contain an HDMI VSDB minimally containing a 2-byte Source =
 Physical Address field following the 24-bit identifier. ...
>> > The minimum value of N (length) is 5 and the maximum value of N is 31.=
"
>> >
>> >Do you actually have an EDID that violates that?
>> >
>>=20
>> Yes! User report when connect to HDMI port on Acer V226HQL. Audio is not=
 working.
>> But windows system did not have the same problem. We found its VSDB just=
 have 3 bytes
>> payload (OUI). Then we share this patch to user then they report audio w=
orks properly
>> with this patch.
>
>Hrm. This deserves a comment then since it clearly violates the spec.
>Also a link to the bug if you have one would be nice to include here.
>

Let me create an issue and update monitor's EDID for you reference.
But I'm not sure which community is suitable to report this problem.
It looks to me should belong to DRM driver https://gitlab.freedesktop.org/d=
rm/misc/-/issues.
Do you have any suggestion? Thanks!

>>=20
>> Best regards,
>> Shawn
>>=20
>> >>=20
>> >> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
>> >> Cc: Adam Jackson <ajax@redhat.com>
>> >> Cc: Dave Airlie <airlied@redhat.com>
>> >> Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
>> >> ---
>> >>  drivers/gpu/drm/drm_edid.c | 2 +-
>> >>  1 file changed, 1 insertion(+), 1 deletion(-)
>> >>=20
>> >> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c=
=20
>> >> index 12893e7be89b..5aa4a6bf4a13 100644
>> >> --- a/drivers/gpu/drm/drm_edid.c
>> >> +++ b/drivers/gpu/drm/drm_edid.c
>> >> @@ -4205,7 +4205,7 @@ static bool cea_db_is_hdmi_vsdb(const u8 *db)
>> >>  	if (cea_db_tag(db) !=3D VENDOR_BLOCK)
>> >>  		return false;
>> >> =20
>> >> -	if (cea_db_payload_len(db) < 5)
>> >> +	if (cea_db_payload_len(db) < 3)
>> >>  		return false;
>> >> =20
>> >>  	return oui(db[3], db[2], db[1]) =3D=3D HDMI_IEEE_OUI;
>> >> --
>> >> 2.31.1
>> >
>> >--
>> >Ville Syrj=E4l=E4
>> >Intel
>> >
