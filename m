Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2EA5A5D08
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 09:34:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 796CA10E849;
	Tue, 30 Aug 2022 07:34:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2114.outbound.protection.outlook.com [40.107.113.114])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B57D10E849
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 07:34:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YVY4sbwAyjVVXNp/s17Auf03DR8WG4BLwcsJHK25kKzSE4KXhe6r/KccMkywB310943Nem5zvJtWpu+OHypjeZXahTaiDGKy1w6/h/gYThKYa+w7qQjrJNJ1uHbTls4LAcuikuAITKrdDsd+xKkrKu27uvrtRQeTD7KF2wmjvrhacgTWU44reuPfEfoplOj8ArObI08Qz5pP1m13kVKQP46Pxx2w3xgiOdUv9NQeHZB/+SbmWknGavwyuRQQ/e3D6wEjwM1MBvk76UIU3KY2PXLNaEno1e8n++BTpvT1dvCwS18XrEPdHcg3OQySXEgkUrYa/KxZweXmFeBcx6ePxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p3J3NH+nLcg91I6Hx0sqo+MVCp7YAbrlAWtihSd0mAA=;
 b=ebKoLcOVOwm/vhw9tEH78nmHqJe12ajoisTj0twItgghuCQNtrEV7k2l6CkFeaW7TLe7G83Fba9NS2er9CI1WW3bwEQM+lGy/KpjncuymMwvR/g5cbRO+/2PJndVvqIMw/pMcI7Z1g75LVB2z53MWKqMiktdUtnkqaukFmr3FJDZpD1LKmCUexBNimkYes9T0iJlj7CAK1nyzQlQ0B8fSqjykujn55fUws9zNIio4oH6bQ3D6B+RRv8AaGAzm3QY6sAaK3X7TEZZFHMK/Q07Ke7uUQwHfijTMHuSj8e34hZ34ZEjFGTh9/MBDnk2deyfdZ0ekO5f9u88vwrXqQu5ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p3J3NH+nLcg91I6Hx0sqo+MVCp7YAbrlAWtihSd0mAA=;
 b=UN71JkWnoD+CyGjL9MzD3zBJaEPO0FfQsFNDgY0nadkZr8Gjy5GQ83Gt8GsHxx3EjbnFdaOA2FY+PtqHLFnFwQ4e+FMmPRH2c/pXjOVxECRNEapQ0UtQ1nAntW73NEdqYGGyzQn/BNmqzdr5UcJanfWZrQZTraATzX/NEXVHmvA=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYAPR01MB5338.jpnprd01.prod.outlook.com (2603:1096:404:8030::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Tue, 30 Aug
 2022 07:34:37 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::14d3:5079:9de1:ceaf]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::14d3:5079:9de1:ceaf%3]) with mapi id 15.20.5566.021; Tue, 30 Aug 2022
 07:34:37 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH v6 2/2] drm: rcar-du: Add RZ/G2L DSI driver
Thread-Topic: [PATCH v6 2/2] drm: rcar-du: Add RZ/G2L DSI driver
Thread-Index: AQHYu4hv/CDDY6+M30+sYprn/JM1O63GBEiAgAACh8CAACTegIAAxlfA
Date: Tue, 30 Aug 2022 07:34:37 +0000
Message-ID: <OS0PR01MB5922254557CB18049402994A86799@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220829091901.641784-1-biju.das.jz@bp.renesas.com>
 <20220829091901.641784-3-biju.das.jz@bp.renesas.com>
 <CAG3jFys4fKWBGBLX9CNB3xvz4ztgv4vdaTjB-sgrCMy6Zc9Yag@mail.gmail.com>
 <OS0PR01MB5922BB4E4924ECE0E8A3312186769@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <Ywz+/aA3NSQqbXXm@pendragon.ideasonboard.com>
