Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E918A958B91
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 17:45:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 626C510E356;
	Tue, 20 Aug 2024 15:45:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="QnVtTlbx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2064.outbound.protection.outlook.com [40.107.93.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D57410E29E
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 15:45:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a+w2c91juK21/mOewRkwhwBE35roH1Buo6lKFxPFLHgd+zEY1gmsCxmMN3hpHrJCzG+x/lL177E6r2UwB7rOkQd1dRXZpAWAzJCh5wo8Ppy1hK4etNikO14Q1UnJr2GzHKF+AlrwuFNO8hEvsiH9Vb1AM1Rv/k5ULkDKfOx2lnV3rDXdFzRVfvFkb/gy+8h+drGDczER80XIoy1IvjbMv9Za1oANjcMHCk6ge5xQRXBc4i6Wmnf/npnYayY1wyam6Uke25QK7rY04703AH2m+zmgwoq9jWAJufPokUD55L65qGt4NfeUv+g68+vpB3azaerzwhUsYhdpKFHV7dp6tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X4p4g0oKc4rO5EibBvsjvk0oHK6nP6UIR9g+jJ4Sk/k=;
 b=LofnyoTcB4fIasVJHE3tTz/eBByVeb1y1eBgAavm3O3EkSCRdlXyLEgXWOXQ7glLUdUbJDgfudN2uS3a4zY754JHfmk024IXxji2cl+X+jYfuBo6Xpg/30eiwaGz09wbX4v0wJy9yb3YipMps2kkm14uXdBXes/oKa4xcm6oBEAj0+9PNqo8vowvwDNTY108d6GS8nFzffpwVmo3Add45MlXS+O2JMvZb6hoKODoLiX6VxrYiizmZ1s6UJzDKuZnJ3KfyvqNzhRd2DS+ORW9S3MYEbDodP1/pEIuDLWcksO+QGJtHGPYotz9d/HRByWPX9XbXAMPKUIMzHMS3s5fiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X4p4g0oKc4rO5EibBvsjvk0oHK6nP6UIR9g+jJ4Sk/k=;
 b=QnVtTlbxJRvccqh+DLGJS46YhslxoAnS7sDRDUPNlTkNF7bQcCZKpW3dabBmFo1SZXKO6aKsknINBieoqzjpRR2dOnQyKqDF/A7nJNa7T/VRszVf9a/Sm7RM1v1oxm0AiP9Fvq8RO5QxSagsvdIfpJyinn2hrPp6uKByngxA8+U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA3PR12MB9180.namprd12.prod.outlook.com (2603:10b6:806:39b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 20 Aug
 2024 15:45:41 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7875.019; Tue, 20 Aug 2024
 15:45:41 +0000
Content-Type: multipart/alternative;
 boundary="------------Y9vF1Ebcm1tnohDLfm74tMFr"
Message-ID: <4d4c532a-ff35-4172-9b71-93f5d130711b@amd.com>
Date: Tue, 20 Aug 2024 17:45:36 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] drm/ttm: move LRU walk defines into new internal
 header
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
References: <20240710124301.1628-1-christian.koenig@amd.com>
 <20240710124301.1628-5-christian.koenig@amd.com>
 <Zo7QpJKtVNw4RvUd@DUT025-TGLU.fm.intel.com>
 <14b70a4d-dc65-4886-940c-ffc1a8197821@gmail.com>
 <77995ffc6de401bc8ed2f4181848dffb18540666.camel@linux.intel.com>
 <20bceb24-8cae-4f0a-897e-326dbf8dc186@amd.com>
 <7d3c647a2df19aa0f8a582b7d346ba8014cf6ca3.camel@linux.intel.com>
 <ZsNTTCfBCpZNrSQH@phenom.ffwll.local>
 <440bb9a5-54b8-46ef-b6db-50110af5c02a@amd.com>
 <5a2f24bce352b65a1fb6e933c406b3ab1efa33e3.camel@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <5a2f24bce352b65a1fb6e933c406b3ab1efa33e3.camel@linux.intel.com>
