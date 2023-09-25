Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBFE7AD422
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 11:04:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11CC610E1E6;
	Mon, 25 Sep 2023 09:04:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D085310E1E6
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 09:04:34 +0000 (UTC)
X-UUID: 86eff8545b8211eea33bb35ae8d461a2-20230925
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=egAK8T2WYQgZXzVz4pPlXTngX+N654r/Ox8eDLWxbRk=; 
 b=MK4eomuU9op3nr6saADsUOaFqt0B1VAbm2GCFLH3eEXT5BBej/x1KtN16LqmxaQIqAIFZtXBRs55CrZEe7tFeTGcrjl++GUwz6C6VLD7G6yrBxKjmsj4LRjed8YaoMwXTQaqSmuR9VVoqPrbf4c2eBOh8TMmcD90oLdPXk6zutQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:09a6256b-cf33-44c4-b273-2a9d6158175c, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5f78ec9, CLOUDID:f7f65714-4929-4845-9571-38c601e9c3c9,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 86eff8545b8211eea33bb35ae8d461a2-20230925
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 997264144; Mon, 25 Sep 2023 17:04:26 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 25 Sep 2023 17:04:25 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Mon, 25 Sep 2023 17:04:24 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ql4O3jO3vDu7FoaX0aVxMqxAeq3awt+xFEFBbXcfBKKogw6jR1iXDJOAiVLcPF7gs3gAKkYrjt/WM+KIqmYq7KLKP09StZPOnDTb2khgyIpvD5n17cm6FaS9qF50f1xYr0IRSb9BBd8GuSWVcpY8+qZHKIkQnzV+Og2o9Km03QQd5cToYF0HXwkX27/XCY4/5ehM4Qk2umuElITrW2ESYJLKF+yw9CwSDvHz6a23aR59V1kND9pysNKWMcp9tWq0fayyO110DZunNv0YQftMHJRx0jYL6lFS+aNV9d8ZPTaJWH17kltdvMYT3jPcsEIGGYVDY4XjMyY/HdfJedBnYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uBd5hvmAWySQfROns7kaag0vPqMkw0rl9RloBHHrOxY=;
 b=PXQ8UPW+lfX7JsnALf1zewVKqlAf3wYOEPszul1X0I580GL+QYuw0OdoSqK5RnhTyiDfR+DHB9WUrvrREq6Bo0N2EU6tFp32DPp9a2ETTDjpFkkB5MM2/eTnKmQ8R3WEgzMmztCxOx4LBRIN6c+IQ9ZwI3WJKrqq8BRrOTRPYxUMqWMgn24xKbD9E5pZFlF1SA2mBRbA4bBxLftuDFhoNVwY79FwiNGfZlq7CzEfvscYA2B0UdcJ+DtToMDrsD8Pza0KAWvfAL/3cAXWk+lrqZj0F7GozPs1wH4GHiqrS/GUt8UwvXjAUMdJXFr6IScjY4evT5MXjttW/BRkP4cvCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uBd5hvmAWySQfROns7kaag0vPqMkw0rl9RloBHHrOxY=;
 b=tF5NOOC7zJIZnNyFTJw5sGwuuA5/cyIu5sHesFMkOeB/NCODVylusL/oOo3yveqr/zsr3Q/gg3dRcgu7GaJNEKo7vFtxn2oi70WoTUHZMHSUqGAoOGNoPjKjiPyFHgm5VRmvr/g0uayhB7ld/OYsUorQBVYtHgIYY6HyWgkUZks=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by PUZPR03MB6966.apcprd03.prod.outlook.com (2603:1096:301:f9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 25 Sep
 2023 09:02:21 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1b82:a45d:e171:62e8]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1b82:a45d:e171:62e8%4]) with mapi id 15.20.6813.027; Mon, 25 Sep 2023
 09:02:20 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
 <krzysztof.kozlowski+dt@linaro.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 13/15] mailbox: mediatek: Add mt8188 support for CMDQ
 secure driver
Thread-Topic: [PATCH 13/15] mailbox: mediatek: Add mt8188 support for CMDQ
 secure driver
