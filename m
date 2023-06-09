Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AE3729DF6
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 17:13:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3D9B10E6C2;
	Fri,  9 Jun 2023 15:13:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31A2D10E6C2;
 Fri,  9 Jun 2023 15:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686323584; x=1717859584;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=C/iumIPmFQFvor5wpeCqxvBmebxR5522iL7dArEz2Mw=;
 b=cWPBLABItoVxPDdIpnW+LX6dkaB/SvYw+7y+W80criBxQxU5A/HOmwJW
 CGVZ/uEgXGicvqRZzrMAoffA9WHEoVJ5JtyiFeYzAyhwcOyWBGyBWRdHR
 odKGiI0ZKuqPZ7guo6Q5hlqcouhajXSyr2BwYDCy7bjfThBxsJrAV6kQ2
 T3ZcV6NyF0B1PDb7mjtLDCER1eXirm68Pv/e+sRv81ySt/rj301+rLBiS
 GrnrO+seWHfYMgMxiIYPWybjtEB3Iyg9ksDi116cD/6XcoNAr1X7fg2dk
 ux29EUC/1r7YIoLs4+k93PT4Krb+wKqAJ/5Yhj43CeaazbwWbGW82M5KS w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="337977151"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; 
 d="scan'208,217";a="337977151"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 08:13:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="1040507719"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; 
 d="scan'208,217";a="1040507719"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP; 09 Jun 2023 08:13:02 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 9 Jun 2023 08:13:02 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 9 Jun 2023 08:13:02 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 9 Jun 2023 08:13:01 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 9 Jun 2023 08:13:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TzousUJ/Rcrj/aValaVf1TDyct8gYKNADipDwALM/CnDy8nw+rJhy7NM1RFRFp4s9UETFMNQyojylhxXy7SrOCPu1wmPjnavQkOypQDtSA24B3WbsLNlczcMQgSW5DvB6GhydyNPhNNbLmiMHFV/rd5p5Hc/76crfNsBMzoYjzdnq5n06mInZmr/SXb9zG1+ZbasV+AD/XmwhK5LOUo7Dh398T6umiTkXcYk3dECLeNiGAzIzpjHhcvJxp9gJz81Q0yZtEwlJ0kkMXc2oEFZyRCp9uVwJM2niRJfnwngpt9SBr9HoJ3ZoVjH6dD8Kx8VPDNwQUkc7I1KwoQTXu9UBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C/iumIPmFQFvor5wpeCqxvBmebxR5522iL7dArEz2Mw=;
 b=f54wybxXLqfLfEwYksXH3Vv1SjpEGmP/qNvraJzduRo3q1TzwuRYRkIRCaz55diJtQSM+dAA8kLkTSUcm+EWdpe31MO9LWOrm5pfYgOUYPu/HpR/7wVCQjvstOGwO5OzcN4SMfScUDSDAJgJjJbc/Vg7gQvFbePPkCgpR1Fu5vrJBooueRkBrA/HYNPXWFh4CLQMinzAubJ0N1EFpqGJ2/k+ujqUv/1D5ohcPtS8GAQtVRnaqzjyIgr5rPk5OMetUOM5Nx+z/bpK+bXAw+j+SLS14/fR2f6AiFwCTKHon+yLZYpSforDcv7Wbj069BGmAAW7uEZJTeFtegDejiVsZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB2567.namprd11.prod.outlook.com (2603:10b6:a02:c5::32)
 by SJ0PR11MB6789.namprd11.prod.outlook.com (2603:10b6:a03:47f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.28; Fri, 9 Jun
 2023 15:13:00 +0000
Received: from BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::28b4:ae85:a4f0:3f46]) by BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::28b4:ae85:a4f0:3f46%4]) with mapi id 15.20.6455.034; Fri, 9 Jun 2023
 15:12:59 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>, "Zhang, Carl"
 <carl.zhang@intel.com>
