Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC98B023B9
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 20:34:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01D7410EAAF;
	Fri, 11 Jul 2025 18:34:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rJh0uUYt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2083.outbound.protection.outlook.com [40.107.101.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CACBD10E3BC
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 18:34:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mqcmw+PzqqhxKs4XgkgK8LcB9JRaOhNwD+Ipx8ZptnCDVXhxnHwDq0/WD5FkELTlL2IeuspI15oHaDTVGL/nUEzFxrd4RdUoMNT+xexuTOLXk2mqOWCnLZ4WpKdLNf2WwtR4nZE7QcLPm9ST+OLwils44SSTip6j2dmulXUXkcgNup3g+/oiXbZ1bMR9C2HE2QVPMMPBr8buBCpvOTuOK6h9cHAoXl70Sh27/GwzyxhsQB2PlDpIzcoOx6GVz9jewsiRxlZ0FFR8f10S5FGseLX77HHrtPtBsZXCRMi9uUdgMzzFfhBKFlfaRfQU5fwIBV8HHSJX1DHGtqYuCfv74Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=53UqdzBKUZSfuEftpQUW0ABCZjbd57hYbnnBvyDyOeI=;
 b=GsNY0R4sWCRveqYAV5Fg/rIKTTXtIpxz1q6wVMRLhiWyJBoMaFL9ik3iKpPdOpPXuUiZ2kNd1ztNkCJ/tHyGQQhTGJjGuliM/EPtLt4c0i1FotjqV/md+Q2Urn01VPHCHRx/SBFOxwPgN9PGGi9fI+hTVBMaJn1L1dvXN0/NAHisxp/A0oo5X3rteNQFvtSVB1cb+1Py3Lcz9IiTy0ylqS1R919tRhq2HQxw5I7kDYJM6mXxDRQWHVBcAI3UeRlT3bRni3OeXqOjgyEHJIAPpKjcGUC4uzxpiBdxMqHuvcRFNCogndjw+5vssZuwrcMZuMLOZQC4THlWL67NL3F8DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=53UqdzBKUZSfuEftpQUW0ABCZjbd57hYbnnBvyDyOeI=;
 b=rJh0uUYtsEiHzn4sV0Jn/aqnaSKNPzHDV7Sri0AVF/dpSud5TL2oPPybU7BbMMQPEl5ngJMp4QCXcQn2k03Udx4XVMokRc82qw4sCmEohLZAvAMqsK+SHiivpxU3xrLoOk/P8baOk28PmcYRQN0A0R6l0dKtyOjF+mYvAN+dNiw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL3PR12MB6642.namprd12.prod.outlook.com (2603:10b6:208:38e::15)
 by MN2PR12MB4423.namprd12.prod.outlook.com (2603:10b6:208:24f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Fri, 11 Jul
 2025 18:33:58 +0000
Received: from BL3PR12MB6642.namprd12.prod.outlook.com
 ([fe80::aacd:a6d8:e180:46bc]) by BL3PR12MB6642.namprd12.prod.outlook.com
 ([fe80::aacd:a6d8:e180:46bc%5]) with mapi id 15.20.8901.024; Fri, 11 Jul 2025
 18:33:58 +0000
Message-ID: <349be13c-fef5-4fc2-b4c9-e85e28cbc06a@amd.com>
Date: Fri, 11 Jul 2025 12:33:55 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 4/9] dt-bindings: soc: xilinx: Add AI engine DT binding
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Gregory Williams <gregory.williams@amd.com>, ogabbay@kernel.org,
 michal.simek@amd.com, robh@kernel.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250702155630.1737227-1-gregory.williams@amd.com>
 <20250702155630.1737227-5-gregory.williams@amd.com>
 <7533fd56-aeef-4685-a25f-d64b3f6a2d78@kernel.org>
 <eb3c843a-6762-4ac0-b863-3f500fb15b6f@amd.com>
 <504f6660-4938-47b4-b1db-0a6fe0214e5f@kernel.org>
Content-Language: en-US
From: "Williams, Gregory" <gregoryw@amd.com>
In-Reply-To: <504f6660-4938-47b4-b1db-0a6fe0214e5f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0002.namprd04.prod.outlook.com
 (2603:10b6:806:f2::7) To BL3PR12MB6642.namprd12.prod.outlook.com
 (2603:10b6:208:38e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR12MB6642:EE_|MN2PR12MB4423:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a9f841b-46bf-42fc-c518-08ddc0a97faa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K01jR21mMG9qQjRVVkMxTzkvNWYzNFpjaDk2UG9zMWZOSENlVmpJV1JlNkJN?=
 =?utf-8?B?S3Z6NjI1WElDak4vd3FaanRGSmVRczFZSnZEWjhlUk0vOEU5aGhQVlZES29U?=
 =?utf-8?B?SjRTQXVJYm5WQmppK2xLWG5aNHFmVjBTR1BhOHFkOEc4cXcrMmZjVkptN3kr?=
 =?utf-8?B?NlBIL0xpTnIwM2FRbkVhditoMUcvNVFJQ3ZBNXJDWTd1SWF0c1RhVXBickEv?=
 =?utf-8?B?Mm1JUTFTQnJTTm9hR0czbmdSdkwwN0haQjJUTXFDMlFSZjFEaTQwdDNteU44?=
 =?utf-8?B?M0tUZFplMjJKQ0V5QU1ZYXlMNHA2ZHkrbDcyU2VJSzJmdUZsZmx2TzFZcTNJ?=
 =?utf-8?B?bnZ4aUtrekVaYmNtc3dVM2RxZDRhNWFadzh0UzU3RWxndENkNnlkei95YzFm?=
 =?utf-8?B?MzA2d0srSlFkZllqZ1ZPbm0wNmVGM3JDeTZMRVhEZVpwT2FnL1ByQmZSZGVW?=
 =?utf-8?B?Qk95OUNyc2ZJWWR1b0QzRmQreVMza2VNdFliaUFLU1Y1Y0FhREpsTWFsTHVL?=
 =?utf-8?B?SWhqckwwYlJFOHU4V2VjYVdsUnREQStTZWlNM2o4clIxRldLcHdWRmJORE8w?=
 =?utf-8?B?N2p1cDlnUkdSUGFtOWtWdEVZQ2UzaGFON01DQlRBRHFiKzlqYW1pWE8wQkZX?=
 =?utf-8?B?bFQwL1YrNzliSWJNTDBQcGVmMEgxQVdLS056TVBLTTRhYkRCWVcyRWJBdVFM?=
 =?utf-8?B?U0VBZ0ZKUlRwSnp3bDd0RXE2ZUZSaVpOTWo2aFFxbVZoNENKQjJ2dDU5emg4?=
 =?utf-8?B?bWgyV0tXTHc2cisxRGsvSnpIL05pRmlxODErSUpBY2pSei9OSHhHdWFBak9s?=
 =?utf-8?B?Njd5RGFaeWdQdzNGY0FoUnhVTkFNRHRIVmNHRE1tNTd6a0NEOTRYVk1TZk93?=
 =?utf-8?B?cTFZcGJoTDhUVVBTRVlWWjBBbGpFMlJRUSt0RU5OUnNMb1cwMElSY1BZL0lp?=
 =?utf-8?B?VncyN3oxSHpPd3YxTlUyRGsyMzJvZ2tNTlhMTlJocTFWMnZLREJmUEpYVDB6?=
 =?utf-8?B?dmZkT3U1aU96N21BVkdaczhQNDlvTFI1NzlHYWNHamtBVWlmdDc4eGZIeXl3?=
 =?utf-8?B?R3JCUVJ0Nm1tZThTZEt1KysyS014cXNnKzRPYWJOa25OTG1iemdxODlONGto?=
 =?utf-8?B?ZXVJMk52eWhFek1FYittWHZsTkFsS0s1Z29qQmgxMHhVMkNvQzVNMTltbWJq?=
 =?utf-8?B?R2JrVmdEbHVTalhoL2pBWjR1OExvcy9kUU1YMUx3eHFFcnhSVkpTZjUwajFT?=
 =?utf-8?B?TXpWb1lJU3IyT3VGRzRrYUh0V21xd2gxV2F6ZzBrZ2dVVDZ5NzZ2NVNuZTdl?=
 =?utf-8?B?OWIzSnRiTkdqL1I0R0hZRWhOVkZ5V3doWklQY3ljZUhacUhRQlAzWm1DNXFz?=
 =?utf-8?B?MkVJOFQ3L2o2ZGZ5VU5CbGxHYjNtM3RiZFJHRXN1VmU1aXZQWU0xTVlWNHl5?=
 =?utf-8?B?YjR4TjNYS2sxTndVakppYUF4OWo1L3NEbGorNkduQW9wMngrODJyTVhQNkpJ?=
 =?utf-8?B?VWowZHNDOUJZbndxRXJ4MkFUa0NyVjhOSTBiYjVQanUvNTIxL3JNd2pkYXNN?=
 =?utf-8?B?R0ZFaFo4T092a0lKYUU0cElvU1FodXA3N2N0aTZBSG52REU4RmlPUkZOcGxs?=
 =?utf-8?B?amJRR3o1bXRHQ2ZYMElnazNieUpaRVV0TnhTazE1Q01WMGcwK3hvQ0ZEaWh2?=
 =?utf-8?B?dVJzWGt1U0Z4Mmk1Rld0cDlDM0w5MVpqNG9lNXFUSjM4V2pZUXl2bDNTSUcw?=
 =?utf-8?B?V28xSVhBRE9pMUdMNGRUazYwa3RRaDRaRUVmV01uVFpwSWdmU29oV2lYY2dR?=
 =?utf-8?B?UjYvbFRONG1FR2hZVnlENWJoZWRaUEpKSUNkb1dYeS9POHhyMEI4UzdjcS93?=
 =?utf-8?Q?djfB379wKynKL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR12MB6642.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHVLa1dJT2pPOFEwV24zeG0xekdRbFhGZjU5STBBVmVNMVZ6MWhKbFpkUE1x?=
 =?utf-8?B?VG9QVDc4QjZteFI5VmMrbnJXZGRDVFNFUDRFQnE0S1R5YThyTmV2a3ZBeHpn?=
 =?utf-8?B?SnVwV1NDOVZTMjc2UXFoalNxelB6YitUSzVsLzVTZCtJMnNBUHNSTzBzeTBH?=
 =?utf-8?B?ZTJaTjBKT1diU3NTSGxNWlZJck43SHRkK0dVT1dLTWZUT2JkVVBITVdTSWhS?=
 =?utf-8?B?S2pYblBkQzBhd25ZNkNHNmJFOGhZQ2x6R3NXWStTL3A5NGJIbWtMUFVPZWRv?=
 =?utf-8?B?eEFmdTFsajVvQ1cvQy9aTnNTOGQ2VnJmaTlOTGR5ZXZ5NUR4M2lPM2NpM1ov?=
 =?utf-8?B?OGN4WCtPODQ3UmtrRzBMK2E3R2o5Q3pOMEFNc2VPbnFjUGJJdGVVK0hMbFhJ?=
 =?utf-8?B?c3FUWE8xS2VqcWZwZlZUbnVmRUswcFVKRFM0eSt2VndERGFpNzY3anN5bkQ4?=
 =?utf-8?B?RkZNR2pIaEtYQWY5bVg1QWxKSnpyNUdPWi9jRjZYT0Zpem1wdDNZMjQ1Tm9E?=
 =?utf-8?B?VG9ndkpETjJpKzdwRGFPV2FPL0ZpZDIyR3pnMFcyOC9CRms3dzFTZzB0ZEZY?=
 =?utf-8?B?OS9TRE8ycEpYbmlxM2RVTEtJNTdiK3Qwbm9odURwODJydkpISmNsM0ljNmk4?=
 =?utf-8?B?WEx2S3RoRXpyczZ1VnlZRFRvS0RJU2lLTUxjcVZCVm0zLzhhd3NhOVEzcmtO?=
 =?utf-8?B?TEtmVC9NcW93elQrZ2JMUzhnVWw0SGhyLzU1QThtVkVjcndJb0pPMmNDcVhi?=
 =?utf-8?B?TjRhdVN0dFl1RWh3dDl3UFA0OWRJUUVNaXhtb2tmQmZwckNJNUN0ZXNXVk9D?=
 =?utf-8?B?NnE0U1lWbUExSzlpQXhvRDZ1Z1FZN2x3bXNuRG5pWW92UjZHM2RaUE95cnBj?=
 =?utf-8?B?akttdC95WGI3U2x6SlZnQjNDbHFCU2cxM2tjZGpHWHVFLzc1WlFpeEVuL0dp?=
 =?utf-8?B?eXluZ2NOVDdWeDdxa0x3YWZWVE1xWHVwT0wxdnoyTzNleFQvVWd4OTdpYksx?=
 =?utf-8?B?WXJTWVM3WlVycVUvR3NVSVRxOEMyVGVlNWtEaEJIR0ovMHpaL1p4bUhPZDVu?=
 =?utf-8?B?UW4wZ2FDWVZrV3FXRHdSbzNUSGhoVDc4SmI0aXpFNmU0OXBFcTkwaUpxU3NT?=
 =?utf-8?B?VEJaM0hwZEJPQldjWlE2SEtwSzZ0RVdWQ3Aza1N1blZBbGpzYXRUYkNOMith?=
 =?utf-8?B?a2VLYko3MXQ0US9zc3doYTkyQ2ovcitVUGw4dmI1cVBWVzkxcVcwVVh3Qy9C?=
 =?utf-8?B?cncvUitNdVZVSTBML0lnNVEyVXVjOEprVEUrcVZmblUreGZMK2VCK1NIVTJR?=
 =?utf-8?B?QVN3eUtzM1M3cnJzajVmdStlQmFkeUM5N2JheTM5b3VBa1hCZ0ZSMEYyTDJk?=
 =?utf-8?B?cDNETFIrN2E1TEJvOHN0WXhFVnY4bHNBb0c2SUdFVDlMWTl0VDV6RUdzeU93?=
 =?utf-8?B?ZW1Ibk0yeEI4RlZteXN1aXFPeFExTHczeHJMR3AxSzdDWndHVVVob3NGYUdh?=
 =?utf-8?B?RzRQcXBpYnpKdE9QQnNoK3Q2TXFNVTUrWkowNlhSTUJmN2NZSzRhVVE2dnRV?=
 =?utf-8?B?N3lhc2dsbkJaaWJ4Z0E2ZHJSWG1lOTdkVVR3aDdudW1XY3h0VjRXRWlzQ28w?=
 =?utf-8?B?WlN6MkFvKzVjYlFoSFcyWjAydWZ0WGgrS3VQMmJSaTh5WnpYVzkvN0xlczJ5?=
 =?utf-8?B?NjgyT3VhVHZTbk8vY1pOejBsdHNtWmQrZGdkcmVHaWYxUThUQmdxYm5CT1Vo?=
 =?utf-8?B?UHRGOEg2bk5jYWE3L3VjcVdOMXhydFRxRmJwdTFvTmxSQmwyZ0lCWnFTdVBo?=
 =?utf-8?B?M21UMHFDUm9OMWNGajloanZhb2U5QlYxLzdLODRlbEhBUTdXdk4weVNYQjhx?=
 =?utf-8?B?WVJFcFB3dWZXL3h4MEFsQU5oYjJUSW9yREJjNnhuTmZQYjlSUTR0akVDRm92?=
 =?utf-8?B?TlV5TGd1bUN4enFmVTJhZzBZUm91eU9KN29aNFZCL2d6NklDeFFBU05iY202?=
 =?utf-8?B?L2J5dENocnhLRVRNOTBKRTQ1VjFnQW5zVHY1cEs1YStoK0I5SzV5WkhteGg0?=
 =?utf-8?B?Z1ROazQ1Y3hUSlZUK3RnaURFVXNSRVVtbUxjUEFxNGVTelN5bTVGdDJKZ0Qx?=
 =?utf-8?Q?HF+dAgwglBhru1PS5ic1vqlPy?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a9f841b-46bf-42fc-c518-08ddc0a97faa
X-MS-Exchange-CrossTenant-AuthSource: BL3PR12MB6642.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 18:33:58.2275 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rt35OIRNc8bfdbSKHlGFAv0M5kHteEbxz+mBBsdcZVH7uSJeQTQY6v/TyFLsrhdtuiOyuSWYwnknlMFu1oTpeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4423
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

On 7/10/2025 3:38 PM, Krzysztof Kozlowski wrote:
> On 10/07/2025 21:03, Williams, Gregory wrote:
>> On 7/3/2025 12:48 AM, Krzysztof Kozlowski wrote:
>>> On 02/07/2025 17:56, Gregory Williams wrote:
>>>> In the device tree, there will be device node for the AI engine device,
>>>> and device nodes for the statically configured AI engine apertures.
>>>
>>> No, describe the hardware, not DTS.
>>>
>>>> Apertures are an isolated set of columns with in the AI engine device
>>>> with their own address space and interrupt.
>>>>
>>>> Signed-off-by: Gregory Williams <gregory.williams@amd.com>
>>>> ---
>>>>  .../bindings/soc/xilinx/xlnx,ai-engine.yaml   | 151 ++++++++++++++++++
>>>>  1 file changed, 151 insertions(+)
>>>>  create mode 100644 Documentation/devicetree/bindings/soc/xilinx/xlnx,ai-engine.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/soc/xilinx/xlnx,ai-engine.yaml b/Documentation/devicetree/bindings/soc/xilinx/xlnx,ai-engine.yaml
>>>> new file mode 100644
>>>> index 000000000000..7d9a36c56366
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/soc/xilinx/xlnx,ai-engine.yaml
>>>
>>> Filename matching compatible.
>>>
>>>> @@ -0,0 +1,151 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/soc/xilinx/xlnx,ai-engine.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: AMD AI Engine
>>>
>>> That's really too generic...
> 
> You did not answer to other comments here and other patches, so I just
> assume you did not ignore them.

No, they were not ignored. I will make sure to address in a V2 patch.

> 
>>>
>>>> +
>>>> +maintainers:
>>>> +  - Gregory Williams <gregory.williams@amd.com>
>>>> +
>>>> +description:
>>>> +  The AMD AI Engine is a tile processor with many cores (up to 400) that
>>>> +  can run in parallel. The data routing between cores is configured through
>>>> +  internal switches, and shim tiles interface with external interconnect, such
>>>> +  as memory or PL. One AI engine device can have multiple apertures, each
>>>> +  has its own address space and interrupt. At runtime application can create
>>>> +  multiple partitions within an aperture which are groups of columns of AI
>>>> +  engine tiles. Each AI engine partition is the minimum resetable unit for an
>>>> +  AI engine application.
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: xlnx,ai-engine-v2.0
>>>
>>> What does v2.0 stands for? Versioning is discouraged, unless mapping is
>>> well documented.
>>
>> Sure, I will remove the versioning in V2 patch.
> 
> This should be specific to product, so use the actual product/model name.
> 
> Is this part of a Soc? Then standard rules apply... but I could not
> deduce it from the descriptions or commit msgs.

Yes this is part of an SoC. I will be more descriptive in V2 patch.

> 
> 
>>
>>>
>>>> +
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +
>>>> +  '#address-cells':
>>>> +    const: 2
>>>> +
>>>> +  '#size-cells':
>>>> +    const: 2
>>>> +
>>>> +  power-domains:
>>>
>>> Missing constraints.
>>>
>>>> +    description:
>>>> +      Platform management node id used to request power management services
>>>> +      from the firmware driver.
>>>
>>> Drop description, redundant.
>>>
>>>> +
>>>> +  xlnx,aie-gen:
>>>> +    $ref: /schemas/types.yaml#/definitions/uint8
>>>
>>> Why uint8?
>>>
>>>> +    description:
>>>> +      Hardware generation of AI engine device. E.g. the current values supported
>>>> +      are 1 (AIE) and 2 (AIEML).
>>>
>>> No clue what's that, but it is implied by compatible, isn't it?
>>
>> The driver supports multiple hardware generations. During driver probe, this value is read from the device tree and hardware generation specific
> 
> Bindings are about hardware, not driver, so your driver arguments are
> not valid.

Understood.

> 
>> data structures are loaded based on this value. The compatible string is the same between devices.
> 
> No. See writing bindings.

Ok so there should be a different compatible strings based on hardware
generation. I will fix this for a V2 patch.

> 
>>
>>>
>>> Missing constraints.
>>>
>>>> +
>>>> +  xlnx,shim-rows:
>>>> +    $ref: /schemas/types.yaml#/definitions/uint8-array
>>>> +    description:
>>>> +      start row and the number of rows of SHIM tiles of the AI engine device
>>>
>>> Implied by compatible.
>>
>> The AI Engine device can have different configurations for number of rows and column (even if it is the same hardware generation). This property
>> tells the driver the size and layout of the array, this is not implied by compatible.
> 
> Wrap your emails correctly.
> 
> Again driver.. no, please describe the hardware, not your drivers.

I see in 'writing bindings' that I should use device-based compatible
string. I will do this and remove these nodes for V2 patch. 

Thanks again for your time,
Greg

> 
> 
> Best regards,
> Krzysztof

