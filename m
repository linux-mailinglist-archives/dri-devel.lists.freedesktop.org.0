Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFFD993EBF
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 08:33:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CE0F10E461;
	Tue,  8 Oct 2024 06:33:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="qfIAAAYc";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="c3N3hET3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E762B10E461
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2024 06:33:36 +0000 (UTC)
X-UUID: 3d4a5cfc853f11ef8b96093e013ec31c-20241008
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=0QK64O3wJV8+kiS9tycNaXnVfI5HIUT7vWvU8hlmMm4=; 
 b=qfIAAAYcfB3VKQD+p7TyzDxhUiP9+gn7qsReM1VbTQ5osWULxWYXi89rhYH6muKDDgnRcQDLK2WVitqewdeRheqwJHj4Pmnko3qeP0j+ir2yAUC4a+4SthfSU1FO8xGnTxB8iIUXy7Ng+/1o06TeKuDnXro2iicSJvrgycNBgAs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41, REQID:95c404d0-c357-411e-bf30-8dd98dbdb211, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6dc6a47, CLOUDID:43b0e964-444a-4b47-a99a-591ade3b04b2,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
 l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 3d4a5cfc853f11ef8b96093e013ec31c-20241008
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1175461505; Tue, 08 Oct 2024 14:33:32 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 8 Oct 2024 14:33:31 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Tue, 8 Oct 2024 14:33:30 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VjvtbWO8HpELPKN1agShFiysDhssRz0Zbt8syjYS/7WiKkfSySIVWgnGZkAJVh+jlcoPvSs4e5ziThFDvzlinvwrfXWXXTD9OBc5iRcHamoKo6UM9Je3XeO8iAjKVLZWDQ/UQnYYi8SvbF32aVPzzn7oHxPM5wPJiTcEUAbfoJlTiYDPum3M2eh+Tk+93Q1Fvy5TYAimm9SVfaFN0ML+rPcyuaUCa0bre8gx2+e3OjJ+AB3bHzg+6ewx9t66a1VyOyPCeWrezL46Q8DYs/Cm6tA9c2xW20iPf5nbzuw1LpucDzVR8aK86yotZS6SIiKKANsC5Kju15Kja6ZuVwJilg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nl8uJNgtMitnPlnlSEIcfpPKUoUVhIhsDUoP4RMuaSI=;
 b=UTbITdwGbrcd0j4LblxQfNXYQAJoLwPD70lLcbRglBzszi0W7swIhLNTTQEGAFcN+wfFDbOqTU20EP1vu3RbLWNgLuplJdRGbjr0v1fMfm6jY1OM+QaaQRh1032+kBjrntYK5seYVxEPxEpqBAXUE8s3opM0y2XSe14HzlS/upQv3L6nBK7C7WW51wou7vSqSUUsVqQKG2qOttSzXKdwngISAJeYbrVpypKH8KzReoKS3NWnvTNjuD1E2YoAPYjdKpZMMDSrE4agMrrsmqU+FoGxsy+71XKGgtrWde1VaOOQ0UXt3xdFesHXvF5WbHGqunXaA7lF20LODgb8+waL+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nl8uJNgtMitnPlnlSEIcfpPKUoUVhIhsDUoP4RMuaSI=;
 b=c3N3hET3TpyLen6mfHwmuaRZhc7k+U0SZdjJv+jytzqJIXNGDIoaTeqyZTkhG1KJjmU1r38RxYDx/j2ys6vS2syuotDzKgDcmhbqgM7u9qalkDQg8/nG8G73qIttTGTC3MXyWs3EyGcib7jQAkAGXyyStPRrfBMoZTOh12p2BzI=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by TYZPR03MB7930.apcprd03.prod.outlook.com (2603:1096:400:465::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.22; Tue, 8 Oct
 2024 06:33:28 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%5]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 06:33:28 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "me@adamthiede.com" <me@adamthiede.com>, "yassine.oudjana@gmail.com"
 <yassine.oudjana@gmail.com>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "alpernebiyasak@gmail.com" <alpernebiyasak@gmail.com>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v9 1/5] drm/mediatek: ovl: Fix XRGB format breakage for
 blend_modes unsupported SoCs
