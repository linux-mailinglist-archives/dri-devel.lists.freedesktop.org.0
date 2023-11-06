Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C1F7E19C8
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 06:56:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64B1010E269;
	Mon,  6 Nov 2023 05:56:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CEE610E269
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 05:56:14 +0000 (UTC)
X-UUID: 2db157bc7c6911ee8051498923ad61e6-20231106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=mE+lRvYcfW1hQt1+wxUo+n2orkUt4xakPvAQjh1GUUc=; 
 b=Wg4JoX3K4BX9BAoj5Trn/j1LbOOoIOpfHPOAWSE1i6yzuGsR/UbFJLO5XH0XkwchfOGDyO4GZTfGkDgPKKFfoFXVdzWR4d478Mv87IDiFI8Gy4J/ZnCMpgi0ccKIqmqOxE4MKmdSZiVyn+S5z6k/tYgZSKb8VWqCHaoxLpsvJ5c=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33, REQID:e43c735c-e47a-4624-8aa3-4cf7eeec545a, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:364b77b, CLOUDID:8c3d5072-1bd3-4f48-b671-ada88705968c,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 2db157bc7c6911ee8051498923ad61e6-20231106
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw02.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 167722151; Mon, 06 Nov 2023 13:56:07 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 6 Nov 2023 13:56:06 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Mon, 6 Nov 2023 13:56:06 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kAp/oPZTR58pGGjgjbuywpFYo7m+epV+XhkJ7mR/ng6NIt2BlfDaStPrUT4aIkJfijxVaZCIzD1T2J3gn0Or98bLHkQuMpQOvDOtYnWOX6fStN4BoeOJGum+9qPgEyOendaKHH6nE0Y/WmMGet0IoSWvJ5DO+6c3Ob+/XuV6sRL65etTVSLJ/G5aXhL+xWoV9Ox1uIQE8zhddz/WeeKhIqvtYyM1JZR4i8es2xi0wx75JVXme3gVPoIXBDQaXylGvUSV5mVV0ONKUGOASJEYdS1liBHBLsd1GUXD/iai0n9LDtS8ukBSFIWJMXNqul3wbdtjh1JGoqXubz57yS733g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mE+lRvYcfW1hQt1+wxUo+n2orkUt4xakPvAQjh1GUUc=;
 b=fcoO0JEcM5nlhrxgnu6z+gUZVpGELJokRDfFEdJuckaGiMsgvl4SfnMjmiqfcPvaaJVvD9NQofJ+FLwgVrMXi3J5UDfWgT/lZ/3hMNHQ4Imw+vd72G/jZ3hjI88/THMKQoxBz5JZcmLsHHgimIgQWSQZhYicnT935w9o11DflrHZQEVOHPYRvwk0s0CLYd5G+WrHcNeGi1QkTI1b/bg2ZIipHo27wIFlOI+u0aTwbpCfOfKNpC4ndxk8RN92kWcQ2EMHBIxiUBLnYqxz6z84DbBnw7lQnPgEDex7xaZOLmABlOg3z+l/f3YEXKchWVGXnXp67WDZk9CfrOhlaHbhbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mE+lRvYcfW1hQt1+wxUo+n2orkUt4xakPvAQjh1GUUc=;
 b=CEb7bBOz1cX8AYxIExqwgDE05sKmQSxbpUgH6hnjCazvAOIhAPlyBV022gqEmOVadJhpzs7EEYGOI5t7u2nJKyRTcDF2tDYLa2GnzpVoBOlzjm+dGrNIj1K9fBkJcI4VYEc/3N1M/tOkZYPwz/9/j5GOcmLfxqk5SGQIb+ng7cQ=
