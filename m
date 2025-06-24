Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4CDAE5C05
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 07:49:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4349010E4E0;
	Tue, 24 Jun 2025 05:49:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="C8mnYAVs";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="VR6/p0Fr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F77310E4E0
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 05:49:51 +0000 (UTC)
X-UUID: 08036d4450bf11f0b910cdf5d4d8066a-20250624
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=9hBaKM4TNadAghF2MvzZnX+9hrCHikSoJwD44TwgrXE=; 
 b=C8mnYAVsJZWK1Y+L/zdW1wFclyiF/+JnmRmSJPdPU4x7QtNeOHDAFsxjM1OWNIgOf8Q4xAdg3+QzYRuIJgcFY0QoHWBV+c1ntYVWVTd9gKDHzNVjWfPtPtxO2GFeH8xAztoBOFgc+WUAYtBBTD8ah68bhC7+ir7ElHEEVxsvNGE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2, REQID:c7c19ce9-63a5-4f3b-8aee-729d01eb3fc8, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:9eb4ff7, CLOUDID:116e0459-abad-4ac2-9923-3af0a8a9a079,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
 nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
 OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 08036d4450bf11f0b910cdf5d4d8066a-20250624
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 650983341; Tue, 24 Jun 2025 13:49:45 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 24 Jun 2025 13:49:43 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 24 Jun 2025 13:49:43 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YM7E+M7smaEN4K1eWZjCY7bmE7Zatvh+E+3sJrDA4yVGB1E0MVo75zBIO0pIjnbhVlm51max+yVm7AWe6nfbsRBTAqZRFjwrKsteZ+10pdTcarPJVGk720WQn3bnypsR3Gxw+1C731IBXY6f8ln0PONiJeiUpfZSG8oZSEUC+frzMXs4V6Um+GzvAcg+RCc0/VFccq0MdWsde7HghgQromt0QZMp38otaG8+EDcinyu8bPYbdVi1cb7iKVFLX45oZW/e7aifJMmtva+MOjr+tYMILTTIrBY/Dtw6CT8F665XnWDbgSTijg5PCe0v5IV8hp1rL154l8B3Wl67x3FczQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LkNHihRhiZLBWo/VuJmYhMmZ/N4PnlpGsWCH+vXi42M=;
 b=iJyV2H97YshwICyLzGGU28ifrUS06B+4s1l/ncGKWPOp2WdKBAoCM35aRbxoYOVq8rqTlNKhXWnMQl8KNi2K55WbJw5gtaYStWsdmLSV9fQGyDmfKDnRGBzsmRmT1ZdxZPTyGJEH4rBgixUMCEMVGsYDJZTXb8AuScgqhF78vyjS/xephUAA3eZKXXjc9Xtcmn6mDvCvlTc4r2yKSBmp9Q0UZac5RJkqCxgHT4bx2ZpJROtWhNx0Wv8F1tikfFm/4Kqsxx1wQc1NOlpfCh0SRFP0CNDgq0wPPSLMsRnAliqAjfhgbcoE91d7Bx4x1XT+nctqPhaFkrTBuNbzJafx5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LkNHihRhiZLBWo/VuJmYhMmZ/N4PnlpGsWCH+vXi42M=;
 b=VR6/p0FrhlrTavWvVRl1r4kkCXSzNkJ4NK1MDA2oYo4TPkYYp58Me/kZbodL7nGH0VL1Fp7CU220szw4pVY9W/RP3o1gL/ZKYdHLBzKf/2E7jjRjmEck+8NfF6NRiG18z0BApxidNRS78o8+mC8N89kw2k1UTLMQVOWZmmB/Id8=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB8014.apcprd03.prod.outlook.com (2603:1096:101:17b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Tue, 24 Jun
 2025 05:49:40 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%5]) with mapi id 15.20.8835.027; Tue, 24 Jun 2025
 05:49:40 +0000
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
Subject: Re: [PATCH v3 16/17] drm/mediatek: Add support for multiple mmsys in
 the one mediatek-drm driver
Thread-Topic: [PATCH v3 16/17] drm/mediatek: Add support for multiple mmsys in
 the one mediatek-drm driver
Thread-Index: AQHbxXzQOStQTNOvaE6rHwUIwuScu7QSDJKA
Date: Tue, 24 Jun 2025 05:49:40 +0000
Message-ID: <913e53c02f5d3155a0ea26cf5abe3c4b65fb237b.camel@mediatek.com>
References: <20250515093454.1729720-1-paul-pl.chen@mediatek.com>
 <20250515093454.1729720-17-paul-pl.chen@mediatek.com>