In-Reply-To: <Ywz+/aA3NSQqbXXm@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e7c85dd2-131b-4105-a726-08da8a5a17bb
x-ms-traffictypediagnostic: TYAPR01MB5338:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ePuGpjG77KiQPkApXSoON4r3QT2/T2EL0sHeviHjgOv9NXltsF7hyuEw6OBOD6s8DsSW9B2RBXdRR7chMxuJmMDZnPKYyakq7OKYf6tXRrizJ38pTcXYTsaNA+w6A9ej42PqjxXL8alOUPjs5ecghWrwaj5ovNRhRDEQEBKQgaBt9yu3wpyguaEZw5aNzqKGLPvCLmmEVhu8OKwoeBacJxGg8wuKviD3ctnsTnnacNYkIix9DJuKE0dqSAfsaToHYfuP4WrZh5+nR0HaYpA5IE6SPxoefkwr35LmtuuUcfjzeSlb6njwUmHwKIi8XRz9Dta+kVM4w122YJFZpTjIM8bydN2Zcly4mESF5pGDPz8zmlP8LWROFOAo0pFINePkf7Vb0+TKs2G0Gz5H9VDCAOqvQtEV2rSyK0rjBkUhBdI1t0NP5E/4XW5AyDQc4WH3GLlAkvrhqSkLEYLoW7SrGSoZl8zVQ53vArAkkA56u8qFMAEJ08I7FwOGXH17bsqBmoilc/qFiPzuTAFvL023x+D4nAgJ72H1Pfm2B8wzpyLrBm4Dx3JnaU5UCU92/ppyq8qQCH1lvwfcGR6iLijfeX1uFlWPUjWVcRTFxQ/niwjM8wh7pMViE6tDAcvpo9JTDcdjxkGg6Qsr3/3jQ8MvBA/qhDo7PLjM7MF93NXiCVnC6lyZ9Xqw9THwoi3dHLguZ0rR5RUvXV/SPNc+fLqnZXxhUiOb1vGar5p5maj4V7fkLh1MS5qSQBMgv+iAMz/xCkNPDPdSDKJEKXnbFSArkg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(346002)(366004)(376002)(39860400002)(136003)(66946007)(6506007)(55016003)(66446008)(66556008)(8676002)(76116006)(4326008)(66476007)(9686003)(83380400001)(2906002)(5660300002)(7696005)(8936002)(26005)(478600001)(52536014)(7416002)(41300700001)(33656002)(316002)(71200400001)(38070700005)(6916009)(86362001)(64756008)(122000001)(54906003)(38100700002)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?plsU2CaB9vhyzA9y6zhfpM+5hK4C9jEBFL160BTZZp/+ZE6kGWH7G6E43smS?=
 =?us-ascii?Q?AoJCnM/fLPN2f8LnoQ1g/uYe02sve0OFRUYZAuo1M1DQmJ1N+Dn5tofFKHC4?=
 =?us-ascii?Q?8XGFm4SDSRpCoAgDLDoxi48qXcsVT8Pa3pLG5Aajl/F4hBoEQVkschMep5d8?=
 =?us-ascii?Q?5nLuvoY+ulfWVMpWoi7GfDtZ5/mCNMQEUXaEPBPdHOpvhMR4ZZGsBkI0Xy7G?=
 =?us-ascii?Q?RsVGfkqjWv3McdCk7rnTakASMufr3VWwmYTw2molmf9M1FbdwZYzrKk7tOwZ?=
 =?us-ascii?Q?+fQF/7iVMcxLVqNr7Y+e3d1J6M2I68LwWLxIscFLyHPwkMqiidgAZSbwlNBn?=
 =?us-ascii?Q?srxwzdbW7BnoO1M9cxqv/5CgRmudG83+26EcaKd3QtaEuP79nb/IjQkIJhdS?=
 =?us-ascii?Q?gGSh2W8ydgjzeRmugStQXl7Y8arHXPxZFN1qhhzGXRa63xcnw1Qxb/z5ZRW0?=
 =?us-ascii?Q?C1KXrPwURycydYnOkNu0WRC4vvYnQQoJgxsp9mXDwvf2dUzNgHLAaQAuSVxa?=
 =?us-ascii?Q?Ag+/LAZuXPokrtcA2MrHrqvuQE8IWSmIKv7AnBq97YqREVggqF6w6hsy4Jg2?=
 =?us-ascii?Q?3dUPTk11jvEsncS3bP8ZsYpmC9+5HbaNBaBGIZ7WUcnevi1rRkn4Gu0PIiHk?=
 =?us-ascii?Q?hKjpe6PtaCh3tfAy+v1H2O1qmV2uvJAFANT6hA3cM3eSQvAf+TXr8RMl+cYe?=
 =?us-ascii?Q?27zTXMO8kF61lg1ljE7nbN0OgNmVFEKLP3cLFHJdM5S3ONf/41wcrigQkvig?=
 =?us-ascii?Q?al2/vH3/Cw4oCo9c4mlsWfZHEF5SjMopbVGAtvIonofpbGgPiM/SE0+YJcSY?=
 =?us-ascii?Q?o7rfL2LYyvDXfM+PoTC6n03ytigpwsMp/Aqk5k54KR9tF/V0XvjCWJxWCdAY?=
 =?us-ascii?Q?MSVR7jNCB/LRr5HrGWi5p1DKKUB2zaXtHtbiqdqiz3t7nym2epGGXT6PNaQN?=
 =?us-ascii?Q?Q8m5Ne2uAh24mkj5F1x/nMwk5HkMpfMGj39wU3PS9Yj4slzGVnPXH02QfTrJ?=
 =?us-ascii?Q?I5/CENyOPIS3hVKCjGbRyBmg+tlqnxCe1r3KpZTubw2okddI5o+bWoNI6S76?=
 =?us-ascii?Q?Rew5wEgY08cQ9pMaNSGI8ARU9e35w26ebI79YPyguX79MxdpOkdCkajogj9t?=
 =?us-ascii?Q?iITRPVDAO0EvvdQGOVlqGZezKZezzvn0l9MvYKT//d5usSzvXm8wBZDDb8pZ?=
 =?us-ascii?Q?46PVq7DebdiPTQGkJPI+XG4jmXQ6B+YpFmciwAPLxFfXb4p7XJecQKTXaL0R?=
 =?us-ascii?Q?Q6YTBSzBRYRiXNSR4nZaPKmXrtyg1+1jjyvjXGQ4wnQywqPG5MraILOwZu4D?=
 =?us-ascii?Q?We5k61mAHRMaBT2Xve+rKAjnsvS3vx2/rc0MhDuNemXiRJfVEMSZnT5MmoN1?=
 =?us-ascii?Q?4RTrxPF3z7lWthO/rKdoOK2t5zi3ZcbmXGk5bpAuUg543nFciAonkftkCYom?=
 =?us-ascii?Q?dZ/4Jg8o5bDPnvScaXhgNAOBPaBH2hhRdJxfr1rIJUqIocCsDvwLZw3h0fO7?=
 =?us-ascii?Q?eJzc/MFQN94/qIxqKqwiVuun17nN6QjAEN2hQnXQRdYxHSay8e5tJYhxCByS?=
 =?us-ascii?Q?4dk/Srggz/JCI++zxgtXXuy8tW0/ShRLhwOOYmX9sEY/UxT9nKAS56qVDlZs?=
 =?us-ascii?Q?JQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7c85dd2-131b-4105-a726-08da8a5a17bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2022 07:34:37.5585 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hFSI189qol5fpqSEH1+aKbXYjHlwHhBAC/kRC5VRYbeIYuZ4xb5387Gt8psGJpjit6leOdjvw3f2hWAjAPjZACWDz6PEhOJDaQ2H12Qmp94=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5338
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
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Robert Foss <robert.foss@linaro.org>, Biju Das <biju.das@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

