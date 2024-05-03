Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3131F8BA6BE
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 07:53:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7941410E89C;
	Fri,  3 May 2024 05:53:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="vHoy67tN";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="RgAWSt+8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C8E910E89C
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 05:53:08 +0000 (UTC)
X-UUID: 66b0e5e8091111ef8065b7b53f7091ad-20240503
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=3LL2q5IngB4PFj9O2F347LxgNlHpbPq2vtf6yw/FO6o=; 
 b=vHoy67tNFJZls5JWt4LDL2rPrSWRhYC6DHlNwQRXOzoILMNJD0cwVopicza9HE28mUHYRebUrvs9625MenDAiW+vZ+a3AhEHnHLht9xGlMX+NUUL1VTQu0Ec0I5TKDAN/b3VQTWAxaN2rXQuXM11UbwPb2LtTWtqtr1b6GjRNYM=;
X-CID-CACHE: Type:Local,Time:202405031329+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38, REQID:16318fe7-2f38-4272-9760-743750f90951, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:82c5f88, CLOUDID:87cea2fb-ed05-4274-9204-014369d201e8,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 66b0e5e8091111ef8065b7b53f7091ad-20240503
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 89930401; Fri, 03 May 2024 13:53:01 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 3 May 2024 13:52:59 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Fri, 3 May 2024 13:52:59 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ccWemLFqV31lLzOLwENa+dWsfHfJJFlNMt0YrtWFT9vHAXXx8z5vheD37VkQLAhw9JePsMgUB612VnI5Z3BvD01Wf4ZcYlkzYBUk+ktAnkN7+kOvTr8IED/hERwzS96MVKzU731BDFoxM2n9T+e645q4iLdq3jt/SHTnVh1LXlO8Wc4SAetFPOKQ7yBbAfaEC4ZJFRKFUk+HozAnhPMD15IHT7e2xkG5b0hy4LC1cUD97mn2U0u0zgrk7KgEsj52kYXDADCkXWmxTOgkH3qYyTSBgWhmIAp80MrDpdIPYXi0OMpa69IFa8w8vnws73g1z1ZergfKXPmqYCq0jVLwZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o7j/p6r/qTaAOXNwmIJBeCC6/8BlOGBMouBK4dxZic8=;
 b=b45BNV0/u82nCMgz08wTdh446kQ36DYOxRpVoOpD/d/FHur8pPOXr66UJ+9eEgglePP4RpNdVtMaOmyfdrtbRwG9F8vqGQzY3RZ9qnYSiTiLhhoJ2nVWSQVcZiDHIMXGPhm4kX9MN/82mJ486kL64dPlr9ULxp3TVYM95W4frswZtPR7jKjon6COh7fCF9nREDoHHZQ4qm9XBKxUPa8adNVGzlxfMdxjLNLNJ2OPG5+MF6n6MHP/glcFNjev+bYcH6x/100IYGhbE9wvFUBpNqvX1bcW15ChY777XjpTpik8pGVfCaVe8OuPtq8XatTgkUjJFy5Ktw6HhEy4kUVahw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o7j/p6r/qTaAOXNwmIJBeCC6/8BlOGBMouBK4dxZic8=;
 b=RgAWSt+8Fh3HA7PA6G3X0l6HF/AKPABpMz5u3R1VGf42Fkh860EjMg6rsQorHbbB9HsHI+OrD968XwtrmdFQEm3zbGviSA+NT6J8DeVXiI5JKx08g6vjGBDJ4dSfo9Qy/Sb8iwB7LjO/yzYAfYN38OzggUJ9nw+gUvWcSQ2ii8U=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by PUZPR03MB7255.apcprd03.prod.outlook.com (2603:1096:301:101::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.30; Fri, 3 May
 2024 05:52:57 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.7544.029; Fri, 3 May 2024
 05:52:57 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?utf-8?B?QmliYnkgSHNpZWggKOisnea/n+mBoCk=?= <Bibby.Hsieh@mediatek.com>,
 "jason-ch.chen@mediatek.corp-partner.google.com"
 <jason-ch.chen@mediatek.corp-partner.google.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "airlied@gmail.com" <airlied@gmail.com>,
 "sean@poorly.run" <sean@poorly.run>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v7 09/18] drm/mediatek: Support constant blending in OVL
Thread-Topic: [PATCH v7 09/18] drm/mediatek: Support constant blending in OVL
Thread-Index: AQHanH0LihYW7HR1qEKfMRscOmQkPrGFA1AA
Date: Fri, 3 May 2024 05:52:57 +0000
Message-ID: <06beb8100dae4f60cf35e30050a7a7fff11c29ca.camel@mediatek.com>
References: <20240502103848.5845-1-shawn.sung@mediatek.com>
 <20240502103848.5845-10-shawn.sung@mediatek.com>
