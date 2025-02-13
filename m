Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B90C8A33940
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 08:53:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 107F610EA17;
	Thu, 13 Feb 2025 07:53:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="qjb8cYbw";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="kGRXIxFk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1245010EA17
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 07:53:08 +0000 (UTC)
X-UUID: 8c91a842e9df11efbd192953cf12861f-20250213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=JwuYFY7TP6yGwfMW36RSeq0emF1bTCi8dqghLE03aY4=; 
 b=qjb8cYbwtuGQT4DiN3daC7gULH+bbC6JIFJfabaLG7NW+Mvh4iHEdhLUfG1Foa3im3Xk+fuOyCiQZii9kWipi2/tvH0Qlv0i84VGu1li+xpR6KnAYvaxjqi8thP1fEgyj0qMrncCDah4IE7vwcBT1n4x4I30m9zRz0CzrJ/TCl0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46, REQID:cdf42d33-82d9-4ecc-9170-f2ba0c144d5a, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:60aa074, CLOUDID:5fc94e8f-637d-4112-88e4-c7792fee6ae2,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
 EDM:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
 ,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 8c91a842e9df11efbd192953cf12861f-20250213
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 830585197; Thu, 13 Feb 2025 15:53:01 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Thu, 13 Feb 2025 15:53:00 +0800
Received: from HK2PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Thu, 13 Feb 2025 15:53:00 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=By5ePL31AK6U5Qr02T3IRttU4b0AuAf0xzqcg98f0oOFSJpqv9UVrMRtayZNUbFVfrcJ0SPluMn4TQlNr0TUGhbkzLSb7F99AjInc8iScs//U+LOzx624sWrsv6lrY4po5+e9j/xbU/abxUwY1qJBDSO76qj1HaikzF2It81kAlLBB0yr8tbpowxRYT4qHOlosHcEYFqq7P+79M2ktpUjU6FTwHALAx8sFkOTDZaIanzApoBP/vx/pcS2DhOgrj9JHuOjXDsQlLOIUax4Iajl1H7j3EgtRsfhQ/aOcp0IjUymS2m3qN3N4Lkr/ciHIkMsIm0Ysiw70Np4xHGRvjbTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NzVpoKfVGFf0jOvgypQErbUlM+4WcuMtuLjjCVzF1BY=;
 b=kOvTrw9fowanccYzcacS37/xv6980xSARmb4luTpd9Os4LO1Nh5ox2OykVzOiHjaXlNzVORa0nyCvTiPuEHOeomx+z7T8XQz+9wlhSYy1VVCF9PTU4dmf/kw8509Phz3YfmWcleVYpVK3fsyYuJDVxb8MRVNtplqeLMEzWbGuGUHgzbXFYEvNng8P8BFJElnDF0soubncB0YSDdPvSA4cNXxJ8eDOZIHK894lfYbwZPx0brUg4VIXcHfLTQ45nAwC0sWKZNHQ+OrO+psBkJNTodvvKknO5uBjCKZuduSpfZcYRekLmjGBtRhwbpr2bU6kiqpXDb7j0kf3zcV+KknpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NzVpoKfVGFf0jOvgypQErbUlM+4WcuMtuLjjCVzF1BY=;
 b=kGRXIxFkSHGHngQ8+HeH01IZ01ns3l81hvLmeOykd6KkrdBShPmEuTHpI0xVqimLHOLnbIZpXlR6IPsUjAzLqGMAVZ5nbDPJ72zkTJKE5UEcZruwLSujEhLOE1uHeTP0J3jy3tqnwza7N4m3ToOqlGHTq1sMvCbOGHvyGDy+8o0=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB6979.apcprd03.prod.outlook.com (2603:1096:400:284::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Thu, 13 Feb
 2025 07:52:58 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8422.015; Thu, 13 Feb 2025
 07:52:58 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "jie.qiu@mediatek.com"
 <jie.qiu@mediatek.com>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "mripard@kernel.org"
 <mripard@kernel.org>, =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?=
 <jitao.shi@mediatek.com>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "kernel@collabora.com" <kernel@collabora.com>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 =?utf-8?B?TGV3aXMgTGlhbyAo5buW5p+P6YieKQ==?= <Lewis.Liao@mediatek.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, =?utf-8?B?VG9tbXlZTCBDaGVuICjpmbPlvaXoia8p?=
 <TommyYL.Chen@mediatek.com>, =?utf-8?B?SXZlcyBDaGVuamggKOmZs+S/iuW8mCk=?=
 <Ives.Chenjh@mediatek.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?=
 <Jason-JH.Lin@mediatek.com>, "junzhi.zhao@mediatek.com"
 <junzhi.zhao@mediatek.com>
Subject: Re: [PATCH v6 29/42] drm/mediatek: mtk_hdmi: Remove ifdef for
 CONFIG_PM_SLEEP
Thread-Topic: [PATCH v6 29/42] drm/mediatek: mtk_hdmi: Remove ifdef for
 CONFIG_PM_SLEEP
Thread-Index: AQHbfHkycjO3KYv4SUGqlGR1CuWL17NE36SA
Date: Thu, 13 Feb 2025 07:52:58 +0000
Message-ID: <b778f4af3729b6dd0d0ff8ef59e67ee44629593f.camel@mediatek.com>
References: <20250211113409.1517534-1-angelogioacchino.delregno@collabora.com>
 <20250211113409.1517534-30-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250211113409.1517534-30-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB6979:EE_
x-ms-office365-filtering-correlation-id: f8c6caaa-a1d8-421b-7e2c-08dd4c036e97
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?VUFzMlY2aGxpK0lhQ2RBQTJDMkFvVmJTem5ueUxvUW9lcmhNWTFZYlVEdERh?=
 =?utf-8?B?c0NUc0JTL1pUQ24vVU56SUxBSGJPdnNJODFabUFrazJpeVZEb2JVeXFHakgv?=
 =?utf-8?B?Tnh5ajJQRUpIaDY3RjFEc21kSVhCS3Q1QzVaRUd4dGpLNGszQzhLM1p5L2RB?=
 =?utf-8?B?L1hvUlAzTTJWMUszTVVpR2xMaTFxcDlKK2xGWnlNRzE0cHdKV2xscHZlajBQ?=
 =?utf-8?B?Ti96VUhldURSSEFMMHFSTVc2cUx4bjg3NitMRm1XOWpXU202eU5oRGlBSWt1?=
 =?utf-8?B?NityZCtCTUhmOVhQQnorYnAzRFBiUDltalk2VWJQczg5VkUwdXpydXZsL3FF?=
 =?utf-8?B?Q3hITHdaNzZPazh5Qy8wSHFrOWJjTzJkaTRWcS94WFpXVStqbG94S2dFWTlr?=
 =?utf-8?B?YmRnOVh4bmloa3VMcVpreUNlaGlCRnNNeWsyQzRmK0JwTVdXeTcwc0Vhc2lo?=
 =?utf-8?B?NnZ5N3ZEZmJYZHVNd2YrYmt5cEl4aW9od1BySXRZbTZvVDZpSy9hUWRYeVV6?=
 =?utf-8?B?WEZ6eE5SMTJBQmZ0VGYrall2WjkzVDRGMGxod2UyT2dLV3RqOVJjSnQwOHI3?=
 =?utf-8?B?Y3NLYlUzVHFvKzVjM05JbzQvRFJtTVRrN2hxQitiT3FOK1Eva1ZaSEliSGsz?=
 =?utf-8?B?NXkwOEw4K1VhSDg3VDl0UTJQdXFJNXVkVnVQOWVxa0RvMm1VOVRIck45REZT?=
 =?utf-8?B?ckdFRU9TNWd6TU80OTcwaDkvMHRROHkrejlWamFWRTh3VFd6OGUxVCtrV0hK?=
 =?utf-8?B?MUVBRk05QXhTc0wzaUZkQXVxc0FQWGdNamxCYTRQWHJsbWt1VEliem02YTh0?=
 =?utf-8?B?eitrdmpWU1o2a3UxZWR2RCs2dzFkZnJhS2xsbWcva0JCNm04K0MyQVkxaHEz?=
 =?utf-8?B?dU05Wmw5K0JxR3E1VGYvSjYzTVkwODhxL0tvWFlVR3pWb1FVd3Vmb3JUMmpv?=
 =?utf-8?B?WGdZSVYxRU9neHZzSXgzUHFrOWUxNjdXR2Mzekw3SndHanVxYXNLZ0pvUGlr?=
 =?utf-8?B?SmNmTm05eWhYK2RGb0s4ZHFTRUNsNHpYOFk1bG1VNVJvT3VhMGtsK2JmRkw4?=
 =?utf-8?B?RVBvOG5KNVZDLzQ1eS8yVTBQYURjeWNrdkZYZm53R0RQVnU4N1VQVmdVZi9E?=
 =?utf-8?B?MTZQMDhEVGFISFNhYTJ4SlBJNGRQM2ZndE1kenJNSEs1OTdTSUhJQ3N5YXRn?=
 =?utf-8?B?a0dyU0F5eTI2djcrOEFOcWtLMjBWa3pVTFEzc01makhZU3MxU0pyYWN1VWI3?=
 =?utf-8?B?UlhpdGV2OEZKbUhQZlpDRmFwblhQUUlRMmQycmgwcXFLYU9vSU0wbFFPazIx?=
 =?utf-8?B?em5wUnRQeDhQUmErOG85Tk1Jc0trd2lqbnVDTzJpei90QkRjUjB3RWdEeFVt?=
 =?utf-8?B?eEROSk5RajcyT2hPSHVnY0JQc3dja1dRRTNVVGxZeTBncFIwKzcrY3pZZ3RK?=
 =?utf-8?B?MW56WUxZd1UycmxTTUt4TVB4UnpTVmZ6YlFXemFaTjloK2dMUVkxdXZ5S1hP?=
 =?utf-8?B?Mm84UmlJdmttQVNkL0NTeTNEQ2dkY1hQbnE3ZzczK1RydXZnUmMxV1dNWTB3?=
 =?utf-8?B?MHdQdG40ZC9mcWFBdkRsazZnelB6dC9YRTJOUXFVSGtyQzV3a1pESFp0Snkv?=
 =?utf-8?B?NVpoSGdwSHJLeEVKWXJ4Y2Q3cWQza3JXME1VanJVQ1ZYNkNlRWhpbEJVSjI2?=
 =?utf-8?B?bnZtajRLbWdGZHF6T3dOZkhBV0Q5Y09TR1RZWFlraFdhRlMrLzlpcFdEUU9Y?=
 =?utf-8?B?dnpjVWxaYWduNjlIMnNwMXNhS0NZNFJVbkRGbjluQlNhZk04N0V4UzZtcjVO?=
 =?utf-8?B?MjRiK3FoSFFPNSt0Z3JIWFlvOFBrbVJqRlkwUTZud2NVUHI3Y3VnWE11Qzdu?=
 =?utf-8?B?RENsRUhnaDY5dmRLa2VNczc0OFlITXdLT0xydjE0cm5NbWF5enZ0clh2by8x?=
 =?utf-8?Q?1h4RI3orHJtkWzZeuj+UGti58Dy3nIt8?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SUllRTRtSURwSlE5OHNCL1IwTXl3STZ5MHUxanJCU254RGdYUU83ck9zaTM1?=
 =?utf-8?B?OUxaTENlUWozVUIzRGtQWnhXbmR1aFZTLzFzRFhTT1FaQ3d4OGI5WUhPd0xP?=
 =?utf-8?B?WDdwTXlqbHo5RmFlcHJHd2trRnh6anZLTjRBMThKZVgzbTZuSGxnRzRwTUwr?=
 =?utf-8?B?WC9hT0pZeHhZUitoOFliWjVQd0hwMlRwRkg1MXI4QWIyd3dxZ3dtQTZKbTVk?=
 =?utf-8?B?VVgvaFp3L01pOTkwZVFwdFFFWGRWdmNodWZDdzFyLzFvdGFJTURSZlhVRFlX?=
 =?utf-8?B?eXBYU2hlbU0zVFJYM2tYMVI3cGtQRFZKMEt3QjNTSHVTWDBQc3pRMXRrOG1F?=
 =?utf-8?B?Z0xDUEVFRlBXMDVTSXcwbGx4aThmZTNuZVVTTEFmMlZha0VQSllRWkxZSGhY?=
 =?utf-8?B?di9ka3FXYStSdnBuMytwZU5ZSHc2S1NzQzg2N3FzSUZ3RnpOcHVhYlhhSEti?=
 =?utf-8?B?RHRiRUdsVnR6ZUxFT2QzOWNxa2dFOHd4M095enpZczVHcFZjUDlYci9GQU1L?=
 =?utf-8?B?ZnVGeFZJc3M0bU1vVDlDVUJTRkxiei9nNWVNNVFTR0NWK2l4cnphOWxGQzVM?=
 =?utf-8?B?V0ZuemNxMnZNNXRoanhIMXNQdG9kNHZrRTltdUUxbDFiQkxaM0t4UG5FTjFM?=
 =?utf-8?B?Z2dLYkI1dHBBdXhFcUZWSWh4Mm1rVWZBMDBLY0NkU0gwT1ZiV1FXdnZISEFF?=
 =?utf-8?B?L2h4TkNqZXN1SFJCcnMzWE9GeGRBNW5BNUJ3OXlBTEdWSi82NUx6L3VHWTlr?=
 =?utf-8?B?MDhSQXJzcldwZExyUDNnaE5RMXdvKzQ3NDJPMmcrRTZBenN2aDVPdTJBdjJi?=
 =?utf-8?B?Q1p2eFg2VkZiY09IWjBDNGZEWHJLQXNIZ1RBTGZHNENHKzdpR0NZRDBLcTNV?=
 =?utf-8?B?Tk5Rb3NrRmNzMGdPQ2oxU3doVHYrMFN0QklBcTNERTh4NjhnWDR6WW5QelJB?=
 =?utf-8?B?bnFTSkRsN0kxY1BReGoybkdhRFVEaGNBalBMaWdST0ZKRjVMQll3K2E1dk9q?=
 =?utf-8?B?dys1bUMzcW1Fc0xHSWM1dlZ6cldBU244RzUyWlJocG5EeEVLKzR0VEJpSm0x?=
 =?utf-8?B?d2RWWFVUblFMdG9uMmJiNWxqSXMyTWQrcjg4NzdoN2dWbTFEOXR3V0c0ejR5?=
 =?utf-8?B?akIwRDVhaXk2azZGODZ3VFhvdkhBajRTbVZwWWJGcFhod250bGoraUd1bGl3?=
 =?utf-8?B?N01oMHkzK0srYjU5Mjhlb29YY2RFbnFaVFFzVENHNTJibjkvWC9wblF3enZo?=
 =?utf-8?B?dWl5d1luaGRoRDJPTWpWUXBnUzR1dWtPZ3kxS0lEdC9ST3BOb3NnVys4aWU2?=
 =?utf-8?B?Rm5OTEFXaGp1TlJ1VUZ1WjQyUEtNL2FEeURVQjUzRHZOdUtXSzN1MjJVaHJv?=
 =?utf-8?B?SHNOTTAzaTBKQTZJRUFKbDRqMWRMTlN0MjRHSXU0WEp4TWEzYjY1VEdEOTQ5?=
 =?utf-8?B?dy8ydFp5VWl2RCtMVnliMlFsbWk5Si9IL293NTB2NFVFTU5sUERpdkhzN2FX?=
 =?utf-8?B?SU5hNmZzTFg3WGs1NUJCZTdqRUFpREhldWw4TjcyRWRSWlBVUXBSeG9zUk9w?=
 =?utf-8?B?b05ySjZrRzl6emJtekx5dmFyZW5SZTVMTG9NYzBVN1hQZFBleG51aDVTQzNx?=
 =?utf-8?B?YTJyWG52UGdRTkQ4K1RFckdJaHVEcjF0ajRMVndKQzNjSkdjMkl5U2pnMmdo?=
 =?utf-8?B?NlhnWkQrY2NHVENuOWYxZ00vZGNHc3N4aEhDdStwSStHU2NSVmVjNkNUcjg5?=
 =?utf-8?B?VjYrWTNPQXlJRzRUNFptS204RSt2a3JpMDZRZlNkSkd6UTQzejlUQWI0ZmlN?=
 =?utf-8?B?TzA0cGVwTDBUbUU1OERiTEVhcmF6LzczSS95eldaRWl5bEk2N3JEL05oenVD?=
 =?utf-8?B?d0NhRVQyaWVDRVZxY3A3L0I1T1NJOE1LeHQ4NE16SkhrRTRyYlVYMFFtQ0d2?=
 =?utf-8?B?NzBVR2FraHhObWl4QTN2cmdZVEIxdlpnV3l5bFg1cHdZbDdaS2tIR0VPbmc3?=
 =?utf-8?B?OCtsWGFBOUx2UklVcjE2TkdrN1gzUEFvMDZRdytJdXAvQjVaK1Y4SVE4eHFI?=
 =?utf-8?B?M3BRL0ZISktYcG9ScVhOZDkwVTF3YzE5d3JXU0NaSTY1dmtmeU9lQ2E4dlVa?=
 =?utf-8?Q?qy0AAyRJbgQHQpLcJRf7O/NUr?=
Content-ID: <6337BA514576434FA6FC0936B094D49F@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8c6caaa-a1d8-421b-7e2c-08dd4c036e97
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2025 07:52:58.0206 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wkjULHqbe43OGHBPRZtuJqS5aN/WCmfOo9T1OCW3+j7WeSYoJRvbtKIgJQ0eFj5JbdEdesSKL0WAmWYQRZ9zgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB6979
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_006_163184584.1840583776"
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

--__=_Part_Boundary_006_163184584.1840583776
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDI1LTAyLTExIGF0IDEyOjMzICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBv
ciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBTaW5jZSB0aGUgU0lNUExFX0RFVl9QTV9PUFMgbWFj
cm8gYW5kIHRoZSBwbSBwb2ludGVyIGFyZSBhbnl3YXkNCj4gZGVmaW5lZCB3aGVuIENPTkZJR19Q
TV9TTEVFUCBpcyBub3Qgc2V0LCByZW1vdmUgdGhlIGlmZGVmIGZvciBpdA0KPiBhbmQgaW5kaWNh
dGUgdGhhdCB0aGUgbXRrX2hkbWlfe3JlbW92ZSxzdXNwZW5kfSBmdW5jdGlvbnMgbWF5IGJlDQo+
IHVudXNlZCAoYXMgdGhleSBhcmUsIGluIGNhc2UgUE0gc3VwcG9ydCBpcyBub3QgYnVpbHQtaW4p
Lg0KPiANCj4gV2hpbGUgYXQgaXQsIHRvIGltcHJvdmUgcmVhZGFiaWxpdHksIGFsc28gY29tcHJl
c3MgdGhlDQo+IFNJTVBMRV9ERVZfUE1fT1BTIGRlY2xhcmF0aW9uIGFzIGl0IGV2ZW4gZml0cyBp
biBsZXNzDQo+IHRoYW4gODAgY29sdW1ucy4NCg0KUmV2aWV3ZWQtYnk6IENLIEh1IDxjay5odUBt
ZWRpYXRlay5jb20+DQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVs
IFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+DQo+IC0tLQ0K
PiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMgfCAxMCArKysrLS0tLS0tDQo+
ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jIGIvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMNCj4gaW5kZXggZTM5MWNkYWNkOWVlLi5hZTUw
MjMyOThmZjQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRt
aS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jDQo+IEBAIC0x
Njk0LDggKzE2OTQsNyBAQCBzdGF0aWMgdm9pZCBtdGtfaGRtaV9yZW1vdmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikNCj4gICAgICAgICBtdGtfaGRtaV9jbGtfZGlzYWJsZV9hdWRpbyho
ZG1pKTsNCj4gIH0NCj4gDQo+IC0jaWZkZWYgQ09ORklHX1BNX1NMRUVQDQo+IC1zdGF0aWMgaW50
IG10a19oZG1pX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQ0KPiArc3RhdGljIF9fbWF5YmVf
dW51c2VkIGludCBtdGtfaGRtaV9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gIHsNCj4g
ICAgICAgICBzdHJ1Y3QgbXRrX2hkbWkgKmhkbWkgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCj4g
DQo+IEBAIC0xNzA0LDcgKzE3MDMsNyBAQCBzdGF0aWMgaW50IG10a19oZG1pX3N1c3BlbmQoc3Ry
dWN0IGRldmljZSAqZGV2KQ0KPiAgICAgICAgIHJldHVybiAwOw0KPiAgfQ0KPiANCj4gLXN0YXRp
YyBpbnQgbXRrX2hkbWlfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gK3N0YXRpYyBfX21h
eWJlX3VudXNlZCBpbnQgbXRrX2hkbWlfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gIHsN
Cj4gICAgICAgICBzdHJ1Y3QgbXRrX2hkbWkgKmhkbWkgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsN
Cj4gICAgICAgICBpbnQgcmV0ID0gMDsNCj4gQEAgLTE3MTcsOSArMTcxNiw4IEBAIHN0YXRpYyBp
bnQgbXRrX2hkbWlfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gDQo+ICAgICAgICAgcmV0
dXJuIDA7DQo+ICB9DQo+IC0jZW5kaWYNCj4gLXN0YXRpYyBTSU1QTEVfREVWX1BNX09QUyhtdGtf
aGRtaV9wbV9vcHMsDQo+IC0gICAgICAgICAgICAgICAgICAgICAgICBtdGtfaGRtaV9zdXNwZW5k
LCBtdGtfaGRtaV9yZXN1bWUpOw0KPiArDQo+ICtzdGF0aWMgU0lNUExFX0RFVl9QTV9PUFMobXRr
X2hkbWlfcG1fb3BzLCBtdGtfaGRtaV9zdXNwZW5kLCBtdGtfaGRtaV9yZXN1bWUpOw0KPiANCj4g
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2hkbWlfY29uZiBtdGtfaGRtaV9jb25mX210MjcwMSA9
IHsNCj4gICAgICAgICAudHpfZGlzYWJsZWQgPSB0cnVlLA0KPiAtLQ0KPiAyLjQ4LjENCj4gDQoN
Cg==

--__=_Part_Boundary_006_163184584.1840583776
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1R1ZSwmIzMyOzIwMjUtMDItMTEmIzMyO2F0
JiMzMjsxMjozMyYjMzI7KzAxMDAsJiMzMjtBbmdlbG9HaW9hY2NoaW5vJiMzMjtEZWwmIzMyO1Jl
Z25vJiMzMjt3cm90ZToNCiZndDsmIzMyO0V4dGVybmFsJiMzMjtlbWFpbCYjMzI7OiYjMzI7UGxl
YXNlJiMzMjtkbyYjMzI7bm90JiMzMjtjbGljayYjMzI7bGlua3MmIzMyO29yJiMzMjtvcGVuJiMz
MjthdHRhY2htZW50cyYjMzI7dW50aWwmIzMyO3lvdSYjMzI7aGF2ZSYjMzI7dmVyaWZpZWQmIzMy
O3RoZSYjMzI7c2VuZGVyJiMzMjtvciYjMzI7dGhlJiMzMjtjb250ZW50Lg0KJmd0OyYjMzI7DQom
Z3Q7JiMzMjsNCiZndDsmIzMyO1NpbmNlJiMzMjt0aGUmIzMyO1NJTVBMRV9ERVZfUE1fT1BTJiMz
MjttYWNybyYjMzI7YW5kJiMzMjt0aGUmIzMyO3BtJiMzMjtwb2ludGVyJiMzMjthcmUmIzMyO2Fu
eXdheQ0KJmd0OyYjMzI7ZGVmaW5lZCYjMzI7d2hlbiYjMzI7Q09ORklHX1BNX1NMRUVQJiMzMjtp
cyYjMzI7bm90JiMzMjtzZXQsJiMzMjtyZW1vdmUmIzMyO3RoZSYjMzI7aWZkZWYmIzMyO2ZvciYj
MzI7aXQNCiZndDsmIzMyO2FuZCYjMzI7aW5kaWNhdGUmIzMyO3RoYXQmIzMyO3RoZSYjMzI7bXRr
X2hkbWlfe3JlbW92ZSxzdXNwZW5kfSYjMzI7ZnVuY3Rpb25zJiMzMjttYXkmIzMyO2JlDQomZ3Q7
JiMzMjt1bnVzZWQmIzMyOyhhcyYjMzI7dGhleSYjMzI7YXJlLCYjMzI7aW4mIzMyO2Nhc2UmIzMy
O1BNJiMzMjtzdXBwb3J0JiMzMjtpcyYjMzI7bm90JiMzMjtidWlsdC1pbikuDQomZ3Q7JiMzMjsN
CiZndDsmIzMyO1doaWxlJiMzMjthdCYjMzI7aXQsJiMzMjt0byYjMzI7aW1wcm92ZSYjMzI7cmVh
ZGFiaWxpdHksJiMzMjthbHNvJiMzMjtjb21wcmVzcyYjMzI7dGhlDQomZ3Q7JiMzMjtTSU1QTEVf
REVWX1BNX09QUyYjMzI7ZGVjbGFyYXRpb24mIzMyO2FzJiMzMjtpdCYjMzI7ZXZlbiYjMzI7Zml0
cyYjMzI7aW4mIzMyO2xlc3MNCiZndDsmIzMyO3RoYW4mIzMyOzgwJiMzMjtjb2x1bW5zLg0KDQpS
ZXZpZXdlZC1ieTomIzMyO0NLJiMzMjtIdSYjMzI7Jmx0O2NrLmh1QG1lZGlhdGVrLmNvbSZndDsN
Cg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtTaWduZWQtb2ZmLWJ5OiYjMzI7QW5nZWxvR2lvYWNjaGlu
byYjMzI7RGVsJiMzMjtSZWdubyYjMzI7Jmx0O2FuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29s
bGFib3JhLmNvbSZndDsNCiZndDsmIzMyOy0tLQ0KJmd0OyYjMzI7JiMzMjtkcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2hkbWkuYyYjMzI7fCYjMzI7MTAmIzMyOysrKystLS0tLS0NCiZndDsm
IzMyOyYjMzI7MSYjMzI7ZmlsZSYjMzI7Y2hhbmdlZCwmIzMyOzQmIzMyO2luc2VydGlvbnMoKyks
JiMzMjs2JiMzMjtkZWxldGlvbnMoLSkNCiZndDsmIzMyOw0KJmd0OyYjMzI7ZGlmZiYjMzI7LS1n
aXQmIzMyO2EvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMmIzMyO2IvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMNCiZndDsmIzMyO2luZGV4JiMzMjtlMzkxY2Rh
Y2Q5ZWUuLmFlNTAyMzI5OGZmNCYjMzI7MTAwNjQ0DQomZ3Q7JiMzMjstLS0mIzMyO2EvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMNCiZndDsmIzMyOysrKyYjMzI7Yi9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYw0KJmd0OyYjMzI7QEAmIzMyOy0xNjk0LDgmIzMy
OysxNjk0LDcmIzMyO0BAJiMzMjtzdGF0aWMmIzMyO3ZvaWQmIzMyO210a19oZG1pX3JlbW92ZShz
dHJ1Y3QmIzMyO3BsYXRmb3JtX2RldmljZSYjMzI7KnBkZXYpDQomZ3Q7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7bXRrX2hkbWlfY2xrX2Rpc2FibGVfYXVkaW8o
aGRtaSk7DQomZ3Q7JiMzMjsmIzMyO30NCiZndDsmIzMyOw0KJmd0OyYjMzI7LSNpZmRlZiYjMzI7
Q09ORklHX1BNX1NMRUVQDQomZ3Q7JiMzMjstc3RhdGljJiMzMjtpbnQmIzMyO210a19oZG1pX3N1
c3BlbmQoc3RydWN0JiMzMjtkZXZpY2UmIzMyOypkZXYpDQomZ3Q7JiMzMjsrc3RhdGljJiMzMjtf
X21heWJlX3VudXNlZCYjMzI7aW50JiMzMjttdGtfaGRtaV9zdXNwZW5kKHN0cnVjdCYjMzI7ZGV2
aWNlJiMzMjsqZGV2KQ0KJmd0OyYjMzI7JiMzMjt7DQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7c3RydWN0JiMzMjttdGtfaGRtaSYjMzI7KmhkbWkmIzMy
Oz0mIzMyO2Rldl9nZXRfZHJ2ZGF0YShkZXYpOw0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtAQCYjMzI7
LTE3MDQsNyYjMzI7KzE3MDMsNyYjMzI7QEAmIzMyO3N0YXRpYyYjMzI7aW50JiMzMjttdGtfaGRt
aV9zdXNwZW5kKHN0cnVjdCYjMzI7ZGV2aWNlJiMzMjsqZGV2KQ0KJmd0OyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO3JldHVybiYjMzI7MDsNCiZndDsmIzMyOyYj
MzI7fQ0KJmd0OyYjMzI7DQomZ3Q7JiMzMjstc3RhdGljJiMzMjtpbnQmIzMyO210a19oZG1pX3Jl
c3VtZShzdHJ1Y3QmIzMyO2RldmljZSYjMzI7KmRldikNCiZndDsmIzMyOytzdGF0aWMmIzMyO19f
bWF5YmVfdW51c2VkJiMzMjtpbnQmIzMyO210a19oZG1pX3Jlc3VtZShzdHJ1Y3QmIzMyO2Rldmlj
ZSYjMzI7KmRldikNCiZndDsmIzMyOyYjMzI7ew0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyO3N0cnVjdCYjMzI7bXRrX2hkbWkmIzMyOypoZG1pJiMzMjs9
JiMzMjtkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjtpbnQmIzMyO3JldCYjMzI7PSYjMzI7MDsNCiZndDsmIzMyO0BA
JiMzMjstMTcxNyw5JiMzMjsrMTcxNiw4JiMzMjtAQCYjMzI7c3RhdGljJiMzMjtpbnQmIzMyO210
a19oZG1pX3Jlc3VtZShzdHJ1Y3QmIzMyO2RldmljZSYjMzI7KmRldikNCiZndDsmIzMyOw0KJmd0
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO3JldHVybiYjMzI7
MDsNCiZndDsmIzMyOyYjMzI7fQ0KJmd0OyYjMzI7LSNlbmRpZg0KJmd0OyYjMzI7LXN0YXRpYyYj
MzI7U0lNUExFX0RFVl9QTV9PUFMobXRrX2hkbWlfcG1fb3BzLA0KJmd0OyYjMzI7LSYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO210
a19oZG1pX3N1c3BlbmQsJiMzMjttdGtfaGRtaV9yZXN1bWUpOw0KJmd0OyYjMzI7Kw0KJmd0OyYj
MzI7K3N0YXRpYyYjMzI7U0lNUExFX0RFVl9QTV9PUFMobXRrX2hkbWlfcG1fb3BzLCYjMzI7bXRr
X2hkbWlfc3VzcGVuZCwmIzMyO210a19oZG1pX3Jlc3VtZSk7DQomZ3Q7JiMzMjsNCiZndDsmIzMy
OyYjMzI7c3RhdGljJiMzMjtjb25zdCYjMzI7c3RydWN0JiMzMjttdGtfaGRtaV9jb25mJiMzMjtt
dGtfaGRtaV9jb25mX210MjcwMSYjMzI7PSYjMzI7ew0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOy50el9kaXNhYmxlZCYjMzI7PSYjMzI7dHJ1ZSwNCiZn
dDsmIzMyOy0tDQomZ3Q7JiMzMjsyLjQ4LjENCiZndDsmIzMyOw0KDQoNCjwvcHJlPg0KPC9wPjwv
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

--__=_Part_Boundary_006_163184584.1840583776--

