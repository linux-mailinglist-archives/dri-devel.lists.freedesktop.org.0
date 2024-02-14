Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7824D85431F
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 07:55:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10D4F10E203;
	Wed, 14 Feb 2024 06:55:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hUivBocY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 885E710E12C;
 Wed, 14 Feb 2024 06:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707893743; x=1739429743;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ehk+D3lWCQDg2AfccIKGJ2J1Uakuw2/wmWY97b/P9NE=;
 b=hUivBocYODEvOMKiWPlAKareL+zW+YbqkzfVCeCSmeLcV5gYvPyyCJKe
 YZO9Gw8wU+SsowfJ4tUSJAnSgVRvoJ9BSJPAiSEqX5gLldrpdW82WNERJ
 CQi3+YWV23M4DNd9ZV1fo+XCtDVvW6BuePIlca1R0tu48faZBZExCSzW2
 xrKhp0NOYseuddqkoIr8rjNo6DcR8u5lafer0AF8itU5GoS4lGntmNhWv
 wQ6YphreDJ7GbA8+nPdfulctXo3/oG+Mp6vJuxI6lgGp7bukvK+qSOAwK
 5QYXYbVqdl4K1YPNgS90fIVT9aGJxHf/2ER/rREdmEgGMuKp12Yir+8OG A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="2072581"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="2072581"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 22:55:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="3083413"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Feb 2024 22:55:41 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 13 Feb 2024 22:55:40 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 13 Feb 2024 22:55:39 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 13 Feb 2024 22:55:39 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 13 Feb 2024 22:55:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MWYstfSp7LM265itiKqOzsTSQOiYKWqgkR3m3U6NOHjUk6UHzmIhbXo6RapSkanOCQ88d41JqFbttM6jNVo8JNQxBIbJ+y3HYvC8UCMYLBJ2YLn5fA8sXsWrufsHoIs8xb1RXnzBK8brgrAzCbGcLaPZUwiEOqyVkbsnQ2rM5aapjv6p9asSzP4xD6p3vfPelzcmMj0l4auXoxp2uYwIJ/9U0it8TLvUxhOTcRCUpwD+zvPPXxAHGtQXXNQYBOP9r3UmiGtZuVCdhfQzgjmjtQC8HLTGoFSFU/rLf1MQgrsxGnDymoigNZ/5WnpWfo5h6279u3qHBtzNrfJIUKb7nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FSJkBd1ozrOHkRlw7FxRiUBp4lu9qY+pnvG4OgAUEhs=;
 b=VBLrXakoytQ5QAoWrTULxJ+LY46E3oS+y1IRiY2xw+/Qg1lG/IYp0cQf2RuM8BYZmcqQluD8kzP9i1Ir+DZyDOrn9ucdvDJxbRPkH7MoDP1Dn2JWtFg89iHPEfIKVW8JUFQM6msAwfL74uMLcz9FUZgI5GRW2thGqwuKfvRWRy/HQHA0QCB7tksWkRfjBldxWIkRc94VYSAgxvTnsfF8ll9eldVIOUK1tU8bGiij6DCZ67486v+sWXCsso2S096UV7SfWOKcMUGNpHonvCXQRDPCS5C6CDcnZWc1UKSGPEBV4Tba7eWxlJyjPyaIJ3ThdNkVinvegjSa8lzrFtPAGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 CO1PR11MB4818.namprd11.prod.outlook.com (2603:10b6:303:93::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7292.26; Wed, 14 Feb 2024 06:55:38 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::590:38d5:5c7c:3e4d]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::590:38d5:5c7c:3e4d%7]) with mapi id 15.20.7292.022; Wed, 14 Feb 2024
 06:55:37 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "contact@emersion.fr" <contact@emersion.fr>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "mwen@igalia.com" <mwen@igalia.com>,
 "jadahl@redhat.com" <jadahl@redhat.com>, "sebastian.wick@redhat.com"
 <sebastian.wick@redhat.com>, "shashank.sharma@amd.com"
 <shashank.sharma@amd.com>, "agoins@nvidia.com" <agoins@nvidia.com>,
 "joshua@froggi.es" <joshua@froggi.es>, "mdaenzer@redhat.com"
 <mdaenzer@redhat.com>, "aleixpol@kde.org" <aleixpol@kde.org>,
 "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>, "victoria@system76.com"
 <victoria@system76.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "quic_naseer@quicinc.com" <quic_naseer@quicinc.com>,
 "quic_cbraga@quicinc.com" <quic_cbraga@quicinc.com>,
 "quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>,
 "arthurgrillo@riseup.net" <arthurgrillo@riseup.net>, "marcan@marcan.st"
 <marcan@marcan.st>, "Liviu.Dudau@arm.com" <Liviu.Dudau@arm.com>,
 "sashamcintosh@google.com" <sashamcintosh@google.com>, "sean@poorly.run"
 <sean@poorly.run>, "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
