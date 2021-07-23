Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE1B3D3F1C
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 19:45:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F45A6F9C8;
	Fri, 23 Jul 2021 17:45:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2073.outbound.protection.outlook.com [40.107.95.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F24956F9C8;
 Fri, 23 Jul 2021 17:45:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W7MxJfA8D3q0OT504xkngauS3u0diyeWiJ/HeWfM5WG+HZ5qmpUE82oJ6jQc5lyMDiMsbS0FC8Q/aq+x+xBJC/g+/PVxTQazlni1KvPA1AwCxQBcm6A9Jblvc8X7sdJOHTFHf2TVlX6OylsiHthTeRjOZC4pEsxaiKCL3mo769c3PoPrSv8VGXJPdFE8IydZ5ILXXuIrhi3meHdgtjZVape8q9/QPl1Cei1P+oZUyeUZPNpjtXMN4tXgsvRUvItEP2TBDGRjo9FL1zAlkgVNIXUoaWc98Rvw0+zrQTLGxE3bT/7BC+qJrWuQKzUoI4MjphsimedIVlBUaDYxfzyO1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/pQ4mQksB2b8cyedjyXoiiRVp0CtQeiwbgBoMQTjK1Q=;
 b=e73fnzw+DoASu4k0wPSWWcYSQLhIWhwq6tUwUpnF+f6a1n3Rrz/3dlXwjwsf4ow0+B3VLOOUMc2maQJxA7taj9XGCEOdNOUA5TyztQIX2Hssi3dy+DWEubZOjKja/7UTfbTTtBRBaAz3rVgmSSCBq2fGR1z653XS5AlNlb1E+ceVtxRSexEjCN4Dex2Ca7x3HPD38tpXurHrY5V+VWyHoqwC3nGYm6BOtQFwDABWk+pNltzStNAYanHNNVyk4/kf/RngQoLpdSTKInLCwd+7IkR9ncskPYVQz5d1yo6JPKMaawhJhQ2P+szhYv9vWq4X62JNCgqHasAJ1CB81M2kqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/pQ4mQksB2b8cyedjyXoiiRVp0CtQeiwbgBoMQTjK1Q=;
 b=qwUwLA0eTCs0kZQIh8TPF2lh/2mq2a/1CBRqqSHoh6OhXKp/66YCgrnONpKCz3U9/0rhC+7sEsuWPQ3hb8BtAdL6vbO5RtzMxhsucJd9gppoMkj+YYaHxsrqFoqDMzeDPiNVQZvVmRfuS6YLoP3/ZwDfZO98RQVaOOjEUhGHXwE=
Received: from DM6PR12MB2841.namprd12.prod.outlook.com (2603:10b6:5:49::10) by
 DM6PR12MB2921.namprd12.prod.outlook.com (2603:10b6:5:182::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.28; Fri, 23 Jul 2021 17:45:03 +0000
Received: from DM6PR12MB2841.namprd12.prod.outlook.com
 ([fe80::553b:1fdb:ecf4:7593]) by DM6PR12MB2841.namprd12.prod.outlook.com
 ([fe80::553b:1fdb:ecf4:7593%6]) with mapi id 15.20.4331.034; Fri, 23 Jul 2021
 17:45:03 +0000
From: "Nieto, David M" <David.Nieto@amd.com>
To: Daniel Vetter <daniel@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>
Subject: Re: [RFC 6/8] drm: Document fdinfo format specification
Thread-Topic: [RFC 6/8] drm: Document fdinfo format specification
Thread-Index: AQHXeVpnxl7t4552HUWFTAYa2yF97atQ0OSAgAABQQCAAA4xAA==
Date: Fri, 23 Jul 2021 17:45:03 +0000
Message-ID: <DM6PR12MB2841BE4BD79C3CFAED57029DF4E59@DM6PR12MB2841.namprd12.prod.outlook.com>
References: <20210715091820.1613726-1-tvrtko.ursulin@linux.intel.com>
 <20210715091820.1613726-7-tvrtko.ursulin@linux.intel.com>
 <CAPj87rMxvq2c9uQ-ArvsLo2M7rXq=7LiJZ_XJwST=1VDhhNXRA@mail.gmail.com>,
 <YPryorSobmlnGT1b@phenom.ffwll.local>
In-Reply-To: <YPryorSobmlnGT1b@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=True;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-07-23T17:45:02.779Z;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD
 Official Use
 Only; MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard; 
authentication-results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d7a4ad20-70e5-47bb-8f98-08d94e0199d4
x-ms-traffictypediagnostic: DM6PR12MB2921:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB2921DB41C0DB97E635E6EF28F4E59@DM6PR12MB2921.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +sEwwp06tDAm+nbnY0hQjf92sPNA5Vu02zS4EUc0HgQJWDiAVt+t64k4vUnx3jVqe09Fsghl6J5Vx2aJW68gbxSTtLkzngQEQYn6Bo4i9/qgomxgxN9yhXjHMakeNGgaaull3jB60dCu1OU7LXijpNwoiTm70wZZWVattcUbN13K4e7mGOMoXLqGIlmk9kJ1agah0H2nyR9v1HwFpdyavGxe4+63KzlaH4CL63B7AC6/XJpEJI0D1xM+QV244HYcQqJyNaUsrXu63MoOTaFJir106CUH8bT1y59d3yE7BqgyccbF/nd5nBp08vsx8ALylC3FF3Ndq9vjnEcFavCb0W9i5bJlFbwqDS4VJ4lhAn3y2gpXxS9odjTyY2mqef8J+SZc6tX2Jq5hJNaxEwbUtpHehyPWHdlSuinl/LVTDke9Gqkt2XAGGdKsFaSgI9uYzUM9nWvCEXftJUT/DHFH8ETiBo9cdcaYRg3Fr1y5IVHN+HsjtqGQ0YMvypv5ldrwwB3zdHaX6SZMWkupqqT/r1axO0rUDkofeu2DE3Ha77yPNUhXowqmJuZByET3vJcekO7Lz7wqQLZ2IkYnp3G7VE7iGFhXckZetQG5Sngs/1s27seQ050Gv2YWpTsciUFPBrD+/1NwNC57N2qWpwfgO9EVbzSgPpbms0MIBEJ7d1g42DYhrWmJb8ZfPDUu/05ZSOJOcGYng7kCd1Xaw6ZYZ0tNPan9zS1cNObriL+mNA8wJrhF7FNwocCYUSSGlIvPwoJ7EGg2DYCf96kjHBY+JqqIA57gtohGcKxQXiUOoiE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2841.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(55016002)(76116006)(6506007)(966005)(66946007)(122000001)(86362001)(53546011)(7696005)(19627405001)(45080400002)(66476007)(83380400001)(166002)(71200400001)(66556008)(4326008)(508600001)(316002)(8936002)(52536014)(66446008)(54906003)(38100700002)(110136005)(9686003)(5660300002)(64756008)(26005)(8676002)(2906002)(186003)(33656002)(38070700004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?32rioRYFCmDk0JADqk5PvshbrOV9sRsxBUhbOxZcNZFBuAKkXNP2umVzUSWS?=
 =?us-ascii?Q?q8bC7SpphWIUc294lAlP1Iey03xDOV/wpznZhVEYwPYoD8dkSaevkhSo9nIH?=
 =?us-ascii?Q?5QzTTwM9CrLxn3VUqEc3khz8d/BCarxGWXc0PMeq7KFugjT/WhCyGtk1vAjE?=
 =?us-ascii?Q?eJWgpjjZS7ijLA9caekFMmAEmh39DSil+sKiNvr2DRy3RF4PcgU7dsrUCiSU?=
 =?us-ascii?Q?6fUMI4ox7Rot2MhTTlnucszY4uzqK7NT4wkBamxHNx8JqvZ+4ZRf5Q8d60WC?=
 =?us-ascii?Q?aartOlYGHgqnSH68snubbcDX97lKNu8ROulpVO/oCL07YMRGXzxkdn8mZOrD?=
 =?us-ascii?Q?bhw+yL5l7bWYuIXppKclhXcShICHFV+lzMzlW70lzxrIMD5h6NF7igH2hytl?=
 =?us-ascii?Q?4UMcSeJk/cPUKECeR8+CZBYJS3yLVeDLOm84GRviGwKTBvf/Y4dXeVz6qw8D?=
 =?us-ascii?Q?i/k3UIUqFK0Mm6jhBJIrpI+1Q0C5Fh3NoUZbEMR9fvgykhPVu6BbVdKngMh5?=
 =?us-ascii?Q?c0Oox3DvsU/RDg1ma+SgpTM+F7RQIYAA3uLVLTbaYKhGH0aBuvghsPYh1P/9?=
 =?us-ascii?Q?H82gmH0pS3/17BZxXfSSyjKSTHwXuhXN6HER3wfbIGO3YPF3/wJisFYIcICT?=
 =?us-ascii?Q?iTfwIRrnYMV5FbOYzMd382yVrzfq90bcVfPLVdd9cz8gM6yk+IcII1SeYGuI?=
 =?us-ascii?Q?ZgZhUmZHPEx2NuOww96ys6Wcx1S0+ZYmo+Eid7VqEF53QGZQh/wNKUR58fKz?=
 =?us-ascii?Q?KMjMpz7xx/OyC5DHHSZFAhVkuLE1sJOJynbaHMGRrv1gRzBPrcNxG6TlE4/b?=
 =?us-ascii?Q?65AAsijq5AKrMSUeMyctQpwO6vQnAJamvlzfeAqMHfak9umhhnj1FDa9cMkM?=
 =?us-ascii?Q?AhTkOyp4EmHcI3fN4eDpOpKRhk7v9nvTxHUSGsZco9HYtlSuyTJ1F3cKi6zP?=
 =?us-ascii?Q?3lhyZTeaZl8BGncKACFwDQXYZ62BMhUcoGPXDIU3fv+IRrGd8bEZVMD+QA06?=
 =?us-ascii?Q?fxI6Xvq4BpBdv3NITsf6O4JyKwxc1ighign6smGYBFrKDaPLCn1nUNNbelDb?=
 =?us-ascii?Q?QmgRFRHjKbNEOLXCu4Jl5DLIv3ULbFEZijUO2lLnfbR1kutVoebw/iyzCMoL?=
 =?us-ascii?Q?adRdjrriarOeccIKc8Uhx4AnDfoh2rFZWEszRnB+Rh69Xx3GdwuNwrbi8tTt?=
 =?us-ascii?Q?SOpo5RoSQaq5T2iCwx4ZoxCap/ewiRsWcPTzaXQPhujcX2ahEtovX4YVt/IW?=
 =?us-ascii?Q?9Q1yt/tkmgnGQuimhltgwQaB3iIVpU3lF8Fwg0MvVKQbBfe4+hga6NUsG+3y?=
 =?us-ascii?Q?kgI=3D?=
Content-Type: multipart/alternative;
 boundary="_000_DM6PR12MB2841BE4BD79C3CFAED57029DF4E59DM6PR12MB2841namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2841.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7a4ad20-70e5-47bb-8f98-08d94e0199d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2021 17:45:03.1594 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9zekkaJiEofAMTpyvdzZ9WFpNg3uD1OmWoDic6ysicTHQQVyHDqOir4ebsAY/jSt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2921
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx <Intel-gfx@lists.freedesktop.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_DM6PR12MB2841BE4BD79C3CFAED57029DF4E59DM6PR12MB2841namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only]

I just want to make a comment that with this approach (the ns) calculating =
the percentage will take at least two reads of the fdinfo per pid over some=
 time. Some engines may be able to provide a single shot percentage usage o=
ver an internal integration period. That is, for example, what we currently=
 have implemented for that exact reason.

I'd like to propose that we add an optional set of fields for this. Also, I=
 may have missed a message, but why did we remove the timstamp? It is neede=
d for accurate measurements of engine usage.

David
________________________________
From: Daniel Vetter <daniel@ffwll.ch>
Sent: Friday, July 23, 2021 9:47 AM
To: Daniel Stone <daniel@fooishbar.org>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>; intel-gfx <Intel-gfx@l=
ists.freedesktop.org>; Tvrtko Ursulin <tvrtko.ursulin@intel.com>; Koenig, C=
hristian <Christian.Koenig@amd.com>; dri-devel <dri-devel@lists.freedesktop=
.org>; Nieto, David M <David.Nieto@amd.com>
Subject: Re: [RFC 6/8] drm: Document fdinfo format specification

On Fri, Jul 23, 2021 at 05:43:01PM +0100, Daniel Stone wrote:
> Hi Tvrtko,
> Thanks for typing this up!
>
> On Thu, 15 Jul 2021 at 10:18, Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
> > +Mandatory fully standardised keys
> > +---------------------------------
> > +
> > +- drm-driver: <str>
> > +
> > +String shall contain a fixed string uniquely identified the driver han=
dling
> > +the device in question. For example name of the respective kernel modu=
le.
>
> I think let's be more prescriptive and just say that it is the module nam=
e.

Just a quick comment on this one.

drm_driver.name is already uapi, so let's please not invent a new one. The
shared code should probably make sure drivers don't get this wrong. Maybe
good if we document the getverion ioctl, which also exposes this, and then
link between the two.
-Daniel

>
> > +Optional fully standardised keys
> > +--------------------------------
> > +
> > +- drm-pdev: <aaaa:bb.cc.d>
> > +
> > +For PCI devices this should contain the PCI slot address of the device=
 in
> > +question.
>
> How about just major:minor of the DRM render node device it's attached to=
?
>
> > +- drm-client-id: <uint>
> > +
> > +Unique value relating to the open DRM file descriptor used to distingu=
ish
> > +duplicated and shared file descriptors. Conceptually the value should =
map 1:1
> > +to the in kernel representation of `struct drm_file` instances.
> > +
> > +Uniqueness of the value shall be either globally unique, or unique wit=
hin the
> > +scope of each device, in which case `drm-pdev` shall be present as wel=
l.
> > +
> > +Userspace should make sure to not double account any usage statistics =
by using
> > +the above described criteria in order to associate data to individual =
clients.
> > +
> > +- drm-engine-<str>: <uint> ns
> > +
> > +GPUs usually contain multiple execution engines. Each shall be given a=
 stable
> > +and unique name (str), with possible values documented in the driver s=
pecific
> > +documentation.
> > +
> > +Value shall be in specified time units which the respective GPU engine=
 spent
> > +busy executing workloads belonging to this client.
> > +
> > +Values are not required to be constantly monotonic if it makes the dri=
ver
> > +implementation easier, but are required to catch up with the previousl=
y reported
> > +larger value within a reasonable period. Upon observing a value lower =
than what
> > +was previously read, userspace is expected to stay with that larger pr=
evious
> > +value until a monotonic update is seen.
>
> Yeah, that would work well for Mali/Panfrost. We can queue multiple
> jobs in the hardware, which can either be striped across multiple
> cores with an affinity mask (e.g. 3 cores for your client and 1 for
> your compositor), or picked according to priority, or ...
>
> The fine-grained performance counters (e.g. time spent waiting for
> sampler) are only GPU-global. So if you have two jobs running
> simultaneously, you have no idea who's responsible for what.
>
> But it does give us coarse-grained counters which are accounted
> per-job-slot, including exactly this metric: amount of 'GPU time'
> (whatever that means) occupied by that job slot during the sampling
> period. So we could support that nicely if we fenced job-slot updates
> with register reads/writes.
>
> Something I'm missing though is how we enable this information. Seems
> like it would be best to either only do it whilst fdinfo is open (and
> re-read it whenever you need an update), or on a per-driver sysfs
> toggle, or ... ?
>
> > +- drm-memory-<str>: <uint> [KiB|MiB]
> > +
> > +Each possible memory type which can be used to store buffer objects by=
 the
> > +GPU in question shall be given a stable and unique name to be returned=
 as the
> > +string here.
> > +
> > +Value shall reflect the amount of storage currently consumed by the bu=
ffer
> > +object belong to this client, in the respective memory region.
> > +
> > +Default unit shall be bytes with optional unit specifiers of 'KiB' or =
'MiB'
> > +indicating kibi- or mebi-bytes.
>
> I'm a bit wary of the accounting here. Is it buffer allocations
> originating from the client, in which case it conceptually clashes
> with gralloc? Is it the client which last wrote to the buffer? The
> client with the oldest open handle to the buffer? Other?
>
> Cheers,
> Daniel

--
Daniel Vetter
Software Engineer, Intel Corporation
https://nam11.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fblog.ffw=
ll.ch%2F&amp;data=3D04%7C01%7CDavid.Nieto%40amd.com%7Cda2d9f95ced44d09f66c0=
8d94df991da%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637626556571460650=
%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haW=
wiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DGrjAYg9tG2QX7z4BDaqa4wMPj2nFcvGo4xCmD8O=
zwNE%3D&amp;reserved=3D0

--_000_DM6PR12MB2841BE4BD79C3CFAED57029DF4E59DM6PR12MB2841namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<p style=3D"font-family:Arial;font-size:10pt;color:#0000FF;margin:5pt;" ali=
gn=3D"Left">
[AMD Official Use Only]<br>
</p>
<br>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
I just want to make a comment that with this approach (the ns) calculating =
the percentage will take at least two reads of the fdinfo per pid over some=
 time. Some engines may be able to provide a single shot percentage usage o=
ver an internal integration period.
 That is, for example, what we currently have implemented for that exact re=
ason.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
I'd like to propose that we add an optional set of fields for this. Also, I=
 may have missed a message, but why did we remove the timstamp? It is neede=
d for accurate measurements of engine usage.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
David</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Daniel Vetter &lt;dan=
iel@ffwll.ch&gt;<br>
<b>Sent:</b> Friday, July 23, 2021 9:47 AM<br>
<b>To:</b> Daniel Stone &lt;daniel@fooishbar.org&gt;<br>
<b>Cc:</b> Tvrtko Ursulin &lt;tvrtko.ursulin@linux.intel.com&gt;; intel-gfx=
 &lt;Intel-gfx@lists.freedesktop.org&gt;; Tvrtko Ursulin &lt;tvrtko.ursulin=
@intel.com&gt;; Koenig, Christian &lt;Christian.Koenig@amd.com&gt;; dri-dev=
el &lt;dri-devel@lists.freedesktop.org&gt;; Nieto, David M &lt;David.Nieto@=
amd.com&gt;<br>
<b>Subject:</b> Re: [RFC 6/8] drm: Document fdinfo format specification</fo=
nt>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Fri, Jul 23, 2021 at 05:43:01PM +0100, Daniel S=
tone wrote:<br>
&gt; Hi Tvrtko,<br>
&gt; Thanks for typing this up!<br>
&gt; <br>
&gt; On Thu, 15 Jul 2021 at 10:18, Tvrtko Ursulin<br>
&gt; &lt;tvrtko.ursulin@linux.intel.com&gt; wrote:<br>
&gt; &gt; +Mandatory fully standardised keys<br>
&gt; &gt; +---------------------------------<br>
&gt; &gt; +<br>
&gt; &gt; +- drm-driver: &lt;str&gt;<br>
&gt; &gt; +<br>
&gt; &gt; +String shall contain a fixed string uniquely identified the driv=
er handling<br>
&gt; &gt; +the device in question. For example name of the respective kerne=
l module.<br>
&gt; <br>
&gt; I think let's be more prescriptive and just say that it is the module =
name.<br>
<br>
Just a quick comment on this one.<br>
<br>
drm_driver.name is already uapi, so let's please not invent a new one. The<=
br>
shared code should probably make sure drivers don't get this wrong. Maybe<b=
r>
good if we document the getverion ioctl, which also exposes this, and then<=
br>
link between the two.<br>
-Daniel<br>
<br>
&gt; <br>
&gt; &gt; +Optional fully standardised keys<br>
&gt; &gt; +--------------------------------<br>
&gt; &gt; +<br>
&gt; &gt; +- drm-pdev: &lt;aaaa:bb.cc.d&gt;<br>
&gt; &gt; +<br>
&gt; &gt; +For PCI devices this should contain the PCI slot address of the =
device in<br>
&gt; &gt; +question.<br>
&gt; <br>
&gt; How about just major:minor of the DRM render node device it's attached=
 to?<br>
&gt; <br>
&gt; &gt; +- drm-client-id: &lt;uint&gt;<br>
&gt; &gt; +<br>
&gt; &gt; +Unique value relating to the open DRM file descriptor used to di=
stinguish<br>
&gt; &gt; +duplicated and shared file descriptors. Conceptually the value s=
hould map 1:1<br>
&gt; &gt; +to the in kernel representation of `struct drm_file` instances.<=
br>
&gt; &gt; +<br>
&gt; &gt; +Uniqueness of the value shall be either globally unique, or uniq=
ue within the<br>
&gt; &gt; +scope of each device, in which case `drm-pdev` shall be present =
as well.<br>
&gt; &gt; +<br>
&gt; &gt; +Userspace should make sure to not double account any usage stati=
stics by using<br>
&gt; &gt; +the above described criteria in order to associate data to indiv=
idual clients.<br>
&gt; &gt; +<br>
&gt; &gt; +- drm-engine-&lt;str&gt;: &lt;uint&gt; ns<br>
&gt; &gt; +<br>
&gt; &gt; +GPUs usually contain multiple execution engines. Each shall be g=
iven a stable<br>
&gt; &gt; +and unique name (str), with possible values documented in the dr=
iver specific<br>
&gt; &gt; +documentation.<br>
&gt; &gt; +<br>
&gt; &gt; +Value shall be in specified time units which the respective GPU =
engine spent<br>
&gt; &gt; +busy executing workloads belonging to this client.<br>
&gt; &gt; +<br>
&gt; &gt; +Values are not required to be constantly monotonic if it makes t=
he driver<br>
&gt; &gt; +implementation easier, but are required to catch up with the pre=
viously reported<br>
&gt; &gt; +larger value within a reasonable period. Upon observing a value =
lower than what<br>
&gt; &gt; +was previously read, userspace is expected to stay with that lar=
ger previous<br>
&gt; &gt; +value until a monotonic update is seen.<br>
&gt; <br>
&gt; Yeah, that would work well for Mali/Panfrost. We can queue multiple<br=
>
&gt; jobs in the hardware, which can either be striped across multiple<br>
&gt; cores with an affinity mask (e.g. 3 cores for your client and 1 for<br=
>
&gt; your compositor), or picked according to priority, or ...<br>
&gt; <br>
&gt; The fine-grained performance counters (e.g. time spent waiting for<br>
&gt; sampler) are only GPU-global. So if you have two jobs running<br>
&gt; simultaneously, you have no idea who's responsible for what.<br>
&gt; <br>
&gt; But it does give us coarse-grained counters which are accounted<br>
&gt; per-job-slot, including exactly this metric: amount of 'GPU time'<br>
&gt; (whatever that means) occupied by that job slot during the sampling<br=
>
&gt; period. So we could support that nicely if we fenced job-slot updates<=
br>
&gt; with register reads/writes.<br>
&gt; <br>
&gt; Something I'm missing though is how we enable this information. Seems<=
br>
&gt; like it would be best to either only do it whilst fdinfo is open (and<=
br>
&gt; re-read it whenever you need an update), or on a per-driver sysfs<br>
&gt; toggle, or ... ?<br>
&gt; <br>
&gt; &gt; +- drm-memory-&lt;str&gt;: &lt;uint&gt; [KiB|MiB]<br>
&gt; &gt; +<br>
&gt; &gt; +Each possible memory type which can be used to store buffer obje=
cts by the<br>
&gt; &gt; +GPU in question shall be given a stable and unique name to be re=
turned as the<br>
&gt; &gt; +string here.<br>
&gt; &gt; +<br>
&gt; &gt; +Value shall reflect the amount of storage currently consumed by =
the buffer<br>
&gt; &gt; +object belong to this client, in the respective memory region.<b=
r>
&gt; &gt; +<br>
&gt; &gt; +Default unit shall be bytes with optional unit specifiers of 'Ki=
B' or 'MiB'<br>
&gt; &gt; +indicating kibi- or mebi-bytes.<br>
&gt; <br>
&gt; I'm a bit wary of the accounting here. Is it buffer allocations<br>
&gt; originating from the client, in which case it conceptually clashes<br>
&gt; with gralloc? Is it the client which last wrote to the buffer? The<br>
&gt; client with the oldest open handle to the buffer? Other?<br>
&gt; <br>
&gt; Cheers,<br>
&gt; Daniel<br>
<br>
-- <br>
Daniel Vetter<br>
Software Engineer, Intel Corporation<br>
<a href=3D"https://nam11.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F=
%2Fblog.ffwll.ch%2F&amp;amp;data=3D04%7C01%7CDavid.Nieto%40amd.com%7Cda2d9f=
95ced44d09f66c08d94df991da%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637=
626556571460650%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzI=
iLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DGrjAYg9tG2QX7z4BDaqa=
4wMPj2nFcvGo4xCmD8OzwNE%3D&amp;amp;reserved=3D0">https://nam11.safelinks.pr=
otection.outlook.com/?url=3Dhttp%3A%2F%2Fblog.ffwll.ch%2F&amp;amp;data=3D04=
%7C01%7CDavid.Nieto%40amd.com%7Cda2d9f95ced44d09f66c08d94df991da%7C3dd8961f=
e4884e608e11a82d994e183d%7C0%7C0%7C637626556571460650%7CUnknown%7CTWFpbGZsb=
3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C100=
0&amp;amp;sdata=3DGrjAYg9tG2QX7z4BDaqa4wMPj2nFcvGo4xCmD8OzwNE%3D&amp;amp;re=
served=3D0</a><br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_DM6PR12MB2841BE4BD79C3CFAED57029DF4E59DM6PR12MB2841namp_--