In-Reply-To: <20250515093454.1729720-17-paul-pl.chen@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB8014:EE_
x-ms-office365-filtering-correlation-id: 343a0d0b-d19d-44b1-7e4b-08ddb2e2e988
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?c3dwNW5pWGgrMzg5Y012QVJoaFFkdWRYSGtnNWxRTE1wVFdqZFFQT1MyQWIv?=
 =?utf-8?B?TnZrUHhzM3RJZmg2NDY1TU5tbG5BUVRwMkI3UEFYSGlPeHZMRm1YdzJOd0Na?=
 =?utf-8?B?WURyZjJMSTZVZTAxQVMrR2JaV2dzRk8zQVM0Vythb3lGNzlwcDAzRDNoL1Fs?=
 =?utf-8?B?dU1aNWhMQ0Q3YlRnMmdTUVQvbVpQSU9qaVBVdUVZQW1mSWVGQUtsM0cwemdU?=
 =?utf-8?B?czgrZ2dNMlZBQ29sdjNlREpVK0hCN3VoRDZkekZRS1VOLzNuWndrclRXbW5P?=
 =?utf-8?B?Y0krbitNVDhROUxQOFRZNU0wYTZXeEdiM0RRcDFVaU01dTZKNUI1b0dacXpm?=
 =?utf-8?B?OHpDZmJPU29Mc2lSSXhCWFlLTDV3cDh0VXdOREVkRmsrdzlSRm5TNXdkUGIv?=
 =?utf-8?B?M2VqMFZ1OVZmRXQ0QUpZSUhGUldNUEdLUVhkTzRqZjc4aHMvNXd3L0hNdHNs?=
 =?utf-8?B?YU9XcFFaUlNaa1NKQXlSelNJRUdhWVFEeEgxV3JUSVBFa1lIUysyS28yNkp5?=
 =?utf-8?B?NUlMNXQ2WGthUnhWUHZNMThsN3haRHNVUERRUk1pa2lRcjNrVG9TZTRHb0lL?=
 =?utf-8?B?YzI5QXdycVI2T05nbDV4VllCamVIY01VTWJYSFRmd0ZLU2hSRFUzNUFSWXZk?=
 =?utf-8?B?TXQ4dTdicVJXM1oxNjdnOXovMkJ4eXQ3eGVhVWtna3BPMTRRVzlEc1pPV2pS?=
 =?utf-8?B?SFp3bEkzUFREYTN5QWZxelk4Z3dnaEVFZEI0cEUyS3Y0cmtPWUFJTUcrZkhD?=
 =?utf-8?B?UThNRXV2cnJDTVJncFZkNW42aHJHQllyNXh2Z0lTMU1pM0RnL2k5RGpxK2Fh?=
 =?utf-8?B?d3ZwSER2S3M0Zm5LekUxajNCN0kzN0FoYXcrUW1qcGZHQllvbTR6MWkwdDNF?=
 =?utf-8?B?QU80clV4bDl4T1BNQnRuSmxwMzJHYUdqSm9ZeE1RSWRnUG8zSU5oVmhIMm1D?=
 =?utf-8?B?Z2hlamsrWCtaK2RnZnc0elVWTXJpbXVEQ1JkRWtSelkzalQrZnRxeUlKV2Vq?=
 =?utf-8?B?dW5RV2hDc2VobXZLamVNZ3puTklMRzJmV0dwSU9iV2ZBdHBJZHIvL1ZXQnFK?=
 =?utf-8?B?ZDNSQm1EbEpCOGpNU2llcVNZN2ZkRm1tMEgzZjdGYkh0cVp0Z09pdXRZWUQz?=
 =?utf-8?B?cXcwZU43Vk8wcVRiSXhUTFJTVGJlVmNuQUloUnVaMkUyM1pHam8xS0prVXFZ?=
 =?utf-8?B?K1BvT2RVQktVZnFHR3NpT3VZUmpycDJsblZhYkMwSlpqNHRhcWd5c0k0VHpm?=
 =?utf-8?B?d1EwbDlhSzNGbGlqTEt1WEwxQ0pUbmZWcCt3QUVrN3l1YmEvdmdFQ3FTZDVR?=
 =?utf-8?B?QnNQM2pDYmVRelg4dGhSSzVmZ2FyZmRjUWFvZ1Z2ZVdWZ1lYc0N1L3R2M2Nl?=
 =?utf-8?B?V0hxNDZPdHdZU29ZallpLzU2T21PaXpmY29QMnluY2xqOHAxdm80L3I0a2xo?=
 =?utf-8?B?TEJoVk16K1RnSGpqWmtJWDdTdmVET3BuSkVDSFRDWC9wWXY4bmlHZUZCeUN0?=
 =?utf-8?B?MUErbm4vVVI2WU0yS0YyTVhrRDdrZDBTRFpSNzBOMnJQdkNqaFhZMlkvUGND?=
 =?utf-8?B?cXdLYndzMC9zaEZCbXJtYkh1NXluZE40emozTlJpWFhYVDdOYmdnNitZcHBu?=
 =?utf-8?B?UDl4WEdmaUNoY3dXVW9OUlk2d1lNS09jUVZtbGhvbGNhRnYzZmUveHQ2M1ln?=
 =?utf-8?B?WVdqYWpuVGFMQ3R6a1FqRkswRGE3aHZGTFNiQUJTdHhDMlBmRXRYZHlTUW8x?=
 =?utf-8?B?R0dMbFdFUmNMdHF3RHIwTldhY3MvaGhDNDZhemlWcUFCNWJlM1JVQ1JjRDRU?=
 =?utf-8?B?MlFFNHN6YjF2WXhtNWFVQjcrUUkyTzZXL2EwUHRDQ0pKY1UwdHVnUGZTVDJo?=
 =?utf-8?B?QU5NbTdtMHdlZFY4Z1g5L0RnZTg4bVF0RW1MSlNVMmFyS1FTdjl3TEh4bkRv?=
 =?utf-8?B?SmdUTUw5azM3VzUvL3RKRFVnOEJzZnlxVyt0L2k5V3QwU0NWcTJqLzFVNkhC?=
 =?utf-8?B?b3ZjWVhnSXZBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YTFjdjI0akFqUElXWjJCY21SalNDaDhMN0VHTkZyNHJ1cENxNXh5V1dabmlt?=
 =?utf-8?B?TTRQSG14WUtSWXdqZDRqU2dPQW5mOVBBWXpIaFVuWTY5SGRxWmw4OEcvc01V?=
 =?utf-8?B?MlBFbWNHMjl2WGZPOENJcWE1ZmpSd21BOFVaM2YzVW9DM2hoTVBmTWU2NXE1?=
 =?utf-8?B?blF0V2tpZVBrOEZCVTAxa2o1WDZhOWlIZ2E0Wjl5RE1sUEdhTEFmU2VGTkFt?=
 =?utf-8?B?bHdZQWtaOTJ5NC9qa1pTV1pocHFBcHBEdmVVNC91WG1DdWdqeWxPQ2tXbmFM?=
 =?utf-8?B?Y0J6aU9WemVRNHlFdzV3aUpYZGVXMVllbW9PVEczOFVFL3RrMnZETnRkeWtZ?=
 =?utf-8?B?VHIrT0s4ZVVJN1FuRjdXa3Y5aWtZQWFqdHBtZzQxK0lSbDJ5RTVEVUliVGRF?=
 =?utf-8?B?c0M0enp1ZEhTWFErTks5SVBCcnRhV1c5Z2RjQU42NnREbW5WSHhVeVdlWlZv?=
 =?utf-8?B?cC9qeVVsQmY5blp5QVJsWmlwT003aTJxTm5PRWFlNWR6WXNSYjhqb244dUdY?=
 =?utf-8?B?NS9Cb3FIYm9TaFZjWE1yaVE2MUlXQlFJWGJ5QkNISmhZTUQ2NE1mV3lGd0M0?=
 =?utf-8?B?aGVieWxramxwbkpiU1QwUjVINFlaanJaOCtSOFg5cEVaV2ZOa2ZhN3JmVDds?=
 =?utf-8?B?Vmp2aG5uNHFNTFh5WkI0eGZNQzNmZUtrZGhTL1pmSks4SjRIZ2F3Ykl3Wm5O?=
 =?utf-8?B?a2x6QjZRYjdoeDdZdURHclZHVXhMdG9qdjVwVTd2NEtwTFVSMzJEcjVZbUla?=
 =?utf-8?B?dDh5Mmw1ckxwUElPWFZEb2t3MXNFMUt5NEd3ZTNueVUwQnRaZ2Foc28wZlZ6?=
 =?utf-8?B?TjU5clMza0MvTzl4OTRNTk16TkZ2NHlQTjJpd0VCZXphdHFJbWRvSlhUU1ow?=
 =?utf-8?B?UVJ6ZUduOWpSWlBuT3VOMlN3Y2t6R2VxTFA0d3c4d0t4SXBtQU5HY3RSRG8y?=
 =?utf-8?B?b3N4SGlWMHF6RjNRUFNDbXBMaDM1QVI3QUowN1dtSjFKUkhxK3hxMTZzZ01L?=
 =?utf-8?B?c3RwT1pGalBPaklJSkFkMEt5R21NY01HTkoxV0JveW11MDdPRTAyUFFCRnYx?=
 =?utf-8?B?RVIxek15aGZqNXZtc2ZVSC9sd09SZFlFb0ZxeE1yVmdzYkhkNnNOUkdxc2RD?=
 =?utf-8?B?M0RvS044SGx4SnBpc0x2ck5mMStQcTdQTnZ5WDFyU04zL3hrVEZGLzhPL3hu?=
 =?utf-8?B?NWt2V0szdjM3dVp0YWtLZVJDeUIvWkV0b29vN2VobHJ2OFZibFFPbVNsOG9Q?=
 =?utf-8?B?Qk9GOHduRXM0bjVLZVk3emw3eGYxWExXdlBqL2dqaERac2pQbHhSS0JyQnBK?=
 =?utf-8?B?ckZIZStheTlCaytzd0hScHR0MVMxZklIT3NncGhhbkRXazZsL2E5K21iZ0E3?=
 =?utf-8?B?UCs3SXVBWUpHRUg4MkFCNnR5aEV4dm1MN0RiQTM2RVdzQlhhWmVvR3NaTXR1?=
 =?utf-8?B?M2pacXJTZUU4bUkwNlI0cStJQ2VrOTVpbVoxT2xZZVFxZVJXYXFWeGo0cmZM?=
 =?utf-8?B?WW9xbHIrU0loMWZ4VFlEOWpicldoOHpwUmQyNzNyZXlEaXV6VUlMbFZST2k1?=
 =?utf-8?B?WDRKUlV3WTFUdjFic0tyTFhuNUpIMkdURk9yeEVXRHExbDJYaGF6UHhaN0hS?=
 =?utf-8?B?dStBbTJCWWdMR1FPZW5xZXVVMVdRMlRxTW0zUHprTy9rSVBMNDhIaGVmaGly?=
 =?utf-8?B?aGlBcXZYd2dRSS9vV1dYdTFVY29lNHNLckRIb3VNN1hPdDZPc3ZQejN1Mm5I?=
 =?utf-8?B?YTA4Ums4bFdWNlltdEJqa3NZSjNLVFF2N1JXdTNOOHhXRGNja0NCYUJoV3c5?=
 =?utf-8?B?Y0tBQ2pOR0FpNXdGSXQvNlIwQW5aVWVHTmlqdEhMQ3pPdDlweFFDV3ZoU1M5?=
 =?utf-8?B?OWJWSFlQcmtjYjhLa3VnT3VreFpURlhsckZRVGUrZm9tR1hkekg3MCtNaXR0?=
 =?utf-8?B?d0ZETXB0TmhDN3RJVDdUbUxNN0RTemI3T1hWd2dVYkZhTDkzdFl4WEhnSGE3?=
 =?utf-8?B?VEpGVW5wMUJZa0kxczFzTllVVDBqamhwbDMvRXMwNysvYmY2cTFjYys3QStS?=
 =?utf-8?B?cWpPaWhWNTZud0FMaWFYdHJCSFhtNFdNNkxwZERXYnVwNkIzV0lMSDAzWnA3?=
 =?utf-8?Q?ZpmqN5WCblDQkww/PKqsTuGeT?=
