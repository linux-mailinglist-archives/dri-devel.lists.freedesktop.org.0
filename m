Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBECA7ACF6B
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 07:22:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBB6E10E1DE;
	Mon, 25 Sep 2023 05:22:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71C4310E1DF
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 05:22:09 +0000 (UTC)
X-UUID: 70ec15705b6311ee8051498923ad61e6-20230925
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=hhEfGST1rJ8oatR8TxnL0sXOfxts1M0KI19M/FqO+DE=; 
 b=LOXCBqMix2CA74QBq1pxbCdVIuafspp87XNV08sHNIT+d+h3E91NfPdNw/SiH0xX0zvk62D+kfcM8n1nFAsx4rKcCr4ZAy9Vl23uvYt0OJR3uXrR86yO77ranII2/IH1W8/ONOTE1co8/9aSlFfQU/jaFFcslLO0qo0JVsIr4no=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:cee31d71-ed1c-4308-9afd-ac48e2926238, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5f78ec9, CLOUDID:94093bbf-14cc-44ca-b657-2d2783296e72,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 70ec15705b6311ee8051498923ad61e6-20230925
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1697014448; Mon, 25 Sep 2023 13:21:54 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 25 Sep 2023 13:21:53 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Mon, 25 Sep 2023 13:21:53 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aJh275rLXwVR28Fr8eVvqUT0Cz6v01rdf9or5pc/LZ43UEXjPylI/4qQMx3WlmR4mvVsKF4Tlo+59uYz7MZzCoFRkzN7RByfWx9IMOUOO9gsmq1ulv85OMTT03O4iavdiVMdWklFftqwbHkufK3U8XUnWnYF+Y7dBcf2AdQOEO//1P5ih9q02LVk2ba2a3g8hsb04yp4q8sLLrWJijoXtLqjq3Eo27jTlw0BwHIYOfz3jL7rT+FjBeOOJDUK+uuJRh3EKcNdxrZkI1ddXby7066NlFNPgpugGR0wLx0wT78uvISS91wEhB+UD4K17fQoIleUmDkVOdD5b29DQHbaiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AznRIICahdzV825YF6kwtchoWm1Jez+chMvzAEVD4MM=;
 b=IP9bI45zEA1mZB6AJfSSDdjTVOzyaP+OOQgVaBf+RTpn5II1B/HKtBqs/IZ84yEevrp4mkcU7r6N3VMRQfPmHtbf1yA/6T7qNQVLbhSp6MGiceYMdBdOhsA0AYQg5zvMe692MIygnPPDHySBVItxPUKA3npNkxwN0BILfNvIbDdegt1DtLqgTu2ayajfGcdAMfflgw/j2Sd6OleO0gZcN9Ue8TEPpwMVnA3nadIWMOV0uToL/i7mZCf2773Va77FWdNrxwfLUXOqNyySml3PvmsXJl4qC8p2AlUgflFI4LWWU37OxKUs5ux5lmSnFajG/X2LkirZwx2D92UxBEs3Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AznRIICahdzV825YF6kwtchoWm1Jez+chMvzAEVD4MM=;
 b=ZQo3LtYlICjCCPJtY2O3PVANIJ4oFC1aD820HVYGhl7VQO0XRH985dhgDsS2HcCsdi9BUV4LU1fw4BjT3UNp3dLT14WK4LKoZUd139FQCgIR3+ePmCHpr2QTY68GnjUnAxQ9MMuWwo8JPhg7iz1JMIO1TW+9e8ZmK4D37ZHMtwc=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by PSAPR03MB5208.apcprd03.prod.outlook.com (2603:1096:301:41::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 25 Sep
 2023 05:21:49 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1b82:a45d:e171:62e8]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1b82:a45d:e171:62e8%4]) with mapi id 15.20.6813.027; Mon, 25 Sep 2023
 05:21:48 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
 <krzysztof.kozlowski+dt@linaro.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 07/15] mailbox: mediatek: Add loop pkt flag and irq
 handling for loop command
Thread-Topic: [PATCH 07/15] mailbox: mediatek: Add loop pkt flag and irq
 handling for loop command
