Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B66769BE4
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 18:09:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D116110E2C1;
	Mon, 31 Jul 2023 16:08:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0F3610E2C1
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 16:08:55 +0000 (UTC)
X-UUID: 8866be4e2fbc11eeb20a276fd37b9834-20230801
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=1Fx1QnB6SD/x1nOrBcpWvM7ynaGDgnjqwmU+f0nkqJU=; 
 b=PYa0kzgP8fUPVIeT3g/p2tpp7VL1W48SmQ51XTpFAA+edug+SN/91MsEAcC64T2MShXw0NxuYdLWvUNkTaBlOIQV+b2zMfAS1KKBgsKkZ4p1e9yTlj89P0IKUZECgA/hI6gLoF8bkeM+D5UNsGQZxspeqiNMl+ePfGzX3zVHm5Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.30, REQID:60ea0c56-62b2-4da2-8664-f92eee11e8b8, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:45
X-CID-INFO: VERSION:1.1.30, REQID:60ea0c56-62b2-4da2-8664-f92eee11e8b8, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:45
X-CID-META: VersionHash:1fcc6f8, CLOUDID:b85986d2-cd77-4e67-bbfd-aa4eaace762f,
 B
 ulkID:230801000850EN773F86,BulkQuantity:0,Recheck:0,SF:38|29|28|17|19|48|1
 02,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,C
 OL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:PA,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_SNR,TF_CID_SPAM_SDM
X-UUID: 8866be4e2fbc11eeb20a276fd37b9834-20230801
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 916956378; Tue, 01 Aug 2023 00:08:48 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 1 Aug 2023 00:08:47 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Tue, 1 Aug 2023 00:08:47 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EWwWRCtzW5rYQrmzqxZfOFlzh4/pnfmiYX3FPL7SB2NYTnBEddcOyc181ltl3KNLgr0KebtpCMnBMaXGo3J3nKj40rKOgckcg1mOvtv2O+MzxdlbIqin90C1ipo+RPLyqGBsm+CMGvvNZw1yEJOERMBpUUG8eWEA7ssa7HYBP+Iq3SblwIUrTOaC/WreSOrFgRckNSfiy11iAk49QuWm1S2xkkNxEf/AqJ6JUypMwn1GkRRN55V0Thae6xV8EqNMEPJ9jo9aFuUbVV5u3re7NywkAt5hXoFWVbJJu/4Q94DGKEccBjYOzeGY+7A5YY7OVM5sOAYWtL8pfs+4Kk6ASg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZL76TwOPd5n04TwTshLEY7XO8K1YINraR0BJnkVmIOE=;
 b=iRakJ3TuRMQ4NsOMgvNU+EC4l2JYQsVVnPTo//3BR3SJfZFY4VkWoyuAhtMfBDY1XL3cEk+NdTDoOd85rn8JUqAsFQk6Q3EPKVZeGp3w5Ntlm/g38z3TK9Cgm7TA86rQ4316Dg28QNMCeFBntdD8Xuk6geOmoJM15rXbj2AZZdF/Y5A9/vfhATNEYcbV27cCcMUBPbSXVMzoSHvH0NhbBXjacW6BJygFBmsmjY0NS4Ycg3r+TdaWGMmMws9yYT0GeZmxEDkZppZdsubwB3E0BQN1RSDopWXxe6QMBSQTMONLo7EHLhpImVnLqg0fzj40giRpLKfeiCCTvKiIKNOylg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZL76TwOPd5n04TwTshLEY7XO8K1YINraR0BJnkVmIOE=;
 b=KH9B90kzKRZ3rJXhVIncohYuqdI5s0hZwowpMgRLY9+ww6WdqPwiJdWNIq9IDGUPMXYJxRbI3vWfFemJfp9stNPIuR79W1l/ULrm0sToImFTpI9Uv49ywQQ02PTd+xgkxRH2Zh5+EgrQCAPBVgOqNfXE7A7uFImaCazop9W+A2g=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by KL1PR03MB7287.apcprd03.prod.outlook.com (2603:1096:820:eb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.42; Mon, 31 Jul
 2023 16:08:44 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1b82:a45d:e171:62e8]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1b82:a45d:e171:62e8%4]) with mapi id 15.20.6631.042; Mon, 31 Jul 2023
 16:08:43 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>
