Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3328D125E
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 05:01:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4462010FE72;
	Tue, 28 May 2024 03:01:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="otEbmabl";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="IueaCiUr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 969F410FE72
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 03:01:10 +0000 (UTC)
X-UUID: 8590da861c9e11ef8c37dd7afa272265-20240528
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=yupItWtKKczcSIqqQPWja+JsOIm4xQ6V5Y+XIAI0XGY=; 
 b=otEbmablUSVghwSHTc8Xp2Re15M4q/L/6myeS3IknkE16jEtU6sSFRUI5YBFa9bbXCliLIBigDvgJfduEWkUhtrxOHNxYfK52vNZPz5cQYpmK0cr+cvcrfSSIfXizM0B6+dHof80j2qmdi33t73KA3CBtQOwjpmbb7n43/Uaink=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39, REQID:1eba96d0-6575-4cfc-8d8f-a29652ef477e, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:393d96e, CLOUDID:36764b93-e2c0-40b0-a8fe-7c7e47299109,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 8590da861c9e11ef8c37dd7afa272265-20240528
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 629819940; Tue, 28 May 2024 11:01:04 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 27 May 2024 20:01:03 -0700
Received: from SINPR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 28 May 2024 11:01:03 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kp3qybIEsx1bq4PmhSfIM3OJOHwGQM2+Y2UI4JAH7lr8MvAvWXI8BQvfHTeCm3I3SAWCPiFnrZEgZTE7971cMusv86nvT4OZqi0UUk0E0+qrNYI74k+dn9yadvtNu+cSNV9NwKJ41C1NqOrAHQURFjUVMNpPDvL3iSjNQ2FWaOxGfso4d+n+2xDXkA3dysnB29a9cEmD1O4DhRo9jIx2Mu3KDbjxlNq6BFcUtMClIL/ulXq84tbBRh4khX8nk/CtV6wZ+/1GCw/b0TvZnXz6qB1MR1UZgHK/5Gb3MsCcenGo9eMz2puiQoOX2Wb6RajglsjTVQ/nu3j3Dev/TgiOFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9fvM+gEjAQaYETSiODFeLAWoV7aWZyUrSvo0SlHuxLI=;
 b=IahqbFfv1SPoEwMB7RtMPCq7UZBasl8Gi+qX/mHdYWhYqsmBGoqb7AJaWHSsE1QfVmbUwZWN2bhARxGDsDj2tYzVYvI8jiYBrD4H3vjRdZ+wZe9IcBnRgBDNgRHapEMh2tjWig6g5wwmZn0wkvZ+/uerF2eOHsOGA/8tEP7nf7gWz0/x73UNqPFpwC0XEVw0/lh8lVjNLbGYAUwWMVRPN1zE5/yt//xduk6aZkfcPgpwYRmgGUxiDj3cB+AVEZlM6rvpR/3acXFUgWYIkpQui70JnfPrLj+f+VxnqL6DnXRKcemUhLo8MhTThEM/CO+xCaeXkIweBRksmwbKvYKtng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9fvM+gEjAQaYETSiODFeLAWoV7aWZyUrSvo0SlHuxLI=;
 b=IueaCiUr0ptzkL/633s4DbBlMO1xRyYLNlsd2VBP0Zbbs/kIBAmwJVtQGlur7JtuFV4xByuqxFwDtvXEs8sSyA4QubWGkX+bWcn/OyxSzjHVOF+N6rRoPQ8/s1ECxEPLkB1zP0uT2xMXf9gjzJYjd+HM2Y9cuvFrkSkTgIAGBsI=
Received: from SEYPR03MB6626.apcprd03.prod.outlook.com (2603:1096:101:83::7)
 by TYZPR03MB8249.apcprd03.prod.outlook.com (2603:1096:405:1e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.9; Tue, 28 May
 2024 03:01:01 +0000
Received: from SEYPR03MB6626.apcprd03.prod.outlook.com
 ([fe80::9fa0:ee98:d5ed:beba]) by SEYPR03MB6626.apcprd03.prod.outlook.com
 ([fe80::9fa0:ee98:d5ed:beba%3]) with mapi id 15.20.7633.001; Tue, 28 May 2024
 03:01:01 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
 <krzysztof.kozlowski+dt@linaro.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?utf-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?=
 <Jason-ch.Chen@mediatek.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?=
 <Shawn.Sung@mediatek.com>, =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?=
 <Nancy.Lin@mediatek.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH RESEND,v6 8/8] soc: mediatek: mtk-cmdq: Add secure
 cmdq_pkt APIs
