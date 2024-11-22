Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9669D5D87
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 11:57:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7675110EB4E;
	Fri, 22 Nov 2024 10:57:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="LhsHeRQZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062.outbound.protection.outlook.com [40.107.94.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EBF410EB59;
 Fri, 22 Nov 2024 10:57:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=amXNH5ZsuzkNA9c3xQtxMZj2jN6PZrN+w5KhR24+nCGPRZ56dbc8/ta6gTtYz1eFWJJXLEWXNUb4uUX4R0jIdUBtgIBjPpFD1RehKb/JaAVsLW6ArhTDLsH1SyJetsCjHJOexeFjleEC454amU3yVkaewHc3v0OlLHiwhtLNtKVLSJUM/T5BJVFlXu23ZhwpIDF9HTMsv5r30ZOC/96CO/As/6Aw2wPwlGHk1/8rTo3cIhYxLGK9zbCCeOuvT35W+bivQU72qN9ieyBb0zYLjq3zDc8ai3TuOe9QJibk0Y9ZUi7EK0oGxnPoGLwgRkY4d4Xpz3Kas8zGOpQIeuR+Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P4jqYX/75whQjcxlORTLVt4QzQKidscAZqehGTrVUS8=;
 b=OYdFGdx8B11w1jb3ftLPK1emTzkCnEM4KeLoLpUtMvnCuw+VeuZi1M0UtcgYoMfJZaVdBk3yBR+rLQs9Fc7MKK6qt3TZYsulzwOeUG2MXew9K9GTpKYRo+TV8EZT5P2gLhw8fLU+bNNRgRu79TJy9ynH/5h2KtiLBRdRw6EMknv16ZwcUq0gdeefJbMXsTDSG8YIufs+ELyiqJre8nEv/3pWwjr2f9XjaT4WmCB5u8zqB8NW61MHBRIE82aztEeq3DN35CxdoeeHvVIHfmbyxFeP/4RCHC0q0smZel+ZxFBP487wppMsi8XSUy7yokLdRcGWSMtpDCeSSKWfSxTInA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P4jqYX/75whQjcxlORTLVt4QzQKidscAZqehGTrVUS8=;
 b=LhsHeRQZIr2qfqdt3Ifyx2VwchXxY6SLvZ/NUkjmUsY6zSl8Z/EHijEQDXY922Qc4KfOx0k+qIfUmvwvvU23am/pNQGynhq6K590W+gvzJOr5HMzmek0hFOCI4bYOXwEVQ/NN35XN5T+aKepHITWatSPfwBkOJ72XtpWBJCGWIA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ2PR12MB7991.namprd12.prod.outlook.com (2603:10b6:a03:4d1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Fri, 22 Nov
 2024 10:56:59 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8158.019; Fri, 22 Nov 2024
 10:56:59 +0000
Content-Type: multipart/alternative;
 boundary="------------10ZsU00wb2gvSr7IAHmzYNAg"
Message-ID: <9b30f6b5-acff-4947-b5a9-f6808bc77685@amd.com>
Date: Fri, 22 Nov 2024 11:56:52 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/29] dma-fence: Add dma_fence_preempt base class
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kenneth.w.graunke@intel.com, lionel.g.landwerlin@intel.com,
 jose.souza@intel.com, simona.vetter@ffwll.ch,
 thomas.hellstrom@linux.intel.com, boris.brezillon@collabora.com,
 airlied@gmail.com, mihail.atanassov@arm.com, steven.price@arm.com,
 shashank.sharma@amd.com
References: <20241118233757.2374041-1-matthew.brost@intel.com>
 <20241118233757.2374041-2-matthew.brost@intel.com>
 <431e53fd-ab98-427c-a6ed-6c2907438952@amd.com>
 <Zz4eNeYuHulccROH@lstrano-desk.jf.intel.com>
 <12cc3711-c097-46b8-9602-191d5c676e17@amd.com>
 <Zz9+87ZUpmD5VGDL@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <Zz9+87ZUpmD5VGDL@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: FR0P281CA0251.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ2PR12MB7991:EE_