Thread-Index: AQHZ6mWCmZUY4MLR0kyy2m5qdCRfibAovXaAgAJZKICAAAw6AIAAJlaA
Date: Mon, 25 Sep 2023 09:02:20 +0000
Message-ID: <729f15b6f5524d7c745621ef8bfe86809885b0a8.camel@mediatek.com>
References: <20230918192204.32263-1-jason-jh.lin@mediatek.com>
 <20230918192204.32263-14-jason-jh.lin@mediatek.com>
 <87ae80c0-a09b-3642-e3e9-c753cd330bca@linaro.org>
 <6f1bdf10c87aab40e965bb667eb8036c3e524646.camel@mediatek.com>
 <4654ae4e-a64b-41e3-9f65-a08fc4014d71@linaro.org>
In-Reply-To: <4654ae4e-a64b-41e3-9f65-a08fc4014d71@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|PUZPR03MB6966:EE_
x-ms-office365-filtering-correlation-id: dff21d46-f677-4cd6-50ec-08dbbda62053
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LJc1K/suvBp95or+7xzNWeF1JjcVOx7CY4jIohi0dwJzz2zOtmEh6qGPiCeTYDB44D2myODczfaYgRiZ7IjTwAXbKDD0oXX8KSXs2oV2Z/OetAJf+uDeBfbRPcK3q05d0tib4o33R0Ve5gYKxZScDSeFpA1gH0fnl8drEasBZVaRbHLF5KaGI/+ejIA3XFWCldLj3BuZi4lnDU3oQipN+vj4nPcUBri3ydZmY9A92pvcjIrxdDKW+O1r98s1BdrOpac/vqAmlOwuvmOSGsdMlo8qRoH9oWaU76baoeg5oG7AYJ5oW9W54jqlbbsqQhw+mb0S72Yd8pIzmy2ZQX291NCZfJ1yVnO6Us3agZ9eUPdpAM1GVVbDcyDmHpoABL+dBqzQojOw4oPvy5ELcrDmi/p2YYhNPymw+BojiXV/B/q7cqJ/JlsCP9ngX9ElWBOohBsTt4AZnSOBL9RcDqqYQgE7Sf1Bori5S9yhIueDwo+Z7kL7GuwQ+5SPvIPtNeaV4gc8Rq1nDgey3nhovYE1I2wH5AmczCujVQk/RlFr6GtMAOij30+qw0/E5aNJYhk6ucMZpFqVpXoV6pn6igCi5JXeLCFLsk0EDmZbw7l8FwNYY/cp10oWAV8ycJbvzLoNv7F5sLT0vyckfDYJCAFEyTmFPNn8nH35GtkevZmjYHg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(346002)(396003)(39860400002)(366004)(230922051799003)(186009)(1800799009)(451199024)(6506007)(53546011)(6486002)(6512007)(107886003)(26005)(71200400001)(2616005)(76116006)(66946007)(66556008)(66476007)(66446008)(64756008)(86362001)(110136005)(91956017)(478600001)(122000001)(38070700005)(38100700002)(83380400001)(54906003)(2906002)(7416002)(8936002)(8676002)(4326008)(85182001)(36756003)(15650500001)(5660300002)(316002)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MHpNc0tldTZpdVdPR1I0d0lIVUFtN0NYOSs2QjJtbFhXYm9uVTNpOVozRHgv?=
 =?utf-8?B?em9tVEhYdU1nWk55NXYvMSt3eHkvUW8wd1praHQxRDdvamF1ejZnQUJzZ0RI?=
 =?utf-8?B?dUN4ZkRVZmVaazYyTXJIdjNPSE0xMkdrUkFTc2RDTG14M09YeTJBUjNrOGd0?=
 =?utf-8?B?SGplOHozalZSZEJacHNDMzAyUWg2REU4Sm9MNUMweG1nQnJUMGo3MVBlN3lj?=
 =?utf-8?B?OURCVURpT0M3ajB4YlVUU0EwNnEvaTd6NFRMRXNVRzk3YXhQcWVJNEx1dTZK?=
 =?utf-8?B?SG5qa3dtWjRQbDhDSmJFQk9ud3A4RG1lZzBJTnZPU3FpZXBrNXA5b2FrUWpT?=
 =?utf-8?B?NEN4d0c3VFFKUUphSkh3WlVobzJlaTVKQmFHeG8wOWRleUZBdlk2VVdmL3F4?=
 =?utf-8?B?MU0zVnhYbXNNWlloc3N6M2VqZFFGVlBTTlpkK1kya09aVTlUT256TzgraWgx?=
 =?utf-8?B?dWFtcUN5VGgvaTdHdTRvUnVnNUhwc09scjdyU0YyMGQrRCtoSnZ1MnVKVmVu?=
 =?utf-8?B?L0hSdEszUlo1WERwUlA2NGJuQzRKcHNqaDhkcGpwdnhBZzA3WGFBQW1Zd0J5?=
 =?utf-8?B?bE53d3NKUUU1cWd3V2V0YWFsa3hJUElxMG9vUmR3RWUzSjE3ZWtFc2QyY2cv?=
 =?utf-8?B?UzJQREtudnBmcWFYUnVoRzRYTEhKQnRMNC9zRHJMdkNuSlVpcTdzT1g3c1Iw?=
 =?utf-8?B?RUl4eWh0UEVLcENGaHQxU2E0Yk9JSDhCZzFmQlNRdVNvVHFHWkZ1YnRLa1Jx?=
 =?utf-8?B?VHd2c0ptOWp1ZUwrWXJZWGx5dWlJTHlQZEZwM0NBRFJQQzg5MTVodzd3bUJq?=
 =?utf-8?B?R1RKVFhMK2NORU9pQzAzdXl2amhEL25lRUFoYUM0WVM3OWNhNk9qd29TSHdX?=
 =?utf-8?B?aW9vc28rVkwxdmlnc3hwS2s0V3ZlU1VabUJZdjh5ZVdPSFZ6MkMzc1h5SER1?=
 =?utf-8?B?Q3JQdkd1bTY5V1BvMmY1NENIUFAzSy9tK1ZoRnpRdmUxQ1BycytLVEVBZ1lK?=
 =?utf-8?B?RjF5dXhoZ040QlBzUmxyQ1RnM1lkK25FcWZzNU5rMURPdXR1bDFCYnc4ZTZ1?=
 =?utf-8?B?MS9UQUg3aHVJYkJscVVTbXZKWlFvdDJqRnRNSzhCOXJiblppOTRGYXRMQWU3?=
 =?utf-8?B?U3RWOFErTGlKS0s3UERmdjVSSXRYZjUyVXY1ZVV4eGZ1djhYNmV4RUovMC9m?=
 =?utf-8?B?M1BDYUNxNjVKcEFkODN2bjRJeTA1R296ckljOEYxeS95Y1dlRWZpMkdabW15?=
 =?utf-8?B?ZlowWEhkcG5TNG1LQXJnUkRuTll4V0JNMHdraXMyRUZpZ0VBNW1HVDU3bzZC?=
 =?utf-8?B?Z0VDb2tJQ0JLRW1mMDVEZjFZS1JGODFoaTRaK3loZ2MvWGE3MXZ5alFZenp4?=
 =?utf-8?B?TDVtdm1TZ0kzaUJuaGMxZSt6YzB1MWF1WVErRGkzTFhrM3YrQlloWFdyT3pU?=
 =?utf-8?B?cS9UK0RnUFpzMXBYMnB6OTlZQy9QRmttdnVkOGlQK3o2ejJjSUFwdlJNZmNN?=
 =?utf-8?B?c0ZVejNDOHdTWlRvR3BnQmVyZERpOFZYT1M2NCs1OUsxNjNwMlQrSVRhN2o0?=
 =?utf-8?B?T3owUFlmYmxDUHhXUTVIU1NpQUJjUG9CbWVLbUd4ZS8vM1p4T05VeWVESTF1?=
 =?utf-8?B?dGpnZFp4U240TTh2aVNYWXF3MW5VemFSMElJZk5LZzVHenI3azNLeUxYenVx?=
 =?utf-8?B?UXNLTys5M1dkN2lHOFhlVkp6bmE1cU5zQUV0TTZ2QSt3N0ZLc3NCVzlEZ29R?=
 =?utf-8?B?VUhxMXlyS2dQTDhTekZ3L3d6T2dpUWhJL0Vrb21zbGpROUpTQmVySWRpSCtO?=
 =?utf-8?B?UHFLUytLbFhoa3lLbkdtbGtLMzdzeVJtWTBwTi9WTDhVTHV6SjZFaXU4OERG?=
 =?utf-8?B?aUVPeTVoZ1NhSXlXZkE0Y0N4OElHelY1NWlmL0dYcHlXcEpkc3JtK0F5S2U1?=
 =?utf-8?B?K2prWldqSW9NUlVNc3crY1hqVkdQZ1EySFBjNGRyaEZiY01wZjFCV1hBQlFF?=
 =?utf-8?B?d2FpV2NPajdmTEprUDVIUFlYblhPczJrSkdGSHdtZUZtSlVQMnJ6YlZySFl5?=
 =?utf-8?B?S2hkVVpCQW5kdVNaUi9jNjFBdkx3eVRyQXlCWEVWZU9NUUZnRTd0bGFTVG1i?=
 =?utf-8?B?VmVRTzdMenpZRHJGNTE5eXZCNzBwdzRybnpIcHNXSEVXZEhhWVlMZTVFc3lH?=
 =?utf-8?B?SXc9PQ==?=
