Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GD+2Bjvpb2lhUQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 21:44:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC2D4BA6D
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 21:44:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16A6F10E698;
	Tue, 20 Jan 2026 20:44:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gk2FYGpZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011051.outbound.protection.outlook.com [52.101.52.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2B4710E67F;
 Tue, 20 Jan 2026 20:44:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jqw8l3QVEW/CqL3geQUW3l7pLJkQuU4XvNfofaUWSJp1exTrxl3AFDKOfk1zwaTrXoFKNGvL8QRImbVtCX2z3BD3j1o6g/3fFIK74McQKQ7kC0lYir1x/oN5BRrtINlyg44pfjmD1IM01zXtiCL+SbjpXjGM/NmwVrlzK7lt/P0yZOio4QCOhTx+BS1Lpnqqi0V31faUp58SNn9um8gYAzR077Zp6uj3iTxSj0dJp/4gv3o/47IYmGgcVwibJ4iEEUBiQ5jiSf1urKDE4BMzSsKk2JxM6Twyn9G89g19Aso7wF2MW4CDu/gnL7IU+B90In5xVDYaXbpWhO9wLpuSoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yj3vA9psJcSaKDulHgpZPmwInF4j839R/DwTqlhUnh4=;
 b=P6trYYNnqxDYQprrjVAfOerxNMgoTmT9wE58/cScGG66GJa5+xVwZaVegWxG9+sbB5XKEImFLJDNFwWsWiPJzK0LEhkhrH+lur0ktiFE1wi5gtya2Qit9woIQzYPwjK8vp0x3DKnPJyroU3vRW/hQrDt1v6yS4W5wN54a6qZRA8GzBJAPv8aAFSJAIRi4I6nF8+Sj+W41XQfsRk70tkIW1DlC8247WQoUevEX8lG5Q6puGUgfkG1DkMEh1nnz2kr9IF4lm82Qlop3nP63D4AWiiU4ThirOyBN6SbXtJPibnf75hdQ+C1eu+izEoThLsoS/n8yvLlM79mtyhc8MaoRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yj3vA9psJcSaKDulHgpZPmwInF4j839R/DwTqlhUnh4=;
 b=gk2FYGpZDq/p4JWLvU6ymmWP/I6eqP/89kepwMMQ6v2maHqO2e7BWnYWM7R/jSlYaxh6qrREcsXiJ4PVrNlTyulMphiS4CDuD5G0Tx5o90CYy3nasx1BwtPpmMKH/vMpm5SPEXZSl9gL3CebNEtpKojgCedA/2EUe+k0WCYXfWTulRXIRWD0koYfv+TwJO/weUdm9rhn0scPcqNJDGbuJAyWovLDN6gFer/+sV4SaINiEO53s/AhtWMb+u0EeY+0px/rU1xW7S4EKAKcF6OX2eDFFgvHz0pDX7r5YvPuqU+x5Hu037h5yL7XVMZkB+zwXz51dSRvx3qKeZCoaD3iPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 CY1PR12MB9651.namprd12.prod.outlook.com (2603:10b6:930:104::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.13; Tue, 20 Jan 2026 20:44:26 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9542.008; Tue, 20 Jan 2026
 20:44:26 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 Andrea Righi <arighi@nvidia.com>, Andy Ritger <aritger@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Alexey Ivanov <alexeyi@nvidia.com>,
 Balbir Singh <balbirs@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, joel@joelfernandes.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH RFC v6 21/26] nova-core: mm: Add memory management self-tests
Date: Tue, 20 Jan 2026 15:42:58 -0500
Message-Id: <20260120204303.3229303-22-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260120204303.3229303-1-joelagnelf@nvidia.com>
References: <20260120204303.3229303-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR20CA0066.namprd20.prod.outlook.com
 (2603:10b6:208:235::35) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|CY1PR12MB9651:EE_
X-MS-Office365-Filtering-Correlation-Id: 57be3f57-2271-4964-f841-08de5864b363
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NiNG7GUYUpGXD7Dji644zLw/00G9UAoGhBUWgClsUwkSUQxgP9TJSpDpxDGp?=
 =?us-ascii?Q?I1ViU6HT4yJkWkb7Ca7zINYd1hvH+y5G3jvAhqo2ODpCyPdv3FCWPUGJGzS5?=
 =?us-ascii?Q?HMRn0xp96H4vbr/B3JP6sI8tdobzoVviP07jdbHY/cyCZYug3EwCejezqGql?=
 =?us-ascii?Q?Wsd59JBuAnVemOxnQE4R+2/RB5FagHG7i17oHkkf+lWY5NEFnegy/yR52kSx?=
 =?us-ascii?Q?XAyXfnBDXKzaKMkIuuuJc5KUklRuFSFRaZxTSCYnH0a/V/Q0C5pNL3JcooS5?=
 =?us-ascii?Q?+zx5ojrND7lhlNWr0om4a3yQYPaVOAiM+ris8zBgfbS5EIngCTeGjoH3pDad?=
 =?us-ascii?Q?h1CLhBQJupwYF7nLxBvdV7qt2moi0cqCAYYRowDXhn/MOT3bMXl4kXFXKhqK?=
 =?us-ascii?Q?rr1Gp+FE3f9NodhvMetHZHBrq8KvdCwSczwQMhHF4FfHEVrq4z8XuEXrpAwY?=
 =?us-ascii?Q?BBuypCEaDsg8BxjcGSXjj8yy6cJqMg8bPOmK6/qwH7u1tIXRtSXWksSXbGj3?=
 =?us-ascii?Q?Py7cZA3//EpP5eg05e1f0opBt5rFEeHtic6lv16415MWxOmniKgQgg7aLO7C?=
 =?us-ascii?Q?mPayHykZQV0YlxdlCTUbRJAlyoFKqPWX3WuLJ7mxUsVfB+J+TyPmafeR9I27?=
 =?us-ascii?Q?WbZLEp/zx9L5dNr/Z2gMY+solmYsi1FYXrMAxiD2i6uFAqJVv0wUggS211DZ?=
 =?us-ascii?Q?UpnfqRKbjhAyrySCJ9/nrtC7jSwLEU6nexEOOMseODMhDNKHvtYSd2Q8I6TU?=
 =?us-ascii?Q?dm4hgg17RkoNOpsKMrJ6TxOx2FrJVZ6Sm0fV0Q9cefyXCSfaWig7CTBzaFoP?=
 =?us-ascii?Q?BELYdJtUcRC+oZ0HdUONS3fSgB5R1i0oHlCc4st7NwA8glWIQbfx425xJTna?=
 =?us-ascii?Q?6lIJq1V27wMl4YPrx7D8gOYTkS1mYe5PiphefXasZ8jaSLc8XLpRh2/JCWg9?=
 =?us-ascii?Q?j+GLsu4T1mHk3L+iHzVonAsqhBuxz1bEOexPnyWj+m32iBEaOvjVVSqlxCt4?=
 =?us-ascii?Q?+fEJ5gC+TBWDLoS5F9JRhEhve0AsyHZnJ+RILahLwU+FkQy1Ne+iAB6TBsPo?=
 =?us-ascii?Q?R1OvcXE27qbPzGDM9f/Yrf5Gycy360R59jhQ+47mBFnj3z+xOqdHK3Z1haWB?=
 =?us-ascii?Q?jp6bFgQJ6hBnV6YDWTA6lLVE+MrtYLOhq+4ybkOVE+Cx79KYUJnmmnyCVTQy?=
 =?us-ascii?Q?MK5cDD00Ii0a8zlf2QCSYO+koE8TVROzjZlyw3/mpadzuZzStgW7lxBuvelH?=
 =?us-ascii?Q?2Fr6Rv53CO4btA+Vqyc4LSnXKzaPQhPaidcnBroBKNy8QtF5K9V/6eFYGB/a?=
 =?us-ascii?Q?w3kK3/YkfjC2SCo28zk72Brr0l/xGyCPxW0+JrK3aDCv1EeZEG+i9Dxa1nQY?=
 =?us-ascii?Q?gpyQ/Wi/GWiCg7jyspHjjGjhcrVkMmmAKgGHPytFg8CWk+UQwqWEzQYtSjn2?=
 =?us-ascii?Q?65whLj58wqxJg/yXC0PmF42yo7NNXIejUxqrEbGwUSNTN2xsnMjir8IqvzHj?=
 =?us-ascii?Q?acjdfB1Gk/z+cMXrqG9lKaNp5ukOYKSG4TD/JAUnqjP1pf4ro7bIRPRVRDuT?=
 =?us-ascii?Q?X9oVMhUdrx0hs6zrpq0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mFpVSFboKug8TqNeZ96Uxa95wNfpxDEDV2KwfBVswqgcnPFLNApCJ7TozvZA?=
 =?us-ascii?Q?ymFfNknqpuerKogFlihgUQ/+txA9gpWrKCq01lCwAN45PRbPajGnKRjMVld6?=
 =?us-ascii?Q?bkGh7AnVGdXlgAyDzt1wGv/9LQuA4I5frGcatHjFR3UMHZ038KHkbpgVUTHU?=
 =?us-ascii?Q?sodWE63FDKFbstuSFIJuxJz9gZwVTQdIKmRMl1E5RzkKplLmBJVj0FzJt4li?=
 =?us-ascii?Q?ZFojG7xqQQxkT/Ri4tXiKmBq6ym68W38NrBx47uAdPlvAobpNOVZm9qUaQQ0?=
 =?us-ascii?Q?ChY0+zjh7KfzNSC28GkO6BJIlUxD44tT4GvlJnudrouONqFtdeNW/dNtz1e8?=
 =?us-ascii?Q?v9czWwZ0JAfaJVga9o6t33UjKx0UwXFPhfdvBr8EtmrKOVW7N3IalLHCQP5I?=
 =?us-ascii?Q?/S8ZXGjMUMlcFMbxfZyX6t0qkJtN4LgiRoiQEmRGiyoK59vdzvLJE8HZilz3?=
 =?us-ascii?Q?MYvCg/+lHBjCVfCrKQpEr8SHaP1ZVkl+jmT3YMqxFWv8/MILlR3hvfxaV80/?=
 =?us-ascii?Q?RzoD7NZXpmK3oslujd0CZd2+/JjCAwg/AhAOWGJiTqnn/cxMi6jahaTrusgr?=
 =?us-ascii?Q?A8WMrOn+82GAUjvU7XWZAfVhwHnA6mJyj1s7Z1B6H0cFOQxkdEOqWouNTS5w?=
 =?us-ascii?Q?mXAlQn5seOA3i8x63HXsSIJLWg6+UODxZB7JCSJKtivJHdX8rXjFpUz/oz99?=
 =?us-ascii?Q?lGIyvfDitQbJ+zLrdD/iKZ1ams1B8JgarY6zxB4vxECbedDyc+TJTOxZNGKm?=
 =?us-ascii?Q?PJ1LjABKBKNuuAkl0pcieXa8R/KbNMG6EdvdahyE6cgTMulaGQj9UphYUj/Y?=
 =?us-ascii?Q?AxXSYm8kKgPfGiiF90QDdOuWsSCmtSaEGIgYbY6A+x7NquE5WNFMdrm3pfVK?=
 =?us-ascii?Q?EXOkjkSla5dD/Gu0grVVziHjLPSv/WSHVSN/mrlmwFEJb1KDuCcH9u5JUjPd?=
 =?us-ascii?Q?HcraJbzCrbUhU36YYTBQ6Xtp2RrllnFm59wH0q/1Zy18wvtvSeV1jmyqyJkc?=
 =?us-ascii?Q?/Dbh29m4s+VPkaqiQXvc6GNa6QP/5JGT+xJb91Mb7+Y08N9qNrmuPMiMDOhB?=
 =?us-ascii?Q?ELq2NWC5V/zi8CyZr+zYWlCxNhYtF7SjFV62mjpTkI8JMRhYW2GWGDygU/JT?=
 =?us-ascii?Q?rXeYs2x5FzJYKPbNfFeDRKLs0R5nU2Ah6gIcgprTWFDFChnUxuxeisVyI2qR?=
 =?us-ascii?Q?kbViYW3HxAzvJTfD497CF7hM4AkzY7IR6hY3igAm6bEuNbrr1pjp1bBDvmTQ?=
 =?us-ascii?Q?6qZdWb1qooeY+zgqUaqq9pBOMTC3b8qbwiDlRK8fSTt7WlxC6HV7sGpFH6Gv?=
 =?us-ascii?Q?t5tugiWEs2k8UR7QuB7O2L1jFYhy6kylouPlAzlF75FQh6u/XjFNwAUdMy54?=
 =?us-ascii?Q?W+/j45EzWjn5GGQNnHhKkjJ7A3JvcNWoJwvNLhvEjMhhFPi80ntUiUK5fIdc?=
 =?us-ascii?Q?vbAHSlm7WTkyDMQuXtidBSOugHCDpjLTswRnA9xhUczO3aBLFpAvs6Vswf9i?=
 =?us-ascii?Q?ggI6OaCDk6oiEsO5pqnKASSpeoFbC1kZrS8gD9jQYI/+/ooCMKQ0xGWf5fsa?=
 =?us-ascii?Q?Ii5FO+l0UWJwMAhPyh+EjwLmFS8N7tF0On2+Pso3Bb9y/RQID8mW1f+7qI4y?=
 =?us-ascii?Q?ZXNW/KHt8ruwxpwbp5BLIWMvELHTsaUYPA0MSGWfCJcLyB7mWe2G7uubFwFC?=
 =?us-ascii?Q?4CNR4PCPfV2q8SnI+azISqLZ4NrDqwZs8wf2Z46wJrYSUt4B7da+N7TpuFbw?=
 =?us-ascii?Q?HxS9Vq71hA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57be3f57-2271-4964-f841-08de5864b363
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 20:44:26.5307 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 15B3EGlKPKU91G3wZWdeGxAvrzE0xU982H8F2Si2HlVp54w5yz0uRoHLQZxu67y++uILTmYHu+BGlsjw7Gv7ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9651
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,collabora.com,joelfernandes.org,lists.freedesktop.org,vger.kernel.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[52];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,nvidia.com:mid,Nvidia.com:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: BCC2D4BA6D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add comprehensive self-tests for the MM subsystem that run during driver
probe when CONFIG_NOVA_MM_SELFTESTS is enabled (default disabled). These
result in testing the Vmm, buddy, bar1 and pramin all of which should
function correctly for the tests to pass.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/Kconfig         |  10 ++
 drivers/gpu/nova-core/driver.rs       |   2 +
 drivers/gpu/nova-core/gpu.rs          |  43 ++++++++
 drivers/gpu/nova-core/gsp/commands.rs |   1 -
 drivers/gpu/nova-core/mm/bar_user.rs  | 141 ++++++++++++++++++++++++++
 5 files changed, 196 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/Kconfig b/drivers/gpu/nova-core/Kconfig
index 809485167aff..257bca5aa0ef 100644
--- a/drivers/gpu/nova-core/Kconfig
+++ b/drivers/gpu/nova-core/Kconfig
@@ -15,3 +15,13 @@ config NOVA_CORE
 	  This driver is work in progress and may not be functional.
 
 	  If M is selected, the module will be called nova_core.
+
+config NOVA_MM_SELFTESTS
+	bool "Memory management self-tests"
+	depends on NOVA_CORE
+	help
+	  Enable self-tests for the memory management subsystem. When enabled,
+	  tests are run during GPU probe to verify page table walking and
+	  BAR1 virtual memory mapping functionality.
+
+	  This is a testing option and is default-disabled.
diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index d8b2e967ba4c..7d0d09939835 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -92,6 +92,8 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> impl PinInit<Self, E
 
             Ok(try_pin_init!(Self {
                 gpu <- Gpu::new(pdev, bar.clone(), bar.access(pdev.as_ref())?),
+                // Run optional GPU selftests.
+                _: { gpu.run_selftests(pdev)? },
                 _reg <- auxiliary::Registration::new(
                     pdev.as_ref(),
                     c"nova-drm",
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 91ec7f7910e9..938828508f2c 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -318,4 +318,47 @@ pub(crate) fn unbind(&self, dev: &device::Device<device::Core>) {
             .inspect(|bar| self.sysmem_flush.unregister(bar))
             .is_err());
     }
+
+    /// Run selftests on the constructed [`Gpu`].
+    pub(crate) fn run_selftests(
+        mut self: Pin<&mut Self>,
+        pdev: &pci::Device<device::Bound>,
+    ) -> Result {
+        self.as_mut().run_mm_selftest(pdev)?;
+        Ok(())
+    }
+
+    fn run_mm_selftest(mut self: Pin<&mut Self>, pdev: &pci::Device<device::Bound>) -> Result {
+        #[cfg(CONFIG_NOVA_MM_SELFTESTS)]
+        {
+            use crate::driver::BAR1_SIZE;
+            use crate::mm::pagetable::MmuVersion;
+            use kernel::c_str;
+
+            let bar1 = Arc::pin_init(
+                pdev.iomap_region_sized::<BAR1_SIZE>(1, c_str!("nova-core/bar1")),
+                GFP_KERNEL,
+            )?;
+            let bar1_access = bar1.access(pdev.as_ref())?;
+
+            // Use projection to access non-pinned fields.
+            let proj = self.as_mut().project();
+            let bar1_pde_base = proj.gsp_static_info.bar1_pde_base();
+            let mm = proj.mm;
+            let mmu_version = MmuVersion::from(proj.spec.chipset.arch());
+
+            crate::mm::bar_user::run_self_test(
+                pdev.as_ref(),
+                mm,
+                bar1_access,
+                bar1_pde_base,
+                mmu_version,
+            )?;
+        }
+
+        // Suppress unused warnings when selftests disabled.
+        let _ = &mut self;
+        let _ = pdev;
+        Ok(())
+    }
 }
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index 7b5025cba106..311f65f8367b 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -232,7 +232,6 @@ pub(crate) fn gpu_name(&self) -> core::result::Result<&str, GpuNameError> {
     }
 
     /// Returns the BAR1 Page Directory Entry base address.
-    #[expect(dead_code)]
     pub(crate) fn bar1_pde_base(&self) -> u64 {
         self.bar1_pde_base
     }
diff --git a/drivers/gpu/nova-core/mm/bar_user.rs b/drivers/gpu/nova-core/mm/bar_user.rs
index 288dec0ae920..e19906d5bcc6 100644
--- a/drivers/gpu/nova-core/mm/bar_user.rs
+++ b/drivers/gpu/nova-core/mm/bar_user.rs
@@ -193,3 +193,144 @@ fn drop(&mut self) {
         }
     }
 }
+
+/// Run MM subsystem self-tests during probe.
+///
+/// Tests page table infrastructure and BAR1 MMIO access using the BAR1
+/// address space initialized by GSP-RM. Uses the GpuMm's buddy allocator
+/// to allocate page tables and test pages as needed.
+#[cfg(CONFIG_NOVA_MM_SELFTESTS)]
+pub(crate) fn run_self_test(
+    dev: &kernel::device::Device,
+    mm: &mut GpuMm,
+    bar1: &crate::driver::Bar1,
+    bar1_pdb: u64,
+    mmu_version: MmuVersion,
+) -> Result {
+    use crate::mm::vmm::Vmm;
+    use crate::mm::PAGE_SIZE;
+    use kernel::gpu::buddy::BuddyFlags;
+    use kernel::gpu::buddy::GpuBuddyAllocParams;
+    use kernel::sizes::{
+        SZ_4K,
+        SZ_64K, //
+    };
+
+    // Self-tests only support MMU v2 (Turing/Ampere/Ada).
+    if mmu_version != MmuVersion::V2 {
+        dev_info!(
+            dev,
+            "MM: Skipping self-tests for MMU {:?} (only V2 supported)\n",
+            mmu_version
+        );
+        return Ok(());
+    }
+
+    // Test patterns - distinct values to detect stale reads.
+    const PATTERN_PRAMIN: u32 = 0xDEAD_BEEF;
+    const PATTERN_BAR1: u32 = 0xCAFE_BABE;
+
+    dev_info!(dev, "MM: Starting self-test...\n");
+
+    let pdb_addr = VramAddress::new(bar1_pdb);
+
+    // Phase 1: Check if page tables are in VRAM (accessible via PRAMIN).
+    {
+        use crate::mm::pagetable::ver2::Pde;
+        use crate::mm::pagetable::AperturePde;
+
+        // Read PDB[0] to check the aperture of the first L1 pointer.
+        let pdb_entry_raw = mm.pramin().try_read64(pdb_addr.raw())?;
+        let pdb_entry = Pde::new(pdb_entry_raw);
+
+        if !pdb_entry.is_valid() {
+            dev_info!(dev, "MM: Self-test SKIPPED - no valid page tables\n");
+            return Ok(());
+        }
+
+        if pdb_entry.aperture() != AperturePde::VideoMemory {
+            dev_info!(dev, "MM: Self-test SKIPPED - requires VRAM-based page tables\n");
+            return Ok(());
+        }
+    }
+
+    // Phase 2: Allocate a test page from the buddy allocator.
+    let alloc_params = GpuBuddyAllocParams {
+        start_range_address: 0,
+        end_range_address: 0,
+        size_bytes: SZ_4K as u64,
+        min_block_size_bytes: SZ_4K as u64,
+        buddy_flags: BuddyFlags::try_new(0)?,
+    };
+
+    let test_page_blocks = mm.buddy().alloc_blocks(alloc_params)?;
+    let test_vram_offset = test_page_blocks.iter().next().ok_or(ENOMEM)?.offset();
+    let test_vram = VramAddress::new(test_vram_offset);
+    let test_pfn = Pfn::from(test_vram);
+
+    // Use VFN 8 (offset 0x8000) for the test mapping.
+    // This is within the BAR1 aperture and will trigger page table allocation.
+    let test_vfn = Vfn::new(8u64);
+
+    // Create a VMM of size 64K to track virtual memory mappings.
+    let mut vmm = Vmm::new(pdb_addr, MmuVersion::V2, SZ_64K as u64)?;
+
+    // Phase 3+4: Create mapping using `GpuMm` and `Vmm`.
+    vmm.map_page(mm, test_vfn, test_pfn, true)?;
+
+    // Phase 5: Test the mapping.
+    // Pre-compute test addresses for each access path.
+    // Use distinct offsets within the page for read (0x100) and write (0x200) tests.
+    let bar1_base_offset = test_vfn.raw() as usize * PAGE_SIZE;
+    let bar1_read_offset: usize = bar1_base_offset + 0x100;
+    let bar1_write_offset: usize = bar1_base_offset + 0x200;
+    let vram_read_addr: usize = test_vram.raw() + 0x100;
+    let vram_write_addr: usize = test_vram.raw() + 0x200;
+
+    // Test 1: Write via PRAMIN, read via BAR1.
+    mm.pramin().try_write32(vram_read_addr, PATTERN_PRAMIN)?;
+
+    // Read back via BAR1 aperture.
+    let bar1_value = bar1.try_read32(bar1_read_offset)?;
+
+    let test1_passed = if bar1_value == PATTERN_PRAMIN {
+        true
+    } else {
+        dev_err!(
+            dev,
+            "MM: Test 1 FAILED - Expected {:#010x}, got {:#010x}\n",
+            PATTERN_PRAMIN,
+            bar1_value
+        );
+        false
+    };
+
+    // Test 2: Write via BAR1, read via PRAMIN.
+    bar1.try_write32(PATTERN_BAR1, bar1_write_offset)?;
+
+    // Read back via PRAMIN.
+    let pramin_value = mm.pramin().try_read32(vram_write_addr)?;
+
+    let test2_passed = if pramin_value == PATTERN_BAR1 {
+        true
+    } else {
+        dev_err!(
+            dev,
+            "MM: Test 2 FAILED - Expected {:#010x}, got {:#010x}\n",
+            PATTERN_BAR1,
+            pramin_value
+        );
+        false
+    };
+
+    // Phase 6: Cleanup - invalidate PTE.
+    vmm.unmap_page(mm, test_vfn)?;
+
+    if test1_passed && test2_passed {
+        dev_info!(dev, "MM: All self-tests PASSED\n");
+        Ok(())
+    } else {
+        dev_err!(dev, "MM: Self-tests FAILED\n");
+        Err(EIO)
+    }
+}
-- 
2.34.1

