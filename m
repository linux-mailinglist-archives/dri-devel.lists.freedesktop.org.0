Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKpkKc7klmlbqgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 11:24:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A0E15DC05
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 11:24:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EBC110E280;
	Thu, 19 Feb 2026 10:24:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Q8gBgn00";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010070.outbound.protection.outlook.com [52.101.85.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79A3010E26E
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 10:24:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kMv/kVX89Hh2A2Xz1g8zws2GBaYUEy6TtbLPZ88tPhh9pVdP9HzLjJ8ko4L7z9+19hZ/07PysnqC2r2TGR2VhdXOZKW8i/PoomgYRUjDjAJw9yW3bqIh5rgBeRe3x2KWOuT9y2enAcR9NC7dPfbFczRLEWaWYKLlos5jE7NYKQLdgPqeIUlVXiO2j5zpmbsWB+D3jQCstrrjuUstMsUIJBvnGm4NUcMrm+FmBI2NmlYPYAaWoslLe2bcLvt+bczq32Rjcfg6lCTfsjP+uouzJ6kyyFIEjYxSpxfP8oekilI8nKSPzET7qXkSj+DhNnjE9dAw7Hn61NjdH9sEYkNBSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ixluDI3dscpc7sPVDbV3njPUfiMtBZzBkLRrC6oYoYg=;
 b=jXpKuC8SLnwhHiXSoEsTOWyKI5FjEoMqyFenCcWnfL8F+9bubdblT5KejMfP1OqysrtRWTNl5GgPZ+D+uymljYONRIRtIEJpeYOhKtSWW9ucdxrQFvuCJ7DJ2E663m95+BQDkN95GuL7v3Ix3wxcPUNFs0nRT7W+o6KTPKnLU7Rcaa4ja5vyxlVfXmSym+UqytlkPvz+EVY7EKUjVgjJ59BAN1fy1ZQCLwJMbprsJmfaiX+uWxYCl40A5DMUO0D7JYAzdNGAUpSqhxjvux4UlWedmX09+XlSP9wu3gIP1TAJzVJFbO0ZqKkdiX6gTpaqHr8Ue3EHmmAw4bWK0QLMxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ixluDI3dscpc7sPVDbV3njPUfiMtBZzBkLRrC6oYoYg=;
 b=Q8gBgn00nsrLer+U/DCy9NGXXrK2vlZnrX2KCJCtIWh5heYv27IDtxMBYb+3ev+pY0L0FDz67szo6GIsqQz/6/39Eg/AjZkgr/9nNM45+kBUSrc06TqlhuHZKXoSTlEWvquk/emW99qq57YioyHUDQI8ZZOnRlBTEq1BFQaVRos=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB6464.namprd12.prod.outlook.com (2603:10b6:8:c4::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.13; Thu, 19 Feb 2026 10:24:06 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9611.008; Thu, 19 Feb 2026
 10:24:06 +0000
Message-ID: <53a84ddb-9202-48bb-bcb1-e76ee3097eb7@amd.com>
Date: Thu, 19 Feb 2026 11:23:57 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] dma-buf: protected fence ops by RCU v5
To: phasta@kernel.org, matthew.brost@intel.com, sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20260210102232.1642-1-christian.koenig@amd.com>
 <20260210102232.1642-2-christian.koenig@amd.com>
 <f1345723cc5a61cdec5a6f168f71a323b822b7e2.camel@mailbox.org>
 <f357c2fc-3c72-42ac-b079-849222de4c6e@gmail.com>
 <9f929535744546bcb4eed26f6c27b4497ebc37bb.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <9f929535744546bcb4eed26f6c27b4497ebc37bb.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN0PR03CA0053.namprd03.prod.outlook.com
 (2603:10b6:408:e7::28) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB6464:EE_