Thread-Topic: [PATCH v9 1/5] drm/mediatek: ovl: Fix XRGB format breakage for
 blend_modes unsupported SoCs
Thread-Index: AQHbGIbKVGGlHXcoSEGwn045U0yDqbJ8ObuAgAAtLoA=
Date: Tue, 8 Oct 2024 06:33:27 +0000
Message-ID: <a233d738eb63634c6713c53c85ca63b8df3c3fe4.camel@mediatek.com>
References: <20241007070101.23263-1-jason-jh.lin@mediatek.com>
 <20241007070101.23263-2-jason-jh.lin@mediatek.com>
 <3b1c62caf4a80892071607ce944c151541a7c7d6.camel@mediatek.com>
In-Reply-To: <3b1c62caf4a80892071607ce944c151541a7c7d6.camel@mediatek.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|TYZPR03MB7930:EE_
x-ms-office365-filtering-correlation-id: cd243708-8dc5-498d-3eb5-08dce7631e87
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?cGVOa0VCNHIyK3FqdU1kMlhzMU4yREVxNUJRRDRlWHQxTUlhNnd6ZmU5WS8x?=
 =?utf-8?B?MWI0cUhxSnlLK1hscExhUFZQS0FxQmJhOWNmYzl1TlduWkhiQUNxMUFBM25a?=
 =?utf-8?B?VHFSdkUxRU9VQzVNRTd6YVpnbTZOUGlORi9WS29ScXB4ZFVHMU10U1ZpbDRl?=
 =?utf-8?B?OVZwRng1dW1JN0F1NFdoVktsaGZVdGx2RGYyc1hqTHlycDgwaHViSjNpSG40?=
 =?utf-8?B?QllyRVpiam56S1RuaUFid1hzeWdPQkhROHJNYmp2ZGh0Uzd1ZFZKZjFycFdW?=
 =?utf-8?B?bmNnSVhCTHF6bWc4RXZGNmx6SGFmWmFEdWt6MjlONGNlTU91S096cXFOYVl4?=
 =?utf-8?B?L2dhMkJqUE1aMjRiU29zQUoxY3NoNmlsbEgxQUtrMWxmQ215d3hiMVB5UTBU?=
 =?utf-8?B?T1ZsRDJteE9aazdiekpNNmUzdXVmeStwWmFtajJZUnZuOFZjZ3JMaEtHWVdF?=
 =?utf-8?B?VkVzc1dESVUwbG5MM0ZVNFc1UmZkcDFBeFV5cnExVXA2VHkyelBqcmZMUWFs?=
 =?utf-8?B?Qzl6OEN6TVlTQkFxU2hub2V4OVZ1blQ2T2JCNWViVVhkWUxJZ2lZa20rNTZZ?=
 =?utf-8?B?aVF0RnlFNjFmeFJKRC9tRldHZU5GT0E2MUYrUlVRNjJVTHdQZUdmTDhOQWR4?=
 =?utf-8?B?a29VbXpRRHdMREdzOSsxV0krekhtaDdmWXFhTHhiQkluOVdtMHVGZzVjcFFS?=
 =?utf-8?B?c3pqYnFwUEs2c0hnSExQQWJxSmhFM1Q4RWRvYWxIR1hKTkNXK2V1OFg0alJJ?=
 =?utf-8?B?TWVERmNmQXhiSGsvS0hRU3RsVjA4TzFpVXdScVIrR0FRL09LSWdIa1Z3ODlO?=
 =?utf-8?B?V3A1dVB6VXJaRUdHQnBGczQ4NFhXdjk1NDFZbXVkN1hWN3BTbDVtNEt3L1Rw?=
 =?utf-8?B?SDF5QkVqeVNyZ1VVeEYzalRoNnZkclZ6M1UyaFJNMm0yN3lsZU9lRVZ0U2Zo?=
 =?utf-8?B?OXZrUnp5cGkzOS94MkVaVTYrU0FBT2h1bmNXNlJDTGpVdmdiTC84eGdGS3BZ?=
 =?utf-8?B?dXQ5STAwajZHV1J2c0xsN2RRUjRJcnc5akYvSjJoZlBlWlFQNVhzMGtqUGpS?=
 =?utf-8?B?WC9ucjBLTDB4QnhrWW1qSHA3Tm51alM2V2JLZmZCQWVaSmx1Z3d0ejVBS2gw?=
 =?utf-8?B?U2VNMU8zWU1nTk1uUTFRa29tVmhTRnNCU1o3ZVZQejQ1dis5SXc1TUZkVEIw?=
 =?utf-8?B?Z3VZM0FyTldCR0xuUTkwVVk3MnVqOHNUTWdMUUxZQjRYWGJ0WllNT0JNTlNI?=
 =?utf-8?B?d0Jmdlc4U0NIbkhtTkR0alVSbmdXeXBBNFJndHAxcWhyb1ZtV0x3ei9hWVRY?=
 =?utf-8?B?dmxpZ3lkVXRHMEdCeEdrL3E5RHF4MjF3Rit5cUc2MndwaXNOVmxlQzZaMUJv?=
 =?utf-8?B?bnhleEpsUmlESW1lSmI1NnlnOTU2RG04YnZ4RzUrRWpYbm10czUzQXJCRitZ?=
 =?utf-8?B?TXhEOHBFWkRCQ2gyTFVEZjBaRUtsL2dTa01xQnoyZkIzVi9LVGxmV1U1M0F1?=
 =?utf-8?B?R0o5MWhyVzcvK0JpcjFDcVlpZUFKNllzeWt3dVpMZVFEdmZiWndMZFhpMllL?=
 =?utf-8?B?WXZJbktkUnFkOVhiVGVJckF5MHdFSHNtZ29vNms3Mmo2cXFMY0ZJcjN3RHRq?=
 =?utf-8?B?ZFRJZ3VibWRORDl0a1ZCeENQcTV2cDEyKzlxSFN2R0l5Rm5LQXNQK1JvYlo5?=
 =?utf-8?B?L0xJVDBUQTRReUlYUnMzTXlyVDd6djkvWWM5a3hwM0FIRVB5YnZwLzl1OGZF?=
 =?utf-8?B?MXQ4VHpabTFpR3ZzME44TE15Z0FSRHRYajd1encra0cvRVdOYWZweXJYc2VU?=
 =?utf-8?B?R3c1REVzZ3FxQ0ZoczU0Zz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UDJhVk12RUdNQURwaFl1ckRSM2lUcmlNUk1CVTlYUmF2ZGJpVHgzWHVCSXU1?=
 =?utf-8?B?RktPV2Rqa1loVUV0L0lGTkJQeEVMZGJlQndYWldEdno1cFpid1VqS0hTanBR?=
 =?utf-8?B?VG9QUmoyVStuUGhTNmo1eVhTU2FPQlRzbHpRWmtMYUlwaHhOWkE2V0JWcTF5?=
 =?utf-8?B?aHpGUzMydHliRDZPRDNaZkdsZnVJK3dtcENHaGlKN0xPWFI3MTNxT1grR0tu?=
 =?utf-8?B?cmJYQ1kxVFNBVlNxT3h2K3U0QzVTb1NicHNCanhGSFNJaTdsbW5uaUxVcDB2?=
 =?utf-8?B?UlhUWk8vZmtCbk5nR3F0akZDcVZDZnYvQ1VsWlNYeEl6Y1ZkY2NuN29COUdK?=
 =?utf-8?B?N0pMWjRVbi94S2hIL3N6eHdLbTBkKzVpdWVxaHllSzAyZ3UxS1JIcGU2bkl2?=
 =?utf-8?B?eHM1SmlzR2tJTzdpcVI3MDNqeXBWS1JudEVRcGFYd0p2OUFHWHhvMW1ocUt5?=
 =?utf-8?B?eWl4bGNmbE5WNEZ4a1E5Z3JIZGV1Y0lEcllFREhQNkVlMG54MVdIVVMwdDha?=
 =?utf-8?B?SzBpdlBPWW1teFgrNUc3aCsra1NrRENSMU40bkREaWpaSXVxRUJFemhualVS?=
 =?utf-8?B?M1VmT3ZMd2NGWmJ0NVdFLytLZ2M5MXQ5SllPSnZLR2lTcVdRdXhTTEVuNEgv?=
 =?utf-8?B?aXExZGFMbkVNMTdNd2ZTSzFBa1ZlTExzdEs3NmdJWVdVaEwrV0lWaXBpZFBH?=
 =?utf-8?B?Q0lBenZrdXVqR2YwTUxLYXhaN0VDNkpkNCtxMGI0c2lVdVM1R0J6SlNVTTI5?=
 =?utf-8?B?cGw4S0lpM0J2YUNlRk14MXordDRVRTZnNSs0NG9jYTBxclNKM2FsVEhRVTBt?=
 =?utf-8?B?SWlWZ0lrUVg1dnp2WEpnc2NWUlAxWFVVNFZGMWlUSzArODlCZExRT0p0T0lG?=
 =?utf-8?B?YVBQMzZEOGVveEc1Mm1xNmJvcGM4dTJ6YmVVZ0Q1dzNhRGUza2VBcFJiL1o0?=
 =?utf-8?B?eVJqTDJMWGE4aXdoR0x6RjI4aVBqaGRaU04vbjhJSnB2K0wyczJINWxNbE5m?=
 =?utf-8?B?a1BsbVpXR2wwSldVK0NVUTUyQnlvakQ5WDlwQmVza1JUR1ExeG5ab0t1Vm41?=
 =?utf-8?B?KzFIc1A0QUw1dHQ3eUVCa3pjYmZlSS9jb2FDQ09DTmMvS0VybVYwWjVFQWtB?=
 =?utf-8?B?cDc3ZzF6MDFuZnN2WkVtQlJ3dXNpcG0xV0N2eGJQWVlFRXNGUEh0aWo0Sy9h?=
 =?utf-8?B?U2VMZ0liZkd5WlBRQjJwdTBjYXZmQk4wdDJpdkE1bm5GYWY4Mis4bG1vRGRQ?=
 =?utf-8?B?UHFLYWcya1NMSW9yVStSUGlCd21YUHJ0bzlkRjB2cjJMVWl6U3E3SFYzZnV5?=
 =?utf-8?B?TEFMK1FsQzQzTFFzSThVKzI1VWU0T1VkS1pzWGhhZS9zUEJSbFFpSlM0Q2lj?=
 =?utf-8?B?eXg4N0s2QS96aGRyOHJTU3hWdGE3NnBhVjNJcHRYbm1FN1BVdmgvNjUvTW5S?=
 =?utf-8?B?RW8xQ1QvVGpPcG9GUXE1Wm1VdVZqUURPeDRiRkI1OG41S1JIMUN0dTc5akFL?=
 =?utf-8?B?RlZ5YVVud1JPVDJ4VmZyTHRpM011OGtiS3lRcjlYUkkwMTI0RHJwRXZZMFNS?=
 =?utf-8?B?d3d2cEFCYzAySmlKOHVDL1ZMb0dTR05JU1d2bWt0bGRBWGw3UG1Wb3lQeUhV?=
 =?utf-8?B?RDVZSjFlaElLL3JlT29mNkxuUTlhcGhvTFZkOXZmSUkreEt5SEZSUHBzOCtr?=
 =?utf-8?B?RmJxQkViYzJOeWdXVDhFV3hFeThPTUNObjdROFZ1TmNuaEtZaHJKZFJLWWxU?=
 =?utf-8?B?WXRCWWoxNTVnSW40V1FQemp2VXExVlo2dmppeDl6a2JSK0wwTFNkM0lCdDdN?=
 =?utf-8?B?K1EzeDVkN0RwTnpkanZyMVpnRjRVTmJJcG9oLzlJaUJ2YWZsd0hzVGpWS1d2?=
 =?utf-8?B?ZExIWE5aV2ZsbVBCN0M1TUJVTHpsWmRGVExVVVByM25GUm5oaG15dFNSWHNH?=
 =?utf-8?B?NFM4K0w5SUNncnNHaFovaUVOaU44b2VOb29UdlRVQzFCdXVZVjkwNkFCM25O?=
 =?utf-8?B?c3hYRkJheENvTzFuTW1nZVVYQnRUK21FaVk5RllCTlZ2a2dqMExkS1FKL2VL?=
 =?utf-8?B?V04vYUZUSEZ5dTlwZGg3cU1DVGV5ZGxsR00rdXVUdzhpVlk1Q3RULzArYWpk?=
 =?utf-8?B?TkJTSjRoOG81bXJ6QW1YbUhISERqTWJmN0x5bzAzVnRXa0ErTHkwYkZaV1E5?=
 =?utf-8?B?YUE9PQ==?=
