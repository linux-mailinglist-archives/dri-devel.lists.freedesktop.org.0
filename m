Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 462DCB00BC5
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 21:03:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 945E510E949;
	Thu, 10 Jul 2025 19:03:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ppLsqvvk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2052.outbound.protection.outlook.com [40.107.237.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4BB210E949
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 19:03:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s+P5803E6UzzVnM54mOxRFWc+9usTGld/XHSm8lOH6h4+zQVBjCCZe63IXPahvJxXT1O8+obfzb8fCpnb6GbdZrcojZkHJQmPDo4nHTEQT2MOyw9ttqXBLsq5wpNlw6HKUJlR735ONbsvvB91OH45QJM9MmwfZT6Yqz3+oholoAMKOd+EJiHJ4CYaADTIIFz3IRr1j1O/pm1xKiBra3fBzi9ok3FrRWX2Z9KFJUuz5apIZpMj7BmpLV0P1dU0PEeOqGZTFqyrXkCAlZHT/nPnf0m96pUTxygowk6+B7+JgJNlB0RZpEw9g9tXuTSZ6hy+NTRgPGI7EBgkQ9+tEmMzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OveTLmtpiGd+P8xmohHn0OvZvMpDxWl+VB7sp3SK8JU=;
 b=NG5ZE5QM0XlgLjPa06eHyG148mok90lvyeQbvopImwXVCTMQxo8jtNupyHgLoP4GGt21oIP6FXZZFxmYqPJZIPfAPHbTazp58E8sznNyhnd2BA8Nd7Qh1hEmijap/Pd47sLlfFbAJPcpgk69xr01u/9baqi95Pg/Uxxn4KfNNRF9+gCYFlJsU/6inlqdriqQBO5omgcDy3fbggvMdwIviq01f6Jr0yBHkZd9h4Q2IRXNEjZb6lAqVlpxAbuYXjniDUBSpZT2qQkxS/ki9DmsCF3k2wxfjERL/omCPCFsxMHm3irRXiMcxM84SfsZozwUMsOzb/ia3QZyrJyoISvI3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OveTLmtpiGd+P8xmohHn0OvZvMpDxWl+VB7sp3SK8JU=;
 b=ppLsqvvk8fUjMlhF7mi2xRiJeO08GnpJxQjeayfw4zE6yyP1Vo0WfLXXVKdMmhXSB0ZKAwDnIZuqnDQ2/kLTX2HxJHCZFLhqRAmT00xk1FLL2gVZWAlm12iNW/gAXvID96mvdX7FMPhubq6VDQK8TaguLV260chsggoq9y4ZTkk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL3PR12MB6642.namprd12.prod.outlook.com (2603:10b6:208:38e::15)
 by LV8PR12MB9232.namprd12.prod.outlook.com (2603:10b6:408:182::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Thu, 10 Jul
 2025 19:03:36 +0000
Received: from BL3PR12MB6642.namprd12.prod.outlook.com
 ([fe80::aacd:a6d8:e180:46bc]) by BL3PR12MB6642.namprd12.prod.outlook.com
 ([fe80::aacd:a6d8:e180:46bc%5]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 19:03:36 +0000
Message-ID: <eb3c843a-6762-4ac0-b863-3f500fb15b6f@amd.com>
Date: Thu, 10 Jul 2025 13:03:33 -0600
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
Content-Language: en-US
From: "Williams, Gregory" <gregoryw@amd.com>
In-Reply-To: <7533fd56-aeef-4685-a25f-d64b3f6a2d78@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0130.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c2::21) To BL3PR12MB6642.namprd12.prod.outlook.com
 (2603:10b6:208:38e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR12MB6642:EE_|LV8PR12MB9232:EE_
X-MS-Office365-Filtering-Correlation-Id: 24f0ae59-16a6-44e3-be58-08ddbfe478ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q0dzZlhsZ3BpcE5jcER0akthY013WXhLUVlkeEs2WGJzTS96bFZlU1VpK3l3?=
 =?utf-8?B?Njl3QllmZTZsUGt4RU9vcEZ5bzhydCtIL1lQYnkwSFVDcVBOd29wM05ES2ZI?=
 =?utf-8?B?OU5TU2dWR29qRERKYXQzeURHZ3A5Z2pVV3J6ZGZ3eFZPMFQ5QlA4YkdTdzQ5?=
 =?utf-8?B?Q1JsNFB0dVlha1dBVE5FMkYrS1hxM29NMWp6T1hlWUdLNXZQb3ZHRDVMUUUx?=
 =?utf-8?B?MEZOcCtrOEF2NlRyN3VQNWJKWkhMN0trc0RQYm9NZ1YrVHgxaHY1cjRTUkZN?=
 =?utf-8?B?N3ZTU3FrQzNQNlUwdUtVWVFTczNtcXpBWGRKUERJVGNUaEJlbkZsZkVqdUxl?=
 =?utf-8?B?cllqQXVmOFdLYTV0MktJbFpvR285dnBtdHpnR3dlVVhYYk1zMHI1V28wWDhn?=
 =?utf-8?B?dkZQME5KL1dud0hKZzlGR09xVVhZZ1NvQmN6RmdkMnBSWFBZZHdnM29GMVpy?=
 =?utf-8?B?aWlZK3VGbktxZnRpKzNyajk5SVgrcFpEM09ZbFpFTGtEdG9qMHhYVFdFMTEx?=
 =?utf-8?B?VGVhdjI2Y0s5akluQXJjOFRyb3ZPYnlGaHVJTzZwQjFLbEdKSTRoa2pGZ0JO?=
 =?utf-8?B?dGNwVTQrYkNMUjduWU9hQzFGVzgyRFFIbTJSZng2d0F4S0pkSi9vYTBDRnhO?=
 =?utf-8?B?OXlWSERybXJlb01tMEJWWWZVeURXWWk5RUVpcUczMlNJa1VkS0Y5UEx5Y0Y1?=
 =?utf-8?B?bXZNL3k0aGdNOUcza29XRXMwREIvTFRTZzJRWGMwNWw5ay9rZ3lUeks4cTBZ?=
 =?utf-8?B?YzdzdlN1ZytjbnZkVzhpYXpJMlRlSVNEYWU4Ymo0OCt3bWFhaHJNYWFSOFdz?=
 =?utf-8?B?eW5WVzBUU3pGMEJySFdkR1V2d1RkcEtvb1dwTnc3MS85RzlESUhxOFNXKzBo?=
 =?utf-8?B?QzBabkE3WU56Tm11QlBvNjhwa2lQemt4dUZubzRacFZBMG0yY1JBb3dWdWRN?=
 =?utf-8?B?QXVRcDR2MlgvdFQraC9RaWF2S1RMRldrUG5ra3hDZ29VcVFOYnNwTlBSSE93?=
 =?utf-8?B?cldhUktydUMrM0QzNlNEUkxIMTF1YmZrZGVoZ0FRczNXa0xaZFM0RVBuK2dh?=
 =?utf-8?B?eW9pdlZ3V2JjbXFiSWljaUFGcENVK0pLbllBOUZlT3djU0JYV1VDN1h0a3dR?=
 =?utf-8?B?bzZoKzBRb3E3dzdUTWpubWRCdEVCM2ZuZkJyOFY0WTBCM0Q3Zk54RkVhSVBT?=
 =?utf-8?B?cTJ0TjdReFBkWkU1a1JTeXRNN2gxVFlaWm16bWhvdy9aVEU3UjRzUW5ObVQ0?=
 =?utf-8?B?ajZseUNseGY0dytydjFCbzA2c1NOUkNHNXFhUDl6WTBNbUtYSFNJVjJaUXNK?=
 =?utf-8?B?OGdrSXM2a1RPMVRlemRFakxqaUlnVFR4NWZrZVhaN2NWOE1pcUI3UTVHUitP?=
 =?utf-8?B?STNabWpnMnZZUmsrTzRBekR5UXpId1JrZDZDUmlmUTd2RllRcU5YR2FWSUpW?=
 =?utf-8?B?VTZ0MnVESnNZSmtmOWRoNkRPdHdMbzhyVEJRbXBEeWVrOW1tVlFoaDNjUCtW?=
 =?utf-8?B?MzVlaXNEQWFCMWorOVduVzVCMlFJdmlEV3dINDkzdDBYS0tyL3N4WXBHT2JL?=
 =?utf-8?B?bzZ5ZjlQMkx1UEI5TEFaQlRhalVDQjQvcXVRWXJtc3RSQlViQVBmMDI3ZDVn?=
 =?utf-8?B?N05HQWExa2tJYjY1K3VycVptMy92TVN6VFpuWldGYUhpVkYwOVQ4WDNXSDJR?=
 =?utf-8?B?ZkdYWGd3OEpXSUc2SUd3NkZVRGlVeTZHL1VNZnIranVCSVQ2RjgzbVZlaVZq?=
 =?utf-8?B?YzE1d1RZMjY5ZElKYzExaDJ2U2R6NkZyZjduS2hMbnk4Q1g0WmRIWmtCdzMv?=
 =?utf-8?B?aFNIT1EyMVRrVjlwYkpwU1kxMmpmZjhQNEFTdTlML1dwUll0SExaK0FTSWVu?=
 =?utf-8?Q?OqSh/sppDHCI0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR12MB6642.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NldKS0JoQ2tpemtvdGRTN2UrWkhkRGRmK1FHREVXNGpFbHQwb2Rpa2I5VTJw?=
 =?utf-8?B?d280bUtwSVh6aGprOFhiSkhBL3FPVlhEbEl6cjZNYkRwcUp1eW5kQ2VuRjR3?=
 =?utf-8?B?K0hKZzNuSUpuaGdEVGdPQ1FzL3hDYU9KODkwUldSQzdSWi9Yc1pWNDdBZmN0?=
 =?utf-8?B?YUc2VTFxaHJCZ3RTVTI2eXgweitXQTNLaWxTQ2p2UUZRZmpsRHVsMytJdVBU?=
 =?utf-8?B?UVFUV3NzbE12T1I2ZHBlaEp3bjdzY1NKWFRzNm9tOHJuZDgwYlVQLzVJc1F1?=
 =?utf-8?B?dTRyOFFiSXFXVVB0Z3pHOHpBdjJ6SU5yK2FlNm5lUTVkS240NUxQMHFSSTdv?=
 =?utf-8?B?ZElXZmxBTENIL3RTQTlnei9NMHorWFFmbTNkQlN2S0JFYzVjbHFzbnNrM1I0?=
 =?utf-8?B?WFZES1FWQ3ZjcUxlSUx6dG9VbDdIK2J4dkcrcXIwK3AvVHhiY3lhVmFqcmZi?=
 =?utf-8?B?N01wV093TUMrNVVSQ3pkZjdPOUk3UTdZRVBrNUVsT1lleVNiT1JtVG5aSEtr?=
 =?utf-8?B?cE1MOVo1MnB1MmttR2h3dkVQSENKZXM5V3JNemtDK2tZQnBzZ2g0NFE2djNh?=
 =?utf-8?B?SjlsMC90WFNOUmtjSlViaFRwRmJ0akhhMW5SbloxeUlLQnNnaStidWhXUWdR?=
 =?utf-8?B?cGNTdWVUWGxQVVR0ZkcxVkYrTjRScHdXKzVPRTBlV0p2Q1ZJZ0UzS3htTXc3?=
 =?utf-8?B?dEJhMHZzZVdNaE9vZ0RBVEpuUUhvMnB3UU5pbXFMMnUxQjkrV2ZmNnN2anl5?=
 =?utf-8?B?c1dwUEQ0NksxNGNqZUxsTkZ5bWk3bFYwdVNQVWZJWlZKWUFXdVZHZ3R5Z0hV?=
 =?utf-8?B?Y1N5SkZDZ1pNamN4MnJmLzFoN3lKeGVpRkY3TWRsREoxdjg3NlN2T0Y1UGw5?=
 =?utf-8?B?UTJmcEo2RVBsb1hRWmI2QnNXMEpUcUI2YjZOYTRablNUNUZEbDU3SnplcXFs?=
 =?utf-8?B?SEZ6US9EdXE0eTdmZFNNQ1VVN0x1Tys0SzIwaXE4WmgyZ0xvS1BHa3V6S1N0?=
 =?utf-8?B?K3lUQkdUc1NKRXd4ak9LWFgzNFQ3V1hNVEVkcHJ4a0hhUEd4TzhLeUxwNm9a?=
 =?utf-8?B?Q3NRK0hoREtCTW1yM0lMWmZVazZ4ZlUzS2RxZ2I1RnZWVVJhbmwrVkZyeXpM?=
 =?utf-8?B?NVVKdVRKaEtTTE10Z05nR1NVQitVQURaMmZvN0JPS1pibEFFaG5DSjIwZHBQ?=
 =?utf-8?B?TVhoM2NLNHBneUlFZkxLK0xiRGF3M1M4NlVKa0c2UUh3clArWjZSbDdLWWcv?=
 =?utf-8?B?cHNtYjhoRG5GZElFc0ROUEZHS1R5SUE0SUNuSDU3dEkrcWNPRXNKVkp4N2Mr?=
 =?utf-8?B?Q2JwOGtVU3o5WFNMc2JMbURHTVZWNVc4NisrdEtIU2IxMEpRVDR3RFM3bVhX?=
 =?utf-8?B?bGRlSzdXQmhRZWRIUjNNODE3TytMK1dxTHBsdkd6WHh0Mmx0cmljb0JCTFJM?=
 =?utf-8?B?OTdZNXVvbWx4ZGpiZS9LcjZmeFpNOEVYT20rU0xyOEVBaDRhUDVndWNibHJu?=
 =?utf-8?B?Y1hjbnF3Z1NwR0o2RU9jVGttd2VQc1BEMWFZc3JWZXpGWFFWRE1LSm1RcjRu?=
 =?utf-8?B?TE5EUTZvNGRPcDNoWUIvYXN4ZVdpT3FaY1RxdnZMTmhTRkV2ekFnVm45SWtB?=
 =?utf-8?B?T204anZCVmFGOTJWSHM5QnZKL0dSL2RneW0zRmRhV24wK2JSZndIRHZHVWVS?=
 =?utf-8?B?OG1vZDJKem53L2xCUFYxNVQ3aUNGN3ZTRFBZaFBUWndwK1FSWGl3WGt4ZmYx?=
 =?utf-8?B?S21xMEJ0cEFLNWZQMndPK0FaMERoVVRkUElOVnpVOFdKV2h4bmU3TTUwSHh6?=
 =?utf-8?B?djBXK3lhZnpiNkhWNVpEdTl2aSsyeFMyaHoreFNRNWVkUjZmRDNiY1VUNEtv?=
 =?utf-8?B?MHcwSytvU3NiUnVDYXNxanUzSmxnVlkvaTl3OUVnakVwMWRSSHYxbm53a09P?=
 =?utf-8?B?R0NpUWc2dkhyRWxVdXVDVWhUbCsxL1J4TnhvQUJJQ2ROTGxIR3pqTVhzbUZ2?=
 =?utf-8?B?MjdUcVIyaDRCNE9iK2E0SzJySitqUzBuRWtnNVZ4L1dZSnNrR0Z1RUdBZlFz?=
 =?utf-8?B?QkdUZk8zVW9xc1hnaTFSYW1RVFh2R0kwcmdYdVcvcWFkdjBXbmhzYzFiVEtl?=
 =?utf-8?Q?yTQf40323lvV2lqkx/TosvGoN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24f0ae59-16a6-44e3-be58-08ddbfe478ec
X-MS-Exchange-CrossTenant-AuthSource: BL3PR12MB6642.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 19:03:36.0512 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A0+qRu60sKpv3B7LSA9UCP3ou2pnbMuwmzL0wlGvtLntwVhhVXUy5kphqHM/4XpCRg5+wYxr+XWWMcon3GgeMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9232
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

On 7/3/2025 12:48 AM, Krzysztof Kozlowski wrote:
> On 02/07/2025 17:56, Gregory Williams wrote:
>> In the device tree, there will be device node for the AI engine device,
>> and device nodes for the statically configured AI engine apertures.
> 
> No, describe the hardware, not DTS.
> 
>> Apertures are an isolated set of columns with in the AI engine device
>> with their own address space and interrupt.
>>
>> Signed-off-by: Gregory Williams <gregory.williams@amd.com>
>> ---
>>  .../bindings/soc/xilinx/xlnx,ai-engine.yaml   | 151 ++++++++++++++++++
>>  1 file changed, 151 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/soc/xilinx/xlnx,ai-engine.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/soc/xilinx/xlnx,ai-engine.yaml b/Documentation/devicetree/bindings/soc/xilinx/xlnx,ai-engine.yaml
>> new file mode 100644
>> index 000000000000..7d9a36c56366
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/soc/xilinx/xlnx,ai-engine.yaml
> 
> Filename matching compatible.
> 
>> @@ -0,0 +1,151 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/soc/xilinx/xlnx,ai-engine.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: AMD AI Engine
> 
> That's really too generic...
> 
>> +
>> +maintainers:
>> +  - Gregory Williams <gregory.williams@amd.com>
>> +
>> +description:
>> +  The AMD AI Engine is a tile processor with many cores (up to 400) that
>> +  can run in parallel. The data routing between cores is configured through
>> +  internal switches, and shim tiles interface with external interconnect, such
>> +  as memory or PL. One AI engine device can have multiple apertures, each
>> +  has its own address space and interrupt. At runtime application can create
>> +  multiple partitions within an aperture which are groups of columns of AI
>> +  engine tiles. Each AI engine partition is the minimum resetable unit for an
>> +  AI engine application.
>> +
>> +properties:
>> +  compatible:
>> +    const: xlnx,ai-engine-v2.0
> 
> What does v2.0 stands for? Versioning is discouraged, unless mapping is
> well documented.

Sure, I will remove the versioning in V2 patch.

> 
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  '#address-cells':
>> +    const: 2
>> +
>> +  '#size-cells':
>> +    const: 2
>> +
>> +  power-domains:
> 
> Missing constraints.
> 
>> +    description:
>> +      Platform management node id used to request power management services
>> +      from the firmware driver.
> 
> Drop description, redundant.
> 
>> +
>> +  xlnx,aie-gen:
>> +    $ref: /schemas/types.yaml#/definitions/uint8
> 
> Why uint8?
> 
>> +    description:
>> +      Hardware generation of AI engine device. E.g. the current values supported
>> +      are 1 (AIE) and 2 (AIEML).
> 
> No clue what's that, but it is implied by compatible, isn't it?

The driver supports multiple hardware generations. During driver probe, this value is read from the device tree and hardware generation specific
data structures are loaded based on this value. The compatible string is the same between devices.

> 
> Missing constraints.
> 
>> +
>> +  xlnx,shim-rows:
>> +    $ref: /schemas/types.yaml#/definitions/uint8-array
>> +    description:
>> +      start row and the number of rows of SHIM tiles of the AI engine device
> 
> Implied by compatible.

The AI Engine device can have different configurations for number of rows and column (even if it is the same hardware generation). This property
tells the driver the size and layout of the array, this is not implied by compatible.

> 
> Missing constraints.
> 
> 
>> +
>> +  xlnx,core-rows:
>> +    $ref: /schemas/types.yaml#/definitions/uint8-array
>> +    description:
>> +      start row and the number of rows of core tiles of the AI engine device
>> +
>> +  xlnx,mem-rows:
>> +    $ref: /schemas/types.yaml#/definitions/uint8-array
>> +    description:
>> +      start row and the number of rows of memory tiles of the AI engine device
>> +
> 
> Same comments everywhere.
> 
>> +required:
>> +  - compatible
>> +  - reg
>> +  - power-domains
>> +  - xlnx,aie-gen
>> +  - xlnx,shim-rows
>> +  - xlnx,core-rows
>> +  - xlnx,mem-rows
>> +
>> +patternProperties:
> 
> This goes after properties.
> 
>> +  "^aperture@[0-9]+$":
>> +    type: object
>> +    description:
>> +      AI engine aperture which is a group of column based tiles of the
>> +      AI engine device. Each AI engine apertures isolated from the
>> +      other AI engine apertures. An AI engine aperture is defined by
>> +      AMD/Xilinx platform design tools.
>> +
>> +    properties:
>> +      compatible:
>> +        const: xlnx,ai-engine-aperture
>> +
>> +      reg:
>> +        description:
>> +          Physical base address and length of the aperture registers.
>> +          The AI engine address space assigned to Linux is defined by
>> +          Xilinx/AMD platform design tool.
> 
> Missing constraints. Description is redundant - can it be anything else?
> 
> Plus you clearly miss ranges.
> 
> 
>> +
>> +      interrupts:
>> +        maxItems: 3
>> +
>> +      interrupt-names:
>> +        items:
>> +          - const: interrupt1
>> +          - const: interrupt2
>> +          - const: interrupt3
> 
> Useless names, drop entirely.
> 
>> +
>> +      xlnx,columns:
>> +        $ref: /schemas/types.yaml#/definitions/uint32-array
>> +        description:
>> +          It describes the location of the aperture. It specifies the start
>> +          column and the number of columns. E.g. an aperture starts from
>> +          column 0 and there are 50 columns, it will be presented as <0 50>.
> 
> Same comments as before
> 
>> +
>> +      xlnx,node-id:
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +        description:
>> +          AI engine aperture node ID, which is defined by AMD/Xilinx platform
>> +          design tool to identify the AI engine aperture in the firmware.
> 
> No, you do not get node ID. Recently every day a patch comes for that...
> 
>> +
>> +    required:
>> +      - compatible
>> +      - reg
>> +      - xlnx,columns
>> +      - xlnx,node-id
>> +
>> +    additionalProperties: false
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/power/xlnx-versal-power.h>
>> +    bus {
>> +      #address-cells = <2>;
>> +      #size-cells = <2>;
>> +      ai_engine: ai-engine@20000000000 {
>> +        compatible = "xlnx,ai-engine-v2.0";
>> +        reg = <0x200 0x00 0x01 0x00>;
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +        power-domains = <&versal_firmware PM_DEV_AI>;
>> +        xlnx,aie-gen = /bits/ 8 <0x1>;
>> +        xlnx,core-rows = /bits/ 8 <1 8>;
>> +        xlnx,mem-rows = /bits/ 8 <0 0>;
>> +        xlnx,shim-rows = /bits/ 8 <0 1>
> 
> This cannot be without ranges... I am surprised it actually works, but
> for sure was not tested and produces warnings.
> 
>> +
>> +        aperture0: aperture@200000000000 {
>> +          /* 50 columns and 8 core tile rows + 1 SHIM row */
>> +          compatible = "xlnx,ai-engine-aperture";
>> +          reg = <0x200 0x0 0x1 0x0>;
>> +          interrupts = <0x0 0x94 0x4>,
>> +                       <0x0 0x95 0x4>,
>> +                       <0x0 0x96 0x4>;
> Use proper flags.
> 
> Best regards,
> Krzysztof

Thanks again for the review Krzysztof, I appreciate your time. I will address the remaining comments in a V2 patch.

Thanks,
Greg