Subject: Re: [PATCH v17 1/1] drm/i915: Allow user to set cache at BO creation
Thread-Topic: [PATCH v17 1/1] drm/i915: Allow user to set cache at BO creation
Thread-Index: AQHZmF3TD+PHG5JckUCREhL+ccwPOK99jWQAgAACPgCAAA8TgIAAAMuAgAETVQCAABloAIAAAsCAgANykACAAFSM4A==
Date: Fri, 9 Jun 2023 15:12:59 +0000
Message-ID: <BYAPR11MB2567170796F88BB7DFF0DE0C9A51A@BYAPR11MB2567.namprd11.prod.outlook.com>
References: <20230606100042.482345-1-andi.shyti@linux.intel.com>
 <20230606100042.482345-2-andi.shyti@linux.intel.com>
 <ec219702-8608-e919-cbcd-f271646845d1@linux.intel.com>
 <ZH8H3ovN20uVO+tK@ashyti-mobl2.lan>
 <168604992363.24014.14317865195655387952@jlahtine-mobl.ger.corp.intel.com>
 <ZH8VLY8a9d7i96cw@ashyti-mobl2.lan>
 <PH0PR11MB5579C119BEF9653A9A20CC4E8753A@PH0PR11MB5579.namprd11.prod.outlook.com>
 <ZIARdL44LW5BEysa@ashyti-mobl2.lan>
 <PH0PR11MB55793C2F3B66887186CF68198753A@PH0PR11MB5579.namprd11.prod.outlook.com>
 <ZIL4HNonFakDqJtB@ashyti-mobl2.lan>
