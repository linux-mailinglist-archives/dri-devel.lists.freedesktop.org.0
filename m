Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 249E7CF3B98
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 14:10:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3BFC10E15E;
	Mon,  5 Jan 2026 13:09:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="u3K65AwM";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="p1VP6wYR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04E8010E15E
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 13:09:56 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6056jION3496420; Mon, 5 Jan 2026 13:09:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=YOBK8VR9yxL4lHhYz7rG1Y6vH
 yfTgQ6gKREcQ9pWC1Q=; b=u3K65AwMJo7WQqD6ClA8CxFP2CvTpcSdkmh6nYtv8
 cbjLUa5mIGYEDgQg7WpR54sOPmXkEIhBVW1hA0rtKBd8eepD64Nc3Lnj5zWjqeRt
 3IwM19QlrGJ5W3svylCniRfHsnw1yHYIaccTNwE1t5sqVRsAUanvVMPkQT56aqJ8
 pdMLNkOCYMiOInwMRTsj5jIE4M04Ub1GdGQQlV0tNYdkDxkKiPkLTVHgF+zw4mYf
 IwuS0+8uuNL7GGQOwx4ID7Rx1qq9gEFtU29UEaYTA/o+gqGWrG3L4KVYnyvRRWH3
 9MUuN6xSoMUOc6rFE6LZUThQirwmHskIC4nRHtCN8VP0A==
Received: from lo3p265cu004.outbound.protection.outlook.com
 (mail-uksouthazon11020115.outbound.protection.outlook.com [52.101.196.115])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4bet8s94vj-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 05 Jan 2026 13:09:47 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TVKXDH7gkHWR715w9nyZwUATTUFm/XJEx9d9u9YuiHlAzsOyOoFIY6wFnq++oR+FadaAxeFwnnYWn0Bqws1LNqC15lPglUdsF0srmN1jiPBQuY77fwGZWheFRVEm2Zo3wu9161a0Xgx8O55yVKk1dDKxnwMG0vzVlV3tU1cc9vm/MSHIOew0iEWiMrCAJTClPwr/pOr7BIDeOWNAnJbf4Q4Wl/HU9y/K2V7B/kMPKMLLQE+mZXV0hr1+X+evcL1DdQTyMkW+rnjXgnEXia2VwcOBRm+fPwY0d7Ng9BBZF9grFvJRmZS4dyxv7DJMtm2V3jzykAjpffqz70xKUMD9GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YOBK8VR9yxL4lHhYz7rG1Y6vHyfTgQ6gKREcQ9pWC1Q=;
 b=TcYZIQufhVvl28+0vrtFzG8/5TlA9mg6s98owYw4KPZr3aTl9Xx4gmS3yWfqCnUgad6SbdAZAOZHBM4WeslGQlcJJIgCYakb2WVMds3iq5Gim3LvqWgNmADeuSLw2UG40hcdATStENnjUCZ2fGYipbbp2ZMGSnhR/q55tp6RPveS7FCpXJtTdE9ovUxDnvCwDAZtAK0xJhEox7j1Ni83IseH1dKRcfvRTv3gsWxgyD3ssj9XW5T6Op3K26lPK3nVnTsMlYzH69RZqlBRCuWaH7ezWwVo8uHQizGt2yB45Ir+wGFVRIxV10BZkdd6f7KW1I7bbx8UCpXqEHM/6yqVXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YOBK8VR9yxL4lHhYz7rG1Y6vHyfTgQ6gKREcQ9pWC1Q=;
 b=p1VP6wYRAUhn9JzlqfjDFVzDzwQ/YZy7L5TFnpAFaDL4IDibBryR8YGJMv2KyY3HGFCHs/WpH/WTHgT+CT4n9mB4uh5H2K18gMZ3JrZfgwj5KC0Vtk04NCR5s0RCuKHBJgZ+//joGkv4mnNwPCbEasmlGZ1hF6s9MXBB4YnkiQg=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 CW1P265MB7847.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:214::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4; Mon, 5 Jan 2026 13:09:44 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a737:7c4e:569c:d427]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a737:7c4e:569c:d427%5]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 13:09:44 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