Subject: Re: [PATCH v7 4/4] drm/mediatek: Add DSI support for mt8188 vdosys0
Thread-Topic: [PATCH v7 4/4] drm/mediatek: Add DSI support for mt8188 vdosys0
Thread-Index: AQHZwKk9rCnXfbM4+UmRlCb5hS3iHK/O1deAgAU7ZIA=
Date: Mon, 31 Jul 2023 16:08:43 +0000
Message-ID: <a1ec3ad4c5714d9e75375decf272ec677c05a5e4.camel@mediatek.com>
References: <20230727164114.20638-1-jason-jh.lin@mediatek.com>
 <20230727164114.20638-5-jason-jh.lin@mediatek.com>
 <3dca39b3-b152-34e7-8959-78fe68e1a899@collabora.com>
In-Reply-To: <3dca39b3-b152-34e7-8959-78fe68e1a899@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|KL1PR03MB7287:EE_
x-ms-office365-filtering-correlation-id: 981ef1b1-9ecb-41f8-7d0e-08db91e069cc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: d2qymbzK62t+QGOTXJIt2Mn6zM0/QxSc24ET1pFEzAucImr8m0bznurU8M5Mt2ZKt9ZPGJbA1PpPczg93KkLJvXmGh2wfxCWS3bbJc241pxqJ5yTTsF+hla9BW4MNgPFmmjUGHZgd087VoEC4zVx3VWCKsb38sxjeaXpOXrlH2IOQGtqMX0qSk1kApdkk8mRKplYjUvwPTP4818x06VnAtoChYcGwbER7zS41xRC13Vs5gIDBvhHFfRIboD15Cu5+sl2ocT/rrogE1BD9Qg3WCoyhL+92bKF8abYdadZTkfx9hsCLnZwIhN2Fp6JmwmQhBgkofZbzFcTRZlTxP7Fx6H3/tUR/OVDiPTjOcX6N7I4YqZ6IKeE6YNObvGtEPQtrqGSrQURQBmTToNwu1Z5mXTGDP44InO55/JWmJECVPSv/myoJw276wygmZ4W7gQm211CdlcfxjJx3ZSJolSdrpvSMtEMgUU5hAHTNguv8qh0MoOnKVBOwgMjgxzpP2EQ1CLK45SeimVRBxHbiiOoeqeIwQ/7IJtlY2rmzlevsrvJudlHO+5TrpRdYutVCoxQke2C4sqmweR7Ba/AXvNiyokoxX10sT25XcjDeyeDmxbfFGDyVqdQnSQKs7KY7VJbh5Kmoac4R7jZUnXd0wlHSB2PlWTDOzabZtJVF3J211A=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(366004)(376002)(136003)(346002)(39860400002)(451199021)(71200400001)(6486002)(83380400001)(2616005)(36756003)(85182001)(26005)(186003)(6506007)(6512007)(316002)(4744005)(41300700001)(38100700002)(122000001)(64756008)(66446008)(66476007)(4326008)(66556008)(2906002)(66946007)(91956017)(76116006)(5660300002)(86362001)(8676002)(8936002)(38070700005)(110136005)(54906003)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b1VNRVFHMkxJSjVEZXFVRGl3VnU4MmU5cFBsamdwa3RqZ1dBaDUybXlmcEE5?=
 =?utf-8?B?UlVkRC9pVy93b2UrREJDbGtJUXFEV2dHYnNqeUR5anpkdDFzLzN5RWxwcUxi?=
 =?utf-8?B?WGVyb3cvNVowTE9VS1IyTXMrU3ppRHlMYWhwdGhZMTZxRFhJWTJPQnFzeFN1?=
 =?utf-8?B?YnZydElLWEhUd1AzblE0ZjUvQVpXOEVRd0hlNkFwVGhJL1EyUEVoMGE0aW82?=
 =?utf-8?B?UVdkZEhOejJlR2IybWVHZ2VtSkVoaHNFWjBIcS9YeDNzakZQVjV1bXVUMlhC?=
 =?utf-8?B?YkQvNGZObUdvdmwvQ1RoVk9EYzRoditSdGM1UCt0TkttUVNoZkZYSzlpS0pD?=
 =?utf-8?B?Q2lOTlVZYWVNOFBIbmt5dGE3TExLTjd1TlNIVDF2WklkOXNUMnk2RmV0V3Zo?=
 =?utf-8?B?Y3NpWWJwdjlGa1Q0VDZQbk5FQXJpNEg2WTVNZFZJQ09uck9Jc0U1UXovWThk?=
 =?utf-8?B?Njd6L0dYd3FEVUJ5eXdxZWtNMmlRY0hKTmdZZHBYeEtEN21USmUxZi81Qjdn?=
 =?utf-8?B?eFVUUzY5bnlUbHowOVZSbGFtZUR4ZEs0elRNVGErSU1EanZXdVduVFZnc1Qw?=
 =?utf-8?B?KzlhK09SSXlQK2d4djRXQUhVWWtqQlAycExnRkM2S3o4aDRjT3ZMRkxLWGFk?=
 =?utf-8?B?T2tJN1dnSTF6dGNQaE1meG9vdmhSTWJmMWxuai9leTNqU2JXQnBCZUZjNWN0?=
 =?utf-8?B?RGdlY29MTUphRGJXdVRwcGIzTVlFZGMvQUZpYXBIcnRFSU1hK3ZNYjkzbm1C?=
 =?utf-8?B?YU9JTjJ5ZngxZEdTN21qeS9NbjA0OUNPSXV2REFmZ2FyVDJPQUgyRWdnSXAw?=
 =?utf-8?B?RjFyTEQycmF0TDdVVFBPTlBCSERwR0YwdjIwSDAvbUt4aitFOUI1dzV3NTF6?=
 =?utf-8?B?U1BYQkhZYnZPSWUyRk5xaG9DcDhJeEtRUHNKNnl2VS9tam05UTlLbDNJUVl5?=
 =?utf-8?B?ZnVuUDhLU3hrTzZxMVk3VWtmMTZuNWpsLzhCSFFxQXBvcVlublRJMXI4UmJT?=
 =?utf-8?B?Z1ErdHQ1dlVDOU9BcjFOcHRYaHVhRGQyZ0gwbUkzcG51M2NNOGdwYU1CMDRR?=
 =?utf-8?B?dGZ3SzYzTnh4REtuYmtZKys1RnkwV040N1pvYzlzSnBKL2Q0UGhrUXdTSERy?=
 =?utf-8?B?NDJDVFVLdlFHSWhjaGpuL24xNW5LOW5YaFVrY2pYdERkcVByVkpqSVVtUEd3?=
 =?utf-8?B?bWs0VUc3ampxRHlyajZMWFRXQnI3c2JjMWpTN3N3WVFTcE4rc0F0MFhoeHo5?=
 =?utf-8?B?Qk95T3FBUTBwa254ai9tN3l5RHBBakNXUXRxb2w4dE1OSjA3MWV3QlNoME9k?=
 =?utf-8?B?L3kvaG5zOFhoZnlpV3hQNHZVa1hjTHZiTGRGSXpyMDhBUkp1Q0JDc1pSNjZn?=
 =?utf-8?B?enRHT2NRRWducU9qRCsyWGt6K3RGQzF5eUZFK0JST1dKNHpEVmpaSzJseDdo?=
 =?utf-8?B?TmZZR0ZKTFdvajVLaVh4bGJ1b3VsQVF4ZTJlYlJIK29PSWtjTVR6V2NzaWdz?=
 =?utf-8?B?N0FnQjl3T1RUZFpTd2NQSVJDQUlTM0Uwbm96SWJudW5oMGZDVWdFa1RzSFAy?=
 =?utf-8?B?ejUzWSsyNi9OSXg1UW9hT29OTndUMlA4L0JGWnl3ZTVpVjc0VXQ1ZVFuaEJZ?=
 =?utf-8?B?TE1pSVNGZ01HN3U0VXloTEIwQk5lUUtra29aZUV0eGd0UU1pS09aclhwRnBU?=
 =?utf-8?B?dmVGTHNVdHhtV2tTWkhKcEwxTTNqdDE1RWFZdTdaV3N1RnBpNy9KbVhCT3li?=
 =?utf-8?B?eFZOd2IybXlxNzdZWTBLZGhya2p5V2s0Nk1TbzRaNEJ6SUlWSDVpT1N6VlBU?=
 =?utf-8?B?ekNPU01VK1IvdHJIeitkWEhFaTBkZXQ1WFNDbTFYVGVPZVZXMkFQeFMzbk5C?=
 =?utf-8?B?dXloV3BadUk1Wll0RVljZW9ONWx3MlU5eWpiVWFTdE84cFowN3VHblFHUnZ6?=
 =?utf-8?B?MDNKa2k3Kyt5aUQvb1V2RG50aHJKQnFRTGxKTHV3YXR1ZTc2Yit4NmlITFIx?=
 =?utf-8?B?dy9YVmtCYUFMdHZ4b2diekM4Z0pnWTVRdGQ5bTFPTnlqYjRoWkljbitYbFMv?=
 =?utf-8?B?ZWh4SzNoUFNwbEpIaWY5N0tBcXZxVC9lRWttVGhPclZWZGMvdnZKaHF4MjN2?=
 =?utf-8?B?dGc5SXhmQXVsY2pVWEdmZTlhV1FSUWlEdDlYUDNSTXBsaDhZckZYSDlnTnNS?=
 =?utf-8?B?R0E9PQ==?=