Content-ID: <A38E2CB87E2C374A96D68762141E9B8B@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd243708-8dc5-498d-3eb5-08dce7631e87
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2024 06:33:27.9366 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3GMchm6jzsfMqkb1z9xF3cpQ3dECpvDs/cuwRa6/0yrY7xEDTAqHhQA/Vl3+7I9iCd4dW8Bxdfg8gGcBQjfLRXsft2oS4AI2xcdRKAYpLXA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7930
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--16.057500-8.000000
X-TMASE-MatchedRID: cgbqQT5W8hcOwH4pD14DsPHkpkyUphL9GZjaqakC/Mae9toQ6h6LE5A4
 r6aTBvsBL14PG/qYSRbSUTNHkVpRQJYeam+R4okH7spMO3HwKCC+1Vx7rDn4r7v408/GP5Hqrgw
 TGulO+mIB9IbMv3Mjderz9kkRKpaJWbvYSwAXzZAD2WXLXdz+Abn7V+KB+3cumyiLZetSf8n5kv
 mj69FXvAOkBnb8H8GWjaPj0W1qn0SQZS2ujCtcuA==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--16.057500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: F2B53F34A68D5901BBE019A70F8158ECF43D65C1C3A31015ADA1576604D30B582000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_006_249485795.1143234701"
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