CC: David Airlie <airlied@gmail.com>, Frank Binns <Frank.Binns@imgtec.com>,
 Alessio Belle <Alessio.Belle@imgtec.com>, Alexandru Dadu
 <Alexandru.Dadu@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] drm/imagination: Fix build on 32bit systems
Thread-Topic: [PATCH] drm/imagination: Fix build on 32bit systems
Thread-Index: AQHcfkSP6rxYSpawz06iydT0SvWsgw==
Date: Mon, 5 Jan 2026 13:09:44 +0000
Message-ID: <666b75d9-108c-42cf-bce7-b7efdb25e027@imgtec.com>
References: <20251106232413.465995-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251106232413.465995-1-marek.vasut+renesas@mailbox.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|CW1P265MB7847:EE_
x-ms-office365-filtering-correlation-id: 1a3115d1-bbf6-482a-b9ea-08de4c5bb1cf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|4053099003|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?T3N4ZCtKRUUvRHNFdTMzY2tsL2REQnF1bjdIUWxRYjdyb0dHWU1IRndpakpz?=
 =?utf-8?B?SU1ydk5vYkx6VS9veFcrK2llM2d4U1EvTGdMNzJNSHVhUVJManhvb05qbGNZ?=
 =?utf-8?B?VFIvbzRiMSthd2hMNG5VY0VibXRNYm9SUzRwMm9vTEhGWFR1dlVFQlBqQ1Vx?=
 =?utf-8?B?MWFDTVRhWjJLbHhrUUtUaU05elBsSlk3VDYxQlFNWVA0OFAxY2VpZ2pmejRr?=
 =?utf-8?B?VXFvVENqYUxRK2kxd0VYYm5PN2VQMkZSWDNrb3QyMVJybERTdFQ4UWNFalZW?=
 =?utf-8?B?OHRiczVxUmczMUg3dTBkSUg3dFRUckFFcXU0bFN3VFlnYVVEcUZVSDgxRW56?=
 =?utf-8?B?MEZya25RVVVpRjZCeEY1UVBEVFBBL3hWeGoxR0pEQWJnNHhWN2F2SGJORjNK?=
 =?utf-8?B?cEs0a0x5bVNUL2dLTVFZK2Nyc0pUdVozK250UzZQUEwrNWRVRGVwVWZ3VlM3?=
 =?utf-8?B?cHhJUlpiODZCc1RzM2VHUkUwNldKTUgzSTA0MWpraGZaY29zVW9QRUZvb01t?=
 =?utf-8?B?U2w1WUQxbFlMWXYycTF4NitkTzJlMUZsTHVKUmhNVWVhbmFqS0QwZmhkdkxG?=
 =?utf-8?B?OVhjMzJSQ3BiVnZiTS91Zjhqc1pkZFJ0U1BQNzFoSnFiekJhT05LWlE0Rm1D?=
 =?utf-8?B?eXJhejhNZHdZZG8xWlZxTFM3MEErMjVMSHM4UzRYbkVYSjRwL3ZVRFdnek10?=
 =?utf-8?B?eXVNbjZnd3JZek1FUmtqK3ZGYzVCTGlEY0lXUCtOYWYxY2p1N29rUGJoaGFk?=
 =?utf-8?B?SzEzV1h0M2ErUy9PM29EaGV2WWRMRlgvc2pMcnBkaktjY1crZ0tyWGhERnJ0?=
 =?utf-8?B?UVVUMlU0R2VBOC96NnpwS0I3WksyTWg5MTNOajBZWW1XMGszY1FLdGNNZkxm?=
 =?utf-8?B?VXNrMEt3TE1rcGg4S1IzTXcrNE93c0lEQk1aQ3lWSy96bjRkK1BEVm03NWt0?=
 =?utf-8?B?eTJnOUozT0pmd3JFU2xuNmMyRHZZQXBUeWh4YUs5Mi8xNmRLZTNwbC9FSFcx?=
 =?utf-8?B?S3F1YVhyQ0x0ZnI0Qi9jMWFsL29sdFcvODFDbXU5b2RSUWZydHRqQjJseGVP?=
 =?utf-8?B?aDViR0JsNVlTT2swRVlmd2c5UEZBMzdWMnlTSXNoeUZIQmcyR25Ua1o5dlJR?=
 =?utf-8?B?R3d1S1FyN3pYKzRoZXExcjRtQ2ZvWEp2OFNXekxHWSs0b2dBY1ByeHdER0pG?=
 =?utf-8?B?aWxBRXNhVHBLY3pPc01RdnBFNFc5Qm1KWEhXSDBLZkRNRWJvS2NCQ3JJZHd5?=
 =?utf-8?B?aTl2ZU8xRmxCMEhmN3V1L0ZrTVpzT3FTQ0MrRUw4anUrSzF0cjhUWUJ5NlNC?=
 =?utf-8?B?azd5RkgwWGpvRHU2L1RFelVOTzVBU1JDaWRHZ0hic2pqZUUxUHNkOWQ5V3h6?=
 =?utf-8?B?OXJRNEVHQnFqMEVUYmV4R1dXZU0zVlVrVUN5K1N4NUxETzNjZ0FEbGZiWUxl?=
 =?utf-8?B?STZlVjh0UjhWY3daTGtwWUlTWm5VQ0pIZ2RhYzY5dTZQUm9tNm1ITnVQTGgz?=
 =?utf-8?B?U3RWVm5XZkFFOHNkdTE5Yk1ndjRHVFNBdXd5RHpWUlA4OU10MzZnTUN0WDA1?=
 =?utf-8?B?d0xuaHYxWlg1QnNoZ1I0UGNMb0xjSWM3Z2hHaFhDd2pLRHVnejhwVjNEaHQ3?=
 =?utf-8?B?VkZlTjZLRE1leXNqZ3Q2VWZ3enlxTlgrVjNJVittZmhhZ3JWSC9uM3ZIVTcx?=
 =?utf-8?B?YThiaG54TXdwMGpkS1poa29GVExtaS9nMTU1ZmlzNWhQbFVVL2xSVTA1YUdy?=
 =?utf-8?B?ZndwNCtYVGIxZktBV0pmdXBxNU5FV0ZWSE5oRmtqUWY3Zjc2RXRqZERSeE9Y?=
 =?utf-8?B?NE95N0ZOSFU2ZXcvK0RuWGo4Zmg1WDkrUG5FTWNRb3ZzWk53bkFLZ2c0eW9T?=
 =?utf-8?B?clJZMG1ZR08weXBGMHRVOTFHYXNHemRTOGJrRWlpaDBLV0tiZFIyT3hneFJV?=
 =?utf-8?B?KzNGWnQ4Nlk3YWhsVWlDdGFZd0ZMUlZSWW96Zk1jeGVkb1VXRXFkVDNWSGxS?=
 =?utf-8?B?MGoxTTg5cmJSenBESC9FeitEZUg5dDNuZWRJMXlIdmgvT2U4NTMrQjhpOHgv?=
 =?utf-8?Q?Br/7FM?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(4053099003)(38070700021); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WE03QjBRSVc5R3ZsdGRlVnprMlpXRURxa2J3N0lOVVlJTFV6c2lqWnYzVVVp?=
 =?utf-8?B?cVpBVVg5TlpBdmprY3g2c0xKb3hBa1kzZ1R0MktUMnpSQ2ROaDJxTGxyaVNH?=
 =?utf-8?B?YzNBYzlZYytQNjhMNmcvMkcwblNYOGJSSWhWM3U0MDBCazBkeVZLUFJLaWxt?=
 =?utf-8?B?RHU5dU9YTURxQmtDQUJJT0JVNDJMYkUvZ0pPV2hyWTF4ZC9MMWJEZWFsNFNK?=
 =?utf-8?B?bXJvZXR2ZTdjTm93eEd1SWVmK0I1aTc1RUpZWG1sSzNIZno5dXoyZVkyVWtY?=
 =?utf-8?B?aHVWNlJjVFJrNVBQOGlHZjdVRHU2UUI1U1F4Q2NrOVloaWtXVzJsSkdBWUMy?=
 =?utf-8?B?RjYvV1MrRWc4dVVOVDRYaUlFTC9lY2gwS2xyakhMSUk2SHR1dGtVWE0xUzhs?=
 =?utf-8?B?aWVFMWErTDJlbGlHSHlBT2NIMGFLbUx2ckgxSDBOQktmZjc0YllIekNnSU56?=
 =?utf-8?B?OXpqd1FFMzJYQWRjandIRTh1S2hxZERETmJ3Q0hISTFoT20zNUpVL3NTb3lQ?=
 =?utf-8?B?YzhpSVUvWEIwTzFxNDkwMjZmd3RLTFZZWUc1ekcrTkx2cmxoWkJkd1h6QVVk?=
 =?utf-8?B?b3pidW1UT1dOYm5GbksvYm45QXhxNVIxYUtzZ0JqNTl4czAyaG5LNEhBOTFm?=
 =?utf-8?B?MFZ4Z2xsbkdyYlZWZmxYTHdIL1lJT3RTcENYSVNWSC93c3p0R3Ruc3J3MzF1?=
 =?utf-8?B?M0JFaVFuYUVNbWMzQ1g0b0lYSlhEVkJHN09sNU5ZUDBwekNLTjVvKzhtc2pT?=
 =?utf-8?B?NXNGOVQrSElzbXlsOFhqR2R3aUpqNDF2MVpibGNWWmFXdVFsVWdIVlMwdlJt?=
 =?utf-8?B?MDVVbmpSRGFUQ0pNWDh6d1dSdFNGYjNsbDFWMTg1cmM5RzNobzVKWVl1OHlz?=
 =?utf-8?B?MUFNQ21ZYkRzeHdUSmRiL1VxdnlYdHhZeFg3RDl1OFBCaEg3NWw4V09Iekdj?=
 =?utf-8?B?UXYrc3BlUHNmSmVzTzluWmFueFk3Wk9Fc2hidFM3TEcza1pmc204U0xEUVdo?=
 =?utf-8?B?d1BqYmd6cEp4Y3h0bkN1RnpJTlpzWWI3bldYcE04bnk4WFdheTE3cG5EbHZ3?=
 =?utf-8?B?VFFvcnFKdlpLTkZ5T1hVd1RrVjIzc3V1QXVGWkFOMTZqd3VwaFV5eTk3ZmJ1?=
 =?utf-8?B?VjA4b2tmUHRyNmRoekNOV0hBOCtjQ1FZU1dqM1pOMk5tbnh0MFAvNmVmZzR2?=
 =?utf-8?B?Zy96QUJGVHdwOTA1YW03Sk5PT0hISUdWbUdmZTVDWDBPQmsvZy90cUM4ZTI5?=
 =?utf-8?B?MFVhWlo0UW5UdzNGUjNxUGU2Z0NjODR4NVVSQkpYeHhEZCtoWlh0Y1JBM3k1?=
 =?utf-8?B?WGVLemZiTVZYcWlHYVRvand2Y0c4bysrVGhFN3ovUkNkbEtUbW12OWt6ZnpI?=
 =?utf-8?B?TU9Cc1g2S3lES3ZqQzJJU2JGMUl4ZVZMbm45d2VmNDJQWGxuQ01KbWlXVEk5?=
 =?utf-8?B?V2pxekhNSURwbHRNUktXVEpuL25HaVNodXI5Wk9hblo4Y3pScFpaWW1BN1Fz?=
 =?utf-8?B?ZUEwUmpmMTA2L2hoQVB2RTN0T2EvbHRteGoyWWF0WEh5SzZ5WmRPQlhRcmFY?=
 =?utf-8?B?bEZmWG9aTnpjQW5weXAxUWFtclFDTjN4bGlDQ1QxYnFreWgvblpQZGZyNjRw?=
 =?utf-8?B?bHRHU2lreGVpeG5ralpCYXFURXdIQUhEWUd3NGM3cjFVRm52bmdFeW45WUVo?=
 =?utf-8?B?dFovS2FWTFhUK3lsbm1tbTNpQktCRFhpQjR0NmxVQ0M0cnBlTzcyeElxVklL?=
 =?utf-8?B?VVVmOGZWL01kMWpvbXlFWFJUMUF1TDIvZU5HTkhWUWczYXgvR3hva2xTc05z?=
 =?utf-8?B?UTVaa2NRemUyUjlHRkp2aUZWZHJXL1EyR2xaMzR3WVcxelA4TFF1V2NvdFEy?=
 =?utf-8?B?bk1VSXh0WWEyWlJneXhuUVBkaFRzTjV4TDFCODY3c1pwVEVsVk9pUmlKZlJx?=
 =?utf-8?B?ZHZQUzNmNTRYd0NjT1RISmF6ZDVzdE92WFBSSUo0U3lVMTJMN2FRdlZ0Rm1K?=
 =?utf-8?B?Zm1oZXNmQUxYQVFvNVJBeXpHV3l6TVhXRk5FOWtjaVl4clMzdC9WNjExangw?=
 =?utf-8?B?aVRrRDR3Z3BCcytLZEdIeTAwR2FaTkh6a3Y5VTRRYVI5QUtETmdoUTdJemFR?=
 =?utf-8?B?T3I1SnB6M2oyOXA0QlN4RHQwK0thSThRVldnazdROFRiMXc4WXNzYTBkeFpN?=
 =?utf-8?B?SmM5OTJjUnc4RnJ2L2R6M3RwTEpXNnJTc3d0RHk3a09qeWJETUhmajFNTzFs?=
 =?utf-8?B?aVp6YVM1SXVoRGRKaUVjMERyK1lmVS9sVk1lNDFjYStLVmtMSllNQVVwNEZV?=
 =?utf-8?B?OU9rKzlMWGswbmlLT3UrbnlaM1A0bnFkUUVpTFRYbTN0WU9PRE1lTzlLQ3VR?=
 =?utf-8?Q?JLAyAxrQELch0lvI=3D?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------tdUAgJCGkvVTEV30LAhLuHs5"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a3115d1-bbf6-482a-b9ea-08de4c5bb1cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2026 13:09:44.2006 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: biJb4/ntbbYkhmt0sPsqRUbhyqxp2vgzO3SswQE7Pf4kEuI3fMPYV/62X2g1FgrZXMA4vmYkwTwt2ulgT1qA5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB7847
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDExNSBTYWx0ZWRfX3aUUoAmZ7ZSw
 Er+/ir+VatWzG/f1jiYWF0UqygtIA4eSl/u//PVB06/+EnmOKGsl1rerrv/+aUfwQYHWdNmsYYv
 9i3ayXIm7CXzwzHJ5EHz5Oet0SxihtiDzYsupfXn0bKnN69wzWPHe9S0D/wopkM823BiGBWOBHq
 l13PvHbPynB3thdFDIfSRA0uZy6tOfBobkkIO6IJes3uv/R/G+B4wIp7WbgaLZiwmofLV/YLROz
 E4HNNew0+ZixS0WEEUuK5HBJHGLgqkzPLRuHjmGLNuWTa+XrA2fhDD0zW334WGzfigzTKaQslsD
 Nk8UWbmj6T+7/G9/4kknVu+TtAgPLYTWO4JZsI5CbMKGtsGo036vvh5JQ7G8ceVlKZQ3zcoGwVo
 et7epj2nO07/nFNeZR5N/j7SSTAcuNoGpLO7PPdcT+tB374HtXxtfZbhvbdjKzGatkVVuFB3IIZ
 ad77OT7/zaensWAUjnw==
