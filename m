Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 027AC72B252
	for <lists+dri-devel@lfdr.de>; Sun, 11 Jun 2023 16:43:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F046910E089;
	Sun, 11 Jun 2023 14:43:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C29F10E011;
 Sun, 11 Jun 2023 14:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686494611; x=1718030611;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=PY5aiqeLd1kwNJMteDdgeUWHgDAw/VZyVHms02cdOWo=;
 b=M5QzeTqVokc1xvQUEdavmMSXIVRKPt2edKDsQviccjel06t+bFkcjTKu
 8ob5rzHmAnXtWA61lW50gYCsRR4/NWOT5J5O5clx33CNXkbswTEjtRs10
 kgTIUiDIE90xVP4SB2LOruUukl8qZ0ast768abgeTbxCU+8Grin66Qu4r
 cqOhiHFzwan03oC/6wlzwU0P0l95FDksUOUFjxN6W3qEUSqQogun79RM/
 O5rdMCerswTTjaihm8zuIMcmDMwJkXhR4lYCeTO+jsAeZL9gYP/zmZ86J
 +BOkOuNmwcw8sLObq1lqRCXg6rS3ytL8hTEwCRp17COicvo8NcbceiEL7 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="423746193"
X-IronPort-AV: E=Sophos;i="6.00,234,1681196400"; 
 d="scan'208,217";a="423746193"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2023 07:43:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="740710281"
