Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C5F931CBC
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 23:46:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F9EA10E3C7;
	Mon, 15 Jul 2024 21:46:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="H/qg1onK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2059.outbound.protection.outlook.com [40.107.236.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4DE910E2DE;
 Mon, 15 Jul 2024 21:46:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gGyPa+3EmDx0KQKBeIMg8sekIEcs/K4iDd00F7xEwxTn3FMW8xY5RP6q9yhq3OpNXluIjQHj+q8BLULvjoTvMLGht5PoaSqJHP99V/n2TudWOniA3o4MIyiopaxlB22FWOkjq2cmnLpYFXKGjxweMnML7GY3eP7FSTzMjGRKduN8mCaAN46YdUZW/D0gdjH7hfGbJ1J/SCvPIHq3NzvnsKmH9x/lDiZzUZUKV9h6BALeOgTqYrxmyCsR+XYD9vZXbsep2DLwvtl4wKcU7z5FkdLuO5MlXBGTIM9TewFUt+9DuAsJGu3C6pAZC1DwP4kv2upxyDIGl/DrEyXziOU30A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lVpN4SAmuH536ydQnX5dyYIgSqULJwF6WqXxr/cMvfo=;
 b=htNhPAJxe7g9xj5LwT+J4CKqnHgtOiRWrM9LjQyOZfdwYZ2Tfbdqn0soJ2+f2YUv8hOTuo+rqwLQVKPo0RdUBR0VKzv9E5DQAuK6xl7YX01zgOdtsprNXsgHaarqPGf5miNH9sEoHW8C1Pz87zQlqr5Y04Anu4dgUYUrbTsIfpHvtFWYa63fACWC0IyPgIeoKAg4MG6PpBqjC9PohGtFARobFza/7Yp42wdPpvMqJkhlwBqMZqkkJQcfFCRFzBWq32jr3BP9auZ0GuPoRhULwNBJbM78B/YQ4xyPB0ei5DF7C0AZkX1w0Z3MHIZaDrp2J1puyTZE00O/C1sW4l+20Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lVpN4SAmuH536ydQnX5dyYIgSqULJwF6WqXxr/cMvfo=;
 b=H/qg1onKS3M7QoJ6YGi45in9owmPKxS9ao6ujc7FwH41Zb1cCIHPnPLzr/ig1kPyUhDisANguvyXmdxTFAzoNMrZpDmTwvqnpvrx45vVr9XUehRU7V4EgsNLqNDA7insClPgC46XY7nI1fZQhchX7ry5wuFzMAk3c77f7ugqbvM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH0PR12MB5284.namprd12.prod.outlook.com (2603:10b6:610:d7::13)
 by CYYPR12MB8732.namprd12.prod.outlook.com (2603:10b6:930:c8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Mon, 15 Jul
 2024 21:46:40 +0000
Received: from CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::8060:1b11:e9f3:3a51]) by CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::8060:1b11:e9f3:3a51%5]) with mapi id 15.20.7762.027; Mon, 15 Jul 2024
 21:46:40 +0000
Message-ID: <fb2b106e-aa51-4108-9d61-ba71935fba00@amd.com>
Date: Mon, 15 Jul 2024 17:46:38 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: Fix documentation warning for read_mpcc_state in
 mpc.h
To: Abhishek Tamboli <abhishektamboli9@gmail.com>, airlied@gmail.com,
 daniel@ffwll.ch, harry.wentland@amd.com, sunpeng.li@amd.com,
 Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 rbmarliere@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org