Thread-Topic: [PATCH RESEND,v6 8/8] soc: mediatek: mtk-cmdq: Add secure
 cmdq_pkt APIs
Thread-Index: AQHar3tb23XIl+/0dEi5AHaznK0CVLGr95AA
Date: Tue, 28 May 2024 03:01:00 +0000
Message-ID: <98b5d60e0ca29e6ac126035c1594c8b0d0210aba.camel@mediatek.com>
References: <20240526144443.14345-1-jason-jh.lin@mediatek.com>
 <20240526144443.14345-9-jason-jh.lin@mediatek.com>
In-Reply-To: <20240526144443.14345-9-jason-jh.lin@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB6626:EE_|TYZPR03MB8249:EE_
x-ms-office365-filtering-correlation-id: df126eec-e2f2-4dd5-9a06-08dc7ec267c9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230031|366007|1800799015|376005|7416005|38070700009; 
x-microsoft-antispam-message-info: =?utf-8?B?ZTNxMC9WR01uTnhYRmUrcmFsVG5QdzRJbldFYk85NFlteVBScEJabkRCNklx?=
 =?utf-8?B?VVFWdmVFdGNIRVRzUEpmRFdpTUdtejVyZDNhajI1L3I5bG83bEFiQUtpMkhW?=
 =?utf-8?B?NDVBSTdwRXFRMHZqZTArVWc5ZC81WWVkTEg0ZXlPUkozUE8yUk5adE5pOVVT?=
 =?utf-8?B?bCs0TkJ0WFpITUlKR0s2Mk00cVMzZGZydnR1NlF5K05oSkR6L0lTRWxOSnZ5?=
 =?utf-8?B?amUrV05GRDNBcjhhSTFINjRiVENKeXBkdTdkdnovSWdDWEcyS0xRR1lsb1l0?=
 =?utf-8?B?NjBDNTZnV3BqRkNWNGVuS1JCMFF4dTg2eC9iUG5UM0tTN0h4VlRnd28yZ3Y0?=
 =?utf-8?B?cEhKWDhuMXlLQUJzTGNvS3dhVEJlOCtsNGdHWDhJZkJ3N01rMkVvTmZjVHFS?=
 =?utf-8?B?RWg5ZXZTWVZXdjNLNU5Lamg1cnY4emlkM0piaXZyc2FjcThTVmhGR1NsQ1Vj?=
 =?utf-8?B?K0VxZFU3eVdBZFFTcXRiMGR2OGNRS1dLbSs3bzF5a2tOZE9NdlZrcjQ4bG9Z?=
 =?utf-8?B?c0Ftb214UGYzNXg5Sk9qUUplS21kRUlHVVRwQVBoU0d4Q1lYTmhaTllyM1Fx?=
 =?utf-8?B?cEMyM3NZc2RiYkI1NGIzVU1xV1puL0ZNM3JxZnFQaEIweG1HL3RVMzJ1Vm1z?=
 =?utf-8?B?ZTFuUkhUQnBNWFZ1UFltbTRZazdwQWhsTlBHdUlDM2djMHl0RzVySVp1a3Fi?=
 =?utf-8?B?a09mWElaRTBYakZkeXhySUorbmlHRE9xRFI1ZFQ4eWxrTFlRd2tQQTEvQUNE?=
 =?utf-8?B?UlNzOTgzUVo4RWFPZlFpSndLektZV21SeXl0d0pyRVMwaXE2ZTh5blI5Vndt?=
 =?utf-8?B?RERldHdGSzlGVGRKdm96ak1hcTB4c0lPa3lqcFdaTHE0TGx0ZWxQOEZ5b1JN?=
 =?utf-8?B?KzNLSzJmc0hMK3lmaXpHcTlkemc0TEZhVGQ0TC95YkpkODR4OXQwZm1SNmho?=
 =?utf-8?B?M29NMkxSdmMyMm8yd1NLUGlRMjFqM01DQW5hRVJTRlBBT0djZmgzNnE0ZStX?=
 =?utf-8?B?Z1VSUTFUbC8zTm5FdUJTa1B6VXhaUFFCUWNtVDVheHBUazZGUDZpclhrenJP?=
 =?utf-8?B?WEdlTmF3Yk5ZZE1pcFhvRmFCa1pMbTJaTVVkbXBqYjlZK1drL2E4U1hrd2xX?=
 =?utf-8?B?d2FsNlc4V2ZCd0tIYUV2WmY0aFB3VC8xREo4TFRzY0c1ODdRMVIrQ3hXbjcv?=
 =?utf-8?B?cGJ5M3VOSDlXR2JZb2xYRXJDUlhvamhla2Q3RVJGQ0RPSVJ6TG1aRUZybWtM?=
 =?utf-8?B?endMNWw3ZVNxVzVSKzZsbGV4RmxvZFFNWENPT0I4UnV0SDhGVWFhMFovNzhE?=
 =?utf-8?B?TGY5ZGhhYVZFQ2pHTTllYTJoMUMrTVBIVTZCVGUvcVJrbGhCNFpKVlhQVzMx?=
 =?utf-8?B?Z3ZhMS9RbkpGbjFORWZ5NkppVm53OTg0Mk9BUU93bklvK21hWE15N1ptbDNn?=
 =?utf-8?B?a0FEMlpPa09sa25ZS2dyME1LTHZhUXF5Z1RmTEk1R3pDeXBQM1NwdUMxYTZv?=
 =?utf-8?B?T1o4eUFnd3R2L2VZYUhsQ3NmcXdqN25Qb1VkMTN2UVdvNU5Jc0hKYU1SKzlr?=
 =?utf-8?B?ellreFVPN05INUNrQ3dvR1ZNVGhzQWVDVWpzbG9palB6OEx1QVpnMXNFZTdQ?=
 =?utf-8?B?SHQ1Y0pnV1JhOGs0MXcxNGVSQmN6dHExNytqU2lpWGV1ZldQcDdlc25uYXJB?=
 =?utf-8?B?ZU1LMzdpMDFrcU1rOTRYTFY0OGFhUWdaa25QUG1zUkV3RzJLbGFMTk0vbC9U?=
 =?utf-8?B?QUNnYXBaVUVsbEtDUWJYWnN2bE11b0JrQlprdzhwOGhlbUVqRkVjbk9weGl0?=
 =?utf-8?B?dXdUbFRlL0U3WWtiaXdzUT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB6626.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(7416005)(38070700009); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RSt0SlB4L2xhSnh5WmdIeFFwZlN2T2t0dldOWVExeWhoY2tZeXY4L1V0d2xE?=
 =?utf-8?B?Y1hKYm9JZTVaMlN0K29CTzErcENQNWU0NmVUbWVsc0N4VGRIV0tmQ1VvWDRt?=
 =?utf-8?B?ak9LVXhkdjNhZC9yOW1EeDdKNjFVeGJPei9YTEpHYzl1eUJoQUpTNG11Sm9u?=
 =?utf-8?B?VmZTdVE1Zis4UGE1cm9wcU1Fcmd4Vlh6aWRMTXduY1dqV1lWd2tPMXFKVG9Z?=
 =?utf-8?B?Z0tLTUxCZERWOGpVNzFKU2pEMExZcEF4dW05MEttMzh6ak9hUEh2MmNyTWFu?=
 =?utf-8?B?VndIZDQxSGV2K2RoOEFqbXIvb1AwV2RuMFZqdElJK2V3bGtUNVJzOGpnVzkv?=
 =?utf-8?B?bU42azJ5T09RTUNBZE14YzdQcndKRUhMMnp2ZGF3RlF3T250NWp2cGowMEox?=
 =?utf-8?B?WGV3MlYyN3pEOVQyaUtZZkxCMWNyZzRLaUJMNWJmSXdZREtvTUFwa0plb2Zl?=
 =?utf-8?B?V0kvTEcvTkZUN2xIZGNqSmVsRVE3UTBET1c4ZTI5OTZJNW5tcTNsbmJSMk01?=
 =?utf-8?B?VTlhZVBsK2psaGRVT2JSd3dZUWkrUlAwK2gxckYyZGN2QzI3amJvRkdKTWUw?=
 =?utf-8?B?QlRibDQyNzR5Z3hqWjRteTZXUXBIY0tPNmRGL2ZtOTRxT0ZRdmFFMSt0a3hT?=
 =?utf-8?B?a1kxYVJhbXFiczJjZ3JqNHpmenBqbTNMS1VZcmk2T3VYSDkzNTY3aDNsTllN?=
 =?utf-8?B?aWF5UlY0U28wSWVjd043S0QxU2lneFY4bmZXMEpwMVhaK2VSMGRPT3JjWTNR?=
 =?utf-8?B?Q2hQaktHRWU4S2RHUXRYV1lqNkNvWGZNVU9QSDB2WDFPZFVIMnB5Q3N0UjBt?=
 =?utf-8?B?TVlKOXE2RFpaVnArV0RIUlNwZVkxZ29xWmc2RWQvZHova0JwVGtZcXl5MHNn?=
 =?utf-8?B?R2F3bk8yMEE3bnEvTjMwa2ZoeUFQOFhWN1dkWW5nNFZFVTVaVUltYzN6OWJO?=
 =?utf-8?B?Q3hqZ2NZaGFZK2dyeGFieno5TVhjcG5UbGVNR1BnRW9FMUd2K08rTE5NS1hF?=
 =?utf-8?B?Y3dzRFlrUjRsajhMTWdNdWoydTl1SCszc0lsdm5qWDcrRjdaZ3dCWURybGhL?=
 =?utf-8?B?MFZrZUJORC9hd0hEUzV2bDRpTy9UdmhzbVB4cFJVVHhveCt1ZWp4R1hWOU5I?=
 =?utf-8?B?YktlaXZGYVJNbUo5T0RDVFcvaWVpaHZuL0pMdVE0NVhCL3JqcFlSaHBwMDJD?=
 =?utf-8?B?TEpFOVJ1ZmttajEzdHI0SFNxaExCanpJUTdCZEwraXFJSGVDR01oMWxBL2Rr?=
 =?utf-8?B?REdkY2g0SmFVdWFMOXZST3hQdFl1azRmUjkzc21PdFlzUXRRSFdLWUFRdlFP?=
 =?utf-8?B?S2xZcGNUcU13Zk5QWGhVeElzdG80d21qVjFBdjIwK3NyamtmQTdzY29mcCs5?=
 =?utf-8?B?UlpCNlpuZzNaQ3lUTWpIbGNpMmRSak13L29hcU1Sckh1L1lSNjhteldPelMr?=
 =?utf-8?B?MlRwM3crNndSdjN3ZDFGWjlKVDhONGllR281UVNRYlMrNlJrVGx6bCtnWVNW?=
 =?utf-8?B?RXJsdlhGT3IveWtUam9Nai9xNVlaTXVhd24rUWhBZGVFNXBzMExpR094Z3JK?=
 =?utf-8?B?S3o3elZwbkpYd3VLYkEwTVFPNThBaDhodlRwc1oycmNWOTRBOGQwVmlETXlK?=
 =?utf-8?B?eG41bU5KdDg5K3dxeTEraC9zOUVBcXlpU2tYeVFHNXdrU0RqREhqYSsxVmk3?=
 =?utf-8?B?VVBRRWRra1JtRThhcEZxd2dmNEx1em1kWE1KTnpGK291WCtkTFRPdjZyaXNn?=
 =?utf-8?B?VFczUXpXa0JhZDU3Tk1GcFIxQzBzQ0gyMFEyOERvTUlnTk54NncyVVRGb3FN?=
 =?utf-8?B?V2p3RTZsTmU2V0FOMDNSN0NLSExrSGNNNEl5NGYrK2UxUlpLNG90ak01NElJ?=
 =?utf-8?B?Q0hORjluSWJLenpDWVl5U0YxYmlIYklhTjBCSE1IMFpLSkwxdVZSZXpvbmpp?=
 =?utf-8?B?VTAreUlnNVBUUFVrSnZXVmZoK3FZTm1QQXFkQW5SSDc4dXFNaDMvMnpMand2?=
 =?utf-8?B?bmx5bDl4aUduMXlZd2Z6aXN1M1BOVUVRaEFmZ2xNMVVkREZkRU9YdC84UWZJ?=
 =?utf-8?B?aGxUQnJrWXErM0pGS251Z1Q5NlBWVmE0SUJXQjZZZndKemxDR2hMeEh3K3dn?=
 =?utf-8?Q?SziT5SEMEpSIaoNZN6yWhaKS8?=
