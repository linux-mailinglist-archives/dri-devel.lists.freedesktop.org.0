Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2014B7D0C48
	for <lists+dri-devel@lfdr.de>; Fri, 20 Oct 2023 11:51:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5725A10E58D;
	Fri, 20 Oct 2023 09:51:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65B3510E58D
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Oct 2023 09:51:03 +0000 (UTC)
X-UUID: 298b6bc06f2e11eea33bb35ae8d461a2-20231020
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=XccS+LgS6sgJeFvWDY0BfqpECXirzLOpDuMH8eyT9UI=; 
 b=F1iV68nrpB4ZoSQXXrlxbpoW1+5DgelfjX3DRLV+ZJAsYa1vw7d1Gp5Cupz5HOecEysaED8rR/hCul+v1OzV/Uw4hRjd3c3IY+sRBSA2AGbCGxXZYBftuBxnfvs1O7SWoQxNT3DDYKQe5KQuCe43+APvPPF8yE8mHUX+xto7WGg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:aec6ca31-5aab-4178-b8df-a67b82934892, IP:0,
 U
 RL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:25
X-CID-META: VersionHash:5f78ec9, CLOUDID:eac491fb-4a48-46e2-b946-12f04f20af8c,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
 NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: 298b6bc06f2e11eea33bb35ae8d461a2-20231020
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw01.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1423700412; Fri, 20 Oct 2023 17:50:55 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 20 Oct 2023 17:50:53 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Fri, 20 Oct 2023 17:50:53 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mM2HUfh1Tpu4EUElxL08frfd1EWWIxsFJs98WmAlsbHmSwR83artN/mpjKWT8+nf1Mwd/nkBhVzY/zV2wL1p5XIMwUk2Kmq6MyvBbIiLzZ3o3UxttiZdVMLEoN9w4iTXRJNi8aM9oEb+PFyjGYbRhYQYv9XU84UPoVsPg9wqWrsnLZdum/CcMZX9prMZlHbVY7zcCiF8TJNADlKy52JBZUdIzprdEbZX+SsQVKAtAq0eiqQhCmYnlnl715MqGeYhvZZuD7KnXUwymsUIQuCdz3gfWwzLBKVBsm2jpU0m6lQ6WvLgpos1DcEmhqp4U00TLagj6QYr5dkBbQRuSWmvrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XccS+LgS6sgJeFvWDY0BfqpECXirzLOpDuMH8eyT9UI=;
 b=NdXpjTWzmw/DNQGpz0f88eGES1OtUNK5aD+UqVJpIUzWHYPGjgfoV4n4UideyXUXGVBH1F8dU+lx9enPIRqylHRcbKE3WJCEJFgktWPByPdny/lvg0vbWkpVFeodGa9JLWQ1zYu7Zhaj792ObrrRQjZMVArc9BKckl5U46ovCrOu2heIZrh7tLp48WWbD1zceAEoXFonXbRwwjuH3fEBp1iZa1pdY6ZYaTcFdzX4CMLHrzE3cqfX+1yrvX1u2G/9Eo2lG2zy4x+YncaRY3cYsSeoJkV6/8LOBWjIjuhE5tFy2PBUvvjMejhe9srpgZF2ouBhNIs7lPN23/FwTGRHsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XccS+LgS6sgJeFvWDY0BfqpECXirzLOpDuMH8eyT9UI=;
 b=NCd+ajjf/J5fS4Dxtpw5r7ZxSoYtGiHa6bKfU5UvB94pb9al9Jb+DDr7P+ivtMWVEDD4HEF/hpU3SRYQAQE8VH4GajPOVGh3U4nv2AUCCa8EW1l39uv53F2RaRY02S3U43qCsBbelH+B+8OVPGHtwSDgTjolrR35xGmleXC2KXQ=
