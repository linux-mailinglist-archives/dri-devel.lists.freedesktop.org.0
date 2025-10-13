Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD71BD2600
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 11:51:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB87910E41C;
	Mon, 13 Oct 2025 09:51:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="bbu+bnqp";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="bSH+seJN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF95610E419
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 09:51:00 +0000 (UTC)
X-UUID: 1cad49e2a81a11f0b33aeb1e7f16c2b6-20251013
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=Xgr3sWItadLCtCU9jcSgdRIAYeTtvcrRqnxgVsXPnDg=; 
 b=bbu+bnqpZ7NMq2wqrTgQt+o8C3HkOrBGqiw2qdikBS88AdxR73HanOTny7TZIbZBTwskLHrk1TvFHhAiZSAuiv/CQIQO2g9GAErG8PM4CqvybmxKQRzB8agF7shYp4mxfyXmcenDGv/jtRJzDBzzbQESKFIimUVxtZyrlVOr/7g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6, REQID:4bfffb08-559b-4d83-8bae-6dd628fb2dff, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:a9d874c, CLOUDID:ff96ff50-c509-4cf3-8dc0-fcdaad49a6d3,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
 TC:-5,Content:0|15|51,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:nil,
 BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1cad49e2a81a11f0b33aeb1e7f16c2b6-20251013
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 737253162; Mon, 13 Oct 2025 17:50:55 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 13 Oct 2025 17:50:51 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Mon, 13 Oct 2025 17:50:51 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yLKXwCDwP5Ne6Wjx+k4Ejd9dnbxKef9UEaPyU5ShxWO1lK7CmEdvTODK1x02d4I+sF/2+hm7HLiDeD76vLyxwMQxOv+axzDD5rZ46gc5hwLSKz2EiZntlLHUTDW5PxRMInoWJ9CfeTyj4qiYCvnpTepjUAXLDmBVYtGYbKTql+kRWBb/W6dg48+cE7sjkVl9DZqqsJBAzl0F+E8NRJwKy18TkRHZUtVGDmbff9CKSu23mllFKLOTqlH/yavKyFixQIblwpLyQznEpWAVQVhdd3rZvYEbAbNYVRG6Pi6xyn+YhKRSAnVpoL04uU7USNmK+9zNs2ThMlcLCPPknr94Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GnEvtVM8SqdA/hlv7v8aDS85PxypJTsELFydOVrpuDY=;
 b=hShhP8+mdc6sYDipKz9vJ8Th8FdX530JlMaQIuqnsf7NTyxSMcGYUzDyxWfpOLJzqiUIyVRb1hRRbwNbx2GxHAUi/RGrbLZfhpnO3yMeWCQ0ieFH3HhoHcLM6KfQUS3eqq1apSdXT+i/Wc1BAtH1S67YFVbsyjzLN+ILr1Vu4Wq6rVv5nx/IWi1FDemjENq0xWvT47VDrA1nyk9Qmqg4rToONJvZggRIqIlVS8DwvHT2oGn5jt+Kgvw0SEzrpkJGmR+8zOCPtw+jmWseDGMNwwYRy/wIv+nT/o/IBmDjnDmn1f+P3ubw4ApHF2ZRzcUs8ccmcbFi7rQHOHckEnLqgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GnEvtVM8SqdA/hlv7v8aDS85PxypJTsELFydOVrpuDY=;
 b=bSH+seJNhyBlrxxkrihwLXHbzx3bZyDZ6Vvoz5tsDZpl+pCXvZOdd930vU5QdfUd3kYjGpr7HN+hisOIqh51SZl2NqLFjatV/FtTQ7X2kUlIwM6mduh7gLIQChI/HIVFh4JFseDMZ216OOMaVfHNshcvxyK4ZuSVrBG1oQP6GZc=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by SEZPR03MB7325.apcprd03.prod.outlook.com (2603:1096:101:125::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 09:50:48 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%7]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 09:50:48 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>, "robh@kernel.org"
 <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>, "mchehab@kernel.org"
 <mchehab@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 =?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
 =?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
 =?utf-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
 <Xiandong.Wang@mediatek.com>, "nicolas@ndufresne.ca" <nicolas@ndufresne.ca>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "fshao@chromium.org" <fshao@chromium.org>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "wenst@chromium.org" <wenst@chromium.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>
Subject: Re: [PATCH v7 10/20] soc: mediatek: mtk-cmdq: Add new APIs to replace
 cmdq_pkt_write() and cmdq_pkt_write_mask()
Thread-Topic: [PATCH v7 10/20] soc: mediatek: mtk-cmdq: Add new APIs to
 replace cmdq_pkt_write() and cmdq_pkt_write_mask()
Thread-Index: AQHcF0duXD4dz8Xnf0OAJQGEg7D0CLSEZA8AgDu7FYA=
Date: Mon, 13 Oct 2025 09:50:48 +0000
Message-ID: <fa46fec3f7ca25532c39e6e864ea692e19b7f5bb.camel@mediatek.com>
References: <20250827114006.3310175-1-jason-jh.lin@mediatek.com>
 <20250827114006.3310175-11-jason-jh.lin@mediatek.com>
 <b2335fd9296bc6f3511f8139870f0c34db1be62a.camel@mediatek.com>