In-Reply-To: <20240502103848.5845-10-shawn.sung@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|PUZPR03MB7255:EE_
x-ms-office365-filtering-correlation-id: 8ced5f87-ece4-4da8-2671-08dc6b35486a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230031|366007|7416005|376005|1800799015|38070700009; 
x-microsoft-antispam-message-info: =?utf-8?B?MytHYzVVZE5jYUNhMHljb1prVHFBcFZYV1NMYXlmM1lKMFYyTkE4c1QwM2ZC?=
 =?utf-8?B?bkJscnJMRDhlOUx1QmMvL1dVdkM4TlA5ZDAvQWxodzRxbW1PTk1qRkJCcTdt?=
 =?utf-8?B?V0xoVjRhUlE0VkFGdnJhWURPK3YwQ25ycHJGS3JWa3UxdWUvVmY3cGFod1J1?=
 =?utf-8?B?b1p2NlRvOVpOUVZ0SFdmdEpoMmdiUTM2NFBJWE96M0VYYnNXbG40cXdZRlBO?=
 =?utf-8?B?VTR0S0xvdGV4aFowa21PVkNBTFVROTRxSGtENENNUEFUcy9FMXNTcG4weWZP?=
 =?utf-8?B?U2oyV2ZQcmZFanhqK3paNUxmWHE0V1hQT0VvWjh4ekNZMGRNa1B1d0RGQmox?=
 =?utf-8?B?VG5qZGNMT1NHajBTK1BveXAwWFdsWDVxbHYzOFZLbm5KVDdSV01WNFVmWU5Z?=
 =?utf-8?B?NFoxa1NiRkh3WjUzeXc1bkVYdTFWckd2YkFvM0lmMlVuVStCRGF4Z1VFTjBP?=
 =?utf-8?B?eTQzblQ2OWc2eFhKZTh6UGIvRHpjL2VoSDBqcTJsa0M5ZWd3V3JtL3Y3VVZJ?=
 =?utf-8?B?bmJFa2QzSWZPOTR0VmhZMUNwaWNIZThtTDU5Z1ZoSCttekcrSmxudlZQUkRM?=
 =?utf-8?B?ZTU5NFB4YWpKQXlyUUNrMkIyWkVlZmxaUVhvZHlma2I4enFZZ3V6SzUyUVpt?=
 =?utf-8?B?RENRYnphdjBrZHdPb3BDdEVmTFBvRGZTSmZCNzYvYXQyK1R0b2F4Wjl0dWE5?=
 =?utf-8?B?a0M2bUJwcDhvSm81OWZPcFp5S256cjhFekRpaVFUWlVkWDJSUGVSQjdGaWtz?=
 =?utf-8?B?aDdkbGRpUjUxZ3FFZlIyM1FSdm41ZVVBdWdHVi9FKzdGUGh6ZTYxeHk3LzFp?=
 =?utf-8?B?NmNWakVTOHJMUlJTcHA2NUd3OERWWDJma1B5NWtPaDkwTGhub25KcTZKaUZO?=
 =?utf-8?B?YnUzbzdEMU1aUlVDYWNJLzZJeitCZmlzU2I4SENSY0hJM1E4bGppQXErcjRY?=
 =?utf-8?B?dzgrSzhZY2tuV2lrU1dtUDNVMFVzZENZUlJBQnB5V2xVY0haVlZiZ1FQU0FK?=
 =?utf-8?B?WUo2UWw2K2hicGMxa0FkSHAyZkFqaFU1T0ZLRHNJSDROOG41MVhOVW5XMHNQ?=
 =?utf-8?B?SnJDejlwa1MxdUUxOGxjaU5rdFRLWExBcXQ0dWJaMWZsS0dmZXRQTDEyZG1Q?=
 =?utf-8?B?SFZyWWtGV3BTSUk3a0ZrS0dyTTU3YTF3ZkZpS2JtSkFoNS9zU0puakR6bHcy?=
 =?utf-8?B?WjdYYlRibXZuaDIrcWloYVV5elVRQ012KzVQVEpUbVB6SXRxclJLVkl1UEJk?=
 =?utf-8?B?UFpEZFZrSWJBWko3ZDN1YTM3MG9Pc1lOOVRhZW54SW1FUVJHYUVST1l3SGNC?=
 =?utf-8?B?SzY2bW05cjB6ckViNFNucG5ieWRSbUdWOFdqQ2o4K1ZxNnZDbWNlREk1K2Rl?=
 =?utf-8?B?UkhrUzNLYkxNVUNzeGdtcHUweDlLTlhsamppblVTY2NjdjliRHRvS1pwUDZL?=
 =?utf-8?B?VmY0azNtb0VoTzZmeHdtOGQ5WXNReTYrY3BlNVQrdlNndnVoZHVJOFdSQU01?=
 =?utf-8?B?SkNvNFB2bHp0elRBT0ljNWxUODhydzNxN1JOd3NyaUE2KzB3SEVsSU5wTmFh?=
 =?utf-8?B?aHFEZjVXTTlBYmpOSnY1QUFXNW1JK2VRcXBubEtrRXIrRGNZSGJTUkQyVHVt?=
 =?utf-8?B?N3ppa2tKRzJXZCtSc3JwV0lTb1gxcEttbHdLS3FhSTYvcGdSKzRnK1htaUFq?=
 =?utf-8?B?R3ZPQ1ptM05qY2pGOHRIZHBpcUxtNWkvWUF6a0tVb0F0bUpQL3A2SkZlcE5a?=
 =?utf-8?B?Y1JkekhYUTNpUnBSaHh5bWM2dU1EamlxVDlkNmhrd1lNY0VvT1JhWDRPVGpK?=
 =?utf-8?B?RzlLTzgvczNzbit5MUc2QT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(7416005)(376005)(1800799015)(38070700009); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RmttLzlEVkpiSk9McHU0WDF2bVpZRzNSVWVQS3JWWEJaOUJENkpTdy9WeW1a?=
 =?utf-8?B?eWQ3RHhFRGZFZnNyYlVSZ1JVRm84MFhXdktGZ3JQaXJ4RjVxQkNyWG1nM2xW?=
 =?utf-8?B?L242cE10bWZKM1dJMnJhVlYrZWY4VlFlNVk2d2JJbU0zMUQrMW05UnpvTnVX?=
 =?utf-8?B?WGVVZy9NMndwREEzNzBjaHE4RmpkcU1mdnVkNFJ3TjhDemJKOWRNanJGRUJQ?=
 =?utf-8?B?bEVsYUt0MjJjVWtEbWFXOThnQXM3NDB4MTFZeE9hNWF2NFY1bG4xYXM4Tk9C?=
 =?utf-8?B?Y1VXcHRZQTZVT0hwczZmK1VHMFdDUkMzZGJYdHhrM21oTlVaYldESTdJMjBY?=
 =?utf-8?B?NmpTNmpSMU1ueTN2aS9rL2hmU2xIZWFDb3VDbjMwaVp1T1lRT1NrZmJGZ0Z2?=
 =?utf-8?B?ZHd2V1VwSUkzS2c4UGhldW1CUXBJamxSZG1ZcHBUNm81SGM4TE8yWFhyZHRn?=
 =?utf-8?B?VTIxZUdXRXBWalZwMXJ1aXU4RElNdzlZczNNVVhOR2tHTHFqQ2JLZmVVekw4?=
 =?utf-8?B?azhQcHhTOEtLTGl0RUpQQXhKVUF1blo5NmhnVnQyWit2bnRQQVlxTGJ3S1d3?=
 =?utf-8?B?SkcvOUZub1ljTVBvdm5nZHg1aERuT25CYzdhbEtVZGpJemRvdXhaSVJIYk44?=
 =?utf-8?B?dVViZXMvelhidW9IODFEUExTdGErVzBoTGlKZEtmekNmMUt0U0k5dkVJNVNp?=
 =?utf-8?B?czEza0JSelQ5MWdXZUYzNytKc3pDaDlPa3RkcE1IVUwxd3NETk9IZDg0R1RG?=
 =?utf-8?B?blRNaWxKUlRab3VxejJPOHhuQ3FVVStCTzJGZmdrNjhzNDg0ZTZBY0FVMm5Y?=
 =?utf-8?B?UEo0eWFtbzI3dXd1dUozeDNKa0N3RkZPbTllajNDb0c5RXNMd1pFNWYvNDBs?=
 =?utf-8?B?eDdyZlZMMVgzbzBUQkRKVThWSUZZdVR0bHRnZTJrVXo1a256SEUwbldmT2NH?=
 =?utf-8?B?c0JJbGIrS3YrRGdHbUlxN1lyQW1reW02cGd0M3JaYWhBek9leGR1TW1wVEZa?=
 =?utf-8?B?cW9SMnhMb0NxUjQzQUliWVdlbXVyblkvSE5iYkZpV0JWTWgycnUxdngrSDJE?=
 =?utf-8?B?UEhJZjJZcXdCMGZESDlhODF3eWdVeWVKUDZEMmx4d0JmRmhBZkxNNk8xU0Nm?=
 =?utf-8?B?MkdFa0M3ZXRpLzRJdzA0bk5rR2dFUVhsOU9ESXJLOWJNd1hzTVBWeFNrd0Fp?=
 =?utf-8?B?NTA1MGtWRG8rbmdwT2g4VlRoYUdTSkQ1NWdISWxKQ2d4a0Y5M1V0Z1dGaXJN?=
 =?utf-8?B?NjI3aFBwTlNXUG9Cc1lRWXl0cmU1dlRxMjQwaHFJZHFiUXBNTDF5M1hCMFVE?=
 =?utf-8?B?M3JYYWhOMGVXTE9SZzhsUjF2WjRBYTdVOGttejhaVVhLYnY5alY5V0xUUzR5?=
 =?utf-8?B?TWJadDRsbGhkeDBVSDF1d3podnZyanhxWFdhTzV1V1NDNlZzWUp4RlNjOXlk?=
 =?utf-8?B?SGtBQjh6ZzNBTmo2aHVORDRIQW1IU0tTbVdsL3AwWVVBeWtXdktQZmFUcHRE?=
 =?utf-8?B?MlhJY1U5QnFITkd0YUN3KzAydkxNSWtQUWhGTStFWE9QdHNMTUN4ck9TeHdB?=
 =?utf-8?B?TG1PSkdzZ2JoYVFac09zSHg2cFUzZHdNTk9Gak1sZkJPeTQ2a3AvRTdMK3Vx?=
 =?utf-8?B?Q0YvbW84Y0tUWE5qTnJ2cDRLR0hyQ1pXQkxWQmF5bFQzWkFCcUlFY0hRaElY?=
 =?utf-8?B?V2xaV2tSU2RRWTU0a2ljMTRXQy9GNWU4OU53WUFDWEN1Nkl0VC9MMTVNZm01?=
 =?utf-8?B?cHBvL1cwa0E1dkpoUjBOVDdLVDJlSkR0TERFaEFOdWM1emtvSnkrWHk3RWZO?=
 =?utf-8?B?TlJSUEpmZW9seXlaYUdWTmJqcExQWm4xY0QrYVFFdHhkQzhORFBBT2NZdWhR?=
 =?utf-8?B?L2NrYnRpSnpNNzBuV0NhSHJjcUdEUUZUVnJtNkxUblBVZU8wU3FMcE5sSUJO?=
 =?utf-8?B?bXpjdHlqd2dzRG1UZUsvTW5LNXIxNzlJbjEreVljK0F4cWNYZC9ZVE9td01C?=
 =?utf-8?B?V1pjWG1ybmdKRm1oUVBYdEJCeGxUdFY4anVtVjIrYVdVM215TnhRR2FWU1d4?=
 =?utf-8?B?RmdyVXk2M2JwWE4vcHRnQXVzZWxLWFNJZGV0Vm05bEhGQ0M0dFlwV21obVd5?=
 =?utf-8?Q?mMHPFdQ6L2qDf54EjvV0N3Ujf?=
