Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5264AB599
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 08:19:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA49110E19A;
	Mon,  7 Feb 2022 07:19:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2086.outbound.protection.outlook.com [40.107.92.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AEA710E2C8
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 07:19:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PMPi/CL5FjR/0ELpAVq3n9lt0TjIi5rl0Wqbo34wP0b3Gp6kavPIq1dkSQcPvppyRjKgoBbgY8KytqsbaP0XhmFJpkgJ+NgJeAcMQlc1E3/UTeXmju+U2fIunVEn0ZWd6xRxWPwlTrWPjGGR+tyo9yX7YieJIKCSU4DOWR9Yunk1ENrlPnO2QlBFtawIJva/tKpA/FtfcGDKh1v779rOIt9+U4Rtss6h2ngfutC0diW6i/kHCifVydNOVJmSn3GMzUqxe/GId0YnCHKEnVhzJAnByD23Zlynm3bX9WD2ztf5AhtGUOcB9c9yJovE0aqGJnyDEqAvi9pDH2hi4HTPPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4J6BDb76d8aKykv+RtOngFYU2zkOSIBRi/uBVxCJ81E=;
 b=AOYA+ZLOnivVg9RhEJcVDRwhL5E1Q2mbKxGO20UeN0qPmRLNxLMOVPp//t7mcKgLug4zZi1DmbXtVKA9VgPXAvYY8E+ANUA63O7E7g/KGX5nGQWpsEd3SbBPCT79s6C1a4GH9tJ+oIKeHmxKBhgRynJ8tJSx0z9zMgv1d6Xo5yEGqDiN852YoN40EeHWmqTTSkX6+dj9XMxupkiM/vTxNCIRE4jW/sMF4q941333cfdWsVIYNdoeZdQy6QmUKwFD/pd/kXj06h1yqXNbi4YGqxNeyZwZWLJLo9M6B7tqnFP32QviqiP4vGiwDMo3fhaXCAKK/jfZ16hMR3XmQs2AhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4J6BDb76d8aKykv+RtOngFYU2zkOSIBRi/uBVxCJ81E=;
 b=knRefuY6UIjU4HnEy80W6cuyumZRyIy8IP+sRlQFSYKmii8J+rkHPD7qnfh5+c2fDB5BOSEKxwbJrs5gZgTpPmo3nGqhCcU6brNw7ypA4hg/nRGeQ2PIqHw2h1I03cSJWAGHnNzLoMSoGKQ7cfLPKVUqAacKfXNeaZ19ngMOkCw=
Received: from CO6PR12MB5489.namprd12.prod.outlook.com (2603:10b6:303:139::18)
 by SN6PR12MB4767.namprd12.prod.outlook.com (2603:10b6:805:e5::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Mon, 7 Feb
 2022 07:19:33 +0000
Received: from CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::7535:72cb:8fd8:40f6]) by CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::7535:72cb:8fd8:40f6%6]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 07:19:33 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: Lyude Paul <lyude@redhat.com>
Subject: RE: [PATCH] WIP: drm/dp_mst: Add support for dumping topology ref
 histories from debugfs
Thread-Topic: [PATCH] WIP: drm/dp_mst: Add support for dumping topology ref
 histories from debugfs
Thread-Index: AQHX0D+AE15V0cuVgkqFgVkq+XJhhqwbv0zAgAwd2gCAAEwcgIASwW2ggCVww4CACbQzgIAJv2yQgA1ywICABviQcA==
Date: Mon, 7 Feb 2022 07:19:33 +0000
Message-ID: <CO6PR12MB5489B5D5F2F121629F8B1F51FC2C9@CO6PR12MB5489.namprd12.prod.outlook.com>
References: <20211102231502.286654-1-lyude@redhat.com>
 <CO6PR12MB54896F2BBF20F6C04D187D1AFC679@CO6PR12MB5489.namprd12.prod.outlook.com>
 <37497a7c6ce031bf4c99decdd4eecfacf95969b5.camel@redhat.com>
 <CO6PR12MB5489E282DA251241843EF4E4FC6F9@CO6PR12MB5489.namprd12.prod.outlook.com>
 <CO6PR12MB5489D4C51655B1D8B817A50FFC7B9@CO6PR12MB5489.namprd12.prod.outlook.com>
 <4074c2ad21ebe692022d4e097209910e9f32383e.camel@redhat.com>
 <4516b3a53a7d673ff451ca4c7542b40f4e10713a.camel@redhat.com>
 <CO6PR12MB54899D612BCEB3D485367045FC5F9@CO6PR12MB5489.namprd12.prod.outlook.com>
 <ad5c80b1f9bd0087b87903b0156bdfa80b8043ca.camel@redhat.com>
In-Reply-To: <ad5c80b1f9bd0087b87903b0156bdfa80b8043ca.camel@redhat.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=a5a28be0-9446-4fc8-876d-cbe82c496feb;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD
 Official Use Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2022-02-07T06:39:21Z;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 532b77e5-cb0a-4832-da3c-08d9ea0a3070
x-ms-traffictypediagnostic: SN6PR12MB4767:EE_
x-microsoft-antispam-prvs: <SN6PR12MB47671B9287BB530628F1978CFC2C9@SN6PR12MB4767.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nqS1aez9xiO+T5RwlTbYnt1XtNvqEzCep880rHp+J6p4dRrGjq29ORpds9bbx557h7xAC3SWPpJ8019lS14SK1O5ok2Xn+K6bkPCfJo18gyuy8NyZsFFkmzQup+03znRtT+H/Nux6XBfFyQ9f5D15pSu9fhEDIaOlk6kaG7xU7DBfhwE27ugXPLN0lSl+w6YZeWat/r8fXHK0d0LYzWWWGHeBrzrv6QwYh02FnTlVAJLjycvc/d4Kd4E/2FPKKYog6afz149AXhtyil62j/iEZstG76oP88rHQNI3zgOYHBR1qQoOcM5N1P8lzGUuApjiP2fLuhjfrHb7Io4SMKvpXdcKrjtoa1isvoHkwSfU9yFgaYY6YvqZSs/kWC2o51SKEKNjX8nCraPyTViVAy8TcGPTER94CE9idZdwzennYI0IugX1ovoNW/9n6QOf1Yand8kvwGjMS1tnCOFmzg4xUKC1dpeIVeUenLZBKs8n36r4NTPAGqNaBpaLqTD7a+WXrEQ4aTGQ3s+Oj/+mG5d42Miwk2JYx3F9Zbg170Ig91Xe/7q79Llp4ZLFgFy1RKTTwRTXnamNGZQkFscuLLsazR+T7RZpnnJoTPDMlTAD/Z47S1aihJcZm2+6gnhBr2S3saXSvuFpLObscdoTisvhhdhndg09As+5hp9+GN5aEONfkRUJIW0QwOYw2KBVZ50UOnz1aGTNghC2Z2O5TbC6Ek6nc1zqkbwVfUEF3bBif0yEux6ybEYWd4sLwphRfvbFaoyLeo+3luHe6eh+nEkQG7oux8UfVQmwdwrmP4BUr5pIuxdIjvmwVoJhfRrurt1
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5489.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66556008)(66476007)(8676002)(64756008)(55016003)(66446008)(2906002)(86362001)(8936002)(66946007)(76116006)(38070700005)(52536014)(4326008)(30864003)(122000001)(38100700002)(4001150100001)(508600001)(83380400001)(7696005)(71200400001)(9686003)(6506007)(966005)(45080400002)(186003)(26005)(6916009)(316002)(5660300002)(53546011)(33656002)(579004)(559001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?rtrWpZGIEMzLQCtIJaPY9DkM0gNRWsMBrcVXXsWPrsitLQfcY7lxIbC4qf?=
 =?iso-8859-1?Q?Hf/z5Eber9PkxJhRPNRc66Ev7WdJht2R7CDNJKr/UpMfXwcULCK1pOPf7h?=
 =?iso-8859-1?Q?G91d0mFG7Y9CVBSfFYQydjwy4b+L/IEkiUY/DprEdX07mVCgkXpKTULvnj?=
 =?iso-8859-1?Q?Dueqz1M3y4WgBQkBE01p4SFBt3e2oMLJw10Rz0d1gL1loSntHlLbH6qtFE?=
 =?iso-8859-1?Q?vHPa+AU5OQ+UkTiaKRcEKIZ2z9gSJBhVXHYWGIaGKlyK9ByDmpuOrfxYoJ?=
 =?iso-8859-1?Q?jkwBz4ecMIeyv30/b3zAxTerFtw2d18J2T7Ta/egU+ldIphrP0/uPacxUi?=
 =?iso-8859-1?Q?reO2xTVNcbFzuZ8wVbnJ457rdZmdzWPE12BY5oEnbtsxflGE+mudLwyoQF?=
 =?iso-8859-1?Q?rqCInmhGFm0frvcXzU4K8qxrf+CDJ+HQ4UNs+eyN+7Ws6AN54Acy6qNh/A?=
 =?iso-8859-1?Q?SaSGEcToc2KkNrLI9U/akZzzHzlH4ZEcv00cKRCwlmEoNhsOeFsPdOrZ/x?=
 =?iso-8859-1?Q?xflAWv1xjiAkJpH2TVQVHp6c+Y2xJPgE5yK7ggNMNsIKCH+dpfvZzF/58+?=
 =?iso-8859-1?Q?IifboJoUkf2iBI9+HZfYqcseYFJxTyzCIlxAlEMPX7dFzJP71geO3+LRZj?=
 =?iso-8859-1?Q?9PVnZQDQAiHDNvKX+A3jLV0h7dmZE/YaPOzIz4IGF6qIlq8ZeTFr3MWyQ7?=
 =?iso-8859-1?Q?bZ/wUkhxtBoKSetOL4bEeEUz6df2YFLY5fhOvbUEjdeA3uT6tJ6sJ5N4dr?=
 =?iso-8859-1?Q?FvYZwaQSK5GKT2CiuFfMqrYg+zEdnO2qw6H5iWOz+UaE5QcaThdPRXyA3L?=
 =?iso-8859-1?Q?NYyuA2sXP24ET3SWqm9fh5r02gs/wzrCJ1UsmhMhF6wgAT1xp0gsdVKgcj?=
 =?iso-8859-1?Q?AE33R7Ls0ze5ewYLFcC46NQB9gmX+NldJLM1eibq4MCycodAll7JtjtWUl?=
 =?iso-8859-1?Q?557tbGHRRrQQaAN+FGx5T8s8mDfm1riTIGcYDNS8KCqXKpF+jTrGLkH//8?=
 =?iso-8859-1?Q?zOq4NPhnRu730uhdK7qJzpTINSRO6uQSRrKs6GaZ4skqSvQqHGwtFo20uF?=
 =?iso-8859-1?Q?N0sdapi98FV0q/3b1p+t/kl/JHEaIbILxyGoB7kmzUAO2n1nvw3bUVycD/?=
 =?iso-8859-1?Q?WaP4IT+0yrKOYGXySIqtVbPFFvLkA7JK8L9pulSTcqAl3yuhCNtpWiv5Cb?=
 =?iso-8859-1?Q?xYRmpk5LEXBHWes0f1mJcaYIYxX6R+jL1VHY5qD5GWjAuUI/OJOjQHStYR?=
 =?iso-8859-1?Q?Skl3dkvzpDT8Nzb472f9pMu/7EKCXZytHxBpIxJH1PO3EZ+u5UGh2njE2g?=
 =?iso-8859-1?Q?3wM8JNE0LtIZWJR3jLeO8q+RVD350XJVaWXVgrekNKEJMn6VMLQvWUhjJ+?=
 =?iso-8859-1?Q?bT8N2mrsySVdR7eqp2+8BXOJEICEWfx3SQZguxRdWLpKJaCboL+zH38a4G?=
 =?iso-8859-1?Q?GhWQ+/VQc3CITGnxvRTcxZb/BNMEXn6ZXEod9FOPUnzFxDXs+zZIgwD120?=
 =?iso-8859-1?Q?oPCHE0/llh1sn46rQaGVrDYGF2JSoP4I+7x286zWwnoY+ZaOiAsdyKNZE1?=
 =?iso-8859-1?Q?h5jn0iHinTjrEBFcD3/or3WUKhpwxRsqAbNaHpqRCXThgeS24XTGWhgsMc?=
 =?iso-8859-1?Q?6XA5iWCOFZzs6ukuavj8KI0F1Shs/5ZcEGwSuzSf2t+0pWvm6WCABb+g?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5489.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 532b77e5-cb0a-4832-da3c-08d9ea0a3070
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2022 07:19:33.1192 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R7CBv/QKoW/2cZPRVsowbNrHka079KMUkW16tYjs1gkKrG0VVgLyZ9vMW5geqp+viq6gnlA37N2xHFKWAi3ngA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4767
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only]