In-Reply-To: <b2335fd9296bc6f3511f8139870f0c34db1be62a.camel@mediatek.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|SEZPR03MB7325:EE_
x-ms-office365-filtering-correlation-id: d3020207-5b4f-4cea-e723-08de0a3dfcec
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?Q3VDTFlGaVR6MkZEZ1hnSUlMQjZBSzA0Q0tLRjdvUlhPcEw0enhnSFZBQnd1?=
 =?utf-8?B?SXlZK0hya2NBYjloYUp2UUNvdHNrUGdmRk9zMkpJSTg4SXFZcnU1VHFqR3Y3?=
 =?utf-8?B?ZVh3NXJSZkZ4dWVQbTZHbEsyOWQyZGN5bzR0a1NZRmo3cEJZMHd0b0xXZ2wz?=
 =?utf-8?B?WnVlbDFYMHJXM0Zsa0ZrQVUyejQ3bytxekxmYUFaZGFXYlBlekM5Nm1QSlRt?=
 =?utf-8?B?OHFQQzAzbE1OSjU3SHU1eHVMbFVENnBrNmhVK1E5ZGliWXdZa3ZHSytBUkg1?=
 =?utf-8?B?bTZJQmRReWVmZlNzNU9JODlrdVJ6REJoeFlWUXA3QVcrWHlaM3poZEMxNkp1?=
 =?utf-8?B?Q01ad0E0Q2xVMytwcVBuNHNyNFJFdUJ0QWJkczFuaFF1K1gwU2x6VkZwbzFV?=
 =?utf-8?B?VU1LelhmR0h3a1NYbzJmTGlxc2U1dzJTYnFlZ2FJZU1LNzlTci9yY3dXd1R3?=
 =?utf-8?B?TUlHOCtCT1B2UFUxYUJRRmZsYXFJaGY1V21aNlVLM1BsaFRQTHZSY0djcW9z?=
 =?utf-8?B?WE1MNXhKbVU1ZkY1MTVncTdSUUtTMVZyOU45ckpXQlltaFpJMlo3NnVwTG1W?=
 =?utf-8?B?ZC9KUVpVYVlRVTJPdzBNeDVKYkxNM0s5WmFDSmEwZ3Z3NlpIQnhaL1NNZSsw?=
 =?utf-8?B?YWxrbGRtNk1TKzA1ZlF6WjJyajBpa0dtbVg2dW1WdlBzaUZhZFpzcE1PTWtt?=
 =?utf-8?B?OXh1U044K0RqSEtRd0pFZEJCNDliZVNiSzgwN2tLcE5ETk5qRlBBMlVVLzBM?=
 =?utf-8?B?R2IzaWVuZ1NaSEVzVWVtQm51QnUrSkJZamtKemRjNktBWVdzRUdqQmZxdjRB?=
 =?utf-8?B?eFRXTUttdWlNSkY0VzMvWGhZbFVtMmdZZWIxbi8waXVFVHMxeCtFZWlPR2NR?=
 =?utf-8?B?dXpuTmJibkozOFZPeWxHR3dQUi95cjgvYVp2Qm9mZkdkZzRkd0JhUUE0Q3c1?=
 =?utf-8?B?MkZOc0hydGx4OW03NmZuNTFkTWdhQ2w3VS9LRy9id1BvbGR6em82UlRJZGZj?=
 =?utf-8?B?dmZRK3BJUU43dHdKQjhSbis1RVRuUXl1UVUyYVZ3RGUxR1pXRi9NV3h5TGpt?=
 =?utf-8?B?MUJ6dTZIYlpCVHJ0VCtLWG1YVkpWWCs1STBKSk1sam9mNDllLzd4eko4WlV2?=
 =?utf-8?B?VURGVVRuL3pRYTZLSnZpUUhwa3dZOVA3UGpxQ0lYUC9pQmtWUVg5M2FraXlw?=
 =?utf-8?B?VnZnWUE1OWN1cktEOWZvZnBGMElRU25UbmpPZVg5Qmx1em1Fc3NCQkZiejYz?=
 =?utf-8?B?N2luVTN0K1Aram5EcVh6aFpiWGxoYkZiMEZPNStyc3ZSZGlYOVJLSkNGTlZz?=
 =?utf-8?B?M1BuM1VhV2pIMHhaSm1NaXk2cDJKWklkUDQzdngyQm9Jb1UyK2pwdHU2UG53?=
 =?utf-8?B?TTZob0lUb216ZUtsRjBTUXpHTFp1Mk45aVZsNHRoRlM5SEQ3eTdTL3kyWWkx?=
 =?utf-8?B?WGMwb2dibk5iOHozaHhIZVhzL0dvdUk4djZGbDd0QXhSRjZjeU5sZEIrZ3g5?=
 =?utf-8?B?OE1kVTg4QTdpclpZYmUwWmlkQ0oyMlBYc2FOVEdrUmluSmtLNE1rZ1NtWjFC?=
 =?utf-8?B?MjArdjBmbEs0L083VFJub3lZZUIwZzFmV1JrUEZodzV5dHp5Z1RBSEZhbUF0?=
 =?utf-8?B?eU95WjQzZ0c2UUoxYkYvQlVxWFlVcVpLRU9PSGE0bmJtQXRRdFE1bnE3amtI?=
 =?utf-8?B?akNaMDdkTUZtZWl5TEd1KytLaysxUytiWW5Odm1MSlc3RUNXRnRxV0RPN0dQ?=
 =?utf-8?B?L2JiR0xhT21QRm91OElxL2QrYjJ4QnpIMXdXQng1SVFsQzBESk0ycXpodVBk?=
 =?utf-8?B?Kzl0RG00ejR3YldBb005NVZtWHNjVjNhMWhnWmd2S2NmOFpmbGhqYjRMNzlE?=
 =?utf-8?B?eFFZMnNrT3kzYndJT3oxdlFaTHJnTUVQTzZET1Zjc0VGWWRXbUN6MjFyR0lo?=
 =?utf-8?B?OEhlUUZBTXJSV3NZcjVtY0VadDUwVGNSWUZNemdoK2hQRklkRllDb2syVjhq?=
 =?utf-8?B?M1VYWkN5OUZNa2RSOW5qaUJvWVpodTYwMVljakNrNkFzZFl2U1daUTlVaVhL?=
 =?utf-8?Q?/FrIJ5?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?czhSNXRBVS85VjB1Q2RSNW0zME5ZOEsxeUNBTE81L0REcXZBMllnYWtLTFpT?=
 =?utf-8?B?bWlTVkpjcVJQWDJpdTZkWUlFeExyaVZKWGJNdXprYUZCcU5Xd2N4WjZzV0Vk?=
 =?utf-8?B?dklENXdTSlZ1UlF4SnlNRHkzVHNJeEdXNnZoam91UHRBc0xwanRGSXR5Ukkv?=
 =?utf-8?B?STBHdDBwbC9FZXNSYTFzbzByUS9uR1MwdDNsbjVtTE52ay9oMFhtanlGTXY2?=
 =?utf-8?B?WFRtTDNnUlpQdE14N3JLQ2NMN3l3eEs1a0hNTU0weUo5dFk3OVJkZVRTVHUw?=
 =?utf-8?B?MjFGK1NSMHR6QjdNUDcxeDl2ZGxzWWNKWTBtaWVTZDZZU1g3TlZrNzBjYXdB?=
 =?utf-8?B?UzVMZUZOSUx6dk8xLzV0RGhvMEYxNC9HNmREZllWYVFzazJKeUJha0VIQWFX?=
 =?utf-8?B?NGJvOWVNV1JMeW9KK0VWTDhrTHkvK3BtbGxPakNOT0c2b1FRajJWQUZpcHM5?=
 =?utf-8?B?OEJXS2hCUkp2aTVjUU5WcmczNFFveUxIcm5lNVRnSk9HSUxsNWNWRVh6UllL?=
 =?utf-8?B?SjZNR2IvWTg0VllKd0xVbGZWS2JaQi8xY0lBYUEwUEFMY1QzT2k0TXhad3VY?=
 =?utf-8?B?SGgzaUtneWxHVHhCOGtYQk9Ha3R0dVBMd0cxRzlrZkRvVC9pUTlWR3d1Y1dC?=
 =?utf-8?B?VmI0ZU1USjNuaGwxUEhkMDFSb3QrMU4xTVJwYnVSV2hGRS9XMmxBbDNjck4y?=
 =?utf-8?B?YXJDNXRvYS95N05wVlNVVmd4V1ZaT1Fic3ZVakVtYml0dG9lSlhPWnRHUks1?=
 =?utf-8?B?TE80QmM5UDBOWTBVUFVGMTAyQXZSa1RPQTE3L3pUYkN5MHltVWsyZ2liT0Nm?=
 =?utf-8?B?VktOcEMrVFd1dVo5ZFdPUDBvdWwwZzM0MXQ2NXZPYUdsQTFheDNkY0k4OVMz?=
 =?utf-8?B?bVJjNUJEZ3VOMUx0cWtCd24vR0l3Sjc4YXZ4TXZhUDFsbTJvV3ViejRXNXl3?=
 =?utf-8?B?OTdDendGTDhuMHhkai9qTUpUM3lDUTdXQ0E4eE9xNGRMdWkxNVZLM3BtcXNv?=
 =?utf-8?B?Zjc1QmIxNzBUQTU3cWE5NWlhRUg0dFFSSGx1bHVMa3dacHAvZ25OQXlIL2h6?=
 =?utf-8?B?MlFhbzB4WGliRHFydmYvWDBocjZOQ09VdGFMZXNKQVo5TVdrR1JXMVFWSTBl?=
 =?utf-8?B?RU9Mc2VDb0NzRFVRMDJLUlFXQjJZVkJDOXh5eW9oQTVSdzRpNWFqOW1TbEZj?=
 =?utf-8?B?aEVDTnZMaHV4MXlWYXdQc2U0Q1gxWkVtc0tJSlJXS1RuRm5kT1dlWDlNdE5P?=
 =?utf-8?B?Rm1uVnloaWdnMHhXcUZ4cHdLR200UGgzNGN4a2lBNk0zY0RjM0VsL0Z0TFZB?=
 =?utf-8?B?eFdtRlBqWVFtaGFzT2dUaGJUWm9LV3RRY2Z0bnFZYXpzenFwOGt2L0hFODNY?=
 =?utf-8?B?SWJOU1ppVmxPSUdCeks0T0NDM2V5L25SeFFxbGE0NWUxUlN4TmdTK3ZWcVlE?=
 =?utf-8?B?Tlp3K09qTGU4cHNlNkpCTXMwdHQ0Q1lMY1VwNGloODF6SDQwVEM4c2hQNFJC?=
 =?utf-8?B?ZDVDUytyNEhLdEJDQXhqb2FlTVVDOGlIK09Ed0VFaElWYjlaOUhxK2pVaUJ2?=
 =?utf-8?B?NXFmbGcxaEwwRmJMQUNDKzlxVUwxdDZmMVFUTkVqVHc1UmRlZ0lUN05Sei8w?=
 =?utf-8?B?V3dLbjlBNEZHaElDd1NkZWJNM1NVRDEyTy9WMHJ5RCszTEQrdzcrZjRzdVhY?=
 =?utf-8?B?b1RnQjV0Vmp3eTQ4a0xUZHVkUTl2ZUVZRjRkN2JlZEFZWktqd2sxYlE1TmZ3?=
 =?utf-8?B?bmJDdWRXTXd4a01lRnNESWliSjg3Q05aZHZrL1krNFBzVlNzeFRId2V1OE5Y?=
 =?utf-8?B?a1VNbmFJS2lWY2xnWElmRE9rVHRRaGZScWlmTWgwY0hVVWVrdUF1Y2J0KzV4?=
 =?utf-8?B?OHVTekg4MzFQNEtYSytvV3Aza3ozU3l4NUVRcFNMMDhVNUdhWDRhdmRNd3dG?=
 =?utf-8?B?YWFQUUZzWVJja2xnZjNFTnhpNkMvcTdrb3l4TXpVQTB4emJGUVBQcDVRUGZh?=
 =?utf-8?B?ME9rMnNYM0lXKzhPdndrTXlqOThWSlVLblFhMnd0OGYyZDZQbHhFbUppMTZq?=
 =?utf-8?B?Q3JjVUROMHkwUGdsSEV6SnBaSXFQeS84YmNQSTZpMkZyb2NPcEhxTWRuc2xT?=
 =?utf-8?B?Y09MQ1FkU0lRb01vemZVcmR2RkN1YXJkQk9RSUFCeTFKRkZpN1lxTXlRdDRG?=
 =?utf-8?B?S1E9PQ==?=