Content-ID: <712BD1C204C5E9489827C54133D2FB6A@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ced5f87-ece4-4da8-2671-08dc6b35486a
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2024 05:52:57.1939 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MEBVt+Y6FcKSySeGFmskqk8N/KOssllXKAcb9QB7V30LV9mz2csnPg4rh+sdcw80SCoqVo3C+riG+OsecC/j2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR03MB7255
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--13.106900-8.000000
X-TMASE-MatchedRID: cgbqQT5W8hcOwH4pD14DsPHkpkyUphL9X4GSJGyYc34E6M1YtcX6vItK
 MiEWo8iho5qw/iFKtvbzrL9jlOCHAYpsQeZV7e/eDB+ErBr0bAPb4SkGdkTN9XmLy9Zf4u4Pq3v
 HyoeitVw2p7WO2OVzGyOZA/qVm/De/6PuZfWUoL6XXOyNnX/prLBH/AqZyGLZmyiLZetSf8n5kv
 mj69FXvKEwgORH8p/AjaPj0W1qn0Q7AFczfjr/7FplA24H1TUe3KGillqESDXwGAYBx8Yu0+Nlb
 LU1LERM1YMezk9PrOo=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--13.106900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 0FEB5B98F18F183639D773FC6EF7CAF8331F06947C51B92F68371ADA5E6BA75C2000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_003_177765594.1407022326"
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

