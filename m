Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6475DB57CBF
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 15:23:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD63010E4A9;
	Mon, 15 Sep 2025 13:23:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0a86Eawy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013021.outbound.protection.outlook.com
 [40.93.201.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8172710E4A9
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 13:23:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CPKtXzJmDsBO4Gmqcd9EMrlYQCppvpQW5+RA3cVsl+JYaX0yzRg0uEFBT9aWzAj4ByMybjVdJoDiMDJmeLj/OAIs8N4AdtD6FwWXxdnbm2v5vhJjd5TDuT/OyLrwkirErRKxLzzAnJljdoJTqtexHyi/Kia0hldl0cOVc3sEbmHPRgSaTVianJodBX+yGT5cKqN1aywd2Xb1mZWxJF9UKx9DKsNmyCZWHrchokDjmqVKJBRUWTHAmPpbgFzAWL6+oPmPd0wdVxnRUcLHjLeWZYnWCZlgtf6K5FLfFvFuEycVbIujapF0msjuelVU3L0pQZdI0cqWiMnRi0ZilCZ8kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IvJlV5T88QsEyor5rU+mIVM0+q93dRlLEiXFLXng9fc=;
 b=MyEbQGVfAsaaUCX4liIXWBbaVjlQAm5T8YDXVQHcyLX1e/G+IB4CgRcSzfWwLDk1YyRKR/wRWgol7D6othL/A/puHz/B0Eofi1svvv1rhGNgv4WhZPKNTXt7bVQM4Ci/n/YcXHiFN45OP1/H7DG7fcSslmzIxiiP4g2/37tAGkaZcRUd5D5mNR0kQWznBdDEne/qqMIvIgQCMBT+tPSPzCN0jp62jmDNlaLnoU03bskKAgPKAlmZeazjRXrNDKo9LFOLYsjVz8SLiCJVuy8/au1bJlTYVpqCFwEoMJz4pHo9w7V1Zg0X6fYsagmwNqRrPVnX/9nf5DpzQ58X/DHnmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IvJlV5T88QsEyor5rU+mIVM0+q93dRlLEiXFLXng9fc=;
 b=0a86EawyWk2r8X57g45G/X1CmYaqicP7E3E5IvojEHY61IuW01TSuuwX++yeheZZNq3NK+q9OHrqphcLlwfdqJ8uK1e9RUkVtOrbwkHoXCbE2C6Kmk5BsqgTH0dBqtvo7k0RgSoNMALf3y/mJz8S4qblR3RzZHFUp+TWp9Dv/N8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH1PPFDA9B3771F.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::626) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Mon, 15 Sep
 2025 13:23:36 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9115.018; Mon, 15 Sep 2025
 13:23:36 +0000
Message-ID: <8600fee7-45c6-4254-acdf-74f0d7681228@amd.com>
Date: Mon, 15 Sep 2025 15:23:25 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] cgroup/dmem, drm/ttm: Improve protection in contended
 cases
To: Natalie Vock <natalie.vock@gmx.de>, Maarten Lankhorst <dev@lankhorst.se>, 
 Maxime Ripard <mripard@kernel.org>, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: cgroups@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250915-dmemcg-aggressive-protect-v1-0-2f3353bfcdac@gmx.de>
 <01e2369e-1df2-446d-9f9d-59c86cc55a04@amd.com>
 <6f4d8e35-5230-49ed-99e2-3d923e9d0012@gmx.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <6f4d8e35-5230-49ed-99e2-3d923e9d0012@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0004.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH1PPFDA9B3771F:EE_
