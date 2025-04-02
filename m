Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7D5A78FFD
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 15:37:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CCC810E7C3;
	Wed,  2 Apr 2025 13:37:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ppeeoGAK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2047.outbound.protection.outlook.com [40.107.93.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D93010E7C3;
 Wed,  2 Apr 2025 13:37:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VIFFi5kIQWofYDcDFIC78XNfXzag0lxNrCsljho0L6MFb4tIL5Vgc5/itxgoFcL83pkPQT23XjD7LvC2b8gEJe6zKOi0T/Xg0qUpDy/O8jg3CcxCTHyM3Bq4lQMPhgo7cMFKoErfTYfuoUAPT4Bly3hD7JnXpVXfaMQiiyTi0rUsChYO2Wr82v/PYuCO+Xd6+EuloceZ8L7jJIhVuAkAmsP7DRPHJmUiXgGpoEdH89y1hBtE3MDAGXPb7R9yT93qhQI0/0tPPaXlfWfp3nnWzg+p6aiX+bZ1cuGCiJHkE9dMgVe+JfT3a5i7Ce77Q2L2rH39B6qh5voAAN6RzhsEvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z5XmA1zbHgPy6yhAfP1s3oEdyXE4MJ+IuvNksRUbVj4=;
 b=X3rIR+nwHyww+3OaC8xIFKnnF99U7RD04moOMP60Gi2yNkwkzu/doAEK5tOMKmfn/6ATBwfRTsKm9K2l1Mbxaa5qQDtXeXmbLBWzOj2o/Sv/TXQgt7e4VryJ42lzw5lcH90N7rmOgslVOIzhrOnMlBAdmBXZsEKYjfDuHwTnttw6KqrMhv0mNAbiMWm+/sO3qC2zQW62YMWvSkxm88w6cS0w2sBSLldWvyrZdcRsx2JWJvZW6dI1hco+iJpU44ZBbrMDKfrlWyEV/oH6HRMHeaXkmsm8BjCblKhWiV7D+n1tPkxlO3Ih4CM5kwl1Kszn8QzHuvckBaABpNWl8Tmh/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z5XmA1zbHgPy6yhAfP1s3oEdyXE4MJ+IuvNksRUbVj4=;
 b=ppeeoGAKARKwpZiDuWajsSLghqp2M+PpPNbVPc0zVKzhJ4S0ZQ+Y2OR6FDGFXgJLgdpaBTCtHVi4ivf2Vm4yBIxKBBrbUqeDO4OgyfJG9V7/mdFB9zqZ2ZOSVlEjihqnFM5KO7DsjHv5p+3tc+G906RGjN/2w3V0oSH5EXz2RpQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA5PPF7D510B798.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8d0) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.46; Wed, 2 Apr
 2025 13:37:32 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8534.043; Wed, 2 Apr 2025
 13:37:32 +0000
Content-Type: multipart/alternative;
 boundary="------------dsNzgV2L02M0vajiiXkkKGLb"
Message-ID: <84f1d69b-039b-4098-b0cd-33e0b92b048a@amd.com>
Date: Wed, 2 Apr 2025 15:37:26 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v3 06/14] drm/sched: Implement RR via FIFO
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 phasta@kernel.org, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>
References: <20250331201705.60663-1-tvrtko.ursulin@igalia.com>
 <20250331201705.60663-7-tvrtko.ursulin@igalia.com>
 <e4594adff1606e6a92714bbcad5838c3f100acdf.camel@mailbox.org>
 <264be6a0-b9be-4430-9de4-276456e34214@mailbox.org>
 <58b680faeeeea1c317b43a34c71d978efe72009d.camel@mailbox.org>
 <3bdd9d9a-e019-4469-a90b-92d105c67427@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <3bdd9d9a-e019-4469-a90b-92d105c67427@mailbox.org>
