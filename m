Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81633A91767
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 11:12:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7960110E2B8;
	Thu, 17 Apr 2025 09:12:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZcWUkqWx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2068.outbound.protection.outlook.com [40.107.93.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DAE610E2B8;
 Thu, 17 Apr 2025 09:12:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fQYwlmQ7ptTfOap0qRlpqEYroS9PPMfKQbew3uyTl4GaIkBT2u+7CTT43X2KVU3ooTOVAsTahZnMyVfe3SUb1YpUbwdeOvPxJ/FOXGWg4lCRyAed2m14E9Q6zLMbUY8RoJlDxJzS/7kuIyGXE1EFzk0o8EKlwxmbMhF/Zt83Db4QxD1jO+yQKTtTWt1lIwNNcvIxIurkISMYEfI19gMIxypZxy6HoVcJVtvDRz0XDyWA/GEPXTDFbSVorUIkIBgGJ1X60SJJeZMvtarqoSjgHAdjtkQW6qBlXQCAx7IuKC67RnHDAWetQOZagVf02g2qbHuVejYXsm2+Wbiu1qSrMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FtcVvbtZ6KZyyjk2TZG0MUuk2xBLzXyz0RYUm9V2nkY=;
 b=X3WtM0o7eZTehQ81grsspW6LKfdj7vgq+30ojqhvYmg8T8t/UNoSHpVgPUkiFoeAWYOf/7AiULT3zB4Dy8bycAK2BDZqmRc/I1x1nGpEqJ5sqNv5LLZTclVrrYlQ5F3dDsP3k8/d3qjYfSklns/l9e3Is3+92BGoCM0ECSPIVNFfLul6sxHizrmpcOaHnFnwthiGJ8n/l/aukBnM+mcSmYJ6kExDEBxV2JNsSvy4FYu4ODS+A9Em0qURRCqZWX9dr1j+T60DBU8SGMRV1PflkqyeEfkxDV30U07rk5eGe7kQuQdUoKCZV24N9tmCKawBUK2mGPJgch2ZzC4lwXXAtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FtcVvbtZ6KZyyjk2TZG0MUuk2xBLzXyz0RYUm9V2nkY=;
 b=ZcWUkqWxGqI92HoCt86LNSZL0M2Va+QH3LCWBrDJ/ZTRmQAhG7Ne0N7cKJHa2WJyyEN/HjwDk99KiHZZoOa0Q9y9tTPjY6S2umzme8fCWGx66zCkF8v+Hqh1AADkio0/9dOeloYcNp+MvpjhG+JcoO+dOyNRb8tYl01os0npckI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5753.namprd12.prod.outlook.com (2603:10b6:208:390::15)
 by SN7PR12MB7153.namprd12.prod.outlook.com (2603:10b6:806:2a4::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Thu, 17 Apr
 2025 09:12:51 +0000
Received: from BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e]) by BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e%3]) with mapi id 15.20.8655.021; Thu, 17 Apr 2025
 09:12:51 +0000
Content-Type: multipart/alternative;
 boundary="------------NhWtwPO6nTY0hRYcfzI7s9z7"
Message-ID: <d239b8bb-c154-482c-b37e-0cdaeb6ca7ab@amd.com>
Date: Thu, 17 Apr 2025 14:42:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] drm: add macro drm_file_err to print process info
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
References: <20250416133144.862023-1-sunil.khatri@amd.com>
 <87lds0p4jh.fsf@intel.com>