In-Reply-To: <ZIL4HNonFakDqJtB@ashyti-mobl2.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB2567:EE_|SJ0PR11MB6789:EE_
x-ms-office365-filtering-correlation-id: 86b03650-f9ac-453c-c9b2-08db68fc0311
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PhOTA6JPIKQOD/OoF9WNJnQ/awIleMAEF0oqvIw4NnivEElhbMyQFNB29x4BQvMJNwyNm0oqaoQfAL5jq/bQREIalIov9A3AkfRcwn1DBKJET5WCL7OvMrJYP+3Uyb/5W/peTVrcVNCT0qq0JMaTgtd+nDk1IeU6xhMrGjS8pnLoSf28mEiWxuMJnRhHkfFvlKqszjhzP0XNWXpiRawyaO2efS9/Ut53tGb7qmlCLLatJhSVAQ81Pt5tUswfTSwtDM9BScHhBUQJc9W5+h9W6ESTkxzPR1azYYZk1cCk4ZiIzfTJoISfYidwqLxQJF0OJDxEYnG7OJSOmYc8N49mcI31IPPHPl6ezx4F7ym8uM3E6ge0JNuLO4K/Q4dm4wR8u/2bR9GOmfXAgTZ9zUnYjQRQ58rrjxJe308MOEcl7thOUVyJS7z8H4sS8nLnx2iJGLhYyy26YngF95P4lmHL3prjfja+BHcQkgefGTIwFURy3rDQZlMVh9ni768o2o+thKkHpi9Jtp+FBM2BCZchqF/0nVWPNHITQA63eelI4VvUaEJE87gn3omBJBzqIbq7WcQu5U/DstUpnuJ7ZJyuGw4Ua1h7V53OzZPEthINBdVdqiLJfb4XpDXeF3SdWSaZ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2567.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(346002)(136003)(376002)(396003)(39860400002)(451199021)(38070700005)(8676002)(66476007)(66946007)(76116006)(19627405001)(66446008)(66556008)(52536014)(64756008)(8936002)(110136005)(6636002)(5660300002)(4326008)(41300700001)(55016003)(54906003)(2906002)(478600001)(186003)(122000001)(26005)(86362001)(38100700002)(6506007)(9686003)(316002)(82960400001)(7696005)(71200400001)(83380400001)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?poEg0piy1ozmADLHJxtwN/qKGr0+k8ib2stapWCHRJbIDlyqGmv5cPo0FO?=
 =?iso-8859-1?Q?JRAXS7PICySKtyXluUYLzDBvZC0XENm7Da0e3qWgx7LQeCYqDpZO5f9fcO?=
 =?iso-8859-1?Q?O0fXNog+vxh8TdvbWJdetJP3xEyIOALOUF+wvIu1SB07mSovZKSR4qTJyc?=
 =?iso-8859-1?Q?tYLAUD0GLQePJeeV+O2Dio+3qOzDfyzi3kjd/nBe5t/eluxD5Nm6ztrGlR?=
 =?iso-8859-1?Q?/BDVXtzwqMYrnrrDpE03e73lYr43RfAS9fp3g/wmSF0zzM/gBzzZ5MN3WA?=
 =?iso-8859-1?Q?Q4Y7iJIR0hHuW30+tCM8Lc3VVgHkq4WCOIA8uOA59SEp7lbGwzjFBuDDii?=
 =?iso-8859-1?Q?2xg3xGiaZXEx4PG4Q5FVYFPLzXBa32JeV5gsO76G6qaWJsi3dY5yTF3tY1?=
 =?iso-8859-1?Q?TSaIr9Js2NzhlfcOUfC50KuHziiV4UEzoGK7a33TFPjCfQS585g++1sHrh?=
 =?iso-8859-1?Q?p+oezizgH9kQEj0BHMl11jIkr3wpz6sqztt2XOeBvrIR+jV31uRqo96JhE?=
 =?iso-8859-1?Q?yyJXuj0bKYBrwmO0jhBx/eZm67HEhlfdYqzz3LKU5d4ncCYWKWQF2jozmO?=
 =?iso-8859-1?Q?DFOLManKrXwcDeRpCLD3X9LGVjsaU7sH0frr2Sp/BKcTldO4k8u3gfTzWR?=
 =?iso-8859-1?Q?sv1BzE+QY+IGKju5OF5kvf/f3PSXP68z3PDDyiULt6zvWrxVMqCnBAblcX?=
 =?iso-8859-1?Q?rSJkS0k5qYAY1aKaja4jaXvj9QE2MWzYmdfEFn/09zTSMOSX9Tbm/LINzJ?=
 =?iso-8859-1?Q?c656FS5FIWXopdtPqAPysO3e5mKcKT9v2ujyR38upUm/oxv8/D2wdm6BEf?=
 =?iso-8859-1?Q?qdkun4qbPqSlSb/olf0CAq7hAmapJZuDqNtK7KV2cX494ZHIH+x7+9l2PD?=
 =?iso-8859-1?Q?WgWApd0DuqjbLBOzFGMU7uTONSXgU4LkahOGSazP7mNPdM38xu21eV5eRU?=
 =?iso-8859-1?Q?/S+vqmwO9ZnuRFjgZO0nyxzo7gGz7MNZsPlcUwuNw31w9Xaq8jlon78eCo?=
 =?iso-8859-1?Q?uq/vnRT+BydCvN2l/8FpQaTzT99208LA/B0WHPpaT/XSa2F3f/IZKlWz8m?=
 =?iso-8859-1?Q?T/CuKCPKmvp1NMmEykOVerL5V7O7ZsyCoINVeBcVfqhYP5ner6eASv9hcC?=
 =?iso-8859-1?Q?BqGm0495WTEvmJjH8fnxwNiBHfkeoYvD0t8cQp5rMEysUKAqb9ix9lz8Um?=
 =?iso-8859-1?Q?tQ2JiQzTvxXhP7cF+Vyj6dLOfGZcOFtEikA6Y9kLeH6qeF7GSS24Q2Tn7y?=
 =?iso-8859-1?Q?aR+llsmMcPvp0GC4MM+lRs3qvqW7LsMlyiUxWvIiUAEDFS/WbuCMYsmC19?=
 =?iso-8859-1?Q?Tew19iypFFot032t5yKM6n3bkMCtPLPkW2ZswlOr86qSD4g6C/UaboTprC?=
 =?iso-8859-1?Q?SyPPJKOYgeEjjeH4wU1FJ81nAhMwQQOTaSg96hM1jifEPJ+evW+AklflDk?=
 =?iso-8859-1?Q?aZ3vZEls8gYrXSSqfD31KwDWKhtKb3y9jZh8yNrYrHvXBBif5LSMpplpzj?=
 =?iso-8859-1?Q?AUMS1NxjMwk5n2RS8Ks1FVQS+zTzJhnZvSq6NweWVfdao3rimNrJcU1zJD?=
 =?iso-8859-1?Q?dVWygrpu7vBn03U6uxFjNpWSEPPUMUfNmGjkXg+4yE41c2JtlNEuVYr3i6?=
 =?iso-8859-1?Q?dBsEbHuNyDttQ=3D?=
