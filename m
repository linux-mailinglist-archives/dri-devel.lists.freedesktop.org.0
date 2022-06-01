Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 583AC53A0EC
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 11:43:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 392FC10EAA1;
	Wed,  1 Jun 2022 09:43:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3559E10EAA2
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 09:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654076599; x=1685612599;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:reply-to:content-transfer-encoding: mime-version;
 bh=Z/FdQpw5P9vmSmahdOEZjt40065DspPMonB3+B5Og+Y=;
 b=iUmpXghBh5WSBu3FJux+zBW+2rbsCIvM0YKk6F0z/aG42sYYFMXPIZEI
 YpHm/aQBuZ9oB69hLigohthkF7no8Klg60p0RqtauCqPfkiC4iulp06j5
 FUVxwXX+0KHjDNNtg9zBipUo8ejpLQ38s62jUz3uPZeSw+GueMcvMONBe
 drgPgf6c9+rRvjxkiEFSTCg0Qlul6dh434x8fvyPZ+OHnav8b6KXiUGSi
 u/lBe/iggruJiy3yan8VxwIxR5TIbFm2AhKciMuTzs+YlajrSsuRqpKhE
 FfKQBIyOUqmY1a5t42qjpgUhutXK8mPp9B+XXYw0z0QBn4Vee6LNq1/QA g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10364"; a="338578714"
X-IronPort-AV: E=Sophos;i="5.91,266,1647327600"; d="scan'208";a="338578714"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2022 02:43:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,266,1647327600"; d="scan'208";a="562726522"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga002.jf.intel.com with ESMTP; 01 Jun 2022 02:43:16 -0700
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 1 Jun 2022 02:43:15 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 1 Jun 2022 02:43:15 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 1 Jun 2022 02:43:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iXJE+JX+NBVKy3Ji7EnC7120Z89ZTRoHwSV833DPF7HMMtW/9VgCx5jS+lVyZuhSYr1sTX+GH1zgzWGzdcYwJ1cUlhvOdSvuJ4cQjlC3d0rRl71DOMaYHACfK7eo9thrpseZO7PO7GwF4yphDe6H6sRC5B+Pz8X2rcZZMReLA4SrJVbelCZMe0HDE6qzwqVoypHB27iir3VEM3oXjGaaZLOnAfOU/LNdSrNQbavtB8JvRtkk8z4nZSRjz4AJfWqVT2E4JCtUh9jro665DsN2Xmz53iAdYcJtCh4NBmW9HZDDocj6q9PaOy7HRCraCnzL+fFSHPlbWAeGfAZHyDaw9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gSI5rbtJaJhYJpJJ55UR8n+p4/f0yysoPceBInpA+b8=;
 b=ab7x3b8M/GgAHNvqRBjq1jGlgnbyro4L0hEjZnhuzj29Zg/Cq3BudF2rMjHZIwxxQhv5hi3VR/vkGFr/rA8Yss9C8Ta17+ZZeYIqVoptKfm0R7zG6uogl/mZNYgpis7yhg7Re7gU5T9bqyMG7zph04DRaR7K/9B7YnAwytSRaI/U/mA/HW4YBPfxArLTRlche84iTcn88FON0adK4O3DTXs83AMkYAXogeebaAWL4XkdlZv71SVq0hqLM+QzQgyJOzCMfBuXmPr3nJD+NI2yGMSvnumtHpMRsK1KE3zTvuHePZSl13nTsc8Kjx7BVyGN+Nh1XPzmzmRq+en6dpk3Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5894.namprd11.prod.outlook.com (2603:10b6:a03:42a::19)
 by BN6PR11MB1492.namprd11.prod.outlook.com (2603:10b6:405:b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Wed, 1 Jun
 2022 09:43:09 +0000
Received: from SJ0PR11MB5894.namprd11.prod.outlook.com
 ([fe80::9151:e836:1a4c:a04b]) by SJ0PR11MB5894.namprd11.prod.outlook.com
 ([fe80::9151:e836:1a4c:a04b%7]) with mapi id 15.20.5314.012; Wed, 1 Jun 2022
 09:43:09 +0000
From: "Tseng, William" <william.tseng@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH] drm/edid: ignore the CEA modes not defined in CEA-861-D
Thread-Topic: [PATCH] drm/edid: ignore the CEA modes not defined in CEA-861-D
Thread-Index: AQHYdNoDFbj7+FwOkEGNuWjZxEpXuK040FOAgAAC7gCAAXOfoA==
Date: Wed, 1 Jun 2022 09:43:08 +0000
Message-ID: <SJ0PR11MB5894EA0FF4363714AE3BC029F1DF9@SJ0PR11MB5894.namprd11.prod.outlook.com>
References: <20220531103421.11363-1-william.tseng@intel.com>
 <87y1yiq8ce.fsf@intel.com> <87r14aq7ux.fsf@intel.com>