X-MS-Office365-Filtering-Correlation-Id: 0038b105-e566-495e-12c2-08dd0ae46336
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a0RNS1pYL080VGdMVkVYVnlmaEwvVUUxMWphUktYbWhLdHFKVzBUejdaa3Nt?=
 =?utf-8?B?WjQ4Z0lNdHRpZjFQNFc2emNIQnpVOUZHeWZKOGtrNnQxVUFJYnlpeVZTYzA1?=
 =?utf-8?B?Vk51SFU2eUlnZU93YnpMeWlROC9jZ3NCbzlLY2U0c09hQ0NucXZLL0Y2ME9X?=
 =?utf-8?B?ZjZRZThvVEV1dWtLL241WWxRaGVGeVl1MzFkY0F0YXBYQTg4S0dRMmFOV295?=
 =?utf-8?B?cTNNRVJtWHM3WS9STk1LNTNSbytodWliRnJZNGs4ZXNDeDhzazJlT0h4MU5B?=
 =?utf-8?B?dDU1Q2d0eGJoU1BpTkhoUmlCYXR1eVhWSk5TUmtaaWhieHN4ekQvQlNlcEQz?=
 =?utf-8?B?VVBNd3ZnUFBYeEFUSnExelp1ZTJ2aWQrTlZ2UEdZaVJ4bVhGOTNXZ3ZyOUNH?=
 =?utf-8?B?WWI2aFRSeU1FNnlkaVI2ZXAweUk0VVFzTG5NR0orMU5VZVY1akpsR0d1dEZG?=
 =?utf-8?B?RGp4cFFYS3FWNmM3ZXVRaGZUTE80UVJNalBCRVEvMFpSMmw4MitpTVNPZ1J6?=
 =?utf-8?B?NzZWZ0w1SnZBOStlSFUyeVcxR254aTgrYmpiWldKQ1NsVHVHTXlMWXhRMG1Y?=
 =?utf-8?B?QmhuaEdGVU8vZ1hXUzRiQ1RmNHVhdWFldUh3Q1RjU2l3RHZxcm56Y0QvNGZh?=
 =?utf-8?B?ZXFRaW40dzQybWhqOVJwMWYwVXVSSkY4ODhIZTRvNlVYVUlXaVpxaFZKMFZU?=
 =?utf-8?B?djZaVEs5aGZxaG9YWE1ObjVVNktFUjJlUEo0YXJ2dWQ1bEk0QWxpUDlVQnZF?=
 =?utf-8?B?dDgwdkxiYkFDN0EvM2E4WXlpeWhFNXdkRmw5b3RFUTNuSGhRSDVicktlamIz?=
 =?utf-8?B?QmdPaEpiRGUweWFJRkVMQVVNUkpKazJERVJjNyt6NUxnazRWM25YRDc2MG1s?=
 =?utf-8?B?T2puYUUzTWtCWVBxRW94N01hYzJxQmZVMWNBYzVmQlJhaENTRjVHRGpjUGMv?=
 =?utf-8?B?VmJjTDdJaFlvWTVBMEtQL01rVVV0R2hDRE9ZQXlnYUZZQXR6RXA0eGdTQ1R1?=
 =?utf-8?B?bUxsbjUwK2lrZnNYRmpMV2NXdnVCTXo5TEpPeHRVc0RxYnhmRkRmK3krRmJx?=
 =?utf-8?B?OGc3ZHdKQXhDeG5RdER5NVg2b3QveU9OUG5SVkJGN0RYU0o1dURETUQvYjJp?=
 =?utf-8?B?QWozOEl0VEYyV0FheEMrMkUwcEsyL3BDZTZJTDBjSVVZcnFSUnZENHd4VG1y?=
 =?utf-8?B?czhsT3V4NzY2VHUzS0RSeXFHU3Z6TllORVBHaW9lNXBpUTVSOVB2bVlrYnJw?=
 =?utf-8?B?elZ6QjlFTjh1c0VqVlJSRmhmM2M0d3kzMkZQdDUzWk44WmFBM2o1ekEvTHFh?=
 =?utf-8?B?eU9wM0JVZGRUenFCRER6YkJad0QvUUxlanI1OEdncXlCWXU2Zk1SeVBsU0U2?=
 =?utf-8?B?RCtWSXlHOGhVMFBFMCtPOUFvUGI1dmVTR3ZkNXRMK2g3M0FkWGVFZzhJQUh4?=
 =?utf-8?B?bjloYmV2V3F2VmFPd1c1bzFRUE9hYjhDdDBNcGQvWWhBV1ltL3BaMVRrVjlF?=
 =?utf-8?B?MkNncXNhdXgyYXp2QU8xTWZMelMrT1lybnFWdjNDN293NVRQQXRKc3M4TkJj?=
 =?utf-8?B?VStEZlVyVXR6RWRjakZ6MVFncy93RHhVMVRzZ3Z0Ym1RdisxVjJDVW5aREVU?=
 =?utf-8?B?bjV0WG95MGIweFVzc1MwcnhtOENzY3BwRFdLUUJJZFcxd0ZvL2lGT0RBZVpj?=
 =?utf-8?B?V2pnMlh3end4RnZrZXNQMjF0NHRkL0NjNGk2VVN5MzI5czRXTEswZU1ubW8y?=
 =?utf-8?Q?yLnvBu6nE/XQFBds3l1rK+Qq9qau53oPdLV/fvH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aU5DNnkyVEx1T21tUUtsQ0pFYzVCS2Y4SkRrbjZjSkoydnZJTTFMUDkrejJ2?=
 =?utf-8?B?aCt5TE5SWWd3TEFHLzUxZTVITHUxWmxHV29UdjN3RnFzZ2M5WnEzMW56WENS?=
 =?utf-8?B?OVlsZGVLUERWSmlwZHlRN0xJZklZcmJpSS9CTDJUbDg4M1JVdGZwdkFHMjJB?=
 =?utf-8?B?TFpkbzJRWkMwZDdkQmxYNnlVdDllZ0tONFZnV1RFNmRQcER2ejhzdkJnd0xQ?=
 =?utf-8?B?L1NtZ0tLaUREc0tyRUVuZExFWVMxbDBCaWNPYkRsZ01SM2xLbFNxV2RuN2Nt?=
 =?utf-8?B?YnJVcEhLMXJlZFN5WnEvVEdBeGU0TDM0ak5QZTNqeU40cHAzOEg4Ny9YejBa?=
 =?utf-8?B?V1gybythMzhGR0diRTNjVVJQS3cweDRUWEl0bkUzM2N0dm5SMkZRSWEwU2o5?=
 =?utf-8?B?TXRxYVcyNkM2NVRFM3loZlF2eUJ2UEpnb0tEQndhNFdNUk5Wd1RtdWoyMjJF?=
 =?utf-8?B?VWhHSVExNy9YZWUzTmE3dFU2OUxueENFelh2eHpaSVNtYzZLckpNa0xCeUow?=
 =?utf-8?B?eDd2UUkvRC9KS0V0ck9rbVZCSEpCb09yREc2SVZtcWs3L0hwOXN1NHhvR1Ew?=
 =?utf-8?B?RThuUzdzeDFYbUpFdmdKMFhpOThRUmhackVvR0NXblVGTWgwdW1VYXVVV3pE?=
 =?utf-8?B?MUNKV2pqZVE4SnFnNnVXUVFhVjc4bjhOOTE4c0Z4YnViWmtVd2xWQmxwbmt0?=
 =?utf-8?B?RXVKMlZSV0M4T1I2aklmM29wOUYrcTQwQWI1d1ZXYlM5L2xTNi8yNjlJTEk0?=
 =?utf-8?B?dmhRUXpXb3VhZDhXYlVIbncxL0o2ellDTWI4OFN6TkRMYmV1bytUWVNoOUsx?=
 =?utf-8?B?cENBc2ZJL1ZUQ1NGSXFobEE5Ukloc1RPMHJQd1FPc0pHU0ZGUTg0K2xkWkEy?=
 =?utf-8?B?c1Q0c1IxQXBScjRCTHVtbHFvTjdPaWZ3M2IyVVBsQkJqOFNXQWdiUERNMnF5?=
 =?utf-8?B?Y0ZnakRoY2ZRckVGUTBJdmJac0tnWUtaM1VNYnlJa2VNUGNkTFdqSXJMY3g5?=
 =?utf-8?B?S3IxcmQwL2tVTE1nbk51WEtZWVhib3NObzEydTF3RStDREF0Uktldk12ckxn?=
 =?utf-8?B?QUw0eG82SnNDSzJMdGQvZ2dKdExmUWtFalhLbnBpaG52TWtKVGRiZ05Cek9B?=
 =?utf-8?B?aDU3YlJvdEViY1BBQ2hQU1ZnNG5FbTQ0djJjWk4vaG9lcWxodzRGVDNmUFcx?=
 =?utf-8?B?WjJRSDZkUHVueTd4MG41OXhVNDgyYmJLRFdKb24xdWxoOExlV2IzN3FFZXlh?=
 =?utf-8?B?LzUzSVZ3dHM3R3FTSk0vQkYyakdtejdRbDE3WmxCT25aU3QxajhFdHc5N29N?=
 =?utf-8?B?TG9qVlNIMEl1U01mNlFvWGx5K09BYXpuK2pKK2xQZm5KMExiazNuT09BeDBT?=
 =?utf-8?B?UUY0Tkt3TjVMZ2pheUdYRk91Qm9kS1lWMGVPdHZEOHZXQzUrLzhMNU4zdWl2?=
 =?utf-8?B?SUN5VzRHV0E2ajVxT2dlbkV5bWlrT3VaM3RnMnhNdGFqZWF3T0RKY3VnbG12?=
 =?utf-8?B?KzkxbzMwOWVFV2lDUzBNSGhZTGlTQnhqeWRueUhaeTJmZjlybEdwcGIyL2oz?=
 =?utf-8?B?Ym8xTGQwNmpZcy9XbFlNRVNqbHlickJ0RFlMT3puSFcvVWdiWEtFaG5weDly?=
 =?utf-8?B?UHFjMjg5d0ZtM1pvQ21hQ3pqUW1JZnViWkRleDVtOG9RdUxUcnNna0tXSkxr?=
 =?utf-8?B?RTBoVXJlQUxVeGFmUm5MMnpyUGlTZDE0aTllR2hCUy92amdlTGNDbGt0VUxC?=
 =?utf-8?B?L1h1ZjF0SFZwWjladEpmUWhtZlNnVkZ4b2RmVUhIK1c2OEdldmdaYUtNV3Zl?=
 =?utf-8?B?Z2RTaGYxaTlOd1M2SzA2dGNOa2dET1NjczdHRkZRVzFEemU5SHl6bzJmYW1S?=
 =?utf-8?B?R3lTdEQ0SWxxUVVOSmZLejBhOHlCelI1Myt1U3BXUmpVSnJEOTkzdjgyVG1t?=
 =?utf-8?B?WkhibkkrT2pkRW9HeTJ1WXZrbmxCYnhKQzRTbDRFVEVGUkh2UXJid2dCZFBJ?=
 =?utf-8?B?NVpCeXRHaTM3RTZGclJNTVlRQ2JoKzFmNjVYTkxpaGREY2pLK0tQbXZuWDdC?=
 =?utf-8?B?V3JNM2VMNUNvNVRVYVEzaUprd0JuUno1MnZNbktwdE5OWXoyWG5OUzA3K3M3?=
 =?utf-8?Q?q4QphKkUEGD/5ws90mIDMC6mr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0038b105-e566-495e-12c2-08dd0ae46336
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2024 10:56:59.1146 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F1l7AlYTn2WrT04/W0GTsQQw0dqBQsk0QssOzXsxwez/etNF7SEBP40yYoFEIb/b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7991
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

