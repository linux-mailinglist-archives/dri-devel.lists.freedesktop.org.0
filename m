Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC2CCCBD2D
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 13:43:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1511010E402;
	Thu, 18 Dec 2025 12:43:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ky1GjzR7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010068.outbound.protection.outlook.com
 [52.101.193.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9FF410E400
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 12:43:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g4SbzZsWt09MQ1ZzA475EQW4nVM1BuZz7jQQpRFCvsW5NdMhHK93HneNt2UMXNkSnErqYThPu6UbPQIOVWt2wAZdK4F1Ao4fFAhF0RLkpbiVMq6ODVrIjC/FxgLEfFD85mBt4KzBted9iWpPbRITIYFneXU5AJv4MYsCAt65JutFsvjFY4Jnsgu8uNrQPOV0prNq3yz5pivl/QyJQ+n8FR7/W9+br3pR2o5R/EkD9x8lv3tviEQKUT8rTD6jvVbD8t+qeU/yQrV4zYKiuC5Lz5xPeXvkniGdaRRr8hFU/jkaATKUKO8PikKxLTvfU1ELWlTvpWZFiNxhmwpnwWWubA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q5cUbtqBOu65JPY0uA0foEE3ZBz7UpkhGhgYs0fBYQY=;
 b=EdTaPIDmcDad6/TVb2KPAfw5XY2j3m/gU4qwcpfj4h0uY+KMi7j2nvvu7eBJKp+5ozXWkoA27Qvcy5m8SWaUeCc2sR3FUiTV/WVnEBx3gMsV0jfNDH8DVx6hj1wGtdArrw18n0S+wQsFxcsLumG4GTHJS7mkj9/r29y/oKvWSgO36Wl8RL+hhC96prHfhqLsplcX2UrZC/hWza19G82VmhCDh3O5HKn6jOCiPoT0Q8DTvI1+qXIw4sgtZkudfW64f2TcKvGj455mjjk5LtuHf/75N/9pOPuX8vIyxYXf3my4fCZpx6qAs0OtS3dKV8CywLttssa07K2Oa3M3c7vFkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q5cUbtqBOu65JPY0uA0foEE3ZBz7UpkhGhgYs0fBYQY=;
 b=ky1GjzR7WVvCGlY4qF5WtK0Gec2bQFDsSZVE2UbfnBAL6uQOCLjNPhsv18JikWfdDW/HPPrS7pqDtEhb6yFJ+eEG4RNsFIlTLp4CKekYDh+XdIL+gnQKcPkpRTDnhBHZ4AkfcgY/su+KvBiajRtcvX2k30wmYesSsYTESEyLMA0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ5PPFDF5E260D0.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::9a6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 12:43:42 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 12:43:42 +0000
Message-ID: <dbe0c5c6-3da2-4d25-8d56-b72526625e8e@amd.com>
Date: Thu, 18 Dec 2025 13:43:38 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/19] dma-buf/selftests: test RCU ops and inline lock
To: Tvrtko Ursulin <tursulin@ursulin.net>, phasta@mailbox.org,
 matthew.brost@intel.com, sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20251211122407.1709-1-christian.koenig@amd.com>
 <20251211122407.1709-6-christian.koenig@amd.com>
 <875587a6-a7d6-4d99-bfd7-49b6570941aa@ursulin.net>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <875587a6-a7d6-4d99-bfd7-49b6570941aa@ursulin.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN0PR04CA0144.namprd04.prod.outlook.com
 (2603:10b6:408:ed::29) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ5PPFDF5E260D0:EE_
