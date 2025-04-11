Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A92CDA86559
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 20:18:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F161B10EC4F;
	Fri, 11 Apr 2025 18:18:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="TulBvfid";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2074.outbound.protection.outlook.com [40.107.243.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B51D210EC4F
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 18:18:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y7SDEoL0KmwTz9Td+G4IKi540vVWSndS/aOv12ebssUaH6ViKpDTwR8lOK/YWnBU8Ju/wOJylqICf8mwFiEtm2+UAAw8ZUmSscqYzzqS3T1tljlRCwmDebfR/G2WZdHQa3GrDQ/hiIP/CvIIHdjd7LX7wDCVKvFyMLwFGdssWH8Owa+Luw/g4OHX8jEQ6MKaLgrYa74OkcbliU7Iiua8bm7YXJcc0gcCPntCwqQehKrnF1mbi4I4XmmqwsiOj0hl6v2xD46ayLjmen/QmdlyhlFLYq0NymTvTwqLld59xRlHqUhQ1iQDKmFlrMVf/tPY/o6NFv3soqyPBGzLxtgRgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+I4T3pszz8GfuHAhXDohCsGqznv+cucIEcOA/Zl4IC4=;
 b=c9qekfMMGrmwlEcumDqyTrQWn4yE11pqgHlcxZV8Jc97LX3YQgSS73XY+yv5YbrGoXVzJ+z5Ds7cqX19xa464QbNduZm9hopga083dYYZyTveWEvDoa7t5vziGpPJXeMyxuwIo9Mvh1C3uHKdwEljYPrHl+OquKEAQZg5PcrhxPoELNvTbeuAiTsRZGLlaZGEKZKEkv5DGMP+XLXuu78YNyg2aOJ9KyNcXVtKoKDdUjXKTJV3Ht/IWzN+P1BoA2VgO6bmbBtUOQI7kVVMMM8RGPJobPRZ6C0b30MpSSoxQ8261HIjvwFQXZaxIYxo70fLsC3PzF55FoSUTRYUAPjxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+I4T3pszz8GfuHAhXDohCsGqznv+cucIEcOA/Zl4IC4=;
 b=TulBvfid7oRcdQTnAg5U/3qoMhivCTSzQtgTBdxByN4geDi31Q3LuRYVRHbKn35/EVYX7B5HOMuS98BK2JNRzSVdhbyhUO8nqLKtV/7ocr9vs6tdWoJ8WtlPDUbEoCrpV5HEHWbTGAUX8L7q5/mzW59CFxAVJc/M63KXLmsOHX4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB9193.namprd12.prod.outlook.com (2603:10b6:610:195::14)
 by DM6PR12MB4201.namprd12.prod.outlook.com (2603:10b6:5:216::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Fri, 11 Apr
 2025 18:18:30 +0000
Received: from CH3PR12MB9193.namprd12.prod.outlook.com
 ([fe80::7818:d337:2640:e6c7]) by CH3PR12MB9193.namprd12.prod.outlook.com
 ([fe80::7818:d337:2640:e6c7%5]) with mapi id 15.20.8606.029; Fri, 11 Apr 2025
 18:18:30 +0000
Message-ID: <bbeb1316-55c9-2530-46bc-25a57cf293eb@amd.com>
Date: Fri, 11 Apr 2025 23:48:16 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/3] dt-bindings: accel: add device tree for AMD PKI
 accelerator
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, krzk+dt@kernel.org,
 gregkh@linuxfoundation.org, robh@kernel.org, conor+dt@kernel.org,
 ogabbay@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 derek.kiernan@amd.com, dragan.cvetic@amd.com, arnd@arndb.de,
 praveen.jain@amd.com, harpreet.anand@amd.com, nikhil.agarwal@amd.com,
 srivatsa@csail.mit.edu, code@tyhicks.com, ptsm@linux.microsoft.com
References: <20250409173033.2261755-1-nipun.gupta@amd.com>
 <20250410-flat-violet-bull-a2a0b7@shite>
From: "Gupta, Nipun" <nipun.gupta@amd.com>
In-Reply-To: <20250410-flat-violet-bull-a2a0b7@shite>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0115.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::14) To CH3PR12MB9193.namprd12.prod.outlook.com
 (2603:10b6:610:195::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB9193:EE_|DM6PR12MB4201:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b6c5244-9726-4fa6-63d7-08dd792542e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q1FJR2hWaEZ6bnhwWktiNE5TVGlaWEpvTVdLMzBlRUx6dHo1NGNVWHVZVTFz?=
 =?utf-8?B?V3JnMnRNdWYxWCtxaWFMcCtnb1ZMYW93NExwZHFqdmIvS3ZYQkJTejMxcFEv?=
 =?utf-8?B?Kzc3ejRyR1NSLzB6U3VydlVvdTRJRnFldjFMYmtEaVlIU3ZseDVWQ1VFRm9Z?=
 =?utf-8?B?OFM2cFplRHNINnBZYUhoeEl0OWlyNVFVZ0xBak9SdHJ5RXdQZUZHVlhPZGU1?=
 =?utf-8?B?YVIyZkVmdTNsazZUd0tlMlNuVVJxa3ZaY2pDZURhNkpUTTJrYzltY0w4UE96?=
 =?utf-8?B?VWpLNE9nQjNiSHFXekZpNXAwRXdiZVFYSnZlQ1FWQ2FRY2tCR28wcGtpR1gv?=
 =?utf-8?B?b1BHek1Tc2xJQUp4K3EwVFhNQjVHU0FCM0hOSkl5UktUdFNldHg0WjZZSk5j?=
 =?utf-8?B?Zmd6ZE5icm12WXlXektibHI5MjF6ZllNc01XUkx2UVFHRFVWS0ttVng0QUd2?=
 =?utf-8?B?azVOa21ZVHJsYmlwSkQxd01Xcnc1SzFxRVJLZEdpQTdFNE91a1F2RGJBeU9E?=
 =?utf-8?B?U0RGNkVDa1lFclN3eWpjUFFrVVpKNytsdHJCRTNwRjhvQnA2TUtTUk8zbFZY?=
 =?utf-8?B?U1Z0ZTRVM1B2bXkzZW1SYkZzeGttaFRhYVdmTVFoL29MOFBoc1RpcW0rY3Nw?=
 =?utf-8?B?Q0NPZmx0NFZOUjFKY0JTdTd2QzdlcW5xRXk3a050b2ZValdIRmdsc0lWMG8x?=
 =?utf-8?B?L0h1eVptN21PSWpiZWFLWEw3UGNBcmVzRmNNSHVpRDBxWVlVR1hKRlBXbWVp?=
 =?utf-8?B?a1dablF1b2FQWEsrUE9lVGJBbG9RYlcxbWNzTWJvVWw3clFzWWx5N0pBRDRp?=
 =?utf-8?B?bm0wbEVMYXZJRjRKZUhLeml5K1cyMnk4RFNnODRZS05xZDdqajhqckhxdjRq?=
 =?utf-8?B?TTZjY21HOGJFdUVnZ1hqczk0aTdIZlVuaC9CNU1IeDFQVWpTa3dGTExHR2Ja?=
 =?utf-8?B?NGhTNy9EN2RLbzEvbGVhTmp0Y09JalpsNUw5V3R6VWsvTXdCVDYwSTJhcVk3?=
 =?utf-8?B?SWRLZHN1eUdaMm5RS28xbnRFZXFPN3RCUTVJNnR0bnlmQytiNTVXM2o3aWhE?=
 =?utf-8?B?SFJMaSt1L1F4NENIR0RzNnZ6L0o1NGE1WlJHOWcwbTBlZ1dkMmUza1k0THVM?=
 =?utf-8?B?WCtMc0xkRkU0UWtYNDBKaW9CQmEyTThFZmpnU0VIZjZPc2hkMlZhaCtjN0dL?=
 =?utf-8?B?d1RhK2puS1JvMDlBTk9RRGVTd0tUcXpRMTRnVXY1RThiSXg3bTFCUUFOSWdU?=
 =?utf-8?B?MlNGMHg5dkVDSmU3L3hUL3dybitxcWhIVVFEZnpKb05iQTVJdVFBU2M0STBM?=
 =?utf-8?B?L1c1ZmRDMlVLRmM5dXd5YWZiZjFxUFhtaVpxK2tTRW8yeHByQlpoYlhIU3A0?=
 =?utf-8?B?VGNmWTdlcFVvMnN3TWVld243SjhBWXh4dFlFMXdDL3hWTENDS1h3b0p1c3ZD?=
 =?utf-8?B?d0dLZS83MjNKclRMc1kvRmxTZENIMzBpUmUvZkFKK3kwbXgvcVNOWTYvS0lG?=
 =?utf-8?B?SDB2aTVYTWFhRzhtRG9ZQ3ZncEZtRE9ZUTJzWCtRYVl0dm95Z09xcmlDc0Yr?=
 =?utf-8?B?SE1rS21xMHNYRXZJTU5JTldEcG81MUFhc1BVSC9wcXJEaU9XalUvWFlHMFNn?=
 =?utf-8?B?WWo4dVBSL2Q5R3NVVlBvcWYvaVlFOFN3K2p2R1p5dnFBRkhWeXRpYTZJWmRi?=
 =?utf-8?B?ZFJaYmJtR1Budk5aRXBnWDJON3FwNDJzT2I0WDUrckZvZjN5QWNEcEkvbTA0?=
 =?utf-8?B?Mmg5Q3ZMTnZaNVJtOCs0WEpVOU01dURGVW92dEFnT1dPT2pQRjNFZjNNWTRm?=
 =?utf-8?B?UmE3c0NEbXFVYXpCM2FJYUxiemN5MElDVmdoTmlLWDFKWGt0eDZqeDBiaUhM?=
 =?utf-8?B?ZkpsOUk0c3VDVzdUTU5qV0U4R2ZEOHFkTkxXY0tycEYyaDFlOUdoZFZZbERV?=
 =?utf-8?Q?A0T+TLIdgSI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB9193.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkswYTZoTk5WbzJpRkNQeHhCTXZZSk9aeDV3KzBablJLK2xUSDBFZ05NaXl1?=
 =?utf-8?B?ME82cGdoZHJ2UTVTMVlpek5IN29UQ3crSkJPYWo1Uzk1N0dybEJyVkErdmpl?=
 =?utf-8?B?LzdNR3hCTjdDTjZ1V0lSVE5LWlB3S0NSZ0Naa09BNWRqTDBRbjV5UXVFZUcw?=
 =?utf-8?B?dnc1M0c0SFJ2K3ExSi9MbjVIcElqSXd1cFZvSWtCcWIrL3N6dk9kM2tJUUtr?=
 =?utf-8?B?SHNRd0tseDNiWWJzeWV4UmpTbVhQUzc5U1VIMC85d0hFeGowZW05S3hMZVNC?=
 =?utf-8?B?MmVSbndIektWN1VzM0VHdUMwekowbmFRSjFVb09TMGpjNnAvN3hOS1E1TUM0?=
 =?utf-8?B?VnV4NGpBaFNZNGl6Q0lubjd4NjI5R3Q1UmhOTHpvK3Zpd0dYR3VVRE5QQVE0?=
 =?utf-8?B?VUV6V1YwM1NacjFpcXJ4ek1uSzRzOTZGVmwyQll4R0ZyK2UwQWNpbHZwSGZQ?=
 =?utf-8?B?V24raStuZm5xUUZNY1gvbGlIWW0yNFp1NHgyWWV5blFQMXdJeWcvNC9FZGRH?=
 =?utf-8?B?alVzNlZQNkhHeGk5a2R1d0NJS2V2c3hlNS9RQ2RNby9OWFhuUUVBWHFqVkRN?=
 =?utf-8?B?VTBISTVjZnZEME1xcnBvT01KUEx3a0QwNERrWGVLQ2JQQ3YzRlN6ajVCWDZp?=
 =?utf-8?B?OVpwMWJpM3VTUjY3MHJ2ejdYZ21EUTRyR2xnVjNxNEdRa05NN1NjdG5qcnBj?=
 =?utf-8?B?WkZsZ0l3QWZmN3Q4WkZzcnRLeHRZY2Nyamsva3RPbmczSGxMMzhHZkxqTGp1?=
 =?utf-8?B?VkExb2FmOUtFYS9IdUkwOGNvU1JOamIzdXVDcUtCWHpZT1NYNmRxWGgvRUkz?=
 =?utf-8?B?bU9Zb3FLZmtESmJJOWt0NFhVZkl2ZVdrN2xtRlMxY0dvazlqdU9wNEUxeVFE?=
 =?utf-8?B?eXdSTFVEaU9OSDVJbHM1N0Q2QVI1c3NKa3FHTE9GNGZLSHJEMC9kN1I4Y2Rh?=
 =?utf-8?B?OUhaQ2VsL2pmc1BzVGE1UzFBeXhRYkJoNDJlTnh1VW5VMzlDT0lhU1BJcmVJ?=
 =?utf-8?B?ZExJWHdEVklSMGZ2VWhuVzUwMVQ1cDVaVEdaQTAxYnRlQnJJL3Yxd3RmZXZs?=
 =?utf-8?B?cWE2RG0xVWE5U2F3akRYSjRaS2tybG0wY0tJd2xhY2ZaK3ZKSWI2RC8zcWJ3?=
 =?utf-8?B?NnFMNE5RelJwNUNWVysyY2NCZktadnVmYkRHYjZjSDIxcmJ5Z0VnYlJDS3NF?=
 =?utf-8?B?K3FSTWw0SFp3S3l6WmMyUW1LemNyd3dKWlc1Yk9LZFRadHFFTmROTnlscmxG?=
 =?utf-8?B?aFY1eUVCN2dPNHF5bnRGQWlQaUNNUWZBTm5IQ0NkZmNUd2lMdzJZZmNaMnZY?=
 =?utf-8?B?M0lRTFdqTldrSUhYZVZMb2pWUFlQZ28waU1lS1BrSjhYcWNoSnlJWEtheXcv?=
 =?utf-8?B?Z2htNG1iMExWeGcrdEZlQzJyL1pRSGxFWm9mNG1EMXYzU1QzQlh4TjBOdmFi?=
 =?utf-8?B?TzNJT3daaWFqczlmbmg1VWErQXcyT096YXRlSEhBallPYkhKeFlnUFU5T25w?=
 =?utf-8?B?TmpWTm1oeVdNRTErQktDUGtuSmVWSHhrSGRkWEZabDdsakxkWFhCVUhLY0E5?=
 =?utf-8?B?V3FhbHZmL3RzS1dleWx2eGU3Q21HT0Z5VFl6NUQ4aktPOGJvU0dKcWNSNE9a?=
 =?utf-8?B?MUFLdXYvbmdLUE1FQ1dKeU1IVnpTcFhERUdUQkxFN2FoT1NOc1RkbmgycTlY?=
 =?utf-8?B?eTVkSFIxU01pd0plOWNtQUZiZ0xKV1NNUEZ3d0Ewc0dsdnVOcHJUTTA5a0NN?=
 =?utf-8?B?R0lFVHBmR1EzbnVPZ2ZJZXIxRnVQZkNaK2N1LytFVVZCcDNRdFlpbWo4alA4?=
 =?utf-8?B?V2Q3Y3ArYzRuV0RuYXhOVDNsK3JwamkwcmNucXk0Z1ZHR2pXMG1OVUdudTVH?=
 =?utf-8?B?NllEMzJYY0NJeGJqOGJJOXJRTUNxcUN0VEYvMWFDL2dhUGluRWZKVmFpUi9u?=
 =?utf-8?B?c2FCOTNraFZQcHZTMFk1Zzh1SEY0QVNKU3pRYklXVWl5UXdudWhRd2h2SGFD?=
 =?utf-8?B?eGNXWTkwYXlHaU5STnJsUDFIWDVhaStId0Y0b05yZlBSNWRLS3hSNU55WHpO?=
 =?utf-8?B?dVlSa2tCek9vTUhUd29OeEVPeFR5T1RtM0JuUUlCbGEvajR2SDZsZXdSSk1W?=
 =?utf-8?Q?XYY/724m+N1PXAshWzinpwJiK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b6c5244-9726-4fa6-63d7-08dd792542e4
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB9193.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 18:18:30.3277 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PIeYXvtUii1vdjuga+VNXcTccQOQxHQQP01oEO3V5MOD81X3u4EG+5NY2mcsijiJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4201
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



On 10-04-2025 12:59, Krzysztof Kozlowski wrote:
> On Wed, Apr 09, 2025 at 11:00:31PM GMT, Nipun Gupta wrote:
>> +  interrupts:
>> +    maxItems: 1
>> +
> 
> And the resets? I understand from previous email that there is a reset controller.

It was not reset controller, those were register from clock controller 
which is handled by PDI (Programmable Device Image) at boot. It was 
mistakenly added there and was not used in the driver (in v1 as well). 
There is a software reset in the device which is used to reset it.

Regards,
Nipun
