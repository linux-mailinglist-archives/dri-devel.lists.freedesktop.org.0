Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 198E547304F
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 16:19:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9438610E739;
	Mon, 13 Dec 2021 15:19:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76AA610E739
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 15:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639408788; x=1670944788;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:reply-to:content-transfer-encoding: mime-version;
 bh=k6s7C2ED8Jb1aZTJmTK8Z+poXQKvXhTqago0iJIXV/4=;
 b=ba7TqKWaTqLh47vzeYwlovCVhJ5i9NHiiZis/IwjltbY46rf28LHc+Pn
 1OR8OknQUhoZTgHyBiFbSwnhpafnMBp7z/OGGmUlETLlWkueDMchwqTKm
 nOVQfDToAcx/3M1HISZZ5oveh9bAneUfDquQErEksxlAbiwzhM+y45EjT
 Ege7pHK+/u83E7YXvc5yyiy4Ncc0t0F08dSQzM5W8sgUsr5eeIHwZCGnu
 DwBillJ7Dl60QPdmZ3JUmxH3igTF2cVxxAy3o9fEU0MTBYZYIT1UYykdu
 x/4waFXmQsD6+WnnKB7XCKRqK8D9eD6qU2b7Q4OojHLAja41rrbfj0slS A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10196"; a="236284328"
X-IronPort-AV: E=Sophos;i="5.88,202,1635231600"; d="scan'208";a="236284328"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 07:19:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,202,1635231600"; d="scan'208";a="754364234"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga005.fm.intel.com with ESMTP; 13 Dec 2021 07:19:40 -0800
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 13 Dec 2021 07:19:40 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Mon, 13 Dec 2021 07:19:40 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Mon, 13 Dec 2021 07:19:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YODmfNMfyKus9/9tJSquybaNLYzGfaHR1y76yJsxQ4nZ3IADAmGbbe1Cq5L/+ARb+N8yGEfQ3wAKGJQ1S/Vv8N5CbWEa03XuErQVi4k3LKrtfs/j112S0msL5okzv8+dcgS+hx6VPxoMwc6J53zYU8o4/agXbMpiiZopayReJ195yCy1r8nJyoYb5Rhc/qLbbf2GiX4Z8nDGb8YxAeABofdf45BjcTXrZDyrtBqkhWG0AQH4Ws9YHOpWNGL0NzDm36MvtYRnjKllqQo2Plm+Iasi4GKr3VEN/laAOeeQziftkiEfu0tm1MGrgPkHTa3WIk89fcRQXK8gQ3ixRxu6yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wWEcSAy0260aYEDvIT3xqWjsH4sOOwyc1CErh6jVNxc=;
 b=jH0Uw0ZfTuE+GI7Ak9dg/p9RGHTs6AJMiS98JvlMp6NRYG6OCYYWmwDha9h2vBbxtff8zXUjI7veantlfQ1IUFMkGhd7+YP6eveVaJwrP0VnZPXXkKFH1I4EE7qZAm+q7Q6Q9bEH4zESNMIH7jidgZ3STu0+vGPjbnKcbkyoZeDqNpDChRhQDiaF66wtL9eFz0ltvdtouWImUP2bGlcZFkdseYKjqFMhQ8/k/dXqSMq7sA4OoM2z1fPq2vtqGluvIPmG5UNQW9ZzgcSMMuhQiwUg75kJs8h374SP/l9F2s6fbY/7DcwVDsSNv9XO95BmtuAuhEJFVY078nho/Wn73w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wWEcSAy0260aYEDvIT3xqWjsH4sOOwyc1CErh6jVNxc=;
 b=MeLNHC3dXEahOFsZipgddFygk1/FRl1SVMLGU1e1yNiG19kkythw6Uojb0Dn9tJ04Kvi2sI15RZtj2Fzw89cbFcMVAyXMqD9RWBeFvWUCN5hpU6dDEJJRbXy3617ymV2FsQAAdG8Iwxat1vF9N/lybQ55ldFH13WrY3FPHcsEqM=
Received: from CO6PR11MB5651.namprd11.prod.outlook.com (2603:10b6:5:356::20)
 by CO6PR11MB5571.namprd11.prod.outlook.com (2603:10b6:5:35f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Mon, 13 Dec
 2021 15:19:38 +0000
Received: from CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::4c98:111b:1f1e:898f]) by CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::4c98:111b:1f1e:898f%5]) with mapi id 15.20.4649.015; Mon, 13 Dec 2021
 15:19:38 +0000