Content-Language: en-US
From: "Khatri, Sunil" <sukhatri@amd.com>
In-Reply-To: <87lds0p4jh.fsf@intel.com>
X-ClientProxiedBy: PN3PR01CA0034.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::6) To BL1PR12MB5753.namprd12.prod.outlook.com
 (2603:10b6:208:390::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5753:EE_|SN7PR12MB7153:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d77d358-6051-4bf3-bdc9-08dd7d900743
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VVNCK1FUK0M0bm40QitENFdoM3p3TExiTlNQTExtcTdHWVRKWEhHYVNzb3A0?=
 =?utf-8?B?YUJsWVdTejFuUFBRSDJGUzBYMlhlU0ZpY2lpWWlQWU4zaUV1V0VjdWZFT1hU?=
 =?utf-8?B?ZUhjd2NmMUpFTWpkSUJPRW0ycXg2OVo4ZDcrNFFsaXdaREYvaTlJSnQvMEM4?=
 =?utf-8?B?Q1ZYaDV3YkJXY2FEK0xRT0JMMjZsWW1FNS9oOFNGN0dXZGUzTCt4T1R0R2FK?=
 =?utf-8?B?czlEZXkrclBiWXdoT1EvNWtvWXNQRTJ1UDVKeHdxczhFNDdldGtaRzBLc3Y1?=
 =?utf-8?B?OFhFQnVtbFdLb2NjaDlWMXJqQThqN1BBNlo2bE9XUy80SHpjTGxKbTUwSklT?=
 =?utf-8?B?TlRHSDgzWHNtUGUzOHZQbW44M2tqM0xJeHZNeS9RaWVLSDB5TkdkemR6c0xt?=
 =?utf-8?B?ZTI3L3pmUDVMSktWelYvL3drR1d6MVB5V0VlYmVCOWVxVUhjM2JqWnFhK3Vu?=
 =?utf-8?B?WGNSM1hGU3pnSlFQRHpwSGtkNGZhaW81b1Y0L3ZZaUZYQWxZL2s5a0RSODFz?=
 =?utf-8?B?eUR1eFc0dzM0bXUwcFdmLzNvNXE1bElxVTdHRjM2b09IZEZJZit2eGZWSU1y?=
 =?utf-8?B?cGRsd3gySUM3YVIvOG11bTZDc003V3hwaXZjQjM4UlhERUxoOVQyUytYZHRz?=
 =?utf-8?B?RmZsNGFLSWs2aHBvbVA1NVFVUUM4b29kbUxRVS9YZThRdVRwc3VOS3N3RjhD?=
 =?utf-8?B?T05qdGFqNEJ0elNxaGVwdFJaUHdwTXlxOTZLTUtqQXBFUTRvcVMyUlc2bGxE?=
 =?utf-8?B?Vm9vc0o1cnFBVFMvTEhUOFoyNUtuUWQ2OUhEZU1hbE9sTzUwemxGTUF1VnIz?=
 =?utf-8?B?eFJ2cTd0V2M2UFIyMzlUdWJmekdyU2h0NzBUQnhiTDhFaHBocEp0NEpmcDMr?=
 =?utf-8?B?STdiRml0M1Y3dktSTmo2SDIwcmUzN3laMTRXNk9UMExyMHd2Z2pBa2ZKemx4?=
 =?utf-8?B?MlVDbUZyRy8va2x0aDJKY2FKWVZTNmYxeEhGVXpxQUdXeGRGdGl5VnhVdU1H?=
 =?utf-8?B?TVFVajF1c3JaeW1DQ21yTE4rcUN0UHVKNEZFSVpaYjBPYjJGNURja0ZmUWlT?=
 =?utf-8?B?T2xEK3BSRzQ2MUg2WmZqd09kQkpyMTkyWldVREJSTGx4MCtyR21MVkpMOVdj?=
 =?utf-8?B?QTVxUzFqNE54cTRmeXQ0bmR1bFlUbUdGZ1NybXM0b08xV21HZmt4dTk4RkpH?=
 =?utf-8?B?dWZRdDQ1M2E3cjFNVjdzKzFxalJLVlpHTXdBU2xNa0hXMUlpOC9aNUNiZTN2?=
 =?utf-8?B?SHpHV1hHOGJQeVdTVFVmYVFLSmpwSUp3QWpuL3VsRi9RUy9HSTR0cENPYlJz?=
 =?utf-8?B?Sm9kdXNMMnpLNENDT0s4QTBPK1RtNUswME42dXZNa0N2bEFWUmpsemIvWmpX?=
 =?utf-8?B?Tkd1S1ljbUNxQzErNGJxMkVkbEEyUzRydHBUUUUwbE9iaXNuajk1d1BmQmlF?=
 =?utf-8?B?SVo2ZWtJT0szaHVDc2QyYnJUVTY0RllONVUvQTZra3I0Y3lkU3J4RWxhNXBG?=
 =?utf-8?B?amtSeFF0SjFVYVVSRkZkNzVmdlhjaDYrK3FzeHlsZWoyMmNJZGlWeDFJNEdh?=
 =?utf-8?B?VTh6RXFuMlZKU2N2SFZLTWdDQVUvMWgrUzd6VXhJZDNIdzlSL05JZGR1cThB?=
 =?utf-8?B?eDVaQXJ1SXpjdlZzUkhSMCtBR3RWTDZjTGJGNURDZG5uZFdZVWs0dGYrc05M?=
 =?utf-8?B?ck5SUDhWT2xwekhBVGF1Qy9NY1VDMWxKblhFaFlnZnFRK25mWTRDRzI5MDlF?=
 =?utf-8?B?YkYwRUl5enkwMGZZcktkWHVURi9yQzcxM2xIL3UzNldyS1RrTnNMaXh5OER3?=
 =?utf-8?B?SnlnUTY0eUZ4VFhoaWRYdE5FcGxrbnBub3VPbnU4b0kyZUMxdk44SmN3WlJB?=
 =?utf-8?B?aERpRWNVcXFwV2lnN0E2UmJ1citXZXpPVldKR3QvdUk5akZpWFZkZFdtczIr?=
 =?utf-8?Q?JPk6Nn5ryT8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5753.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjhsSUdENWhndSthWDhYckRHZ01rb2dKZHlQV2ZaSFFSUHd4eGgwNVJ3NjFP?=
 =?utf-8?B?ZW9WWEFFeC9Zd1Q3MytTOHRoVjNHd01nUjYvcTF3VG9XSXUxWlVNUHRyZlRj?=
 =?utf-8?B?NHQycURMc1ZlOWJBdjdwQVI4OHNtaXJPRUQ3dVdySTBNc3FMalJrTVNvZWlE?=
 =?utf-8?B?dWU2TFhJUzk4ZXN3bXFQUFV2Vm1HMHBZNFFDRnFqa1YwS002MHliS3RQUXM1?=
 =?utf-8?B?SkFTcGN3M2lFT0E2K3JlWm5FNnlMSFVCVk1EUHhKZ3NJYmFQb21qeEVJb1ZD?=
 =?utf-8?B?UTNWbkh5YXRXNU9JL09DbDg1ODJWQ0pHQmtOU2RiRG5yOFptRXk4WDBXUFZ0?=
 =?utf-8?B?clFqT1JBdjREZzBJVjNoMWhGeWNMN21WNHVocys1RjJkWE1WWjJuMlE1YVhJ?=
 =?utf-8?B?ek4xekdKYU9oZXRydnJXM1VnK2M4N29xREIzSWRqZ3lYOEZhK2lQbnZMQjhj?=
 =?utf-8?B?ckJOL2Rtc0djQkNqSnRWbFpuSEZGdnA3eTIrbjRtYlRMZmVJbWc3a3FLaVJQ?=
 =?utf-8?B?djJ3TWFvTnVDd0lNQWZKSGVJb1ZHRnlRRnFrQ0dqVGFDa3FtclFsQm9YemZK?=
 =?utf-8?B?WWFoZFI5YzhnWE1NSGthdWsvbURYOWdpQVV1RURiR1BQd3NwRGpRcHJCMFQ4?=
 =?utf-8?B?N3ZDelZMTCtPY0Nhdk1TKzYrK1BPVFFwTUxaL1dVWVUzSjB4VjVzWVNnNkNq?=
 =?utf-8?B?cGx4cXZQeGZyYzJkTmtSUkhKUVNwQ0JHaEpaTGRSbENsaVUvNzE2ZndEWFZa?=
 =?utf-8?B?ZjUwUjFPckxBcXBqcktGZ2RFUEdUeDVxeUNXcURQdEN1VEdqKzBhOENYc1hT?=
 =?utf-8?B?RWZOK0R0VnNkNkJLQXRPalpNSDRsUlY4VmZZMjZXU1FWaGdHQnVseHM1WThK?=
 =?utf-8?B?QVFSVFAzMXBhalBMVzRmdXVybkk2TDJWMTh6V3dWZ2IvcFR2QytsNFUvOThZ?=
 =?utf-8?B?L0JPc1hKT1o2djRaL1lQS2VNeXNqY0ppZWtnVVJ1cGdFUnIyWEVCOWNZcTll?=
 =?utf-8?B?bkhiazNoRGsxcmJZVzBkVXQvSUZlWk0wbDI1QXl5M3FmSnljbWhiK3NCdmd5?=
 =?utf-8?B?STZucnd6b0JXb3cvdzNCZG05NWVVcEZsSE5jUmEwc2k3KzBmUTgyczZJc3RI?=
 =?utf-8?B?T1o4bTZ6R25QNnlVK1NLYVQxN1h1S1RHaE5oVTljcUlzc0IwZWg3MTUrWE9M?=
 =?utf-8?B?eGl5TDI0K21wRmpMWDVSVkhFNU1qVytaVUhoT2dSQnlqa3l5TkFJb3RJOVJ0?=
 =?utf-8?B?T0VSZ1Jpd0NIbTBGTHVxeWl5MkF4TktNWVBVTVJXN0tYQWdrV09yVGNlb0Qv?=
 =?utf-8?B?Wk1IYkZ5S0ZYeG1vTmx1K2pGQTRRTitRSGIxeU1yeVBOOVB0YkZOTDZlRlBW?=
 =?utf-8?B?KzlTb1Qvbm8wYjl4c0hQbHJaRlExYmFCUkpZbDhBU2IvTmYwQmJ4TlJXODlh?=
 =?utf-8?B?bFZ2UkI4eHc5R0RtSXFrMFlBdC80c0VjSUF4NUYwckNQamFHcjNZcnJBbjZY?=
 =?utf-8?B?L3VLcEQ3SzY1SVV4Z2lpbnAwcEtLUThIN25RNjZQQWxBVGhYMHUzRmN6OGow?=
 =?utf-8?B?M0ZpT3FteThWNjk2WGlNbElGa1BKd05MOGNDYURRaVBqMUE0SlpVS292U1J2?=
 =?utf-8?B?Um9aUEVNKytHemZRQVlwS0lqNFd1a3AzOFRhM0R3aENMYnJWd0dDWEVlLy95?=
 =?utf-8?B?dXRiSnhhOVBLZXVBbUd6cFR6eDFkYmtINDE2bkJzbXZHNEdQS241cE1SMGdn?=
 =?utf-8?B?ZXExaUxwWndVR1Jpd2N2azFPS3NTalptcDdSMWNwNHAzRHdzajY3aUFWT3Fw?=
 =?utf-8?B?bUVzN1J3UkhTYkdmeHRmSXBRUmIwVG5NM1QzRHRTSzI2czhmdjNVcGVyUmdV?=
 =?utf-8?B?dXhpLzVxS3JKaTNMTjh5T3FVUzFSWUJyMEtKMlFJNlRiVTlrSHphVWI2TWhO?=
 =?utf-8?B?am5yMU54S3FJSU81UnlFTmxtcUljSlg2aytrcVFmUGMzR29rTFgvS0tQRTQ5?=
 =?utf-8?B?RHJCeWFvM0hSbDJSWFB2cEV6L3M3REV4d0F2Z2E2cTZSTHVEU0JyK0NTNllW?=
 =?utf-8?B?VCt2NEV3amNrVzFCcUc0Rkt1TVRZUVZ2N1RGNHdxKzF6Y0FsbmJSQ1Nnb09Y?=
 =?utf-8?Q?rwPv/hYPkPHzj+iGUZwpH+zyZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d77d358-6051-4bf3-bdc9-08dd7d900743
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5753.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 09:12:51.1196 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7L9tBkxS75F4Y3//4N4XtwIKvMpTbluLYLqo8y4OnZ8y1zqITFl1oPrq1FwFlqst2eOdCerPaNdOLMMnpMj2fQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7153
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

--------------NhWtwPO6nTY0hRYcfzI7s9z7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 4/16/2025 7:55 PM, Jani Nikula wrote:
> On Wed, 16 Apr 2025, Sunil Khatri<sunil.khatri@amd.com> wrote:
>> Add a drm helper macro which append the process information for
>> the drm_file over drm_err.
>>
>> Signed-off-by: Sunil Khatri<sunil.khatri@amd.com>
>> ---
>>   include/drm/drm_file.h | 41 +++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 41 insertions(+)
>>
>> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
>> index 94d365b22505..5ae5ad1048fb 100644
>> --- a/include/drm/drm_file.h
>> +++ b/include/drm/drm_file.h
>> @@ -37,6 +37,7 @@
>>   #include <uapi/drm/drm.h>
>>   
>>   #include <drm/drm_prime.h>
>> +#include <drm/drm_print.h>
> Not a fan of including drm_print.h everywhere that drm_file.h is
> included. We've been trying to get rid of this, and go the other
> way. It's really hard to manage dependencies when everything ends up
> including everything.
>
>>   
>>   struct dma_fence;
>>   struct drm_file;
>> @@ -446,6 +447,46 @@ static inline bool drm_is_accel_client(const struct drm_file *file_priv)
>>   	return file_priv->minor->type == DRM_MINOR_ACCEL;
>>   }
>>   
>> +static struct task_struct *drm_task_lock(struct drm_file *file_priv)
>> +					__attribute__((__maybe_unused));
> inline is the keyword you're missing here, and that's why you've had to
> add maybe unused...
>
>> +static struct task_struct *drm_task_lock(struct drm_file *file_priv)
>> +{
>> +	struct task_struct *task;
>> +	struct pid *pid;
>> +
>> +	mutex_lock(&file_priv->client_name_lock);
>> +	rcu_read_lock();
>> +	pid = rcu_dereference(file_priv->pid);
>> +	task = pid_task(pid, PIDTYPE_TGID);
>> +	return task;
>> +}
>> +
>> +static void drm_task_unlock(struct drm_file *file_priv) __attribute__((__maybe_unused));
>> +static void drm_task_unlock(struct drm_file *file_priv)
>> +{
>> +	rcu_read_unlock();
>> +	mutex_unlock(&file_priv->client_name_lock);
>> +}
> ...but *why* are you inlining these? To make this header self-contained,
> I think you'd need to add maybe sched.h, pid.h, rcupdate.h, mutex.h, or
> something. I consider static inlines actively harmful if they force you
> to pull in a lot of other headers.

