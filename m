Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D3F7CD34A
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 06:54:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 846BC10E37D;
	Wed, 18 Oct 2023 04:54:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C80DF10E37D
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 04:54:39 +0000 (UTC)
X-UUID: 6f48b8886d7211ee8051498923ad61e6-20231018
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=wPYGWlOMVxVSyK8T5pULlkxSO+t1LMZqyo4QkM+ak+s=; 
 b=nk7UVvewDS+SMPvfc89FBBIrpY2tZWTkbM0K2uQj2uG66hEjwYxaw9yMIKrpTXgOqHuqfCUgbQIy+M1FbcuPbcWWp72vEsp8NFqs/2zfhXFZHsoYwI6DQuJK2A5GX+KHWUKFmSzHSld/ChqxE5PSsBEUaRZSWN341s7PHeHCRKY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:6257010f-053f-4629-97e0-4bbc324e3b29, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5f78ec9, CLOUDID:820910c0-14cc-44ca-b657-2d2783296e72,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 6f48b8886d7211ee8051498923ad61e6-20231018
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw02.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 189139400; Wed, 18 Oct 2023 12:54:35 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 18 Oct 2023 12:54:34 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Wed, 18 Oct 2023 12:54:33 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b5FEndQooTaIFbd5e+bbEpmhFndczakar9cSP0y90A3Qb+9AAMYhffDqxav+9zieEmnjFR6SbHmpYPAZdXIgLZN5U6cuA2KD12jCQOz95vaVT+a2P8tFEAOD6Ll98P51Wm0IJT3Noi7h0kopWqfLE3oMo76LP3iTq4bJ8KbQZXUP+vsqX7/eJhdH2CrZsa3NMUiDInACdhPVgeiy8FHf8eKCOdyXUCaJ7BYxN5fLnSNvp+oA3DhBLXVJoPSJaPEf2oM7AMrw1vErh8det5zvDtCw9Wb2trsxZox8yzijgaRbUnyRSaMYodSq7eRnhz2x6Gb1OMIx1nNecWysuwcGjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kDKgjHgfY4zWdJBUz3cAoGPG72qCj6zht4rklnnhK/k=;
 b=R6GSDnxd42fPIb/49/2BiWlLauocvEqQa8kboxdw30yJShqBmeMcSZOLgNEQqvngb3rSJWENCg//F4Z8H7O8Wq8EPLDOjqiHlqx5uyn9fEa3+ATyuQkzR0tLJssg+2Akgg7wNjYX3kVbu6jlQ/ydecrFPVt9oXZZ0IuYg9slDnDK1AV2wzlDy7oj3hwQOvsgsvNRiLYLy+jv3zNF6DAB+Y+O+ufAd9FFQIRqdWmDbuXJZQps2MHYuuN9UBCYBFOI5yIvf6xIvw6yoExGrcbUqsP+qQoF6oszcZ9+OtXejV8dRf5m/fhDUOrqBjZ7+IKj5Ae+3iM7h3JSMtpYgGJ3xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kDKgjHgfY4zWdJBUz3cAoGPG72qCj6zht4rklnnhK/k=;
 b=CceTSGnSs99Q8uutxChIyMJxejrImr4XYxoJkzPTdX28JSjvsFISfrStv/LX1oLr8bJ5jx/iiQsMlin9euUunzO9eKxGBg0ZQjeqOxQQvrTDs5VXRdrOqzYI2GLEo5HLf46czpTmSZib+6SthM+eoUXQz74yzyvztaCfIR1KDNo=
Received: from TYZPR03MB6623.apcprd03.prod.outlook.com (2603:1096:400:1f5::13)
 by JH0PR03MB7925.apcprd03.prod.outlook.com (2603:1096:990:32::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Wed, 18 Oct
 2023 04:54:31 +0000
Received: from TYZPR03MB6623.apcprd03.prod.outlook.com
 ([fe80::faa3:6316:28ab:206b]) by TYZPR03MB6623.apcprd03.prod.outlook.com
 ([fe80::faa3:6316:28ab:206b%4]) with mapi id 15.20.6886.034; Wed, 18 Oct 2023
 04:54:31 +0000
From: =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>
To: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
 <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH v8 22/23] drm/mediatek: Power on devices in OVL adaptor
 when atomic enable
Thread-Topic: [PATCH v8 22/23] drm/mediatek: Power on devices in OVL adaptor
 when atomic enable
