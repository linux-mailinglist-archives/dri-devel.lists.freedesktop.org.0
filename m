Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A23715B35
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 12:14:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7393410E387;
	Tue, 30 May 2023 10:14:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E84910E141
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 10:14:50 +0000 (UTC)
X-UUID: cd04c82cfed211edb20a276fd37b9834-20230530
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=xMWCuGT7Bnhp/aCA9XIIxYAdDJuiMdqTenPg+DwaiTs=; 
 b=HgOau6tK0xwtBZijR5zrcdTlk9wy1wZqhpW64kqgKtfEg8pN3g9sMXv2jYE9g/wzbkeYDpXgtCX7m97iwzTj4Kr8yz7Hj1al10pvJjF/Zz+ceLfp5/kL5Mv2BW+vqkxd/qufuwfR6ZkFiFvJwo5VfinOBSAPMidbJhdnYawPMOA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25, REQID:80389103-be4b-4d3e-8419-8504dedd41bd, IP:0,
 U
 RL:0,TC:51,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
 ON:release,TS:26
X-CID-META: VersionHash:d5b0ae3, CLOUDID:8fc8ff3c-7aa7-41f3-a6bd-0433bee822f3,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:4,Content:0,EDM:-3,IP:nil,URL
 :11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 3,BAP
X-CID-BAS: 3,BAP,0,_
X-UUID: cd04c82cfed211edb20a276fd37b9834-20230530
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw02.mediatek.com (envelope-from <xiaoyong.lu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1927106857; Tue, 30 May 2023 18:14:45 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 30 May 2023 18:14:44 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Tue, 30 May 2023 18:14:44 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eBm8UwQnEP7MPSKRUfY9zJcokbqHAyxEKaEr6v8ZyMG442RiBC0u2Ej2Zcmx0RpQuoUi0o5cDQfWCEvfN94UoKrOzUphr+mPR3ouzOaj+k6WjnzyGv0m4PGm1fpeLzvZq4MhV2gwMdtcmZXadzk38Zkcw9J5jsCDvme7ai1sxNbS9KERB54y8FKAJFDcSiaJXRFl2CN+k9jnTA2XJICjCoFjsGxdx0BFU91MYcpCOwhh580SGlsEUGOkJsDsNHvr3bMtYfoBttduXLrkBfO2id97616fephwQ8nyV/UQbVSfjLMUlgJ/vJ1213JgOg6xOB5GqTPKuM4NOmqoS+USZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oZ33cOQBlToN1kBA/4tqz6BljREUGzh2mo+OeUZNGs8=;
 b=JiUf7ggUpiZ8Tmsk3k/OvyRsCxH6Wo/lr8i9U4dnsAYzOVosvFA3MZwfhX0mAlFHwLSZRUqPaZ8KzawqRUSbvazScqgoYFrZ7RfbDcGWP5GGVAO3nEfsGveV7nj3lNej6FqB3c6gWVBAGASZcem/j7dkM9ppTZr/RgwLqfyL5oX6Sw89c9jFnSgKRO285D5KsQWg906wv1/LcJB9Vcyr86COhAztGZT7G5EUp2AXiMogIyZyoOjJoql5WSLkHMtgUAjO0eCArp4fkwq5qqNWVaFwen4e2n54yh5uAmPLVpfMVlhy2dZguvkHpbxwALWbpTezttq4Kcx66TaLWMP48A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oZ33cOQBlToN1kBA/4tqz6BljREUGzh2mo+OeUZNGs8=;
 b=R07iS1+ZDEaXdIprqbSc3WI5bJ88GqkCsRvavlrtkB3ckT3KgtQr5cBcE0MC4w6hmzauJ0BEoNNr2E3oL1I0QtTIrTZyEiFv5h396QzG1hG+9bX7nFHx4yVpQL492zUwgSYWrnY64Mf53TJkBMNw8WIY0PYMhoIPMnbSKikspL8=
Received: from PSAPR03MB5590.apcprd03.prod.outlook.com (2603:1096:301:90::8)
 by PUZPR03MB6215.apcprd03.prod.outlook.com (2603:1096:301:bb::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.14; Tue, 30 May
 2023 10:14:40 +0000
Received: from PSAPR03MB5590.apcprd03.prod.outlook.com
 ([fe80::d73f:c47d:c086:975b]) by PSAPR03MB5590.apcprd03.prod.outlook.com
 ([fe80::d73f:c47d:c086:975b%7]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 10:14:40 +0000
From: =?utf-8?B?WGlhb3lvbmcgTHUgKOWNouWwj+WLhyk=?= <Xiaoyong.Lu@mediatek.com>
To: "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "nicolas@ndufresne.ca"
 <nicolas@ndufresne.ca>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 =?utf-8?B?VGlmZmFueSBMaW4gKOael+aFp+ePiik=?= <tiffany.lin@mediatek.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 =?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>,
 "tfiga@google.com" <tfiga@google.com>, "benjamin.gaignard@collabora.com"
 <benjamin.gaignard@collabora.com>, "hverkuil-cisco@xs4all.nl"
 <hverkuil-cisco@xs4all.nl>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, =?utf-8?B?QW5kcmV3LUNUIENoZW4gKOmZs+aZuui/qik=?=
 <Andrew-CT.Chen@mediatek.com>, "acourbot@chromium.org"
 <acourbot@chromium.org>
Subject: Re: [v10] media: mediatek: vcodec: support stateless AV1 decoder
Thread-Topic: [v10] media: mediatek: vcodec: support stateless AV1 decoder
Thread-Index: AQHZbqtqIf9Ea86z3EunuPC/vfM3n69stziAgAYqhoA=
Date: Tue, 30 May 2023 10:14:39 +0000
Message-ID: <8ce10e2c186bcb3eef9dd443ce90f42680da1497.camel@mediatek.com>
References: <20230414083020.22219-1-xiaoyong.lu@mediatek.com>
 <bdee7988-3551-4011-f93e-c4dd1e4ee76b@xs4all.nl>
In-Reply-To: <bdee7988-3551-4011-f93e-c4dd1e4ee76b@xs4all.nl>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5590:EE_|PUZPR03MB6215:EE_
x-ms-office365-filtering-correlation-id: dc10d869-1e11-4b77-8948-08db60f6adf6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Vn686vsbRyBHBPNwJkoJmU3Ha1MNm8DaK8BQmo69sfOG/yNDZGqMp6vMX/jlpFzL84uvmfJrybTh+C/Y+zrqevpHc8kTbUI3urthBU3xwGFJ3TXZhiVcAHBPufgaYGPPuAVU71nMEkB8Xwq7F3cH7VXmINSkjhIBizuK2zYuaaEpVoorRWOvmyMZN9yU8WMKfwV6Un4Ia4scyDmmogtAxLUdxwNzrDXGqUt4G0lJX3S5MUsScIDe+sC+PO9KXA71tqNOAcE/9d81uzeNXP1hR3CQeC0H0nhmL1w0/8YlC3XNBmMfRlqRHUmlA2RaTCAjU8scXej1m07gw76MI9w34rM1Wnj2s9DFcltprsxLnLDxDA4Y9evr/wZREZx1uzmI9AEkcLs59FKyNCnkbl6LrwW6+29IBxcPtgUOTZslik/kAA2Nx+HowGTAMNFiWtdw5aXy+x0b7/LP4azsKnvTJwQc7p77ykxrKbZ3pSWyt5K9hwFNZLIC7jr4QpMf+yOastqYP5T3aIJjUBFJqy8J2QCMdayk9jMY0F/rb8QArzPltpp+rnOst0msDJ1/YOoXfPrlX0wUS8S/OOsD9X+oL0AFu97GucdR3cdTnt/jf9W72mgsDAS0LFL6mausge8BOPSkZp1RetEosJ9PwQZYjrwfgP6Mp6HgiaRqJmjsclDuRdkrD/eDhB0autUbnpFG
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR03MB5590.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(366004)(346002)(376002)(136003)(39860400002)(451199021)(186003)(26005)(38100700002)(6512007)(6506007)(6486002)(122000001)(53546011)(107886003)(71200400001)(54906003)(478600001)(110136005)(921005)(2616005)(83380400001)(316002)(4326008)(66556008)(66446008)(86362001)(7416002)(8936002)(66476007)(8676002)(64756008)(5660300002)(2906002)(41300700001)(76116006)(91956017)(66946007)(38070700005)(36756003)(85182001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UTZUUnpJL2d4K3ZGdDB4Rlc3T1VUSk1yeXRUV015ZGdiWlhYa1NTemRTN2dC?=
 =?utf-8?B?bExxMHFCYWJUTEVOWi9kTll0bnRqTDgybHZ1VGJhQjNlMStKaGE3SVV0OTN1?=
 =?utf-8?B?NTNuRUxkOWcwdmRScW9XdDAwR0FiSTFIZkhKdHZBa0daamhVN1JRTHZTemFi?=
 =?utf-8?B?S1hZK0xRWjVvaStCUDJnZGliL012dHRRVmdyTDFDRHY4SWFiaDZ2TUg4Tm1K?=
 =?utf-8?B?K293LzVFd2lpWHZ2eVZXdEJRWU4vbzB6Z29zQmtmdnMxSFI3RFQwV2haS3dG?=
 =?utf-8?B?ZUE3Y0lVdjBlTGRDREUrTlVKVFhaYmZHSkN5Q1R6UVJ4c0JmeFF3anpsZG1R?=
 =?utf-8?B?djlRdU9GTEhtbnZCcDlya2xWb1dmRFdPa0ZtTVlyNTdiVlNjK1BiREJUamg4?=
 =?utf-8?B?RitHcUNGSXRIcFdJMUFyTksrU3p1R2FkRTE1WVVvcEFPWGtkUTBwZzQ3OThY?=
 =?utf-8?B?Vis4Y010T0pSL2lwa2N6dXA3ZHpjeHdKM3MzajJJcFFwUGJyM3Q1SjZYR05L?=
 =?utf-8?B?T3ZDeGgwR2crb2tSb2Qzc0RJV2p4UEFZaFZ4NFk4K3AvbEgvWjFxOS9qT3kx?=
 =?utf-8?B?YWN1THUxdnFoV2IxSnpnN0ZycWNPOTFjSnhPcGtTRmhMZ2VQZ1JWQnZpM0Jh?=
 =?utf-8?B?RytLT2dhbCtxUUgrSnpEZ0thc1pQaEQyNUUyVFkwY1NlUTNvV1FLOGJRZ2pD?=
 =?utf-8?B?NTU0NlRVZEdOcjY1UW1EQ2dmblA3V2psUGxLcXZKS3dMU1JNVitnRHlzMmdH?=
 =?utf-8?B?b2hkU3V2cDVzc2VuTktOWEwvU0FVemNGdGhqQ2E1a3JINFpWKzJkR3poT3or?=
 =?utf-8?B?VmRWdjFGTjlPaC9icGxnQkdRWG0xd0o2RjZEWjA3cEl0YVFIb0RndXkvTFpu?=
 =?utf-8?B?a01YSTB1bGhuNlV2T0k1Tmk1RFZldXh0Qi90eE1UdnNxUU0zTURrbC9lQnp0?=
 =?utf-8?B?V1IzYXNoRzZwMU1lTmxvVEV0SVA4d2ZmeUdlZCs0YUQ1UHhrZ2VHTkdzZVhS?=
 =?utf-8?B?YkNwMk4wMEg1REtremYza3o2QmdBU2UvTG1YVGhDQ3B6RkovYXlhYmdZTEQv?=
 =?utf-8?B?dFNqNzEwLzBlTEp0cUFlNjZzaUVaSm1mZHhZZm5NajlNbHBCa1FmK21Od0tJ?=
 =?utf-8?B?ZUdhUUQxMnpPeVJOMzdEWnUzMEk3amQ5cUFHd254eVhZV3FtWTZMSGpMTHpo?=
 =?utf-8?B?ejF3K2k4ajFjZWtwRXRwOThZQlVlSjhWbUlqTkFWaFB6T0JJcmJGblFlWi9s?=
 =?utf-8?B?cWZNWUtGWFR4QTJQRktES1lYbHo4NlQrRHYraGpRNlB4dDVZS0UwSHVkM3Ni?=
 =?utf-8?B?UGFQMytkK0hKTW5OUVZEMlBzWnQxQWtCTFA3NVIrL2lvTVhvZGQ1ME8yWGxh?=
 =?utf-8?B?bCtNcEl3c3Yxd21vS3dUanY1NzUvc3IyeXlubzdsUnF5aUNKSCtMcnA2cTVB?=
 =?utf-8?B?UzkyRVY2UThxWDR5TGd2bXQ0cnBCODc1Umd2L1hvek1Xd3BHL1F6VFkzbytO?=
 =?utf-8?B?Nm9UVWZPcmVIN0VOVDcxcW1aVVp0L1dFdVhBYXFqNndIZWJxd1V5YWFQK05S?=
 =?utf-8?B?aUNhZ204OGZubTFHYnR2dHpWNDBtUDRhYTFhc2xMTzBZU2FwZ0NkekFMaFQz?=
 =?utf-8?B?cE9IQmxIQnZma1Mrb0JJQUIrWnpLV0lFSDNCZ0VsaWlSdU8yWFNISGQ3MUxy?=
 =?utf-8?B?NndvWFhnVFhXbUZyZkZxRDM0Ykd2b3JvZmR6WmJaLzFGZWd3b0kvaXkwMHBh?=
 =?utf-8?B?cEl3Q25sZGVTbUg2NU0vRDFDNFUzZklrWHlUQXg3S2xIVEMzRHJiNEVWMGc4?=
 =?utf-8?B?RmQ2MFNENGlrZEd3MjhDWHk5OWU3emRLWFE2OXhhRFVqNG16akZ3VDdhQ0R3?=
 =?utf-8?B?UFpsdUxrMzRLbEZ2M1NrVjFsOUtwZFZxcWFoeW15Q0E4NE9sOUd3dFNQcW4x?=
 =?utf-8?B?bmdBR0xETVpWUTVtUHlYSlFUbTNqUUlzVzUyY1V4TG5MZWtWbkxLV0pwbHlo?=
 =?utf-8?B?dGpQTXRkWFh3aVBTTU9mZ1dpejlTWklVbUtjaVhTZ0lNTmRxZ3ZrRG5EMlAz?=
 =?utf-8?B?dDY4Q2dnL1E2OFF2ZTE3OEwrTzdqcXpaWENWSG1Lb3ZRUXljK1BuazBUcUVS?=
 =?utf-8?B?b1I4SnV0U1pkdkYwVmlWZ1pVSDc5UEdaZk1xRmp6RjlBUkF1QlZwUzJGNlcw?=
 =?utf-8?B?TUE9PQ==?=
Content-Type: multipart/alternative;
 boundary="_000_8ce10e2c186bcb3eef9dd443ce90f42680da1497camelmediatekco_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5590.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc10d869-1e11-4b77-8948-08db60f6adf6
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2023 10:14:39.9389 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: msATelPIqbQEmqOMv9us6zYkJ3opjxu8dVKiXT2gvR/CQq74GUurGrNEsl8Q0GLu0CEmu5Jaqv5xbNJb8cLLGDseX5BWJH9Xjd4ifQxihCw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR03MB6215
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
 =?utf-8?B?R2VvcmdlIFN1biAo5a2Z5p6XKQ==?= <George.Sun@mediatek.com>,
 "stevecho@chromium.org" <stevecho@chromium.org>,
 =?utf-8?B?SXJ1aSBXYW5nICjnjovnkZ4p?= <Irui.Wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "hsinyi@chromium.org" <hsinyi@chromium.org>,
 "frkoenig@chromium.org" <frkoenig@chromium.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_8ce10e2c186bcb3eef9dd443ce90f42680da1497camelmediatekco_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgSGFucywgSSBoYXZlIHVwZGF0ZWQgdjExIHBhdGNoIHRvIGZpeCB0aGlzLiBUaGFua3MhIGJl
c3QgcmVnYXJkcyB4aWFveW9uZyBMdSBPbiBGcmksIDIwMjMtMDUtMjYgYXQgMTQ6MDQgKzAyMDAs
IEhhbnMgVmVya3VpbCB3cm90ZToNCkV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGlj
ayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsIHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBz
ZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQoNCk9uIDE0LzA0LzIwMjMgMTA6MzAsIFhpYW95b25nIEx1
IHdyb3RlOg0KDQo+IEFkZCBtZWRpYXRlayBhdjEgZGVjb2RlciBsaW51eCBkcml2ZXIgd2hpY2gg
dXNlIHRoZSBzdGF0ZWxlc3MgQVBJIGluDQoNCj4gTVQ4MTk1Lg0KDQo+DQoNCj4gU2lnbmVkLW9m
Zi1ieTogWGlhb3lvbmcgTHU8eGlhb3lvbmcubHVAbWVkaWF0ZWsuY29tPg0KDQo+IFRlc3RlZC1i
eTogTmljb2xhcyBEdWZyZXNuZSA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY29tPg0KDQo+
IFJldmlld2VkLWJ5OiBOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1ZnJlc25lQGNvbGxhYm9y
YS5jb20+DQoNCj4gVGVzdGVkLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8YW5nZWxv
Z2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPg0KDQo+IFJldmlld2VkLWJ5OiBBbmdl
bG9HaW9hY2NoaW5vIERlbCBSZWdubyA8YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJv
cmEuY29tPg0KDQoNCkFmdGVyIHJlYmFzaW5nIG9uIHRvcCBvZiBvdXIgbWVkaWEgc3RhZ2luZyB0
cmVlIEkgZ2V0IHRoZXNlIGNvbXBpbGUgZXJyb3JzOg0KDQoNCiAgQ0MgW01dICBkcml2ZXJzL21l
ZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy92ZGVjL3ZkZWNfYXYxX3JlcV9sYXRfaWYubw0K
DQpkcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy92ZGVjL3ZkZWNfYXYxX3Jl
cV9sYXRfaWYuYzogSW4gZnVuY3Rpb24g4oCYdmRlY19hdjFfc2xpY2VfbGF0X2RlY29kZeKAmToN
Cg0KZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay92Y29kZWMvdmRlYy92ZGVjX2F2MV9y
ZXFfbGF0X2lmLmM6MjA3NTo0NjogZXJyb3I6IOKAmHN0cnVjdCBtdGtfdmNvZGVjX2RlduKAmSBo
YXMgbm8gbWVtYmVyIG5hbWVkIOKAmG1zZ19xdWV1ZV9jb3JlX2N0eOKAmQ0KDQogMjA3NSB8ICAg
ICAgICAgICAgICAgICB2ZGVjX21zZ19xdWV1ZV9xYnVmKCZjdHgtPmRldi0+bXNnX3F1ZXVlX2Nv
cmVfY3R4LCBsYXRfYnVmKTsNCg0KICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBefg0KDQpkcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zj
b2RlYy92ZGVjL3ZkZWNfYXYxX3JlcV9sYXRfaWYuYzoyMTE0OjQ2OiBlcnJvcjog4oCYc3RydWN0
IG10a192Y29kZWNfZGV24oCZIGhhcyBubyBtZW1iZXIgbmFtZWQg4oCYbXNnX3F1ZXVlX2NvcmVf
Y3R44oCZDQoNCiAyMTE0IHwgICAgICAgICAgICAgICAgIHZkZWNfbXNnX3F1ZXVlX3FidWYoJmN0
eC0+ZGV2LT5tc2dfcXVldWVfY29yZV9jdHgsIGxhdF9idWYpOw0KDQogICAgICB8ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+DQoNCg0KVGhhdCdzIGR1ZSB0
byB0aGUgcGF0Y2ggIm1lZGlhOiBtZWRpYXRlazogdmNvZGVjOiBtb3ZlIGNvcmUgY29udGV4dCBm
cm9tIGRldmljZQ0KDQp0byBlYWNoIGluc3RhbmNlIiB0aGF0IGhhcyBub3cgYmVlbiBtZXJnZWQg
YW5kIHRoYXQgZHJvcHMgdGhhdCBxdWV1ZS4NCg0KDQpDYW4geW91IHJlYmFzZSB2MTA/IFRoaXMg
aXMgbm93IHRoZSBvbmx5IHJlbWFpbmluZyBibG9ja2VkIGZvciB0aGUgYXYxIHNlcmllcw0KDQp0
byBiZSBtZXJnZWQuDQoNCg0KUmVnYXJkcywNCg0KDQpIYW5zDQoNCg==

--_000_8ce10e2c186bcb3eef9dd443ce90f42680da1497camelmediatekco_
Content-Type: text/html; charset="utf-8"
Content-ID: <8E0E57112AAC41449CBA5EE56143AD08@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWwgZGlyPSJsdHIiPg0KPGhlYWQ+DQo8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUi
IGNvbnRlbnQ9InRleHQvaHRtbDsgY2hhcnNldD11dGYtOCI+DQo8L2hlYWQ+DQo8Ym9keSBzdHls
ZT0idGV4dC1hbGlnbjpsZWZ0OyBkaXJlY3Rpb246bHRyOyI+DQo8ZGl2PkhpIEhhbnMsIEkgaGF2
ZSB1cGRhdGVkIHYxMSBwYXRjaCB0byBmaXggdGhpcy4gVGhhbmtzISBiZXN0IHJlZ2FyZHMgeGlh
b3lvbmcgTHUgT24gRnJpLCAyMDIzLTA1LTI2IGF0IDE0OjA0ICswMjAwLCBIYW5zIFZlcmt1aWwg
d3JvdGU6PC9kaXY+DQo8YmxvY2txdW90ZSB0eXBlPSJjaXRlIiBzdHlsZT0ibWFyZ2luOjAgMCAw
IC44ZXg7IGJvcmRlci1sZWZ0OjJweCAjNzI5ZmNmIHNvbGlkO3BhZGRpbmctbGVmdDoxZXgiPg0K
PHRhYmxlIGNsYXNzPSJNc29Ob3JtYWxUYWJsZSIgYm9yZGVyPSIwIiBjZWxsc3BhY2luZz0iMCIg
Y2VsbHBhZGRpbmc9IjAiIGFsaWduPSJsZWZ0IiB3aWR0aD0iMTAwJSIgc3R5bGU9IndpZHRoOjEw
MC4wJTtiYWNrZ3JvdW5kOiM3N0ZGQ0MiPg0KPHRib2R5Pg0KPHRyPg0KPHRkIHdpZHRoPSI5IiBz
dHlsZT0id2lkdGg6Ny4wcHQ7YmFja2dyb3VuZDojRUEwNjIxO3BhZGRpbmc6NS4yNXB0IDEuNXB0
IDUuMjVwdCAxLjVwdCI+DQo8L3RkPg0KPHRkIHdpZHRoPSIxMDAlIiBzdHlsZT0id2lkdGg6MTAw
LjAlO2JhY2tncm91bmQ6I0ZGRDRENDtwYWRkaW5nOjUuMjVwdCAzLjc1cHQgNS4yNXB0IDExLjI1
cHQiPg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJtc28tZWxlbWVudDpmcmFt
ZTttc28tZWxlbWVudC1mcmFtZS1oc3BhY2U6Mi4yNXB0O21zby1lbGVtZW50LXdyYXA6YXJvdW5k
O21zby1lbGVtZW50LWFuY2hvci12ZXJ0aWNhbDpwYXJhZ3JhcGg7bXNvLWVsZW1lbnQtYW5jaG9y
LWhvcml6b250YWw6Y29sdW1uO21zby1oZWlnaHQtcnVsZTpleGFjdGx5Ij4NCjxzcGFuIGxhbmc9
IkVOLVVTIiBzdHlsZT0iZm9udC1zaXplOjkuNXB0O2ZvbnQtZmFtaWx5OiZxdW90O1NlZ29lIFVJ
JnF1b3Q7LHNhbnMtc2VyaWY7Y29sb3I6IzIxMjEyMSI+RXh0ZXJuYWwgZW1haWwgOiBQbGVhc2Ug
ZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVy
aWZpZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC48bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8
L2Rpdj4NCjwvdGQ+DQo8L3RyPg0KPC90Ym9keT4NCjwvdGFibGU+DQo8IS0tfS0tPg0KPHByZT5P
biAxNC8wNC8yMDIzIDEwOjMwLCBYaWFveW9uZyBMdSB3cm90ZTo8L3ByZT4NCjxwcmU+Jmd0OyBB
ZGQgbWVkaWF0ZWsgYXYxIGRlY29kZXIgbGludXggZHJpdmVyIHdoaWNoIHVzZSB0aGUgc3RhdGVs
ZXNzIEFQSSBpbjwvcHJlPg0KPHByZT4mZ3Q7IE1UODE5NS48L3ByZT4NCjxwcmU+Jmd0OyA8L3By
ZT4NCjxwcmU+Jmd0OyBTaWduZWQtb2ZmLWJ5OiBYaWFveW9uZyBMdSZsdDt4aWFveW9uZy5sdUBt
ZWRpYXRlay5jb20mZ3Q7PC9wcmU+DQo8cHJlPiZndDsgVGVzdGVkLWJ5OiBOaWNvbGFzIER1ZnJl
c25lICZsdDtuaWNvbGFzLmR1ZnJlc25lQGNvbGxhYm9yYS5jb20mZ3Q7PC9wcmU+DQo8cHJlPiZn
dDsgUmV2aWV3ZWQtYnk6IE5pY29sYXMgRHVmcmVzbmUgJmx0O25pY29sYXMuZHVmcmVzbmVAY29s
bGFib3JhLmNvbSZndDs8L3ByZT4NCjxwcmU+Jmd0OyBUZXN0ZWQtYnk6IEFuZ2Vsb0dpb2FjY2hp
bm8gRGVsIFJlZ25vICZsdDthbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20m
Z3Q7PC9wcmU+DQo8cHJlPiZndDsgUmV2aWV3ZWQtYnk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJl
Z25vICZsdDthbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20mZ3Q7PC9wcmU+
DQo8cHJlPjxicj48L3ByZT4NCjxwcmU+QWZ0ZXIgcmViYXNpbmcgb24gdG9wIG9mIG91ciBtZWRp
YSBzdGFnaW5nIHRyZWUgSSBnZXQgdGhlc2UgY29tcGlsZSBlcnJvcnM6PC9wcmU+DQo8cHJlPjxi
cj48L3ByZT4NCjxwcmU+ICBDQyBbTV0gIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsv
dmNvZGVjL3ZkZWMvdmRlY19hdjFfcmVxX2xhdF9pZi5vPC9wcmU+DQo8cHJlPmRyaXZlcnMvbWVk
aWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL3ZkZWMvdmRlY19hdjFfcmVxX2xhdF9pZi5jOiBJ
biBmdW5jdGlvbiDigJh2ZGVjX2F2MV9zbGljZV9sYXRfZGVjb2Rl4oCZOjwvcHJlPg0KPHByZT5k
cml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy92ZGVjL3ZkZWNfYXYxX3JlcV9s
YXRfaWYuYzoyMDc1OjQ2OiBlcnJvcjog4oCYc3RydWN0IG10a192Y29kZWNfZGV24oCZIGhhcyBu
byBtZW1iZXIgbmFtZWQg4oCYbXNnX3F1ZXVlX2NvcmVfY3R44oCZPC9wcmU+DQo8cHJlPiAyMDc1
IHwgICAgICAgICAgICAgICAgIHZkZWNfbXNnX3F1ZXVlX3FidWYoJmFtcDtjdHgtJmd0O2Rldi0m
Z3Q7bXNnX3F1ZXVlX2NvcmVfY3R4LCBsYXRfYnVmKTs8L3ByZT4NCjxwcmU+ICAgICAgfCAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefjwvcHJlPg0KPHByZT5k
cml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy92ZGVjL3ZkZWNfYXYxX3JlcV9s
YXRfaWYuYzoyMTE0OjQ2OiBlcnJvcjog4oCYc3RydWN0IG10a192Y29kZWNfZGV24oCZIGhhcyBu
byBtZW1iZXIgbmFtZWQg4oCYbXNnX3F1ZXVlX2NvcmVfY3R44oCZPC9wcmU+DQo8cHJlPiAyMTE0
IHwgICAgICAgICAgICAgICAgIHZkZWNfbXNnX3F1ZXVlX3FidWYoJmFtcDtjdHgtJmd0O2Rldi0m
Z3Q7bXNnX3F1ZXVlX2NvcmVfY3R4LCBsYXRfYnVmKTs8L3ByZT4NCjxwcmU+ICAgICAgfCAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefjwvcHJlPg0KPHByZT48
YnI+PC9wcmU+DQo8cHJlPlRoYXQncyBkdWUgdG8gdGhlIHBhdGNoICZxdW90O21lZGlhOiBtZWRp
YXRlazogdmNvZGVjOiBtb3ZlIGNvcmUgY29udGV4dCBmcm9tIGRldmljZTwvcHJlPg0KPHByZT50
byBlYWNoIGluc3RhbmNlJnF1b3Q7IHRoYXQgaGFzIG5vdyBiZWVuIG1lcmdlZCBhbmQgdGhhdCBk
cm9wcyB0aGF0IHF1ZXVlLjwvcHJlPg0KPHByZT48YnI+PC9wcmU+DQo8cHJlPkNhbiB5b3UgcmVi
YXNlIHYxMD8gVGhpcyBpcyBub3cgdGhlIG9ubHkgcmVtYWluaW5nIGJsb2NrZWQgZm9yIHRoZSBh
djEgc2VyaWVzPC9wcmU+DQo8cHJlPnRvIGJlIG1lcmdlZC48L3ByZT4NCjxwcmU+PGJyPjwvcHJl
Pg0KPHByZT5SZWdhcmRzLDwvcHJlPg0KPHByZT48YnI+PC9wcmU+DQo8cHJlPkhhbnM8L3ByZT4N
CjxwcmU+PGJyPjwvcHJlPg0KPC9ibG9ja3F1b3RlPg0KPC9ib2R5Pg0KPC9odG1sPg0KPCEtLXR5
cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioqKioqIE1FRElBVEVLIENvbmZpZGVudGlh
bGl0eSBOb3RpY2UNCiAqKioqKioqKioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNvbnRh
aW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVudHMp
IG1heSBiZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndp
c2UNCmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBp
bnRlbmRlZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50
KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJl
dGFpbmluZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0YWNo
bWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQg
YW5kIG1heSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGll
bnQgb2YgdGhpcyBlLW1haWwsIG9yIGJlbGlldmUNCiANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQg
dGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0
ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3Bp
ZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3Vy
IHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwg
dG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--_000_8ce10e2c186bcb3eef9dd443ce90f42680da1497camelmediatekco_--

