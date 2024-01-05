Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6633A824E70
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 07:10:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D253010E038;
	Fri,  5 Jan 2024 06:10:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B59C410E038
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 06:10:28 +0000 (UTC)
X-UUID: 1d1cf7c4ab9111eea2298b7352fd921d-20240105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=CI0diqNzG86zk0JBBgX/qzmhn8nuWeTo+iYmeNbTWCM=; 
 b=kQGa8PczTQrN0kDs4Dzc3Fc5kU8I+OZzeSTez+lPFhv4n+H/sADNi8M/naQx/DW/jxLoIUmNX0bnRmsidQVUjE+g8BZMeHGmmxWWbkpv36qbXnU7nLBqDdLzRcjY4iu2HQLaiDS0/NjxqQJz87DCv62H9U2ikwkeJQ55SFBsQog=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35, REQID:0364d733-5b98-43c5-aff0-52221a02f16b, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5d391d7, CLOUDID:d848eb8d-e2c0-40b0-a8fe-7c7e47299109,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 1d1cf7c4ab9111eea2298b7352fd921d-20240105
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1274895769; Fri, 05 Jan 2024 14:10:24 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 5 Jan 2024 14:10:23 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Fri, 5 Jan 2024 14:10:22 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H6vGvchDdpTeAR8e/6fwDMSRr8RmPpRRn9U+KFeuiD5+ikEqrnaJXAD7CnJVIITKYVKVBY8AzXrET9Zu0cdKb0TWInMi7FobdEq4Ria5JQlS4AWJBVBO5SHtNBo27iXk7Il7FgITL7g6de5DOk7F8UENNq4iVhB+P7t3tTquQdB4J7/R9XwVIagzWgcB/1bQMl4JYn87v0Cf4azyiMBONsrO/AGEstym7sanl31/gVX3ggSmXZGcL1I8pUkiSux1iFvlJZd/0qXLR5Cd1dDGyB5HyKGr90x+2r+qygRNH7KVe1pGW17zRv/sWeIaOECcC3zu/jW9mx7OvHY88NWZfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5PuAyi/PtCzlSqrDQX2XkxR53mSkYjD+miCs2RFos+A=;
 b=XtSZcp5dLN+uSRqQiqirj8x1tspYsx8lG8zJiygDdcJNck5eli9P1Bmp8LQBcSxh6difnkjdX/1BKkYfemuA0z6z7SteL9TCGzvHTeOdykVJGTyhIxq8ZgK5CYP4vy/X4HtkfY0Qj6vofbpW15iZ2CAM8Y8gz6XcT7i7qDJcP43YC8Dru+17GtctCLoI1Fcxj1Plkpyg9nEh2cpX3i2+oOugQJ8VCkl/mo4d/secDB4rHTKqAfn6Y4XEjU7g0FhnSSUgpEwKk6gRPmugIcaDQbBy6aWjEl5eUBkbJeu4iaGTCNEdvaBbgL6PN1EDQ4BRSNugtOjofAqQtqjpxZfeww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5PuAyi/PtCzlSqrDQX2XkxR53mSkYjD+miCs2RFos+A=;
 b=LRtZ5/hjDCdZrj6tUkcL+TWF+NOQ65RdHjkOPWIn+QbCk5ymMVU7v1f7P4ZaqxlnTOdcSsDwG7i/XPQmS2pD9a334AOAUSlQRgNckOiTkXNPcgvXv2TGiBvPP32lHlUvz8yn0Z4x7+V/xTdXVRM+qVw9+HxJqiG1N22fEFC0FiA=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB7242.apcprd03.prod.outlook.com (2603:1096:400:28e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.16; Fri, 5 Jan
 2024 06:10:20 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::eb43:57cb:edfd:3762]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::eb43:57cb:edfd:3762%7]) with mapi id 15.20.7159.013; Fri, 5 Jan 2024
 06:10:20 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?TWFjIFNoZW4gKOayiOS/iik=?= <Mac.Shen@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?= <jitao.shi@mediatek.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] drm/mediatek/dp: Add the HDCP feature for DisplayPort