--------------10ZsU00wb2gvSr7IAHmzYNAg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 21.11.24 um 19:41 schrieb Matthew Brost:
> [SNIP]
>>>>> +	ops->preempt_finished(pfence);
>>>> Why is that callback useful?
>>>>
>>> In Xe, this is where we kick the resume worker and drop a ref to the
>>> preemption object, which in Xe is an individual queue, and in AMD it is
>>> a VM, right?
>> Correct. The whole VM is preempted since we don't know which queue is using
>> which BO.
>>
> Right. In Xe we don't know which queue is using a BO either - we trigger
> all queues preempt fences attached to the VM effectively preempting the
> entire VM. Per VM preempt fence or per queue preempt fence is a driver
> choice (I can see arguments for both cases) is the point here and any
> base class shouldn't dictate what a driver wants to do.

Oh, I think we need to unify that for drivers or at least find an 
interface which works for both cases.

And yeah, I agree there are really good arguments for both directions.

Essentially you want separate preemption fences for each queue, but only 
one restore worker.

>>> wrt preemption object, I've reasoned this should work for
>>> an either per queue or VM driver design of preempt fences.
>>>
>>> This part likely could be moved into the preempt_wait callback though
>>> but would get a little goofy in the error case if preempt_wait is not
>>> called as the driver side would still need to cleanup a ref. Maybe I
>>> don't even need a ref though - have to think that through - but for
>>> general safety we typically like to take refs whenever a fence
>>> references a different object.
>> The tricky part is that at least for us we need to do this *before* the
>> fence is signaled.
> Hmm, I'm a little confused by this. Do you think the code as is missing
> somehthing or opposed to keeping the preempt_finished vfunc?