X-MS-Office365-Filtering-Correlation-Id: 36cee43b-5d45-43b7-81e7-08ddf45b1341
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bzJxeFdwZS9rYzJFZEFLNU84SHZ3dWNTRjJScG5acnJFKzJPUm1hZ3lzMEd3?=
 =?utf-8?B?WmFFZFNPVU5rM2pqa3JCRVVIRUdjVGFiSVNjTWwrdlM2OFpwRCtZbXNBVEdp?=
 =?utf-8?B?YXVMOHhyaFlOb3RMcFRJSWpCMnlEa2dqbUtrYlNUYTRlTW54am9Jb3grRmFC?=
 =?utf-8?B?UTh0YnhDN3NRcU9YS3dQa1M4TjlYT0tjN0JOT3A0c0orRjk4VmNWWlZtVHB0?=
 =?utf-8?B?ekcwSU5FS3k3c3hnUnIrbjVXL3RiWUorbi95VjVha1QwaTAxVjhiMlErakpR?=
 =?utf-8?B?ZmpUVEJRaVl5MUdaNVVBaXMwVGRwVHhFRWhodkJ5SUo5RXQ0UTJWSlBneFcz?=
 =?utf-8?B?cjlTM1QvUkIwazFERjY3aFRUNWxwTnNSUG5mR3czejUxbk96NTlNQ1JjcFVL?=
 =?utf-8?B?K1lLOXQvUzFDNVliWDVnaGgxMlVqbEROTmFJaVJ1SWI3NDRySWsyYUY2NEhm?=
 =?utf-8?B?eGFNVWFIVjd2LzBSWHN0M0w5THFQa204Y0JmK3MxMDRLVnRqWENCZU9TbWJn?=
 =?utf-8?B?L2VHQlZGRzY0VmJzd1RLUm5jZjNTU1BQZ3hHN3lzK2NNeWRNYXM2cnBRY3Bp?=
 =?utf-8?B?QXhBOEJXeDNFbTR1NVlTd29uZ3FLMFdINmRFSHR2ZHBwMGRoWUxwLzg5b0Fh?=
 =?utf-8?B?RlNSYnBVWUF0VGE4VzRVZmJLbnc5Y05nRmdheGo4QVlaQ1VUR0ZnZnFyUGZk?=
 =?utf-8?B?TVVZb01aTU1wOFlWWFFPeC8zTGdhWktHY2ZqYTFVWUloaHdMTFJWT0lWSXdD?=
 =?utf-8?B?YmhXV0wrVzNtdXkxLy8rQmd0QVJCd3lycFNHM2JKeVFneFlobHo5RTZHeGVT?=
 =?utf-8?B?QkdtYmhXTXFEd0NqdnhhQVpraUoyZ0NDMmE5ekF3Z2pMMmJub2RVQk5CelNJ?=
 =?utf-8?B?U1Irb2hpRkp2MTJuV1JuVkIzTjhHVzFNeDFxbDQySVdmNjNLVTllWDhXbnhp?=
 =?utf-8?B?Y0toeGxzSDN1aXM2cnBqVGJTQUc1Z0hiVVNwNnR0ektpK2cxN2hTVVhRbFZ4?=
 =?utf-8?B?UUN4Rm9FVDFzc0pRalBIaHRWQlR4MGo3aW44c2d1R2grUnhaMmRiTGlQRDhq?=
 =?utf-8?B?c2xkV3dnUk95OFpKS09JdmdCUmZmazBWNEk2czNUcHV0WVh5RGcvNWFxV1Jp?=
 =?utf-8?B?eXhTYWlTT1N5Q3lXZGVjOWZJVWh5dklzUzVWc1hjVkJBaGwrSjhQdWREMUJq?=
 =?utf-8?B?NSsrOFhpUHJteUlTZlFVNkUyRG1Ba3FjbDJsalVGalE0MW9WNkNGQjhvRC9U?=
 =?utf-8?B?OUxaU1VEQTZKSVRIZk5SWEhOUDZQTnR0eTBlM0RtR2RjQTZDUEtxbFcyNGNH?=
 =?utf-8?B?UU1IcEJTOVNKTkhoSFk1emN2SmRNMUR4YWdVbEdUUE1Nc2QyRU5pcGxKaTdC?=
 =?utf-8?B?eXprNzJiSFZVZXJlSzhsN0VIZW1aNkF1MW53K0dQTTVmRGdQK0lvcFEwSDdm?=
 =?utf-8?B?MFBMb1ROL1BLN04zMEJVNWoySnB3YlhUVDNieFBnL3Y0cU9JcHZsQXRKUUNK?=
 =?utf-8?B?ckU1WGlZeUQ1cnZJODlFY0JNcEVEM3VGSmJ2eThrNUtVVHErZ3N4K2JPUUxJ?=
 =?utf-8?B?YUtacWJuMjc2eENuZ3NLMjFodXh0MzdpSUdNRXAyNkdnUi93M2IyeWdxRWJh?=
 =?utf-8?B?SHg5NDhpODhTYlJwN1UzcUgzQWxweG9TUXcyb0Z0QmdWbjFQYkNSZDJxQi9R?=
 =?utf-8?B?cWVzN1loZ21pdnZLRXozM1dKSUprZmZJREhRWjcwTE91eHdRaFpqOFBReno3?=
 =?utf-8?B?UzdyT2p0SmlMUmpHQnEyZVVWaDBWZ2w3aUM5djdrckxiY1ZlSldFMGw3M0FI?=
 =?utf-8?B?ajc0TzZQVjRQOTVoUnplb3pROHlzZlBNckpTaDVuQ1p1QlNrOWRQeHkyREJk?=
 =?utf-8?B?aFVOanFjdGRDbmV0MThoVUJZY25pZW8xV1Z3Uk5aVjU2YWM4eFFleGh0OTUx?=
 =?utf-8?B?TUFpb0hsYVBzQTJYQVdQWFNjelErWHpleUtwQmVyN1QrVjNpTTIyRDJpbEY4?=
 =?utf-8?B?aXlaRmVja293PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXFvMERWSGNZSEdmc1FWdGNVNEJaL3loR0ZBYmJKSlp1NG0vS1kxT1RPaTg3?=
 =?utf-8?B?TnpXYURxL0R3WW5ZcVNsR2w5UkdML3BPUnNNVVZEU1QwaVN2ZFFNUlR2Y01z?=
 =?utf-8?B?cFlPNUIzUTBzUW1DbS9YcmhNZHFZdXA4RGVQcDdYM3dHUEI5M01iQ01zL3RI?=
 =?utf-8?B?TkpTWVdNQ3JDbzBDbHdTdXYrWlA1L2Y1T3BZdnI5OC9xcTlZNXBxeEl5NzFC?=
 =?utf-8?B?QlhaSnN3M2JFdzc5UDcxVklnanpDTW5tM1NuT1VGOGRwTG9XQm1rQ3A5SVdB?=
 =?utf-8?B?YXdOT1I0emdZUE5UVFRWaityOGdhTURjVjhRdGlYVnVqWGladXZtd3R2TStW?=
 =?utf-8?B?UU1FZUpUcHlyNUg0cjNzRi8yeXNRTWdHT284a2FxK0ErU2tHZ0RLVVBkLzlY?=
 =?utf-8?B?RC9RMHMyazlWSzZ6aC8rVlpVN3VseEpwUHJYQjA3akpGVXIwYkxyMi8zUGly?=
 =?utf-8?B?UTY3Y0k1emtHRW5VSEFrN0R1WHBUWlVRQ25zWG10UTdoV2YzeEJMeUlyUGwr?=
 =?utf-8?B?WlFOV3h4cC95b1dHcWMzdWYzSVgxZjFScmFOZHRVVklrL3NKWFpsT2hodWVj?=
 =?utf-8?B?Z3BJNmtPWHE0V2RmUERubGo0RDhBV3VzZFpVZFhYOXVOMllzeHRrUnRDZkdP?=
 =?utf-8?B?WFBkaHJRSGVnbEVjOU5PV1p0NVlOV3U3bnExZzk5c29ZcjVoWFVWdVFBazBP?=
 =?utf-8?B?TndzVFJ4MHFjeWpmcTd0NDlzSWs2dVR4WmlERVlubFVKQ0k2QTBPS0Noc0F0?=
 =?utf-8?B?cmdLa2Nya3VaTVhod1BScTNPelJaSStkcm9UQzNNR1hrQWdscFN1RXdOZ0xG?=
 =?utf-8?B?V0tNbUV0YnpIVVFhazRKREpvamdtOSs4YzFZd2pkMGJHeVJLR3dId3NybWdl?=
 =?utf-8?B?Sy91UXpXei9MTDdVZDZ1TU51eFFTbU5mU2NiZ1ZQVURwVzhMWUlQeTI0Qm5p?=
 =?utf-8?B?MUxvYnh3d1RPM1cwNnRZbGhtWkY4QndBbkpZYVFraWYxYTdVV2xubGpSMytp?=
 =?utf-8?B?dkcxUWlEK3VNblBabXRwWkJHN2NIVTQ0bWVlWlNod0JQMG1pQmNMQ1BKdlUx?=
 =?utf-8?B?aFJaWXdHdjdaYk5FRWF5ODhSVDBYeHpCWnZKblRoNVlUMk5Da1BubTRqMkFH?=
 =?utf-8?B?a0M5a0ZORmJORlBleFBUU2NBbnZRaHlrbUg1bk10QW92bjZPZVllUVRaOFB5?=
 =?utf-8?B?UmE3a1F4MW44YXd4VmlmU0pCTWRuTVpxTm5Za2lvQ245clpQVUI1NnpMb2NL?=
 =?utf-8?B?VEl4eUtsMFBsRHJoejNFSGtKZHVneW9ZTGpHbFBQVitHRWlzbmlXVzNVaHkx?=
 =?utf-8?B?K3V3SUx1RWRNUWZDS1YvVm1IWUl1UFltYkFKeHpXWjdpbHJhdERBdzJ6blBE?=
 =?utf-8?B?NnM0MUNkbUM4QWVzb0ZyZ1BHMGdmQndPelMwRXZiNldYR1FOckxNQTc0eTNx?=
 =?utf-8?B?VG9BOUVWcXgyeXU3K1psNCtXSVA2SUI3N2k5NGN3YlRJSER4ZjZ6ck9RT3Zp?=
 =?utf-8?B?Q1RPSXE1RE9KazJKbVRPcXdsdHVwbC9qeEFaRXl4bGQzR0dsbisveXVaZC9Y?=
 =?utf-8?B?YWJWQXJrRXhsVlBNNEtScE1vVStEZTlFL0lBNThyNWJLQWJPSjhONVJwckUv?=
 =?utf-8?B?UVFYL1dMcVh4MldQdUdUbFp4MkozTkJ1NEl3djYyLy9WWForaFpkaS9oVG5H?=
 =?utf-8?B?S0w2MDAvdXpUTmliRklyNHdHeWlBUkJNcVBmNlA3RlZGMWlyTGNLejdNWVlV?=
 =?utf-8?B?SFI4WXdpSTEvNWgwakJMN2EvbXExVEFqVHh2RlNyRlpDZXNxeWhnOC92dDRT?=
 =?utf-8?B?azA0Z01TMWFaNHo2Y0ZRUHRzQWN4NDZVMEloSkVVSmMvbFMzVDRBMjUrVXgr?=
 =?utf-8?B?SVRHMGpzaGdGQ0tJQ1dKTjFzYXpUWGxtbUtjekNqWjVtKzRzQWN3dGNiY1ZS?=
 =?utf-8?B?cS9DNkNjeTM2WVZkVnllUUU3L3o5ZGF2eVRKRFNLNUhrQlV3YUxESmtIMC9Q?=
 =?utf-8?B?anpISUpQdHoraVdvU1Z2ZzNIRk5UelMxM21Idk5jRkMwanpzWjdLekZKWmk2?=
 =?utf-8?B?OXN6eVBsZ0F2bXpzMlpQMGZzcDNPTzU4VDF2bTNTZ1I2Tm1DQ1pJZzVFSG5w?=
 =?utf-8?Q?X5jUPcZp9GJBiF2+g+2YhTLIR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36cee43b-5d45-43b7-81e7-08ddf45b1341
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 13:23:36.0805 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K+zr6K2ZBd3m/f7Hxny/YqwuegQ6U2j1cOPRnM+z9ETSRntFlO/44vU3aV2J08Cb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPFDA9B3771F
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