In-Reply-To: <87r14aq7ux.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.6.500.17
dlp-product: dlpe-windows
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4a889112-dc68-4740-1242-08da43b322e8
x-ms-traffictypediagnostic: BN6PR11MB1492:EE_
x-microsoft-antispam-prvs: <BN6PR11MB1492DD33B0C8B7789C3821A7F1DF9@BN6PR11MB1492.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DS68eoixkDrOoSLaO11iopQXIuXUjVSbFTRLnNt4REUAQlyBgkOjPZSdCm0G4+e6tGEtvNkc9XFBRKN8JCqhdAK4ElK14xRCz5WhN+YxC1XkfmUftwpAiQ2SNhkAgg/nKKyvSB4BKB66DjJtYLZ8Rm6fUt2bUAhIXCfy9dzadldjpnGyJCRb81cGlm0Cl1OWmU0UNRe3JubYf1TrjyOPeibTS72jWAIV3C03pTMMfP/lPUsEa9KLzDUBLB5+Lv4pmr7/HedsgmcNrtPC2WR2fT83BGzeBDOD2DXXGlRsB6GE5B6pd+E0wChuUWL5pJLX/YyMeiqAw6hqNhuh1gVeQICJo77eXrL+7FmgptK54LjgCgr8iIpAX2Zy1UK/+JTpgv7dDC6zkXmUbuyzEdW6pegC6qLafPsl2B+RgY2m+0vn75l5LA2iLO930odACnvU0cbnSSuQSZYFRbs2kfad63tPvp8yOpJlAZuyfEgbmpwZ06mRQ79dyMDv3z0Nrve9jZ+oNvkwHC4QwRIrtCo9/NyqsX1wAYJk2n+/wbZy+1bEKWDIx1Uhf2fXLgUtkrG5N5D74AyKUrhshD1R6GW7+cHJejaFO7KzTsum962EHgzc6stpnf8qWaRMoNqAohDiEqKN7xMoSeJr/RBYcmerEQ45vJl3z+m2mphVZzFNuVQPd6EWyeqxJQMsz0vSh+GX0YWuQTfzQWs41R8cZX50kw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5894.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(508600001)(5660300002)(7696005)(86362001)(6506007)(53546011)(2906002)(71200400001)(54906003)(110136005)(38100700002)(38070700005)(966005)(316002)(52536014)(8936002)(4326008)(8796002)(8676002)(76116006)(66946007)(66556008)(82960400001)(64756008)(66446008)(66476007)(122000001)(66574015)(9686003)(26005)(33656002)(186003)(55016003)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?zbOmxWdxvALNQLerQa6GQStJP+f+EsUmiGBXLDbZ+OqRGqVhG2oW05ckyN?=
 =?iso-8859-1?Q?LTXjnJZUaOMHR27T6B14g2BVWJvU3YBGYUZo6gmupc+9zfkIeHZfAkfGNe?=
 =?iso-8859-1?Q?Q/fCeNNdxif/ngdh/ccVK44lYzoLexEeiE0Pv+RrMQkF7h8GamefeUzK2Y?=
 =?iso-8859-1?Q?pjPqY277VTAeAjZT18zWYHYf1PMbzjCbtv+20Xy7+bQuCuWw/EHAqg8aOE?=
 =?iso-8859-1?Q?F+AOAxC3P3XtC0PktAw7XZ66Q3Afv6QBsnZaaLT3Gtb4zlTshjz8x8A4F9?=
 =?iso-8859-1?Q?TGpD5wV8fDK2HQTgZJZfpLGlqoShzRtr+20vl+jj5XEG0XTlj+FXSXpYnH?=
 =?iso-8859-1?Q?mmUuos1QPvnvBNbwUON94N45whMvbFGf4VldGOUGkZVaU4JXssNVgVgym6?=
 =?iso-8859-1?Q?YjUo2Kft2BIVv0DxDeeE13E8JLiE5d5YquFtDhQxon5arxqz0QpJZR+8UW?=
 =?iso-8859-1?Q?R6QnF3VPnkupBHmEPFHMepEU3gbx5xX21tPds8FELamDlquQYGLPlUdykG?=
 =?iso-8859-1?Q?3dK4MoXnEekFe2HUuJ+rAnRJwiHCchN4TzpDG0SxVVMYPSN1ttpW4OmF6l?=
 =?iso-8859-1?Q?weCEwM16XarFY482E8pDxkZV9pFRyHe3XExmZZKYKqmGWvmQz8YGwVtwNU?=
 =?iso-8859-1?Q?aqH5ZCuvoDSnSxrsknN+WmSFp1+kxNKFLHtM7cfsGOUGrsIZ9XiiwMkwle?=
 =?iso-8859-1?Q?XlFYatYuliHMv+gxbmYM0fOU4NzhBeesaIQtjLyZuyWVDLhxSWHzcpkSdd?=
 =?iso-8859-1?Q?CPX+Rm1qxGS7zhsIVNw4YtDaFsBaSBuscYl9ul16n7d8oG56yHHoA2lzTD?=
 =?iso-8859-1?Q?VEtTopEUShj2OQ78cDe2gxS6txSUwO/+41t/h+Z7hzJ/9fl9yeao5NilN0?=
 =?iso-8859-1?Q?1M5N/lfF7Uzoq9uzjEggw2ZDZsF1PVEB/nyJR9/43pMC0HUwzi6FLTd8kq?=
 =?iso-8859-1?Q?8yBWahw5c0zUKhAAYQOSJP0bd4R9FvnNs73O5btbKdiKF/7Zdl46pqVTuz?=
 =?iso-8859-1?Q?/DgeOxW5hHg3nu7abB2tPHXslkpZJ+7bRJbra12o/tRkYQTdneEMhSUual?=
 =?iso-8859-1?Q?Ny4Onfvu0Z0mrlBiW2QACXDiP1cFdlG0HjahGmJffODzB66JKTw9EHrQBO?=
 =?iso-8859-1?Q?GAi4syinZHGStdQ4DFVN9Ll5Ekb/QabLdipC3LjHF1YeefnpYxYb57DxbT?=
 =?iso-8859-1?Q?TudjsdpOwchrxXcFVi2KG/5rRU1lODw2kqBpbVWj0Z6bNu4tDW1pqNI86s?=
 =?iso-8859-1?Q?foX4aU9d3Re32Z9z3xZGgNvNyueKVkV8BLrOhVSM4nb3B9UT3XyuZTL3j9?=
 =?iso-8859-1?Q?FfA6XRMr4yc5QWryR9KBllCKkwBA6G6QoxAn4F0ODszFrDvQr6RFlYJBYA?=
 =?iso-8859-1?Q?Vaq3KXValmRonW0HHDk3pwGgXd8OGfCYFmmF1ydL6BsJLGKHspKgrUiD5O?=
 =?iso-8859-1?Q?7/LlLamS5VZFgAWbS3RkuOLhbNlW3TrC+Ufpv4ugFEqOeOClyMRTclkLr0?=
 =?iso-8859-1?Q?X6PBE0tsr3/Vy4tCEiJj3OrOsmtaculO96+fmqidDSR/oZGRd29W0aeie6?=
 =?iso-8859-1?Q?U5THimuJSXyqI+rIb/DyJOYv7YiF8R3pDD1+OGFZoWWtI1IvZvxsr+hZlc?=
 =?iso-8859-1?Q?0GJnwM5ynR9n4TQKFT47Kh+lm8EBS4E4mkMwIBLUbTTMIai7Imum5MicbA?=
 =?iso-8859-1?Q?Sz5jhnNVFLA6GsfgjRHkiRosCS+6YompyZlAijbGc90cMYnfd+c1spayYK?=
 =?iso-8859-1?Q?PE6hTj0trx1W5PaLi8E6FMUhw7zNK64rkCPBDWF648yJQxmKmgtd5Vmzqt?=
 =?iso-8859-1?Q?b4PEVE16kw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5894.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a889112-dc68-4740-1242-08da43b322e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2022 09:43:08.9862 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XgKNxZSi/si4Mv8hIXMbkZrP0WGE1kj6BtfE/uVtPd+VLyij3oNaCsxRq8URN9td+xrpD9/QE4Da29Nvhx2BCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1492
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
Reply-To: "20220531103421.11363-1-william.tseng@intel.com"
 <20220531103421.11363-1-william.tseng@intel.com>