Subject: RE: [PATCH 05/28] drm: Add support for 3x3 CTM
Thread-Topic: [PATCH 05/28] drm: Add support for 3x3 CTM
Thread-Index: AQHaXkei00TBUU0bqkuKPiVmJgrTB7EH/c6AgAFqwMA=
Date: Wed, 14 Feb 2024 06:55:37 +0000
Message-ID: <DM4PR11MB6360D876CDACF45A069334A9F44E2@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20240213064835.139464-1-uma.shankar@intel.com>
 <20240213064835.139464-6-uma.shankar@intel.com>
 <20240213111527.33ffc75b@eldfell>
In-Reply-To: <20240213111527.33ffc75b@eldfell>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|CO1PR11MB4818:EE_
x-ms-office365-filtering-correlation-id: db3b2052-0537-4a5a-f7ea-08dc2d29f357
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eTo25Lpqho0XBTA0PZnIu7j1XrWQ8r59GmQ6Wh3dD0yb5dcHEa1sgsK1uk3hfooxQPyZGUXy5Sh2hGO/FQLTtGZaqmqfT57RjFjs1I4MZfbVLsuLScZMoWABU/AWamWprLbPJ2i0plKaU1BnZZB7AyU8y4XkyztPX/cCegIaEhGJ15mFtb/Q8O2ZaXA+ucu+6+P1o69qIwqrt2DmGrEdkqdKjDDzgNRHYfSj6hiR/lXHIFUFV5OUdJlEkJGL/NtgeIyV2REW5NLF6pR4fEpSFvgB6U9BBhp6EH4+DNTiNIrKmtI4ETNM7NCKdsmQaSto7f1LkOEYz7+fuDM8ROIXQtBp27D5W+tFbIiLeY68T7l2uEjkkhhRHQW/Uu364zyUH4PDJZ13R1671WwIVHfw5NgUkE71OrcGjna+6Y35zsuDQ6nMKZaFj2RH612RFyIlRQscGf5jCVCExFa2h0xZLeERRlVCbTDzfdfHuEPKxO6GpzBWiLB+rmNg/dW/0sCg1hmenKYEyGYDtgCWvfEwB9OAt5xkK4X0pPzKm1NcL/AkqQZCona1lwVyMa+Kt4qkr6X8YvBdKlPpOs+Dka7hLdts4gyYgkpSlN9x7rAxur/SaAJNLI8e6/N6Y3Ki/zLs
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(39860400002)(136003)(396003)(376002)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(83380400001)(26005)(82960400001)(38100700002)(122000001)(6916009)(4326008)(7416002)(8676002)(76116006)(8936002)(52536014)(66946007)(66556008)(66476007)(64756008)(66446008)(5660300002)(2906002)(41300700001)(478600001)(7696005)(9686003)(6506007)(53546011)(54906003)(316002)(71200400001)(38070700009)(86362001)(33656002)(55016003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BGs9IzCAN0zyE2y3U+MbkwKsXMpLXASdV6SB11G3Nhpow8wwincg7UARrEri?=
 =?us-ascii?Q?WdAJOHq9O8Va4EhgbH4WVnVpyswnc1Fa1ij4MWXKZCDGZdvL4p9HvitiF7S8?=
 =?us-ascii?Q?oPUOXMz+YfYekAv1nQNUpVrbTL2i81o2uQUjMoNrND0mWf39yOm4VJr0C5sL?=
 =?us-ascii?Q?OyfDenQPb82V5HeyTlZ2CjxWktqegpHcDLF/l/aC8UfrI+ls4ney/nKXb4l5?=
 =?us-ascii?Q?JVW40ixE3IfO04aO//C+fQf29UTo5iCQZ5IC7QoNCLNnM85JOmTpxipfxeN7?=
 =?us-ascii?Q?O2YMcQJJr3kXAb0nVzDVRcwUKFY1eQqNbrQs+i87q4dLvb4qNlLeeUxG2Tdq?=
 =?us-ascii?Q?OJmHLmc8+gLm2srcFRYIYIOIzvt0hVm1Q9CAF1u04St4bnZxDmnVyy15fTrL?=
 =?us-ascii?Q?h5hQu/rzedNILKl4hBok3sglDdY8Q0jDcyo43xJv0zlKr6uPfejqE/Rg7FGW?=
 =?us-ascii?Q?VEdc13d+tNdHD8d12Zrc+W76/M4FXf9Vpa1FTZH3PRweQ1p+qyFChRAJMJ7R?=
 =?us-ascii?Q?sWEUiaYf0XXXyK8GJa9Gi2I5fgM00+hJZlrDOKalcc9GN/bDap74yn+UvOt6?=
 =?us-ascii?Q?B59IpMKtFDP8EoHHw7arD4xD5EL8dPDYl3TG7ZPLPp39wVWkdWiJp/AQMpxa?=
 =?us-ascii?Q?2+r4rpEEiPX8CioSuFHs12cQEjwGQMkBn7xROzuAM0EZcRlIxSD/bXHezFpd?=
 =?us-ascii?Q?W9ldRw14dp5aXXqqJ6y2KcAjbIKWL7Dyihzpszt90h1hKKEucM+dl72ggtqI?=
 =?us-ascii?Q?IX6tcRV/oOZdaF6AgEemW1zkJmQL4UHmygbGcOQzkchmp/+xWqR2GjjA0ey9?=
 =?us-ascii?Q?PCHf7KuNOsf/j6U0RT92wn9i0TLzIjJwxESFL4cW0PU6MsKDeVrsBOYMdI3a?=
 =?us-ascii?Q?jhk6hXQry54zu5Z+7m1Fewgxv2/K6TMREdLX+KdpXIG5hRmeSnoeaFg6ggae?=
 =?us-ascii?Q?seHtQslyGTeeJb7ytfetfejmWuustB9RPDJcOEXH4I6lm+4kVaErLhZwdpdo?=
 =?us-ascii?Q?21SnTOnSZvd1Dpz+EMB5WsUlLx1tYc4BY4iSM14Yyf+dAHpC1GyPHPcIsCFf?=
 =?us-ascii?Q?Kv3pX9A7I6/Kg1DEn52xccqyjqHGPuN0fGK8x6XHjioDjbSNa34sxER/Waow?=
 =?us-ascii?Q?U5zVB+qWpZFVEKxYgyzcaQp+XtltlHY15Frp4C+8SThDWi6tcFjxkJBS1LWT?=
 =?us-ascii?Q?mCo0dISUYG+dnj1fQIxhhjesOB2UFbI8EWaZ3wvY2DMG2x1/pfAdJqfPjWjD?=
 =?us-ascii?Q?jWg4DZR2Bnpy+aSAo1ABzdpWdVrl53lzC5Bm70zTuDaS/AIsLlskTHA1M9Cx?=
 =?us-ascii?Q?ZsZADBuEKun0ftB8pK+6ApGdEXyC2c9EfqwYxEEqpQ3EHcgsWM5rpYM5ll3r?=
 =?us-ascii?Q?Ja3Vs8SRF1IOmC3zWnUZyy8PQB1/F2aMVSLeKQ5BicZ0O2M6U+Z926PbxSd0?=
 =?us-ascii?Q?RkroZXxFQNwVg4EF/b88e0PotfO5ZyTc2819vZ2MzGJc6ewH5d7Vz3+D0nIH?=
 =?us-ascii?Q?WmM5yH9VYYNxOFcy1gZBu1mdu8Q/fRhbZ9HVJbRlDXYivYTNQSOSZCLYPsa0?=
 =?us-ascii?Q?wCxUXEzgMODpvtXv2hkbGASnh/+rJ5M6CncfreY8?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db3b2052-0537-4a5a-f7ea-08dc2d29f357
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2024 06:55:37.8832 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: thcqc+qXkUN9dlQw37FSi1IP00hCdT/oVRdcN94n61yAI/5RHTrSiVKJ36f8AzKcMGIjcP1PGbyQxeSEpSSGFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4818
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
> Sent: Tuesday, February 13, 2024 2:45 PM
> To: Shankar, Uma <uma.shankar@intel.com>
> Cc: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org;
> ville.syrjala@linux.intel.com; contact@emersion.fr; harry.wentland@amd.co=
m;
> mwen@igalia.com; jadahl@redhat.com; sebastian.wick@redhat.com;
> shashank.sharma@amd.com; agoins@nvidia.com; joshua@froggi.es;
> mdaenzer@redhat.com; aleixpol@kde.org; xaver.hugl@gmail.com;
> victoria@system76.com; daniel@ffwll.ch; quic_naseer@quicinc.com;
> quic_cbraga@quicinc.com; quic_abhinavk@quicinc.com; arthurgrillo@riseup.n=
et;
> marcan@marcan.st; Liviu.Dudau@arm.com; sashamcintosh@google.com;
> sean@poorly.run; Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>
> Subject: Re: [PATCH 05/28] drm: Add support for 3x3 CTM
>=20
> On Tue, 13 Feb 2024 12:18:12 +0530
> Uma Shankar <uma.shankar@intel.com> wrote:
>=20
> > From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> >
> > Add support for 3x3 Color Transformation Matrices in Color Pipeline.
> >
> > Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> > Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> > ---
> >  drivers/gpu/drm/drm_atomic_uapi.c | 3 +++
> >  drivers/gpu/drm/drm_colorop.c     | 2 +-
> >  include/uapi/drm/drm_mode.h       | 1 +
> >  3 files changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/drm_atomic_uapi.c
> > b/drivers/gpu/drm/drm_atomic_uapi.c
> > index e7bf1fb054af..c54b0d6c133e 100644
> > --- a/drivers/gpu/drm/drm_atomic_uapi.c
> > +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> > @@ -716,6 +716,9 @@ static int drm_atomic_color_set_data_property(struc=
t
> drm_colorop *colorop,
> >  	case DRM_COLOROP_CTM_3X4:
> >  		size =3D sizeof(struct drm_color_ctm_3x4);
> >  		break;
> > +	case DRM_COLOROP_CTM_3X3:
> > +		size =3D sizeof(struct drm_color_ctm);
> > +		break;
> >  	default:
> >  		/* should never get here */
> >  		return -EINVAL;
> > diff --git a/drivers/gpu/drm/drm_colorop.c
> > b/drivers/gpu/drm/drm_colorop.c index 462ffec42cdf..6bae6dc8e54b
> > 100644
> > --- a/drivers/gpu/drm/drm_colorop.c
> > +++ b/drivers/gpu/drm/drm_colorop.c
> > @@ -107,7 +107,7 @@ int drm_colorop_init(struct drm_device *dev, struct
> drm_colorop *colorop,
> >  				   0);
> >
> >  	/* data */
> > -	if (type =3D=3D DRM_COLOROP_CTM_3X4) {
> > +	if (type =3D=3D DRM_COLOROP_CTM_3X4 || type =3D=3D
> DRM_COLOROP_CTM_3X3) {
> >  		prop =3D drm_property_create(dev, DRM_MODE_PROP_ATOMIC |
> DRM_MODE_PROP_BLOB,
> >  					   "DATA", 0);
> >  		if (!prop)
> > diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> > index f16318f1785f..68696253867e 100644
> > --- a/include/uapi/drm/drm_mode.h
> > +++ b/include/uapi/drm/drm_mode.h
> > @@ -868,6 +868,7 @@ struct drm_color_lut {
> >
> >  enum drm_colorop_type {
> >  	DRM_COLOROP_1D_CURVE,
> > +	DRM_COLOROP_CTM_3X3,
> >  	DRM_COLOROP_CTM_3X4,
> >  };
> >
>=20
> Hi,
>=20
> where are the docs for DRM_COLOROP_CTM_3X3?

Hi Pekka,
Sorry, we missed this in the current version. Will update the same in next =
revision.

Regards,
Uma Shankar

>=20
> Thanks,
> pq