Content-ID: <8740DCFE624DA94585FB5A403F2FCA29@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dff21d46-f677-4cd6-50ec-08dbbda62053
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2023 09:02:20.7263 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 436yji7nq58VGIoBdvgB26B8cQ+lm2bR7sYl/vP2yzm/q7SYPzU7R7b2/9Gd72lJ1RoT+7dG3+SRo+NIsvJT2fsrCx4YHe0vF1hqJgqEEJ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR03MB6966
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--29.413200-8.000000
X-TMASE-MatchedRID: oTBA/+sdKab4OiVTWoD8RCa1MaKuob8PCJpCCsn6HCHBnyal/eRn3gzR
 CsGHURLuwpcJm2NYlPAF6GY0Fb6yCifZYRtbOr2tXP5rFAucBUGpD1R7N5OROA0DO5d/3xdT+Vi
 hXqn9xLHLpW7TgnF9EnkyRNc7LNVpr4Tjl93LJlczw5Ejs3g1liEdaywSZvzOUEmP2ehkT1oOev
 AL5im/avlsD3dDSedzzjJtj7KpmZOnykMun0J1wp4CIKY/Hg3AwWulRtvvYxTUHQeTVDUrItRnE
 QCUU+jzjoczmuoPCq2UTGVAhB5EbQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--29.413200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: B52BF9DB5E1953D624C2BA5053AD0C9F63AD7C24C747F5E7D99D98FA1A81BB0D2000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_003_1808123275.626255093"
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

