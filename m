Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E1F6440B6
	for <lists+dri-devel@lfdr.de>; Tue,  6 Dec 2022 10:53:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DAC510E312;
	Tue,  6 Dec 2022 09:53:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80D3B10E312
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Dec 2022 09:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670320429; x=1701856429;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:reply-to:content-transfer-encoding: mime-version;
 bh=bmgbuAcx/HFRbDVoLUXDKRDYun2Mb7eBwJBlt36UGvI=;
 b=SD/Pa2+71n+dIVi+ilN95f8WU4FbzqFVIj/ZRjLh6VrnVLs7e4CRb8/W
 XKcrHDyJTROogW1nnLpzUcOoahvzvfuB7FY+7A6Vb/5cKPavV4CEUQ1bE
 ebrYfTvXhiaq5jyKB9tobNeTl7+jjrxY//UnM01aGLH4EEKgXwpL2XYiD
 SyYgPaA0OEYRzOEkBRXgodzVAhdPvir0btgNu0Z1gGtFEBGvi5DqMyMpu
 7Lmi7WFpBNwXD7yFpJkRX++ENvCrcBMFC4onmZ1yEv7B3e0ntkyfAmYRi
 +mfL+hVq+o6dKQKUyXqQj518j+5r/lv5qY+5Gp+lNzS7YuOjHduI0ZNHe g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10552"; a="402860445"
X-IronPort-AV: E=Sophos;i="5.96,222,1665471600"; d="scan'208";a="402860445"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2022 01:53:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10552"; a="676918956"
X-IronPort-AV: E=Sophos;i="5.96,222,1665471600"; d="scan'208";a="676918956"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP; 06 Dec 2022 01:53:43 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 6 Dec 2022 01:53:41 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 6 Dec 2022 01:53:41 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 6 Dec 2022 01:53:41 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 6 Dec 2022 01:53:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SKF2T4j48oslQLqAF9tRqVFqLq8xtBX+hpMiMw6XMC/s0jDCIfAlm/ufL96chUg11ttPtX04nt1n5ng6bKE09cRZVqXBiIxMetaDsCMvupKFLAtHOl4tFAodUUZCxOuokwQu45eKyK61E2MV0+xO4JzGn3Y7UTDED9dFVCN/p982PRICp4rYkjAMkWsR2LcDfl73A7Oq8D3O2XAhme25SRbG3ZEJJ580ZWjxILW1WR9rCKC8diWEpWmtAh1oaMVOzNdaWBs85F4gipY6seRnwsT7yOG8HmUITMCptvBj6utrr7x/4pofrdM0Flk9+SD1sVUc1LPIfmeMdcdO5SOFwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3LGDQ+m9EvpHN3qdcRW0Z8/PSBWwYhLbTm+wnb7i8/s=;
 b=bBykv8Onn7B/03dHBgtQc45GMp3ivtw332NKvlHOgZEpVSi0qmHyBKsr/JAQjQ5hn9iWLDHYgMVmHmUNfrb489iCqb0/rECoWD++VMJ+J5TiEu2oTVqx+18rBb6D9PPCwmptUT0JJyBMIokJft+cVlHkS4KJkGop9A1ZEge+UY44S0Cx4H1R+xsaaeBvTspfruWvgUoCter6iQOSkk2b3jOxI5f1WOjbmSxowF3ITML98LmdTa4cTM2Ofb6mYdOCdwrbKXYDfvZg0HXL12Bi8OeO10ojckkPrH7m7GvV8fmLTDj9QcG17RliBfSgcclqe5+WNHBSYmnz4REoFK0Q8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5894.namprd11.prod.outlook.com (2603:10b6:a03:42a::19)
 by DM4PR11MB7182.namprd11.prod.outlook.com (2603:10b6:8:112::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.13; Tue, 6 Dec
 2022 09:53:37 +0000
Received: from SJ0PR11MB5894.namprd11.prod.outlook.com
 ([fe80::77a7:9fa6:2658:d534]) by SJ0PR11MB5894.namprd11.prod.outlook.com
 ([fe80::77a7:9fa6:2658:d534%4]) with mapi id 15.20.5880.013; Tue, 6 Dec 2022
 09:53:36 +0000
From: "Tseng, William" <william.tseng@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v4] drm/edid: ignore the CEA modes not defined in CEA-861-D
Thread-Topic: [PATCH v4] drm/edid: ignore the CEA modes not defined in
 CEA-861-D
