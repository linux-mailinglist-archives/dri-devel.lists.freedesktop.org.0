Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKNYEyqgp2nTigAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 03:59:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 701721FA24B
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 03:59:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A667C10E93A;
	Wed,  4 Mar 2026 02:59:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="nsA+XHnw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013055.outbound.protection.outlook.com
 [40.107.201.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58A2E10E939
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 02:59:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sog6f1hjkE3FKZR6obvQp9DT8CaCNKDpT/11+SuW0TWqBkNwk3cpTeNTr48rVI7XB9KJtsP+dJonfweSa6K+7XOiSy1o1gTPJBBhKglGC/u4Gkt4xPpgivt/wQGQN6eJIFD+K0W+8OruH7Q7WG+u0aL3U6GOVO/3x66ECpDGpJoAvn7zzQYrzpjiWieHjI+y189fzZgg1y4Aa/vPYlocqeC2V94eigLBtx8EKMaqxR4V/SKfnESZ9/Pa7chpJE/R7ya3CHKQO0n9kgmjHflVx5EDGWcuaGam6w1PjL0zWdeFCVtSBtqp57+v7O++KAK97ghwCIlfMS3UYkdjZNtKPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HS5kS800H8DaIKevz+ZAg/34dTSOlniRxtAJWlF3NGw=;
 b=l9siGKvHZNv4LElS1o7roLI2lSZj6PXd2XHZUZRB35Gx3HRbsazsvn2sdxoXdNzoaHlpAgwN5WrZrC/8Q0tsX87MIw9+FQQUHY9XV79S76v49b2cTa7xSzwjAAYSvnGH350oviToVBFxYEd0FNGqxwaRFJNEMvzB3FjW4nzXSSpM+uLrXaRWaBPRFGkErTr6cpyd99osPzExKfy4mKfCAJm/2hC5FOh6C3PQ+hqZRo+P2UO5c51KCKC8yybBKRSPyNnLSAzd8urugx0QyL3BsJrBZkRThDmeM40xoBZVqeak2wDehL9vPCpjQ9gD3dFZNylj4tcQ38M4XKdeGFpd7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HS5kS800H8DaIKevz+ZAg/34dTSOlniRxtAJWlF3NGw=;
 b=nsA+XHnwm/fN0ni7x7gkC0ZWqb94sIYAgW/n1lw84J6GtZqmZ/flkNcKoMfzZf6wv3kRj4EhsBbtUQWHzKHKA0jsKgpoxC1wf82hc90gpZITgm2TGMRnhDR12a8BEq0nQzGP1fY9FNiNhjuNggHGZiMbMqfvvFEV5XYAUi/84/hExQgMqMuue0Qy/O+tzvvuCZzMoRkZWXnKwrfWBRWIYN3ka9F6DVxseQItPsqLWl0SwuzMJ8wg3VfNYD8gZ1xfySW3jrELIHbD0bt/PJNzzPxs2TjYbz4Kn8Egx5Jiv8xAv3E8lok5dWKsdOCwhERnVvqCPVecd9xNeToXD76LoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by CH3PR12MB8581.namprd12.prod.outlook.com (2603:10b6:610:15d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 02:59:45 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%4]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 02:59:45 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: dri-devel@lists.freedesktop.org, Randy Dunlap <rdunlap@infradead.org>
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v2] drm/tegra: tegra_drm.h: fix all uapi kernel-doc
 warnings
Date: Wed, 04 Mar 2026 11:59:41 +0900
Message-ID: <5144736.e9J7NaK4W3@senjougahara>
In-Reply-To: <20260304014152.482104-1-rdunlap@infradead.org>
References: <20260304014152.482104-1-rdunlap@infradead.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TY4PR01CA0116.jpnprd01.prod.outlook.com
 (2603:1096:405:379::16) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|CH3PR12MB8581:EE_