Thread-Topic: [PATCH] drm/mediatek/dp: Add the HDCP feature for DisplayPort
Thread-Index: AQHaHrPjdunoffcOCEGmErF8vNrJIrDK/lAA
Date: Fri, 5 Jan 2024 06:10:20 +0000
Message-ID: <8b38cd45634bb37e8e652060d920b3ad74680918.camel@mediatek.com>
References: <20231124085346.26602-1-mac.shen@mediatek.com>
In-Reply-To: <20231124085346.26602-1-mac.shen@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB7242:EE_
x-ms-office365-filtering-correlation-id: f97d94ce-0430-4822-007c-08dc0db4ff42
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: p85CiNQRkOTHy8Hvm+yeIuLZGqR7gpJETSROBBdSp0gQNCcVxkSA2FN6z36Chm14A/wlOcx+1Ft7Gr0SE0u9DPH+v2QhKzxdAnZeZ4CVjtfGLnVSUTTkOG4Z8pcjVq0YJ+tGAL0Kdvkx5tuwWCZQdclRrfopthCNgXU6bfmArFr5rpcEzlHPwlJp3YvPB6ru1ML5Tz3DiYh5vy2nw2ffx0KvyWBFTC7dnYcdKOh0UCTp9qQXV8NBTVIxRKyvbKW8SfsaUWk5gp6i3CLX+LlqQEAXVrydGim153KJAxbTarfkQOUOUEmS7SfgBIvScIk9N9ksjl1UAkmLbFcl0enjEY24nWaLTRuhUfJ5fWidIB4mtcrn7uI9sPyT0tBRS5/fTdLfqtYSsmsAD0IcAmIzuY8XAoS7x/ToNJuQcE1ySYaDTmYHI09o2LxDOTicSWRslge23bHknskGUQNlVm52Qn6yA3okCtffXnO5cNDNEUyh4cX8oybflOwm4x3BACdUyIkzx/tqF0V3TJLyASnTzZfKuqSwWUoJoxIbTQVCzAfky1wtavd5mLuKXNX3SEGrHi3dAlYC7Q9IMeteCY6ROB1gEOoPeBTlFlLW63d8lEf+3O9qAerPU4unF5RdEmEbdLDZhFi6wNcY9u1DEce09w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(376002)(39860400002)(366004)(136003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(76116006)(66556008)(64756008)(66446008)(66946007)(66476007)(316002)(8936002)(8676002)(54906003)(110136005)(7416002)(4744005)(5660300002)(86362001)(2906002)(85182001)(41300700001)(4001150100001)(38070700009)(36756003)(4326008)(107886003)(2616005)(26005)(6506007)(6512007)(83380400001)(38100700002)(6486002)(122000001)(478600001)(966005)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SVlCMjNDemhZRnNVbHZDSGhpQWtEdGJpZ2djZTlFbjJYbmpWaXVVclphNmFq?=
 =?utf-8?B?NmJxQnpDdTVtcDFLWnBReFplSXNadGRhOFovVm9CL1VWTjlpR0w2OUJXOURx?=
 =?utf-8?B?UXpoWnMvb3d2L1lud2wyM2cxc3NhQ1d0V3BJZWJYd0IySXQ1eUVMeTJwVk90?=
 =?utf-8?B?NXJxWG9hSS9LYm5IeGwrZGhtNDZqVnFqSDFlY24rVTVaNDFFSTh2N2VHZy9z?=
 =?utf-8?B?K09EZGQzVUxLd0I3TEJmanljVWhBMkQwbE1pQ1AyekgzbjFUcmlwQ1dtdUFN?=
 =?utf-8?B?dTF6TXp2bXJUNkJmc1ltYS9JQWlmQk5WdU5nK1ptVkJ2Ni9yYlVGRGFWV3ZJ?=
 =?utf-8?B?emRKeVhqQkRYejI5ekVtdWZIOGFMa3FDSUZ2WEtDVVphOFl3T05PZ05SK1pr?=
 =?utf-8?B?a1NjNFd5b0ZKMFhNLzZkV0NhU1dQcmlFa1NWc3lSaHVGMHVjMFBYVENabzVp?=
 =?utf-8?B?M1A2VHQ0d0s1WHY1MC9SWW1ZaXJRQXFmVmZQYnFoU0J4VHFaamVaNU0rK1Vh?=
 =?utf-8?B?dENkNkZUSTIzczlZWGhmVWxOZlVDOS9ZNjR3OFQ2Q1pzV0FLN0E5d3dYYWla?=
 =?utf-8?B?TW5zUUs2M0ZpOUlvWkk3cG9FWUduUTlpNjRFa1NkZWZNZkJnYXNyeFVUUTE0?=
 =?utf-8?B?d3RZaEZBekpLQ0ZicTlScU14TGt6VndPMmNKV0NPRmdPb3BCMEpSUXVjQnVJ?=
 =?utf-8?B?Rll4Vlg4Y1Vjd2hYTFMzWE4zeG9QZDhYMlkwOHdSRGJlZEl2QU1ueEdGejha?=
 =?utf-8?B?WG9RNTEybVBuczRsazNhUEhzZHZWckxFekpEeVpScUtOL3dMYmZYaWMwWXVS?=
 =?utf-8?B?TVIvMHlWRDBoOVRzUFpia2NqeHZ2WEgzWFhsV0xRWDl4V3VFTkJSaHBtbC9F?=
 =?utf-8?B?NS84R1kvZUx1NEs4Z2hudS9lZWVlWUZ6Zk5BU283UmNWK1V0dnNBMHc0VDAr?=
 =?utf-8?B?TXN1aWoyK0lKT3B1bXJEZzYwMHNMQUFtbmh0QXFGYVNzS2hYbVJ4UHp2SVl3?=
 =?utf-8?B?bDRYN0t3R0xDMzlDdUE2MitFZTBEWHV0Q0JHazhndlc2RjhGRmZtamtOTm94?=
 =?utf-8?B?N28vbGRPNVlBc3V6TldpSTBvWVZzVCtWbUNEcSsvdUR3ZEVtYVFTVzdlTzV1?=
 =?utf-8?B?SlkxR2gwYUIwR3NiOVhXcFpaUis5Z1hwVG1TaHA2R3BCam12TldwWGJhZmYv?=
 =?utf-8?B?Y2k1Nnp1L201NVhEUlZBRndhODFVSngwMVlhLytxYjh1M1FmdUl3TFczanpm?=
 =?utf-8?B?RTBHam9wamRuYnFhdWh4Yzcrc3ZuSXFrNWtNL0ZWVzVJREhGb0VHaVh1dXMw?=
 =?utf-8?B?THdrRUZqZnZHVk9pNVpNNkx0b1BLRTlDcWdwR3Bmb1JrazBJR21Hdlk2MUJ0?=
 =?utf-8?B?eHh3bStKZFdSUTFOMjU3cGFFSEh2R05TbVRPYTQ2azJGTHg3aXZPTzlVM09Q?=
 =?utf-8?B?TUR1WnBOTEVabWk2R1RORm1GSEtmSWM1WlZDVFd6K3U1NnlQNEJyRk13NTcy?=
 =?utf-8?B?NitWZGNpT3V1S20wcWVjQkY2UVVuZ2MxTXZTUUllc0pFclJpRkYwanlORlIv?=
 =?utf-8?B?eFBRdmo4T2FlTUlqd1NvNmNDandaSnNMZFVteGJUemI2RnF6QVFhcmZIbFB3?=
 =?utf-8?B?alpHVlB6T1F1YStNY3NEQTk5RE00ZzVHSE56ZVJzSEVEYktVZTV0Vm1FZTF3?=
 =?utf-8?B?M0JYa2tGL3IyTzVHYVZEMFZ6VytpS3VCVXNTRFBYaUR4NFN4ZTVhVWc0QWMw?=
 =?utf-8?B?UFE2dUlaazg4eDE0blpWSnZRSXBrZGQ3RVJOaFkzYjhTRlBtNWtvZTVoazNa?=
 =?utf-8?B?c1Yvd3BrcXBKN0ZYNEc0UnprQVZ3MTZYQ0RCOXdUWktTSFJNWklEVnh2SlhH?=
 =?utf-8?B?Rm9yS1FKcHlVWkI3bnJqTmlRMDRLeExveGI4TTdoSzZiYXNkUmxLVklVU0p0?=
 =?utf-8?B?Z0IrM0VUQ3dmT01nWkRqbDVNTkZrZUYxZmRQc2czVDlSempkTzZOaUJLbkU4?=
 =?utf-8?B?ZjdmZVZJRGxXMmpMd1RpZE9ObnFZMDdwSldkY2p5dWw4eGV0WVVneHVUS2FI?=
 =?utf-8?B?dlJFMWE1VjV0TFJVc3g0L1RLUStEZ1puUTdjOTBrQkV5ai9tZXpTa0I2cTBx?=
 =?utf-8?Q?kt3IUeb7V2UDPSZdx8KeBK3Ip?=
Content-ID: <7AA9BDB66EEC224696A6BD38012F99C2@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f97d94ce-0430-4822-007c-08dc0db4ff42
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2024 06:10:20.7230 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ygxZS1+0omxUqPG/dB6CkGsBWyBSmIIWLvn5ORAyxS35tK9WpWkGYK2BrOa9hOdhhkQqIrwUYn4G3Tc6LPTEAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7242
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_001_1046737121.531270666"
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
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 =?utf-8?B?U2h1aWppbmcgTGkgKOadjuawtOmdmSk=?= <Shuijing.Li@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_001_1046737121.531270666
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtNYWM6DQoNCk9uJiMzMjtGcmksJiMzMjsy
MDIzLTExLTI0JiMzMjthdCYjMzI7MTY6NTMmIzMyOyswODAwLCYjMzI7bWFjLnNoZW4mIzMyO3dy
b3RlOg0KJmd0OyYjMzI7QWRkJiMzMjt0ZWUmIzMyO2NsaWVudCYjMzI7YXBwbGljYXRpb24sJiMz
MjtIRENQJiMzMjsxLngmIzMyO2FuZCYjMzI7Mi54JiMzMjthdXRoZW50aWNhdGlvbiYjMzI7Zm9y
DQomZ3Q7JiMzMjtEaXNwbGF5UG9ydA0KJmd0OyYjMzI7dG8mIzMyO3N1cHBvcnQmIzMyO3RoZSYj
MzI7SERDUCYjMzI7ZmVhdHVyZS4NCiZndDsmIzMyOw0KJmd0OyYjMzI7U2lnbmVkLW9mZi1ieTom
IzMyO21hYy5zaGVuJiMzMjsmbHQ7bWFjLnNoZW5AbWVkaWF0ZWsuY29tJmd0Ow0KJmd0OyYjMzI7
LS0tDQoNCltzbmlwXQ0KDQomZ3Q7JiMzMjsmIzMyOw0KJmd0OyYjMzI7QEAmIzMyOy0yMjcxLDcm
IzMyOysyMzI0LDcmIzMyO0BAJiMzMjtzdGF0aWMmIzMyO3ZvaWQmIzMyO210a19kcF9icmlkZ2Vf
YXRvbWljX2VuYWJsZShzdHJ1Y3QNCiZndDsmIzMyO2RybV9icmlkZ2UmIzMyOypicmlkZ2UsDQom
Z3Q7JiMzMjsmIzMyOw0KJmd0OyYjMzI7JiMzMjttdGtfZHAtJmd0O2VuYWJsZWQmIzMyOz0mIzMy
O3RydWU7DQomZ3Q7JiMzMjsmIzMyO210a19kcF91cGRhdGVfcGx1Z2dlZF9zdGF0dXMobXRrX2Rw
KTsNCiZndDsmIzMyOy0NCiZndDsmIzMyOyttdGtfZHBfcmVfYXV0aGVudGljYXRpb24oJmFtcDtt
dGtfZHAtJmd0O2hkY3BfaW5mbyk7DQoNCkFjY29yZGluZyYjMzI7dG8mIzMyO2ludGVsJiMzMjtI
RENQJiMzMjtmbG93JiMzMjtbMV0sJiMzMjtJJiMzMjt0aGluayYjMzI7eW91JiMzMjtzaG91bGQm
IzMyO2VuYWJsZSYjMzI7SERDUA0KYWNjb3JkaW5nJiMzMjt0byYjMzI7dGhlJiMzMjtjb25uZWN0
b3ImIzMyO3N0YXR1cyYjMzI7c2V0JiMzMjtieSYjMzI7dXNlciYjMzI7c3BhY2UuDQoNClsxXSYj
MzI7DQpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9uZXh0
L2xpbnV4LW5leHQuZ2l0L3RyZWUvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9o
ZGNwLmMmIzYzO2g9bmV4dC0yMDI0MDEwNCNuMjQxMw0KDQpSZWdhcmRzLA0KQ0sNCg0KJmd0OyYj
MzI7JiMzMjtyZXR1cm47DQomZ3Q7JiMzMjsmIzMyO3Bvd2VyX29mZl9hdXg6DQomZ3Q7JiMzMjsm
IzMyO210a19kcF91cGRhdGVfYml0cyhtdGtfZHAsJiMzMjtNVEtfRFBfVE9QX1BXUl9TVEFURSwN
CiZndDsmIzMyOw0KDQo8L3ByZT4NCjwvcD48L2JvZHk+PC9odG1sPjwhLS10eXBlOnRleHQtLT48
IS0tey0tPjxwcmU+KioqKioqKioqKioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNl
ICoqKioqKioqKioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMg
ZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNvbmZp
ZGVudGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZy
b20gZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJl
IA0KY29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1c2Us
IGRpc3NlbWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNv
cHlpbmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkgdW5p
bnRlbmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0KYmUg
dW5sYXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUt
bWFpbCwgb3IgYmVsaWV2ZSANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4g
ZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChieSByZXBseWlu
ZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUt
bWFpbCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRv
IG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBl
cnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_001_1046737121.531270666
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIE1hYzoNCg0KT24gRnJpLCAyMDIzLTExLTI0IGF0IDE2OjUzICswODAwLCBtYWMuc2hlbiB3
cm90ZToNCj4gQWRkIHRlZSBjbGllbnQgYXBwbGljYXRpb24sIEhEQ1AgMS54IGFuZCAyLnggYXV0
aGVudGljYXRpb24gZm9yDQo+IERpc3BsYXlQb3J0DQo+IHRvIHN1cHBvcnQgdGhlIEhEQ1AgZmVh
dHVyZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IG1hYy5zaGVuIDxtYWMuc2hlbkBtZWRpYXRlay5j
b20+DQo+IC0tLQ0KDQpbc25pcF0NCg0KPiAgDQo+IEBAIC0yMjcxLDcgKzIzMjQsNyBAQCBzdGF0
aWMgdm9pZCBtdGtfZHBfYnJpZGdlX2F0b21pY19lbmFibGUoc3RydWN0DQo+IGRybV9icmlkZ2Ug
KmJyaWRnZSwNCj4gIA0KPiAgCW10a19kcC0+ZW5hYmxlZCA9IHRydWU7DQo+ICAJbXRrX2RwX3Vw
ZGF0ZV9wbHVnZ2VkX3N0YXR1cyhtdGtfZHApOw0KPiAtDQo+ICsJbXRrX2RwX3JlX2F1dGhlbnRp
Y2F0aW9uKCZtdGtfZHAtPmhkY3BfaW5mbyk7DQoNCkFjY29yZGluZyB0byBpbnRlbCBIRENQIGZs
b3cgWzFdLCBJIHRoaW5rIHlvdSBzaG91bGQgZW5hYmxlIEhEQ1ANCmFjY29yZGluZyB0byB0aGUg
Y29ubmVjdG9yIHN0YXR1cyBzZXQgYnkgdXNlciBzcGFjZS4NCg0KWzFdIA0KaHR0cHM6Ly9naXQu
a2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbmV4dC9saW51eC1uZXh0LmdpdC90
cmVlL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfaGRjcC5jP2g9bmV4dC0yMDI0
MDEwNCNuMjQxMw0KDQpSZWdhcmRzLA0KQ0sNCg0KPiAgCXJldHVybjsNCj4gIHBvd2VyX29mZl9h
dXg6DQo+ICAJbXRrX2RwX3VwZGF0ZV9iaXRzKG10a19kcCwgTVRLX0RQX1RPUF9QV1JfU1RBVEUs
DQo+IA0K

--__=_Part_Boundary_001_1046737121.531270666--