On 15.09.25 15:17, Natalie Vock wrote:
> On 9/15/25 14:48, Christian König wrote:
>> On 15.09.25 14:36, Natalie Vock wrote:
>>> Hi all,
>>>
>>> I've been looking into some cases where dmem protection fails to prevent
>>> allocations from ending up in GTT when VRAM gets scarce and apps start
>>> competing hard.
>>>
>>> In short, this is because other (unprotected) applications end up
>>> filling VRAM before protected applications do. This causes TTM to back
>>> off and try allocating in GTT before anything else, and that is where
>>> the allocation is placed in the end. The existing eviction protection
>>> cannot prevent this, because no attempt at evicting is ever made
>>> (although you could consider the backing-off as an immediate eviction to
>>> GTT).
>>
>> Well depending on what you gave as GEM flags from userspace that is expected behavior.
>>
>> For applications using RADV we usually give GTT|VRAM as placement which basically tells the kernel that it shouldn't evict at all and immediately fallback to GTT.
> 
> Yeah, in general this behavior is completely expected - though I'd argue that protecting VRAM via dmemcg influences the semantics a little here.
> 
> Giving GTT|VRAM as placement from userspace essentially says "ok, please try allocating this in VRAM, but it's ok to fall back to GTT" - whereas specifying VRAM only essentially says "ok, please allocate this in VRAM, and really try hard to keep it in VRAM whatever the cost".
> 
> Usually, resource allocation failing is good enough of an indicator that it's not possible to allocate in VRAM. However, when the application's memory is protected by dmemcg, it essentially says that it actually should be possible to allocate up to that amount of memory - the cgroup is entitled to that memory, and the other unprotected cgroups have to make do with the rest.
> 
> I think it's a justifiable tradeoff between the indended function of VRAM|GTT and the intended function of dmem memory protection to evict these unprotected cgroups for only as long as the usage doesn't exceed the awarded protection - this is what this series implements (dropping the GTT flag in userspace would have negative implications in the case the app uses more memory than the protection afforded to it, and as I described, just letting protected memory allocations fall back to GTT is insufficient too).