Content-ID: <2EBDF98C4E615B44A764C718380B5919@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3020207-5b4f-4cea-e723-08de0a3dfcec
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2025 09:50:48.5654 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fbT10KXWuLz7tMHrJanZ4PnJumNL73t2JZDWXSn8ZsghT8kGXtojO9fcg+v+izzwbGDNjR1yeRsjf338wAZogsNeQ8X9ygjQlbx7N2el6F0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7325
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_002_1921548842.1068254296"
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

--__=_Part_Boundary_002_1921548842.1068254296
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gRnJpLCAyMDI1LTA5LTA1IGF0IDA5OjQxICswMDAwLCBDSyBIdSAo6IOh5L+K5YWJKSB3cm90
ZToNCj4gT24gV2VkLCAyMDI1LTA4LTI3IGF0IDE5OjM3ICswODAwLCBKYXNvbi1KSCBMaW4gd3Jv
dGU6DQo+ID4gVG8gc3VwcG9ydCBnZW5lcmF0aW5nIEdDRSB3cml0ZSBpbnN0cnVjdGlvbnMgdXNp
bmcgYm90aCBwYV9iYXNlIGFuZA0KPiA+IHN1YnN5cywgdGhlIG9yaWdpbmFsIGNtZHFfcGt0X3dy
aXRlKCkgYW5kIGNtZHFfcGt0X3dyaXRlX21hc2soKQ0KPiA+IGhhdmUNCj4gPiBiZWVuIGV4cGFu
ZGVkIGludG8gZm91ciBuZXcgQVBJczoNCj4gPiAtIFJlcGxhY2VkIGNtZHFfcGt0X3dyaXRlKCkg
dG8gY21kcV9wa3Rfd3JpdGVfcGEoKSBhbmQNCj4gPiDCoCBjbWRxX3BrdF93cml0ZV9zdWJzeXMo
KS4NCj4gPiAtIFJlcGxhY2VkIGNtZHFfcGt0X3dyaXRlX21hc2soKSB0byBjbWRxX3BrdF93cml0
ZV9tYXNrX3BhKCkgYW5kDQo+ID4gwqAgY21kcV9wa3Rfd3JpdGVfbWFza19zdWJzeXMoKS4NCj4g
PiANCj4gPiBUaGUgb3JpZ2luYWwgY21kcV9wa3Rfd3JpdGUoKSBhbmQgY21kcV9wa3Rfd3JpdGVf
bWFzaygpIHdpbGwgYmUNCj4gPiByZW1vdmVkDQo+ID4gYWZ0ZXIgYWxsIENNRFEgdXNlcnMgaGF2
ZSBtaWdyYXRlZCB0byB0aGUgbmV3IEFQSXMuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogSmFz
b24tSkggTGluIDxqYXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+IMKgZHJp
dmVycy9zb2MvbWVkaWF0ZWsvbXRrLWNtZHEtaGVscGVyLmMgfCA0MSArKysrKysrKysrKysrDQo+
ID4gwqBpbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGstY21kcS5owqAgfCA3OQ0KPiA+ICsr
KysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gwqAyIGZpbGVzIGNoYW5nZWQsIDEyMCBpbnNl
cnRpb25zKCspDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc29jL21lZGlhdGVrL210
ay1jbWRxLWhlbHBlci5jDQo+ID4gYi9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstY21kcS1oZWxw
ZXIuYw0KPiA+IGluZGV4IDQxZTE5OTdjZGQ1My4uN2U4NjI5OTIxM2Q4IDEwMDY0NA0KPiA+IC0t
LSBhL2RyaXZlcnMvc29jL21lZGlhdGVrL210ay1jbWRxLWhlbHBlci5jDQo+ID4gKysrIGIvZHJp
dmVycy9zb2MvbWVkaWF0ZWsvbXRrLWNtZHEtaGVscGVyLmMNCj4gPiBAQCAtMjEzLDYgKzIxMywy
NiBAQCBpbnQgY21kcV9wa3Rfd3JpdGUoc3RydWN0IGNtZHFfcGt0ICpwa3QsIHU4DQo+ID4gc3Vi
c3lzLCB1MTYgb2Zmc2V0LCB1MzIgdmFsdWUpDQo+ID4gwqB9DQo+ID4gwqBFWFBPUlRfU1lNQk9M
KGNtZHFfcGt0X3dyaXRlKTsNCj4gPiDCoA0KPiA+ICtpbnQgY21kcV9wa3Rfd3JpdGVfcGEoc3Ry
dWN0IGNtZHFfcGt0ICpwa3QsIHU4IHN1YnN5cyAvKnVudXNlZCovLA0KPiA+IHUzMiBwYV9iYXNl
LA0KPiA+ICsJCcKgwqDCoMKgwqAgdTE2IG9mZnNldCwgdTMyIHZhbHVlKQ0KPiANCj4gc3Vic3lz
IGlzIHVzZWxlc3MuIERyb3AgaXQuDQo+IA0KPiA+ICt7DQo+ID4gKwlpbnQgZXJyOw0KPiA+ICsN
Cj4gPiArCWVyciA9IGNtZHFfcGt0X2Fzc2lnbihwa3QsIENNRFFfVEhSX1NQUl9JRFgwLA0KPiA+
IENNRFFfQUREUl9ISUdIKHBhX2Jhc2UpKTsNCj4gPiArCWlmIChlcnIgPCAwKQ0KPiA+ICsJCXJl
dHVybiBlcnI7DQo+ID4gKw0KPiA+ICsJcmV0dXJuIGNtZHFfcGt0X3dyaXRlX3NfdmFsdWUocGt0
LCBDTURRX1RIUl9TUFJfSURYMCwNCj4gPiBDTURRX0FERFJfTE9XKG9mZnNldCksIHZhbHVlKTsN
Cj4gPiArfQ0KPiA+ICtFWFBPUlRfU1lNQk9MKGNtZHFfcGt0X3dyaXRlX3BhKTsNCj4gPiArDQo+
ID4gK2ludCBjbWRxX3BrdF93cml0ZV9zdWJzeXMoc3RydWN0IGNtZHFfcGt0ICpwa3QsIHU4IHN1
YnN5cywgdTMyDQo+ID4gcGFfYmFzZSAvKnVudXNlZCovLA0KPiA+ICsJCQnCoCB1MTYgb2Zmc2V0
LCB1MzIgdmFsdWUpDQo+IA0KPiBwYV9iYXNlIGlzIHVzZWxlc3MuIERyb3AgaXQuDQo+IA0KPiA+
ICt7DQo+ID4gKwlyZXR1cm4gY21kcV9wa3Rfd3JpdGUocGt0LCBzdWJzeXMsIG9mZnNldCwgdmFs
dWUpOw0KPiA+ICt9DQo+ID4gK0VYUE9SVF9TWU1CT0woY21kcV9wa3Rfd3JpdGVfc3Vic3lzKTsN
Cj4gPiArDQo+ID4gwqBpbnQgY21kcV9wa3Rfd3JpdGVfbWFzayhzdHJ1Y3QgY21kcV9wa3QgKnBr
dCwgdTggc3Vic3lzLA0KPiA+IMKgCQkJdTE2IG9mZnNldCwgdTMyIHZhbHVlLCB1MzIgbWFzaykN
Cj4gPiDCoHsNCj4gPiBAQCAtMjMwLDYgKzI1MCwyNyBAQCBpbnQgY21kcV9wa3Rfd3JpdGVfbWFz
ayhzdHJ1Y3QgY21kcV9wa3QgKnBrdCwNCj4gPiB1OCBzdWJzeXMsDQo+ID4gwqB9DQo+ID4gwqBF
WFBPUlRfU1lNQk9MKGNtZHFfcGt0X3dyaXRlX21hc2spOw0KPiA+IMKgDQo+ID4gK2ludCBjbWRx
X3BrdF93cml0ZV9tYXNrX3BhKHN0cnVjdCBjbWRxX3BrdCAqcGt0LCB1OCBzdWJzeXMNCj4gPiAv
KnVudXNlZCovLCB1MzIgcGFfYmFzZSwNCj4gPiArCQkJwqDCoCB1MTYgb2Zmc2V0LCB1MzIgdmFs
dWUsIHUzMiBtYXNrKQ0KPiANCj4gc3Vic3lzIGlzIHVzZWxlc3MuIERyb3AgaXQuDQo+IA0KPiA+
ICt7DQo+ID4gKwlpbnQgZXJyOw0KPiA+ICsNCj4gPiArCWVyciA9IGNtZHFfcGt0X2Fzc2lnbihw
a3QsIENNRFFfVEhSX1NQUl9JRFgwLA0KPiA+IENNRFFfQUREUl9ISUdIKHBhX2Jhc2UpKTsNCj4g
PiArCWlmIChlcnIgPCAwKQ0KPiA+ICsJCXJldHVybiBlcnI7DQo+ID4gKw0KPiA+ICsJcmV0dXJu
IGNtZHFfcGt0X3dyaXRlX3NfbWFza192YWx1ZShwa3QsIENNRFFfVEhSX1NQUl9JRFgwLA0KPiA+
ICsJCQkJCcKgwqAgQ01EUV9BRERSX0xPVyhvZmZzZXQpLA0KPiA+IHZhbHVlLCBtYXNrKTsNCj4g
PiArfQ0KPiA+ICtFWFBPUlRfU1lNQk9MKGNtZHFfcGt0X3dyaXRlX21hc2tfcGEpOw0KPiA+ICsN
Cj4gPiAraW50IGNtZHFfcGt0X3dyaXRlX21hc2tfc3Vic3lzKHN0cnVjdCBjbWRxX3BrdCAqcGt0
LCB1OCBzdWJzeXMsDQo+ID4gdTMyIHBhX2Jhc2UgLyp1bnVzZWQqLywNCj4gPiArCQkJwqDCoMKg
wqDCoMKgIHUxNiBvZmZzZXQsIHUzMiB2YWx1ZSwgdTMyIG1hc2spDQo+IA0KPiBwYV9iYXNlIGlz
IHVzZWxlc3MuIERyb3AgaXQuDQo+IA0KPiA+ICt7DQo+ID4gKwlyZXR1cm4gY21kcV9wa3Rfd3Jp
dGVfbWFzayhwa3QsIHN1YnN5cywgb2Zmc2V0LCB2YWx1ZSwNCj4gPiBtYXNrKTsNCj4gPiArfQ0K
PiA+ICtFWFBPUlRfU1lNQk9MKGNtZHFfcGt0X3dyaXRlX21hc2tfc3Vic3lzKTsNCj4gPiArDQoN
CkhpIENLLA0KDQpJJ2xsIGRyb3AgdGhlIHVudXNlZCBwYXJhbWV0ZXJzLg0KVGhhbmtzIGZvciB0
aGUgcmV2aWV3cy4NCg0KUmVnYXJkcywNCkphc29uLUpIIExpbg0K