X-MS-Office365-Filtering-Correlation-Id: 80c61d68-fe83-4007-12df-08de6fa10244
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U3I4cDRzMmFLT2xLUm16RHlSYXJ0UW9UbDFtZ0xINElpVDBtVUFSMVI4UWxp?=
 =?utf-8?B?M2dzWk9PVTVxUnhnMzMwZkhFUmRpcVpESTBhS2lsNjJsdWh2QTdlLzY0cDk3?=
 =?utf-8?B?RDdjd2lBbVRkUjA4YVkzS0hTcEFRNGg0Wll3eGFYQmZNZ3lwM28vQklyMXg0?=
 =?utf-8?B?Si9wWjVHTGxxQUFtK2ZXYm1UQ1NXaWo2MUp5NGlWclcyVnFPOHl2bkFwTHBu?=
 =?utf-8?B?N1E0WFoweU0zaENCN1pGYkJ3L2VyVnFTayt4NlFFcnladTltUTcwL21IaUpa?=
 =?utf-8?B?SXM0QVBwQkNsL0NGZElCdTFpa0NDZ2wrOWFHKzNiMVNMZDJXaWFoRWhYRHFV?=
 =?utf-8?B?UDJRT3kzem9xUHlyVWo3cmNaUkt6Yit3Y3Rla3hFSUZOdW01UXRQY2VwQ3ZW?=
 =?utf-8?B?YTNabWFyNVVjVUVkRWFlVE1TcDZwb0RPVlF4OTFIOElEUHNXV25ycXk1VVpw?=
 =?utf-8?B?SERGdlNqSTVXMjMxZERjeS9oVVZkZ2ZYKzE0NjdxS2pNYVlybVA1ZndpcnNz?=
 =?utf-8?B?aUlrVWVoT1Q5R2VPaWJjbGUyZGN2MEhDT1I1RXBnRDBOTGZwRFQ2dGU5N1Vk?=
 =?utf-8?B?bGZVakswcVVtR2I5cGlmSmxKRHV5QUl1aDFCSjRxQ2lSMkR5SHlvRkQyazNS?=
 =?utf-8?B?dkprSUEwNmFucndoMFQ2V1J5bVN2djBzSXFiK0dYc3doMnZJZHlZckltTDRi?=
 =?utf-8?B?Q0kvTzJ6Z01ZbmxRazFYcVQ5em9Rc3FINjBsRmRlMjg3eWRlQ3M5N3BkdFVm?=
 =?utf-8?B?Q0dySTdzRE44MEJwa0dqVUVuWEVNczNVS1VpanFjVExMVm41L21JeGFuRDha?=
 =?utf-8?B?UnYxZGFsdUxnWXFQOVRqenhQTHYvdGRpR0hzQzBhdjJyMHVTVEptOTlsaTc2?=
 =?utf-8?B?TzZ2OXkwVGpqT2UzQXlNQlRUOHdHY0VSQWFPV1p6MGthMkhVZHBlQm15S29Z?=
 =?utf-8?B?NzUxczd1ZVd1N3J4TzNwbUdZRHNRcEhtYmVlRjBva29rQ1NVZHRya0FyMXFx?=
 =?utf-8?B?bmdVVkE2aXorRnZFZTBZbmZSWmU2SUNNMGYrZUpESURWUVgwbVJBUGtaS1Vs?=
 =?utf-8?B?SmZzVnpJUGNkdHpGZlV6TXRBcHRaNHRMUEd1dXRscEdCRDA1ejQ5a0c0THQ2?=
 =?utf-8?B?T0dUWVp1bzdOeUcxT045N1RUNCtwSWZXUHd3TTRaQWtDUmxBZ3l4T25VOWRV?=
 =?utf-8?B?VVh6bWlCcVVYT0NrWWRnNWpjc282dnMrNGN3QVhIbzFSS1JuekxoSzNJNERU?=
 =?utf-8?B?dXFzQlpicXpoNXNoTzVDVDQ1SXozNEhwekJOLzJQeTQzVW5kMXEycTRjYzBa?=
 =?utf-8?B?YmZaZjZ5TG1yQTlMQTdPV3BFNk4yeTdrb1VOS3ZYeGFaZHIyTm1xbitIUWUz?=
 =?utf-8?B?dkFsaDlsaXBXRzRxK1lkYlByVUV5M2RoMGpMSlBWd0doOXRUS1RZYXp3SDk5?=
 =?utf-8?B?djVWNTJ2R2xRM3VQbGpxOUswbU95M1JFNEk5TEJLUmtRYWIvRjJsdE5oMEQr?=
 =?utf-8?B?MlJxUHp2WGEweUY2V0VVOWZkdW1kSXUzLzVlaGZzYXoxVlNuNjdqQW8xYzAv?=
 =?utf-8?B?RHpNVFU1ZmRUZlNKdDVLT1hjc1ZVUnFmUmgzbC9ocW9nODl6cmxDVUloYmw2?=
 =?utf-8?B?aXdTczJ5ek14azhWeWt2a25BNmFFS0hvdXRvY0doM3I3bjFtZUpZTytlUk80?=
 =?utf-8?B?Nlo5aGIwV3NTRWFrelZ2b3dGaVlaOUZsakhtQmZGRDF0Z0dVRnhzbDFPV2hQ?=
 =?utf-8?B?UWxsUUpJclFEQklBQXhqTjlrYzRLR2UzQkErTXVpeWdjR052Q1czcUxxMy94?=
 =?utf-8?B?enhkQnA1OXF0TGs4bnZZQ3JtY0FaRzZXcjlya05zdi9DN0QwODhINVJnaDhu?=
 =?utf-8?B?c2hSaEprc3lnR2RQU3ZuRWFyRjlMdG5hL2FZemJxajJVNDJzZDlHNTdQZTgz?=
 =?utf-8?B?UGx4ZmdLYURyRUZMSThHY0tpOWM1aDVXVGwzdnBFblBtM2pFemkzZURJUnpE?=
 =?utf-8?B?ZDgyclA1VzNzUmFOVFpZZFZLdTBra1dYYnNSY2VIcDdEUElCMHRLRnJVT3Zh?=
 =?utf-8?B?eFZDd3BUWmhVY2R6UEZBY1cyTjZpcVlsanp5RFBJa25BSVJlMythb05mQ05G?=
 =?utf-8?Q?Pc58=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q1JNODNwSmVJQVVCUHA4TnZqcXI1UWlTcUJkOHlJV0ZKdGpUR3owelVnY2NK?=
 =?utf-8?B?S1hQenFJTDBuUDZRQWl4VXZZbGNKajgvKzIzblhUb3A2LzVMVE9JSTFuZXhO?=
 =?utf-8?B?dWlkNE41RkwySGJLY003WlRtSG5ySFpIMjRyZ2s1SVprejQrUFllL2pmWTFL?=
 =?utf-8?B?TkMrdTF5cHE5NHBaaWpQS0xTaXFabXIxRXRONDFhRWRHc2hXeWpqdStJRlN1?=
 =?utf-8?B?VDNVdXZ1ZmlwWkdaZ0hPTnNuQy9PM21rTmZ5bnpXQ291ODNpS3Q5RlRnUEpo?=
 =?utf-8?B?azlZTHV5WVlwYW9OemRSVjJ3N2FHZlN5VVRYVGZpVDhaS0swM0ZhemtNMk9v?=
 =?utf-8?B?aG9QdlhSZ1p0UEEvN3FPcmNVS3QyMTk0WDd3WmZ6VElaZW11dDhMU0lLcC9D?=
 =?utf-8?B?MVFvS0lzeFdUZlJCa0lSVTFPa1MwNm5zSEhsSU0yd00zbHRoSjZJSGMxd3Mv?=
 =?utf-8?B?UDY3S0dEUWpBZE4vK1Y3NVRtcHNKTUhnNmwxYUt6d284WVlKaU0wdHBORFNP?=
 =?utf-8?B?Ymt6Qkk1TEJOZkIzdDBaL2ViUTZhSUwrZERJZnliL3hjcUxBbU9XVjRUeWpr?=
 =?utf-8?B?OUs3NytFOUUzai9qbGFMRVROaTdaQ3hqMnJDK0c5SnY2YVBDL3B0Yzd0cWE4?=
 =?utf-8?B?cWlNTENEM24xTjhUL3FBN2dESFI2MjkvNXRiUFRLd1h0a0Q4TnVCN0JIclpo?=
 =?utf-8?B?VzVraHhBaUVLSGl5bVcvSjhZWnZxaVJRMlVuRjVFOXpRTEdtZW91eHJ5U3kv?=
 =?utf-8?B?RHErSDJIeDdjaVh3R1dKeTNoL041bWtBZjBPVnpxZEo2OXBxWm1CWTFRbzJs?=
 =?utf-8?B?ZURmL3lSaUQvNSsxUE9IME5QVmg2V0J0eTlKTUFZd0l5SzdIMko4SXRXVGNY?=
 =?utf-8?B?K3pyNDBBelpFbWdOZW52OXBGYk9YK0JBL091ZjJsQTROalJtbi9HRjNZMUNZ?=
 =?utf-8?B?Z1IvSTBITkhVMVpVcTdGZWZ3UFJxaEZnV0FLVklnajN3TzNGekJLeWJCbW80?=
 =?utf-8?B?VU9pbTVuRzlUSHUyTjFQUU5pait4Z2d2REdJcnVQZFZ0ak5YNGNsQ1h0SFMx?=
 =?utf-8?B?dWduVytzSnhXZFdxb1RFWE1ua0ZQa3AyN05qaTRRSlh0dVE0V1lRRjVoTDBv?=
 =?utf-8?B?LytydkI3OWVYQWZnb1lLMzNXSVU2TmVkNHhwTVl0aXF2cEExNThlVFZiT0JQ?=
 =?utf-8?B?NmxGVWhvaGtSeGRweFcwQjlZZzBJZEk3YkFBT2g0ZjhibkQ5Tm1qWkNTVkhu?=
 =?utf-8?B?bm9MU25zbmlKdmdaUldWWmY2K3lRYmQveGdWbWFWeEl3RDN4cEZCb08rYkxy?=
 =?utf-8?B?bElCVEI2Z0ZiSktVRko2R05UcjVRY3dSdnZ5ODVyRi9aQjBubGFGZERJZ2Nn?=
 =?utf-8?B?SVMydElhM0d5ZVY5ZTlLRnVjYTZIcVFkZisrNFBGaUF0YUFwS28rdlUvQjVK?=
 =?utf-8?B?bVhySk9NVnQxdmJRWFA2ZWVKU0ZCcmsyMHJ0UFd4VkRYNmZSMTh4QzhOSnpV?=
 =?utf-8?B?NU4yWVUwRUVHQXU4OUJ1UUNOdUQxV2tob0NkQ3BYUWRWRVcxc2ZBcUQ2WmU4?=
 =?utf-8?B?YTYvVkNwcjNLL254ZlNTa0NMdlJKVSsyYnRlZStTVFJNaFFpdTFQaU54cngr?=
 =?utf-8?B?MW9jd2lRelBNaHR1V2Z0UVFVeFQzRlVibDR4SVdPOUNMb0N6RnBxTmdwY0pt?=
 =?utf-8?B?MmxvUkFYTHNEcjhKeVpEVVpHaTRObHNuUUdyeGxqQXhZNmNIaGFId1Znc2ls?=
 =?utf-8?B?dzBUbkxvdVduckhqRWZqUERQWGwrQ28veS9UNkpvc09vK2ZMSCtiYldMd3NB?=
 =?utf-8?B?WFhQbE8ydk5FSGVrdXFYaUs0cmkrSXI0UHNWY0hORUFZL3lyU1hTcjVHRFY4?=
 =?utf-8?B?RC8xVHE1U0RhWUxCVFFKQ2pEaFFGbVBTRFNKc0xxQjczRmFGOUdHUGZDaVox?=
 =?utf-8?B?TVR6Q0Y2cjNWd3hVY3FpZVdhenU3MVJEeFNPRTJFTjVhZzZpZS8yU0VjMlJM?=
 =?utf-8?B?SCt6MzdGN0NubjRXRDZyZkdwdk5ORjNZcEtsZTl1elMzeWYwNTEwZlcwQjBL?=
 =?utf-8?B?U21SbSt6MWhscVBzMjc5NjQzbGdqNkdSZXhBdkRNbkdUUkdkQURWdHBxTDVp?=
 =?utf-8?B?SktZMUdseWlVYWkzNFpWb0s2VFhsU1Z6TDRFSWZEZ3QxUk5PTncrRDk2WERB?=
 =?utf-8?B?RXgrcUo1b0phQlVLY3BVZUkrNi9CVENmN004VmMrUnNoQXFsNEYzUTZhMnFL?=
 =?utf-8?B?VVpQaUhuaEhDcnF6OSsrTE04VklmN0ljWE9oK0RPdEpGWms0RnZyTUlzMW9Q?=
 =?utf-8?Q?/H1Qhs+tcBDzGg0Lb3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80c61d68-fe83-4007-12df-08de6fa10244
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 10:24:06.0175 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aR+h1zVsGErbH8XL738EYEqlHjaTZd8Ug7Cm9h4+wLzyvS5Xtb97XpnohBIdJ0qA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6464
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:matthew.brost@intel.com,m:sumit.semwal@linaro.org,m:linaro-mm-sig@lists.linaro.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 16A0E15DC05
X-Rspamd-Action: no action

