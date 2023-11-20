Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28CD07F13E5
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 14:05:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EECF10E04A;
	Mon, 20 Nov 2023 13:05:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 547F610E04A;
 Mon, 20 Nov 2023 13:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700485512; x=1732021512;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JtHJSPsO+WP9a7HLUUz6+wyBdG3p7Utf+JeK+P7u7Uw=;
 b=mLUx8qNqyy1TdJ9erBwJIidhSobwOaWpFlny+3N1cL4uaRSK9SmPpKNa
 WUvekDdTOTkv6UpJMbCOmMq42HJvdwgOb8Ftkrjqw4MmvnEhlIO+xIO1x
 zHQfqyETAxqRuSd9y2jX2CkLVPhYYPrVfCPcauXwpxr7NaU1vECl0vdnL
 od97e23PoDz1f58fdKMUAQzP1tNvlZVjdnzu5CnEs7zDDuxKB88f7s6aO
 tc85NzEfNwVZ383nppMPWz5J+N9otaQi5oenJn6nbcoEt8tZkCpTR8qCX
 RW1RN7Gzw2erikSL+HcasbzRVCDyifGYfbaKW+TNupDrrYw/y9kaq5A55 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="455938912"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; d="scan'208";a="455938912"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 05:03:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="742727516"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; d="scan'208";a="742727516"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Nov 2023 05:03:15 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 20 Nov 2023 05:03:14 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 20 Nov 2023 05:03:14 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 20 Nov 2023 05:03:14 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 20 Nov 2023 05:03:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WMkdCPS9gGG0I7/i4jLggfHxyG41kmUrjw9gntFS5FJ1yj9osedrausvcFF8vEkJ+h7N/ZO90+IyBcRR/hQ+CqSWu8mjE8n0Nyh1zsS1jAyyzusVpZEUqT5vp4Op4KmkCj7zM2iySoRRTeDzI7qBCuMaOt8C6Qv+AbKUHv7Q0sK1Hnfo8J04ueJlhvQUWyq6ZXuQkHvMEioTnF69aAlTDr/cF/mpBY1NAA+yU7dxB1xRdmKg8A/60CWBuyvhTVJIvaxuB8b9/j5oPEpeyiSrWYEj3aeSJbVaTtP2GA98XqxDFIk/eGU25HaPuJGVn/jNhqvfWBZd2jJPjwwvAAJTfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JtHJSPsO+WP9a7HLUUz6+wyBdG3p7Utf+JeK+P7u7Uw=;
 b=Luprrp+UXRzcty2iN7i6dbq5RJL0OWa/tn66inb7pv8/Bda0dvMO+HyaoCQ3IoTF8R3c0Zu8ZDDuzXlfXwIB+j64ufFj8KO4DlXGm5MD0kpS3orbtwAkwp9Q2kBOJhd4pSXAm+LGtYdviz9FbGuqRV7K9apb8ISD2NaLk0NmM+UyI1ajfQaCU80ESBE9uUrrZIBtET5BJ2ujja1A538hsO1uSro8HBU0u87e3WJrkk3j5BhCyK2f+stAHCeh4V+4n/jN31mYjoGMWPA1QBMa4qniwsgylZtuIacIm1IUfYX1GLs2wPyAiLIRyTUhSnQydTZdgAZRPiMnjb/iVhOzfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by DM4PR11MB5424.namprd11.prod.outlook.com (2603:10b6:5:39c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.28; Mon, 20 Nov
 2023 13:03:11 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::b5bf:a968:5f25:945]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::b5bf:a968:5f25:945%6]) with mapi id 15.20.7002.026; Mon, 20 Nov 2023
 13:03:11 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: RE: [Intel-gfx] [PATCH 1/4] drm: Fix color LUT rounding
Thread-Topic: [Intel-gfx] [PATCH 1/4] drm: Fix color LUT rounding
Thread-Index: AQHZ/ddIZSsnYdkm4UKlnbOX3TZtTbBjue2AgABy1ACAHzjNEA==
Date: Mon, 20 Nov 2023 13:03:11 +0000
Message-ID: <SJ1PR11MB61295A8D16AEFE78E0F9EBD3B9B4A@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20231013131402.24072-1-ville.syrjala@linux.intel.com>
 <20231013131402.24072-2-ville.syrjala@linux.intel.com>
 <8734xr5f0o.fsf@intel.com> <ZUElHKaa5rnifyvy@intel.com>