Content-ID: <1697D62994B37B4589B18AA6F6E16537@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 343a0d0b-d19d-44b1-7e4b-08ddb2e2e988
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2025 05:49:40.6437 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4TPckcNo+Uywbgt6brw/KBXJLo0CUgkEliS6HvNuTRVt5EX6Ypyc+HOKLaKGFho9Fte4Iy5P8Ay5XzPPGhTxOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8014
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_001_1490877385.2065970603"
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

--__=_Part_Boundary_001_1490877385.2065970603
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDI1LTA1LTE1IGF0IDE3OjM0ICswODAwLCBwYXVsLXBsLmNoZW4gd3JvdGU6DQo+
IEZyb206IFBhdWwtcGwgQ2hlbiA8cGF1bC1wbC5jaGVuQG1lZGlhdGVrLmNvbT4NCj4gDQo+IFRv
IHN1cHBvcnQgbXVsdGlwbGUgbW1zeXMgaW5zdGFuY2VzIGluIHRoZSBvbmUgbWVkaWF0ZWstZHJt
IGluc3RhbmNlLA0KPiBwcm92aWRpbmcgaW1wcm92ZWQgZmxleGliaWxpdHkgYW5kIHNjYWxhYmls
aXR5IGJ5IHRoZSBmb2xsb3dpbmcgY2hhbmdlczoNCj4gDQo+IDEuIEFkZCBERFBfQ09NUE9ORU5U
X0RSTV9PVkxTWVNfQURBUFRPUiogdG8gcHJvYmUgdGhlDQo+ICAgb3Zsc3lzX2FkYXB0b3IgZHJp
dmVycyBhbmQgc3VwcG9ydCBkaWZmZXJlbnQgbW1zeXMgY29tcG9zaXRpb24uDQo+IDIuIEFkZGVk
IG5ldyBjb21wb25lbnQgdHlwZXMgTVRLX0RJU1BfVklSVFVBTCB0byBzdXBwb3J0IHRoZQ0KPiAg
IHJvdXRpbmcgdG8gdmlydHVhbCBkaXNwbGF5IGNvbXBvbmVudHMuDQo+IDMuIEFkZGVkIGFuZCBh
ZGp1c3RlZCB0aGUgZXhpc3RlZCBzdHJ1Y3R1cmUgb3IgaW50ZXJmYWNlIHRvIGV4dGVuZA0KPiAg
IHRoZSBzdXBwb3J0IG9mIG11bHRpcGxlIG1tc3lzIGluc3RhbmNlcy4NCj4gNC4gTW9kaWZpZWQg
dGhlIGNvbXBvbmVudCBtYXRjaGluZyBhbmQgYmluZGluZyBsb2dpYyB0byBzdXBwb3J0DQo+ICAg
bXVsdGlwbGUgbW1zeXMgaW5zdGFuY2VzLg0KDQpMZXRvdmxzeXMgc3ViIGRyaXZlciBjb250cm9s
IE9WTFNZUzAgYW5kIE9WTFNZUzEsIHNvIG1lZGlhdGVrIGRybSBkcml2ZXIgd291bGQgbm90IHNl
ZSB0aGVtIGFuZCB0aGlzIHBhdGNoIGlzIG5vdCBuZWNlc3NhcnkuDQoNClJlZ2FyZHMsDQpDSw0K
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBOYW5jeSBMaW4gPG5hbmN5LmxpbkBtZWRpYXRlay5jb20+
DQo+IFNpZ25lZC1vZmYtYnk6IFBhdWwtcGwgQ2hlbiA8cGF1bC1wbC5jaGVuQG1lZGlhdGVrLmNv
bT4NCj4gLS0tDQoNCg==