Thanks for the feedback.

> Subject: Re: [PATCH v6 2/2] drm: rcar-du: Add RZ/G2L DSI driver
>=20
> Hi Biju,
>=20
> On Mon, Aug 29, 2022 at 04:26:02PM +0000, Biju Das wrote:
> > Hi Robert,
> >
> > Thanks for the feedback.
> >
> > > Subject: Re: [PATCH v6 2/2] drm: rcar-du: Add RZ/G2L DSI driver
> > >
> > > Hey Biju,
> > >
> > > The patch does not apply on drm-misc-next, could you rebase it and
> > > submit the next version?
> >
> > I believe[1] is dependent on this patch series. Sorry for not making
> > it clear while sending this patch series out.
> >
> > I thought Laurent is going to give a pull request for RCar DU patches.
>=20
> That's right. The patches apply fine to my branch.
>=20
> > Based on that assumption, currently my environment is drm-tip +
> > 12 patches from[2], as [2] doesn't have all the latest patches from
> > drm-misc-next/drm-tip.
> >
> >
> > > Additionally it has a few 'checkpatch --strict' warnings.
> >
> > I got a review comment[3] to use (1 << 1) style instead of BIT macro.
> > Some of the warnings related to this.
> >
> > Laurent, any thoughts??
>=20
> (1 << x) instead of BIT it correct when the field stores a value, not a
> single bit flag.

OK, then it is fine.

Cheers,
Biju