In-Reply-To: <ZUElHKaa5rnifyvy@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|DM4PR11MB5424:EE_
x-ms-office365-filtering-correlation-id: 8162a687-ea8a-4a94-6286-08dbe9c90ccf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9UMe3sSa0EcNFFuKjU9FoowbUTOERA4IKmVZvHjvpBbcZ2FoxRVGC5PeQgRI9ZXMPqY6FGb7xYWUbLu3p2z0q9+XNIIIFVy5VHtqQHkLOs45k3hl0C5oUYDPCPXct8vY89WEyAKxeNnroi8BGnTbQ9Jl68A5aS3twvAWxTT8c20Z6wYYRklJqqbKmI/Pofj4S3jHCaoBN0tRFYuOkwaOnwbl6B3sWQVKjkvfA3O+RzLMKzPz/xGwYRDx3GHGnV3kmSqm6MTFnHOLzGAYIKn2POBEggizAYYy/5d6ZnjHidVJcxJ0ge8AmykN/aM8vDqDWH1QxgwZgh6Fb1rQwTnT+l6UDg4ml/DpKycPz6NBGrLljkLBGnViFgbQNmZn9Vml0duZ3E1HcJpOMypDx19g8dGC0YW8o5c4ldJjtb2zP6AQy3jdhi9J0Ktft4NkcLH9J5htQbs8/3tj9WDxsOe/4TxDuSvqcizxWP6hHOGRHszd1/JSY7FBKB0IA0HicICi6KYKyLN6RnS5OY/9g9A6Q6JHvbU4Uh/O8dkH+p7T8DuYAcq6KRSaPvj4cM5gvMP03U9BWi5c8lYOw41txpXXyZHZWDTf+9k2hZPVHCwC+og=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(376002)(346002)(366004)(396003)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(9686003)(122000001)(66946007)(66446008)(66476007)(66556008)(64756008)(54906003)(4326008)(6916009)(316002)(76116006)(8676002)(8936002)(478600001)(26005)(55016003)(71200400001)(82960400001)(7696005)(6506007)(53546011)(83380400001)(966005)(38100700002)(52536014)(5660300002)(2906002)(33656002)(41300700001)(86362001)(38070700009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?crdfA6J3KHFPrh+tNtf3HO2ug9xoPgodivnakaztpRVSAC3O+DeX1j3BGI?=
 =?iso-8859-1?Q?z5r0LuOubFdWHZ3mw5EYJjV/9tJaDUv+q1Z2kY6KXYYkL2grrs9wTNTZDf?=
 =?iso-8859-1?Q?BEKbQSQanQ6RNBSBoFvg5Jn5XIVAJYHt5v2OlPJdVDKSRu7BEWUe0NLX+A?=
 =?iso-8859-1?Q?xakOLPj5aJlEwd8xlHIjhcpzaXaCuYebfFCn/EXF4SBhKYU92JqRdTEBpI?=
 =?iso-8859-1?Q?u97Q0rQTqzI5YVSdLenqPKAblhWESyPJlSMYbtHbMGEs2975jC5qoaxQuL?=
 =?iso-8859-1?Q?CKQLFmjamjdCpJM5VEEihVKnYL1FNvbwTQe3VcOhbogY5/CvXr3GbRGxnO?=
 =?iso-8859-1?Q?IBuMOkQ8KLqoGuzqSJlMwzDQNbAQnQLw6GMgVQosn6lu18UYH8gkdXBDJa?=
 =?iso-8859-1?Q?K67kfYZXqVCx86pZLRIefJ2Qmqh464Hn58sDhMyaKEHS2tnT9/lef42cun?=
 =?iso-8859-1?Q?kxEE9VoRbvGYZZRnL3bC+yIFTkhhJF8FR1zrGc/cvHQWvqti4TVxB7rmcA?=
 =?iso-8859-1?Q?sToDZbdy2b1fHmhQLAL6Wd7GCLkwajTUuIsGkIMQgmlISBQ+7YoAD8Akx6?=
 =?iso-8859-1?Q?yzPtXyZThhVMWkIzhsUesz4yZwwrJ/gwWp0mGkbS+yBBEyf4ogETLJImgq?=
 =?iso-8859-1?Q?ZrkpwGxr9CJCqdiRUm+tQyUrgaGmuinwsWyPesfWImxmbgockMhggBwR+C?=
 =?iso-8859-1?Q?r9ORhvz12Iwf9SNwt8HHtw7RWj4Za+estYsga7ncPVy+JlwvfcIyp1UrUd?=
 =?iso-8859-1?Q?ZjRRG46EkxDpLX+GYciGq9+Xj+Vz2NR7F9LLidxxTEwrmaqTF2vN0j9lLg?=
 =?iso-8859-1?Q?9cwpeLc3HMEqT+59Z8uB02Zf/JOy0vh0ao7lwzi80SnHJ4WGVDi74bkCYj?=
 =?iso-8859-1?Q?agVRMEY2gMkQFVVPWUIYTZEDuB3ZmJiRsQVhTxxJunk2f4mbCIQraS+l8e?=
 =?iso-8859-1?Q?FM1L7Lyw0fmbG5ccgtj3IJlckPJca3zUOthri5AO2Gtb8nnMVtanrDWI+8?=
 =?iso-8859-1?Q?dTR2rZtve8PzZvfYsl4zWplQ5AEScIT3HSYxQAfgBcCRMzFVBTOM9oUMNT?=
 =?iso-8859-1?Q?v68B42cEktMn9N/xzT3JhWp+ffFiWMOPNt8IS+KqCZZWoyf739bmabjOwO?=
 =?iso-8859-1?Q?4NbQ5KPtyRIhUfjOaRjot0lcm3ehHNr5sZ/yJFjrTjt3mN1XcRjUd4+bCf?=
 =?iso-8859-1?Q?+stZp/vtHtoXOZje6t2WZS8jAvYX2MWmNQC1pvC+Gtg67mRy9v/F1GmHJT?=
 =?iso-8859-1?Q?YhOEKt8RfxlrtrBheQRP6qusIXh/hnwaup2i8UfVGFBAxingZQQgNNC+Ju?=
 =?iso-8859-1?Q?ZNywAe7loxyz1helhlZnmFvKJy6kdLSdJuCbhEacMi6M6yv0GeoDtocYmn?=
 =?iso-8859-1?Q?6wuZNaOe2/YMYziebY81tEZfcJH/K4Mt/xHS8DhtlIQSgxJoC2MXly751H?=
 =?iso-8859-1?Q?NWvKZxffA5qudMRIsLQnrltazumo1rS6+DfJyOnFZn+43XGnEzQx7ZqmxA?=
 =?iso-8859-1?Q?ZVp52Csp/6+MR+Fhu/PH90zxza70UW6lDP5gdgln9DzgvSDLHlJhhyoPlG?=
 =?iso-8859-1?Q?gykEJNkznK7gzEUQi83nHuDcpWDztXAi1yxDc2fLTq0kkyYHJl7AJDF1hC?=
 =?iso-8859-1?Q?oXA2L3QN2+420d9mhAxZej+9K7hqSvAgB+XKhjfKTzsX2qDcdACQT0kg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8162a687-ea8a-4a94-6286-08dbe9c90ccf
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2023 13:03:11.5602 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1tf08mZdPedXG8eSY1U2bt8LeiKbMbqWMTLh2+idd/HdLLSvZVn29Zc2pZys21Kl+ChRMi3KHRZPCCv24Doc2vbrxrNF4P5XNrX/sMlYFXU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5424
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Ville,

> -----Original Message-----
> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Vi=
lle
> Syrj=E4l=E4
> Sent: Tuesday, October 31, 2023 9:37 PM
> To: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Subject: Re: [Intel-gfx] [PATCH 1/4] drm: Fix color LUT rounding
>=20
> On Tue, Oct 31, 2023 at 11:15:35AM +0200, Jani Nikula wrote:
> > On Fri, 13 Oct 2023, Ville Syrjala <ville.syrjala@linux.intel.com> wrot=
e:
> > > entrirely. But perhaps a better idea would be to follow the OpenGL
> > > int<->float conversion rules, in which case we get the following
> > > results:
> >
> > Do you have a pointer to the rules handy, I couldn't find it. :(
>=20
> Eg. '2.3.5 Fixed-Point Data Conversions' in GL 4.6 spec. The section numb=
er
> probably changes depending on which version of the spec you look at.
>=20

This section particularly talks about conversion of normalized fixed point =
 to floating point numbers and vice versa.
Pardon my limited knowledge on the topic but aren't we just doing a scaling=
 factor conversion(Q0.16 -> Q0.8) in these patches?

I could not draw a direct relation between the formulas in the section[1] a=
nd what we are doing here.(but it could be just me!)

Regards

Chaitanya

[1] https://registry.khronos.org/OpenGL/specs/gl/glspec46.core.pdf '2.3.5 F=
ixed-Point Data Conversions'

> >
> > Might also add the reference to the commit message and/or comment.
> >
> > BR,
> > Jani.
> >
> > --
> > Jani Nikula, Intel
>=20
> --
> Ville Syrj=E4l=E4
> Intel
