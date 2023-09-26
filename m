Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5327AE40A
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 05:20:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5008510E348;
	Tue, 26 Sep 2023 03:20:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0592510E348
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 03:20:29 +0000 (UTC)
X-UUID: a25386085c1b11eea33bb35ae8d461a2-20230926
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=xc41G5T6LPa9CXK7XmvXJX+HD4YOH7J1oyuL7AUzabQ=; 
 b=TvYtnCoufvh+KwoMbejOwecAw3eH7sEYwBJnpFiZkpX97+l7MX6WV/0Hz6MB5QfXWeaRgRxFiBl3wz9rUAG/YZazcJzf+7U1HPtxorpCWXvIjRd5WdoC4Ffn4qxZJlbaA8KOWntb6Iprl7mGqwRaV2xDnzz0FMg5n9AGyJzXOnA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:bf9e348d-6874-455c-a94f-43d2d23b6b7f, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5f78ec9, CLOUDID:28ac5f14-4929-4845-9571-38c601e9c3c9,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: a25386085c1b11eea33bb35ae8d461a2-20230926
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1473798232; Tue, 26 Sep 2023 11:20:25 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 26 Sep 2023 11:20:22 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Tue, 26 Sep 2023 11:20:22 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F/nwTGOtKqBjisUcCNhJYzmfkmcKRJauQk7n4G2MYga5ML1U1DZf02mkV21BAZxj3+vjZ7lIxzNaA6ZBMUlh1easwLZuNSeYnJNzL7nD4ICaukhk5jUhmLnHI+fdg/ElHXKCGXdi7Nl+R5uz+a+mDmbutwZ71MS38zuSIq69TLNn/oxNB/LR+BCsiVeVhoQGSAbIxOs4qkyeOfwRlvUbHYFMb5IwQ5P98ZI0kJnPbGAD/SWGxtDoUHRQRrntPXRuoUjOCGnowNvG8dVQg9YryIajDItatw20+3ByNt5OsSd7SShvja78JmH42oMi/6G+LJizT7ELYL0wG5+o3RqYhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qPwPBRwV+l7YmyF4Vzfh2HeRWe3oWGZRSWh7wVroh9U=;
 b=oOlqiBZHY5KzQlhUvnjGqLH/4/mMikCLzjjQSBeZL+6+U/t0WmOgJni2AG7v8R6WGyCA6/ORlYfd5xBN9Cwym+4o8MOAxFi6JLerNGv7P4G5LYOHwx5oIhOQ2aZK4P1YC1Vnv0Jb3vpoeb0Ws0wco2WZt69uKkpExVAayGOVLMEb5LlMKu+nQ2pso1WGXsmFYRfyHUq10oDImIimJ9BS1zN+OyxgZB75T/Uif6c6HfF4gCfXhToyCjO/SRUG459ZA0Jk4NG9xSnpYw8QyozP3cbnUf5YA1yKv1IxuDaBkOI+2Z9a4ar5Y5Rv2YZQJJOKLpT9vaBTVssN3GOHMqwe/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qPwPBRwV+l7YmyF4Vzfh2HeRWe3oWGZRSWh7wVroh9U=;
 b=BJVwInUaDX3yrVbCCC8+3wxe7NgdmLb2lV3N4D4HJL6dVRlHfpNr+bT4+fXXzZ+ZqiqDPJcTUg0C0CjjHPgnN1arLvoXvBqTFrxiUQerethdaORoI3EmJsl0bpQwxwXFwobLcDwH2rt3mE4arqGsCjS5GVXpRI7wqyg9cORFuFI=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by TYSPR03MB8081.apcprd03.prod.outlook.com (2603:1096:400:470::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 03:20:19 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1b82:a45d:e171:62e8]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1b82:a45d:e171:62e8%4]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 03:20:19 +0000
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
Thread-Index: AQHZ6mWD5oVOGVt6VEG40kMSI9VJYbAou8iAgAJPyICAABcMAIABWVgA
Date: Tue, 26 Sep 2023 03:20:19 +0000
Message-ID: <0ff1b980f649f20801d0254a189adcae6a449518.camel@mediatek.com>
References: <20230918192204.32263-1-jason-jh.lin@mediatek.com>
 <20230918192204.32263-8-jason-jh.lin@mediatek.com>
 <5d528036-e506-7b95-69bb-7748b26d2aa8@linaro.org>
 <00f0bae9940be7b397c587c651e23c6c1e19a174.camel@mediatek.com>
 <c08630a2-3e3d-4975-a863-a9e58c6d78f5@linaro.org>