Thread-Index: AQHZ6mWD5oVOGVt6VEG40kMSI9VJYbAou8iAgAJPyIA=
Date: Mon, 25 Sep 2023 05:21:48 +0000
Message-ID: <00f0bae9940be7b397c587c651e23c6c1e19a174.camel@mediatek.com>
References: <20230918192204.32263-1-jason-jh.lin@mediatek.com>
 <20230918192204.32263-8-jason-jh.lin@mediatek.com>
 <5d528036-e506-7b95-69bb-7748b26d2aa8@linaro.org>
In-Reply-To: <5d528036-e506-7b95-69bb-7748b26d2aa8@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|PSAPR03MB5208:EE_
x-ms-office365-filtering-correlation-id: fb1e127b-4c1d-4f44-16e6-08dbbd875162
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0dlrCq/79pqpLS8oC3ruoWE7X6kfUrf6j7b8H9hO9dMhlqq33gNbGLud+G+7fMZJVrTY+6JHBLWH/ANdIkIKj8xYeaUM0aw+wQzC2i0oZ9sCdN8Qz5Ctl62CLldHqcT64FBeYgvdgIVlA5CWKYyBUSdtJ7RC+fKepV5xFW//Z3xOia6oAVSAv8hCqUkd1n3t9YnGSsjTvmGD5g0qoQ93v7vP+ONOJTMkOTta8F/8YvD00ev73ARR9i+PFvcvlm65shSIi3rs35UaZr+x7pFneUio5y9kjWTGwzKPK946M8SSBy6jNq/panvxLrBfCpzSJht4Ql8GDM8VDO6r0FRMkS9ZPgD6gR7yWos3k2yuCVGzXteAUpwC5Vq02kY/rDXiTPjiRPDu9MZ/IosTtTY91ln34uZXe41W5mNC1nFBX6OApiH6wlIqxqhirwKofU5zRdkuJzHuis0UBTInk6t2dspiV0dIU01jpHPwoHoK/wPuwmCuWbW7lLL9/t5mt/08ddDKwJAsn7DcxkPNr4DE6mycQeA9MhgvwNa6Bqe9uz5AEkium/DOKAD8n4vscUVN8ISVn+z/Pkr6fOpd4os027UVVuDcLYJj0aToVPLJUeJJpjLxDzRQlvt2df8PQIqXU+ejw9bj3M12ZplLFanTszd2CLY/Pn5io0JUjRsthig=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(396003)(346002)(39860400002)(366004)(230922051799003)(451199024)(1800799009)(186009)(8936002)(4326008)(8676002)(26005)(15650500001)(91956017)(110136005)(2906002)(478600001)(316002)(7416002)(41300700001)(76116006)(66556008)(66446008)(66946007)(54906003)(64756008)(66476007)(5660300002)(6486002)(6506007)(71200400001)(53546011)(6512007)(107886003)(36756003)(85182001)(2616005)(83380400001)(122000001)(38070700005)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bFVNdU0yUXJsbGhmWjhKMmpYNytMTXVQYk40SUNTOEZCclpzL3RnOHp6SHlW?=
 =?utf-8?B?Wm84R3Iyazd6aElGZVFkbTNYMGdzVXVUekx3cFhHclByVC9Hc2JMa085ZEVD?=
 =?utf-8?B?WG4remdJRXRtL1kzVkJzMFViVERTMmRRSU5QeGdObk8yUks2NWxvZ1VzbjBw?=
 =?utf-8?B?bG5YdE42ajBzOFU3eE9NTUVMMHdNQnFOdmZNQndWYld1b3l1TU1tbWhHdXJ2?=
 =?utf-8?B?NmVkMk12T1l5RFVZc3NaeG5XSkN6dWdVVm5JMDRsTGpjQmx2RG9SS0tVNktW?=
 =?utf-8?B?WTFieGllMmxpajY0b2JtV1l0aVNmRXFGNngwa05KRjFaNXF0QTNQeHBFRWpi?=
 =?utf-8?B?aHF3SHdEa1pncXNmYmhQdFVHVE1hVVgyRUpTNk1SeXl2ekVPZ1hFRWR1eHFH?=
 =?utf-8?B?dDRYMngyMFprREw3V2U4OGZ6SUcxUHczbEMyaHMvTjJQbG0rSWV3dU01NG5L?=
 =?utf-8?B?Y0JjOXNmMExzRjRpNjJvdGt6TkpWWGlvNGcwZ0cvSkFBUCtCMU9heWtpdVlP?=
 =?utf-8?B?S1AvWFovck1oaTB0OW9DSmNJeTMzMnVLNUJXMVJYdmRNRDRXNFhRQmh5eVN3?=
 =?utf-8?B?Q2hiYitxNUZkZzdoNHJ0QWNZcER6V2NwNWpSOGpEMzFxV2xkRUtwQjlkcWt1?=
 =?utf-8?B?bStzenY3a3JsTXA0TzJaV2JPYlprQnhtdEh6S1AzR3lVTkpmZWxYc1hUWUY4?=
 =?utf-8?B?bXRnQWRkSmlmTlM3NGFoVEhUU29rTUtET0xneUI1Zmk0TmlLamNuTnNZTU8y?=
 =?utf-8?B?TFhkQWwzRjhRZDFwb2lqelRFWkl4U0JJV3IxOWpVYUxaMmFha3JVWGdvRkpu?=
 =?utf-8?B?dlBMWWtma2dDS3loVlJMSlduanRsSXRDTXRpY0kyclZQODlyWW5WSTJCZjZH?=
 =?utf-8?B?ZDFicm5PaWcvNkJzaWdTb25ybW5RMzFJeVFZK3RBNXBTQ3FYemhubVRtK1Z2?=
 =?utf-8?B?NW5Tc3JkNnJvRGt6TW1EckNqV1d5d2VjTllVSjFNcURPSjRHa3VCL25RUGl0?=
 =?utf-8?B?dmJnOG91NFR0U3JXRDRGK1BwbWVwa1FGTTJiRWlERnAyaTUxSy9lUkFMLyt2?=
 =?utf-8?B?NDlIU0xUeTRhMkk4ekxRZzdVSWJZZUhQMjlUM1RLWERzVlRWWGM5VFhjZXdq?=
 =?utf-8?B?UjExWmJ4OUdmZjRmV1A5bEFiZm1xeVR3WlNMZmlkbzMxZkJSWmlpSndNOGpV?=
 =?utf-8?B?N0xKQWtLYW56RzdVWW16WUErb1NmemEyN3RmVmd4elpSeGltRmtKdjd2TENm?=
 =?utf-8?B?SG5xMEw3aHRmbW9sSjVKb2tPNFNUU1hCdHlPUlg1Yzg3U2ExMkVGaFpEQ3Z6?=
 =?utf-8?B?S2NYaEFmSmJPdDZocUlQOURzTC9wOFhxY2kxTUw3d3ZlaEdOcGwwby90dFJJ?=
 =?utf-8?B?cGI5a2VwVGJ6SkYrK2pBcmRZeVlxdkFXRTFBc1BvRnhKdVJmMDFPVG1WMUI4?=
 =?utf-8?B?TTcyZmFOcGJhTFhQb1JLWStVOW82dDdKUnAvcW5BaVJJV05VRUw5WTJ3S2xZ?=
 =?utf-8?B?bmdlZ0hwZlUwWnhTQWlsaW5rTmxSN0tIRWVUYWp1a2d2MnQweGlpZEh3SUtq?=
 =?utf-8?B?cmxOK1VPaVRtOUVUa0hSN2EwRjhtQ2l6am5WMGl1djhCYTNrNTNsc0cray9l?=
 =?utf-8?B?R1BWNGpqMnBEZXkwZ0ZuNDFqc2puemNSVkdtclBoQmU1UHlvODczbjlySmln?=
 =?utf-8?B?MEFVREZ2dmZpVTEzL2wwVjdLb2VvUUNFNTQxR1lwOWZJNmZMUE4wZ3RtTGZs?=
 =?utf-8?B?bU5wUnd3N1J5UXhtWEl1cEdKNENCWURqdzJDQktvWU14TDczaGhFdHExYTln?=
 =?utf-8?B?bXJWWVUwMnd5TWZtb21wVTlKMGFZemc1WERVNUl6eityNG5sRllIakw2Rlcz?=
 =?utf-8?B?c2JrclcxN0M2MFcwSUlNU3BPeGV5MDE2YkgzOW9uZ2xBc0s5bHV2dnl2VWh4?=
 =?utf-8?B?VkVGMlRHWWt3V1Y2R3h1a3BReU9aTHIxZTBMYzVTdUZ2cjFsZFQ5empaTmY1?=
 =?utf-8?B?TmQ5eFdMOWVqUVBkYlNJaCtFaVcwNDR6cFJienpWUkh4cEZrcWNkUExXSHB2?=
 =?utf-8?B?SlZvdzF6SlAyU3JVR1NrVXB2RkVrNFQ2T2ZDbEd2WG43M25aT09ZMWdxcFdD?=
 =?utf-8?B?Y0pEYXRwTVJYZnc0U0cvTzR1U3ZSTUNCUXRpNHo2dnhYTUZvYTRyRHBGSW1i?=
 =?utf-8?B?anc9PQ==?=