Received: from SI2PR03MB5885.apcprd03.prod.outlook.com (2603:1096:4:142::7) by
 PUZPR03MB7064.apcprd03.prod.outlook.com (2603:1096:301:11f::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.21; Fri, 20 Oct 2023 09:50:51 +0000
Received: from SI2PR03MB5885.apcprd03.prod.outlook.com
 ([fe80::3dfd:5783:26bf:c189]) by SI2PR03MB5885.apcprd03.prod.outlook.com
 ([fe80::3dfd:5783:26bf:c189%4]) with mapi id 15.20.6907.025; Fri, 20 Oct 2023
 09:50:51 +0000
From: =?utf-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>
To: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "quic_vjitta@quicinc.com" <quic_vjitta@quicinc.com>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>
Subject: Re: [PATCH 8/9] dt-bindings: reserved-memory: MediaTek: Add reserved
 memory for SVP
Thread-Topic: [PATCH 8/9] dt-bindings: reserved-memory: MediaTek: Add reserved
 memory for SVP
Thread-Index: AQHZ5FgxjegLVruM7kG7VRoFLocLPrBQxboAgAHnZgA=
Date: Fri, 20 Oct 2023 09:50:51 +0000
Message-ID: <2c3ad77806df3ef23cb69336f2049821529e337b.camel@mediatek.com>
References: <20230911023038.30649-1-yong.wu@mediatek.com>
 <20230911023038.30649-9-yong.wu@mediatek.com>
 <d4d471e7-64cf-42bf-a061-82934c904691@quicinc.com>
In-Reply-To: <d4d471e7-64cf-42bf-a061-82934c904691@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB5885:EE_|PUZPR03MB7064:EE_
x-ms-office365-filtering-correlation-id: 1af42020-e25c-4db4-c29f-08dbd1520b6b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: g+AoNHMpZpfsAVNEhMuyE42RsYRWcjt93ivkWWqXh2FlshZS87VjzUsXE6sjcZoNRJ4rG5kkrT/vCI5tU0QUpOuLO3USf8YE78oU3qwUal4NjdvrC0YuRgtXPss9yNjKk4kXKxDi/r54rJjCFcYiGFmba0hMV0iAYj9jf3/9pkcVc45fufuobr3LsWwqNhMl1az7dW9Iny2JrE+9fTL4R2+jGnZWq9e/SIbTz+gqCqd88hQIuVCNWanUaxC2COJYOxT4eiIp1XiXA8Fhkt9YzyhTXyp3ePWk5fvh6Rq4X9v2gvFoGcNwt5LlWp0AmkjAihriL38boQzIXa9jMdUOngPtkmUSbDhkw4QkbnFE+SeAaB2AuJ6ld6aaY2utSbz7pRuiZUNSertmJEWR2k/rtzictFlrCGFpjeuM483A/QvD4+HQ9KHukE1diHPR6QyPyXXi4QiD4vYNc8tbmBENsnxZmzyEpn9PPyHZQsmgdAqgb7FBIuLUdlsHJpVucUp/C70eTBN3K6IyGo3kbQ9hm3jZ/t1wdLnokD2h4UlVpVvpyd+sibBJAn0xXM1r792njpwbHmRX97ObVf3OwDIOl0QDmnerfsZWHTIn7QpmDB2UGxzxtKT0rT71ZRUWwRUFJ+79GQkrBnZGflSAhSrrZiI1vcusHdoJ0Vbqv0ikkIUCxCqyn9LwehIBT9UXnFu35rvlb+q4+79fYFRgIt3gEQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR03MB5885.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(366004)(346002)(376002)(396003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(966005)(478600001)(6486002)(66556008)(76116006)(66446008)(54906003)(64756008)(66476007)(110136005)(66946007)(85182001)(26005)(2616005)(71200400001)(86362001)(122000001)(36756003)(83380400001)(38100700002)(53546011)(6506007)(6512007)(7416002)(4001150100001)(2906002)(38070700009)(41300700001)(4326008)(316002)(8676002)(8936002)(5660300002)(99106002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VEsxSUFpVS9ybWhaTExPR1RlNHNlVnZzTXJUeDJXQWJUSUd3VjN0cDlXaU1u?=
 =?utf-8?B?TEhLYTg4eGtUZ2RncmEzOGxacmNYVW1YTWlaaGozOG1NUHp1dXBpaEM2L0w3?=
 =?utf-8?B?d2RHYnA3NWt3dEYrTkUrZ0pUYTcvb2YzelZSRnNzeC92MkJKYys0LzAveHIz?=
 =?utf-8?B?b1BENjNSV21LM1BrZ2xTTlErYXBwajJ4M3ovU1VRUFJjVUJjdng1RE92Mmlv?=
 =?utf-8?B?alFTYkFKQjJpNmZ4SkVkR3dvdXpDTVJrNW9QTkk0d1ZLbE9EWUhDV1NvVXA3?=
 =?utf-8?B?NHgxWEd0WjNsbHdGNThJaktzM0RZekJrQW9kaHFpbFB2MGRaclljdHA5aVZ0?=
 =?utf-8?B?aXFjZXNIdTlDa0hQYTNBdUlGWFhHR0dMc3RpbHgyMTB1U3dBQlhxSGVaQWtI?=
 =?utf-8?B?c1FFN29LYWtxdWVDMzNTRnhjOGdrcUZVTzE5TUpkcjQ2R21qbjZxanhjREZo?=
 =?utf-8?B?NHo2YzRkQUNJcmsrTWpWM0MyMGo4c0RxNUQwUlZvcnVNVWdHQkZ6bG50ck9Z?=
 =?utf-8?B?WmhKQk85YXRvYStWMzN3YnlSVFBOZ1BXZ1NzVHdDLzQ3VG9YbkVvRks0VVpv?=
 =?utf-8?B?V1Q2K1ZMdm5qVzdhMHlKVTdEN2FCL25lMkwvbDl5aEw5dHFPOUR3Zk1LbTF2?=
 =?utf-8?B?TG1ndXBtQ0dMS0x0MlhxaHRDdkJLNUZsYWNzbGZqcVh4TWR2SFRURXVJNytw?=
 =?utf-8?B?c0hQcVN5c3VkL0VDVksvaWVPcTZCMXZFVDR4dHJvWWJCWEZoc3pabWtpUjho?=
 =?utf-8?B?MXdWSGlPYnB0TWlpSWFWZC9HM0dTUm54Zkp0TVhJcDZQci9MbExGTis4NmVE?=
 =?utf-8?B?VFNwdGk1K1dCdldyVW5ldHA0YjVBYUhmd25PY3BBY3N3OFZaZ0xBdTJYc1FU?=
 =?utf-8?B?d0pkWkc4alVMMk9FaVNsemEySTFqT054SzZTWWcxaEhGZ2ZlZzBZamdZT2N5?=
 =?utf-8?B?ckMwQU1BZCthZUtkdzlXeVdycWFGZkVZWERERnJvQ2QrOXp3S3lyRmNGMWJG?=
 =?utf-8?B?Sk56em02OUZoRmMxdktreGd3VTFoUTBXbW9OdExIUEtKdVBMdmxMUDVHUGZh?=
 =?utf-8?B?dzFZV1RxZzlPbk1ZenJUVTRvT2xjYmtLYVVZb0dWbFN3cHowRnVNRG5TQXp3?=
 =?utf-8?B?T1B1N1lDZkI5b2VCUVlERlowK2EvOHNQa25yRDVSWjA3NzByVW8yR3M3WHoy?=
 =?utf-8?B?QkVFSmJodmNqczl2V3c3ZW5YZDgyS202R1JyL0tzUHBDUmE5S2lJdC95VkZp?=
 =?utf-8?B?UkpwQ3FQZXpLWXVORzByYVI0NE5uOWRpZHBsUVhKaEI0M25HTmNxR2NMeDBD?=
 =?utf-8?B?Qzd4ZHd1ZmZaT3dqcE5jK2hWN2lPZmVkUk1HVkowRlo5K1Fia0FlVnc4NkRi?=
 =?utf-8?B?djM3VHJKNUNSYWdiaDlFbnNuWk1kMHEwcVpGRWp2SXFORjJzbjQwVDV5eHNE?=
 =?utf-8?B?bllRMG9xOGdteFhrMWJnbXdLQ0Z0OVVmNXk5Yk1zNkpnR3YzRHdtSkJLQzRT?=
 =?utf-8?B?QmtsbWRENmJ4aWxCVWovZzRidVJlUENxWk5kTnAvN2dNQlZuVkFDbTJ2STFS?=
 =?utf-8?B?bUVKMG9Ta29TTm1tdjkxS1VnQWlIcDF4SFQ5aDFLMlFQdU11dFZGOWRXaGlE?=
 =?utf-8?B?UjJBWG9heHpnUlVYeE9oeG9SL3BLTHJTRzNETW9jVjFYdHRHczd0elFJYnVZ?=
 =?utf-8?B?NThMajZkWHFTQ05idUJ4RlgrMGZwcGlaNWcvdUw2SmRja0kvV0UwNmcxUDJa?=
 =?utf-8?B?S0hnRzZpcWw0cWswOTZQeDZ1QUNHN0QzVWJMVGprYXowbFQ1NzFMcFh4SldI?=
 =?utf-8?B?aVFrcE9CQlZ3cG9zRXROMnFRVVFDM3hRN01nUm5hZWVNMGZuSDhNSGlaRkJR?=
 =?utf-8?B?ZzFyTXpLcGNMTkxzcmw5YW1FSW9iYm02SENueGtXNE01emU0aEh4WWlJaEdl?=
 =?utf-8?B?WUNleWFteUVGbkg1RmhMLzhuTzdDSzV4Y3poVlNqdG9SUG1VUWR2Yk5nNzJX?=
 =?utf-8?B?dUhWWEJJMzBzc1ZDK3BlYmRBUytnU1o4VXJIYUNKeHlFU2VLcjBPYlQzcmtI?=
 =?utf-8?B?MGUwQ1RiM3IvV2pKWlhGYkR2R25wOHVyWHVNaitEajZWQ3VuaXBTR21JbXcx?=
 =?utf-8?Q?LR7OmC/NBuCr7jW6ZYMiYSuaB?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9D435AE0793D684C96327025186BCBBE@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB5885.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1af42020-e25c-4db4-c29f-08dbd1520b6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2023 09:50:51.1987 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xuubeELZnUfC+1/mxkuNUVZj+Igdk9iADVWP3juTpeHhNUHY/4uLigJQrBzVwht3k6SXZW5GoZ2P/77/z612Uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR03MB7064
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

T24gVGh1LCAyMDIzLTEwLTE5IGF0IDEwOjE2ICswNTMwLCBWaWpheWFuYW5kIEppdHRhIHdyb3Rl
Og0KPiAgCSANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9y
IG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBv
ciB0aGUgY29udGVudC4NCj4gIA0KPiANCj4gT24gOS8xMS8yMDIzIDg6MDAgQU0sIFlvbmcgV3Ug
d3JvdGU6DQo+ID4gVGhpcyBhZGRzIHRoZSBiaW5kaW5nIGZvciBkZXNjcmliaW5nIGEgQ01BIG1l
bW9yeSBmb3IgTWVkaWFUZWsNCj4gU1ZQKFNlY3VyZQ0KPiA+IFZpZGVvIFBhdGgpLg0KPiA+IA0K
PiA+IFNpZ25lZC1vZmYtYnk6IFlvbmcgV3UgPHlvbmcud3VAbWVkaWF0ZWsuY29tPg0KPiA+IC0t
LQ0KPiA+ICAuLi4vbWVkaWF0ZWssc2VjdXJlX2NtYV9jaHVua21lbS55YW1sICAgICAgICAgfCA0
Mg0KPiArKysrKysrKysrKysrKysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0MiBpbnNlcnRp
b25zKCspDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvcmVzZXJ2ZWQtDQo+IG1lbW9yeS9tZWRpYXRlayxzZWN1cmVfY21hX2NodW5rbWVt
LnlhbWwNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3Jlc2VydmVkLQ0KPiBtZW1vcnkvbWVkaWF0ZWssc2VjdXJlX2NtYV9jaHVua21lbS55
YW1sDQo+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jlc2VydmVkLQ0KPiBt
ZW1vcnkvbWVkaWF0ZWssc2VjdXJlX2NtYV9jaHVua21lbS55YW1sDQo+ID4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLmNjMTBlMDBkMzVjNA0KPiA+IC0tLSAv
ZGV2L251bGwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVz
ZXJ2ZWQtDQo+IG1lbW9yeS9tZWRpYXRlayxzZWN1cmVfY21hX2NodW5rbWVtLnlhbWwNCj4gPiBA
QCAtMCwwICsxLDQyIEBADQo+ID4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4w
LW9ubHkgT1IgQlNELTItQ2xhdXNlKQ0KPiA+ICslWUFNTCAxLjINCj4gPiArLS0tDQo+ID4gKyRp
ZDogDQo+IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3Jlc2VydmVkLW1lbW9yeS9tZWRp
YXRlayxzZWN1cmVfY21hX2NodW5rbWVtLnlhbWwjDQo+ID4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZp
Y2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIw0KPiA+ICsNCj4gPiArdGl0bGU6IE1l
ZGlhVGVrIFNlY3VyZSBWaWRlbyBQYXRoIFJlc2VydmVkIE1lbW9yeQ0KPiA+ICsNCj4gPiArZGVz
Y3JpcHRpb246DQo+ID4gKyAgVGhpcyBiaW5kaW5nIGRlc2NyaWJlcyB0aGUgcmVzZXJ2ZWQgbWVt
b3J5IGZvciBzZWN1cmUgdmlkZW8NCj4gcGF0aC4NCj4gPiArDQo+ID4gK21haW50YWluZXJzOg0K
PiA+ICsgIC0gWW9uZyBXdSA8eW9uZy53dUBtZWRpYXRlay5jb20+DQo+ID4gKw0KPiA+ICthbGxP
ZjoNCj4gPiArICAtICRyZWY6IHJlc2VydmVkLW1lbW9yeS55YW1sDQo+ID4gKw0KPiA+ICtwcm9w
ZXJ0aWVzOg0KPiA+ICsgIGNvbXBhdGlibGU6DQo+ID4gKyAgICBjb25zdDogbWVkaWF0ZWssc2Vj
dXJlX2NtYV9jaHVua21lbQ0KPiA+ICsNCj4gPiArcmVxdWlyZWQ6DQo+ID4gKyAgLSBjb21wYXRp
YmxlDQo+ID4gKyAgLSByZWcNCj4gPiArICAtIHJldXNhYmxlDQo+ID4gKw0KPiA+ICt1bmV2YWx1
YXRlZFByb3BlcnRpZXM6IGZhbHNlDQo+ID4gKw0KPiA+ICtleGFtcGxlczoNCj4gPiArICAtIHwN
Cj4gPiArDQo+ID4gKyAgICByZXNlcnZlZC1tZW1vcnkgew0KPiA+ICsgICAgICAgICNhZGRyZXNz
LWNlbGxzID0gPDE+Ow0KPiA+ICsgICAgICAgICNzaXplLWNlbGxzID0gPDE+Ow0KPiA+ICsgICAg
ICAgIHJhbmdlczsNCj4gPiArDQo+ID4gKyAgICAgICAgcmVzZXJ2ZWQtbWVtb3J5QDgwMDAwMDAw
IHsNCj4gPiArICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJtZWRpYXRlayxzZWN1cmVfY21hX2No
dW5rbWVtIjsNCj4gPiArICAgICAgICAgICAgcmV1c2FibGU7DQo+ID4gKyAgICAgICAgICAgIHJl
ZyA9IDwweDgwMDAwMDAwIDB4MTgwMDAwMDA+Ow0KPiA+ICsgICAgICAgIH07DQo+ID4gKyAgICB9
Ow0KPiANCj4gSW5zdGVhZCBvZiBoYXZpbmcgYSB2ZW5kb3Igc3BlY2lmaWMgYmluZGluZyBmb3Ig
Y21hIGFyZWEsIEhvdyBhYm91dA0KPiByZXRyaWV2aW5nDQo+IA0KaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbGttbC8xNTk0OTQ4MjA4LTQ3MzktMS1naXQtc2VuZC1lbWFpbC1oYXlhc2hpLmt1bmlo
aWtvQHNvY2lvbmV4dC5jb20vDQo+ICA/DQo+IGRtYV9oZWFwX2FkZF9jbWEgY2FuIGp1c3QgYXNz
b2NpYXRlIGNtYSByZWdpb24gYW5kIGNyZWF0ZSBhIGhlYXAuIFNvLA0KPiB3ZSBjYW4gcmV1c2Ug
Y21hIGhlYXANCj4gY29kZSBmb3IgYWxsb2NhdGlvbiBpbnN0ZWFkIG9mIHJlcGxpY2F0aW5nIHRo
YXQgY29kZSBoZXJlLg0KPiANCg0KVGhhbmtzIGZvciB0aGUgcmVmZXJlbmNlLiBJIGd1ZXNzIHdl
IGNhbid0IHVzZSBpdC4gVGhlcmUgYXJlIHR3bw0KcmVhc29uczoNCiAgDQphKSBUaGUgc2VjdXJl
IGhlYXAgZHJpdmVyIGlzIGEgcHVyZSBzb2Z0d2FyZSBkcml2ZXIgYW5kIHdlIGhhdmUgbm8NCmRl
dmljZSBmb3IgaXQsIHRoZXJlZm9yZSB3ZSBjYW5ub3QgY2FsbCBkbWFfaGVhcF9hZGRfY21hLg0K
ICANCmIpIFRoZSBDTUEgYXJlYSBoZXJlIGlzIGR5bmFtaWMgZm9yIFNWUC4gTm9ybWFsbHkgdGhp
cyBDTUEgY2FuIGJlIHVzZWQNCmluIHRoZSBrZXJuZWwuIEluIHRoZSBTVlAgY2FzZSB3ZSB1c2Ug
Y21hX2FsbG9jIHRvIGdldCBpdCBhbmQgcGFzcyB0aGUNCmVudGlyZSBDTUEgcGh5c2ljYWwgc3Rh
cnQgYWRkcmVzcyBhbmQgc2l6ZSBpbnRvIFRFRSB0byBwcm90ZWN0IHRoZSBDTUENCnJlZ2lvbi4g
VGhlIG9yaWdpbmFsIENNQSBoZWFwIGNhbm5vdCBoZWxwIHdpdGggdGhlIFRFRSBwYXJ0Lg0KDQpU
aGFua3MuDQoNCj4gVGhhbmtzLA0KPiBWaWpheQ0KPiANCj4gDQo+IA0K
