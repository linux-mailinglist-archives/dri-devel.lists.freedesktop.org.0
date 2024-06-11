Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 181F8903754
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 11:02:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4290B10E12C;
	Tue, 11 Jun 2024 09:02:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="GKe/ffXP";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="MO6wxWNz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7323710E12C
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 09:01:58 +0000 (UTC)
X-UUID: 3ff2bfce27d111efa54bbfbb386b949c-20240611
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=UVhQJCOMtWTkItBMTd08yrA67YDi8mM9A3DmbJjx4T4=; 
 b=GKe/ffXPwvF7ZAVok+FJh1AA15MDbazbS49+qnGMnjfmWrBqKFFSuE4bE6q5gmpoenAx541gk6eMbh+dqpvDqg+8ID39bjf4lYY73hAAvvFq6Gpsc/X+xG76EeO0McuXRVt4zlSl7HGBHXwjq/18Cbo9Nu7PfACS6VCtrj26uDs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39, REQID:c8b5616a-d9a7-4b92-9612-1a37cf92c520, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:393d96e, CLOUDID:5ae27288-8d4f-477b-89d2-1e3bdbef96d1,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 3ff2bfce27d111efa54bbfbb386b949c-20240611
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2072684699; Tue, 11 Jun 2024 17:01:54 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 11 Jun 2024 17:01:52 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Tue, 11 Jun 2024 17:01:52 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q/YJxNwLNPlAH9QtRtgV9a0i3BK/HpRVXwNp9ZBBRCNH8+rU6Kp1YTtNudLb/LSieAMJFLb5EnmysHei3Pfb0wiGdZ3fdp914Fw/je6lqJm+ziwz2VHFPwdIv8kthw3UCI4gkfFxa7YzrrnnsbRT66JezP+yj/k59wucI161fnHpfBzx5i/ZlcF/OZ1T5N1k9FZNSmO6LLIPUB+YV3Wayt3ZiIVuuG3NL9fh5PX+EspPWvSKqBfdDEvpZ7tuNiuUsp+pEj/RBGn826T5QIgovelkjJu2JQYcD+Kyq1p/oskupPsZ6Uawpk5WArHr0knxXNxA1GFqphIaTgcuz2ZDag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cEvFqCmk0PBoXPXc9qRyOlOUl49B93G34V2uh9Lvl1o=;
 b=DCF2Bmw+2MWtfTx7uN6x5LUF+woRimXjL36U+rcRSTteIIw28zN721ff07ylCuctWTBHAZ5hknbd8EKtsDnbxc1ZutjogoQrDSNLb/NqoF7K6hpZf5IZrv5s7psf0wFWkOPGL2af+dcubtrtXvpMIW1M/hiZ/RspjwKmMpE+QzTaozozkeb3rb04XsxKoEFojq4xyVYlgzmka4OKNWleqaRfYC5/0O0jLlwF8DEUIFPZhQyBpuu2y+WXGc7xBkYUO1SY462vHfeFuKjMZjp3MI/3KbyFIZf3d/abr2wLSHIBiq/uy5HCtInz2TZTc6WivN7Yk9xSUzlPHt5ARBShtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cEvFqCmk0PBoXPXc9qRyOlOUl49B93G34V2uh9Lvl1o=;
 b=MO6wxWNz/3TIJMKFXNgpQxKdKSTicyqa7nx+hm2af0hESVbryY+n+D5rXOy0P1qyf9O/ZW7DgAQRqr2K2LmlOyCEdru1Z2pKpXtsHjD6Okqw7nrzC7NFgD6Ndw9yrEn8SQoMChEPU3Nr8F84PZVGkP7r80c62DiUWcg+HZx/asc=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB6598.apcprd03.prod.outlook.com (2603:1096:400:1fc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.16; Tue, 11 Jun
 2024 09:01:50 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%6]) with mapi id 15.20.7677.014; Tue, 11 Jun 2024
 09:01:50 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?utf-8?B?QmliYnkgSHNpZWggKOisnea/n+mBoCk=?= <Bibby.Hsieh@mediatek.com>,
 "jason-ch.chen@mediatek.corp-partner.google.com"
 <jason-ch.chen@mediatek.corp-partner.google.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "airlied@gmail.com" <airlied@gmail.com>,
 "sean@poorly.run" <sean@poorly.run>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v8 10/16] drm/mediatek: Support "None" blending in Mixer
Thread-Topic: [PATCH v8 10/16] drm/mediatek: Support "None" blending in Mixer
Thread-Index: AQHat/O9N8m/jSltSE22IttrWOSLYLHCTBWA
Date: Tue, 11 Jun 2024 09:01:49 +0000
Message-ID: <829469287c6f1d95c9223c74c2d78c3cd56e6b77.camel@mediatek.com>
References: <20240606092635.27981-1-shawn.sung@mediatek.com>
 <20240606092635.27981-11-shawn.sung@mediatek.com>
