Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16239A89E5B
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 14:41:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C2D010E368;
	Tue, 15 Apr 2025 12:41:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="Sd+r9ho9";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="clMFosTY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD19F10E368
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 12:41:52 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F7bPR8015459;
 Tue, 15 Apr 2025 13:41:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=BbzNK8v3cn5+9nsC22zq41hUr
 WL8ycUWG1fvEk9zuoY=; b=Sd+r9ho9nOU5vcOIvVSd5bws8e6xYExTFfCw0OExL
 LyjOAtmZnPDCayn/Ga0k7I2uVVaDy24IJmuVGuTdMCdOMIYpRnwpI2tKta0+5vJl
 QhUg+8U8cWBp/6+fIpTmsdjEurdWXmDEkeM9RzI+ZBF/cx++FSeB4tDU0V70SIoR
 ESNhAKstqB4qLtcB6GPcAkOWrj3TnfieyoToMpftuax+YnD6vHFiy1H0IKFkpHEU
 9ZeP/FkrWWW/moDZvCixl8fgAPq9TBbo8EzP/zKdK34vTJZtlHtsJuTICdLj3Cbw
 7jZ4aIXFur9FcwKAM2Tmcigs2Wtk3J/H7yADu4b99hikw==
Received: from lo0p265cu003.outbound.protection.outlook.com
 (mail-uksouthazlp17012050.outbound.protection.outlook.com [40.93.67.50])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 45yg8vt5u2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Apr 2025 13:41:39 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UmUgS5WNVMJWhHxJbeTPrtmQvANHSzxScqaAusdG4A7yAdRfz6aYuensac5Pvub+rR1KWEgKO1yuNgAQ1qewK1AX23g9WvTm3rpfpJ/RsAiuxG8VJXE3yuCZ/Z8PXwBFajDnQCKJY8ta44GBkyu9blipxaT96LXza7qLqHiiE/VX2cTVC6XZ3nn5L+qU0+9Fk147k+R/oX/iEPsJl9cyR1DehuWgIRUH/1u5WQzqGGBse7FgZBPARtDLB8hhE/6SwBQugQuTCBWWhQF1NnmQ0IpQkJ2QbcpBWfPj2mCCcdAc8tQNSZr1gGA1FHS2uMjWWKqeHOG+y664eCLvub9m+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BbzNK8v3cn5+9nsC22zq41hUrWL8ycUWG1fvEk9zuoY=;
 b=AENfct9B5MAsYm3Wi+MywVwZL7LpL75O7aputE/vMIDDqSxGDjOA9exXgyEx0wtDIZNnNNZWNMkrK4x8SnmnVvewzxfI3s8PGn+tF8nj7lg4evrPLTNT9OOa8i4ocg1fp8hVa3EvU64aBwN02taPS6RHOiMBU/3bTJX8tFHgqJAQwZW/GyKyeoDf0IzHZgslnv01LpvE/uouJAW+VJ5kLwVV6MZnsPKynPHL7sYIkChZa41uaqfd78XntoIPNfd3WuyLlZex1QrSYbTNXZK518aK+dfNdaJzjxlNwfyUa9grwdBxG54M6cjN61z+9kCdpCvd7REigGVQ+0po+8LRBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BbzNK8v3cn5+9nsC22zq41hUrWL8ycUWG1fvEk9zuoY=;
 b=clMFosTYsPCh9Su4WopoCnm0hr2xfo/nJiCxKYEdA06hFPYYeI1u0Yzn9tBE/L+JZaEZOvCEmrkyzBAi42v/BaEDxv8c9VHArDs9yQ7Tu8VW3z4InRSs2IIxdhJSQmNc5ILiGahgjP6sxqS6X/5ohCg7aX914Ztvt6oaJ4y7Ts0=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 LO7P265MB7762.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:414::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.22; Tue, 15 Apr 2025 12:41:35 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%3]) with mapi id 15.20.8655.018; Tue, 15 Apr 2025
 12:41:35 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero
 Kristo <kristo@kernel.org>
