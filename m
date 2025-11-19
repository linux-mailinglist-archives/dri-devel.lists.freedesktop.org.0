Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58505C6CFFA
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 07:57:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2A9610E583;
	Wed, 19 Nov 2025 06:57:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="M+Jp/IzE";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="AS1ihXn8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DBDC10E583
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 06:57:36 +0000 (UTC)
X-UUID: 0516a004c51511f0b33aeb1e7f16c2b6-20251119
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=ktxGsMt0LbVaNWn1GsbC2oXi5j5fT1HKeWIWvJiR5VE=; 
 b=M+Jp/IzEMwvFcgbnGR+ssy3CCGvnG4k3DZrU3xXjJ2opee16QT6aBEGit/fqXVINi3EX3er01nxXvj7Fwk83rrAZmEnoCvLPqDvN5TOVLyNgG3YhXPUyc1ejcNQwnBHpgmFi/az0h3Y2qwueQLxMNH5HEsbF4HzXC8fX0HiZiO0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6, REQID:da6be641-16e3-4375-a06e-2118294404ba, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:a9d874c, CLOUDID:ce449a92-7fd3-4c6a-836a-51b0a70fa8fb,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
 TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
 C:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 0516a004c51511f0b33aeb1e7f16c2b6-20251119
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1167156065; Wed, 19 Nov 2025 14:57:31 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 19 Nov 2025 14:57:30 +0800
Received: from SI4PR04CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Wed, 19 Nov 2025 14:57:30 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oOIJ09s4XZh7fKtqr5EuJJ8qiKdPMRbqc3hOMmVp4ondvWsezjGTn5QK82NYzfN5iYN8tkm+lMMEe2ldO+cOaUi40rouHIuZHCucBN4z/WPwkSYgV/P5FITAokcn7wHVBsIlEYf7gckJJlWCO0nR1fhRp8lt5CObpk0NruGZpcNEm6ydnR9zT+YUQgz5R/nqxcybvjZaRdltWMv75lssA9pSYzjEBnOpY5lLFVpovXW27F7Ins1ZrD/DC0o9OQUp+JlsxgMNtfpkDAqF+HihXo4webhtLb+TRcgUTqjqi3N8vuMV8icEqgVS1Q5w1Ad4akrSrPwxEJ2/ind/hBMoJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=djY7wPz0x1h2ODGjLkYX2JFgC7HDKpHweDVeEz6gvNg=;
 b=UBZhi36DkjhJm6nZhiRyH9DF5C4oiwpXEu24W34hLfuApwh3OrUb/fEltrD/HDrCLH8McyuRZqpeqPem69wRNcXTwNE+Xv1FKWLXC50E7E4s2G9i1nvkvk/Rklzke8H8eA3RG4LHQrk0K+tVQ3aDQ7RmOc5p7txK/Vm2rVkqrxWi6Kvalipc7DuEAze3h3QbmIQXCx6OiWXeYxO/xU/Ts1oOwcRi2Ce3bKVn4+QQ9fcOTdnOpgMAq7ieyFpNl0LsqKwuO/woRfhU9aaSnM4ZZyA2raLyXrDqIkY4exusFkbtm4hRSZY7tiULbeD0qpYr8Tcw1wl9cUvkZG0zy7QZeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=djY7wPz0x1h2ODGjLkYX2JFgC7HDKpHweDVeEz6gvNg=;
 b=AS1ihXn83+K0IssODXJw8Z7yqJzuDCo9FzfXA1kDrY9WcyJAkLQgwW4cTkXsuiIl6twMFm8i8H3qqMuaODad1TzhiGGFhPKxSrDLHFUebm/rtmwyt3eCDH5JUb/HW2kgGJwIo3/mT5Ok9kCXU2n551ncoPJ8VrTSr7++oE2uhl8=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by KL1PR03MB7938.apcprd03.prod.outlook.com (2603:1096:820:f3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 06:57:27 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%5]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 06:57:26 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "zhang.enpei@zte.com.cn" <zhang.enpei@zte.com.cn>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: "simona@ffwll.ch" <simona@ffwll.ch>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] drm/mediatek: mtk_drm_drv: switch to use
 devm_kmemdup_array()