X-IronPort-AV: E=Sophos;i="6.00,234,1681196400"; 
 d="scan'208,217";a="740710281"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP; 11 Jun 2023 07:43:30 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 11 Jun 2023 07:43:29 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 11 Jun 2023 07:43:29 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Sun, 11 Jun 2023 07:43:29 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Sun, 11 Jun 2023 07:43:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K5Q8kEov6P+JazNewEcA6VD6DxlQjR19GNHtMmD3NigbaBHYqZIgv0M7jktgPsD5+iA5/6silQGAlbzefELgeMk/h2rwQ/HDWrhvUxJbad4rGAHAUPGF/KKHjwR+CKELExTleVxI4jalvJErbh9x1DExCOmCtMzECKRGkz0JxZiFpsVLtzJLXouSZ3aSJ/9l27cJmOKNDbh/DdDQ1rP5v2stGHxLu0R/r0BlKPziXqvbr5zNRScnthLD1QpYkiRIDPXO5DkNWWZXsXVAPeEeZcYZSpeDak/BhoGqm/0E4bgdmE5hDMnZXBLZbj+wUVaCezSU/8YrP2VC738xh2VLcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rjatF7S03NhFNnY10AigkURxRnpBahIHq6GtgUxGD8Y=;
 b=jL0u1sMeo+X8c1hIyW+7wfExNVI29tQHN9tzJIFN1qyjsckwkNsEHXLRApwqfI0ksatPnVssggLsDCaLHoceXFBn9AHKfet21dNDQznrv+b9WH5e6aBIc158Hs+7/0rDObrwqB1C/xVzL00ds8RUaAi96+7pvinw07kMuMk1y54+eJzaCxzM2H2Mf9aGjeQJPVWr9fJ4BvrOHd2v7u/G77pfQNCmRascEWHv9GFR+f2jm/p/dDQqeOKx8MR4sf16yIT/duukfJYCs9UVxuYqX5mx+rzxlmwh7a8d8U7CDvTET8RqYkcnxh4OSHt2XeAvKY7byX5DZqFyf1Jb+fyyjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5579.namprd11.prod.outlook.com (2603:10b6:510:e6::10)
 by MW3PR11MB4553.namprd11.prod.outlook.com (2603:10b6:303:2c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Sun, 11 Jun
 2023 14:43:27 +0000
Received: from PH0PR11MB5579.namprd11.prod.outlook.com
 ([fe80::29d:7629:6a6:4775]) by PH0PR11MB5579.namprd11.prod.outlook.com
 ([fe80::29d:7629:6a6:4775%6]) with mapi id 15.20.6455.030; Sun, 11 Jun 2023
 14:43:27 +0000
From: "Zhang, Carl" <carl.zhang@intel.com>
To: "Yang, Fei" <fei.yang@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>
Subject: RE: [PATCH v17 1/1] drm/i915: Allow user to set cache at BO creation
Thread-Topic: [PATCH v17 1/1] drm/i915: Allow user to set cache at BO creation
Thread-Index: AQHZmF3TkoTvvrD0YEWND8XQd7MDa699jWQAgAACPgCAAA8TgIAAAMuAgAEO3BCAAB3hAIAAAR2AgAN0MwCAAFd3gIADG0uA
Date: Sun, 11 Jun 2023 14:43:26 +0000
Message-ID: <PH0PR11MB5579C33C03603EDF80B7C96A8757A@PH0PR11MB5579.namprd11.prod.outlook.com>
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
 <BYAPR11MB2567170796F88BB7DFF0DE0C9A51A@BYAPR11MB2567.namprd11.prod.outlook.com>
In-Reply-To: <BYAPR11MB2567170796F88BB7DFF0DE0C9A51A@BYAPR11MB2567.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5579:EE_|MW3PR11MB4553:EE_
x-ms-office365-filtering-correlation-id: 39adce44-b342-437e-ea7f-08db6a8a374a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: b3/y0BRZchwLaJYCEpzVjaBI7W87Y/uq9qMCK03mnwj/SY3OSoek+HgcBrITEoCD5mLrqDpfcSrrwo7A0nXMZFyNQTmpcGdItnwCogSwj7VEY9AJ5BA7AdM5eX6d9FgI5smk+kNH2Y41HYs4gQU7Je+Cbri2Htw/VacjX7Pn3PvAMyKlqexVCBtkz8hJa7mAM/yjHzGbBZ0175ZlztuOuuPai86GYVfo6YJ56KhniCh5E6q5HboxrnL88TsiPuxq7BFZNhmgta43FWmYU5crfE6CcYOd4TSVcVW0VlfSwGKLuBTjGcwHXzuug+GjLLOD1rn3Cw91N6NxTLg07RwnGMLfHtKsD33DpPeZ3wTHRjsdoVl7Yo58eYdnQC3qlMdBoG1qVhEf0HY1D+Hq1Av6bAR3f7p/L/RVV0PwIi+XibW7lLBA8NQyjQfKFysTHOs9/hduiEuYRbUInpoXDOmSdKuQVUibzpMNf9aYSKXtXqmf9QEHcqmoPRh8apsbT6L0q0/Dt1A0BTyiqWtTxLW+ZCTeV0Wzu/oMfOIiqS99f9jmAfW9mMHPSsnjIe66YkXhlKNpnJw1VNeKNQXqmfMWKbckXdilmCAxgST0IOCa3WmgHERUynRi0PjYN2D90YJF
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5579.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(396003)(39860400002)(346002)(366004)(136003)(451199021)(76116006)(66446008)(8936002)(64756008)(66946007)(8676002)(4326008)(66476007)(316002)(66556008)(55016003)(110136005)(54906003)(2906002)(478600001)(5660300002)(52536014)(41300700001)(71200400001)(7696005)(53546011)(9686003)(26005)(6506007)(83380400001)(33656002)(186003)(82960400001)(38070700005)(38100700002)(86362001)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kOE0Jh+6D6e00ZMrSHVVJF6T0V5Do+p8p48Vqj2hqe9UlJp4dI8diy99MD0G?=
 =?us-ascii?Q?5hv7FSyZDSO8iHw1HG7bHiqkaLh8CFvr/hZ4iCk1PxqciKRtbkBQY1RDhEVq?=
 =?us-ascii?Q?M6WiE1G21jD+k1EsyUeDES60uuHPzx8vRO6rA6LdwizZMq5jXIHK8NPMgFab?=
 =?us-ascii?Q?qCnlI14PTQ+QtjOQi32Vj+cQwG5cKAVKjRbi8Qnm42KQt96PwU5uau0Uqavi?=
 =?us-ascii?Q?ckHOpS0c4v8i9dzDPWKMORzfnlZON0vW93wXMDNTZeQBLqyknCiSJeSWzo2b?=
 =?us-ascii?Q?7UgDImXYXp3gvNb+AciGm897RZPcF/Mlmetp6YHWHwvHTft7cLA28/udPjCL?=
 =?us-ascii?Q?2Zza+lj2mraj3zzQyhLvoXBh2uM5tQ4jKEdgP/Yuy13DrIsfbxkTeNuT2GL6?=
 =?us-ascii?Q?d6z/2rjI+GbW6vLVrmd/GjYKkywly12z1/j79qD69HkmkH40tvFYYlWD4QVt?=
 =?us-ascii?Q?h8e+b5H6r/HkOH8xSo/2RTqwhcJgwGU3HX560aLFFAoYwFamNOx9iYidUe/t?=
 =?us-ascii?Q?UTeaXaWHEcT0fci/9orj7XXfTlTVzSoEUC6/gOe5CCT04jyV26fHBdb53PpS?=
 =?us-ascii?Q?XIugrAK+D9W5ccFT64rJ8ViwUrMU95z72VJnmfVPkOxpg2uCtSpeKHk8Lh6i?=
 =?us-ascii?Q?GmOKsfqA149B3QkK+oQF5GApjdVqN5jASpzZhL2HOb+nCaNYIE4wqBmARrh/?=
 =?us-ascii?Q?3VR5A+pcWK6umqzdF2+GISvByQpx/wGLhRpdXIvCs74btwNR4c3NDc+KDaQ6?=
 =?us-ascii?Q?6U1vodwI889itbZD2YpNLV9+Os29P428j0yCtAmzB1o1h4gezyPQzwUeE8Wb?=
 =?us-ascii?Q?PDkp0YgGdEaVKKbXxxBJ+eUI4yRcdBKm1UmGSzqJlbCkKeqR/o9o21B69DGg?=
 =?us-ascii?Q?1EqhGZKNyx43JdHjmnmIy3YFL8hg/A81kxUE5HOUmDgKDrQQNEocnVFLdyDH?=
 =?us-ascii?Q?Qt6xp8JqDl/aN7VnG9naHKCmxMdlWZn2iDj2rEzRlXSwdnwQmPfcCF4ljpGw?=
 =?us-ascii?Q?C5RCAPmu9ixLw3xBc0shmU63xDh+dhd6v2UK80iMXUte52GnRY/jtOL/0mUx?=
 =?us-ascii?Q?tLatt7xthUE52ev3hnsUdRWb4LvTbuosXFqODSsw5ihvyAmlnFqmL4/T46aP?=
 =?us-ascii?Q?pkBSwiytdJDMrIQjA1REqkXxzO6++5GkVDaKT03UM4HByZ/c7Od0euzaFTix?=
 =?us-ascii?Q?F7BbBwK3zxeNK+mwiPF1NURZXfWTKYALOjMqicD1PEGYyokeETiYvyGFDsMe?=
 =?us-ascii?Q?QIsFRABWb1xC7+6JN/NhissRWYkP5tO0X7jJGrA3j64dfidjJR2LHAmnZlY/?=
 =?us-ascii?Q?9lkdey9CsybaHF0O4t5bc/v+waH9RHhEXA4TPvQB9DoD+lbS3e9RytVn53pX?=
 =?us-ascii?Q?d46viq6DVRD6bQKnRyyNH+6OZO9tKmaNMT7ucYWfvsZoDDDXLn4W+9loQNcg?=
 =?us-ascii?Q?0ojd7uM41ofQXoI2aS71aafb/t0KbAGOOlALeGlnM51xHZdVtVMWLZl0unC/?=
 =?us-ascii?Q?ZIsORxWfpRMiW/qMWv6LW4alM5R7FUcNFvgbgywxJdzoP2LJWrfQGfLR8pT5?=
 =?us-ascii?Q?wQ6JDmR6RNAUbGobVE+wwYdpCIGiZlGFWF167sJR?=
Content-Type: multipart/alternative;
 boundary="_000_PH0PR11MB5579C33C03603EDF80B7C96A8757APH0PR11MB5579namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5579.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39adce44-b342-437e-ea7f-08db6a8a374a
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2023 14:43:26.8357 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o/MraaAJMqT/lYHs10r0nHu7+zmXuVnreqYWLu+xzNcuhvFtIL9xZFpJD7gvNNmSu9xEIZdPGHx9i+7kBK27Ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4553
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

--_000_PH0PR11MB5579C33C03603EDF80B7C96A8757APH0PR11MB5579namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

It is impossible to pass the PAT setting when sharing the fd.

  1.  All api , include vaapi, vulkan, gl... need such extension , the impa=
ct is huge.  Even these API level accept , some middle ware , such as ffmpe=
g... also will reject it.
  2.  PAT is intel specific implementation , and MTL , LNL has different va=
lue and meanings, you could not expect application developer understand the=
 details, it should be transparent to application developer.
Thanks
Carl

From: Yang, Fei <fei.yang@intel.com>
Sent: Friday, June 9, 2023 11:13 PM
To: Andi Shyti <andi.shyti@linux.intel.com>; Zhang, Carl <carl.zhang@intel.=
com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>; Tvrtko Ursulin <tvrt=
ko.ursulin@linux.intel.com>; Chris Wilson <chris@chris-wilson.co.uk>; Roper=
, Matthew D <matthew.d.roper@intel.com>; Justen, Jordan L <jordan.l.justen@=
intel.com>; Gu, Lihao <lihao.gu@intel.com>; Intel GFX <intel-gfx@lists.free=
desktop.org>; DRI Devel <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v17 1/1] drm/i915: Allow user to set cache at BO creati=
on

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