CC: Frank Binns <Frank.Binns@imgtec.com>, Luigi Santivetti
 <Luigi.Santivetti@imgtec.com>, Alessio Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Randolph Sapp <rs@ti.com>,
 Darren Etheridge <detheridge@ti.com>, Michal
 Wilczynski <m.wilczynski@samsung.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH DO NOT MERGE v6 17/18] arm64: dts: ti: k3-am62: New GPU
 binding details
Thread-Topic: [PATCH DO NOT MERGE v6 17/18] arm64: dts: ti: k3-am62: New GPU
 binding details
Thread-Index: AQHbqf6zN3wXIDnun0SR8Isnm2r3GbOks3MA
Date: Tue, 15 Apr 2025 12:41:35 +0000
Message-ID: <f15355f7-0b95-462a-873b-cd682fc530f2@imgtec.com>
References: <20250410-sets-bxs-4-64-patch-v1-v6-0-eda620c5865f@imgtec.com>
 <20250410-sets-bxs-4-64-patch-v1-v6-17-eda620c5865f@imgtec.com>
In-Reply-To: <20250410-sets-bxs-4-64-patch-v1-v6-17-eda620c5865f@imgtec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|LO7P265MB7762:EE_
x-ms-office365-filtering-correlation-id: 2feec3e4-6cf6-4673-2f66-08dd7c1adbaa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|4053099003|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?TVhVZkNIV29RemlOb2Rnb3NORHRTMVNCOTE4NHNnWUlsSENEcnhiYWgrUkQx?=
 =?utf-8?B?V3h1ekV4UkRNK3pkcFRYRE82S2tQU1NGR2NhQ3BHN0x3bjFrMTg1MStaazFR?=
 =?utf-8?B?VTJRMm53bWlFbFFVTUpZZDhuS1dmK25CN1ljbnpOa1ZqMTlWZzdIZjJFL2pB?=
 =?utf-8?B?QXhHVTB5Y1l1ZzFzaGF5ZnpMVnprSDZPdUwwcWd1Z0N2MGliNGc2dWpZQnJa?=
 =?utf-8?B?czZLd2EvenlKUWtlN0Rzazd3YVdmLzhza3UwejBPc0J1QXBIUGVNSG5CUHhw?=
 =?utf-8?B?OXNmYVNvbGpWREhxUU8wRUlod2N1TlNlNXhXL3RhVXFMUHQwMVUzL2FkNmth?=
 =?utf-8?B?N1hpYU1CQTlaaXUyK0pIMEU0ZHZacWpEeUVDOG81ZjNBd2lQYm5wS2NnTC95?=
 =?utf-8?B?V25JLzBvVHFWZzZ4UlA5cWhEYVlSbWJKeHJzRHdVMUp1bkQyaFF4Nm5KaFRp?=
 =?utf-8?B?eVd0L3lKN0RpcUY0Njlmb2gzcW1uK05zN3hiY0h3SUsrR3ZGcGpaTnNEMTlB?=
 =?utf-8?B?eHR4RklKZW1NajQvZ2FZR0E4enYwa2FnOFdieTVLV1pFb1V5emFCOStDRnNC?=
 =?utf-8?B?R0hNam0xam1kUFdZU3VFV2dyUncyemowTGswczJaMVVmOTAvS1VIZkxQVzR5?=
 =?utf-8?B?UDF2T2dhK0JnVEJKSGNIRHZVd055dW9sY25aeS9ad29WU3F4K1BLOHBvSGly?=
 =?utf-8?B?N2k3MzNDaXBnYXRsYlZ4K1NmemN0MWV2N0pnVDNwSW9Md2MvYW4rSDBJZ0hP?=
 =?utf-8?B?STNYeWFlYjJmcWlhQWdoNzNieTZ3aFhWcUtBV3hodU5HYm1BbjFyRDNBSWxR?=
 =?utf-8?B?Q0Jpb3QvRXRKTERYYVJPVkt3K2oySlZTWWJ2T0xvUVNiN3F2akdNdmFxWnNB?=
 =?utf-8?B?Wk5wbmxyVnVxaTFLTkRjRXplV25Cd2RMVktsNjFZSGw0NlRWY2hNYytJdXlr?=
 =?utf-8?B?cEpnU1Nwc3M3cENWYUhzUGJ3T2ZnWHpSU0gwUEFiTmo5N0h2VzNQWHJQNWti?=
 =?utf-8?B?TWJzZ212ZFc3ZmFtQ1N3MXY1NUt0ZXc2ZmU1eFFOaTVjRlk1RTZqQnNTZ3JP?=
 =?utf-8?B?TTJNbnZuNkZQVFJGakh1cEZxL3FiTmZFSFZPVktIUEliRzVkUFZFaGFxcTI5?=
 =?utf-8?B?WkpGa0ZraG02WE9wOFlEY3JRR2VrbFNUY25Zbms1SFd3Nk9SYm1GcE1lRkNK?=
 =?utf-8?B?a1FqNmZoMFp4NkR4aUphQXc2OEI0R2Q0RlJWM3BxU0d3RHFYdFhUUE8wSDhl?=
 =?utf-8?B?TnZOZ0gvOTE4ak1sQ2ZLYmZpMFRDV2dOY2poUGJMVTg2L0VSOHVBTC96RFRF?=
 =?utf-8?B?NHR3b0swWHVxYUcrcDBVYlFtSzN2WXdSTU9ES1V4R05LSkVlL09MOHJpNm9E?=
 =?utf-8?B?c1VyVzhrNlJIenhsKzJXNitmaTliK3ErRmdVanBFNUVkZ1Z3N3BrNTRLc3pK?=
 =?utf-8?B?L29qRjRoV2V3ZUJqekJta3JuSy8zVG05SXlZMlkvUkNwQ09tejZ0K2F1VEQ5?=
 =?utf-8?B?RjcvcEY3ZlVZSWR6aEV1U0hoWlhDWSt2MStyanFwYXhVbnFKa29PaCtEbHMz?=
 =?utf-8?B?ZWF3NTFhUFVJYm9VdzUyTnhjY2RWR1lhL1NMdGhjMGVsVXl3UFR5MnJHcjRK?=
 =?utf-8?B?d3AxN0M3R3d5ZUc1S3dINjA1amZMeUVjcnVnNGZtQjZPdkVsK1JZTmIxR2JY?=
 =?utf-8?B?M3M5MG1neDZBUis0TWZLSHZkMmVSM1dUS1dOU25XV1laNndsQmZBUjRKQ0JN?=
 =?utf-8?B?MU9aZ2lkQVVDeWttTXUwVjk0UHo1N0hpOWZjM1MxY2ZMamFKaW1rZm5KVEdP?=
 =?utf-8?B?SDBtZVBBdVIreVdsdmFkMFpZZlBBTHV6d0JZVnVOVTRSSGRwbmRET2xTVWpk?=
 =?utf-8?B?eWdUaFZlbFBsT3RPcjlORk5oejNhM1hTNlR2azQrZXh1VThIczFCUkFBVmkr?=
 =?utf-8?B?eU9DL2xLb3YvQVdnVzYzZm90U1J6V29WQTNDSWFxVHdybzNLcDVuSFM4aHVk?=
 =?utf-8?Q?6s/hvay+u8/olndeftmQptWFL0K6MI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(4053099003)(38070700018);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y3JJZDZydk9sMVNVMDRZL3RRY3kvYXl0S2R0MFRMeWZ3TDMzQVBGcEdhKytT?=
 =?utf-8?B?LzhGT1paVkhaWHc0QmNRSEZXRlp3R3I2NldobnpubFVLWGQ2ZkRpbXliR3lz?=
 =?utf-8?B?LzRXcWgySlh3ZDJuZ0JUYzQvS1BXa0JCYWhnZ2hyd1BWOTNVUHl0L29EelNs?=
 =?utf-8?B?YVQ3TlhOSWdyNDFMcEg4MUtaRmhZTSt1d1RNVXExSWJRTERPWDZ1ek50eXNt?=
 =?utf-8?B?RVZGQmE5S0RwTjVoNDdkWngveFhFZ0xzUWRGbWRXV2hlY3Z5WjBvTjYvQ3l3?=
 =?utf-8?B?RUpUYnZDamM1NFJ1MTBGdWo4QVVPV0I3djRsNkRKMUZuRDBmSWF6VGJ2YTFr?=
 =?utf-8?B?ZDRhaTR2eXJzbGdmWmQ5OFY5S0ZTeDRMTHZ6Rm42VWREMWFpVCt1dGZRTWd4?=
 =?utf-8?B?clErb1h5V2cxdlkreGhGMFNZNnZHMkpvd2ZML0NweHdYYWJhbVB4V0lVbEV4?=
 =?utf-8?B?N1IyUTV6OEdlTnJTWTMzRGN5SXpWcitvNnpsY3BwYS9xSlNLbDNjV2xJOFlH?=
 =?utf-8?B?TmlKeXQzdnNORytLK1JJVCs4bG5ZSEdLamlISW9iWjlUQm4yci9tcGVzbVRE?=
 =?utf-8?B?MDk1OFlpUVFXeGJxS1dBSkp5RXEwajNoZVdSckg4RUpuOFUrVzQ1aURnUWp2?=
 =?utf-8?B?c2IzekZXbVM2SkRaRkhXMVI0VWN3MkZmK2dPMzRaVWNKMlNwYkRnRkpnNnRS?=
 =?utf-8?B?Nlp0Q2xsemZYUzZ4WUk1Y0MvMThocWhLdThrTDM4Tzh0b0Z2bWxKR0YvbHNS?=
 =?utf-8?B?cmQzdFgyalFuWm92NzZDdFl5MWJoT0RIdmlJb3M4c3AwaXBtYjFiT3I4ZkJy?=
 =?utf-8?B?amFsUjRIell2bFlXcGs2YURtWG4vZy9pNTFMWm9lOHBRR2lreTB0Z0ZsdXhY?=
 =?utf-8?B?alByeE56Z1ZJK3hFWWk4RlVydlhOMU5IWFdCS0JHOEdoTnRKcWxzeHNpZkxj?=
 =?utf-8?B?SmU2ZkFWQjNFUlhBRE15bER2WlVQY1JyR1ljSHhKbTFVS1laRS9UbzQwVlpK?=
 =?utf-8?B?VmthVDR1K2NnMlpyNHBSMld5dmUwbDIwY1owNmxJTFAwdzNCNC9PMHBLcnJx?=
 =?utf-8?B?VlFSMkhhVSs2UmRaVEJoRVl1K2FhVStWNmlabkk2Yjg3WW81N09sMlRiRnQ1?=
 =?utf-8?B?R3hlUmtrTnRWTUMyb2JuUStCbjBSeWdmUXVROWo0MWRneEd4L0VEQnM5N3RO?=
 =?utf-8?B?ajJSUkpSQkpsMXRGWm9BNDRTSWFWK0JXejNEQjV3NjNuYUZYLytvM0FqN2Zi?=
 =?utf-8?B?eUREeURTVWRUZmF6dkhJc3RrRC9vbzVqUkJ6Z01DcjRxQVZMNjNQYzhHcWJa?=
 =?utf-8?B?MjUwbXdBWHpYZFpVeXQ1Q1czNHRXMnluUWw3OVQxSjZra0h6WXM1UGdYTzJX?=
 =?utf-8?B?ZmJmVXhjTCtoVGJXYlpPd0NqS2IyaUZwMmtYYVpyTHlVeWF2QkEzNmVxeDVP?=
 =?utf-8?B?NktGSWJURkFRZnJZSWVGVHYxRFVxVDd4d0NJTm50SU9qOUxvV20zOFBlRHhy?=
 =?utf-8?B?OU10WGt2MnE4WDVpTkpFbmFlZGE0YVI3eUVldVhCQnRISko2MThzS1VKZ2pw?=
 =?utf-8?B?YkpjZXpXT0ZiSWNsOFZnbjk4NEhXWHN4YjlXRDVQYXJxMGE5Q3dpQWgvaHl2?=
 =?utf-8?B?OWRta0pscU1qajIzbTBCTmp3a3ZxaHFMeUcxRWQxZmlHMWM2T0oyMEo3OGFa?=
 =?utf-8?B?dUNmbDBrMkhUSjVkc3N5ZGpveHNkeXY2TmZuSXVlUTZYVFUrSkxCZVIzZTRs?=
 =?utf-8?B?OVN3WVJJUmlNVTBINUMvTHh2SE40OGdTZElXbFQ0SHhRV2lWNXhzaDdDTUEx?=
 =?utf-8?B?RUVXcWp1YW5EalpmWG9KakY5YmdpVFk1REtsWE9vV2ZoUWl4SjgwZ0pHVitn?=
 =?utf-8?B?MDdGUHl3Z3V5M2E5NDc3cHdsaERmdXVzcXJzUjc5aFpMMm5EVm5hQkw0T2Mx?=
 =?utf-8?B?REhWUUFTZGttNWdUK2VRZEdQdDJuTktuTUtZRHB2TVVjMFlraDVOanptbEZj?=
 =?utf-8?B?czBwWVBqc290Y0pWUEZIZG1ybmIrc05raUtGN0cwOTdCelFqR3FxUHF6Nk12?=
 =?utf-8?B?YmZ2WXRjZUk1NUJtWHJ4QVZOTHl2dzEyMHVHUWdlMXdld09PYVhoOTJ1T0Nz?=
 =?utf-8?B?amc4cUc4QThkQ1I4WXEzK2hMRjZ2ZnJnMXBpc1VLOVp0OVFuN29sL2haRXRV?=
 =?utf-8?B?MHc9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------obGn4LxPcwNiOcpogGaru9JN"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2feec3e4-6cf6-4673-2f66-08dd7c1adbaa
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2025 12:41:35.2404 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O3bGtirjQxGJNpVw8nBuDzJMrEoJ84fCuhQhxQQPtTxt+NWYxE3Se048gfPuyuKd245Ary/aqUmCwB4yJn+q7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO7P265MB7762
X-Proofpoint-GUID: 16a0V1RLRVJyecZPOAHiwaMAvOdrrVch
X-Authority-Analysis: v=2.4 cv=OMsn3TaB c=1 sm=1 tr=0 ts=67fe5404 cx=c_pps
 a=dcRbu0n7HPsro7Pn5Q0Myw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=NgoYpvdbvlAA:10 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8 a=iICKLq0zw37mt1Z5_6UA:9
 a=QEXdDO2ut3YA:10 a=r0LeN75o1xWKwdVsTeoA:9 a=FfaGCDsud1wA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-ORIG-GUID: 16a0V1RLRVJyecZPOAHiwaMAvOdrrVch
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