Thread-Index: AQHaAB1HEdFfDejVNEqf1UEj5S+jd7BOzhiAgAAwCAA=
Date: Wed, 18 Oct 2023 04:54:31 +0000
Message-ID: <691c1458eb5e45d8c14f24e78f47b2840f589ea7.camel@mediatek.com>
References: <20231016104010.3270-1-shawn.sung@mediatek.com>
 <20231016104010.3270-23-shawn.sung@mediatek.com>
 <c8e94835fcba4692d34eb002ef4c14f554c50b0b.camel@mediatek.com>
In-Reply-To: <c8e94835fcba4692d34eb002ef4c14f554c50b0b.camel@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6623:EE_|JH0PR03MB7925:EE_
x-ms-office365-filtering-correlation-id: 981654db-4d64-4efd-5ab4-08dbcf965121
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: S5Vw8HWocNJDTVa9Wo4Bib9moG4tBMFLMI2jj1Sh8D2OuuEFrTlo2/pLBmzVY/es13pu+Z1yyEBmvzxGixL3B1BiPE0/tJ3kr0IerGGCB8tbdzIJzDlK4ONpExxBTXD28QfhhVSO+KXL5v5qi2f2puuTQBATIrTh+3VgjLiTC10gVItxJXe49wy414BC7a4783zEH8B7urfUWfMfzlUvir4wS2g17scxVQ4xwxyUZKIw0glYLBKyP+3Z6IhviZEun+g+/hKe+GieXSgWksKwhxNjg5e6gzfO+hIXP30QLRYvw+bJJihX/np/EAbOeUZmzt7cv6hqvit8yYqivV4wtY7wU9yb3irNkRGMHR/83sSuceS9WgYR4ya5MVwkQOCZmijKdLlfNC14q/BUG+IR4D+sZBghfdW+U58TkEia+50AhWfYanH+E04muwMADxd3yAI38e/4AR/+G/oEER1/ey5rll/mD9JcPmywMgkCGqtrci9Yw8AqM6cfPnQDGVIJenDCMh/UBz2QoMRy0gKK3zW30J6GiAcdaznDQ/ytHp0TnCO9xxdwB3B+T9UiXdDGppcpDnaV0/8337IbAZ9+SozgS8Whdaz+0VQKucOt+6Ha7T18yuYXf739AL82mS5DK5fKUxksEjWisy2qBZSVmp2dJy7eUHEu3q3XjW7MYtA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6623.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(366004)(136003)(376002)(396003)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(64756008)(54906003)(86362001)(316002)(76116006)(66476007)(110136005)(66946007)(122000001)(66556008)(5660300002)(66446008)(38100700002)(38070700005)(7416002)(4001150100001)(36756003)(85182001)(2906002)(41300700001)(4326008)(8676002)(8936002)(6512007)(2616005)(71200400001)(6506007)(26005)(508600001)(6486002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dXAzRFNaenVyZ2xYUWFZcTljNDZHVmx5dVN0Vnl4UmNTMkJMamVqdWlMSXZO?=
 =?utf-8?B?Rnpsemt0ZElFY2EzZjFreDNqNVpaUnFjVy9zb3lSb3Q2bnBlSWs3N2RVZCtn?=
 =?utf-8?B?c2NVZUZyQXpKM0IwQkN0aERKQVNnMUgrV3NxK29yWFhrTkVmRHJmcEVGc0RB?=
 =?utf-8?B?QXNUZHVHUDhjWjBvWW03OHRtWUlyVzZrMSttclg5bldBWGpFQkxYQjdzVjdT?=
 =?utf-8?B?akxMMkQyY29oTHN3ejFpemZqa3FUSlRQNkN4Z1hDSUxOcDlvdFpkazBuVTk1?=
 =?utf-8?B?V052ZzZNQ2hmRDRlaGVNbnMvTXBMcGpnaTRlZ2p4NXhDQ1dScTBsNTNWWkp3?=
 =?utf-8?B?WG9GZ2xCcmU3enBwTldtKzB1ZmhqUTU3UzFhRFNrMlVjOGpvVEt2QTh5SVlh?=
 =?utf-8?B?SjZldEVrSkx5QnZ5ZlVkMDdnYzNXSUp1dGc1M2tiSDQwREFVN0s2bTIySDVp?=
 =?utf-8?B?VUlDWlJncU9BRFpFdXhqaGhyN2lNVTdCVG9XK1ZVbDV3OVB2MFVmSkdpMmFG?=
 =?utf-8?B?UFhkazFySzFoMWhQQWx6M2owdnNyN0U4aFNOWlREZ2dhSC9HMEtxN1pDbGFT?=
 =?utf-8?B?a0dacGY2bkdsRWg3SVpJRUVZMHh2dXpEbDNGSXBUbzZjTzhjN3p2WlBvNmlR?=
 =?utf-8?B?UE5LZWlZdCtONEF1Wk9Wa3RyUVY5U2N1N3NsUHZCcDZyK290YTl5dDFad2lr?=
 =?utf-8?B?YWw1Mmp0bHNyTEd4NmtkOEdvQlI2cVhqeitYWWN3VmRKMldMdDlKdlBUUU9Z?=
 =?utf-8?B?U2NBcEVmNUwweGdlVTVwcnVDZVVIL0V0RHdyQlFoVmxSWG1rZEFlZVRNNXB5?=
 =?utf-8?B?eEVNTnd4aWxLRkNWcGEvdnJncVJKeTB4VUlxK3hsRksyTXU5ak1NK1VQeUc1?=
 =?utf-8?B?blBkY1V4U09ITVRINThicW9VQ2c0U3pzeWJEYkUvMTFKMXlhQmlPNHlOMkV2?=
 =?utf-8?B?TTRDYko2bS8xbHZwaC9pNkF4c2JtRzlUMEx1WmI1S011bmZSUHNwRlYzelJi?=
 =?utf-8?B?UktoUU1VeUxyU3hCZG5xelVEbnNmeEl0NHFqWWpmbFFTajNOUVk2ckEvdXZL?=
 =?utf-8?B?Y3lTU2tqNTBrUDZ1T3JoZFBwU2RlVm5RZXRqVnZWUkZaWWQrZzNSWHNaUytD?=
 =?utf-8?B?OXM0NHNwdlRNbklNdXYwejFDOGdMc3NEbXpXTjdSUUNzTG5GR0tFZ0FpQit5?=
 =?utf-8?B?RHQrVFRrQXBtcHNRbTlPWk4wWitmcThLY3ZxKzBmMmhDQzVMckMwdFRUVFBO?=
 =?utf-8?B?YXBpbFhDaGdveXVkS0ExZCtiTFNXTmxxNjdaUStkblRrMVpuSHlsYlZnaGty?=
 =?utf-8?B?SjdWUzB2OEN6Vzkwa2ZmZFlxQVlzd09lczJUN0ZzaTlzUHE1UFhRQnNZYm1L?=
 =?utf-8?B?dEdBNjYyV2ZKTGs3VmVDUVlTSG9ReVNJZVJlbVdLcnJRZXZRbVBSLzYvL25D?=
 =?utf-8?B?ajJXNEFCdzBLYStBTStUV0NvTzcrcmxIMzN6NWd3N0RUdDA1aGpIejM3WkZz?=
 =?utf-8?B?ZThnUmdzclFJcFhwOU1rcEIvK2g2VHIybE1iblhQcWhTV3Z6UkY3MGZnWVB3?=
 =?utf-8?B?NkdOV3BlRmx4eGFLR1VqYWZsbnByMlNYamtJYWVLLzk0WVpBWngvaE4xdGdS?=
 =?utf-8?B?UXdGM2Y2WER5U2N1UFJwZG5tRHFVRVdCcFJoNUlYaWlFZDJCNFE5bVNLN2U5?=
 =?utf-8?B?ZWtPVWlHeVpLN2JxK3M0SkkyZG1iVjloTll3bkRJWHhCRjN3UUg2OWcyNVZG?=
 =?utf-8?B?T2RsSWw1WTJQc0FpM2JuM2I2NFlpZnNTRTVYZGIzME5NRStmQ2dIdjhKNDBq?=
 =?utf-8?B?c0NYZDV2ZTh1L0JtZ2p6TVI1emdVVG5zK29Bemo4S2pyaDNNTUExRzd5c0Ro?=
 =?utf-8?B?Z05LL0NLei9rbjkybWZiWUNGRVlBcjRwdWxveHJlNkRGYXBUTW5KNW9NVGxO?=
 =?utf-8?B?TUMyRThmT0RueG5HdFNPQXFjN3hVSjdqZVc3anBlaDdCWGhGNzhld2x0dVBK?=
 =?utf-8?B?ZzRLT3UzU1dGV3I5WFZGMkkrcXU3WWl0aURUZXJrYmpoNGpNYWt0UzY5eXg5?=
 =?utf-8?B?alh4UGttS3phVkZxeGhVRjE2Tks2WGJVMC9EWFN1NWRlSGxad3VYdG5ocklm?=
 =?utf-8?B?T0Z4YWVweWkzTEV2NHFmWjBuWmgvS0VSSXFlSlprSWs0MzA5QVpqdmpEMElD?=
 =?utf-8?B?aWc9PQ==?=
Content-ID: <40749170C3BEDA499E02FCE5A3BE8B6B@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6623.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 981654db-4d64-4efd-5ab4-08dbcf965121
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2023 04:54:31.6202 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bf13DJHK8cn5ERnyFyF9ZZ3L6FbS92LDMwVN0XsCkJInK7qA6vKjOnOO9oemeH35W0TIIBJYfzdeX9K8Jf9tzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7925
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--13.691400-8.000000
X-TMASE-MatchedRID: ge9e+QLSeazUL3YCMmnG4ia1MaKuob8PofZV/2Xa0cKSO6So6QGgypyh
 lVw/MC0HcQCr6vrjZa/pntG9lpI2o4dB3EMW8FvfQsSgfTKe5lU2nLo2hN48Id9RlPzeVuQQWcH
 UyLOsRe/v5TZdm2T2Kv0h3e0v6EXCoFbZmsVVg1H0hv/rD7WVZMMdI0UcXEHzCqIJhrrDy2/tlo
 NHczQ4GoMmUcN/l8E7kZOl7WKIImrS77Co4bNJXQtuKBGekqUpI/NGWt0UYPCx0h6L5nkJUgR2o
 7kP2GAbEG5XboevhAQOhFfihbRvvMOGPq33mlSu
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--13.691400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 0AA055BF39B2E4CF54C1F1DEBEEF330032F8710158041F3AA7EFFA73FA265BB02000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_004_1945720572.1947730558"
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
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "fshao@chromium.org" <fshao@chromium.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "sean@poorly.run" <sean@poorly.run>,
 "johnson.wang@mediatek.corp-partner.google.com"
 <johnson.wang@mediatek.corp-partner.google.com>,
 =?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?utf-8?B?WW9uZ3FpYW5nIE5pdSAo54mb5rC45by6KQ==?= <yongqiang.niu@mediatek.com>,
 "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_004_1945720572.1947730558
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpJiMzMjtDSywNCg0KT24mIzMyO1dlZCwmIzMyOzIwMjMtMTAtMTgmIzMyO2F0JiMz
MjswMjowMiYjMzI7KzAwMDAsJiMzMjtDSyYjMzI7SHUmIzMyOygmIzMyOTkzOyYjMjA0MjY7JiMy
MDgwOTspJiMzMjt3cm90ZToNCiZndDsmIzMyO0hpLCYjMzI7SHNpYW8tY2hpZW46DQomZ3Q7JiMz
MjsNCiZndDsmIzMyO09uJiMzMjtNb24sJiMzMjsyMDIzLTEwLTE2JiMzMjthdCYjMzI7MTg6NDAm
IzMyOyswODAwLCYjMzI7SHNpYW8mIzMyO0NoaWVuJiMzMjtTdW5nJiMzMjt3cm90ZToNCiZndDsm
IzMyOyZndDsmIzMyO0RpZmZlcmVudCYjMzI7ZnJvbSYjMzI7T1ZMLCYjMzI7T1ZMJiMzMjthZGFw
dG9yJiMzMjtpcyYjMzI7YSYjMzI7cHNldWRvJiMzMjtkZXZpY2UmIzMyO3NvJiMzMjt3ZSYjMzI7
ZGlkbiYjMzk7dA0KJmd0OyYjMzI7Jmd0OyYjMzI7ZGVmaW5lJiMzMjtpdCYjMzI7aW4mIzMyO3Ro
ZSYjMzI7ZGV2aWNlJiMzMjt0cmVlLCYjMzI7Y29uc2VxdWVudGx5LA0KJmd0OyYjMzI7Jmd0OyYj
MzI7cG1fcnVudGltZV9yZXN1bWVfYW5kX2dldCgpDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtjYWxsZWQm
IzMyO2J5JiMzMjsuYXRvbWljX2VuYWJsZSgpJiMzMjtwb3dlcnMmIzMyO29uJiMzMjtubyYjMzI7
ZGV2aWNlJiMzMjtpbiYjMzI7T1ZMJiMzMjthZGFwdG9yJiMzMjthbmQNCiZndDsmIzMyOyZndDsm
IzMyO2xlYWRzJiMzMjt0byYjMzI7cG93ZXImIzMyO291dGFnZSYjMzI7aW4mIzMyO3RoZSYjMzI7
Y29ycmVzcG9uZGluZyYjMzI7SU9NTVUuDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCi4uLiYjMzI7c25p
cCYjMzI7Li4uDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsraW50JiMzMjttdGtfb3ZsX2FkYXB0b3JfcG93
ZXJfb24oc3RydWN0JiMzMjtkZXZpY2UmIzMyOypkZXYpDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrew0K
Jmd0OyYjMzI7Jmd0OyYjMzI7K2ludCYjMzI7aSwmIzMyO3JldDsNCiZndDsmIzMyOyZndDsmIzMy
OytzdHJ1Y3QmIzMyO210a19kaXNwX292bF9hZGFwdG9yJiMzMjsqb3ZsX2FkYXB0b3ImIzMyOz0N
CiZndDsmIzMyOyZndDsmIzMyO2Rldl9nZXRfZHJ2ZGF0YShkZXYpOw0KJmd0OyYjMzI7Jmd0OyYj
MzI7Kw0KJmd0OyYjMzI7Jmd0OyYjMzI7K2ZvciYjMzI7KGkmIzMyOz0mIzMyOzA7JiMzMjtpJiMz
MjsmbHQ7JiMzMjtPVkxfQURBUFRPUl9JRF9NQVg7JiMzMjtpKyspJiMzMjt7DQomZ3Q7JiMzMjsm
Z3Q7JiMzMjsraWYmIzMyOyghb3ZsX2FkYXB0b3ItJmd0O292bF9hZGFwdG9yX2NvbXBbaV0mIzMy
O3x8DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjshY29tcF9tYXRjaGVz
W2ldLmZ1bmNzLSZndDtwb3dlcl9vbikNCiZndDsmIzMyOyZndDsmIzMyOytjb250aW51ZTsNCiZn
dDsmIzMyOw0KJmd0OyYjMzI7VG8mIzMyO3NpbXBsaWZ5JiMzMjt0aGUmIzMyO2NvZGUsJiMzMjt5
b3UmIzMyO2NvdWxkJiMzMjtjYWxsJiMzMjttdGtfZGRwX2NvbXBfcG93ZXJfb24oKSYjMzI7Zm9y
JiMzMjthbGwNCiZndDsmIzMyO3N1YiYjMzI7ZGV2aWNlLCYjMzI7YW5kJiMzMjtkcm9wJiMzMjtw
b3dlcl9vbigpL3Bvd2VyX29mZigpJiMzMjtvZiYjMzI7bWRwX3JkbWEuDQomZ3Q7JiMzMjsNCiZn
dDsmIzMyO1JlZ2FyZHMsDQomZ3Q7JiMzMjtDSw0KJmd0OyYjMzI7DQoNClNpbmNlJiMzMjtvdmxf
YWRhcHRvcl9jb21wJiMzMjtpcyYjMzI7YSYjMzI7JiM5NjtzdHJ1Y3QmIzMyO2RldmljZSYjOTY7
LCYjMzI7d2UmIzMyO2NhbiYjMzk7dCYjMzI7cmV1c2UNCm10a19kZHBfY29tcF9wb3dlcl9vbigp
JiMzMjtoZXJlLiYjMzI7SGFkJiMzMjtzdWJtaXRlZCYjMzI7YSYjMzI7bmV3JiMzMjt2ZXJzaW9u
JiMzMjsodjkpJiMzMjthbmQmIzMyO3dyYXANCnRoZSYjMzI7cG93ZXImIzMyO29mZiYjMzI7cHJv
Y2VkdXJlJiMzMjthcyYjMzI7YSYjMzI7c3RhdGljJiMzMjtpbmxpbmUmIzMyO2Z1bmN0aW9uJiMz
Mjt0byYjMzI7cmV1c2UmIzMyO2l0Lg0KDQpSZWdhcmRzLA0KU2hhd24NCg0KDQoNCjwvcHJlPjwh
LS10eXBlOnRleHQtLT48IS0tey0tPjxwcmU+KioqKioqKioqKioqKiBNRURJQVRFSyBDb25maWRl
bnRpYWxpdHkgTm90aWNlICoqKioqKioqKioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29u
dGFpbmVkIGluIHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50
cykgbWF5IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVy
d2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlz
IGludGVuZGVkIHRvIGJlIA0KY29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGll
bnQocykuIEFueSB1c2UsIGRpc3NlbWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywg
cmV0YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRh
Y2htZW50cykgYnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRl
ZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lw
aWVudCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZSANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQg
dGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0
ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3Bp
ZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3Vy
IHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwg
dG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_004_1945720572.1947730558
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQ0ssDQoNCk9uIFdlZCwgMjAyMy0xMC0xOCBhdCAwMjowMiArMDAwMCwgQ0sgSHUgKOiDoeS/
iuWFiSkgd3JvdGU6DQo+IEhpLCBIc2lhby1jaGllbjoNCj4gDQo+IE9uIE1vbiwgMjAyMy0xMC0x
NiBhdCAxODo0MCArMDgwMCwgSHNpYW8gQ2hpZW4gU3VuZyB3cm90ZToNCj4gPiBEaWZmZXJlbnQg
ZnJvbSBPVkwsIE9WTCBhZGFwdG9yIGlzIGEgcHNldWRvIGRldmljZSBzbyB3ZSBkaWRuJ3QNCj4g
PiBkZWZpbmUgaXQgaW4gdGhlIGRldmljZSB0cmVlLCBjb25zZXF1ZW50bHksDQo+ID4gcG1fcnVu
dGltZV9yZXN1bWVfYW5kX2dldCgpDQo+ID4gY2FsbGVkIGJ5IC5hdG9taWNfZW5hYmxlKCkgcG93
ZXJzIG9uIG5vIGRldmljZSBpbiBPVkwgYWRhcHRvciBhbmQNCj4gPiBsZWFkcyB0byBwb3dlciBv
dXRhZ2UgaW4gdGhlIGNvcnJlc3BvbmRpbmcgSU9NTVUuDQo+ID4gDQouLi4gc25pcCAuLi4NCj4g
PiAraW50IG10a19vdmxfYWRhcHRvcl9wb3dlcl9vbihzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+ID4g
K3sNCj4gPiArCWludCBpLCByZXQ7DQo+ID4gKwlzdHJ1Y3QgbXRrX2Rpc3Bfb3ZsX2FkYXB0b3Ig
Km92bF9hZGFwdG9yID0NCj4gPiBkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCj4gPiArDQo+ID4gKwlm
b3IgKGkgPSAwOyBpIDwgT1ZMX0FEQVBUT1JfSURfTUFYOyBpKyspIHsNCj4gPiArCQlpZiAoIW92
bF9hZGFwdG9yLT5vdmxfYWRhcHRvcl9jb21wW2ldIHx8DQo+ID4gKwkJICAgICFjb21wX21hdGNo
ZXNbaV0uZnVuY3MtPnBvd2VyX29uKQ0KPiA+ICsJCQljb250aW51ZTsNCj4gDQo+IFRvIHNpbXBs
aWZ5IHRoZSBjb2RlLCB5b3UgY291bGQgY2FsbCBtdGtfZGRwX2NvbXBfcG93ZXJfb24oKSBmb3Ig
YWxsDQo+IHN1YiBkZXZpY2UsIGFuZCBkcm9wIHBvd2VyX29uKCkvcG93ZXJfb2ZmKCkgb2YgbWRw
X3JkbWEuDQo+IA0KPiBSZWdhcmRzLA0KPiBDSw0KPiANCg0KU2luY2Ugb3ZsX2FkYXB0b3JfY29t
cCBpcyBhIGBzdHJ1Y3QgZGV2aWNlYCwgd2UgY2FuJ3QgcmV1c2UNCm10a19kZHBfY29tcF9wb3dl
cl9vbigpIGhlcmUuIEhhZCBzdWJtaXRlZCBhIG5ldyB2ZXJzaW9uICh2OSkgYW5kIHdyYXANCnRo
ZSBwb3dlciBvZmYgcHJvY2VkdXJlIGFzIGEgc3RhdGljIGlubGluZSBmdW5jdGlvbiB0byByZXVz
ZSBpdC4NCg0KUmVnYXJkcywNClNoYXduDQoNCg0K

--__=_Part_Boundary_004_1945720572.1947730558--