--__=_Part_Boundary_003_177765594.1407022326
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIFNoYXduOg0KDQpPbiBUaHUsIDIwMjQtMDUtMDIgYXQgMTg6MzggKzA4MDAsIFNoYXduIFN1
bmcgd3JvdGU6DQo+IEZyb206IEhzaWFvIENoaWVuIFN1bmcgPHNoYXduLnN1bmdAbWVkaWF0ZWsu
Y29tPg0KPiANCj4gU3VwcG9ydCBjb25zdGFudCBhbHBoYSBibGVuZGluZyBpbiBPVkwuDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBIc2lhbyBDaGllbiBTdW5nIDxzaGF3bi5zdW5nQG1lZGlhdGVrLmNv
bT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMgfCA5
ICsrKysrKystLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rp
c3Bfb3ZsLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMNCj4g
aW5kZXggNzM4MjQ0YTYxNjRlOC4uZTQxZmQ4M2UzNmU3OSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYw0KPiBAQCAtMzgsNiArMzgsNyBAQA0KPiAgI2RlZmlu
ZSBESVNQX1JFR19PVkxfUElUQ0hfTVNCKG4pCQkoMHgwMDQwICsgMHgyMCAqIChuKSkNCj4gICNk
ZWZpbmUgT1ZMX1BJVENIX01TQl8yTkRfU1VCQlVGCQkJQklUKDE2KQ0KPiAgI2RlZmluZSBESVNQ
X1JFR19PVkxfUElUQ0gobikJCQkoMHgwMDQ0ICsgMHgyMA0KPiAqIChuKSkNCj4gKyNkZWZpbmUg
T1ZMX0NPTlNUX0JMRU5ECQkJCQlCSVQoMjgpDQo+ICAjZGVmaW5lIERJU1BfUkVHX09WTF9SRE1B
X0NUUkwobikJCSgweDAwYzAgKyAweDIwICogKG4pKQ0KPiAgI2RlZmluZSBESVNQX1JFR19PVkxf
UkRNQV9HTUMobikJCSgweDAwYzggKyAweDIwICogKG4pKQ0KPiAgI2RlZmluZSBESVNQX1JFR19P
VkxfQUREUl9NVDI3MDEJCTB4MDA0MA0KPiBAQCAtNDI4LDYgKzQyOSw3IEBAIHZvaWQgbXRrX292
bF9sYXllcl9jb25maWcoc3RydWN0IGRldmljZSAqZGV2LA0KPiB1bnNpZ25lZCBpbnQgaWR4LA0K
PiAgCXVuc2lnbmVkIGludCBmbXQgPSBwZW5kaW5nLT5mb3JtYXQ7DQo+ICAJdW5zaWduZWQgaW50
IG9mZnNldCA9IChwZW5kaW5nLT55IDw8IDE2KSB8IHBlbmRpbmctPng7DQo+ICAJdW5zaWduZWQg
aW50IHNyY19zaXplID0gKHBlbmRpbmctPmhlaWdodCA8PCAxNikgfCBwZW5kaW5nLQ0KPiA+d2lk
dGg7DQo+ICsJdW5zaWduZWQgaW50IGlnbm9yZV9waXhlbF9hbHBoYSA9IDA7DQo+ICAJdW5zaWdu
ZWQgaW50IGNvbjsNCj4gIAlib29sIGlzX2FmYmMgPSBwZW5kaW5nLT5tb2RpZmllciAhPSBEUk1f
Rk9STUFUX01PRF9MSU5FQVI7DQo+ICAJdW5pb24gb3ZlcmxheV9waXRjaCB7DQo+IEBAIC00NDks
NiArNDUxLDkgQEAgdm9pZCBtdGtfb3ZsX2xheWVyX2NvbmZpZyhzdHJ1Y3QgZGV2aWNlICpkZXYs
DQo+IHVuc2lnbmVkIGludCBpZHgsDQo+ICAJaWYgKHN0YXRlLT5iYXNlLmZiICYmIHN0YXRlLT5i
YXNlLmZiLT5mb3JtYXQtPmhhc19hbHBoYSkNCj4gIAkJY29uIHw9IE9WTF9DT05fQUVOIHwgT1ZM
X0NPTl9BTFBIQTsNCj4gIA0KPiArCWlmIChzdGF0ZS0+YmFzZS5mYiAmJiAhc3RhdGUtPmJhc2Uu
ZmItPmZvcm1hdC0+aGFzX2FscGhhKQ0KPiArCQlpZ25vcmVfcGl4ZWxfYWxwaGEgPSBPVkxfQ09O
U1RfQkxFTkQ7DQo+ICsNCj4gIAlpZiAocGVuZGluZy0+cm90YXRpb24gJiBEUk1fTU9ERV9SRUZM
RUNUX1kpIHsNCj4gIAkJY29uIHw9IE9WTF9DT05fVklSVF9GTElQOw0KPiAgCQlhZGRyICs9IChw
ZW5kaW5nLT5oZWlnaHQgLSAxKSAqIHBlbmRpbmctPnBpdGNoOw0KPiBAQCAtNDY0LDggKzQ2OSw4
IEBAIHZvaWQgbXRrX292bF9sYXllcl9jb25maWcoc3RydWN0IGRldmljZSAqZGV2LA0KPiB1bnNp
Z25lZCBpbnQgaWR4LA0KPiAgDQo+ICAJbXRrX2RkcF93cml0ZV9yZWxheGVkKGNtZHFfcGt0LCBj
b24sICZvdmwtPmNtZHFfcmVnLCBvdmwtPnJlZ3MsDQo+ICAJCQkgICAgICBESVNQX1JFR19PVkxf
Q09OKGlkeCkpOw0KPiAtCW10a19kZHBfd3JpdGVfcmVsYXhlZChjbWRxX3BrdCwgb3ZlcmxheV9w
aXRjaC5zcGxpdF9waXRjaC5sc2IsDQo+ICZvdmwtPmNtZHFfcmVnLCBvdmwtPnJlZ3MsDQo+IC0J
CQkgICAgICBESVNQX1JFR19PVkxfUElUQ0goaWR4KSk7DQo+ICsJbXRrX2RkcF93cml0ZV9yZWxh
eGVkKGNtZHFfcGt0LCBvdmVybGF5X3BpdGNoLnNwbGl0X3BpdGNoLmxzYiB8DQo+IGlnbm9yZV9w
aXhlbF9hbHBoYSwNCj4gKwkJCSAgICAgICZvdmwtPmNtZHFfcmVnLCBvdmwtPnJlZ3MsIA0KDQpJ
biBvcmlnaW5hbCBjb2RlLCBSR0I4ODggb3Igb3RoZXIgcGl4ZWwgZm9ybWF0IHdpdGhvdXQgYWxw
aGEgd29ya3MNCmNvcnJlY3RseS4gV2h5IG5lZWQgdG8gc2V0IHRoaXM/IElmIHRoaXMgaXMgYSBi
dWcgZml4LCBhZGQgRml4ZXMgdGFnLg0KDQpSZWdhcmRzLA0KQ0sNCg0KPiBESVNQX1JFR19PVkxf
UElUQ0goaWR4KSk7DQo+ICAJbXRrX2RkcF93cml0ZV9yZWxheGVkKGNtZHFfcGt0LCBzcmNfc2l6
ZSwgJm92bC0+Y21kcV9yZWcsIG92bC0NCj4gPnJlZ3MsDQo+ICAJCQkgICAgICBESVNQX1JFR19P
VkxfU1JDX1NJWkUoaWR4KSk7DQo+ICAJbXRrX2RkcF93cml0ZV9yZWxheGVkKGNtZHFfcGt0LCBv
ZmZzZXQsICZvdmwtPmNtZHFfcmVnLCBvdmwtDQo+ID5yZWdzLA0K