From: "Lee, Shawn C" <shawn.c.lee@intel.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: RE: [PATCH] drm/edid: Refine HDMI VSDB detect
Thread-Topic: [PATCH] drm/edid: Refine HDMI VSDB detect
Thread-Index: AQHX72ykxEa6Eb2GEkqiPx+x1R/2/KwwW62AgAAASYCAABsPoIAAEmig
Date: Mon, 13 Dec 2021 15:19:38 +0000
Message-ID: <CO6PR11MB56516F4137D220FFCEFDF988A3749@CO6PR11MB5651.namprd11.prod.outlook.com>
References: <20211212153331.15457-1-shawn.c.lee@intel.com>
 <Ybc8+3YonPSH99kl@intel.com>
 <CO6PR11MB5651F2A61786E1945FC0B1CEA3749@CO6PR11MB5651.namprd11.prod.outlook.com>
 <CO6PR11MB565132763B1362B379FB1F9BA3749@CO6PR11MB5651.namprd11.prod.outlook.com>
In-Reply-To: <CO6PR11MB565132763B1362B379FB1F9BA3749@CO6PR11MB5651.namprd11.prod.outlook.com>
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
x-ms-office365-filtering-correlation-id: d1fde0dd-9b14-4992-b50b-08d9be4bfa7f
x-ms-traffictypediagnostic: CO6PR11MB5571:EE_
x-microsoft-antispam-prvs: <CO6PR11MB5571BD3084E5BD0CEFEEB649A3749@CO6PR11MB5571.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 31xPalqsEhkxH9ESQtk/Hmm9S0T6jimx9Lncd8jEq3n+LHOCJ+367Gn5IQiooIXfZZcHfMYpooGecopOpKovF56qE/sAh2nO2dpCQV7ePR0MUwvlUpT3O+7TyGj5MVss9UDv5orvz4kMd9naEFQB8cvWY6aHmbUTfj7TODyIrBNArhT/ndwAP+DNpWi8aiAHkqziRf/77zPveRYcK/XdiQ+m7aKjuDIt2w/aCJIGL9U/uw1M+1YdvZ3xJOPDtwZ4EIt3kcVG1JqydHGS2j7uYY/yJCu3xcgbYbfQF5WNMg8VgG33ESJY10mhN5Cz1rHAjrLUR4fLJYHZacU3utfj9xRtAbHANecLJNtPyX8GXLArzXM0qKbFMVCPi9BgKtSV9FvVRDFv0Y7ledhYnwJB62rWp3N20mXFj1vnVoNmCg830eovJcUpjh/Pk6QHmGUAnlKrDyfSBgUQy1HzqUTVKknt0MtOYCNbkrRg4g/76j8eVYpFANVpS4Ak7SpRexcwtwwHaNC9I3E606lKvrYjLpCME1bp4Fp1srzT6jof+nLvsoGrxZQXRIu+NeWaZo4C8BPQH2D5y5qZYCRka3Q6jyQ0CjwgSYf4OPPORiZZ3tdbZL2UT2BGsJfOq4MrQgfFfg6pE8wns39k4DUIVtPwAkxZ9gkePQDvUC3O0JIz77qfPhtpLBsRzR8nAjwb99lRL7axJQ28XNKN07zE5eBo+A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5651.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(122000001)(82960400001)(55016003)(38100700002)(38070700005)(76116006)(186003)(26005)(33656002)(9686003)(86362001)(66574015)(4326008)(83380400001)(2906002)(66946007)(71200400001)(966005)(54906003)(52536014)(2940100002)(66476007)(64756008)(8676002)(6916009)(5660300002)(66446008)(316002)(66556008)(6506007)(8936002)(8796002)(7696005)(508600001)(53546011);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?LnraG0yD8zKRV9a92JHpEtE0P71Px+RnaUZqRVmSCRaMudseCVpHtXjoZE?=
 =?iso-8859-1?Q?4qXAhv3+cM8pb3QBBrBD35G3rPQh4FmIO5q/C5VpmfwlTkMFQJTB2gsf8p?=
 =?iso-8859-1?Q?cJ8YNZvUmyoyz5+8uJCMvWBE+UKPFO8njA50dh+Yg+fw3kYRP0ZJqd8ng8?=
 =?iso-8859-1?Q?DDBiqUH2l8PYyZHaplVuyvCGGKqLtuHKYiCSslBzKx9zO3WSMpxkhO158q?=
 =?iso-8859-1?Q?CSao5vgFoR0sFF20Z/YYVehRAcxEldFpV+HUcv3HeDnQFOReJmPKBaKm47?=
 =?iso-8859-1?Q?beuCXq7XkwgVdIA015eFBQM7NQa+F+WnyPQm/DQi1hhaBaIRks74B8IIy/?=
 =?iso-8859-1?Q?wgOEoCrqqPFN+49RUDfit+dw9ug/a9spGGW0zDe1iIS0B/Vw3UwLjWiWqf?=
 =?iso-8859-1?Q?i33u304pUW6FP6TzRf2DLv5IiFpv1lAh5yy4gjltzS27Rhf2mKplYWeC5u?=
 =?iso-8859-1?Q?KzGbRi2akvGd2IThyV8INMQjBkMfL/WfG/MnyD2xwsniV5RovbZAKx62tQ?=
 =?iso-8859-1?Q?l9GvPtobJy4aHyW7fd2NDsu8h6H+OSbqYt34pEUVQgcOGZlo6UMTXX0CmJ?=
 =?iso-8859-1?Q?GrU/DRqSmmqz3SNh4PvzKe+4ui/BQjSNTh51mUfXZU8kwIkcjHYcD7lhSg?=
 =?iso-8859-1?Q?dt2O+muTldmCONYNxpSGnBKjUdDU6rrWDQNpZWRTD+u5NrF+Ov35RPOrNX?=
 =?iso-8859-1?Q?3C5n7hcRFPUo++rDBZoqoTeqfrusyeY0al07CJNwTYQ4u1hEiA5vTo8V7K?=
 =?iso-8859-1?Q?SldkHfLraSmkmcBAJCQB8tDwHKy0EFVpf8m6z+ZQ5/GOufToDNmfgTd3Yv?=
 =?iso-8859-1?Q?l29tZZEWkoSjvT01Q1AREuNLTjRaZM5FR4jqV7+4GAJnVhLcws9QIC4cIF?=
 =?iso-8859-1?Q?Gs/EBbEBdAFmXvyeF69hOTpFB+uzC0br5b0FlqRkIBQ6RNvFFEggGlqQ1W?=
 =?iso-8859-1?Q?m3WcUwB0dD091xS70GOxm/N+A7G1JIzfPgVLx8OMTPIVt9tNSMQCrqivBD?=
 =?iso-8859-1?Q?jvZPx05QwlGlvz0hsc3QN6QFUloqbTlKCqK2ikkxSPLGDWeY7qybgGo2Dq?=
 =?iso-8859-1?Q?4sUyEqHc6KrWDSjPdp0wFwY1nMWiYKoyDVCygUkc53qaitmP/0lUTHNB69?=
 =?iso-8859-1?Q?cG831RI5U81ye/INlYN0MOYBbkKWmeXXAq3obrp7ZRRqbBO6MpNmhmpEBz?=
 =?iso-8859-1?Q?pcTT64hkD2AjqDRu/LewehwD+OSBWaVz9jJC6T/B5MjZyEsQ5YWD3AFUcb?=
 =?iso-8859-1?Q?MDdZilRLyjSFOe6C04OP9hs5OdWQJc8DOZR1xZKNf9J2GHivpojXwvx6fT?=
 =?iso-8859-1?Q?Hb8F16RyPdHniTNg7BZHI8+itePNX6wIEaj8/UJGmstjbk06QdlcYT0JFd?=
 =?iso-8859-1?Q?jAkswAe+MABiqWyNoMw4j/MbJCsFyMp4XR0XaqXDFyfVOIPh/IpsN5wpaT?=
 =?iso-8859-1?Q?a15lWG4fs65r39mPdyiDQfGXrQJ+gpvo009Zlvyitu6bwPzKIiPS4ROqX7?=
 =?iso-8859-1?Q?i74Z1KPB8vIR8bePsVbxRUE+NWXA8MxfKtzy6NHeBEDsm1nbXt4e4vH6OS?=
 =?iso-8859-1?Q?at+iuf9O/h4KJ+4ZxW9kLd1vK4Mx2Zymg2f/UZIW33IXxxvIRJT+4qRIYs?=
 =?iso-8859-1?Q?EXCAvsBf1wfudoWAbVU59jD115c/0Kj5JeShYGv7c1R6d2T2PZN9ylBw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1fde0dd-9b14-4992-b50b-08d9be4bfa7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2021 15:19:38.2292 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qASMTrRRUwApaGy+jOxB5vUgNGCfg4TT7eP0GNwq6OrT1w6mClmr8l1rIoLcRhyzoslCLizEcsyJhSFdq/MiKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5571
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