Yeah, that is a really good point and the argumentation makes sense.

So the semantics of dmem should be that be that it basically guarantees that if the application requested x amount of VRAM that it gets at least x amount of VRAM.

The problem is where is that documented? This is part of UAPI so we pretty much need to nail down what should happen before we enforce it.

Regards,
Christian.

> 
> Thanks,
> Natalie
> 
>>
>> Regards,
>> Christian.
>>
>>>
>>> This series tries to alleviate this by adding a special case when the
>>> allocation is protected by cgroups: Instead of backing off immediately,
>>> TTM will try evicting unprotected buffers from the domain to make space
>>> for the protected one. This ensures that applications can actually use
>>> all the memory protection awarded to them by the system, without being
>>> prone to ping-ponging (only protected allocations can evict unprotected
>>> ones, never the other way around).
>>>
>>> The first two patches just add a few small utilities needed to implement
>>> this to the dmem controller. The second two patches are the TTM
>>> implementation:
>>>
>>> "drm/ttm: Be more aggressive..." decouples cgroup charging from resource
>>> allocation to allow us to hold on to the charge even if allocation fails
>>> on first try, and adds a path to call ttm_bo_evict_alloc when the
>>> charged allocation falls within min/low protection limits.
>>>
>>> "drm/ttm: Use common ancestor..." is a more general improvement in
>>> correctly implementing cgroup protection semantics. With recursive
>>> protection rules, unused memory protection afforded to a parent node is
>>> transferred to children recursively, which helps protect entire
>>> subtrees from stealing each others' memory without needing to protect
>>> each cgroup individually. This doesn't apply when considering direct
>>> siblings inside the same subtree, so in order to not break
>>> prioritization between these siblings, we need to consider the
>>> relationship of evictor and evictee when calculating protection.
>>> In practice, this fixes cases where a protected cgroup cannot steal
>>> memory from unprotected siblings (which, in turn, leads to eviction
>>> failures and new allocations being placed in GTT).
>>>
>>> Thanks,
>>> Natalie
>>>
>>> Signed-off-by: Natalie Vock <natalie.vock@gmx.de>
>>> ---
>>> Natalie Vock (4):
>>>        cgroup/dmem: Add queries for protection values
>>>        cgroup/dmem: Add dmem_cgroup_common_ancestor helper
>>>        drm/ttm: Be more aggressive when allocating below protection limit
>>>        drm/ttm: Use common ancestor of evictor and evictee as limit pool
>>>
>>>   drivers/gpu/drm/ttm/ttm_bo.c       | 79 ++++++++++++++++++++++++++++++++------
>>>   drivers/gpu/drm/ttm/ttm_resource.c | 48 ++++++++++++++++-------
>>>   include/drm/ttm/ttm_resource.h     |  6 ++-
>>>   include/linux/cgroup_dmem.h        | 25 ++++++++++++
>>>   kernel/cgroup/dmem.c               | 73 +++++++++++++++++++++++++++++++++++
>>>   5 files changed, 205 insertions(+), 26 deletions(-)
>>> ---
>>> base-commit: f3e82936857b3bd77b824ecd2fa7839dd99ec0c6
>>> change-id: 20250915-dmemcg-aggressive-protect-5cf37f717cdb
>>>
>>> Best regards,
>>
> 