Thread-Index: AQHYzLmBqIUrc/V7hkykjATxU0ov7a3n4M2AgAAXtpCAeR4ycA==
Date: Tue, 6 Dec 2022 09:53:36 +0000
Message-ID: <SJ0PR11MB58946275D10EBF8AED8A14C5F11B9@SJ0PR11MB5894.namprd11.prod.outlook.com>
References: <20220613122655.12432-1-william.tseng@intel.com>
 <20220920062316.43162-1-william.tseng@intel.com> <878rmepmko.fsf@intel.com>
 <SJ0PR11MB58944CA27943062C69693C62F14C9@SJ0PR11MB5894.namprd11.prod.outlook.com>
In-Reply-To: <SJ0PR11MB58944CA27943062C69693C62F14C9@SJ0PR11MB5894.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5894:EE_|DM4PR11MB7182:EE_
x-ms-office365-filtering-correlation-id: 3fff93f6-4984-464b-98db-08dad76fbeba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OtZcT3I7IkMCpRW2D1WKdgnxgj+HOBq3whVM0CNBL+D6gEbbJ4F5QeYsJp8wMqUbfAeCEcLERNcUcphfFgNnS+hG/fAEXNqksNDQRajdXtkbSklowdvuGkEIrOVwnjk+fMQnWdxrtYmBwyVVNuVCq4jOc3RUO1ENJIosFRUJUP2EONlZqcj+vVVoQTvh+EgRcvxaIVGfluv7DtRZ67hhJxcuxsXykOjoxdOpHI1KyxkPEdxMcyDCmuFII639MkP62b3aw9p/MPj4oZkGTWTapFuW6J6k8Dl3fiW9+hyGc/OPGXth0poDIddnWz7eYt4UP8JXh4uUHLeSIchhgpCKA0abq3lZLMdWYXIY/SqEFugwB1uY+bcMKobiDibUcYIlf6apFpPYPxX3yJGph2ngWtLS2axdQKSUNWKogBx3uS/Z5W0/Bm9B/L/v/G+ORfsSvNbZR5z6Ht3PkdQzy5gJ8ntQC7XcglL4l+MhmGHQm8+/DEK4xkmNORbd7cx4i708l6dH8U62jQCcrX/0sR7w9I0WI+tw8i7juy/eZS7cn174xpBqogSgWoYpCGAAwWXJ5z6sbtRVS2A8lDKrtVkEAYM+Zu7sl2WUlRIc7Fu0vwVz6hkqMp9tQZsTk2yEWQxLgvo2vJzyorDXrjO72fQTqg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5894.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(366004)(136003)(39860400002)(346002)(396003)(451199015)(38100700002)(55016003)(33656002)(86362001)(7696005)(122000001)(53546011)(38070700005)(6506007)(966005)(478600001)(66556008)(4326008)(5660300002)(9686003)(66476007)(64756008)(8936002)(8676002)(41300700001)(71200400001)(52536014)(8796002)(110136005)(2906002)(54906003)(66446008)(316002)(66946007)(76116006)(26005)(83380400001)(82960400001)(186003)(66574015);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?2HoeHsFFys+YvUNCG5jCRYsXi7oYtQSbe3E6QqmP0PsJqbsZuw2WTZ0fdV?=
 =?iso-8859-1?Q?L1lP/YPuZtvueE4Vpa3Ski+yX+oWetPSD4z7rtjryEwTwwBnPb9SZqBY2a?=
 =?iso-8859-1?Q?fI9eATD/hg9G6A4AK9eCDyH56P4sxG7qcwMCcnu2JS5fAhW3QD/087FkSH?=
 =?iso-8859-1?Q?jRHRquluA8Ogu5JF21Dw8rw6YTdqKj8LDRl5qgx5tADthNgjazMULabcfk?=
 =?iso-8859-1?Q?27AXhLvC+HfW3znDjd+Xq0wQmpDkUJnI//LKcCfaYmoQsElvVvdtzN+6gb?=
 =?iso-8859-1?Q?1TPDhGRASwE7bW/E0p27mFHxzgIxCVNv95LWd9ufqR30gtSiLbnTG2borI?=
 =?iso-8859-1?Q?DuudXFLxIAZfwDUs5XBxyn237KAgPnj2Fve1NyyeoPmfgIQ8QRMZkUD26F?=
 =?iso-8859-1?Q?Yea1FpQKbfew+b7iapqvOQnASU3Pgttb/i1bWKqQogCl/NTz50E/G64ca2?=
 =?iso-8859-1?Q?3U2WjUlrNqK76WEQ2su7WjbVggUmfQvbLzVT8axfvtMSdlEtwsuOqvUo3T?=
 =?iso-8859-1?Q?OE1zE3mYBY3BRrS5XS36Pp6ueRgJDmvSmxSi9VeTiDotrbKFPZhEAbRVvz?=
 =?iso-8859-1?Q?hyBE1K8PVJC0K4Bi1CRslpLX2kXAIfv4O9N2Mxcf8qUWPQEm9aOBKF0+Ms?=
 =?iso-8859-1?Q?MCj/0nL9mnR8+B8llHPbm8fcZ5W81NRqf0E1lM0K5qYFzkJHR2RP1pHjbB?=
 =?iso-8859-1?Q?kIxUnqzM94Ioubzyw//vXG6WtEil5kcYE54Pf/LnaiwiVB6fkHBe5Aiijh?=
 =?iso-8859-1?Q?2H8rTs99GDfcgW/MSoFmzIciRmKcjZE5UubbTuLyeeF/9r9D4gS5dHFW9J?=
 =?iso-8859-1?Q?3OOomz4fM4ZVIIX+19TARQNAKcPpQ8ScHbF/7hBoKj6gUdMES/FNmAdjnB?=
 =?iso-8859-1?Q?mlIhgWphGXDMKnWoC4WKay5q96WHWMWCg1eUsEgPu/Tfz1TrSTRKxgW54a?=
 =?iso-8859-1?Q?6qidKgLmHhoWSzaQh7ARFvfSKPUlgZgyynwoKovj0/fdZA/foo7P8Qhx/A?=
 =?iso-8859-1?Q?86BXzuhPepox8843Q0KZXHVMO3a3cGszHvSN5/Iiu0DXSdjOmGGvB4zZnv?=
 =?iso-8859-1?Q?3qxfjBfqaRYSOlm4TYS/dnMNcoHYMB/SdKnGMCpy5Ta7q/Ln96aOCVp8iU?=
 =?iso-8859-1?Q?5Z/ifK+wpzhn+MJkfb+hWrHl8FJXBz6/UdJINkx3GkMilhvPCKcoxlfbQB?=
 =?iso-8859-1?Q?3iHjaaGqylKslCzx/pOrNEJVgntqTQH3fhvVS/bBLfIubdzZX1cpa75rZb?=
 =?iso-8859-1?Q?0ZmmzYJ5HcTuhOI3pacP3rza8tIyD29A/9zQervljXywBAJ7IKz1iJOarP?=
 =?iso-8859-1?Q?Isd80pHnh5WTzEngbxedh0Wnoy9XJ1lCCeBfEofPLQukpr2vOXrqRoW6nC?=
 =?iso-8859-1?Q?uJXLslW/GnCnMueStrCmjbbNZEVOlTFlgyE7ZFjzRAPsnDVvbk4uPOHgrt?=
 =?iso-8859-1?Q?5JDIMuXu7UEDg8clP51XemHDJNzMBGCMUxp1CcQoLteqjXkSD9oOCiVXSU?=
 =?iso-8859-1?Q?FAg/oglUTJ7Qa0FBCd+ZiB23L1R9lio8WN+i7Q/ZE9YXWIM0Ozea0f86AA?=
 =?iso-8859-1?Q?84/1qOEyIENOXt7NDDOcoctrBkQ81JwTOaLK/OSUgyjbSm01vAXI/SjbSv?=
 =?iso-8859-1?Q?IYX0toRE4tpb2YO9h06eEezlsrNnrizCq1?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5894.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fff93f6-4984-464b-98db-08dad76fbeba
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2022 09:53:36.7119 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OaiEMC9zyPETx71R/Efmq1Fuse2KW4Hopi9dUnRkd2aiTHOHeuKiZlJkHSF3iA9u9xkUH+LbvI7FOKHTGOZ0bQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7182
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
Reply-To: "20220920062316.43162-1-william.tseng@intel.com"
 <20220920062316.43162-1-william.tseng@intel.com>
