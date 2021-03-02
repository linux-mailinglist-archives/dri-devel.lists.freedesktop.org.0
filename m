Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC84329F8A
	for <lists+dri-devel@lfdr.de>; Tue,  2 Mar 2021 13:54:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B70B36E940;
	Tue,  2 Mar 2021 12:54:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0014ca01.pphosted.com (mx0b-0014ca01.pphosted.com
 [208.86.201.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91EB26E940
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Mar 2021 12:54:03 +0000 (UTC)
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 122CnBDp007165; Tue, 2 Mar 2021 04:53:53 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint;
 bh=P68+5+ZAxn9B7q8g5dQazmEMAq9GvY17YJuLJja82PM=;
 b=UXDKSNbcAgUJt/qmHFpQedTDjfdeKRPvQlRzhVQHeVXk9JeMpyXuA93ciFpZUePcR+UU
 h00ZeKc9WxtLJL3VEmcqRfvL5wUrcnUwNZtB1TXPDHhu25CR7d1qmxwknaQwzTfD04I8
 MUg6IxFI8kYqiSRDofCneT2No8A1jvqXDBebLEEDKPQZcJnQJmriilb1yskJb+GJJUM0
 QTruvS/EtmoKd0HR+XKKySp7Fs1gKzSlZCSzsLbePd6qs2rPpcSlKMaJ92PYilNvl2xx
 0CEJO6FcCFydPzCOa3VioW9Uraeme/r80h16bNVt9ER5Z5aB1sPw2jEe5aNeS86ZuSsu aQ== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
 by mx0b-0014ca01.pphosted.com with ESMTP id 36yjj2h4qf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 04:53:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EACrELcQqtQbHsLXpF+Z1D1aDwEg8FMsGlEz3Fscpoyf6Q9WqqhKwbckZN0J+mFVrvY/1j+1cRqwyoSWmJSu9AoJRatKFYXwEaTCigyRZy7oH9ko47k2Kb0K3ESgDY58WvK4VSJMrMb0IKHC8xfs7Lv/8U3bvTgndV5dsY/T/gIZCgl6YuuLxrEd+KL8KYniomqKF6/fqfo5YKWMWEZEo61JodDGszujdotVRE7xSUoGud5Pz2X5lCuQ3A6b+aKS9PYXjCxdIuikyw8HNAzo/aoY+a9f22ak2V4eHr+EdxZ8jVCLYuq2OnwNY7z4WUH5cWu1dk3XoWtiKToYHmIkkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P68+5+ZAxn9B7q8g5dQazmEMAq9GvY17YJuLJja82PM=;
 b=jaFAK1t8ai4yZ1lxN+tadan8oSWNf+m1sQfz1LAHBOhnW/LRVt66S1B6d1a1yB7xQ7AqsV/dDS53QM6pxXo9JUdagbFlSe2FTEcKJaKspNZGxQ3/9YEuXm2enOla2m2Ep8RL53V0k20xRFp84mm8DvcICrvIaLbpnErUVN9WOIcht0ZV5UXpNs7VYCXst25f1yyWpbUy9HcW8kVBD6olnwk2m7Ok1krbKDrXxJhuT6DpSeOFrPrucH8Vl8NJLlbxwLVB1AWBSlu1FPahP8nsmlodGXnZK4JRLcG5FjELuIGc0niGWYSL8t7Pb/Olle72i7P/7P3lvMMuj6nWSBvJmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cadence.com; dmarc=pass action=none header.from=cadence.com;
 dkim=pass header.d=cadence.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P68+5+ZAxn9B7q8g5dQazmEMAq9GvY17YJuLJja82PM=;
 b=qYl7eREn1znKvv9Mr5Mqzv3GHHg2wj1VSMdlg5RXArCfS6MVpVEILQnP2d1R0DP5UaDOO7ix7X2ifviFb07jX2CwBSFRJhWwHGltkYrH4edKPRqZxv2sl8zX4yAOPbUcAifIROVzRR5zaadeiEgRjUVER2vjidj0C1nwmSfgf4Y=
Received: from DM5PR07MB3196.namprd07.prod.outlook.com (2603:10b6:3:e4::16) by
 DM6PR07MB5914.namprd07.prod.outlook.com (2603:10b6:5:15e::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.23; Tue, 2 Mar 2021 12:53:50 +0000
Received: from DM5PR07MB3196.namprd07.prod.outlook.com
 ([fe80::3160:6a62:6e4d:2226]) by DM5PR07MB3196.namprd07.prod.outlook.com
 ([fe80::3160:6a62:6e4d:2226%5]) with mapi id 15.20.3890.029; Tue, 2 Mar 2021
 12:53:50 +0000
From: Parshuram Raju Thombare <pthombar@cadence.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH v2 1/2] dt-bindings: drm/bridge: MHDP8546 bridge binding
 changes for HDCP
Thread-Topic: [PATCH v2 1/2] dt-bindings: drm/bridge: MHDP8546 bridge binding
 changes for HDCP
Thread-Index: AQHXDo0sCc9s3aGgTUeo76y9eToCYapvRZgAgAAHa+CAAAWAAIABVXGg
Date: Tue, 2 Mar 2021 12:53:50 +0000
Message-ID: <DM5PR07MB319628C858F667D9E5058904C1999@DM5PR07MB3196.namprd07.prod.outlook.com>
References: <1614597685-4192-1-git-send-email-pthombar@cadence.com>
 <1614597746-4563-1-git-send-email-pthombar@cadence.com>
 <YD0LKg3Jl5nauMqF@pendragon.ideasonboard.com>
 <DM5PR07MB319661E8BFEB251CE17AF587C19A9@DM5PR07MB3196.namprd07.prod.outlook.com>
 <YD0WAMySrv53lxFR@pendragon.ideasonboard.com>
In-Reply-To: <YD0WAMySrv53lxFR@pendragon.ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNccHRob21iYXJcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy01M2ZiZTYyZi03YjU2LTExZWItODYyZC0wMGUwNGIzNmI1YjFcYW1lLXRlc3RcNTNmYmU2MzEtN2I1Ni0xMWViLTg2MmQtMDBlMDRiMzZiNWIxYm9keS50eHQiIHN6PSI5MjMiIHQ9IjEzMjU5MTYzMjI4MTQ5NTMxMCIgaD0iWTQzbDBVNk1zMC9SSmMvOHJtalpyenNyYnBZPSIgaWQ9IiIgYmw9IjAiIGJvPSIxIi8+PC9tZXRhPg==
x-dg-rorf: true
authentication-results: ideasonboard.com; dkim=none (message not signed)
 header.d=none;ideasonboard.com; dmarc=none action=none
 header.from=cadence.com;
x-originating-ip: [59.145.174.78]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cfff1cd0-e6cf-40d5-b710-08d8dd7a3a74
x-ms-traffictypediagnostic: DM6PR07MB5914:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR07MB5914DFB6EFD91D0AC3D4E73CC1999@DM6PR07MB5914.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MAJQ6tFUod/u/K6AwSZfNCo40h7aFNWn/74QVDDanPoBxb0SA2Z/EqncpEZeD57gcys0DXifYMs9WCRltntTHspdmKeZC4dJ4odVj7vEnyYkaWA/xGfdWwAA3F3wNPuSRcxddDsxOHQ03sBG6LdfigMcDnCSbAKaWTUnJklr4QMbhK1WZ1uAMI3hb+KrSnad8mv/kFYIrwu2NVz5s1S7iH13Hq8sACV0ZyLUDeuUz999mun9iA7Ab1kivQ/KUkEAn+Rc4jARBOkeWYZ7lp7dF/mwUlv1dj7uhpFzqDDI9DwdFRKgiF9IbiAUUT/HOZEDG6XUEby2EhPMzYq0hIZn8ET7/tIkChZMWWmZO3z4FsyEjVUH0m9IrVcIkQwK+bK3WLHxtYUcIazn+DcJ6NPCkQ/1mU0noG9r+42iQriLDjSfIRqmId2pZuP0Eb85uxnyXs3dPwymgAN4YDpEWGbTe4WOfMm4eA3FfMdTMN3/DSQJmCotV/pHXz0fOpYPbvFtR3OgLasdlxYpcV+9orRtCLY89H7zCsPXSOob9jUuwV7YiLw551bZ75uDhaDE2iTE
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR07MB3196.namprd07.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(39860400002)(136003)(376002)(366004)(36092001)(107886003)(186003)(52536014)(4744005)(2906002)(7416002)(6506007)(71200400001)(8936002)(66946007)(316002)(33656002)(26005)(76116006)(54906003)(66556008)(64756008)(55016002)(6916009)(8676002)(5660300002)(9686003)(478600001)(66446008)(66476007)(7696005)(86362001)(4326008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?VmhSV1NCZThyaUNIeVdETTZVNnlNdEM2YjU5N256Z2JmUkQ2WnlYUUFhV3h5?=
 =?utf-8?B?Mi8rd0I0ZE9XbHU4SUdueDl1ZDM5WlY5L3NaS1FCbWdCWlJvZUJDUUk3SEdS?=
 =?utf-8?B?bW40UkdHend4U0lsSDY0MEFyTWorOWxuMk1mei85Z0NYWEhzd0d2a0xSL2pz?=
 =?utf-8?B?RTB2L1dZa1RaMnFLR09JN2Y5akgya25JcE5OaklGOUxIN2FwUzc1ZC9KUFhn?=
 =?utf-8?B?MUsyZFBsZVU5bFlVWHBQdzNiUi9sRVRWMXppRWsxeFZkSk94QzN6dXRNMGJt?=
 =?utf-8?B?L1lJZ2xJejhwQS9oRWUxTnlzbEJnRUkvZFlaZ1BlNVVheHFDQWExcGMzK1M4?=
 =?utf-8?B?aXQrZDR0WThPSDVrVzhvVXNUek9HVEJhR1hob1NlSGVJVVZvL0pvWU8yNC9h?=
 =?utf-8?B?UnBVU0s5dlhnSVN2Z2p5VEhVTVV0VmozSnFxR3RpaWt5dXRpeXNmNHMrVW95?=
 =?utf-8?B?RmtXUHg5WU5IOGxjaEQwUmlCSE9wbzZyWjdVaVF5TDkzM1VzTmtGTUNKazhk?=
 =?utf-8?B?RG4yczQyaTNBeUloZUhwLzd2MnZoMXY3R0hnS1RocWwzaUNLTk5uakM0QzlJ?=
 =?utf-8?B?SElJUis5S0NLQ1M5MVRqaURGNnR3QmdaSzJVeFZjN3c2NVRXMndNOGpCK0xG?=
 =?utf-8?B?QkhIeXhVNFdXTEozQjVNejJJK3N2WFpndVFKem1HZ0x5dDVpcUp4dTkwQXhS?=
 =?utf-8?B?TXZUdEdFN3o5a0lVQVdOemVpazE4RE42aFdoc1lBTGdZaWxJUmMxVzhKcE9a?=
 =?utf-8?B?Nll5WXpIUCtYUGZUNkI0YWRhbzNFbzR3YlVtQkhacDRTejAvZ1pPZjd5WWV2?=
 =?utf-8?B?MTVNby9wTURRT0ovcXVPcjA5NzBySXFUdEJJN1Y0ankyMERRZHJZTkJNUzlP?=
 =?utf-8?B?ZTJTM3NIT2dWVERsZnN2cnQyQWVNZEU0ZEJwRHBia3BvZkd0Q2ZVclJ1YWFp?=
 =?utf-8?B?eGRUL0p1V1dPWEhKZkNCOFNKL1d1TXg4czc3eXhlbm45VC9pZm9LazBXSE9P?=
 =?utf-8?B?N2QxSW1wTGprRng1SzFHUlk3UU1rSmtlRFdhYjM3dUxpeTVpRStIZC94RlpP?=
 =?utf-8?B?R0Z1b1ExWHdSaFNJbGVTTmJTaytaQlNhOXRlNkl6ZDJLRlp3SW9NejBTZDNV?=
 =?utf-8?B?czIwN0tWbGtMYlpvTVl3MXY5Q3JCMnBTaE9OYnJRenhzWlJkVGVWWng2Rk1C?=
 =?utf-8?B?cHFDa0J6UjU5bk0xMjhGZmRjU2Rzb20vdEFPOXVvcndHakI4TXo4QVdDbEVY?=
 =?utf-8?B?QjFiWk5nU3FQenI5YTkzZzFzUk9BY1I4U0VKQXp3TGNXR1puQzFkUTdkYlox?=
 =?utf-8?B?QnJqaGhSU3YxbGQyVTEwb1pyTm9CZmJlNHVlUklSYkxvaXlLREpVdnRnZzkr?=
 =?utf-8?B?clRxN0VRcDgzWWJnWno0U3BYeFovT1d0TnhPY0lkMlFWc2d5OFIrUnJDYTVR?=
 =?utf-8?B?Rlp3ZmRVL0dGRmZZRzRvd2FJQUEzd2dpM3NDeDdDNHV0bVkxa3JqNE13UjBG?=
 =?utf-8?B?Y2UrWVF6RkhSMm4zYTZTMi9CZ1Z2MUlBZnlDUDIxRk5hNjg1bDFFZWRNNnNs?=
 =?utf-8?B?ampZOTY3NGdTVndPemp5Y25UZHZBU0ZFNHBjem1BR0hLSTFOOTJVUFdWaFA4?=
 =?utf-8?B?c050S2tseGg3d1B3UmM3Yjk5THlLd0lFbXA2RzBpeHArZmZvQi9jWW1VMTli?=
 =?utf-8?B?Z3FwNlZQRGxBbUczUXpYQ0k4RitrZUpHa09sK3hIcHNwcE44Z2x6VUVJeVR1?=
 =?utf-8?Q?dMn7QasDF7yJ3uX51UPgG8Cp7LCni+laCUv3TIn?=
MIME-Version: 1.0
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR07MB3196.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfff1cd0-e6cf-40d5-b710-08d8dd7a3a74
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2021 12:53:50.8121 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZRWiSD1CpCiQRHMxqH53EMEV3AZIo3xzJL+x0kNY2LlqefdUpWPmoG+fyoqVwV6+W/pq2QwhtYELO5JKSBmWnF5cwZOmxrkBUF/LSQ2z87o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR07MB5914
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-02_06:2021-03-01,
 2021-03-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 bulkscore=0
 clxscore=1015 adultscore=0 impostorscore=0 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2103020105
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "kishon@ti.com" <kishon@ti.com>, "a.hajda@samsung.com" <a.hajda@samsung.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "robert.foss@linaro.org" <robert.foss@linaro.org>,
 Swapnil Kashinath Jakhade <sjakhade@cadence.com>,
 "nikhil.nd@ti.com" <nikhil.nd@ti.com>, Milind Parab <mparab@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

>> > Is this a property of the hardware, that is, are there multiple versions
>> > of this IP core covered by the same compatible string that support HDCP
>> > 1.4 only, DHCP 2.2 only or both ? Or is it a way to select what a given
>> > system will offer ?[]
>>
>> MHDP hardware supports both HDCP 2.2 and 1.4. So, this is a way
>> to select the version of HDCP, system wish to support.
>
>Then I'm not sure this qualifies as a DT property, which should describe
>the system, not configure it. A way for userspace to configure this
>would be better.

Since this is for source device, I am not sure how useful it is to allow
user to change HDCP version supported. I think doing it in DTS
gives more control over HDCP to system designer/integrator.

Regards,
Parshuram Thombare
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
