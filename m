Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 074ADAFC00E
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 03:34:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F38BB10E0C7;
	Tue,  8 Jul 2025 01:34:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="A1UinSYB";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="I3/MqGdf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8384910E0C7
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jul 2025 01:34:41 +0000 (UTC)
X-UUID: b565a72c5b9b11f0b33aeb1e7f16c2b6-20250708
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=xndTkjfGbvAaHIW9V3fVfT7DzR4iThXSE47BfNeqInM=; 
 b=A1UinSYBr9AIsp+S+mISt4fOMLOJBDNJQhMVGH+9JBVMaR1iJXQGMyvWFOr2usjiZciiadwcyrIzutmi7VZQEqDX9yhUltMdI4R3yCALECQsWDSoZ2U58Q5woafu5SvaK+81dNyYDbvdD6hW/d0JxhYcZayOz/fLLv8fLWcslbo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2, REQID:a1a671e8-6d52-4474-94b8-31ad3b68d61d, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:9eb4ff7, CLOUDID:71a8fa73-15a7-4ae6-ad4b-94c27b45c266,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
 nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
 OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b565a72c5b9b11f0b33aeb1e7f16c2b6-20250708
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1299074664; Tue, 08 Jul 2025 09:34:36 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 8 Jul 2025 09:34:36 +0800
Received: from TYDPR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 8 Jul 2025 09:34:34 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sgQtkf1SlTRjeKdZkGrdTGCL9DjNobs+zVemJLQrA0zHEcZnuVR4P+CJ35nTo6IJHzLGqZj2sqLcF371Qm5J1K6B4YrAc4XwMXku+zVAZiM4c8y5Hm7rbpflllRP3PFY7nj600aGs+tnWaTL4ZjMgLE9OigPBLo+VHOLoow8W+ewcAJtljYUi9gaHXe2vSEp0V1TenH2t44hgoSJGjpbYrVOHOAeVVysHtpdFHC9lySSz/uZxUdCpdZuYnJ6qJHwhu2GWDeTrjHc7znSZHa3bR7rJ0QeTpLuBvMXFV6e+IZln0rIbB1X84U5lJUl5l2aTXn+f5c2LSIDGSEOZ2x/Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WpyjWxfJT5RHMeYrDwvJ9EphR6M1Q5TjmF0oGx5KCxE=;
 b=XAni8fAccvFCo/Yw+4URmku7dsusqkQJSOaZO4ZVdcQBi5afQMxFOhB/JXKyF8w86zxqAewJFAf67kwbs8pq3b81hTPk4ilfwgPGRCV0J84YgrVfnyeVW0upO3s80/fe0Dz9bRcR4meOsp+ndJgorU0xiXqcnIcmXgW0we4x1iwjBbUZBq981NwyN07EnGuV2BIbaBnGGJbs1e6EYaJ/XiIDJ7Mb6+jzoK6zHv2hQimSMbjj+anV2IFcG+0Pt54Zooy3LjZVoQlN+QV/HQ5Fm9E9ZjSih3H+Uh/kSI6vAw/WDXuBgKFwhn3TD/pYRkbi3G0oFuRWNDyU+Z7mRogUxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WpyjWxfJT5RHMeYrDwvJ9EphR6M1Q5TjmF0oGx5KCxE=;
 b=I3/MqGdf3CQ9ZyRudjdBmLFnuRNkLerIENIoD9Mvd9DERX8UXgpHr9wJJcKlbOU+CoUpgbPKhZ6mbenWSU8lxMjSAiImWeTxOZ6RoFpFBfT7UtykksYTi55LO11hkFEUcgpsiXLzM0ldf9XWuew4ELgxYitSX3UQ2bEJ+OSip38=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYSPR03MB7330.apcprd03.prod.outlook.com (2603:1096:400:42e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Tue, 8 Jul
 2025 01:34:32 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8901.024; Tue, 8 Jul 2025
 01:34:32 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "mchehab@kernel.org"
 <mchehab@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, =?utf-8?B?U2hhbmd5YW8gTGluICjmnpfkuIrloK8p?=
 <Shangyao.Lin@mediatek.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v2 12/13] uapi: linux: add mediatek isp_7x camsys user api