X-ClientProxiedBy: FR0P281CA0242.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA3PR12MB9180:EE_
X-MS-Office365-Filtering-Correlation-Id: f69a2d9e-8095-4cf7-57d2-08dcc12f2540
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R3F3RjEvUGFLK2RUQW1JVWpqVXNkYkx6U2o5ZHA5V0gwc01NVjVaRHVrS1pL?=
 =?utf-8?B?TnNOTTFXRDN5SnY4VjJqdFI2clVkWVlwYUpvaCtuK1JKRytwUVJ0eUJ1Z2RK?=
 =?utf-8?B?ZTdKKzJzVzA4TnJ1OHBTcnpaM1RjdFhBUk9PV0MrUUVwbUxJOWNvUlR4cmdx?=
 =?utf-8?B?K1VTeVhxUk1JbHRRM01sdkloeXlWV1FNRTlIK1ZFV1NtckRnQmRhRHo0S2sr?=
 =?utf-8?B?U0M3NWo3RkFraGt3UVlRUlQyMnZTYjFTaTUzMDlPc09YNHByTXBmUk1yQlhz?=
 =?utf-8?B?ampjVVpDWk02TmNXdmpqZXkxVFllM2hzdnZBZTZCMVM4SmZ4ZTN3SUlJb25M?=
 =?utf-8?B?aVpqazBMYnk4SW5CSFE5NmtTWEJSZlBkdmFnMTdlUEtZckdjRHhyZlQyT205?=
 =?utf-8?B?MVBZTlFOY2ZyVGd6QU8yaFdtREExZHhwM0ZRT1VmUVY2MFRCNnVibll6cTJz?=
 =?utf-8?B?OG5XbTB0bFdrbWJEcGd3a210NmNVVWxJWnc5aWFZM2pRaE1JRE1aZzBleDVS?=
 =?utf-8?B?ajhtSXBvbTNEd3hGRFkrSEp6NW0rS1hYZTRVcysvYmkyb253UFJRMTBKYnlB?=
 =?utf-8?B?L3VVS0VoYkhIeDh1WkxNY0hPYmFLUTFsWFpiUTRLVHAreWNLWUhEcHNKY1Fo?=
 =?utf-8?B?b3hUMlJOQm1OamRJc3EzNnpZVXhsZ2ZrOUZnNWhINkRpTDdpR1R1RHRxWEtX?=
 =?utf-8?B?ZVhFZi81VzM3WUdwc0dHd3ZpQkYwUUtoRmZmenlCUVBVTW1mTXlRVFFHeHdy?=
 =?utf-8?B?blZjZ0FBTEI4WDJZMXQzdmlTeVZYUGV5RG9aQTFBc3pnaC9oYWVuaWZLN0Va?=
 =?utf-8?B?Yjh0MmpJMXRRbHFocy9FMlZWN09wMEZYYndyVWlmQWFoVktYN1BXZUxTeHU0?=
 =?utf-8?B?enViWXZEaXpheWprck92MXpxV0lNUENDYXNScFN0R2RrcFNxMDJYcnpSejBx?=
 =?utf-8?B?UVFsOTYrL2c1VG93MDBUZDdFbXc0aEJHMUdiOWNWMmdVNkk5T05hS3h3TDBY?=
 =?utf-8?B?bVp5Skx5bWw0RDNJRi9lZjN1SzV1dGdEN3k5cjF6ajFlWkxRRnYwOGJzUkV3?=
 =?utf-8?B?czd1RUUwVkJPWkRxT3dpc1ZDVXNZcjhwTU95WjNQaWZ4S1YranpVTFNMd25Z?=
 =?utf-8?B?YlJaTnZQYmJpaDVkUmdWZk9BaUxWdzJQZUlyOVc4b3RMeEo3QmVoa3Z1L3VC?=
 =?utf-8?B?ZTBVOCt3c2toVEVOVlFLU3AyTUV2bUdtMXNnbjFKWk5sdUZPNjFZRWsyZDdV?=
 =?utf-8?B?Qy9OOGlwUlpvZ0xtRW5ydWsvT0xFTENoT09rY1Q0S2VHc1g0enRPNyswMWs0?=
 =?utf-8?B?bmx5dGs5TkVuUGxPK2Q2TDVQVWtENHFCL2lCNHBtZXJSaUpvQy9MaDhTT0Y1?=
 =?utf-8?B?VFBNdGQ2WE1mNlNXRnJlcXVEVStsNlpWa1RkcmNFYTdXMUpqcnQ2ZTFrTE5h?=
 =?utf-8?B?SUdzeVUzeHE0VklPdWsvZmJZcVAwYURVV3JDM21GQnpnV001ZlM2ZXhJTlRv?=
 =?utf-8?B?YUlvMTVDd0NWYUJtUSs2UGNQZXB1eU01ZlAvSHBQRnptKzZlZXFaVmlSQjZK?=
 =?utf-8?B?c3k0R01sTTY5QnpHVmlsUCtkdVdPUm1nRzRjTHVjbm1ScW9Ha2FESWJkUEFM?=
 =?utf-8?B?cFZKOStaSWhCT0NqWFJFcnlHMmFPWGdSTGp0dHRSd0VYRTQ4ZUdxTHVFSnc4?=
 =?utf-8?B?VzhRbUJsMmtiZ1U2OWViUjlrazRXaDl3T2JyTjM2Z01zWVF1Yi93K2ljOVdI?=
 =?utf-8?Q?fVnWi0/Zod1zfY59ZE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WkJHUjY2QjdWSnVxVTE1T2plaWFvSUsyaHd5QWx4RU5ZOGl0RlNFbWpyVkQ2?=
 =?utf-8?B?WGs5bi8vYTVrdUVvRTV4V1MyZ0t1TE93Z2RZK253UmtLd1ByQ3pWMUFFN2Vx?=
 =?utf-8?B?MkVoamhBSnVKaCtMRUNuM1U5dVh3dlpuTzI1bDJDaCtuSkFpTENydXpSM0xL?=
 =?utf-8?B?RWw2YnlvYndjSnJGNnB3VkF3bU5wOWNiOXUrL21iNUEvQzFyRkJWWXdaWnoz?=
 =?utf-8?B?MktiUEgraG9uaEhwQTV5T2prcUVQM0FZeWpad0xhUzZIbjc3V1dLdDR2VzVC?=
 =?utf-8?B?V2tBdXpzcDNTczVOMDMxbG1ySUpsY2tDc0NHem5DWXJaVHNRUXc2cDU4Wm1x?=
 =?utf-8?B?WkFwSTFVWUc5UUJudHQ2WHhFT1dsZFFmaE5QWjltcjB5eWdYSFZyMmtoNHN6?=
 =?utf-8?B?eTdETmIyYmY0MmVBT0d5S0lsRnNmQ3BUYlJra0NlQmFNb0hFVzNFTVltVE9x?=
 =?utf-8?B?SXVTaDVsK1NEckowVDFMc1RYVjlOT3NlQkRwakFLRU0zUUdxZkE3MnhWdDAy?=
 =?utf-8?B?SUExandheTZacm41aWJsUEpUemJrNkNUTkxZYUZsVmE2aGtLMU9OODh6aXd5?=
 =?utf-8?B?ci9uRzB3d2M3L2hTYStYNFVHd1BUQlV3ekgvV2tkVUdMSys0M0hPZ0ZLNnM0?=
 =?utf-8?B?Z3Izd29YR2p1RTRRK2phblFiTjBva2JBZUxLS0s0LzJmZkxSK3J5dG5CTWMz?=
 =?utf-8?B?WXJ2RDZNZFNjTXJMSlFGMUhlUlY4RXQwdWlycFZiU1VTU1pPa3lxV3U0bTI2?=
 =?utf-8?B?NUNmZURoTm1NVGRDSnFYdXBvS1RBa0phRTkwOExTUC9YZ1N5UGJlWkZmTm52?=
 =?utf-8?B?dGp1anFqV2NSKzJIWVNKdVFrK05pRUhUVDRlQWUvTUFmZEl0aUtodHpDeitK?=
 =?utf-8?B?cDBySmgwN2ttY1IvVUVGVDU3YXBGUDBmM2lOTFFTcDBUMFpNT0R0Z2J1WHQv?=
 =?utf-8?B?MXIrNTFNRnM4c0x5RGVXRERHck5WcWZCL29ucTN2Q3I1bzJtcVcwbVBZZXd0?=
 =?utf-8?B?aEQvQVJPMzN5UTIwRDdCU3RQQ3k1Mi9jQ1hWUm1LUVR3ZFhCN2I3QmZhbFVP?=
 =?utf-8?B?UDlEV3BIYSt6NU9tVjRpUHJUc3RGNDlmVG5vODZseFhSaWhOOEsvdjVqd3JV?=
 =?utf-8?B?d1d0UWdUSEc1ZlM5NE51cnJ3L3Eza2R1NU41TUZJYjhja0V6NDE3Q3MxS29K?=
 =?utf-8?B?MzU0N2hzelFabDJjNmxjR2ViTWF0UGgvVFVMWDh4VzVuVFpHSThZL3E5VEhu?=
 =?utf-8?B?M0hIZUc2L0lJR1lNZjBycWZraEtDaVdPeG54bjlVTGFHKzMyRllpdjNncXM4?=
 =?utf-8?B?RkVzaVlQOVlUUlUxUktBSW9lTlJkQUx4K3EyclhiaWY4VVd6cUVJV3I0RFpM?=
 =?utf-8?B?R3VyaHpTNitpNFBMTUFEMVJZcDlBNTRkMmxGeDJsME1wWGVVMlZ1SDgrR1dt?=
 =?utf-8?B?Y0UyVjExdTFqblBPZm14aFQvL09qTzVPcU13TW1vZ0xpM3hLTXhxY3NnTzVS?=
 =?utf-8?B?T0hYS0dQWFR2YjhXSnNwakh6aXNGcVhWQ1l6eks0ZEJ0R3hjbHhsbURhMGRr?=
 =?utf-8?B?TkVyNFdPT2FJMVJzTWFnVTRqdFArV20xUVp1eTFQOGxVb1BOY3BkcUZFOE9U?=
 =?utf-8?B?dDVhMmZvWXBjZW1hVWJPRHNsKzE0M1NQcHJmTHQ1am5RVmN2ZUl6cHZFRDJJ?=
 =?utf-8?B?bjkwM3lDdFB0TUFlaW5oRDZ1NFZPcWEzTklRSm5pMTJXTnFCY1o2YkpZYXN6?=
 =?utf-8?B?a1pIeUluOWdiMlJQR2RnZm9mVGUrdWlESGpGbys5SkhYRUxieTkvZWlFcVlt?=
 =?utf-8?B?azBBek90MEtHMXcxai8yVXY2dkZNbDE1aHNXcHRKQ0lxQm9XRFZPTjlKZjBu?=
 =?utf-8?B?RDlKL1NrUWFCc2pNUVFvT25Sblg3N002SjA3VzR0N3R2NFo0SmJMc0JpR1hl?=
 =?utf-8?B?NHUvcFFsSjlvelU1YkZBR25YaU1ocXNlVUdiQ1k0ZHhaeWdscTJ6YzA5NFF6?=
 =?utf-8?B?RDVIUnRHWmwvVjFmTmY3REQvdlZZOTI2U0NwdkZlNzR5UzdvaDdXNmpFcWIx?=
 =?utf-8?B?RVF5QkpJZVBQWC9iVXBRNEJPWmNBejZSSmkrRGlWU3ovTzRzMGZUR3h6Rmpr?=
 =?utf-8?Q?Nclk=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f69a2d9e-8095-4cf7-57d2-08dcc12f2540
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 15:45:41.3737 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: so4Vaf8f8shbOAT1UXSg2Goh3h0e1ckcLPReF7gsbSR1Lhro5CelZrasj0wo8ovU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9180
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