Code readability and easy maintenance is the key to make these as 
inline. Also we are  keeping the logic function which gets the task with 
locks in separate function then actually

passing that in the drm_err as string.

>
>> +/**
>> + * drm_file_err - Fill info string with process name and pid
>> + * @file_priv: context of interest for process name and pid
>> + * @fmt: prinf() like format string
>> + *
>> + * This update the user provided buffer with process
>> + * name and pid information for @file_priv
>> + */
>> +#define drm_file_err(file_priv, fmt, ...)						\
>> +	do {										\
>> +		struct task_struct *task;						\
>> +		struct drm_device *dev = file_priv->minor->dev;				\
>> +											\
>> +		task = drm_task_lock(file_priv);					\
>> +		drm_err(dev, "comm: %s pid: %d client: %s " fmt,			\
>> +			task ? task->comm : "", task ? task->pid : 0,			\
>> +			file_priv->client_name ?: "Unset", ##__VA_ARGS__);		\
>> +		drm_task_unlock(file_priv);						\
>> +	} while (0)
>> +
> For that matter, why is *this* inline? For debugs it makes a little more
> sense when it adds the function, but drm_err() doesn't.
>
> Make all of these real functions, no need to include drm_print.h, and
> everything is better.
>
Only reason of hacing drm_file_err as a macro as the variadic fmt and 
args are not possible to pass without using local variables to make 
strings of fmt and args separately and with macro to macro they Are 
passed cleanly and no local variables needed. you can check V3 i guess 
where this whole was an function only.

Regards Sunil Khatri

> BR,
> Jani.
>
>>   void drm_file_update_pid(struct drm_file *);
>>   
>>   struct drm_minor *drm_minor_acquire(struct xarray *minors_xa, unsigned int minor_id);
--------------NhWtwPO6nTY0hRYcfzI7s9z7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 4/16/2025 7:55 PM, Jani Nikula
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:87lds0p4jh.fsf@intel.com">
      <pre wrap="" class="moz-quote-pre">On Wed, 16 Apr 2025, Sunil Khatri <a class="moz-txt-link-rfc2396E" href="mailto:sunil.khatri@amd.com">&lt;sunil.khatri@amd.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Add a drm helper macro which append the process information for
the drm_file over drm_err.

Signed-off-by: Sunil Khatri <a class="moz-txt-link-rfc2396E" href="mailto:sunil.khatri@amd.com">&lt;sunil.khatri@amd.com&gt;</a>
---
 include/drm/drm_file.h | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index 94d365b22505..5ae5ad1048fb 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -37,6 +37,7 @@
 #include &lt;uapi/drm/drm.h&gt;
 
 #include &lt;drm/drm_prime.h&gt;
+#include &lt;drm/drm_print.h&gt;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Not a fan of including drm_print.h everywhere that drm_file.h is
included. We've been trying to get rid of this, and go the other
way. It's really hard to manage dependencies when everything ends up
including everything.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> 
 struct dma_fence;
 struct drm_file;
@@ -446,6 +447,46 @@ static inline bool drm_is_accel_client(const struct drm_file *file_priv)
 	return file_priv-&gt;minor-&gt;type == DRM_MINOR_ACCEL;
 }
 
