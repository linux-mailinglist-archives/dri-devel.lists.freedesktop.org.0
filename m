Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AEBB3FE8E7
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 07:52:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BDE16E430;
	Thu,  2 Sep 2021 05:52:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2054.outbound.protection.outlook.com [40.107.237.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43D506E427;
 Thu,  2 Sep 2021 05:52:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lBulqdNjs8H4Wawpe1bjWZTLrplGvr4IGniuAkgg51DULvJxQA00oH9armPRG3VrqOjIqbPqCf8SgVTWwCwb7xgEVZHvZ0jBuaMFPcbrY0vFhUY163SlllQq5jcxrI8DQ0B+Nz6/ii+pBihwyimAE5lq4BEJ/BLy4P2d9kCCXEPCQKqfa2sO3mwGOZUuQvVREMquz5yrS5KDUbAZVynRNboU6NCVHSuqI2zZuXRVAHcUqyElpD3s0aakFHSSzOco2MHpNvPi/1zsYW23//DszlO3I1qF/djl4SRfPaX5lJTVTs5xBN8XEXqTiIvqRXgbAvKA4CfHtxqJpIJBbAIsSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=QuzHuplB7cOpP9P3yLw4KF5BPT6z40r1TVcsKIqdqWE=;
 b=c8504OuY270ESAAebC/IVjHYC1g46/Ix3S8zn4yJfeQmxTTvgYgwYrhS2Eg8ItoRA0rN0ySjJ45VitPMrvu7ZFi35HN9oIewl8cdxa9IChOgk7Ccw3w9p9AIRHA5/ITVefCdz+gN0W7YoevGd7cK1SC8ffbENegrOl++N7R6nx40IUJ0mZqO5a+l/pHHlTnf3KjGGksdtWE6nltW5HyuupLuw2+H3IoZbThfSAlw51hHUeyud0J1BAecZfpoEZdIzgCQoOfwyDXp5zILMJIH8lkcUTpiHESqLRUoR+4fC7TRR+vCNIcEz0bjy2GOKP1ILXj9/whbUAJQXlBLXBbt3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QuzHuplB7cOpP9P3yLw4KF5BPT6z40r1TVcsKIqdqWE=;
 b=vT8DLZpAC6WDGu7GIf6bEGCuAw1MUUUuLtVj56fWUJ7C31awwiXl9aVhyaLsIPBPv3chmrUlYYv50GCpXn8Vfc2BRsObHmwauUtVhSTAR8rSdImHrKEhyD2sTzYNUjYlVG/JwURKrQ4E7ZdxNuBbacsEog50BZN4OjUIyWngSMI=
Received: from BL1PR12MB5269.namprd12.prod.outlook.com (2603:10b6:208:30b::20)
 by BL1PR12MB5143.namprd12.prod.outlook.com (2603:10b6:208:31b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.20; Thu, 2 Sep
 2021 05:52:36 +0000
Received: from BL1PR12MB5269.namprd12.prod.outlook.com
 ([fe80::acc6:c407:1353:6a]) by BL1PR12MB5269.namprd12.prod.outlook.com
 ([fe80::acc6:c407:1353:6a%5]) with mapi id 15.20.4457.024; Thu, 2 Sep 2021
 05:52:36 +0000
From: "Liu, Monk" <Monk.Liu@amd.com>
To: Dave Airlie <airlied@gmail.com>, Alex Deucher <alexdeucher@gmail.com>
CC: Daniel Vetter <daniel@ffwll.ch>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>, 
 "Chen, JingWen" <JingWen.Chen2@amd.com>, DRI Development
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [diagnostic TDR mode patches] unify our solution
 opinions/suggestions in one thread
Thread-Topic: [diagnostic TDR mode patches] unify our solution
 opinions/suggestions in one thread
Thread-Index: Adeezw8WIoeNdpdaSO6/zguUPH+5CgAOtiEAAAQJJ3AACrFwAAAHXqOAABa9MsA=
Date: Thu, 2 Sep 2021 05:52:36 +0000
Message-ID: <BL1PR12MB5269F6B279EDE278C8FDF90A84CE9@BL1PR12MB5269.namprd12.prod.outlook.com>
References: <BL1PR12MB526942160701B46D4B28EEEC84CD9@BL1PR12MB5269.namprd12.prod.outlook.com>
 <CAKMK7uHKX0rSVk_yBPo_KAEJ-UeLk5UxQ2kBdv+FD2j9zAjfZA@mail.gmail.com>
 <BL1PR12MB5269B303372A6251EDD1DC2C84CD9@BL1PR12MB5269.namprd12.prod.outlook.com>
 <CADnq5_PUvgt9Cv2L3G4GGBJv_WBhtOp8DN+3WMvoES_80UMKfQ@mail.gmail.com>
 <CAPM=9tz-66nXR8gbMucsBo5Q1VJ5AsrVZh4pF0r0WfFi7CQtzg@mail.gmail.com>
In-Reply-To: <CAPM=9tz-66nXR8gbMucsBo5Q1VJ5AsrVZh4pF0r0WfFi7CQtzg@mail.gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-09-02T05:52:34Z; 
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD Official Use
 Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=1c4fe5e4-b6cc-4bda-94f9-0a53063e6edf;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=1
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0ac698dc-c736-4495-f3a1-08d96dd5dde7
x-ms-traffictypediagnostic: BL1PR12MB5143:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL1PR12MB514362446584D5B2E31F4C7484CE9@BL1PR12MB5143.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: szqMK719dK8NzYcF1xOMmgjzwJO5tKn6jDohHsPuqe47836rH6tRdQ+/5sHatB5XtZNu1SVeQ4tmRFyQvJUH88KPr9e3P5sG6OsRpQDxuIQOL6Nwfs4J+UchK24a1i20N8dE3Qd3wNk0TT5kdQWxU3UN+VpsPP0C10ultxp7iL1dBdzfOJRHrhhOlJTHb3+LX8GjAvoBikvzYgTqzGF5YTrvFbbeWRWvoN3n7pxoEpTEBsl8nf/WwaHe/qaLObhRgu5pPBI+Uavjt6zE/sxxEgi7lmFvJDmafh9ckOjYcys84ou4XS+I8rPPMrK4DS2PoaSRpUSPAZ3fZ0rpqASlS7wY2Zq2FY2sCqHoUCJMjFACWOTKpo4DetMSzImrAhBj84BF4qhl4PyKhuOa6LLm4CJBlcK/YGTNwBhEfDRVScx5jjFUOQ86ieuBZd1HRcaAULvw5nndg5dkMi/Q6ZYM7eV1Y6/o5WLJ2vl26dC8rbdTXFw0uwh456RYFjoYiQE3MRej1ipsaemMBjTP7dzOBWIKcNQmeYt5wk/JUHDyhptX7twPV8v/qrJbMRiK26d1diL5BIpfSFl7TdmsOqrvhQqlebs49CYXf/OGLfdX5mXPf97+kdINrO8LLlAGRpFdbRLMsPCk4F7kVfWFEwlULAv0Wb+MSAB2kKTjIrCqMRWoVG34iQdJitnuDczZ72Y0Z66PVdpNvv4Y1mD0De5AdoOFYdDrbRorMPG91qLjEVYLgLuoJIO8cAPjmrFcUbVvg7lDc6yio9qB4zVplDAcIDVwjbz+dDIDX4H3T9+4tvA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5269.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(136003)(396003)(376002)(346002)(5660300002)(8676002)(9686003)(186003)(52536014)(83380400001)(26005)(7696005)(66446008)(53546011)(76116006)(64756008)(66556008)(66476007)(66946007)(6506007)(71200400001)(316002)(55016002)(110136005)(54906003)(86362001)(33656002)(966005)(4326008)(2906002)(122000001)(38100700002)(38070700005)(45080400002)(478600001)(8936002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?aMPunBx+UbztSi2sZfwSzI20P566bsx744K+nKbw7auaUxs96HNk5P4N6I3u?=
 =?us-ascii?Q?bytQphfxiqrqWGDFEPXrcCjlGQSPxEpXCnQHWmRyj/RxDT0q7Qt7zMAPt1Jr?=
 =?us-ascii?Q?hovFqBh0RSE9ODtwjOPp3GwKkhomwCLh8PEv9Geyl8lWMKlKELjg/xTOg9U2?=
 =?us-ascii?Q?klpy/Aq62KZY+OzQAOKq/eoQoL4m5rc3Zc1yAlvqvUhdzs3JYPfR5IuaO/qp?=
 =?us-ascii?Q?Bx5Gdoz1pdL2cgPF30h2xKdO3S7gZaH4gie2X/bQ2DfRP6XBLsNLr3R+uunh?=
 =?us-ascii?Q?gTNDkOx7AvdgStJQdXQbf3sWc3hyhG1aPky9QTGKx6RtOWFnS6xJPhe2PsUr?=
 =?us-ascii?Q?M1T8ab/ErxLa6HKa+GumQbuCds9+gitKN5EL9Csu6KY38bWozAGTHOqYy0/A?=
 =?us-ascii?Q?9sAiq1DKM1DKnmUaIbNBBCvwokEMOLakTk6OFMKS3SdaNVa7/ETxusi64KJx?=
 =?us-ascii?Q?6uQNk28rh/g2aL9ibQsypW9sV9GSWs/KvVWecoB0Ovz5J34hG3/jgqKsB+Mk?=
 =?us-ascii?Q?7rFs9t5u5yDCg5TdeqZubb2nqIyWwMkjddPPDWTMvjSL6jOroLUEdxk/SGM5?=
 =?us-ascii?Q?RtWikEr0BKjNau0WRUmb6WJ7h0/PO9zDSepIQqTugQ8eVx/vrYHPfTHNmuWx?=
 =?us-ascii?Q?tZ6VYYKpGNCX8YGDKkG1/0DSucRYwGYUTd4QEYC/dJ6pXfZ/bKaE1qXO9X9J?=
 =?us-ascii?Q?NPuSMchmkUndz+jQwKfIvJlJYXh0ADjPmNacnGQm+mjUHZyG/b+Gp0hY6ZYV?=
 =?us-ascii?Q?yhpdVSeSK0O4QuYiWzhNLAduFQf0BtngmbYNXQUlazG+jLTqI0mva2ayayg9?=
 =?us-ascii?Q?n7xL0Hf3yxCx90QXgGNNdEreWXRdExPeH9LgAWx6H2lUwXrPPKWL0auRaffl?=
 =?us-ascii?Q?O4dSugUFJ7Jw9rOYGlBErBgvM4t/N/6QH9MWAXm9wxc+SqXvXABDilO5YMna?=
 =?us-ascii?Q?TmPLh5P06h/p0NpSjMO7g8wmrwuqKGVAwOQl+xXb6irbv4hVmdSq8TjaKLZm?=
 =?us-ascii?Q?98ZCzD3U3olJIO6yWLRbDlGHHTSaqVBXjYCPmsKuegU2FWa884sI56e2K/xS?=
 =?us-ascii?Q?VYN2Vf7xpxdxgFf7B6sWn4ckPE/A5cpwoS9fldkOUjxmut2QEmewYX+iYimb?=
 =?us-ascii?Q?XcGPaj4UhDrcqnGblX07g8x7oILMJqlN+m/Xzt5W/1ZxEIwR5pGTw4R0C1RZ?=
 =?us-ascii?Q?NQI0rAldntz0xUy9o/obeVZNzzxN7Iu5jlMnPblZvifC8G3pWZe5EgS6cy7Z?=
 =?us-ascii?Q?QfPOtc7p/0glS6bcXqsyn+fXc6rhxtOm90d2DN1WuZrozfZI2UK0d154P4Gu?=
 =?us-ascii?Q?gjmcXuVYb44kdtvuEm4swokO?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5269.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ac698dc-c736-4495-f3a1-08d96dd5dde7
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2021 05:52:36.6410 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IH2XQW56Mx02YKHB2uE6tPeAKLvwkiW8Px7GTU0tPndEYvjADbrXTV6HxSU5M86f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5143
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

[AMD Official Use Only]

>>>
I'm not sure I can add much to help this along, I'm sure Alex has some inte=
rnal training,
Once your driver is upstream, it belongs to upstream, you can maintain it, =
but you no longer control it 100%, it's a tradeoff, it's not one companies =
always understand.
Usually people are fine developing away internally, but once interaction wi=
th other parts of the kernel/subsystem is required they have the realisatio=
n that they needed to work upstream 6 months earlier.
The best time to interact with upstream was 6 months ago, the second best t=
ime is now.
<<<

Daniel/AlexD

I didn't mean your changes on AMD driver need my personal approval or revie=
w ... and  I'm totally already get used that our driver is not 100% under c=
ontrol by AMDers,=20
but supposedly any one from community (including you) who tend to change AM=
D's driver need at least to get approvement from someone in AMD, e.g.: Alex=
D or Christian, doesn't that reasonable?
just like we need your approve if we try to modify DRM-sched, or need panfr=
ost's approval if we need to change panfrost code ...

by only CC AMD's engineers looks not quite properly, how do you know if you=
r changes (on AMD code part) are conflicting with AMD's on-going internal f=
eatures/refactoring or not ?

Thanks=20

------------------------------------------
Monk Liu | Cloud-GPU Core team
------------------------------------------

-----Original Message-----
From: Dave Airlie <airlied@gmail.com>=20
Sent: Thursday, September 2, 2021 2:51 AM
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Liu, Monk <Monk.Liu@amd.com>; Daniel Vetter <daniel@ffwll.ch>; Koenig, =
Christian <Christian.Koenig@amd.com>; Grodzovsky, Andrey <Andrey.Grodzovsky=
@amd.com>; Chen, JingWen <JingWen.Chen2@amd.com>; DRI Development <dri-deve=
l@lists.freedesktop.org>; amd-gfx@lists.freedesktop.org
Subject: Re: [diagnostic TDR mode patches] unify our solution opinions/sugg=
estions in one thread

On Thu, 2 Sept 2021 at 01:20, Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Wed, Sep 1, 2021 at 6:19 AM Liu, Monk <Monk.Liu@amd.com> wrote:
> >
> > [AMD Official Use Only]
> >
> > Daniel
> >
> > From the link you share it looks you(or someone else) have quite a bunc=
h patches that changes DRM_SCHED or even amdgpu, by that case before they a=
re merged to kernel tree I'm wondering if any AMD develop reviewed them ?
> >
> > They looks to me somehow conflicting with what we changed in our repo..=
..
> >
> > It is really a chaos for AMDer if someone else out side of AMD changes =
our kernel driver (or/and scheduler) without reviewed by AMDer, just like w=
e are requiring your review if we tend to change scheduler's logic here ...=
.
> >
> > This one changes AMD's code:=20
> > https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flo
> > re.kernel.org%2Fdri-devel%2F20210625133327.2598825-2-boris.brezillon
> > %40collabora.com%2F&amp;data=3D04%7C01%7CMonk.Liu%40amd.com%7C6c507d18
> > d65341ef53bb08d96d7976e6%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%
> > 7C637661190727875969%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJ
> > QIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DBWJSkKN
> > y2%2BwjxbQrfxGPzuJ5PBpBwB4aV0ZH6QoJGEg%3D&amp;reserved=3D0
> > And I didn't see any reviewed-by from AMDers ...
> >
> > This one also touches AMD's code:=20
> > https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flo
> > re.kernel.org%2Fdri-devel%2F20200604081224.863494-12-daniel.vetter%4
> > 0ffwll.ch%2F&amp;data=3D04%7C01%7CMonk.Liu%40amd.com%7C6c507d18d65341e
> > f53bb08d96d7976e6%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C63766
> > 1190727885929%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2
> > luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D%2F8vIVXCWjHkM
> > 56pcYI9EvuzhbsZhV9WczkKaBJE67KQ%3D&amp;reserved=3D0
> > Which is conflicting with one patch we submitted (in our repo=20
> > rightnow), and neither see AMDder gave a review-by on this one (let=20
> > me know if I missed it)
> >
>
> Monk, this is not how upstream works.  You need to participate.
> That's how communities work.  There's a reason all these discussions=20
> happen on public mailing lists.  The patch author can't be expected to=20
> know every person on every vendor team to CC with a patch.  If you=20
> have concerns, you need to raise them when the patches are being=20
> discussed.
>

I'm not sure I can add much to help this along, I'm sure Alex has some inte=
rnal training,

Once your driver is upstream, it belongs to upstream, you can maintain it, =
but you no longer control it 100%, it's a tradeoff, it's not one companies =
always understand.

Usually people are fine developing away internally, but once interaction wi=
th other parts of the kernel/subsystem is required they have the realisatio=
n that they needed to work upstream 6 months earlier.

The best time to interact with upstream was 6 months ago, the second best t=
ime is now.

Dave.