Thread-Topic: [PATCH] drm/mediatek: mtk_drm_drv: switch to use
 devm_kmemdup_array()
Thread-Index: AQHcEOtYO39If2Nv1Umjae7lPOksoLT6Ia8A
Date: Wed, 19 Nov 2025 06:57:26 +0000
Message-ID: <799c9d76cd847dbeed7e414e6504719d8da8bd06.camel@mediatek.com>
References: <20250819172526465q0DlaK4mMznBXD0SIjXKm@zte.com.cn>
In-Reply-To: <20250819172526465q0DlaK4mMznBXD0SIjXKm@zte.com.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|KL1PR03MB7938:EE_
x-ms-office365-filtering-correlation-id: 2e57c9e8-0e28-4386-26b8-08de2738e637
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|42112799006|366016|38070700021|7053199007;
x-microsoft-antispam-message-info: =?utf-8?B?ZmxUYTBkeVFheVFkV2RDMERzS2ZSWUZYWFdEd3d1MjRleUhpbmc4WFJTM0Rv?=
 =?utf-8?B?M2xiNkJuMXdsS2Mxd3EyWXdDcUd6eTQvcmlrV3psQUtaRnhSNEtIOGgxcVlG?=
 =?utf-8?B?Ri9wN21hSDdzQWg4UkxqQ0dMQ1V6SUIzeWhmcVp3OVJtUjQ3dGJEUi9WcGV3?=
 =?utf-8?B?bExtdEx3VjVYSlM4NnY4ejJVVzdJWlVDdDFsODdrWWw5cjd1REg4OWNYZlMx?=
 =?utf-8?B?L01paDRuMkpORjBCT1pHaTdDb2lqQzUvY3R1RlJ5dmRkZnVPaWZJRHltRE5X?=
 =?utf-8?B?VmwzUFh4MDhpcXVTOG11b1BpNFlBcFl3TmZlVUxaNmxpc25ONUtvaUZKdTZ5?=
 =?utf-8?B?NUYxYnMyQ3F5S2VjQjNKY2lMcnhGRXdaNTVMOXFzdjRJUEt0OCtpZDB4TkJu?=
 =?utf-8?B?Y1k1YmVQT1hLYXlwSitOREZOMzZlSmZFSktyc1ZEUnRHbDNwOHRQWTcvemJi?=
 =?utf-8?B?U3VySjgzaEUzSE1CcEZNNU8wVnNWZFZYUnY1dE9pOFlUbHFwOTR4YlFwQnVa?=
 =?utf-8?B?WHMvVXl0Ykx4dm1ueVJiVno0NjU0amdCT0l1QitrRzZ3cTN1enJWcjg3ZTkx?=
 =?utf-8?B?cTR3TmtwVUxKSk9wUGdhaXduUmFadnR0bjUrVGJDemVFNWdMTVVzV2xOdFFX?=
 =?utf-8?B?ZHcxbjdPa1R3QmkvK0o3WUE1RHJYd3JnMmNkd0UrNkZTYjlFMTJsRXFkYm5q?=
 =?utf-8?B?QmljMkFEWlQ1VkpVWDJrRS9nalVLdTllNW9wNm5xMFRPa3cvNHhXcVZpZklD?=
 =?utf-8?B?MnJ0bFQ3TS9vZTRNMS9NM2JmSkRZT2FDMUxXTU9oTHNCTGRvUmFlaHVJNzZS?=
 =?utf-8?B?WmlRUmV0RmtpeEpyVXFXWm1TNGhrU1JrZ0RpdkVVR0d2V0tSMnBQZTNBSFlX?=
 =?utf-8?B?UmpZZ3ZtQVJpT1dtdkpqQlltSVZ6cGp4b2M4SXkyTG9ETmVmUHg2amR0b3Rs?=
 =?utf-8?B?a2pzU0lxQnYyaExCb3dUUkZxV3NIeSt4NEgrbjhPNnBBRmthcUc3YVc3N3RU?=
 =?utf-8?B?OVMxZ091MU8rc2lDeStVWVQ5VDlnMHp2bUU5c2JEaGFmZ3dURHdNeFpsNzN6?=
 =?utf-8?B?bXg1MXpwb1ZPTVNrcXVSYUdUdmRXM3YrbzJvSzk5NEEyTlNUU0RtTTl6SVd2?=
 =?utf-8?B?U1VyTmVFR2h3Rm9NTVVyL1hxRmxnZ0I1dExSeVZGY0hLcHdZSnJTMnRhN0JC?=
 =?utf-8?B?QTNLYzUvU05sMXVhV3d2WWRhRmNPOC9DMzVGUWZxUVlMK1FZYXdaQVpBY1My?=
 =?utf-8?B?eVpWUjhiblRWWlFoSGVCM2VBUzJvZElpcHJQaFlrUkQ0cjIrVUtBYjhGZ25V?=
 =?utf-8?B?T1l1N1VTTG03MEg5OFhGckh2NFo0eGROK1ZwV3Z1bERiN2NrQUNmMXJoVGZn?=
 =?utf-8?B?ZCtiUHFWMWhVblZnT1FMVnAraHlRUjlMbnZZTWNpMjVXWHRVTG9Rdlc4enVy?=
 =?utf-8?B?dFZmeVh4N2FEMVdqRTdya3ExWWhEWFdUcW9sWHJBWndqdmxwS2RQS2RqL2Z1?=
 =?utf-8?B?a3VhL0ZVN0VlNmtwc3l2elJ4Y0Q2SEJUbnIwYktPOXJna3QrbEt3TDBNdm1W?=
 =?utf-8?B?M0RnVkN6R0ZHMFZnR0JzVmFwaDdPUmVSYU1mUGxkMTdxZnF4VG4vWVRlb0FF?=
 =?utf-8?B?SmUwZTNRdzY5SWpkY25JMEQrbGVLWk5lcUdYdmFkY3ZQM3dmd3dYVTRkUFlU?=
 =?utf-8?B?YThMK3MvaGYvWnRyaldDT0YrSlRnUzMvREt3L1VLTXYyT1VHME9hR096RlJ2?=
 =?utf-8?B?emRCZFZDSzU1amhnTDN6Z1cwUVZjZ2lDcWVhSjM4YW5VOEV5VUZ1cmRITFd6?=
 =?utf-8?B?T1VWMGtoNVhsYmMyT0FOMGVOR2dyUEs4a01OTUZyVUFIOWw0cVZjK3RoeUVU?=
 =?utf-8?B?elcyRW42ZmFVTk8yNWF2azlLcjNYNVFrVUtxQ1FWWXBOb2UzU0dGL1ZLWnov?=
 =?utf-8?B?OVRxUldMWFVOOXlBUzVvajYwL2lKV3pMNzRkVVR5M3BHVnhmSHBWdGt2a00r?=
 =?utf-8?B?VlJnYkZGVEJubVV5M0tMQmRzbXFaMUIwcEhib0ZZajhPdUMyaUVzUmpIY0V5?=
 =?utf-8?Q?se3Hhm?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(42112799006)(366016)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cEdaNmZtd3hqYk9rR1pYcktrNGhTYjQxVUdxT1liY0hvWWtJZ2xBbWswNVBJ?=
 =?utf-8?B?K1NyTitkZnhCSFdCL0hKMDIzVjZpVkdrd3pUcmR5YWk2bit3d2RoNUUrV0Jz?=
 =?utf-8?B?MVhTaFkrZVA4ekg2MDhVWHhjQUw1NWhNVkorZlRoKzFrWnNFQXNsdXdlSitl?=
 =?utf-8?B?ZUpJOEF3cjlRYkRkWXdWQWFmVmNpR0tJZ0tVb0N1ZnhjaGtHYml0VkNTbUNI?=
 =?utf-8?B?clFxQkx1V1RGdnFDVUE0aUdnc3E2V2VpY1BPSWo3UHdrckQybWxMRU5GczU4?=
 =?utf-8?B?dWFMbWJrdDVxRTZ3SGhlR3FMUmtzeVQ3NHA1M2kxZkdCZjBjb0VHQXRTMGg4?=
 =?utf-8?B?TnhzdWdkbURIU0RWNFg3M05BRmRmekNTSXFrK3dsQ1Avcmx0Z2lJeEVPRlpl?=
 =?utf-8?B?TlNhdStDL3BBQWs1R1h2ZndpcjdDZ0dHNG1MNDdiYkdrd2lueWdONUVGd0Zx?=
 =?utf-8?B?MWtRbkNwZjY5L01PWHRSblZSMTh2RUhzc0ZWajh2NUhyZ2lWZkRReFVuMVZB?=
 =?utf-8?B?bHpnaTg1M1l3SG1HM1NOS2EzOW5qQlE3Nk9oV0FVUEp0WjlEMnBtRkx5aE5M?=
 =?utf-8?B?b1UwRkc2aUljYU5FdnhxT0F3QUQwNFNHNTd5N0N0SUpMYStWWnRQaHVLWjVj?=
 =?utf-8?B?cEw2dEFzUmVsLzlnQjRiOUg2d2p0N2xVMTEwWXB2MXlSeVNnV3JNWEx0bzFN?=
 =?utf-8?B?Y3BmWkc2Zkw1b0UwSUt2K2RwT3J2RzJLNC84RzM0Qk1sRG5sdnhibjFFSlJu?=
 =?utf-8?B?NmRmVkFjNXVPMHVTL1BQQ1NpbTI1WURrM1RiTlBXZVBDaXo0TkNPNTZkMWRI?=
 =?utf-8?B?eHVXaWgzRVdlM2UxSnpKd0RyMWt1U1lGejUxVjd5NnlyZUVTU3FMWGNLd3NW?=
 =?utf-8?B?cW4vMTdJYmNyY05NbDlZd00vV0Y1RjJyQmFHVTZJamZ1N2lWOVFhRVhMT3Mw?=
 =?utf-8?B?M0orQnZ2aUU5d1hHeDBnaDYwTFowazd5QjhtQ3EvVjNCcUN4Tm1hQUptN1dz?=
 =?utf-8?B?bExBV1UvTlgrREtSMERoZmNwL0hubk5CYTdRZmR1THc4enVYVGZtUVowbkhu?=
 =?utf-8?B?WUt5Q0ZoTUxjSUE1K2ROMTM0TGp1eE5tZEMxOGhHTDcrdVVGdWwwOWlxaTJr?=
 =?utf-8?B?dWtyOGtROWxZSDRULytqYnJmckhPOUtOaTNtem1xczZ5UmxGdm5TMlppQ2E1?=
 =?utf-8?B?eFJVQnBaRmlpaVNUZGRWZFl4ZEtlU20rUEkyQ05IQXNORnhBcDNGempUNWpt?=
 =?utf-8?B?TWdwc0tuaGR0ZHNDYk5GZlVCRzJlbUloSnBwcTJYZGtQV3lqQjY1UXd5OEJm?=
 =?utf-8?B?WmVpYWZOVWVpS3JYUWNsek13OTNTYTFXQ3h4ODBDU0gySHNSUTBzVi9jTFM1?=
 =?utf-8?B?TjlaajdQdFRwL0JMRVVGMm9sSDlSYkF2YVNpdFdJL2grZ1Y0aG82a29vanZU?=
 =?utf-8?B?bjgvNXViTktuVWdxQ0E1TGZvK2pCUExqRUxjNWdYMzNtS01QR29SclhtWGda?=
 =?utf-8?B?TFdMSzk2S3pTKzVoUnBKVkFVUitiaTYySkdmNmVUUGxzdkhOWUwyNU5MQU8r?=
 =?utf-8?B?eE5yeEQwTlEvc2VaWjhPbUtTWXdMVC9KZy8rVFhMVzJhTFU5c0wxc1FyL2xm?=
 =?utf-8?B?dUpiK0lqZnRDT0djaVpicFNXTFRGNDdVTU1mWnhteHlBUlBDblEvWHRXL2hQ?=
 =?utf-8?B?ZHN1SHcyYldFc01uU1hUTWlJM3YyUzcybkY5VlArS3dERkxnMnhKS3J1aU5C?=
 =?utf-8?B?MW9XN1h5dkZZZWxYNk9YUkwyNm5UbW5aYlJoREczaUV5MkZZNFVYek1NeE9z?=
 =?utf-8?B?UGdSWWR6NjlQVHJoc0RTdGJmejl2L21OUjExOG1zL3dzODR1SHh1WmhMQkZi?=
 =?utf-8?B?S2tCQXFBQnZOMnJ0cVN4UGhQeVVBRzg1cWdnNVltOEJYNEpVejZoemwvaDht?=
 =?utf-8?B?aVNiZU5mSXc2ekRVM0hJWmVYYnczbSs5Zm0wTXQvRkFIS3BMcGcvTDBSc2ZZ?=
 =?utf-8?B?ZEZBbHpCU1BVcUxwWmp2d1RvV3VVbTIzVWRYb3NoL2Mxd3dXRTFmTytGenBB?=
 =?utf-8?B?WnIvaWgzU1JWZ0tkTUdPM3pjMWxjMXFCeDlONk9NVVdIM2R0T3N2dzVxdXFY?=
 =?utf-8?Q?VcwYs61rK4PsmM+/MupKFuPSb?=
