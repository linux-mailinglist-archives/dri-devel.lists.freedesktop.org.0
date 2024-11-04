Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F319BAADF
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 03:35:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A00D10E11D;
	Mon,  4 Nov 2024 02:35:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="e923AXfV";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="dXAm1+b+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4525910E11D
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2024 02:35:20 +0000 (UTC)
X-UUID: 6df2b7e89a5511efb88477ffae1fc7a5-20241104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=IixnfMyN9ZqtbY1UF8Avnp8E2NJRnuUAXkYoGgngJVc=; 
 b=e923AXfV0xVo7qoBu75aNEzDTglRAhPlvb/+b0FcMOP2Zp8fphOUb/uXl1he9Jyfbmphk6Q8d1gR58oyA5Wnsq10NxlDJ4c83LhUzcvGiLKTlcz5o0VsqCBJHAR/AkZylj2QeJW5o15XciIFV2uXoD4NP+y1O+DK3tHZP72PeuA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42, REQID:3eccfb79-8926-4d07-afb1-8e2fff99495f, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:b0fcdc3, CLOUDID:3998a048-ca13-40ea-8070-fa012edab362,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 6df2b7e89a5511efb88477ffae1fc7a5-20241104
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1516106388; Mon, 04 Nov 2024 10:35:17 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 4 Nov 2024 10:35:16 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 4 Nov 2024 10:35:16 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DrilGTA5gs80EnzapC9aX3cGYPJermf/VNsUhrO2lSThB6S5rwtWAL+gnvUQF56jgNo4LCPQvtaeoKMdffJljRMbhhybKJsb6efUf72yOMcXJgCLLDVGXFUFTTnEliaOglM3FfHa2v5Bmjp/1/ulZr1pSp02yKjcy0SfE7T3aI0i+qD+JIsUKYiMdYKg/9lsElhbGKH7Uk2WbWU9fwSBB8ghxvmvHkSMmi6adDW3JFcjHrgS/Zsgj/MYp1hrfG37pa/OFeuQsK6I4YYCTteF1sVW+9cjFep3brsIJbbRNPHzJh22/jltxZSVo3yAQtGkIwXZcmhjHoWe/+Q45xLIMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pNiLG21vuxKtveOWbG3lGkl4pQMFLMNm9UYpVQaLssc=;
 b=DEeQZIfMHmnWe8r34MFqzijlFSs4T4yyRfcPwv9K0ygicrwOAakVfF6TGaFplNs9WssCRiDtAd/+EnZkSYk+wlTu7AvmkeYEhQSeLhFXGsPx4fpIbYsThVyM+XmWcOJ1vEUpFeZYNG9/BEiNgcgqF6rqcluiCykNiC013QzI9TNsWWbHxwmG1uA5VXIEfh0R9rU/XQS35uh4YHSO4fkVnyaAac68assForsXtvWvX89wbKgWqjG9JhO+J/LuaiEYuqsIZjcb2JF0H9WrT2yrThJudC9bRspYz6D8HBczs/+bSboyrN6MbjkFFegGFOaXr/I9tlsJKzO0um04cKa4Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pNiLG21vuxKtveOWbG3lGkl4pQMFLMNm9UYpVQaLssc=;
 b=dXAm1+b+NBp7eG5HLqllGp13Fy/t2fVwP+HCuvAz3CQQUfL595ceMi+P8hbXrmy7D5nayfNhPbog23B+NeB6f4Cfndk0xIvwkkZPB9sOstLy2hp7nF1ltHVdFz3VSIVvihLc3CRFUIjLpEFwbijEAXt9ViznEvGpZV5ewCljERE=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB8461.apcprd03.prod.outlook.com (2603:1096:405:72::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.23; Mon, 4 Nov
 2024 02:35:13 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 02:35:13 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>, "mchehab@kernel.org"
 <mchehab@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?utf-8?B?U2h1LWhzaWFuZyBZYW5nICjmpYroiJLnv5Qp?=
 <Shu-hsiang.Yang@mediatek.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "yunkec@chromium.org" <yunkec@chromium.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, =?utf-8?B?WWF5YSBDaGFuZyAo5by16ZuF5riFKQ==?=
 <Yaya.Chang@mediatek.com>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?utf-8?B?VGVkZHkgQ2hlbiAo6Zmz5Lm+5YWDKQ==?= <Teddy.Chen@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "hidenorik@chromium.org"
 <hidenorik@chromium.org>, =?utf-8?B?U2h1bi1ZaSBXYW5nICjnjovpoIblhIQp?=
 <Shun-Yi.Wang@mediatek.com>
Subject: Re: [PATCH v1 04/10] media: platform: mediatek: add isp_7x cam-raw
 unit
Thread-Topic: [PATCH v1 04/10] media: platform: mediatek: add isp_7x cam-raw
 unit
Thread-Index: AQHbGj2G8utVn4Ab5UaBggOzyqwWS7Kmj90A
Date: Mon, 4 Nov 2024 02:35:13 +0000
Message-ID: <41d02cf11098269af44d06ba7c9930ae4a5e83a2.camel@mediatek.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
 <20241009111551.27052-5-Shu-hsiang.Yang@mediatek.com>
In-Reply-To: <20241009111551.27052-5-Shu-hsiang.Yang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB8461:EE_
x-ms-office365-filtering-correlation-id: 3f0875ef-0d1e-4be6-bbde-08dcfc794f7b
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?cWx6UDZMd1FXVWg1UExXSDNBMXo3MVQ5MzJCNDVuOXJRczFEMzczWFhEN3lV?=
 =?utf-8?B?ek5hSytMbzRJa0pvUGplTW9WN3dpTmMzODg4YnFvdnJrVmJWbnphMUJoZ016?=
 =?utf-8?B?YnJVSWJoVW05Nm9RSzlVWk92bVlSVXp4bGdnbzBZS01NZ3R0d2c2bUxXV0k3?=
 =?utf-8?B?aDNvNmdHcWZNbU4wMi9nVHRxNFA4c1F3UFFydGdLV0J3bDZGemZpb1lDMXlk?=
 =?utf-8?B?WHBqWFB3UlUxUmo2Nlh4WmNvNHhNWVlpbXlQQkdsc3ZReGFBTjdwMk9lTm9H?=
 =?utf-8?B?d3JoakNWcVVqUjhkYi9td0ZHZm4xVjRCQm1aNDMzRWVYclZvSEt1N2U4dTNU?=
 =?utf-8?B?VzVpWmkvd2krUGdqdFBHRXhLUXFPSmQwK2tuNTNMSVJFUXltd0NRVGVLOWFE?=
 =?utf-8?B?ckR1ZTBxWmRNMnQ5LzRyRit4eUE2bm11RlFkYVROQXhKZmV0MWEwSW83VFZR?=
 =?utf-8?B?SXBOcnBCdEk4d3JHRUJaNkk1M1VnSy9mZk4wODBFaEVMRXNYRjhtMU5jY0s5?=
 =?utf-8?B?eHN3U1hXRlA4MGdqbjQrK3dPZWxaWkVOU0xYbzFRLzVYTTArakxFSSs4T043?=
 =?utf-8?B?b3N1ZHQ5ZTZpTGswVGhYc2p4SHVzMGpCclIyUmozbGNjUTFHSUYrdjlYQlNB?=
 =?utf-8?B?MHZJUzNrTFYvSEM3RFNhWE5WNEM5ZE1NRmhXREZLV2Vqam5XTkpHS3ZYTnlX?=
 =?utf-8?B?TWhPRXROVWg2aGpjYWh0eVQ5SUlNUklCWmxRakdyZTJkanFRb3Q0dWFUenBL?=
 =?utf-8?B?NVo2dVJ2WitVL1drM0lRQXdzRFk4VXg2T29hRklKbkRxZVFHZkRGWlFnWnVk?=
 =?utf-8?B?MVVweVREVkIxR21YOVNuc0dLY2lwbnlMNkZWOFRKZGt6bjhkSVdtWVVMc3Ba?=
 =?utf-8?B?THcybEMwZlNLblFOeHFqU3JLMTArMlRHYXBkcklKOUhxaXRmUXNBa250b2Vq?=
 =?utf-8?B?WVJ2ajQ2Z1NmYUptaW85U3JTZUJ0cWVXVWdlUVRBQ3ZkNU03dWlvRE9ZVTZZ?=
 =?utf-8?B?ZjJtVEYvSy96WG5YZnp3WlBZQ0FlVm55czllQzJCZWpnM3B4UDl0SC9kakxp?=
 =?utf-8?B?aHhGR28wWDRmMXZra1Q1Y2JkM3Fwck92TG45R2hYd1psNFNEWlpudXZLY2RJ?=
 =?utf-8?B?azNaU04ybUptUGdYK1Eya2cwdTNVYVFwdUJRd3hkVnFBQlo3cU0zdmtqWXdo?=
 =?utf-8?B?bE1DVWdJVk9VU1RwNFE0TkhVYkdEZjdFSTBicUNhRkIrdEM2ZDJzRXNlZWh4?=
 =?utf-8?B?UWxnUW8vVWllc3FQd1NPVFJUWVFLMXNLWEtvdXJlZ0t6Yk96dm1xUWo4M2g5?=
 =?utf-8?B?cGFENzM1TnI3VEdscnU4Zy9SbStaem1xWmhLbGFQcFJFRm1KMmtUZzhORXVO?=
 =?utf-8?B?L1Vva0NOWTk4endPQTBXQkxXNFFjSFJlVGV1dkJaTFlZcUFzNmVSUG81QkZs?=
 =?utf-8?B?VlBPbkFsVWVQWjA2NHVlSmx2WUZ4Um5lendvK0wwQzAxdEV2aS9BYWpmMVhV?=
 =?utf-8?B?OUhGSHhUZTdTdVZtanNEaFZObUlHWFk1RzlyOC92MURqMkRIREJqZCswMEtH?=
 =?utf-8?B?eTRBVFN1b2tsa0xablI5S0tEMnhma1hjSEtHZFlMUUY5VlVWMXJiRzhHb0ZN?=
 =?utf-8?B?S0xNWkRxT2Vld2hSRjVtTmlZMkxKNE9zRTZRVTRUSTI1b1grWTlvV0Q1blJW?=
 =?utf-8?B?RE9UdEkwNmJXeHh1OTV6MU5qRkh6N0dPbUVzRHR4RjB6UzF4RlF0QjZ2Sk9L?=
 =?utf-8?B?am52Y2ZFellLR21kYlVXaW9QNXJsVVgxN3JPRHNhTVFySUF0NWlJY0VHQk9X?=
 =?utf-8?Q?4k1/mBUhKLgoJHiHQDPgvoi5tp3/4PB6bfE1Q=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bzVudVIwdC9ZbUl1WFEzbGpUbUJRSEIybUw4Z3htVkxGZ3dLb0l6bjQ0VG1L?=
 =?utf-8?B?d0ZTcjc3WTJVWi9vajY1VXQ0YmorRjRBYklOVE1LSVp2U0Z3eCtYMThMTDdS?=
 =?utf-8?B?UXNvU0ppOFM3cktkL2syRVIwc2FOK2lGQXJHdkloN1B0b1ZodHo4NmQzZG5u?=
 =?utf-8?B?WHBTM05xME5tWnlMMUtRUVY0eFhvTTBGRVlCcWVPWFFTTWN5blFlVXdYRjhr?=
 =?utf-8?B?eGhEcm94eXMybWRTR0VsYW1Td2d3WnU4U1hnUWFRMFhvMTNJdjhiR1R0Njlq?=
 =?utf-8?B?ZFlQdzhyeEZXK3hFV2xUR3p1amNmSXpDUWJzRlBpWWkyMlFrbWZ2eUJ4UzRI?=
 =?utf-8?B?c203Q2JSdFNOUDJQSFJKR0l2aEdkQ05jSk1aTmVQWjg3TXh6ejNydFRXdFZ4?=
 =?utf-8?B?OWlHa0JwV3R1RHRUYVQ3ZGdFR1MwcmJrcnd4VWVvV3RaWGJuUHh1YTJURytm?=
 =?utf-8?B?V1hSOHNaT1ZxWGZ1Z1VaYU8relJhQmhwNjFSMHlXVk1FTENXUTlWbW9DZnpZ?=
 =?utf-8?B?TlhIemhlYkwzY3ZjWGtoS1ZQQ1lKbEdudXFHRllaNWhFMVdPTnpic0ZEaG13?=
 =?utf-8?B?anQrMTY5YnN5STc5SW82RzV6MEZaV2h1SXNZOE40UEduMUlqZm1xYVFzVzdr?=
 =?utf-8?B?VGlESTBISEZwS0paRDlmbE9HS1ZCNkZOVFJMaVo2OFhsVnlDWlFtR01nSnRU?=
 =?utf-8?B?eHlpeWtlcTJTdmdmYWpiUmN6S0RkL3RXRlFVRmxDOVFBdXBvU21qbjlROTlB?=
 =?utf-8?B?dkJjRC9sMHJwL3FScjdqeTdIWGxtS3g0ODlRaFlBNHp4L21aM1RSRUtocjVX?=
 =?utf-8?B?c3RqWk05bFNkUjdyamZmaUsyNkhxbGF4aXV5OE1jQkQ5aklxNmlHNllYMDVj?=
 =?utf-8?B?ZVg0T2JUazhUdmpnQmFYWFduMFpseVNtazBXT01xeURYQk9OYU9xNEtTTnpy?=
 =?utf-8?B?Vmt0bng5T2dqd01uQzR4c1RyREo5OXB3akRpSGhCSVZ5OW5GUi9MTUJWZUp4?=
 =?utf-8?B?OFU0bHM5V29XOVBUbXdFekJFc2ZnYkFkektvZWxROGhraEg3RjRveUs5ZkdK?=
 =?utf-8?B?R1JycVRDN25URnp3MW5aby9yTG5weEhiMFQxMTdGcjg4L1MzZVo4aklwakdx?=
 =?utf-8?B?NnNDUEFnTzVCQUhTVjhzTVhUMlliT09pUC8xUCtqSEdjWU9ldE5aZnRNUlRh?=
 =?utf-8?B?QjQ1VVBTajR5ZS9BR0tyWWpwRjVqRlZlR0s3a3ltMmJBMnhOcjduYmlVeE5D?=
 =?utf-8?B?c2U2TmxrSzlUYTZaaEhaRDVXcFllMVI3Q1BkMlpFbStKNmVFbSs1MVd4ZU5J?=
 =?utf-8?B?OEhwRHdKc01yOHQ3Qm96OG5raEs4M2pYWkJ0Q0I5Wmx6QWkvMUd3Y0xJbDg3?=
 =?utf-8?B?UFZaT3JmNzluLzNXcGF0WC9wc2Frc0NEVFVxNlB2UHJHNTlmVDFmbkJDRXJq?=
 =?utf-8?B?b1JvN0pWZ2dHMkZZcDdPRTNjL3dqYjBrdjVjdjQvUE1BTUk5ZytCaVFqYm5T?=
 =?utf-8?B?VU9yRFhCcDRXWHdnWE15LzNFQmRITzhVdnA5NURCZjd1VndEemJ5ZWxYVU44?=
 =?utf-8?B?UmVibFh2eXZ2MW8xYzE1clNTMllDOERSSkkzdkp5Sk9sbm0wT1c4Z2VDcWw3?=
 =?utf-8?B?aWZ4R1VTd2J3SDBENHhZYVNiOGVyd3N2VHk2NzZwSk5jSzNST2krVjVVaFVD?=
 =?utf-8?B?ZmNKQjgrUFFOKzZBd3VvcnY5MExYR1BuY1p1OFlZeE5wdFhiMW8wb1oxUzdo?=
 =?utf-8?B?UFdNNVF6YjM4d1FVeDBQdDhrQ2RnM1Y5WndrOFloMmxyVmZmSEh2R01Qc3VQ?=
 =?utf-8?B?eDNZYUZIUXQyL2NZY0tPZzh3Z0xjZGE0YXNrRzltWFlzdmxSeW1kQXVtVWda?=
 =?utf-8?B?VnVPY1JkZE9nQkZFR0dBT0VLc2huaFFyTlA1MWRhSDF1ZTRjeHZHYi9DN2hL?=
 =?utf-8?B?TUNOaVI0TDd4VG5NeGo0Mks4T3RTT2VpdEZrZVVaY3lyQlkxc0QvM3J5dnNq?=
 =?utf-8?B?MUJJUm9MYzhKcEtwOVVUWUNlVEJ2UTBFQUx3WWxOLzUwRXlWc203WU90R0lQ?=
 =?utf-8?B?eXVhT3prMnpDM2Z2Lytac0R0VnVhSWlwOEk0emNVR1A3cUZiNFltUUlkRjJ5?=
 =?utf-8?Q?Fp8XfxkCCSjwL0u1gMlhJvAqC?=
Content-ID: <8F9D1BE8DB9FF440B5905475252BDBCD@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f0875ef-0d1e-4be6-bbde-08dcfc794f7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2024 02:35:13.4053 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xyTfb98gmX5lkwCF4MXy70L+QIxWO7VDyyEito4ZDBo8dMpxDkF/MzGrdAmbuTLNkcaddJbyGFU3lce6rSQJOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8461
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--11.598800-8.000000
X-TMASE-MatchedRID: +c13yJDs901m6oeM5+OJFCaix8JZpk78jLOy13Cgb4+qvcIF1TcLYCQ5
 BpELg58DN51S4DAAHl+b/PTCT63STGA2IAXETeuKFYJUGv4DL3wK3iJpXUOQQxxeYFneYjlJak3
 KMPQUmrj1bYZf9+gtTmXe2kAh1Tz0Qv21zJNl0CyDGx/OQ1GV8rHlqZYrZqdI+gtHj7OwNO35N/
 S1zEq4uozRMjFl/UngUortlqjO+o6fn6dD3JtJO49cxXHiixxL
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--11.598800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 374AEDB6F5B141D3C011B161132BB515BDD4EB70049D315CBDF7BB90595E5D9C2000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_006_1184058668.1713156943"
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

--__=_Part_Boundary_006_1184058668.1713156943
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIFNodS1oc2lhbmc6DQoNCk9uIFdlZCwgMjAyNC0xMC0wOSBhdCAxOToxNSArMDgwMCwgU2h1
LWhzaWFuZyBZYW5nIHdyb3RlOg0KPiBJbnRyb2R1Y2VzIHRoZSBJU1AgcGlwZWxpbmUgZHJpdmVy
IGZvciB0aGUgTWVkaWFUZWsgSVNQIHJhdyBhbmQgeXV2DQo+IG1vZHVsZXMuIEtleSBmdW5jdGlv
bmFsaXRpZXMgaW5jbHVkZSBkYXRhIHByb2Nlc3NpbmcsIFY0TDIgaW50ZWdyYXRpb24sDQo+IHJl
c291cmNlIG1hbmFnZW1lbnQsIGRlYnVnIHN1cHBvcnQsIGFuZCB2YXJpb3VzIGNvbnRyb2wgb3Bl
cmF0aW9ucy4NCj4gQWRkaXRpb25hbGx5LCBJUlEgaGFuZGxpbmcsIHBsYXRmb3JtIGRldmljZSBt
YW5hZ2VtZW50LCBhbmQgTWVkaWFUZWsNCj4gSVNQIERNQSBmb3JtYXQgc3VwcG9ydCBhcmUgYWxz
byBpbmNsdWRlZC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFNodS1oc2lhbmcgWWFuZyA8U2h1LWhz
aWFuZy5ZYW5nQG1lZGlhdGVrLmNvbT4NCj4gLS0tDQoNCltzbmlwXQ0KDQo+ICt2b2lkIG10a19j
YW1fZHVtcF9yZXFfcmR5X3N0YXR1cyhzdHJ1Y3QgZGV2aWNlICpkZXYsDQo+ICsJCQkJIHZvaWQg
X19pb21lbSAqYmFzZSwgdm9pZCBfX2lvbWVtICp5dXZiYXNlKQ0KPiArew0KDQpUaGlzIGZ1bmN0
aW9uIGlzIHVzZWxlc3MsIHNvIGRyb3AgaXQuDQoNClJlZ2FyZHMsDQpDSw0KDQo+ICsJZGV2X2Ri
Z19yYXRlbGltaXRlZChkZXYsDQo+ICsJCQkgICAgIlJFUSBSQVcvMi8zIERNQS8yOiUwOHgvJTA4
eC8lMDh4LyUwOHgvJTA4eFxuIiwNCj4gKwkJCSAgICByZWFkbF9yZWxheGVkKGJhc2UgKyBSRUdf
Q1RMX1JBV19NT0RfUkVRX1NUQVQpLA0KPiArCQkJICAgIHJlYWRsX3JlbGF4ZWQoYmFzZSArIFJF
R19DVExfUkFXX01PRDJfUkVRX1NUQVQpLA0KPiArCQkJICAgIHJlYWRsX3JlbGF4ZWQoYmFzZSAr
IFJFR19DVExfUkFXX01PRDNfUkVRX1NUQVQpLA0KPiArCQkJICAgIHJlYWRsX3JlbGF4ZWQoYmFz
ZSArIFJFR19DVExfUkFXX01PRDVfUkVRX1NUQVQpLA0KPiArCQkJICAgIHJlYWRsX3JlbGF4ZWQo
YmFzZSArIFJFR19DVExfUkFXX01PRDZfUkVRX1NUQVQpKTsNCj4gKwlkZXZfZGJnX3JhdGVsaW1p
dGVkKGRldiwNCj4gKwkJCSAgICAiUkRZIFJBVy8yLzMgRE1BLzI6JTA4eC8lMDh4LyUwOHgvJTA4
eC8lMDh4XG4iLA0KPiArCQkJICAgIHJlYWRsX3JlbGF4ZWQoYmFzZSArIFJFR19DVExfUkFXX01P
RF9SRFlfU1RBVCksDQo+ICsJCQkgICAgcmVhZGxfcmVsYXhlZChiYXNlICsgUkVHX0NUTF9SQVdf
TU9EMl9SRFlfU1RBVCksDQo+ICsJCQkgICAgcmVhZGxfcmVsYXhlZChiYXNlICsgUkVHX0NUTF9S
QVdfTU9EM19SRFlfU1RBVCksDQo+ICsJCQkgICAgcmVhZGxfcmVsYXhlZChiYXNlICsgUkVHX0NU
TF9SQVdfTU9ENV9SRFlfU1RBVCksDQo+ICsJCQkgICAgcmVhZGxfcmVsYXhlZChiYXNlICsgUkVH
X0NUTF9SQVdfTU9ENl9SRFlfU1RBVCkpOw0KPiArCWRldl9kYmdfcmF0ZWxpbWl0ZWQoZGV2LA0K
PiArCQkJICAgICJSRVEgWVVWLzIvMy80IFdETUE6JTA4eC8lMDh4LyUwOHgvJTA4eC8lMDh4XG4i
LA0KPiArCQkJICAgIHJlYWRsX3JlbGF4ZWQoeXV2YmFzZSArIFJFR19DVExfUkFXX01PRF9SRVFf
U1RBVCksDQo+ICsJCQkgICAgcmVhZGxfcmVsYXhlZCh5dXZiYXNlICsgUkVHX0NUTF9SQVdfTU9E
Ml9SRVFfU1RBVCksDQo+ICsJCQkgICAgcmVhZGxfcmVsYXhlZCh5dXZiYXNlICsgUkVHX0NUTF9S
QVdfTU9EM19SRVFfU1RBVCksDQo+ICsJCQkgICAgcmVhZGxfcmVsYXhlZCh5dXZiYXNlICsgUkVH
X0NUTF9SQVdfTU9ENF9SRVFfU1RBVCksDQo+ICsJCQkgICAgcmVhZGxfcmVsYXhlZCh5dXZiYXNl
ICsgUkVHX0NUTF9SQVdfTU9ENV9SRVFfU1RBVCkpOw0KPiArCWRldl9kYmdfcmF0ZWxpbWl0ZWQo
ZGV2LA0KPiArCQkJICAgICJSRFkgWVVWLzIvMy80IFdETUE6JTA4eC8lMDh4LyUwOHgvJTA4eC8l
MDh4XG4iLA0KPiArCQkJICAgIHJlYWRsX3JlbGF4ZWQoeXV2YmFzZSArIFJFR19DVExfUkFXX01P
RF9SRFlfU1RBVCksDQo+ICsJCQkgICAgcmVhZGxfcmVsYXhlZCh5dXZiYXNlICsgUkVHX0NUTF9S
QVdfTU9EMl9SRFlfU1RBVCksDQo+ICsJCQkgICAgcmVhZGxfcmVsYXhlZCh5dXZiYXNlICsgUkVH
X0NUTF9SQVdfTU9EM19SRFlfU1RBVCksDQo+ICsJCQkgICAgcmVhZGxfcmVsYXhlZCh5dXZiYXNl
ICsgUkVHX0NUTF9SQVdfTU9ENF9SRFlfU1RBVCksDQo+ICsJCQkgICAgcmVhZGxfcmVsYXhlZCh5
dXZiYXNlICsgUkVHX0NUTF9SQVdfTU9ENV9SRFlfU1RBVCkpOw0KPiArfQ0KPiArDQoNCg==

--__=_Part_Boundary_006_1184058668.1713156943
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtTaHUtaHNpYW5nOg0KDQpPbiYjMzI7V2Vk
LCYjMzI7MjAyNC0xMC0wOSYjMzI7YXQmIzMyOzE5OjE1JiMzMjsrMDgwMCwmIzMyO1NodS1oc2lh
bmcmIzMyO1lhbmcmIzMyO3dyb3RlOg0KJmd0OyYjMzI7SW50cm9kdWNlcyYjMzI7dGhlJiMzMjtJ
U1AmIzMyO3BpcGVsaW5lJiMzMjtkcml2ZXImIzMyO2ZvciYjMzI7dGhlJiMzMjtNZWRpYVRlayYj
MzI7SVNQJiMzMjtyYXcmIzMyO2FuZCYjMzI7eXV2DQomZ3Q7JiMzMjttb2R1bGVzLiYjMzI7S2V5
JiMzMjtmdW5jdGlvbmFsaXRpZXMmIzMyO2luY2x1ZGUmIzMyO2RhdGEmIzMyO3Byb2Nlc3Npbmcs
JiMzMjtWNEwyJiMzMjtpbnRlZ3JhdGlvbiwNCiZndDsmIzMyO3Jlc291cmNlJiMzMjttYW5hZ2Vt
ZW50LCYjMzI7ZGVidWcmIzMyO3N1cHBvcnQsJiMzMjthbmQmIzMyO3ZhcmlvdXMmIzMyO2NvbnRy
b2wmIzMyO29wZXJhdGlvbnMuDQomZ3Q7JiMzMjtBZGRpdGlvbmFsbHksJiMzMjtJUlEmIzMyO2hh
bmRsaW5nLCYjMzI7cGxhdGZvcm0mIzMyO2RldmljZSYjMzI7bWFuYWdlbWVudCwmIzMyO2FuZCYj
MzI7TWVkaWFUZWsNCiZndDsmIzMyO0lTUCYjMzI7RE1BJiMzMjtmb3JtYXQmIzMyO3N1cHBvcnQm
IzMyO2FyZSYjMzI7YWxzbyYjMzI7aW5jbHVkZWQuDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1NpZ25l
ZC1vZmYtYnk6JiMzMjtTaHUtaHNpYW5nJiMzMjtZYW5nJiMzMjsmbHQ7U2h1LWhzaWFuZy5ZYW5n
QG1lZGlhdGVrLmNvbSZndDsNCiZndDsmIzMyOy0tLQ0KDQpbc25pcF0NCg0KJmd0OyYjMzI7K3Zv
aWQmIzMyO210a19jYW1fZHVtcF9yZXFfcmR5X3N0YXR1cyhzdHJ1Y3QmIzMyO2RldmljZSYjMzI7
KmRldiwNCiZndDsmIzMyOysmIzMyO3ZvaWQmIzMyO19faW9tZW0mIzMyOypiYXNlLCYjMzI7dm9p
ZCYjMzI7X19pb21lbSYjMzI7Knl1dmJhc2UpDQomZ3Q7JiMzMjsrew0KDQpUaGlzJiMzMjtmdW5j
dGlvbiYjMzI7aXMmIzMyO3VzZWxlc3MsJiMzMjtzbyYjMzI7ZHJvcCYjMzI7aXQuDQoNClJlZ2Fy
ZHMsDQpDSw0KDQomZ3Q7JiMzMjsrZGV2X2RiZ19yYXRlbGltaXRlZChkZXYsDQomZ3Q7JiMzMjsr
JiMzMjsmIzMyOyYjMzI7JiMzMjsmcXVvdDtSRVEmIzMyO1JBVy8yLzMmIzMyO0RNQS8yOiUwOHgv
JTA4eC8lMDh4LyUwOHgvJTA4eCYjOTI7biZxdW90OywNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMz
MjsmIzMyO3JlYWRsX3JlbGF4ZWQoYmFzZSYjMzI7KyYjMzI7UkVHX0NUTF9SQVdfTU9EX1JFUV9T
VEFUKSwNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyO3JlYWRsX3JlbGF4ZWQoYmFzZSYj
MzI7KyYjMzI7UkVHX0NUTF9SQVdfTU9EMl9SRVFfU1RBVCksDQomZ3Q7JiMzMjsrJiMzMjsmIzMy
OyYjMzI7JiMzMjtyZWFkbF9yZWxheGVkKGJhc2UmIzMyOysmIzMyO1JFR19DVExfUkFXX01PRDNf
UkVRX1NUQVQpLA0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7cmVhZGxfcmVsYXhlZChi
YXNlJiMzMjsrJiMzMjtSRUdfQ1RMX1JBV19NT0Q1X1JFUV9TVEFUKSwNCiZndDsmIzMyOysmIzMy
OyYjMzI7JiMzMjsmIzMyO3JlYWRsX3JlbGF4ZWQoYmFzZSYjMzI7KyYjMzI7UkVHX0NUTF9SQVdf
TU9ENl9SRVFfU1RBVCkpOw0KJmd0OyYjMzI7K2Rldl9kYmdfcmF0ZWxpbWl0ZWQoZGV2LA0KJmd0
OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JnF1b3Q7UkRZJiMzMjtSQVcvMi8zJiMzMjtETUEv
MjolMDh4LyUwOHgvJTA4eC8lMDh4LyUwOHgmIzkyO24mcXVvdDssDQomZ3Q7JiMzMjsrJiMzMjsm
IzMyOyYjMzI7JiMzMjtyZWFkbF9yZWxheGVkKGJhc2UmIzMyOysmIzMyO1JFR19DVExfUkFXX01P
RF9SRFlfU1RBVCksDQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjtyZWFkbF9yZWxheGVk
KGJhc2UmIzMyOysmIzMyO1JFR19DVExfUkFXX01PRDJfUkRZX1NUQVQpLA0KJmd0OyYjMzI7KyYj
MzI7JiMzMjsmIzMyOyYjMzI7cmVhZGxfcmVsYXhlZChiYXNlJiMzMjsrJiMzMjtSRUdfQ1RMX1JB
V19NT0QzX1JEWV9TVEFUKSwNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyO3JlYWRsX3Jl
bGF4ZWQoYmFzZSYjMzI7KyYjMzI7UkVHX0NUTF9SQVdfTU9ENV9SRFlfU1RBVCksDQomZ3Q7JiMz
MjsrJiMzMjsmIzMyOyYjMzI7JiMzMjtyZWFkbF9yZWxheGVkKGJhc2UmIzMyOysmIzMyO1JFR19D
VExfUkFXX01PRDZfUkRZX1NUQVQpKTsNCiZndDsmIzMyOytkZXZfZGJnX3JhdGVsaW1pdGVkKGRl
diwNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyZxdW90O1JFUSYjMzI7WVVWLzIvMy80
JiMzMjtXRE1BOiUwOHgvJTA4eC8lMDh4LyUwOHgvJTA4eCYjOTI7biZxdW90OywNCiZndDsmIzMy
OysmIzMyOyYjMzI7JiMzMjsmIzMyO3JlYWRsX3JlbGF4ZWQoeXV2YmFzZSYjMzI7KyYjMzI7UkVH
X0NUTF9SQVdfTU9EX1JFUV9TVEFUKSwNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyO3Jl
YWRsX3JlbGF4ZWQoeXV2YmFzZSYjMzI7KyYjMzI7UkVHX0NUTF9SQVdfTU9EMl9SRVFfU1RBVCks
DQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjtyZWFkbF9yZWxheGVkKHl1dmJhc2UmIzMy
OysmIzMyO1JFR19DVExfUkFXX01PRDNfUkVRX1NUQVQpLA0KJmd0OyYjMzI7KyYjMzI7JiMzMjsm
IzMyOyYjMzI7cmVhZGxfcmVsYXhlZCh5dXZiYXNlJiMzMjsrJiMzMjtSRUdfQ1RMX1JBV19NT0Q0
X1JFUV9TVEFUKSwNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyO3JlYWRsX3JlbGF4ZWQo
eXV2YmFzZSYjMzI7KyYjMzI7UkVHX0NUTF9SQVdfTU9ENV9SRVFfU1RBVCkpOw0KJmd0OyYjMzI7
K2Rldl9kYmdfcmF0ZWxpbWl0ZWQoZGV2LA0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7
JnF1b3Q7UkRZJiMzMjtZVVYvMi8zLzQmIzMyO1dETUE6JTA4eC8lMDh4LyUwOHgvJTA4eC8lMDh4
JiM5MjtuJnF1b3Q7LA0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7cmVhZGxfcmVsYXhl
ZCh5dXZiYXNlJiMzMjsrJiMzMjtSRUdfQ1RMX1JBV19NT0RfUkRZX1NUQVQpLA0KJmd0OyYjMzI7
KyYjMzI7JiMzMjsmIzMyOyYjMzI7cmVhZGxfcmVsYXhlZCh5dXZiYXNlJiMzMjsrJiMzMjtSRUdf
Q1RMX1JBV19NT0QyX1JEWV9TVEFUKSwNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyO3Jl
YWRsX3JlbGF4ZWQoeXV2YmFzZSYjMzI7KyYjMzI7UkVHX0NUTF9SQVdfTU9EM19SRFlfU1RBVCks
DQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjtyZWFkbF9yZWxheGVkKHl1dmJhc2UmIzMy
OysmIzMyO1JFR19DVExfUkFXX01PRDRfUkRZX1NUQVQpLA0KJmd0OyYjMzI7KyYjMzI7JiMzMjsm
IzMyOyYjMzI7cmVhZGxfcmVsYXhlZCh5dXZiYXNlJiMzMjsrJiMzMjtSRUdfQ1RMX1JBV19NT0Q1
X1JEWV9TVEFUKSk7DQomZ3Q7JiMzMjsrfQ0KJmd0OyYjMzI7Kw0KDQoNCjwvcHJlPg0KPC9wPjwv
Ym9keT48L2h0bWw+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioqKioqIE1F
RElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UgKioqKioqKioqKioqKioqKioqKioNClRoZSBp
bmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFu
eSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmlldGFyeSwgcHJpdmls
ZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxpY2Fi
bGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5IHRvIHRoZSBkZXNp
Z25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlvbiwgDQpkaXN0cmlidXRp
b24sIHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVk
aW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lwaWVudChzKSBpcyBzdHJp
Y3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBub3QgYW4g
aW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxpZXZlIA0KdGhhdCB5b3Ug
aGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2Vu
ZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFu
eSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1l
bnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBv
ZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3ByZT48IS0t
fS0tPg==

--__=_Part_Boundary_006_1184058668.1713156943--