--------------Y9vF1Ebcm1tnohDLfm74tMFr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 20.08.24 um 12:37 schrieb Thomas Hellström:
> Hi,
>
> On Mon, 2024-08-19 at 17:26 +0200, Christian König wrote:
>> Am 19.08.24 um 16:14 schrieb Daniel Vetter:
>>> On Mon, Aug 19, 2024 at 01:38:56PM +0200, Thomas Hellström wrote:
>>>> Hi, Christian,
>>>>
>>>> On Mon, 2024-08-19 at 13:03 +0200, Christian König wrote:
>>>>> Am 06.08.24 um 10:29 schrieb Thomas Hellström:
>>>>>> Hi, Christian.
>>>>>>
>>>>>> On Thu, 2024-07-11 at 14:01 +0200, Christian König wrote:
>>>>>>> Am 10.07.24 um 20:19 schrieb Matthew Brost:
>>>>>>>> On Wed, Jul 10, 2024 at 02:42:58PM +0200, Christian König
>>>>>>>> wrote:
>>>>>>>>> That is something drivers really shouldn't mess with.
>>>>>>>>>
>>>>>>>> Thomas uses this in Xe to implement a shrinker [1]. Seems
>>>>>>>> to
>>>>>>>> need
>>>>>>>> to
>>>>>>>> remain available for drivers.
>>>>>>> No, that is exactly what I try to prevent with that.
>>>>>>>
>>>>>>> This is an internally thing of TTM and drivers should never
>>>>>>> use
>>>>>>> it
>>>>>>> directly.
>>>>>> That driver-facing LRU walker is a direct response/solution
>>>>>> to this
>>>>>> comment that you made in the first shrinker series:
>>>>>>
>>>>>> https://lore.kernel.org/linux-mm/b7491378-defd-4f1c-31e2-29e4c77e2d67@amd.com/T/#ma918844aa8a6efe8768fdcda0c6590d5c93850c9
>>>>> Ah, yeah that was about how we are should be avoiding middle
>>>>> layer
>>>>> design.
>>>>>
>>>>> But a function which returns the next candidate for eviction
>>>>> and a
>>>>> function which calls a callback for eviction is exactly the
>>>>> opposite.
>>>>>
>>>>>> That is also mentioned in the cover letter of the recent
>>>>>> shrinker
>>>>>> series, and this walker has been around in that shrinker
>>>>>> series for
>>>>>> more than half a year now so if you think it's not the
>>>>>> correct
>>>>>> driver
>>>>>> facing API IMHO that should be addressed by a review comment
>>>>>> in
>>>>>> that
>>>>>> series rather than in posting a conflicting patch?
>>>>> I actually outlined that in the review comments for the patch
>>>>> series.
>>>>> E.g. a walker function with a callback is basically a middle
>>>>> layer.
>>>>>
>>>>> What outlined in the link above is that a function which
>>>>> returns the
>>>>> next eviction candidate is a better approach than a callback.
>>>>>
>>>>>> So assuming that we still want the driver to register the
>>>>>> shrinker,
>>>>>> IMO that helper abstracts away all the nasty locking and
>>>>>> pitfalls
>>>>>> for a
>>>>>> driver-registered shrinker, and is similar in structure to
>>>>>> for
>>>>>> example
>>>>>> the pagewalk helper in mm/pagewalk.c.
>>>>>>
>>>>>> An alternative that could be tried as a driver-facing API is
>>>>>> to
>>>>>> provide
>>>>>> a for_each_bo_in_lru_lock() macro where the driver open-codes
>>>>>> "process_bo()" inside the for loop but I tried this and found
>>>>>> it
>>>>>> quite
>>>>>> fragile since the driver might exit the loop without
>>>>>> performing the
>>>>>> necessary cleanup.
>>>>> The point is that the shrinker should *never* need to have
>>>>> context.
>>>>> E.g.
>>>>> a walker which allows going over multiple BOs for eviction is
>>>>> exactly
>>>>> the wrong approach for that.
>>>>>
>>>>> The shrinker should evict always only exactly one BO and the
>>>>> next
>>>>> invocation of a shrinker should not depend on the result of the
>>>>> previous
>>>>> one.
>>>>>
>>>>> Or am I missing something vital here?
>>>> A couple of things,
>>>>
>>>> 1) I'd like to think of the middle-layer vs helper like the
>>>> helper has
>>>> its own ops, and can be used optionally from the driver. IIRC,
>>>> the
>>>> atomic modesetting / pageflip ops are implemented in exactly this
>>>> way.
>>>>
>>>> Sometimes a certain loop operation can't be easily or at least
>>>> robustly
>>>> implemented using a for_each_.. approach. Like for example
>>>> mm/pagewalk.c. In this shrinking case I think it's probably
>>>> possible
>>>> using the scoped_guard() in cleanup.h. This way we could get rid
>>>> of
>>>> this middle layer discussion by turning the interface inside-out:
>>>>
>>>> for_each_bo_on_lru_locked(xxx)
>>>> 	driver_shrink();
>>>>
>>>> But I do think the currently suggested approach is less fragile
>>>> and
>>>> prone to driver error.
>>>>
>>>> FWIW in addition to the above examples, also drm_gem_lru_scan
>>>> works
>>>> like this.
>>> a iteration state structure (like drm_connector_iter) plus then a
>>> macro
>>> for the common case that uses cleanup.h should get the job done.
>> Yeah, completely agree. It basically boils down to which one needs to
>> pack a state bag.
>>
>> In a mid-layer design it's the driver or the caller of functions,
>> e.g.
>> the much hated init callback in the DRM layer was a perfect example
>> of that.
>>
>> In a non mid-layer approach it's the framework or the called
>> function,
>> examples are how the fence iterators in the dma_resv or the
>> drm_connector, plane etc.. work.
>>
>> One big difference between the two approach is who and where things
>> like
>> preparation and cleanup are done, e.g. who takes locks for example.
> So what in your opinion is an acceptable solution here?
> The "get next object to shrink" approach won't work, since it's subject
> to the old TTM swap problem now removed:
> If shrinking fails we will get the same object upon subsequent calls.