Content-ID: <81F1195AE450B04F9937B59F4CCA650C@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e57c9e8-0e28-4386-26b8-08de2738e637
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2025 06:57:26.7032 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cSjE164Zm83/y3EZxillyW+KVOjYHJqdfnWh95yd/iPoqtyztx+4+U9rjE5Z52MWfLmeKnfpP7cUT9SDKQzAXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7938
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_006_799576073.351409237"
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

--__=_Part_Boundary_006_799576073.351409237
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDI1LTA4LTE5IGF0IDE3OjI1ICswODAwLCB6aGFuZy5lbnBlaUB6dGUuY29tLmNu
IHdyb3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Ig
b3BlbiBhdHRhY2htZW50cyB1bnRpbCB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiANCj4gDQo+IEZyb206IFpoYW5nIEVucGVpIDx6aGFuZy5lbnBlaUB6dGUu
Y29tLmNuPg0KPiANCj4gVXNlIGRldm1fa21lbWR1cF9hcnJheSgpIHRvIGF2b2lkIG11bHRpcGxp
Y2F0aW9uIG9yIHBvc3NpYmxlIG92ZXJmbG93cy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFpoYW5n
IEVucGVpIDx6aGFuZy5lbnBlaUB6dGUuY29tLmNuPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jIHwgMyArKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZHJtX2Rydi5jDQo+IGluZGV4IGQ1ZTZiYWIzNjQxNC4uZTcwMGMwZjBhM2EyIDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYw0KPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYw0KPiBAQCAtMTAwMyw3ICsxMDAz
LDggQEAgc3RhdGljIGludCBtdGtfZHJtX29mX2RkcF9wYXRoX2J1aWxkX29uZShzdHJ1Y3QgZGV2
aWNlICpkZXYsIGVudW0gbXRrX2NydGNfcGF0aA0KPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1F
SU5WQUw7DQo+ICAgICAgICAgfQ0KPiANCj4gLSAgICAgICBmaW5hbF9kZHBfcGF0aCA9IGRldm1f
a21lbWR1cChkZXYsIHRlbXBfcGF0aCwgaWR4ICogc2l6ZW9mKHRlbXBfcGF0aFswXSksIEdGUF9L
RVJORUwpOw0KPiArICAgICAgIGZpbmFsX2RkcF9wYXRoID0gZGV2bV9rbWVtZHVwX2FycmF5KGRl
diwgdGVtcF9wYXRoLCBpZHgsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgc2l6ZW9mKCp0ZW1wX3BhdGgpLCBHRlBfS0VSTkVMKTsNCg0KaWR4IGFuZCBzaXpl
b2YoKnRlbXBfcGF0aCkgYXJlIHNvIHNtYWxsLCBpdCdzIG5vdCBuZWNlc3NhcnkgdG8gd29ycnkg
b3ZlcmZsb3cuDQpkZXZtX2ttZW1kdXBfYXJyYXkoKSB3b3VsZCB1c2UgYnVpbHQtaW4gbXVsdGlw
bHksIGl0J3MgYWxzbyBhIG11bHRpcGxpY2F0aW9uLg0KDQpSZWdhcmRzLA0KQ0sNCg0KPiAgICAg
ICAgIGlmICghZmluYWxfZGRwX3BhdGgpDQo+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVOT01F
TTsNCj4gDQo+IC0tDQo+IDIuMjUuMQ0KDQo=