I think we first need a complete picture how all that is supposed to work.

When we say we resume only on demand then this callback would make sense 
I think, but at least the AMD solution doesn't do that at the moment.

>> This way we can do something like:
>>
>> retry:
>>      mutex_lock(&lock);
>>      if (dma_fence_is_signaled(preemept_fence)) {
>>          mutex_unlock(&lock);
>>          flush_work(resume_work);
>>          gotot retry;
>>      }
>>
> This snippet is from your convert user fence to dma fence IOCTL?

Yes.

> I think
> this makes sense given your design of the conver user to dma fence IOCTL
> not actually doing a resume - I landed making that IOCTL basically
> another version of the resume worker for simplicity but that may change
> if we find locking the entire VM is too costly.

Well we could also resume on demand (thinking more about it that's most 
likely the better approach) but I would implement it something like this 
then:

retry:
     mutex_lock(&lock);
     if (dma_fence_is_signaled(preemept_fence)) {
         mutex_unlock(&lock);
	schedule_work(resume_work);
         flush_work(resume_work);
         gotot retry;
     }


This way we don't run into issues when multiple participants try to 
resume at the same time. E.g. multiple threads where each one tries to 
submit work to different queues at the same time.

[SNIP]
>>>>> +	fence = pfence->ops->preempt_delay(pfence);
>>>> Mhm, why is that useful?
>>>>
>>> This for attaching the preempt object's last exported fence which needs
>>> to be signaled before the preemption is issued. So for purely long
>>> running VM's, this function could be NULL. For VM's with user queues +
>>> dma fences, the driver returns the last fence from the convert user
>>> fence to dma-fence IOCTL.
>>>
>>> I realized my kernel doc doesn't explain this as well as it should, I
>>> have already made this more verbose locally and hopefully it clearly
>>> explains all of this.
>> That part was actually obvious. But I would expected that to be push
>> interface instead of a pull interface.
>>
>> E.g. the preemption fence would also provide something like a manager object
>> which has a mutex, the last exported user fence and the necessary
>> functionality to update this user fence.
>>
> Hmm, I rather like the pull interface. In Xe this is dma-fence chain
> attached to the VM. It safe pull given our covert IOCTL takes the VM's
> dma-resv locks / notifier locks before publishing the user fence.

