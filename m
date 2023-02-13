Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF17469460D
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 13:41:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6679B10E5A6;
	Mon, 13 Feb 2023 12:41:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2079.outbound.protection.outlook.com [40.107.247.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BA0310E5A6
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 12:41:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A2sXmjdCf0e1E+7bvtMdzPxuJWq1WaLka8FNCIAIS/gZKScYvEsWJb3YIq+1LCv7F+bmeQ5WGNoWhIpczgNCiGdYu0rbDn452YB9e28nlq7JsRhxx5F08qWtMJR2tvIJZyUUkSeXjO+Btii31UJXnJ8gwaf9ALO7DpaxZMiuj55c7Fj/wRwwLOl891biXdt9yoAje4VG7A9XHGHWmfB2zHkOt2tyItfaxs94DQDXPjaaOmUc5qlpUZFi1/bSTVpw5pRi51jiOv8RIeb42lCyPkZcdtqbFLxviB88A7wOufaNVT33oGI6d74GuE4x4j4TaIi4eiiQ7wbjpLK5fJ6Pew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KoZV0GLb5y9BoiEejWIswVO7tRbhPfUD+OPyentEeyY=;
 b=aQHueyrFDFx2pNyo2k2WjxPSRimkG1l7S/dKhp/Ix9JI6XGDE8jGdPHRIZ17iaR4CtVLv3SpSd9Am5MqttwdHxQhTxCBvsaJFryM198hbT1gr6akkCfX161OJrsP1HScnEI0gcZfEM8WJybCzSBOxB/QZ725ARl8co3Nj61khTvOsga3bPpqa7DVkvtO+//o+5ghYPCm30bkTh7urcs699Z/fj/DCwORtje/8BZdPftlewqE6TNfqdroUD+iFmU/LvakCxPf8bihIR7wlac09IgOoTLmOV0BpTXzDs4KavmVMtaHDoSqqZfwDaWwpNfsHyGIbMNfm6pUEk4l+df/rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KoZV0GLb5y9BoiEejWIswVO7tRbhPfUD+OPyentEeyY=;
 b=Bgrp3nukZdYF9sKPZBdmO4NQzsq2i5cDx+WOWgXZGgxQXe41o+NH7jBayYldIItNG4GYpawwmQ/jNOoH7gl5ogwrDsZ4YhEBB4bC1ebnMMDpP6E/WhcX6roEi46JFAVGQoOJ/2wQJBms4h5fLnpXJuByChuOB0eTln9hWGobER0=
Received: from PA4PR04MB7520.eurprd04.prod.outlook.com (2603:10a6:102:e9::5)
 by PA4PR04MB7549.eurprd04.prod.outlook.com (2603:10a6:102:e0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.23; Mon, 13 Feb
 2023 12:41:14 +0000
Received: from PA4PR04MB7520.eurprd04.prod.outlook.com
 ([fe80::a605:8cb9:97af:4089]) by PA4PR04MB7520.eurprd04.prod.outlook.com
 ([fe80::a605:8cb9:97af:4089%9]) with mapi id 15.20.6086.023; Mon, 13 Feb 2023
 12:41:14 +0000
From: Cyrille Fleury <cyrille.fleury@nxp.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
Subject: RE: [EXT] Re: [PATCH v2 1/1] tee: new ioctl to a register tee_shm
 from a dmabuf file descriptor
Thread-Topic: [EXT] Re: [PATCH v2 1/1] tee: new ioctl to a register tee_shm
 from a dmabuf file descriptor
Thread-Index: AQHZMj2tcBtqkaJcQUCvE2iCWyqqy665mRQAgAGzCXCAABHpgIAAF0mAgAGj0wCAAAoTgIAAD1KAgAAVqyCAD4iZAIAAGTJA
Date: Mon, 13 Feb 2023 12:41:14 +0000
Message-ID: <PA4PR04MB752097BD63A2151DC5658D4688DD9@PA4PR04MB7520.eurprd04.prod.outlook.com>
References: <20220812143055.12938-2-olivier.masse@nxp.com>
 <30534fadb8172088eddef46ae71d87c167cbf32e.camel@nxp.com>
 <CAFA6WYOMCswgHHxsgc9Hgi7rmTPaZDqce=BixvYoFTfL0bTFDQ@mail.gmail.com>
 <PA4PR04MB75204E8D2B959893A04D55F388D69@PA4PR04MB7520.eurprd04.prod.outlook.com>
 <CAFA6WYPGT8xZnB1idcxcHT1bvM=0kwFssBQbn063-qg=czM-ZQ@mail.gmail.com>
 <CAN5uoS8XgvAKVwKHx-uOe3hAa4Jrd5FJt6xNOG5s-simkRND9w@mail.gmail.com>
 <c86d1a46af6e076038b3f0c2dd68213ff1e8b254.camel@nxp.com>
 <CAN5uoS-A8EovbnxvcXqiYHcy95d-PTYUZvnNr3=kf84AGkG8Kw@mail.gmail.com>
 <f3ccd7ad-0bbb-be39-c989-765552e2c6af@linaro.org>
 <PA4PR04MB75207FF08A6C2EEC1944FFFE88D79@PA4PR04MB7520.eurprd04.prod.outlook.com>
 <Y+oYundNEN9TDiQ8@jade>
In-Reply-To: <Y+oYundNEN9TDiQ8@jade>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR04MB7520:EE_|PA4PR04MB7549:EE_
x-ms-office365-filtering-correlation-id: 177b1d16-b2d4-4b2d-68fa-08db0dbf9801
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7u0+TG6djDzelvi/at4O+nfRThLmcIxiFrP0o1TB/FbGpk4W+1JaKpdNMubBo2heX1tO2Bx6t4+YzTSDfol4Qvd+clDto0TygqPdKFyWhbk3a+AKVcEKjRPrDHT276gb+Y3DUv/eE2Td9VZsjHmVCrXjjSbqGTWVITOfEeDaJ5K8xaSkDzS1Cp5q1HKmPHmVxSNw0SP8mgOY4N7pj0j004Tl43NVnE3ULKyOW1cUW58JEGOlHzOozABcYMvSwITlb0wOQvqdOCpCiIy5suz1EkTHpXSl3hlzXTomybpoNGykatYhvTbDm4YICstKtJ9fHeIB0+ZR629sUJ4JPNFflTi5ugXXezp6PVp8En0x3jPp6isOwbxcpAB/sDPJ7dq/mcBIUEMDHAjCXnsIoEyI9aJAnMcg/aGmgVnyrPBJoqcSdnCXs1Ds0WaiscXn0C/+ZGaJZI/IHjcySTEHvMoByjnOqPrm+WmyDKplyUi+4JqRw41EXeO64vJu7jgwX13gHe3vY5Xk+4vxyfRtimwaSc8hMgCTGtyKoqHwkELpkI4zE2gp2aCzBNoUEqScCGPSF9oIspyASq0Esr+MQ/OqLl0jNG6GVguJmR3/y7jLUKDVJM+ytdPDIkSoYrl1LFpFDkC1IpylAtqAatgrgjkTo+FIy1L+ulfeitOu/0cn8R1MbbfsWXrofvKFdQ7eSfWo1lqh5gRlpmzfgS7Q12U1MBW0u4ecLt8JybVJoKlzcxu9LvFTAS438rCF7HxQ8d57nvL99JlZAkDtPV4JNLGsMw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR04MB7520.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(376002)(366004)(136003)(396003)(346002)(451199018)(4326008)(66556008)(316002)(8676002)(6916009)(66446008)(64756008)(66476007)(76116006)(66946007)(8936002)(41300700001)(52536014)(44832011)(5660300002)(30864003)(7416002)(38070700005)(86362001)(33656002)(38100700002)(122000001)(6506007)(53546011)(55236004)(9686003)(45080400002)(478600001)(186003)(26005)(66574015)(55016003)(2906002)(966005)(7696005)(83380400001)(71200400001)(54906003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?53VnCRw0YYNdSgtpGZVDpiykg9qXo14RKNyuq0BuIrAsFXffG2C7lH84N6?=
 =?iso-8859-1?Q?CgJHveenOhGT8QmgSV4MDy7o520NYyPFeU0VoCx8AWV2wsChsou8JL7Qkg?=
 =?iso-8859-1?Q?ce35nRoN/Ex29VoLWBXu2Arn4hNjThO1sHKSJZ9iZMwkAYRhADsnKibOx6?=
 =?iso-8859-1?Q?+nq0hOiQOEOqrI1LoMUJVPAZnrk/G2wVcj9Nm5D4q05Tt51v18G9PjNZe1?=
 =?iso-8859-1?Q?agcgV5trNZsF2kS5L55CAtQPDCmgRPzkXJxZlHTdvOancyVzZCkWoC6e6P?=
 =?iso-8859-1?Q?csOvHmrlQHIiH+LeNhp8bN2d1NHsEqT9/qYBYOlN9kamKhoJPd9HKTaS4p?=
 =?iso-8859-1?Q?PT5CLhijSFRkH38H9CTO+jYzXXcoMWn0JpFaxKL1Wkqnf+iAti4qVp/PJf?=
 =?iso-8859-1?Q?tShwzVKaRDW43DThxcA6u87SqMho1ypVEmfPHteNrG24u2ogsHEw4BYdoY?=
 =?iso-8859-1?Q?a9G7qpQW2227NgkpAkTbkEh4LNfOt7ifvLPijnMiDZ0/v7OT8OFghq6ZHH?=
 =?iso-8859-1?Q?b+hil7jkhGelBgbT7UNU2yFRO1FMtqxxDlx92XRq2b6zS7W+xPilRW2Od+?=
 =?iso-8859-1?Q?PUuTTc3tiGck8Obhvagy579yeoAH8iWVnc/yEbw9r/dZv2S283WMZHA3OU?=
 =?iso-8859-1?Q?XePOslEWFS/2fcZp601jJz4DEcLzrbFM1TvJ+xJx5VtHDUhEyqLJdAB8Gu?=
 =?iso-8859-1?Q?FTt86pwuDNsxP8kjJX79bgaAwWk/YL3Nli4TfSsnoRQ54N2jSKfdUzpSLq?=
 =?iso-8859-1?Q?I/3VYccaejFKud+RmyE12ZC9bMTpa+lF7sdeVtB6OA8RtiUyn6hNrsgItb?=
 =?iso-8859-1?Q?iBFOigf1zj7dtenUUyFYRyTan13GsqidVQFwATFMgSW91W29XRmNh56D7g?=
 =?iso-8859-1?Q?VjBm7to67Rx8tUtLoSpUvkljjSfPiTE8d94W2NtzDzCO+IauoGbPLhyUED?=
 =?iso-8859-1?Q?pllnsnv8Nq7ictd6ulqQeqmylRO7D+dwq59eSa/0WOLq0P4450Hu0BhReN?=
 =?iso-8859-1?Q?dFbN50IpRuWVhTJVoL4ZmM4DFiOG5Gey30n6M9xaGWjkcEeBCgNA5lv144?=
 =?iso-8859-1?Q?dwh/TomCI0xRRRLZNqLxdZTagVLN21FRtSZsNXpaimNvYOU47OBgV+zzsa?=
 =?iso-8859-1?Q?th7jDP9ruOoWEd9JiVREPeaq2hzbN6ARXQZXYNLSKwZYPLG/NeyXahRoeo?=
 =?iso-8859-1?Q?sTRAWyDMAFhx7Ty73TSsB1L2JMIzyrSNMf2kypXiaEKWDpWmO500+JvRSC?=
 =?iso-8859-1?Q?NsmhP8kUYLcIULxcqNPuDbxF262l+Orocw+vsGSNy+PnnPpPj8lnPbt7zE?=
 =?iso-8859-1?Q?QG4qHziDRXOEnffUhTR9bs6Xze1Wzw/YB919NAHW+Qdhdh/W7vTm67Uuhw?=
 =?iso-8859-1?Q?JgUMQ3WYw+J1DqTckmw8r914/eFqZJQU/kw/N7IZNDqgdYRoaWasIsn0Kl?=
 =?iso-8859-1?Q?IeponTdc3jWQxZjbdtapdvsBiPmTyJSfksNnjIPgkuaNHJI0nhbCdVVBeK?=
 =?iso-8859-1?Q?yYAHGICeoIfFpuED3X0qQubWX5K/dZoPJKJeBkAuLRFCFkJb/t0fEM+vTv?=
 =?iso-8859-1?Q?/DvRlib1k2rpXP/5xXTqPTm+2YxgaTNlX5gcgTitYe6eSbK5CjoDS+u4n8?=
 =?iso-8859-1?Q?eWfLvpPxH8BC6gLTmrXun3sSYjawQnfQSz?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7520.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 177b1d16-b2d4-4b2d-68fa-08db0dbf9801
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2023 12:41:14.2888 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uHKqJ/u/cffMcelF3uNaMqzCqojFC58d9e2EzMCuGN2spa+JuAqEZxW1/AxV0RRiyBkG/EEdjFwq8ZuP6BPj4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7549
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
Cc: "sumit.garg@linaro.org" <sumit.garg@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Jerome Forissier <jerome.forissier@linaro.org>,
 =?iso-8859-1?Q?Cl=E9ment_Faure?= <clement.faure@nxp.com>,
 "fredgc@google.com" <fredgc@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "afd@ti.com" <afd@ti.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "op-tee@lists.trustedfirmware.org" <op-tee@lists.trustedfirmware.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 Olivier Masse <olivier.masse@nxp.com>,
 "joakim.bech@linaro.org" <joakim.bech@linaro.org>,
 Etienne Carriere <etienne.carriere@linaro.org>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

>>
>>
>> -----Original Message-----
>> From: Jerome Forissier <jerome.forissier@linaro.org>
>> Sent: Friday, February 3, 2023 1:32 PM
>> To: Etienne Carriere <etienne.carriere@linaro.org>; Olivier Masse=20
>> <olivier.masse@nxp.com>
>> Cc: sumit.garg@linaro.org; linux-media@vger.kernel.org;=20
>> fredgc@google.com; linaro-mm-sig@lists.linaro.org; afd@ti.com;=20
>> op-tee@lists.trustedfirmware.org; jens.wiklander@linaro.org;=20
>> joakim.bech@linaro.org; sumit.semwal@linaro.org; Cyrille Fleury=20
>> <cyrille.fleury@nxp.com>; Peter Griffin <peter.griffin@linaro.org>;=20
>> linux-kernel@vger.kernel.org; dri-devel@lists.freedesktop.org; Cl=E9ment=
=20
>> Faure <clement.faure@nxp.com>; christian.koenig@amd.com
>> Subject: Re: [EXT] Re: [PATCH v2 1/1] tee: new ioctl to a register=20
>> tee_shm from a dmabuf file descriptor
>>
>> On 2/3/23 15:12, Cyrille Fleury wrote:
>> Hi all,
>>
>> >On 2/3/23 12:37, Etienne Carriere wrote:
>> >> Hell all,
>> >>
>> >> +jerome f.
>> >>
>> >> On Fri, 3 Feb 2023 at 12:01, Olivier Masse <olivier.masse@nxp.com> wr=
ote:
>> >>>
>> >>> On jeu., 2023-02-02 at 10:58 +0100, Etienne Carriere wrote:
>> >>>> Caution: EXT Email
>> >>>>
>> >>>> On Thu, 2 Feb 2023 at 09:35, Sumit Garg <sumit.garg@linaro.org>
>> >>>> wrote:
>> >>>>> Hi Cyrille,
>> >>>>>
>> >>>>> Please don't top post as it makes it harder to follow-up.
>> >>>>>
>> >>>>> On Thu, 2 Feb 2023 at 13:26, Cyrille Fleury=20
>> >>>>> <cyrille.fleury@nxp.com
>> >>>>>> wrote:
>> >>>>>> Hi Sumit, all
>> >>>>>>
>> >>>>>> Upstream OP-TEE should support registering a dmabuf since a=20
>> >>>>>> while, given how widely dmabuf is used in Linux for passing=20
>> >>>>>> buffers around between devices.
>> >>>>>>
>> >>>>>> Purpose of the new register_tee_shm ioctl is to allow OPTEE to=20
>> >>>>>> use memory allocated from the exiting linux dma buffer. We=20
>> >>>>>> don't need to have secure dma-heap up streamed.
>> >>>>>>
>> >>>>>> You mentioned secure dma-buffer, but secure dma-buffer is a=20
>> >>>>>> dma- buffer, so the work to be done for secure or "regular" dma=20
>> >>>>>> buffers by the register_tee_shm ioctl is 100% the same.
>> >>>>>>
>> >>>>>> The scope of this ioctl is limited to what existing upstream=20
>> >>>>>> dma- buffers are:
>> >>>>>>         -> sharing buffers for hardware (DMA) access across=20
>> >>>>>> multiple device drivers and subsystems, and for synchronizing=20
>> >>>>>> asynchronous hardware access.
>> >>>>>>        -> It means continuous memory only.
>> >>>>>>
>> >>>>>> So if we reduce the scope of register tee_shm to exiting dma-=20
>> >>>>>> buffer area, the current patch does the job.
>> >>>>>
>> >>>>> Do you have a corresponding real world use-case supported by=20
>> >>>>> upstream OP-TEE? AFAIK, the Secure Data Path (SDP) use-case is=20
>> >>>>> the one supported in OP-TEE upstream but without secure dmabuf=20
>> >>>>> heap [1] available, the new ioctl can't be exercised.
>> >>>>>
>> >>>>> [1]
>> >>>>> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%
>> >>>>> 2Fg%2F&data=3D05%7C01%7Ccyrille.fleury%40nxp.com%7C057d956d144a41e
>> >>>>> dd81808db0db1c7f9%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C6
>> >>>>> 38118829451030288%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLC
>> >>>>> JQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sda
>> >>>>> ta=3DtBh3qNiinzTn%2BgqE8IvGw%2BYvRvo8ztDt4W4O0noEkk8%3D&reserved=
=3D0
>> >>>>> ithub.com%2FOP-TEE%2Foptee_test%2Fblob%2Fmaster%2Fhost%2Fxtest%2
>> >>>>> Fsd
>> >>>>> p_basic.h%23L15&data=3D05%7C01%7Ccyrille.fleury%40nxp.com%7C9ff962
>> >>>>> fb5=20
>> >>>>> 8f6401c597808db05e2a64b%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7
>> >>>>> C0%=20
>> >>>>> 7C638110243232457377%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDA
>> >>>>> iLC=20
>> >>>>> JQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sda
>> >>>>> ta=3D
>> >>>>> UNB88rvmhQ5qRoIGN%2FpS4cQTES5joM8AjoyAAYzPKl0%3D&reserved=3D0
>> >>>>
>> >>>> OP-TEE has some SDP test taht can exercice SDP: 'xtest=20
>> >>>> regression_1014'.
>> >>>> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2
>> >>>> Fgi%2F&data=3D05%7C01%7Ccyrille.fleury%40nxp.com%7C057d956d144a41ed
>> >>>> d81808db0db1c7f9%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C638
>> >>>> 118829451030288%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQI
>> >>>> joiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3D%
>> >>>> 2FDGLzwTOc5%2F30%2BLy4bBVckK0fRJRsvuGcUvp6bfW9Tg%3D&reserved=3D0
>> >>>> thub.com%2FOP-TEE%2Foptee_test%2Fblob%2F3.20.0%2Fhost%2Fxtest%2Fr
>> >>>> egr
>> >>>> ession_1000.c%23L1256&data=3D05%7C01%7Ccyrille.fleury%40nxp.com%7C9
>> >>>> ff9=20
>> >>>> 62fb58f6401c597808db05e2a64b%7C686ea1d3bc2b4c6fa92cd99c5c301635%7
>> >>>> C0%=20
>> >>>> 7C0%7C638110243232457377%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAw
>> >>>> MDA=20
>> >>>> iLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&s
>> >>>> dat
>> >>>> a=3De%2B40rwWvtvVFG8aWZNeu%2FgjMXXvZ3pRhJfHLkdurovs%3D&reserved=3D0
>> >>>>
>> >>>> The test relies on old staged ION + local secure dmabuf heaps no=20
>> >>>> more maintained, so this test is currently not functional.
>> >>>> If we upgrade the test to mainline dmabuf alloc means, and apply=20
>> >>>> the change discussed here, we should be able to regularly test=20
>> >>>> SDP in OP-TEE project CI.
>> >>>> The part to update is the userland allocation of the dmabuf:
>> >>>> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2
>> >>>> Fgi%2F&data=3D05%7C01%7Ccyrille.fleury%40nxp.com%7C057d956d144a41ed
>> >>>> d81808db0db1c7f9%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C638
>> >>>> 118829451030288%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQI
>> >>>> joiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3D%
>> >>>> 2FDGLzwTOc5%2F30%2BLy4bBVckK0fRJRsvuGcUvp6bfW9Tg%3D&reserved=3D0
>> >>>> thub.com%2FOP-TEE%2Foptee_test%2Fblob%2F3.20.0%2Fhost%2Fxtest%2Fs
>> >>>> dp_
>> >>>> basic.c%23L91&data=3D05%7C01%7Ccyrille.fleury%40nxp.com%7C9ff962fb5
>> >>>> 8f6
>> >>>> 401c597808db05e2a64b%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7
>> >>>> C63=20
>> >>>> 8110243232457377%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQ
>> >>>> Ijo=20
>> >>>> iV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3D5rP
>> >>>> V1j
>> >>>> qzqjVh2N5pdUW41YwF6EkgIDwfhyfYkgmtdZI%3D&reserved=3D0
>> >>>>
>> >>>>
>> >>>
>> >>> the test was already updated to support secure dma heap with=20
>> >>> Kernel version 5.11 and higher. the userland allocation could be fin=
d here:
>> >>> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F
>> >>> git%2F&data=3D05%7C01%7Ccyrille.fleury%40nxp.com%7C057d956d144a41edd
>> >>> 81808db0db1c7f9%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C63811
>> >>> 8829451030288%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoi
>> >>> V2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DdUNus
>> >>> R9w0TlzTRiqUUhU8yo%2BUF7QPhsx5t8GQuAA1SU%3D&reserved=3D0
>> >>> hub.com%2FOP-TEE%2Foptee_test%2Fblob%2F3.20.0%2Fhost%2Fxtest%2Fsdp
>> >>> _ba
>> >>> sic.c%23L153&data=3D05%7C01%7Ccyrille.fleury%40nxp.com%7C9ff962fb58f
>> >>> 640
>> >>> 1c597808db05e2a64b%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C63
>> >>> 811=20
>> >>> 0243232457377%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoi
>> >>> V2l=20
>> >>> uMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3D01H96n47
>> >>> K6R
>> >>> mBKZQhRdcqX3nE5VBHOXNfGuMmmkVSvc%3D&reserved=3D0
>> >>>
>> >>
>> >> Oh, right. So fine, optee_test is ready for the new flavor of=20
>> >> secure buffer fd's.
>> >>
>> >>
>> >>> This upgrade need a Linux dma-buf patch:
>> >>> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F
>> >>> lor%2F&data=3D05%7C01%7Ccyrille.fleury%40nxp.com%7C057d956d144a41edd
>> >>> 81808db0db1c7f9%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C63811
>> >>> 8829451030288%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoi
>> >>> V2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3D4iomH
>> >>> K4kPt6A4OmyioiIFD360bGh39o0d2%2BJGyI3WYM%3D&reserved=3D0
>> >>> e.kernel.org%2Fall%2F20220805154139.2qkqxwklufjpsfdx%4000037740335
>> >>> 3%2
>> >>> FT%2F&data=3D05%7C01%7Ccyrille.fleury%40nxp.com%7C9ff962fb58f6401c59
>> >>> 780
>> >>> 8db05e2a64b%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C638110243
>> >>> 232=20
>> >>> 457377%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzI
>> >>> iLC=20
>> >>> JBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DyCS%2BDcuGp%2Ba
>> >>> fAL
>> >>> tpw74O1bI0K%2Fwnt%2FOw5ob1ngfDA0E%3D&reserved=3D0
>> >>
>> >> @Jens, @Jerome, do we want to pick the 2 necessary Linux patches in=20
>> >> our Linux kernel fork (github.com/linaro-swg/linux.git) to exercise=20
>> >> SDP in our CI and be ready if dma-buf secure heaps (ref right=20
>> >> above) is accepted and merged in mainline kernel?.
>> >
>> >How would that help? I mean, when the kernel patches are merged and=20
>> >if things break we can make the necessary adjustments in the=20
>> >optee_test app or whatever, but in the meantime I don't see much=20
>> >point. I suppose the people who are actively developing the patches=20
>> >do make sure it works with OP-TEE ;-)
>> >
>> >Regards,
>> >--
>> >Jerome
>>
>> As mentioned in the cover letter, this IOCTL got tested by Jens Wiklande=
r <jens.wiklander@linaro.org>, using Linaro reference board from Hikey 6620=
:
>> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flist
>> s.trustedfirmware.org%2Farchives%2Flist%2Fop-tee%40lists.trustedfirmwa
>> re.org%2Fthread%2FI3TZN4TBDOUVE567VMMN2TAXGWZNY7S3%2F&data=3D05%7C01%7Cc
>> yrille.fleury%40nxp.com%7C057d956d144a41edd81808db0db1c7f9%7C686ea1d3b
>> c2b4c6fa92cd99c5c301635%7C0%7C0%7C638118829451030288%7CUnknown%7CTWFpb
>> GZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0
>> %3D%7C3000%7C%7C%7C&sdata=3DEHEVIdfHacDVq%2BCdSYg0Tkm1ekQLEI6Vra4elN0%2F
>> %2F6I%3D&reserved=3D0
>> It also works on i.MX8M EVK boards.
>>
>> My understanding today is we are good to upstream this patch, knowing:
>>      - Upstream OPTEE driver should support registering a dmabuf since a=
 while, given how widely dmabuf is used in Linux for passing buffers around=
 between devices.
>>      - review is OK
>>      - test environment is already available in optee-test
>>      - it has been tested on 2 different platforms
>>      - the scope of the new ioctl is limited to existing feature in=20
>> dma-buffer
>>
>> What is missing from this list preventing to upstream ?
>
>Please address the comments from Etienne and post a new version of the pat=
ch based on the latest kernel. Please try to improve the language in the co=
mmit message.
>
>Is it possible to update the tests so this can be tested on QEMU in our CI=
 loop? That should help to get the review restarted.
>
>Thanks,
>Jens
>

Hi Jens
 Could you point the Etienne comment(s) not addressed by the pull request t=
o add register tee_shm ioctl to linux optee-driver?=20
  Last comments from Etienne:
        -> Oh, right. So fine, optee_test is ready for the new flavor of se=
cure buffer fd's.
        -> @Jens, @Jerome, do we want to pick the 2 necessary Linux patches=
 in our Linux kernel fork (github.com/linaro-swg/linux.git) to exercise SDP=
 in our CI and be ready if dma-buf secure heaps (ref right above) is accept=
ed and merged in mainline kernel?.

Regards.
Cyrille.


>> Who do we still need to convince ?
>>
>> Regards.