In-Reply-To: <20240606092635.27981-11-shawn.sung@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB6598:EE_
x-ms-office365-filtering-correlation-id: e4034e56-eefb-447d-7ccf-08dc89f52161
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230031|1800799015|366007|7416005|376005|38070700009; 
x-microsoft-antispam-message-info: =?utf-8?B?Q3FaRnRac2F0cmxPSWJYaFEvTDdGVmdIY1owcnZOZGhMdGxrQmNMcCtOMjMx?=
 =?utf-8?B?QUV1VzZ4UXd2eHNEK2IvaSs2d0xjZWxWSVJkL2dGMkRhd0JEOEM5bGgxRm5U?=
 =?utf-8?B?cVdTRUhkN0diNWROYS9GMDJxQTF2OUNPSEMwRFJhVktERW9kQTdkZmFVVE5V?=
 =?utf-8?B?YXRVUlhJYkJWWGRaR2lCbnBES1JhcWVrbWQ4WWhsbjZwWHVRamk0QU40R1h1?=
 =?utf-8?B?eW4vZm9yZVVmck9jaDkrb08wUi9YSTVFNVZjY2ZVL2g2czF5Nktwc3k0VzA3?=
 =?utf-8?B?Ty9QZElaVWJGYW1mNzlyamdkWGs1dng4SkwySEdXZWVLM2t3YmlaU1o3Kzgv?=
 =?utf-8?B?U0dqaFZocS8wRmNHVmg5Z3R1SmlRMU85bEZtS0RaMnY4SGhGY1NHbnBpVlc5?=
 =?utf-8?B?SFBMQUpOeXBXSXQwTjVTYjloMFhVQjVCMWFJU09CMWpFa0dqaTQvMzFHV3Yw?=
 =?utf-8?B?bVNiZ2NBcHpHOERCcVNCREt0a0xodDY0M0prSVAwaUFXeTdGYVlUNml6UmZX?=
 =?utf-8?B?RTFxOEU2Y20xemxFUHVTOUJMQjFhNVF5VDgvS21DUlFjb2ZNT1AzTjVUak9O?=
 =?utf-8?B?VXR6QnNCQjViUUE4Q1R4cnNpSWdRdjN3QUFIOEZVaURna0xVbFl2ZXArZnZB?=
 =?utf-8?B?K2VCU3N4YTN2a21vU3BiSFYzTmIraXk1WC9hWkFUK2hzWFJ4R2JNMG5RUVRw?=
 =?utf-8?B?NFByWjB1N3hyWFJOVXlJQnhYVDFvL2VjWHp1V2hYVjF6cXVXM2Q2dkJCWU5j?=
 =?utf-8?B?ZDQ4ZDZ5VksrcjZadEx3RDVhTzFUbERGM2FtK3hiT1BEOGg0elkxQ3d5bWc2?=
 =?utf-8?B?a2cvUEVwNk5UNmhYTWJES0I2NWlZblRhK3JiSGh3elZZMjdBdE9RTTFCZTRl?=
 =?utf-8?B?Y2EwTk54QytLTzV2YmwwYkNGWVBObUlyYjNMUFJORU5WRjZpdndZVEZiZ2ho?=
 =?utf-8?B?a2cxditmU2d6NHpaSlpYbTk5c1ducWFsSEF6QzJ2NC92aWdsZHY0MW43b1Q5?=
 =?utf-8?B?NDEwc3pvdXc2WXhUekZwMUNjN05aWmZjczZBR2tsODltd1lleXB1a0lIeDM5?=
 =?utf-8?B?SjZKc0pneXI3eGFGSGxHcEJrbmE2Rkd0QXZZLzhsbHRaTTZjU2JZOGZHTjFv?=
 =?utf-8?B?QWVRUUVpc3Z1UGl4MkJUOFJqK2hwR1FCYTlQQVpyM2F2VkI4SkFjcmFSRW8r?=
 =?utf-8?B?am5qd3pZQUJEbUtTUnNlRGJ5WnMzYWJDYkpjK2tzeXNpSDc3ZjMrRVRWZHhH?=
 =?utf-8?B?WjhXRldyMlMzMGdtRHN3dXRZYy83N1hqdTdzc1JyVWFBc2JvWXJXK0NrVG10?=
 =?utf-8?B?Y0lsVk0rc2VjVmV4QlRMb0Y4RkpQTEFQVmgzWktjaGhhOWdBaHZOdmJSSHht?=
 =?utf-8?B?TndQRTgzdVpKQS9HZlV1MFVBMmhDVW9RU011aFZMNmU4cTF5Q29KTU5HU3hP?=
 =?utf-8?B?Q0hXa25sWGNBOEhSNnJ1aTh2VCtIajYxLzJReGhtdVo0cC93TzZVWHNPaFVY?=
 =?utf-8?B?NGE1RkFoYU1EdjNFSGhkOG5QdXVSTkNMbWZQT3NNWkpmTWFUWlFyamNUMjlw?=
 =?utf-8?B?RTJ1aHpnczVzTmZvTWc1VnllcDdyRC84NGMxOEtlQ1FtY1ExZWVKMjRmZ0Z4?=
 =?utf-8?B?b2xsVGFncGV6WVljWkhHR0tURStHT014Q3pNejZmRnJBL0ZKQUo4YW1kMXdI?=
 =?utf-8?B?djgybnJtQUlIcEV0SlY0aEVFeHBHR0dDNHp6azZWSEw2TWNSMHo5ektQWWZN?=
 =?utf-8?B?SHNPbTJ3MEFyOWtKNjJlK1lWNG5vV3JoSXBZdDBYM1F5cktkalNiTVJtelkr?=
 =?utf-8?Q?LtKpTMCfn6mA0B4gnjg6dtj3iqUcmUlz9YR0E=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(7416005)(376005)(38070700009); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L2dXYWw2bU1Hd0ZtR1M4d1p4WDZxeTFmb3VkLzhmYnNoZmJXWGEwcEJXSTc3?=
 =?utf-8?B?MzVGSk9tbG5UZS9WRlovWkFJTVdlMTcxQmJ2bS9OREgwYUluMlFSWkRiQVRE?=
 =?utf-8?B?WUw4WFV2YUNXWExxUUtkTm5VZEJEU0JDWG1pZFpRcjhkTGIxSWRGOGhvUkJ5?=
 =?utf-8?B?TUpQSUdVa0pWb1J0NmhpMGU2VTZMeWVNSW5DQXJxMi9iWDhIRGt4Vkkya1FY?=
 =?utf-8?B?TXFCU1ZkcVhCelFLU2hFM1cweWNKMExPYUVSU0xJOTY2ZDFvQ2xYMTFwS1c5?=
 =?utf-8?B?OXhoczlOYUhSZTdCYnFadTIyWTU3dmNyMWJQdUJ2SDQwTlh2amJWRnF0RCt5?=
 =?utf-8?B?SHZUVS9KcWhUTkhrT0NaVlVCczBqWVBGdmkrcXFpS0ZwQTFZVFFrTHVLVDVG?=
 =?utf-8?B?ZENzT3RNMzZEblgwTjBnVlRXUHBaWkcyUWNXV1dyNlNNb3pHNTIvaEs2RTVm?=
 =?utf-8?B?amlaUnRBTDJNL1VxcTJ3WHk5eDhGSlBjTCtzYWVZbVE5K0QwTEwxNy9YcTFN?=
 =?utf-8?B?YUdqUEsrVUtodkIvM2t4OWJvSU9pL1RITE5ITk5IUlEzSG81TVByWDF5anln?=
 =?utf-8?B?Z1NZZnppQ1lPT0EyQ1FLZHlSNGVFQ1BiS1FsVVBLbE1LbDNNWFAxY05kNDNv?=
 =?utf-8?B?ZGFiQ2FvM2FDdDdURjlUM3BwT21mSlBlMzRtdFhKQUJSNHVscDhORllMWHBO?=
 =?utf-8?B?eWVZNDJtVFVoRTFrN0NSSzZ3am9HdUhVUzc4NXBrU3Z4akxUR2YxUFlpTTRW?=
 =?utf-8?B?N0VwcVZKalJsRVpvQjBiMEFZK0lSdGtGZDFFN2J6OUVDUFZ3WW1FUW9mWmIw?=
 =?utf-8?B?ZkxYbWI5TlZtRHhDQW9FV3M2K0IydmltRHdvTnRidE5HRkdjUkxCU1lRcmpq?=
 =?utf-8?B?ZWpmcXpnVlBwbzdVc2twN2Fldnd6SGp5MTNubWNkUndKS1pPc1VPTUtTUllK?=
 =?utf-8?B?YzNyQ21FcFhoSWU3U2g5SExTazFOZ0FyYm42V1Qza0Q4akRORENmTVBhbmI4?=
 =?utf-8?B?ZHU1c1JlM1pIUm1ZcEJYZXhNZmdKWTRJcU54eFhnSzhwb3hrUnBZc3NjRmRS?=
 =?utf-8?B?ZktvdGdpSml2VXZZTTVvS1I2dDVkWUNaVUtHSVM0dnN5Ykc5S0JUTlI1SFZI?=
 =?utf-8?B?UnVLY1V0R1VydWVxODFUOFMvNHA4cGJHdmM5K1ZUWFZRMi9Rb0hEZmRZQmJx?=
 =?utf-8?B?Q3lXUWVONzRHVDVCMDFYMDRYaE1ad3NXSGpkRmdhOWpSTXFYY1Q5SHUwb1Vr?=
 =?utf-8?B?MERnQjdkNXNGU3kvWGtzTTVlQmdiSjVDUmxsdWpFSnBXbU1YUUh0MU16RXJR?=
 =?utf-8?B?eVJFVGM3RElTdmMwY3dkOHp4S1V0K3pDZ2FpUWxlUG51ekVFa1l4NDRkK0ZT?=
 =?utf-8?B?QmdhbjNDQTVIN0VOdTBzbFVlaFdvTDh0Zk9ISkhVaHcyODVwajlmdnlzaXA4?=
 =?utf-8?B?QVRiOU9Id2pPYitFRmZvYnhURlNSR0E1THRrdjdUSVBjc1F0dWQ1Z0ZKYlpR?=
 =?utf-8?B?WUpXeFBBeTBPT1kyYnRNVzR5YXBDWFRmemxqOGR4a05HdEp2clFRbUdoNHpx?=
 =?utf-8?B?Qkt4QnhQdWsyeit0TTdjSitsRk5lVWRGZXYwekZzczMxYlc1NEtKaEpzWmJX?=
 =?utf-8?B?c1NITmE5WXFoQ0pJVlpxaUd2ZFQ5eGNzNVZraUZ5MDR5WlVienoyQjJ3VDd4?=
 =?utf-8?B?cERnYTVzVG5oNGNNOFpYRThhZHk0Z2k1ajgxTk84dzJsQzF3S1hpSDNrR2I1?=
 =?utf-8?B?ZEdLTVNKY3JteDV1S3RCVkFtRTdXZi95L3FFRm5QTDRiQ3VtdkZ5cXF5eDVn?=
 =?utf-8?B?aXBRbWhUKzUxajRuVGFMYVNTSDN2SGRqdWJqVzBRSGM4OVVWK251czlyZjFP?=
 =?utf-8?B?akhweHBWRzkySzUxK0RVMDJZdEVzQXludk9OaDVwRVkwd25relVwTmJSK3Ri?=
 =?utf-8?B?YUJicWdmbmRUdUIzbjRiRUFvMzV3M3o5Tms1NkViNnlUYjZSLzJrcXloY2N4?=
 =?utf-8?B?alZhcCtWYkdYL2I4MEExQXduUkdBb3JnUDA1UjJkNHdJbjgyU0VidXRXdmtk?=
 =?utf-8?B?L0xCYmhGY1ZvdU83VnRyQW82WkVURWJ5Z3kvdldxTkp6SUh5THNSOFFvTzdo?=
 =?utf-8?Q?sB47aCPW0lshqbwCp72WPN2As?=