--__=_Part_Boundary_003_1808123275.626255093
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCk9uJiMzMjtNb24sJiMzMjsyMDIzLTA5LTI1JiMzMjthdCYjMzI7MDg6NDUmIzMyOysw
MjAwLCYjMzI7S3J6eXN6dG9mJiMzMjtLb3psb3dza2kmIzMyO3dyb3RlOg0KJmd0OyYjMzI7JiMz
MjsmIzMyOw0KJmd0OyYjMzI7RXh0ZXJuYWwmIzMyO2VtYWlsJiMzMjs6JiMzMjtQbGVhc2UmIzMy
O2RvJiMzMjtub3QmIzMyO2NsaWNrJiMzMjtsaW5rcyYjMzI7b3ImIzMyO29wZW4mIzMyO2F0dGFj
aG1lbnRzJiMzMjt1bnRpbA0KJmd0OyYjMzI7eW91JiMzMjtoYXZlJiMzMjt2ZXJpZmllZCYjMzI7
dGhlJiMzMjtzZW5kZXImIzMyO29yJiMzMjt0aGUmIzMyO2NvbnRlbnQuDQomZ3Q7JiMzMjsmIzMy
O09uJiMzMjsyNS8wOS8yMDIzJiMzMjswODowMSwmIzMyO0phc29uLUpIJiMzMjtMaW4mIzMyOygm
IzI2NTE5OyYjMzA1OTE7JiMzMTA3NzspJiMzMjt3cm90ZToNCiZndDsmIzMyOyZndDsmIzMyO0hp
JiMzMjtLcnp5c3p0b2YsDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyO09u
JiMzMjtTYXQsJiMzMjsyMDIzLTA5LTIzJiMzMjthdCYjMzI7MjA6MDkmIzMyOyswMjAwLCYjMzI7
S3J6eXN6dG9mJiMzMjtLb3psb3dza2kmIzMyO3dyb3RlOg0KJmd0OyYjMzI7Jmd0OyZndDsmIzMy
OyYjMzI7JiMzMjsNCiZndDsmIzMyOyZndDsmZ3Q7JiMzMjtFeHRlcm5hbCYjMzI7ZW1haWwmIzMy
OzomIzMyO1BsZWFzZSYjMzI7ZG8mIzMyO25vdCYjMzI7Y2xpY2smIzMyO2xpbmtzJiMzMjtvciYj
MzI7b3BlbiYjMzI7YXR0YWNobWVudHMNCiZndDsmIzMyO3VudGlsDQomZ3Q7JiMzMjsmZ3Q7Jmd0
OyYjMzI7eW91JiMzMjtoYXZlJiMzMjt2ZXJpZmllZCYjMzI7dGhlJiMzMjtzZW5kZXImIzMyO29y
JiMzMjt0aGUmIzMyO2NvbnRlbnQuDQomZ3Q7JiMzMjsmZ3Q7Jmd0OyYjMzI7JiMzMjtPbiYjMzI7
MTgvMDkvMjAyMyYjMzI7MjE6MjIsJiMzMjtKYXNvbi1KSC5MaW4mIzMyO3dyb3RlOg0KJmd0OyYj
MzI7Jmd0OyZndDsmZ3Q7JiMzMjtBZGQmIzMyO210ODE4OCYjMzI7c3VwcG9ydCYjMzI7Zm9yJiMz
MjtDTURRJiMzMjtzZWN1cmUmIzMyO2RyaXZlci4NCiZndDsmIzMyOyZndDsmZ3Q7Jmd0Ow0KJmd0
OyYjMzI7Jmd0OyZndDsmZ3Q7JiMzMjtTaWduZWQtb2ZmLWJ5OiYjMzI7SmFzb24tSkguTGluJiMz
MjsmbHQ7amFzb24tamgubGluQG1lZGlhdGVrLmNvbSZndDsNCiZndDsmIzMyOyZndDsmZ3Q7Jmd0
OyYjMzI7LS0tDQomZ3Q7JiMzMjsmZ3Q7Jmd0OyZndDsmIzMyOyYjMzI7ZHJpdmVycy9tYWlsYm94
L210ay1jbWRxLW1haWxib3guYyYjMzI7fCYjMzI7MSYjMzI7Kw0KJmd0OyYjMzI7Jmd0OyZndDsm
Z3Q7JiMzMjsmIzMyOzEmIzMyO2ZpbGUmIzMyO2NoYW5nZWQsJiMzMjsxJiMzMjtpbnNlcnRpb24o
KykNCiZndDsmIzMyOyZndDsmZ3Q7Jmd0Ow0KJmd0OyYjMzI7Jmd0OyZndDsmZ3Q7JiMzMjtkaWZm
JiMzMjstLWdpdCYjMzI7YS9kcml2ZXJzL21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5jDQomZ3Q7
JiMzMjsmZ3Q7Jmd0OyYjMzI7Yi9kcml2ZXJzL21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5jDQom
Z3Q7JiMzMjsmZ3Q7Jmd0OyZndDsmIzMyO2luZGV4JiMzMjszOTQwYjlmOGU3NzQuLjRlMDQ3ZGM5
MTZiOSYjMzI7MTAwNjQ0DQomZ3Q7JiMzMjsmZ3Q7Jmd0OyZndDsmIzMyOy0tLSYjMzI7YS9kcml2
ZXJzL21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5jDQomZ3Q7JiMzMjsmZ3Q7Jmd0OyZndDsmIzMy
OysrKyYjMzI7Yi9kcml2ZXJzL21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5jDQomZ3Q7JiMzMjsm
Z3Q7Jmd0OyZndDsmIzMyO0BAJiMzMjstNzUwLDYmIzMyOys3NTAsNyYjMzI7QEAmIzMyO3N0YXRp
YyYjMzI7Y29uc3QmIzMyO3N0cnVjdCYjMzI7Z2NlX3BsYXQmIzMyO2djZV9wbGF0X3Y4JiMzMjs9
JiMzMjt7DQomZ3Q7JiMzMjsmZ3Q7Jmd0OyZndDsmIzMyOyYjMzI7LnRocmVhZF9uciYjMzI7PSYj
MzI7MzIsDQomZ3Q7JiMzMjsmZ3Q7Jmd0OyZndDsmIzMyOyYjMzI7LnNoaWZ0JiMzMjs9JiMzMjsz
LA0KJmd0OyYjMzI7Jmd0OyZndDsmZ3Q7JiMzMjsmIzMyOy5jb250cm9sX2J5X3N3JiMzMjs9JiMz
Mjt0cnVlLA0KJmd0OyYjMzI7Jmd0OyZndDsmZ3Q7JiMzMjsrLmhhc19zZWMmIzMyOz0mIzMyO3Ry
dWUsDQomZ3Q7JiMzMjsmZ3Q7Jmd0Ow0KJmd0OyYjMzI7Jmd0OyZndDsmIzMyO05vLCYjMzI7eW91
JiMzMjtqdXN0JiMzMjthZGRlZCYjMzI7aXQmIzMyO3BhdGNoJiMzMjthZ28uJiMzMjtEbyYjMzI7
bm90JiMzMjthZGQmIzMyO2Jyb2tlbiYjMzI7Y29kZSYjMzI7YW5kJiMzMjtmaXgNCiZndDsmIzMy
O2l0Lg0KJmd0OyYjMzI7Jmd0OyZndDsmIzMyO0FyZQ0KJmd0OyYjMzI7Jmd0OyZndDsmIzMyO3Ro
ZXJlJiMzMjtzb21lJiMzMjtLUElzJiMzMjtpbiYjMzI7TWVkaWF0ZWsmIzMyO3RvJiMzMjtoYXZl
JiMzMjtwYXRjaCYjMzI7Y291bnQmIzYzOw0KJmd0OyYjMzI7Jmd0OyZndDsNCiZndDsmIzMyOyZn
dDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7VGhpcyYjMzI7cGF0Y2gmIzMyO2lzJiMzMjtkaWZm
ZXJlbnQmIzMyO2Zyb20mIzMyO1tQQVRDSCYjMzI7MTQvMTVdJiMzMjthdCYjMzI7dGhlJiMzMjtn
Y2VfcGxhdDoNCiZndDsmIzMyOyZndDsmIzMyO1tQQVRDSCYjMzI7MTMvMTVdJiMzMjtpcyYjMzI7
YWRkaW5nJiMzMjt0aGUmIzMyO2ZsYWcmIzMyO3RvJiMzMjtnY2VfcGxhdF92OCYjMzI7Zm9yDQom
Z3Q7JiMzMjttZWRpYXRlayxtdDgxODgtZ2NlDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtbUEFUQ0gmIzMy
OzE0LzE1XSYjMzI7aXMmIzMyO2FkZGluZyYjMzI7dGhlJiMzMjtmbGFnJiMzMjt0byYjMzI7Z2Nl
X3BsYXRfdjYmIzMyO2Zvcg0KJmd0OyYjMzI7bWVkaWF0ZWssbXQ4MTk1LWdjZQ0KJmd0OyYjMzI7
JiM2MzsmIzYzOyYjNjM7DQomZ3Q7JiMzMjsNCiZndDsmIzMyO0kmIzMyO3RhbGtlZCYjMzI7YWJv
dXQmIzMyO3BhdGNoJiMzMjsxMiEmIzMyO1doeSYjMzI7ZG8mIzMyO3lvdSYjMzI7YWRkJiMzMjtp
bmNvbXBsZXRlJiMzMjtjb2RlJiM2MzsNCg0KRG8mIzMyO3lvdSYjMzI7bWVhbiYjMzI7SSYjMzI7
c2hvdWxkJiMzMjttZXJnZSYjMzI7dGhlJiMzMjtwYXRjaCYjMzI7MTImIzMyO2FuZCYjMzI7MTMm
IzYzOw0KDQpJJiMzMjt0aGluayYjMzI7c2VwYXJhdGluZyYjMzI7dGhlJiMzMjtuZXcmIzMyO3N1
cHBvcnRlZCYjMzI7bXQ4MTg4JiMzMjthbmQmIzMyO3RoZSYjMzI7bmV3JiMzMjtzdXBwb3J0ZWQN
CnNlY3VyZSYjMzI7ZmVhdHVyZSYjMzI7aW4mIzMyO2RpZmZlcmVudCYjMzI7cGF0Y2gmIzMyO2Nh
biYjMzI7bWFrZSYjMzI7dGhlJiMzMjtDTURRJiMzMjt1c2VyJiMzMjtrbm93JiMzMjtob3cmIzMy
O3RvDQptYWtlJiMzMjthJiMzMjtDTURRJiMzMjttYWlsYm94JiMzMjtkcml2ZXImIzMyO3N1cHBv
cnQmIzMyO3NlY3VyZSYjMzI7ZmVhdHVyZS4NCg0KU2luY2UmIzMyO210ODE4OCYjMzI7aXMmIzMy
O2EmIzMyO25ldyYjMzI7c3VwcG9ydGVkJiMzMjtJQyYjMzI7Zm9yJiMzMjttYWlsYm94LCYjMzI7
c28mIzMyO21lcmdpbmcmIzMyO3BhdGNoJiMzMjsxMiYjMzI7YW5kDQoxMyYjMzI7aW50byYjMzI7
dGhlJiMzMjtzYW1lJiMzMjtwYXRjaCYjMzI7aXMmIzMyO09LLg0KSSYjMzk7bGwmIzMyO21lcmdl
JiMzMjt0aGVtJiMzMjthdCYjMzI7dGhlJiMzMjtuZXh0JiMzMjt2ZXJzaW9uLiYjMzI7VGhhbmtz
Lg0KDQpSZWdhcmRzLA0KSmFzb24tSkguTGluDQomZ3Q7JiMzMjsNCiZndDsmIzMyOw0KJmd0OyYj
MzI7QmVzdCYjMzI7cmVnYXJkcywNCiZndDsmIzMyO0tyenlzenRvZg0KJmd0OyYjMzI7DQomZ3Q7
JiMzMjsNCg0KPC9wcmU+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioqKioq
IE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UgKioqKioqKioqKioqKioqKioqKioNClRo
ZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2FnZSAoaW5jbHVkaW5n
IGFueSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmlldGFyeSwgcHJp
dmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxp
Y2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5IHRvIHRoZSBk
ZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlvbiwgDQpkaXN0cmli
dXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlzIGUtbWFpbCAoaW5j
bHVkaW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lwaWVudChzKSBpcyBz
dHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBub3Qg
YW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxpZXZlIA0KdGhhdCB5
b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUg
c2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRl
IGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFj
aG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29udGVu
dCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3ByZT48
IS0tfS0tPg==