X-MS-Office365-Filtering-Correlation-Id: 9067efc2-6182-4e4c-11dd-08de799a16e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|366016|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: hcEmdURDYZLp+BnVj/6i/3SEX7YguBVfCPA/kUL9SwrP8zlktjHapD9SuxuXFtFvk5Awp3WQF1tzd2Qc+sGG3ckTwgLPQJLB9CfnKwHtUcycAX+9/iAopc0UeuqRydASk7OCD2Zhf8MPfFrGHzY3dezYGi32FDKVHUouxvlz7oYnw0STN1qloYkeozGJytcG1prYxIBsQSJsuw9j6Argr8yCchND7Om1d8Jv6CcS8/IL1uFNkw8ppR+I5d7B1OJYuBzZXq/Gxketz6QtXm7fQmS/ZPeBq3bvRlMwnrLV1iEHXxO7LlNwDx2UoX1cOdSrVmDM9WnoTgYQujHXIE+jFBvErkhY2vDhjUyxMEDI3poQ1sBO4aeu341/9YOQfkuFbLIh5Kfk4nlMO1VFIfas/0O4V9fmBxaA1BumwtRKU5LF8WMOzzr2y1Ujurpp+j6u1ts5iIZzzMFu/JXLPlzM+SxEGa0XwvNI0vdQvULpvj+ppIMXbq8PKU+plKpZJa2usl9mRf83P73QkeSXRdIwMQNA5TO7tiTjAyVicNTOqmd7fj96vUbML4okzoHh+lSacBM9RhiAM1r3wovlYAzeH+AC+jyYOb4ZbJ+1LZ6CUMlgzGmFer0gQ6MnMXc/IYqGVE/lnfJeXIlUkGN85rpWwNUaTjbEU+Re05rr9wMzJ9WSzxo1ti8IcdweedQflswlK6T86lYu4rtBHQ//oR79lTFyXaCa6rA+9UDXZEBz/TU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB9161.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(10070799003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1RMVTVESTlDNlNvb3RuTk9VNzNRTUZtMGZzdkx6RVExUDlJVDhvU2RFcUdR?=
 =?utf-8?B?bGxwVnJKaEVwY2VLbWNwbC9iSzcxR2pZUDAyM3RsSWx3alhwemhTbWlzTWow?=
 =?utf-8?B?M1d2TEUzamtDaW1pT0w1VlMyNS9hMEJqdWNBYmMrNW81TEFLNk1uWjVrZ2Va?=
 =?utf-8?B?dkoxTDdGem14QkxuTDZYRzlRTUZzMHlxdy8rTEtJU3htM0cwbEZZSFZTZ3NV?=
 =?utf-8?B?dWt1S21qNEt6MEI5V1RxcUY5aEZTcUNuNVloc2szc0FLK21tS2VRb3VRTjVa?=
 =?utf-8?B?dlM1TUNRNnVuM3RFcEJxdHhjblVzN3NuMlp5UTVWeDFYdXlHM0M5ZEIyUGVX?=
 =?utf-8?B?ODVGYmhZdC81alhvVHdDeVcxUUsvR3N0WDk1ektSVDIzUkUycjVKQ0FMMk4r?=
 =?utf-8?B?T2xrb1c0Mmo0T3NCbDdNTkVQdDBmSjFEQlQrNlRUdzBPejJXNER4dFFqbUxz?=
 =?utf-8?B?SE9sbW1RQTdoZ2VLdmVBS2h1aTJvdmErdTJ3UWQrVHZFWnZWaUp1b1phVXZY?=
 =?utf-8?B?YVVoSnk5dk54bE5XSHNpWU92V1B4cDhqVDdzZkk3T0JaK2s3S3pqUFRQKytX?=
 =?utf-8?B?dS9GSnBUUVFVT1h0OWJIRENLVUR1MlNJdldjOE95NFBETTcxVGl4NXJ5TVBz?=
 =?utf-8?B?TklCNlVkbjZLdW9XNUFoYjNjMlAvWmsreFp3WFh5MmxjcENGR0RQRWVrczBI?=
 =?utf-8?B?Tm9scXFWb0J0M3VFK3o4aGIrOXJVWHc4djR6THFJYUVLVzFxaGRlQ3lFa0dE?=
 =?utf-8?B?Q0dCRWhWTXJORUJHdlJGSFgzNVNJckRJTUk0K05yRFMweE9wYk4rdDdZM0Fa?=
 =?utf-8?B?K0doM1NvVm8wdUNlNW1xS0dQT3FoUzkxSGEzS045ZWM4dm1aU0lkMEIwSmdO?=
 =?utf-8?B?VDFLRVA3ZTkzOG96NmhwakpXMFZ3TlpybTJ4K0wwa3RLS3I0cDJXcWlwL3Z5?=
 =?utf-8?B?YU15eUVMdXdLeFdJaDJud2xVcHFGK0JBYVNoQXVyUkt1MlJxL1o1dUcyQkVa?=
 =?utf-8?B?OUxPT1l1bGIyUDRPeUtKcHdGcEhXbnFZQzNYUGllU3A1Q1ZpVEF5T3hGeUtG?=
 =?utf-8?B?S0lyMHk3SEdGT2h3S1BraWVkejVteVZwUHBEcmJPWHZoQkdzZzFqSDNvcHdx?=
 =?utf-8?B?ekpmb1Iwc2NWQTdFWTlHWUtmY2U3YUo2dzJxTUdRU1YvMjBpcmFOcTVpUjdN?=
 =?utf-8?B?NUdKZDhWd3dWNkhZR2FXUlB0ZW9wVUhuczRxd0NhWnZ1cDQzamJReFZCekRy?=
 =?utf-8?B?YWZPSFMvM0gvbml2c080TC9FUFNVWFB4OFdXcHZUOFgrT0wwakZtdE9WL2xl?=
 =?utf-8?B?Ykp4ejUwbThWSUM0QTI2dnRhSklja29YVy91TFpnS0NLNzArSVoxQWtuZjRy?=
 =?utf-8?B?YW1zQTIreFV6bVZFTlU1VkpkN2o0YXFWMStaMFM2SEwwenlXWnk0QmdyTENH?=
 =?utf-8?B?MnhjeitNcXl3dTFjVkpMQy9sdFdBU0QrUTNHK0pDcnU0RzdZTERORkZHdE1m?=
 =?utf-8?B?K0IzSUwwc0ZVNG5jQmZ1azNsRTgyTzcyckhXWXdlUjNudGVFL1lQeTVxZ1ow?=
 =?utf-8?B?cjdlY3RSQ3ZSZHVkeGVkay9vdWEyajUvZUw1WHljZHlqZnA1elhuUUtDd2Nu?=
 =?utf-8?B?Q1BKRXVEM3MrVXdvbjN3Z3V2R0VTdDNES0NaRHdEaFF0bFh0b0lKQUh4TzRz?=
 =?utf-8?B?SlJmbTV1T0N1alRrSzlCbFZwdTRMdnIzMnU4VEVwMzJyTndybkNkMjdaMExn?=
 =?utf-8?B?ekprSnV3N3RXa000aXg0UVl6WDEybHdFcU0zR01OWXJvaUNDVHpISmp0Q2VY?=
 =?utf-8?B?UUdwL05nY2M2dFJ2NWN1ZUZkTFZiVG13dURKN2QwTDZYMFNyayt0YjdFc3dl?=
 =?utf-8?B?Wi9sRDh6Q1VHUkw4S1lqZjhrODZYbnFoR0xKY2dEcEVxMW1Oay95YWFudkw5?=
 =?utf-8?B?T3JTTWRFeFdrcldxMHdCMW5lbmZzcnJLcGpJSGs3Uy9kVkN4dVg3ZnZrQmp1?=
 =?utf-8?B?RkpjaGFZRjlhcnQyTUFnZTRlZmNWbTFvbXUvL3Jvck9VV3BNWC82dDhUV1B0?=
 =?utf-8?B?RU9LZlJyME0rV1RocG40UzhoZms5bWJEajEwYVZhcDgrRlFydEZ2SWNKMEZz?=
 =?utf-8?B?YWtYMklqazFBMmdqUU41SVJ3OWJhTHR3OE5PRlNiVmMyUzdMeE9FSzdWOXBY?=
 =?utf-8?B?dnpaS08wc3lVV29JU2dTelJCMnpJSEpBWWp2NDR6dkh0V1dEZUcrdXhFNzdJ?=
 =?utf-8?B?YU5PaXQvaDZRZDUydmxpSC9OUkYvT1NlMGdRYlVZME03cDVSVjRPa0M1UUtx?=
 =?utf-8?B?T2pBMWtBYVRpVCtnSTlmazJXM0VKWjkzQUszY3hTemFNd0l2Nm81Mll3YWRU?=
 =?utf-8?Q?QWnBM0sMnTW2ZuK8xKL91HFsld0WgVBV5aQRSR7do2FkA?=
