Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 396B29339A0
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2024 11:08:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9584A10E6DD;
	Wed, 17 Jul 2024 09:08:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Wh1p53YA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2073.outbound.protection.outlook.com [40.107.93.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5D4310E6DD;
 Wed, 17 Jul 2024 09:08:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jpcvmwd/0zeHgLSR/pJHwxq7sb7gcBM7jHHyzclU1+pnpX4q8GX9Oguen0uGhKFVoPwbyDXQdaehbw15ndHErBmcntmW/ati5x5xbl9pjf3743cXgWxjsPggFZYcjz4sHUp8z5e5dIlArfb3pVFQD/rS20n5quoBgLYyXS23kO4P22AFiB+Ik+0gfP5lTu5wxIqE/1ywfzdgK0sD6In6PD9Kc6Xbs3rBEwi2ONE+Rb5B91Dix1ZyTtF1wf1POVnhITs6JjuXxVmU9AewRrc+dzuXEx8ejzXY/mrmL31TlvDbA7+FkpQVyG9/2TFtjAwzwUMOtLeqod538w8MxJ3qqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gsFV19DReznA1haDOiA+w3qY+KIqYkRLws18EMxhdJI=;
 b=yIrDauyGdy7+B+3fcyhGLJZ+5f4zriMR1isKUEaSSbfAY6WmmFy/BVJL/4IyWer66WXHZEbe8qJF6iYtzl4cVU9RwiKgXYjg2gGBS1cMPVHMh0Pub6ftUd1enbh7Bkan8XJFv67XzzRdwTm8nQyFGnsPHJXp0kqsFwWXSa6kBVY4oIabQa3FyK2ny7u1S8LYTxd6wLlpj+Tx4cGGzdmti+yS/giezlmNjid/TfQewrGoRjRwrVkcr37OEbXWWpffkfH+N0GcAfx08WJdjn3E11uMpJ0Fh9QZCWy9wPeo+Eztl/d/f2n1Oek4B+VMZFAtneb89DRktTd3GiN0KK1RoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gsFV19DReznA1haDOiA+w3qY+KIqYkRLws18EMxhdJI=;
 b=Wh1p53YAblZvUQaMONZzoBnQO9tGpZdpHu68fFTyLOwECQeNbHAJZlHjiooELoeHvJgnWMpAzkkhmKFE55UOcYjqnwZQjnyU/gNDvD1jHRyw8IYIY5ejVtbV6iKxnlPG89FHEeu/DZobxQIsq6Va+t8hbOdx9W3dopj6ykMj1YU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB6791.namprd12.prod.outlook.com (2603:10b6:806:268::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Wed, 17 Jul
 2024 09:08:43 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7762.027; Wed, 17 Jul 2024
 09:08:43 +0000
Content-Type: multipart/alternative;
 boundary="------------vLQZawfj6uH9bDVWTSp0jj20"
Message-ID: <2a2ea485-50e0-48cb-bb02-736a03368ab7@amd.com>
Date: Wed, 17 Jul 2024 11:08:36 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] drm/amdgpu: Add address alignment support to DCC
 buffers
To: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, matthew.auld@intel.com,
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 "Min, Frank" <frank.min@amd.com>, =?UTF-8?B?TWFyZWsgT2zFocOhaw==?=
 <marek.olsak@amd.com>
References: <20240716152104.377039-1-Arunpravin.PaneerSelvam@amd.com>
 <20240716152104.377039-2-Arunpravin.PaneerSelvam@amd.com>
 <CAAxE2A6gpvLcq7zDhTDgV1BiBZdbK6t7147ESpq0ufYqW-6gzQ@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAAxE2A6gpvLcq7zDhTDgV1BiBZdbK6t7147ESpq0ufYqW-6gzQ@mail.gmail.com>
X-ClientProxiedBy: FR4P281CA0206.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e5::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB6791:EE_
X-MS-Office365-Filtering-Correlation-Id: 546866d1-f5b7-4730-36d8-08dca6400e56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cTVIWFh4VjZMUnNQWjJFdFJBOXRHTDBSVXlLWU1pZEdLeVhLaUpvNVRVRlJ4?=
 =?utf-8?B?UHlRVnZwdE9JQjFhdStBbnlYa2lJeWN6QkZEYUxuakJQWXk5OUpFbkNmU3Bm?=
 =?utf-8?B?bVRGK3dsM3JlU1NkQXFvTzJMMGd5NzFPK2JDRzNialcyN3RZNm1jdG5FUWdw?=
 =?utf-8?B?L0x3Rmk1VzE3NTFBamlHaS9EQm9BZ0ErM3YzMld2bytETEx5TTJwNzkxUXYr?=
 =?utf-8?B?eUZxaG9sTE5WTUg3eU5jVG9hem5paHpkRmsxQXNEazhBQTIrOVJLQjh6cFkw?=
 =?utf-8?B?UG8zQm44VHpRQkJQYlhPQndxZUU3d0grSC9Db1VVWXFvZ2RUdTdXMVR3cGxM?=
 =?utf-8?B?Um1WSnlkZU5xclR4MHhOWHU2VXlpRGwxV3RtaDRHVHhEZ0xVcEpPb1BLckkw?=
 =?utf-8?B?bktJdGRPeWVxN2VIUlFzWmlUaitjNktUbFYzYUVaMEpjd0VjaTFrVWZUN0lw?=
 =?utf-8?B?bmRiMWQzK3JLNVIvbFRDRy9yVDRwaE1zemNnSjNLbW9wRmtyUXNKbjM0a0NT?=
 =?utf-8?B?dnU1VHI2bTcrNjdXQThadGdCUUNOSjF0UXpGTllEM3RJbWUwcmdOTHFBSWFq?=
 =?utf-8?B?OHB0eXJBanl1eFIzdVlURkg4aUV5UGNUYVV2ek90SnNjUFY3aVU2cmpoMnd0?=
 =?utf-8?B?MkRzMFNNUS9EaEFFU3dVUnhHdW5PVXEyYUZqTGlaRzZIQlpVcXUvcTF0ZWRP?=
 =?utf-8?B?VElDamkzakhONHloSjhudFlXVlBZWEw1NE93MmdmTmd5ZkNhbVJHa3VnOU5i?=
 =?utf-8?B?ZUFnNStvdzNiaUxPSzFOcS9vYURhdXBxbUcxRWlURXVuY1ZCMUtoVmx3WHps?=
 =?utf-8?B?SUc5ODNEMnpLeVk5WVNGamk4YmY4OHRic1hWaHA1RUxxdkhubWpmSGdtSUdN?=
 =?utf-8?B?L243c1RuQWpWckZ1QWw3OTgwWXB3OWJjTkxXbmR6QWZtM2YraWFmN1RkWWFM?=
 =?utf-8?B?YlFleFY2LzlYVGhMZXB0bUlJWkJ6bmExZUx3LytjREZtTTgySDBWTWlZYnhQ?=
 =?utf-8?B?NStLemo5Q0xpcnFKMVBYYnBySVd4MWtiZmxSRnczQmRGVGhLWjRYM2tFMWN6?=
 =?utf-8?B?eDV4ZVJEcUU0a2lNcXVuOEZXazhlVnVnK3d1SjV2SlNucTFLRmZacWQ5OGpq?=
 =?utf-8?B?NkhWa1NOSmI1ZE9wTCtQanFGR1V3S3IzeDhOeEJ0MmpFY3ZUd1cza0RmQkk5?=
 =?utf-8?B?eit5OUEyc0RCL3NGS3BQT0NGNUVCeTNzMnI4TlhHd1R2L2FEZnptd29IeTZD?=
 =?utf-8?B?eWZjaGxiVzhwbVkzRmxsVE1iMzFPTWhXVERXbzIvS3Q0N1Yzb2RIanY2ZFZG?=
 =?utf-8?B?YlpmQjljMGRkUTRXSFpTRnRWTjRHUjlVOHRZSEdwY2Nic0R6V0tscThlbHJh?=
 =?utf-8?B?K0Z0RjFEeDlLRGE2VkxaUkNLSHduQXpDb3Zrd0k3SlNjR21WOXJwZVNMSjhM?=
 =?utf-8?B?N2t6dzRwaFZCc1Y2bWxZMWxtVXIzREtlM2RUb1VNNzRPSWpEYmxUL0hVYUxo?=
 =?utf-8?B?TlpUWUZxbGFhVGw0bDloUFVITnQ1UWdvdnlKTWJWU25NUW9HVmZDcXRmeTVs?=
 =?utf-8?B?TVZrTnVpeTNnblA1NFIvN1dLczJvaGJkakFqeWNhN3pFK0w5alhyb0plUkFQ?=
 =?utf-8?B?akQ0MzVyU3NtWm1YeW9TYm5FaW5lYjBWTWZoOTFna29EcldLbk53QnBmbS9s?=
 =?utf-8?B?YnZpZFZXVVJMVUVTYUxjY2krNGZmRjNhMXNiTW96SGc2VzBlbDlnYTlwcFpj?=
 =?utf-8?B?L2wrTHdJV2ZZQzl5UnA4MW1iQy81cnBidGdxekdZMWdQcjlFOFdvcEU1QXY2?=
 =?utf-8?B?aGVTTU9QV2RITjRkendDUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bW5MeW1JMzdVTDR6RFFlY2RMU1lrZGNYaHQ1cmZnb25LTXpoYzRUV2NOUXhP?=
 =?utf-8?B?eFJqSnRVcTZLc1d5Mmlza1lSakcwdDJWVU14U1lNTUtKWitVSVRpa2wzUlZQ?=
 =?utf-8?B?cUtwc1lMV1dVOWNiWHErT2JtRXFNQWlxR1crUk1vQzRHaGU0MXd5ZzlOUGVu?=
 =?utf-8?B?SlVyZ1AxVnc3Qi9UOERWVldNbmt3c1ZMQ1RuaE51REp2ekRvY29XRzdhY3Zw?=
 =?utf-8?B?QWFvWkpBR3lOUkM3ck53Z1NFWmJXTFk0eVFRdndYSFJxd3h1VlU4RVhYdHQ1?=
 =?utf-8?B?Rk5PYUtwUnZPbGdJVGpLUExLVlpUNTNya0R4cmt6R1lKMWduZmhlTlhNOUhH?=
 =?utf-8?B?b2FFUkhHeDE0eUo5ZTc1TVgyMXZmSXByRUZ0dXZtQ1prZy90UXZ1KzJQazgx?=
 =?utf-8?B?SDhOczNkYzdJcndJcjFyQzdRNHJST3orN2c3c29Bd1BkZmdhUzVqVkIxZEFP?=
 =?utf-8?B?aHBPQkhiZEw0TTNPc1dhcTBnVlFWK3VkeG5LUlJIRDlYdGdqRnVlOUN4aUNY?=
 =?utf-8?B?a3NEaWpHbGN3UWxXa2t2RGxmS2lMRk9CUDB5RWEzeE1PZ0J4Y3RKdlVqVzI2?=
 =?utf-8?B?S2xQRnYrN1NQdzJ1Y1ZCbkNpS2ZmSDk0VGd5MTUyMG1UMXBtSStSZC90azJ1?=
 =?utf-8?B?R0dwbmVuZWJIc1EyTVpPeCsyY0t6eGl0UklwRC9jZEc4MEwyN2h5NC9MQ0tw?=
 =?utf-8?B?YkoybWVQZXBQWVJlQWt6Qk00TWRIWTRGRW5jdUd1NXUyLzJBV3NVSnR6Z1lF?=
 =?utf-8?B?ejllKzJUT2lTWm05YmZZYjd0VnFFZnNldFRoc1VUazVKTllrV3lNWVpEQzJk?=
 =?utf-8?B?M013cUU5aUs2Rm5hOTJDR2FyMFJhazFJNHVBS29FcGZEMWkrcG9vVk1rUm44?=
 =?utf-8?B?ZjlYajhBbnpYZmpOUzFXaURKWGN4Sm03SHVmakY4U3VGRG9KTDdrRE41cTMw?=
 =?utf-8?B?di9pWTBIcWlaOUVodmRpVFhob1RBdHpRMm5hZUV4Wk9nYXNMZEZ3SFhQalh4?=
 =?utf-8?B?UEkrMkxLRHdTTFJpZmszQ1YyaFowMDZDVWRFNmpCOGVuYmttTnNEYTBESHE3?=
 =?utf-8?B?cGNWOUtDNE5CaE5OUWtpa0pHZ2lqcjdVNmF3ZWpKNzVuakUwYnQ4N1RpSHlI?=
 =?utf-8?B?VWh5MHJGN0EyMXZUM3A1aXBLM0swc2hIRkhIanphVVVpMTRueHhrUHcyTzJR?=
 =?utf-8?B?SlZOMmxLcnhkZG9OSy9jby8vbzBSN3hSWGhaY1lxS1hvSG5Mam1SMFFVNXQr?=
 =?utf-8?B?WTA3cWFJNlIwN1l0N2Q0aWNNZHdCR28zR05oNVkxVjlSRGczNDBkUnFiYUFE?=
 =?utf-8?B?YmRYSit5bnpzeDlhZm0vYVVMMW1sMmF2bDkwOFBzSWFPaTlyK0hjbnN4anJo?=
 =?utf-8?B?aGZJTWJ6RFc1cTBaWXRIcDVaNU5odHZXNXZlL25CNEFpVTlVKzJ3L1Z2QTNV?=
 =?utf-8?B?dXJRaWI3eUw0YTcwY3NWWFlvQm9JdHNVQnhEcS9BWU9ocWV1aUxNYXVvS3lm?=
 =?utf-8?B?R05GS3VmQXFHZjZLVWZkeCtBN00xb3VjMmYzQzk5eWpYZ29RMUNFaEhRdnNj?=
 =?utf-8?B?TlJMOVh2T1NzV3U5L2tQcHlPclVYZnY1OVVLai9yUnVMeUJyenBOT3AxS2py?=
 =?utf-8?B?RG9KYUZvdkt5Wjc1c1l6bmxkdEFnUVRzYmtlczhQZWZOOXdQTDVocWRvNkZk?=
 =?utf-8?B?dGEwQ2o0cmpySTNtNDRDMkZNQVNRQkIvcm5NMDdMc29EdDFpbEVxaU5OYWNw?=
 =?utf-8?B?eVRqY3pCdFdLRVFMYlkvZkhlRG5mb3JxVStqN1FvTlgyU3dpeWFVbFZRTzZ2?=
 =?utf-8?B?MnpZbDM0bTJNam5lcWxhTk5kcDZUTHY5QUJ6SlFkLzNFbmtKUWFpZW9lSHhC?=
 =?utf-8?B?YisvQlJRVlhhbzVOVFJ6WU5NWmRBN3M0QS9iUyt0alJBZU5WT20rSU0vc0lE?=
 =?utf-8?B?OTZCUzA3YWhEWUxTZVIzTlgvQm51Sk9GYkcyWTJ5Q1JrRUhWVUhuelovTU5w?=
 =?utf-8?B?cUdmQlR4aXR0RzZSZkxEVVVhNjZIK1FGN2tvOHRBTFc2MTVvdjlmRWxpRVNH?=
 =?utf-8?B?MTBrVERiN1RWMHJQZk01L1ZJbERkY01QRHlrdE9iN1Eyc2JhbC9CQzUwejFk?=
 =?utf-8?Q?h3RQ=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 546866d1-f5b7-4730-36d8-08dca6400e56
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2024 09:08:43.0846 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L1ZFwmgUAfamKiPKOGjvv1kb2uQ2vNP8PPkMl0zirUfDSSmcRQu3o2eW7fLw2Xbx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6791
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

--------------vLQZawfj6uH9bDVWTSp0jj20
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Well that approach was discussed before and seemed to be to complicated.

But I totally agree that the AMDGPU_GEM_CREATE_GFX12_DCC flag is a bad 
idea. This isn't anything userspace should need to specify in the first 
place.

All we need is a hardware workaround which kicks in all the time while 
pinning BOs for this specific hw generation and texture channel 
configuration.

Please remove the AMDGPU_GEM_CREATE_GFX12_DCC flag again if possible or 
specify why it is actually necessary?

Regards,
Christian.

Am 17.07.24 um 05:44 schrieb Marek Olšák:
> AMDGPU_GEM_CREATE_GFX12_DCC is set on 90% of all memory allocations, 
> and almost all of them are not displayable. Shouldn't we use a 
> different way to indicate that we need a non-power-of-two alignment, 
> such as looking at the alignment field directly?
>
> Marek
>
> On Tue, Jul 16, 2024, 11:45 Arunpravin Paneer Selvam 
> <Arunpravin.PaneerSelvam@amd.com> wrote:
>
>     Add address alignment support to the DCC VRAM buffers.
>
>     v2:
>       - adjust size based on the max_texture_channel_caches values
>         only for GFX12 DCC buffers.
>       - used AMDGPU_GEM_CREATE_GFX12_DCC flag to apply change only
>         for DCC buffers.
>       - roundup non power of two DCC buffer adjusted size to nearest
>         power of two number as the buddy allocator does not support non
>         power of two alignments. This applies only to the contiguous
>         DCC buffers.
>
>     v3:(Alex)
>       - rewrite the max texture channel caches comparison code in an
>         algorithmic way to determine the alignment size.
>
>     v4:(Alex)
>       - Move the logic from amdgpu_vram_mgr_dcc_alignment() to gmc_v12_0.c
>         and add a new gmc func callback for dcc alignment. If the callback
>         is non-NULL, call it to get the alignment, otherwise, use the
>     default.
>
>     v5:(Alex)
>       - Set the Alignment to a default value if the callback doesn't
>     exist.
>       - Add the callback to amdgpu_gmc_funcs.
>
>     v6:
>       - Fix checkpatch error reported by Intel CI.
>
>     Signed-off-by: Arunpravin Paneer Selvam
>     <Arunpravin.PaneerSelvam@amd.com>
>     Acked-by: Alex Deucher <alexander.deucher@amd.com>
>     Acked-by: Christian König <christian.koenig@amd.com>
>     Reviewed-by: Frank Min <Frank.Min@amd.com>
>     ---
>      drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h      |  6 ++++
>      drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 36
>     ++++++++++++++++++--
>      drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c       | 15 ++++++++
>      3 files changed, 55 insertions(+), 2 deletions(-)
>
>     diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h
>     b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h
>     index febca3130497..654d0548a3f8 100644
>     --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h
>     +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h
>     @@ -156,6 +156,8 @@ struct amdgpu_gmc_funcs {
>                                           uint64_t addr, uint64_t *flags);
>             /* get the amount of memory used by the vbios for pre-OS
>     console */
>             unsigned int (*get_vbios_fb_size)(struct amdgpu_device *adev);
>     +       /* get the DCC buffer alignment */
>     +       u64 (*get_dcc_alignment)(struct amdgpu_device *adev);
>
>             enum amdgpu_memory_partition (*query_mem_partition_mode)(
>                     struct amdgpu_device *adev);
>     @@ -363,6 +365,10 @@ struct amdgpu_gmc {
>     (adev)->gmc.gmc_funcs->override_vm_pte_flags             \
>                     ((adev), (vm), (addr), (pte_flags))
>      #define amdgpu_gmc_get_vbios_fb_size(adev)
>     (adev)->gmc.gmc_funcs->get_vbios_fb_size((adev))
>     +#define amdgpu_gmc_get_dcc_alignment(_adev) ({      \
>     +       typeof(_adev) (adev) = (_adev);      \
>     +  ((adev)->gmc.gmc_funcs->get_dcc_alignment((adev)));    \
>     +})
>
>      /**
>       * amdgpu_gmc_vram_full_visible - Check if full VRAM is visible
>     through the BAR
>     diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>     b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>     index f91cc149d06c..aa9dca12371c 100644
>     --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>     +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>     @@ -512,6 +512,16 @@ static int amdgpu_vram_mgr_new(struct
>     ttm_resource_manager *man,
>                     vres->flags |= DRM_BUDDY_RANGE_ALLOCATION;
>
>             remaining_size = (u64)vres->base.size;
>     +       if (bo->flags & AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS &&
>     +           bo->flags & AMDGPU_GEM_CREATE_GFX12_DCC) {
>     +               u64 adjust_size;
>     +
>     +               if (adev->gmc.gmc_funcs->get_dcc_alignment) {
>     +                       adjust_size =
>     amdgpu_gmc_get_dcc_alignment(adev);
>     +                       remaining_size =
>     roundup_pow_of_two(remaining_size + adjust_size);
>     +                       vres->flags |= DRM_BUDDY_TRIM_DISABLE;
>     +               }
>     +       }
>
>             mutex_lock(&mgr->lock);
>             while (remaining_size) {
>     @@ -521,8 +531,12 @@ static int amdgpu_vram_mgr_new(struct
>     ttm_resource_manager *man,
>                             min_block_size = mgr->default_page_size;
>
>                     size = remaining_size;
>     -               if ((size >= (u64)pages_per_block << PAGE_SHIFT) &&
>     -                   !(size & (((u64)pages_per_block << PAGE_SHIFT)
>     - 1)))
>     +
>     +               if (bo->flags & AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS &&
>     +                   bo->flags & AMDGPU_GEM_CREATE_GFX12_DCC)
>     +                       min_block_size = size;
>     +               else if ((size >= (u64)pages_per_block <<
>     PAGE_SHIFT) &&
>     +                        !(size & (((u64)pages_per_block <<
>     PAGE_SHIFT) - 1)))
>                             min_block_size = (u64)pages_per_block <<
>     PAGE_SHIFT;
>
>                     BUG_ON(min_block_size < mm->chunk_size);
>     @@ -553,6 +567,24 @@ static int amdgpu_vram_mgr_new(struct
>     ttm_resource_manager *man,
>             }
>             mutex_unlock(&mgr->lock);
>
>     +       if (bo->flags & AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS &&
>     +           bo->flags & AMDGPU_GEM_CREATE_GFX12_DCC) {
>     +               struct drm_buddy_block *dcc_block;
>     +               u64 dcc_start, alignment;
>     +
>     +               dcc_block =
>     amdgpu_vram_mgr_first_block(&vres->blocks);
>     +               dcc_start = amdgpu_vram_mgr_block_start(dcc_block);
>     +
>     +               if (adev->gmc.gmc_funcs->get_dcc_alignment) {
>     +                       alignment =
>     amdgpu_gmc_get_dcc_alignment(adev);
>     +                       /* Adjust the start address for DCC
>     buffers only */
>     +                       dcc_start = roundup(dcc_start, alignment);
>     +                       drm_buddy_block_trim(mm, &dcc_start,
>     + (u64)vres->base.size,
>     + &vres->blocks);
>     +               }
>     +       }
>     +
>             vres->base.start = 0;
>             size = max_t(u64, amdgpu_vram_mgr_blocks_size(&vres->blocks),
>                          vres->base.size);
>     diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
>     b/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
>     index fd3ac483760e..4259edcdec8a 100644
>     --- a/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
>     +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
>     @@ -542,6 +542,20 @@ static unsigned
>     gmc_v12_0_get_vbios_fb_size(struct amdgpu_device *adev)
>             return 0;
>      }
>
>     +static u64 gmc_v12_0_get_dcc_alignment(struct amdgpu_device *adev)
>     +{
>     +       u64 max_tex_channel_caches, alignment;
>     +
>     +       max_tex_channel_caches =
>     adev->gfx.config.max_texture_channel_caches;
>     +       if (is_power_of_2(max_tex_channel_caches))
>     +               alignment = (max_tex_channel_caches / SZ_4) *
>     max_tex_channel_caches;
>     +       else
>     +               alignment =
>     roundup_pow_of_two(max_tex_channel_caches) *
>     +                               max_tex_channel_caches;
>     +
>     +       return (u64)alignment * SZ_1K;
>     +}
>     +
>      static const struct amdgpu_gmc_funcs gmc_v12_0_gmc_funcs = {
>             .flush_gpu_tlb = gmc_v12_0_flush_gpu_tlb,
>             .flush_gpu_tlb_pasid = gmc_v12_0_flush_gpu_tlb_pasid,
>     @@ -551,6 +565,7 @@ static const struct amdgpu_gmc_funcs
>     gmc_v12_0_gmc_funcs = {
>             .get_vm_pde = gmc_v12_0_get_vm_pde,
>             .get_vm_pte = gmc_v12_0_get_vm_pte,
>             .get_vbios_fb_size = gmc_v12_0_get_vbios_fb_size,
>     +       .get_dcc_alignment = gmc_v12_0_get_dcc_alignment,
>      };
>
>      static void gmc_v12_0_set_gmc_funcs(struct amdgpu_device *adev)
>     -- 
>     2.25.1
>

--------------vLQZawfj6uH9bDVWTSp0jj20
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Well that approach was discussed before and seemed to be to
    complicated.<br>
    <br>
    But I totally agree that the AMDGPU_GEM_CREATE_GFX12_DCC flag is a
    bad idea. This isn't anything userspace should need to specify in
    the first place.<br>
    <br>
    All we need is a hardware workaround which kicks in all the time
    while pinning BOs for this specific hw generation and texture
    channel configuration.<br>
    <br>
    Please remove the AMDGPU_GEM_CREATE_GFX12_DCC flag again if possible
    or specify why it is actually necessary?<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <div class="moz-cite-prefix">Am 17.07.24 um 05:44 schrieb Marek
      Olšák:<br>
    </div>
    <blockquote type="cite" cite="mid:CAAxE2A6gpvLcq7zDhTDgV1BiBZdbK6t7147ESpq0ufYqW-6gzQ@mail.gmail.com">
      
      <div dir="auto">
        <div>AMDGPU_GEM_CREATE_GFX12_DCC is set on 90% of all memory
          allocations, and almost all of them are not displayable.
          Shouldn't we use a different way to indicate that we need a
          non-power-of-two alignment, such as looking at the alignment
          field directly?&nbsp;</div>
        <div dir="auto"><br>
        </div>
        <div dir="auto">Marek<br>
          <br>
          <div class="gmail_quote" dir="auto">
            <div dir="ltr" class="gmail_attr">On Tue, Jul 16, 2024,
              11:45 Arunpravin Paneer Selvam &lt;<a href="mailto:Arunpravin.PaneerSelvam@amd.com" moz-do-not-send="true" class="moz-txt-link-freetext">Arunpravin.PaneerSelvam@amd.com</a>&gt;
              wrote:<br>
            </div>
            <blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Add
              address alignment support to the DCC VRAM buffers.<br>
              <br>
              v2:<br>
              &nbsp; - adjust size based on the max_texture_channel_caches
              values<br>
              &nbsp; &nbsp; only for GFX12 DCC buffers.<br>
              &nbsp; - used AMDGPU_GEM_CREATE_GFX12_DCC flag to apply change
              only<br>
              &nbsp; &nbsp; for DCC buffers.<br>
              &nbsp; - roundup non power of two DCC buffer adjusted size to
              nearest<br>
              &nbsp; &nbsp; power of two number as the buddy allocator does not
              support non<br>
              &nbsp; &nbsp; power of two alignments. This applies only to the
              contiguous<br>
              &nbsp; &nbsp; DCC buffers.<br>
              <br>
              v3:(Alex)<br>
              &nbsp; - rewrite the max texture channel caches comparison code
              in an<br>
              &nbsp; &nbsp; algorithmic way to determine the alignment size.<br>
              <br>
              v4:(Alex)<br>
              &nbsp; - Move the logic from amdgpu_vram_mgr_dcc_alignment() to
              gmc_v12_0.c<br>
              &nbsp; &nbsp; and add a new gmc func callback for dcc alignment. If
              the callback<br>
              &nbsp; &nbsp; is non-NULL, call it to get the alignment, otherwise,
              use the default.<br>
              <br>
              v5:(Alex)<br>
              &nbsp; - Set the Alignment to a default value if the callback
              doesn't exist.<br>
              &nbsp; - Add the callback to amdgpu_gmc_funcs.<br>
              <br>
              v6:<br>
              &nbsp; - Fix checkpatch error reported by Intel CI.<br>
              <br>
              Signed-off-by: Arunpravin Paneer Selvam &lt;<a href="mailto:Arunpravin.PaneerSelvam@amd.com" target="_blank" rel="noreferrer" moz-do-not-send="true" class="moz-txt-link-freetext">Arunpravin.PaneerSelvam@amd.com</a>&gt;<br>
              Acked-by: Alex Deucher &lt;<a href="mailto:alexander.deucher@amd.com" target="_blank" rel="noreferrer" moz-do-not-send="true" class="moz-txt-link-freetext">alexander.deucher@amd.com</a>&gt;<br>
              Acked-by: Christian König &lt;<a href="mailto:christian.koenig@amd.com" target="_blank" rel="noreferrer" moz-do-not-send="true" class="moz-txt-link-freetext">christian.koenig@amd.com</a>&gt;<br>
              Reviewed-by: Frank Min &lt;<a href="mailto:Frank.Min@amd.com" target="_blank" rel="noreferrer" moz-do-not-send="true" class="moz-txt-link-freetext">Frank.Min@amd.com</a>&gt;<br>
              ---<br>
              &nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h&nbsp; &nbsp; &nbsp; |&nbsp; 6 ++++<br>
              &nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 36
              ++++++++++++++++++--<br>
              &nbsp;drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c&nbsp; &nbsp; &nbsp; &nbsp;| 15
              ++++++++<br>
              &nbsp;3 files changed, 55 insertions(+), 2 deletions(-)<br>
              <br>
              diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h
              b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h<br>
              index febca3130497..654d0548a3f8 100644<br>
              --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h<br>
              +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h<br>
              @@ -156,6 +156,8 @@ struct amdgpu_gmc_funcs {<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; uint64_t addr,
              uint64_t *flags);<br>
              &nbsp; &nbsp; &nbsp; &nbsp; /* get the amount of memory used by the vbios for
              pre-OS console */<br>
              &nbsp; &nbsp; &nbsp; &nbsp; unsigned int (*get_vbios_fb_size)(struct
              amdgpu_device *adev);<br>
              +&nbsp; &nbsp; &nbsp; &nbsp;/* get the DCC buffer alignment */<br>
              +&nbsp; &nbsp; &nbsp; &nbsp;u64 (*get_dcc_alignment)(struct amdgpu_device
              *adev);<br>
              <br>
              &nbsp; &nbsp; &nbsp; &nbsp; enum amdgpu_memory_partition
              (*query_mem_partition_mode)(<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; struct amdgpu_device *adev);<br>
              @@ -363,6 +365,10 @@ struct amdgpu_gmc {<br>
              &nbsp; &nbsp; &nbsp; &nbsp;
              (adev)-&gt;gmc.gmc_funcs-&gt;override_vm_pte_flags&nbsp; &nbsp; &nbsp; &nbsp;
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; \<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ((adev), (vm), (addr), (pte_flags))<br>
              &nbsp;#define amdgpu_gmc_get_vbios_fb_size(adev)
              (adev)-&gt;gmc.gmc_funcs-&gt;get_vbios_fb_size((adev))<br>
              +#define amdgpu_gmc_get_dcc_alignment(_adev) ({&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
              &nbsp; &nbsp; &nbsp;\<br>
              +&nbsp; &nbsp; &nbsp; &nbsp;typeof(_adev) (adev) = (_adev);&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
              &nbsp; &nbsp; &nbsp;\<br>
              +&nbsp; &nbsp; &nbsp;
              &nbsp;((adev)-&gt;gmc.gmc_funcs-&gt;get_dcc_alignment((adev)));&nbsp;
              &nbsp; &nbsp;\<br>
              +})<br>
              <br>
              &nbsp;/**<br>
              &nbsp; * amdgpu_gmc_vram_full_visible - Check if full VRAM is
              visible through the BAR<br>
              diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
              b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c<br>
              index f91cc149d06c..aa9dca12371c 100644<br>
              --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c<br>
              +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c<br>
              @@ -512,6 +512,16 @@ static int amdgpu_vram_mgr_new(struct
              ttm_resource_manager *man,<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; vres-&gt;flags |=
              DRM_BUDDY_RANGE_ALLOCATION;<br>
              <br>
              &nbsp; &nbsp; &nbsp; &nbsp; remaining_size = (u64)vres-&gt;base.size;<br>
              +&nbsp; &nbsp; &nbsp; &nbsp;if (bo-&gt;flags &amp;
              AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS &amp;&amp;<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;bo-&gt;flags &amp;
              AMDGPU_GEM_CREATE_GFX12_DCC) {<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;u64 adjust_size;<br>
              +<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if
              (adev-&gt;gmc.gmc_funcs-&gt;get_dcc_alignment) {<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;adjust_size =
              amdgpu_gmc_get_dcc_alignment(adev);<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;remaining_size =
              roundup_pow_of_two(remaining_size + adjust_size);<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;vres-&gt;flags |=
              DRM_BUDDY_TRIM_DISABLE;<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>
              +&nbsp; &nbsp; &nbsp; &nbsp;}<br>
              <br>
              &nbsp; &nbsp; &nbsp; &nbsp; mutex_lock(&amp;mgr-&gt;lock);<br>
              &nbsp; &nbsp; &nbsp; &nbsp; while (remaining_size) {<br>
              @@ -521,8 +531,12 @@ static int amdgpu_vram_mgr_new(struct
              ttm_resource_manager *man,<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; min_block_size =
              mgr-&gt;default_page_size;<br>
              <br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; size = remaining_size;<br>
              -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if ((size &gt;= (u64)pages_per_block
              &lt;&lt; PAGE_SHIFT) &amp;&amp;<br>
              -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;!(size &amp; (((u64)pages_per_block
              &lt;&lt; PAGE_SHIFT) - 1)))<br>
              +<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (bo-&gt;flags &amp;
              AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS &amp;&amp;<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;bo-&gt;flags &amp;
              AMDGPU_GEM_CREATE_GFX12_DCC)<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;min_block_size = size;<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;else if ((size &gt;= (u64)pages_per_block
              &lt;&lt; PAGE_SHIFT) &amp;&amp;<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; !(size &amp;
              (((u64)pages_per_block &lt;&lt; PAGE_SHIFT) - 1)))<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; min_block_size =
              (u64)pages_per_block &lt;&lt; PAGE_SHIFT;<br>
              <br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; BUG_ON(min_block_size &lt;
              mm-&gt;chunk_size);<br>
              @@ -553,6 +567,24 @@ static int amdgpu_vram_mgr_new(struct
              ttm_resource_manager *man,<br>
              &nbsp; &nbsp; &nbsp; &nbsp; }<br>
              &nbsp; &nbsp; &nbsp; &nbsp; mutex_unlock(&amp;mgr-&gt;lock);<br>
              <br>
              +&nbsp; &nbsp; &nbsp; &nbsp;if (bo-&gt;flags &amp;
              AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS &amp;&amp;<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;bo-&gt;flags &amp;
              AMDGPU_GEM_CREATE_GFX12_DCC) {<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;struct drm_buddy_block *dcc_block;<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;u64 dcc_start, alignment;<br>
              +<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;dcc_block =
              amdgpu_vram_mgr_first_block(&amp;vres-&gt;blocks);<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;dcc_start =
              amdgpu_vram_mgr_block_start(dcc_block);<br>
              +<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if
              (adev-&gt;gmc.gmc_funcs-&gt;get_dcc_alignment) {<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;alignment =
              amdgpu_gmc_get_dcc_alignment(adev);<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* Adjust the start address for
              DCC buffers only */<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;dcc_start = roundup(dcc_start,
              alignment);<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;drm_buddy_block_trim(mm,
              &amp;dcc_start,<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
              (u64)vres-&gt;base.size,<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
              &amp;vres-&gt;blocks);<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>
              +&nbsp; &nbsp; &nbsp; &nbsp;}<br>
              +<br>
              &nbsp; &nbsp; &nbsp; &nbsp; vres-&gt;base.start = 0;<br>
              &nbsp; &nbsp; &nbsp; &nbsp; size = max_t(u64,
              amdgpu_vram_mgr_blocks_size(&amp;vres-&gt;blocks),<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;vres-&gt;base.size);<br>
              diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
              b/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c<br>
              index fd3ac483760e..4259edcdec8a 100644<br>
              --- a/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c<br>
              +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c<br>
              @@ -542,6 +542,20 @@ static unsigned
              gmc_v12_0_get_vbios_fb_size(struct amdgpu_device *adev)<br>
              &nbsp; &nbsp; &nbsp; &nbsp; return 0;<br>
              &nbsp;}<br>
              <br>
              +static u64 gmc_v12_0_get_dcc_alignment(struct
              amdgpu_device *adev)<br>
              +{<br>
              +&nbsp; &nbsp; &nbsp; &nbsp;u64 max_tex_channel_caches, alignment;<br>
              +<br>
              +&nbsp; &nbsp; &nbsp; &nbsp;max_tex_channel_caches =
              adev-&gt;gfx.config.max_texture_channel_caches;<br>
              +&nbsp; &nbsp; &nbsp; &nbsp;if (is_power_of_2(max_tex_channel_caches))<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;alignment = (max_tex_channel_caches /
              SZ_4) * max_tex_channel_caches;<br>
              +&nbsp; &nbsp; &nbsp; &nbsp;else<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;alignment =
              roundup_pow_of_two(max_tex_channel_caches) *<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;max_tex_channel_caches;<br>
              +<br>
              +&nbsp; &nbsp; &nbsp; &nbsp;return (u64)alignment * SZ_1K;<br>
              +}<br>
              +<br>
              &nbsp;static const struct amdgpu_gmc_funcs gmc_v12_0_gmc_funcs
              = {<br>
              &nbsp; &nbsp; &nbsp; &nbsp; .flush_gpu_tlb = gmc_v12_0_flush_gpu_tlb,<br>
              &nbsp; &nbsp; &nbsp; &nbsp; .flush_gpu_tlb_pasid =
              gmc_v12_0_flush_gpu_tlb_pasid,<br>
              @@ -551,6 +565,7 @@ static const struct amdgpu_gmc_funcs
              gmc_v12_0_gmc_funcs = {<br>
              &nbsp; &nbsp; &nbsp; &nbsp; .get_vm_pde = gmc_v12_0_get_vm_pde,<br>
              &nbsp; &nbsp; &nbsp; &nbsp; .get_vm_pte = gmc_v12_0_get_vm_pte,<br>
              &nbsp; &nbsp; &nbsp; &nbsp; .get_vbios_fb_size = gmc_v12_0_get_vbios_fb_size,<br>
              +&nbsp; &nbsp; &nbsp; &nbsp;.get_dcc_alignment = gmc_v12_0_get_dcc_alignment,<br>
              &nbsp;};<br>
              <br>
              &nbsp;static void gmc_v12_0_set_gmc_funcs(struct amdgpu_device
              *adev)<br>
              -- <br>
              2.25.1<br>
              <br>
            </blockquote>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------vLQZawfj6uH9bDVWTSp0jj20--
