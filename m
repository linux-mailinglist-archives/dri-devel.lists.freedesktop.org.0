Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C4F689C28
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 15:49:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3072110E7C6;
	Fri,  3 Feb 2023 14:48:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24F4710E7A8
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Feb 2023 14:13:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jrxtIIoMGB5YTFVONPHF8PHU1xp18UMoixtooFU7f2UklmfZyaBnifCY68kBuZChpw62K7A9ODUR95jAi9EwLTfVT8moSulAq8gKLEv5MBbD/ezRa9y9G2qFRemy5x/eMmX99FXKvjR10sQcRj74i/hTgb3HTEuBWggxujr9hCmgQW6+1pO1nIeoxK1RtH4Av0sY8T/3EQ+SOGQmHlr/YXbXrrXbNFJBLtwhK/tpsoBelb4EoxfcbbwpAl1iU+edNbpHWIi7d/JydLDlib/0QRA3vQm5Ak4nxcEbIyjm9hvV+SfqeOWTu+WQ6BA3xQ4yuw5WXN6C3t99QM0os+0v1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KP8YhG1uAjn2+bho3g4gINcpvyc4gvuMsGu7+GdOKnk=;
 b=Sofd2jtdQL6TRvAmNWv6UU8TpRVOwtnPesBQUxgnF/5MwjK71NBQDDD7PAvVbcjPVeYeack14Th/dWv5n1Jy/zASNpUSLuntJ6dtKnIGPbrWH+1m2as+G7m7NyFgSvzXOaNv8qFrxc1Dapow5SIIXARFK0GrDA3N/Em2+YT7uhcZwqIkk+kOA6VUH3AD2xYR3tp98byQAC0kPP4KUGMUJUcVBiwaFtDEv0V2bHm8/phmng7LWuwtucRdep22A71+8xPuflkclNcVT6VlaOscII+98ur1K/pITLyor1ObZye9BjM6U+mE7vTck+uDJDxnBcyc2yy4iQNCHXGcUtVbuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KP8YhG1uAjn2+bho3g4gINcpvyc4gvuMsGu7+GdOKnk=;
 b=SjSghEqwxS9AcJot3wywN7gVKZQB6GXiFt7z+5SJi6nTGFJxM28+3+4cw/ugVddFLx/XO0XzQTQhfwSXpme4k2iKDKtFa2dS7eXz5cAbZFJxyNnSsEaCf8b5k+apTRnS21fjgAraHco947nVGPxFY8eiSp38QrEsfhAr0387CIU=