But and that is expected behavior. If shrinking fails just going to the 
next object is invalid as far as I can see.

That's why I was so puzzled why you tried to apply the walker to the TTM 
shrinker.

Or why exactly should shrinking fail?

> If we bump LRU we could end up with infinite loops.
> So IMO we need to be able to loop. I don't really care wether we do
> this as an explicit loop or whether we use the LRU walker, but I think
> from a maintainability point-of-view it is better to keep LRU walking
> in a single place.
>
> If we return an unlocked object, we'd need to refcount and drop the lru
> lock, but maybe that's not a bad thing.
>
> But what's the main drawback of exporting the existing helper.

Well that we re-creates exactly the mid-layer mess I worked so hard to 
remove from TTM.

>>>> 2) The shrinkers suggest to shrink a number of pages, not a
>>>> single bo,
>>>> again drm_gem_lru_scan works like this. i915 works like this. I
>>>> think
>>>> we should align with those.
>>> Yeah that's how shrinkers work, so if we demidlayer then it realls
>>> needs
>>> to be a loop in the driver, not a "here's the next bo to nuke" I
>>> think.
>> Hui? Well that's not how I understand shrinkers.
>>
>> The shrinker gives you the maximum number of objects to scan and not
>> how
>> many pages to free. In return you give the actual number of objects
>> to
>> scanned and pages freed.
>>
>> As far as I know the number of objects are in the sense of SLUBs or
>> rather different LRU lists.
>>
>> So for BO shrinking we should probably only free or rather unpin a
>> single BO per callback otherwise we mess up the fairness between
>> shrinkers in the MM layer.
> Hm. AFAICT all drm shrinkers use pages as objects, and the docs of
> nr_to_scan says it's the number of objects to scan and try to reclaim.
> I think this strategy has had a fair amount of testing with the i915
> driver.
> In any case, I don't think TTM should enforce a different way of
> shrinking by the means of a severely restricted helper?