+static struct task_struct *drm_task_lock(struct drm_file *file_priv)
+					__attribute__((__maybe_unused));
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
inline is the keyword you're missing here, and that's why you've had to
add maybe unused...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+static struct task_struct *drm_task_lock(struct drm_file *file_priv)
+{
+	struct task_struct *task;
+	struct pid *pid;
+
+	mutex_lock(&amp;file_priv-&gt;client_name_lock);
+	rcu_read_lock();
+	pid = rcu_dereference(file_priv-&gt;pid);
+	task = pid_task(pid, PIDTYPE_TGID);
+	return task;
+}
+
+static void drm_task_unlock(struct drm_file *file_priv) __attribute__((__maybe_unused));
+static void drm_task_unlock(struct drm_file *file_priv)
+{
+	rcu_read_unlock();
+	mutex_unlock(&amp;file_priv-&gt;client_name_lock);
+}
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
...but *why* are you inlining these? To make this header self-contained,
I think you'd need to add maybe sched.h, pid.h, rcupdate.h, mutex.h, or
something. I consider static inlines actively harmful if they force you
to pull in a lot of other headers.</pre>
    </blockquote>
    <p>Code readability and easy maintenance is the key to make these as
      inline. Also we are&nbsp; keeping the logic function which gets the
      task with locks in separate function then actually</p>
    <p>passing that in the drm_err as string.<br>
    </p>
    <blockquote type="cite" cite="mid:87lds0p4jh.fsf@intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+/**