--__=_Part_Boundary_006_249485795.1143234701
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDI0LTEwLTA4IGF0IDAzOjUxICswMDAwLCBDSyBIdSAo6IOh5L+K5YWJKSB3cm90
ZToNCj4gSGksIEphc29uOg0KPiANCj4gT24gTW9uLCAyMDI0LTEwLTA3IGF0IDE1OjAwICswODAw
LCBKYXNvbi1KSC5MaW4gd3JvdGU6DQo+ID4gSWYgdGhlIGNvbnN0YW50IGFscGhhIGFsd2F5cyBl
bmFibGUsIHRoZSBTb0NzIHRoYXQgaXMgbm90IHN1cHBvcnRlZA0KPiA+IHRoZQ0KPiA+IGlnbm9y
ZSBwaXhlbCBhbHBoYSBiaXQgd2lsbCBzdGlsbCB1c2UgY29uc3RhbnQgYWxwaGEuIFRoYXQgd2ls
bA0KPiA+IGJyZWFrDQo+ID4gdGhlIG9yaWdpbmFsIGNvbnN0YW50IGFscGhhIHNldHRpbmcgb2Yg
WFJHQiBmb3JhbXQgZm9yIGJsZW5kX21vZGVzDQo+ID4gdW5zdXBwb3J0ZWQgU29Dcywgc3VjaCBh
cyBNVDgxNzMuDQo+ID4gDQo+ID4gTm90ZSB0aGF0IGlnbm9yZSBwaXhlbCBhbHBoYSBiaXQgaXMg
c3VwcG9yZWQgaWYgdGhlIFNvQyBzdXBwb3J0IHRoZQ0KPiA+IGJsZW5kX21vZGVzLg0KPiA+IE1h
a2UgdGhlIGNvbnN0YXRudCBhbHBoYSBvbmx5IGVuYWJsZSB3aGVuIGhhdmluZyBhIHZsaWFkIGJs
ZW5kX21vZGUNCj4gPiBvcg0KPiA+IHNldHRpbmcgdGhlIGhhc19hbHBoYSB0byBmaXggdGhlIGRv
d25ncmFkZSBpc3N1ZS4NCj4gDQo+IEl0J3MgYWxwaGEgYmxlbmRpbmcgZW5hYmxlLCBub3QgY29u
c3RhbnQgYWxwaGEgZW5hYmxlLg0KDQpPSywgSSdsbCBjb3JyZWN0IHRoZSBjb21taXQgbWVzc2Fn
ZS4NCg0KPiANCj4gPiANCj4gPiBGaXhlczogYmM0NmViNWQ1ZDc3ICgiZHJtL21lZGlhdGVrOiBT
dXBwb3J0IERSTSBwbGFuZSBhbHBoYSBpbg0KPiA+IE9WTCIpDQo+ID4gU2lnbmVkLW9mZi1ieTog
SmFzb24tSkguTGluIDxqYXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+ICBk
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMgfCA4ICsrKysrKystDQo+ID4g
IDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPiANCj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jDQo+
ID4gYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMNCj4gPiBpbmRleCA4
OWI0MzlkY2YzYTYuLjg0NTNhNzJmOWU1OSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMNCj4gPiBAQCAtNDczLDggKzQ3MywxNCBAQCB2b2lkIG10a19v
dmxfbGF5ZXJfY29uZmlnKHN0cnVjdCBkZXZpY2UgKmRldiwNCj4gPiB1bnNpZ25lZCBpbnQgaWR4
LA0KPiA+ICANCj4gPiAgCWNvbiA9IG92bF9mbXRfY29udmVydChvdmwsIGZtdCwgYmxlbmRfbW9k
ZSk7DQo+ID4gIAlpZiAoc3RhdGUtPmJhc2UuZmIpIHsNCj4gPiAtCQljb24gfD0gT1ZMX0NPTl9B
RU47DQo+ID4gIAkJY29uIHw9IHN0YXRlLT5iYXNlLmFscGhhICYgT1ZMX0NPTl9BTFBIQTsNCj4g
PiArDQo+ID4gKwkJLyoNCj4gPiArCQkgKiBGb3IgYmxlbmRfbW9kZXMgc3VwcG9ydGVkIFNvQ3Ms
IGFsd2F5cyBlbmFibGUNCj4gPiBjb25zdGFudCBhbHBoYS4NCj4gPiArCQkgKiBGb3IgYmxlbmRf
bW9kZXMgdW5zdXBwb3J0ZWQgU29DcywgZW5hYmxlIGNvbnN0YW50DQo+ID4gYWxwaGEgd2hlbiBo
YXNfYWxwaGEgaXMgc2V0Lg0KPiANCj4gSXQncyBhbHBoYSBibGVuZGluZyBlbmFibGUsIG5vdCBj
b25zdGFudCBhbHBoYSBlbmFibGUuDQo+IA0KT0ssIEknbGwgY29ycmVjdCB0aGUgY29tbWVudC4N
Cg0KUmVnYXJkcywNCkphc29uLUpILkxpbg0KDQo+IFJlZ2FyZHMsDQo+IENLDQo=