I don't think that will work like this.

Publishing the user fence must be serialized with signaling the 
preemption fence. And that serialization can't be done by the dma-resv 
lock nor the notifier lock because we can't let a dma_fence signaling 
depend on them.

That this is a separate lock or similar mechanism is a must have.

> In your design couldn't you use spin lock in the last step of publishing
> a user fence which checks for sw signaling on the preempt fence, if it
> enabled restart the IOCTL waiting the resume worker? Then in this vfunc
> pull the fence under the spin lock?

Yeah that could maybe work, but there is also a different challenge to 
keep in mind. See below.

> Not opposed to a push interface though if you really think this the way
> to go. Quite certain I could make that work for Xe too.

A push interface is just easier to validate. Keep in mind that you can 
only update the user fence when you can guarantee that the preemption 
fence is not signaled nor in the process of signaling.

So when you create a user fence the approach becomes:

1. kmalloc the fence structure,
2. Initialize the fence.
3. Push it into the premption manage of your queue, this makes sure that 
the queue is runable.
4. Publish the new fence in drm_sync, dma_resv etc...

> This definitely works as is - I've tested this. If dma-fence's lock was
> embedded within the dma-fence, then ofc lockdep would complain without
> nesting. It isn't though - the spin lock is passed in as argument so
> lockdep can identify the locks for 'preempt fence lock' and 'last
> exported fence' as independent locks.