Cc: Wayne Lin <waynelin@amd.com>, "Lee, Shawn C" <shawn.c.lee@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks, Jani.
This is the issue ticket. https://gitlab.freedesktop.org/drm/intel/-/issues=
/6087#note_1400843


Regards
William

-----Original Message-----
From: Jani Nikula <jani.nikula@linux.intel.com>=20
Sent: Tuesday, May 31, 2022 7:07 PM
To: Tseng, William <william.tseng@intel.com>; dri-devel@lists.freedesktop.o=
rg
Cc: Lee, Shawn C <shawn.c.lee@intel.com>; Wayne Lin <waynelin@amd.com>; Tse=
ng, William <william.tseng@intel.com>
Subject: Re: [PATCH] drm/edid: ignore the CEA modes not defined in CEA-861-=
D

On Tue, 31 May 2022, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Tue, 31 May 2022, William Tseng <william.tseng@intel.com> wrote:
>> This is a workaround for HDMI 1.4 sink which has a CEA mode with=20
>> higher vic than what is defined in CEA-861-D.
>>
>> As an example, a HDMI 1.4 sink has the video format 2560x1080p to be=20
>> displayed and the video format is indicated by both SVD (with vic 90=20
>> and pictuure aspect ratio 64:27) and DTD.  When connecting to such=20
>> sink, source can't output the video format in SVD because an error is=20
>> returned by drm_hdmi_avi_infoframe_from_display_mode(), which can't=20
>> fill the infoframe with pictuure aspect ratio 64:27 and the vic,=20
>> which is originally 90 and is changed to 0 by drm_mode_cea_vic().
>>
>> To work around it, this patch ignores such CEA modes in=20
>> do_cea_modes() so the modes won't be processed in drm_hdmi_avi_infoframe=
_from_display_mode().
>> And only the video format in DTD can be dispalyed.