In-Reply-To: <c08630a2-3e3d-4975-a863-a9e58c6d78f5@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|TYSPR03MB8081:EE_
x-ms-office365-filtering-correlation-id: 5da58c6b-d6e5-45e4-9542-08dbbe3f82ee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wzz/mRtNZKI7hLiFYe0JYP4ENBbE2SgK9lS7u9qR6jrv+CvstqP+kwazW1Y9lnL279Hb25YpNAqlm83lJV27oKexYP6ijRYXXyiRPk4cEwol40YktrvfilfjepX7PcNW4TtKlIwvpKPpJF2qDj/KKMi8REbH4ZOeN0oiP2A+d0J8RP1vqT1vS7UMg8vRyMF6t9jGJLZhMxa/V1JviC36/xHaIRYiw7a76qolnuMpNIzMJ+heBKqPQwnHr1pWhMwIE4bInJmal6hCmDvWBu42Jm7/gd30AN1fi9dy1XUVVS4gLSeEkW1+pEDorITXg5FavIKWrhpU9f5eiKhDlqxNCOhccwn4aTxowRr3y2yuzZIIKA3lXCaUY+4+dzKQLBk+GVt9ByKbXciAWVbMkCHEuZc45fp/zfVBzxkdmD1DNezMFTHW9PP7/uTDTcMxLdpjHF33szuXCarupEFOw2kd7ozgFq4YacLvsj27SPgrSByQTLwLXReaFxzOpmTAZNHzuEnhpBeERL3GZaaqVKkNxx0ZuHM5nhWCWISFPTOgR6Nc8TyqJhpf2tEWirflEbZhxXyTiJiZrrtUATrdw3TTnFIBfpMg/bSd6o4gCCzQM04TfMbpO64krsq1h+CA01LoNZ4jH0FAEqxATseDLbm20Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(396003)(136003)(346002)(376002)(230922051799003)(451199024)(186009)(1800799009)(7416002)(5660300002)(54906003)(83380400001)(2906002)(316002)(15650500001)(41300700001)(8936002)(8676002)(36756003)(85182001)(4326008)(2616005)(64756008)(76116006)(66476007)(66556008)(66946007)(66446008)(53546011)(6486002)(91956017)(110136005)(966005)(6512007)(6506007)(107886003)(86362001)(26005)(71200400001)(38070700005)(122000001)(38100700002)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Mlk4STJjUW9qbVMxb29BeC9kZ2c2VlR1YVZtVVp0ZmZlRUZzc25pRS8wM2hJ?=
 =?utf-8?B?YUhuZndDb1BWazgzSzRQbVFTSVJDSFQ3NzY3UlR4RWw0Y1U0ZjFOdHFDcWc3?=
 =?utf-8?B?dVN4SWVZZVBvZ2RiZVd6c2drMi9jazFCMlZrQldKRFZHTC9Ddm1qdjU5WU1m?=
 =?utf-8?B?ZGRuN1RML0JCTG5XNC9VM1QrN2NpMkxJVDZZNzV6OUkwY2VhSkdUTVdHdU41?=
 =?utf-8?B?QUlCU3JxRTRUdExYVzVDeHdMK3ZkdDJzRmZoRENudDNXbHRzOUpRSWRaTjZE?=
 =?utf-8?B?Z21YdU1MMnN1VVdoMUZSZkJhNURzeW5YWGhNYjJyU3VIdUQyZE1MS0tPMm92?=
 =?utf-8?B?Ym1QbXROeHZBcDdiR0M4K2FxdlV2WFVFaUhDdTVDSWNpMlNZeUhJOVREa1NV?=
 =?utf-8?B?UHhJTzRYLysyZzhGL3R0b1FhZHUrdDhqMnZiYjlnTElneGJTcjdUT3o0WWpS?=
 =?utf-8?B?M1hSdVBLbnUycW1BeENJME9lSVpzYzMxTEFRY3ZlRjRXL3NGZDhuQzFLL1Fw?=
 =?utf-8?B?cHBoTlpGT1FFVTJrcnRobS9IYjM1N0pJRDZjM2RiOGpoUXRRM1RRWFN2cVpR?=
 =?utf-8?B?Zm9jSmxEckFROUhrTTZaUTEvRVp5cGgrZ2ljMzViQS8zV1ZLMmtWVjl5ZHNu?=
 =?utf-8?B?elJzSW4ydTdibFRnQmcxb0ZOMUdGS1JhRnlJT2txZVk5U3FpWk0remZwc2h4?=
 =?utf-8?B?M2ZEUzBUNlJtWGRBWW43U3BsZ29Kc2JrU3gxZlQvOG0zMCtuRU1FRzBZd3Fh?=
 =?utf-8?B?WDNScmNQL1dGQlI4WFFWRUIzczAzdFAzNkRYT3FjR1Bmb2s5VW5PaUhaVFFy?=
 =?utf-8?B?alJURzl3N1ZwbVRKNUFPZ0VXU2VMMDFKdGgzbjExTGd5eDNmR240VHNUZHpx?=
 =?utf-8?B?NTBHQ085aGJRVFIwOFVvTkk0QU4xdWFJVXU3L28wWis2WnFSWUxqNDN6OVBx?=
 =?utf-8?B?ekxWbkM3NW0xWUpUVmk5eEJVMHBZeGNOU3BzRGNIeEFjdHEwWkRDS1UxbkNQ?=
 =?utf-8?B?ZDFTbm9NampvRUZnZk5WSmVPWXdyNTJoekw2VytkaGdKcEx0V2NJVjBVbERZ?=
 =?utf-8?B?OWpYNXhZM2ROMCtqNlkyNDFGdCtkd3VzU2RvUVhXN1NQSTdSWXZhaWlOOFBy?=
 =?utf-8?B?MHBPYVlBdHpyM21ncFAwaFhnM05UUlRlZmpwT0cvK0lyYUl4R1cyRmZGZmxo?=
 =?utf-8?B?MDZadDVxb3Mzb2xZM2tXRnhVSmNjTFVSR24yQlNyQzJadjVPU24wcnlBeS9l?=
 =?utf-8?B?aE1FTDZWOW5sUEplQkxkZUp6RnZqNlJrUXo5cnBabDFzMmQwUTFGZUg4ZFd4?=
 =?utf-8?B?LzdZbE00bVVwc0d6ZFZ3VVZOUFNmZTBGTzNycERuVlVUak82ck8valVOSzc5?=
 =?utf-8?B?c0VZVUZRYWYwd3pTMlJxN2hGRy8xZ0VOckpFL1ZyellwQm9VKzh5aUJMRTUv?=
 =?utf-8?B?QnhtalJPTHRVSTZTNGhGaU11WWVXYW9oOGRDVkpkTHQzdVRibGZLU05XaHdI?=
 =?utf-8?B?bHZYTW51akhQMSszQTZNMGpvbjNMUzVIb3BQTjNkbC9OaVM2UXlKWDBHaUg4?=
 =?utf-8?B?MjZqc2o4NG1yU20zNDV5MUl2OGplZjFyampxU1NVaVY5SmVzTGc2UGg2Tnd4?=
 =?utf-8?B?ekNpSnVyYUVXQnNuY1dleU8rSEJVeGVOcjVCTWdXNlJyZ09aZlhUS3g2djNF?=
 =?utf-8?B?RDNPc1U2aFQ0QkpQeEw2cHF5TENXbDhNTmswLy9SRVFGMUFzdU14MmJnajdn?=
 =?utf-8?B?VWd5a0Q1dnBNSUErdDg5b2pKVDlHenBvbjFkL1U5VjlIdU1Rb1NacWo5OGtN?=
 =?utf-8?B?Tk5xSDFNSFhhSExNelRya2VOM0VrN2xvcm1RM3J3YkhjKzBteHFpVVp2NjdF?=
 =?utf-8?B?OTNPL1JBcmQzL0FVUzVic2JnUXI5amNlUjA0cXBZdDg5SElPbHVpT2pwVmFl?=
 =?utf-8?B?T0RFeUNGcDZlZUZKenhISUdyQnZKUEx5YmZZYWJNWmIyLzRXU3FmSitERnpw?=
 =?utf-8?B?QUVZQUp5T1d4SktwSHpsdWE1ek9nMS9kZUZRU25FNG5xbmhsTVhuQUlnbnBa?=
 =?utf-8?B?QkF1eEQwS3lYVGFXK1BvZWpwNGUzVVVYS1dLWnZBbUk5OEpwbDRNRlY4QzFk?=
 =?utf-8?B?M3ljYjlFVGt6QUF6ajhlTFlxN1YvZGVQZlRlKzJSM2phSzd5UFhoUUQ1T3FW?=
 =?utf-8?B?L3c9PQ==?=