Ah, good point.

But exactly that passing in of the lock is what we try to get away from 
to allow dma_fences to surpass the module they issued.

>>> Lockdep does not explode in Xe but maybe can buy this is a little
>>> unsafe. We could always move preempt_delay to the worker, attach a CB,
>>> and rekick the worker upon the last fence signaling if you think that is
>>> safer. Of course we could always just directly wait on the returned last
>>> fence in the worker too.
>> Yeah I that is basically what we do at the moment since you also need to
>> make sure that no new user fence is installed while you wait for the latest
>> to signal.
>>
> After I typed this realized waiting on 'last fence' in the worker is a no
> go given we want to pipeline preemptions in Xe (e.g. issue all queues
> preemption commands to firmware in parallel as these are async
> operations which may be fast in cases and slow in others). I think
> having preempt vfunc done directly in a dma-fence CB is a must.

At least with out current design that won't work because you need to 
somehow prevent installing new user fences while the preemption fence is 
signaling.

Currently we do that by holding a mutex, but you can't hold a mutex and 
return from a worker and then drop the mutex again in a different worker 
(ok in theory you can, but that is so strongly disregarded that upstream 
would probably reject the code).

Regards,
Christian.

>
> Matt
>
--------------10ZsU00wb2gvSr7IAHmzYNAg
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 21.11.24 um 19:41 schrieb Matthew Brost:<br>
    <blockquote type="cite" cite="mid:Zz9+87ZUpmD5VGDL@lstrano-desk.jf.intel.com">[SNIP]<span style="white-space: pre-wrap">
</span>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">+	ops-&gt;preempt_finished(pfence);
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">Why is that callback useful?

</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">In Xe, this is where we kick the resume worker and drop a ref to the
preemption object, which in Xe is an individual queue, and in AMD it is
a VM, right?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Correct. The whole VM is preempted since we don't know which queue is using
which BO.

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Right. In Xe we don't know which queue is using a BO either - we trigger
all queues preempt fences attached to the VM effectively preempting the
entire VM. Per VM preempt fence or per queue preempt fence is a driver
choice (I can see arguments for both cases) is the point here and any
base class shouldn't dictate what a driver wants to do.</pre>
    </blockquote>
    <br>
    Oh, I think we need to unify that for drivers or at least find an
    interface which works for both cases.<br>
    <br>
    And yeah, I agree there are really good arguments for both
    directions.<br>
    <br>
    Essentially you want separate preemption fences for each queue, but
    only one restore worker.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:Zz9+87ZUpmD5VGDL@lstrano-desk.jf.intel.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">wrt preemption object, I've reasoned this should work for