Thank you Lyude!

So, in short, I'm trying to register a call back function to listen to unpl=
ug event within MST topology.

Removal of local monitor from system can be detected by HPD pin and it ther=
efore triggers HW interrupt.
We then release corresponding resource for the specific stream sink in sequ=
ence.

However, unplug event within MST topology is broadcasted by CSN sideband me=
ssage which is handled by
drm layer in drm_dp_mst_topology.c, not by our driver. In order to follow t=
he same sequence as we have
for removal of local monitor, I want to know is there any code path to noti=
fy driver the unplug event within
MST topology.

Currently, removal of remote monitors by removing its connected mst branch =
device from the topology, such
unplug event eventually call drm_dp_delayed_destroy_port() and we can try t=
o release resource for those
stream sinks under this sequence. However, there is no code path for the ca=
se when remove stream sinks
directly from the topology (i.e. not remove monitors by indirectly removing=
 its connected branch device).
As the result, the rough idea that I want to do is adding up a notification=
 for this case.

Thank you for your time!

> -----Original Message-----
> From: Lyude Paul <lyude@redhat.com>
> Sent: Thursday, February 3, 2022 4:12 AM
> To: Lin, Wayne <Wayne.Lin@amd.com>
> Cc: dri-devel@lists.freedesktop.org
> Subject: Re: [PATCH] WIP: drm/dp_mst: Add support for dumping topology re=
f histories from debugfs
>
> JFYI I should be able to respond to this soon, I think I'm following your
> issue a bit more (haven't gotten to go through the patches too so I'm pro=
bably
> going to see if I can reproduce it locally as well. Sorry for the delay -
> dealing with some X.org stuff and work issues at the moment
>
> On Tue, 2022-01-25 at 08:32 +0000, Lin, Wayne wrote:
> > [Public]
> >
> > Hey Lyude,
> >
> > Sorry, just got chance to get back to this and BIG THANKS to elaboratin=
g in
> > such details!
> > Following are some of my comments : )
> >
> > > -----Original Message-----
> > > From: Lyude Paul <lyude@redhat.com>
> > > Sent: Wednesday, January 19, 2022 9:59 AM
> > > To: Lin, Wayne <Wayne.Lin@amd.com>
> > > Cc: dri-devel@lists.freedesktop.org
> > > Subject: Re: [PATCH] WIP: drm/dp_mst: Add support for dumping topolog=
y ref
> > > histories from debugfs
> > >
> > > Hey - so, the original issue here was that payloads were not always
> > > deleted when we expected them to be - correct?
> >
> > Actually, what I was trying to do is not relevant to payload maintenanc=
e.
> > What I wanted to do is having a way to notify
> > amdgpu to release its enumerated resource "dc_sink" when unplug event
> > occurs. Currently, under specific scenarios,
> > we can't release remote "dc_sink" and ends up can't allocate resource f=
or
> > new connected monitors. I'll explain the scenario
> > underneath.
> >
> > So, get back to the main issue that I was trying to solve when I pushed=
 the
> > patchset:
> > https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpat=
chwork.kernel.org%2Fproject%2Fdri-
> devel%2Fcover%2F20210720160342.11415-1-
> Wayne.Lin%40amd.com%2F&amp;data=3D04%7C01%7Cwayne.lin%40amd.com%7C2e19d93=
21b5f4e948c1208d9e6884f24%7C3dd8961fe488
> 4e608e11a82d994e183d%7C0%7C0%7C637794295422403301%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiL
> CJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3DrvtwQioO3pT1BoHb7S532msR=
a61gP1vIyE8AB7M9I4E%3D&amp;reserved=3D0
> >
> > I was trying to fix some problems that I observed after these 2 patches
> > * 09b974e8983 drm/amd/amdgpu_dm/mst: Remove ->destroy_connector() callb=
ack
> > * 72dc0f51591 drm/dp_mst: Remove drm_dp_mst_topology_cbs.destroy_connec=
tor
> >
> > With above patches, it changes our flow to remove dc_sink (by calling
> > dc_link_remote_sink()) when connector is about to be
> > destroyed. And let's see below use cases:
> > a). Disconnection happens between mst branch devices
> > e.g.
> > src - 1st_mstb - 2nd_mstb - sst_monitor =3D> src - 1st_mstb (disconnect=
)
> > 2nd_mstb - sst_monitor
> >
> > In above case, after receiving CSN, we will put topology reference coun=
t of
> > 2nd mstb and its port which connected to the sst monitor.
> > As you suggested before, we will destroy 2nd mst branch device and its =
all
> > ports due to there is no more mst path can route to them.
> > As the result of that, we at end call drm_dp_delayed_destroy_port() and
> > unregister/put the drm connector and eventually call
> >  dc_link_remote_sink() to release the dc_sinck we enumerate for the spe=
cific
> > stream sink of sst_monitor.
> >
> > However, in below case:
> > b). Disconnection happens between mst branch devices and SST monitor
> > e.g.
> > src - 1st_mstb - sst_monitor =3D> src - 1st_mstb (disconnect)  sst_moni=
tor
> >
> > In this case, which is the case having problem, it definitely won't dec=
rease
> > the topology references count of the port of 1st_mstb which
> > was connected to the sst monitor to zero since the port is still existi=
ng in
> > the topology. Same as the malloc reference since the port can't get
> > destroyed. Hence, the port still exists and we won't call
> > drm_dp_delayed_destroy_port() to unregister and put the drm connector. =
As
> > the
> > result of that, we can't release corresponding remote dc_sink under thi=
s
> > case. And after few times hotplugs, we can't create any new
> > dc_sink since the number of stream sink is exceeding our limitation.
> >
> > Hence, what I'm thinking here is to register a callback function for
> > notifying us that the remote sink is detached. This just aligns what we=
 do
