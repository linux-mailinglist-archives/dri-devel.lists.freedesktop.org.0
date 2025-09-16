Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD06DB58C1F
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 05:03:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AB8110E623;
	Tue, 16 Sep 2025 03:03:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="JkuUl6Ov";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="Ma+BH7zO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E48D310E0B7
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 03:03:37 +0000 (UTC)
X-UUID: b94b892a92a911f0b33aeb1e7f16c2b6-20250916
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=Z5b9+Qkpxljm2BX2h4WmIGRC+LNcVxoa5NiXGBZi8/k=; 
 b=JkuUl6OvGpMJtQR5fj8QkNd2yixvrIJ/RgkWJFBbv3EVwS5vDiFRnuXhbHm/KNW58uhlHsOS7JTwq6x0GJWQRXaD6t9eumFFDhgwLDcu0s4iSq1csqqU5yDcjJiFOXKDp/l9JVTzyJHV6Kqg6bRa7iGQLhk4+80D5g3vB+0maaY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.4, REQID:5833ff27-70f7-44a5-84e8-35c911ba6a9d, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:1ca6b93, CLOUDID:3ad5976c-8443-424b-b119-dc42e68239b0,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:-5,Conten
 t:0|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:
 0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b94b892a92a911f0b33aeb1e7f16c2b6-20250916
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 954436474; Tue, 16 Sep 2025 11:03:30 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 16 Sep 2025 11:03:28 +0800
Received: from TYPPR03CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 16 Sep 2025 11:03:28 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yc3wq+MkIpCyNC+og7d+njvoB87Eylr39YKupFU6CznnZXzQhZH3ttGkbbEYQUqwhVMjmmlkdo7tqTs/flPFKdvI0T5ohUh7Foba3fvMURw9fUg3oz5yP7tBEM0CEW2rGXUoQM1kNbKgHgFBnTaqiKroQf27czR99Metp2G0Oej2i0lEz8XaUyyin+pg+8F5c45F4IUP638kgu2+q8RSLb9Y01y5FS9IjRuXJbVAnEuzLOblNJRl03RVX55nC6k1hlLb9c4TOJL2XlR7Im6ukcM5V/onD4lYKYnvNsMHWiB99uWUF4FBrdKK6sAAPsXRky20KnjKC+hBEK72J86umA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oUe23kUx/aRcqIeUrZDZVs4YZXeLInTRJd/PgSHFXUU=;
 b=caS2MPJ0GN0goq8sFDWbQ9EnLVCEUNzAkCl2Aq/42nbnqgNKZcIBOhbGFVKyCPjreZ7e3f4qU9H/vZRllMoqS61E57FfnVbK0JDQHVA9RXFWL71xOeUEyEQ0GjYTbdGn9jqmtDLFDhJnyTp+3A0g47uyT7x/bc9tOhfmp5njfwibEEo2OpiDOXraELAy9CObPNLuFfPb0T8d+SOHBWl8vi6kZsvLxcfri6rfqy+5748k5duJlyCmZFVBWz95cr7UO+u8PM8N5p93yPuCqQ3govu+ePaoz682wKC1eFpeZ1BE2fv7X/chR3grNYDc43k+pAiSJhcJ0f261E5JP9/BuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oUe23kUx/aRcqIeUrZDZVs4YZXeLInTRJd/PgSHFXUU=;
 b=Ma+BH7zOvpcdSvnfyK48jzyzE3s7L3C8ERE++ptpqBDGtPC4JJHOt9xy/MWOwxTuYa+wAQyp9rAtZhU9mQBjswgylhUmhjMq6+kSDzpIjdqZiX+7CuXbpndMDQsiCPX8c/KtCj1tqmxrSAGe27EukM9rKdAy3In9qcYVxGnDdTQ=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by KL1PR03MB7744.apcprd03.prod.outlook.com (2603:1096:820:ed::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Tue, 16 Sep
 2025 03:03:25 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.9115.020; Tue, 16 Sep 2025
 03:03:25 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?=
 <Paul-pl.Chen@mediatek.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: =?utf-8?B?U3VubnkgU2hlbiAo5rKI5aeN5aeNKQ==?= <Sunny.Shen@mediatek.com>,
 =?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 =?utf-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
 <Xiandong.Wang@mediatek.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "fshao@chromium.org" <fshao@chromium.org>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?=
 <Singo.Chang@mediatek.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "treapking@chromium.org" <treapking@chromium.org>
Subject: Re: [PATCH v4 06/19] soc: mediatek: Add runtime PM and top clocks and
 async controls for MMSYS
Thread-Topic: [PATCH v4 06/19] soc: mediatek: Add runtime PM and top clocks
 and async controls for MMSYS
Thread-Index: AQHcF/M+3AnIlAAMBEqsXMRYxgdqwbSVPQcA
Date: Tue, 16 Sep 2025 03:03:25 +0000
Message-ID: <9d157ab1fbfc268a052b44955192092757ce48bd.camel@mediatek.com>
References: <20250828080855.3502514-1-paul-pl.chen@mediatek.com>
 <20250828080855.3502514-7-paul-pl.chen@mediatek.com>
In-Reply-To: <20250828080855.3502514-7-paul-pl.chen@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|KL1PR03MB7744:EE_
x-ms-office365-filtering-correlation-id: bf86bff9-242e-41ec-be3d-08ddf4cd9abc
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|42112799006|7416014|376014|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?YnRlNXF4OFdXcjJqWHkvRDhCOWpzbHRMTkhSbGV3aTRwRUI4b1VoT1JHdlVn?=
 =?utf-8?B?N09MNzl2ZXB3VHE4YzFqS2Y5cnBhbTZlZmN3a2NKQkY4Z2tSU3YyQkh0cDlD?=
 =?utf-8?B?VXlVQWQzdTYwdHV3aW1QTTljU2pYcEQ1RzRGYjIvL1hVazIwdThoWnVZZzB1?=
 =?utf-8?B?cW9LVHR5Wis5eklCTUx5aUw3TVVZL1FWVGpYWDJLeFl2K3k1TExDbEx1K3FB?=
 =?utf-8?B?TEs0V2RFdmlmNi9aSjZ4Z2diaGpyVUg5bWRCcER3d0RYd1ZlSEk5RXRoRHNQ?=
 =?utf-8?B?NEFIOWVWdGtNd2FISEt6d2kwOGpwdDhzTWhjRXQrdFgyWGRKVE9BeURSTHNE?=
 =?utf-8?B?V0REdGpwWndvaXBtQ0t0SFh2UXFnZG93ZDNVWnVJOVExSFlvL3Mwckw4YVFI?=
 =?utf-8?B?NGZXT0krWWJ4cmlCdVVKVVpYSHlRVHdTQ2VtbVlCZkphQTFsR25BbDVCSkEx?=
 =?utf-8?B?c1hoczRocmw5bDkrYnl4UlMzSm45eHhOaTJWNnFweDdwUnFYNDZSME03cUZE?=
 =?utf-8?B?QmRJQUpoQWdsN3JrQXFOMFl2TmthWGR6REx2OUUxRHRqUCsvMmVQV1JQN1JU?=
 =?utf-8?B?S3B0N1dQZlFucGZhT25qRU9xbEJXUWRMZXJQY1E1eG45dDBMZ0t3MjZKQU1X?=
 =?utf-8?B?VnFWNnlPRFkwWWtxU3NMZ2xQMU04Qml1NzJwZE9xd09qRzdac1FwdlVFYVBV?=
 =?utf-8?B?TVExNkF6SEZOOUtzaFlhMWFIMHVVTW1udmVRU2xGcGRRTm1oVGF4ZTJnWDJG?=
 =?utf-8?B?eXN6QmFTaWJlZU5XWVRnVlg1aG5OODhXWWUrSEl6NGVuSkhFOUVRWEJYRGxQ?=
 =?utf-8?B?Z0M4eFppVzlCLzBWWkxiZVA1cFQ1VVk1V0pRUUZOWm1qUHJNd09XQnc2QXpC?=
 =?utf-8?B?OG9JRVZaWWV3QUZKcTR0eUluMmYxb2NVd1B1V1p5MW5pZ2hvdm9aeENtcTRl?=
 =?utf-8?B?SUQ3dFREVGpaVkppRGZvcmh0aklCeXVaZ1EwRVZreEUxcWRwVlBtcGtjSWNz?=
 =?utf-8?B?Nmd3czBncGxlNEIwRTlOV3JUdnhBa3FLeDVxWWdMaUM5OUFFVHdYL3FqbGtW?=
 =?utf-8?B?Z1VhbTJ3Y3FNdXRhS2tZMDVKOWtrazh3Rmx2dms3OFREMmV0bDRvcEI3aFRz?=
 =?utf-8?B?QmdBSEl2L1k3djlDQUdobDFQY05iZlE1Y1ZGbVpRYXRQcWEyTmh4U2VYZ1FT?=
 =?utf-8?B?Skp2K1dvQWRCckg2cjJ1MDBBaFZDYzVOYURycnJUSlpCaDZsM2liRG1INitS?=
 =?utf-8?B?Yy9EN0ZocmtkNW9ySFp3WVFtWlBVbzY1Mkd6NlZqYjR5VXJXUjdQQzU2aDlD?=
 =?utf-8?B?a2o5NEh1cXcremJXK2xMaXpsa3RKbnBSR2tBNXg4UnphSzNiSGpmbVZjeXpP?=
 =?utf-8?B?NjRlUmRJdU16ZkdKdjJCNlZUQ3dyN2NRc3lPRG04eWUvNndJbG9KR2JCSC9K?=
 =?utf-8?B?dTUwMGdjSG5DQUcyODFQazluV242WGJsY3BtQy9tU2oxdFUzdlRDT2szeFBk?=
 =?utf-8?B?eFJjeTlrbUxnLzdYOW1UR0t4a25VYVhhamptK1N3cVVLTFQrRmc3MWN5Nkw4?=
 =?utf-8?B?Slo5OTliSHNlcVFHTG94bkM4MDVXNkdnZjN0SHcxR0ZJT1ptbXMyc2MyMVF0?=
 =?utf-8?B?WVBEZnhOaGhBNXVxY1lkRU9JY0FSTHFWUnFYeTQrNEN1emFGZHZBVmdCeHFC?=
 =?utf-8?B?bE0xdWRiRDNoUHU1NWRRaGdYUzdaZk1iMUZzWWZ2Y0hsdGZ3Mnh6Ry9zWnVq?=
 =?utf-8?B?OXppMlJVMk56YkJxK3JpblRxem1SbGlWMjZDdjNlOXRGTTlXb0oxU0JiVCts?=
 =?utf-8?B?Wnd4TW5kWVk2ZFRGOWFSaW1uSW4wSmowMWlQNVdGYUlGNG5OZmNDTlp3RnVv?=
 =?utf-8?B?ekNNTzAzcTFyeVNpaUVobHZUUlNHVnNObWt6Vjh1Z0ZDLytxZEJSTTYxbHRi?=
 =?utf-8?B?L3ZiN3dDUERZNWhmUlo1YjZ1SmRJTjdUWCs1a0Y4NkdrNzArSkphUmlMNEww?=
 =?utf-8?B?V09iZUI3ek13PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(42112799006)(7416014)(376014)(1800799024)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TmFZL3IyNndNUlAvbW1xL1dQaENLZmVNdHJqaUFwQzZuM0ZZeEhoR2k0NjRM?=
 =?utf-8?B?ZE45T1B2THNBRnI4M0FnNUdhZzEyWmxDazduNllEajN1N2pGOWM5b3lacnU2?=
 =?utf-8?B?clAybjJTZzBjMG5kR29sbGpXb21Qa1AzUDR3YUF2c2RHYlRuUTkvcForTWpj?=
 =?utf-8?B?L0hJbVBkYjI2NEg2cTBJUEZVcm5FUjI2ZGZsbVhvZ1lXNUs1RThIUERBUzcy?=
 =?utf-8?B?dDYwb2wvdnRVc0pCU0E4MElqOFJMM2QyTGVSTTc2eGpMbWJZUzBwN3BhakhW?=
 =?utf-8?B?Wkhwbm4zWlltQWtwS0VLODNXOEtWOGpBRENvQ1Q0ckhjRFdieDVZNjhMSis0?=
 =?utf-8?B?elRuU0JHWUhhblJ0R3pJaDU0UTVDOVNUalVraGw0TmtSNHkya0NwK08yMGw4?=
 =?utf-8?B?L3lSdTFOeXpYYTFBc2hHTHg5Qm84RUdsY1N3T0xtbkdiYkV3RGxxeHJJeGFD?=
 =?utf-8?B?YzlrOTc5MFFDT0RUYmI1V2JZTDhGbS93RzgvRHB6YTlOY3pPNEpqMThlS3Nr?=
 =?utf-8?B?eFBZRTRJNG5wbTRYcDlpQndZTkcwTzB5eW5SQW1SOWJPd2JCeEhweHhrK2Jx?=
 =?utf-8?B?WWxBWm4xaHcxbm5uank4ZW81bG0zK09sU2IrNmNabWxGZWxhbk1iczE3R1c4?=
 =?utf-8?B?Ry9HVVdWZ29jVE5pYnpXKzBiQVB1T0VCT01Va1U3Z3ZhWnZsS05yU282YTJW?=
 =?utf-8?B?ZWpZT3JMSWMxYXBETUkyYmNRQVJuY0l1T01mTitDcXc4c1B1cy9jZmhIK2l4?=
 =?utf-8?B?R1hQby8wZUk5dHpHNzR3VUIzRVp0OFBQR24xV2lVNTdMSDFHQmZndmduOTQ3?=
 =?utf-8?B?R2ZHbDl6MTdDY1BIcXk2L042bGk4YTFINGZQT2FQZmNMZmxzZUl1SnJjS25p?=
 =?utf-8?B?aGI5QkZkZENmcHJkNHQxc1o2aXBJejZwbHhBUlpOQWNWS2dkMWwwSnUxbUJk?=
 =?utf-8?B?L3FQZFhEL1hHMkROajJ5YjRJL2Z0RnU4UTVJUW9JRlF2a0xIOFZocnk4RUxD?=
 =?utf-8?B?QWV2SGt4dXlnRmNxYmw4Mm5lUnhxQ1VGSi9obEE5L1AvWHJtNGRma25KcSsx?=
 =?utf-8?B?b1ZBR1E4dTMvcDRsWE1hRmp5Q0EwN0RzM1JPc1M2K21sZ0VMVlBad1lPWXFw?=
 =?utf-8?B?MWVMeTZhSlFnWTN5dXM2WHdNS1FGUGpaRkV3ZU5lZTM5WXVwdmJuZXRjVlQy?=
 =?utf-8?B?QzYxQzRNRGtyV1dCQmFYdUk5elU5b3pmdDVzYm03ZkdFVGlQY1lBc2dHdjZm?=
 =?utf-8?B?dkgrazh0bWF1RXl0MlZzRnEzOHlDSnYwcXphNGNyRWVoUnh3cGlJUXkrazJF?=
 =?utf-8?B?RnZ5VW5QcXJXTGpDeTAwbXZPRGZkOGNKZEltV2pCLzB6N0E4MEk3dkx2djlO?=
 =?utf-8?B?dUVmenR2WEF2eXA0ckhDMFZYamFQd3dkbUxYek1IcFZncmFhNCsySHBRSmVO?=
 =?utf-8?B?MFpBcXNnZnQyR3phQVhEMGJtN25lNzlzTVNQcjl6N3VTSkFnanVIVGlJR0g1?=
 =?utf-8?B?UWQvbjBlOHRONjR0TkFwY3JPSGFDSGpRNUs4M2xrdCtldDVGVnlucWhQaEVJ?=
 =?utf-8?B?Rzd3SzZ4YkpiZDEvT1Z2dEJpZ1pqK0dSOTlST1VwQzIyVzZmNmo0S3d4UGpl?=
 =?utf-8?B?M1FrWmJJU3RVME1XakZya3dVV2NQbXl4M3NxQk0zL0ZRVVJUUitzT2J3bEV5?=
 =?utf-8?B?eDE0ZzVpQWowUkcxSm5xaGJibWZDenN4YmNKUHl3aTdxcHNmM1Q1WnpScEVU?=
 =?utf-8?B?Q1RhblR3VmROREV5SHB6VS8vNi9GK21rcmh4YTJ1dVF4enpqWmZiTlRLRVFo?=
 =?utf-8?B?ZmNmV0x3Z3Z0RStndnNRRTAxb1RhT1VBYzNNa0IrQkhiZ3J4OGVPUzY2NDRR?=
 =?utf-8?B?cjdORWZTalhiRzBtZE16cEtSZGM4dTFFRVlTMlBnVkFSUFdqRm8rTGV5ZWNo?=
 =?utf-8?B?akdJa0VnZi9XWTNMYkM4T0FSVExTR2M4NXRJUEgyc3A3OG54UnNnSkJIVFFR?=
 =?utf-8?B?R01oWVg5TnN6UjVXNmpKVmJwMGhlUnJ0UUNkTVVwaE44R05VRXV3eEJyOVp2?=
 =?utf-8?B?SnMrNHZQWTI0ZVh3TE1Jemw2cUR3Y1V6bExYT3kwUnEwazh5Q0lETDhnK2J6?=
 =?utf-8?Q?4Ol0fn/jvj0NwyxOmq/RyxVU4?=
Content-ID: <9AC46528393EAD4D94A7E0C608C5EA4D@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf86bff9-242e-41ec-be3d-08ddf4cd9abc
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2025 03:03:25.7591 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1XJp2+Zpqkk1laqmQP4Pxwyge7xld606D7nquqBEv0+H4Yi8GeBQYCntyyGLc7ZgYHmFUCINoVMd7vBZHo2Zrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7744
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_001_442410357.1150573808"
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

--__=_Part_Boundary_001_442410357.1150573808
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDI1LTA4LTI4IGF0IDE2OjA3ICswODAwLCBQYXVsIENoZW4gd3JvdGU6DQo+IEZy
b206IE5hbmN5IExpbiA8bmFuY3kubGluQG1lZGlhdGVrLmNvbT4NCj4gDQo+IC0gQWRkIGluaXRp
YWxpemF0aW9uIG9mIHRvcCBjbG9ja3MgYW5kIGFzeW5jIGNsb2NrcyBmb3IgZWFjaCBNTVNZUy4N
Cj4gLSBBZGQgUE0gcnVudGltZSBjb250cm9sIGFuZCBuZXcgZnVuY3Rpb25zIHRvIG1hbmFnZSB0
aGVzZSBjbG9ja3MuDQo+IC0gQWRkIGZ1bmN0aW9ucyB0byBzZXQgdGhlc2UgY2xvY2tzIGFjY29y
ZGluZyB0byB0aGUgZGVmYXVsdA0KPiAgIGNvbmZpZ3VyYXRpb24gb2YgdGhlIGNvcnJlc3BvbmRp
bmcgTU1TWVMuDQoNClRoaXMgcGF0Y2ggaW5jbHVkZSAzIHRoaW5nczoNCjEuIEFkZCBydW50aW1l
IFBNDQoyLiB0b3AgY2xvY2sgY29udHJvbA0KMy4gYXN5bmMgY29udHJvbA0KDQpJIHdvdWxkIGxp
a2UgeW91IHRvIHNlcGFyYXRlIHRoZXNlIHRvIGRpZmZlcmVudCBwYXRjaC4NCg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogTmFuY3kgTGluIDxuYW5jeS5saW5AbWVkaWF0ZWsuY29tPg0KPiBTaWduZWQt
b2ZmLWJ5OiBQYXVsLXBsIENoZW4gPHBhdWwtcGwuY2hlbkBtZWRpYXRlay5jb20+DQo+IC0tLQ0K
DQpbc25pcF0NCg0KPiArDQo+ICtpbnQgbXRrX21tc3lzX2RkcF9jbGtfZW5hYmxlKHN0cnVjdCBk
ZXZpY2UgKmRldiwgZW51bSBtdGtfZGRwX2NvbXBfaWQgY29tcF9pZCkNCg0KVGhpcyBpcyB0byBj
b250cm9sIGFzeW5jIGNsb2NrLCBzbyBjaGFuZ2UgdGhlIGZ1bmN0aW9uIG5hbWUgdG8NCg0KbXRr
X21tc3lzX2FzeW5jX2Nsa19lbmFibGUoKQ0KDQo+ICt7DQo+ICsJc3RydWN0IG10a19tbXN5cyAq
bW1zeXMgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCj4gKwljb25zdCBzdHJ1Y3QgbXRrX21tc3lz
X2FzeW5jX2luZm8gKmFzeW5jID0gbW1zeXMtPmRhdGEtPmFzeW5jX2luZm87DQo+ICsNCj4gKwlp
bnQgaTsNCj4gKw0KPiArCWlmICghbW1zeXMtPmRhdGEtPm51bV9hc3luY19pbmZvKQ0KDQpmb3It
bG9vcCB3b3VsZCBjaGVjayB0aGlzLCBzbyBkcm9wIHRoaXMuDQoNCj4gKwkJcmV0dXJuIDA7DQo+
ICsNCj4gKwlmb3IgKGkgPSAwOyBpIDwgbW1zeXMtPmRhdGEtPm51bV9hc3luY19pbmZvOyBpKysp
DQo+ICsJCWlmIChjb21wX2lkID09IGFzeW5jW2ldLmNvbXBfaWQpDQo+ICsJCQlyZXR1cm4gY2xr
X3ByZXBhcmVfZW5hYmxlKG1tc3lzLT5hc3luY19jbGtbYXN5bmNbaV0uaW5kZXhdKTsNCj4gKwly
ZXR1cm4gMDsNCj4gK30NCj4gK0VYUE9SVF9TWU1CT0xfR1BMKG10a19tbXN5c19kZHBfY2xrX2Vu
YWJsZSk7DQo+ICsNCj4gK3ZvaWQgbXRrX21tc3lzX2RkcF9jbGtfZGlzYWJsZShzdHJ1Y3QgZGV2
aWNlICpkZXYsIGVudW0gbXRrX2RkcF9jb21wX2lkIGNvbXBfaWQpDQo+ICt7DQo+ICsJc3RydWN0
IG10a19tbXN5cyAqbW1zeXMgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCj4gKwljb25zdCBzdHJ1
Y3QgbXRrX21tc3lzX2FzeW5jX2luZm8gKmFzeW5jID0gbW1zeXMtPmRhdGEtPmFzeW5jX2luZm87
DQo+ICsJaW50IGk7DQo+ICsNCj4gKwlpZiAoIW1tc3lzLT5kYXRhLT5udW1fYXN5bmNfaW5mbykN
Cg0KZm9yLWxvb3Agd291bGQgY2hlY2sgdGhpcywgc28gZHJvcCB0aGlzLg0KDQo+ICsJCXJldHVy
bjsNCj4gKw0KPiArCWZvciAoaSA9IDA7IGkgPCBtbXN5cy0+ZGF0YS0+bnVtX2FzeW5jX2luZm87
IGkrKykNCj4gKwkJaWYgKGNvbXBfaWQgPT0gYXN5bmNbaV0uY29tcF9pZCkNCj4gKwkJCWNsa19k
aXNhYmxlX3VucHJlcGFyZShtbXN5cy0+YXN5bmNfY2xrW2FzeW5jW2ldLmluZGV4XSk7DQo+ICt9
DQo+ICtFWFBPUlRfU1lNQk9MX0dQTChtdGtfbW1zeXNfZGRwX2Nsa19kaXNhYmxlKTsNCj4gKw0K
PiArdm9pZCBtdGtfbW1zeXNfZGRwX2NvbmZpZyhzdHJ1Y3QgZGV2aWNlICpkZXYsIGVudW0gbXRr
X2RkcF9jb21wX2lkIGNvbXBfaWQsDQo+ICsJCQkgIGludCB3aWR0aCwgaW50IGhlaWdodCwgc3Ry
dWN0IGNtZHFfcGt0ICpjbWRxX3BrdCkNCg0KVGhpcyBpcyB0byBjb250cm9sIGFzeW5jLiBTbyBj
aGFuZ2UgdGhlIGZ1bmN0aW9uIG5hbWUgdG8NCg0KbXRrX21tc3lzX2FzeW5jX2NvbmZpZygpDQoN
Cj4gK3sNCj4gKwlzdHJ1Y3QgbXRrX21tc3lzICptbXN5cyA9IGRldl9nZXRfZHJ2ZGF0YShkZXYp
Ow0KPiArCWNvbnN0IHN0cnVjdCBtdGtfbW1zeXNfYXN5bmNfaW5mbyAqYXN5bmMgPSBtbXN5cy0+
ZGF0YS0+YXN5bmNfaW5mbzsNCj4gKwlpbnQgaTsNCj4gKwl1MzIgdmFsOw0KPiArDQo+ICsJaWYg
KCFtbXN5cy0+ZGF0YS0+bnVtX2FzeW5jX2luZm8pDQoNCklmIG1tc3lzLT5kYXRhLT5udW1fYXN5
bmNfaW5mbyA9IDAsIHRoZW4gaSA9IDAsIGFuZCBpdCB3b3VsZCByZXR1cm4gYmVsb3cuDQpTbyB0
aGlzIGNoZWNraW5nIGlzIHJlZHVuZGFudC4NCg0KPiArCQlyZXR1cm47DQo+ICsNCj4gKwlmb3Ig
KGkgPSAwOyBpIDwgbW1zeXMtPmRhdGEtPm51bV9hc3luY19pbmZvOyBpKyspDQo+ICsJCWlmIChj
b21wX2lkID09IGFzeW5jW2ldLmNvbXBfaWQpDQo+ICsJCQlicmVhazsNCj4gKw0KPiArCWlmIChp
ID09IG1tc3lzLT5kYXRhLT5udW1fYXN5bmNfaW5mbykNCj4gKwkJcmV0dXJuOw0KPiArDQo+ICsJ
dmFsID0gRklFTERfUFJFUChHRU5NQVNLKDMxLCAxNiksIGhlaWdodCk7DQo+ICsJdmFsIHw9IEZJ
RUxEX1BSRVAoR0VOTUFTSygxNSwgMCksIHdpZHRoKTsNCj4gKwltdGtfbW1zeXNfdXBkYXRlX2Jp
dHMobW1zeXMsIGFzeW5jW2ldLm9mZnNldCwgYXN5bmNbaV0ubWFzaywgdmFsLCBjbWRxX3BrdCk7
DQo+ICt9DQo+ICtFWFBPUlRfU1lNQk9MX0dQTChtdGtfbW1zeXNfZGRwX2NvbmZpZyk7DQo+ICsN
Cj4gK3ZvaWQgbXRrX21tc3lzX2RlZmF1bHRfY29uZmlnKHN0cnVjdCBkZXZpY2UgKmRldikNCg0K
V2h5IG5vdCBkbyB0aGlzIHdoZW4gbW1zeXMgcHJvYmU/DQoNClJlZ2FyZHMsDQpDSw0KDQo+ICt7
DQo+ICsJc3RydWN0IG10a19tbXN5cyAqbW1zeXMgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCj4g
Kwljb25zdCBzdHJ1Y3QgbXRrX21tc3lzX2RlZmF1bHQgKmRlZl9jb25maWcgPSBtbXN5cy0+ZGF0
YS0+ZGVmX2NvbmZpZzsNCj4gKwlpbnQgaTsNCj4gKw0KPiArCWlmICghbW1zeXMtPmRhdGEtPm51
bV9kZWZfY29uZmlnKQ0KPiArCQlyZXR1cm47DQo+ICsNCj4gKwlmb3IgKGkgPSAwOyBpIDwgbW1z
eXMtPmRhdGEtPm51bV9kZWZfY29uZmlnOyBpKyspDQo+ICsJCW10a19tbXN5c191cGRhdGVfYml0
cyhtbXN5cywgZGVmX2NvbmZpZ1tpXS5vZmZzZXQsIGRlZl9jb25maWdbaV0ubWFzaywNCj4gKwkJ
CQkgICAgICBkZWZfY29uZmlnW2ldLnZhbCwgTlVMTCk7DQo+ICt9DQo+ICtFWFBPUlRfU1lNQk9M
X0dQTChtdGtfbW1zeXNfZGVmYXVsdF9jb25maWcpOw0KPiArDQoNCg0K

--__=_Part_Boundary_001_442410357.1150573808
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1RodSwmIzMyOzIwMjUtMDgtMjgmIzMyO2F0
JiMzMjsxNjowNyYjMzI7KzA4MDAsJiMzMjtQYXVsJiMzMjtDaGVuJiMzMjt3cm90ZToNCiZndDsm
IzMyO0Zyb206JiMzMjtOYW5jeSYjMzI7TGluJiMzMjsmbHQ7bmFuY3kubGluQG1lZGlhdGVrLmNv
bSZndDsNCiZndDsmIzMyOw0KJmd0OyYjMzI7LSYjMzI7QWRkJiMzMjtpbml0aWFsaXphdGlvbiYj
MzI7b2YmIzMyO3RvcCYjMzI7Y2xvY2tzJiMzMjthbmQmIzMyO2FzeW5jJiMzMjtjbG9ja3MmIzMy
O2ZvciYjMzI7ZWFjaCYjMzI7TU1TWVMuDQomZ3Q7JiMzMjstJiMzMjtBZGQmIzMyO1BNJiMzMjty
dW50aW1lJiMzMjtjb250cm9sJiMzMjthbmQmIzMyO25ldyYjMzI7ZnVuY3Rpb25zJiMzMjt0byYj
MzI7bWFuYWdlJiMzMjt0aGVzZSYjMzI7Y2xvY2tzLg0KJmd0OyYjMzI7LSYjMzI7QWRkJiMzMjtm
dW5jdGlvbnMmIzMyO3RvJiMzMjtzZXQmIzMyO3RoZXNlJiMzMjtjbG9ja3MmIzMyO2FjY29yZGlu
ZyYjMzI7dG8mIzMyO3RoZSYjMzI7ZGVmYXVsdA0KJmd0OyYjMzI7JiMzMjsmIzMyO2NvbmZpZ3Vy
YXRpb24mIzMyO29mJiMzMjt0aGUmIzMyO2NvcnJlc3BvbmRpbmcmIzMyO01NU1lTLg0KDQpUaGlz
JiMzMjtwYXRjaCYjMzI7aW5jbHVkZSYjMzI7MyYjMzI7dGhpbmdzOg0KMS4mIzMyO0FkZCYjMzI7
cnVudGltZSYjMzI7UE0NCjIuJiMzMjt0b3AmIzMyO2Nsb2NrJiMzMjtjb250cm9sDQozLiYjMzI7
YXN5bmMmIzMyO2NvbnRyb2wNCg0KSSYjMzI7d291bGQmIzMyO2xpa2UmIzMyO3lvdSYjMzI7dG8m
IzMyO3NlcGFyYXRlJiMzMjt0aGVzZSYjMzI7dG8mIzMyO2RpZmZlcmVudCYjMzI7cGF0Y2guDQoN
CiZndDsmIzMyOw0KJmd0OyYjMzI7U2lnbmVkLW9mZi1ieTomIzMyO05hbmN5JiMzMjtMaW4mIzMy
OyZsdDtuYW5jeS5saW5AbWVkaWF0ZWsuY29tJmd0Ow0KJmd0OyYjMzI7U2lnbmVkLW9mZi1ieTom
IzMyO1BhdWwtcGwmIzMyO0NoZW4mIzMyOyZsdDtwYXVsLXBsLmNoZW5AbWVkaWF0ZWsuY29tJmd0
Ow0KJmd0OyYjMzI7LS0tDQoNCltzbmlwXQ0KDQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsraW50JiMz
MjttdGtfbW1zeXNfZGRwX2Nsa19lbmFibGUoc3RydWN0JiMzMjtkZXZpY2UmIzMyOypkZXYsJiMz
MjtlbnVtJiMzMjttdGtfZGRwX2NvbXBfaWQmIzMyO2NvbXBfaWQpDQoNClRoaXMmIzMyO2lzJiMz
Mjt0byYjMzI7Y29udHJvbCYjMzI7YXN5bmMmIzMyO2Nsb2NrLCYjMzI7c28mIzMyO2NoYW5nZSYj
MzI7dGhlJiMzMjtmdW5jdGlvbiYjMzI7bmFtZSYjMzI7dG8NCg0KbXRrX21tc3lzX2FzeW5jX2Ns
a19lbmFibGUoKQ0KDQomZ3Q7JiMzMjsrew0KJmd0OyYjMzI7K3N0cnVjdCYjMzI7bXRrX21tc3lz
JiMzMjsqbW1zeXMmIzMyOz0mIzMyO2Rldl9nZXRfZHJ2ZGF0YShkZXYpOw0KJmd0OyYjMzI7K2Nv
bnN0JiMzMjtzdHJ1Y3QmIzMyO210a19tbXN5c19hc3luY19pbmZvJiMzMjsqYXN5bmMmIzMyOz0m
IzMyO21tc3lzLSZndDtkYXRhLSZndDthc3luY19pbmZvOw0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7
K2ludCYjMzI7aTsNCiZndDsmIzMyOysNCiZndDsmIzMyOytpZiYjMzI7KCFtbXN5cy0mZ3Q7ZGF0
YS0mZ3Q7bnVtX2FzeW5jX2luZm8pDQoNCmZvci1sb29wJiMzMjt3b3VsZCYjMzI7Y2hlY2smIzMy
O3RoaXMsJiMzMjtzbyYjMzI7ZHJvcCYjMzI7dGhpcy4NCg0KJmd0OyYjMzI7K3JldHVybiYjMzI7
MDsNCiZndDsmIzMyOysNCiZndDsmIzMyOytmb3ImIzMyOyhpJiMzMjs9JiMzMjswOyYjMzI7aSYj
MzI7Jmx0OyYjMzI7bW1zeXMtJmd0O2RhdGEtJmd0O251bV9hc3luY19pbmZvOyYjMzI7aSsrKQ0K
Jmd0OyYjMzI7K2lmJiMzMjsoY29tcF9pZCYjMzI7PT0mIzMyO2FzeW5jW2ldLmNvbXBfaWQpDQom
Z3Q7JiMzMjsrcmV0dXJuJiMzMjtjbGtfcHJlcGFyZV9lbmFibGUobW1zeXMtJmd0O2FzeW5jX2Ns
a1thc3luY1tpXS5pbmRleF0pOw0KJmd0OyYjMzI7K3JldHVybiYjMzI7MDsNCiZndDsmIzMyOyt9
DQomZ3Q7JiMzMjsrRVhQT1JUX1NZTUJPTF9HUEwobXRrX21tc3lzX2RkcF9jbGtfZW5hYmxlKTsN
CiZndDsmIzMyOysNCiZndDsmIzMyOyt2b2lkJiMzMjttdGtfbW1zeXNfZGRwX2Nsa19kaXNhYmxl
KHN0cnVjdCYjMzI7ZGV2aWNlJiMzMjsqZGV2LCYjMzI7ZW51bSYjMzI7bXRrX2RkcF9jb21wX2lk
JiMzMjtjb21wX2lkKQ0KJmd0OyYjMzI7K3sNCiZndDsmIzMyOytzdHJ1Y3QmIzMyO210a19tbXN5
cyYjMzI7Km1tc3lzJiMzMjs9JiMzMjtkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCiZndDsmIzMyOytj
b25zdCYjMzI7c3RydWN0JiMzMjttdGtfbW1zeXNfYXN5bmNfaW5mbyYjMzI7KmFzeW5jJiMzMjs9
JiMzMjttbXN5cy0mZ3Q7ZGF0YS0mZ3Q7YXN5bmNfaW5mbzsNCiZndDsmIzMyOytpbnQmIzMyO2k7
DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsraWYmIzMyOyghbW1zeXMtJmd0O2RhdGEtJmd0O251bV9h
c3luY19pbmZvKQ0KDQpmb3ItbG9vcCYjMzI7d291bGQmIzMyO2NoZWNrJiMzMjt0aGlzLCYjMzI7
c28mIzMyO2Ryb3AmIzMyO3RoaXMuDQoNCiZndDsmIzMyOytyZXR1cm47DQomZ3Q7JiMzMjsrDQom
Z3Q7JiMzMjsrZm9yJiMzMjsoaSYjMzI7PSYjMzI7MDsmIzMyO2kmIzMyOyZsdDsmIzMyO21tc3lz
LSZndDtkYXRhLSZndDtudW1fYXN5bmNfaW5mbzsmIzMyO2krKykNCiZndDsmIzMyOytpZiYjMzI7
KGNvbXBfaWQmIzMyOz09JiMzMjthc3luY1tpXS5jb21wX2lkKQ0KJmd0OyYjMzI7K2Nsa19kaXNh
YmxlX3VucHJlcGFyZShtbXN5cy0mZ3Q7YXN5bmNfY2xrW2FzeW5jW2ldLmluZGV4XSk7DQomZ3Q7
JiMzMjsrfQ0KJmd0OyYjMzI7K0VYUE9SVF9TWU1CT0xfR1BMKG10a19tbXN5c19kZHBfY2xrX2Rp
c2FibGUpOw0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7K3ZvaWQmIzMyO210a19tbXN5c19kZHBfY29u
ZmlnKHN0cnVjdCYjMzI7ZGV2aWNlJiMzMjsqZGV2LCYjMzI7ZW51bSYjMzI7bXRrX2RkcF9jb21w
X2lkJiMzMjtjb21wX2lkLA0KJmd0OyYjMzI7KyYjMzI7JiMzMjtpbnQmIzMyO3dpZHRoLCYjMzI7
aW50JiMzMjtoZWlnaHQsJiMzMjtzdHJ1Y3QmIzMyO2NtZHFfcGt0JiMzMjsqY21kcV9wa3QpDQoN
ClRoaXMmIzMyO2lzJiMzMjt0byYjMzI7Y29udHJvbCYjMzI7YXN5bmMuJiMzMjtTbyYjMzI7Y2hh
bmdlJiMzMjt0aGUmIzMyO2Z1bmN0aW9uJiMzMjtuYW1lJiMzMjt0bw0KDQptdGtfbW1zeXNfYXN5
bmNfY29uZmlnKCkNCg0KJmd0OyYjMzI7K3sNCiZndDsmIzMyOytzdHJ1Y3QmIzMyO210a19tbXN5
cyYjMzI7Km1tc3lzJiMzMjs9JiMzMjtkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCiZndDsmIzMyOytj
b25zdCYjMzI7c3RydWN0JiMzMjttdGtfbW1zeXNfYXN5bmNfaW5mbyYjMzI7KmFzeW5jJiMzMjs9
JiMzMjttbXN5cy0mZ3Q7ZGF0YS0mZ3Q7YXN5bmNfaW5mbzsNCiZndDsmIzMyOytpbnQmIzMyO2k7
DQomZ3Q7JiMzMjsrdTMyJiMzMjt2YWw7DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsraWYmIzMyOygh
bW1zeXMtJmd0O2RhdGEtJmd0O251bV9hc3luY19pbmZvKQ0KDQpJZiYjMzI7bW1zeXMtJmd0O2Rh
dGEtJmd0O251bV9hc3luY19pbmZvJiMzMjs9JiMzMjswLCYjMzI7dGhlbiYjMzI7aSYjMzI7PSYj
MzI7MCwmIzMyO2FuZCYjMzI7aXQmIzMyO3dvdWxkJiMzMjtyZXR1cm4mIzMyO2JlbG93Lg0KU28m
IzMyO3RoaXMmIzMyO2NoZWNraW5nJiMzMjtpcyYjMzI7cmVkdW5kYW50Lg0KDQomZ3Q7JiMzMjsr
cmV0dXJuOw0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7K2ZvciYjMzI7KGkmIzMyOz0mIzMyOzA7JiMz
MjtpJiMzMjsmbHQ7JiMzMjttbXN5cy0mZ3Q7ZGF0YS0mZ3Q7bnVtX2FzeW5jX2luZm87JiMzMjtp
KyspDQomZ3Q7JiMzMjsraWYmIzMyOyhjb21wX2lkJiMzMjs9PSYjMzI7YXN5bmNbaV0uY29tcF9p
ZCkNCiZndDsmIzMyOyticmVhazsNCiZndDsmIzMyOysNCiZndDsmIzMyOytpZiYjMzI7KGkmIzMy
Oz09JiMzMjttbXN5cy0mZ3Q7ZGF0YS0mZ3Q7bnVtX2FzeW5jX2luZm8pDQomZ3Q7JiMzMjsrcmV0
dXJuOw0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7K3ZhbCYjMzI7PSYjMzI7RklFTERfUFJFUChHRU5N
QVNLKDMxLCYjMzI7MTYpLCYjMzI7aGVpZ2h0KTsNCiZndDsmIzMyOyt2YWwmIzMyO3w9JiMzMjtG
SUVMRF9QUkVQKEdFTk1BU0soMTUsJiMzMjswKSwmIzMyO3dpZHRoKTsNCiZndDsmIzMyOyttdGtf
bW1zeXNfdXBkYXRlX2JpdHMobW1zeXMsJiMzMjthc3luY1tpXS5vZmZzZXQsJiMzMjthc3luY1tp
XS5tYXNrLCYjMzI7dmFsLCYjMzI7Y21kcV9wa3QpOw0KJmd0OyYjMzI7K30NCiZndDsmIzMyOytF
WFBPUlRfU1lNQk9MX0dQTChtdGtfbW1zeXNfZGRwX2NvbmZpZyk7DQomZ3Q7JiMzMjsrDQomZ3Q7
JiMzMjsrdm9pZCYjMzI7bXRrX21tc3lzX2RlZmF1bHRfY29uZmlnKHN0cnVjdCYjMzI7ZGV2aWNl
JiMzMjsqZGV2KQ0KDQpXaHkmIzMyO25vdCYjMzI7ZG8mIzMyO3RoaXMmIzMyO3doZW4mIzMyO21t
c3lzJiMzMjtwcm9iZSYjNjM7DQoNClJlZ2FyZHMsDQpDSw0KDQomZ3Q7JiMzMjsrew0KJmd0OyYj
MzI7K3N0cnVjdCYjMzI7bXRrX21tc3lzJiMzMjsqbW1zeXMmIzMyOz0mIzMyO2Rldl9nZXRfZHJ2
ZGF0YShkZXYpOw0KJmd0OyYjMzI7K2NvbnN0JiMzMjtzdHJ1Y3QmIzMyO210a19tbXN5c19kZWZh
dWx0JiMzMjsqZGVmX2NvbmZpZyYjMzI7PSYjMzI7bW1zeXMtJmd0O2RhdGEtJmd0O2RlZl9jb25m
aWc7DQomZ3Q7JiMzMjsraW50JiMzMjtpOw0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7K2lmJiMzMjso
IW1tc3lzLSZndDtkYXRhLSZndDtudW1fZGVmX2NvbmZpZykNCiZndDsmIzMyOytyZXR1cm47DQom
Z3Q7JiMzMjsrDQomZ3Q7JiMzMjsrZm9yJiMzMjsoaSYjMzI7PSYjMzI7MDsmIzMyO2kmIzMyOyZs
dDsmIzMyO21tc3lzLSZndDtkYXRhLSZndDtudW1fZGVmX2NvbmZpZzsmIzMyO2krKykNCiZndDsm
IzMyOyttdGtfbW1zeXNfdXBkYXRlX2JpdHMobW1zeXMsJiMzMjtkZWZfY29uZmlnW2ldLm9mZnNl
dCwmIzMyO2RlZl9jb25maWdbaV0ubWFzaywNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjtkZWZfY29uZmlnW2ldLnZhbCwmIzMyO05VTEwpOw0KJmd0OyYjMzI7K30NCiZn
dDsmIzMyOytFWFBPUlRfU1lNQk9MX0dQTChtdGtfbW1zeXNfZGVmYXVsdF9jb25maWcpOw0KJmd0
OyYjMzI7Kw0KDQoNCg0KPC9wcmU+DQo8L3A+PC9ib2R5PjwvaHRtbD48IS0tdHlwZTp0ZXh0LS0+
PCEtLXstLT48cHJlPioqKioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5vdGlj
ZQ0KICoqKioqKioqKioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRo
aXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNv
bmZpZGVudGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0
IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRv
IGJlIA0KY29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1
c2UsIGRpc3NlbWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9y
IGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkg
dW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0K
YmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlz
IGUtbWFpbCwgb3IgYmVsaWV2ZQ0KIA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFp
bCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJl
cGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRo
aXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBh
bmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3Ro
ZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_001_442410357.1150573808--