--__=_Part_Boundary_002_1921548842.1068254296
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO0ZyaSwmIzMyOzIwMjUtMDktMDUmIzMyO2F0
JiMzMjswOTo0MSYjMzI7KzAwMDAsJiMzMjtDSyYjMzI7SHUmIzMyOygmIzMyOTkzOyYjMjA0MjY7
JiMyMDgwOTspJiMzMjt3cm90ZToNCiZndDsmIzMyO09uJiMzMjtXZWQsJiMzMjsyMDI1LTA4LTI3
JiMzMjthdCYjMzI7MTk6MzcmIzMyOyswODAwLCYjMzI7SmFzb24tSkgmIzMyO0xpbiYjMzI7d3Jv
dGU6DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtUbyYjMzI7c3VwcG9ydCYjMzI7Z2VuZXJhdGluZyYjMzI7
R0NFJiMzMjt3cml0ZSYjMzI7aW5zdHJ1Y3Rpb25zJiMzMjt1c2luZyYjMzI7Ym90aCYjMzI7cGFf
YmFzZSYjMzI7YW5kDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtzdWJzeXMsJiMzMjt0aGUmIzMyO29yaWdp
bmFsJiMzMjtjbWRxX3BrdF93cml0ZSgpJiMzMjthbmQmIzMyO2NtZHFfcGt0X3dyaXRlX21hc2so
KQ0KJmd0OyYjMzI7Jmd0OyYjMzI7aGF2ZQ0KJmd0OyYjMzI7Jmd0OyYjMzI7YmVlbiYjMzI7ZXhw
YW5kZWQmIzMyO2ludG8mIzMyO2ZvdXImIzMyO25ldyYjMzI7QVBJczoNCiZndDsmIzMyOyZndDsm
IzMyOy0mIzMyO1JlcGxhY2VkJiMzMjtjbWRxX3BrdF93cml0ZSgpJiMzMjt0byYjMzI7Y21kcV9w
a3Rfd3JpdGVfcGEoKSYjMzI7YW5kDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzE2MDsmIzMyO2NtZHFf
cGt0X3dyaXRlX3N1YnN5cygpLg0KJmd0OyYjMzI7Jmd0OyYjMzI7LSYjMzI7UmVwbGFjZWQmIzMy
O2NtZHFfcGt0X3dyaXRlX21hc2soKSYjMzI7dG8mIzMyO2NtZHFfcGt0X3dyaXRlX21hc2tfcGEo
KSYjMzI7YW5kDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzE2MDsmIzMyO2NtZHFfcGt0X3dyaXRlX21h
c2tfc3Vic3lzKCkuDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyO1RoZSYj
MzI7b3JpZ2luYWwmIzMyO2NtZHFfcGt0X3dyaXRlKCkmIzMyO2FuZCYjMzI7Y21kcV9wa3Rfd3Jp
dGVfbWFzaygpJiMzMjt3aWxsJiMzMjtiZQ0KJmd0OyYjMzI7Jmd0OyYjMzI7cmVtb3ZlZA0KJmd0
OyYjMzI7Jmd0OyYjMzI7YWZ0ZXImIzMyO2FsbCYjMzI7Q01EUSYjMzI7dXNlcnMmIzMyO2hhdmUm
IzMyO21pZ3JhdGVkJiMzMjt0byYjMzI7dGhlJiMzMjtuZXcmIzMyO0FQSXMuDQomZ3Q7JiMzMjsm
Z3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtKYXNvbi1KSCYj
MzI7TGluJiMzMjsmbHQ7amFzb24tamgubGluQG1lZGlhdGVrLmNvbSZndDsNCiZndDsmIzMyOyZn
dDsmIzMyOy0tLQ0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMxNjA7ZHJpdmVycy9zb2MvbWVkaWF0ZWsv
bXRrLWNtZHEtaGVscGVyLmMmIzMyO3wmIzMyOzQxJiMzMjsrKysrKysrKysrKysrDQomZ3Q7JiMz
MjsmZ3Q7JiMzMjsmIzE2MDtpbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGstY21kcS5oJiMx
NjA7JiMzMjt8JiMzMjs3OQ0KJmd0OyYjMzI7Jmd0OyYjMzI7KysrKysrKysrKysrKysrKysrKysr
KysrKysNCiZndDsmIzMyOyZndDsmIzMyOyYjMTYwOzImIzMyO2ZpbGVzJiMzMjtjaGFuZ2VkLCYj
MzI7MTIwJiMzMjtpbnNlcnRpb25zKCspDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZn
dDsmIzMyO2RpZmYmIzMyOy0tZ2l0JiMzMjthL2RyaXZlcnMvc29jL21lZGlhdGVrL210ay1jbWRx
LWhlbHBlci5jDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtiL2RyaXZlcnMvc29jL21lZGlhdGVrL210ay1j
bWRxLWhlbHBlci5jDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtpbmRleCYjMzI7NDFlMTk5N2NkZDUzLi43
ZTg2Mjk5MjEzZDgmIzMyOzEwMDY0NA0KJmd0OyYjMzI7Jmd0OyYjMzI7LS0tJiMzMjthL2RyaXZl
cnMvc29jL21lZGlhdGVrL210ay1jbWRxLWhlbHBlci5jDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrKysm
IzMyO2IvZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLWNtZHEtaGVscGVyLmMNCiZndDsmIzMyOyZn
dDsmIzMyO0BAJiMzMjstMjEzLDYmIzMyOysyMTMsMjYmIzMyO0BAJiMzMjtpbnQmIzMyO2NtZHFf
cGt0X3dyaXRlKHN0cnVjdCYjMzI7Y21kcV9wa3QmIzMyOypwa3QsJiMzMjt1OA0KJmd0OyYjMzI7
Jmd0OyYjMzI7c3Vic3lzLCYjMzI7dTE2JiMzMjtvZmZzZXQsJiMzMjt1MzImIzMyO3ZhbHVlKQ0K
Jmd0OyYjMzI7Jmd0OyYjMzI7JiMxNjA7fQ0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMxNjA7RVhQT1JU
X1NZTUJPTChjbWRxX3BrdF93cml0ZSk7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzE2MDsNCiZndDsm
IzMyOyZndDsmIzMyOytpbnQmIzMyO2NtZHFfcGt0X3dyaXRlX3BhKHN0cnVjdCYjMzI7Y21kcV9w
a3QmIzMyOypwa3QsJiMzMjt1OCYjMzI7c3Vic3lzJiMzMjsvKnVudXNlZCovLA0KJmd0OyYjMzI7
Jmd0OyYjMzI7dTMyJiMzMjtwYV9iYXNlLA0KJmd0OyYjMzI7Jmd0OyYjMzI7KyYjMTYwOyYjMTYw
OyYjMTYwOyYjMTYwOyYjMTYwOyYjMzI7dTE2JiMzMjtvZmZzZXQsJiMzMjt1MzImIzMyO3ZhbHVl
KQ0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtzdWJzeXMmIzMyO2lzJiMzMjt1c2VsZXNzLiYjMzI7RHJv
cCYjMzI7aXQuDQomZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyOyt7DQomZ3Q7JiMzMjsmZ3Q7
JiMzMjsraW50JiMzMjtlcnI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsmZ3Q7JiMz
MjsrZXJyJiMzMjs9JiMzMjtjbWRxX3BrdF9hc3NpZ24ocGt0LCYjMzI7Q01EUV9USFJfU1BSX0lE
WDAsDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtDTURRX0FERFJfSElHSChwYV9iYXNlKSk7DQomZ3Q7JiMz
MjsmZ3Q7JiMzMjsraWYmIzMyOyhlcnImIzMyOyZsdDsmIzMyOzApDQomZ3Q7JiMzMjsmZ3Q7JiMz
MjsrcmV0dXJuJiMzMjtlcnI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsmZ3Q7JiMz
MjsrcmV0dXJuJiMzMjtjbWRxX3BrdF93cml0ZV9zX3ZhbHVlKHBrdCwmIzMyO0NNRFFfVEhSX1NQ
Ul9JRFgwLA0KJmd0OyYjMzI7Jmd0OyYjMzI7Q01EUV9BRERSX0xPVyhvZmZzZXQpLCYjMzI7dmFs
dWUpOw0KJmd0OyYjMzI7Jmd0OyYjMzI7K30NCiZndDsmIzMyOyZndDsmIzMyOytFWFBPUlRfU1lN
Qk9MKGNtZHFfcGt0X3dyaXRlX3BhKTsNCiZndDsmIzMyOyZndDsmIzMyOysNCiZndDsmIzMyOyZn
dDsmIzMyOytpbnQmIzMyO2NtZHFfcGt0X3dyaXRlX3N1YnN5cyhzdHJ1Y3QmIzMyO2NtZHFfcGt0
JiMzMjsqcGt0LCYjMzI7dTgmIzMyO3N1YnN5cywmIzMyO3UzMg0KJmd0OyYjMzI7Jmd0OyYjMzI7
cGFfYmFzZSYjMzI7Lyp1bnVzZWQqLywNCiZndDsmIzMyOyZndDsmIzMyOysmIzE2MDsmIzMyO3Ux
NiYjMzI7b2Zmc2V0LCYjMzI7dTMyJiMzMjt2YWx1ZSkNCiZndDsmIzMyOw0KJmd0OyYjMzI7cGFf
YmFzZSYjMzI7aXMmIzMyO3VzZWxlc3MuJiMzMjtEcm9wJiMzMjtpdC4NCiZndDsmIzMyOw0KJmd0
OyYjMzI7Jmd0OyYjMzI7K3sNCiZndDsmIzMyOyZndDsmIzMyOytyZXR1cm4mIzMyO2NtZHFfcGt0
X3dyaXRlKHBrdCwmIzMyO3N1YnN5cywmIzMyO29mZnNldCwmIzMyO3ZhbHVlKTsNCiZndDsmIzMy
OyZndDsmIzMyOyt9DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrRVhQT1JUX1NZTUJPTChjbWRxX3BrdF93
cml0ZV9zdWJzeXMpOw0KJmd0OyYjMzI7Jmd0OyYjMzI7Kw0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMx
NjA7aW50JiMzMjtjbWRxX3BrdF93cml0ZV9tYXNrKHN0cnVjdCYjMzI7Y21kcV9wa3QmIzMyOypw
a3QsJiMzMjt1OCYjMzI7c3Vic3lzLA0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMxNjA7dTE2JiMzMjtv
ZmZzZXQsJiMzMjt1MzImIzMyO3ZhbHVlLCYjMzI7dTMyJiMzMjttYXNrKQ0KJmd0OyYjMzI7Jmd0
OyYjMzI7JiMxNjA7ew0KJmd0OyYjMzI7Jmd0OyYjMzI7QEAmIzMyOy0yMzAsNiYjMzI7KzI1MCwy
NyYjMzI7QEAmIzMyO2ludCYjMzI7Y21kcV9wa3Rfd3JpdGVfbWFzayhzdHJ1Y3QmIzMyO2NtZHFf
cGt0JiMzMjsqcGt0LA0KJmd0OyYjMzI7Jmd0OyYjMzI7dTgmIzMyO3N1YnN5cywNCiZndDsmIzMy
OyZndDsmIzMyOyYjMTYwO30NCiZndDsmIzMyOyZndDsmIzMyOyYjMTYwO0VYUE9SVF9TWU1CT0wo
Y21kcV9wa3Rfd3JpdGVfbWFzayk7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzE2MDsNCiZndDsmIzMy
OyZndDsmIzMyOytpbnQmIzMyO2NtZHFfcGt0X3dyaXRlX21hc2tfcGEoc3RydWN0JiMzMjtjbWRx
X3BrdCYjMzI7KnBrdCwmIzMyO3U4JiMzMjtzdWJzeXMNCiZndDsmIzMyOyZndDsmIzMyOy8qdW51
c2VkKi8sJiMzMjt1MzImIzMyO3BhX2Jhc2UsDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrJiMxNjA7JiMx
NjA7JiMzMjt1MTYmIzMyO29mZnNldCwmIzMyO3UzMiYjMzI7dmFsdWUsJiMzMjt1MzImIzMyO21h
c2spDQomZ3Q7JiMzMjsNCiZndDsmIzMyO3N1YnN5cyYjMzI7aXMmIzMyO3VzZWxlc3MuJiMzMjtE
cm9wJiMzMjtpdC4NCiZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7K3sNCiZndDsmIzMyOyZn
dDsmIzMyOytpbnQmIzMyO2VycjsNCiZndDsmIzMyOyZndDsmIzMyOysNCiZndDsmIzMyOyZndDsm
IzMyOytlcnImIzMyOz0mIzMyO2NtZHFfcGt0X2Fzc2lnbihwa3QsJiMzMjtDTURRX1RIUl9TUFJf
SURYMCwNCiZndDsmIzMyOyZndDsmIzMyO0NNRFFfQUREUl9ISUdIKHBhX2Jhc2UpKTsNCiZndDsm
IzMyOyZndDsmIzMyOytpZiYjMzI7KGVyciYjMzI7Jmx0OyYjMzI7MCkNCiZndDsmIzMyOyZndDsm
IzMyOytyZXR1cm4mIzMyO2VycjsNCiZndDsmIzMyOyZndDsmIzMyOysNCiZndDsmIzMyOyZndDsm
IzMyOytyZXR1cm4mIzMyO2NtZHFfcGt0X3dyaXRlX3NfbWFza192YWx1ZShwa3QsJiMzMjtDTURR
X1RIUl9TUFJfSURYMCwNCiZndDsmIzMyOyZndDsmIzMyOysmIzE2MDsmIzE2MDsmIzMyO0NNRFFf
QUREUl9MT1cob2Zmc2V0KSwNCiZndDsmIzMyOyZndDsmIzMyO3ZhbHVlLCYjMzI7bWFzayk7DQom
Z3Q7JiMzMjsmZ3Q7JiMzMjsrfQ0KJmd0OyYjMzI7Jmd0OyYjMzI7K0VYUE9SVF9TWU1CT0woY21k
cV9wa3Rfd3JpdGVfbWFza19wYSk7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsmZ3Q7
JiMzMjsraW50JiMzMjtjbWRxX3BrdF93cml0ZV9tYXNrX3N1YnN5cyhzdHJ1Y3QmIzMyO2NtZHFf
cGt0JiMzMjsqcGt0LCYjMzI7dTgmIzMyO3N1YnN5cywNCiZndDsmIzMyOyZndDsmIzMyO3UzMiYj
MzI7cGFfYmFzZSYjMzI7Lyp1bnVzZWQqLywNCiZndDsmIzMyOyZndDsmIzMyOysmIzE2MDsmIzE2
MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzMyO3UxNiYjMzI7b2Zmc2V0LCYjMzI7dTMyJiMz
Mjt2YWx1ZSwmIzMyO3UzMiYjMzI7bWFzaykNCiZndDsmIzMyOw0KJmd0OyYjMzI7cGFfYmFzZSYj
MzI7aXMmIzMyO3VzZWxlc3MuJiMzMjtEcm9wJiMzMjtpdC4NCiZndDsmIzMyOw0KJmd0OyYjMzI7
Jmd0OyYjMzI7K3sNCiZndDsmIzMyOyZndDsmIzMyOytyZXR1cm4mIzMyO2NtZHFfcGt0X3dyaXRl
X21hc2socGt0LCYjMzI7c3Vic3lzLCYjMzI7b2Zmc2V0LCYjMzI7dmFsdWUsDQomZ3Q7JiMzMjsm
Z3Q7JiMzMjttYXNrKTsNCiZndDsmIzMyOyZndDsmIzMyOyt9DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsr
RVhQT1JUX1NZTUJPTChjbWRxX3BrdF93cml0ZV9tYXNrX3N1YnN5cyk7DQomZ3Q7JiMzMjsmZ3Q7
JiMzMjsrDQoNCkhpJiMzMjtDSywNCg0KSSYjMzk7bGwmIzMyO2Ryb3AmIzMyO3RoZSYjMzI7dW51
c2VkJiMzMjtwYXJhbWV0ZXJzLg0KVGhhbmtzJiMzMjtmb3ImIzMyO3RoZSYjMzI7cmV2aWV3cy4N
Cg0KUmVnYXJkcywNCkphc29uLUpIJiMzMjtMaW4NCg0KPC9wcmU+DQo8L3A+PC9ib2R5PjwvaHRt
bD48IS0tdHlwZTp0ZXh0LS0+PCEtLXstLT48cHJlPioqKioqKioqKioqKiogTUVESUFURUsgQ29u
ZmlkZW50aWFsaXR5IE5vdGljZQ0KICoqKioqKioqKioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRp
b24gY29udGFpbmVkIGluIHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRh
Y2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9y
IG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3Mu
IEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCBy
ZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3NlbWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmlu
dGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMg
DQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJv
aGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVk
IHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZQ0KIA0KdGhhdCB5b3UgaGF2ZSBy
ZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0K
aW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQg
YWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBm
cm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlz
IGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_002_1921548842.1068254296--