References: <20240712174510.70467-1-abhishektamboli9@gmail.com>
Content-Language: en-US
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
In-Reply-To: <20240712174510.70467-1-abhishektamboli9@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0174.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:110::18) To CH0PR12MB5284.namprd12.prod.outlook.com
 (2603:10b6:610:d7::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR12MB5284:EE_|CYYPR12MB8732:EE_
X-MS-Office365-Filtering-Correlation-Id: 0eb5c013-040d-4afe-11da-08dca5179c3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a1YwaUhiSXRPMmxvNFdqSzl3OUw3SnVlcFdMdXF0QzgxS1pPMlVpQVdOYVg4?=
 =?utf-8?B?Q1pLMDZKSW1sZ3JKUXpsNUVYdkdDZUc5QXFLTVZLUTFFaFhDN1k3ZDRQNXNL?=
 =?utf-8?B?ZGZuVUhjMG1XcEdBekd0VVU4a21ucVJTY0pRWk9pazNyT3FJVTJmK1l6aUlN?=
 =?utf-8?B?TTlEYlVkWUpxME1oN0VyZlNEL2pBVkprTFM4YXdsdGlvQlBoZDlUMmRkaFJ3?=
 =?utf-8?B?NVJkYktJMjN0YWx4QkMrUDN0Rkt2N0tpVU9pc1ZHM3Npb0VvVTYvWllicHFq?=
 =?utf-8?B?NGpwSnVtS09XQlFla2pQL000R0poUEhKeE9EUk9KR0hnS3FGUHNIWmRKcmh6?=
 =?utf-8?B?VVJqRmcwLzNTTFN6V1V5Q2hyWVd0aG9SbzNLQTNHOSs2NVRvbFlSV2p3SUVK?=
 =?utf-8?B?K1hycThIMTlPbG13eTdQUkZPYnNGTXRzeFN0V2VxdXFTdnhPM2dCY1ViNnpL?=
 =?utf-8?B?WWRPOUFCdjJDdVA3NnVNK3MyaG53TXJpOGd5cEJWcVRzWlhPS0poYmhvWUNB?=
 =?utf-8?B?WEJraTYxWm9tS1JrVDdBdWpNMFprbEM2VG03N1VBbEdwc1VIeUs5RnQvUXpq?=
 =?utf-8?B?WlNNVkdiV1ZmV3drbmozVGFEaGhDQkxyNFluS3kyNWNNU05CUkNrWkJrOHVq?=
 =?utf-8?B?NnEwTmNiS0hxek53aGNySGNkOHBUTkdKdmxiR2tLOVJWUHNGbkdheFRtVnZ6?=
 =?utf-8?B?QzV5OGpqZHdLMDVmN0owOE53ak5xcDZVZ25wU05XVmErVEk0YnJhc1BlWlZ1?=
 =?utf-8?B?QUJqNCt1bWo5aDVOdXNsMkh0VGVDK1JVL1ZWenhuNGhXYWcyTVk1b1AwVVhl?=
 =?utf-8?B?VnNYaDgrc0RFeXJONmQyRWIzcXdtSGVuRDhFTmh1WW4xNTNLRHpYb040c0tJ?=
 =?utf-8?B?MHE2OWdkdTVJRGtyWVBLb3pzU1ByVFBVNW9UWG9KTU9UcldVdTFpdHhrRHZL?=
 =?utf-8?B?d2p2SktqalJRNWtlcEdtQ3k2M084cDdZZjJWbCtDSjU5MzFRSkRNeDFxK24v?=
 =?utf-8?B?NDJJR2tZeFVlc0g0Q1d5RnNSellMMVBZc0R6ekJJdVJ0YUh3bTY5YTJBbUo2?=
 =?utf-8?B?dTdoZjJNTUtidG9JN2xzNkt4bUdlVmZnUjU0Q1pXaEZLTGplUk1yV0VLaGtW?=
 =?utf-8?B?WmVDWTl2S29Na3U1bWF3YllOYkM2c0srQ0Rxb0JyR0UrREx5SjdBZUh2SXFL?=
 =?utf-8?B?WUt3S212Z3hndWd0eEJKWXJ1c1FNUExNVGYweDM5MFM5S3pEKzZRS2RkcndK?=
 =?utf-8?B?K3NFTjNOQlFVN0Y3akk5dkgySUpyb2JxcnFJSXg0aGh5dW5lQWxwNUVNWUdJ?=
 =?utf-8?B?S3A5U3p0NFhaYlBoL0dsVU9uREdJVlpRWE96eUpVaFE3aDhFd0lFa2IvSDZC?=
 =?utf-8?B?dFMyR1VOQ2JxQ2pEd29mZUJpbmxaOExBUnAxajFLeDVtT2lEd0xMVHF2Y3hL?=
 =?utf-8?B?Nm52RllaT1FFQ0NhMmdsRm1pcVVMYi9yb3lHOXdhYU83c2ZlSStMS1lUci9j?=
 =?utf-8?B?RTlGbFBRVHRGVFdrZGxrYzNkYUxmciszWWVGcS9XUEZuNVZlK09zYnQwSk0y?=
 =?utf-8?B?ejdvL3kybjFnSTZvc1g0cVlxcm0zbWN4VFVHSjhHK0I2ZlhaeDlZaUNYcnAw?=
 =?utf-8?B?NGl0K1RDdDhjV0NFbXZuNlpHT21XT1FwWVBlQXNmd3U2anpiS3M0VGZjYjFM?=
 =?utf-8?B?bk1rczU1dGV5RGs0YUZxbTl1aUpnMCt1NFBkdFJiQ3Jva1dXS3ZVZkpQdUJV?=
 =?utf-8?B?U1pSWTZaZi9wM284ckFyRFF0VFJLZTZ3K2EyZEJEQm5MbG1IRjdkMFRzc0Fl?=
 =?utf-8?B?N1ZrUDRYZkRBdXN2dWNUUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5284.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1dkK292WFU5UG5PK1paSTJYV0dVQnhHMzh6S0hpK0wxai9qeHppVlNIdzNq?=
 =?utf-8?B?WWJpbWhlR3ZOcmJrK05RMkcxaW16RDR3NjJvOWxXSVFLNlppREZPZ0pIRThT?=
 =?utf-8?B?ZG1iZENGYWJhU1FOakpKRmo3Q092Wm40S2RkQ244V0xubUtieksvdER3VTBp?=
 =?utf-8?B?RkJqVHZoVi8wdXhHbnVJZlo2YmJ3Z00vcklGazZLUzVnOFJiTDB5TGNXcWJ3?=
 =?utf-8?B?S0NVaUNMTFRlemdPREZhc0dCVThiL0p1RFpUOVVETkVFY1VwVndoRVJ5NUxZ?=
 =?utf-8?B?WDFQMlVPS0tNSnBCbzBNakcwbkQ2bDRWVlRzcmZVZmtHQnZ5RVo1Y2FmREpv?=
 =?utf-8?B?Y0FpdVJsNXorM3V2dFBtMDVxRUdJZTlRRTd1K3lQWmc1V3hhcDB2d0E0TTZy?=
 =?utf-8?B?bEh5L3BuQk9SaXhiV0V0b1ZranBub05TQ2lxQVNqbHlXVThHOGo5ODFZQmFp?=
 =?utf-8?B?NVhmZHRyVXh1U21Rc3FqMjVHQ25XSkl0TkEvNk1HZVVQZkhyN1VlY1ZDazN4?=
 =?utf-8?B?UVV4TTB2V2Nsa2JOZmNuVFJUdnAzN0IrTUtsU2tqY3RjRHMrTTVCaDlzeUl6?=
 =?utf-8?B?bmUyOVd0OWZtd3JDSGlnV0k5bXZFaVRMWlcyNjRxUjZxTEpoWE00aS9JN3ll?=
 =?utf-8?B?Yk8wcG9vZmtaRGpYUVVKb0ZVSWtDOEZVakRNaW9kMmgvMlUrTmdOOTRhUDIv?=
 =?utf-8?B?cVBIdHU1VWVLVDBLc1B4Y0ttQ01MMnB4TWNyeFhPMTdKY1VncGpEcXd5SE0x?=
 =?utf-8?B?TXBIb2FlVzhSSnd0RXVoUGhSYkVVUE9GWmQvaFlteTBOT01YMk5meUFrTzJR?=
 =?utf-8?B?d3BOQ0pWandmTjdpOFNwaEx3YlpIZGl5dUdvOW5ITnFNMng2aXk3czY3ZGIx?=
 =?utf-8?B?enZiU2VCTlhycEQxOVhxVThGczBucURsOWZuQVpRMngwYzJ4VllZSmN6eUFs?=
 =?utf-8?B?a2dOa0RidFVDSVVDQWlDQTJUY2lvRG9nWjcxUGJzQ2g2VmI4Q0dNNkNDcjFm?=
 =?utf-8?B?THB5cTVubG52dnhVVVAxa1VQeDhBK0ZMeTBoTVFTY3dMR1hjK2lONFFBVW1G?=
 =?utf-8?B?VmxyRUZ5RG9NNVJvYnJGZFJvVWFIVTlLRXh3MDN2L01GcVZXeEZkbS9GOGpy?=
 =?utf-8?B?VlIzT3FNdEV1WExJNGFyVjFqNHJQaDFnVm81a3FocEJJTGFJeXlFQXBOUzl1?=
 =?utf-8?B?K1hENU1SaDh4RmZwcEk5Kzgycyt0MHgxR3ZUTE5hTHVwT3E5K0JFb3ZUUTlT?=
 =?utf-8?B?dWxWUkNOV1ZHTFB5eHRaZ29wZ1AySmg3Smh1NStNTGJBREtoVnFnQlN1ZTlx?=
 =?utf-8?B?SWJaT0NjRHNwRXNXYjBTZTFRVm1xRkVzdG1hU0d4L2hxSFJKQWVNWkRzMkNq?=
 =?utf-8?B?UFUycE0zOHlOM0RadWxSekdwWktKYlZhVTN4SGVlVDRrUTkrMFN6VG9mcmJJ?=
 =?utf-8?B?bjFZd0VybnZkYjgwRk05OUVWcFpZaW0vYnBPaXVyQTVXZWlTTWd1VGdKcmVD?=
 =?utf-8?B?R0pzY1RQdkI4RFQrUzkrTHF5VXI0YzNpcWc1V1pzYUxtcU5ZWFVRUmRMLzBB?=
 =?utf-8?B?YXYxUDM5Mk1vZzN1MDlyRkFiRjhPT2JxOUpVT2Vjd2k3aEU4ckVSYXhRcEc0?=
 =?utf-8?B?ZnBvSE1kRmFOVjc1MjNlRUk1eDN6VWZ3cm44c09aZ1BBUmN0VDVEcE55aGQw?=
 =?utf-8?B?bWo5ZmJtQS9QdHVpSjRXNUpxL1BNZkd3aUl5WUxoU3puWVU1TEFtUG1tSmVp?=
 =?utf-8?B?cjFWWTg5Vmd3ZzhEZk9oZmpIeDhyTlBobTh6THhZR1NoWVJGVXFSdHdyd0dK?=
 =?utf-8?B?Q29mbHBoZ1VjWUNLWmxPRUhwOFZkWU1kdCt5K005Z3dPZkdxcFR4aXd3dUt2?=
 =?utf-8?B?L3h0NlBPcTM4YTB4dC83Z2d3USttSDAyTUhOSzdCeGJWcVAvTjNldytZb29q?=
 =?utf-8?B?SVNKdzROWXROUlBPTjlBWERJc2d0KzlHdk5DMmNkZ1JSWERoOFlKNFYwY01O?=
 =?utf-8?B?elR2N3hvM0M0dnlTcGwzbkQ2MGNHMktwMEV1U2E1d1ZaNmJGMzdMc2ZKenhn?=
 =?utf-8?B?TkNEYWlRQXBzMjA3YjhIL2ZDQUorbml3bHNDRWtQSG9oam1uUG1CWWlqdXRm?=
 =?utf-8?Q?+QXKylLUvU8m0vgI+R2uTC8Wc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eb5c013-040d-4afe-11da-08dca5179c3f
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5284.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2024 21:46:40.5186 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yca8LSxnh6y2hN7Mev/jtdrAYIgoHrVoiGGO77aMhnXeus/ER+7NrvZe6QHRF5B+8tvN2CJkgwBUuwn5LVoi0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8732
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



On 7/12/24 1:45 PM, Abhishek Tamboli wrote:
> Add detail description for the read_mpcc_state function in the
> mpc_funcs struct to resolve the documentation warning.
> 
> A kernel-doc warning was addressed:
> ./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:547: warning:
> Function parameter or struct member 'read_mpcc_state' not
> described in 'mpc_funcs'.
> 
> Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
> ---
>   drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h b/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
> index 34a398f23fc6..9e65ecf1d3b0 100644
> --- a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
> +++ b/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
> @@ -282,6 +282,22 @@ struct mpcc_state {
>    * struct mpc_funcs - funcs
>    */
>   struct mpc_funcs {
> +	/**
> +	 * @read_mpcc_state:
> +	 *
> +	 * Reads the state of a given MPCC instance.
> +	 *
> +	 * Parameters:
> +	 *
> +	 * - [in/out] mpc - MPC context.
> +	 * - [in] mpcc_inst - MPCC Instance whose state is to be read.
> +	 * - [out] mpcc_state - MPCC state structure where the state
> +	 *                    of the MPCC instance will be stored.
> +	 *
> +	 * Return:
> +	 *
> +	 * void
> +	 */
>   	void (*read_mpcc_state)(
>   			struct mpc *mpc,
>   			int mpcc_inst,

Looks like fix for this has been already merged via a195f08636f9d7 
drm/amd/display: fix documentation warnings for mpc.h

--

Thanks & Regards,
Aurabindo Pillai