--_000_PH0PR11MB5579C33C03603EDF80B7C96A8757APH0PR11MB5579namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@SimSun";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:734209402;
	mso-list-type:hybrid;
	mso-list-template-ids:-1110262932 67698703 67698713 67698715 67698703 6769=
8713 67698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">It is impossible to pass the PAT setting when sharin=
g the fd.
<o:p></o:p></p>
<ol style=3D"margin-top:0in" start=3D"1" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l0 level1 =
lfo1">All api , include vaapi, vulkan, gl&#8230; need such extension , the =
impact is huge. &nbsp;Even these API level accept , some middle ware , such=
 as ffmpeg&#8230; also will reject it.
<o:p></o:p></li><li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso=
-list:l0 level1 lfo1">PAT is intel specific implementation , and MTL , LNL =
has different value and meanings, you could not expect application develope=
r understand the details, it should be transparent to
 application developer. <o:p></o:p></li></ol>
<p class=3D"MsoNormal">Thanks<o:p></o:p></p>
<p class=3D"MsoNormal">Carl<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> Yang, Fei &lt;fei.yang@intel.com&gt; <b=
r>
<b>Sent:</b> Friday, June 9, 2023 11:13 PM<br>
<b>To:</b> Andi Shyti &lt;andi.shyti@linux.intel.com&gt;; Zhang, Carl &lt;c=
arl.zhang@intel.com&gt;<br>
<b>Cc:</b> Joonas Lahtinen &lt;joonas.lahtinen@linux.intel.com&gt;; Tvrtko =
Ursulin &lt;tvrtko.ursulin@linux.intel.com&gt;; Chris Wilson &lt;chris@chri=
s-wilson.co.uk&gt;; Roper, Matthew D &lt;matthew.d.roper@intel.com&gt;; Jus=
ten, Jordan L &lt;jordan.l.justen@intel.com&gt;; Gu, Lihao &lt;lihao.gu@int=
el.com&gt;;
 Intel GFX &lt;intel-gfx@lists.freedesktop.org&gt;; DRI Devel &lt;dri-devel=