--------------obGn4LxPcwNiOcpogGaru9JN
Content-Type: multipart/mixed; boundary="------------q8107VUZJRzIpXMVcJwKU2tO";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tero Kristo <kristo@kernel.org>
Cc: Frank Binns <frank.binns@imgtec.com>,
 Luigi Santivetti <luigi.santivetti@imgtec.com>,
 Alessio Belle <alessio.belle@imgtec.com>,
 Alexandru Dadu <alexandru.dadu@imgtec.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Randolph Sapp <rs@ti.com>,
 Darren Etheridge <detheridge@ti.com>,
 Michal Wilczynski <m.wilczynski@samsung.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Message-ID: <f15355f7-0b95-462a-873b-cd682fc530f2@imgtec.com>
Subject: Re: [PATCH DO NOT MERGE v6 17/18] arm64: dts: ti: k3-am62: New GPU
 binding details
References: <20250410-sets-bxs-4-64-patch-v1-v6-0-eda620c5865f@imgtec.com>
 <20250410-sets-bxs-4-64-patch-v1-v6-17-eda620c5865f@imgtec.com>
In-Reply-To: <20250410-sets-bxs-4-64-patch-v1-v6-17-eda620c5865f@imgtec.com>

--------------q8107VUZJRzIpXMVcJwKU2tO
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 10/04/2025 10:55, Matt Coster wrote:
> Use the new compatible string introduced earlier (in "dt-bindings: gpu:=

> img: More explicit compatible strings") and add a name to the single po=
wer
> domain for this GPU (introduced in "dt-bindings: gpu: img: Power domain=

> details").

Hi Nishanth, Vignesh & Tero,

Now that P1-16 have landed in a DRM tree, what would be required to get
this and the subsequent patch landed? Can they be reviewed and applied
as-is, or would you like me to send them as a separate series?

Cheers,
Matt

>=20
> Signed-off-by: Matt Coster <matt.coster@imgtec.com>
> ---
> Changes in v6:
> - None
> - Link to v5: https://lore.kernel.org/r/20250326-sets-bxs-4-64-patch-v1=
-v5-17-e4c46e8280a9@imgtec.com
> Changes in v5:
> - None
> - Link to v4: https://lore.kernel.org/r/20250320-sets-bxs-4-64-patch-v1=
-v4-17-d987cf4ca439@imgtec.com
> Changes in v4:
> - None
> - Link to v3: https://lore.kernel.org/r/20250310-sets-bxs-4-64-patch-v1=
-v3-17-143b3dbef02f@imgtec.com
> Changes in v3:
> - None
> - Link to v2: https://lore.kernel.org/r/20241118-sets-bxs-4-64-patch-v1=
-v2-7-3fd45d9fb0cf@imgtec.com
> Changes in v2:
> - None
> - Link to v1: https://lore.kernel.org/r/20241105-sets-bxs-4-64-patch-v1=
-v1-7-4ed30e865892@imgtec.com
> ---
>  arch/arm64/boot/dts/ti/k3-am62-main.dtsi | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi b/arch/arm64/boot=
/dts/ti/k3-am62-main.dtsi
> index 7d355aa73ea2116723735f70b9351cefcd8bc118..d17b25cae196b08d24adbe7=
c913ccaba7eed37eb 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
> @@ -691,12 +691,14 @@ ospi0: spi@fc40000 {
>         };
>=20
>         gpu: gpu@fd00000 {
> -               compatible =3D "ti,am62-gpu", "img,img-axe";
> +               compatible =3D "ti,am62-gpu", "img,img-axe-1-16m", "img=
,img-axe",
> +                            "img,img-rogue";
>                 reg =3D <0x00 0x0fd00000 0x00 0x20000>;
>                 clocks =3D <&k3_clks 187 0>;
>                 clock-names =3D "core";
>                 interrupts =3D <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
>                 power-domains =3D <&k3_pds 187 TI_SCI_PD_EXCLUSIVE>;
> +               power-domain-names =3D "a";
>         };
>=20
>         cpsw3g: ethernet@8000000 {
>=20
> --
> 2.49.0
>=20


--=20
Matt Coster
E: matt.coster@imgtec.com

--------------q8107VUZJRzIpXMVcJwKU2tO--

--------------obGn4LxPcwNiOcpogGaru9JN
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCZ/5T/gUDAAAAAAAKCRB5vBnz2d5qsK4J
AQD9uHKMbp2KFZORVrKpjrqcHifoLXX5RN8eY6lWi45flwD/S27Ar/NFW9r+moPBdKSK9rZ4Tce+
psIP6z6jsB1bUAo=
=yuOt
-----END PGP SIGNATURE-----

--------------obGn4LxPcwNiOcpogGaru9JN--