Content-ID: <7934CBA9B435FF4B8E6ECDD68E4BC2F3@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB6626.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df126eec-e2f2-4dd5-9a06-08dc7ec267c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2024 03:01:00.9671 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PrXraIvHrhaeaiMg52R4vu893R1OF7Fi44QpkMoyUkeDB+3YPF4VQyUkv1gMEIBJ4M0//cpS6DE1NfHOeelh7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8249
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_008_1072562136.1434476830"
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

--__=_Part_Boundary_008_1072562136.1434476830
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEphc29uOg0KDQpPbiBTdW4sIDIwMjQtMDUtMjYgYXQgMjI6NDQgKzA4MDAsIEphc29uLUpI
LkxpbiB3cm90ZToNCj4gT3BlbiBzZWN1cmUgY21kcV9wa3QgQVBJcyB0byBzdXBwb3J0IGV4ZWN1
dGluZyBjb21tYW5kcyBpbiBzZWN1cmUgd29ybGQuDQo+IA0KPiAxLiBBZGQgY21kcV9zZWNfcGt0
X2FsbG9jX3NlY19kYXRhKCksIGNtZHFfc2VjX3BrdF9mcmVlX3NlY19kYXRhKCkgYW5kDQo+ICAg
IGNtZHFfc2VjX3BrdF9zZXRfZGF0YSgpIHRvIHByZXBhcmUgdGhlIHNlY19kYXRhIGluIGNtZHFf
cGt0IHRoYXQgd2lsbA0KPiAgICBiZSByZWZlcmVuY2VkIGluIHRoZSBzZWN1cmUgd29ybGQuDQo+
IA0KPiAyLiBBZGQgY21kcV9zZWNfaW5zZXJ0X2JhY2t1cF9jb29raWUoKSBhbmQgY21kcV9zZWNf
cGt0X3dyaXRlKCkgdG8NCj4gICAgZ2VuZXJhdGUgY29tbWFuZHMgdGhhdCBuZWVkIHRvIGJlIGV4
ZWN1dGVkIGluIHRoZSBzZWN1cmUgd29ybGQuDQo+ICAgIEluIGNtZHFfc2VjX3BrdF93cml0ZSgp
LCB3ZSBuZWVkIHRvIHByZXBhcmUgdGhlIG1ldGFkYXRhIHRvIHN0b3JlDQo+ICAgIGJ1ZmZlciBv
ZmZzZXQgb2YgdGhlIHNlY3VyZSBidWZmZXIgaGFuZGxlIGJlY2F1c2Ugc2VjdXJlIHdvcmxkIGNh
bg0KPiAgICBvbmx5IHRyYW5zbGF0ZSB0aGUgc3RhcnQgYWRkcmVzcyBvZiBzZWN1cmUgYnVmZmVy
IGJ5IHNlY3VyZSBoYW5kbGUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKYXNvbi1KSC5MaW4gPGph
c29uLWpoLmxpbkBtZWRpYXRlay5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEhzaWFvIENoaWVuIFN1
bmcgPHNoYXduLnN1bmdAbWVkaWF0ZWsuY29tPg0KPiAtLS0NCg0KW3NuaXBdDQoNCj4gKw0KPiAr
aW50IGNtZHFfc2VjX3BrdF9zZXRfZGF0YShzdHJ1Y3QgY21kcV9wa3QgKnBrdCwgZW51bSBjbWRx
X3NlY19zY2VuYXJpbyBzY2VuYXJpbykNCj4gK3sNCj4gKwlzdHJ1Y3QgY21kcV9zZWNfZGF0YSAq
c2VjX2RhdGE7DQo+ICsJaW50IHJldDsNCj4gKw0KPiArCWlmICghcGt0KSB7DQo+ICsJCXByX2Vy
cigiaW52YWxpZCBwa3Q6JXAiLCBwa3QpOw0KPiArCQlyZXR1cm4gLUVJTlZBTDsNCj4gKwl9DQo+
ICsNCj4gKwlyZXQgPSBjbWRxX3NlY19wa3RfYWxsb2Nfc2VjX2RhdGEocGt0KTsNCj4gKwlpZiAo
cmV0IDwgMCkNCj4gKwkJcmV0dXJuIHJldDsNCj4gKw0KPiArCXByX2RlYnVnKCJbJXMgJWRdIHBr
dDolcCBzZWNfZGF0YTolcCBzY2VuOiV1IiwNCj4gKwkJIF9fZnVuY19fLCBfX0xJTkVfXywgcGt0
LCBwa3QtPnNlY19kYXRhLCBzY2VuYXJpbyk7DQo+ICsNCj4gKwlzZWNfZGF0YSA9IChzdHJ1Y3Qg
Y21kcV9zZWNfZGF0YSAqKXBrdC0+c2VjX2RhdGE7DQo+ICsJc2VjX2RhdGEtPnNjZW5hcmlvID0g
c2NlbmFyaW87DQo+ICsNCj4gKwlyZXR1cm4gMDsNCj4gK30NCg0KV2hhdCBkb2VzIGNtZHFfc2Vj
X3BrdF9zZXRfZGF0YSgpIGV4YWN0bHkgZG8/IEl0IHNlZW1zIHRvIGVuYWJsZS9kaXNhYmxlIHBy
b3RlY3Rpb24gb24gaGFyZHdhcmUgb2YgY2VydGFpbiBwaXBlbGluZS4NCkluIGZ1dHVyZSwgeW91
IHdvdWxkIHVzZSBzZWN1cmUgR0NFIGZvciBub3JtYWwgdmlkZW8gYW5kIHNlY3VyZSB2aWRlby4N
CldvdWxkIHlvdSBhbHNvIHVzZSBzZWN1cmUgZGlzcGxheSBwaXBlbGluZSBmb3IgYm90aCBub3Jt
YWwgdmlkZW8gYW5kIHNlY3VyZSB2aWRlbz8NCklmIHNvLCBJIHRoaW5rIHdlIGNvdWxkIGRyb3Ag
dGhpcyBmdW5jdGlvbiBiZWNhdXNlIHRoZSBoYXJkd2FyZSBpcyBhbHdheXMgcHJvdGVjdGVkLg0K
DQpSZWdhcmRzLA0KQ0sNCg0KPiArRVhQT1JUX1NZTUJPTF9HUEwoY21kcV9zZWNfcGt0X3NldF9k
YXRhKTsNCj4gKw0K

