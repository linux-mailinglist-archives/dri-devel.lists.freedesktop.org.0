Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87EFDC039DF
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 23:50:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C715910E967;
	Thu, 23 Oct 2025 21:50:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="TegMdu3d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010070.outbound.protection.outlook.com
 [52.101.193.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB14510E965;
 Thu, 23 Oct 2025 21:50:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Py+jOLmuDJVc6lBLTUafuW52tzCn+ujasd8h45S5ve2qm0ceeL916T18387hmLb3nad4jvm5IRgtnFPlhcQ03p8CsF0Atu+QN5pC/c/Hx2jhvWAx+fPMwfGB78AWFXC6bGOP0wTkuiH70OJBVlWSOs2s71oiD8f58qKVVaZ1jK6MVc9tCAOw/e7WNoyM6giHeutAZa8JsXwsDLmO3Rou/CDcQ0ZOo0BMX12LgaycIo2dpWjOWbiliZW5e+kSdSSPVCn9Wu04BAs9PV4W60vAZ2ij2xNyIaSCbP7ndFoHIDFH7kApgRuUB/LKRd514OyYgft2KId2dZ2HSTILWUUWGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aSFU6Fwb3dhoYppmX5Dmdir9fAfKioDedS5lqPdK+Qw=;
 b=X7kDJKIerVXp4RsYqNtviJGTMSjksa3Wy/RIIV4mqW2vCItte68Cwa5q90tLtB9kW49iZc92gQdMFQDSNy1NaGs6yMsO1KHhl2Dnyrdcwxppct1PjgqN8kcoPm3U+fceuYVs8T3lqi0+5pZIUiqYRmS31KOUxJ+MqXSaM0vWvColr0EhLcVNlKH1POK9gXvwWaSUQ8knRuKwfZsySsUV6wxrHURjfit1IVFQelz4zqwqcdey9aFnOELguU1N5HbJeu948Ogqjkq1VNaG98CQftQjwdmwQhXKb3AXyxFHUrhncQjoP8a/igxW7qtT4fiCNG13bjO+C0G7WVhpI8xwQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aSFU6Fwb3dhoYppmX5Dmdir9fAfKioDedS5lqPdK+Qw=;
 b=TegMdu3d6sWfO72hVhxu0Rp8bUWwczd5Q1U/rgZZdHtlt8rWB1w1vUEWYkShPSvaCe22BQ2u9+cnOODXgZcgfrntab8n/NWMIb48DYa1dmaejzsxj0hibNztSuBCh9KehhLQOz/ruekSADTb/K5qfjhst1olBcqER19Wfh2jhLs4otECdKBAIqngGXwxPmBi4lNnSTaNsKVlWeOIMUSM/UWA4kHrA8CuXDfV0HlCSiaQnswvoqH0e3t+3+ypb4R6yuIy0HRCRcPf6hZnWTU0gRevCnwn0pAtML2++RbArnJSzalkrTAV46ez6vqaf+EJeLG2VRAhpCpOtiUugoGuxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SA1PR12MB7410.namprd12.prod.outlook.com (2603:10b6:806:2b4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 21:50:45 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9228.015; Thu, 23 Oct 2025
 21:50:45 +0000
Message-ID: <7c4916ff-db34-4c9c-af1c-837c206842aa@nvidia.com>
Date: Thu, 23 Oct 2025 17:50:42 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/5] rust: Move register and bitfield macros out of Nova
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Beata Michalska <beata.michalska@arm.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 "joel@joelfernandes.org" <joel@joelfernandes.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>, Yury Norov <yury.norov@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Andrea Righi <arighi@nvidia.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
References: <20251003154748.1687160-1-joelagnelf@nvidia.com>
 <20251003154748.1687160-5-joelagnelf@nvidia.com> <aPklNydcTdOeXtdU@arm.com>
 <ACAA327A-AE2B-4D21-B8C5-C66BB5E09B7C@nvidia.com> <aPozw8TGp85YdmNU@arm.com>
 <47d6ab72-1526-457d-990a-928088ba7022@nvidia.com>
Content-Language: en-US
In-Reply-To: <47d6ab72-1526-457d-990a-928088ba7022@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0121.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::6) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SA1PR12MB7410:EE_
X-MS-Office365-Filtering-Correlation-Id: 12a43e92-d338-4e26-15bc-08de127e3846
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VG9NSXI0bkVWVCs2NUNXOHpHOXdKd3V3RktBSHFBSE51MTdPK0l0emNrNXhi?=
 =?utf-8?B?K1l4OGhIMU5XVGg5bzJTVW5MU3RPc1pGdktoK2thSExZTno4MW5Sdk42WHRM?=
 =?utf-8?B?clNtbTNTejl4NmlnaERvOHB2N3VkNytkUEp4Rk93anhpQlpLeGhKOEo1QW1t?=
 =?utf-8?B?Q1pQZC9vSHp4cS9PSExuSDY4KzV0eHVrRnpjVzk5cTVyQXM0V1ZCdm1kYVBq?=
 =?utf-8?B?Q1hkSVBhLzdXMkdxcnRGUUpuZlJmbXVBSG04c1FaRHFPZEFjOW9TbVZCa3RZ?=
 =?utf-8?B?MVNVbStIamRJa0drc3Ztb3BpWFlraHJNWWtIZ1FKN1NXb3ZGV2UxZWZzZDN2?=
 =?utf-8?B?R2daM1dqc1FYUFlWbFZ5TjZmdkR2dDkzR0ZoS0xxOHFkRDNLU0dYWmxTdWJx?=
 =?utf-8?B?TWZnTm1XTWJkcTBlUkdMZzFVTmhmT01ORFVDSm9hbTdRdVh3ZVlCaStvakw3?=
 =?utf-8?B?dU5ucG40TVlmNUR2ZUsraHdqVlorM1JLa0VvNExPY1RUMTBlV0ZOQU0xNi9t?=
 =?utf-8?B?ZDFVYjhHMkg1L2ZhT0RwNnpGOXgzelRGRTZSdEdtTjBVdkNXQmhSK3VxUHRV?=
 =?utf-8?B?cENmOHJOeTk0djFBSXJkaXAvWTRPTjBlbUxtYzBpN3JLeGVhdDEwOEJGOUhh?=
 =?utf-8?B?OGxTcEw4WkxwTFNJSXBHbDlZYzdNNkMzSVcrb1plQ1JVODRlSDVyUkI5bzFt?=
 =?utf-8?B?WHJMblI4djhycHh0WHpzaU5Hdk1GS09HQWpuT2lOMUM1V2JNTU1KNXRVQjBr?=
 =?utf-8?B?SER1WFZiTEhLeU5pejZwSUY3YzNQYWh6MGR5R0FvMmJqZjNONkZ0WGs2UUFv?=
 =?utf-8?B?K2lFb3BSRmozWTAyc3hIcmYwdkFMdnFQbm52N0xSZGRvd1VNeDVoZkhSUnEw?=
 =?utf-8?B?YjdsTVhCQjV6aHpQUy9iMWtBMTRkKzU3WjNWOEhJenUxMHg5L0VYaFc4cXcx?=
 =?utf-8?B?aGxnRC8zRTh5MjgvcHdSSnRPNXRzOHVhSEJBMW05MkVVU1JaUVVTQVpsNndH?=
 =?utf-8?B?RE5LN3R2UUk1bG9rY2c0RmhLZnRqR0dDRGZFaEoxem11MkNjMmczR0J2M2xU?=
 =?utf-8?B?VUxPbHhvLzViNmY1TnZEeElzbm1ITVlZUXRsdTlGNUFtM1dEcFF1elYreFJl?=
 =?utf-8?B?UXZKWDErYStCVzF6R0xGK3IyWHJiQWhqaUlqUVhlUkFxRWZTWHBaNWkxQnlE?=
 =?utf-8?B?WGRGV3N6UkwwUWJYblUrMk5mY2VBUTdFTWdMWmZoMTk5azI0TE1UdGd1ek9w?=
 =?utf-8?B?dEtNRTVzNUpWWXk0QldyeDJzdDVpd2ZodUpsWGNjRm82eTRRc085VTA3Q3Bl?=
 =?utf-8?B?VXpJY3BNd09OSzFPemVIdEd5a3lEVEl6WVlLOGszMFJOQ3UxVy9tY2psMWRO?=
 =?utf-8?B?aExGTDRXL2FxK096VmtHdE1pWEswNXd1UEpMTlNHVXdwdVhZaGIvSzZaL3hF?=
 =?utf-8?B?aWxXd2k3Yk5sZW9hSUJtSzh6N1lObVYxcEVDdlBqRjltVFc0L3J3NmViYnR5?=
 =?utf-8?B?R3AzUzIydVZjek5hVThUWEZ5VFI0MFNVWVhmbWFCNUU3dmRPeENqUFNiWnI3?=
 =?utf-8?B?TzNGVHJHcTU4MWxhYXVscFlUYTROZEcwMGl1SDNqaThMM05QdG9VMlVINXor?=
 =?utf-8?B?RzZpQUZOdjhqOVFacU42amhSbjZsOWIxUFRER25Ia1pXTDhDNjNYSU1pWFZn?=
 =?utf-8?B?U2xiTGVxU3ArR1l2WUU4TW1ZTURVVEw0dUJ2NGRUMS8zZjg1RGRnRHlBdWZR?=
 =?utf-8?B?dGZ2YStjd08rUUJCbEhPY1EwWlV1NHE2Y0tQWXM4aVhOeGU5a1paN3ozRlVT?=
 =?utf-8?B?ZFoxTGVSa0FMWVBmR3BEY3FLSXorOVlhdmFUajZkeW9tRlRFN2NXcTBjaS8y?=
 =?utf-8?B?V3FFMmZKdmp0MXJNaDlwZlpwUGF6ZlZLOXVoTnNwL2tjUCt2MngyNjd5LzhS?=
 =?utf-8?Q?mnlpP5U42//lGoEpWhTI0DRMYmJKrwMK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UCtIL3lLdGVyKzR4Rjh3Ry82NXpZT3ZtNk9NbGJpOWc4Rk1NSHZ5L0YvSDU3?=
 =?utf-8?B?NGRwNWhyL3FQejNLRlhPN2lZcUIrcFNJSmpwbkhRb1UwSEthKzZjZkEzNTVR?=
 =?utf-8?B?NjZ4a0pKc0RnZVlhNWV1cjdEYzFWSG53VklvbTJ1VFgwMjJEVmQ4b01LOUNQ?=
 =?utf-8?B?SXdBQm1TbUR2TGk4QjJCK004eFYvMkM3azUydWgyT0FIVWJhSDlYeWRYdmZq?=
 =?utf-8?B?TXIxYTBwbE9mL3htbDd2MjBVNEsvcXh6SzBWSkZTMFl6Y0xKeUR0LzdlTkNp?=
 =?utf-8?B?cXJVdkxGajh2UzJnY2VKUmE1bnJNOXJOZlZudUMwWnRYaUtUajUydWJZNjFR?=
 =?utf-8?B?TDlXU3NTSTQ3aUdFZER4QkVEL2pBV2Juc0JOWVpvdzRaeWV1eW9tVGI1MHIz?=
 =?utf-8?B?emZrYWl6K3pHeUU5VUMvVUczemozd0YwbExyY2Iya1YvTURlSW1YNmtYaXdW?=
 =?utf-8?B?enNZWklJa2gzeCtvbVRWaDdseHBYRUNjYjF2cDdmWWJnOFl4bFk0dzJnWFpS?=
 =?utf-8?B?R0ZFbjhBdjNiNlRQKzRkQTlmN1pOWm5zQXZmcVc2SGgwcXljQ2FTeHZ1QlJ3?=
 =?utf-8?B?QThuSGl3dWhoYVJhMUUrQVZxLzFpZmhZOGJabnloeHJ6TWttM0tLOE9MTERB?=
 =?utf-8?B?YS9CSjZNTGVhRW1WNVRIY3VFZGdFcm45MEFhOXpQbW9jZUtTWnBUZXNHL296?=
 =?utf-8?B?eWdUd3dXMERDSjFXbkQzN1J3S1JITEJ4NGxmQjc0Z2dxUmc4aElQcnk1WXhx?=
 =?utf-8?B?dkdYamZCUjJTMXE4SWdXYXNZTFFtL3dZWUtzd2xUbit4eG53L2FKSisvK3B3?=
 =?utf-8?B?YS9OMXZmTlhOUlhYYXBXdmFLV1lSRGQ0WFBiMGwxc3U1Zm96d25IRGUzRU5K?=
 =?utf-8?B?c2d3L3lmdUVwS0NvMTNpazA1RGEwWHExWDc4Zm5xZzJnZlcwYmJqd3g3YTI4?=
 =?utf-8?B?VnRhM2YrTVJZNTA3c1hEbmp3QWJoM0xraG5naTFUMjFjYllibFNDeldoY3dM?=
 =?utf-8?B?ZmI3RHVNd0U4LzZsNEo2NUF1ampldG9EbU1Vbnl3ZnQ2RVc0ZjRWUGhSTlEz?=
 =?utf-8?B?aDFzY2NkakJSWVhaK2dKSzJyVVk0R1BUclFLUFRwQ1g0blUyV1BYVitsSHli?=
 =?utf-8?B?cGRUd1hMN2E2QW9RbUZVMFJZTXoxWEVtenQ4VXJ3YW1zUUdocVpYRitSS2cw?=
 =?utf-8?B?WFF2K0pYVHJzNXBzcFdZNVZKOU51Y21sUk9xSHBKeGthc0x2RFVWQ3NobEtq?=
 =?utf-8?B?UmJSOFJaZDdhOEp4TGt4aERDNG5GSlZza2diRjBZMWlTL29RNTZHeUVkSTly?=
 =?utf-8?B?dnZqOHFMaHhmdlNQdlBVeGVSUU45WENrdHBoYlpQQThWVDl0MThSbDNHbjMr?=
 =?utf-8?B?cFI4RmxDWUtWdUF1TTRVanFydFF5VnNueURGWTYzc0xUc3pRV3hCMW1PdXZG?=
 =?utf-8?B?OXF2WkZYbFNibWRLQThpa1pNd2xiN0w5QUljdDl2RDJsdEhsNzgzOVU5eGJu?=
 =?utf-8?B?Wm1wMERYcGs1R3crdmt3SVRHbzdidEtXVTVaMk8zdW5aenRUWlN1UDByek9P?=
 =?utf-8?B?Z0ltMFFUelUyQXRFVVllakl6VENrZmJOaUQ2b2R0cU9KZDFtOVJtNWJOWUN4?=
 =?utf-8?B?ZzZsNU1XQ2xXNE96c296YUhQR0liNDN0ZldpQ0tkVjlEdjRoSHRMSmtrU1FI?=
 =?utf-8?B?QUFNbVRNSGI1OWpkV2VTdjF3dEZ6U29lWlByN2N1Y3JtdDROR0MvWDNaK21B?=
 =?utf-8?B?V3lkeVRtemlrQ3ZuTDVacTlEZSs5U1pHZnl4SXdiQ1FpbGRLenZYRnVER2h6?=
 =?utf-8?B?TzJQRC9kT3UwWlpXYnF6TGpBMnVGNmdBdXFnb3JEbzBIaXRpclpVcFAyWWhJ?=
 =?utf-8?B?UXVMaks5U3lwZUlMUmxOcks5WjhpM2g0cWVHUS9GR1dNd3VqQzlsem1TYlda?=
 =?utf-8?B?eTVyeDBBdEg0SU9TVFp5bDNFTVdMeG5Gb3Rmc0pxcEdwZVlWcCt6bTRwN0ov?=
 =?utf-8?B?c2t1Y0Ewcm1GaVVvZFJLZ3dOVTB3VGJvd0Ywd3RIcnZhd1lxV3VQRHBKK3d5?=
 =?utf-8?B?dEs1b1lzL25IclpZQjVFUEE3dXBhVXhRS25pV0ROMnU0NUIwdDMrUjdsaTN2?=
 =?utf-8?Q?dmM6LI0W9rdReSgg0vTheXhOB?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12a43e92-d338-4e26-15bc-08de127e3846
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 21:50:45.4302 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x3vQHbs4/uLMl59PmItA9FelZ4Zas96Dd4c/ZaS6Jan0g2Ar5uLZ+9DcZxLz03hbwUt9lMI/DUcLXi0zbF6Oxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7410
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



On 10/23/2025 5:47 PM, Joel Fernandes wrote:
>>>> Finally, for runtime values such as indexes, it could be useful to verify
>>>> once and then allow infallible reads/writes through some kind access token.
>>> Why? The verification is already done at compile-time AFAICS.
>> Well, that's the point. Those are runtime values, and as of now, the only
>> support for those is for arrays of registers when one, when using try_xxx
>> methods, ends up with check being performed each time the method is called.
>> Ah for this part of your email, you are referring to try accessors. For the
> fixed sizes regions at least, to avoid the runtime check, it will be possible to
> accept BoundedInt [1] in the future. That type actually came up for the exact
> same reason (keeping the checking light). This cleverly moves the checking to
> the caller side which could be done in a slow path. If the size of the IO region
> is fixed, then you don’t need to use try accessors at all if you use BoundedInt
> whenever we have it.

To clarify, BoundedInt is supposed to bound the values passed to the APIs, not
the address. Perhaps we can add additional types for the offsets as well.

thanks,

 - Joel

