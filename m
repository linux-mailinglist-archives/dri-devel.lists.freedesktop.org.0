Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE36368976D
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 12:01:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3972F10E768;
	Fri,  3 Feb 2023 11:01:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2088.outbound.protection.outlook.com [40.107.8.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A701410E768
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Feb 2023 11:01:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gkk5MnhUOSY4d/fprafhj57cpyciosG3ZoN8jG+i/58huW7j76PTl09IatLzEEHaXvOQk05KAHegRS/LIl5cKtORcRAmG5qfk/+0gaFP2KB8TskXW6h4dtpT5OjN5IO+XxE3j5hL0Bj3qBdY4MytMkgZ1J1u0Z8P9pHsWb160UQH3WETurQoCvrXMn6XX8lk0UcsboafEL8dTIV9jmOXybROGuEHjX6DglbOMZzC6ledBf/YLj39QAWFPimr3bLyE7BmN/kUPGu88Fjc0dXiTNR71ZhOof68j0X0Xz1Zf7TopEcEaUm3Kxq0VXRNMtzL5w9XJ8A3PSJC7V0ekvha5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W5M650e+Gzx1Jf/kYVnzNa81rXvthm2xMCZX+i6MMbI=;
 b=GtjK0UFv+NGCdUEBdM7dVyhXFwxLD8BCU81dTP+OnUlo6qUXSrm+bkBiH9BkLFBXR7e4i1v06vShbVobOU6mPiGpfj9B+3d2md4OrRY9yuZf+kTzvFuWS/1WDmaB/eYaNnOcTIZ8P4TDEXPjDNF96ypkAUeRdgF9fMogqnCaIlqw6rh+a3DGKDKktRF3OUmRVY71AP5hjM38u9E2kS4LsyC03QSpxy9pOTX9cMMRlr6pg8Tr2QUaY9vAlmb8gNiOWWRoT60V3CtiOVnL3K55YycRIaU3GXU9V12lljai+554fkH2pvxg3o4XU2c+LFVzJZesF8cmyLho3ing4ip2mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W5M650e+Gzx1Jf/kYVnzNa81rXvthm2xMCZX+i6MMbI=;
 b=gujc7amHQ1X97gGUpARqreXfLXzNBAINAhS2IrEBnZuRm3naV0AYYp2eCE4q2oiYSBOtB3qDG6/V3iBGAZPdCwvr6hXMSqgShmlZtELYTeExO+0XXMquFHMaL6CDYXRuIi1sxnQQHuvS3k+2ncP6yOzsdupvu+AbAo1/9mlaQmg=
Received: from DB8PR04MB6746.eurprd04.prod.outlook.com (2603:10a6:10:10f::23)
 by AS8PR04MB9094.eurprd04.prod.outlook.com (2603:10a6:20b:445::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.23; Fri, 3 Feb
 2023 11:01:04 +0000
Received: from DB8PR04MB6746.eurprd04.prod.outlook.com
 ([fe80::9b97:45f4:f45f:e97e]) by DB8PR04MB6746.eurprd04.prod.outlook.com
 ([fe80::9b97:45f4:f45f:e97e%6]) with mapi id 15.20.6064.031; Fri, 3 Feb 2023
 11:01:04 +0000
From: Olivier Masse <olivier.masse@nxp.com>
To: "sumit.garg@linaro.org" <sumit.garg@linaro.org>,
 "etienne.carriere@linaro.org" <etienne.carriere@linaro.org>
Subject: Re: [EXT] Re: [PATCH v2 1/1] tee: new ioctl to a register tee_shm
 from a dmabuf file descriptor
Thread-Topic: [EXT] Re: [PATCH v2 1/1] tee: new ioctl to a register tee_shm
 from a dmabuf file descriptor
Thread-Index: AQHZMj2sccQANWLIb0CkERLUIPuRua65mRQAgAG6IQCAAArRgIAAF0mAgAGj0oA=
Date: Fri, 3 Feb 2023 11:01:04 +0000
Message-ID: <c86d1a46af6e076038b3f0c2dd68213ff1e8b254.camel@nxp.com>
References: <20220812143055.12938-1-olivier.masse@nxp.com>
 <20220812143055.12938-2-olivier.masse@nxp.com>
 <30534fadb8172088eddef46ae71d87c167cbf32e.camel@nxp.com>
 <CAFA6WYOMCswgHHxsgc9Hgi7rmTPaZDqce=BixvYoFTfL0bTFDQ@mail.gmail.com>
 <PA4PR04MB75204E8D2B959893A04D55F388D69@PA4PR04MB7520.eurprd04.prod.outlook.com>
 <CAFA6WYPGT8xZnB1idcxcHT1bvM=0kwFssBQbn063-qg=czM-ZQ@mail.gmail.com>
 <CAN5uoS8XgvAKVwKHx-uOe3hAa4Jrd5FJt6xNOG5s-simkRND9w@mail.gmail.com>
In-Reply-To: <CAN5uoS8XgvAKVwKHx-uOe3hAa4Jrd5FJt6xNOG5s-simkRND9w@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR04MB6746:EE_|AS8PR04MB9094:EE_
x-ms-office365-filtering-correlation-id: 9cfbb0f6-2556-48d3-a161-08db05d5f1b5
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r7DvtGb5tAarR81/reZ5DxWG1KzY0pEvtEJ+1VpBtVDVs+poD/eAQ14tSQyVku9Qw3W6axzzxKC9MVb2yTP9otBxvnGpa4VxcfYLf4hVTsbcg5yEZ+gjToUF1KL3wAaAHMH2Su+mQN2W6fR0nYsILaeWz4ktMeoFi7Yko2BC02cGv3fo8DCXjxXy0JyvYAQjwdGMTtLGhUor2fBMm9mYHGqe0JjpJQ6iwI6+HgpRuMTpJY8+eS8jAJZrkeFZVqHxjYaKLwn0TPQGpuEspn3uiAMwgMcujHvWjmQDBj77vHHDreHlYMHBL8PSC2k8DYP9fylXIGa0G246F6cJBcLAPVNV9WktAWRHM9uOi9LiIDfbqH+oX/af68MpL8EV1O5nUaTqBvbJ1iixpV3/rBwTMe4nUd8y6WLl8buL2TtxZuUkViLUg+MSaZqzVjirkfZfnnYOBIPNV2mcaKMIA0sTbqPgRbehFzHBZ9/7cqtlcPFFrmF0oV8p41+LjDl62KVM5eCQNgK9wHWUSwqjWeePoSRqp7IIPn6HTgvDwDS1WjJJTQ6MOVwaO3ZQFLDWP6xjCeGOzLHzphw+w8xry8Kn3f84k4zleBksBuELcvtcNopnfVS/h8ZNFoKjlLxz6Fb+RJ7tZsbQVjfq9u7USqajXSCac/R1/zD7vdLXcPSWtj7bCTR7NYK1J+0nut8LHy/j1mmNYUMXUoBh2bCDWJeeLcdXJuEk/AVBw7p72MCsD5rZ7aCIT5I6zsBvhrGh+6c2xE5Z8fVPS1F0nf40fRGsZg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB8PR04MB6746.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(376002)(346002)(39860400002)(136003)(366004)(451199018)(36756003)(91956017)(478600001)(83380400001)(8676002)(38100700002)(4326008)(76116006)(45080400002)(64756008)(66446008)(66476007)(66556008)(66946007)(54906003)(110136005)(122000001)(316002)(6506007)(6512007)(5660300002)(26005)(186003)(53546011)(966005)(44832011)(6486002)(7416002)(66574015)(41300700001)(38070700005)(86362001)(71200400001)(2616005)(8936002)(2906002)(30864003)(579004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-15?Q?ClEfbs77COojnhHMUtfNM1iVJizgrlBybERqJ0N0h4KHx/lP8Xdw23kS8?=
 =?iso-8859-15?Q?2ox3C1GlTRaJQy0oDPnJghZmcJOzYHk7p5t/Lz673GMEDw0/KR76Mfyrg?=
 =?iso-8859-15?Q?XyZdVjzn4Hka9QqyjlZFR5Fa/Clhhv1DMziYMz4EzzEUSNPWlAMrY/nSM?=
 =?iso-8859-15?Q?S2jE4WASjvYSCWlCd9p5kqg9cHlUsuxns6lrb8VpLSpZCBCluORKu139D?=
 =?iso-8859-15?Q?f2ZIgDoXIY/Fl0epvr71Ficv/Jy1jfaUH3O4Mma9vreZSR+iuN9EXaCMw?=
 =?iso-8859-15?Q?vZOpDRaioerr7Eh5cGdOcldu9ThUtXZhc9q+kYuOseLti26tasx5H4zqk?=
 =?iso-8859-15?Q?QsLN4JdJej3rlDuOatImNi4WVTWIJlDhF8mgellrt/pPzxvsWmWpymAPB?=
 =?iso-8859-15?Q?xAaH0u7s8NYZ/QHKhC9RjTbuH13IUuEzGMcnand9tqf9hkf2+zDfWGr57?=
 =?iso-8859-15?Q?INT+oqUoVzM1pXfpI512MMZpGD3CjdJqKsdUR9Xzndh5suPJnl5vDuIbn?=
 =?iso-8859-15?Q?jSuGQ32iRwEjKpcbwSUcruGwKbzsFSM1oxLrPfXhR5/JDD2P/wKIk7adu?=
 =?iso-8859-15?Q?dBryKreb8vzDWQrJsE0lsLwN4HiyaQyesFW6htQA6cnRw42NJNLjLkfTz?=
 =?iso-8859-15?Q?Y0neXzTkYSlNz4edxsSW9oPMMC8NDqIQx7Yo1C48cglE7wKtEJEOUago0?=
 =?iso-8859-15?Q?uxuwbVM64cObTHxq8Psy6PmmIjxEZU6TfAluALSeFUpSv06zqcQRbYc4L?=
 =?iso-8859-15?Q?1u6QBaZHy6JysPBRrCKZ80Xkbuu7m2wWYImgyhnrAqgmgDH522EivFiWq?=
 =?iso-8859-15?Q?Zw1Ep3NBC0rjK1SnqD+8x9iPb7LTJwECmoBPCcfgFnM41WGm+o41juo8U?=
 =?iso-8859-15?Q?dcan4xNyogh0Q062IJnG9cj6QFpqckZDQqYeif//BaYDbdJN7eokvbrS0?=
 =?iso-8859-15?Q?L6X8IY24O3yWdR7PQ0X3oAWsN3pPfkoky1BSaIDAN0MCh9h6aTMYDXs8u?=
 =?iso-8859-15?Q?5ZWOdtOO9fUfdmR30x3FRl0PQEQsTvLihrLrAlAnVVjrbjVTK7nxhlZFA?=
 =?iso-8859-15?Q?NCFy1ro82+qm1SvSk8LbF7T7RjWbDjWcu3n81lNpyOqa7bjYG7Lbj37rc?=
 =?iso-8859-15?Q?ThwbMmix+QMdy4/Z/xzVGSpKQzdklPxkGCzPLmI71nsmaDS6XJ7jPegFW?=
 =?iso-8859-15?Q?alpcGrOoYCjdq+n5CvH0aXUDnsBoGcJVr7wKxBJxcpJXigbBvcqbhGkyK?=
 =?iso-8859-15?Q?kzCNrRSORh7BMg76A6lasBYGnfUwWE8xOFWC3LZC8q1iB+BsXf2Pb7B0+?=
 =?iso-8859-15?Q?ywGoJ94o1nC+emmYuaFlK725mw3SALb61h+UyIfS2StCJ2ZWVMyN4aZ+N?=
 =?iso-8859-15?Q?BD6PRfEaOiCQcN1E+NFuF+OCl/nMnAvJDmpaahQr272d/I9vgkAUYI1xS?=
 =?iso-8859-15?Q?JRsRBn7rfHMAycSVRwBnh+hhnvOACxxsaHo/DK9mCWhyDu0ZzWhd5Fy65?=
 =?iso-8859-15?Q?HX0Ckv6+bmuYJsa+wRgTJ8D5vcsKYFuEBjeEBEbS8G3hkSNt8XsxnuD3r?=
 =?iso-8859-15?Q?n+ecFKPzbtlSVQAWH5BzhEu0pAhJn9cjbWn4gefQYCttWrBtu2fk4c34E?=
 =?iso-8859-15?Q?k9xwvXqH7f9DtC34r7nWqoJvgZ0asTN3g3ieL8bRN18F189JLJsJ4A1dE?=
 =?iso-8859-15?Q?FJ/SYQmWzjW2hGJk66tOXt/icQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-15"
Content-ID: <FEA56E79BE3AEB4E9952A906272B381D@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6746.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cfbb0f6-2556-48d3-a161-08db05d5f1b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2023 11:01:04.3973 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sjd2F96VfBg0vyefRPiyOeQXoTOEu9dqq5sdkVukf6MfXKmjPS8Y9jeZS4y5689P4T7XdQ28u/zHw9PhAd1JYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9094
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
Cc: Peter Griffin <peter.griffin@linaro.org>,
 =?iso-8859-15?Q?Cl=E9ment_Faure?= <clement.faure@nxp.com>,
 "fredgc@google.com" <fredgc@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "afd@ti.com" <afd@ti.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "op-tee@lists.trustedfirmware.org" <op-tee@lists.trustedfirmware.org>,
 Cyrille Fleury <cyrille.fleury@nxp.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "joakim.bech@linaro.org" <joakim.bech@linaro.org>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "jens.wiklander@linaro.org" <jens.wiklander@linaro.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On jeu., 2023-02-02 at 10:58 +0100, Etienne Carriere wrote:
> Caution: EXT Email
>=20
> On Thu, 2 Feb 2023 at 09:35, Sumit Garg <sumit.garg@linaro.org>
> wrote:
> > Hi Cyrille,
> >=20
> > Please don't top post as it makes it harder to follow-up.
> >=20
> > On Thu, 2 Feb 2023 at 13:26, Cyrille Fleury <cyrille.fleury@nxp.com
> > > wrote:
> > > Hi Sumit, all
> > >=20
> > > Upstream OP-TEE should support registering a dmabuf since a
> > > while, given how widely dmabuf is used in Linux for passing
> > > buffers around between devices.
> > >=20
> > > Purpose of the new register_tee_shm ioctl is to allow OPTEE to
> > > use memory allocated from the exiting linux dma buffer. We don't
> > > need to have secure dma-heap up streamed.
> > >=20
> > > You mentioned secure dma-buffer, but secure dma-buffer is a dma-
> > > buffer, so the work to be done for secure or "regular" dma
> > > buffers by the register_tee_shm ioctl is 100% the same.
> > >=20
> > > The scope of this ioctl is limited to what existing upstream dma-
> > > buffers are:
> > >         -> sharing buffers for hardware (DMA) access across
> > > multiple device drivers and subsystems, and for synchronizing
> > > asynchronous hardware access.
> > >        -> It means continuous memory only.
> > >=20
> > > So if we reduce the scope of register tee_shm to exiting dma-
> > > buffer area, the current patch does the job.
> >=20
> > Do you have a corresponding real world use-case supported by
> > upstream
> > OP-TEE? AFAIK, the Secure Data Path (SDP) use-case is the one
> > supported in OP-TEE upstream but without secure dmabuf heap [1]
> > available, the new ioctl can't be exercised.
> >=20
> > [1]=20
> > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit=
hub.com%2FOP-TEE%2Foptee_test%2Fblob%2Fmaster%2Fhost%2Fxtest%2Fsdp_basic.h%=
23L15&data=3D05%7C01%7Colivier.masse%40nxp.com%7Ca27f690d9d7244c2bcff08db05=
040f11%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C638109287211847995%7CUn=
known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DeNUbc0uaKjfmxau8L7ZB8u%2BtYdUxT4pIS%2Fh=
t29uwRKg%3D&reserved=3D0
>=20
> OP-TEE has some SDP test taht can exercice SDP: 'xtest
> regression_1014'.
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b.com%2FOP-TEE%2Foptee_test%2Fblob%2F3.20.0%2Fhost%2Fxtest%2Fregression_100=
0.c%23L1256&data=3D05%7C01%7Colivier.masse%40nxp.com%7Ca27f690d9d7244c2bcff=
08db05040f11%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C63810928721184799=
5%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1ha=
WwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3D%2BOtAlVOq7%2Fi6SloSTZuwa5VtlC5Rq=
tcJ4fGtio0YI8A%3D&reserved=3D0
>=20
> The test relies on old staged ION + local secure dmabuf heaps no more
> maintained, so this test is currently not functional.
> If we upgrade the test to mainline dmabuf alloc means, and apply the
> change discussed here, we should be able to regularly test SDP in
> OP-TEE project CI.
> The part to update is the userland allocation of the dmabuf:
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b.com%2FOP-TEE%2Foptee_test%2Fblob%2F3.20.0%2Fhost%2Fxtest%2Fsdp_basic.c%23=
L91&data=3D05%7C01%7Colivier.masse%40nxp.com%7Ca27f690d9d7244c2bcff08db0504=
0f11%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C638109287211847995%7CUnkn=
own%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXV=
CI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DK2NB2Bj7V3CXNsM9fZy95OEjF3EzqU4mgmM1PTY3J=
1Y%3D&reserved=3D0
>=20
>=20

the test was already updated to support secure dma heap with Kernel
version 5.11 and higher. the userland allocation could be find here:
https://github.com/OP-TEE/optee_test/blob/3.20.0/host/xtest/sdp_basic.c#L15=
3

This upgrade need a Linux dma-buf patch:
https://lore.kernel.org/all/20220805154139.2qkqxwklufjpsfdx@000377403353/T/


> br,
> etienne
>=20
>=20
> > -Sumit
> >=20
> > > Regards.
> > >=20
> > > -----Original Message-----
> > > From: Sumit Garg <sumit.garg@linaro.org>
> > > Sent: Wednesday, February 1, 2023 6:34 AM
> > > To: Olivier Masse <olivier.masse@nxp.com>
> > > Cc: fredgc@google.com; linux-media@vger.kernel.org;=20
> > > linaro-mm-sig@lists.linaro.org; afd@ti.com;=20
> > > op-tee@lists.trustedfirmware.org; jens.wiklander@linaro.org;=20
> > > joakim.bech@linaro.org; sumit.semwal@linaro.org; Peter Griffin <
> > > peter.griffin@linaro.org>; linux-kernel@vger.kernel.org;=20
> > > etienne.carriere@linaro.org; dri-devel@lists.freedesktop.org;=20
> > > christian.koenig@amd.com; Cl=E9ment Faure <clement.faure@nxp.com>;
> > > Cyrille Fleury <cyrille.fleury@nxp.com>
> > > Subject: [EXT] Re: [PATCH v2 1/1] tee: new ioctl to a register
> > > tee_shm from a dmabuf file descriptor
> > >=20
> > > Caution: EXT Email
> > >=20
> > > Hi Olivier,
> > >=20
> > > On Fri, 27 Jan 2023 at 16:24, Olivier Masse <
> > > olivier.masse@nxp.com> wrote:
> > > > Hi Joakim,
> > > > Hi Etienne,
> > > >=20
> > > > Let me bring back this pull request for OPTEE Linux driver.
> > > >=20
> > > > Last feedback was from Christian K=F6nig and Sumit Garg.
> > > > From Christian:
> > > > > Just two comments:
> > > > >=20
> > > > > 1. Dmitry is working on a change which renames some functions
> > > > > and
> > > > > makes it mandatory to call them with the dma_resv lock held.
> > > > >=20
> > > > > Depending on how you want to upstream this change you will
> > > > > certainly
> > > > > run into conflicts with that.
> > > >=20
> > > > Is there any update on these changes ?
> > > >=20
> > > > > 2. Would it be possible to do this dynamically? In other
> > > > > words does
> > > > > the tee driver has a concept of buffers moving around?
> > > >=20
> > > > We do not support dynamic secure memory heap.
> > > >=20
> > > > From Sumit:
> > > > > What limits you to extend this feature to non-contiguous
> > > > > memory
> > > > > buffers? I believe that should be possible with OP-TEE
> > > > > dynamic
> > > > > shared memory which gives you the granularity to register a
> > > > > list of pages.
> > > >=20
> > > > Our solution use a fixed protected reserved memory region and
> > > > do not
> > > > rely on a dynamic protection managed in secure.
> > > >=20
> > > > The scope of this implementation rely on a static memory region
> > > > handled by a specific DMA Heap type.
> > > >=20
> > >=20
> > > AFAIR, the last review for v2 is here [1]. So we need to have
> > > this secure DMA heap upstream in order for ioctl added by this
> > > patch to be usable.
> > >=20
> > > [1]=20
> > > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fl=
ists.trustedfirmware.org%2Farchives%2Flist%2Fop-tee%40lists.trustedfirmware=
.org%2Fmessage%2FM3WLO7RNG22OR4744BY6XNG2GLIYMNHN%2F&data=3D05%7C01%7Colivi=
er.masse%40nxp.com%7Ca27f690d9d7244c2bcff08db05040f11%7C686ea1d3bc2b4c6fa92=
cd99c5c301635%7C0%7C0%7C638109287211847995%7CUnknown%7CTWFpbGZsb3d8eyJWIjoi=
MC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&=
sdata=3D3ur7F71QnW6r15GdYR2e2YyoZLTONtTQvLHigH3uJsk%3D&reserved=3D0
> > >=20
> > > -Sumit
> > >=20
> > > > Best regards,
> > > > Olivier MASSE
> > > >=20
> > > >=20
> > > > On ven., 2022-08-12 at 16:30 +0200, Olivier Masse wrote:
> > > > > From: Etienne Carriere <etienne.carriere@linaro.org>
> > > > >=20
> > > > > This change allows userland to create a tee_shm object that
> > > > > refers
> > > > > to a dmabuf reference.
> > > > >=20
> > > > > Userland provides a dmabuf file descriptor as buffer
> > > > > reference.
> > > > > The created tee_shm object exported as a brand new dmabuf
> > > > > reference
> > > > > used to provide a clean fd to userland. Userland shall closed
> > > > > this
> > > > > new fd to release the tee_shm object resources. The initial
> > > > > dmabuf
> > > > > resources are tracked independently through original dmabuf
> > > > > file
> > > > > descriptor.
> > > > >=20
> > > > > Once the buffer is registered and until it is released, TEE
> > > > > driver
> > > > > keeps a refcount on the registered dmabuf structure.
> > > > >=20
> > > > > This change only support dmabuf references that relates to
> > > > > physically contiguous memory buffers.
> > > > >=20
> > > > > New tee_shm flag to identify tee_shm objects built from a
> > > > > registered
> > > > > dmabuf: TEE_SHM_EXT_DMA_BUF. Such tee_shm structures are
> > > > > flagged
> > > > > with TEE_SHM_EXT_DMA_BUF.
> > > > >=20
> > > > > Co-Developed-by: Etienne Carriere <
> > > > > etienne.carriere@linaro.org>
> > > > > Signed-off-by: Olivier Masse <olivier.masse@nxp.com>
> > > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > > From:
> > > > > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fgi%2F&data=3D05%7C01%7Colivier.masse%40nxp.com%7Ca27f690d9d7244c2bcff08d=
b05040f11%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C638109287211847995%7=
CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwi=
LCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3D7LNWTr4TWQoB0OLqasXT05o%2BUkodxsOqpc=
UcvoeiZ74%3D&reserved=3D0
> > > > > thub.com%2Flinaro-
> > > > > swg%2Flinux.git&data=3D05%7C01%7Ccyrille.fleury%40nx
> > > > > p.com%7Cb24461a4e7284314dff408db0415f23e%7C686ea1d3bc2b4c6fa9
> > > > > 2cd99c5
> > > > > c301635%7C0%7C0%7C638108264533221384%7CUnknown%7CTWFpbGZsb3d8
> > > > > eyJWIjo
> > > > > iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7
> > > > > C3000%7
> > > > > C%7C%7C&sdata=3D8jbFPaF%2B5JBed4Uvo1hsJiB%2BP71KUgJmnW%2BIi3zLf
> > > > > ok%3D&r
> > > > > eserved=3D0 (cherry picked from commit
> > > > > 41e21e5c405530590dc2dd10b2a8dbe64589840f)
> > > > > ---
> > > > >  drivers/tee/tee_core.c   | 38 +++++++++++++++
> > > > >  drivers/tee/tee_shm.c    | 99
> > > > > +++++++++++++++++++++++++++++++++++++++-
> > > > >  include/linux/tee_drv.h  | 11
> > > > > +++++  include/uapi/linux/tee.h | 29
> > > > > ++++++++++++
> > > > >  4 files changed, 175 insertions(+), 2 deletions(-)
> > > > >=20
> > > > > diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
> > > > > index
> > > > > 8aa1a4836b92..7c45cbf85eb9 100644
> > > > > --- a/drivers/tee/tee_core.c
> > > > > +++ b/drivers/tee/tee_core.c
> > > > > @@ -355,6 +355,42 @@ tee_ioctl_shm_register(struct
> > > > > tee_context *ctx,
> > > > >       return ret;
> > > > >  }
> > > > >=20
> > > > > +static int tee_ioctl_shm_register_fd(struct tee_context
> > > > > *ctx,
> > > > > +                                  struct
> > > > > tee_ioctl_shm_register_fd_data __user *udata)
> > > > > +{
> > > > > +     struct tee_ioctl_shm_register_fd_data data;
> > > > > +     struct tee_shm *shm;
> > > > > +     long ret;
> > > > > +
> > > > > +     if (copy_from_user(&data, udata, sizeof(data)))
> > > > > +             return -EFAULT;
> > > > > +
> > > > > +     /* Currently no input flags are supported */
> > > > > +     if (data.flags)
> > > > > +             return -EINVAL;
> > > > > +
> > > > > +     shm =3D tee_shm_register_fd(ctx, data.fd);
> > > > > +     if (IS_ERR(shm))
> > > > > +             return -EINVAL;
> > > > > +
> > > > > +     data.id =3D shm->id;
> > > > > +     data.flags =3D shm->flags;
> > > > > +     data.size =3D shm->size;
> > > > > +
> > > > > +     if (copy_to_user(udata, &data, sizeof(data)))
> > > > > +             ret =3D -EFAULT;
> > > > > +     else
> > > > > +             ret =3D tee_shm_get_fd(shm);
> > > > > +
> > > > > +     /*
> > > > > +      * When user space closes the file descriptor the
> > > > > shared memory
> > > > > +      * should be freed or if tee_shm_get_fd() failed then
> > > > > it will
> > > > > +      * be freed immediately.
> > > > > +      */
> > > > > +     tee_shm_put(shm);
> > > > > +     return ret;
> > > > > +}
> > > > > +
> > > > >  static int params_from_user(struct tee_context *ctx, struct
> > > > > tee_param *params,
> > > > >                           size_t num_params,
> > > > >                           struct tee_ioctl_param __user
> > > > > *uparams) @@
> > > > > -829,6 +865,8 @@ static long tee_ioctl(struct file *filp,
> > > > > unsigned
> > > > > int cmd, unsigned long arg)
> > > > >               return tee_ioctl_shm_alloc(ctx, uarg);
> > > > >       case TEE_IOC_SHM_REGISTER:
> > > > >               return tee_ioctl_shm_register(ctx, uarg);
> > > > > +     case TEE_IOC_SHM_REGISTER_FD:
> > > > > +             return tee_ioctl_shm_register_fd(ctx, uarg);
> > > > >       case TEE_IOC_OPEN_SESSION:
> > > > >               return tee_ioctl_open_session(ctx, uarg);
> > > > >       case TEE_IOC_INVOKE:
> > > > > diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
> > > > > index
> > > > > 836872467dc6..55a3fbbb022e 100644
> > > > > --- a/drivers/tee/tee_shm.c
> > > > > +++ b/drivers/tee/tee_shm.c
> > > > > @@ -4,6 +4,7 @@
> > > > >   */
> > > > >  #include <linux/anon_inodes.h>
> > > > >  #include <linux/device.h>
> > > > > +#include <linux/dma-buf.h>
> > > > >  #include <linux/idr.h>
> > > > >  #include <linux/mm.h>
> > > > >  #include <linux/sched.h>
> > > > > @@ -12,6 +13,14 @@
> > > > >  #include <linux/uio.h>
> > > > >  #include "tee_private.h"
> > > > >=20
> > > > > +/* extra references appended to shm object for registered
> > > > > shared
> > > > > memory */
> > > > > +struct tee_shm_dmabuf_ref {
> > > > > +     struct tee_shm shm;
> > > > > +     struct dma_buf *dmabuf;
> > > > > +     struct dma_buf_attachment *attach;
> > > > > +     struct sg_table *sgt;
> > > > > +};
> > > > > +
> > > > >  static void shm_put_kernel_pages(struct page **pages, size_t
> > > > > page_count)
> > > > >  {
> > > > >       size_t n;
> > > > > @@ -71,7 +80,16 @@ static void
> > > > > release_registered_pages(struct
> > > > > tee_shm *shm)
> > > > >=20
> > > > >  static void tee_shm_release(struct tee_device *teedev,
> > > > > struct
> > > > > tee_shm *shm)  {
> > > > > -     if (shm->flags & TEE_SHM_POOL) {
> > > > > +     if (shm->flags & TEE_SHM_EXT_DMA_BUF) {
> > > > > +             struct tee_shm_dmabuf_ref *ref;
> > > > > +
> > > > > +             ref =3D container_of(shm, struct
> > > > > tee_shm_dmabuf_ref,
> > > > > shm);
> > > > > +             dma_buf_unmap_attachment(ref->attach, ref->sgt,
> > > > > +                                      DMA_BIDIRECTIONAL);
> > > > > +
> > > > > +             dma_buf_detach(ref->dmabuf, ref->attach);
> > > > > +             dma_buf_put(ref->dmabuf);
> > > > > +     } else if (shm->flags & TEE_SHM_POOL) {
> > > > >               teedev->pool->ops->free(teedev->pool, shm);
> > > > >       } else if (shm->flags & TEE_SHM_DYNAMIC) {
> > > > >               int rc =3D teedev->desc->ops->shm_unregister(shm-
> > > > > >ctx,
> > > > > shm);
> > > > > @@ -195,7 +213,7 @@ struct tee_shm
> > > > > *tee_shm_alloc_user_buf(struct
> > > > > tee_context *ctx, size_t size)
> > > > >   * tee_client_invoke_func(). The memory allocated is later
> > > > > freed
> > > > > with a
> > > > >   * call to tee_shm_free().
> > > > >   *
> > > > > - * @returns a pointer to 'struct tee_shm'
> > > > > + * @returns a pointer to 'struct tee_shm' on success, and
> > > > > ERR_PTR
> > > > > + on
> > > > > failure
> > > > >   */
> > > > >  struct tee_shm *tee_shm_alloc_kernel_buf(struct tee_context
> > > > > *ctx,
> > > > > size_t size)  { @@ -229,6 +247,83 @@ struct tee_shm
> > > > > *tee_shm_alloc_priv_buf(struct tee_context *ctx, size_t
> > > > > size)  }
> > > > > EXPORT_SYMBOL_GPL(tee_shm_alloc_priv_buf);
> > > > >=20
> > > > > +struct tee_shm *tee_shm_register_fd(struct tee_context *ctx,
> > > > > int
> > > > > +fd) {
> > > > > +     struct tee_shm_dmabuf_ref *ref;
> > > > > +     int rc;
> > > > > +
> > > > > +     if (!tee_device_get(ctx->teedev))
> > > > > +             return ERR_PTR(-EINVAL);
> > > > > +
> > > > > +     teedev_ctx_get(ctx);
> > > > > +
> > > > > +     ref =3D kzalloc(sizeof(*ref), GFP_KERNEL);
> > > > > +     if (!ref) {
> > > > > +             rc =3D -ENOMEM;
> > > > > +             goto err_put_tee;
> > > > > +     }
> > > > > +
> > > > > +     refcount_set(&ref->shm.refcount, 1);
> > > > > +     ref->shm.ctx =3D ctx;
> > > > > +     ref->shm.id =3D -1;
> > > > > +
> > > > > +     ref->dmabuf =3D dma_buf_get(fd);
> > > > > +     if (IS_ERR(ref->dmabuf)) {
> > > > > +             rc =3D PTR_ERR(ref->dmabuf);
> > > > > +             goto err_put_dmabuf;
> > > > > +     }
> > > > > +
> > > > > +     ref->attach =3D dma_buf_attach(ref->dmabuf, &ref-
> > > > > >shm.ctx-
> > > > > > teedev->dev);
> > > > > +     if (IS_ERR(ref->attach)) {
> > > > > +             rc =3D PTR_ERR(ref->attach);
> > > > > +             goto err_detach;
> > > > > +     }
> > > > > +
> > > > > +     ref->sgt =3D dma_buf_map_attachment(ref->attach,
> > > > > DMA_BIDIRECTIONAL);
> > > > > +     if (IS_ERR(ref->sgt)) {
> > > > > +             rc =3D PTR_ERR(ref->sgt);
> > > > > +             goto err_unmap_attachement;
> > > > > +     }
> > > > > +
> > > > > +     if (sg_nents(ref->sgt->sgl) !=3D 1) {
> > > > > +             rc =3D PTR_ERR(ref->sgt->sgl);
> > > > > +             goto err_unmap_attachement;
> > > > > +     }
> > > > > +
> > > > > +     ref->shm.paddr =3D sg_dma_address(ref->sgt->sgl);
> > > > > +     ref->shm.size =3D sg_dma_len(ref->sgt->sgl);
> > > > > +     ref->shm.flags =3D TEE_SHM_EXT_DMA_BUF;
> > > > > +
> > > > > +     mutex_lock(&ref->shm.ctx->teedev->mutex);
> > > > > +     ref->shm.id =3D idr_alloc(&ref->shm.ctx->teedev->idr,
> > > > > &ref->shm,
> > > > > +                             1, 0, GFP_KERNEL);
> > > > > +     mutex_unlock(&ref->shm.ctx->teedev->mutex);
> > > > > +     if (ref->shm.id < 0) {
> > > > > +             rc =3D ref->shm.id;
> > > > > +             goto err_idr_remove;
> > > > > +     }
> > > > > +
> > > > > +     return &ref->shm;
> > > > > +
> > > > > +err_idr_remove:
> > > > > +     mutex_lock(&ctx->teedev->mutex);
> > > > > +     idr_remove(&ctx->teedev->idr, ref->shm.id);
> > > > > +     mutex_unlock(&ctx->teedev->mutex);
> > > > > +err_unmap_attachement:
> > > > > +     dma_buf_unmap_attachment(ref->attach, ref->sgt,
> > > > > DMA_BIDIRECTIONAL);
> > > > > +err_detach:
> > > > > +     dma_buf_detach(ref->dmabuf, ref->attach);
> > > > > +err_put_dmabuf:
> > > > > +     dma_buf_put(ref->dmabuf);
> > > > > +     kfree(ref);
> > > > > +err_put_tee:
> > > > > +     teedev_ctx_put(ctx);
> > > > > +     tee_device_put(ctx->teedev);
> > > > > +
> > > > > +     return ERR_PTR(rc);
> > > > > +}
> > > > > +EXPORT_SYMBOL_GPL(tee_shm_register_fd);
> > > > > +
> > > > >  static struct tee_shm *
> > > > >  register_shm_helper(struct tee_context *ctx, unsigned long
> > > > > addr,
> > > > >                   size_t length, u32 flags, int id) diff --
> > > > > git
> > > > > a/include/linux/tee_drv.h b/include/linux/tee_drv.h index
> > > > > 911cad324acc..40ddd5376c2d 100644
> > > > > --- a/include/linux/tee_drv.h
> > > > > +++ b/include/linux/tee_drv.h
> > > > > @@ -25,6 +25,7 @@
> > > > >  #define TEE_SHM_USER_MAPPED  BIT(1)  /* Memory mapped in
> > > > > user space
> > > > > */
> > > > >  #define TEE_SHM_POOL         BIT(2)  /* Memory allocated
> > > > > from pool
> > > > > */
> > > > >  #define TEE_SHM_PRIV         BIT(3)  /* Memory private to
> > > > > TEE driver
> > > > > */
> > > > > +#define TEE_SHM_EXT_DMA_BUF     BIT(4)  /* Memory with dma-
> > > > > buf
> > > > > handle */
> > > > >=20
> > > > >  struct device;
> > > > >  struct tee_device;
> > > > > @@ -276,6 +277,16 @@ struct tee_shm
> > > > > *tee_shm_alloc_kernel_buf(struct
> > > > > tee_context *ctx, size_t size);  struct tee_shm
> > > > > *tee_shm_register_kernel_buf(struct tee_context *ctx,
> > > > >                                           void *addr, size_t
> > > > > length);
> > > > >=20
> > > > > +/**
> > > > > + * tee_shm_register_fd() - Register shared memory from file
> > > > > descriptor
> > > > > + *
> > > > > + * @ctx:     Context that allocates the shared memory
> > > > > + * @fd:              Shared memory file descriptor reference
> > > > > + *
> > > > > + * @returns a pointer to 'struct tee_shm' on success, and
> > > > > ERR_PTR
> > > > > + on
> > > > > failure
> > > > > + */
> > > > > +struct tee_shm *tee_shm_register_fd(struct tee_context *ctx,
> > > > > int
> > > > > fd);
> > > > > +
> > > > >  /**
> > > > >   * tee_shm_is_dynamic() - Check if shared memory object is
> > > > > of the
> > > > > dynamic kind
> > > > >   * @shm:     Shared memory handle
> > > > > diff --git a/include/uapi/linux/tee.h
> > > > > b/include/uapi/linux/tee.h
> > > > > index 25a6c534beb1..baf3cd7cfdac 100644
> > > > > --- a/include/uapi/linux/tee.h
> > > > > +++ b/include/uapi/linux/tee.h
> > > > > @@ -121,6 +121,35 @@ struct tee_ioctl_shm_alloc_data {
> > > > >  #define TEE_IOC_SHM_ALLOC    _IOWR(TEE_IOC_MAGIC,
> > > > > TEE_IOC_BASE + 1,
> > > > > \
> > > > >                                    struct
> > > > > tee_ioctl_shm_alloc_data)
> > > > >=20
> > > > > +/**
> > > > > + * struct tee_ioctl_shm_register_fd_data - Shared memory
> > > > > +registering
> > > > > argument
> > > > > + * @fd:              [in] File descriptor identifying the
> > > > > shared
> > > > > memory
> > > > > + * @size:    [out] Size of shared memory to allocate
> > > > > + * @flags:   [in] Flags to/from allocation.
> > > > > + * @id:              [out] Identifier of the shared memory
> > > > > + *
> > > > > + * The flags field should currently be zero as input.
> > > > > Updated by
> > > > > + the
> > > > > call
> > > > > + * with actual flags as defined by TEE_IOCTL_SHM_* above.
> > > > > + * This structure is used as argument for
> > > > > TEE_IOC_SHM_REGISTER_FD
> > > > > below.
> > > > > + */
> > > > > +struct tee_ioctl_shm_register_fd_data {
> > > > > +     __s64 fd;
> > > > > +     __u64 size;
> > > > > +     __u32 flags;
> > > > > +     __s32 id;
> > > > > +} __attribute__ ((aligned (8)));
> > > > > +
> > > > > +/**
> > > > > + * TEE_IOC_SHM_REGISTER_FD - register a shared memory from a
> > > > > file
> > > > > descriptor
> > > > > + *
> > > > > + * Returns a file descriptor on success or < 0 on failure
> > > > > + *
> > > > > + * The returned file descriptor refers to the shared memory
> > > > > object
> > > > > in kernel
> > > > > + * land. The shared memory is freed when the descriptor is
> > > > > closed.
> > > > > + */
> > > > > +#define TEE_IOC_SHM_REGISTER_FD      _IOWR(TEE_IOC_MAGIC,
> > > > > TEE_IOC_BASE + 8, \
> > > > > +                                  struct
> > > > > tee_ioctl_shm_register_fd_data)
> > > > > +
> > > > >  /**
> > > > >   * struct tee_ioctl_buf_data - Variable sized buffer
> > > > >   * @buf_ptr: [in] A __user pointer to a buffer