X-ClientProxiedBy: FR4P281CA0095.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA5PPF7D510B798:EE_
X-MS-Office365-Filtering-Correlation-Id: a0bdca3c-cd6a-42bc-c08e-08dd71eb8504
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|8096899003|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZmFWc211VGNtdjYwdHdpbCtGbGRUSXFkYzgzREIyRWh0dTZydUtkbi9Zdnlr?=
 =?utf-8?B?UWYra2ZDTGlLelVBZGZzN24vTGw4dHdEcGo4cDd3RWZWMUt6RTk4cVpYYjMr?=
 =?utf-8?B?WUIzYUV3c3ZkWWlKZFdQT2VUK05sRk1aQzNSVVZmV2VLampudmZQQ1lmVEVQ?=
 =?utf-8?B?TDZjaEtIUXRUeEVyVTJGM3JsTWgraGpEMzRFczRxTytXSnVEZGN1YzVhUk1u?=
 =?utf-8?B?NmxsdUZxc2ZTWUhFc1BMV1piVFN0aUpwVzlOb2d2UlNOQjFjd2hWeEVtK09J?=
 =?utf-8?B?aG9mVHh0ZzMySnE2S3JybWZxZnpmSExRemV3Z2dnQUNHbkQyWDFvK2RKR0pz?=
 =?utf-8?B?akFmNlJMMytEdDRLWTVyN28rYjNwOGdTbzl0bGZweVozRFpKQWxBWlRlSEYz?=
 =?utf-8?B?R0IwQ2xPaldaRzc3bWFEa1BVNmt6YmhSOGxTcTNFTjhMNHhlMXJjUisxMGRH?=
 =?utf-8?B?NnkwNklQZm1QditJaWxMMUoxaER1M0pNZWtzWE5yNkRjeElPcDNzL1QvTE1Y?=
 =?utf-8?B?Y2Z6clNZdktnM2Zmc3B0d1QxRXJXMXRHYis0bG9UcVpKUXVoa1dMaVJ1MHBq?=
 =?utf-8?B?Y3lORVUrVDVJWVAvckgyMGROTGRlL2dBQnl5Yy94L3BiZFlSMFh4dGxFMERz?=
 =?utf-8?B?T3BkSFhCbGRHekwvSXVMVFg5aVBkbDdIaWVocTJnNVMxckVEQ1RuQ1VJdXFN?=
 =?utf-8?B?WlREeTRlck8rSWR4dzlpSi96UXpJK1BPc3BjWXM5dXNIeHhRMlB6Y0IyMUJr?=
 =?utf-8?B?enlPVlZmT3VCQ0svRXpZTHFCeU9zdWpxQm54azNXeFZuR1p3R3ZENjhMWmpK?=
 =?utf-8?B?Rk9wTXEvNlRGWERTTXVxSlRGczhidUdHVFFVeHBMSjR4ZUpDZXBQZkhFNUJz?=
 =?utf-8?B?SWJxd1o2R05weFVIdG0rTVNtem80cFRJT3RTOTNtMkx6Y1prYmpNSWdqZUho?=
 =?utf-8?B?WkU1M0xNdnZqUzFqUDJyTE04cldDamJBM1hxWFRFSU5NRVp4ZlJmREg2bnZw?=
 =?utf-8?B?N09ERFk1dXRWOXliVVJWZ0MwbTkxUlJQYUhjWWFHRDUwUGN6ZEVFb1pyYkdk?=
 =?utf-8?B?bEwraWlHc2FZaEJkbXltYUxPUTVCbVZERVlKNTJBSnZVak9sMDkyNmFWd3dH?=
 =?utf-8?B?MGJkRS9mU1ZnRUNTTFNoTEJveVJzSWMwZXVuNWdTSllicFE5NFM4c0E2QlJ2?=
 =?utf-8?B?aFZzV2JuVFFIYk9Ocmc1RVlEVWRNWmZibnBCaVpWTzkwV1dRcEhXTHdPTkN6?=
 =?utf-8?B?SzRoUUY1ODExQ0g0NmZpM0FpZi8zTVVsUERmZEFGOUxCSmFmb3VhUEJnbHhp?=
 =?utf-8?B?RUVsT3o4MTNkalRKajFoWGVKNUZTajNFQjc4UWhsaVNvNlhRcE9BSC8vNGM1?=
 =?utf-8?B?V0M0QUNicWYwa05CRi9uVXJBZ0FjZndMWjlpcFVMV2NiTmpzb1VJNHRURnpu?=
 =?utf-8?B?bElWTzBCL08xb0V5dDV0amNkdHFGbDVWSjVUaVRiRFQ3eFpvSEsyRmhQbnF4?=
 =?utf-8?B?WWhORkZwQWw1ZHJralNtTUxUWFIxbXFsZDdQYXNWN2ZZa1N0ZURLVjBCU3dv?=
 =?utf-8?B?NkNaZlMzWDVQMmFYN0pUNHlwU2Q0K0cwSVQ0Q0tiWDBFVCtmUTJXR1U3VUND?=
 =?utf-8?B?S21Od3d1cGRsY1lKZXp4RGRXRndkYVExNnZvRWtZV3loRnlucVN0Ykc2OVE2?=
 =?utf-8?B?L25COUh1emRPWFd3WmpkM1RMbklpbHNmcHAwWVJwMUJsV0FwNENjWGV0ZFlh?=
 =?utf-8?B?cGlmdzBnSHlDL1QybzYzN0FmYkphd3FSbzFMUHhDY1ZyeVhrSDVLUTFLK3hU?=
 =?utf-8?B?cmx3UzR5WWd1WjVDR28zQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(8096899003)(13003099007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXUvMUFybTlMMlB3ZXAySzJsVENKYjA5VmdJcGVnRVFnc2s4cm4rYzBNcXN4?=
 =?utf-8?B?dmwydlZpM2dmeUFIREZCUFFnR1U2aGk3ek1ZbHVwbHRjRjFkREhRK0xPall2?=
 =?utf-8?B?emplT2V0MlFFaktUZ2NGbzJTbUJXWXJzWU1BUmRrcTJGRG5CWjJOaURObzVh?=
 =?utf-8?B?QzdYRmZyK1lpN1hDejVPVnRDOVdoaGpZSVZrYUxTb3F5Vmc5U1VEckJJQ2l5?=
 =?utf-8?B?RTlaSUlqYTZCUzh3NHE5TWhaY2pPMHZXUmxTREZaWTVzUjBQODRrSVA2UEZz?=
 =?utf-8?B?UUxVejgvVFVrNlYzZktIWS9oeDdwT1N5a1VqMmwwcm1UbVNLZjM3M3JBRTdl?=
 =?utf-8?B?bDlhRGJVbThtZjBzTUt5emxzSjEwL2N2VVA1bWNaWW9ySkwwVEY5MVArRE4r?=
 =?utf-8?B?dTF1Z3NOb2k0OGpZbmllb0c3cFNQVFJmUmxsOFRjR3Q5cGhyVE1Bcm9qK0lN?=
 =?utf-8?B?VlM2TkFhRnVRb0ZPQnM5UEJ4Nkg1MnlndWR1ZDVRcXZ5d1NCc0M1Zm11dG5n?=
 =?utf-8?B?WmlCSzd2NUtkNVo1YWl1RzdkYjhvNThLTFRwakJWRkd4WU5abVZHeFVNZVpw?=
 =?utf-8?B?Y3o5VGsyWURYejFxQnRkY0E3OXlJTjM1NkZzNVlZcVhjRytZazZHVXNiMjhS?=
 =?utf-8?B?cmI0MDhvbEoveU5OS0NBaVpLUFdUMUJLdnM2cEJraXBUZmxWdWp6STl3WktD?=
 =?utf-8?B?bFBZbTR4UnBuczMvRmdDUkkvZFMzVE1maFVrSHdadmpTc1gxUEFJSUxDR3Vl?=
 =?utf-8?B?SWM5T21BTmtvN0RyanBJQ283OTVIKzFOOTQxUGFacnc0OHhzZklZU3dkZCtw?=
 =?utf-8?B?T296aTBFTXJ6azUrN1UweDlsZ1Z5bURRNUhJK0ZZYVFwZUZVV2pZVHJ0SWdR?=
 =?utf-8?B?b3lab3pDVDdnN1hXQS9jS09RN0t3clJReHJzeWw2V0ttRHBvZk1TMGRIYjBm?=
 =?utf-8?B?V1FYaHNKV25zZ21MMTFSZDJlTVFzVEthaUdCYi9NcXhRa015N0RCMmdqNmg3?=
 =?utf-8?B?YXdSc3RyaWsySXpRSEdWNFMyb2lCRklqcjF4TTNUWk5UTW82dkNSL3V4SE5Y?=
 =?utf-8?B?Q1JIOGlOV01heHVNMi9FQzJvbVZ3NUY1VnpURGpoa0ZRRTF3VW5CblVXTzJM?=
 =?utf-8?B?RjlLZmdlVHZLT1NvcjVCZjJlOWxQSXV5RE1sZGx1OHp4b2lpZytUOFZrNTJy?=
 =?utf-8?B?TFdWcWNBL3V2NVFOdkdkMFp1MkRmSFlYTU5oaDFoYkpmaUp3MXVhN00wMkx2?=
 =?utf-8?B?dm1mZGlINkNEbFo0emtleXVQQW9rTCtaK1VRNHpoMzRhMC9oTzNEclphQmhn?=
 =?utf-8?B?a1VSL29rblJiQ1Y4d3FaSzljbWZ6ekpqbkljOE5kZjdiWlMxY1J4TnA0eVBn?=
 =?utf-8?B?WFhUU2paS2E0cDdScGFwYTBvNW5Nai9WUFEyWEpCeS9jdUlkSGZQdmVsZTdz?=
 =?utf-8?B?S2lqc2JKQVFHVnVjRHpWRHArNXVrZ2tMY3R6WWhZQzF4aDJSOEcyR2FGSmJ1?=
 =?utf-8?B?RElmRDNNVFlLTlNjOVB6MFNoNWNqWHJKUHloZFc3YW12UklzM0loZzY1NHhl?=
 =?utf-8?B?VlI3RW5PK2plU2Z1ekl6S0RxSm1OeE5pb0VNTkFkYjIxc081cUJTMG41K2NE?=
 =?utf-8?B?VDRzazQzR2FwV2FWVzVOU3NVaHE1cEk2Qmt3QUErUmVuRHFGVjJna0dLTEVH?=
 =?utf-8?B?QnIyd0ZxSHVxbEhkcitnVGh0TER3dFdVYkFOamk1SHp3TjhFelc4aytDTWpi?=
 =?utf-8?B?MUdkZDJDdEtZNHVUbC9UeVErcDZpcU51TjV3M3dudnd5RWw1d1daeGQ0WjFT?=
 =?utf-8?B?RVRlYVpHay9udkx6SjY0VW1NdjhyWTBNQnFSR3VvamtFaVBLVi9qR280NFR3?=
 =?utf-8?B?eVh2NHhLeWpOTVJ2NG1sSFFZeUlqVzg5YUplVXJQUlBnUUdYUjc4SGU5NEFH?=
 =?utf-8?B?d2VxWHkrakN2Mytzdmc1aVc5K01CTHpwR1lMRFVBSWd0TllQanlJeHVoRHQr?=
 =?utf-8?B?WmpSWjd6TmZhTjdQaVZrVC9FbkV6R2IwaTNaZDI2YnJhVnhRVzVQZEMzMDAy?=
 =?utf-8?B?NUNUNEp5SWFVc3dwRjBxRGZSUEptbENnRTZDMjJSbXdZaWhmT0JtVVZ4bHho?=
 =?utf-8?Q?/MSeTCDVEifG9Bsi/nV1l3Yov?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0bdca3c-cd6a-42bc-c08e-08dd71eb8504
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 13:37:32.1153 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GQj8h+j7/2rssDKwbUsVV4ObDPVdEoTtgtTu/rLP/BHUq/zsWsDS/eP6cXA4aMJn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF7D510B798
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

--------------dsNzgV2L02M0vajiiXkkKGLb
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Am 02.04.25 um 15:22 schrieb Michel Dänzer:
> On 2025-04-02 14:00, Philipp Stanner wrote:
>> On Wed, 2025-04-02 at 12:58 +0200, Michel Dänzer wrote:
>>> On 2025-04-02 12:46, Philipp Stanner wrote:
>>>> On Mon, 2025-03-31 at 21:16 +0100, Tvrtko Ursulin wrote:
>>>>> Round-robin being the non-default policy and unclear how much it
>>>>> is
>>>>> used,
>>>>> we can notice that it can be implemented using the FIFO data
>>>>> structures if
>>>>> we only invent a fake submit timestamp which is monotonically
>>>>> increasing
>>>>> inside drm_sched_rq instances.
>>>>>
>>>>> So instead of remembering which was the last entity the scheduler
>>>>> worker
>>>>> picked, we can bump the picked one to the bottom of the tree,
>>>>> achieving
>>>>> the same round-robin behaviour.
>>>>>
>>>>> Advantage is that we can consolidate to a single code path and
>>>>> remove
>>>>> a
>>>>> bunch of code. Downside is round-robin mode now needs to lock on
>>>>> the
>>>>> job
>>>>> pop path but that should not be visible.
>>>> Why did you decide to do it that way and then later remove RR &
>>>> FIFO
>>>> alltogether in patch 10, basically?
>>>>
>>>> I think the far cleaner way for our development-process would be a
>>>> separate patch(-series) that *removes* RR completely. Advantages
>>>> are:
>>>>
>>>>    1. It should be relatively easy to do
>>>>    2. It would simplify the existing code base independently of
>>>> what
>>>>       happens with your RFC series here
>>>>    3. Before changing everyone's scheduling policy to a completely
>>>> new,
>>>>       deadline-based one, we could first be sure for a few release
>>>>       cycles that everyone is now on FIFO, establishing common
>>>> ground.
>>>>    4. We could CC every- and anyone who might use RR or might know
>>>>       someone who does
>>>>    5. If it turns out we screwed up and someone really relies on
>>>> RR, it
>>>>       would be easy to revert.
>>>>
>>>> I am not aware of any RR users and have, in past discussions, never
>>>> heard of any. So removing it is more tempting for the above
>>>> reasons.
>>> https://gitlab.freedesktop.org/drm/amd/-/issues/2516 has a bunch of
>>> RR users...
>> Right, there's a number of people complaining about the regression. But
>> what I'm interested in is: how did it evolve since then. Are there
>> distributions who set the module parameter? Does Steam do it? Or is it
>> individual users who work around the problem that way?
> I know only of the latter.
>> https://gitlab.freedesktop.org/drm/amd/-/issues/2516#note_2679509

Tvrtko, you should probably prepare a branch on fdo and let the people on that bug report test it.

>>
>> ^ this comment for example seems to indicate that on newer Wayland
>> versions part of the problem has vanished?
> That's about using the Wine wayland driver (which uses the Wayland protocol directly) instead of the x11 driver (which uses the X11 protocol via Xwayland). Xwayland not being involved can avoid at least some of the issues (in particular, the scenario I described in https://gitlab.freedesktop.org/drm/amd/-/issues/2516#note_2119750 can't happen then). That doesn't solve the issues when Xwayland is involved though, just avoids them.
>