Received: from SI2PR03MB5885.apcprd03.prod.outlook.com (2603:1096:4:142::7) by
 SEYPR03MB7815.apcprd03.prod.outlook.com (2603:1096:101:171::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6954.25; Mon, 6 Nov 2023 05:56:03 +0000
Received: from SI2PR03MB5885.apcprd03.prod.outlook.com
 ([fe80::2e66:c8a4:6d9:1e43]) by SI2PR03MB5885.apcprd03.prod.outlook.com
 ([fe80::2e66:c8a4:6d9:1e43%5]) with mapi id 15.20.6954.025; Mon, 6 Nov 2023
 05:56:03 +0000
From: =?utf-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>
To: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "quic_vjitta@quicinc.com" <quic_vjitta@quicinc.com>,
 "quic_jasksing@quicinc.com" <quic_jasksing@quicinc.com>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>
Subject: Re: [PATCH 8/9] dt-bindings: reserved-memory: MediaTek: Add reserved
 memory for SVP
Thread-Topic: [PATCH 8/9] dt-bindings: reserved-memory: MediaTek: Add reserved
 memory for SVP
Thread-Index: AQHZ5FgxjegLVruM7kG7VRoFLocLPrBQxboAgAHnZgCAEpjlgIAH3SGA
Date: Mon, 6 Nov 2023 05:56:03 +0000
Message-ID: <8666e39c6b59322af6a9637121ed22f291830c46.camel@mediatek.com>
References: <20230911023038.30649-1-yong.wu@mediatek.com>
 <20230911023038.30649-9-yong.wu@mediatek.com>
 <d4d471e7-64cf-42bf-a061-82934c904691@quicinc.com>
 <2c3ad77806df3ef23cb69336f2049821529e337b.camel@mediatek.com>
 <a83b00c4-a33a-4687-b024-173c6c5a66a0@quicinc.com>
In-Reply-To: <a83b00c4-a33a-4687-b024-173c6c5a66a0@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB5885:EE_|SEYPR03MB7815:EE_
x-ms-office365-filtering-correlation-id: 7bfd3076-d67d-413b-b2b7-08dbde8d0f8a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NGRK3/5NjewAAO3MAuWzp9Jzkt6x1dI2b75VpMvK/iEEEuW9Hmbj+ITM2FNTGclJsEeh1MXpVnd/jxrErI+dOxUFrhne3fjBS9aHZ8PN24Sma7Z3fql6IeQjkYxBJyuEFATqGkRqZANpFvynMtj1Nj8SjLh62xutnIDndBNr2OFZKENSvZF3Axa+dVZj/+Yr1kb2ugL2pM9DOv9yVoHNoknP9SXJ0erf7YK88d1t5xcew1dLxXZFs6SJvSsLuaPY0aZ2Y5V4ISZyboiCe7sYEjLQw1BnhsimSOKWRe6Hq62OF1584lwLdK7YpQ+1nBpSGjxHKRx4YNRegympKrbLcv7B+aqL9jCQBkQ3/i8GPQ7tElavYNwUTAmYMB+IOMIE8zNTq+FT7SiGL5KLFk03g0DWf/VwqRgDgwSnofURwdhROexO507nry8zqwjWoToZaD10uuRVPaXfEu5eIQ6as7iPUNJm6BABKg7vA8/8Niw0IWfuuQoSkv/5kVbJr1vU0zAnYzFJytIwpxBuunsthXmTsOgW15wysUBsvksDFy3diUSp7u5pQ8tTDdRwaqgFXBNyCMMwO2TP4jBA0km+WfO69dAZUjy8J+/C8G0MAqbY7c+SALRWcj5madFtyeq5JltqtLFn8tK59CLGhTgltEBJqc8+th51Q6rBtu25i/Y0ZLr7TqqSE/Npjb0PNuWOYm/u1gLTXDvvTsf3DQq60I1nmFOjR9t6gf+AURTpkgqzqSPiNIUi9d2X5D1aHaKc
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR03MB5885.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(39860400002)(366004)(396003)(136003)(230173577357003)(230922051799003)(230273577357003)(451199024)(64100799003)(1800799009)(186009)(4001150100001)(7416002)(2906002)(38100700002)(85182001)(54906003)(86362001)(66446008)(966005)(66556008)(66476007)(66946007)(76116006)(316002)(122000001)(36756003)(64756008)(91956017)(6512007)(6486002)(110136005)(26005)(2616005)(53546011)(478600001)(71200400001)(6506007)(83380400001)(5660300002)(41300700001)(38070700009)(8936002)(4326008)(8676002)(99106002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WXE4Sy9sdEE3YUo3NDVkMHQ5Q25iRU8ybUpGTGZ0UnFyTU85Rit6MjZlNGhK?=
 =?utf-8?B?SjNJbFYweElyRWZNeEpsYVJGMjgrWll0ckRPbUhRMjRTZ1pFRWx6bUVlUXZm?=
 =?utf-8?B?UzFGRTg4QkRCVlZqc1V3TEhpZDF4VUhVZjZzaENsK0g5QXZxV1pzQmpiNnlo?=
 =?utf-8?B?bW5TcVpYQkNUd2ZWUk5Xd1RUdFVWWGlRd2pRd3hKempVNFBkc0pRVGN0N21a?=
 =?utf-8?B?Yi96NzFyVzRrWHJOdjNpL1Uwbk0wM2NMMkZpaXhPTGw3UFJsYkVDcU92T2c2?=
 =?utf-8?B?b0FyV3RpTkxqNDlTZExob3k5V29kalFsZW5xRmt5UDZvNE1lK2x6UndrMC9W?=
 =?utf-8?B?WDRtNkw3QnExZWtVRTZXNjlETkpkQ2pERVhJWDNYWFp3T0dJWHR2aktBaEtS?=
 =?utf-8?B?VS9Wd2VNeGNsMmpJWXc4MEhkUUlKUWg4MHN6MUNuTW5jR0dkeDNRaEt1ZUZj?=
 =?utf-8?B?cDhBcURmOHNlWGtLRS9KR3M5L1RTMXNtYjJUZ0JHM0hSZ1pObW5jQ0N2RGQy?=
 =?utf-8?B?YXZaSlFSaU9oYTljWVVWcXdhWm1UdStpTUM3OU94NXJRS3RqcjVpSjBwZDZm?=
 =?utf-8?B?cEVjVGY2dDQ3K1lWVzlGWEdOZ0p0dlRMZkRMbmlTZE1mR3k1ZHB4RjU0QzV1?=
 =?utf-8?B?Wmd5OTNYNytyQVVuL3ZjZlkrTklmclZDY3dCOVl6bnBDOEg0TWVDbmdWYjRk?=
 =?utf-8?B?ZVMweE5DRjY3YWk4R2ZOMmdzOU03eHdUZUJuZE02YmJIckhSQ0tUZnVTZFRJ?=
 =?utf-8?B?aitRa3BCem5PY3V0NDBEUXlnQ1U3UERsM1ZqWkY4S3lBSldZZXY0TDJkRTkv?=
 =?utf-8?B?MDZBVlJjaXY1R2dKdmJDaWhYUUV3ZjlNaFc5YnAzK1RPa3h3TENvaTNrdFVo?=
 =?utf-8?B?NXhhRDFNZXdKK05sczF0VWk0b0lkcFlvZEN4QjliUThxanN4MTF0ODBBRFl0?=
 =?utf-8?B?U0g3Ly9xT1RVaFdmdFFUN2lsQVBHQkdOV3BKR09pbld1eXVFWFVYRnBBcll0?=
 =?utf-8?B?S1Z5bGRqbnAzNnhCd3VFd2pTY3pZMG9xSjBaVENIRFZDYmxoRU5pYm9tZ1lL?=
 =?utf-8?B?TWpBcnRFTEVGS0F3YnYvaFJPQzV1RGF3ZkM0Ky9yWVFDTW4rNW0za2VGMkVr?=
 =?utf-8?B?dWZzWVhHaDY3Y0djLzFSU2Q2bDVqSU5JdUl2dERuSUVYTU9BUGRHUzBLMzlP?=
 =?utf-8?B?QUFsbTQzYXg2VUE1dzBlZnJVMjBTT09nNjdjbVRUcVZ4eDdJZzl1TEozcE9U?=
 =?utf-8?B?SjFRWEpRbDExOGo5azVSSm9iUWg5SWdaQWYydlI5KzJpOW94RnJnOGh2Yzd0?=
 =?utf-8?B?a0xGcElyY2swYXZJUHE3Skl1MXFIWUR0SCtGdHBxaU9WY1J4czRVOC92TnAy?=
 =?utf-8?B?QklKWHRUUFNzWGRTZTl4ZS90VjN1NVpTblIrQVhPa2tXVWRNbERjN0E4VGxS?=
 =?utf-8?B?OFdlWUFVNnJiYkdvWmlGR3Y4Z0E5ZVkrMHFjeXJVSnBubUZObm93cVBzWllq?=
 =?utf-8?B?bmc2T0s1enZOcmdRK1dqSDNaMTNkdXhxZEdmeGtTK1gza2NORVF2Q2twb1dY?=
 =?utf-8?B?QVN4ZGVZNXc1OXI3NlBlNEg1Q0FhenQrQWtia0x1NW1QNXpKTDhFUHVqNWdS?=
 =?utf-8?B?cUw3MHllcnRhcDV0ck81ajJRUmhVNnN4ZWNKd1NJRUFjNVoxUGk5d2h2V0pF?=
 =?utf-8?B?UVhOOW1OSnJiUStFUEN6VTg1andocFVVSUVNWU5rTnRXUTRtYmFKYmoyeXRB?=
 =?utf-8?B?dUtoM3lWVCtTZ2s2UkMzbHRYUWMrelhvZjJkVVpMdzduSGJtT2psWDBuakxi?=
 =?utf-8?B?NnhvdlA1NVVNUUcrc2pqYnBqdVFQNG5yY0NDeFQzSEtxeGdJRmhud2Z1YjdK?=
 =?utf-8?B?UXBrVkgvVmtWb0MySkR6bDZEMFBHZmlEMjBQQkI4OW15ajIrN21HMzVNZ2w5?=
 =?utf-8?B?QU5Yai93MG1aSmFRQzArWHViWnd2eUUvZXpLY3kvYU03N2ZxTjE0OWFTRTkr?=
 =?utf-8?B?bWlHSEI0QWh3M3BuZ24yOHZuS0FaTytZdVlIQ3U4ZmlLQTBVS3lnQ3RCQUNI?=
 =?utf-8?B?WjdFWGF3MjVncDF6SkV3MGxWSmU2bmdSYUoxMkRQdkluZjErbEd3SHA1YXpP?=
 =?utf-8?Q?QU7lzyixUIxvCyOrtK/jTgZDU?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C6599153295A034C8EB4F0D1F0BF4048@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB5885.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bfd3076-d67d-413b-b2b7-08dbde8d0f8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2023 05:56:03.5430 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w0HAQX4Sd/PJ7Vc3uYeGg7lGMWGYFBh9z1JuqRX0XZotWPGJbaAntqqDskKqhMPg2F62MrN5D5SE/vTqoxc0KQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7815
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--26.616600-8.000000
X-TMASE-MatchedRID: yxAmdCLMIs3UL3YCMmnG4ia1MaKuob8PCJpCCsn6HCHBnyal/eRn3gzR
 CsGHURLuwpcJm2NYlPAF6GY0Fb6yCifZYRtbOr2tttAWxuM5sl74qCLIu0mtIGHZ+cd7VyKX78m
 ng1Xqld9TvHeBiMKYYxSbVdUWUqf5YeOFZSwS7nTmAId+2bAQwlAI6wCVrE3vWltirZ/iPP7GEu
 3/atNxSYO6yQgGYLGn9LOItqNiof9cqim4vwMm8Bes/RxhysDbAlw1lJDBMtaav7eQVL9oQ0wVU
 EAID5kTfIVut8szzbj++GoROERRv66UR+fsf9oDIQrubkFPQdnZHwCsL68/MWjliw+xvItdK27U
 O0gQTeqT067b6oi4rJ/ujNnNM8HU/ZG8oSoOiZQpa6LJktEjgMBZPOJYZoM8EQQHCSpHtkqjxYy
 RBa/qJRVHsNBZf9aRAYt5KiTiutkLbigRnpKlKSBuGJWwgxArFnn7zLfna4I=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--26.616600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: DED780E05D58FB38ACD5D8EB8392EC1023462A61FA55832B3649BAC418483CC62000:8
X-MTK: N
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
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 =?utf-8?B?S3VvaG9uZyBXYW5nICjnjovlnIvptLsp?= <kuohong.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "tjmercier@google.com" <tjmercier@google.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "jstultz@google.com" <jstultz@google.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 =?utf-8?B?SmlhbmppYW8gWmVuZyAo5pu+5YGl5aejKQ==?= <Jianjiao.Zeng@mediatek.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIzLTExLTAxIGF0IDExOjIwICswNTMwLCBKYXNrYXJhbiBTaW5naCB3cm90ZToN
Cj4gIAkgDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBv
cGVuIGF0dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3Ig
dGhlIGNvbnRlbnQuDQo+ICBPbiAxMC8yMC8yMDIzIDM6MjAgUE0sIFlvbmcgV3UgKOWQtOWLhykg
d3JvdGU6DQo+ID4gT24gVGh1LCAyMDIzLTEwLTE5IGF0IDEwOjE2ICswNTMwLCBWaWpheWFuYW5k
IEppdHRhIHdyb3RlOg0KPiA+PiAgIA0KPiA+PiBJbnN0ZWFkIG9mIGhhdmluZyBhIHZlbmRvciBz
cGVjaWZpYyBiaW5kaW5nIGZvciBjbWEgYXJlYSwgSG93DQo+IGFib3V0DQo+ID4+IHJldHJpZXZp
bmcNCj4gPj4NCj4gPiANCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8xNTk0OTQ4MjA4
LTQ3MzktMS1naXQtc2VuZC1lbWFpbC1oYXlhc2hpLmt1bmloaWtvQHNvY2lvbmV4dC5jb20vDQo+
ID4+ICA/DQo+ID4+IGRtYV9oZWFwX2FkZF9jbWEgY2FuIGp1c3QgYXNzb2NpYXRlIGNtYSByZWdp
b24gYW5kIGNyZWF0ZSBhIGhlYXAuDQo+IFNvLA0KPiA+PiB3ZSBjYW4gcmV1c2UgY21hIGhlYXAN
Cj4gPj4gY29kZSBmb3IgYWxsb2NhdGlvbiBpbnN0ZWFkIG9mIHJlcGxpY2F0aW5nIHRoYXQgY29k
ZSBoZXJlLg0KPiA+Pg0KPiA+IA0KPiA+IFRoYW5rcyBmb3IgdGhlIHJlZmVyZW5jZS4gSSBndWVz
cyB3ZSBjYW4ndCB1c2UgaXQuIFRoZXJlIGFyZSB0d28NCj4gPiByZWFzb25zOg0KPiA+ICAgDQo+
ID4gYSkgVGhlIHNlY3VyZSBoZWFwIGRyaXZlciBpcyBhIHB1cmUgc29mdHdhcmUgZHJpdmVyIGFu
ZCB3ZSBoYXZlIG5vDQo+ID4gZGV2aWNlIGZvciBpdCwgdGhlcmVmb3JlIHdlIGNhbm5vdCBjYWxs
IGRtYV9oZWFwX2FkZF9jbWEuDQo+ID4gICANCj4gDQo+IEhpIFlvbmcsDQo+IA0KPiBXZSdyZSBj
b25zaWRlcmluZyB1c2luZyBzdHJ1Y3QgY21hIGFzIHRoZSBmdW5jdGlvbiBhcmd1bWVudCB0bw0K
PiBkbWFfaGVhcF9hZGRfY21hKCkgcmF0aGVyIHRoYW4gc3RydWN0IGRldmljZS4gV291bGQgdGhp
cyBoZWxwDQo+IHJlc29sdmUgdGhlIHByb2JsZW0gb2YgdXNhZ2Ugd2l0aCBkbWFfaGVhcF9hZGRf
Y21hKCk/DQoNClllcy4gSWYgd2UgdXNlICJzdHJ1Y3QgY21hIiwgSSBndWVzcyBpdCB3b3Jrcy4N
Cg0KPiANCj4gPiBiKSBUaGUgQ01BIGFyZWEgaGVyZSBpcyBkeW5hbWljIGZvciBTVlAuIE5vcm1h
bGx5IHRoaXMgQ01BIGNhbiBiZQ0KPiB1c2VkDQo+ID4gaW4gdGhlIGtlcm5lbC4gSW4gdGhlIFNW
UCBjYXNlIHdlIHVzZSBjbWFfYWxsb2MgdG8gZ2V0IGl0IGFuZCBwYXNzDQo+IHRoZQ0KPiA+IGVu
dGlyZSBDTUEgcGh5c2ljYWwgc3RhcnQgYWRkcmVzcyBhbmQgc2l6ZSBpbnRvIFRFRSB0byBwcm90
ZWN0IHRoZQ0KPiBDTUENCj4gPiByZWdpb24uIFRoZSBvcmlnaW5hbCBDTUEgaGVhcCBjYW5ub3Qg
aGVscCB3aXRoIHRoZSBURUUgcGFydC4NCj4gPg0KPiANCj4gUmVmZXJyaW5nIHRoZSBjb252ZXJz
YXRpb24gYXQNCj4gDQpodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzdhMjk5NWRlMjNjMjRl
ZjIyYzA3MWM2OTc2YzAyYjk3ZTliNTAxMjYuY2FtZWxAbWVkaWF0ZWsuY29tLw0KPiA7DQo+IA0K
PiBzaW5jZSB3ZSdyZSBjb25zaWRlcmluZyBhYnN0cmFjdGluZyBzZWN1cmUgbWVtIG9wcywgd291
bGQgaXQgbWFrZQ0KPiBzZW5zZQ0KPiB0byB1c2UgdGhlIGRlZmF1bHQgQ01BIGhlYXAgb3BzIChj
bWFfaGVhcF9vcHMpLCBhbGxvY2F0ZSBidWZmZXJzIGZyb20NCj4gaXQNCj4gYW5kIHNlY3VyZSBl
YWNoIGFsbG9jYXRlZCBidWZmZXI/DQoNClRoZW4gaXQgbG9va3MgeW91IGFsc28gbmVlZCB0ZWUg
b3BlcmF0aW9uIGxpa2UgdGVlX2NsaWVudF9vcGVuX3Nlc3Npb24NCmFuZCB0ZWVfY2xpZW50X2lu
dm9rZV9mdW5jLCByaWdodD8NCg0KSXQgc2VlbXMgd2UgYWxzbyBuZWVkIGNoYW5nZSBhIGJpdCBm
b3IgImNtYV9oZWFwX2FsbG9jYXRlIiB0byBhbGxvdyBjbWENCnN1cHBvcnQgb3BlcmF0aW9ucyBm
cm9tIHNlY3VyZSBoZWFwLg0KDQpJIHdpbGwgc2VuZCBhIHYyIHRvIG1vdmUgdGhlIGRpc2N1c3Np
b24gZm9yd2FyZC4gVGhlIHYyIGlzIGJhc2VkIG9uIG91cg0KY2FzZSwgSXQgd29uJ3QgaW5jbHVk
ZSB0aGUgY21hIHBhcnQuDQoNCj4gDQo+IFRoYW5rcywNCj4gSmFza2FyYW4uDQo+IA0KPiA+IFRo
YW5rcy4NCj4gPiANCj4gPj4gVGhhbmtzLA0KPiA+PiBWaWpheQ0KPiA+Pg0KPiA+Pg0KPiA+Pg0K
PiANCg==