--__=_Part_Boundary_003_1808123275.626255093
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCAyMDIzLTA5LTI1IGF0IDA4OjQ1ICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiAgCSANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRl
ciBvciB0aGUgY29udGVudC4NCj4gIE9uIDI1LzA5LzIwMjMgMDg6MDEsIEphc29uLUpIIExpbiAo
5p6X552/56WlKSB3cm90ZToNCj4gPiBIaSBLcnp5c3p0b2YsDQo+ID4gDQo+ID4gT24gU2F0LCAy
MDIzLTA5LTIzIGF0IDIwOjA5ICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOg0KPiA+
PiAgIA0KPiA+PiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Ig
b3BlbiBhdHRhY2htZW50cw0KPiB1bnRpbA0KPiA+PiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2Vu
ZGVyIG9yIHRoZSBjb250ZW50Lg0KPiA+PiAgT24gMTgvMDkvMjAyMyAyMToyMiwgSmFzb24tSkgu
TGluIHdyb3RlOg0KPiA+Pj4gQWRkIG10ODE4OCBzdXBwb3J0IGZvciBDTURRIHNlY3VyZSBkcml2
ZXIuDQo+ID4+Pg0KPiA+Pj4gU2lnbmVkLW9mZi1ieTogSmFzb24tSkguTGluIDxqYXNvbi1qaC5s
aW5AbWVkaWF0ZWsuY29tPg0KPiA+Pj4gLS0tDQo+ID4+PiAgZHJpdmVycy9tYWlsYm94L210ay1j
bWRxLW1haWxib3guYyB8IDEgKw0KPiA+Pj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KQ0KPiA+Pj4NCj4gPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21haWxib3gvbXRrLWNtZHEtbWFp
bGJveC5jDQo+ID4+IGIvZHJpdmVycy9tYWlsYm94L210ay1jbWRxLW1haWxib3guYw0KPiA+Pj4g
aW5kZXggMzk0MGI5ZjhlNzc0Li40ZTA0N2RjOTE2YjkgMTAwNjQ0DQo+ID4+PiAtLS0gYS9kcml2
ZXJzL21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5jDQo+ID4+PiArKysgYi9kcml2ZXJzL21haWxi
b3gvbXRrLWNtZHEtbWFpbGJveC5jDQo+ID4+PiBAQCAtNzUwLDYgKzc1MCw3IEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgZ2NlX3BsYXQgZ2NlX3BsYXRfdjggPSB7DQo+ID4+PiAgLnRocmVhZF9uciA9
IDMyLA0KPiA+Pj4gIC5zaGlmdCA9IDMsDQo+ID4+PiAgLmNvbnRyb2xfYnlfc3cgPSB0cnVlLA0K
PiA+Pj4gKy5oYXNfc2VjID0gdHJ1ZSwNCj4gPj4NCj4gPj4gTm8sIHlvdSBqdXN0IGFkZGVkIGl0
IHBhdGNoIGFnby4gRG8gbm90IGFkZCBicm9rZW4gY29kZSBhbmQgZml4DQo+IGl0Lg0KPiA+PiBB
cmUNCj4gPj4gdGhlcmUgc29tZSBLUElzIGluIE1lZGlhdGVrIHRvIGhhdmUgcGF0Y2ggY291bnQ/
DQo+ID4+DQo+ID4gDQo+ID4gVGhpcyBwYXRjaCBpcyBkaWZmZXJlbnQgZnJvbSBbUEFUQ0ggMTQv
MTVdIGF0IHRoZSBnY2VfcGxhdDoNCj4gPiBbUEFUQ0ggMTMvMTVdIGlzIGFkZGluZyB0aGUgZmxh
ZyB0byBnY2VfcGxhdF92OCBmb3INCj4gbWVkaWF0ZWssbXQ4MTg4LWdjZQ0KPiA+IFtQQVRDSCAx
NC8xNV0gaXMgYWRkaW5nIHRoZSBmbGFnIHRvIGdjZV9wbGF0X3Y2IGZvcg0KPiBtZWRpYXRlayxt
dDgxOTUtZ2NlDQo+ID8/Pw0KPiANCj4gSSB0YWxrZWQgYWJvdXQgcGF0Y2ggMTIhIFdoeSBkbyB5
b3UgYWRkIGluY29tcGxldGUgY29kZT8NCg0KRG8geW91IG1lYW4gSSBzaG91bGQgbWVyZ2UgdGhl
IHBhdGNoIDEyIGFuZCAxMz8NCg0KSSB0aGluayBzZXBhcmF0aW5nIHRoZSBuZXcgc3VwcG9ydGVk
IG10ODE4OCBhbmQgdGhlIG5ldyBzdXBwb3J0ZWQNCnNlY3VyZSBmZWF0dXJlIGluIGRpZmZlcmVu
dCBwYXRjaCBjYW4gbWFrZSB0aGUgQ01EUSB1c2VyIGtub3cgaG93IHRvDQptYWtlIGEgQ01EUSBt
YWlsYm94IGRyaXZlciBzdXBwb3J0IHNlY3VyZSBmZWF0dXJlLg0KDQpTaW5jZSBtdDgxODggaXMg
YSBuZXcgc3VwcG9ydGVkIElDIGZvciBtYWlsYm94LCBzbyBtZXJnaW5nIHBhdGNoIDEyIGFuZA0K
MTMgaW50byB0aGUgc2FtZSBwYXRjaCBpcyBPSy4NCkknbGwgbWVyZ2UgdGhlbSBhdCB0aGUgbmV4
dCB2ZXJzaW9uLiBUaGFua3MuDQoNClJlZ2FyZHMsDQpKYXNvbi1KSC5MaW4NCj4gDQo+IA0KPiBC
ZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KPiANCj4gDQo=

--__=_Part_Boundary_003_1808123275.626255093--