X-MS-Office365-Filtering-Correlation-Id: a8dd0827-285b-489c-51c6-08de3e33136c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q2FSQ3RoNFNQcGw2WTJrVm9xTWROUTQ2YTUyNWJ1dnYrZnViTHVTdjVwRUVo?=
 =?utf-8?B?ZUU4N1VlV2xGTHBZK3JKZEl1cTVnQXQyaGJwNlUxYlVmZTZrOEZCMzJoM21M?=
 =?utf-8?B?Zmh3L0p5aTlRc1lLQ2c2N255c3JWL0JMTkhHeWtNWkJUUExmMTlGK0JIK3Fo?=
 =?utf-8?B?R3lZcC9oWlc1N0hDZ21PTTNSbm90OG53aStiOFd2YVUxZmpzb3FSZ2l2YStX?=
 =?utf-8?B?ck5qVGFxV2hXeDVBcXpBRmNPZ1NSdnhES08vc1lWdFFmR0hvUEs0SzQvbnhv?=
 =?utf-8?B?TG9jVkRhUXlGam9iaENLbUFiWHExbGFiOEdIL1dSQUFjUnh0UDNYUWtqQzcy?=
 =?utf-8?B?Z1BpR0M5dUlERUdhUUpPVUxZQWxYWVRqMm95TjRSZ2ZRVGpTeEp1TVd0QnJF?=
 =?utf-8?B?NmU4L3FNMzlYRkxUaGJzbGwwa2dVdjhHMTlaUWVla3JvOHJqRS9VQlVLbk8y?=
 =?utf-8?B?VHZkUVMzRnlZU3QvUHZHemxTU2E3RlErTDI1MDZMUGpGVk9PaUI4MGo5Tkw1?=
 =?utf-8?B?MXZoMkdyMkdPS1FtQTY4cXlQWWR6Si9IQnVFYUhRZ2x2NWMzRzR1Nnh5NG1i?=
 =?utf-8?B?YUlTTk9FS3l1YzhoaWVBak9wVkRPUC9xTGhBKzRXMjhwL2VaSmhLb1RYZks5?=
 =?utf-8?B?RVZQRjdaR0dzMmhUbHFCcVBSMTUzNE1KTStBVGkxYlQ5dStrcVE1OXBYOU9x?=
 =?utf-8?B?ZFhPUHlVM3lPc3BQZzZRd2xyOGNoLzlaOFJFWmlEcS9DMFp0a0ZYdjdPL3lE?=
 =?utf-8?B?NUw0Y2JUYjltaXIxejZRNzYwaHJyOWxjNGd1RFRRaHRoaXVIOG1jbDlOT2Qy?=
 =?utf-8?B?R0Z1MTYzZ2llS0Y1M29lS0pLdHFsREpDVGc1T2hWNHVLc3lTQWVXM2JFUTBv?=
 =?utf-8?B?RmJSczZKN2xYZG5nVzRCY0xjTksyWm42a2JhN0ZuYzhQMU15dUF0QW9jalI1?=
 =?utf-8?B?K1FoaDQ4UmRXMThlblBTTksxeEV4TkU3RTBRTjkrYlY5U1FyY2JGd3Ezais1?=
 =?utf-8?B?a1VjTmtpS0toaDFIU0JVNWpZRkVmTFpvTzZxTGtMcUYrb3p6S0JTazJwS25L?=
 =?utf-8?B?UDZKbVZROU1vTlNIVVVrQVY2c1c3ZHRiTzVPZXF4WmlVdkZ6TFp2SWNjK05D?=
 =?utf-8?B?Um9FZysxUXFranRTSHZUUTVaaU9CUDdZWjFWVTN0VnhmNVBLQkx3SDlaQ0VR?=
 =?utf-8?B?bEZSbXUxQjhQa0JpWklPTG1RM0tTamR1aUw2WWc4eGVIRGRjdStwbkpNMDRC?=
 =?utf-8?B?ckxId0psYlpqOFJ2Ly80a1VvL3Z2RlRQK3pUbVFvMHYxcUtjUTgybUY0RGZJ?=
 =?utf-8?B?NmtqVndJOTQ3UVdMTkY0Q3VpcjhMSzFZRkh0MjFEM3pSZ1JGVFkwRzNzTnlR?=
 =?utf-8?B?U29MaGRyYW5VL3VuU0FIYXRVQkFXMklvK3kzZVVkT012V2t2RnVCcjhXdHBD?=
 =?utf-8?B?ZHRkdHJ5akJOT0srQWFaNld1WG56YkVXV3pXOU10dWdBR3VsaVlIRmhnQjMw?=
 =?utf-8?B?SHM4VEF5ZmxaSDVuQjlpUE80R0svZHJmaytIeUpvNmJHV3ByUTk5V3QrOEZ6?=
 =?utf-8?B?V2VOS0h1Z09lbFhZM08vd0dCbGdxVGZZb0lvdXFOTTdIVUtMcWlGajNPL1Bx?=
 =?utf-8?B?dzJnQnFxbmpXRjUrZDd4NEtncDFNWWRxSGEyL2dQRTNtbFR0WVI5Z2U3Y0Zn?=
 =?utf-8?B?andNWHVncGJwZVl0cnNMK2FOamhoN3B4Vi9oZGFKTW5kZW1NSjIweUtjWGJa?=
 =?utf-8?B?cGpaVGtaUHVsTFhPQVN0QWx5VjhFaWlxTTh0a0MrUEt6eTAwbW5UMEs2ZlY4?=
 =?utf-8?B?enBYWDEvNzJ3bm50S0lqT1AveFJ0emRiUmlpRy9EK1RIaTk5MjZzMTBOQzcx?=
 =?utf-8?B?SEtrRVNYYm9FZEFNbHFrV3dYeEdNeXBEZFVRZk5rbkVtL3VQRmQ1RldKL055?=
 =?utf-8?Q?+e/nTZqk19MmTHgXLfnNuZUqlpHmfVCy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RG9leEhQUGN5YXQ1OHBQWjUrVGlwbC9nOXF1eUhIblNJYytlTXpobjloRzZr?=
 =?utf-8?B?V250RXEzSEhFNStRZDN0Y0pBdnVpakVtYmNPYitxNXRQcXdxdlNIQzJFS1Ry?=
 =?utf-8?B?S1RmcmNoNFM0cE50QnZzVjl4VityaVNyTnNyK2JOR2hzcWYvaVVaelc5Y0w5?=
 =?utf-8?B?a0owdURKZUd5ZlZJUXdWVUNTSzM3OFZ0KzlHc3pwVWw0OTk3UzBqRWpOb2VD?=
 =?utf-8?B?b0Iyb0lzalZTc3JFV3hMVDdnekRRWnd2YXAzT2FaeVdyYUhUQTBVcEZ4UkN4?=
 =?utf-8?B?N08zUFd4Uk1lSUxTTis2a3RxdHNJdWhXdEtZNTBvR0JzSXBpWW1oRVdjRmQw?=
 =?utf-8?B?czYxOWdFN1NFdUR3UjduMlVxVWhxb0lPL1FvVEUxYTBHWkh0U05xRzVWMmVL?=
 =?utf-8?B?c0YzVGcwWHB6YVYwWkJVaGlYc0NYaDh1enNPMS8zc3U3RUcwblR2TVlkWWtr?=
 =?utf-8?B?aHpSZjF4VHZsNE5RZXc0VTMySi92UVlTVDZscmpmSHFsdjNBaGRrMEpLMlVR?=
 =?utf-8?B?RzlrQWpMbXY1eTBja2wyRm1KekNiNzFZV3oycWRpMXc3eUhCRWlFQUtiRUdY?=
 =?utf-8?B?ZnRjYzlqOFlKdXJYdVNtcXRNd0I1UnlPVTY1L1lOSGJ2OGg5cExraHp2WEtM?=
 =?utf-8?B?M1daSldqYmVTZmdyOFFqWkZkMVp3cDdoN0k2TTc4Z1FwS0xWZTFteFF2MEx3?=
 =?utf-8?B?a0hXM01VSVQ3cFJkNmhoZjVZeGc0eVVLZThZZWREZUZIbG4rK05MQTVhM01Y?=
 =?utf-8?B?TUZ3ZDV2a1hxeVJtbTFSR2ZQUkZaZzhpZlRuOHNBU2dlQWxSOUUxTVdGZ0R1?=
 =?utf-8?B?czB0RklianJBTFMzWjFLNnRWVEFPRFVJSFdqNHpUdlYxTnM2Vm9MNlQ1TDJt?=
 =?utf-8?B?Z3JsZHdpZk8xY0U2cXpTQ0NadkZUckVFbGJmNVZVbExJbW9tcVdDbUZTYTFS?=
 =?utf-8?B?dU9ldFBSV2FPR2tqdjF3bHE1MW9PSlA4V0NRQXd4TVh4cm13anhVR0pFMm9s?=
 =?utf-8?B?MFh4WXdqWDdReWlNL05hZVg1VEJwK3haVFBLSjhCTkZQOTBIUEQ4ZUVwRWlk?=
 =?utf-8?B?WGRXNGJJbUhEYXh3R2ROWklOZWwwbUF3RTNpWElFdXVRQ0xzZWI0cVRQem53?=
 =?utf-8?B?OU1wemhlbmpHWlRFcjFhd3YvWThnbXovWVN3bU55NXRUWHo0dzNxTkhkb3E3?=
 =?utf-8?B?WTA2N2JXSncvTWppazBHUk9sN3IzSndkdk1PNE9SZTZFTUVGK2VBY2Z3VWZm?=
 =?utf-8?B?em5zM1BXUzFCRVdXVG9VNUxRcGNqcnVOd2lqM1A2UnJxdEJ3c0s1Sk8yMVdz?=
 =?utf-8?B?NDM3ZnFVWU9lNjNMaWRLcWZPcmZSWmlMV0swcWZhcEhkd2lNRXJGYVkyTXVi?=
 =?utf-8?B?dHV5TFByVDB3dkxJNFF2VkNqeWNhWWRQcWZpRzV3TkMzYzJpaEp6aVAwR204?=
 =?utf-8?B?S3JnVEFEY21wNDV4K0lkaWdZN2xvcmdoTm56dTc0aEV2RWxkQURDUmpId3NW?=
 =?utf-8?B?OXh1MjBSOVY5dFRHU2dUaEUwTHNvLzJkRHFpTURVU3g5bkxxdTdON1JGQXNr?=
 =?utf-8?B?Y2VvOU1rWFVBMnFwRHZta3VDMnBjUmZzSldicnBLY1RzeFhzaU8vN2N2ajVD?=
 =?utf-8?B?Q2k2NmUxR0lyVjdwSGVRcGVMUkFzaXBobVlablZ0V0pLYy9iZVdlZW44SDM4?=
 =?utf-8?B?MllyWGdGN0ZvU1JDOEM2d21ZNHRUMmJFYk14Ym9xanRwUlhQNmhrcVI2VnVL?=
 =?utf-8?B?WHFKRCtWQnAvNnRiRVpmNjRQMEhRMGJrd1RaSEJwYXh0UVVRaUtGdTg4Y2U0?=
 =?utf-8?B?RzlGS2NOckdCbmgzNDA3aTZwc29OT081SWdGbmZVMTh6SjJ4OEhGTEJHWTk4?=
 =?utf-8?B?V3RnU2h3THhTOTdQVU5CL1ZUV1pEWmd1YTZxNnZiUWk2ZmdQMkxEM0tDbU9U?=
 =?utf-8?B?aEV0eXgxVytFYVcyb1hoZytJS2VvV21mdzJpU05FMC83RkRwN2hjbFA3cnpE?=
 =?utf-8?B?OEpuSERXN1ZvVFdndXcwUlpSaHlabzdwa0dNQWo0RTE3Vmh1Yi9COFhReWdD?=
 =?utf-8?B?ejQyYVp0VmR3THFXdUNNRVdpTDZWYnc4RGgrdktOUVlzMlpRc1dBckphV0x1?=
 =?utf-8?Q?E6uH6y51BuTBijU6dIKbQrur7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8dd0827-285b-489c-51c6-08de3e33136c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 12:43:42.6323 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P8jtQBCBBVzZJNHHYytdMwscUgHOKbhnJEPvEpR94V6xHbCnFocBM3uz+V5xErnw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFDF5E260D0
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