+ * drm_file_err - Fill info string with process name and pid
+ * @file_priv: context of interest for process name and pid
+ * @fmt: prinf() like format string
+ *
+ * This update the user provided buffer with process
+ * name and pid information for @file_priv
+ */
+#define drm_file_err(file_priv, fmt, ...)						\
+	do {										\
+		struct task_struct *task;						\
+		struct drm_device *dev = file_priv-&gt;minor-&gt;dev;				\
+											\
+		task = drm_task_lock(file_priv);					\
+		drm_err(dev, &quot;comm: %s pid: %d client: %s &quot; fmt,			\
+			task ? task-&gt;comm : &quot;&quot;, task ? task-&gt;pid : 0,			\
+			file_priv-&gt;client_name ?: &quot;Unset&quot;, ##__VA_ARGS__);		\
+		drm_task_unlock(file_priv);						\
+	} while (0)
+
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
For that matter, why is *this* inline? For debugs it makes a little more
sense when it adds the function, but drm_err() doesn't.

Make all of these real functions, no need to include drm_print.h, and
everything is better.

</pre>
    </blockquote>
    <p><span style="white-space: pre-wrap">Only reason of hacing drm_file_err as a macro as the variadic fmt and args are not possible to pass
without using local variables to make strings of fmt and args separately and with macro to macro they
Are passed cleanly and no local variables needed. you can check V3 i guess where this whole was an function only.</span></p>
    <p><span style="white-space: pre-wrap">Regards
Sunil Khatri
</span></p>
    <blockquote type="cite" cite="mid:87lds0p4jh.fsf@intel.com">
      <pre wrap="" class="moz-quote-pre">
BR,
Jani.

</pre>
    </blockquote>
    <blockquote type="cite" cite="mid:87lds0p4jh.fsf@intel.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> void drm_file_update_pid(struct drm_file *);
 
 struct drm_minor *drm_minor_acquire(struct xarray *minors_xa, unsigned int minor_id);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------NhWtwPO6nTY0hRYcfzI7s9z7--