Received: from PA4PR04MB7520.eurprd04.prod.outlook.com (2603:10a6:102:e9::5)
 by DBBPR04MB7980.eurprd04.prod.outlook.com (2603:10a6:10:1f0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.30; Fri, 3 Feb
 2023 14:13:53 +0000
Received: from PA4PR04MB7520.eurprd04.prod.outlook.com
 ([fe80::a605:8cb9:97af:4089]) by PA4PR04MB7520.eurprd04.prod.outlook.com
 ([fe80::a605:8cb9:97af:4089%9]) with mapi id 15.20.6043.038; Fri, 3 Feb 2023
 14:13:53 +0000
From: Cyrille Fleury <cyrille.fleury@nxp.com>
To: Jerome Forissier <jerome.forissier@linaro.org>, Etienne Carriere
 <etienne.carriere@linaro.org>, Olivier Masse <olivier.masse@nxp.com>
Subject: RE: [EXT] Re: [PATCH v2 1/1] tee: new ioctl to a register tee_shm
 from a dmabuf file descriptor
Thread-Topic: [EXT] Re: [PATCH v2 1/1] tee: new ioctl to a register tee_shm
 from a dmabuf file descriptor
Thread-Index: AQHZMj2tcBtqkaJcQUCvE2iCWyqqy665mRQAgAGzCXCAABHpgIAAF0mAgAGj0wCAAAoTgIAAD1KAgAAVqyA=
Date: Fri, 3 Feb 2023 14:13:53 +0000
Message-ID: <PA4PR04MB75207FF08A6C2EEC1944FFFE88D79@PA4PR04MB7520.eurprd04.prod.outlook.com>
References: <20220812143055.12938-1-olivier.masse@nxp.com>
 <20220812143055.12938-2-olivier.masse@nxp.com>
 <30534fadb8172088eddef46ae71d87c167cbf32e.camel@nxp.com>
 <CAFA6WYOMCswgHHxsgc9Hgi7rmTPaZDqce=BixvYoFTfL0bTFDQ@mail.gmail.com>
 <PA4PR04MB75204E8D2B959893A04D55F388D69@PA4PR04MB7520.eurprd04.prod.outlook.com>
 <CAFA6WYPGT8xZnB1idcxcHT1bvM=0kwFssBQbn063-qg=czM-ZQ@mail.gmail.com>
 <CAN5uoS8XgvAKVwKHx-uOe3hAa4Jrd5FJt6xNOG5s-simkRND9w@mail.gmail.com>
 <c86d1a46af6e076038b3f0c2dd68213ff1e8b254.camel@nxp.com>
 <CAN5uoS-A8EovbnxvcXqiYHcy95d-PTYUZvnNr3=kf84AGkG8Kw@mail.gmail.com>
 <f3ccd7ad-0bbb-be39-c989-765552e2c6af@linaro.org>
In-Reply-To: <f3ccd7ad-0bbb-be39-c989-765552e2c6af@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR04MB7520:EE_|DBBPR04MB7980:EE_
x-ms-office365-filtering-correlation-id: 1bf088c5-d1ad-46c1-40a4-08db05f0e149
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: itVlbdXb/9EIwNj2zywWe5QT44SVGH1uTFTxxD3FdzOeEeCIIbzF8hanCFcSo+og1GzWpPcGYRK8XlD2Z5t4oudue+ROqm80p2yfTo+NNirWFF0rAW6rAf8Hgl/VlU/kZs2Ruy2wyMUWMa5IQIddfryOjNvds/aymc/+m3vh4eWTv4jRpSj4cOs9NU+jNkFp1RJkmfMbgi2qbmgbL9Vx30jqHZt/NRqRcy1g3xO4uqddsLW0RU1ExF6H8jB+11wu2jojGCMt4408xZHX3tQ+iT7PDXTg0oC91dpeOz4qi2d6vTmpiO/X0uM+pbmL3u5n0O2GvbvOntOS/A3ftBc3jvvolM1pkAmroE4VmAVB1Pf/RSgHHQ24/o24NLOyqQR/rdzXdhbus/Utwwz9Xw8EBSPUEusgWtxR4lhbK4ScirnHlXi0w7evpSer1qc6qoKc1E73lJpzzYhxcVCv57GXN5yRo59LfVCCL9NoFJLeqpkQ7fv7n4zohEuWJUQzHVDVhRUQKwjPbUGkA96vvGY4R+FwRmdOZ9zu4veX9tXTE5ZneerviIn2FJTfKH4IufilrHL/eFYDphWeVYW6qgP5e1udy9NtNbkQfn/cwYuiZfO2IjUhzLvoersqJUumAH+A4oCGtNqxM8zS5WhzLBXsKf8s8ecqTIRe2Qh3UiGU/hdFSntkK06g7Ma7MVJT3PdTZ5sl35IjMw8IkqvWLnmvQdoM7+50C3lMZcPSE6PnrMg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR04MB7520.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(39860400002)(366004)(376002)(346002)(396003)(451199018)(83380400001)(38070700005)(86362001)(55016003)(33656002)(122000001)(38100700002)(54906003)(110136005)(5660300002)(7416002)(45080400002)(7696005)(2906002)(71200400001)(44832011)(6636002)(41300700001)(8676002)(64756008)(4326008)(66446008)(66556008)(76116006)(66946007)(8936002)(52536014)(66476007)(316002)(966005)(66574015)(55236004)(478600001)(6506007)(9686003)(53546011)(26005)(186003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?H+tB6gu7uNvk5P1CT+ODqbgB5+jwmSLCj7NxtsqpqF873CFCQ9vQdFZHKX?=
 =?iso-8859-1?Q?NbDoDePXoxfQwH2OL88GO26u1MzMfcCO13xnEqdfzh6xPGyJ+K0RR+d8gi?=
 =?iso-8859-1?Q?T4j4gP3mI996TKccmZdqfEfRTd6KGX0jAS8KDQScnEq/eROdYjrLwvkhNv?=
 =?iso-8859-1?Q?LT0yJlWtzh22xiqCc+kCul31Rk/r1VCMJb5AQmU0zRg18E/AzvzRpZEkUV?=
 =?iso-8859-1?Q?+pXJzkNFnSOHaJ51nwrNYara/BbEST4ssSYK0gZYB2z2lIpc50S8eHy3Hc?=
 =?iso-8859-1?Q?GbmFtcTXFSp/pjcUwtyQs/U6rLAcQH+Hh362ztHRUSB8eCJ0tTcv+3HbMO?=
 =?iso-8859-1?Q?Wh+zbb0e2rI2hKmiPGQm7rd7OvkcxRYA8ZOfDglXmy7acjLInOBp0RtXB0?=
 =?iso-8859-1?Q?AnhvaraAZOu7AWa0qN63L6yFonx8/8+IGfIcHGwXkI/qCM15K+gRhMMTij?=
 =?iso-8859-1?Q?zCLBmERRH4vU9WJHM8g+/ZOb4yQzALsnS/pH6Xk2fpmYKRttnCGD+dMhGx?=
 =?iso-8859-1?Q?sGL98ELabUu3j6+hAs4rOuZc3YS2EwmXGN+fS0J6oO9UNhWkC07FIZnpcT?=
 =?iso-8859-1?Q?mb1dAu7N/o6AuKn6Zx+NYI5Gm3Pz6y8M2iSGMq967m3p/AHwjcHm3LGh8R?=
 =?iso-8859-1?Q?1LY2l/ORmxuQnRuMmjFAIUTllO28Hnu7aXXx0GVYfdheDdXivb+KO2/hyn?=
 =?iso-8859-1?Q?aYkdJgICCgo2ewT0XfiM6q984/OO9Wgw7+gX8JepEiysYgb+HFYb5lj0kf?=
 =?iso-8859-1?Q?ebQabS+SqwD8mewJXoVwvuyO1I69fInbs96ykIsmCOaP9M6pYqI7H6xxuS?=
 =?iso-8859-1?Q?8zN9JGrhxi/18dXRhAIyFKGMyYkarEAtuJmwrqXVcvgBH6h2++f/gOH51o?=
 =?iso-8859-1?Q?46IzTFtLDH8rrZkpDyO1Q8bcggM1I2qFtFfXXaaXBprjjlzdouXYAdhhwb?=
 =?iso-8859-1?Q?nYcV8RRpNodnC55MvlMH5qTNkFrkGF2GhtZSZ5eIO1ghZmns2xRGNN51R4?=
 =?iso-8859-1?Q?e+AUNtvZSCtVo4ccqcXNQqPP6p7VAy2y/OrZH6xl7uADjOXPv+MfWdJFBe?=
 =?iso-8859-1?Q?p7EVZ45FLYDAmSVn6LLL6bg8it9MzblMtjeFhTdDU2/6vX6PtzaT+V4NTv?=
 =?iso-8859-1?Q?iKUYareES0MBOSurvtioAcgt6ayVMZX8EEATUGdCwMN9krmYs1WAyuQakF?=
 =?iso-8859-1?Q?gxZMm/UJvzpD5gQ0xGhmLleGq4CtQ9kqSo0VHfFHBUJaYmkWN3cc+DTUgc?=
 =?iso-8859-1?Q?XtLi73RvyQa0yoc1cLVkNJVlEBdEZjejNGzw94CnHzg/IFEsOPTQ4gOxh/?=
 =?iso-8859-1?Q?AcNsDNkpw0xfP0J/nklEbBTn15TISKigGaxSefX0g/SVgBceW2jMsxwYr4?=
 =?iso-8859-1?Q?rjRTbTAZdB8nsP0y4UEUwfxQwMUPIKo4YE7ORtxvUNTEFf/KPpL9P1IElV?=
 =?iso-8859-1?Q?lCXHgTE28bB5d6kQMXjHcM+NIh+M8GuphKfml7SUPy6JUI8XVNB55d0jCw?=
 =?iso-8859-1?Q?LqnJ2PATHney2i+2O0epTSmhXt79rIQeDlnyxmxghA6o47ZKAeqAf6lHm2?=
 =?iso-8859-1?Q?4OZZZZacSOhtZDKLEVYR1Q3zObxBALJlqfFHBXHzVFMqqdrsicnv5o4pxz?=
 =?iso-8859-1?Q?n90++5TSB3f7VkaDVWf3lPCoTtzEFezzqA?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7520.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bf088c5-d1ad-46c1-40a4-08db05f0e149
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2023 14:13:53.2708 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8WT77gp6Sa/cWQKq2XCjKw4aSnpHM6gtgf7zF3SlBbVeatEpI66wSu5MagPVIfhrSSDZ9xpP0JvOA96rBAOgaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7980
X-Mailman-Approved-At: Fri, 03 Feb 2023 14:48:53 +0000
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
 =?iso-8859-1?Q?Cl=E9ment_Faure?= <clement.faure@nxp.com>,
 "fredgc@google.com" <fredgc@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "afd@ti.com" <afd@ti.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "op-tee@lists.trustedfirmware.org" <op-tee@lists.trustedfirmware.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "joakim.bech@linaro.org" <joakim.bech@linaro.org>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "jens.wiklander@linaro.org" <jens.wiklander@linaro.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



-----Original Message-----
From: Jerome Forissier <jerome.forissier@linaro.org>
Sent: Friday, February 3, 2023 1:32 PM
To: Etienne Carriere <etienne.carriere@linaro.org>; Olivier Masse <olivier.=
masse@nxp.com>
Cc: sumit.garg@linaro.org; linux-media@vger.kernel.org; fredgc@google.com; =
linaro-mm-sig@lists.linaro.org; afd@ti.com; op-tee@lists.trustedfirmware.or=
g; jens.wiklander@linaro.org; joakim.bech@linaro.org; sumit.semwal@linaro.o=
rg; Cyrille Fleury <cyrille.fleury@nxp.com>; Peter Griffin <peter.griffin@l=
inaro.org>; linux-kernel@vger.kernel.org; dri-devel@lists.freedesktop.org; =
Cl=E9ment Faure <clement.faure@nxp.com>; christian.koenig@amd.com
Subject: Re: [EXT] Re: [PATCH v2 1/1] tee: new ioctl to a register tee_shm =
from a dmabuf file descriptor

On 2/3/23 15:12, Cyrille Fleury wrote:
Hi all,

>On 2/3/23 12:37, Etienne Carriere wrote:
>> Hell all,
>>
>> +jerome f.
>>
>> On Fri, 3 Feb 2023 at 12:01, Olivier Masse <olivier.masse@nxp.com> wrote=
:
>>>
>>> On jeu., 2023-02-02 at 10:58 +0100, Etienne Carriere wrote:
>>>> Caution: EXT Email
>>>>
>>>> On Thu, 2 Feb 2023 at 09:35, Sumit Garg <sumit.garg@linaro.org>
>>>> wrote:
>>>>> Hi Cyrille,
>>>>>
>>>>> Please don't top post as it makes it harder to follow-up.
>>>>>
>>>>> On Thu, 2 Feb 2023 at 13:26, Cyrille Fleury <cyrille.fleury@nxp.com
>>>>>> wrote:
>>>>>> Hi Sumit, all
>>>>>>
>>>>>> Upstream OP-TEE should support registering a dmabuf since a while,=20
>>>>>> given how widely dmabuf is used in Linux for passing buffers=20
>>>>>> around between devices.
>>>>>>
>>>>>> Purpose of the new register_tee_shm ioctl is to allow OPTEE to use=20
>>>>>> memory allocated from the exiting linux dma buffer. We don't need=20
>>>>>> to have secure dma-heap up streamed.
>>>>>>
>>>>>> You mentioned secure dma-buffer, but secure dma-buffer is a dma-=20
>>>>>> buffer, so the work to be done for secure or "regular" dma buffers=20
>>>>>> by the register_tee_shm ioctl is 100% the same.
>>>>>>
>>>>>> The scope of this ioctl is limited to what existing upstream dma-=20
>>>>>> buffers are:
>>>>>>         -> sharing buffers for hardware (DMA) access across=20
>>>>>> multiple device drivers and subsystems, and for synchronizing=20
>>>>>> asynchronous hardware access.
>>>>>>        -> It means continuous memory only.
>>>>>>
>>>>>> So if we reduce the scope of register tee_shm to exiting dma-=20
>>>>>> buffer area, the current patch does the job.
>>>>>
>>>>> Do you have a corresponding real world use-case supported by=20
>>>>> upstream OP-TEE? AFAIK, the Secure Data Path (SDP) use-case is the=20
>>>>> one supported in OP-TEE upstream but without secure dmabuf heap [1]=20
>>>>> available, the new ioctl can't be exercised.
>>>>>
>>>>> [1]=20
>>>>> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fg
>>>>> ithub.com%2FOP-TEE%2Foptee_test%2Fblob%2Fmaster%2Fhost%2Fxtest%2Fsd
>>>>> p_basic.h%23L15&data=3D05%7C01%7Ccyrille.fleury%40nxp.com%7C9ff962fb5
>>>>> 8f6401c597808db05e2a64b%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%
>>>>> 7C638110243232457377%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLC
>>>>> JQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3D
>>>>> UNB88rvmhQ5qRoIGN%2FpS4cQTES5joM8AjoyAAYzPKl0%3D&reserved=3D0
>>>>
>>>> OP-TEE has some SDP test taht can exercice SDP: 'xtest=20
>>>> regression_1014'.
>>>> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgi
>>>> thub.com%2FOP-TEE%2Foptee_test%2Fblob%2F3.20.0%2Fhost%2Fxtest%2Fregr
>>>> ession_1000.c%23L1256&data=3D05%7C01%7Ccyrille.fleury%40nxp.com%7C9ff9
>>>> 62fb58f6401c597808db05e2a64b%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%
>>>> 7C0%7C638110243232457377%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDA
>>>> iLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdat
>>>> a=3De%2B40rwWvtvVFG8aWZNeu%2FgjMXXvZ3pRhJfHLkdurovs%3D&reserved=3D0
>>>>
>>>> The test relies on old staged ION + local secure dmabuf heaps no=20
>>>> more maintained, so this test is currently not functional.
>>>> If we upgrade the test to mainline dmabuf alloc means, and apply the=20
>>>> change discussed here, we should be able to regularly test SDP in=20
>>>> OP-TEE project CI.
>>>> The part to update is the userland allocation of the dmabuf:
>>>> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgi
>>>> thub.com%2FOP-TEE%2Foptee_test%2Fblob%2F3.20.0%2Fhost%2Fxtest%2Fsdp_
>>>> basic.c%23L91&data=3D05%7C01%7Ccyrille.fleury%40nxp.com%7C9ff962fb58f6
>>>> 401c597808db05e2a64b%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C63
>>>> 8110243232457377%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjo
>>>> iV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3D5rPV1j
>>>> qzqjVh2N5pdUW41YwF6EkgIDwfhyfYkgmtdZI%3D&reserved=3D0
>>>>
>>>>
>>>
>>> the test was already updated to support secure dma heap with Kernel=20
>>> version 5.11 and higher. the userland allocation could be find here:
>>> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit
>>> hub.com%2FOP-TEE%2Foptee_test%2Fblob%2F3.20.0%2Fhost%2Fxtest%2Fsdp_ba
>>> sic.c%23L153&data=3D05%7C01%7Ccyrille.fleury%40nxp.com%7C9ff962fb58f640
>>> 1c597808db05e2a64b%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C63811
>>> 0243232457377%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2l
>>> uMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3D01H96n47K6R
>>> mBKZQhRdcqX3nE5VBHOXNfGuMmmkVSvc%3D&reserved=3D0
>>>
>>
>> Oh, right. So fine, optee_test is ready for the new flavor of secure=20
>> buffer fd's.
>>
>>
>>> This upgrade need a Linux dma-buf patch:
>>> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flor
>>> e.kernel.org%2Fall%2F20220805154139.2qkqxwklufjpsfdx%40000377403353%2
>>> FT%2F&data=3D05%7C01%7Ccyrille.fleury%40nxp.com%7C9ff962fb58f6401c59780
>>> 8db05e2a64b%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C638110243232
>>> 457377%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLC
>>> JBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DyCS%2BDcuGp%2BafAL
>>> tpw74O1bI0K%2Fwnt%2FOw5ob1ngfDA0E%3D&reserved=3D0
>>
>> @Jens, @Jerome, do we want to pick the 2 necessary Linux patches in=20
>> our Linux kernel fork (github.com/linaro-swg/linux.git) to exercise=20
>> SDP in our CI and be ready if dma-buf secure heaps (ref right above)=20
>> is accepted and merged in mainline kernel?.
>
>How would that help? I mean, when the kernel patches are merged and if thi=
ngs break we can make the necessary adjustments in the optee_test app or wh=
atever, but in the meantime I don't see much point. I suppose the people wh=
o are actively developing the patches do make sure it works with OP-TEE ;-)
>
>Regards,
>--
>Jerome

As mentioned in the cover letter, this IOCTL got tested by Jens Wiklander <=
jens.wiklander@linaro.org>, using Linaro reference board from Hikey 6620:
https://lists.trustedfirmware.org/archives/list/op-tee@lists.trustedfirmwar=
e.org/thread/I3TZN4TBDOUVE567VMMN2TAXGWZNY7S3/
It also works on i.MX8M EVK boards.

My understanding today is we are good to upstream this patch, knowing:
     - Upstream OPTEE driver should support registering a dmabuf since a wh=
ile, given how widely dmabuf is used in Linux for passing buffers around be=
tween devices.
     - review is OK=20
     - test environment is already available in optee-test
     - it has been tested on 2 different platforms
     - the scope of the new ioctl is limited to existing feature in dma-buf=
fer
    =20
What is missing from this list preventing to upstream ?=20
Who do we still need to convince ?

Regards.