Content-ID: <CC7F40CBDA7A0C44861286EE011E4EB0@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5da58c6b-d6e5-45e4-9542-08dbbe3f82ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2023 03:20:19.1799 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BpVPDdoCXEsVZ5cMTWqiRm/mM04dGyf0gb9Fn+7CvlGIQAZe24MBZVTrulgdtSHm4JvjGuFVS7JtGpP6+8StE4UOMmc/n9k4JHDgmflUPyc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB8081
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_005_2126608799.1411907612"
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

--__=_Part_Boundary_005_2126608799.1411907612
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCk9uJiMzMjtNb24sJiMzMjsyMDIzLTA5LTI1JiMzMjthdCYjMzI7MDg6NDQmIzMyOysw
MjAwLCYjMzI7S3J6eXN6dG9mJiMzMjtLb3psb3dza2kmIzMyO3dyb3RlOg0KJmd0OyYjMzI7JiMz
MjsmIzMyOw0KJmd0OyYjMzI7RXh0ZXJuYWwmIzMyO2VtYWlsJiMzMjs6JiMzMjtQbGVhc2UmIzMy
O2RvJiMzMjtub3QmIzMyO2NsaWNrJiMzMjtsaW5rcyYjMzI7b3ImIzMyO29wZW4mIzMyO2F0dGFj
aG1lbnRzJiMzMjt1bnRpbA0KJmd0OyYjMzI7eW91JiMzMjtoYXZlJiMzMjt2ZXJpZmllZCYjMzI7
dGhlJiMzMjtzZW5kZXImIzMyO29yJiMzMjt0aGUmIzMyO2NvbnRlbnQuDQomZ3Q7JiMzMjsmIzMy
O09uJiMzMjsyNS8wOS8yMDIzJiMzMjswNzoyMSwmIzMyO0phc29uLUpIJiMzMjtMaW4mIzMyOygm
IzI2NTE5OyYjMzA1OTE7JiMzMTA3NzspJiMzMjt3cm90ZToNCiZndDsmIzMyOyZndDsmIzMyO0hp
JiMzMjtLcnp5c3p0b2YsDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyO1Ro
YW5rcyYjMzI7Zm9yJiMzMjt0aGUmIzMyO3Jldmlld3MuDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZn
dDsmIzMyOyZndDsmIzMyO09uJiMzMjtTYXQsJiMzMjsyMDIzLTA5LTIzJiMzMjthdCYjMzI7MjA6
MDMmIzMyOyswMjAwLCYjMzI7S3J6eXN6dG9mJiMzMjtLb3psb3dza2kmIzMyO3dyb3RlOg0KJmd0
OyYjMzI7Jmd0OyZndDsmIzMyOyYjMzI7JiMzMjsNCiZndDsmIzMyOyZndDsmZ3Q7JiMzMjtFeHRl
cm5hbCYjMzI7ZW1haWwmIzMyOzomIzMyO1BsZWFzZSYjMzI7ZG8mIzMyO25vdCYjMzI7Y2xpY2sm
IzMyO2xpbmtzJiMzMjtvciYjMzI7b3BlbiYjMzI7YXR0YWNobWVudHMNCiZndDsmIzMyO3VudGls
DQomZ3Q7JiMzMjsmZ3Q7Jmd0OyYjMzI7eW91JiMzMjtoYXZlJiMzMjt2ZXJpZmllZCYjMzI7dGhl
JiMzMjtzZW5kZXImIzMyO29yJiMzMjt0aGUmIzMyO2NvbnRlbnQuDQomZ3Q7JiMzMjsmZ3Q7Jmd0
OyYjMzI7JiMzMjtPbiYjMzI7MTgvMDkvMjAyMyYjMzI7MjE6MjEsJiMzMjtKYXNvbi1KSC5MaW4m
IzMyO3dyb3RlOg0KJmd0OyYjMzI7Jmd0OyZndDsmZ3Q7JiMzMjtDTURRJiMzMjtjbGllbnQmIzMy
O2NhbiYjMzI7dXNlJiMzMjthJiMzMjtsb29wJiMzMjtmbGFnJiMzMjtmb3ImIzMyO3RoZSYjMzI7
Q01EUSYjMzI7cGFja2V0JiMzMjt0byYjMzI7bWFrZQ0KJmd0OyYjMzI7Y3VycmVudA0KJmd0OyYj
MzI7Jmd0OyZndDsmZ3Q7JiMzMjtjb21tYW5kJiMzMjtidWZmZXImIzMyO2p1bXBzJiMzMjt0byYj
MzI7dGhlJiMzMjtiZWdpbm5pbmcmIzMyO3doZW4mIzMyO0dDRSYjMzI7ZXhlY3V0ZXMmIzMyO3Rv
JiMzMjt0aGUNCiZndDsmIzMyO2VuZA0KJmd0OyYjMzI7Jmd0OyZndDsmZ3Q7JiMzMjtvZiYjMzI7
Y29tbWFuZHMmIzMyO2J1ZmZlci4NCiZndDsmIzMyOyZndDsmZ3Q7Jmd0Ow0KJmd0OyYjMzI7Jmd0
OyZndDsmZ3Q7JiMzMjtHQ0UmIzMyO2lycSYjMzI7b2NjdXJzJiMzMjt3aGVuJiMzMjtHQ0UmIzMy
O2V4ZWN1dGVzJiMzMjt0byYjMzI7dGhlJiMzMjtlbmQmIzMyO29mJiMzMjtjb21tYW5kDQomZ3Q7
JiMzMjtpbnN0cnVjdGlvbi4NCiZndDsmIzMyOyZndDsmZ3Q7Jmd0OyYjMzI7SWYmIzMyO3RoZSYj
MzI7Q01EUSYjMzI7cGFja2V0JiMzMjtpcyYjMzI7YSYjMzI7bG9vcHBpbmcmIzMyO2NvbW1hbmQs
JiMzMjtHQ0UmIzMyO2lycSYjMzI7aGFuZGxlciYjMzI7Y2FuJiMzMjtub3QNCiZndDsmIzMyOyZn
dDsmZ3Q7Jmd0OyYjMzI7ZGVsZXRlJiMzMjt0aGUmIzMyO0NNRFEmIzMyO3Rhc2smIzMyO2FuZCYj
MzI7ZGlzYWJsZSYjMzI7dGhlJiMzMjtHQ0UmIzMyO3RocmVhZC4NCiZndDsmIzMyOyZndDsmZ3Q7
Jmd0Ow0KJmd0OyYjMzI7Jmd0OyZndDsmZ3Q7JiMzMjtBZGQmIzMyO2NtZHFfbWJveF9zdG9wJiMz
Mjt0byYjMzI7c3VwcG9ydCYjMzI7dGhyZWFkJiMzMjtkaXNhYmxlDQomZ3Q7JiMzMjsmZ3Q7Jmd0
Ow0KJmd0OyYjMzI7Jmd0OyZndDsmIzMyO0hvdyYjMzI7b3ImIzMyO3doZXJlJiMzMjtkbyYjMzI7
eW91JiMzMjthZGQmIzMyO2l0JiM2MzsmIzMyO0kmIzMyO2RvJiMzMjtub3QmIzMyO3NlZSYjMzI7
aXQmIzMyO2luJiMzMjt0aGlzJiMzMjtwYXRjaC4mIzMyO1lvdXINCiZndDsmIzMyOyZndDsmZ3Q7
JiMzMjtwYXRjaHNldA0KJmd0OyYjMzI7Jmd0OyZndDsmIzMyO2xvb2tzJiMzMjtyYW5kb21seSYj
MzI7b3JnYW5pemVkLg0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtUaGlz
JiMzMjt3aWxsJiMzMjtiZSYjMzI7dXNlZCYjMzI7aW4mIzMyO2NtZHFfcGt0X2ZpbmlhbGl6ZV9s
b29wKCkmIzMyO2F0JiMzMjtbUEFUQ0gmIzMyOzgvMTVdLg0KJmd0OyYjMzI7Jmd0OyYjMzI7DQom
Z3Q7JiMzMjsmZ3Q7JiMzMjttdGstY21kcS1oZWxwZXIuYyYjMzI7YW5kJiMzMjttdGstY21kcS1t
YWlsYm94LmMmIzMyO2FyZSYjMzI7bm90JiMzMjtpbiYjMzI7dGhlDQomZ3Q7JiMzMjsmZ3Q7JiMz
MjtzYW1lJiMzMjttYWludGFpbmVyJiMzOTtzJiMzMjt0cmVlLCYjMzI7c28mIzMyO0kmIzMyO3Nl
cGFyYXRlJiMzMjt0aGlzJiMzMjt0byYjMzI7YW5vdGhlciYjMzI7cGF0Y2gmIzMyO2Zyb20NCiZn
dDsmIzMyO1tQQVRDSA0KJmd0OyYjMzI7Jmd0OyYjMzI7OC8xNV0uDQomZ3Q7JiMzMjsNCiZndDsm
IzMyO1doeSYjNjM7JiMzMjtBbnl3YXkmIzMyO2l0JiMzMjtoYXMmIzMyO3RvJiMzMjtnbyYjMzI7
dGhyb3VnaCYjMzI7c2FtZSYjMzI7dHJlZS4mIzMyO1lvdSYjMzI7aGF2ZSYjMzI7ZGVwZW5kZW5j
aWVzLg0KJmd0OyYjMzI7U3VjaA0KJmd0OyYjMzI7YXJ0aWZpY2lhbCYjMzI7c3BsaXQmIzMyO21h
a2VzJiMzMjtpdCYjMzI7b25seSYjMzI7ZGlmZmljdWx0JiMzMjt0byYjMzI7cmV2aWV3JiMzMjth
bmQmIzMyO3VuZGVyc3RhbmQuDQomZ3Q7JiMzMjtSZS1vcmdhbml6ZSYjMzI7eW91ciYjMzI7cGF0
Y2hzZXQmIzMyO3RvJiMzMjtiZSYjMzI7Y29ycmVjdGx5JiMzMjtzcGxpdCYjMzI7cGVyJiMzMjtl
YWNoJiMzMjtsb2dpY2FsDQomZ3Q7JiMzMjtmZWF0dXJlL2NoYW5nZS4mIzMyO1NwbGl0JiMzMjtw
ZXImIzMyO3N1YnN5c3RlbXMmIzMyO2lzJiMzMjtub3QmIzMyO3RoZSYjMzI7c2FtZS4NCiZndDsm
IzMyOw0KDQpZZXMsJiMzMjt0aGVzZSYjMzI7cmVsYXRlZCYjMzI7ZmlsZXMmIzMyO2FyZSYjMzI7
aW4mIzMyO3RoZSYjMzI7ZGlmZmVyZW50JiMzMjttYWludGFpbmVyJiMzOTtzJiMzMjt0cmVlLg0K
UmVmZXImIzMyO3RvJiMzMjtodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9saW51eC9NQUlOVEFJ
TkVSUw0KDQpNQUlMQk9YJiMzMjtBUEkNCk06JiMzMjtKYXNzaSYjMzI7QnJhcg0KRjomIzMyO2Ry
aXZlcnMvbWFpbGJveC8NCi0mIzMyO2RyaXZlcnMvbWFpbGJveC9tdGstY21kcS1tYWlsYm94LmMN
Ci0mIzMyO2RyaXZlcnMvbWFpbGJveC9tdGstY21kcS1zZWMtDQptYWlsYm94LmMNCg0KQVJNL01l
ZGlhdGVrJiMzMjtTb0MmIzMyO3N1cHBvcnQNCk06JiMzMjtNYXR0aGlhcyYjMzI7QnJ1Z2dlcg0K
RjomIzMyO2RyaXZlcnMvc29jL21lZGlhdGVrLw0KSzomIzMyO21lZGlhdGVrDQotJiMzMjtkcml2
ZXJzL3NvYy9tZWRpYXRlay9tdGstY21kcS1oZWxwZXIuYw0KLQ0KaW5jbHVkZS9saW51eC9zb2Mv
bWVkaWF0ZWsvbXRrLWNtZHEuaA0KDQpJJiMzMjt0aGluayYjMzI7d2UmIzMyO3Nob3VsZCYjMzI7
YWRkJiMzMjthJiMzMjtuZXcmIzMyO01BSU5UQUlORVImIzMyO2xhYmVsJiMzMjtmb3ImIzMyO21l
ZGlhdGVrJiMzMjtDTURRJiMzMjttYWlsYm94DQphbmQmIzMyO3B1dCYjMzI7dGhlc2UmIzMyO2Zp
bGVzJiMzMjt0b2dldGhlciwmIzMyO3N1Y2gmIzMyO2FzJiMzMjsmcXVvdDtNQUlMQk9YJiMzMjtB
Uk0mIzMyO01IVXYyJnF1b3Q7JiMzMjthbmQmIzMyOyZxdW90O1FVQUxDT00NCklQQ0MmIzMyO01B
SUxCT1gmIzMyO0RSSVZFUiZxdW90Oy4NCkJ1dCYjMzI7SSYjMzI7ZG9uJiMzOTt0JiMzMjtrbm93
JiMzMjtob3cmIzMyO3RvJiMzMjttYWtlJiMzMjthJiMzMjtyZXF1ZXN0JiMzMjtmb3ImIzMyO3Ro
YXQuDQoNCkFueXdheSwmIzMyO0kmIzM5O2xsJiMzMjtzcXVhc2gmIzMyO3RoaXMmIzMyO2xvZ2lj
YWwmIzMyO2ZlYXR1cmUmIzMyO3RvJiMzMjt0aGUmIzMyO3NhbWUmIzMyO3BhdGNoLCYjMzI7bm8m
IzMyO21hdHRlcg0KdGhlc2UmIzMyO2ZpbGVzJiMzMjthcmUmIzMyO25vdCYjMzI7aW4mIzMyO3Ro
ZSYjMzI7c2FtZSYjMzI7dHJlZS4NCg0KUmVnYXJkcywNCkphc29uLUpILkxpbg0KDQomZ3Q7JiMz
MjtCZXN0JiMzMjtyZWdhcmRzLA0KJmd0OyYjMzI7S3J6eXN6dG9mDQomZ3Q7JiMzMjsNCg0KPC9w
cmU+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioqKioqIE1FRElBVEVLIENv
bmZpZGVudGlhbGl0eSBOb3RpY2UgKioqKioqKioqKioqKioqKioqKioNClRoZSBpbmZvcm1hdGlv
biBjb250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFueSANCmF0dGFj
aG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmlldGFyeSwgcHJpdmlsZWdlZCwgb3Ig
b3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxpY2FibGUgbGF3cy4g
SXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJl
Y2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlvbiwgDQpkaXN0cmlidXRpb24sIHByaW50
aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0cyAN
CmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lwaWVudChzKSBpcyBzdHJpY3RseSBwcm9o
aWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQg
cmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxpZXZlIA0KdGhhdCB5b3UgaGF2ZSByZWNl
aXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1t
ZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxs
IGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9t
IHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUt
bWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_005_2126608799.1411907612
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCAyMDIzLTA5LTI1IGF0IDA4OjQ0ICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiAgCSANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRl
ciBvciB0aGUgY29udGVudC4NCj4gIE9uIDI1LzA5LzIwMjMgMDc6MjEsIEphc29uLUpIIExpbiAo
5p6X552/56WlKSB3cm90ZToNCj4gPiBIaSBLcnp5c3p0b2YsDQo+ID4gDQo+ID4gVGhhbmtzIGZv
ciB0aGUgcmV2aWV3cy4NCj4gPiANCj4gPiBPbiBTYXQsIDIwMjMtMDktMjMgYXQgMjA6MDMgKzAy
MDAsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+ID4+ICAgDQo+ID4+IEV4dGVybmFsIGVt
YWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzDQo+IHVu
dGlsDQo+ID4+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+
ID4+ICBPbiAxOC8wOS8yMDIzIDIxOjIxLCBKYXNvbi1KSC5MaW4gd3JvdGU6DQo+ID4+PiBDTURR
IGNsaWVudCBjYW4gdXNlIGEgbG9vcCBmbGFnIGZvciB0aGUgQ01EUSBwYWNrZXQgdG8gbWFrZQ0K
PiBjdXJyZW50DQo+ID4+PiBjb21tYW5kIGJ1ZmZlciBqdW1wcyB0byB0aGUgYmVnaW5uaW5nIHdo
ZW4gR0NFIGV4ZWN1dGVzIHRvIHRoZQ0KPiBlbmQNCj4gPj4+IG9mIGNvbW1hbmRzIGJ1ZmZlci4N
Cj4gPj4+DQo+ID4+PiBHQ0UgaXJxIG9jY3VycyB3aGVuIEdDRSBleGVjdXRlcyB0byB0aGUgZW5k
IG9mIGNvbW1hbmQNCj4gaW5zdHJ1Y3Rpb24uDQo+ID4+PiBJZiB0aGUgQ01EUSBwYWNrZXQgaXMg
YSBsb29wcGluZyBjb21tYW5kLCBHQ0UgaXJxIGhhbmRsZXIgY2FuIG5vdA0KPiA+Pj4gZGVsZXRl
IHRoZSBDTURRIHRhc2sgYW5kIGRpc2FibGUgdGhlIEdDRSB0aHJlYWQuDQo+ID4+Pg0KPiA+Pj4g
QWRkIGNtZHFfbWJveF9zdG9wIHRvIHN1cHBvcnQgdGhyZWFkIGRpc2FibGUNCj4gPj4NCj4gPj4g
SG93IG9yIHdoZXJlIGRvIHlvdSBhZGQgaXQ/IEkgZG8gbm90IHNlZSBpdCBpbiB0aGlzIHBhdGNo
LiBZb3VyDQo+ID4+IHBhdGNoc2V0DQo+ID4+IGxvb2tzIHJhbmRvbWx5IG9yZ2FuaXplZC4NCj4g
PiANCj4gPiBUaGlzIHdpbGwgYmUgdXNlZCBpbiBjbWRxX3BrdF9maW5pYWxpemVfbG9vcCgpIGF0
IFtQQVRDSCA4LzE1XS4NCj4gPiANCj4gPiBtdGstY21kcS1oZWxwZXIuYyBhbmQgbXRrLWNtZHEt
bWFpbGJveC5jIGFyZSBub3QgaW4gdGhlDQo+ID4gc2FtZSBtYWludGFpbmVyJ3MgdHJlZSwgc28g
SSBzZXBhcmF0ZSB0aGlzIHRvIGFub3RoZXIgcGF0Y2ggZnJvbQ0KPiBbUEFUQ0gNCj4gPiA4LzE1
XS4NCj4gDQo+IFdoeT8gQW55d2F5IGl0IGhhcyB0byBnbyB0aHJvdWdoIHNhbWUgdHJlZS4gWW91
IGhhdmUgZGVwZW5kZW5jaWVzLg0KPiBTdWNoDQo+IGFydGlmaWNpYWwgc3BsaXQgbWFrZXMgaXQg
b25seSBkaWZmaWN1bHQgdG8gcmV2aWV3IGFuZCB1bmRlcnN0YW5kLg0KPiBSZS1vcmdhbml6ZSB5
b3VyIHBhdGNoc2V0IHRvIGJlIGNvcnJlY3RseSBzcGxpdCBwZXIgZWFjaCBsb2dpY2FsDQo+IGZl
YXR1cmUvY2hhbmdlLiBTcGxpdCBwZXIgc3Vic3lzdGVtcyBpcyBub3QgdGhlIHNhbWUuDQo+IA0K
DQpZZXMsIHRoZXNlIHJlbGF0ZWQgZmlsZXMgYXJlIGluIHRoZSBkaWZmZXJlbnQgbWFpbnRhaW5l
cidzIHRyZWUuDQpSZWZlciB0byBodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9saW51eC9NQUlO
VEFJTkVSUw0KDQpNQUlMQk9YIEFQSQ0KTTogSmFzc2kgQnJhcg0KRjogZHJpdmVycy9tYWlsYm94
Lw0KLSBkcml2ZXJzL21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5jDQotIGRyaXZlcnMvbWFpbGJv
eC9tdGstY21kcS1zZWMtDQptYWlsYm94LmMNCg0KQVJNL01lZGlhdGVrIFNvQyBzdXBwb3J0DQpN
OiBNYXR0aGlhcyBCcnVnZ2VyDQpGOiBkcml2ZXJzL3NvYy9tZWRpYXRlay8NCks6IG1lZGlhdGVr
DQotIGRyaXZlcnMvc29jL21lZGlhdGVrL210ay1jbWRxLWhlbHBlci5jDQotDQppbmNsdWRlL2xp
bnV4L3NvYy9tZWRpYXRlay9tdGstY21kcS5oDQoNCkkgdGhpbmsgd2Ugc2hvdWxkIGFkZCBhIG5l
dyBNQUlOVEFJTkVSIGxhYmVsIGZvciBtZWRpYXRlayBDTURRIG1haWxib3gNCmFuZCBwdXQgdGhl
c2UgZmlsZXMgdG9nZXRoZXIsIHN1Y2ggYXMgIk1BSUxCT1ggQVJNIE1IVXYyIiBhbmQgIlFVQUxD
T00NCklQQ0MgTUFJTEJPWCBEUklWRVIiLg0KQnV0IEkgZG9uJ3Qga25vdyBob3cgdG8gbWFrZSBh
IHJlcXVlc3QgZm9yIHRoYXQuDQoNCkFueXdheSwgSSdsbCBzcXVhc2ggdGhpcyBsb2dpY2FsIGZl
YXR1cmUgdG8gdGhlIHNhbWUgcGF0Y2gsIG5vIG1hdHRlcg0KdGhlc2UgZmlsZXMgYXJlIG5vdCBp
biB0aGUgc2FtZSB0cmVlLg0KDQpSZWdhcmRzLA0KSmFzb24tSkguTGluDQoNCj4gQmVzdCByZWdh
cmRzLA0KPiBLcnp5c3p0b2YNCj4gDQo=

--__=_Part_Boundary_005_2126608799.1411907612--