Well, as far as I can see that is exactly what TTM should do.

I mean the main advantage to make a common component is to enforce 
correct behavior.

Regards,
Christian.

>
> /Thomas
>

--------------Y9vF1Ebcm1tnohDLfm74tMFr
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 20.08.24 um 12:37 schrieb Thomas Hellström:<br>
    <blockquote type="cite" cite="mid:5a2f24bce352b65a1fb6e933c406b3ab1efa33e3.camel@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">Hi,

On Mon, 2024-08-19 at 17:26 +0200, Christian König wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Am 19.08.24 um 16:14 schrieb Daniel Vetter:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On Mon, Aug 19, 2024 at 01:38:56PM +0200, Thomas Hellström wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Hi, Christian,

On Mon, 2024-08-19 at 13:03 +0200, Christian König wrote:
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">Am 06.08.24 um 10:29 schrieb Thomas Hellström:
</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">Hi, Christian.

On Thu, 2024-07-11 at 14:01 +0200, Christian König wrote:
</pre>
                <blockquote type="cite">
                  <pre class="moz-quote-pre" wrap="">Am 10.07.24 um 20:19 schrieb Matthew Brost:
</pre>
                  <blockquote type="cite">
                    <pre class="moz-quote-pre" wrap="">On Wed, Jul 10, 2024 at 02:42:58PM +0200, Christian König