Content-ID: <C1303383A9834D47BB495D2FFBD0616A@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb1e127b-4c1d-4f44-16e6-08dbbd875162
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2023 05:21:48.6354 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WyWGF09nneXDLDVBixvCjgy+0Dt6ll6QPp8K4l3tlcCs54OIjw2aU2XAj4rMuXc0tB1kuIWBdjErCMnCNk4ACKyM/mZu1r3oGtkxFRfSL90=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR03MB5208
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--12.997400-8.000000
X-TMASE-MatchedRID: VPleTT1nwdSnykMun0J1wmjZ8q/Oc1nAjLOy13Cgb4/n0eNPmPPe5KWz
 WoIRiV9DM/Se/q/gEyf5MiS7M8c1eGmXMi7Ntyo2mlaAItiONP1QCOsAlaxN7zaULO2AzDKgwbD
 ngUleUcLUevTYXV31fjvwttBqz9vyMRXV8lvz/l0c9jA4mLo8uRHlzzcojFNO2oLGTNKlb9eIMV
 4nweffzWGrMb9FxqvtkZOl7WKIImrS77Co4bNJXQtuKBGekqUpI/NGWt0UYPBNoa3iZGVDamYS2
 ZSrmzgWLbpduW+PjQ+NL0PBcqyQSkIb4fU9zdME
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--12.997400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: D55A8F4253E23613A6450A45F2C5F3ACA8192428430CD1792D108D3216DE16EA2000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_009_1521400850.2095195196"
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
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 =?utf-8?B?RWx2aXMgV2FuZyAo546L5YabKQ==?= <Elvis.Wang@mediatek.com>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 =?utf-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?= <Jason-ch.Chen@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 =?utf-8?B?Sm9obnNvbiBXYW5nICjnjovogZbpkasp?= <Johnson.Wang@mediatek.com>,
 =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_009_1521400850.2095195196
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpJiMzMjtLcnp5c3p0b2YsDQoNClRoYW5rcyYjMzI7Zm9yJiMzMjt0aGUmIzMyO3Jl
dmlld3MuDQoNCk9uJiMzMjtTYXQsJiMzMjsyMDIzLTA5LTIzJiMzMjthdCYjMzI7MjA6MDMmIzMy
OyswMjAwLCYjMzI7S3J6eXN6dG9mJiMzMjtLb3psb3dza2kmIzMyO3dyb3RlOg0KJmd0OyYjMzI7
JiMzMjsmIzMyOw0KJmd0OyYjMzI7RXh0ZXJuYWwmIzMyO2VtYWlsJiMzMjs6JiMzMjtQbGVhc2Um
IzMyO2RvJiMzMjtub3QmIzMyO2NsaWNrJiMzMjtsaW5rcyYjMzI7b3ImIzMyO29wZW4mIzMyO2F0
dGFjaG1lbnRzJiMzMjt1bnRpbA0KJmd0OyYjMzI7eW91JiMzMjtoYXZlJiMzMjt2ZXJpZmllZCYj
MzI7dGhlJiMzMjtzZW5kZXImIzMyO29yJiMzMjt0aGUmIzMyO2NvbnRlbnQuDQomZ3Q7JiMzMjsm
IzMyO09uJiMzMjsxOC8wOS8yMDIzJiMzMjsyMToyMSwmIzMyO0phc29uLUpILkxpbiYjMzI7d3Jv
dGU6DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtDTURRJiMzMjtjbGllbnQmIzMyO2NhbiYjMzI7dXNlJiMz
MjthJiMzMjtsb29wJiMzMjtmbGFnJiMzMjtmb3ImIzMyO3RoZSYjMzI7Q01EUSYjMzI7cGFja2V0
JiMzMjt0byYjMzI7bWFrZSYjMzI7Y3VycmVudA0KJmd0OyYjMzI7Jmd0OyYjMzI7Y29tbWFuZCYj
MzI7YnVmZmVyJiMzMjtqdW1wcyYjMzI7dG8mIzMyO3RoZSYjMzI7YmVnaW5uaW5nJiMzMjt3aGVu
JiMzMjtHQ0UmIzMyO2V4ZWN1dGVzJiMzMjt0byYjMzI7dGhlJiMzMjtlbmQNCiZndDsmIzMyOyZn
dDsmIzMyO29mJiMzMjtjb21tYW5kcyYjMzI7YnVmZmVyLg0KJmd0OyYjMzI7Jmd0OyYjMzI7DQom
Z3Q7JiMzMjsmZ3Q7JiMzMjtHQ0UmIzMyO2lycSYjMzI7b2NjdXJzJiMzMjt3aGVuJiMzMjtHQ0Um
IzMyO2V4ZWN1dGVzJiMzMjt0byYjMzI7dGhlJiMzMjtlbmQmIzMyO29mJiMzMjtjb21tYW5kJiMz
MjtpbnN0cnVjdGlvbi4NCiZndDsmIzMyOyZndDsmIzMyO0lmJiMzMjt0aGUmIzMyO0NNRFEmIzMy
O3BhY2tldCYjMzI7aXMmIzMyO2EmIzMyO2xvb3BwaW5nJiMzMjtjb21tYW5kLCYjMzI7R0NFJiMz
MjtpcnEmIzMyO2hhbmRsZXImIzMyO2NhbiYjMzI7bm90DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtkZWxl
dGUmIzMyO3RoZSYjMzI7Q01EUSYjMzI7dGFzayYjMzI7YW5kJiMzMjtkaXNhYmxlJiMzMjt0aGUm
IzMyO0dDRSYjMzI7dGhyZWFkLg0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMz
MjtBZGQmIzMyO2NtZHFfbWJveF9zdG9wJiMzMjt0byYjMzI7c3VwcG9ydCYjMzI7dGhyZWFkJiMz
MjtkaXNhYmxlDQomZ3Q7JiMzMjsNCiZndDsmIzMyO0hvdyYjMzI7b3ImIzMyO3doZXJlJiMzMjtk
byYjMzI7eW91JiMzMjthZGQmIzMyO2l0JiM2MzsmIzMyO0kmIzMyO2RvJiMzMjtub3QmIzMyO3Nl
ZSYjMzI7aXQmIzMyO2luJiMzMjt0aGlzJiMzMjtwYXRjaC4mIzMyO1lvdXINCiZndDsmIzMyO3Bh
dGNoc2V0DQomZ3Q7JiMzMjtsb29rcyYjMzI7cmFuZG9tbHkmIzMyO29yZ2FuaXplZC4NCg0KVGhp
cyYjMzI7d2lsbCYjMzI7YmUmIzMyO3VzZWQmIzMyO2luJiMzMjtjbWRxX3BrdF9maW5pYWxpemVf
bG9vcCgpJiMzMjthdCYjMzI7W1BBVENIJiMzMjs4LzE1XS4NCg0KbXRrLWNtZHEtaGVscGVyLmMm
IzMyO2FuZCYjMzI7bXRrLWNtZHEtbWFpbGJveC5jJiMzMjthcmUmIzMyO25vdCYjMzI7aW4mIzMy
O3RoZQ0Kc2FtZSYjMzI7bWFpbnRhaW5lciYjMzk7cyYjMzI7dHJlZSwmIzMyO3NvJiMzMjtJJiMz
MjtzZXBhcmF0ZSYjMzI7dGhpcyYjMzI7dG8mIzMyO2Fub3RoZXImIzMyO3BhdGNoJiMzMjtmcm9t
JiMzMjtbUEFUQ0gNCjgvMTVdLg0KDQpSZWdhcmRzLA0KSmFzb24tSkguTGluDQoNCiZndDsmIzMy
Ow0KJmd0OyYjMzI7QmVzdCYjMzI7cmVnYXJkcywNCiZndDsmIzMyO0tyenlzenRvZg0KJmd0OyYj
MzI7DQomZ3Q7JiMzMjsNCg0KPC9wcmU+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioq
KioqKioqKioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UgKioqKioqKioqKioqKioq
KioqKioNClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2FnZSAo
aW5jbHVkaW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmll
dGFyeSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVu
ZGVyIGFwcGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5
IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlvbiwg
DQpkaXN0cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlzIGUt
bWFpbCAoaW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lwaWVu
dChzKSBpcyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91
IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxpZXZl
IA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5v
dGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWls
KSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRpbmcg
YW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0
aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3Uh
DQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_009_1521400850.2095195196
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGkgS3J6eXN6dG9mLA0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXdzLg0KDQpPbiBTYXQsIDIwMjMt
MDktMjMgYXQgMjA6MDMgKzAyMDAsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+ICAJIA0K
PiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRh
Y2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250
ZW50Lg0KPiAgT24gMTgvMDkvMjAyMyAyMToyMSwgSmFzb24tSkguTGluIHdyb3RlOg0KPiA+IENN
RFEgY2xpZW50IGNhbiB1c2UgYSBsb29wIGZsYWcgZm9yIHRoZSBDTURRIHBhY2tldCB0byBtYWtl
IGN1cnJlbnQNCj4gPiBjb21tYW5kIGJ1ZmZlciBqdW1wcyB0byB0aGUgYmVnaW5uaW5nIHdoZW4g
R0NFIGV4ZWN1dGVzIHRvIHRoZSBlbmQNCj4gPiBvZiBjb21tYW5kcyBidWZmZXIuDQo+ID4gDQo+
ID4gR0NFIGlycSBvY2N1cnMgd2hlbiBHQ0UgZXhlY3V0ZXMgdG8gdGhlIGVuZCBvZiBjb21tYW5k
IGluc3RydWN0aW9uLg0KPiA+IElmIHRoZSBDTURRIHBhY2tldCBpcyBhIGxvb3BwaW5nIGNvbW1h
bmQsIEdDRSBpcnEgaGFuZGxlciBjYW4gbm90DQo+ID4gZGVsZXRlIHRoZSBDTURRIHRhc2sgYW5k
IGRpc2FibGUgdGhlIEdDRSB0aHJlYWQuDQo+ID4gDQo+ID4gQWRkIGNtZHFfbWJveF9zdG9wIHRv
IHN1cHBvcnQgdGhyZWFkIGRpc2FibGUNCj4gDQo+IEhvdyBvciB3aGVyZSBkbyB5b3UgYWRkIGl0
PyBJIGRvIG5vdCBzZWUgaXQgaW4gdGhpcyBwYXRjaC4gWW91cg0KPiBwYXRjaHNldA0KPiBsb29r
cyByYW5kb21seSBvcmdhbml6ZWQuDQoNClRoaXMgd2lsbCBiZSB1c2VkIGluIGNtZHFfcGt0X2Zp
bmlhbGl6ZV9sb29wKCkgYXQgW1BBVENIIDgvMTVdLg0KDQptdGstY21kcS1oZWxwZXIuYyBhbmQg
bXRrLWNtZHEtbWFpbGJveC5jIGFyZSBub3QgaW4gdGhlDQpzYW1lIG1haW50YWluZXIncyB0cmVl
LCBzbyBJIHNlcGFyYXRlIHRoaXMgdG8gYW5vdGhlciBwYXRjaCBmcm9tIFtQQVRDSA0KOC8xNV0u
DQoNClJlZ2FyZHMsDQpKYXNvbi1KSC5MaW4NCg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5
c3p0b2YNCj4gDQo+IA0K

--__=_Part_Boundary_009_1521400850.2095195196--

