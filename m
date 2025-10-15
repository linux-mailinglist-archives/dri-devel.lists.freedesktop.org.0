Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8190CBDFB5B
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 18:42:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76A9510E880;
	Wed, 15 Oct 2025 16:42:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="ZhhYMCvl";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="QGUbBi8I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D67C410E880
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 16:42:00 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59F9AIQ72989588; Wed, 15 Oct 2025 17:41:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=+37frMuSe0xdXj6c2WEEtjEqG
 TY7Iqw833B4N7Vmfo8=; b=ZhhYMCvlcmPCdrR636ztJGZ9mEiEEBfFcsVBS3yLZ
 8CCP7QkYaLQ3nbz7A1IAMDziZQcRpnIcMZUQGEs5ZXNfMUlLKNsi3xTzie2SKswD
 cXkmSnqZHET8zSXcwT/Hu4LNK/nhqtBLAFj4eRs5LZPfGm9ighHKb9tegF2RZPkz
 3JoeA+a2yUP5iJOXLVDW4hVeZ6tRGqwXPL3CnRWqIk4M4M2EPxwD3Op67yOFFG5J
 jw4R6Yiyee2Pn9OoMc6JbFzBLTRnmTQhLhsOUXyqYHH8lUQIHp33dQA6HI3NSeSY
 3EtN9qANKXrM3IVEIQsulfpWhvgtG+xhuMxNoo8WuAgTA==
Received: from lo0p265cu003.outbound.protection.outlook.com
 (mail-uksouthazon11022099.outbound.protection.outlook.com [52.101.96.99])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 49qfarvfdf-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 15 Oct 2025 17:41:22 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JR9pq1xBJD9DUxZ7FoP+qoaNEtlI6EXxWPjKJUclf86Pqo7lpkH+CgDqMfuT1QQF9vD4qskngTph5X/roTxE8FWVsrOD7dZoDQfSj6jcYtX0FxlYMON3LXgfv/f7/IN0CJkyXe+VCc1pz+57pXvVCMVPeW0BcTeynPQl9Z8RqSsrrIB+iHhmy6h7gVu2ghtl+TIuhuw/4Uxw6R8MMPyyFs2MCR+oF8iY908BpUxyeqwQpXUUV8ZRqj9TL9jZNymiXo5eu0PNq14mqAT0CGnD6WvKs+8tOdKTy219rtEMOVZpllQQOyy82JTYtoThPUGFPBVslckwoS+ENReI+o5OFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+37frMuSe0xdXj6c2WEEtjEqGTY7Iqw833B4N7Vmfo8=;
 b=y3qC+ucHRsS/IiabpPpBjp3fMsWNsF0hESLdK0tCaq8HmPhrQsmGs8Ppz/erS3au/vdO7bo9kIO1pmpXjMCF66i+X4aMdZovIz25NE4nhB8llbUJeq1JS370Dki3dWdcwBrGuCvH/XeGUdCx4OA3K+qfNgA0gJY10rhy1WZOzx4JL63a14sFjBvdpft6R9Ny2LgbFbIgzj6EaP3ofQn8H5yrxw7kpoMlOpOl/TSjQ5sEKSAyCa9NWvrQTOmvQNmHWuHbio8xSksUqCAvQ2NOgbFq/DbiYbtGarlc7f+IMZr7n2dYyX88AcEInPesENuKnxf8F8PJHqKoHnrW6/92MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+37frMuSe0xdXj6c2WEEtjEqGTY7Iqw833B4N7Vmfo8=;
 b=QGUbBi8IwNdLNFsAMhEXPRowZ73Ml1Cxyf5uGu2jZCpkjB8KDYAkvdaNxtHQYU312UECCDVLjGojZuXaKuVsXRZrta9zZZiEMPioLYxmcWcvsD3xVsxvxme4NB1MDlTKffwpi3NZBHf3CqxyZPPT68TWm1gr94Oh80pZgSeVSvI=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 CWXP265MB1959.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:83::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.11; Wed, 15 Oct 2025 16:41:20 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%5]) with mapi id 15.20.9228.010; Wed, 15 Oct 2025
 16:41:20 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Ankan Biswas <spyjetfayed@gmail.com>