--__=_Part_Boundary_001_1490877385.2065970603
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1RodSwmIzMyOzIwMjUtMDUtMTUmIzMyO2F0
JiMzMjsxNzozNCYjMzI7KzA4MDAsJiMzMjtwYXVsLXBsLmNoZW4mIzMyO3dyb3RlOg0KJmd0OyYj
MzI7RnJvbTomIzMyO1BhdWwtcGwmIzMyO0NoZW4mIzMyOyZsdDtwYXVsLXBsLmNoZW5AbWVkaWF0
ZWsuY29tJmd0Ow0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtUbyYjMzI7c3VwcG9ydCYjMzI7bXVsdGlw
bGUmIzMyO21tc3lzJiMzMjtpbnN0YW5jZXMmIzMyO2luJiMzMjt0aGUmIzMyO29uZSYjMzI7bWVk
aWF0ZWstZHJtJiMzMjtpbnN0YW5jZSwNCiZndDsmIzMyO3Byb3ZpZGluZyYjMzI7aW1wcm92ZWQm
IzMyO2ZsZXhpYmlsaXR5JiMzMjthbmQmIzMyO3NjYWxhYmlsaXR5JiMzMjtieSYjMzI7dGhlJiMz
Mjtmb2xsb3dpbmcmIzMyO2NoYW5nZXM6DQomZ3Q7JiMzMjsNCiZndDsmIzMyOzEuJiMzMjtBZGQm
IzMyO0REUF9DT01QT05FTlRfRFJNX09WTFNZU19BREFQVE9SKiYjMzI7dG8mIzMyO3Byb2JlJiMz
Mjt0aGUNCiZndDsmIzMyOyYjMzI7JiMzMjtvdmxzeXNfYWRhcHRvciYjMzI7ZHJpdmVycyYjMzI7
YW5kJiMzMjtzdXBwb3J0JiMzMjtkaWZmZXJlbnQmIzMyO21tc3lzJiMzMjtjb21wb3NpdGlvbi4N
CiZndDsmIzMyOzIuJiMzMjtBZGRlZCYjMzI7bmV3JiMzMjtjb21wb25lbnQmIzMyO3R5cGVzJiMz
MjtNVEtfRElTUF9WSVJUVUFMJiMzMjt0byYjMzI7c3VwcG9ydCYjMzI7dGhlDQomZ3Q7JiMzMjsm
IzMyOyYjMzI7cm91dGluZyYjMzI7dG8mIzMyO3ZpcnR1YWwmIzMyO2Rpc3BsYXkmIzMyO2NvbXBv
bmVudHMuDQomZ3Q7JiMzMjszLiYjMzI7QWRkZWQmIzMyO2FuZCYjMzI7YWRqdXN0ZWQmIzMyO3Ro
ZSYjMzI7ZXhpc3RlZCYjMzI7c3RydWN0dXJlJiMzMjtvciYjMzI7aW50ZXJmYWNlJiMzMjt0byYj
MzI7ZXh0ZW5kDQomZ3Q7JiMzMjsmIzMyOyYjMzI7dGhlJiMzMjtzdXBwb3J0JiMzMjtvZiYjMzI7
bXVsdGlwbGUmIzMyO21tc3lzJiMzMjtpbnN0YW5jZXMuDQomZ3Q7JiMzMjs0LiYjMzI7TW9kaWZp
ZWQmIzMyO3RoZSYjMzI7Y29tcG9uZW50JiMzMjttYXRjaGluZyYjMzI7YW5kJiMzMjtiaW5kaW5n
JiMzMjtsb2dpYyYjMzI7dG8mIzMyO3N1cHBvcnQNCiZndDsmIzMyOyYjMzI7JiMzMjttdWx0aXBs
ZSYjMzI7bW1zeXMmIzMyO2luc3RhbmNlcy4NCg0KTGV0b3Zsc3lzJiMzMjtzdWImIzMyO2RyaXZl
ciYjMzI7Y29udHJvbCYjMzI7T1ZMU1lTMCYjMzI7YW5kJiMzMjtPVkxTWVMxLCYjMzI7c28mIzMy
O21lZGlhdGVrJiMzMjtkcm0mIzMyO2RyaXZlciYjMzI7d291bGQmIzMyO25vdCYjMzI7c2VlJiMz
Mjt0aGVtJiMzMjthbmQmIzMyO3RoaXMmIzMyO3BhdGNoJiMzMjtpcyYjMzI7bm90JiMzMjtuZWNl
c3NhcnkuDQoNClJlZ2FyZHMsDQpDSw0KDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1NpZ25lZC1vZmYt
Ynk6JiMzMjtOYW5jeSYjMzI7TGluJiMzMjsmbHQ7bmFuY3kubGluQG1lZGlhdGVrLmNvbSZndDsN
CiZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtQYXVsLXBsJiMzMjtDaGVuJiMzMjsmbHQ7cGF1
bC1wbC5jaGVuQG1lZGlhdGVrLmNvbSZndDsNCiZndDsmIzMyOy0tLQ0KDQoNCjwvcHJlPg0KPC9w
PjwvYm9keT48L2h0bWw+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioqKioq
IE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UNCiAqKioqKioqKioqKioqKioqKioqKg0K
VGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRp
bmcgYW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBw
cml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBw
bGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhl
IGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3Ry
aWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChp
bmNsdWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlz
IHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5v
dCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWwsIG9yIGJlbGlldmUNCiANCnRo
YXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkg
dGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRl
bGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBh
dHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNv
bnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9w
cmU+PCEtLX0tLT4=

--__=_Part_Boundary_001_1490877385.2065970603--