Content-ID: <444BBA5F54B9F84EBDB770BFEF4F4C58@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4034e56-eefb-447d-7ccf-08dc89f52161
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2024 09:01:49.9269 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SJHSIpeH3RrblQU0ye/Pz69Y6vpr+PWuiIllI++0joWIfW/DDAna8E+CwYbtQbcanh5HC+KPO3xCKwAs+HBhbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB6598
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--10.201800-8.000000
X-TMASE-MatchedRID: zGP2F0O7j/sOwH4pD14DsPHkpkyUphL9X4GSJGyYc34E6M1YtcX6vMQG
 d7R3BXX6Pkn/V88HF8sSqo3ZUfrHh1SU1d+VJ4IjFYJUGv4DL3xKKWJchzA/cWI4wQ1Yq/d0Pj2
 LYYvxFKarequ39ii4TmU4l4NQ8MfA2vHXB5YKlQWzI1v7J4hECpE+3DCX3uibDZjzHLL3eRayZX
 5rneXA9VyGSa3ug0qO4gYlnr6q/ytC/bXMk2XQLIMbH85DUZXyseWplitmp0j6C0ePs7A07Q9dk
 +6tnSFLGifK9MCJH9aWPk9wtISZcLqCdyyo+ox9MRZdjxLIblQ=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--10.201800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 9CC30FF9A02B7EDE4033A8481A10536DF7751DA4BD5F5A05544BC52B3D51D71E2000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_006_646983970.2131868245"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_006_646983970.2131868245
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIFNoYXduOg0KDQpPbiBUaHUsIDIwMjQtMDYtMDYgYXQgMTc6MjYgKzA4MDAsIFNoYXduIFN1
bmcgd3JvdGU6DQo+IEZyb206IEhzaWFvIENoaWVuIFN1bmcgPHNoYXduLnN1bmdAbWVkaWF0ZWsu
Y29tPg0KPiANCj4gU3VwcG9ydCAiTm9uZSIgYWxwaGEgYmxlbmRpbmcgbW9kZSBvbiBNZWRpYVRl
aydzIGNoaXBzLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSHNpYW8gQ2hpZW4gU3VuZyA8c2hhd24u
c3VuZ0BtZWRpYXRlay5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19ldGhkci5jIHwgMTQgKysrKysrKysrKysrLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZXRoZHIuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZXRoZHIuYw0KPiBpbmRleCA0ZmZkMGEwNjQ4NjEuLmJjY2VkNjJlNDU1ZCAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19ldGhkci5jDQo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZXRoZHIuYw0KPiBAQCAtMyw2ICszLDcgQEANCj4gICAqIENv
cHlyaWdodCAoYykgMjAyMSBNZWRpYVRlayBJbmMuDQo+ICAgKi8NCj4gDQo+ICsjaW5jbHVkZSA8
ZHJtL2RybV9ibGVuZC5oPg0KPiAgI2luY2x1ZGUgPGRybS9kcm1fZm91cmNjLmg+DQo+ICAjaW5j
bHVkZSA8ZHJtL2RybV9mcmFtZWJ1ZmZlci5oPg0KPiAgI2luY2x1ZGUgPGxpbnV4L2Nsay5oPg0K
PiBAQCAtMTU0LDYgKzE1NSw3IEBAIHZvaWQgbXRrX2V0aGRyX2xheWVyX2NvbmZpZyhzdHJ1Y3Qg
ZGV2aWNlICpkZXYsIHVuc2lnbmVkIGludCBpZHgsDQo+ICAJdW5zaWduZWQgaW50IG9mZnNldCA9
IChwZW5kaW5nLT54ICYgMSkgPDwgMzEgfCBwZW5kaW5nLT55IDw8IDE2IHwgcGVuZGluZy0+eDsN
Cj4gIAl1bnNpZ25lZCBpbnQgYWxpZ25fd2lkdGggPSBBTElHTl9ET1dOKHBlbmRpbmctPndpZHRo
LCAyKTsNCj4gIAl1bnNpZ25lZCBpbnQgYWxwaGFfY29uID0gMDsNCj4gKwlib29sIHJlcGxhY2Vf
c3JjX2EgPSBmYWxzZTsNCj4gDQo+ICAJZGV2X2RiZyhkZXYsICIlcysgaWR4OiVkIiwgX19mdW5j
X18sIGlkeCk7DQo+IA0KPiBAQCAtMTczLDggKzE3NSwxNiBAQCB2b2lkIG10a19ldGhkcl9sYXll
cl9jb25maWcoc3RydWN0IGRldmljZSAqZGV2LCB1bnNpZ25lZCBpbnQgaWR4LA0KPiAgCWlmIChz
dGF0ZS0+YmFzZS5mYiAmJiBzdGF0ZS0+YmFzZS5mYi0+Zm9ybWF0LT5oYXNfYWxwaGEpDQo+ICAJ
CWFscGhhX2NvbiA9IE1JWEVSX0FMUEhBX0FFTiB8IE1JWEVSX0FMUEhBOw0KPiANCj4gLQltdGtf
bW1zeXNfbWl4ZXJfaW5fY29uZmlnKHByaXYtPm1tc3lzX2RldiwgaWR4ICsgMSwgYWxwaGFfY29u
ID8gZmFsc2UgOiB0cnVlLA0KPiAtCQkJCSAgREVGQVVMVF85QklUX0FMUEhBLA0KPiArCWlmIChz
dGF0ZS0+YmFzZS5waXhlbF9ibGVuZF9tb2RlID09IERSTV9NT0RFX0JMRU5EX1BJWEVMX05PTkUg
fHwNCj4gKwkgICAgKHN0YXRlLT5iYXNlLmZiICYmICFzdGF0ZS0+YmFzZS5mYi0+Zm9ybWF0LT5o
YXNfYWxwaGEpKSB7DQo+ICsJCS8qDQo+ICsJCSAqIE1peGVyIGRvZXNuJ3Qgc3VwcG9ydCBDT05T
VF9CTEQgbW9kZSwNCj4gKwkJICogdXNlIGEgdHJpY2sgdG8gbWFrZSB0aGUgb3V0cHV0IGVxdWl2
YWxlbnQNCj4gKwkJICovDQo+ICsJCXJlcGxhY2Vfc3JjX2EgPSB0cnVlOw0KPiArCX0NCj4gKw0K
PiArCW10a19tbXN5c19taXhlcl9pbl9jb25maWcocHJpdi0+bW1zeXNfZGV2LCBpZHggKyAxLCBy
ZXBsYWNlX3NyY19hLCBNSVhFUl9BTFBIQSwNCg0KSXQgc2VlbXMgb3JpZ2luYWxseSByZXBsYWNl
IHNvdXJjZSBhbHBoYSB3aXRoIDkgYml0cyBjb25zdGFudCBhbHBoYSwgYnV0IHRoaXMgcGF0Y2gg
Y2hhbmdlIHRvIDggYml0cyBjb25zdGFudCBhbHBoYS4NCkNoYW5naW5nIGZyb20gOSBiaXRzIHRv
IDggYml0cyBpcyBub3QgcmVsYXRlZCB0byB0aGlzIHBhdGNoLCBzbyBzZXBhcmF0ZSBpdCB0byBh
bm90aGVyIHBhdGNoLg0KDQpSZWdhcmRzLA0KQ0sNCg0KPiAgCQkJCSAgcGVuZGluZy0+eCAmIDEg
PyBNSVhFUl9JTlhfTU9ERV9FVkVOX0VYVEVORCA6DQo+ICAJCQkJICBNSVhFUl9JTlhfTU9ERV9C
WVBBU1MsIGFsaWduX3dpZHRoIC8gMiAtIDEsIGNtZHFfcGt0KTsNCj4gDQo+IC0tDQo+IDIuMTgu
MA0KPiANCj4gDQo=