an either per queue or VM driver design of preempt fences.

This part likely could be moved into the preempt_wait callback though
but would get a little goofy in the error case if preempt_wait is not
called as the driver side would still need to cleanup a ref. Maybe I
don't even need a ref though - have to think that through - but for
general safety we typically like to take refs whenever a fence
references a different object.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
The tricky part is that at least for us we need to do this *before* the
fence is signaled.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Hmm, I'm a little confused by this. Do you think the code as is missing
somehthing or opposed to keeping the preempt_finished vfunc?</pre>
    </blockquote>
    <br>
    I think we first need a complete picture how all that is supposed to
    work.<br>
    <br>
    When we say we resume only on demand then this callback would make
    sense I think, but at least the AMD solution doesn't do that at the
    moment.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:Zz9+87ZUpmD5VGDL@lstrano-desk.jf.intel.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
This way we can do something like:

retry:
&nbsp;&nbsp;&nbsp; mutex_lock(&amp;lock);
&nbsp;&nbsp;&nbsp; if (dma_fence_is_signaled(preemept_fence)) {
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; mutex_unlock(&amp;lock);
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; flush_work(resume_work);
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; gotot retry;
&nbsp;&nbsp;&nbsp; }

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
This snippet is from your convert user fence to dma fence IOCTL?</pre>
    </blockquote>
    <br>
    Yes.<br>
    <br>
    <blockquote type="cite" cite="mid:Zz9+87ZUpmD5VGDL@lstrano-desk.jf.intel.com">
      <pre class="moz-quote-pre" wrap="">I think
this makes sense given your design of the conver user to dma fence IOCTL
not actually doing a resume - I landed making that IOCTL basically
another version of the resume worker for simplicity but that may change
if we find locking the entire VM is too costly.</pre>
    </blockquote>
    <br>
    Well we could also resume on demand (thinking more about it that's
    most likely the better approach) but I would implement it something
    like this then:<br>
    <br>
    <pre class="moz-quote-pre" wrap="">retry:
&nbsp;&nbsp;&nbsp; mutex_lock(&amp;lock);
&nbsp;&nbsp;&nbsp; if (dma_fence_is_signaled(preemept_fence)) {
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; mutex_unlock(&amp;lock);
	schedule_work(resume_work);
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; flush_work(resume_work);
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; gotot retry;
&nbsp;&nbsp;&nbsp; }
</pre>
    <br>
    This way we don't run into issues when multiple participants try to
    resume at the same time. E.g. multiple threads where each one tries
    to submit work to different queues at the same time.<br>
    <br>
    [SNIP]<br>
    <blockquote type="cite" cite="mid:Zz9+87ZUpmD5VGDL@lstrano-desk.jf.intel.com"><span style="white-space: pre-wrap">
</span>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">+	fence = pfence-&gt;ops-&gt;preempt_delay(pfence);
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">Mhm, why is that useful?

</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">This for attaching the preempt object's last exported fence which needs
to be signaled before the preemption is issued. So for purely long
running VM's, this function could be NULL. For VM's with user queues +
dma fences, the driver returns the last fence from the convert user
fence to dma-fence IOCTL.

I realized my kernel doc doesn't explain this as well as it should, I
have already made this more verbose locally and hopefully it clearly
explains all of this.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
That part was actually obvious. But I would expected that to be push
interface instead of a pull interface.