X-MS-Exchange-AntiSpam-MessageData-1: I3UjJqb2+u90hQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9067efc2-6182-4e4c-11dd-08de799a16e5
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 02:59:45.1788 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8HcT7PXXE0+DgZBqFHebqTtHRlWmi7+KugQr+eqi2EPgm081E37Ns0kSVoou56H+1nNbMiY3RhqTjWEbheBcCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8581
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
X-Rspamd-Queue-Id: 701721FA24B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[infradead.org,gmail.com,vger.kernel.org,linux.intel.com,kernel.org,suse.de,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[mperttunen@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email,intel.com:email,nvidia.com:email,Nvidia.com:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Wednesday, March 4, 2026 10:41=E2=80=AFAM Randy Dunlap wrote:
> Add 2 struct member descriptions and convert #define macro constants
> comments to kernel-doc comments to eliminate all kernel-doc warnings:
>=20
> Warning: include/uapi/drm/tegra_drm.h:353 struct member 'cmdbuf' not
>  described in 'drm_tegra_reloc'
> Warning: include/uapi/drm/tegra_drm.h:353 struct member 'target' not
>  described in 'drm_tegra_reloc'
>=20
> Warning: include/uapi/drm/tegra_drm.h:780 This comment starts with '/**',
>  but isn't a kernel-doc comment.
>  * Specify that bit 39 of the patched-in address should be set to switch
> Warning: include/uapi/drm/tegra_drm.h:832 This comment starts with '/**',
>  but isn't a kernel-doc comment.
>  * Execute `words` words of Host1x opcodes specified in the
>  `gather_data_ptr`
> Warning: include/uapi/drm/tegra_drm.h:837 This comment starts with '/**',
>  but isn't a kernel-doc comment.
>  * Wait for a syncpoint to reach a value before continuing with further
> Warning: include/uapi/drm/tegra_drm.h:842 This comment starts with '/**',
>  but isn't a kernel-doc comment.
>  * Wait for a syncpoint to reach a value before continuing with further
>=20
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> v2: add kernel-doc comments for #define constants (thanks, Mikko)
>=20
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Mikko Perttunen <mperttunen@nvidia.com>
> Cc: linux-tegra@vger.kernel.org
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
>=20
>  include/uapi/drm/tegra_drm.h |   16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>=20
> --- linux-next-20260303.orig/include/uapi/drm/tegra_drm.h
> +++ linux-next-20260303/include/uapi/drm/tegra_drm.h
> @@ -304,6 +304,7 @@ struct drm_tegra_cmdbuf {
>   * struct drm_tegra_reloc - GEM object relocation structure
>   */
>  struct drm_tegra_reloc {
> +	/** @cmdbuf: cmd information */
>  	struct {
>  		/**
>  		 * @cmdbuf.handle:
> @@ -321,6 +322,7 @@ struct drm_tegra_reloc {
>  		 */
>  		__u32 offset;
>  	} cmdbuf;
> +	/** @target: relocate target information */
>  	struct {
>  		/**
>  		 * @target.handle:
> @@ -778,6 +780,9 @@ struct drm_tegra_channel_unmap {
>  /* Submission */
>=20
>  /**
> + * define DRM_TEGRA_SUBMIT_RELOC_SECTOR_LAYOUT - \
> + *    Select sector layout swizzling for in-memory buffers.
> + *
>   * Specify that bit 39 of the patched-in address should be set to switch
>   * swizzling between Tegra and non-Tegra sector layout on systems that
> store * surfaces in system memory in non-Tegra sector layout.
> @@ -830,16 +835,27 @@ struct drm_tegra_submit_buf {
>  };
>=20
>  /**
> + * define DRM_TEGRA_SUBMIT_CMD_GATHER_UPTR - \
> + *    Execute Host1x opcodes from user pointer.
> + *
>   * Execute `words` words of Host1x opcodes specified in the
> `gather_data_ptr` * buffer. Each GATHER_UPTR command uses successive word=
s
> from the buffer. */
>  #define DRM_TEGRA_SUBMIT_CMD_GATHER_UPTR		0
> +
>  /**
> + * define DRM_TEGRA_SUBMIT_CMD_WAIT_SYNCPT - \
> + *    Wait for syncpoint (absolute).
> + *
>   * Wait for a syncpoint to reach a value before continuing with further
>   * commands.
>   */
>  #define DRM_TEGRA_SUBMIT_CMD_WAIT_SYNCPT		1
> +
>  /**
> + * define DRM_TEGRA_SUBMIT_CMD_WAIT_SYNCPT_RELATIVE - \
> + *    Wait for syncpoint (relative).
> + *
>   * Wait for a syncpoint to reach a value before continuing with further
>   * commands. The threshold is calculated relative to the start of the jo=
b.
>   */

Thank you!

Acked-by: Mikko Perttunen <mperttunen@nvidia.com>