CC: "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "himal.prasad.ghimiray@intel.com" <himal.prasad.ghimiray@intel.com>,
 "dakr@kernel.org" <dakr@kernel.org>, "robin.clark@oss.qualcomm.com"
 <robin.clark@oss.qualcomm.com>, "matthew.brost@intel.com"
 <matthew.brost@intel.com>, "aliceryhl@google.com" <aliceryhl@google.com>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
 "khalid@kernel.org" <khalid@kernel.org>, "david.hunter.linux@gmail.com"
 <david.hunter.linux@gmail.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-kernel-mentees@lists.linux.dev"
 <linux-kernel-mentees@lists.linux.dev>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH v3] drm/gpuvm: Fix kernel-doc warning for
 drm_gpuvm_map_req.map
Thread-Topic: [PATCH v3] drm/gpuvm: Fix kernel-doc warning for
 drm_gpuvm_map_req.map
Thread-Index: AQHcPfKITy8hEWnYIESXQ5vTBN2XCw==
Date: Wed, 15 Oct 2025 16:41:20 +0000
Message-ID: <46d01053-c37b-4094-a333-dd12d06f6cde@imgtec.com>
References: <20251015152543.24368-1-spyjetfayed@gmail.com>
In-Reply-To: <20251015152543.24368-1-spyjetfayed@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|CWXP265MB1959:EE_
x-ms-office365-filtering-correlation-id: 56f6840a-67a2-42f4-ab37-08de0c09ab52
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|38070700021|4053099003; 
x-microsoft-antispam-message-info: =?utf-8?B?b2NNRldnR24wMFRlWDZ3dUN4TEYwUDlkWDdXRWRLUHo0RTRwL1hncVNYRlA4?=
 =?utf-8?B?Z2UvOFZXbXE1akpTYkd5cjNBbndYV29FakdnOU1LMXFJZDg2dDM2NTgwL3Rn?=
 =?utf-8?B?ZXZUK0xBcnRKTE5oTVJuVEZPWTZBWkZYTFlUVHJxQ1NFb3BjSk9ZenFXL1pN?=
 =?utf-8?B?TGdJTnE5WGJQblQwYXpGeXJNdTR3d2JjbkxESzVjTThETzBzVGllaDc2RGNv?=
 =?utf-8?B?ZEMxb3pVMFVGSkoyZ0IwRHlNbHNwSXUrcEFOWWVOTlQ1RTl1Z0grcWYyL05B?=
 =?utf-8?B?QklJNFNMSldxc2EzU0xjbDdnclJZZmZSRElpWGtiazRvV1pHazFPamI2NkVw?=
 =?utf-8?B?ZEpPaDRhVm5XM011am5lQzY4UW5YTU1YL29zV3pQWDBsQjdOejROVDRWbC9S?=
 =?utf-8?B?cGo3QUpaUnlDdVN4L0tsMk0yNDltd0lTZEtkZGo4VDBhOXlMS0lDcVAwejVY?=
 =?utf-8?B?Y1dmYjJPTjAvL0FBTGJlZ29ZUjh4TnRRNGZML3FtL2hqaGM3bXNtcDN5MlV0?=
 =?utf-8?B?cWV1clp0dEc2THpvN2NlVjdFT3VZZVIwYlZBWlAxTnNSTHd1NjlWanFtRHhr?=
 =?utf-8?B?Q0hQM1RhL01tbk95dUNxb3hKTW11Ylo1YWlDZ1Y4ZVlRcnVVNTdtaDFBY3Jv?=
 =?utf-8?B?TXZ6K0FoMHZPeUdmamhNTU9sOENpRG1EbzQ0b1d0VGE4NVA0cCtKdkE5TEZ2?=
 =?utf-8?B?Y3NNQmtuNFhtT2x0RFhWZXlXNTI0SUpCeVhkdHVOa1ZzYU5jRUZKOFZUdElh?=
 =?utf-8?B?SVk0TitYUFJhcDgyUTAzaXYyUEQxN0RtS1Y4eGIzRXhTYi9BWjJ2ZHhyd2xx?=
 =?utf-8?B?UmxzOTllOVZ2TFdJUXhmU2pNTEdRYS9RQzAvYVF3RUFXUHVQWUxGT0trcnlX?=
 =?utf-8?B?STFSVjVQb3BQWjNPQnljb3NkYUw5S0dPTmxZWHJHUmg5aU5yYjUvVmNiWHU5?=
 =?utf-8?B?bDFaWnR0ZlgrWFpzN3l0RTdHc1RXVjZTNW1ranYwT25QOGFIT2F3NTkrbjUy?=
 =?utf-8?B?emtFODRhd2k5YmFvbDZ4NktidUVUaWVVdE9RejkrZFpkc0NBdGwvYUV0ek15?=
 =?utf-8?B?OXUzYlVhWEJVc3VLL1U3NXRoQTBqYWdpSEZpNWRyZHQxbkNtMWZ1U2xaN0lu?=
 =?utf-8?B?dVo2YWwyOExLbk9FdFhGQUZkYzRSSTMwb29yZFFEV0pZQkNUNTZTZ0Erbk40?=
 =?utf-8?B?NEd0d29Ib1lnVlg3UkxDYk9rSlFIeWVTM2VZaGp6Um4zMzIxT2E3QTNzS1dT?=
 =?utf-8?B?WUdLRVNhYzN1MG5UenI3MmtwNnhIU1c5K3JyWFBWVHY0ZkVhQTRyYUNuVm1L?=
 =?utf-8?B?SFlMTmZleUFEWDRPN0hhaU5CTGZTc1RjUGJqdUI4WnExSVRWRFpJY1VyY3Ar?=
 =?utf-8?B?R1p6K0ErQU8yZ203dHdHSC9hdWZWV1o4NWF4RmxKOHdqQ0djQ01PMVFFR3h3?=
 =?utf-8?B?czFYNmljdDY0bDd1aDMvVWF1azVCUVJvV0hMS1czMGg2WVZEOGxsYTRYdjJa?=
 =?utf-8?B?R292NDBPdHF0RWNZa1RQNDdxRXhVTFV1RlJoY3dJOHJ6OG1iQWxLR1ZnOThF?=
 =?utf-8?B?cFg3VHdQOU1kKzA5Z0NKa3dyTDFVRlhaRnZkTndBT3V6RTJTeTdJT3lSNzRI?=
 =?utf-8?B?RnhBRkd2S2JlQ1MvSi94K1lzK3VydnB0aTBGam9xc2ludjJ2ZFFLanJlVlZC?=
 =?utf-8?B?cXBjbU1RS2hjVkNndHVEUjhWb0R6NThEblpIRHpKV3U0T3RtdDJXL2NMb2dS?=
 =?utf-8?B?aWdLVitqUDlIODkvUEdZM0N2T3JnVjM5M2prSkxla3hTQjJWWXVGTFhwMlZI?=
 =?utf-8?B?ZkJ0RzB6YkN6NjFMbnY3ZHRpZHNwNnJYdGh4aXhCczBZWHRsL3o3YWNFZUR1?=
 =?utf-8?B?RGxLNWRObDI5OUdkb05aQW5uWGRZYkpNK0h6Y0VuamdWMWFPdVRCWlpIM0ZS?=
 =?utf-8?B?NXZ0dXlKc1lVZVNmZkdhTDlLS0xzTDVwck8ySVdPeGxVTm53TmYvei9KZGtk?=
 =?utf-8?B?WGNla05zSWxnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021)(4053099003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dUZKTkVRUENIcVo4ZThRT3YwOWFiNlQ5ZkdYcnkrNGdodlNHRU8ycnpvOHBs?=
 =?utf-8?B?YkFHTWZ0Uk5VWkptVDJSYnA1UUlpNE1VaG9mUUcyMy9RVmZ2dTFZM0FDRExY?=
 =?utf-8?B?T0l2aXFmS0FPSEk3R3dlL28zbkdpT0lTYlplYm4wU2ZTOUVBc04rODVkOG43?=
 =?utf-8?B?SFBIeHdsOS93ZGdjNmdocGhRWDMvR0psL3Vaa09aeU95ck5HeENmc1ROblJW?=
 =?utf-8?B?dVVoejZJS3didy96bTNpR3RVR2hPakw5WjRZQU5CZmk2WXdqTjhqSXRrdjhy?=
 =?utf-8?B?elRMdjRVbG9EU2hUR3lpYVBnS2tOVDkwbFhwSXJybkhCTHlCL0ZObEFmK0RX?=
 =?utf-8?B?Y05JSjRXbk9iLzRCWlBiRDBhWUZFQlBHTWVBNjNXUCsrSVVzUHRQek1HN3ZG?=
 =?utf-8?B?RStIbXFIUENqNTh6MkRMTnB6ZHJUcVRVSXF0SmwraVlOcmdGOSt3NDdnRG5m?=
 =?utf-8?B?b2xiN3ZxMUlJNWVONnd5eDRXSWhMNE9pSzhpQlZIOHR3aVBmZnZNc3NqVzNT?=
 =?utf-8?B?d1NWb0VhQmtkSkRROTk1enVmeXdUQnNjelhjbnEyVlM3NUo5Z1dxRlYxQTgw?=
 =?utf-8?B?TUo5a2FpL1hjNU05Tk8ydG5OdzIzeGN6dm01TDE0b201SHBEZGk2ZjFZeVly?=
 =?utf-8?B?YXkxN2pPbDB4ZXYva1NtT2lQLzZBY0p1SFRmU0JTUEI0N01zUXQ0UDhkZ1JX?=
 =?utf-8?B?eVBBL2ErclZZdktEMGZFT0hDZ21WeG9TQ0hKSkhmUm1Pb1U0N0pSK0t6cGtn?=
 =?utf-8?B?eURQaXRTM2lWVnBPWGI0NUNyeUQ1T1czN0pLclEzcU5hZml6MjRpV3ZRNTJm?=
 =?utf-8?B?UTlEWnMvUDJUdm5FNW53NWJ2ZHNmZEhZZUkyNW1OTGE3VGtVa2ZuRExXN1Ba?=
 =?utf-8?B?MG45bnJlSmhmZTJmNTB2eVE0R2V3UE8xUUZlcWQ5dC9vajhHbFQ1TXFrektN?=
 =?utf-8?B?d1ZzWGc5TithR2Z6bkU1SXJ2eE5jZGtPRFhITmlQa29MWHg3RWdsMnYraFdJ?=
 =?utf-8?B?SE43Y08zSnl3THVBVWhLSkhOU3BiZ3hodkN3WlAyR0VERHM0Qm43NklhM3Vt?=
 =?utf-8?B?c2dWMm1VWnBrenIwUzZMZUJrMkZCVzA0UGxES2c0cVNKUzlHUTJSb1BCL3FZ?=
 =?utf-8?B?Q1dJVVZVampOUjhwRVNpaThMeUowWE1FTnJUMDE3VTExTDE4QWlqdmFEdUYv?=
 =?utf-8?B?M2k1eDFtWmlhWXBXcFYxVlBoOVJoUnZVUi9VeUp0TERqdzByN0NLdzd5ejRo?=
 =?utf-8?B?K2ppQWl6ZCtPSEhsdTM2RWtJeVRianVNemVPVlVvc282ek9ES0xiazFkcDFZ?=
 =?utf-8?B?TmZwWnJTZ2Q2OWMyazZKT1Fpa1o1SEpMK3pDakNVN0wzMWVDc3cvM29SV3hB?=
 =?utf-8?B?TXM0WXJYendiQ3BTMUw0MVErZVUrSUkzbEtmS013QUlDajFUbmNONWRYRWU0?=
 =?utf-8?B?a0xlbWdnUTloVnRCSGRRNVZWVFl1VUcwMGJKSzdWbnI2TUVCUklCOVdGSEJh?=
 =?utf-8?B?SGJ3YWw1QU8zUXFldG8rN0x1dXp2bkxBa2QzbVFrWTl0YXd3TUR2VWlra09I?=
 =?utf-8?B?eXdnL0tkZlEvWHhSN2plaUluek5WT2dsYWt1VE1hcldDSllHMy84VElQaUhw?=
 =?utf-8?B?dkpRR1RUSmowOTk0VXovUHR0WlpxU3ZBbUVMY0diN0x1UUttdnJzdG9yT2t0?=
 =?utf-8?B?ZERVeW54WENEL01Zd2xRd29GVnRUWms3V1dzVmc5YmkyNkVvaUw5bTBoMlJi?=
 =?utf-8?B?WXNnYWtCejFXbk15VkJORUlZYUw5OUpuZHJ0SzBTTG5ZcURiRnNxaW5NWE1H?=
 =?utf-8?B?NE9oY3lVanBXdG1CdHBoY0JRczhwK29hanFGZGVRbXFUQUdMaDEvS1VuR1Vv?=
 =?utf-8?B?SVNzQ3Y5OUhKU2Y2c3JlVkVISzNNZS93SmRQOFZtQjhRTXE2c3J0dmwySFdT?=
 =?utf-8?B?Z2tCYUV1RVVRTGVFeG0vWmNpaWppbW5mbHZzR2xRRUJRd1YyaEhOUUgyNkJj?=
 =?utf-8?B?a05odzlLYnhZNzRoUERNSytEV0N6QVdxQVpHK0d2THFmUzRBVE96aVoxdDlK?=
 =?utf-8?B?S0hjcWYyd3M1VTYwMGdKUzhETVY2VlhiYzdva3RVVGJORjlqWFNqZ2VUWi91?=
 =?utf-8?B?Y3NtTy9FZjZLWGowQndRdG9zOUFLNUFvQVVhTkZpTWhGNkF5bUxMVTJiMkpr?=
 =?utf-8?B?Snc9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------fNGKag8HLlu6vImAmmahzXWL"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 56f6840a-67a2-42f4-ab37-08de0c09ab52
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2025 16:41:20.1513 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d8/uNOg/vJgMVwrTPtwqaOwpxMbTnbG2NSIk4C1Bm1KYsHUMF0toT3R0J178++BW06gC73KDtS1OcC2SuDs+9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB1959
X-Authority-Analysis: v=2.4 cv=O+A0fR9W c=1 sm=1 tr=0 ts=68efceb4 cx=c_pps
 a=2Ko8lJ8n80rQhDUbKm7FCg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=NgoYpvdbvlAA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=rOUgymgbAAAA:8
 a=pGLkceISAAAA:8 a=r_1tXGB3AAAA:8 a=oVh64DeYfI8Bqwva69EA:9 a=QEXdDO2ut3YA:10
 a=B7xP-vK_eECbdFz5I-AA:9 a=FfaGCDsud1wA:10 a=MP9ZtiD8KjrkvI0BhSjB:22
 a=t8nPyN_e6usw4ciXM-Pk:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: B7kAkzmO7zkIbR02a-4RSXG-DsUj97se
X-Proofpoint-GUID: B7kAkzmO7zkIbR02a-4RSXG-DsUj97se
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE1MDEyMCBTYWx0ZWRfX01jI8kUNdwm4
 2CwKKOZTuqrvMsZhHWXfZhILldd582CPVIZ01bRqSjAT5gSC6GJPy7ZfWe4uCtkXGBPpMNBLHai
 4i7Xd2Ox1f8TD7mNHevx7upmBLNghv/sw6C7fmHr5J04wU2TS0azh+2fHkmgpLbmOb/GJsWeWuG
 JNgBmuD+Pkh1GkFBhTsokt0AMMcXaidfzdaxGb++hOqUIIyrKdaCRZAB/dySN18kuy8f4T6Km5j
 x4R4VpRwM+zwZsaV55MYe1gZY1/P56lVEDz+sR7qGiqbd7vgB/I9119nd/1BqrM3ngVC0kX4/PR
 rtqY7EHWT2ZuGfAAvN/+mIRZZ1I3xuiXHAE+bnMWwZnJoY96IbZ79ftYKMU3K1UxguoqvO/eW43
 LbbKCSkpe/g5rrYemD0Itcw6NipEQw==
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

--------------fNGKag8HLlu6vImAmmahzXWL
Content-Type: multipart/mixed; boundary="------------HLLtbeaguk4vHb9BamkmGTYT";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Ankan Biswas <spyjetfayed@gmail.com>
Cc: bbrezillon@kernel.org, himal.prasad.ghimiray@intel.com, dakr@kernel.org,
 robin.clark@oss.qualcomm.com, matthew.brost@intel.com, aliceryhl@google.com,
 thomas.hellstrom@linux.intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, simona@ffwll.ch,
 skhan@linuxfoundation.org, khalid@kernel.org, david.hunter.linux@gmail.com,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Stephen Rothwell <sfr@canb.auug.org.au>
Message-ID: <46d01053-c37b-4094-a333-dd12d06f6cde@imgtec.com>
Subject: Re: [PATCH v3] drm/gpuvm: Fix kernel-doc warning for
 drm_gpuvm_map_req.map
References: <20251015152543.24368-1-spyjetfayed@gmail.com>
In-Reply-To: <20251015152543.24368-1-spyjetfayed@gmail.com>

--------------HLLtbeaguk4vHb9BamkmGTYT
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 15/10/2025 16:20, Ankan Biswas wrote:
> The kernel-doc for struct drm_gpuvm_map_req.map was added as '@op_map'
> instead of '@map', leading to this warning during htmldocs build:
>=20
> WARNING: include/drm/drm_gpuvm.h:1083 struct member 'map' not described=
 in 'drm_gpuvm_map_req'
>=20
> Fixes: 000a45dce7ad ("drm/gpuvm: Pass map arguments through a struct")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/all/20250821133539.03aa298e@canb.auug.o=
rg.au/=20
> Signed-off-by: Ankan Biswas <spyjetfayed@gmail.com>

Hi Ankan,

Thanks for the updated patch! All looks good to me, so:

Reviewed-by: Matt Coster <matt.coster@imgtec.com>

No need to send a v4 adding my tag, it'll get picked up when I apply to
drm-misc-fixes on Friday (assuming nobody has any objections).

Cheers,
Matt

> ---
> Changes in v3:
> -  Addled Closes tag in log
>=20
> Changes in v2:
> - typos fixed 'map_ops' -> '@op_map', 'map' -> '@map'
>=20
>  include/drm/drm_gpuvm.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
> index 8890ded1d907..476990e761f8 100644
> --- a/include/drm/drm_gpuvm.h
> +++ b/include/drm/drm_gpuvm.h
> @@ -1078,7 +1078,7 @@ struct drm_gpuva_ops {
>   */
>  struct drm_gpuvm_map_req {
>  	/**
> -	 * @op_map: struct drm_gpuva_op_map
> +	 * @map: struct drm_gpuva_op_map
>  	 */
>  	struct drm_gpuva_op_map map;
>  };

--=20
Matt Coster
E: matt.coster@imgtec.com

--------------HLLtbeaguk4vHb9BamkmGTYT--

--------------fNGKag8HLlu6vImAmmahzXWL
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCaO/OrwUDAAAAAAAKCRB5vBnz2d5qsH+0
AP9BW4z0cC/3Kh7UWN918mGQh8c1z9g5aXyptnOvqbaGIQEA66QC1zA8askwkGdlmfenpZyZjBaR
KHANQHEjOCcRlgo=
=kIkk
-----END PGP SIGNATURE-----

--------------fNGKag8HLlu6vImAmmahzXWL--
