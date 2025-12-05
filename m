Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1396ACA960F
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 22:21:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D187E10EA03;
	Fri,  5 Dec 2025 21:21:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="f0LGo57l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013005.outbound.protection.outlook.com
 [40.93.196.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6051510EA03;
 Fri,  5 Dec 2025 21:21:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=psiQQLl/eZhcoL6Ku3n3eqJXN77edROitU02WkJ3hyYxCd0MvQD78gGeNz2m6TiPiuOArs056g6kvs/yfZ/zlznbrqDlRQ5t9QBOtvTBnc01gmhHIomZHwWftCcV0eeJCqn14EdtPpZdWoYg0KRInyCKtD79wi31DNUv53oXNY+Fv5lpIX3BDmFRE5aci3WSr3T6l9rr9PvwknBMqV/qsjQmY/br2S03FAKHvm8m5ShuRS4fpg76PRWH3hE6TlTDjV290QisEVbHKCUBZ2+nf2N1LLNrCc2EpzF2BjtdybKLg+tVzgF0AdyZGTKoEvt6zCvulLkjh/dzBHRdqANxwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kZgkgAA/wC2aEl63sg3t7evRo3Evu5vFs01dkpKVZDQ=;
 b=kVzVmDAbNi7NJgblgWXqrqRdbQyBnrCVBmRuI6Mgv54PXtqqSX/mIHVEQViMMVnAllApCaA+PByujH/PYZoR5cBiiPB8CBey00U1Zb++NKLxVka97kBSV41qOxWA5Yo7flUcvx+J+dpjchob1y/0h6zARTpnzSz4LdgZ9LGeHA8DH5sGgqUEQIQ/EdYdOWG7eXJwxKHWP3TfE/bxa7eyqiE3El0lVyqC4dCjonTIY9l39EJVrtD+sDWVKtcHG2JIiqTMovEjkUyomhQs0ZZvR625nah0uEnaOEYdqzRsJvCxPFCWsthxsyDH1kZuA7I8KiXn9VOY6p7J6osiGshD3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kZgkgAA/wC2aEl63sg3t7evRo3Evu5vFs01dkpKVZDQ=;
 b=f0LGo57luBnByxrzrA/DOScEg1lc8RnoHMJar9vFCL2lopO8tVK3MOPSVlQLM5CAYECiazA4if7cIUk+gUznEhzRePsV/JXuX8FmYMQZvcsneWc633pD3h9aQ5P7D6kGcJX8rQdTjmie54UZGtmIBh9JP9L7FuYcRtk3pfp7GhE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by DM4PR12MB6567.namprd12.prod.outlook.com (2603:10b6:8:8e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 21:21:26 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.20.9388.011; Fri, 5 Dec 2025
 21:21:26 +0000
Message-ID: <f9c72f9d-66d4-4533-931f-179267701dee@amd.com>
Date: Fri, 5 Dec 2025 14:21:24 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: amd: display: shrink struct members
To: Rosen Penev <rosenp@gmail.com>, dri-devel@lists.freedesktop.org
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "open list:AMD DISPLAY CORE" <amd-gfx@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20251108174047.7029-1-rosenp@gmail.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20251108174047.7029-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0011.namprd03.prod.outlook.com
 (2603:10b6:303:8f::16) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|DM4PR12MB6567:EE_
X-MS-Office365-Filtering-Correlation-Id: 818291a0-caf8-4d08-0857-08de34443f93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aTN0OURoS0szK0I4N1NFQklNNjdHL3NLbHNWZWZ6dDNsZG1FdFczSVAvQzNp?=
 =?utf-8?B?MTNGaTVhUVhBSU9OeHdOeEVENXFwbUVkQytYUmFSWERNNDd0NVVZc01aMk5I?=
 =?utf-8?B?a2xCZ3ZwNU5XMU1hbEpBd1Jpam04MTF4WWFFV2llZElMZVJ3V0lSU0lTdUkv?=
 =?utf-8?B?MmhJT001dWliNnQ4TzgyRWU5QTJQNDRUdHoycjY0YXlXbTVtUXdTUGMrazAw?=
 =?utf-8?B?djdqMlY4MjFwSFR2WnJWcGxZTUFwUDhFQmlSeEdtbmY3NDhKdDVVVWtFaEMx?=
 =?utf-8?B?dUlJUk5uV2lMNzdmazFidy9UU0VtTU9QUmp6bmN5K2NxUTY0TUx2NEd4U2Vq?=
 =?utf-8?B?MmRkcUltM1ZReGN4NVZuRWY0TUpVQUhYYXMzVVpSRlYrSTZ2OTRVUy85eVFC?=
 =?utf-8?B?V2JMUUJnelVTZTYwdEQ4K1VKTHRHdWx0aXFFb2o0NVU4UVJzUC9JeUNKbEZ0?=
 =?utf-8?B?VjJUeDIzSndUNE5ZUnlrbVIxb2Vkd2E0dGNhbVlmN2tnVVVFYzdhby9QYlZj?=
 =?utf-8?B?S1hITTRVVlBYMUh6U25rMmhNZUpCbThraW1xUU1uQ0RQZzBsYkNYS1hWYW80?=
 =?utf-8?B?ZUdCeDFzUTNCMUpQZEVBeUVxSUhVTGF6aE1OL0ZOc0dMbVJwUWFBU2pOb1hG?=
 =?utf-8?B?OVJWelZFQ2djd0pML3kzNXJsVFFLSTlWemNLRjdmYkZzMEFqdW9nNFVTaHVM?=
 =?utf-8?B?Q0VtZk9wUzVlMTEzU2hTMVlIWU43SjFjQ2FnUW9WMG1kL0FpaFJuRysyS3Ez?=
 =?utf-8?B?RWttNkxuV0F1U0M3OXZ2c0pqUE1qNlNyTDhodUt1RzhXVU9GK1FGNE9JYkpt?=
 =?utf-8?B?OHRHUWdtRlZqZllSUUIxY2U0YUVQMFI0VHB4bWtZYXlaR0ZrN1phV25YcTVu?=
 =?utf-8?B?cTNjS3VCYnFsRGVZU1F1cytXK1kvRisxbWlsUGRSeE9qdTRYTlZPOTI2MlZW?=
 =?utf-8?B?WU5DUnZzMEg0U3JEWmZLOXhqdktCMGU3RkNRVGVSMHRZamxpMWlmUzc3YjdL?=
 =?utf-8?B?aXNRTERza3RUelUzbGdkSldzSm1EQU5nRWl0THozQWo5T2k5V0kvZHhpd3F1?=
 =?utf-8?B?amREdVFvbUlMekM2UDVuek1VenJvRzZ6UGRGRW5aWU9xY0JZRjNMYnFxUG5n?=
 =?utf-8?B?ZHBkLzIwYzVjbUJLYXMxdEpCY0lTR0RsRmVxTVVYTHp1UWJuNnBtREtFWHV3?=
 =?utf-8?B?dTdsUGg3RURvd29vZC91aUJ5dG5hQTU3SndveVdydDdBYWRuaDZGR3Fhc01z?=
 =?utf-8?B?ZEY3eEF6cTRpazVQSzJYRThqT0dqcGNKSTNkVlRBay95NldVbE8yTU5uRkt0?=
 =?utf-8?B?ME91WVFNUWlRK3dzSG1XdC9sT0EwVExVTnNVQXA2eFBhQ2xzemdWMnhLRTJW?=
 =?utf-8?B?MGM1R2dvaERqUmEzUlVNdytsVGhTZ25LUkRteHZOV1U3NEtmZkZoNnltUTFr?=
 =?utf-8?B?Z2JmcjBpdjdzWlNwQnpoN0VNMXhCLzFqOWViNTV1OW14a2RsUHZqUGs4bTBm?=
 =?utf-8?B?Y2FvbHlXeDluU0tEeXVkQitITVNwTWpqbGpzcHE4RlhZZ0ZCRCtGV2NJZFN6?=
 =?utf-8?B?emNnZVk2YUNoZTJOMzRSZ0ZJejVNK1dTUnh4RTZPRmlITmszOWJLblo5Y3ox?=
 =?utf-8?B?RUdRNjJ2cFpsVHpFRUtCUm9SeXpMbUxjRFpTdGlRMThmVzJVT0o2SFZ5Mm1Q?=
 =?utf-8?B?RjNhVGljLzFlQ05Wa3NuUEZ3OGZ2OEVQVHZ0OGJOMUJYWEtWQnM4S0dadGs4?=
 =?utf-8?B?a0FQbWx3NVNNZzZUSVJSUHJOckpqVlBGSlQ3SVg1Q2M1MjdqVlE3ei94bTI2?=
 =?utf-8?B?djhERzB3OGF0RG0yMFlhRmJnQW0xakZxdG5QTVRkdStyRFVZQmRwV1VkTGdL?=
 =?utf-8?B?YkRXZTg1ZCt3enRNZ3pNK2I1TUdOZkcwbzJzcTlSREk2azN5QlJZQjVYUjdk?=
 =?utf-8?Q?6IKBErsMab9WsKzRlMS9QRu5aXp6APRX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUJFdEwwNnlmeVJYT3BtOWN5aGJGcjRGendyMGtWVzBFL2dNaDNmQjlDM09m?=
 =?utf-8?B?d2dqTHVMZnJzOEtNV3pJVWs3U3ppS0J4Nk9tWjdmdzBvYzZPZnRQNTJOeXNx?=
 =?utf-8?B?Mm5CbUtRc3Q2dGRQdXBnQ2NZNVFwZkZKRGtZYjBWWUZCNnhXV2J0RGNTWFkx?=
 =?utf-8?B?djN2OEYranl1S084ODVuclF4dmJvVDU4NUo3Sm9zclViNGVIczdNZG1ZV29l?=
 =?utf-8?B?dGgzSEhSWGNVbXBoRjRaaVVmWmVJNnhzZ3dtdEFGeUpmTVNzS3V5WTRmT0JI?=
 =?utf-8?B?Si9uNE4xcUZjbkgwNFcwNDFxNU1FNFJQcVBlQ0MrUlJqOHF3S1RWRGFEVGND?=
 =?utf-8?B?aUpZVzdZODlBVkhGUDRJdDl6MGFCcGczbG9PV2JGN1I5Q2QxQUxSTS9Gcm9V?=
 =?utf-8?B?bnJ0R2k4Rit0TzZFRjVWRUVFQjY4YjhXZWkveDU1NFRDam5yZzRyT0hBVElJ?=
 =?utf-8?B?QmhjbEsvNUJpQXd4Q1A2b1p1andHUEJwVmhLL1c5b3BCLzdJKy81eU4vRS8w?=
 =?utf-8?B?YzJwYS9EbWZSQldKQzZwd3J5VXBSUWRLeVdjdmxSYjlvM096a25DWUdqeVRj?=
 =?utf-8?B?aHlxTmRZTmRHTWhsRVVJRHFWczV0NVhBcm5vMnNDUjRLZUZRQklOU3ZUdzlL?=
 =?utf-8?B?MmxucmYxN2IrYllvQ0FxMkJvbStnckRua0xlMG4ya2ZOek9WcWtjTHhpWkZy?=
 =?utf-8?B?cWtrRTNLMGFxVFJWT2dRajhGanN3Y2hGV1JxTTlRUUx0MzMxS2ZOS3g3RkRt?=
 =?utf-8?B?NkI2K05jRWtCQ3B5YkhyS0c5bkwzU1dYdC84SzBPUFllcS9hYnNLRUJMOS9N?=
 =?utf-8?B?K3dkMWwyZ3lZNFRkZXczdEFJRUJ5UzJxbGdibnFhMmE3cGd6QUMwR2tnNEtT?=
 =?utf-8?B?TnhPSkdtdmZNYnRGcEVoQitUNVdzOG10OGRxa3lwVG1EcjY0Qlg3TW9iMUli?=
 =?utf-8?B?NU1zbUxURERLWk1seDdqRVozOXFONWFKSVNBTFNqZ0tRZ0x3N0JiVzBrcUFn?=
 =?utf-8?B?d0ZQMGplNEN6bWlEMWROSmxjb1JhVThLY29rblQ4SlZvWFY2VXErcG9QT0t6?=
 =?utf-8?B?bjZhWUpTZEc3VGRsWXcyNjV3cXNPNmtGSGZtdy9PZlVlYzY1UlhONG4relVQ?=
 =?utf-8?B?VUg3TUZtd3R4VTU3bStqL29BVllIbXJpSzFsYlJaU2QwWWFMUldwK0VOVWtS?=
 =?utf-8?B?cmdBUEY5L2x3NXFLU0VvQ1ZGTHV2WW9xVUJlZG4wdjNUNWN0RkNhZklSUjJI?=
 =?utf-8?B?ZUFnU0lmVjh2ZkdRTllSTE11M2ZBWVBxekNPdzh6cU5tb3Z0S1NZbVpqMFl0?=
 =?utf-8?B?aE9DbU1EK3FLNWdiMnBUcjg1MUIrODVuenNyd0poOUN5MkhjdE1maHRTbWhq?=
 =?utf-8?B?U0lGeDhvSm0zSGVyN1ptT3hpVDJlTDBUMmhxWHJlUEJPWTZFQmxvV3NueFZj?=
 =?utf-8?B?NGpHWCtVVWlqczBUcTZCWFdzdEp1dFduV2NHLy9xeGtIcEdHUzd4ZFZMdDNG?=
 =?utf-8?B?eW0rT3JISnI5N2NJSW9hTll5Z3VnSzNJajQ3MVBBMjRPQ0lSRi9qS1BmWFdT?=
 =?utf-8?B?UExYN0JXTFhJcThjVG9OS3NzcnBFVzFoSUo1cEg5L0NtV3g3RzIvOFZBeW5Y?=
 =?utf-8?B?WG9BMFdxNGZ5VEJrZlBWY3RuSitHR3h1cE10dzhoNmdyL0lhcys3Q1hHQjRm?=
 =?utf-8?B?ZkprVXZFa0lTT1JMVklSU2p0VXhSRVNpWVYwU3o5VFZlSjEwdE5WVWxQejVO?=
 =?utf-8?B?K0RTa2FHbUJiTVBZUWhWbkNVcXUxMXkwMERXWXEyY2l4d3BzZzNENDVKT096?=
 =?utf-8?B?MmdhRjRxeDRUM2cvYmN1OFFyWnZGRkZIbHVPbU1tMFZicGtLb3M3Wk1sYVRU?=
 =?utf-8?B?M2hNNE1IYlNZR0RUbm9qQ2xzUE5wMDYvSWZqenU2OExYaGVId2ZuWktQcE9Y?=
 =?utf-8?B?MkRNV0xXc200eDM3RjZVQzMrdUM3TzBCc2pzMGpsaEtTVkZEV3dMUmV0My8z?=
 =?utf-8?B?aTVPMTJ0YjRIWm44U2lLSW8ra2ZRM1RETkdsRytmUnJpZjdkeHhZT0RaZHBi?=
 =?utf-8?B?NENTN0pTTzdUZVJoSDlSZWt6VnF6cEtNYlVoQUxiUTRleDRKaTZ5Rmt0eEFG?=
 =?utf-8?Q?kmD75OTsvCp2aDrMoUQywR4y3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 818291a0-caf8-4d08-0857-08de34443f93
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 21:21:26.3977 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IVfHAlvc5XnGkzjraQKSc+d8n8QX8rRAczmebL3bDOpRD2Bs1JHZ9I/2tE3Dwk4kpN+f7pYKbnN9jnL5r7Yvyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6567
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

This patch pass this week's promotion test.

Reviewed-by: Alex Hung <alex.hung@amd.com>

On 11/8/25 10:40, Rosen Penev wrote:
> On a 32-bit ARM system, the audio_decoder struct ends up being too large
> for dp_retrain_link_dp_test.
> 
> link_dp_cts.c:157:1: error: the frame size of 1328 bytes is larger than
> 1280 bytes [-Werror=frame-larger-than=]
> 
> This is mitigated by shrinking the members of the struct and avoids
> having to deal with dynamic allocation.
> 
> feed_back_divider is assigned but otherwise unused. Remove both.
> 
> pixel_repetition looks like it should be a bool since it's only ever
> assigned to 1. But there are checks for 2 and 4. Reduce to uint8_t.
> 
> Remove ss_percentage_divider. Unused.
> 
> Shrink refresh_rate as it gets assigned to at most a 3 digit integer
> value.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>   .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c    |  3 ---
>   drivers/gpu/drm/amd/display/include/audio_types.h    | 12 +++++-------
>   2 files changed, 5 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c
> index 3005115c8505..852c117fe5b6 100644
> --- a/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c
> +++ b/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c
> @@ -1480,9 +1480,6 @@ void build_audio_output(
>   						state->clk_mgr);
>   	}
>   
> -	audio_output->pll_info.feed_back_divider =
> -			pipe_ctx->pll_settings.feedback_divider;
> -
>   	audio_output->pll_info.dto_source =
>   		translate_to_dto_source(
>   			pipe_ctx->stream_res.tg->inst + 1);
> diff --git a/drivers/gpu/drm/amd/display/include/audio_types.h b/drivers/gpu/drm/amd/display/include/audio_types.h
> index e4a26143f14c..6699ad4fa825 100644
> --- a/drivers/gpu/drm/amd/display/include/audio_types.h
> +++ b/drivers/gpu/drm/amd/display/include/audio_types.h
> @@ -47,15 +47,15 @@ struct audio_crtc_info {
>   	uint32_t h_total;
>   	uint32_t h_active;
>   	uint32_t v_active;
> -	uint32_t pixel_repetition;
>   	uint32_t requested_pixel_clock_100Hz; /* in 100Hz */
>   	uint32_t calculated_pixel_clock_100Hz; /* in 100Hz */
> -	uint32_t refresh_rate;
> +	uint32_t dsc_bits_per_pixel;
> +	uint32_t dsc_num_slices;
>   	enum dc_color_depth color_depth;
>   	enum dc_pixel_encoding pixel_encoding;
> +	uint16_t refresh_rate;
> +	uint8_t pixel_repetition;
>   	bool interlaced;
> -	uint32_t dsc_bits_per_pixel;
> -	uint32_t dsc_num_slices;
>   };
>   struct azalia_clock_info {
>   	uint32_t pixel_clock_in_10khz;
> @@ -78,11 +78,9 @@ enum audio_dto_source {
>   
>   struct audio_pll_info {
>   	uint32_t audio_dto_source_clock_in_khz;
> -	uint32_t feed_back_divider;
> +	uint32_t ss_percentage;
>   	enum audio_dto_source dto_source;
>   	bool ss_enabled;
> -	uint32_t ss_percentage;
> -	uint32_t ss_percentage_divider;
>   };
>   
>   struct audio_channel_associate_info {