> > for handling long HPD event (unplug monitor from system) of legacy DP (=
none
> > mst). For which case, once we detect long HPD event
> > indicating the monitor is detached, we will immediately try to release =
the
> > dc_link->local_sink and fire hotplug event to upper layer.
> > Same as here, once receives a CSN message notifying a drm connector is
> > changed from connected to disconnected, trigger the callback
> > function and we can try to release the dc_sink resource.
> >
> > >
> > > If I'm remembering that correctly, then (and I'm not 100% sure on thi=
s
> > > yet) I might already have noticed something very possibly wonky in
> > > how we handle payload allocations currently, that I found while worki=
ng on
> > > the non-atomic removal branch that I linked to you in my
> > > previous response. Basically, in the
> > > step1() function it looks like that we follow this general flow with
> > > updating
> > > payloads:
> > >
> > >  * Loop through proposed payloads and compare to previously programme=
d
> > >    payloads
> > >     - If a payload has a different allocation then it previously did,
> > > update the
> > >       payload
> > >     - If the payload is new, create it
> > >     - If a payload no longer has an allocation, remove the payload
> > >
> > > At first glance this seems totally correct - but I'm not actually ent=
irely
> > > convinced it is? Particularly because it seems like the order in whic=
h
> > > we do creation/deletion of payloads is totally arbitrary. To explain =
what
> > > I mean by that, consider a state transition like this:
> > >
> > > vcpi_slots=3D15 vcpi_slots=3D35 vcpi_slots=3D14
> > > > 1 | 2 |xxxxxxxx|
> > >
> > > Let's say we want to increase payload #1 from 15 to 50, and disable
> > > payload #2 in the same atomic commit on DRM's side. If the order we
> > > update payloads is entirely arbitrary, we could end up doing this:
> > >
> > >  * Increase VCPI slots payload #1 from 15->50 (total VCPI slots=3D99,
> > > overflow!)
> > >  * Decrease VCPI slots payload #2 from 35->0  (total VCPI slots=3D50)
> > >
> > > Notice on the first step, we've technically overflowed the available
> > > number of VCPI slots in the payload table. This is still before step =
2
> > > though, and I could be totally wrong here - perhaps this is entirely =
OK in
> > > the real world, and we're allowed to overflow VC slots as long as
> >
> > I think it's forbidden to allocate time slots beyond 64 when we're upda=
ting
> > payload ID table of the branch in the real world. Branch probably
> > will NACK the DPCD write.
> >
> > > we repair the issue before step 2. But so far I can't seem to find
> > > anything in the DP 2.0 spec that explicitly states this would be OK -
> > > which
> > > makes me think we might fail some payload allocations if we don't alw=
ays
> > > ensure we avoid overflows in between VC payload table changes
> >
> > Agree.
> > For amdgpu, I think we always do deallocation (call hws-
> > >funcs.reset_hw_ctx_wrap()) before allocation
> > (apply_single_controller_ctx_to_hw()).
> >
> > > Note that avoiding overflows would be as simple as just making sure w=
e
> > > send all VC payload table changes that free VC slots before sending
> > > any that take new slots.
> > >
> > > Again - I haven't actually confirmed this yet and am hoping to test s=
tuff
> > > like this very soon as I'm pretty close finishing up the initial atte=
mpt
> > > at removing the non-atomic MST code in the DRM helpers now. If my the=
ory
> > > ends up being correct here, I can fix this in my rewrite of the
> > > MST payload management code. But I figured it might be worth mentioni=
ng in
> > > the mean time in case you think it might be relevant to the
> > > problem here :).
> > >
> > > On Wed, 2022-01-12 at 16:47 -0500, Lyude Paul wrote:
> > > > (CC'ing this to dri-devel, since this is basically patch review)
> > > >
> > > > Alright - so first off sorry about the broken debugging patch! I
> > > > thought I had tested that but I guess I hadn't tested it well enoug=
h,
> > > > I'll get it fixed asap, but feel free to try getting to it before I
> > > > do.
> > > >
> > > > As for this patch... (comments below)
> > > >
> > > > On Mon, 2021-12-20 at 02:17 +0000, Lin, Wayne wrote:
> > > > > [AMD Official Use Only]
> > > > >
> > > > > Hi Lyude,
> > > > >
> > > > > No rush and thanks for your time! : ) Just want to help clarify w=
hat
> > > > > I mean that "registering a callback function"
> > > > > for CSN of disconnecting
> > > > > stream sink device (not mst branch case). Attach below the tentat=
ive
> > > > > patch that I planned to do. Thanks so much!
> > > > >
> > > > > Regards,
> > > > > Wayne
> > > > > ---
> > > > >  .../display/amdgpu_dm/amdgpu_dm_mst_types.c   | 53
> > > > > +++++++++++++++++++
> > > > >  drivers/gpu/drm/drm_dp_mst_topology.c         | 16 +++++-
> > > > >  include/drm/drm_dp_mst_helper.h               |  1 +
> > > > >  3 files changed, 68 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git
> > > > > a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> > > > > b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> > > > > index cc34a35d0bcb..d7343c64908c 100644
> > > > > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> > > > > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> > > > > @@ -472,8 +472,61 @@ dm_dp_add_mst_connector(struct
> > > > > drm_dp_mst_topology_mgr *mgr,
> > > > >         return connector;
> > > > >  }
> > > > >
> > > > > +void dm_dp_notify_csn_disconnection(struct drm_connector
> > > > > +*connector) {
> > > > > +       struct amdgpu_dm_connector *aconnector =3D
> > > > > +               to_amdgpu_dm_connector(connector);
> > > > > +       struct dc_sink *dc_sink =3D aconnector->dc_sink;
> > > > > +       struct dc_link *dc_link =3D aconnector->dc_link;
> > > > > +       struct amdgpu_device *adev =3D drm_to_adev(ddev);
> > > > > +
> > > > > +       ASSERT(dc_link);
> > > > > +
> > > > > +       if (dc_sink) {
> > > > > +               mutex_lock(&adev->dm.dc_lock);
> > > > > +
> > > > > +               /*clear the remote sink of the link*/
> > > > > +               dc_link_remove_remote_sink(dc_link, dc_sink);
> > > > > +               dc_sink_release(dc_sink);
> > > > > +               aconnector->dc_sink =3D NULL;
> > > > > +
> > > > > +               mutex_unlock(&adev->dm.dc_lock);
> > > > > +       }
> > > > > +}
> > > > > +
> > > > >  static const struct drm_dp_mst_topology_cbs dm_mst_cbs =3D {
> > > > >         .add_connector =3D dm_dp_add_mst_connector,
> > > > > +       .notify_csn_disconnection =3D dm_dp_notify_csn_disconnect=
ion,
> > > > >  };
> > > >
> > > > I still don't really think this is a good idea. This seems like it'=
s
> > > > just adding another hotplugging path to the code in order to avoid
> > > > sending hotplugs for non-endpoint devices. In addition to the
> >
> > So, what I wanted to do is to add a callback function for endpoint devi=
ces
> > case as described above. For disconnection of non-endpoint devices is
> > already taken care by current code.
> >
> > > > drm_connector issues I mentioned before, we also really need to sto=
p
> > > > doing any kind of payload maintence in hotplugging paths. The reali=
ty
> > > > is any kind of payload maintanence we do outside of normal modesett=
ing
> > > > paths is a relic from legacy modesetting that I'm dropping ASAP (mo=
re
> > > > on this below), and we can't keep adding to it because it dramatica=
lly
> > > > complicates maintanence as well.
> >
> > > >
> > > > Sorry for repeating this point so often but - the biggest issue too=
 is
> > > > I'm still not sure what it is we're even avoiding here. We know
> > > > resources aren't released consistently, and that we're able to
> > > > reproduce the behavior with repeated hotplugs. We also know that if=
 we
> > > > skip sending certain hotplug events, that fixes the issue. And we k=
now
> > > > we can workaround it by adding a special case for forcing a payload
> > > > release in DC. But none of those actually tell us exactly what piec=
e
> > > > of code is leaking and why, which means that any workarounds we're
> > > > putting in to avoid this mysterious guilty section of code we don't
> > > > entirely understand either - which means we're just adding more cod=
e
> > > > in that no one actually fully understands. This just ends up making
> > > > maintence difficult because every change in code nearby workarounds
> > > > like this has to strugle to try to figure out said workarounds in
> > > > order to avoid breaking things.
> >
> > Thank you Lyude for the reminder and I totally agree with you by avoidi=
ng
> > adding workaround since it will get the code maintenance harder. And I
> > think the root cause of the issue that I observed before is quite concr=
ete.
> > There is no code path for us to release dc_sink under the unplug scenar=
io
> > that I described above.
> >
> > > >
> > > > I'm actually currently running into these "later" issues right now,=
 as
> > > > recently I've (-actively-, finally!!!) been working on trying to
> > > > remove as much non-atomic MST as I can because. As it turns out - a
> > > > huge amount of the payload maintanence code just isn't needed at al=
l
> > > > when we stop caring about non-atomic drivers and stick everything i=
n
> > > > atomic state structs. Step 1 for updating updating the payload tabl=
e,
> > > > e.g. drm_dp_update_payload_part1(), is a great example of how messy
> > > > things have become. Here's a small sample of some of the stuff I've
> > > > seen from just that one function so far that either just don't make
> > > > sense here or is totally redundant. I should note that a lot of the=
se
> > > > things also come from patches I reviwed, but didn't really look at =
as
> > > > closely as I should have because I was swamped at work, some are
> > > > historical artifacts, and others are less-than-ideal patches I got
> > > > wrote myself when I was first started working on MST and didn't kno=
w
> > > > the code as well as I do
> > > > now:
> > > >
> > > >  * We try to avoid some sort of userspace issue by using
> > > >    drm_dp_mst_port_downstream_of_branch() to avoid releasing payloa=
ds
> > > > for a
> > > >    branch if we can't prove it's downstream of the top of the
> > > > topology. This
> > > >    seems to workaround either a userspace bug. This is a redundant,
> > > > since
> > > >    that's what topology refs are already supposed to be doing to th=
e
> > > > extent is
> > > >    reasonably possibly. It's also unfortunately racy solution becau=
se
> > > > we have
> > > >    to be able to handle the situation where a connector is removed
> > > > from under
> > > >    us. That can happen at any time, including _immediately_ after w=
e
> > > > call
> > > >    drm_dp_mst_port_downstream_of_branch() - rendering the call not
> > > > really
> > > >    useful.
> > > >  * If we fail to validate the sink in drm_dp_update_payload_part, w=
e
> > > > don't
> > > >    update the payload table. I think at best this solution is racy =
and
> > > > not
> > > >    useful, at worst it leaves us with a payload table that doesn't
> > > > match what
> > > >    we attempted to set in the atomic state - which at worst brings =
us
> > > > into
> > > >    undefined territory where we're just plain out of sync with the
> > > > reality in
> > > >    hw.
> > > >  * Actually fun fact - mgr->payloads and mgr->proposed_vcpis both c=
an
> > > > and
> > > >    definitely should be removed entirely. All of the info for
> > > > mgr->payloads
> > > >    could just be in the atomic state, because that + the magic of
> > > > atomic state
> > > >    duplication means we'll also have an accurate view of the previo=
us
> > > > state's
> > > >    payload allocations: which renders mgr->proposed_vcpis redundant=
.
> > > >
> > > > Apologies for the long explanation again, but I hope that explains =
my
> >
> > Really really thanks for your kindly help on this : )
> > I'll try my best to get to your WIP branch soon. Thank you Lyude!
> >
> > > > point here a bit. I'm going to be trying to get to moving amdgpu's =
DSC
> > > > code out of amdgpu and into DRM helpers as well soon, so I'm really
> > > > determined to clean stuff up beforehand as every time I've done so
> > > > it's become substantially easier to make changes to this code. Thin=
gs
> > > > used to be even worse before I started cleaning things up 2 or 3 ye=
ars
> > > > ago, where simple changes would end up getting me stuck spending ho=
urs
> > > > trying to dig through lockdep or memory manegement issues. As well,=
 I