--__=_Part_Boundary_006_799576073.351409237
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1R1ZSwmIzMyOzIwMjUtMDgtMTkmIzMyO2F0
JiMzMjsxNzoyNSYjMzI7KzA4MDAsJiMzMjt6aGFuZy5lbnBlaUB6dGUuY29tLmNuJiMzMjt3cm90
ZToNCiZndDsmIzMyO0V4dGVybmFsJiMzMjtlbWFpbCYjMzI7OiYjMzI7UGxlYXNlJiMzMjtkbyYj
MzI7bm90JiMzMjtjbGljayYjMzI7bGlua3MmIzMyO29yJiMzMjtvcGVuJiMzMjthdHRhY2htZW50
cyYjMzI7dW50aWwmIzMyO3lvdSYjMzI7aGF2ZSYjMzI7dmVyaWZpZWQmIzMyO3RoZSYjMzI7c2Vu
ZGVyJiMzMjtvciYjMzI7dGhlJiMzMjtjb250ZW50Lg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjsNCiZn
dDsmIzMyO0Zyb206JiMzMjtaaGFuZyYjMzI7RW5wZWkmIzMyOyZsdDt6aGFuZy5lbnBlaUB6dGUu
Y29tLmNuJmd0Ow0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtVc2UmIzMyO2Rldm1fa21lbWR1cF9hcnJh
eSgpJiMzMjt0byYjMzI7YXZvaWQmIzMyO211bHRpcGxpY2F0aW9uJiMzMjtvciYjMzI7cG9zc2li
bGUmIzMyO292ZXJmbG93cy4NCiZndDsmIzMyOw0KJmd0OyYjMzI7U2lnbmVkLW9mZi1ieTomIzMy
O1poYW5nJiMzMjtFbnBlaSYjMzI7Jmx0O3poYW5nLmVucGVpQHp0ZS5jb20uY24mZ3Q7DQomZ3Q7
JiMzMjstLS0NCiZndDsmIzMyOyYjMzI7ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1f
ZHJ2LmMmIzMyO3wmIzMyOzMmIzMyOysrLQ0KJmd0OyYjMzI7JiMzMjsxJiMzMjtmaWxlJiMzMjtj
aGFuZ2VkLCYjMzI7MiYjMzI7aW5zZXJ0aW9ucygrKSwmIzMyOzEmIzMyO2RlbGV0aW9uKC0pDQom
Z3Q7JiMzMjsNCiZndDsmIzMyO2RpZmYmIzMyOy0tZ2l0JiMzMjthL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHJtX2Rydi5jJiMzMjtiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZHJtX2Rydi5jDQomZ3Q7JiMzMjtpbmRleCYjMzI7ZDVlNmJhYjM2NDE0Li5lNzAwYzBmMGEzYTIm
IzMyOzEwMDY0NA0KJmd0OyYjMzI7LS0tJiMzMjthL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZHJtX2Rydi5jDQomZ3Q7JiMzMjsrKysmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kcm1fZHJ2LmMNCiZndDsmIzMyO0BAJiMzMjstMTAwMyw3JiMzMjsrMTAwMyw4JiMzMjtA
QCYjMzI7c3RhdGljJiMzMjtpbnQmIzMyO210a19kcm1fb2ZfZGRwX3BhdGhfYnVpbGRfb25lKHN0
cnVjdCYjMzI7ZGV2aWNlJiMzMjsqZGV2LCYjMzI7ZW51bSYjMzI7bXRrX2NydGNfcGF0aA0KJmd0
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtyZXR1cm4mIzMyOy1FSU5WQUw7DQomZ3Q7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7fQ0KJmd0OyYjMzI7DQom
Z3Q7JiMzMjstJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtmaW5hbF9kZHBfcGF0
aCYjMzI7PSYjMzI7ZGV2bV9rbWVtZHVwKGRldiwmIzMyO3RlbXBfcGF0aCwmIzMyO2lkeCYjMzI7
KiYjMzI7c2l6ZW9mKHRlbXBfcGF0aFswXSksJiMzMjtHRlBfS0VSTkVMKTsNCiZndDsmIzMyOysm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO2ZpbmFsX2RkcF9wYXRoJiMzMjs9JiMz
MjtkZXZtX2ttZW1kdXBfYXJyYXkoZGV2LCYjMzI7dGVtcF9wYXRoLCYjMzI7aWR4LA0KJmd0OyYj
MzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7c2l6ZW9mKCp0
ZW1wX3BhdGgpLCYjMzI7R0ZQX0tFUk5FTCk7DQoNCmlkeCYjMzI7YW5kJiMzMjtzaXplb2YoKnRl
bXBfcGF0aCkmIzMyO2FyZSYjMzI7c28mIzMyO3NtYWxsLCYjMzI7aXQmIzM5O3MmIzMyO25vdCYj
MzI7bmVjZXNzYXJ5JiMzMjt0byYjMzI7d29ycnkmIzMyO292ZXJmbG93Lg0KZGV2bV9rbWVtZHVw
X2FycmF5KCkmIzMyO3dvdWxkJiMzMjt1c2UmIzMyO2J1aWx0LWluJiMzMjttdWx0aXBseSwmIzMy
O2l0JiMzOTtzJiMzMjthbHNvJiMzMjthJiMzMjttdWx0aXBsaWNhdGlvbi4NCg0KUmVnYXJkcywN
CkNLDQoNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtp
ZiYjMzI7KCFmaW5hbF9kZHBfcGF0aCkNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
cmV0dXJuJiMzMjstRU5PTUVNOw0KJmd0OyYjMzI7DQomZ3Q7JiMzMjstLQ0KJmd0OyYjMzI7Mi4y
NS4xDQoNCg0KPC9wcmU+DQo8L3A+PC9ib2R5PjwvaHRtbD48IS0tdHlwZTp0ZXh0LS0+PCEtLXst
LT48cHJlPioqKioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5vdGljZQ0KICoq
KioqKioqKioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1t
YWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVu
dGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20g
ZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0K
Y29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRp
c3NlbWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNvcHlp
bmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRl
bmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5s
YXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFp
bCwgb3IgYmVsaWV2ZQ0KIA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBl
cnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5n
IHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMgZS1t
YWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8g
bm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVy
c29uLiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_006_799576073.351409237--