--__=_Part_Boundary_006_646983970.2131868245
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtTaGF3bjoNCg0KT24mIzMyO1RodSwmIzMy
OzIwMjQtMDYtMDYmIzMyO2F0JiMzMjsxNzoyNiYjMzI7KzA4MDAsJiMzMjtTaGF3biYjMzI7U3Vu
ZyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjtGcm9tOiYjMzI7SHNpYW8mIzMyO0NoaWVuJiMzMjtTdW5n
JiMzMjsmbHQ7c2hhd24uc3VuZ0BtZWRpYXRlay5jb20mZ3Q7DQomZ3Q7JiMzMjsNCiZndDsmIzMy
O1N1cHBvcnQmIzMyOyZxdW90O05vbmUmcXVvdDsmIzMyO2FscGhhJiMzMjtibGVuZGluZyYjMzI7
bW9kZSYjMzI7b24mIzMyO01lZGlhVGVrJiMzOTtzJiMzMjtjaGlwcy4NCiZndDsmIzMyOw0KJmd0
OyYjMzI7U2lnbmVkLW9mZi1ieTomIzMyO0hzaWFvJiMzMjtDaGllbiYjMzI7U3VuZyYjMzI7Jmx0
O3NoYXduLnN1bmdAbWVkaWF0ZWsuY29tJmd0Ow0KJmd0OyYjMzI7LS0tDQomZ3Q7JiMzMjsmIzMy
O2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZXRoZHIuYyYjMzI7fCYjMzI7MTQmIzMyOysr
KysrKysrKysrKy0tDQomZ3Q7JiMzMjsmIzMyOzEmIzMyO2ZpbGUmIzMyO2NoYW5nZWQsJiMzMjsx
MiYjMzI7aW5zZXJ0aW9ucygrKSwmIzMyOzImIzMyO2RlbGV0aW9ucygtKQ0KJmd0OyYjMzI7DQom
Z3Q7JiMzMjtkaWZmJiMzMjstLWdpdCYjMzI7YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2V0aGRyLmMmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19ldGhkci5jDQomZ3Q7
JiMzMjtpbmRleCYjMzI7NGZmZDBhMDY0ODYxLi5iY2NlZDYyZTQ1NWQmIzMyOzEwMDY0NA0KJmd0
OyYjMzI7LS0tJiMzMjthL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZXRoZHIuYw0KJmd0
OyYjMzI7KysrJiMzMjtiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZXRoZHIuYw0KJmd0
OyYjMzI7QEAmIzMyOy0zLDYmIzMyOyszLDcmIzMyO0BADQomZ3Q7JiMzMjsmIzMyOyYjMzI7KiYj
MzI7Q29weXJpZ2h0JiMzMjsoYykmIzMyOzIwMjEmIzMyO01lZGlhVGVrJiMzMjtJbmMuDQomZ3Q7
JiMzMjsmIzMyOyYjMzI7Ki8NCiZndDsmIzMyOw0KJmd0OyYjMzI7KyNpbmNsdWRlJiMzMjsmbHQ7
ZHJtL2RybV9ibGVuZC5oJmd0Ow0KJmd0OyYjMzI7JiMzMjsjaW5jbHVkZSYjMzI7Jmx0O2RybS9k
cm1fZm91cmNjLmgmZ3Q7DQomZ3Q7JiMzMjsmIzMyOyNpbmNsdWRlJiMzMjsmbHQ7ZHJtL2RybV9m
cmFtZWJ1ZmZlci5oJmd0Ow0KJmd0OyYjMzI7JiMzMjsjaW5jbHVkZSYjMzI7Jmx0O2xpbnV4L2Ns
ay5oJmd0Ow0KJmd0OyYjMzI7QEAmIzMyOy0xNTQsNiYjMzI7KzE1NSw3JiMzMjtAQCYjMzI7dm9p
ZCYjMzI7bXRrX2V0aGRyX2xheWVyX2NvbmZpZyhzdHJ1Y3QmIzMyO2RldmljZSYjMzI7KmRldiwm
IzMyO3Vuc2lnbmVkJiMzMjtpbnQmIzMyO2lkeCwNCiZndDsmIzMyOyYjMzI7dW5zaWduZWQmIzMy
O2ludCYjMzI7b2Zmc2V0JiMzMjs9JiMzMjsocGVuZGluZy0mZ3Q7eCYjMzI7JmFtcDsmIzMyOzEp
JiMzMjsmbHQ7Jmx0OyYjMzI7MzEmIzMyO3wmIzMyO3BlbmRpbmctJmd0O3kmIzMyOyZsdDsmbHQ7
JiMzMjsxNiYjMzI7fCYjMzI7cGVuZGluZy0mZ3Q7eDsNCiZndDsmIzMyOyYjMzI7dW5zaWduZWQm
IzMyO2ludCYjMzI7YWxpZ25fd2lkdGgmIzMyOz0mIzMyO0FMSUdOX0RPV04ocGVuZGluZy0mZ3Q7
d2lkdGgsJiMzMjsyKTsNCiZndDsmIzMyOyYjMzI7dW5zaWduZWQmIzMyO2ludCYjMzI7YWxwaGFf
Y29uJiMzMjs9JiMzMjswOw0KJmd0OyYjMzI7K2Jvb2wmIzMyO3JlcGxhY2Vfc3JjX2EmIzMyOz0m
IzMyO2ZhbHNlOw0KJmd0OyYjMzI7DQomZ3Q7JiMzMjsmIzMyO2Rldl9kYmcoZGV2LCYjMzI7JnF1
b3Q7JXMrJiMzMjtpZHg6JWQmcXVvdDssJiMzMjtfX2Z1bmNfXywmIzMyO2lkeCk7DQomZ3Q7JiMz
MjsNCiZndDsmIzMyO0BAJiMzMjstMTczLDgmIzMyOysxNzUsMTYmIzMyO0BAJiMzMjt2b2lkJiMz
MjttdGtfZXRoZHJfbGF5ZXJfY29uZmlnKHN0cnVjdCYjMzI7ZGV2aWNlJiMzMjsqZGV2LCYjMzI7
dW5zaWduZWQmIzMyO2ludCYjMzI7aWR4LA0KJmd0OyYjMzI7JiMzMjtpZiYjMzI7KHN0YXRlLSZn
dDtiYXNlLmZiJiMzMjsmYW1wOyZhbXA7JiMzMjtzdGF0ZS0mZ3Q7YmFzZS5mYi0mZ3Q7Zm9ybWF0
LSZndDtoYXNfYWxwaGEpDQomZ3Q7JiMzMjsmIzMyO2FscGhhX2NvbiYjMzI7PSYjMzI7TUlYRVJf
QUxQSEFfQUVOJiMzMjt8JiMzMjtNSVhFUl9BTFBIQTsNCiZndDsmIzMyOw0KJmd0OyYjMzI7LW10
a19tbXN5c19taXhlcl9pbl9jb25maWcocHJpdi0mZ3Q7bW1zeXNfZGV2LCYjMzI7aWR4JiMzMjsr
JiMzMjsxLCYjMzI7YWxwaGFfY29uJiMzMjsmIzYzOyYjMzI7ZmFsc2UmIzMyOzomIzMyO3RydWUs
DQomZ3Q7JiMzMjstJiMzMjsmIzMyO0RFRkFVTFRfOUJJVF9BTFBIQSwNCiZndDsmIzMyOytpZiYj
MzI7KHN0YXRlLSZndDtiYXNlLnBpeGVsX2JsZW5kX21vZGUmIzMyOz09JiMzMjtEUk1fTU9ERV9C
TEVORF9QSVhFTF9OT05FJiMzMjt8fA0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7KHN0
YXRlLSZndDtiYXNlLmZiJiMzMjsmYW1wOyZhbXA7JiMzMjshc3RhdGUtJmd0O2Jhc2UuZmItJmd0
O2Zvcm1hdC0mZ3Q7aGFzX2FscGhhKSkmIzMyO3sNCiZndDsmIzMyOysvKg0KJmd0OyYjMzI7KyYj
MzI7KiYjMzI7TWl4ZXImIzMyO2RvZXNuJiMzOTt0JiMzMjtzdXBwb3J0JiMzMjtDT05TVF9CTEQm
IzMyO21vZGUsDQomZ3Q7JiMzMjsrJiMzMjsqJiMzMjt1c2UmIzMyO2EmIzMyO3RyaWNrJiMzMjt0
byYjMzI7bWFrZSYjMzI7dGhlJiMzMjtvdXRwdXQmIzMyO2VxdWl2YWxlbnQNCiZndDsmIzMyOysm
IzMyOyovDQomZ3Q7JiMzMjsrcmVwbGFjZV9zcmNfYSYjMzI7PSYjMzI7dHJ1ZTsNCiZndDsmIzMy
Oyt9DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsrbXRrX21tc3lzX21peGVyX2luX2NvbmZpZyhwcml2
LSZndDttbXN5c19kZXYsJiMzMjtpZHgmIzMyOysmIzMyOzEsJiMzMjtyZXBsYWNlX3NyY19hLCYj
MzI7TUlYRVJfQUxQSEEsDQoNCkl0JiMzMjtzZWVtcyYjMzI7b3JpZ2luYWxseSYjMzI7cmVwbGFj
ZSYjMzI7c291cmNlJiMzMjthbHBoYSYjMzI7d2l0aCYjMzI7OSYjMzI7Yml0cyYjMzI7Y29uc3Rh
bnQmIzMyO2FscGhhLCYjMzI7YnV0JiMzMjt0aGlzJiMzMjtwYXRjaCYjMzI7Y2hhbmdlJiMzMjt0
byYjMzI7OCYjMzI7Yml0cyYjMzI7Y29uc3RhbnQmIzMyO2FscGhhLg0KQ2hhbmdpbmcmIzMyO2Zy
b20mIzMyOzkmIzMyO2JpdHMmIzMyO3RvJiMzMjs4JiMzMjtiaXRzJiMzMjtpcyYjMzI7bm90JiMz
MjtyZWxhdGVkJiMzMjt0byYjMzI7dGhpcyYjMzI7cGF0Y2gsJiMzMjtzbyYjMzI7c2VwYXJhdGUm
IzMyO2l0JiMzMjt0byYjMzI7YW5vdGhlciYjMzI7cGF0Y2guDQoNClJlZ2FyZHMsDQpDSw0KDQom
Z3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjtwZW5kaW5nLSZndDt4JiMzMjsmYW1wOyYjMzI7MSYjMzI7
JiM2MzsmIzMyO01JWEVSX0lOWF9NT0RFX0VWRU5fRVhURU5EJiMzMjs6DQomZ3Q7JiMzMjsmIzMy
OyYjMzI7JiMzMjtNSVhFUl9JTlhfTU9ERV9CWVBBU1MsJiMzMjthbGlnbl93aWR0aCYjMzI7LyYj
MzI7MiYjMzI7LSYjMzI7MSwmIzMyO2NtZHFfcGt0KTsNCiZndDsmIzMyOw0KJmd0OyYjMzI7LS0N
CiZndDsmIzMyOzIuMTguMA0KJmd0OyYjMzI7DQomZ3Q7JiMzMjsNCg0KPC9wcmU+DQo8L3A+PC9i
b2R5PjwvaHRtbD48IS0tdHlwZTp0ZXh0LS0+PCEtLXstLT48cHJlPioqKioqKioqKioqKiogTUVE
SUFURUsgQ29uZmlkZW50aWFsaXR5IE5vdGljZQ0KICoqKioqKioqKioqKioqKioqKioqDQpUaGUg
aW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBh
bnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnksIHByaXZp
bGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNh
YmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29udmV5ZWQgb25seSB0byB0aGUgZGVz
aWduYXRlZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3NlbWluYXRpb24sIA0KZGlzdHJpYnV0
aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGluY2x1
ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMgc3Ry
aWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90IGFu
IGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZQ0KIA0KdGhhdCB5
b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUg
c2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRl
IGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFj
aG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29udGVu
dCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3ByZT48
IS0tfS0tPg==

--__=_Part_Boundary_006_646983970.2131868245--