X-Proofpoint-ORIG-GUID: 8DmQgY4Qh5uCNN49xvwQ7NSKgfmY3JyA
X-Authority-Analysis: v=2.4 cv=LPFrgZW9 c=1 sm=1 tr=0 ts=695bb81c cx=c_pps
 a=u65maU7Po4pD27TNn/kSCQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=NgoYpvdbvlAA:10 a=VkNPw1HP01LnGYTKEx00:22 a=b3CbU_ItAAAA:8 a=pGLkceISAAAA:8
 a=r_1tXGB3AAAA:8 a=QyXUC8HyAAAA:8 a=VwQbUJbxAAAA:8 a=e5mUnYsNAAAA:8
 a=n1gi1lzfb2B5qFB3Cq4A:9 a=QEXdDO2ut3YA:10 a=8tSIEsP_3xlRG0H7XTkA:9
 a=FfaGCDsud1wA:10 a=Rv2g8BkzVjQTVhhssdqe:22 a=t8nPyN_e6usw4ciXM-Pk:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: 8DmQgY4Qh5uCNN49xvwQ7NSKgfmY3JyA
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

--------------tdUAgJCGkvVTEV30LAhLuHs5
Content-Type: multipart/mixed; boundary="------------g1CvrC8tnWXFlu7H9GrkGQV1";
 protected-headers="v1"
