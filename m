Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE829A9EFE
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 11:46:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 279EF10E642;
	Tue, 22 Oct 2024 09:46:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="O4POdFpz";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="NVysE2Cr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0187610E642
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 09:46:31 +0000 (UTC)
X-UUID: 822bbe80905a11efbd192953cf12861f-20241022
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=UZP5ar1gErtyVh/kg3fGfp8ASkFvFimeVAWPi5bhzrA=; 
 b=O4POdFpzPOKcGw9AcKgPFGUidF3d9l5GE03ABZdsim9RLwka/j/Ll9rPWkcw4liqJHY2Cp/KQo5QJvldMfuU/Z7NSOLErJOEBcDnbRADu0uJZjA5QLGlU7J4tmHbBvIY8NL15vpvBTyFERw+a2muOz56yi6/4e1rrEo0C7q99mI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42, REQID:cfb22a21-9d24-4521-af58-55a77e871df9, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:b0fcdc3, CLOUDID:9e037625-9cd9-4037-af6e-f4241b90f84d,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:1|-5,EDM:-3,IP:ni
 l,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
 LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 822bbe80905a11efbd192953cf12861f-20241022
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1957085082; Tue, 22 Oct 2024 17:46:27 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 22 Oct 2024 17:46:26 +0800
Received: from HK2PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 22 Oct 2024 17:46:26 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BKVa/mnAzAOC0B7/T03o2+zWvei+l3uqus2RAKZEXLTQewRGKzlgvppFeMtseWrRvOeo59Or2euILciLlkxUg7aPTW4/2dmKLGxGHdu9xatCLdj9u0z/mlZudNa+lJ5Yi3Kp8QTEn3yQm252xmJlpgztRrtaIuIzyV+Mg+n+JOwsZLY+nF8Vg2GJFlPCIkOdLse64kBxdDZmIkATe8s7m8hsE8pzOZcImIWY/r6EoFzpEDeFva7xBS5NKBjTxTMz141XJYQ7l4/2e21jAOz6YewR4/PBTKWmvysr6ZdUhcJw98AWQWJcTdJgzEFSWBucB6z6bBIVnhUMGAr4mQWbfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K7oF5MOHq7cVS3x8jurLG036op0+ugr/Ksz18+iToKI=;
 b=SIx4Wmb0CucQJtETBXSdh07PvDR6EQmbXDNFQQ2rdfsXn4V/tYvTYIEaHkZ+olcZiaypmwlh/CjYDteZGj3ZfOSbUPb2ndi/L0hCcUWuUvw4LJBgQjeERBZwD4qAuOpxzDLDMy2R8+TZOY3U6hnKRC0sTqilcy1BtOi224RCXipKQW6NCQ/j27iriDNhsRhqVb0c7fjOPxXUIWgnyyPGfKA8ii5WbiaTJOBGBMDxkVmx6VxnXhgVQzUnGfYJmi3PQn6t4wQyxD7Qp+JU4YnvasufPcmbyN8sPdlFzzqDy7qCtkMEM3F1DEtYLbyTernqfpyPVHXzEP6nhMOH99kqYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K7oF5MOHq7cVS3x8jurLG036op0+ugr/Ksz18+iToKI=;
 b=NVysE2Crqhn8Evozf2FKp+mqpjd+dkcKsKLFVaKkPdpiuwnQ9WMhf3YXUTXLyH8s1MarCb5LDECcSavepwYSxbqXHcfK/HKLUqwZIZTA6wQGhwkCXDaIA/ZO/bADUD4nrbMiwvVJ266jRTQvn9JikZCpNPNplN0aQcQCtqvv0Fw=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SG2PR03MB6777.apcprd03.prod.outlook.com (2603:1096:4:1de::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.29; Tue, 22 Oct
 2024 09:46:24 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8069.024; Tue, 22 Oct 2024
 09:46:24 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
Subject: Re: [PATCH v2 09/10] drm/mediatek: Allow build with COMPILE_TEST=y
Thread-Topic: [PATCH v2 09/10] drm/mediatek: Allow build with COMPILE_TEST=y
Thread-Index: AQHbFYZGXQhSYURdx0Gm+WdO7yD3TbKSo3WA
Date: Tue, 22 Oct 2024 09:46:24 +0000
Message-ID: <574344f74186e9cf930fb20289a0ed48d7ee436b.camel@mediatek.com>
References: <20241003111851.10453-1-ville.syrjala@linux.intel.com>
 <20241003111851.10453-10-ville.syrjala@linux.intel.com>
In-Reply-To: <20241003111851.10453-10-ville.syrjala@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SG2PR03MB6777:EE_
x-ms-office365-filtering-correlation-id: bbdbc4ec-e2b8-4f00-58b2-08dcf27e6448
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?QmpDd093dXFhTm41RGEwaEtuejd3MjVwMHljaXNOSTBLYWU0RWJvVWdPekw0?=
 =?utf-8?B?UUlhbXVlV2l1VUo4cUlObU51Vy8raXRHZDVhYXljTFlLTkpqVHJORmtabGVR?=
 =?utf-8?B?N29IWUtLUE9hV1lNb1ZJM3Q5ejhpbWgvYkNZaWNXckZMQ2ZqZUhOT3pYaUxh?=
 =?utf-8?B?S1FYV1lUQXhtT1pxc29OcDk0bk5oTVBmS2o3NVNTTGZjN0hiTWIyaGFqUkNM?=
 =?utf-8?B?d0hMK04zdWFLOW1sMHlCc2czTUViTWtSRWFYclFQY1N5NjZiSTNsY3lneEpp?=
 =?utf-8?B?RUt3TzVMN0lNbmtDQnEzQzRJWmVVcFJ4K29vVnlzWFl4aVI4bWgwWnBHWE5t?=
 =?utf-8?B?NDhYR0ZaSytNQ0lXMExBRkJqU1lFSjF1a0lBWnRRRFg1N3c4cEluRTQ3OTdp?=
 =?utf-8?B?ajMrcE9BZWVNdkRJWE5HSVhaY3M0OWFvR3pkSzdaazdhOENFTnJ3YmdmVS9E?=
 =?utf-8?B?ODlDMXhGMjMxNjlNR2hxc2ZMcUxyanhiN3NHNUgyblExczBGMkFjTHBHR2Jx?=
 =?utf-8?B?RTNMbTRTb21qQUdFeHVXbldrQklibzhJdjdXeUdnRE9SSnplYUI0bTRSTndI?=
 =?utf-8?B?TnpZOWVnWFdkaThWcldVbWtFYlFoWnNYSFFGTWFzRzRYZFNDWmNJMXFweXNZ?=
 =?utf-8?B?U09nSHNyQ095clRMZXVWZ2xYdVdIcURFTm9KUnRHK2VRdE9NbEZPL2NwNmo4?=
 =?utf-8?B?b3RnVFZpM25ycmZ0ZncwL0JacDlVUWhKK0M4cUZacmtSRGZNOHh6bWRFcVpL?=
 =?utf-8?B?QjRxYUFLUlcyZmw1RUVybnZCZlVwTUJtWmhreExlOG04YzU5QUFYTFBXUFp2?=
 =?utf-8?B?eXhuQlVOZnNHUWxzZTBhVFZLVWdiL2QrWTY2TVlGRDQwQklNeXEybWpzcmN5?=
 =?utf-8?B?dVdjSVRya0FJOGpyWkxFL2JPZkk4YW0zd0xtU016NWVkeFBnWU5NbCtZRUk0?=
 =?utf-8?B?a1ZVZkhpU2RPWGV2R0V0OVJRZTQ1b255eTJ3M01VckVVTFJxSUdhSzB3RVdJ?=
 =?utf-8?B?bWg1a1hCK0R3c1RURG1nN0h0dmZKbXk3MGF0dGxLd1o4NjQ0K01MVUdMMUl4?=
 =?utf-8?B?V1k2Sks0RzJna0lwYnliYTZhaE8welpnQUk5WEFVZU9ZTmJvUUx1NWpPU3RP?=
 =?utf-8?B?NlV5NEdzZlZHcDhlK2QwdUlCOWhXa1JkZ2FyUFc4RXJjNjRyTTlYOWFEMk5T?=
 =?utf-8?B?am1wY0Q4T1Vqd1FrR25JM3BIZU1NWCtVbDJTM01TN2tmR2NKcEdYQ0NCZEZV?=
 =?utf-8?B?MkUyL1g0dHUxL0JaR0tzMDRCZnczQjZobzYrd1M4aXNWZkNoVDNGOGM1LzVv?=
 =?utf-8?B?TmhIR3FrRmxyZ2Q1RkR5c1dIT2JwTnFSczA1QUtBVXFDSDg4R2lsZzRWTlVW?=
 =?utf-8?B?c2d4L2Z6eTVxdlhrbDRZcWRNSlphNXl2ZmlPdmtZUUJzZ3RsblNHOS9wZ3pE?=
 =?utf-8?B?cExBWnIvU2tLWkhnUzRNTWdJcE5FQ20yM1E3VUlHM1F2Vmg2YmdVQWlxQkpO?=
 =?utf-8?B?ZVV2V3lhcDlHOUllWnR3SXJyNzVISmtHdHlaaE9LOElUQU5RUktiOTFDRjFW?=
 =?utf-8?B?bGxMczJvR1dvVkUrYlFnRmlKc1Q3eUNRZDVIbU9aa1pFeGt6RjEwcVdhN2tP?=
 =?utf-8?B?R2doRHhsd0VreXRXSnJjNlVJRlQ2U3psL2R3Ymg5L3NZMUc3Zk93cUpsL3VM?=
 =?utf-8?B?SEJ1TmZxeWxrcTNHenFJQ3pINnBUQWJwUEtZZEkyNU1GSVhFSllwbmlPRXo2?=
 =?utf-8?B?dFp4MDRlSjRTcm1TR2FhS2FWTVY4WFlPWHRib0x3RGhhQWtaOGNKTWJuVDB3?=
 =?utf-8?Q?i33rs0OSBu8izvm+IgjJWsG119dZcnweK/J7s=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TVNvVjlDU2hxYmdIL2wxNXV6anBQcVBwN09iV2RTNWtSWW9tUlcwUmIwUmpX?=
 =?utf-8?B?ZFRSNHNjMEdid3phOUVKZUlERHhJL1FGLzVVanc4MUFlSlZXY1BvWEpoUnFL?=
 =?utf-8?B?SlZkMXlIQ3ZQRWNPVDZhVXQ0bEVOaU92cmlTL0VyQlVldU5KSHluSjBoaEFU?=
 =?utf-8?B?MFQwSk81YmZHMEliM21OMzNkRkdoTHZUY2ZDeldJQTcvWjlLRVRZdGU0SFlw?=
 =?utf-8?B?bjF0U3AxUTZCQ2phRzkyeGdmSGUwcW9nYzBDaDdtdFpZZzJ3bjVjZjQ1QUcr?=
 =?utf-8?B?Tk5MOHlsazd4bnpmWkdJZGFQeDA5S3hDMGNEbFZYczlnS0V3bFRQVGdMYW10?=
 =?utf-8?B?RWs5RGRkMC90QlM5aFdRR09YWElDNGVyUUg1VzJicEllYklpZ1NLTXNEbkI1?=
 =?utf-8?B?aTI1T3pncUZuOXMyN3R0VmJlTHAxQXIwUGlhNWZWejlIeUF6Q3hGRytjVTJF?=
 =?utf-8?B?dzlvOWlER0dJNVVKQ2xVYWVkSmtsanRzdUw5dDBHVUR0VHliQ2dJbjJLT3pp?=
 =?utf-8?B?OWpsZFI2dFlIUkxEakhZa0ppeDNzeWZLQXpLUFM1UDVaeSs4UlVBeUh5NzBo?=
 =?utf-8?B?YVh0OCtzcGFYKzVvZW9FTXhIRUFQY1pab3RtK0ZFTHE5MzZHWERmNmF2Z25r?=
 =?utf-8?B?Y0R3cCsySW9pdU9xRVdTbVZJMXY1N00wMXBWamhTb1BmV0ZkZHVzT2VSRlA2?=
 =?utf-8?B?bWJJSThuSFdBc1N4UndNcWxJRzArZzNnUUNqRmFNVzRBTVprVTBXc3o1R21N?=
 =?utf-8?B?YVRuRjlRcDRCbkVqK3F0ZUd4N0psK0ZPRzhQZHAremltcHdvL0hRRjY3TWky?=
 =?utf-8?B?WWZCa29HMDBscUtQbWs1RE1uY2FoSWlkaFVpYWxNMnpuSVFsSGFmQXJxQkds?=
 =?utf-8?B?dW1Ha2U0aFVzT3BaNmFFcGVLN3o1YjNLQzhrRHRnVVk0ZmFsek55dzFvb3lk?=
 =?utf-8?B?SXlJUmxoZ1l1MER4YVRYOGNZc25wRVd1WkFUQm5JSUJuaTY4RmxQU3EvUmh4?=
 =?utf-8?B?cXdrdU5LbUJvZDV1aXp5Si9Td1lOcGlMaVA3RkRwSTZwamExZ3N2Tll2SE40?=
 =?utf-8?B?TGlBS0U4dEh1V1A0ZUFTaTBOTzhIY3ltb2x2Q3drcFQxTzZmVmRlZGdnYU9S?=
 =?utf-8?B?aUJrQmNtMnF6OE5mc2VwdXZ6WTB0dFV5TVpLSDZmOVZtK0QzN1FiUVRZRXB3?=
 =?utf-8?B?VHZnci9UajVLcVJmNGxiTVpvL1lZK00xMG0rQ2pDaEZBNmg5ZHB3c3drT1Rx?=
 =?utf-8?B?Ymg2Y3IzT1I3ZnB2c0RCejNZMmdrOHFRb3NieGlLbTYwcW4vVklMLzZPZEIv?=
 =?utf-8?B?dHVBcXR5bHF5ZFJZZkQ2OHRvUWlWUHduRnhJbDEwN0pjVjQzcUVPRGQzUTVw?=
 =?utf-8?B?SW1ZSnYzMi8yVUtjbHZCcm94TTBvMXBZekszNDlVTWkxQ3NxdjNwTTBadWxY?=
 =?utf-8?B?anRwMnIrbUxEelJISTNvOUU3bWlpZW9VSUZ0cE1tZi9aNWs1ZEZkZmJDay9H?=
 =?utf-8?B?aHZCbUJ4T2l5bnlFTTNVM3c3UlI5YnVPYjh3c2dBU3IySEpxeG5FMm9ZVG5t?=
 =?utf-8?B?b3dQamJ4TmdIMjZHQnlSYVdXUkZXL1FVaEdiMkM1SU5wMjNPY0diUFZacFBk?=
 =?utf-8?B?QzgvUTRnZUgzSGMvSkpLSy8wVS9landsUDhXUzhHcDdPblo2NHVlRTZES3d6?=
 =?utf-8?B?NDB6RXhlcFBzbnNONm1iNzVrZWNydklpU1VNREtjSWlQV05VaS9FWWozOGNj?=
 =?utf-8?B?QytYelhQVWoxRFE1bjN6SStZcy80YjJLRHA0L3ZKc3g3NkJxa3ZaM3NwMzB2?=
 =?utf-8?B?NEk0SXhLd2VkRW1UMlRuYW1aSnIvZ3dIUGZmZjVzeDVMczY0WEd4aXQyb0xE?=
 =?utf-8?B?SlpPVXBJSjViaHJmM2NEMG5JeE5jZGZtbCs3VDFtaEIyeG9RZ0Vqdmg5VytR?=
 =?utf-8?B?d0w5MS9ubUtlT1hTbDdaME1HblAwOU1UVS9QQ0cydHA5aHlQMDBxSnZkSXl0?=
 =?utf-8?B?ZUxxdEtTanQwWVp2MFlqUzFoemdMRXNmdEVjYnplRERtUlNwK3VuQ2hGbFlt?=
 =?utf-8?B?YzgxNkpQRG4xN1pHNlFEYkZZLzlHMEpodWFGK2ZGZ0ZqM29NVC9yZm5oMnl6?=
 =?utf-8?B?ZUl4UURGWjI0dm0zUDk4bzRWWEM2dHN5U2lFTE50STlHcmJNVEo1Ry85VmVq?=
 =?utf-8?B?bFE9PQ==?=
Content-ID: <0427130A66A69843842B08641CBCBF6A@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbdbc4ec-e2b8-4f00-58b2-08dcf27e6448
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2024 09:46:24.1991 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c77dvrNJB8JxQc/eaSxIbBuSW0DJF4DFY7FgUt45zQI9k4LhrVZJYO5LiqaPa1o9XGh+cr1P2P85qJIZRGQpEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB6777
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_006_298475714.1396757908"
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

--__=_Part_Boundary_006_298475714.1396757908
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIFZpbGxlOg0KDQpPbiBUaHUsIDIwMjQtMTAtMDMgYXQgMTQ6MTggKzAzMDAsIFZpbGxlIFN5
cmphbGEgd3JvdGU6DQo+ICAJIA0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xp
Y2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bnRpbCB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUg
c2VuZGVyIG9yIHRoZSBjb250ZW50Lg0KPiAgRnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5z
eXJqYWxhQGxpbnV4LmludGVsLmNvbT4NCj4gDQo+IEFsbG93IG1lZGlhdGVrIHRvIGJlIGJ1aWx0
IHdpdGggQ09NUElMRV9URVNUPXkgZm9yIGdyZWF0ZXINCj4gY292ZXJhZ2UuIEJ1aWxkcyBmaW5l
IG9uIHg4Ni94ODZfNjQgYXQgbGVhc3QuDQoNCkkgZG9uJ3Qga25vdyB3aHkgbmVlZCB0aGlzIGdy
ZWF0ZXIgY292ZXJhZ2U/DQpUaGlzIGRyaXZlciBhbHdheXMgZXhlY3V0ZSBvbiBBUk0uDQoNClJl
Z2FyZHMsDQpDSw0KDQo+IA0KPiBDYzogQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5l
bC5vcmc+DQo+IENjOiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPg0KPiBD
YzogbGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPiBTaWduZWQtb2ZmLWJ5OiBW
aWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPg0KPiAtLS0NCj4g
IGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9LY29uZmlnIHwgNCArKy0tDQo+ICAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9LY29uZmlnIGIvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL0tjb25maWcNCj4gaW5kZXggM2QyNDM2MjcyZmYyLi4yZTBlN2M0MDc5YjYgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9LY29uZmlnDQo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9LY29uZmlnDQo+IEBAIC0yLDkgKzIsOSBAQA0KPiAgY29uZmlnIERS
TV9NRURJQVRFSw0KPiAgdHJpc3RhdGUgIkRSTSBTdXBwb3J0IGZvciBNZWRpYXRlayBTb0NzIg0K
PiAgZGVwZW5kcyBvbiBEUk0NCj4gLWRlcGVuZHMgb24gQVJDSF9NRURJQVRFSyB8fCAoQVJNICYm
IENPTVBJTEVfVEVTVCkNCj4gK2RlcGVuZHMgb24gKEFSQ0hfTUVESUFURUsgJiYgQVJNKSB8fCBD
T01QSUxFX1RFU1QNCj4gIGRlcGVuZHMgb24gQ09NTU9OX0NMSw0KPiAtZGVwZW5kcyBvbiBIQVZF
X0FSTV9TTUNDQw0KPiArZGVwZW5kcyBvbiBIQVZFX0FSTV9TTUNDQyB8fCBDT01QSUxFX1RFU1QN
Cj4gIGRlcGVuZHMgb24gT0YNCj4gIGRlcGVuZHMgb24gTVRLX01NU1lTDQo+ICBzZWxlY3QgRFJN
X0NMSUVOVF9TRUxFQ1RJT04NCj4gLS0gDQo+IDIuNDUuMg0KPiANCg==

--__=_Part_Boundary_006_298475714.1396757908
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtWaWxsZToNCg0KT24mIzMyO1RodSwmIzMy
OzIwMjQtMTAtMDMmIzMyO2F0JiMzMjsxNDoxOCYjMzI7KzAzMDAsJiMzMjtWaWxsZSYjMzI7U3ly
amFsYSYjMzI7d3JvdGU6DQomZ3Q7JiMzMjsmIzMyOyYjMzI7DQomZ3Q7JiMzMjtFeHRlcm5hbCYj
MzI7ZW1haWwmIzMyOzomIzMyO1BsZWFzZSYjMzI7ZG8mIzMyO25vdCYjMzI7Y2xpY2smIzMyO2xp
bmtzJiMzMjtvciYjMzI7b3BlbiYjMzI7YXR0YWNobWVudHMmIzMyO3VudGlsJiMzMjt5b3UmIzMy
O2hhdmUmIzMyO3ZlcmlmaWVkJiMzMjt0aGUmIzMyO3NlbmRlciYjMzI7b3ImIzMyO3RoZSYjMzI7
Y29udGVudC4NCiZndDsmIzMyOyYjMzI7RnJvbTomIzMyO1ZpbGxlJiMzMjtTeXJqJiMyMjg7bCYj
MjI4OyYjMzI7Jmx0O3ZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tJmd0Ow0KJmd0OyYjMzI7
DQomZ3Q7JiMzMjtBbGxvdyYjMzI7bWVkaWF0ZWsmIzMyO3RvJiMzMjtiZSYjMzI7YnVpbHQmIzMy
O3dpdGgmIzMyO0NPTVBJTEVfVEVTVD15JiMzMjtmb3ImIzMyO2dyZWF0ZXINCiZndDsmIzMyO2Nv
dmVyYWdlLiYjMzI7QnVpbGRzJiMzMjtmaW5lJiMzMjtvbiYjMzI7eDg2L3g4Nl82NCYjMzI7YXQm
IzMyO2xlYXN0Lg0KDQpJJiMzMjtkb24mIzM5O3QmIzMyO2tub3cmIzMyO3doeSYjMzI7bmVlZCYj
MzI7dGhpcyYjMzI7Z3JlYXRlciYjMzI7Y292ZXJhZ2UmIzYzOw0KVGhpcyYjMzI7ZHJpdmVyJiMz
MjthbHdheXMmIzMyO2V4ZWN1dGUmIzMyO29uJiMzMjtBUk0uDQoNClJlZ2FyZHMsDQpDSw0KDQom
Z3Q7JiMzMjsNCiZndDsmIzMyO0NjOiYjMzI7Q2h1bi1LdWFuZyYjMzI7SHUmIzMyOyZsdDtjaHVu
a3VhbmcuaHVAa2VybmVsLm9yZyZndDsNCiZndDsmIzMyO0NjOiYjMzI7UGhpbGlwcCYjMzI7WmFi
ZWwmIzMyOyZsdDtwLnphYmVsQHBlbmd1dHJvbml4LmRlJmd0Ow0KJmd0OyYjMzI7Q2M6JiMzMjts
aW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnDQomZ3Q7JiMzMjtTaWduZWQtb2ZmLWJ5
OiYjMzI7VmlsbGUmIzMyO1N5cmomIzIyODtsJiMyMjg7JiMzMjsmbHQ7dmlsbGUuc3lyamFsYUBs
aW51eC5pbnRlbC5jb20mZ3Q7DQomZ3Q7JiMzMjstLS0NCiZndDsmIzMyOyYjMzI7ZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL0tjb25maWcmIzMyO3wmIzMyOzQmIzMyOysrLS0NCiZndDsmIzMyOyYj
MzI7MSYjMzI7ZmlsZSYjMzI7Y2hhbmdlZCwmIzMyOzImIzMyO2luc2VydGlvbnMoKyksJiMzMjsy
JiMzMjtkZWxldGlvbnMoLSkNCiZndDsmIzMyOw0KJmd0OyYjMzI7ZGlmZiYjMzI7LS1naXQmIzMy
O2EvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL0tjb25maWcmIzMyO2IvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL0tjb25maWcNCiZndDsmIzMyO2luZGV4JiMzMjszZDI0MzYyNzJmZjIuLjJlMGU3
YzQwNzliNiYjMzI7MTAwNjQ0DQomZ3Q7JiMzMjstLS0mIzMyO2EvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL0tjb25maWcNCiZndDsmIzMyOysrKyYjMzI7Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvS2NvbmZpZw0KJmd0OyYjMzI7QEAmIzMyOy0yLDkmIzMyOysyLDkmIzMyO0BADQomZ3Q7JiMz
MjsmIzMyO2NvbmZpZyYjMzI7RFJNX01FRElBVEVLDQomZ3Q7JiMzMjsmIzMyO3RyaXN0YXRlJiMz
MjsmcXVvdDtEUk0mIzMyO1N1cHBvcnQmIzMyO2ZvciYjMzI7TWVkaWF0ZWsmIzMyO1NvQ3MmcXVv
dDsNCiZndDsmIzMyOyYjMzI7ZGVwZW5kcyYjMzI7b24mIzMyO0RSTQ0KJmd0OyYjMzI7LWRlcGVu
ZHMmIzMyO29uJiMzMjtBUkNIX01FRElBVEVLJiMzMjt8fCYjMzI7KEFSTSYjMzI7JmFtcDsmYW1w
OyYjMzI7Q09NUElMRV9URVNUKQ0KJmd0OyYjMzI7K2RlcGVuZHMmIzMyO29uJiMzMjsoQVJDSF9N
RURJQVRFSyYjMzI7JmFtcDsmYW1wOyYjMzI7QVJNKSYjMzI7fHwmIzMyO0NPTVBJTEVfVEVTVA0K
Jmd0OyYjMzI7JiMzMjtkZXBlbmRzJiMzMjtvbiYjMzI7Q09NTU9OX0NMSw0KJmd0OyYjMzI7LWRl
cGVuZHMmIzMyO29uJiMzMjtIQVZFX0FSTV9TTUNDQw0KJmd0OyYjMzI7K2RlcGVuZHMmIzMyO29u
JiMzMjtIQVZFX0FSTV9TTUNDQyYjMzI7fHwmIzMyO0NPTVBJTEVfVEVTVA0KJmd0OyYjMzI7JiMz
MjtkZXBlbmRzJiMzMjtvbiYjMzI7T0YNCiZndDsmIzMyOyYjMzI7ZGVwZW5kcyYjMzI7b24mIzMy
O01US19NTVNZUw0KJmd0OyYjMzI7JiMzMjtzZWxlY3QmIzMyO0RSTV9DTElFTlRfU0VMRUNUSU9O
DQomZ3Q7JiMzMjstLSYjMzI7DQomZ3Q7JiMzMjsyLjQ1LjINCiZndDsmIzMyOw0KDQo8L3ByZT4N
CjwvcD48L2JvZHk+PC9odG1sPjwhLS10eXBlOnRleHQtLT48IS0tey0tPjxwcmU+KioqKioqKioq
KioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNlDQogKioqKioqKioqKioqKioqKioq
KioNClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2FnZSAoaW5j
bHVkaW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmlldGFy
eSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVuZGVy
IGFwcGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5IHRv
IHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlvbiwgDQpk
aXN0cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlzIGUtbWFp
bCAoaW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lwaWVudChz
KSBpcyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91IGFy
ZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxpZXZlDQog
DQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90
aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1haWwp
LCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9mIA0KdGhpcyBlLW1haWwgKGluY2x1ZGluZyBh
bnkgYXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBub3QNCmRpc2Nsb3NlIHRo
ZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24uIFRoYW5rIHlvdSEN
CjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_006_298475714.1396757908--

