Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F719D59ED
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 08:24:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F15610EAD4;
	Fri, 22 Nov 2024 07:24:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="D1cGTDxb";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="vEoVZ0cB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6883210EAD4
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 07:24:07 +0000 (UTC)
X-UUID: bd21f9a4a8a211efbd192953cf12861f-20241122
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=XVRe15gK5K06qQWaCr1rxhIqNLqW4zbTr6xX1m3Ka5Q=; 
 b=D1cGTDxbqOTVzOuWe7bSrWMraa1CGc7+wEX/18QL6eiZp4v1UER0yXCWGs5dfvdi/VE84cxizW2AP4Jjhw4bUmPJLoE42NsA/GDuQSqTF98GRcr1HSVeSa4wza8EONzuu58VOHJzm5mSeC+7rJpbOqTKvQc4e8vKeoI54rqFHlk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44, REQID:f6439fec-ec38-4bbe-ba87-8b807553ba42, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:464815b, CLOUDID:797939b9-596a-4e31-81f2-cae532fa1b81,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
 :-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
 ,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: bd21f9a4a8a211efbd192953cf12861f-20241122
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 384543377; Fri, 22 Nov 2024 15:23:58 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 22 Nov 2024 15:23:55 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 22 Nov 2024 15:23:55 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bfTY839SHxGtWnPSe7lMu018HKMVkYrIRTyfLHBRu+9Hpqbhg6tbsXe6Jxlwc5ngo0cVqoBzt/EcdKMKq9Ojj6eEd9TkNmZ8jhXAbgmlchKdQDUL6Fp/gFPh/0xnKn1NtMCBCYDbVRKGwc9+BznIGhMj3+6PHpVQiyfKHVCdrGr/f+oj/Wz5h144yrY3AIZ+SN71VtUAwDSn/5OAIV4CNYCEfBWVMxyg/QQV1gxdmmjIMe29PwBNJBfmVmsqsTfXQEnTfjHwIz6EWOiRH2Kfx29TBfWNkfcoFXMrWhci4EdkApK35sg/pX6b0MkhpbWbFukYgC+J2N+IBiuPJnqLBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ojkzv0F797xYpp0hDlVpLIZ+TuNAsimFraQKjyHTquI=;
 b=bB7u9ELjbdxH3usTc5L+TZRxqmu8cd+U/LFZd1fuz8lK1gDDIJNOXrdzHDKvAa59lYY+6gOpL/owjO27v44afDln6nvVFGgeZ6Rmvch0zfLkSZ8DLY7YX8sfnllRj3mzCPMHaguKOzBnXY1jiKW3TUYhK0zfCkmxLYA8MNfhiss4Echn8qtLzS8t9LH9kRC28dZWb0pQBo0ZSWjOFaXW0eMD+hXNqIBejVNTo79vbqjzeihYNyYrXHuiata2m7t55cOVpcLrmFkRpXsMkqgYLgSMsN25V3qTTTq+FBxWjGL6eehuwin1+hsdeUZG5gs6BWu7ugZ30j/Q6yvxeP5wzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ojkzv0F797xYpp0hDlVpLIZ+TuNAsimFraQKjyHTquI=;
 b=vEoVZ0cBuNuUjEX8EZ5OKYxPnp8HRcVE6ce/jPco4Zrt43Hua6lWtBnwYdb2l3uTLAASilDb/adT9+rh2NecNjQvnkH+CSdrzeavX3cX5pSgfUrhv/zOj7g3IZ0qiwzgvw5bQnQNS/GLxp8eIibbHWkzS8tPnvr6rjVvKIs4fEc=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by KL1PR03MB7287.apcprd03.prod.outlook.com (2603:1096:820:eb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.21; Fri, 22 Nov
 2024 07:23:52 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8158.017; Fri, 22 Nov 2024
 07:23:52 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "mripard@kernel.org" <mripard@kernel.org>,
 =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?= <jitao.shi@mediatek.com>,
 "kernel@collabora.com" <kernel@collabora.com>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>
Subject: Re: [PATCH v1 6/6] drm/mediatek: Add support for MT8195 Digital
 Parallel Interface
Thread-Topic: [PATCH v1 6/6] drm/mediatek: Add support for MT8195 Digital
 Parallel Interface
Thread-Index: AQHbO0o2kTOzG2fD30avrRutQMN1rbLC6GCA
Date: Fri, 22 Nov 2024 07:23:52 +0000
Message-ID: <1b966a136f02b5586749a9c3d0bcec6c75224e49.camel@mediatek.com>
References: <20241120124420.133914-1-angelogioacchino.delregno@collabora.com>
 <20241120124420.133914-7-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20241120124420.133914-7-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|KL1PR03MB7287:EE_
x-ms-office365-filtering-correlation-id: 708f5e5a-2bc0-411c-6bd1-08dd0ac69dd4
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?MloycjV5TnV5aXNPc0tSVHBuVEdQSWtXbzhaWmcrOHY5L0gxZGt4R1ZSemFi?=
 =?utf-8?B?M0pWazFrTWZPVUNTdjBOYUFpWXloR0k2V2N6aTNhWW5jdmZ2d2NSVlFaVHpq?=
 =?utf-8?B?eGZqc1RuRlMweS9hZ3EySE5MTzkvZ3Z3SjVURFZ2SlZQamlHSkF4Z1Z3VUVw?=
 =?utf-8?B?M3YyMGNOS3YwbUg5UHl5R3lXbXlpbEc2VzBvUWlHWHJwU29HNlErbmN2OEJN?=
 =?utf-8?B?NFFVVWpXQ3BqYkF0SWVTaEI3dEFUcXVvQTI5a1l3SkFKVXFreitZcjZxVUdy?=
 =?utf-8?B?VVRLSWxOa2tGRDBTTE1pWmlpam43U01iUjA3M0Z1OXlqakZ0WDkvUE9kMGJo?=
 =?utf-8?B?cGw3WlJGU0J2eXFscHh3b0p2SGEzTWh1NEE0QmVtNlVmS0hWcTB4dW8rc2JE?=
 =?utf-8?B?YXBUVERmNXg4MVZ6QWs1TXc2emJUUGVMMDhnN3FJbnFoVHh4QWhLTE51WmdG?=
 =?utf-8?B?OEd5SU9SKy9Ha0plbUk2WnlEUXFYb3MyREp2MnozeTlYdEgra0JsRXludElD?=
 =?utf-8?B?WjJxQkRkRmE2K3RPN2lPNTBNTkVmZmJqYTg5VFZYN0VaU0EyN2hENkZkOUhj?=
 =?utf-8?B?WXI4WnpRY3hrN3ZKYThFdUJrbXhoY0xIdE8wNGpqTkFjUUppZFE5a3FLcWJC?=
 =?utf-8?B?dnByWnpJNm5aNEZjcHVIb2hZTVZ5TGJHejBVWlc2cDhPSUlIUE1ZemdKTlho?=
 =?utf-8?B?K3hCOEd6cVpSSG5OSnNFNUhlUVU4VWRROTdJajBscC84RGNoZzhJYmZ0TUFj?=
 =?utf-8?B?bktxQjBmbDN5SitjeDVOQk5IZkRRdDlHVUd1Y1I5aklPb2FwTVE5N0pDNmpW?=
 =?utf-8?B?WnVjTStZV2RrbjdiSlNNYndJWTNWQmI1WFA0SVJUZllPdCtVaTdWWlp0a1Nu?=
 =?utf-8?B?ZFhuSFV1Q1FDUzRuZ296ZHN2TElGaU16cXhYU1NRNmp6a2hpMVdvK2ZLclp4?=
 =?utf-8?B?b3hpRHBIWUNtaTFPRWRhajNVOEVocFBPT1hEd2FtSWN6bloxNWYzeERZQlFW?=
 =?utf-8?B?SmptMUlMdnFWQk1DeEd4bGJPRDlDejBBbCt6eGdhRlkwd3grUkY2T0NOMU10?=
 =?utf-8?B?TXpNV2F6R1Y5TERlVFl0TllBVElrQURVZnFoTktyT1pDS2VYTnY4TUZZTzNT?=
 =?utf-8?B?QWcwUS9nTDgwMUIvMDNzL0NyUkhjUmU4bUpYVU02TEFLMGhSNldyZ1ZnUllF?=
 =?utf-8?B?ci9JQmRrbHFBQVZQa1ptODNCTTZKMEtnU1F6YlNDNUI1WWpjVWFHZExRYUwv?=
 =?utf-8?B?TDl6eUxlTG8vcEVpTWlML3lIVklST3dzMGZNZ3lUNmFkWkpqZndaampROTZx?=
 =?utf-8?B?cnZzdDMrTW5ndktieTFKcnRsTlpoQVdOUkpPL0FZeVBpaFd3QndlTG5nYjYw?=
 =?utf-8?B?VEp6L3d6a0wxQ2NweHFMQ3hOZDJVUU1wdjdHcmI4b2NvMXlHcXlpTFlpTEpV?=
 =?utf-8?B?UWc4SDFyUjdjMktTSFZpdlpEcXBsTlVVWXJ0TXNLZVZPdEJlSG1XV3FOOTZi?=
 =?utf-8?B?bnVPN2hoSGc5di9jWE5GOWhyVDN4cGRwRmVlLzcvQVcyV24yc3laNE5teWN0?=
 =?utf-8?B?S3dySUY2bVdmWU0wbkNlZDM1R1YzeTdVdTFramdwSTNnYmpkOU5tVDNWOFJn?=
 =?utf-8?B?VHh2NEVaV0FnZG5WWkswQy81RDBtNkQ1eFh1UXlIbFAwc2tSS2ZEOEhpQVJy?=
 =?utf-8?B?Z0ZIUlpUN094NzhvcHBVNHJwWG1jQ2hOWWJscTVWeHNFQTd0YkQweGlpQ1N0?=
 =?utf-8?B?RmdUVCt2N2NkY3lxN1lMamszbTcwNnRzOS9QZGJIRGZuOTludFZkUXZEQW5v?=
 =?utf-8?B?QXllcXB1QTdpNlc0dzNpNUM3TWo1UUFsRnBtdGdOVk0wVzBLQmROU244SFFX?=
 =?utf-8?B?djFsYjc4QVpEQm10a1dGQXdrNlFJY0c4bXEyQ0Iwd2lvS0E9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z0FPTmh1YjZMZ3MxU0ZjMll0MmZxVW5Xa0RwUEJkaW1LdmE3SDJnWU1mdGZt?=
 =?utf-8?B?Q3BNc3hjUE5VeUgvZlg4RDRUWFd3cUdVeFZHaG5UUW9YcEZkTGpxNVlhSyto?=
 =?utf-8?B?MWxKMEMzK05sdTllNUVENzU5NldQN0tRdS9lUnRLMUdFMTNHWU1ISWRRWHJs?=
 =?utf-8?B?ck9taGlrZnlpb3BDVGp5RXd2WjZZWTZFUkRRWmVnN3ovTVg2TnUyVkhaY1VN?=
 =?utf-8?B?Yjh2QU4xZ3ZTVjhlZFEvN2g2NmFJRXVNbmM1OGdiZ0RScDZieXJ0cEQxWElT?=
 =?utf-8?B?WVNHWjZxazJSMlpqV3prSXlWdTI1aG9Uc01qZFJhU1RlMkd6ZlJ4OGwxSGxP?=
 =?utf-8?B?R1NzQ1Q2QXNQTFMvemR0SjFHOFMxMkhQSHBORUpHV1dFZm8wZlBYdDJFZVN6?=
 =?utf-8?B?NE5RT1BVbVBsLy9CN0Q0a1hLZlA3cy9Kb041ZGZZdVorc2pCOXNFVnZSMVNi?=
 =?utf-8?B?b1JSYXppOHVBcnVkRVZvbjBDUXpFUnJ3ZXNTSEtVZmdYNjN6cnowckxiSlQ5?=
 =?utf-8?B?OGY3WWlLc0c3blVNSnI0TFNZLzluYzFUVG4xL2tEZ1hmMWRaQUExMkV5TERp?=
 =?utf-8?B?cjkrL1Rpb0haZUZaUENzR1l6cTI0QnMvY3YrQW9MbDJwTjdRdUNhcGFDWSs0?=
 =?utf-8?B?VFlKRFMrRnlOTzVXcGVyWkJDdXY1YkY4VHdvZkFSekdzcTAzR3hvUTZkTTdV?=
 =?utf-8?B?Z1F4UXplc3VRYmM5S1BjaHhQSURkNHZmSHMzSDlVbU5KSFVMZDVCTzlLRGw1?=
 =?utf-8?B?QTZLR0tHZnhCRDkvSXdBbDZIZWZ1OUF2Sjd5c21wenpTb2JyZjJkOEpibzRV?=
 =?utf-8?B?MjBpZXhvd3JueE94ZDlxZVM5clpQT0poM3IyWGpKYlgrUXhIREVTUHdNeDJS?=
 =?utf-8?B?TERVNzJZbElLS0F5R2hML1MxRjBjc0hRNHQzdFlHR09rV2piTDdXMGkxYzA4?=
 =?utf-8?B?dWdNMjZMTklhdFFhbHBWMXo4ZjFmYm5ZSFNMWjRtM1pxc2t2Zm45NnVNWUc5?=
 =?utf-8?B?MlE2M1hHdkw4b2F0elBjSTVYTUtxbWV4MzdhS080aURTUU5YWDdLRVF1bnZE?=
 =?utf-8?B?NUdVbUhDWERVQ0dUTnZ1cXJuczBqa3piRDdzUW5DYTVneWJvd2NrZGFIWXZD?=
 =?utf-8?B?djNyZXRMc0EzQkJYNXhveDkvVGw4ODBldnpOVnNSV1ptOEJZWDVZaWRaU0J1?=
 =?utf-8?B?STE2cWVJVGpFR2wxU2o1cm01NWJObGprbUNTMUtHQlVJOFNaTGRqL09MN2JT?=
 =?utf-8?B?c0JoTW0rNjZsUXFQakpHY2RHb3gwQkh4UlNjbVIySkRLV2l2VnhYcC9oUjJH?=
 =?utf-8?B?eXZuU2N6R2IyT3hIZEdreUJyNFZoazZMWXE5OGRhTXFaTGoraDQwRS96RDky?=
 =?utf-8?B?TFhsT3NWMTlvU245dGVUclZlaGtsSjZnL3JzOTlLOGszVGt5WUNoZERlSWJS?=
 =?utf-8?B?Z3V1MzNXVFVhenhpMjJndFQ5REpWdFNvS0FmTlZVYWxldnJ2Q3AzbVZWeDl6?=
 =?utf-8?B?cWtYaHB4TFZBQmZRR2dlZW9UT2dWOUlYNEQ1Rnk3RFYra2dTZktrS1BNSzJR?=
 =?utf-8?B?M2lrN3YvS096VFF2MHFXSVNzMXFtUFl0alcvc05FSWZGTDNUdWR2ZjdPR2Zk?=
 =?utf-8?B?T2N0TUV0WmJmZWp1a3FRbHYxQkVRdlRmbWdiaks4OVRQTjNYdlBVTkdXRDJm?=
 =?utf-8?B?YmxaWmp1TUZGNS8yRkp5TEk2enRleWZ2blV3T1MzbzFmOEx4S0FjR0FDUThx?=
 =?utf-8?B?VjZrWVhLdHNzaDYybW5GNmFBZ2YvaVRaN3ZQUlpPNllZQ3VxUjR0TXQ3WWNl?=
 =?utf-8?B?NHNwZTB1YnFBWTczL1Z5Sm56NFIzOE5qRCttK1grSjk2NlpaVUo4SFovSEM5?=
 =?utf-8?B?UWVDRTBFaXh0QzMrKzBaeVJKQytDRnRGVk51bG5ySHR5QTRGc3ZDbkxUejJU?=
 =?utf-8?B?VTFyOHJHd2FxSTNuNjRrYy80K3hXVDVRc3kyVnc2RHgvVCtDU1lZeWRPa0Vh?=
 =?utf-8?B?dS96dWhnRjBFWjFvQjY4YloxL0pveUo5S3lNQVRhKzYzSTgrMHJJTHNCSkhS?=
 =?utf-8?B?eFh5cEZvSnpSN2YrcG5KV05LdGVVck5xTC90bzA0d3ZYdHBtNmYyNnllelZS?=
 =?utf-8?Q?+LAhPqMUKAzYM3eugHVywt+ot?=
Content-ID: <054478776F854348A1FE066411837584@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 708f5e5a-2bc0-411c-6bd1-08dd0ac69dd4
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2024 07:23:52.4024 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 03FsjyZ2Z/ygNoR+1Ze1SomG0SBh35bb4oHVbaHS9ICsuTwm55osEYpGhSb7+Qespy+9kPXWC5mZ60EC4pf+eQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7287
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--8.212600-8.000000
X-TMASE-MatchedRID: 5+1rHnqhWUQNtKv7cnNXnSa1MaKuob8PCJpCCsn6HCHBnyal/eRn3gzR
 CsGHURLuwpcJm2NYlPAF6GY0Fb6yCsME2BsoiKJMbc297PAGtWZTm6UYlo7la5soi2XrUn/J+ZL
 5o+vRV7wDpAZ2/B/Blg1fA1QHegDv3QfwsVk0UbuGrPnef/I+erh6LNUF3FoegNxHQiiffI/Ywz
 adQjhAeU992cna+7wlZyMWcibO/JI=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--8.212600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: D33D2749FD7CE81A60F314169709458C433B3B2DD11D2EF273E2D5CCDAE540802000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_003_830927392.1953817626"
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

--__=_Part_Boundary_003_830927392.1953817626
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEFuZ2VsbzoNCg0KT24gV2VkLCAyMDI0LTExLTIwIGF0IDEzOjQ0ICswMTAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZp
ZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBBZGQgc3VwcG9ydCBmb3Ig
dGhlIERQSSBibG9jayBmb3VuZCBpbiB0aGUgTVQ4MTk1IGFuZCBNVDgxODggU29Dcy4NCj4gSW5z
aWRlIG9mIHRoZSBTb0MsIHRoaXMgYmxvY2sgaXMgZGlyZWN0bHkgY29ubmVjdGVkIHRvIHRoZSBI
RE1JIElQLg0KDQpJbiBNVDgxNzMsIERQSTAgaXMgZGlyZWN0bHkgY29ubmVjdGVkIHRvIEhETUku
DQpUaGUgZmlyc3QgdmVyc2lvbiBvZiB0aGlzIGRyaXZlciBpcyBqdXN0IGZvciBNVDgxNzMgRFBJ
MC4NCkRvZXMgTVQ4MTczIERQSTAgbmVlZCB0aGlzIG1vZGlmaWNhdGlvbj8NCk9yIHRoaXMgbW9k
aWZpY2F0aW9uIGlzIGp1c3QgZm9yIE1UODE4OCBhbmQgTVQ4MTk1LCB0aGVuIHRoZSBkZXNjcmlw
dGlvbiBzaG91bGQgYmUgbW9yZSB0aGFuICdkaXJlY3RseSBjb25uZWN0ZWQnLg0KDQpSZWdhcmRz
LA0KQ0sNCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8g
PGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4NCj4gLS0tDQo=

--__=_Part_Boundary_003_830927392.1953817626
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtBbmdlbG86DQoNCk9uJiMzMjtXZWQsJiMz
MjsyMDI0LTExLTIwJiMzMjthdCYjMzI7MTM6NDQmIzMyOyswMTAwLCYjMzI7QW5nZWxvR2lvYWNj
aGlubyYjMzI7RGVsJiMzMjtSZWdubyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjtFeHRlcm5hbCYjMzI7
ZW1haWwmIzMyOzomIzMyO1BsZWFzZSYjMzI7ZG8mIzMyO25vdCYjMzI7Y2xpY2smIzMyO2xpbmtz
JiMzMjtvciYjMzI7b3BlbiYjMzI7YXR0YWNobWVudHMmIzMyO3VudGlsJiMzMjt5b3UmIzMyO2hh
dmUmIzMyO3ZlcmlmaWVkJiMzMjt0aGUmIzMyO3NlbmRlciYjMzI7b3ImIzMyO3RoZSYjMzI7Y29u
dGVudC4NCiZndDsmIzMyOw0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtBZGQmIzMyO3N1cHBvcnQmIzMy
O2ZvciYjMzI7dGhlJiMzMjtEUEkmIzMyO2Jsb2NrJiMzMjtmb3VuZCYjMzI7aW4mIzMyO3RoZSYj
MzI7TVQ4MTk1JiMzMjthbmQmIzMyO01UODE4OCYjMzI7U29Dcy4NCiZndDsmIzMyO0luc2lkZSYj
MzI7b2YmIzMyO3RoZSYjMzI7U29DLCYjMzI7dGhpcyYjMzI7YmxvY2smIzMyO2lzJiMzMjtkaXJl
Y3RseSYjMzI7Y29ubmVjdGVkJiMzMjt0byYjMzI7dGhlJiMzMjtIRE1JJiMzMjtJUC4NCg0KSW4m
IzMyO01UODE3MywmIzMyO0RQSTAmIzMyO2lzJiMzMjtkaXJlY3RseSYjMzI7Y29ubmVjdGVkJiMz
Mjt0byYjMzI7SERNSS4NClRoZSYjMzI7Zmlyc3QmIzMyO3ZlcnNpb24mIzMyO29mJiMzMjt0aGlz
JiMzMjtkcml2ZXImIzMyO2lzJiMzMjtqdXN0JiMzMjtmb3ImIzMyO01UODE3MyYjMzI7RFBJMC4N
CkRvZXMmIzMyO01UODE3MyYjMzI7RFBJMCYjMzI7bmVlZCYjMzI7dGhpcyYjMzI7bW9kaWZpY2F0
aW9uJiM2MzsNCk9yJiMzMjt0aGlzJiMzMjttb2RpZmljYXRpb24mIzMyO2lzJiMzMjtqdXN0JiMz
Mjtmb3ImIzMyO01UODE4OCYjMzI7YW5kJiMzMjtNVDgxOTUsJiMzMjt0aGVuJiMzMjt0aGUmIzMy
O2Rlc2NyaXB0aW9uJiMzMjtzaG91bGQmIzMyO2JlJiMzMjttb3JlJiMzMjt0aGFuJiMzMjsmIzM5
O2RpcmVjdGx5JiMzMjtjb25uZWN0ZWQmIzM5Oy4NCg0KUmVnYXJkcywNCkNLDQoNCiZndDsmIzMy
Ow0KJmd0OyYjMzI7U2lnbmVkLW9mZi1ieTomIzMyO0FuZ2Vsb0dpb2FjY2hpbm8mIzMyO0RlbCYj
MzI7UmVnbm8mIzMyOyZsdDthbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20m
Z3Q7DQomZ3Q7JiMzMjstLS0NCg0KPC9wcmU+DQo8L3A+PC9ib2R5PjwvaHRtbD48IS0tdHlwZTp0
ZXh0LS0+PCEtLXstLT48cHJlPioqKioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5
IE5vdGljZSAqKioqKioqKioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBp
biB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVudHMpIG1heSBi
ZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4
ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRl
ZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBB
bnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmlu
ZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0YWNobWVudHMp
IGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1h
eSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2Yg
dGhpcyBlLW1haWwsIG9yIGJlbGlldmUgDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1t
YWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVseSAoYnkg
cmVwbHlpbmcgdG8gdGhpcyBlLW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9mIA0K
dGhpcyBlLW1haWwgKGluY2x1ZGluZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0ZW0s
IGFuZCBkbyBub3QNCmRpc2Nsb3NlIHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBv
dGhlciBwZXJzb24uIFRoYW5rIHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_003_830927392.1953817626--