Message-ID: <666b75d9-108c-42cf-bce7-b7efdb25e027@imgtec.com>
Date: Mon, 5 Jan 2026 13:09:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/imagination: Fix build on 32bit systems
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: David Airlie <airlied@gmail.com>, Frank Binns <frank.binns@imgtec.com>,
 Alessio Belle <alessio.belle@imgtec.com>,
 Alexandru Dadu <alexandru.dadu@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org
References: <20251106232413.465995-1-marek.vasut+renesas@mailbox.org>
Content-Language: en-GB
From: Matt Coster <matt.coster@imgtec.com>
Autocrypt: addr=matt.coster@imgtec.com; keydata=
 xjMEYl2lchYJKwYBBAHaRw8BAQdAOYlooFfHTXzAQ9aGoSnT9JS9wq8xprG+KVLbkxJDF5DN
 JE1hdHQgQ29zdGVyIDxtYXR0LmNvc3RlckBpbWd0ZWMuY29tPsKWBBMWCAA+AhsDBQsJCAcC
 BhUKCQgLAgQWAgMBAh4BAheAFiEEBaQM/OcmnWHZcQChdH8KkDb5DfoFAmgHpowFCQlsaBoA
 CgkQdH8KkDb5DfqxDgEA81pbVLJDmpFyFZLRhAGig9rgoDY6l774yhTzRVm/SvkBAJLzpSlm
 wyQaQuB668TKOX9XvRLKFGjSq5kkdQcxqjkCzjgEYl2lchIKKwYBBAGXVQEFAQEHQCaVC8X5
 7NOv2jNbeXqjP9ekY7rzy7auiEZ5PxaDWUQVAwEIB8J+BBgWCAAmAhsMFiEEBaQM/OcmnWHZ
 cQChdH8KkDb5DfoFAmgHpowFCQlsaBoACgkQdH8KkDb5DfoK+AD/Q4aN/zUvP72RRE4cNWpM
 MXeRXg+LTN+OJ24U10LltxIA/2w3kDqMC/0t1oqO8TM+c2LMWO/x2IBkG7oRZ/hVw1QI