wrote:
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">That is something drivers really shouldn't mess with.

</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">Thomas uses this in Xe to implement a shrinker [1]. Seems
to
need
to
remain available for drivers.
</pre>
                  </blockquote>
                  <pre class="moz-quote-pre" wrap="">No, that is exactly what I try to prevent with that.

This is an internally thing of TTM and drivers should never
use
it
directly.
</pre>
                </blockquote>
                <pre class="moz-quote-pre" wrap="">That driver-facing LRU walker is a direct response/solution
to this
comment that you made in the first shrinker series:

<a class="moz-txt-link-freetext" href="https://lore.kernel.org/linux-mm/b7491378-defd-4f1c-31e2-29e4c77e2d67@amd.com/T/#ma918844aa8a6efe8768fdcda0c6590d5c93850c9">https://lore.kernel.org/linux-mm/b7491378-defd-4f1c-31e2-29e4c77e2d67@amd.com/T/#ma918844aa8a6efe8768fdcda0c6590d5c93850c9</a>
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">Ah, yeah that was about how we are should be avoiding middle
layer
design.

But a function which returns the next candidate for eviction
and a
function which calls a callback for eviction is exactly the
opposite.

</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">That is also mentioned in the cover letter of the recent
shrinker
series, and this walker has been around in that shrinker
series for
more than half a year now so if you think it's not the
correct
driver
facing API IMHO that should be addressed by a review comment
in
that
series rather than in posting a conflicting patch?
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">I actually outlined that in the review comments for the patch
series.
E.g. a walker function with a callback is basically a middle
layer.