--__=_Part_Boundary_003_177765594.1407022326
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtTaGF3bjoNCg0KT24mIzMyO1RodSwmIzMy
OzIwMjQtMDUtMDImIzMyO2F0JiMzMjsxODozOCYjMzI7KzA4MDAsJiMzMjtTaGF3biYjMzI7U3Vu
ZyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjtGcm9tOiYjMzI7SHNpYW8mIzMyO0NoaWVuJiMzMjtTdW5n
JiMzMjsmbHQ7c2hhd24uc3VuZ0BtZWRpYXRlay5jb20mZ3Q7DQomZ3Q7JiMzMjsNCiZndDsmIzMy
O1N1cHBvcnQmIzMyO2NvbnN0YW50JiMzMjthbHBoYSYjMzI7YmxlbmRpbmcmIzMyO2luJiMzMjtP
VkwuDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtIc2lhbyYjMzI7Q2hp
ZW4mIzMyO1N1bmcmIzMyOyZsdDtzaGF3bi5zdW5nQG1lZGlhdGVrLmNvbSZndDsNCiZndDsmIzMy
Oy0tLQ0KJmd0OyYjMzI7JiMzMjtkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3Zs
LmMmIzMyO3wmIzMyOzkmIzMyOysrKysrKystLQ0KJmd0OyYjMzI7JiMzMjsxJiMzMjtmaWxlJiMz
MjtjaGFuZ2VkLCYjMzI7NyYjMzI7aW5zZXJ0aW9ucygrKSwmIzMyOzImIzMyO2RlbGV0aW9ucygt
KQ0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtkaWZmJiMzMjstLWdpdCYjMzI7YS9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMNCiZndDsmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kaXNwX292bC5jDQomZ3Q7JiMzMjtpbmRleCYjMzI7NzM4MjQ0YTYxNjRlOC4u
ZTQxZmQ4M2UzNmU3OSYjMzI7MTAwNjQ0DQomZ3Q7JiMzMjstLS0mIzMyO2EvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jDQomZ3Q7JiMzMjsrKysmIzMyO2IvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jDQomZ3Q7JiMzMjtAQCYjMzI7LTM4LDYmIzMy
OyszOCw3JiMzMjtAQA0KJmd0OyYjMzI7JiMzMjsjZGVmaW5lJiMzMjtESVNQX1JFR19PVkxfUElU
Q0hfTVNCKG4pKDB4MDA0MCYjMzI7KyYjMzI7MHgyMCYjMzI7KiYjMzI7KG4pKQ0KJmd0OyYjMzI7
JiMzMjsjZGVmaW5lJiMzMjtPVkxfUElUQ0hfTVNCXzJORF9TVUJCVUZCSVQoMTYpDQomZ3Q7JiMz
MjsmIzMyOyNkZWZpbmUmIzMyO0RJU1BfUkVHX09WTF9QSVRDSChuKSgweDAwNDQmIzMyOysmIzMy
OzB4MjANCiZndDsmIzMyOyomIzMyOyhuKSkNCiZndDsmIzMyOysjZGVmaW5lJiMzMjtPVkxfQ09O
U1RfQkxFTkRCSVQoMjgpDQomZ3Q7JiMzMjsmIzMyOyNkZWZpbmUmIzMyO0RJU1BfUkVHX09WTF9S
RE1BX0NUUkwobikoMHgwMGMwJiMzMjsrJiMzMjsweDIwJiMzMjsqJiMzMjsobikpDQomZ3Q7JiMz
MjsmIzMyOyNkZWZpbmUmIzMyO0RJU1BfUkVHX09WTF9SRE1BX0dNQyhuKSgweDAwYzgmIzMyOysm
IzMyOzB4MjAmIzMyOyomIzMyOyhuKSkNCiZndDsmIzMyOyYjMzI7I2RlZmluZSYjMzI7RElTUF9S
RUdfT1ZMX0FERFJfTVQyNzAxMHgwMDQwDQomZ3Q7JiMzMjtAQCYjMzI7LTQyOCw2JiMzMjsrNDI5
LDcmIzMyO0BAJiMzMjt2b2lkJiMzMjttdGtfb3ZsX2xheWVyX2NvbmZpZyhzdHJ1Y3QmIzMyO2Rl
dmljZSYjMzI7KmRldiwNCiZndDsmIzMyO3Vuc2lnbmVkJiMzMjtpbnQmIzMyO2lkeCwNCiZndDsm
IzMyOyYjMzI7dW5zaWduZWQmIzMyO2ludCYjMzI7Zm10JiMzMjs9JiMzMjtwZW5kaW5nLSZndDtm
b3JtYXQ7DQomZ3Q7JiMzMjsmIzMyO3Vuc2lnbmVkJiMzMjtpbnQmIzMyO29mZnNldCYjMzI7PSYj
MzI7KHBlbmRpbmctJmd0O3kmIzMyOyZsdDsmbHQ7JiMzMjsxNikmIzMyO3wmIzMyO3BlbmRpbmct
Jmd0O3g7DQomZ3Q7JiMzMjsmIzMyO3Vuc2lnbmVkJiMzMjtpbnQmIzMyO3NyY19zaXplJiMzMjs9
JiMzMjsocGVuZGluZy0mZ3Q7aGVpZ2h0JiMzMjsmbHQ7Jmx0OyYjMzI7MTYpJiMzMjt8JiMzMjtw
ZW5kaW5nLQ0KJmd0OyYjMzI7Jmd0O3dpZHRoOw0KJmd0OyYjMzI7K3Vuc2lnbmVkJiMzMjtpbnQm
IzMyO2lnbm9yZV9waXhlbF9hbHBoYSYjMzI7PSYjMzI7MDsNCiZndDsmIzMyOyYjMzI7dW5zaWdu
ZWQmIzMyO2ludCYjMzI7Y29uOw0KJmd0OyYjMzI7JiMzMjtib29sJiMzMjtpc19hZmJjJiMzMjs9
JiMzMjtwZW5kaW5nLSZndDttb2RpZmllciYjMzI7IT0mIzMyO0RSTV9GT1JNQVRfTU9EX0xJTkVB
UjsNCiZndDsmIzMyOyYjMzI7dW5pb24mIzMyO292ZXJsYXlfcGl0Y2gmIzMyO3sNCiZndDsmIzMy
O0BAJiMzMjstNDQ5LDYmIzMyOys0NTEsOSYjMzI7QEAmIzMyO3ZvaWQmIzMyO210a19vdmxfbGF5
ZXJfY29uZmlnKHN0cnVjdCYjMzI7ZGV2aWNlJiMzMjsqZGV2LA0KJmd0OyYjMzI7dW5zaWduZWQm
IzMyO2ludCYjMzI7aWR4LA0KJmd0OyYjMzI7JiMzMjtpZiYjMzI7KHN0YXRlLSZndDtiYXNlLmZi
JiMzMjsmYW1wOyZhbXA7JiMzMjtzdGF0ZS0mZ3Q7YmFzZS5mYi0mZ3Q7Zm9ybWF0LSZndDtoYXNf
YWxwaGEpDQomZ3Q7JiMzMjsmIzMyO2NvbiYjMzI7fD0mIzMyO09WTF9DT05fQUVOJiMzMjt8JiMz
MjtPVkxfQ09OX0FMUEhBOw0KJmd0OyYjMzI7JiMzMjsNCiZndDsmIzMyOytpZiYjMzI7KHN0YXRl
LSZndDtiYXNlLmZiJiMzMjsmYW1wOyZhbXA7JiMzMjshc3RhdGUtJmd0O2Jhc2UuZmItJmd0O2Zv
cm1hdC0mZ3Q7aGFzX2FscGhhKQ0KJmd0OyYjMzI7K2lnbm9yZV9waXhlbF9hbHBoYSYjMzI7PSYj
MzI7T1ZMX0NPTlNUX0JMRU5EOw0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7JiMzMjtpZiYjMzI7KHBl
bmRpbmctJmd0O3JvdGF0aW9uJiMzMjsmYW1wOyYjMzI7RFJNX01PREVfUkVGTEVDVF9ZKSYjMzI7
ew0KJmd0OyYjMzI7JiMzMjtjb24mIzMyO3w9JiMzMjtPVkxfQ09OX1ZJUlRfRkxJUDsNCiZndDsm
IzMyOyYjMzI7YWRkciYjMzI7Kz0mIzMyOyhwZW5kaW5nLSZndDtoZWlnaHQmIzMyOy0mIzMyOzEp
JiMzMjsqJiMzMjtwZW5kaW5nLSZndDtwaXRjaDsNCiZndDsmIzMyO0BAJiMzMjstNDY0LDgmIzMy
Oys0NjksOCYjMzI7QEAmIzMyO3ZvaWQmIzMyO210a19vdmxfbGF5ZXJfY29uZmlnKHN0cnVjdCYj
MzI7ZGV2aWNlJiMzMjsqZGV2LA0KJmd0OyYjMzI7dW5zaWduZWQmIzMyO2ludCYjMzI7aWR4LA0K
Jmd0OyYjMzI7JiMzMjsNCiZndDsmIzMyOyYjMzI7bXRrX2RkcF93cml0ZV9yZWxheGVkKGNtZHFf
cGt0LCYjMzI7Y29uLCYjMzI7JmFtcDtvdmwtJmd0O2NtZHFfcmVnLCYjMzI7b3ZsLSZndDtyZWdz
LA0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtESVNQX1JFR19P
VkxfQ09OKGlkeCkpOw0KJmd0OyYjMzI7LW10a19kZHBfd3JpdGVfcmVsYXhlZChjbWRxX3BrdCwm
IzMyO292ZXJsYXlfcGl0Y2guc3BsaXRfcGl0Y2gubHNiLA0KJmd0OyYjMzI7JmFtcDtvdmwtJmd0
O2NtZHFfcmVnLCYjMzI7b3ZsLSZndDtyZWdzLA0KJmd0OyYjMzI7LSYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyO0RJU1BfUkVHX09WTF9QSVRDSChpZHgpKTsNCiZndDsmIzMyOyttdGtfZGRw
X3dyaXRlX3JlbGF4ZWQoY21kcV9wa3QsJiMzMjtvdmVybGF5X3BpdGNoLnNwbGl0X3BpdGNoLmxz
YiYjMzI7fA0KJmd0OyYjMzI7aWdub3JlX3BpeGVsX2FscGhhLA0KJmd0OyYjMzI7KyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyZhbXA7b3ZsLSZndDtjbWRxX3JlZywmIzMyO292bC0mZ3Q7
cmVncywmIzMyOw0KDQpJbiYjMzI7b3JpZ2luYWwmIzMyO2NvZGUsJiMzMjtSR0I4ODgmIzMyO29y
JiMzMjtvdGhlciYjMzI7cGl4ZWwmIzMyO2Zvcm1hdCYjMzI7d2l0aG91dCYjMzI7YWxwaGEmIzMy
O3dvcmtzDQpjb3JyZWN0bHkuJiMzMjtXaHkmIzMyO25lZWQmIzMyO3RvJiMzMjtzZXQmIzMyO3Ro
aXMmIzYzOyYjMzI7SWYmIzMyO3RoaXMmIzMyO2lzJiMzMjthJiMzMjtidWcmIzMyO2ZpeCwmIzMy
O2FkZCYjMzI7Rml4ZXMmIzMyO3RhZy4NCg0KUmVnYXJkcywNCkNLDQoNCiZndDsmIzMyO0RJU1Bf
UkVHX09WTF9QSVRDSChpZHgpKTsNCiZndDsmIzMyOyYjMzI7bXRrX2RkcF93cml0ZV9yZWxheGVk
KGNtZHFfcGt0LCYjMzI7c3JjX3NpemUsJiMzMjsmYW1wO292bC0mZ3Q7Y21kcV9yZWcsJiMzMjtv
dmwtDQomZ3Q7JiMzMjsmZ3Q7cmVncywNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7RElTUF9SRUdfT1ZMX1NSQ19TSVpFKGlkeCkpOw0KJmd0OyYjMzI7JiMzMjtt
dGtfZGRwX3dyaXRlX3JlbGF4ZWQoY21kcV9wa3QsJiMzMjtvZmZzZXQsJiMzMjsmYW1wO292bC0m
Z3Q7Y21kcV9yZWcsJiMzMjtvdmwtDQomZ3Q7JiMzMjsmZ3Q7cmVncywNCg0KPC9wcmU+DQo8L3A+
PC9ib2R5PjwvaHRtbD48IS0tdHlwZTp0ZXh0LS0+PCEtLXstLT48cHJlPioqKioqKioqKioqKiog
TUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5vdGljZSAqKioqKioqKioqKioqKioqKioqKg0KVGhl
IGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcg
YW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2
aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGlj
YWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRl
c2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1
dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNs
dWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0
cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBh
biBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWwsIG9yIGJlbGlldmUgDQp0aGF0IHlv
dSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBz
ZW5kZXIgDQppbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1haWwpLCBkZWxldGUg
YW55IGFuZCBhbGwgY29waWVzIG9mIA0KdGhpcyBlLW1haWwgKGluY2x1ZGluZyBhbnkgYXR0YWNo
bWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBub3QNCmRpc2Nsb3NlIHRoZSBjb250ZW50
IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24uIFRoYW5rIHlvdSENCjwvcHJlPjwh
LS19LS0+

--__=_Part_Boundary_003_177765594.1407022326--