Thread-Topic: [PATCH v2 12/13] uapi: linux: add mediatek isp_7x camsys user api
Thread-Index: AQHb7uGxRAaP9d8IEEWMp1g+6UfxaLQncyOA
Date: Tue, 8 Jul 2025 01:34:31 +0000
Message-ID: <34fb8d81c07ff3f2bb2f679fef41b5c0f5afdeb1.camel@mediatek.com>
References: <20250707013154.4055874-1-shangyao.lin@mediatek.com>
 <20250707013154.4055874-13-shangyao.lin@mediatek.com>
In-Reply-To: <20250707013154.4055874-13-shangyao.lin@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYSPR03MB7330:EE_
x-ms-office365-filtering-correlation-id: 7604358b-b8a1-4b3b-92e3-08ddbdbf96c2
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|42112799006|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?RHlDM2UrTExkeXZDN3JMSU9DTm1YVHhOUk52d2xkZVdCUmcyeS82YTBHbU1n?=
 =?utf-8?B?TG8xV0IxejJVeVJEdnJqWG1nU1FneTlTaHBnUHVJS1JmUXF3c1RweXVpNXJJ?=
 =?utf-8?B?YWJwQzM4bElBR2N6MHM3ZlhoU1VGUk1lYlpXSmt2UHl4ZmJLWU5HVERkY2pl?=
 =?utf-8?B?K1hNQzc4U0JBYy9rckxyWWxPcWNobTA4b3Y2b0FVeTh6RElKY3pHMHJyZHJO?=
 =?utf-8?B?VTRpdDRzdzV0d3gySGhKUmorM21Cb3F1OFdqQ3lleURacWJqbU1ad3FKMjhp?=
 =?utf-8?B?bDJkckJjUTBIMXVCZXdHcjVUZmhrVmc5SXFYdE1ocEFiaDVyMGY2N3RlME5N?=
 =?utf-8?B?ZmF3RUxBakVBZThYaU9zejROMlcrbDFjUlBabkh2Mk52OWtVVElFcndHU3Uz?=
 =?utf-8?B?SVdtTE1GMmlQdHN5OU9ta1VoRHF5OERLVGQrZ0pBR0ticiswS1J2UDJ6QWJR?=
 =?utf-8?B?UFdWd1hUMzFOTnpGTEFpWTdCMnNDUzJEeGU5RGZIWGtLSkpLdzI1S1YydDBK?=
 =?utf-8?B?R1VNY3ZpQWdPZzJlL0IyV1JOcW1HcU85VnppU0NtdnliamR1MnFaaGIxcCtJ?=
 =?utf-8?B?cHp4SUhzdGU1S25KTE5JL2lCQ001WGpnRGhNRTl6NWpTajdpZkRkZFhENWM2?=
 =?utf-8?B?SGVGc1BqUDUwUFJoTXk2QVJjTVRVTzd3bHVsQ0ZEM2xHZW43d0d4clVQRGlu?=
 =?utf-8?B?QWFFemMxYTdQNXBEalhYSGNyaGdKd0ZMQjFXRi9HQ0FBb0t0ZTdrbGh5dTE5?=
 =?utf-8?B?SWNGL1ArZ1NPcHd2WllSQTBoRzRSbmhkMHlMczE5YkhuZjcyTFF0ajlESGZk?=
 =?utf-8?B?S3JnWDVveUg5RXJSY0xRUysraWlyRzVvUXovN0hVbm1ZSHZsUlZUOUlxdG5Q?=
 =?utf-8?B?WHZzWkx4YTh1MlhTUEdBSGhtZERBVGZsRFY1UGtsRm1jS0UwLzhCMlpUZCty?=
 =?utf-8?B?ZFc1YXJtazFyc1JOMk96QU9IV1NMWHNMdkNhMG9BRFRMRlVhaVBSZ24wdDl6?=
 =?utf-8?B?TlJTdGtnVjdiWklrR3dVNUpKMys4WUxpWGw1NkIvU2JLMEdwQm93VUhEQ3Js?=
 =?utf-8?B?WjkzMUtoM1RIOTlnSDFHc1NIUU9xMWtuT2pEamU2SFFmMTFiL2FkQjJqdVFX?=
 =?utf-8?B?MVVQT0h6aEpHL0NYMHhybkczelRzT2FVWTdJSW1Ic3JhSndqNDRaKzFMYjg2?=
 =?utf-8?B?OHRJbHFxdmlRMk82cTREa2QzNmlhSVpMNjl2OURiZ3dtV2YwZlkxaDd6WW5x?=
 =?utf-8?B?bDZuRzJtMmtQTUNxTzdkdEZQazZTbEVGS1ErTUsyZ3U4ZEt6dHVJZ0pDVGov?=
 =?utf-8?B?S2crTU1XUmRMRXFjejNKVFVjamtCcnlYdFRKUmQ4MGhpcDVvZHl3VTJTQXpl?=
 =?utf-8?B?TFVSemJrTDhFdWF4KzhmWTNaOU5FTkVleDd5NSs0NXVIQm1YSkZoazNDbEt5?=
 =?utf-8?B?UDFkKzcxRzZmdk5pVmtRQlB3elM3N0h4d1lJUWE5anVJdTZFU1dYMTFvRFIx?=
 =?utf-8?B?Vk9sV3AxbnlYOXBTUXNaS1FZUU9wWmt1SWxia2JSSVJGRXczemVZQXVHUGRi?=
 =?utf-8?B?RWNFQ21wZ2JxcHM0amg4bitWUjZNSGVRN1lHRkZuNndPL05yUjRpb2xFcGZq?=
 =?utf-8?B?NmI4dDlkV3ZEcDFqRWU1RWFCanJ2bGNzSkNveGVKOUk5bjV5VmdJZWZYN2E1?=
 =?utf-8?B?RVQyTldLUk9NcCsvS2tQZ1N5QjFTb1dEYlczbklBdGxxWStZb1RxYWdmRzNL?=
 =?utf-8?B?SUVuekkwRHVvaEhBL2IwK1RZeGUyL2g0Mzk0MThBelQxemtRblZIY3l1R09v?=
 =?utf-8?B?ZUFxVnVmN3NiRHJwWlFOZ0NMUmZpRWNaT3NiV0ZmVXZXSkd3Y2tyVFBMV21u?=
 =?utf-8?B?SUNYbTJ2ZTNlVFJFWWlicXZNUkJmT3dMMi9RTkVPSk1yMkFoT2VZeEVaMTFl?=
 =?utf-8?B?UG8xMlc3M1IyNjNDa2xjWWZWZVVaelZ0QW1FT0NrejFRTlp6TTZRUW9jeHZ1?=
 =?utf-8?B?MEx1VWswQ3lBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(42112799006)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bnhVSm16MHozWUpFVU53Y2NPVm5leEoyK0w5aWYxYWpWbExrZHpoRXZYUFRV?=
 =?utf-8?B?allueUlQcm82dWJkMUdGTFZITEw1S2FmU0dONTdSZ3FqdUt2bVF1aTZmaVBY?=
 =?utf-8?B?UnBqR2lnblBJRmRveGZWVEhJZU5FY2U0TUZKZDlZRWcvUkJ0SnkxOVZRQWRB?=
 =?utf-8?B?T3R5NENUcGVmcTJmckhGYTZ2ZGF1aVlENkFsN0t5VFlvVWJuUXNUay8vZnJX?=
 =?utf-8?B?M3pGYy9IRXRYYlhDNXMyd3YrWFkydHhuaWFwQ0NkcmIyUGdVMER0WU51c3J0?=
 =?utf-8?B?NzE3bXNJUDUzZ2M1SkVWc2pLSzRudHErR3lZdUEyMHpaaEcrUUhGQWo4azlV?=
 =?utf-8?B?am0xWndIQ1FNMDhmZ2lCbm51c0dRTlI0bTFjVzRtckVxVitZK0Fsckt5RDJO?=
 =?utf-8?B?K2EzZ25JSzRYSW9OUnNDYjVMUlMvOWtRM1JnbFluaVdiVmFlU01OSGd0cThV?=
 =?utf-8?B?ZDVGOFAzMFNHdXV1TTBsU0tIVFhNZjU3R21IOVF4ejhkRmxPK1B5QnlDMDZ4?=
 =?utf-8?B?M2RQU3ZBTnpqNG9aWklMbU5ZRlBuZkNpYzhtOG1GQ3U0L2NERmtTa3FVTG1i?=
 =?utf-8?B?ZDZ6QS8rTlBXWitqUSt5WnJjdGhEQ3JFbFJ1UzdwaVVhc0Y4aDV4b2cwbE0w?=
 =?utf-8?B?SVI0MHdyRXJmeU9objNYbXdTTXVHRnlMY2FVd2syUEVCUFRlZHlzTnF6YjZj?=
 =?utf-8?B?WWQrdTlBczRKWVVDUWM4UzdoSXQxc0hRd25VdTJFVG1EU0QzT1JJUmVUNWxJ?=
 =?utf-8?B?TlZGc0RHTysyR2U4VysxblV0Tk9iU1VnSGFzcmlsc3RRTVRSdWZCRHJDejBF?=
 =?utf-8?B?V1A4MFpMKzNDMXhIdTFtQ2M3eEQ2KzI2ZVNPbUhqT3JoUjZoUldIQ0JUd01v?=
 =?utf-8?B?MHI2NjBUbW4yVkQ3cnVUaVU3bEtFOEx6SkpQRlErdGpuS1RMYitnaDZRTzFr?=
 =?utf-8?B?eWdKNWRTTi9FYjBRN3JKNm5lQ0Qxc1BKbFZlZzN1bHZpbjRqaWVxRGtxUGZQ?=
 =?utf-8?B?V29GNEFzYm0xaHRvZXhIa3lpMU90b0VVaTVITXJ0QVNXaWVmWkhaYitnbFBZ?=
 =?utf-8?B?UmhzVmhOUG85dTRhSEczWmZmRTgwb0w2SlRKM3hKa2dWaUZUbGZXRzJ3ZUhZ?=
 =?utf-8?B?Ukh1U3pWM2NuZ3BJc3QyUnFJYW45emE0VGhMbGJXMkJIWSsyNkpxZHU2cUlz?=
 =?utf-8?B?WWYyRWwxeHVaZTJ4MDg1WVZMOEtXaGdLNHRsYWxKdXFjMjY2VS9wdE9zR0Vw?=
 =?utf-8?B?dGxiT1Y0ckF5aDRrbTR0M1JJbUdhM1RuaEI4Y01uQ0FqZVgrRHFaTTdqcTdF?=
 =?utf-8?B?ZVduUHg5S0tQYzV5VlUxZHV1TzRISEhCeVFKSTNpaG8waG5yYThBSUxnZzh0?=
 =?utf-8?B?TzhmRG8xUXlqYmxNWWQ3QnQzVEJkUStqRHhPVDQySU8vZTVJd3R0OFlPVXJT?=
 =?utf-8?B?dStYK0VEUHRqdGM4cnVOVXZZbjdwVGxkcndRRFVJTHdQWHVxVE5CSldwUSta?=
 =?utf-8?B?a2tCZ3Zxb1Rlb0JKanRNYkVSY2lyREVFc1hNbHpxeUxTVnhaV1ZlT3FaRjNC?=
 =?utf-8?B?L3ExSnlZM2kycTRQSDdPQ2pJcHFLMHc3LzlxRWFMaE56dVF0bWxDKzk1UkNE?=
 =?utf-8?B?b0ZKdndlelVYaU1pQVI0R2pPM1dTaXF2eTB5SVJrcDFWTkxzeVZ0V3FBTXhY?=
 =?utf-8?B?Q3AvdzBLTjh5dTk0ajVUSWVmNUdmRjhDRVQwYVR4ZW1pK1p4ajF4UXlZRzVj?=
 =?utf-8?B?Z0l2MFZLUTJBNVFEdkZ5N3JtVWtmVXdBS0Y2NFFNU3ZTNlZWTjdtcWpyUnZW?=
 =?utf-8?B?SEk5MHU3Ym4yUXJLMG94VGZjU2pmc3FWTS9VMy9sUVozaFB4aFBQSTlURk9C?=
 =?utf-8?B?TDdKMGhwczlDRlZkRDQrSHJPbmNHM1R1V2h2QUJlZVJxUXVabHByTDd2QUFa?=
 =?utf-8?B?UG9tUWhvL05SYzFJMytZUytQYXlmVkpRQW1IYUFIQy9ZWUpDcFFiWU01TCtE?=
 =?utf-8?B?NnYrdzRiZnYvbmNFeXNwYTdObEJMN2JqclpqUzJpOXFRR0FVQU94Q2V0YW1G?=
 =?utf-8?B?dGN6NEJqaXkyZFkxb3A1NnZ2R0ZhQUl4bkNxTnhYM2pjOEx5ZHdseFNjWUR1?=
 =?utf-8?Q?WiOGLnD/UvZLafPtGdKTkKRGc?=
