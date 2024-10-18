Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FADB9A3C61
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 12:58:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFEDC10E8EC;
	Fri, 18 Oct 2024 10:58:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="1Ly3Wdww";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2055.outbound.protection.outlook.com [40.107.212.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8501810E8E6;
 Fri, 18 Oct 2024 10:58:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AUgdAwSqbmm1pcwWP1DO47akILF2fdTU492gW9muFox+ga84+ONKyWUFICYSDRP4nhEEGd7xJjU/VLgmNOoTtLJtRzz7TNh81dQ7SmckvjRUo5Eg6+jq40PBDmzoKde9WsNljyNavbrPFAF6Jk73kHX854Be0xRrVxtBbmCLlDIDnkeomf3EHuVhQOPdRAemp9u+eYAAyuvJpF2ryGAjVF44G7bTGjnvG8apj4dBwO9xKeZ/2gRIOOaZwY815AUVsgz98sxAzRTLLskqDnOwwINAKKUyBy3DDyewvXWG6TCQbNEWQtLKRhoIJQYeYxowZqzAeFdqQD8IipjmJNM55w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jNlX9SUYqDNCa1e01gd/RKOe4CsizEn+RjTHjAzt2tY=;
 b=b2RQt2ejgYz8zIObPtIhd77Xeu6wrf8SRpZGoilgAGqQ0rwfGwLt40aHVuGUoYgU0/GRRmX0tLVgvjhcqnY7yz1C8Fe0C4btHUGwEyA8geUvk7/GeMAWSMqZakrqA0Eu42t6uIN2wX1h0u7TpPGTv+8R1pMpBCw+48pSoqRXmKFto7v61AuPunER72e2s4f2fBQdDb4BQoQ+X75GOhOsL0gTmxHaUgdwSjbpO5+Rz4la9Uryrkk0DIewMwOhGEy/hQ12nSmlwhGK7aL5AvRpQEjLTbU/2f5Oa09i4Z34JDRG9G/RwD+MuQhLYaZTCbbOti3lPCkqZMgYMhNHbjSgnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jNlX9SUYqDNCa1e01gd/RKOe4CsizEn+RjTHjAzt2tY=;
 b=1Ly3WdwwJf+6zk10SHCZm+1gVJTJ5EC2cP+RnOyL/a3tNXgFa6iqLx+K0vLraxU5LJmW8LjKd9N57BqK6rMwf7ERxrhLL7ASTQMJqW0loussTSTaOWXKO4MQwWG0+H1C0nvopdQjJDVrUBIfxF+JbeP67jbXNr2edHUhE+S+CMw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BY5PR12MB4274.namprd12.prod.outlook.com (2603:10b6:a03:206::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.20; Fri, 18 Oct
 2024 10:58:22 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8069.020; Fri, 18 Oct 2024
 10:58:22 +0000
Content-Type: multipart/alternative;
 boundary="------------lSZm6KLbNLupsszqYdV0OSVK"
Message-ID: <5a89757f-7000-4ccc-8762-1befe1fae258@amd.com>
Date: Fri, 18 Oct 2024 12:58:09 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/5] drm: Introduce device wedged event
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Raag Jadav <raag.jadav@intel.com>, airlied@gmail.com, simona@ffwll.ch,
 lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 jani.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net, lina@asahilina.net,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 francois.dugast@intel.com, aravind.iddamsetty@linux.intel.com,
 anshuman.gupta@intel.com, andi.shyti@linux.intel.com,
 matthew.d.roper@intel.com, boris.brezillon@collabora.com,
 adrian.larumbe@collabora.com, kernel@collabora.com, maraeo@gmail.com,
 friedrich.vock@gmx.de, michel@daenzer.net, joshua@froggi.es,
 alexander.deucher@amd.com, andrealmeid@igalia.com,
 amd-gfx@lists.freedesktop.org
References: <20240930073845.347326-1-raag.jadav@intel.com>
 <20240930073845.347326-2-raag.jadav@intel.com>
 <ZxB6yKRrgvCoRK7y@black.fi.intel.com>
 <9b720b21-6195-408c-88bf-a092e0e7555c@amd.com> <ZxE-x6osh_jFHl5X@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <ZxE-x6osh_jFHl5X@intel.com>
X-ClientProxiedBy: FR0P281CA0265.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BY5PR12MB4274:EE_
X-MS-Office365-Filtering-Correlation-Id: 287202d6-073b-4fa5-15b5-08dcef63c85e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SEg1dXlpRTdKWmI5Q3RUZUtGM3VtcWZoRTdUUlRBWFFlTmRkTStkTHZwZWps?=
 =?utf-8?B?WkU2d1l4ZC84QTlGU0ZGcFlOMVJTeGxMemhjTjlWK1dwb0pNME1ZRFJiQS9U?=
 =?utf-8?B?cGFSOTdKTXhUUE9hbkdZWmxEUEw1VkZ1aHN5bXJoSERwdis4cW9laHg1QllY?=
 =?utf-8?B?ODluT1hMbnhCclFmdHpDczdEU21FcFYyRVI0MldOakF1eWNZL21IeUtVVW9U?=
 =?utf-8?B?WmxPU0dFNTA4bnJTSWpabW1icnJhVzFPK3B4RUdmSWxEUmZFb2VrRU5DN29E?=
 =?utf-8?B?UlRzU1pQazd4d01YMG1ZRHVyRU1reGVUWTFNeW1PQUFIcTZKSzhOS0VjWHA3?=
 =?utf-8?B?MWZhQlZGYjY4WnFJY2lUVExpOVZCTm9EQ0VqcW4ycVFaUTNWZER3a3FyUGxk?=
 =?utf-8?B?cW1sd2ZGcFV0SUxxM3g1a1pZS1p3aU1SdnNFK3BaMzVPbTBpT0JrcHRYcW9o?=
 =?utf-8?B?Rk15TmJvMGZwVk5VTndnT3V2WlVlclVNK0xhVUNBQ015NlJKVkVRcmpuTXRn?=
 =?utf-8?B?QVFRYnBQYkpFZ3E2b3ZjVEhHaW1pb3Zwa2hPMmJqRmh5S3pWTys1S3E2bDNh?=
 =?utf-8?B?SURwanlJT05ndXZkUXVwVDR3b3EyUXBNWTNmZlJCNDkwRjZiVGJ4R3FVZ0xV?=
 =?utf-8?B?WTAvRjlJRXZMdXllQ2hXMnVxQXlacXJrOThmY1pGYkl0QW5ZTzg5VnV6WHNi?=
 =?utf-8?B?MFBRcmNTUnlMMnJ5SDJDaUVROU1WNSsyQnVEdkJGNDQvZyswamNMN25ZUUVl?=
 =?utf-8?B?anB5TDN1Y1RDK1phU3B5VlFOSGZ0bkp3TDJkcit4eU5Mem9DeUxPTGJySkZS?=
 =?utf-8?B?ZkJpcnd6UGFCWElvdEp1ZlBiMGQ4MGhIOVcrNFdId1VvaXlTdkhqRlU3QWZ2?=
 =?utf-8?B?cCtTWVZkNCtOeUUyMkt1R1ExNUlyem9xZTBCSkpkaUpjYTFIL1hRUCtubTFU?=
 =?utf-8?B?bTI0bERhbG9QdnR5Y1JxYWticUpScHN5NG5KUEdGWmhGdlhWRWozaFRza3V0?=
 =?utf-8?B?b0RHYko5aGxzb3BySldaOVcxejRNd0hvRFI3TWUwemdab05lUE5DVGx5OGlF?=
 =?utf-8?B?aHk0SjgxOGprbXBPbmxUMmkrMHM4ZTJrMURrMm9zRys3V1YzczZqVnRHbjh1?=
 =?utf-8?B?R0FuM0FuWjBkaGxXdllXb1JqTTNobFhwV0FhY0NsbHVoTjY0L0lzRkhIVTFs?=
 =?utf-8?B?aXArSVB3UmdLYVlDUnNyb042TUlFMXp0WGxvbDdKN3hlak8xaTI2KzVJOFE0?=
 =?utf-8?B?TVNnN3p3SXZmUXNSUy80TjN5TUNqWTE3R0V4Qk4rQnd3YkROTFJpLzJjVmx1?=
 =?utf-8?B?QkNsK0lOSzZpS0M1cDJXV0s1aXlQMTRmLzAyaU5yeVViMzEzZ0swdlNIRG9K?=
 =?utf-8?B?NHdSY2VYcVpnVG01SENEU1VGMkttZnlvTy9yRWZFczllU2pvaUV5WHorQ0Nq?=
 =?utf-8?B?NnRFeDM2N2hZNHRsU3VPa3FzL1o0MENsd21zejQ0Z01QN0dCR1A3NmVodkpl?=
 =?utf-8?B?Ryt1T0h3N3hHYzQ0RyswVEFpQThFNkEreU9kaTRzblRZZk96ak01Y1hDckRV?=
 =?utf-8?B?dVh6amh4MklaYVI4bnVTdTVWQ1lvOWtmblV0czFNYXNEdVpWVlpiVUQxTlh4?=
 =?utf-8?B?cTZ6Q21QNGUzZThmNmZiNUFoQWRtSFNZNXIxQmZrekdUVjJvTzNrU3FTOVFu?=
 =?utf-8?B?MTZnbzBIRUZlMFQyMmU2QzdQNkZ3elViQWtOdENsMSs4bnRITnB1OGlCR1U1?=
 =?utf-8?Q?oUl69m/+jgooej2OMrtN9ujFbG9NIIzDYJcqa+6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVA4cDJ4cWJDQXk4N1RGTkNNbHJLRERaZ3FiQ3VvSlBXRk85N1RhZEp5S1c4?=
 =?utf-8?B?QmhRc3oySVFEc1hCSEpQQXJSMEY0am4wWFZ5cUUrQ0w3UlN0S0Z5ZGpjU0xt?=
 =?utf-8?B?WTVrR2RMYjkyb2IvYmNuS1lMWXA0azRldzJ4S0tTRzBiSWl5OFFON1lrQjNy?=
 =?utf-8?B?L2Y2dHdQWmZ2KzZEMGJjV3JsaG51RlNPUGcybTFhMldIMWdPbjZ6UmxFZy91?=
 =?utf-8?B?YjdjUG9NUzRVZ3JYWVdDVTU3UUwrUE5DZ0NXZjBIR3k0YzE3dWpWY3IrZ0RQ?=
 =?utf-8?B?MGVlVk5wQVBWQmlFT1Jjb1lLVGZWSnhKM2Z1ZllmQVM1Y1U3bDdRU1I1ZUl1?=
 =?utf-8?B?QUx4UGVldER6SHg5ZGY2d0hzbkwvSGtLeDdrcGhOUHJMcGdnYSt6eHNZQzNu?=
 =?utf-8?B?T1paZGU5Y2hKN2NtaVFVYXk5RnUyTW0za3BKdEoxTHlmWkxRVkpqWWpOU0Ri?=
 =?utf-8?B?RklQZFp5bW95SFd3MGZLbnp5TGlPdXMwWk1Bd09XMDJoNEFpVThzUHAxOC9y?=
 =?utf-8?B?cFJjS1h5WHhHdnppenNNTDR0R3RzSUFoOHZlQ3FjNWVJazJ3eVFSUTZHeUs3?=
 =?utf-8?B?dklqYkgwZGh3VWFoRTdOMXdibEp0a1FLNU1JaDJQSFowMW4yNzEvY1M5bSti?=
 =?utf-8?B?QzNOeEFqRWZ3VVhoMFZtRXdpQUJ4dzJaRFliQjJHQ05ZR3dET3pWa1Boem5x?=
 =?utf-8?B?aFZWeWRSSjQvc2dGQzJNUDNqM1V0ZVJrU3FtNVZSeEZoT3V0QmpkNEdaejNR?=
 =?utf-8?B?QSsrYlBPcnlzRW92cEZtWExQSHZhcUN1cUZlY0NxanFubXpYMmVpd25MOThT?=
 =?utf-8?B?RGR4Z1VTekF0L3RiSzQrVnZUZGlxMkFXZkFVNUFhR2VjYi9PMUtPZ282Q3hW?=
 =?utf-8?B?RHdUWU9IOXhPS3RoWFB1ZHY0cENINzZYNWhUWW9hTnQ4N3lTRmtxYUF0anpT?=
 =?utf-8?B?a3kyZUdvUERoVmtwa3BGdkhqZ2lkRmp1ak5OSzRFZWY2bnVXZDBZM3llNW1C?=
 =?utf-8?B?ZFFZYTUwQTkyc2FiUTYxdDNzR2ZYT3B5cHE3UDRjRkY0cG16bVFsUG5Ob2E4?=
 =?utf-8?B?bGljQURNN2srSzZybkdaUlBUMEJqQU5EcTVQcDVDRGx4MXl3bkJDNjBPUVA0?=
 =?utf-8?B?bEh0UHZ4VDg1L043Y0wyMnB4VWpPUkpBcnc3eDhyQ1dDL2Jzc0VEU1pnMVlE?=
 =?utf-8?B?cVVyZkxRdkx3TElvNXRoaFA5cWt2VDlNRENWcFQ1K09UdGRkSlVKcjdqajBI?=
 =?utf-8?B?Tno5Mlo4a09Ya2Y2VjFZV1VzRGxDTldsK2kwRlAyUUxFVEZGaGxrbEczR2g0?=
 =?utf-8?B?QWJ0NUFoTVJsMkQxZUh6SWhCOUVxYVdOY1VoWHRQV2J0R05sOHYvSk5FYnVI?=
 =?utf-8?B?V3lSMzF6Q1A5eDhEdmtiZ2U2ODYya3lBNFRFMmVmUlpHQ2VnODZFSWgwMjg3?=
 =?utf-8?B?em5TSEhJUngydmhuQnlDYnU5ZUV6dnkyNHBibFN3Uy9HclZjekF6cXFweUda?=
 =?utf-8?B?NXRwZXFnOVp6SjVtL1I5NjMzTG5LVDRiQ1IxZWswQTZZSVN1WnBBRHBJeWhp?=
 =?utf-8?B?SEx5L09YNDZRYzhoeFZEQ0tFbjIzL0JQKzk3UktQdkxLMjluNllVak5zTTdk?=
 =?utf-8?B?N0RzZlNDbHZ6YVNZVkQyWU5oTXRvTmxvbHNFTU9FY2ZPTk1vNUhORTRLdjFD?=
 =?utf-8?B?dkZyY3J0Y2owUExzZE9CMGVYTElza1RJcGdTQWRuQ1J0QUdrT01xMTl5NTRV?=
 =?utf-8?B?cm9WZVh1YTJZaFBlSWlEaGpZQy9LYUo3MnpaTEpTa2F5UWljTHA0U2lWTXYr?=
 =?utf-8?B?S015QmZIbjBucis0cWlKZS9STHBza2QwWWZhNUdHL2FoRWE5UUljMlFuM25H?=
 =?utf-8?B?cExIejFuMmhZUCtSK2NlVEltUnBXOW5iTitnZWZ1ak9nd0dBc3RGQnlxaWRM?=
 =?utf-8?B?Nmtxb2NScjNzTnYyU2JoMEpFTHhSVFVFMUdRaXRJanFTYjUwcW1HdWRuTUIx?=
 =?utf-8?B?OU1xUW5iMWU4cGlVVzMvQW5Wck90SGJFK29rODRTYStVOXF1eTJLcGtCait2?=
 =?utf-8?B?ZFJ0M09HWjlZbi9EdTVPckZLM0ZFaGcvSExLSGtZc1NiYVA0cllVZmMvZ012?=
 =?utf-8?Q?k55E=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 287202d6-073b-4fa5-15b5-08dcef63c85e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 10:58:22.3556 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KUgXg0cmv0BwnMWG2gG3kndkhseIvT1cEgLeeM2bVjw09j3miIBBE2F+pbBEVlc5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4274
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

--------------lSZm6KLbNLupsszqYdV0OSVK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 17.10.24 um 18:43 schrieb Rodrigo Vivi:
> On Thu, Oct 17, 2024 at 09:59:10AM +0200, Christian König wrote:
>>>> Purpose of this implementation is to provide drivers a generic way to
>>>> recover with the help of userspace intervention. Different drivers may
>>>> have different ideas of a "wedged device" depending on their hardware
>>>> implementation, and hence the vendor agnostic nature of the event.
>>>> It is up to the drivers to decide when they see the need for recovery
>>>> and how they want to recover from the available methods.
>>>>
>>>> Current implementation defines three recovery methods, out of which,
>>>> drivers can choose to support any one or multiple of them. Preferred
>>>> recovery method will be sent in the uevent environment as WEDGED=<method>.
>>>> Userspace consumers (sysadmin) can define udev rules to parse this event
>>>> and take respective action to recover the device.
>>>>
>>>>       =============== ==================================
>>>>       Recovery method Consumer expectations
>>>>       =============== ==================================
>>>>       rebind          unbind + rebind driver
>>>>       bus-reset       unbind + reset bus device + rebind
>>>>       reboot          reboot system
>>>>       =============== ==================================
>> Well that sounds like userspace would need to be involved in recovery.
>>
>> That in turn is a complete no-go since we at least need to signal all
>> dma_fences to unblock the kernel. In other words things like bus reset needs
>> to happen inside the kernel and *not* in userspace.
>>
>> What we can do is to signal to userspace: Hey a bus reset of device X
>> happened, maybe restart container, daemon, whatever service which was using
>> this device.
> Well, when we declare device 'wedged' it is because we don't want to take
> any drastic measures inside the kernel and want to leave it in a protected
> and unusable state. In a way that users wouldn't lose display for instance,
> or at least the device is in a debugable state.

Uff, that needs to be very very well documented or otherwise the whole 
approach is an absolutely clear NAK from my side as DMA-buf maintainer.

>
> Then, the instructions here is to tell what could possibly be attempted
> from userspace to get the device to an usable state.
>
> The 'wedge' mode (the one emiting this uevent) needs to be responsible
> for signaling all the fences and everything needed for a clean unbind
> and whatever next step might be indicated to userspace.
>
> That should already be part of any wedged mode, regardless the uevent
> to inform the userspace here.

You need to approach that from a different side. With the current patch 
set you are ignoring documented mandatory driver behavior as far as I 
can see.

So first of all describe in the documentation what the wedged mode is 
and what requirements a driver has to fulfill to enter it: 
https://docs.kernel.org/gpu/drm-uapi.html#device-reset

Especially document that all system memory accesses of the device needs 
to be blocked by (for example) disabling DMA accesses in the PCI config 
space.

When it is guaranteed that the device can't access any system memory any 
more the device driver should signal all pending fences of this device.

And only after all of that is done the driver  can send an uevent to 
inform userspace that it can debug the hanged state.

As far as I can see this makes the enum how to recover the device 
superfluous because you will most likely always need a bus reset to get 
out of this again.

Regards,
Christian.
--------------lSZm6KLbNLupsszqYdV0OSVK
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 17.10.24 um 18:43 schrieb Rodrigo Vivi:<br>
    <blockquote type="cite" cite="mid:ZxE-x6osh_jFHl5X@intel.com">
      <pre class="moz-quote-pre" wrap="">On Thu, Oct 17, 2024 at 09:59:10AM +0200, Christian König wrote:<span style="white-space: pre-wrap">
</span></pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">
Purpose of this implementation is to provide drivers a generic way to
recover with the help of userspace intervention. Different drivers may
have different ideas of a &quot;wedged device&quot; depending on their hardware
implementation, and hence the vendor agnostic nature of the event.
It is up to the drivers to decide when they see the need for recovery
and how they want to recover from the available methods.

Current implementation defines three recovery methods, out of which,
drivers can choose to support any one or multiple of them. Preferred
recovery method will be sent in the uevent environment as WEDGED=&lt;method&gt;.
Userspace consumers (sysadmin) can define udev rules to parse this event
and take respective action to recover the device.

     =============== ==================================
     Recovery method Consumer expectations
     =============== ==================================
     rebind          unbind + rebind driver
     bus-reset       unbind + reset bus device + rebind
     reboot          reboot system
     =============== ==================================
</pre>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Well that sounds like userspace would need to be involved in recovery.

That in turn is a complete no-go since we at least need to signal all
dma_fences to unblock the kernel. In other words things like bus reset needs
to happen inside the kernel and *not* in userspace.

What we can do is to signal to userspace: Hey a bus reset of device X
happened, maybe restart container, daemon, whatever service which was using
this device.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Well, when we declare device 'wedged' it is because we don't want to take
any drastic measures inside the kernel and want to leave it in a protected
and unusable state. In a way that users wouldn't lose display for instance,
or at least the device is in a debugable state.</pre>
    </blockquote>
    <br>
    Uff, that needs to be very very well documented or otherwise the
    whole approach is an absolutely clear NAK from my side as DMA-buf
    maintainer.<br>
    <br>
    <blockquote type="cite" cite="mid:ZxE-x6osh_jFHl5X@intel.com">
      <pre class="moz-quote-pre" wrap="">

Then, the instructions here is to tell what could possibly be attempted
from userspace to get the device to an usable state.

The 'wedge' mode (the one emiting this uevent) needs to be responsible
for signaling all the fences and everything needed for a clean unbind
and whatever next step might be indicated to userspace.

That should already be part of any wedged mode, regardless the uevent
to inform the userspace here.</pre>
    </blockquote>
    <br>
    You need to approach that from a different side. With the current
    patch set you are ignoring documented mandatory driver behavior as
    far as I can see.<br>
    <br>
    So first of all describe in the documentation what the wedged mode
    is and what requirements a driver has to fulfill to enter it:
    <a class="moz-txt-link-freetext" href="https://docs.kernel.org/gpu/drm-uapi.html#device-reset">https://docs.kernel.org/gpu/drm-uapi.html#device-reset</a><br>
    <br>
    Especially document that all system memory accesses of the device
    needs to be blocked by (for example) disabling DMA accesses in the
    PCI config space.<br>
    <br>
    When it is guaranteed that the device can't access any system memory
    any more the device driver should signal all pending fences of this
    device.<br>
    <br>
    And only after all of that is done the driver&nbsp; can send an uevent to
    inform userspace that it can debug the hanged state.<br>
    <br>
    As far as I can see this makes the enum how to recover the device
    superfluous because you will most likely always need a bus reset to
    get out of this again.<br>
    <br>
    Regards,<br>
    Christian.<br>
  </body>
</html>

--------------lSZm6KLbNLupsszqYdV0OSVK--
