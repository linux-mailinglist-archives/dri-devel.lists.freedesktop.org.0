Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1238640166C
	for <lists+dri-devel@lfdr.de>; Mon,  6 Sep 2021 08:37:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB57E897E3;
	Mon,  6 Sep 2021 06:36:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2074.outbound.protection.outlook.com [40.107.220.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFE83897E3;
 Mon,  6 Sep 2021 06:36:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J5E26iWrUSrYZs4Dp+2f16dHo6tO8DChvRSBnXunCLndSOkpTs2U6zlccsD6HjfyFdKUovobJXxu3+gtSsdSyhrJ7C4gZguaYk8a8yutBujwyZ9McxuybH9zgyTB0vrp2E/4W2QhzUxSmDMeN+3wd+YMcZ0yX6B3Q4RY3hTYkqZRE05Ec3ihSV40KugMmFMkS1hAqM40QguQHoxGnrPAc/+sLFYCyyaHfjFqq+IkfwcAD4YZJRB33TOGt9fgvW/WonV+YVMVOgVblwpcXRRgxiDs3D4oHcyLTYjQ2zmXMrxFl/xXkPeELXoChY43ZdywpmtxbO6k5FlTnWjzdFbP6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=xYEZpD1VBho6H29aNQbp0vi2orQo2vp6QWOIYmeSZ/I=;
 b=U4kajlglSnFE1Kxl5OzuF28JL7cE7l1wd1OS4gw5Ix7HV5PPKbFEMZTrUHZY+b8J7KqkWhfph38p8pZ3noyJLSV4XFTdMVo2+DVzajEdUVEPoDgoRmHZ5umlFCQ35y8G9OSXYXVdYv/f9m8DAXKTGu6gBmeJJXaBmUPitr1ow46yk2gkm3etzigt2crxmyTNu7AVBarq0OwgwumuEiwYJUG++woLJbB9DgK53cH+QjQ29Y/3SWVw3QfmqV9W89XRgyzZ28ES5rSVkSABEIjFaupfMXHtPBVozLvdqHhjamFTm60bM1xZyDko7S7jTpwkdmT0wEQzRrV8kF7t5E3zIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xYEZpD1VBho6H29aNQbp0vi2orQo2vp6QWOIYmeSZ/I=;
 b=zWLat9mhO05yNVtoeF0yRh7HTHmOGRL2nUijHHwkZQ/uzEjPrUjoyQkl1e8/GUo+uodUsqzz0wTLfk6eZ1dvLKX4o68xoIhq0qcXgTmQzGNlerK6PlBrW28g6Hid8wBo29U7ADQFSCTVVu/JhNnnEkS8sUx1Tw2VtDDuXIZ7fMg=
Received: from BL1PR12MB5269.namprd12.prod.outlook.com (2603:10b6:208:30b::20)
 by BL1PR12MB5032.namprd12.prod.outlook.com (2603:10b6:208:30a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Mon, 6 Sep
 2021 06:36:52 +0000
Received: from BL1PR12MB5269.namprd12.prod.outlook.com
 ([fe80::acc6:c407:1353:6a]) by BL1PR12MB5269.namprd12.prod.outlook.com
 ([fe80::acc6:c407:1353:6a%5]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 06:36:52 +0000
From: "Liu, Monk" <Monk.Liu@amd.com>
To: Daniel Vetter <daniel@ffwll.ch>, "Koenig, Christian"
 <Christian.Koenig@amd.com>
CC: Dave Airlie <airlied@gmail.com>, Alex Deucher <alexdeucher@gmail.com>,
 "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>, "Chen, JingWen"
 <JingWen.Chen2@amd.com>, DRI Development <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [diagnostic TDR mode patches] unify our solution
 opinions/suggestions in one thread
Thread-Topic: [diagnostic TDR mode patches] unify our solution
 opinions/suggestions in one thread
Thread-Index: Adeezw8WIoeNdpdaSO6/zguUPH+5CgAOtiEAAAQJJ3AACrFwAAAHXqOAABa9MsAACx8cgAAK2xGAALS3lIA=
Date: Mon, 6 Sep 2021 06:36:52 +0000
Message-ID: <BL1PR12MB5269F59E4548AD2CF85EC78084D29@BL1PR12MB5269.namprd12.prod.outlook.com>
References: <BL1PR12MB526942160701B46D4B28EEEC84CD9@BL1PR12MB5269.namprd12.prod.outlook.com>
 <CAKMK7uHKX0rSVk_yBPo_KAEJ-UeLk5UxQ2kBdv+FD2j9zAjfZA@mail.gmail.com>
 <BL1PR12MB5269B303372A6251EDD1DC2C84CD9@BL1PR12MB5269.namprd12.prod.outlook.com>
 <CADnq5_PUvgt9Cv2L3G4GGBJv_WBhtOp8DN+3WMvoES_80UMKfQ@mail.gmail.com>
 <CAPM=9tz-66nXR8gbMucsBo5Q1VJ5AsrVZh4pF0r0WfFi7CQtzg@mail.gmail.com>
 <BL1PR12MB5269F6B279EDE278C8FDF90A84CE9@BL1PR12MB5269.namprd12.prod.outlook.com>
 <a1f2cfdf-e1af-e265-3d96-b8f5c47a0b84@amd.com>
 <CAKMK7uENdQRw+5a=A_C3V6BpzqhU1asL_Bnm34r5ZjPpqu=gfQ@mail.gmail.com>
In-Reply-To: <CAKMK7uENdQRw+5a=A_C3V6BpzqhU1asL_Bnm34r5ZjPpqu=gfQ@mail.gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-09-06T06:36:50Z; 
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD Official Use
 Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=51911ac3-7cd3-4ca4-b0df-098088d211d0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=1
authentication-results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ac3e9d9a-360f-4434-b6cb-08d97100b67e
x-ms-traffictypediagnostic: BL1PR12MB5032:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL1PR12MB50322976415055D49033301984D29@BL1PR12MB5032.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zFT3n/5j0ZiFaPHA09dTL8hexbv3HAtmX4vQw4VknoN0hMCjRPpOsoL39v6d/g3RyAvt63I4l9NpDGhq+zNGLogv595azihEgWTuXiFRdh0UTd7RlbO+JeGfWCL6RYmdsXKus09Txyo9K/KCTu+kW63VL+gw2zTgG5tgV2vDOJ9Tzc1uCKt5SeS1TRAzZWuZ7qMfbhgbo68jsGeUEu1zvZb8LgUS5GB94zpSKRt+hGejEhe8pPcCvegtbzt5Zi7LoPDL9+9qA7xrcB4QHYyabl0/ZbQMS/cZbaOfzKWIPD20LesigeT6GT5TmSQZQQ5xb4jMHTCPVNrBTbqCPiYU73o4s1UwJtwkqLPwnR1WdwSUcS3ioP4FggTcrACI7Q87SYeqjGW4WWRy60EyvWIbXNVjQB750iZ7ZzdWTa/CwoncTjnbTptLMHeCvBesqsZNojwcavOuVa/OzxAiIXrXbWrYMz/ho3Mw6p1CwsR9YANXcZdE8nlr6gcj6UshbnMYciOo6BoGEoC3nkOlpVwlteU85KhUS56OQr1aZspQRmB9egVnrJyO15f7zxe96h9fTQAU6zOUwvd1iL5Lg5uiwO7Nq6EulCiy750hJpcVvZgpEjpmceXetVUE4VqlagKoxA8AvXko7owtOr+iUdzyKUGZTeXqGox5+iR/M8q/bvaDRbvPooG0sSMjVa1crTCh+ZTgb6trBKktz6BYvHDr3bA3QuKI/ykjO/J9f7YiNb/iHbDuv3P/gDLBeLRXgCdu25yaoS/PGyFkN8Dmt34ENFeJEzMR54/dmY8XEHzGVxUBXwpsE81NG9WRvkNeJXNyLv/nCjdh3/j0JOMrYaR8UQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5269.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(396003)(39860400002)(376002)(346002)(8676002)(66574015)(5660300002)(66446008)(316002)(9686003)(71200400001)(38070700005)(33656002)(26005)(186003)(83380400001)(6506007)(53546011)(7696005)(54906003)(110136005)(66946007)(6636002)(2906002)(76116006)(122000001)(66556008)(8936002)(55016002)(45080400002)(38100700002)(52536014)(478600001)(966005)(4326008)(64756008)(66476007)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?FSJglNakn0b26E0CQdHcbbek6dFawPS6VlUQIIJXaaWLkAbPeKZEgbFIFP?=
 =?iso-8859-1?Q?bOfPmPfhNsKfIhNT0k5FykrPmgq0wNNYIaUeqtn+Pa2rBMKNrL5Iawvf+S?=
 =?iso-8859-1?Q?2aqqUYAWYm3xA5shhznubszkJ9KfjEMXOpikxb7nASizKHTuSgucs/BNMK?=
 =?iso-8859-1?Q?mpK4zCZH+2yH7Jfw/6UQUeyM/SMH63yxK4nA06QfFZX2rrYBJ4VQv8tcDK?=
 =?iso-8859-1?Q?VB0HKYW/z/yrjjiXSjfCe/JqyO+urz/Zwa8qeg2QU/sBzL/r//kqHzw+b/?=
 =?iso-8859-1?Q?375/CObTNXa0y6WSbzf/vVfFV8UB8iZ39nWl4fHHw0EdmHHiu7pgih+VeT?=
 =?iso-8859-1?Q?CDqYOd7EyN89pdy1QLbEGrozlOnh4tCX6JroI8/+PjpyMGvPJVtSB2gQeF?=
 =?iso-8859-1?Q?vI4impekg/rgX7EMWkE3df9NCyrU+T6XTMBB7Ed7d9RoJj92cfPgWSrCQ6?=
 =?iso-8859-1?Q?sMjiwL6RKvR8D6bBsoWovQt+sNuy7Dn2BiJBnKRK0HWWHEQjdFkeIELqsq?=
 =?iso-8859-1?Q?BJ5Vr2VLHLIDao2+KEcbbiOvmHOpOYFQ4EByiH94q5ndf/ZAdBU25x5oHy?=
 =?iso-8859-1?Q?gjBNDDzPJCARNqvdTfyWfRJdNaSysQE1Otn5/zzoojtXs9LaLgNNIsYGmf?=
 =?iso-8859-1?Q?tSlLsbaxysc3VKk8bCEEukZRe5qgKGbjNKX8OS+vsRSkl8zjfNSlr1z03W?=
 =?iso-8859-1?Q?nZvUnV3W1UE6pzi/h4EPXUtuL9PYJT3I9k1CIcj0ObAHX63Pf5NrLY+jm4?=
 =?iso-8859-1?Q?xPoVVqLl+Hmj/SVVh2NH+lVWrIfxqVeypZqyywmoPJ5gRxvQY2zQH65rBQ?=
 =?iso-8859-1?Q?u8vIdLoJIekV8/uV/JB2adLHmpSKHnRkleeEfgDBftRkbdcGlhYLNsPPPj?=
 =?iso-8859-1?Q?gRzLRxsPoijKNDrN9feMXeiJmiy1J+dohcl8QfhEwB6arvcfZpk6kaFM+9?=
 =?iso-8859-1?Q?b9y5zGFr24jXPvARqGIxzdwxo+b5Tg4YMdzoogdNALI7BGPlIqUeHt3Lwa?=
 =?iso-8859-1?Q?39u+zD71JmlJqK8YqivtfZisOjnC7pPlMMlPM/NDdWGMRCREt9sB4cPwfF?=
 =?iso-8859-1?Q?71kBbkY27Y0XmQ9mi1DMthdk0iOBhkiuaAtyqpa5WWmOd0qOv0wuF/d4sh?=
 =?iso-8859-1?Q?JHCFSB2sWLr7HzSlsxAV4JR5ljjoYR3QkBBgziiILVFb2Mc3HdiTXZ97Xh?=
 =?iso-8859-1?Q?8OufJZp0N1PM62OYArEX4KYR4NxNd4Mw733J1ZG8u5GhFw7ToCcxTAOpCC?=
 =?iso-8859-1?Q?Jm0kmyr+Z/QGRSCYnDhvOmu8sqjsNFCcoqnIaAEUMiXkp8U0KKK0n+XLpg?=
 =?iso-8859-1?Q?macuN/zjK2T67aDHI6EkFUCSbcLO+xu/jP3EpxJ82v8GlzcEn9OtG65ehb?=
 =?iso-8859-1?Q?nU+5QapXs+?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5269.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac3e9d9a-360f-4434-b6cb-08d97100b67e
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2021 06:36:52.2733 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F/zyOsJlizoEBONyCsvP4Z9JgXfgbkJG6yGmGvdTvkKhxzaCRPEGnAGyfzq23U0L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5032
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

> I'm fearing that just repeating what Alex said, but to make it clear=20
> once more: That is *not* necessary!
>
> The shared repository is owned by upstream maintainers and they are=20
> usually free to do restructuring work without getting acknowledge from=20
> every single driver maintainer.

Hi Daniel

Anyway thanks for officially confirm to me of working model & policy in com=
munity, I don't want to put my opinion here due to that's not my call to ch=
ange no matter how.
I only want to let this diagnostic TDR scheme going to a good end for AMD o=
r even for all DRM vendor.

How about this way, we still have a final patch not landed in DRM scheduler=
 and I would like jingwen to present it to you and AlexD/Christian/Andrey, =
 I believe you will have concerns or objections regarding this patch, but t=
hat's fine, let us figure it out together, how to make it acceptable by you=
 and other vendors that working with DRM scheduler.

P.S.:  I had to repeat myself again, we are not popping up new idea suddenl=
y, it is disconnection issue, we didn't have changes (or plan to have chang=
es) in DRM scheduler before, but eventually we found we must make job_timeo=
ut and sched_main to work in a serialized otherwise it won't work based on =
current scheduler's code structure.

Thanks=20

------------------------------------------
Monk Liu | Cloud-GPU Core team
------------------------------------------

-----Original Message-----
From: Daniel Vetter <daniel@ffwll.ch>=20
Sent: Friday, September 3, 2021 12:11 AM
To: Koenig, Christian <Christian.Koenig@amd.com>
Cc: Liu, Monk <Monk.Liu@amd.com>; Dave Airlie <airlied@gmail.com>; Alex Deu=
cher <alexdeucher@gmail.com>; Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com=
>; Chen, JingWen <JingWen.Chen2@amd.com>; DRI Development <dri-devel@lists.=
freedesktop.org>; amd-gfx@lists.freedesktop.org
Subject: Re: [diagnostic TDR mode patches] unify our solution opinions/sugg=
estions in one thread

On Thu, Sep 2, 2021 at 1:00 PM Christian K=F6nig <christian.koenig@amd.com>=
 wrote:
>
> Hi Monk,
>
> Am 02.09.21 um 07:52 schrieb Liu, Monk:
> > [AMD Official Use Only]
> >
> > I'm not sure I can add much to help this along, I'm sure Alex has=20
> > some internal training, Once your driver is upstream, it belongs to ups=
tream, you can maintain it, but you no longer control it 100%, it's a trade=
off, it's not one companies always understand.
> > Usually people are fine developing away internally, but once interactio=
n with other parts of the kernel/subsystem is required they have the realis=
ation that they needed to work upstream 6 months earlier.
> > The best time to interact with upstream was 6 months ago, the second be=
st time is now.
> > <<<
> >
> > Daniel/AlexD
> >
> > I didn't mean your changes on AMD driver need my personal approval=20
> > or review ... and  I'm totally already get used that our driver is not =
100% under control by AMDers, but supposedly any one from community (includ=
ing you) who tend to change AMD's driver need at least to get approvement f=
rom someone in AMD, e.g.: AlexD or Christian, doesn't that reasonable?
>
> I'm fearing that just repeating what Alex said, but to make it clear=20
> once more: That is *not* necessary!
>
> The shared repository is owned by upstream maintainers and they are=20
> usually free to do restructuring work without getting acknowledge from=20
> every single driver maintainer.
>
> Anybody can of course technically object to upstream design decisions,=20
> but that means that you need to pay attention to the mailing lists in=20
> the first place.
>
> > just like we need your approve if we try to modify DRM-sched, or need p=
anfrost's approval if we need to change panfrost code ...
> >
> > by only CC AMD's engineers looks not quite properly, how do you know if=
 your changes (on AMD code part) are conflicting with AMD's on-going intern=
al features/refactoring or not ?
>
> Well because AMD is supposed to work in public as much as possible and=20
> ask upstream before doing changes to the code base.
>
> Additional to that design decisions are supposed to be discussed on=20
> the mailing list and *not* internally.

Yeah I'm honestly really surprised about the course of this discussion here=
. With Alex, Christian and others amd has a lot of folks with years/decades=
 of experience in how to collaborate in upstream, when to pull in others pr=
oactively and when that's not needed, and in general how to plan upstream w=
ork with the lest amount of risk and surprises.

I think step zero here needs to be some training at amd and then re-plannin=
g this effort, before we get back to technical stuff.
Otherwise we'll just get bogged down in pain because expectations about the=
 process don't pan out.
-Daniel

>
> Regards,
> Christian.
>
> >
> > Thanks
> >
> > ------------------------------------------
> > Monk Liu | Cloud-GPU Core team
> > ------------------------------------------
> >
> > -----Original Message-----
> > From: Dave Airlie <airlied@gmail.com>
> > Sent: Thursday, September 2, 2021 2:51 AM
> > To: Alex Deucher <alexdeucher@gmail.com>
> > Cc: Liu, Monk <Monk.Liu@amd.com>; Daniel Vetter <daniel@ffwll.ch>;=20
> > Koenig, Christian <Christian.Koenig@amd.com>; Grodzovsky, Andrey=20
> > <Andrey.Grodzovsky@amd.com>; Chen, JingWen <JingWen.Chen2@amd.com>;=20
> > DRI Development <dri-devel@lists.freedesktop.org>;=20
> > amd-gfx@lists.freedesktop.org
> > Subject: Re: [diagnostic TDR mode patches] unify our solution=20
> > opinions/suggestions in one thread
> >
> > On Thu, 2 Sept 2021 at 01:20, Alex Deucher <alexdeucher@gmail.com> wrot=
e:
> >> On Wed, Sep 1, 2021 at 6:19 AM Liu, Monk <Monk.Liu@amd.com> wrote:
> >>> [AMD Official Use Only]
> >>>
> >>> Daniel
> >>>
> >>>  From the link you share it looks you(or someone else) have quite a b=
unch patches that changes DRM_SCHED or even amdgpu, by that case before the=
y are merged to kernel tree I'm wondering if any AMD develop reviewed them =
?
> >>>
> >>> They looks to me somehow conflicting with what we changed in our repo=
....
> >>>
> >>> It is really a chaos for AMDer if someone else out side of AMD change=
s our kernel driver (or/and scheduler) without reviewed by AMDer, just like=
 we are requiring your review if we tend to change scheduler's logic here .=
...
> >>>
> >>> This one changes AMD's code:
> >>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F
> >>> lo=20
> >>> re.kernel.org%2Fdri-devel%2F20210625133327.2598825-2-boris.brezill
> >>> on
> >>> %40collabora.com%2F&amp;data=3D04%7C01%7CMonk.Liu%40amd.com%7C6c507d
> >>> 18=20
> >>> d65341ef53bb08d96d7976e6%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C
> >>> 0%=20
> >>> 7C637661190727875969%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiL
> >>> CJ=20
> >>> QIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DBWJSk
> >>> KN
> >>> y2%2BwjxbQrfxGPzuJ5PBpBwB4aV0ZH6QoJGEg%3D&amp;reserved=3D0
> >>> And I didn't see any reviewed-by from AMDers ...
> >>>
> >>> This one also touches AMD's code:
> >>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F
> >>> lo
> >>> re.kernel.org%2Fdri-devel%2F20200604081224.863494-12-daniel.vetter
> >>> %4=20
> >>> 0ffwll.ch%2F&amp;data=3D04%7C01%7CMonk.Liu%40amd.com%7C6c507d18d6534
> >>> 1e
> >>> f53bb08d96d7976e6%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637
> >>> 66
> >>> 1190727885929%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoi
> >>> V2=20
> >>> luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D%2F8vIVXCWjH
> >>> kM
> >>> 56pcYI9EvuzhbsZhV9WczkKaBJE67KQ%3D&amp;reserved=3D0
> >>> Which is conflicting with one patch we submitted (in our repo=20
> >>> rightnow), and neither see AMDder gave a review-by on this one=20
> >>> (let me know if I missed it)
> >>>
> >> Monk, this is not how upstream works.  You need to participate.
> >> That's how communities work.  There's a reason all these=20
> >> discussions happen on public mailing lists.  The patch author can't=20
> >> be expected to know every person on every vendor team to CC with a=20
> >> patch.  If you have concerns, you need to raise them when the=20
> >> patches are being discussed.
> >>
> > I'm not sure I can add much to help this along, I'm sure Alex has=20
> > some internal training,
> >
> > Once your driver is upstream, it belongs to upstream, you can maintain =
it, but you no longer control it 100%, it's a tradeoff, it's not one compan=
ies always understand.
> >
> > Usually people are fine developing away internally, but once interactio=
n with other parts of the kernel/subsystem is required they have the realis=
ation that they needed to work upstream 6 months earlier.
> >
> > The best time to interact with upstream was 6 months ago, the second be=
st time is now.
> >
> > Dave.
>


--
Daniel Vetter
Software Engineer, Intel Corporation
https://nam11.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fblog.ffw=
ll.ch%2F&amp;data=3D04%7C01%7CMonk.Liu%40amd.com%7C1de8110d43194346d9b908d9=
6e2c5459%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637661958966011423%7C=
Unknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiL=
CJXVCI6Mn0%3D%7C1000&amp;sdata=3D%2BvtBN1lBJnUoeSyj6aXTDRNHVQDQP8kPRdSUrhR1=
MVk%3D&amp;reserved=3D0