Cc: "Lee, Shawn C" <shawn.c.lee@intel.com>, Wayne
 Lin <waynelin@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jani

May I have your comment about this patch?
BTW, this is the link to the binary EDID,  https://gitlab.freedesktop.org/d=
rm/intel/-/issues/6153#note_1558419.
Thank you.


Regards
William

-----Original Message-----
From: Tseng, William=20
Sent: Tuesday, September 20, 2022 4:23 PM
To: Jani Nikula <jani.nikula@linux.intel.com>; dri-devel@lists.freedesktop.=
org
Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>; Wayne Lin <waynelin@=
amd.com>; Lee, Shawn C <shawn.c.lee@intel.com>
Subject: RE: [PATCH v4] drm/edid: ignore the CEA modes not defined in CEA-8=
61-D

For EDID, please refer to the attachment on the link.
https://gitlab.freedesktop.org/drm/intel/-/issues/6153#note_1558419


Regards
William

-----Original Message-----
From: Jani Nikula <jani.nikula@linux.intel.com>
Sent: Tuesday, September 20, 2022 2:49 PM
To: Tseng, William <william.tseng@intel.com>; dri-devel@lists.freedesktop.o=
rg
Cc: Tseng, William <william.tseng@intel.com>; Ville Syrj=E4l=E4 <ville.syrj=
ala@linux.intel.com>; Wayne Lin <waynelin@amd.com>; Lee, Shawn C <shawn.c.l=
ee@intel.com>
Subject: Re: [PATCH v4] drm/edid: ignore the CEA modes not defined in CEA-8=
61-D