On Monday, December 13, 2021 at 02:36 p.m, Ville Syrj=E4l=E4 wrote:
>On Mon, Dec 13, 2021 at 02:09:33PM +0000, Lee, Shawn C wrote:
>>=20
>> On Monday, December 13, 2021 at 12:45 p.m, Ville Syrj=E4l=E4 wrote:
>> >On Mon, Dec 13, 2021 at 12:42:22PM +0000, Lee, Shawn C wrote:
>> >>=20
>> >> On Monday, December 13, 2021 8:31 PM, Ville Syrj=E4l=E4 wrote:
>> >> >On Sun, Dec 12, 2021 at 11:33:31PM +0800, Lee Shawn C wrote:
>> >> >> According to CEA-861-F chapter 7.5.4. It says "The VSDB shall cont=
ain=20
>> >> >> the
>> >> >> 3 bytes of the IEEE OUI as well as any additional payload bytes ne=
eded."
>> >> >> Now DRM driver check HDMI OUI but VSDB payload size at least five =
bytes.
>> >> >> That may caused some HDMI monitors' audio feature can't be enabled=
.
>> >> >> Because of they only have three bytes payload (OUI only) in VSDB.
>> >> >
>> >> >HDMI 1.4a says
>> >> >"Sinks shall contain an HDMI VSDB minimally containing a 2-byte Sour=
ce  Physical Address field following the 24-bit identifier. ...
>> >> > The minimum value of N (length) is 5 and the maximum value of N is =
31."
>> >> >
>> >> >Do you actually have an EDID that violates that?
>> >> >
>> >>=20
>> >> Yes! User report when connect to HDMI port on Acer V226HQL. Audio is =
not working.
>> >> But windows system did not have the same problem. We found its VSDB j=
ust have 3 bytes
>> >> payload (OUI). Then we share this patch to user then they report audi=
o works properly
>> >> with this patch.
>> >
>> >Hrm. This deserves a comment then since it clearly violates the spec.
>> >Also a link to the bug if you have one would be nice to include here.
>> >
>>=20
>> Let me create an issue and update monitor's EDID for you reference.
>> But I'm not sure which community is suitable to report this problem.
>> It looks to me should belong to DRM driver https://gitlab.freedesktop.or=
g/drm/misc/-/issues.
>
>That seems fine to me.
>