Content-Type: multipart/alternative;
 boundary="_000_BYAPR11MB2567170796F88BB7DFF0DE0C9A51ABYAPR11MB2567namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2567.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86b03650-f9ac-453c-c9b2-08db68fc0311
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2023 15:12:59.5371 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iFKQZvbzxp4bLQntFjgcd+dK7j/OpkdJyoEtwM9kAWIZ8tDMHedCn5zAQwUYbaj/ufEWeIvmwLOfFbAp2CiiqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6789
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, "Gu,
 Lihao" <lihao.gu@intel.com>, "Justen, Jordan L" <jordan.l.justen@intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_BYAPR11MB2567170796F88BB7DFF0DE0C9A51ABYAPR11MB2567namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> Hi Carl,
>
>>>> besides this, ask a dumb question.
>>>> How we retrieve the pat_index from a shared resource though dma_buf fd=
?
>>>> maybe we need to know whether it could be CPU cached if we want map it=
.
>>>> Of course, looks there are no real usage to access it though CPU.
>>>> Just use it directly without any pat related options ?
>>>
>>> I am not understanding. Do you want to ask the PAT table to the driver?=
 Are
>>> you referring to the CPU PAT index?
>>>
>>> In any case, if I understood correctly, you don't necessarily always ne=
ed to
>>> set the PAT options and the cache options will fall into the default va=
lues.
>>>
>>> Please let me know if I haven't answered the question.
>>>
>>
>> If mesa create a resource , then use DRM_IOCTL_PRIME_HANDLE_TO_FD conver=
t it to a dma fd.
>> Then share it to media, media use DRM_IOCTL_PRIME_FD_TO_HANDLE convert i=
t to a gem bo.
>> But media does not know the PAT index , because mesa create it and set i=
t.
>> So, if media want to call DRM_IOCTL_I915_GEM_MMAP_OFFSET, media does not=
 know whether it could be WB.
>
> That's a good point. To be honest I am not really sure how this
> is handled.
>
> Fei, Jordan? Do you have suggestion here?

Is it possible to pass the PAT setting when sharing the fd?
Or perhaps we should have kept the get_caching ioctl functional?
Joonas, could you chime in here?

> Andi

--_000_BYAPR11MB2567170796F88BB7DFF0DE0C9A51ABYAPR11MB2567namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
&gt; Hi Carl,
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt; besides this, ask a dumb que=
stion.</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt; How we retrieve the pat_inde=
x from a shared resource though dma_buf fd?</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt; maybe we need to know whethe=
r it could be CPU cached if we want map it.</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt; Of course, looks there are n=
o real usage to access it though CPU.</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt; Just use it directly without=
 any pat related options ?</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; I am not understanding. Do you w=
ant to ask the PAT table to the driver? Are</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; you referring to the CPU PAT ind=
ex?</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; In any case, if I understood cor=
rectly, you don't necessarily always need to</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; set the PAT options and the cach=
e options will fall into the default values.</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; Please let me know if I haven't =
answered the question.</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; If mesa create a resource , then use=
 DRM_IOCTL_PRIME_HANDLE_TO_FD convert it to a dma fd.</div>
<div class=3D"ContentPasted0">&gt;&gt; Then share it to media, media use DR=
M_IOCTL_PRIME_FD_TO_HANDLE convert it to a gem bo.</div>
<div class=3D"ContentPasted0">&gt;&gt; But media does not know the PAT inde=
x , because mesa create it and set it.</div>
<div class=3D"ContentPasted0">&gt;&gt; So, if media want to call DRM_IOCTL_=
I915_GEM_MMAP_OFFSET, media does not know whether it could be WB.</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; That's a good point. To be honest I am n=
ot really sure how this</div>
<div class=3D"ContentPasted0">&gt; is handled.</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; Fei, Jordan? Do you have suggestion here=
?</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">Is it possible to pass the PAT setting when s=
haring the fd?</div>
<div class=3D"ContentPasted0">Or perhaps we should have kept the get_cachin=
g ioctl functional?</div>
<div class=3D"ContentPasted0">Joonas, could you chime in here?</div>
<div><br class=3D"ContentPasted0">
</div>
&gt; Andi<br>
</div>
</body>
</html>

--_000_BYAPR11MB2567170796F88BB7DFF0DE0C9A51ABYAPR11MB2567namp_--