Content-ID: <D8B86956CC54EA4FB609FD9C0D5788E4@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 981ef1b1-9ecb-41f8-7d0e-08db91e069cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2023 16:08:43.6451 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PmVSurtC3/G1bcBI8tkLXcxqg9fmdbSTQu+ytBzEGrMSa7KFfmgkc6+s8FAUAuP5OY2Qx9xtkIdA6HdBOs4ExNFxc2gwSrURakuiQAHD4EI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7287
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_008_411970109.535975593"
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
Cc: =?utf-8?B?TmF0aGFuIEx1ICjlkYLmnbHpnJYp?= <Nathan.Lu@mediatek.com>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 =?utf-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?= <Jason-ch.Chen@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 =?utf-8?B?Sm9obnNvbiBXYW5nICjnjovogZbpkasp?= <Johnson.Wang@mediatek.com>,
 =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_008_411970109.535975593
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpJiMzMjtBbmdlbG8sDQoNClRoYW5rcyYjMzI7Zm9yJiMzMjt0aGUmIzMyO3Jldmll
d3MuDQoNCk9uJiMzMjtGcmksJiMzMjsyMDIzLTA3LTI4JiMzMjthdCYjMzI7MTA6MTQmIzMyOysw
MjAwLCYjMzI7QW5nZWxvR2lvYWNjaGlubyYjMzI7RGVsJiMzMjtSZWdubyYjMzI7d3JvdGU6DQom
Z3Q7JiMzMjtJbCYjMzI7MjcvMDcvMjMmIzMyOzE4OjQxLCYjMzI7SmFzb24tSkguTGluJiMzMjto
YSYjMzI7c2NyaXR0bzoNCiZndDsmIzMyOyZndDsmIzMyO0FkZCYjMzI7RFNJJiMzMjthcyYjMzI7
bWFpbiYjMzI7ZGlzcGxheSYjMzI7b3V0cHV0JiMzMjtmb3ImIzMyO210ODE4OCYjMzI7dmRvc3lz
MC4NCiZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtJJiMzMjt3b3VsZCYj
MzI7c3BsaXQmIzMyO3RoaXMmIzMyO2NvbW1pdCYjMzI7aW4mIzMyO3R3bzoNCiZndDsmIzMyOw0K
Jmd0OyYjMzI7MS4mIzMyO2RybS9tZWRpYXRlazomIzMyO2RzaTomIzMyO1N1cHBvcnQmIzMyO2R5
bmFtaWMmIzMyO2Nvbm5lY3RvciYjMzI7c2VsZWN0aW9uDQomZ3Q7JiMzMjsyLiYjMzI7ZHJtL21l
ZGlhdGVrOiYjMzI7U3VwcG9ydCYjMzI7RFNJJiMzMjtvbiYjMzI7TVQ4MTg4JiMzMjtWRE9TWVMw
DQomZ3Q7JiMzMjsNCk9LLCYjMzI7SSYjMzk7bGwmIzMyO3NlcGFyYXRlJiMzMjt0aGlzJiMzMjtj
b21taXQmIzMyO2xpa2UmIzMyO3RoaXMuDQoNClJlZ2FyZHMsDQpKYXNvbi1KSC5MaW4NCg0KJmd0
OyYjMzI7V2hlcmUmIzMyO3RoZSYjMzI7Zmlyc3QmIzMyO29uZSYjMzI7c2V0cyYjMzI7dXAmIzMy
O3RoZSYjMzI7bXRrX2RzaSYjMzI7ZHJpdmVyJiMzMjtmb3ImIzMyOy5lbmNvZGVyX2luZGV4KCks
DQomZ3Q7JiMzMjthbmQNCiZndDsmIzMyO3doZXJlJiMzMjt0aGUmIzMyO3NlY29uZCYjMzI7b25l
JiMzMjtpcyYjMzI7YSYjMzI7b25lLWxpbmVyJiMzMjtzaW1wbHkmIzMyO2FkZGluZyYjMzI7JiM5
Njt7MCwNCiZndDsmIzMyO0REUF9DT01QT05FTlRfRFNJMH0sJiM5NjsNCiZndDsmIzMyO3RvJiMz
Mjt0aGUmIzMyO01UODE4OCYjMzI7bWFpbiYjMzI7cm91dGVzJiMzMjthcnJheS4NCiZndDsmIzMy
Ow0KJmd0OyYjMzI7VGhlJiMzMjtyZWFzb24mIzMyO2lzJiMzMjt0aGF0JiMzMjtpZiYjMzI7eW91
JiMzMjtzcGxpdCYjMzI7aXQmIzMyO2xpa2UmIzMyO3RoYXQsJiMzMjt3aG9ldmVyJiMzMjtyZWFk
cyYjMzI7dGhlDQomZ3Q7JiMzMjtjb21taXQmIzMyO2hpc3RvcnkNCiZndDsmIzMyO3dpbGwmIzMy
O2ltbWVkaWF0ZWx5JiMzMjt1bmRlcnN0YW5kJiMzMjtob3cmIzMyO3RvJiMzMjthZGQmIzMyO2R5
bmFtaWMmIzMyO2Nvbm5lY3RvciYjMzI7c2VsZWN0aW9uJiMzMjt0bw0KJmd0OyYjMzI7YSYjMzI7
TVRLJiMzMjtEUk0NCiZndDsmIzMyO2RyaXZlciwmIzMyO2FuZCYjMzI7aG93JiMzMjt0byYjMzI7
cGVyZm9ybSYjMzI7dGhlJiMzMjtTb0Mtc3BlY2lmaWMmIzMyO2Nvbm5lY3Rpb24uLi4uDQomZ3Q7
JiMzMjsNCiZndDsmIzMyO1BsZWFzZSENCiZndDsmIzMyOw0KJmd0OyYjMzI7VGhhbmtzLA0KJmd0
OyYjMzI7QW5nZWxvDQomZ3Q7JiMzMjsNCg0KPC9wcmU+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+
PHByZT4qKioqKioqKioqKioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UgKioqKioq
KioqKioqKioqKioqKioNClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1haWwg
bWVzc2FnZSAoaW5jbHVkaW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFs
LCBwcm9wcmlldGFyeSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNj
bG9zdXJlIHVuZGVyIGFwcGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252
ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2Vt
aW5hdGlvbiwgDQpkaXN0cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBv
ZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVk
IHJlY2lwaWVudChzKSBpcyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1
bC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBv
ciBiZWxpZXZlIA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwg
cGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRo
aXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChp
bmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpk
aXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBU
aGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_008_411970109.535975593
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQW5nZWxvLA0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXdzLg0KDQpPbiBGcmksIDIwMjMtMDct
MjggYXQgMTA6MTQgKzAyMDAsIEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIHdyb3RlOg0KPiBJ
bCAyNy8wNy8yMyAxODo0MSwgSmFzb24tSkguTGluIGhhIHNjcml0dG86DQo+ID4gQWRkIERTSSBh
cyBtYWluIGRpc3BsYXkgb3V0cHV0IGZvciBtdDgxODggdmRvc3lzMC4NCj4gPiANCj4gDQo+IEkg
d291bGQgc3BsaXQgdGhpcyBjb21taXQgaW4gdHdvOg0KPiANCj4gMS4gZHJtL21lZGlhdGVrOiBk
c2k6IFN1cHBvcnQgZHluYW1pYyBjb25uZWN0b3Igc2VsZWN0aW9uDQo+IDIuIGRybS9tZWRpYXRl
azogU3VwcG9ydCBEU0kgb24gTVQ4MTg4IFZET1NZUzANCj4gDQpPSywgSSdsbCBzZXBhcmF0ZSB0
aGlzIGNvbW1pdCBsaWtlIHRoaXMuDQoNClJlZ2FyZHMsDQpKYXNvbi1KSC5MaW4NCg0KPiBXaGVy
ZSB0aGUgZmlyc3Qgb25lIHNldHMgdXAgdGhlIG10a19kc2kgZHJpdmVyIGZvciAuZW5jb2Rlcl9p
bmRleCgpLA0KPiBhbmQNCj4gd2hlcmUgdGhlIHNlY29uZCBvbmUgaXMgYSBvbmUtbGluZXIgc2lt
cGx5IGFkZGluZyBgezAsDQo+IEREUF9DT01QT05FTlRfRFNJMH0sYA0KPiB0byB0aGUgTVQ4MTg4
IG1haW4gcm91dGVzIGFycmF5Lg0KPiANCj4gVGhlIHJlYXNvbiBpcyB0aGF0IGlmIHlvdSBzcGxp
dCBpdCBsaWtlIHRoYXQsIHdob2V2ZXIgcmVhZHMgdGhlDQo+IGNvbW1pdCBoaXN0b3J5DQo+IHdp
bGwgaW1tZWRpYXRlbHkgdW5kZXJzdGFuZCBob3cgdG8gYWRkIGR5bmFtaWMgY29ubmVjdG9yIHNl
bGVjdGlvbiB0bw0KPiBhIE1USyBEUk0NCj4gZHJpdmVyLCBhbmQgaG93IHRvIHBlcmZvcm0gdGhl
IFNvQy1zcGVjaWZpYyBjb25uZWN0aW9uLi4uLg0KPiANCj4gUGxlYXNlIQ0KPiANCj4gVGhhbmtz
LA0KPiBBbmdlbG8NCj4gDQo=

--__=_Part_Boundary_008_411970109.535975593--