I think we should also have a bug filed on this, with the offending EDID at=
tached for posterity.

BR,
Jani.


>>
>> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
>> Cc: Wayne Lin <waynelin@amd.com>
>> Cc: Lee Shawn C <shawn.c.lee@intel.com>
>> Signed-off-by: William Tseng <william.tseng@intel.com>
>> ---
>>  drivers/gpu/drm/drm_edid.c | 39=20
>> +++++++++++++++++++++++++-------------
>>  1 file changed, 26 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c=20
>> index bc43e1b32092..a93f68878bfd 100644
>> --- a/drivers/gpu/drm/drm_edid.c
>> +++ b/drivers/gpu/drm/drm_edid.c
>> @@ -3982,6 +3982,19 @@ drm_display_mode_from_cea_vic(struct=20
>> drm_device *dev,  }  EXPORT_SYMBOL(drm_display_mode_from_cea_vic);
>> =20
>> +static bool is_hdmi2_sink(const struct drm_connector *connector) {
>> +	/*
>> +	 * FIXME: sil-sii8620 doesn't have a connector around when
>> +	 * we need one, so we have to be prepared for a NULL connector.
>> +	 */
>> +	if (!connector)
>> +		return true;
>> +
>> +	return connector->display_info.hdmi.scdc.supported ||
>> +		connector->display_info.color_formats & DRM_COLOR_FORMAT_YCBCR420;=20
>> +}
>> +
>>  static int
>>  do_cea_modes(struct drm_connector *connector, const u8 *db, u8 len) =20
>> { @@ -3993,6 +4006,19 @@ do_cea_modes(struct drm_connector=20
>> *connector, const u8 *db, u8 len)
>> =20
>>  		mode =3D drm_display_mode_from_vic_index(connector, db, len, i);
>>  		if (mode) {
>> +			u8 vic =3D svd_to_vic(db[i]);
>> +
>> +			if (!drm_valid_cea_vic(vic))
>> +				continue;
>
> drm_display_mode_from_vic_index() returns NULL in this case.
>
>> +
>> +			/*
>> +			 * HDMI 1.4 VIC range: 1 <=3D VIC <=3D 64 (CEA-861-D) but
>> +			 * HDMI 2.0 VIC range: 1 <=3D VIC <=3D 107 (CEA-861-F). So we
>> +			 * have to make sure we dont break HDMI 1.4 sinks.
>> +			 */
>> +			if (!is_hdmi2_sink(connector) && vic > 64)
>> +				continue;
>
> I'll need to double check if this is the right thing to do... but I=20
> guess the question becomes if this shouldn't be within=20
> drm_display_mode_from_vic_index().
>
> Duplicating the condition from drm_mode_cea_vic() is probably not a=20
> good idea.
>
> The continues in both above branches leak the mode.
>
>
> BR,
> Jani.
>
>
>> +
>>  			/*
>>  			 * YCBCR420 capability block contains a bitmap which
>>  			 * gives the index of CEA modes from CEA VDB, which @@ -5846,19=20
>> +5872,6 @@ void drm_set_preferred_mode(struct drm_connector=20
>> *connector,  }  EXPORT_SYMBOL(drm_set_preferred_mode);
>> =20
>> -static bool is_hdmi2_sink(const struct drm_connector *connector) -{
>> -	/*
>> -	 * FIXME: sil-sii8620 doesn't have a connector around when
>> -	 * we need one, so we have to be prepared for a NULL connector.
>> -	 */
>> -	if (!connector)
>> -		return true;
>> -
>> -	return connector->display_info.hdmi.scdc.supported ||
>> -		connector->display_info.color_formats & DRM_COLOR_FORMAT_YCBCR420;
>> -}
>> -
>>  static u8 drm_mode_hdmi_vic(const struct drm_connector *connector,
>>  			    const struct drm_display_mode *mode)  {

--
Jani Nikula, Intel Open Source Graphics Center