Here is the link, thanks! https://gitlab.freedesktop.org/drm/misc/-/issues/=
28

>> Do you have any suggestion? Thanks!
>>=20
>> >>=20
>> >> Best regards,
>> >> Shawn
>> >>=20
>> >> >>=20
>> >> >> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
>> >> >> Cc: Adam Jackson <ajax@redhat.com>
>> >> >> Cc: Dave Airlie <airlied@redhat.com>
>> >> >> Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
>> >> >> ---
>> >> >>  drivers/gpu/drm/drm_edid.c | 2 +-
>> >> >>  1 file changed, 1 insertion(+), 1 deletion(-)
>> >> >>=20
>> >> >> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid=
.c=20
>> >> >> index 12893e7be89b..5aa4a6bf4a13 100644
>> >> >> --- a/drivers/gpu/drm/drm_edid.c
>> >> >> +++ b/drivers/gpu/drm/drm_edid.c
>> >> >> @@ -4205,7 +4205,7 @@ static bool cea_db_is_hdmi_vsdb(const u8 *db=
)
>> >> >>  	if (cea_db_tag(db) !=3D VENDOR_BLOCK)
>> >> >>  		return false;
>> >> >> =20
>> >> >> -	if (cea_db_payload_len(db) < 5)
>> >> >> +	if (cea_db_payload_len(db) < 3)
>> >> >>  		return false;
>> >> >> =20
>> >> >>  	return oui(db[3], db[2], db[1]) =3D=3D HDMI_IEEE_OUI;
>> >> >> --
>> >> >> 2.31.1
>> >> >
>> >> >--
>> >> >Ville Syrj=E4l=E4
>> >> >Intel
>> >> >
>