What outlined in the link above is that a function which
returns the
next eviction candidate is a better approach than a callback.

</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">So assuming that we still want the driver to register the
shrinker,
IMO that helper abstracts away all the nasty locking and
pitfalls
for a
driver-registered shrinker, and is similar in structure to
for
example
the pagewalk helper in mm/pagewalk.c.

An alternative that could be tried as a driver-facing API is
to
provide
a for_each_bo_in_lru_lock() macro where the driver open-codes
&quot;process_bo()&quot; inside the for loop but I tried this and found
it
quite
fragile since the driver might exit the loop without
performing the
necessary cleanup.
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">The point is that the shrinker should *never* need to have
context.
E.g.
a walker which allows going over multiple BOs for eviction is
exactly
the wrong approach for that.

The shrinker should evict always only exactly one BO and the
next
invocation of a shrinker should not depend on the result of the
previous
one.

Or am I missing something vital here?
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">A couple of things,

1) I'd like to think of the middle-layer vs helper like the
helper has
its own ops, and can be used optionally from the driver. IIRC,
the
atomic modesetting / pageflip ops are implemented in exactly this
way.

Sometimes a certain loop operation can't be easily or at least
robustly
implemented using a for_each_.. approach. Like for example
mm/pagewalk.c. In this shrinking case I think it's probably
possible
using the scoped_guard() in cleanup.h. This way we could get rid
of
this middle layer discussion by turning the interface inside-out:

for_each_bo_on_lru_locked(xxx)
	driver_shrink();

But I do think the currently suggested approach is less fragile
and
prone to driver error.

FWIW in addition to the above examples, also drm_gem_lru_scan
works
like this.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">a iteration state structure (like drm_connector_iter) plus then a
macro
for the common case that uses cleanup.h should get the job done.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Yeah, completely agree. It basically boils down to which one needs to
pack a state bag.

In a mid-layer design it's the driver or the caller of functions,
e.g. 
the much hated init callback in the DRM layer was a perfect example
of that.

In a non mid-layer approach it's the framework or the called
function, 
examples are how the fence iterators in the dma_resv or the 
drm_connector, plane etc.. work.

One big difference between the two approach is who and where things
like 
preparation and cleanup are done, e.g. who takes locks for example.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
So what in your opinion is an acceptable solution here?&nbsp;
The &quot;get next object to shrink&quot; approach won't work, since it's subject
to the old TTM swap problem now removed:
If shrinking fails we will get the same object upon subsequent calls.</pre>
    </blockquote>
    <br>
    But and that is expected behavior. If shrinking fails just going to
    the next object is invalid as far as I can see.<br>
    <br>
    That's why I was so puzzled why you tried to apply the walker to the
    TTM shrinker. <br>
    <br>
    Or why exactly should shrinking fail?<br>
    <br>
    <blockquote type="cite" cite="mid:5a2f24bce352b65a1fb6e933c406b3ab1efa33e3.camel@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">If we bump LRU we could end up with infinite loops.
So IMO we need to be able to loop. I don't really care wether we do
this as an explicit loop or whether we use the LRU walker, but I think
from a maintainability point-of-view it is better to keep LRU walking
in a single place.

If we return an unlocked object, we'd need to refcount and drop the lru
lock, but maybe that's not a bad thing.

But what's the main drawback of exporting the existing helper.</pre>
    </blockquote>
    <br>
    Well that we re-creates exactly the mid-layer mess I worked so hard
    to remove from TTM.<br>
    <br>
    <span style="white-space: pre-wrap">
</span><span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:5a2f24bce352b65a1fb6e933c406b3ab1efa33e3.camel@linux.intel.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">2) The shrinkers suggest to shrink a number of pages, not a
single bo,
again drm_gem_lru_scan works like this. i915 works like this. I
think
we should align with those.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">Yeah that's how shrinkers work, so if we demidlayer then it realls
needs
to be a loop in the driver, not a &quot;here's the next bo to nuke&quot; I
think.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Hui? Well that's not how I understand shrinkers.

The shrinker gives you the maximum number of objects to scan and not
how 
many pages to free. In return you give the actual number of objects
to 
scanned and pages freed.

As far as I know the number of objects are in the sense of SLUBs or 
rather different LRU lists.

So for BO shrinking we should probably only free or rather unpin a 
single BO per callback otherwise we mess up the fairness between 
shrinkers in the MM layer.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Hm. AFAICT all drm shrinkers use pages as objects, and the docs of
nr_to_scan says it's the number of objects to scan and try to reclaim.
I think this strategy has had a fair amount of testing with the i915
driver.
In any case, I don't think TTM should enforce a different way of
shrinking by the means of a severely restricted helper?</pre>
    </blockquote>
    <br>
    Well, as far as I can see that is exactly what TTM should do.<br>
    <br>
    I mean the main advantage to make a common component is to enforce
    correct behavior.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:5a2f24bce352b65a1fb6e933c406b3ab1efa33e3.camel@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">

/Thomas

</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------Y9vF1Ebcm1tnohDLfm74tMFr--