In-Reply-To: <20251106232413.465995-1-marek.vasut+renesas@mailbox.org>

--------------g1CvrC8tnWXFlu7H9GrkGQV1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 06/11/2025 23:24, Marek Vasut wrote:
> Fix support for build on 32bit systems. Include linux/io-64-nonatomic-h=
i-lo.h
> to provide non-atomic readq()/writeq()/ioread64()/iowrite64() accessors=
, and
> use __ffs64() instead of plain ffs() on 64bit number SZ_1T.
>=20
> This allows this driver to bind on Renesas R-Car H2 which contains
> Rogue G6400 BVNC 1.39.4.1 .
>=20
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Hi Marek,

My apologies, this one appears to have slipped through the cracks on our
end.

> ---
> Cc: David Airlie <airlied@gmail.com>
> Cc: Frank Binns <frank.binns@imgtec.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Matt Coster <matt.coster@imgtec.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  drivers/gpu/drm/imagination/Kconfig      | 2 +-
>  drivers/gpu/drm/imagination/pvr_device.h | 1 +
>  drivers/gpu/drm/imagination/pvr_mmu.h    | 2 +-
>  3 files changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/imagination/Kconfig b/drivers/gpu/drm/imag=
ination/Kconfig
> index 0482bfcefdde..6d177f0568cd 100644
> --- a/drivers/gpu/drm/imagination/Kconfig
> +++ b/drivers/gpu/drm/imagination/Kconfig
> @@ -3,7 +3,7 @@
> =20
>  config DRM_POWERVR
>  	tristate "Imagination Technologies PowerVR (Series 6 and later) & IMG=
 Graphics"