> > > > would be entirely unsurprised if bugs like this very payload leak
> > > > we're working on just disappear once we've gotten rid of all the
> > > > extraneous workarounds and state tracking here - especially with ho=
w
> > > > many special cases we have for maintaining the payload table right
> > > > now. That's certainly ended up being the case in the past with a
> > > > number of other difficult to track down issues I've dealt with in M=
ST.
> > > >
> > > > Anyhow. I've been way more productive this year then last because I
> > > > had over a month off work and am finally not super burnt out from m=
y
> > > > job, and so far I've been making progress on the payload state clea=
nup
> > > > far faster then I was last year :). I think if you can't figure out
> > > > where the leak is coming from even once I get the debugging patches=
 I
> > > > mentioned fixed up, it might be a good idea for us to try again aft=
er
> > > > I've got some of this code cleaned up. I've got a currently WIP bra=
nch
> > > > here:
> > > >
> > > > https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Fgitl
> > > > ab.freedesktop.org%2Flyudess%2Flinux%2F-%2Fcommit%2F624dd68fa804e64=
b5b
> > > > 2060e4735d7317090692b5&amp;data=3D04%7C01%7Cwayne.lin%40amd.com%7Cd=
4bdc7
> > > > 59eb274bfccc8208d9daef41fe%7C3dd8961fe4884e608e11a82d994e183d%7C0%7=
C0%
> > > > 7C637781543416430632%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLC=
JQI
> > > > joiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3DnFpVl%=
2BVoF
> > > > 40JPabfRMcR6Cz7ZHDwt%2BBpLDBNdXftJaA%3D&amp;reserved=3D0
> > > >
> > > > >
> > > > >  void amdgpu_dm_initialize_dp_connector(struct
> > > > > amdgpu_display_manager *dm, diff --git
> > > > > a/drivers/gpu/drm/drm_dp_mst_topology.c
> > > > > b/drivers/gpu/drm/drm_dp_mst_topology.c
> > > > > index 857c5d15e81d..a70e26c5d084 100644
> > > > > --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> > > > > +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> > > > > @@ -2508,6 +2508,7 @@ drm_dp_mst_handle_conn_stat(struct
> > > > > drm_dp_mst_branch *mstb,
> > > > >         u8 new_pdt;
> > > > >         bool new_mcs;
> > > > >         bool dowork =3D false, create_connector =3D false;
> > > > > +       bool notify_unplug_event =3D false;
> > > > >
> > > > >         port =3D drm_dp_get_port(mstb, conn_stat->port_number);
> > > > >         if (!port)
> > > > > @@ -2520,6 +2521,9 @@ drm_dp_mst_handle_conn_stat(struct
> > > > > drm_dp_mst_branch *mstb,
> > > > >                          * port, so just throw the port out and m=
ake
> > > > > sure we
> > > > >                          * reprobe the link address of it's paren=
t
> > > > > MSTB
> > > > >                          */
> > > > > +                       /* should also consider notify_unplug_eve=
nt
> > > > > here.
> > > > > +                        * but it's not a normal case for product=
s
> > > > > +in the
> > > > > market
> > > > > +                        */
> > > > >                         drm_dp_mst_topology_unlink_port(mgr, port=
);
> > > > >                         mstb->link_address_sent =3D false;
> > > > >                         dowork =3D true; @@ -2541,10 +2545,14 @@
> > > > > drm_dp_mst_handle_conn_stat(struct
> > > > > drm_dp_mst_branch
> > > > > *mstb,
> > > > >         port->ddps =3D conn_stat->displayport_device_plug_status;
> > > > >
> > > > >         if (old_ddps !=3D port->ddps) {
> > > > > -               if (port->ddps && !port->input)
> > > > > +               if (port->ddps && !port->input) {
> > > > >                         drm_dp_send_enum_path_resources(mgr, mstb=
,
> > > > > port);
> > > > > -               else
> > > > > +               } else {
> > > > >                         port->full_pbn =3D 0;
> > > > > +                       if (port->connector &&
> > > > > +                               drm_dp_mst_is_end_device(port->pd=
t,
> > > > > +port-
> > > > > > mcs))
> > > > > +                               notify_unplug_event =3D true;
> > > > > +               }
> > > > >         }
> > > > >
> > > > >         new_pdt =3D port->input ? DP_PEER_DEVICE_NONE : conn_stat=
-
> > > > > > peer_device_type;
> > > > > @@ -2557,11 +2565,15 @@ drm_dp_mst_handle_conn_stat(struct
> > > > > drm_dp_mst_branch
> > > > > *mstb,
> > > > >                 dowork =3D false;
> > > > >         }
> > > > >
> > > > > +       if (notify_unplug_event &&
> > > > > +mgr->cbs->notify_csn_disconnection)
> > > > > +               mgr->cbs->notify_csn_disconnection(port->connecto=
r);
> > > > > +
> > > > >         if (port->connector)
> > > > >                 drm_modeset_unlock(&mgr->base.lock);
> > > > >         else if (create_connector)
> > > > >                 drm_dp_mst_port_add_connector(mstb, port);
> > > > >
> > > > > +
> > > > >  out:
> > > > >         drm_dp_mst_topology_put_port(port);
> > > > >         if (dowork)
> > > > > diff --git a/include/drm/drm_dp_mst_helper.h
> > > > > b/include/drm/drm_dp_mst_helper.h index 78044ac5b59b..ff9e4772984=
1
> > > > > 100644
> > > > > --- a/include/drm/drm_dp_mst_helper.h
> > > > > +++ b/include/drm/drm_dp_mst_helper.h
> > > > > @@ -525,6 +525,7 @@ struct drm_dp_mst_topology_cbs {
> > > > >          * IRQ pulse handler.
> > > > >          */
> > > > >         void (*poll_hpd_irq)(struct drm_dp_mst_topology_mgr *mgr)=
;
> > > > > +       void (*notify_csn_disconnection)(struct drm_connector
> > > > > +*connector);
> > > > >  };
> > > > >
> > > > >  #define DP_MAX_PAYLOAD (sizeof(unsigned long) * 8)
> > > > > --
> > > > > 2.31.0
> > > > >
> > > > > > -----Original Message-----
> > > > > > From: Lin, Wayne
> > > > > > Sent: Wednesday, December 8, 2021 11:39 AM
> > > > > > To: 'Lyude Paul' <lyude@redhat.com>
> > > > > > Subject: RE: [PATCH] WIP: drm/dp_mst: Add support for dumping
> > > > > > topology ref histories from debugfs
> > > > > >
> > > > > > No worries Lyude!
> > > > > > Thanks for keeping helping on this. Take your time : )
> > > > > >
> > > > > > > -----Original Message-----
> > > > > > > From: Lyude Paul <lyude@redhat.com>
> > > > > > > Sent: Wednesday, December 8, 2021 7:05 AM
> > > > > > > To: Lin, Wayne <Wayne.Lin@amd.com>
> > > > > > > Subject: Re: [PATCH] WIP: drm/dp_mst: Add support for dumping
> > > > > > > topology ref histories from debugfs
> > > > > > >
> > > > > > > Sorry! I will try to get to this tomorrow, if not then someti=
me
> > > > > > > this week.
> > > > > > >
> > > > > > > On Tue, 2021-11-30 at 08:41 +0000, Lin, Wayne wrote:
> > > > > > > > [Public]
> > > > > > > >
> > > > > > > > Hi Lyude,
> > > > > > > >
> > > > > > > > Finally have some bandwidth to get back to this problem!
> > > > > > > > I roughly went through this patch and I'm just aware that w=
e
> > > > > > > > already have such kind of convenient tool for a while.
> > > > > > > > I think it's definitely useful for us to track port/mstb
> > > > > > > > reference count issues and I'll start to embrace this featu=
re
> > > > > > > > for cleaning up those issues. Thank you Lyude!
> > > > > > > >
> > > > > > > > However, I think the issue that I was trying to fix is not
> > > > > > > > related to what you suggested:
> > > > > > > > " The idea here is that if stream resources aren't being
> > > > > > > > released, my guess would be that we're not dropping topolog=
y
> > > > > > > > references for the port which means the connector never goe=
s
> > > > > > > > away."
> > > > > > > > The issue I was trying to fix is about releasing
> > > > > > > > dc_link->remote_sinks while receiving a CSN message notifyi=
ng
> > > > > > > > the connection status of a sst connector of a port changed
> > > > > > > > from connected to disconnected. Not the connection status
> > > > > > > > changed of a mst branch device.
> > > > > > > > e.g.
> > > > > > > > src - 1st_mstb - 2nd_mstb - sst_monitor =3D> src - 1st_mstb
> > > > > > > > (disconnect) 2nd_mstb - sst_monitor
> > > > > > > >
> > > > > > > > In above case, after receiving CSN, we will put topology
> > > > > > > > references of 2nd mstb and its port which is connected with
> > > > > > > > the sst monitor. As the result of that, we can call
> > > > > > > > drm_dp_delayed_destroy_port() to unregister and put the drm
> > > > > > > > connector.
> > > > > > > >
> > > > > > > > However, in below case:
> > > > > > > > e.g.
> > > > > > > > src - 1st_mstb - sst_monitor =3D> src - 1st_mstb (disconnec=
t)
> > > > > > > > sst_monitor
> > > > > > > >
> > > > > > > > In this case, which is the case having problem, it definite=
ly
> > > > > > > > won't decrease the topology references count of the port wh=
ich
> > > > > > > > was connected to the sst monitor to zero since the port is
> > > > > > > > still existing in the topology. Same as the malloc referenc=
e
> > > > > > > > since the port can't get destroyed. Hence, the port still
> > > > > > > > exists  and we won't call
> > > > > > > > drm_dp_delayed_destroy_port() to unregister and put the drm
> > > > > > > > connector.
> > > > > > > > I looked up the code and drm_dp_delayed_destroy_port() seem=
s
> > > > > > > > like the only place to call drm_connector_put() which means=
 we
> > > > > > > > can't put reference count of drm connector under this case =
and
> > > > > > > > can't release dc_sink resource by destroying drm connector.
> > > > > > > >
> > > > > > > > I would also like to point out that this resource
> > > > > > > > (remote_sinks) is specific to different stream sinks. So if
> > > > > > > > we're trying to release this dc_sink resource by destroying
> > > > > > > > the drm connector, it conflicts the idea that you suggested
> > > > > > > > before that we should always keep the drm connector until i=
t's
> > > > > > > > no longer reachable in the topology.
> > > > > > > > Releasing dc_sink should be binding with the disconnection
> > > > > > > > event.
> > > > > > > >
> > > > > > > > I understand your concern that we should not just easily
> > > > > > > > change the logic here since it's the result after solving t=
ons
> > > > > > > > of bugs before and might cause other side effect. So, just =
my
> > > > > > > > 2 cents, what I'm thinking is to register a callback functi=
on
> > > > > > > > for our driver to notify us that the remote sink is detache=
d.
> > > > > > > > This just aligns our flow handling long HPD event of legacy
> > > > > > > > (sst) DP.
> > > > > > > > For sst case, once we detect long HPD event indicating the
> > > > > > > > monitor is detached, we will immediately try to release the
> > > > > > > > dc_link->local_sink and fire hotplug event to upper layer.
> > > > > > > > Same as here, once receives a CSN message notifying a drm
> > > > > > > > connector is changed from connected to disconnected, trigge=
r
> > > > > > > > the callback function and we can try to release the dc_sink
> > > > > > > > resource.
> > > > > > > >
> > > > > > > > Would like to know your thought and insight please : )
> > > > > > > >
> > > > > > > > Btw, I got some errors and warnings while building and have
> > > > > > > > some code adjustments as below : ) Thank you Lyude for your
> > > > > > > > always kindly help!!
> > > > > > > >
> > > > > > > > Regards,
> > > > > > > > Wayne
> > > > > > > > > -----Original Message-----
> > > > > > > > > From: Lyude Paul <lyude@redhat.com>
> > > > > > > > > Sent: Wednesday, November 3, 2021 7:15 AM
> > > > > > > > > To: Lin, Wayne <Wayne.Lin@amd.com>
> > > > > > > > > Subject: [PATCH] WIP: drm/dp_mst: Add support for dumping
> > > > > > > > > topology ref histories from debugfs
> > > > > > > > >
> > > > > > > > > TODO:
> > > > > > > > > * Implement support for i915
> > > > > > > > > * Finish writing this commit message
> > > > > > > > > * ???
> > > > > > > > > * profit
> > > > > > > > >
> > > > > > > > > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > > > > > > > > ---
> > > > > > > > >
> > > > > > > > > Hey wayne! SO-hopefully if I did this correctly then this
> > > > > > > > > should just work on amdgpu. What this patch should do is =
add
> > > > > > > > > a debugfs file to amdgpu called
> > > > > > > > > "amdgpu_dp_mst_topology_refs", and when you read the file=
 it
> > > > > > > > > should print out the topology reference history of every
> > > > > > > > > MSTB and Port in memory, along with how many times we've =
hit
> > > > > > > > > the codepath in each backtrace. An example:
> > > > > > > > >
> > > > > > > > > Port DP-5 (0000000005c37748) topology ref history:
> > > > > > > > >   1 gets (last at    58.468973):
> > > > > > > > >      drm_dp_send_link_address+0x6a5/0xa00 [drm_kms_helper=
]
> > > > > > > > >      drm_dp_check_and_send_link_address+0xad/0xd0
> > > > > > > > > [drm_kms_helper]
> > > > > > > > >      drm_dp_mst_link_probe_work+0x14e/0x1a0 [drm_kms_help=
er]
> > > > > > > > >      process_one_work+0x1e3/0x390
> > > > > > > > >      worker_thread+0x50/0x3a0
> > > > > > > > >      kthread+0x124/0x150
> > > > > > > > >      ret_from_fork+0x1f/0x30
> > > > > > > > >   1 puts (last at    58.469357):
> > > > > > > > >      drm_dp_mst_topology_put_port+0x6a/0x210
> > > > > > > > > [drm_kms_helper]
> > > > > > > > >      drm_dp_send_link_address+0x39e/0xa00 [drm_kms_helper=
]
> > > > > > > > >      drm_dp_check_and_send_link_address+0xad/0xd0
> > > > > > > > > [drm_kms_helper]
> > > > > > > > >      drm_dp_mst_link_probe_work+0x14e/0x1a0 [drm_kms_help=
er]
> > > > > > > > >      process_one_work+0x1e3/0x390
> > > > > > > > >      worker_thread+0x50/0x3a0
> > > > > > > > >      kthread+0x124/0x150
> > > > > > > > >      ret_from_fork+0x1f/0x30
> > > > > > > > >
> > > > > > > > > The idea here is that if stream resources aren't being
> > > > > > > > > released, my guess would be that we're not dropping topol=
ogy
> > > > > > > > > references for the port which means the connector never g=
oes
> > > > > > > > > away. So, if that's really the case then once we unplug t=
he
> > > > > > > > > offending connector we should be able to find a pair of
> > > > > > > > > gets/puts for the offending leaked connector where the
> > > > > > > > > get/put count doesn't match up. Also, if the frame count =
on
> > > > > > > > > the backtrace isn't long enough you can increase the valu=
e
> > > > > > > > > of STACK_DEPTH in drivers/gpu/drm/drm_dp_mst_topology.c a=
nd
> > > > > > > > > recompile to get more frames.
> > > > > > > > >
> > > > > > > > > To enable this, first enable CONFIG_EXPERT for your kerne=
l
> > > > > > > > > which will unhide CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS.
> > > > > > > > > Then just enable CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS,
> > > > > > > > > recompile, and it should be good to go.
> > > > > > > > >
> > > > > > > > > Let me know if this works for you, and hopefully this sho=
uld
> > > > > > > > > tell us exactly what the problem actually is here.
> > > > > > > > >
> > > > > > > > >  .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c |  35 ++++
> > > > > > > > >  drivers/gpu/drm/drm_dp_mst_topology.c         | 173
> > > > > > > > > ++++++++++++++----
> > > > > > > > >  drivers/gpu/drm/nouveau/nouveau_debugfs.c     |  35 ++++
> > > > > > > > >  include/drm/drm_dp_mst_helper.h               |  18 ++
> > > > > > > > >  4 files changed, 228 insertions(+), 33 deletions(-)
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > diff --git
> > > > > > > > > a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs=
.c
> > > > > > > > > b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs=
.c
> > > > > > > > > index 1a68a674913c..1a14732c52b4 100644
> > > > > > > > > ---
> > > > > > > > > a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs=
.c
> > > > > > > > > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_deb=
ugf
> > > > > > > > > +++ s.c
> > > > > > > > > @@ -3063,6 +3063,37 @@ static int mst_topo_show(struct
> > > > > > > > > seq_file *m, void
> > > > > > > > > *unused)
> > > > > > > > >       return 0;
> > > > > > > > >  }
> > > > > > > > >
> > > > > > > > > +#ifdef CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS
> > > > > > > > > +static int mst_topology_ref_dump_show(struct seq_file *m=
,
> > > > > > > > > +void
> > > > > > > > > +*unused) {
> > > > > > > > > +     struct amdgpu_device *adev =3D (struct amdgpu_devic=
e
> > > > > > > > > +*)m->private;
> > > > > > > > > +     struct drm_device *dev =3D adev_to_drm(adev);
> > > > > > > > > +     struct drm_connector *connector;
> > > > > > > > > +     struct drm_connector_list_iter conn_iter;
> > > > > > > > > +     struct amdgpu_dm_connector *aconnector;
> > > > > > > > > +
> > > > > > > > > +     drm_connector_list_iter_begin(dev, &conn_iter);
> > > > > > > > > +     drm_for_each_connector_iter(connector, &conn_iter) =
{
> > > > > > > > > +             if (connector->connector_type !=3D
> > > > > > > > > DRM_MODE_CONNECTOR_DisplayPort)
> > > > > > > > > +                     continue;
> > > > > > > > > +
> > > > > > > > > +             aconnector =3D
> > > > > > > > > +to_amdgpu_dm_connector(connector);
> > > > > > > > > +
> > > > > > > > > +             /* Ensure we're only dumping the topology o=
f a
> > > > > > > > > +root mst node
> > > > > > > > > */
> > > > > > > > > +             if (!aconnector->mst_mgr.max_payloads)
> > > > > > > > > +                     continue;
> > > > > > > > > +
> > > > > > > > > +             seq_printf(m, "\nMST topology for connector
> > > > > > > > > +%d\n",
> > > > > > > > > aconnector->connector_id);
> > > > > > > > > +             drm_dp_mst_dump_topology_refs(m,
> > > > > > > > > +&aconnector->mst_mgr);
> > > > > > > > > +     }
> > > > > > > > > +     drm_connector_list_iter_end(&conn_iter);
> > > > > > > > > +
> > > > > > > > > +     return 0;
> > > > > > > > > +}
> > > > > > > > > +
> > > > > > > > > +DEFINE_SHOW_ATTRIBUTE(mst_topology_ref_dump);
> > > > > > > > > +#endif
> > > > > > > > > +
> > > > > > > > >  /*
> > > > > > > > >   * Sets trigger hpd for MST topologies.
> > > > > > > > >   * All connected connectors will be rediscovered and re
> > > > > > > > > started as needed if val of 1 is sent.
> > > > > > > > > @@ -3299,6 +3330,10 @@ void dtn_debugfs_init(struct
> > > > > > > > > amdgpu_device
> > > > > > > > > *adev)
> > > > > > > > >
> > > > > > > > >       debugfs_create_file("amdgpu_mst_topology", 0444, ro=
ot,
> > > > > > > > >                           adev, &mst_topo_fops);
> > > > > > > > > +#ifdef CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS
> > > > > > > > > +     debugfs_create_file("amdgpu_dp_mst_topology_refs",
> > > > > > > > > +0444, root, adev,
> > > > > > > > > +                         &mst_topology_ref_dump_fops);
> > > > > > > > > +#endif
> > > > > > > > >       debugfs_create_file("amdgpu_dm_dtn_log", 0644, root=
,
> > > > > > > > > adev,
> > > > > > > > >                           &dtn_log_fops);
> > > > > > > > >
> > > > > > > > > diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> > > > > > > > > b/drivers/gpu/drm/drm_dp_mst_topology.c
> > > > > > > > > index 1aa8702383d4..0159828c494d 100644
> > > > > > > > > --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> > > > > > > > > +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> > > > > > > > > @@ -1366,23 +1366,6 @@ static int
> > > > > > > > > drm_dp_mst_wait_tx_reply(struct drm_dp_mst_branch *mstb,
> > > > > > > > >       return ret;
> > > > > > > > >  }
> > > > > > > > >
> > > > > > > > > -static struct drm_dp_mst_branch
> > > > > > > > > *drm_dp_add_mst_branch_device(u8 lct, u8
> > > > > > > > > *rad) -{
> > > > > > > > > -     struct drm_dp_mst_branch *mstb;
> > > > > > > > > -
> > > > > > > > > -     mstb =3D kzalloc(sizeof(*mstb), GFP_KERNEL);
> > > > > > > > > -     if (!mstb)
> > > > > > > > > -             return NULL;
> > > > > > > > > -
> > > > > > > > > -     mstb->lct =3D lct;
> > > > > > > > > -     if (lct > 1)
> > > > > > > > > -             memcpy(mstb->rad, rad, lct / 2);
> > > > > > > > > -     INIT_LIST_HEAD(&mstb->ports);
> > > > > > > > > -     kref_init(&mstb->topology_kref);
> > > > > > > > > -     kref_init(&mstb->malloc_kref);
> > > > > > > > > -     return mstb;
> > > > > > > > > -}
> > > > > > > > > -
> > > > > > > > >  static void drm_dp_free_mst_branch_device(struct kref
> > > > > > > > > *kref)  {
> > > > > > > > >       struct drm_dp_mst_branch *mstb =3D @@ -1642,12 +162=
5,20
> > > > > > > > > @@ topology_ref_type_to_str(enum
> > > > > > > > > drm_dp_mst_topology_ref_type type)
> > > > > > > > >               return "put";
> > > > > > > > >  }
> > > > > > > > >
> > > > > > > > > +static const char *topology_ref_history_type_to_str(enum
> > > > > > > > > +drm_dp_mst_topology_history_type type) {
> > > > > > > > > +     if (type =3D=3D DRM_DP_MST_TOPOLOGY_HISTORY_PORT)
> > > > > > > > > +             return "Port";
> > > > > > > > > +     else
> > > > > > > > > +             return "MSTB"; }
> > > > > > > > > +
> > > > > > > > >  static void
> > > > > > > > > -__dump_topology_ref_history(struct
> > > > > > > > > drm_dp_mst_topology_ref_history *history,
> > > > > > > > > -                         void *ptr, const char *type_str=
)
> > > > > > > > > +dump_topology_ref_history(struct
> > > > > > > > > +drm_dp_mst_topology_ref_history *history, struct
> > > > > > > > > +drm_printer p)
> > > > > > > > >  {
> > > > > > > > > -     struct drm_printer p =3D drm_debug_printer(DBG_PREF=
IX);
> > > > > > > > > +     char *connector_name =3D NULL;
> > > > > > > > >       char *buf =3D kzalloc(PAGE_SIZE, GFP_KERNEL);
> > > > > > > > > +     void *ptr;
> > > > > > > > >       int i;
> > > > > > > > >
> > > > > > > > >       if (!buf)
> > > > > > > > > @@ -1656,14 +1647,29 @@ __dump_topology_ref_history(struc=
t
> > > > > > > > > drm_dp_mst_topology_ref_history *history,
> > > > > > > > >       if (!history->len)
> > > > > > > > >               goto out;
> > > > > > > > >
> > > > > > > > > +     /* Get a pointer to the actual MSTB/port so we can =
the
> > > > > > > > > +memory
> > > > > > > > > address to the kernel log */
> > > > > > > > > +     if (history->type =3D=3D DRM_DP_MST_TOPOLOGY_HISTOR=
Y_PORT)
> > > > > > > > > +             ptr =3D container_of(history, struct
> > > > > > > > > +drm_dp_mst_port,
> > > > > > > > > topology_ref_history);
> > > > > > > > > +     else
> > > > > > > > > +             ptr =3D container_of(history, struct
> > > > > > > > > +drm_dp_mst_branch, topology_ref_history);
> > > > > > > > > +
> > > > > > > > >       /* First, sort the list so that it goes from oldest=
 to
> > > > > > > > > newest
> > > > > > > > >        * reference entry
> > > > > > > > >        */
> > > > > > > > >       sort(history->entries, history->len,
> > > > > > > > > sizeof(*history->entries),
> > > > > > > > >            topology_ref_history_cmp, NULL);
> > > > > > > > >
> > > > > > > > > -     drm_printf(&p, "%s (%p) topology count reached 0,
> > > > > > > > > dumping history:\n",
> > > > > > > > > -                type_str, ptr);
> > > > > > > > > +     if (history->type =3D=3D DRM_DP_MST_TOPOLOGY_HISTOR=
Y_PORT)
> > > > > > > > > +{
> > > > > > > > > +             struct drm_dp_mst_port *port =3D ptr;
> > > > > > > > > +
> > > > > > > > > +             if (port->connector)
> > > > > > > > > +                     connector_name =3D
> > > > > > > > > +port->connector->name;
> > > > > > > > > +     }
> > > > > > > > > +     if (connector_name)
> > > > > > > > > +             drm_printf(&p, "Port %s (%p) topology ref
> > > > > > > > > +history:\n",
> > > > > > > > > connector_name, ptr);
> > > > > > > > > +     else
> > > > > > > > > +             drm_printf(&p, "%s (%p) topology ref
> > > > > > > > > +history:\n",
> > > > > > > > > +
> > > > > > > > > +topology_ref_history_type_to_str(history->type),
> > > > > > > > > ptr);
> > > > > > > > >
> > > > > > > > >       for (i =3D 0; i < history->len; i++) {
> > > > > > > > >               const struct drm_dp_mst_topology_ref_entry
> > > > > > > > > *entry =3D @@
> > > > > > > > > -
> > > > > > > > > 1682,24 +1688,92 @@ __dump_topology_ref_history(struct
> > > > > > > > > drm_dp_mst_topology_ref_history *history,
> > > > > > > > >                          ts_nsec, rem_nsec / 1000, buf);
> > > > > > > > >       }
> > > > > > > > >
> > > > > > > > > -     /* Now free the history, since this is the only tim=
e
> > > > > > > > > we expose it */
> > > > > > > > > -     kfree(history->entries);
> > > > > > > > >  out:
> > > > > > > > >       kfree(buf);
> > > > > > > > >  }
> > > > > > > > >
> > > > > > > > > +/**
> > > > > > > > > + * drm_dp_mst_dump_topology_refs - helper function for
> > > > > > > > > +dumping the topology ref history
> > > > > > > > > + * @m: File to print to
> > > > > > > > > + * @mgr: &struct drm_dp_mst_topology_mgr to use
> > > > > > > > > + *
> > > > > > > > > + * Prints the topology ref history of all ports and MSTB=
s
> > > > > > > > > +on @mgr that are still in memory,
> > > > > > > > > + * regardless of whether they're actually still reachabl=
e
> > > > > > > > > +through the topology or not. Only enabled
> > > > > > > > > + * when %CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS is enable=
d.
> > > > > > > > > +Can be implemented by drivers to assist
> > > > > > > > > + * with debugging leaks in the DP MST helpers.
> > > > > > > > > + */
> > > > > > > > > +void drm_dp_mst_dump_topology_refs(struct seq_file *m,
> > > > > > > > > +struct drm_dp_mst_topology_mgr *mgr) {
> > > > > > > > > +     struct drm_dp_mst_topology_ref_history *history;
> > > > > > > > > +     struct drm_printer p =3D drm_seq_file_printer(m);
> > > > > > > > > +
> > > > > > > > > +     mutex_lock(&mgr->topology_ref_history_lock);
> > > > > > > > > +     list_for_each_entry(history,
> > > > > > > > > +&mgr->topology_ref_history_list,
> > > > > > > > > +node)
> > > > > > > > > +             dump_topology_ref_history(history, p);
> > > > > > > > > +     mutex_unlock(&mgr->topology_ref_history_lock);
> > > > > > > > > +}
> > > > > > > > > +EXPORT_SYMBOL(drm_dp_mst_dump_topology_refs);
> > > > > > > > > +
> > > > > > > > > +static void
> > > > > > > > > +__init_topology_ref_history(struct
> > > > > > > > > +drm_dp_mst_topology_ref_history
> > > > > > > > > *history,
> > > > > > > > > +                         struct drm_dp_mst_topology_mgr
> > > > > > > > > +*mgr,
> > > > > > > > > +                         enum
> > > > > > > > > +drm_dp_mst_topology_history_type
> > > > > > > > > +type) {
> > > > > > > > > +     history->type =3D type;
> > > > > > > > > +     INIT_LIST_HEAD(&history->node);
> > > > > > > > > +
> > > > > > > > > +     mutex_lock(&mgr->topology_ref_history_lock);
> > > > > > > > > +     list_add(&history->node,
> > > > > > > > > +&mgr->topology_ref_history_list);
> > > > > > > > > +     mutex_unlock(&mgr->topology_ref_history_lock);
> > > > > > > > > +}
> > > > > > > > > +
> > > > > > > > > +static void
> > > > > > > > > +__destroy_topology_ref_history(struct
> > > > > > > > > +drm_dp_mst_topology_ref_history
> > > > > > > > > *history,
> > > > > > > > > +                            struct drm_dp_mst_topology_m=
gr
> > > > > > > > > +*mgr) {
> > > > > > > > > +     mutex_lock(&mgr->topology_ref_history_lock);
> > > > > > > > > +     list_del(&mgr->topology_ref_history_list);
> > > > > > > > > +     mutex_unlock(&mgr->topology_ref_history_lock);
> > > > > > > > > +
> > > > > > > > > +     kfree(history->entries); }
> > > > > > > > > +
> > > > > > > > > +static __always_inline void
> > > > > > > > > +init_port_topology_history(struct drm_dp_mst_topology_mg=
r
> > > > > > > > > +*mgr, struct drm_dp_mst_port *port) {
> > > > > > > > > +
> > > > > > > > > +__init_topology_ref_history(&port->topology_ref_history,
> > > > > > > > > +mgr,
> > > > > > > > > +
> > > > > > > > > +DRM_DP_MST_TOPOLOGY_HISTORY_PORT);
> > > > > > > > > +}
> > > > > > > > > +
> > > > > > > > > +static __always_inline void
> > > > > > > > > +init_mstb_topology_history(struct drm_dp_mst_topology_mg=
r
> > > > > > > > > +*mgr, struct drm_dp_mst_branch *mstb) {
> > > > > > > > > +
> > > > > > > > > +__init_topology_ref_history(&mstb->topology_ref_history,
> > > > > > > > > +mgr,
> > > > > > > > > +
> > > > > > > > > +DRM_DP_MST_TOPOLOGY_HISTORY_MSTB);
> > > > > > > > > +}
> > > > > > > > > +
> > > > > > > > > +static __always_inline void
> > > > > > > > > +destroy_port_topology_history(struct drm_dp_mst_port *po=
rt)
> > > > > > > > > +{
> > > > > > > > > +
> > > > > > > > > +__destroy_topology_ref_history(&port->topology_ref_histo=
ry,
> > > > > > > > > +port->mgr); }
> > > > > > > > > +
> > > > > > > > > +static __always_inline void
> > > > > > > > > +destroy_mstb_topology_history(struct drm_dp_mst_branch
> > > > > > > > > +*mstb) {
> > > > > > > > > +
> > > > > > > > > +__destroy_topology_ref_history(&mstb->topology_ref_histo=
ry,
> > > > > > > > > +mstb->mgr); }
> > > > > > > > > +
> > > > > > > > >  static __always_inline void
> > > > > > > > >  dump_mstb_topology_history(struct drm_dp_mst_branch *mst=
b)
> > > > > > > > > {
> > > > > > > > > -
> > > > > > > > > __dump_topology_ref_history(&mstb->topology_ref_history,
> > > > > > > > > mstb,
> > > > > > > > > -                                 "MSTB");
> > > > > > > > > +     dump_topology_ref_history(&mstb->topology_ref_histo=
ry,
> > > > > > > > > +drm_debug_printer(DBG_PREFIX));
> > > > > > > > >  }
> > > > > > > > >
> > > > > > > > >  static __always_inline void
> > > > > > > > >  dump_port_topology_history(struct drm_dp_mst_port *port)=
  {
> > > > > > > > > -
> > > > > > > > > __dump_topology_ref_history(&port->topology_ref_history,
> > > > > > > > > port,
> > > > > > > > > -                                 "Port");
> > > > > > > > > +     dump_topology_ref_history(&port->topology_ref_histo=
ry,
> > > > > > > > > +drm_debug_printer(DBG_PREFIX));
> > > > > > > > >  }
> > > > > > > > >
> > > > > > > > >  static __always_inline void @@ -1729,6 +1803,14 @@
> > > > > > > > > topology_ref_history_unlock(struct
> > > > > > > > > drm_dp_mst_topology_mgr *mgr)  }  #else  static inline vo=
id
> > > > > > > > > +init_port_topology_history(struct drm_dp_mst_topology_mg=
r
> > > > > > > > > +*mgr, struct drm_dp_mst_port *port); static inline void
> > > > > > > > Should also add the bracket, otherwise will get warnings.
> > > > > > > > =3D> static inline void init_port_topology_history(struct
> > > > > > > > drm_dp_mst_topology_mgr *mgr, struct drm_dp_mst_port *port)
> > > > > > > > {};
> > > > > > > >
> > > > > > > > > +init_mstb_topology_history(struct drm_dp_mst_topology_mg=
r
> > > > > > > > > +*mgr, struct drm_dp_mst_branch *mstb); static inline voi=
d
> > > > > > > > Same as above
> > > > > > > > =3D> static inline void init_mstb_topology_history(struct
> > > > > > > > drm_dp_mst_topology_mgr *mgr, struct drm_dp_mst_branch *mst=
b)
> > > > > > > > {};
> > > > > > > >
> > > > > > > > > +destroy_port_topology_history(struct
> > > > > > > > > +drm_dp_mst_topology_mgr *mgr, struct drm_dp_mst_port
> > > > > > > > > +*port); static inline void
> > > > > > > > destroy_port_topology_history() takes one parameter only wh=
ich
> > > > > > > > is port.
> > > > > > > > =3D> destroy_port_topology_history(struct drm_dp_mst_port *=
port)
> > > > > > > > {};
> > > > > > > >
> > > > > > > > > +destroy_mstb_topology_history(struct
> > > > > > > > > +drm_dp_mst_topology_mgr *mgr, struct drm_dp_mst_branch
> > > > > > > > > +*mstb); static inline void
> > > > > > > > destroy_mstb_topology_history() takes one parameter only wh=
ich
> > > > > > > > is mstb =3D> destroy_mstb_topology_history(struct
> > > > > > > > drm_dp_mst_branch
> > > > > > > > *mstb) {};
> > > > > > > >
> > > > > > > > >  topology_ref_history_lock(struct drm_dp_mst_topology_mgr
> > > > > > > > > *mgr) {} static inline void
> > > > > > > > > topology_ref_history_unlock(struct
> > > > > > > > > drm_dp_mst_topology_mgr *mgr) {} @@ -1740,6 +1822,25 @@
> > > > > > > > > dump_port_topology_history(struct drm_dp_mst_port *port) =
{}
> > > > > > > > > #define save_port_topology_ref(port, type)  #endif
> > > > > > > > >
> > > > > > > > > +static struct drm_dp_mst_branch *
> > > > > > > > > +drm_dp_add_mst_branch_device(struct drm_dp_mst_topology_=
mgr
> > > > > > > > > +*mgr,
> > > > > > > > > +u8 lct, u8 *rad) {
> > > > > > > > > +     struct drm_dp_mst_branch *mstb;
> > > > > > > > > +
> > > > > > > > > +     mstb =3D kzalloc(sizeof(*mstb), GFP_KERNEL);
> > > > > > > > > +     if (!mstb)
> > > > > > > > > +             return NULL;
> > > > > > > > > +
> > > > > > > > > +     mstb->lct =3D lct;
> > > > > > > > > +     if (lct > 1)
> > > > > > > > > +             memcpy(mstb->rad, rad, lct / 2);
> > > > > > > > > +     INIT_LIST_HEAD(&mstb->ports);
> > > > > > > > > +     kref_init(&mstb->topology_kref);
> > > > > > > > > +     kref_init(&mstb->malloc_kref);
> > > > > > > > > +     init_mstb_topology_history(mgr, mstb);
> > > > > > > > > +     return mstb;
> > > > > > > > > +}
> > > > > > > > > +
> > > > > > > > >  static void drm_dp_destroy_mst_branch_device(struct kref
> > > > > > > > > *kref) {
> > > > > > > > >       struct drm_dp_mst_branch *mstb =3D @@ -1747,6 +1848=
,7 @@
> > > > > > > > > static void drm_dp_destroy_mst_branch_device(struct
> > > > > > > > > kref *kref)
> > > > > > > > >       struct drm_dp_mst_topology_mgr *mgr =3D mstb->mgr;
> > > > > > > > >
> > > > > > > > >       dump_mstb_topology_history(mstb);
> > > > > > > > > +     destroy_mstb_topology_history(mstb);
> > > > > > > > >
> > > > > > > > >       INIT_LIST_HEAD(&mstb->destroy_next);
> > > > > > > > >
> > > > > > > > > @@ -1856,6 +1958,7 @@ static void drm_dp_destroy_port(str=
uct
> > > > > > > > > kref
> > > > > > > > > *kref)
> > > > > > > > >       struct drm_dp_mst_topology_mgr *mgr =3D port->mgr;
> > > > > > > > >
> > > > > > > > >       dump_port_topology_history(port);
> > > > > > > > > +     destroy_port_topology_history(port);
> > > > > > > > >
> > > > > > > > >       /* There's nothing that needs locking to destroy an
> > > > > > > > > input port yet */
> > > > > > > > >       if (port->input) {
> > > > > > > > > @@ -2135,7 +2238,7 @@ drm_dp_port_set_pdt(struct
> > > > > > > > > drm_dp_mst_port *port, u8 new_pdt,
> > > > > > > > >                       ret =3D
> > > > > > > > > drm_dp_mst_register_i2c_bus(port);
> > > > > > > > >               } else {
> > > > > > > > >                       lct =3D drm_dp_calculate_rad(port, =
rad);
> > > > > > > > > -                     mstb =3D
> > > > > > > > > drm_dp_add_mst_branch_device(lct, rad);
> > > > > > > > > +                     mstb =3D
> > > > > > > > > +drm_dp_add_mst_branch_device(mgr, lct, rad);
> > > > > > > > >                       if (!mstb) {
> > > > > > > > >                               ret =3D -ENOMEM;
> > > > > > > > >                               drm_err(mgr->dev, "Failed t=
o
> > > > > > > > > create MSTB for port %p", port); @@ -2366,6 +2469,8 @@
> > > > > > > > > drm_dp_mst_add_port(struct drm_device *dev,
> > > > > > > > >        */
> > > > > > > > >       drm_dp_mst_get_mstb_malloc(mstb);
> > > > > > > > >
> > > > > > > > > +     init_port_topology_history(mgr, port);
> > > > > > > > > +
> > > > > > > > >       return port;
> > > > > > > > >  }
> > > > > > > > >
> > > > > > > > > @@ -3745,7 +3850,7 @@ int
> > > > > > > > > drm_dp_mst_topology_mgr_set_mst(struct
> > > > > > > > > drm_dp_mst_topology_mgr *mgr, bool ms
> > > > > > > > >               }
> > > > > > > > >
> > > > > > > > >               /* add initial branch device at LCT 1 */
> > > > > > > > > -             mstb =3D drm_dp_add_mst_branch_device(1, NU=
LL);
> > > > > > > > > +             mstb =3D drm_dp_add_mst_branch_device(mgr, =
1,
> > > > > > > > > +NULL);
> > > > > > > > >               if (mstb =3D=3D NULL) {
> > > > > > > > >                       ret =3D -ENOMEM;
> > > > > > > > >                       goto out_unlock; @@ -5512,14 +5617,=
16
> > > > > > > > > @@ int drm_dp_mst_topology_mgr_init(struct
> > > > > > > > > drm_dp_mst_topology_mgr *mgr,
> > > > > > > > >       mutex_init(&mgr->delayed_destroy_lock);
> > > > > > > > >       mutex_init(&mgr->up_req_lock);
> > > > > > > > >       mutex_init(&mgr->probe_lock); -#if
> > > > > > > > > IS_ENABLED(CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS)
> > > > > > > > > -     mutex_init(&mgr->topology_ref_history_lock);
> > > > > > > > > -#endif
> > > > > > > > >       INIT_LIST_HEAD(&mgr->tx_msg_downq);
> > > > > > > > >       INIT_LIST_HEAD(&mgr->destroy_port_list);
> > > > > > > > >       INIT_LIST_HEAD(&mgr->destroy_branch_device_list);
> > > > > > > > >       INIT_LIST_HEAD(&mgr->up_req_list);
> > > > > > > > >
> > > > > > > > > +#if IS_ENABLED(CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS)
> > > > > > > > > +     mutex_init(&mgr->topology_ref_history_lock);
> > > > > > > > > +     INIT_LIST_HEAD(&mgr->topology_ref_history_list);
> > > > > > > > > +#endif
> > > > > > > > > +
> > > > > > > > >       /*
> > > > > > > > >        * delayed_destroy_work will be queued on a dedicat=
ed
> > > > > > > > > WQ, so that any
> > > > > > > > >        * requeuing will be also flushed when deiniting th=
e
> > > > > > > > > topology manager.
> > > > > > > > > diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> > > > > > > > > b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> > > > > > > > > index 1cbe01048b93..53ec7c1daada 100644
> > > > > > > > > --- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> > > > > > > > > +++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> > > > > > > > > @@ -29,9 +29,13 @@
> > > > > > > > >   */
> > > > > > > > >
> > > > > > > > >  #include <linux/debugfs.h>
> > > > > > > > > +#include <drm/drm_dp_mst_helper.h> #include
> > > > > > > > > +<drm/drm_encoder.h>
> > > > > > > > >  #include <nvif/class.h>
> > > > > > > > >  #include <nvif/if0001.h>
> > > > > > > > > +#include <nouveau_encoder.h>
> > > > > > > > >  #include "nouveau_debugfs.h"
> > > > > > > > > +#include "nouveau_display.h"
> > > > > > > > >  #include "nouveau_drv.h"
> > > > > > > > >
> > > > > > > > >  static int
> > > > > > > > > @@ -68,6 +72,34 @@ nouveau_debugfs_strap_peek(struct
> > > > > > > > > seq_file *m, void
> > > > > > > > > *data)
> > > > > > > > >       return 0;
> > > > > > > > >  }
> > > > > > > > >
> > > > > > > > > +#ifdef CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS
> > > > > > > > > +static int nouveau_debugfs_mst_topology_history(struct
> > > > > > > > > +seq_file *m, void *data) {
> > > > > > > > > +     struct drm_info_node *node =3D m->private;
> > > > > > > > > +     struct drm_device *dev =3D node->minor->dev;
> > > > > > > > > +     struct drm_encoder *encoder;
> > > > > > > > > +     struct nouveau_display *disp =3D nouveau_display(de=
v);
> > > > > > > > > +
> > > > > > > > > +     if (disp->disp.object.oclass < GF110_DISP)
> > > > > > > > > +             return -EINVAL;
> > > > > > > > > +
> > > > > > > > > +     drm_for_each_encoder(encoder, dev) {
> > > > > > > > > +             struct nv50_mstm *mstm;
> > > > > > > > > +
> > > > > > > > > +             /* We need the real encoder for each MST mg=
r
> > > > > > > > > +*/
> > > > > > > > > +             if (encoder->encoder_type !=3D
> > > > > > > > > +DRM_MODE_ENCODER_TMDS)
> > > > > > > > > +                     continue;
> > > > > > > > > +             mstm =3D nouveau_encoder(encoder)->dp.mstm;
> > > > > > > > > +             if (!mstm)
> > > > > > > > > +                     continue;
> > > > > > > > > +
> > > > > > > > > +             seq_printf(m, "MSTM on %s:\n", encoder->nam=
e);
> > > > > > > > > +             drm_dp_mst_dump_topology_refs(m, &mstm->mgr=
);
> > > > > > > > > +     }
> > > > > > > > > +     return 0;
> > > > > > > > > +}
> > > > > > > > > +#endif
> > > > > > > > > +
> > > > > > > > >  static int
> > > > > > > > >  nouveau_debugfs_pstate_get(struct seq_file *m, void *dat=
a)
> > > > > > > > > { @@
> > > > > > > > > -213,6
> > > > > > > > > +245,9 @@ static const struct file_operations
> > > > > > > > > nouveau_pstate_fops =3D {  static struct drm_info_list
> > > > > > > > > nouveau_debugfs_list[] =3D {
> > > > > > > > >       { "vbios.rom",  nouveau_debugfs_vbios_image, 0, NUL=
L
> > > > > > > > > },
> > > > > > > > >       { "strap_peek", nouveau_debugfs_strap_peek, 0, NULL=
 },
> > > > > > > > > +#ifdef CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS
> > > > > > > > > +     { "dp_mst_topology_refs",
> > > > > > > > > +nouveau_debugfs_mst_topology_history, 0, NULL }, #endif
> > > > > > > > >  };
> > > > > > > > >  #define NOUVEAU_DEBUGFS_ENTRIES
> > > > > > > > > ARRAY_SIZE(nouveau_debugfs_list)
> > > > > > > > >
> > > > > > > > > diff --git a/include/drm/drm_dp_mst_helper.h
> > > > > > > > > b/include/drm/drm_dp_mst_helper.h index
> > > > > > > > > 78044ac5b59b..e3a73d8d97c0
> > > > > > > > > 100644
> > > > > > > > > --- a/include/drm/drm_dp_mst_helper.h
> > > > > > > > > +++ b/include/drm/drm_dp_mst_helper.h
> > > > > > > > > @@ -35,6 +35,11 @@ enum drm_dp_mst_topology_ref_type {
> > > > > > > > >       DRM_DP_MST_TOPOLOGY_REF_PUT,
> > > > > > > > >  };
> > > > > > > > >
> > > > > > > > > +enum drm_dp_mst_topology_history_type {
> > > > > > > > > +     DRM_DP_MST_TOPOLOGY_HISTORY_PORT,
> > > > > > > > > +     DRM_DP_MST_TOPOLOGY_HISTORY_MSTB, };
> > > > > > > > > +
> > > > > > > > >  struct drm_dp_mst_topology_ref_history {
> > > > > > > > >       struct drm_dp_mst_topology_ref_entry {
> > > > > > > > >               enum drm_dp_mst_topology_ref_type type; @@
> > > > > > > > > -43,6
> > > > > > > > > +48,9 @@ struct drm_dp_mst_topology_ref_history {
> > > > > > > > >               depot_stack_handle_t backtrace;
> > > > > > > > >       } *entries;
> > > > > > > > >       int len;
> > > > > > > > > +
> > > > > > > > > +     enum drm_dp_mst_topology_history_type type;
> > > > > > > > > +     struct list_head node;
> > > > > > > > >  };
> > > > > > > > >  #endif /* IS_ENABLED(CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_RE=
FS)
> > > > > > > > > */
> > > > > > > > >
> > > > > > > > > @@ -769,6 +777,12 @@ struct drm_dp_mst_topology_mgr {
> > > > > > > > >        * &drm_dp_mst_branch.topology_ref_history.
> > > > > > > > >        */
> > > > > > > > >       struct mutex topology_ref_history_lock;
> > > > > > > > > +
> > > > > > > > > +     /**
> > > > > > > > > +      * @topology_ref_history_list: contains a list of
> > > > > > > > > +topology ref
> > > > > > > > > histories for any MSTBs or
> > > > > > > > > +      * ports that are still in memory
> > > > > > > > > +      */
> > > > > > > > > +     struct list_head topology_ref_history_list;
> > > > > > > > >  #endif
> > > > > > > > >  };
> > > > > > > > >
> > > > > > > > > @@ -873,6 +887,10 @@ void drm_dp_mst_put_port_malloc(stru=
ct
> > > > > > > > > drm_dp_mst_port *port);
> > > > > > > > >
> > > > > > > > >  struct drm_dp_aux *drm_dp_mst_dsc_aux_for_port(struct
> > > > > > > > > drm_dp_mst_port *port);
> > > > > > > > >
> > > > > > > > > +#ifdef CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS
> > > > > > > > > +void drm_dp_mst_dump_topology_refs(struct seq_file *m,
> > > > > > > > > +struct drm_dp_mst_topology_mgr *mgr); #endif
> > > > > > > > > +
> > > > > > > > >  extern const struct drm_private_state_funcs
> > > > > > > > > drm_dp_mst_topology_state_funcs;
> > > > > > > > >
> > > > > > > > >  /**
> > > > > > > > > --
> > > > > > > > > 2.31.1
> > > > > > > >
> > > > > > >
> > > > > > > --
> > > > > > > Cheers,
> > > > > > >  Lyude Paul (she/her)
> > > > > > >  Software Engineer at Red Hat
> > > > >
> > > >
> > >
> > > --
> > > Cheers, Lyude Paul (she/her) Software Engineer at Red Hat
> > --
> > Regards,
> > Wayne Lin
> >
>
> --
> Cheers,
>  Lyude Paul (she/her)
>  Software Engineer at Red Hat
--
Regards,
Wayne Lin

