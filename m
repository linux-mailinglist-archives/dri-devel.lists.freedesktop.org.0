Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIKkAVtHpGk0cQUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 15:04:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 382F31D0118
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 15:04:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B537210E3C8;
	Sun,  1 Mar 2026 14:04:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="P1eVDD+L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011004.outbound.protection.outlook.com
 [40.93.194.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BE3710E3D6;
 Sun,  1 Mar 2026 14:04:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D0K/QJGG8dkERPIrH2jS+hEwF72rYiMFYKgNTR9gYrop1FLXx4/hERnN9+ZL/iVvbDx3rgVPSVrbmkidAHYOUE0ftQyVv2npi0g8UPM9tk+Pn34DrYr6uPBLDCaR4VcM4XB7an9MjXYD9wnqYddTpwcoHs7Hk/SZVv7pFHFS0d1pEs/1ciE/1gTz7mKlv8Sf/IKeuBgN4mLoO5SQO1Wk2gcqyFyz8p83aEXUAjklKXYvdvVQV6um0NLq8liKBlU/sBishm/WJZvubPpDL0xAZKd72EhuDBXEIJDcINmes5X2mgq/61VPKDYzZRGs7oJUgDe81PcSJLPy+k00xcUDbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8AYCUScSFJSKVgN2o+eY4ctOZH5uOgnC4AnfHLD4njA=;
 b=RoSDdavsfWtBSotS0ITWUjTkAtyqOFYqkwTLVPxerQUkv+A2KeRE3ZzQc8/wCYmN+olKk1FwdymChNzdVeeShUoAP+Uyj33XH5SuSGILzQi/nWu3TS8kR8W1vZ9yXr3T3hfWT/skma2mAtIYcXzQSUopiJUm1cNdMyEFYTvSU8UWozY4U6lFjOjBAOL9N2LhS4mH4L5fy7zra3fGPjAzbBolH+8uLZP6/bDw94IcXpTfzaDp91Y1sKaD0ggdS4N1QTSPGo4kDaIVRoGda/K05qCgJ0wh8gpxkDcDNL6fUCjmR9UESbayY4ZM995uG10JFxTvV4QCvyx2NU2qfxtx4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8AYCUScSFJSKVgN2o+eY4ctOZH5uOgnC4AnfHLD4njA=;
 b=P1eVDD+LuZI5hGy8WvIE01nfyn7CWyNFHMRuenuvow8sUAzFv2xqvvUzwZNm243jQ5g0lKVV6rKNTLUAhBN7P5YFwhijNsSgQooHIUEwmUgHGgmymADhWwH96njnluQ1RE5wZEkLiLMMhmMqv2JKs3kNXeP+DTPIEM7lDvpoR3bp74NZeNqtCfU71TrBE/wyIbuezzrjlRuAdrPj5oypmQCBzogRn/LK2Mba2UOK62AYYCOcnM0iRyDmOUeYWaEmMIr2OM7oG8Dh+as0N/s8wFkE91dlF3Ob0ZZfYL3M84zbYm8P6NFBbVqlSJPdWcd2F38eYO1ogeslGoLAE06IaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB6632.namprd12.prod.outlook.com (2603:10b6:8:d0::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.19; Sun, 1 Mar 2026 14:03:59 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9654.020; Sun, 1 Mar 2026
 14:03:59 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v10 00/10] gpu: nova-core: add Turing support
Date: Sun, 01 Mar 2026 23:03:43 +0900
Message-Id: <20260301-turing_prep-v10-0-dde5ee437c60@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/1XMQQ7CIBCF4as0sxYzYMHiynuYxjQF2lkIDVSia
 bi72Lhx+f7kfRskG8kmuDQbRJspUfB1cDw0MM6DnywjUwMIFAoFtmx9RvLTfYl2YcopJ1tneSc
 R6qNGR6+du/V1z5TWEN+7nvW3/hwu/pysGTJx6qTAwXRnra8+k6HhOIYH9KWUD+33m/ioAAAA
X-Change-ID: 20260204-turing_prep-6f6f54fe1850
To: Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCPR01CA0129.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB6632:EE_
X-MS-Office365-Filtering-Correlation-Id: a0828c0d-a395-48e5-5953-08de779b6285
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|376014|366016|10070799003;
X-Microsoft-Antispam-Message-Info: BVv0E7T7RqI3AsWgGeEY1bqa36AqEWUgS+K1YXZ7v1F0K6OenHfImFe5QqlkvI4poliCY+MuEpOFv1tB0UYhc3B79+q0eDz5yndA4nB5zJIZ3mQqVjxHm7L636dV93XPuvmvRGHSbPksDeS4RaaHq1I8TgCmEF1IBurQ7B2/CFa6WDw9Izq3GIMp3dqgCT1mesOfMhd9Gzf5m1uzqX4X1yu743HF38R/8HB3zTW6I7a4RsihvJ+wZk67a1C/lLFAif+ZK/5+HT5cHr1y1hklCzhbC5KTQkMwt7rQrGTSSi4T/la9311QVujbotjFI/fCGYi2H1VuFK5LGXib+CjnYSBhRDdxUWy3JrN5sfGteZ7kMMx1giyQEvnoUNm14I4r4FOnSsluU3cQbeZ+azo8g8VIolJz1U8T3mKu0vKxtj2ZzbvhphjFVv43q/Lk/BnSYi5a2iIa3d1fI2+PsnnGJj6dOmQj5lYea38URbfmww/pGThQbHXgr7AxA5yjcgg6rKG9+Ad0WfmKcyd4N+o43TredSoO1ZT9v4aD21N7tYnZ6YndKfWp9ZDqVJUybAklqPVdZ15LvpRA+Y3l7W6lti7WKR+YKUt2MgpoWdh/UNTPhpIRy57uikf+6XExUCr5AunI8tZRUpbfIbrXQhz345srOeadv3qUV11rj/HYTcU8ETgGyWvMzM8k9sRZhm51YJ9IjKAJCgtm3OnR/GLy96xbfKx3W295ENPO939SaNI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(10070799003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0JzZC96VzFKVnozZWh4eVZMVXZNU3VqQjZ2bHNNVEprblc4a1BMVFhJVktP?=
 =?utf-8?B?c0wybGJsUTlwODdJTWs0YTFDaTFvcHRQck1IQjVSdjdGSTZKMnRQU2hVSThG?=
 =?utf-8?B?QTJHZnhsRWc0dFA3WCt2SzlOM1lUNFdscEFHa1BLdm5mcXd4VjBzekhLNzUv?=
 =?utf-8?B?Q2Zic3lGOWlJL2g0Ymd0RXI1bmFmZHhCOXhYMm9nN3drTkVYQUVDVFFLSUtC?=
 =?utf-8?B?ZC9hVTBVTGZtc3FRcnNWYzhaUUJaZGNJWFBDUU4xeldjcFpSTWpBWWNZS0li?=
 =?utf-8?B?WklacTJNYlZ6QjNReG9kSEo2L1Y2b0x6My9vQ1hKcWovbGV0K3hnYjAwS1Bn?=
 =?utf-8?B?NWNIUlpqUGVpbGJzcm9GQUpTanpoM3oza2lTL2xKT005dHN2aHlnUHdkZnZL?=
 =?utf-8?B?ZjRFL1grM2JneUw3c01XbU5IVEh3UlBEZHVMUTM4Zm9odzFDbmtMWk5HRWUr?=
 =?utf-8?B?M0llYzM2WThOcVBJR1VXQXgyTlBldVZkblY5RENtejRsQ3BWai9ON1NLUnJK?=
 =?utf-8?B?cHFRQXc2YVBtMVRqcXhxWWo5aUNQYlJ0RlNNU0xlRmR0SGo5MzVScVVtNXAv?=
 =?utf-8?B?VWxTVUFnUTlDZVdMZXd6WDNXMnp0Wkg5a0JtSXJZY1hCOFNjZjh0SWhpVlNH?=
 =?utf-8?B?c1BhSWRML0dkZlRLMllHYkswMkxaaURzcDZHdDMwZ3BtNUljVnJlZ0I5SHQv?=
 =?utf-8?B?c0hQVkVMV0VFNGFEUXdyalQ1K0NmMXNDV3FhalVNd0x4K1dGdGZPcnJIQ2FS?=
 =?utf-8?B?eDQ1Qm52dlEwZExlSjBxZ0dKc1RPc0pVWVFTR1ErWjRIajIzSzJmZ292eTdy?=
 =?utf-8?B?V0JOZFM3N0Q5RHQyL25KWGJPa0RpVlB2RkU2Y242bDZ0aWQxUUM3aU5KSXhl?=
 =?utf-8?B?aE1zd0JmVXhhalFzOWhXeWdVd3RvaUh3QnRzNEZtdkQ0emJSUnoxK0h5ejI4?=
 =?utf-8?B?QWN0eHFpc0I5YlhZTFUxNzUyU3RTQzhHMUE5Szd5VXRCR2taMklEZEwzUnhn?=
 =?utf-8?B?STFoejZvcnRFQ3hOZWFmTkNWd1dicVFqSVNkWnRZZDZMTHB0U0E4dEorMDVu?=
 =?utf-8?B?V3hzdmUrb3hDeG1HcnljL3pqSVhCbEYwQ09Ib216RmZKNnJRR0w3V2NoVXZo?=
 =?utf-8?B?ZVpjUHRHelNjRTc2ZDd3YnJFSnZybS8zY3R2WHZ5VjQ4NUFHb1NycVZWQ0lI?=
 =?utf-8?B?VTZESGZ6VjdHWGowQUZhWWxKS0pzMUdhdTBjbGFHZ0h3Rk9kWEJXYm5XcUo3?=
 =?utf-8?B?VHZKVXVXQnM4YjJGT3dIS3JYRWhxZEp1eExzS2RWaE9JRVN3K3dkUzczNGtR?=
 =?utf-8?B?QVRjbjVLV2cxUUdhb1JFRUdQVEN2Sm5FSXduTEIyL01MbGlMZmU2Qi9qQW8w?=
 =?utf-8?B?Y0RyWDNhSmNtc2dnZWVsekhXT1I1VGs4b0xQT29EQmxXakJrNyswRnUvcXFo?=
 =?utf-8?B?V296K0sza3lqR0JTUXRENnQ0V1JIeXRGaU5HWkFuWS9iSkxDVis4QWduK0Vj?=
 =?utf-8?B?L09jbFJDUXBMTnpZNnZNa1NtL3RRSklocXU3NFBpUnFwRDZEZmk0TlNZM0M5?=
 =?utf-8?B?S1MyRGppbUYwcTN2eks5dTNPd2Vxd0QwdzlxamhxWDRVSWwzaE1pYkxmc3N3?=
 =?utf-8?B?MGEvZ0JvbzFqMmlBSTMrZW5HUUtiYWtqem9rOHZienBXSGx1NzFyRXp2cnMr?=
 =?utf-8?B?TXZnK2dFNHN2dE1TS3drZGRKdGg4cUtiK2h2NWFlY0pvK3ZnbkpuTFA5Vjhh?=
 =?utf-8?B?c1pNRW5PQVI1RTFWMVdkUGd1SzNvWFI0VUNCVk9uaTMwUUNrbDJCbGRFbWZw?=
 =?utf-8?B?MXB2YjlxaVl6SUtjR05KVXFVZ3VZenFmMWJKRzdwOHd3dVltYmFiUUlwT0g0?=
 =?utf-8?B?TlZZajlMNUpmR2tLMkNpaWdjWDNZZUFGTEJvU2VINVRKVnRaR0RuMk5BY2tX?=
 =?utf-8?B?U1V5SEVZREhXUkZyWklMalpGWjhmM2laUGs3ejhCd2hwZEcyRVZqVnNyUk5S?=
 =?utf-8?B?aUwrVGNDTUxrWTdrSktmdzNPbEk5cVk5VllmTnh1RERhUmhHMU96b3lBU24x?=
 =?utf-8?B?VWFpOG9OK1RQMGx1WmZlOFNvOVlla0xGWTNTVzJXYzVSVDdNaGwxUzFBbUli?=
 =?utf-8?B?V3NZYXJmSVlQSUhaNUl4a3hnUFRwWHc5M3lTWDQ3VUd5YzVKeXJyeUt4amJ1?=
 =?utf-8?B?RXgxRUw3d3FxUTg5b3NhdU53ZFIzQXJhSFVNT2Z2MkUrM2dLQnNtaVFhMXBN?=
 =?utf-8?B?Tmk1RVJseXBGTFJvVjlyNS8xTXRVNUNiTnoxRFN4V1hQMW8wTWh2RUtJaGdB?=
 =?utf-8?B?b0w4bWsxSzZ3eDNJekJZM0dCZDc1YmtkY3ZTdzBwcmtmVWZmR0ZKN1lFUkR2?=
 =?utf-8?Q?8NJqMtx4GCCHkv3whfEdhRTY4/Z+js9QWj+7BKSCj6T9L?=
X-MS-Exchange-AntiSpam-MessageData-1: 8CFOxqu/Su1yug==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0828c0d-a395-48e5-5953-08de779b6285
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2026 14:03:59.1297 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C2bEV36dE3X4yL1QKsJwV2u9j0XldWWEMFykIKHAka25pMdqEb/N8LgCTL6kQsO7TNF1EmrIDbvI+6DMuscHhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6632
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,nvidia.com,google.com,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 382F31D0118
X-Rspamd-Action: no action

This patchset adds the remaining support required for booting the GSP on
Turing.

The biggest change since last revision is a change in how we store
falcon firmwares, regardless of the loading method. When DMA was the
only option, we used to create a DMA object as early as possible to
store the firmware's content, and patched it in-place to avoid doing a
copy.

In hindsight, this decision was a bit short-sighted as it complicates
the PIO path considerably, and ignored the fact that each access to the
firmware required an unsafe block. Thus the first patch of this series
switches to a model where we load the firmware into a regular `KVVec`,
and only copy it into a DMA object when we are about to load it. This
removes 8 unsafe statements and 30 lines of code, and the copy is, as
can be expected, absolutely unnoticeable at runtime.

The rest of the patchset did not change much, apart from the
simplifications in the PIO path that the first patch brings.

This series is based on `drm-rust-next`. A tree with all the patches is
available at [1].

[1] https://github.com/Gnurou/linux/tree/b4/turing

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Changes in v10:
- Store the firmwares into a regular KVec and move them into a DMA
  object only when actually loading using DMA.
- Use `try_update` when updating the `NV_PFALCON_FBIF_TRANSCFG` register
  array as its index is not build-time proven to be valid.
- Fix alignment issue when processing imem section of the FWSEC
  bootloader (thanks Eliot!).
- Link to v9: https://patch.msgid.link/20260212-turing_prep-v9-0-238520ad8799@nvidia.com

Changes in v9:
- Add a few preparatory patches to simplify the actual feature patches.
- Use a wrapping type for the bootloader.
- Simplify the falcon loading code and move the complexity to the
  firmware types.
- Add the generic bootloader files to `ModInfoBuilder`.
- Link to v8: https://lore.kernel.org/all/20260122222848.2555890-1-ttabi@nvidia.com/

---
Alexandre Courbot (8):
      gpu: nova-core: create falcon firmware DMA objects lazily
      gpu: nova-core: falcon: add constant for memory block alignment
      gpu: nova-core: falcon: rename load parameters to reflect DMA dependency
      gpu: nova-core: falcon: remove FalconFirmware's dependency on FalconDmaLoadable
      gpu: nova-core: falcon: remove unwarranted safety check in dma_load
      gpu: nova-core: move brom_params and boot_addr to FalconFirmware
      gpu: nova-core: make Chipset::arch() const
      gpu: nova-core: add gen_bootloader firmware to ModInfoBuilder

Timur Tabi (2):
      gpu: nova-core: add PIO support for loading firmware images
      gpu: nova-core: use the Generic Bootloader to boot FWSEC on Turing

 drivers/gpu/nova-core/falcon.rs                    | 315 ++++++++++++++++++---
 drivers/gpu/nova-core/falcon/hal.rs                |   6 +-
 drivers/gpu/nova-core/firmware.rs                  |  89 +++---
 drivers/gpu/nova-core/firmware/booter.rs           |  65 ++---
 drivers/gpu/nova-core/firmware/fwsec.rs            | 122 +++-----
 drivers/gpu/nova-core/firmware/fwsec/bootloader.rs | 289 +++++++++++++++++++
 drivers/gpu/nova-core/gpu.rs                       |   9 +-
 drivers/gpu/nova-core/gsp/boot.rs                  |  17 +-
 drivers/gpu/nova-core/regs.rs                      |  30 ++
 9 files changed, 740 insertions(+), 202 deletions(-)
---
base-commit: 6ca4bcc23ae86a1330e5347ae9eb6c5d0cb690ab
change-id: 20260204-turing_prep-6f6f54fe1850

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>