From what I remember the bug condition is that the display server submits works after the client has started rendering the next frame. With RR that resulted in the display servers work to be picked first while with FIFO the clients works would be picked first.

Arguable that RR picked the display server was just coincident while with Tvrtko's work the fair queuing should make that perfectly intentional.

So this patch set here should (in theory) help a lot with that bug report and finally make RR superfluous.

Christian.
--------------dsNzgV2L02M0vajiiXkkKGLb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 02.04.25 um 15:22 schrieb Michel Dänzer:<br>
    <blockquote type="cite" cite="mid:3bdd9d9a-e019-4469-a90b-92d105c67427@mailbox.org">
      <pre class="moz-quote-pre" wrap="">On 2025-04-02 14:00, Philipp Stanner wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On Wed, 2025-04-02 at 12:58 +0200, Michel Dänzer wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On 2025-04-02 12:46, Philipp Stanner wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">On Mon, 2025-03-31 at 21:16 +0100, Tvrtko Ursulin wrote:
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">Round-robin being the non-default policy and unclear how much it
is
used,
we can notice that it can be implemented using the FIFO data
structures if
we only invent a fake submit timestamp which is monotonically
increasing
inside drm_sched_rq instances.

So instead of remembering which was the last entity the scheduler
worker
picked, we can bump the picked one to the bottom of the tree,
achieving
the same round-robin behaviour.