On 2/12/26 09:56, Philipp Stanner wrote:
>>>> @@ -454,13 +465,19 @@ dma_fence_test_signaled_flag(struct dma_fence *fence)
>>>>  static inline bool
>>>>  dma_fence_is_signaled_locked(struct dma_fence *fence)
>>>>  {
>>>> +	const struct dma_fence_ops *ops;
>>>> +
>>>>  	if (dma_fence_test_signaled_flag(fence))
>>>>  		return true;
>>>>  
>>>> -	if (fence->ops->signaled && fence->ops->signaled(fence)) {
>>>> +	rcu_read_lock();
>>>> +	ops = rcu_dereference(fence->ops);
>>>> +	if (ops->signaled && ops->signaled(fence)) {
>>>
>>> Maybe you can educate me a bit about RCU here – couldn't this still
>>> race? If the ops were unloaded before you take rcu_read_lock(),
>>> rcu_dereference() would give you an invalid pointer here since you
>>> don't check for !ops, no?
>>
>> Perfectly correct thinking, yes.
>>
>> But the check for !ops is added in patch #2 when we actually start to set ops = NULL when the fence signals.
>>
>> I intentionally separated that because it is basically the second step in making the solution to detach the fence ops from the module by RCU work.
>>
>> We could merge the two patches together, but I think the separation actually makes sense should anybody start to complain about the additional RCU overhead.
>>
> 
> Alright, makes sense. However the above does not read correct..
> 
> But then my question would be: What's the purpose of this patch, what
> does it solve or address atomically?

Adding the RCU annotation and related logic, e.g. rcu_read_lock()/rcu_read_unlock()/rcu_dereference() etc...

This allows the automated statically RCU checker to validate what we do here and point out potential mistakes.

Additional to that should adding the rcu_read_lock() protection cause performance problems it will bisect to this patch here alone.

> Adding RCU here does not yet change behavior and it does not solve the
> unloading problem, does it?

Nope, no functional behavior change. It's purely to get the automated checkers going.

> If it's a mere preperational step and the patches should not be merged,
> I'd guard the above with a simple comment like "Cleanup preparation.
> 'ops' can yet not be NULL, but this will be the case subsequently."

A comment added in this patch and removed in the next one? Na, that sounds like overkill to me.

Christian.

> 
> 
> P.
> 