Content-ID: <B7E54CCED23D9545814CE68E33EABB41@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7604358b-b8a1-4b3b-92e3-08ddbdbf96c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2025 01:34:32.2058 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GlaWNTRqWu70JU2pI0mH7wP/QSGvTUZe3Qz4CbceNeiK5RSkm0GV8dAM2skm+sCaegW8JLvgK3OY14akQfDaKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7330
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_001_914548455.1485502714"
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

--__=_Part_Boundary_001_914548455.1485502714
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCAyMDI1LTA3LTA3IGF0IDA5OjMxICswODAwLCBzaGFuZ3lhbyBsaW4gd3JvdGU6DQo+
IEZyb206ICJzaGFuZ3lhby5saW4iIDxzaGFuZ3lhby5saW5AbWVkaWF0ZWsuY29tPg0KPiANCj4g
QWRkIFVBUEkgZm9yIHRoZSBNZWRpYVRlayBJU1AgcGxhdGZvcm0sIHByb3ZpZGluZyB1c2VyLXNw
YWNlIGludGVyZmFjZXMgZm9yIHRoZQ0KPiBuZXcgQ0FNU1lTIGRyaXZlci4NCj4gDQo+IENoYW5n
ZXMgaW4gdjI6DQo+IC0gTW92ZWQgVjRMMiBwaXhlbCBmb3JtYXQgZGVmaW5pdGlvbnMgdG8gaW5j
bHVkZS91YXBpL2xpbnV4L3ZpZGVvZGV2Mi5oDQo+IA0KPiBOb3RlczoNCj4gDQo+IEhpIExhdXJl
bnQgUGluY2hhcnQgYW5kIENLLA0KPiANCj4gVGhhbmsgeW91IHZlcnkgbXVjaCBmb3IgeW91ciBk
ZXRhaWxlZCBmZWVkYmFjayBhbmQgc3VnZ2VzdGlvbnMuDQo+IA0KPiBJIHdvdWxkIGxpa2UgdG8g
bGV0IHlvdSBrbm93IHRoYXQgaW4gdGhlIG5leHQgcGF0Y2gsIEkgaGF2ZSBhZGRlZCBhbiBpbml0
aWFsDQo+IHZlcnNpb24gb2YgYW4gLnJzdCBkb2N1bWVudCBkZXNjcmliaW5nIHRoZSBNVEsgSVNQ
IENBTVNZUyBjb250cm9scy4gTW9zdCBvZg0KPiB0aGVzZSBJU1AgQ0FNU1lTIGNvbnRyb2xzIGFy
ZSBpbnRlbmRlZCBmb3Igb3RoZXIgYWR2YW5jZWQgZmVhdHVyZXMuIEZvciBub3JtYWwNCj4gbWFp
bi1zdHJlYW0gdXNlIGNhc2VzLCBvbmx5IGNvbnRyb2xzIHN1Y2ggYXMgVjRMMl9DSURfTVRLX0NB
TV9SQVdfUkVTT1VSQ0VfQ0FMQw0KPiBhcmUgYWN0dWFsbHkgdXNlZC4NCj4gDQo+IFdvdWxkIHlv
dSBwcmVmZXIgdGhhdCB3ZSByZW1vdmUgdGhlIHVzZXIgc3BhY2UgaW50ZXJmYWNlcyBmb3IgdGhl
c2UgYWR2YW5jZWQNCj4gZmVhdHVyZXMgZm9yIG5vdywgYW5kIG9ubHkgYWRkIHRoZW0gYmFjayBp
biBhIGZ1dHVyZSBwYXRjaCBzZXJpZXMgZGVkaWNhdGVkIHRvDQo+IGFkdmFuY2VkIGZ1bmN0aW9u
YWxpdHk/IEkgYW0gaGFwcHkgdG8gZm9sbG93IHlvdXIgcmVjb21tZW5kYXRpb24gb24gdGhpcy4N
Cg0KSSBzdWdnZXN0IHRoYXQgeW91IHNlbmQgdGhlIGJhc2ljIGZ1bmN0aW9uIGZpcnN0Lg0KRm9y
IHlvdSBhbmQgdGhlIHJldmlld2VyLCB0aGUgcHJvY2VzcyB3b3VsZCBiZSBtdWNoIGVhc2llci4N
ClJldmlld2VyIHJldmlldyBmZXdlciBjb2RlcywgYW5kIHlvdSBnZXQgZmV3ZXIgY29tbWVudC4N
CkFkdmFuY2VkIGZ1bmN0aW9uIGNvdWxkIGJlIHNlbnQgbGF0ZXIgYXQgYW55IHRpbWUgeW91IHdh
bnQuDQoNClJlZ2FyZHMsDQpDSw0KDQo+IA0KPiBBZGRpdGlvbmFsbHksIEkgaGF2ZSBhbHNvIHdy
aXR0ZW4gYW4gaW5pdGlhbCB2ZXJzaW9uIG9mIGEgYnJpZWYgLnJzdCBkb2N1bWVudA0KPiBwcm92
aWRpbmcgYSBoaWdoLWxldmVsIGRlc2NyaXB0aW9uIG9mIHRoZSBoYXJkd2FyZS4gSWYgeW91IHRo
aW5rIHRoZXJlIGlzDQo+IGFueXRoaW5nIGVsc2UgdGhhdCBzaG91bGQgYmUgYWRkZWQgb3IgY2xh
cmlmaWVkLCBwbGVhc2Uga2luZGx5IGxldCBtZSBrbm93Lg0KPiANCj4gVGhhbmsgeW91IGFnYWlu
IGZvciB5b3VyIHZhbHVhYmxlIGZlZWRiYWNrIQ0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBTaGFu
Z3lhbw0KPiANCj4gU2lnbmVkLW9mZi1ieTogc2hhbmd5YW8ubGluIDxzaGFuZ3lhby5saW5AbWVk
aWF0ZWsuY29tPg0KPiAtLS0NCg0K