E.g. the preemption fence would also provide something like a manager object
which has a mutex, the last exported user fence and the necessary
functionality to update this user fence.

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Hmm, I rather like the pull interface. In Xe this is dma-fence chain
attached to the VM. It safe pull given our covert IOCTL takes the VM's
dma-resv locks / notifier locks before publishing the user fence.</pre>
    </blockquote>
    <br>
    I don't think that will work like this.<br>
    <br>
    Publishing the user fence must be serialized with signaling the
    preemption fence. And that serialization can't be done by the
    dma-resv lock nor the notifier lock because we can't let a dma_fence
    signaling depend on them.<br>
    <br>
    That this is a separate lock or similar mechanism is a must have.<br>
    <br>
    <blockquote type="cite" cite="mid:Zz9+87ZUpmD5VGDL@lstrano-desk.jf.intel.com">
      <pre class="moz-quote-pre" wrap="">In your design couldn't you use spin lock in the last step of publishing
a user fence which checks for sw signaling on the preempt fence, if it
enabled restart the IOCTL waiting the resume worker? Then in this vfunc
pull the fence under the spin lock?</pre>
    </blockquote>
    <br>
    Yeah that could maybe work, but there is also a different challenge
    to keep in mind. See below.<br>
    <br>
    <blockquote type="cite" cite="mid:Zz9+87ZUpmD5VGDL@lstrano-desk.jf.intel.com">
      <pre class="moz-quote-pre" wrap="">Not opposed to a push interface though if you really think this the way
to go. Quite certain I could make that work for Xe too.
</pre>
    </blockquote>
    <br>
    A push interface is just easier to validate. Keep in mind that you
    can only update the user fence when you can guarantee that the
    preemption fence is not signaled nor in the process of signaling.<br>
    <br>
    So when you create a user fence the approach becomes:<br>
    <br>
    1. kmalloc the fence structure,<br>
    2. Initialize the fence.<br>
    3. Push it into the premption manage of your queue, this makes sure
    that the queue is runable.<br>
    4. Publish the new fence in drm_sync, dma_resv etc...<br>
    <br>
    <blockquote type="cite" cite="mid:Zz9+87ZUpmD5VGDL@lstrano-desk.jf.intel.com">
      <pre class="moz-quote-pre" wrap="">This definitely works as is - I've tested this. If dma-fence's lock was
embedded within the dma-fence, then ofc lockdep would complain without
nesting. It isn't though - the spin lock is passed in as argument so
lockdep can identify the locks for 'preempt fence lock' and 'last
exported fence' as independent locks.</pre>
    </blockquote>
    <br>
    Ah, good point.<br>
    <br>
    But exactly that passing in of the lock is what we try to get away
    from to allow dma_fences to surpass the module they issued.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:Zz9+87ZUpmD5VGDL@lstrano-desk.jf.intel.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Lockdep does not explode in Xe but maybe can buy this is a little
unsafe. We could always move preempt_delay to the worker, attach a CB,
and rekick the worker upon the last fence signaling if you think that is
safer. Of course we could always just directly wait on the returned last
fence in the worker too.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Yeah I that is basically what we do at the moment since you also need to
make sure that no new user fence is installed while you wait for the latest
to signal.

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
After I typed this realized waiting on 'last fence' in the worker is a no
go given we want to pipeline preemptions in Xe (e.g. issue all queues
preemption commands to firmware in parallel as these are async
operations which may be fast in cases and slow in others). I think
having preempt vfunc done directly in a dma-fence CB is a must.</pre>
    </blockquote>
    <br>
    At least with out current design that won't work because you need to
    somehow prevent installing new user fences while the preemption
    fence is signaling.<br>
    <br>
    Currently we do that by holding a mutex, but you can't hold a mutex
    and return from a worker and then drop the mutex again in a
    different worker (ok in theory you can, but that is so strongly
    disregarded that upstream would probably reject the code).<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:Zz9+87ZUpmD5VGDL@lstrano-desk.jf.intel.com">
      <pre class="moz-quote-pre" wrap="">

Matt

</pre>
    </blockquote>
  </body>
</html>

--------------10ZsU00wb2gvSr7IAHmzYNAg--