@lists.freedesktop.org&gt;<br>
<b>Subject:</b> Re: [PATCH v17 1/1] drm/i915: Allow user to set cache at BO=
 creation<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&gt; Hi=
 Carl, <o:p></o:p></span></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&gt;<o:=
p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&gt;&gt=
;&gt;&gt; besides this, ask a dumb question.<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&gt;&gt=
;&gt;&gt; How we retrieve the pat_index from a shared resource though dma_b=
uf fd?<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&gt;&gt=
;&gt;&gt; maybe we need to know whether it could be CPU cached if we want m=
ap it.<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&gt;&gt=
;&gt;&gt; Of course, looks there are no real usage to access it though CPU.=
<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&gt;&gt=
;&gt;&gt; Just use it directly without any pat related options ?<o:p></o:p>=
</span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&gt;&gt=
;&gt;<o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&gt;&gt=
;&gt; I am not understanding. Do you want to ask the PAT table to the drive=
r? Are<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&gt;&gt=
;&gt; you referring to the CPU PAT index?<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&gt;&gt=
;&gt;<o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&gt;&gt=
;&gt; In any case, if I understood correctly, you don't necessarily always =
need to<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&gt;&gt=
;&gt; set the PAT options and the cache options will fall into the default =
values.<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&gt;&gt=
;&gt;<o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&gt;&gt=
;&gt; Please let me know if I haven't answered the question.<o:p></o:p></sp=
an></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&gt;&gt=
;&gt;<o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&gt;&gt=
;<o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&gt;&gt=
; If mesa create a resource , then use DRM_IOCTL_PRIME_HANDLE_TO_FD convert=
 it to a dma fd.<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&gt;&gt=
; Then share it to media, media use DRM_IOCTL_PRIME_FD_TO_HANDLE convert it=
 to a gem bo.<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&gt;&gt=
; But media does not know the PAT index , because mesa create it and set it=
.<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&gt;&gt=
; So, if media want to call DRM_IOCTL_I915_GEM_MMAP_OFFSET, media does not =
know whether it could be WB.<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&gt;<o:=
p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&gt; Th=
at's a good point. To be honest I am not really sure how this<o:p></o:p></s=
pan></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&gt; is=
 handled.<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&gt;<o:=
p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&gt; Fe=
i, Jordan? Do you have suggestion here?<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Is it p=
ossible to pass the PAT setting when sharing the fd?<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Or perh=
aps we should have kept the get_caching ioctl functional?<o:p></o:p></span>=
</p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Joonas,=
 could you chime in here?<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
</div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&gt; An=
di<o:p></o:p></span></p>
</div>
</div>
</div>
</body>
</html>

--_000_PH0PR11MB5579C33C03603EDF80B7C96A8757APH0PR11MB5579namp_--