--__=_Part_Boundary_008_1072562136.1434476830
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtKYXNvbjoNCg0KT24mIzMyO1N1biwmIzMy
OzIwMjQtMDUtMjYmIzMyO2F0JiMzMjsyMjo0NCYjMzI7KzA4MDAsJiMzMjtKYXNvbi1KSC5MaW4m
IzMyO3dyb3RlOg0KJmd0OyYjMzI7T3BlbiYjMzI7c2VjdXJlJiMzMjtjbWRxX3BrdCYjMzI7QVBJ
cyYjMzI7dG8mIzMyO3N1cHBvcnQmIzMyO2V4ZWN1dGluZyYjMzI7Y29tbWFuZHMmIzMyO2luJiMz
MjtzZWN1cmUmIzMyO3dvcmxkLg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjsxLiYjMzI7QWRkJiMzMjtj
bWRxX3NlY19wa3RfYWxsb2Nfc2VjX2RhdGEoKSwmIzMyO2NtZHFfc2VjX3BrdF9mcmVlX3NlY19k
YXRhKCkmIzMyO2FuZA0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7Y21kcV9zZWNfcGt0X3NldF9k
YXRhKCkmIzMyO3RvJiMzMjtwcmVwYXJlJiMzMjt0aGUmIzMyO3NlY19kYXRhJiMzMjtpbiYjMzI7
Y21kcV9wa3QmIzMyO3RoYXQmIzMyO3dpbGwNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyO2JlJiMz
MjtyZWZlcmVuY2VkJiMzMjtpbiYjMzI7dGhlJiMzMjtzZWN1cmUmIzMyO3dvcmxkLg0KJmd0OyYj
MzI7DQomZ3Q7JiMzMjsyLiYjMzI7QWRkJiMzMjtjbWRxX3NlY19pbnNlcnRfYmFja3VwX2Nvb2tp
ZSgpJiMzMjthbmQmIzMyO2NtZHFfc2VjX3BrdF93cml0ZSgpJiMzMjt0bw0KJmd0OyYjMzI7JiMz
MjsmIzMyOyYjMzI7Z2VuZXJhdGUmIzMyO2NvbW1hbmRzJiMzMjt0aGF0JiMzMjtuZWVkJiMzMjt0
byYjMzI7YmUmIzMyO2V4ZWN1dGVkJiMzMjtpbiYjMzI7dGhlJiMzMjtzZWN1cmUmIzMyO3dvcmxk
Lg0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7SW4mIzMyO2NtZHFfc2VjX3BrdF93cml0ZSgpLCYj
MzI7d2UmIzMyO25lZWQmIzMyO3RvJiMzMjtwcmVwYXJlJiMzMjt0aGUmIzMyO21ldGFkYXRhJiMz
Mjt0byYjMzI7c3RvcmUNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyO2J1ZmZlciYjMzI7b2Zmc2V0
JiMzMjtvZiYjMzI7dGhlJiMzMjtzZWN1cmUmIzMyO2J1ZmZlciYjMzI7aGFuZGxlJiMzMjtiZWNh
dXNlJiMzMjtzZWN1cmUmIzMyO3dvcmxkJiMzMjtjYW4NCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMy
O29ubHkmIzMyO3RyYW5zbGF0ZSYjMzI7dGhlJiMzMjtzdGFydCYjMzI7YWRkcmVzcyYjMzI7b2Ym
IzMyO3NlY3VyZSYjMzI7YnVmZmVyJiMzMjtieSYjMzI7c2VjdXJlJiMzMjtoYW5kbGUuDQomZ3Q7
JiMzMjsNCiZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtKYXNvbi1KSC5MaW4mIzMyOyZsdDtq
YXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tJmd0Ow0KJmd0OyYjMzI7U2lnbmVkLW9mZi1ieTomIzMy
O0hzaWFvJiMzMjtDaGllbiYjMzI7U3VuZyYjMzI7Jmx0O3NoYXduLnN1bmdAbWVkaWF0ZWsuY29t
Jmd0Ow0KJmd0OyYjMzI7LS0tDQoNCltzbmlwXQ0KDQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsraW50
JiMzMjtjbWRxX3NlY19wa3Rfc2V0X2RhdGEoc3RydWN0JiMzMjtjbWRxX3BrdCYjMzI7KnBrdCwm
IzMyO2VudW0mIzMyO2NtZHFfc2VjX3NjZW5hcmlvJiMzMjtzY2VuYXJpbykNCiZndDsmIzMyOyt7
DQomZ3Q7JiMzMjsrc3RydWN0JiMzMjtjbWRxX3NlY19kYXRhJiMzMjsqc2VjX2RhdGE7DQomZ3Q7
JiMzMjsraW50JiMzMjtyZXQ7DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsraWYmIzMyOyghcGt0KSYj
MzI7ew0KJmd0OyYjMzI7K3ByX2VycigmcXVvdDtpbnZhbGlkJiMzMjtwa3Q6JXAmcXVvdDssJiMz
Mjtwa3QpOw0KJmd0OyYjMzI7K3JldHVybiYjMzI7LUVJTlZBTDsNCiZndDsmIzMyOyt9DQomZ3Q7
JiMzMjsrDQomZ3Q7JiMzMjsrcmV0JiMzMjs9JiMzMjtjbWRxX3NlY19wa3RfYWxsb2Nfc2VjX2Rh
dGEocGt0KTsNCiZndDsmIzMyOytpZiYjMzI7KHJldCYjMzI7Jmx0OyYjMzI7MCkNCiZndDsmIzMy
OytyZXR1cm4mIzMyO3JldDsNCiZndDsmIzMyOysNCiZndDsmIzMyOytwcl9kZWJ1ZygmcXVvdDtb
JXMmIzMyOyVkXSYjMzI7cGt0OiVwJiMzMjtzZWNfZGF0YTolcCYjMzI7c2NlbjoldSZxdW90OywN
CiZndDsmIzMyOysmIzMyO19fZnVuY19fLCYjMzI7X19MSU5FX18sJiMzMjtwa3QsJiMzMjtwa3Qt
Jmd0O3NlY19kYXRhLCYjMzI7c2NlbmFyaW8pOw0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7K3NlY19k
YXRhJiMzMjs9JiMzMjsoc3RydWN0JiMzMjtjbWRxX3NlY19kYXRhJiMzMjsqKXBrdC0mZ3Q7c2Vj
X2RhdGE7DQomZ3Q7JiMzMjsrc2VjX2RhdGEtJmd0O3NjZW5hcmlvJiMzMjs9JiMzMjtzY2VuYXJp
bzsNCiZndDsmIzMyOysNCiZndDsmIzMyOytyZXR1cm4mIzMyOzA7DQomZ3Q7JiMzMjsrfQ0KDQpX
aGF0JiMzMjtkb2VzJiMzMjtjbWRxX3NlY19wa3Rfc2V0X2RhdGEoKSYjMzI7ZXhhY3RseSYjMzI7
ZG8mIzYzOyYjMzI7SXQmIzMyO3NlZW1zJiMzMjt0byYjMzI7ZW5hYmxlL2Rpc2FibGUmIzMyO3By
b3RlY3Rpb24mIzMyO29uJiMzMjtoYXJkd2FyZSYjMzI7b2YmIzMyO2NlcnRhaW4mIzMyO3BpcGVs
aW5lLg0KSW4mIzMyO2Z1dHVyZSwmIzMyO3lvdSYjMzI7d291bGQmIzMyO3VzZSYjMzI7c2VjdXJl
JiMzMjtHQ0UmIzMyO2ZvciYjMzI7bm9ybWFsJiMzMjt2aWRlbyYjMzI7YW5kJiMzMjtzZWN1cmUm
IzMyO3ZpZGVvLg0KV291bGQmIzMyO3lvdSYjMzI7YWxzbyYjMzI7dXNlJiMzMjtzZWN1cmUmIzMy
O2Rpc3BsYXkmIzMyO3BpcGVsaW5lJiMzMjtmb3ImIzMyO2JvdGgmIzMyO25vcm1hbCYjMzI7dmlk
ZW8mIzMyO2FuZCYjMzI7c2VjdXJlJiMzMjt2aWRlbyYjNjM7DQpJZiYjMzI7c28sJiMzMjtJJiMz
Mjt0aGluayYjMzI7d2UmIzMyO2NvdWxkJiMzMjtkcm9wJiMzMjt0aGlzJiMzMjtmdW5jdGlvbiYj
MzI7YmVjYXVzZSYjMzI7dGhlJiMzMjtoYXJkd2FyZSYjMzI7aXMmIzMyO2Fsd2F5cyYjMzI7cHJv
dGVjdGVkLg0KDQpSZWdhcmRzLA0KQ0sNCg0KJmd0OyYjMzI7K0VYUE9SVF9TWU1CT0xfR1BMKGNt
ZHFfc2VjX3BrdF9zZXRfZGF0YSk7DQomZ3Q7JiMzMjsrDQoNCjwvcHJlPg0KPC9wPjwvYm9keT48
L2h0bWw+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioqKioqIE1FRElBVEVL
IENvbmZpZGVudGlhbGl0eSBOb3RpY2UgKioqKioqKioqKioqKioqKioqKioNClRoZSBpbmZvcm1h
dGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFueSANCmF0
dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmlldGFyeSwgcHJpdmlsZWdlZCwg
b3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxpY2FibGUgbGF3
cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVk
IHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlvbiwgDQpkaXN0cmlidXRpb24sIHBy
aW50aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0
cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lwaWVudChzKSBpcyBzdHJpY3RseSBw
cm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5k
ZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxpZXZlIA0KdGhhdCB5b3UgaGF2ZSBy
ZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0K
aW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQg
YWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBm
cm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlz
IGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_008_1072562136.1434476830--