> -	depends on (ARM64 || RISCV && 64BIT)
> +	depends on ARM || ARM64 || RISCV

This seems fine to me. Do you know any reason why the single change
below might *not* be sufficient to support non-64-bit riscv? I can't
think of any, I just wanted to double check this had been considered.

Otherwise I'm happy to R-b and take this as-is.

Cheers,
Matt

>  	depends on DRM
>  	depends on MMU
>  	depends on PM
> diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm=
/imagination/pvr_device.h
> index ab8f56ae15df..efdd355005c0 100644
> --- a/drivers/gpu/drm/imagination/pvr_device.h
> +++ b/drivers/gpu/drm/imagination/pvr_device.h
> @@ -20,6 +20,7 @@
>  #include <linux/compiler_types.h>
>  #include <linux/device.h>
>  #include <linux/io.h>
> +#include <linux/io-64-nonatomic-hi-lo.h>
>  #include <linux/iopoll.h>
>  #include <linux/kernel.h>
>  #include <linux/math.h>
> diff --git a/drivers/gpu/drm/imagination/pvr_mmu.h b/drivers/gpu/drm/im=
agination/pvr_mmu.h
> index a8ecd460168d..6431e4314735 100644
> --- a/drivers/gpu/drm/imagination/pvr_mmu.h
> +++ b/drivers/gpu/drm/imagination/pvr_mmu.h
> @@ -85,7 +85,7 @@ struct sg_table;
>   *    notes on that constant apply here.
>   */
>  #define PVR_PAGE_TABLE_ADDR_SPACE_SIZE SZ_1T
> -#define PVR_PAGE_TABLE_ADDR_BITS __ffs(PVR_PAGE_TABLE_ADDR_SPACE_SIZE)=

> +#define PVR_PAGE_TABLE_ADDR_BITS __ffs64(PVR_PAGE_TABLE_ADDR_SPACE_SIZ=
E)
>  #define PVR_PAGE_TABLE_ADDR_MASK (PVR_PAGE_TABLE_ADDR_SPACE_SIZE - 1)
> =20
>  void pvr_mmu_flush_request_all(struct pvr_device *pvr_dev);

--=20
Matt Coster
E: matt.coster@imgtec.com

--------------g1CvrC8tnWXFlu7H9GrkGQV1--

--------------tdUAgJCGkvVTEV30LAhLuHs5
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCaVu4FwUDAAAAAAAKCRB5vBnz2d5qsEq7
AQDaLnD5UaF0i2rSD0aRbNkEg2VpXl/XyFFVD9clK5G6twEAyaRv9MbCHqGoC7O1L4uJtmnHSidg
pVZD+pVIDu3wxQo=
=5T5S
-----END PGP SIGNATURE-----

--------------tdUAgJCGkvVTEV30LAhLuHs5--