On 12/11/25 16:04, Tvrtko Ursulin wrote:
...
>> @@ -90,6 +73,11 @@ static int test_signaling(void *arg)
>>           goto err_free;
>>       }
>>   +    if (rcu_dereference_protected(f->ops, true)) {
>> +        pr_err("Fence ops not cleared on signal\n");
>> +        goto err_free;
>> +    }
> 
> Bump to after the signaled check just below? Otherwise the signaled state hasn't been ascertained yet.

Done. I've put it to the end of the test.

>> +
>>       if (!dma_fence_is_signaled(f)) {
>>           pr_err("Fence not reporting signaled\n");
>>           goto err_free;
>> @@ -540,19 +528,7 @@ int dma_fence(void)
>>           SUBTEST(test_stub),
>>           SUBTEST(race_signal_callback),
>>       };
>> -    int ret;
>>         pr_info("sizeof(dma_fence)=%zu\n", sizeof(struct dma_fence));
>> -
>> -    slab_fences = KMEM_CACHE(mock_fence,
>> -                 SLAB_TYPESAFE_BY_RCU |
> 
> Hm.. race_signal_callback looks like it could be depending on SLAB_TYPESAFE_BY_RCU. To you not?

Hui? As far as I can see it doesn't.

The race_signal_callback test just depends on the general RCU functionality of fences.

Regards,
Christian.

> 
> Regards,
> 
> Tvrtko
> 
>> -                 SLAB_HWCACHE_ALIGN);
>> -    if (!slab_fences)
>> -        return -ENOMEM;
>> -
>> -    ret = subtests(tests, NULL);
>> -
>> -    kmem_cache_destroy(slab_fences);
>> -
>> -    return ret;
>> +    return subtests(tests, NULL);
>>   }
> 