--__=_Part_Boundary_006_249485795.1143234701
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1R1ZSwmIzMyOzIwMjQtMTAtMDgmIzMyO2F0
JiMzMjswMzo1MSYjMzI7KzAwMDAsJiMzMjtDSyYjMzI7SHUmIzMyOygmIzMyOTkzOyYjMjA0MjY7
JiMyMDgwOTspJiMzMjt3cm90ZToNCiZndDsmIzMyO0hpLCYjMzI7SmFzb246DQomZ3Q7JiMzMjsN
CiZndDsmIzMyO09uJiMzMjtNb24sJiMzMjsyMDI0LTEwLTA3JiMzMjthdCYjMzI7MTU6MDAmIzMy
OyswODAwLCYjMzI7SmFzb24tSkguTGluJiMzMjt3cm90ZToNCiZndDsmIzMyOyZndDsmIzMyO0lm
JiMzMjt0aGUmIzMyO2NvbnN0YW50JiMzMjthbHBoYSYjMzI7YWx3YXlzJiMzMjtlbmFibGUsJiMz
Mjt0aGUmIzMyO1NvQ3MmIzMyO3RoYXQmIzMyO2lzJiMzMjtub3QmIzMyO3N1cHBvcnRlZA0KJmd0
OyYjMzI7Jmd0OyYjMzI7dGhlDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtpZ25vcmUmIzMyO3BpeGVsJiMz
MjthbHBoYSYjMzI7Yml0JiMzMjt3aWxsJiMzMjtzdGlsbCYjMzI7dXNlJiMzMjtjb25zdGFudCYj
MzI7YWxwaGEuJiMzMjtUaGF0JiMzMjt3aWxsDQomZ3Q7JiMzMjsmZ3Q7JiMzMjticmVhaw0KJmd0
OyYjMzI7Jmd0OyYjMzI7dGhlJiMzMjtvcmlnaW5hbCYjMzI7Y29uc3RhbnQmIzMyO2FscGhhJiMz
MjtzZXR0aW5nJiMzMjtvZiYjMzI7WFJHQiYjMzI7Zm9yYW10JiMzMjtmb3ImIzMyO2JsZW5kX21v
ZGVzDQomZ3Q7JiMzMjsmZ3Q7JiMzMjt1bnN1cHBvcnRlZCYjMzI7U29DcywmIzMyO3N1Y2gmIzMy
O2FzJiMzMjtNVDgxNzMuDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyO05v
dGUmIzMyO3RoYXQmIzMyO2lnbm9yZSYjMzI7cGl4ZWwmIzMyO2FscGhhJiMzMjtiaXQmIzMyO2lz
JiMzMjtzdXBwb3JlZCYjMzI7aWYmIzMyO3RoZSYjMzI7U29DJiMzMjtzdXBwb3J0JiMzMjt0aGUN
CiZndDsmIzMyOyZndDsmIzMyO2JsZW5kX21vZGVzLg0KJmd0OyYjMzI7Jmd0OyYjMzI7TWFrZSYj
MzI7dGhlJiMzMjtjb25zdGF0bnQmIzMyO2FscGhhJiMzMjtvbmx5JiMzMjtlbmFibGUmIzMyO3do
ZW4mIzMyO2hhdmluZyYjMzI7YSYjMzI7dmxpYWQmIzMyO2JsZW5kX21vZGUNCiZndDsmIzMyOyZn
dDsmIzMyO29yDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtzZXR0aW5nJiMzMjt0aGUmIzMyO2hhc19hbHBo
YSYjMzI7dG8mIzMyO2ZpeCYjMzI7dGhlJiMzMjtkb3duZ3JhZGUmIzMyO2lzc3VlLg0KJmd0OyYj
MzI7DQomZ3Q7JiMzMjtJdCYjMzk7cyYjMzI7YWxwaGEmIzMyO2JsZW5kaW5nJiMzMjtlbmFibGUs
JiMzMjtub3QmIzMyO2NvbnN0YW50JiMzMjthbHBoYSYjMzI7ZW5hYmxlLg0KDQpPSywmIzMyO0km
IzM5O2xsJiMzMjtjb3JyZWN0JiMzMjt0aGUmIzMyO2NvbW1pdCYjMzI7bWVzc2FnZS4NCg0KJmd0
OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyO0ZpeGVzOiYjMzI7
YmM0NmViNWQ1ZDc3JiMzMjsoJnF1b3Q7ZHJtL21lZGlhdGVrOiYjMzI7U3VwcG9ydCYjMzI7RFJN
JiMzMjtwbGFuZSYjMzI7YWxwaGEmIzMyO2luDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtPVkwmcXVvdDsp
DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtTaWduZWQtb2ZmLWJ5OiYjMzI7SmFzb24tSkguTGluJiMzMjsm
bHQ7amFzb24tamgubGluQG1lZGlhdGVrLmNvbSZndDsNCiZndDsmIzMyOyZndDsmIzMyOy0tLQ0K
Jmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjtkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bf
b3ZsLmMmIzMyO3wmIzMyOzgmIzMyOysrKysrKystDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzMyOzEm
IzMyO2ZpbGUmIzMyO2NoYW5nZWQsJiMzMjs3JiMzMjtpbnNlcnRpb25zKCspLCYjMzI7MSYjMzI7
ZGVsZXRpb24oLSkNCiZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7ZGlmZiYj
MzI7LS1naXQmIzMyO2EvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jDQom
Z3Q7JiMzMjsmZ3Q7JiMzMjtiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwu
Yw0KJmd0OyYjMzI7Jmd0OyYjMzI7aW5kZXgmIzMyOzg5YjQzOWRjZjNhNi4uODQ1M2E3MmY5ZTU5
JiMzMjsxMDA2NDQNCiZndDsmIzMyOyZndDsmIzMyOy0tLSYjMzI7YS9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMNCiZndDsmIzMyOyZndDsmIzMyOysrKyYjMzI7Yi9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMNCiZndDsmIzMyOyZndDsmIzMyO0BA
JiMzMjstNDczLDgmIzMyOys0NzMsMTQmIzMyO0BAJiMzMjt2b2lkJiMzMjttdGtfb3ZsX2xheWVy
X2NvbmZpZyhzdHJ1Y3QmIzMyO2RldmljZSYjMzI7KmRldiwNCiZndDsmIzMyOyZndDsmIzMyO3Vu
c2lnbmVkJiMzMjtpbnQmIzMyO2lkeCwNCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7DQomZ3Q7JiMz
MjsmZ3Q7JiMzMjsmIzMyO2NvbiYjMzI7PSYjMzI7b3ZsX2ZtdF9jb252ZXJ0KG92bCwmIzMyO2Zt
dCwmIzMyO2JsZW5kX21vZGUpOw0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjtpZiYjMzI7KHN0YXRl
LSZndDtiYXNlLmZiKSYjMzI7ew0KJmd0OyYjMzI7Jmd0OyYjMzI7LWNvbiYjMzI7fD0mIzMyO09W
TF9DT05fQUVOOw0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjtjb24mIzMyO3w9JiMzMjtzdGF0ZS0m
Z3Q7YmFzZS5hbHBoYSYjMzI7JmFtcDsmIzMyO09WTF9DT05fQUxQSEE7DQomZ3Q7JiMzMjsmZ3Q7
JiMzMjsrDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrLyoNCiZndDsmIzMyOyZndDsmIzMyOysmIzMyOyom
IzMyO0ZvciYjMzI7YmxlbmRfbW9kZXMmIzMyO3N1cHBvcnRlZCYjMzI7U29DcywmIzMyO2Fsd2F5
cyYjMzI7ZW5hYmxlDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtjb25zdGFudCYjMzI7YWxwaGEuDQomZ3Q7
JiMzMjsmZ3Q7JiMzMjsrJiMzMjsqJiMzMjtGb3ImIzMyO2JsZW5kX21vZGVzJiMzMjt1bnN1cHBv
cnRlZCYjMzI7U29DcywmIzMyO2VuYWJsZSYjMzI7Y29uc3RhbnQNCiZndDsmIzMyOyZndDsmIzMy
O2FscGhhJiMzMjt3aGVuJiMzMjtoYXNfYWxwaGEmIzMyO2lzJiMzMjtzZXQuDQomZ3Q7JiMzMjsN
CiZndDsmIzMyO0l0JiMzOTtzJiMzMjthbHBoYSYjMzI7YmxlbmRpbmcmIzMyO2VuYWJsZSwmIzMy
O25vdCYjMzI7Y29uc3RhbnQmIzMyO2FscGhhJiMzMjtlbmFibGUuDQomZ3Q7JiMzMjsNCk9LLCYj
MzI7SSYjMzk7bGwmIzMyO2NvcnJlY3QmIzMyO3RoZSYjMzI7Y29tbWVudC4NCg0KUmVnYXJkcywN
Ckphc29uLUpILkxpbg0KDQomZ3Q7JiMzMjtSZWdhcmRzLA0KJmd0OyYjMzI7Q0sNCg0KPC9wcmU+
DQo8L3A+PC9ib2R5PjwvaHRtbD48IS0tdHlwZTp0ZXh0LS0+PCEtLXstLT48cHJlPioqKioqKioq
KioqKiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5vdGljZSAqKioqKioqKioqKioqKioqKioq
Kg0KVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNs
dWRpbmcgYW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5
LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIg
YXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8g
dGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRp
c3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWls
IChpbmNsdWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMp
IGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJl
IG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWwsIG9yIGJlbGlldmUgDQp0
aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5
IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1haWwpLCBk
ZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9mIA0KdGhpcyBlLW1haWwgKGluY2x1ZGluZyBhbnkg
YXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBub3QNCmRpc2Nsb3NlIHRoZSBj
b250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24uIFRoYW5rIHlvdSENCjwv
cHJlPjwhLS19LS0+

--__=_Part_Boundary_006_249485795.1143234701--