Advantage is that we can consolidate to a single code path and
remove
a
bunch of code. Downside is round-robin mode now needs to lock on
the
job
pop path but that should not be visible.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">
Why did you decide to do it that way and then later remove RR &amp;
FIFO
alltogether in patch 10, basically?

I think the far cleaner way for our development-process would be a
separate patch(-series) that *removes* RR completely. Advantages
are:

&nbsp;&nbsp; 1. It should be relatively easy to do
&nbsp;&nbsp; 2. It would simplify the existing code base independently of
what
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; happens with your RFC series here
&nbsp;&nbsp; 3. Before changing everyone's scheduling policy to a completely
new,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; deadline-based one, we could first be sure for a few release
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cycles that everyone is now on FIFO, establishing common
ground.
&nbsp;&nbsp; 4. We could CC every- and anyone who might use RR or might know
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; someone who does
&nbsp;&nbsp; 5. If it turns out we screwed up and someone really relies on
RR, it
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; would be easy to revert.

I am not aware of any RR users and have, in past discussions, never
heard of any. So removing it is more tempting for the above
reasons.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
<a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/amd/-/issues/2516">https://gitlab.freedesktop.org/drm/amd/-/issues/2516</a>&nbsp;has a bunch of
RR users...
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Right, there's a number of people complaining about the regression. But
what I'm interested in is: how did it evolve since then. Are there
distributions who set the module parameter? Does Steam do it? Or is it
individual users who work around the problem that way?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I know only of the latter.</pre>
    </blockquote>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:3bdd9d9a-e019-4469-a90b-92d105c67427@mailbox.org">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap=""><a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/amd/-/issues/2516#note_2679509">https://gitlab.freedesktop.org/drm/amd/-/issues/2516#note_2679509</a></pre>
      </blockquote>
    </blockquote>
    <br>
    Tvrtko, you should probably prepare a branch on fdo and let the
    people on that bug report test it.<br>
    <br>
    <blockquote type="cite" cite="mid:3bdd9d9a-e019-4469-a90b-92d105c67427@mailbox.org">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">

^ this comment for example seems to indicate that on newer Wayland
versions part of the problem has vanished?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
That's about using the Wine wayland driver (which uses the Wayland protocol directly) instead of the x11 driver (which uses the X11 protocol via Xwayland). Xwayland not being involved can avoid at least some of the issues (in particular, the scenario I described in <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/amd/-/issues/2516#note_2119750">https://gitlab.freedesktop.org/drm/amd/-/issues/2516#note_2119750</a> can't happen then). That doesn't solve the issues when Xwayland is involved though, just avoids them.

</pre>
    </blockquote>
    <br>
    From what I remember the bug condition is that the display server
    submits works after the client has started rendering the next frame.
    With RR that resulted in the display servers work to be picked first
    while with FIFO the clients works would be picked first.<br>
    <br>
    Arguable that RR picked the display server was just coincident while
    with Tvrtko's work the fair queuing should make that perfectly
    intentional.<br>
    <br>
    So this patch set here should (in theory) help a lot with that bug
    report and finally make RR superfluous.<br>
    <br>
    Christian.<br>
  </body>
</html>

--------------dsNzgV2L02M0vajiiXkkKGLb--