--__=_Part_Boundary_001_914548455.1485502714
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO01vbiwmIzMyOzIwMjUtMDctMDcmIzMyO2F0
JiMzMjswOTozMSYjMzI7KzA4MDAsJiMzMjtzaGFuZ3lhbyYjMzI7bGluJiMzMjt3cm90ZToNCiZn
dDsmIzMyO0Zyb206JiMzMjsmcXVvdDtzaGFuZ3lhby5saW4mcXVvdDsmIzMyOyZsdDtzaGFuZ3lh
by5saW5AbWVkaWF0ZWsuY29tJmd0Ow0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtBZGQmIzMyO1VBUEkm
IzMyO2ZvciYjMzI7dGhlJiMzMjtNZWRpYVRlayYjMzI7SVNQJiMzMjtwbGF0Zm9ybSwmIzMyO3By
b3ZpZGluZyYjMzI7dXNlci1zcGFjZSYjMzI7aW50ZXJmYWNlcyYjMzI7Zm9yJiMzMjt0aGUNCiZn
dDsmIzMyO25ldyYjMzI7Q0FNU1lTJiMzMjtkcml2ZXIuDQomZ3Q7JiMzMjsNCiZndDsmIzMyO0No
YW5nZXMmIzMyO2luJiMzMjt2MjoNCiZndDsmIzMyOy0mIzMyO01vdmVkJiMzMjtWNEwyJiMzMjtw
aXhlbCYjMzI7Zm9ybWF0JiMzMjtkZWZpbml0aW9ucyYjMzI7dG8mIzMyO2luY2x1ZGUvdWFwaS9s
aW51eC92aWRlb2RldjIuaA0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtOb3RlczoNCiZndDsmIzMyOw0K
Jmd0OyYjMzI7SGkmIzMyO0xhdXJlbnQmIzMyO1BpbmNoYXJ0JiMzMjthbmQmIzMyO0NLLA0KJmd0
OyYjMzI7DQomZ3Q7JiMzMjtUaGFuayYjMzI7eW91JiMzMjt2ZXJ5JiMzMjttdWNoJiMzMjtmb3Im
IzMyO3lvdXImIzMyO2RldGFpbGVkJiMzMjtmZWVkYmFjayYjMzI7YW5kJiMzMjtzdWdnZXN0aW9u
cy4NCiZndDsmIzMyOw0KJmd0OyYjMzI7SSYjMzI7d291bGQmIzMyO2xpa2UmIzMyO3RvJiMzMjts
ZXQmIzMyO3lvdSYjMzI7a25vdyYjMzI7dGhhdCYjMzI7aW4mIzMyO3RoZSYjMzI7bmV4dCYjMzI7
cGF0Y2gsJiMzMjtJJiMzMjtoYXZlJiMzMjthZGRlZCYjMzI7YW4mIzMyO2luaXRpYWwNCiZndDsm
IzMyO3ZlcnNpb24mIzMyO29mJiMzMjthbiYjMzI7LnJzdCYjMzI7ZG9jdW1lbnQmIzMyO2Rlc2Ny
aWJpbmcmIzMyO3RoZSYjMzI7TVRLJiMzMjtJU1AmIzMyO0NBTVNZUyYjMzI7Y29udHJvbHMuJiMz
MjtNb3N0JiMzMjtvZg0KJmd0OyYjMzI7dGhlc2UmIzMyO0lTUCYjMzI7Q0FNU1lTJiMzMjtjb250
cm9scyYjMzI7YXJlJiMzMjtpbnRlbmRlZCYjMzI7Zm9yJiMzMjtvdGhlciYjMzI7YWR2YW5jZWQm
IzMyO2ZlYXR1cmVzLiYjMzI7Rm9yJiMzMjtub3JtYWwNCiZndDsmIzMyO21haW4tc3RyZWFtJiMz
Mjt1c2UmIzMyO2Nhc2VzLCYjMzI7b25seSYjMzI7Y29udHJvbHMmIzMyO3N1Y2gmIzMyO2FzJiMz
MjtWNEwyX0NJRF9NVEtfQ0FNX1JBV19SRVNPVVJDRV9DQUxDDQomZ3Q7JiMzMjthcmUmIzMyO2Fj
dHVhbGx5JiMzMjt1c2VkLg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtXb3VsZCYjMzI7eW91JiMzMjtw
cmVmZXImIzMyO3RoYXQmIzMyO3dlJiMzMjtyZW1vdmUmIzMyO3RoZSYjMzI7dXNlciYjMzI7c3Bh
Y2UmIzMyO2ludGVyZmFjZXMmIzMyO2ZvciYjMzI7dGhlc2UmIzMyO2FkdmFuY2VkDQomZ3Q7JiMz
MjtmZWF0dXJlcyYjMzI7Zm9yJiMzMjtub3csJiMzMjthbmQmIzMyO29ubHkmIzMyO2FkZCYjMzI7
dGhlbSYjMzI7YmFjayYjMzI7aW4mIzMyO2EmIzMyO2Z1dHVyZSYjMzI7cGF0Y2gmIzMyO3Nlcmll
cyYjMzI7ZGVkaWNhdGVkJiMzMjt0bw0KJmd0OyYjMzI7YWR2YW5jZWQmIzMyO2Z1bmN0aW9uYWxp
dHkmIzYzOyYjMzI7SSYjMzI7YW0mIzMyO2hhcHB5JiMzMjt0byYjMzI7Zm9sbG93JiMzMjt5b3Vy
JiMzMjtyZWNvbW1lbmRhdGlvbiYjMzI7b24mIzMyO3RoaXMuDQoNCkkmIzMyO3N1Z2dlc3QmIzMy
O3RoYXQmIzMyO3lvdSYjMzI7c2VuZCYjMzI7dGhlJiMzMjtiYXNpYyYjMzI7ZnVuY3Rpb24mIzMy
O2ZpcnN0Lg0KRm9yJiMzMjt5b3UmIzMyO2FuZCYjMzI7dGhlJiMzMjtyZXZpZXdlciwmIzMyO3Ro
ZSYjMzI7cHJvY2VzcyYjMzI7d291bGQmIzMyO2JlJiMzMjttdWNoJiMzMjtlYXNpZXIuDQpSZXZp
ZXdlciYjMzI7cmV2aWV3JiMzMjtmZXdlciYjMzI7Y29kZXMsJiMzMjthbmQmIzMyO3lvdSYjMzI7
Z2V0JiMzMjtmZXdlciYjMzI7Y29tbWVudC4NCkFkdmFuY2VkJiMzMjtmdW5jdGlvbiYjMzI7Y291
bGQmIzMyO2JlJiMzMjtzZW50JiMzMjtsYXRlciYjMzI7YXQmIzMyO2FueSYjMzI7dGltZSYjMzI7
eW91JiMzMjt3YW50Lg0KDQpSZWdhcmRzLA0KQ0sNCg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtBZGRp
dGlvbmFsbHksJiMzMjtJJiMzMjtoYXZlJiMzMjthbHNvJiMzMjt3cml0dGVuJiMzMjthbiYjMzI7
aW5pdGlhbCYjMzI7dmVyc2lvbiYjMzI7b2YmIzMyO2EmIzMyO2JyaWVmJiMzMjsucnN0JiMzMjtk
b2N1bWVudA0KJmd0OyYjMzI7cHJvdmlkaW5nJiMzMjthJiMzMjtoaWdoLWxldmVsJiMzMjtkZXNj
cmlwdGlvbiYjMzI7b2YmIzMyO3RoZSYjMzI7aGFyZHdhcmUuJiMzMjtJZiYjMzI7eW91JiMzMjt0
aGluayYjMzI7dGhlcmUmIzMyO2lzDQomZ3Q7JiMzMjthbnl0aGluZyYjMzI7ZWxzZSYjMzI7dGhh
dCYjMzI7c2hvdWxkJiMzMjtiZSYjMzI7YWRkZWQmIzMyO29yJiMzMjtjbGFyaWZpZWQsJiMzMjtw
bGVhc2UmIzMyO2tpbmRseSYjMzI7bGV0JiMzMjttZSYjMzI7a25vdy4NCiZndDsmIzMyOw0KJmd0
OyYjMzI7VGhhbmsmIzMyO3lvdSYjMzI7YWdhaW4mIzMyO2ZvciYjMzI7eW91ciYjMzI7dmFsdWFi
bGUmIzMyO2ZlZWRiYWNrIQ0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtCZXN0JiMzMjtyZWdhcmRzLA0K
Jmd0OyYjMzI7U2hhbmd5YW8NCiZndDsmIzMyOw0KJmd0OyYjMzI7U2lnbmVkLW9mZi1ieTomIzMy
O3NoYW5neWFvLmxpbiYjMzI7Jmx0O3NoYW5neWFvLmxpbkBtZWRpYXRlay5jb20mZ3Q7DQomZ3Q7
JiMzMjstLS0NCg0KDQo8L3ByZT4NCjwvcD48L2JvZHk+PC9odG1sPjwhLS10eXBlOnRleHQtLT48
IS0tey0tPjxwcmU+KioqKioqKioqKioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNl
ICoqKioqKioqKioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMg
ZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNvbmZp
ZGVudGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZy
b20gZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJl
IA0KY29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1c2Us
IGRpc3NlbWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNv
cHlpbmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkgdW5p
bnRlbmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0KYmUg
dW5sYXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUt
bWFpbCwgb3IgYmVsaWV2ZSANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4g
ZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChieSByZXBseWlu
ZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUt
bWFpbCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRv
IG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBl
cnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_001_914548455.1485502714--