On Tue, 20 Sep 2022, William Tseng <william.tseng@intel.com> wrote:
> This is a workaround for HDMI 1.4 sink which has a CEA mode with=20
> higher vic than what is defined in CEA-861-D.
>
> As an example, a HDMI 1.4 sink has the video format 2560x1080p to be=20
> displayed and the video format is indicated by both SVD (with vic 90=20
> and picture aspect ratio 64:27) and DTD.  When connecting to such=20
> sink, source can't output the video format in SVD because an error is=20
> returned by drm_hdmi_avi_infoframe_from_display_mode(), which can't=20
> fill the infoframe with picture aspect ratio 64:27 and the vic, which=20
> is originally 90 and is changed to 0 by drm_mode_cea_vic().
>
> To work around it, do not set the vic 0 so the corresponding mode may=20
> be accepted in drm_hdmi_avi_infoframe_from_display_mode() and be dispalye=
d.
>
> v1: initial version.
> v2: change the logic in drm_hdmi_avi_infoframe_from_display_mode().
> v3: fix typo.
> v4: add revision history.
>
> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Wayne Lin <waynelin@amd.com>
> Cc: Lee Shawn C <shawn.c.lee@intel.com>
> Signed-off-by: William Tseng <william.tseng@intel.com>

Please attach the offending EDID to the bug [1]. I won't ack this before we=
 see the EDID in question.


BR,
Jani.


[1] https://gitlab.freedesktop.org/drm/intel/-/issues/6153

> ---
>  drivers/gpu/drm/drm_edid.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c=20
> index eaa819381281..3c6a4e09b2d6 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -6640,7 +6640,8 @@ static u8 drm_mode_hdmi_vic(const struct=20
> drm_connector *connector,  }
> =20
>  static u8 drm_mode_cea_vic(const struct drm_connector *connector,
> -			   const struct drm_display_mode *mode)
> +			   const struct drm_display_mode *mode,
> +			   bool is_hdmi2_sink)
>  {
>  	u8 vic;
> =20
> @@ -6660,7 +6661,7 @@ static u8 drm_mode_cea_vic(const struct drm_connect=
or *connector,
>  	 * HDMI 2.0 VIC range: 1 <=3D VIC <=3D 107 (CEA-861-F). So we
>  	 * have to make sure we dont break HDMI 1.4 sinks.
>  	 */
> -	if (!is_hdmi2_sink(connector) && vic > 64)
> +	if (!is_hdmi2_sink && vic > 64)
>  		return 0;
> =20
>  	return vic;
> @@ -6691,7 +6692,7 @@ drm_hdmi_avi_infoframe_from_display_mode(struct hdm=
i_avi_infoframe *frame,
>  	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
>  		frame->pixel_repeat =3D 1;
> =20
> -	vic =3D drm_mode_cea_vic(connector, mode);
> +	vic =3D drm_mode_cea_vic(connector, mode, true);
>  	hdmi_vic =3D drm_mode_hdmi_vic(connector, mode);
> =20
>  	frame->picture_aspect =3D HDMI_PICTURE_ASPECT_NONE; @@ -6735,7 +6736,8=
=20
> @@ drm_hdmi_avi_infoframe_from_display_mode(struct hdmi_avi_infoframe *fr=
ame,
>  		picture_aspect =3D HDMI_PICTURE_ASPECT_NONE;
>  	}
> =20
> -	frame->video_code =3D vic;
> +	frame->video_code =3D drm_mode_cea_vic(connector, mode,
> +						is_hdmi2_sink(connector));
>  	frame->picture_aspect =3D picture_aspect;
>  	frame->active_aspect =3D HDMI_ACTIVE_ASPECT_PICTURE;
>  	frame->scan_mode =3D HDMI_SCAN_MODE_UNDERSCAN;

--
Jani Nikula, Intel Open Source Graphics Center
