Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEUsFlgnlmnxbQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 21:55:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 041771599E3
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 21:55:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CAA610E5E4;
	Wed, 18 Feb 2026 20:55:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="CGV41TD+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011014.outbound.protection.outlook.com [40.107.208.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B97D710E5DB;
 Wed, 18 Feb 2026 20:55:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Us6RiaFSI7B4G8A4vmgo/FThYriD9uRdLnfmjyeq+bapOTWMaZO8rZRzutnLFAfan8xXaKiKFIAN3BWFzxispD+FYrcifHtK13n12H2zzk2e+puGD1Rr3CE/Kifj8nv6/vvkrTOFIr8pZogLOvmGl+zJrXcFXgcMKrdDz9Rt2xQmIDaHP4esDBivakWNGkbbhgXpLvLNrxAg4o9VxCOfPhh+bM9Oe9z3NM57i4Mp8w9xLPQ5CIrLZRfNS/XN65yqvPQXSoobecGY39h4mZACxyHxAnvcvCJZh449V0MlpiMgaGcJtzKu7sU5O5dwFI/Psxmug26JKPfub+JdQVxkWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M+9tPDeRrMkBXARRC2hHT72wzEAWdbwcbj/b+527SVs=;
 b=f8+vgPHxxQvI5MLcx7+ouoOg+zafw7Ik+PWWPODLwUj99Cu8AFKcA/Rp4XIIzb7d7Pc2uPK4CXgaN/QJiPRHZkTDOKUabCuE+cLUjF2MOux//3wyfYZSaHCt+3Lf5Ja5aiAVld79HcW/xJ7XuX5erk2ZUBHmRjARIQ6Xn6tUkRR0tIo3R0FGf3aS4aJxSWSfm7bSz5mjvb1hNETTMJYBke09FgGfEVUcjHhNjhUj/a65XBfgKaNhfOta9nIKQ1F5TRpFYIeJqvniniZxoWXFggzl2wqeX2MwXoWrhwTCuTEJSMdUPAp1xgF7N2NINRMcmAfM+P8a6ITy2gPU2KQkwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M+9tPDeRrMkBXARRC2hHT72wzEAWdbwcbj/b+527SVs=;
 b=CGV41TD+vZ2SuQwIk65Yle/umMq4+4WrIACuDILF3Gz4iTXOKyTdpw5sw1YSPbgj4VNz1EVlU11e9sxPTSVYn1SF2crJ2E1SRnjBY+mN7erjgMfxtIYGNpjWbZd9NuyO1jxLnxazXJNN4hxJHDlZyc6Nh+ASG4/0e87Yg1voab770G25oPI9SDoDzF7kjKpXWQaAoX5CF8AZY/8c7taLEqHSms3Pw3EY05bZShBESwPzOqW3qzoWNc2QAo4hDZZMhQ1UZQKzX9mEzIsJB6LB8c7gUkOp78D1JPbUHH8BWCwr3aLwgu7dxMcn0DMJARHgOhLTN/73qAWngsOmSY64IQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 PH0PR12MB8031.namprd12.prod.outlook.com (2603:10b6:510:28e::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.14; Wed, 18 Feb 2026 20:55:45 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 20:55:45 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org, Matthew Auld <matthew.auld@intel.com>,
 Arun Pravin <arunpravin.paneerselvam@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>, Joel Fernandes <joelagnelf@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Gary Guo <gary@garyguo.net>, Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 intel-xe@lists.freedesktop.org,
 Peter Senna Tschudin <peter.senna@linux.intel.com>
Subject: [PATCH v10 3/8] gpu: Fix uninitialized buddy for built-in drivers
Date: Wed, 18 Feb 2026 15:55:01 -0500
Message-Id: <20260218205507.689429-4-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260218205507.689429-1-joelagnelf@nvidia.com>
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0281.namprd13.prod.outlook.com
 (2603:10b6:208:2bc::16) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|PH0PR12MB8031:EE_
X-MS-Office365-Filtering-Correlation-Id: e8b0eae1-2627-4762-eab0-08de6f3015f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KRo6dPvv+zmSf1SY+fD+fUp9MDSRaDkk6WcNbYLi++PL71oFE7GiboK5MNVD?=
 =?us-ascii?Q?K1cCUT/Gqf+SkbgD98jeMEvTV7JXTkRuGGgyqdF0mUIs85YS5uZWVdj5W640?=
 =?us-ascii?Q?+MeF6yNb5O524FwHfj9/ZP3n/CAwk5YihnGIcUUAJ0udDZtT7XxvQ/LYS0Q8?=
 =?us-ascii?Q?vFg0Q4mmljmG/Ws9vcSdaHpFXc2+8wH+rcWiYJJw9QB7bYfJT4c7ld4t+F+T?=
 =?us-ascii?Q?HzR/CUe+2yJ6jJUMXbv0DOVAJnAmGoEGOe1Wx688z8WWKZUmvH5ZsAx7hUyn?=
 =?us-ascii?Q?H8lnsOXHL/bxYMftpOVXKdA8a09zMEKMB/9VOcwKkVCUlDjEUuHcpUSi9WNq?=
 =?us-ascii?Q?yAoLsN/IL1QhXTbvCBT9bwc5vGGFDno5q3idaqFrng+yHpg13m7eej42gvFl?=
 =?us-ascii?Q?6Y8RoFD4JZ75uxnyyfQwbCEhp2ozX2eGKyfNhjA/KUSNF5Z4mLvwnoo3DcRF?=
 =?us-ascii?Q?yvTJ5Vz9A9owfNbPHENsFl4pRV/An5ZJqHgnImgq4+sGf1dEzJCgxX3+Cmz2?=
 =?us-ascii?Q?zWR4UqulhN2n1PfPkRfjik0EZCtFd2Avm6vVLlMfmdFxFUqbTey1IVrHEzHB?=
 =?us-ascii?Q?B7Nn1eXIndRhVL6jh73D0EJjdCfgtr3mBjGRzWXwNg59n8uCWVHUKQcvkkDY?=
 =?us-ascii?Q?GJIDsszt+spvR7FzGXx1ZqKyqeHbY6N375xmGU+PfChB+mbYkoLFUr3sGxX4?=
 =?us-ascii?Q?ekD7RMqpCDifL0eHtH91JYm61sKW9YrbOySNFLK0z1cm31U8r+UByzQDQCAG?=
 =?us-ascii?Q?kVq2cNX6C7SMVo9iU4kVp4XST0XU1QyTMVXVEPISvb6q6DRs64pjlwHUMRem?=
 =?us-ascii?Q?gJlB/bK9cH1AwZQy5wBbZ8mpIBsFxrxCo/hBtaEYQPI7MoSgn2BgFnT7nqDz?=
 =?us-ascii?Q?Nv4cASjDAJlIMn3m/4cp2yZ6dF8GLQqjvuKKNayrjAeprvadYQnohZgHQci9?=
 =?us-ascii?Q?a45yU3TTsBgl/rqRBzSW56XmNLzRHLtu6O8TFhg4T961n1UxpNfxsAkmcOyd?=
 =?us-ascii?Q?OMYHt9mmeo6NkhjyQqqUyaapMJAEYvcdpoxzNxb9JRobS5EdYEHYefO41PAU?=
 =?us-ascii?Q?n2Ydq3H+3CQkAgMy5QETFLd9WuarnnQhAl7l+EDG5x+pJeU65WO1N4kVEukP?=
 =?us-ascii?Q?vQI2qlgUA54SGdb0zeHzpR77bldrDuPK/O5CLsFlwaC3NyZMbW5Gm//u7EGa?=
 =?us-ascii?Q?dUc16wwjfr3aP8BNrtCpy3VvNftRhRmfgwaO1fURCdz2DRfZTK1VC18DAXX5?=
 =?us-ascii?Q?O5lsnfYDP26bBoTSpx5khZlyXnIUtzVBVwiqh5jrdGMHm/+o+Zddq0pFBhSQ?=
 =?us-ascii?Q?EmMz6JEaJIjHqxOJt4/vIZKi002rZ/DWqe8PkdFFXZDqovKz7RVERuTJCkSc?=
 =?us-ascii?Q?yJEBBjAFlwZF8E3n+hLutqHUdylQbpgIh5EKQwfPlUJ1u8cVnIEw+YohePrp?=
 =?us-ascii?Q?wIVd0tNaygAehKqzJ+sEa3JWNX6Dtk8QCTPj36OFxaEGjdhLcnV22wVcZykT?=
 =?us-ascii?Q?lq1cNcdf2di14RR3JKM/ZQH5OfioAZapIYvWEOTkqZbB0zicRohJ1LDYz5WN?=
 =?us-ascii?Q?vLISCbHuOB/jI2JDK8Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qH4qxe/v07+aZHEuZOQbIhU94fsu8VMYeg0itb5P88YvllvY81f93NVKtE7v?=
 =?us-ascii?Q?Ze62S7jObCYQ98s/HuujEk1DmcDPl9/NtqWtuWLyRL9cr64MY4dsMtpH2o/1?=
 =?us-ascii?Q?mbobm6KnIDz9eCXkGus1+UE89SZ0Bu8fIkZy/3OItzHHO6bWmtrdmTvbPccb?=
 =?us-ascii?Q?5shxaAjc8yjrbCRUaWt6OxxNtKkKB16S86ggaTFdge0UM3ZyCp0X5DjgrPll?=
 =?us-ascii?Q?oWqy/U6TmDwNohAUsNgAR8VwYNcfGqOTq+qgGXptDWq9mhdZLJgFhCBp5gxG?=
 =?us-ascii?Q?+p/3JaXkt1ycAujseAFSpEgq3iW5Y9C1o0fN2UI4Ni0Ys+Q3ES9hMaG1P/R7?=
 =?us-ascii?Q?Ns3guHnWi40e+g3Ht0pNrxQL1zMUdCycnri0oehtog6q1c/fw/3MuwswM7he?=
 =?us-ascii?Q?odXBGWq6FGolGMrjgHzaVobaI5E76wl/dhLKpCHy2AZsBxJP/czaCq/sKCI0?=
 =?us-ascii?Q?HJVjqn4D300pnXglnpHPBOJvvSTvZAPYnNUaudj5s+9okKgV4yCQQCgA1W/D?=
 =?us-ascii?Q?43V5VIo4463Rs1ZlEHTmI22W8AY0s5j5yED0IPrGtM2sObBbr0S+SXZdnxEj?=
 =?us-ascii?Q?I2r/1D0hGX7YsNdQtY/BPeDIBQNqRP8tdivjHvoJwljq05blV0gcbRdlal81?=
 =?us-ascii?Q?qO6X1oiTd1hsZAra4VCWmy5yNGtZwvMMYUWUd0LGrYdg/w4/4Vdw7Y1iaEi8?=
 =?us-ascii?Q?VFbbR19MpqO8UdkD1+gvqwRBSfIuk8bOVBpMQAS13ZHrDZ9wpOVL0iLB42I1?=
 =?us-ascii?Q?1Y+89m97h0kiI/TWQ2FiLLhzAxRRicHz2XGnktr4GWljvOVECS8D21P/r6o5?=
 =?us-ascii?Q?JSw1X+RpnBEzrJh4NKBGCoWmf/+700oGgBaN4WzgyKP70MdG9+4kXFjf/8x8?=
 =?us-ascii?Q?gCBGWALj9xhnK7EDh/jXMvCdNzeS5EvTJLboV8tzvjiqhYfGh09zAjrZf6hy?=
 =?us-ascii?Q?HQ4xAHE8aKExfUvNerW3l56uuQm1TyrGvctFX4s/Wr+CYqvkyBW1so6h0d3j?=
 =?us-ascii?Q?9RjzkuRZP0dSrqD+jHtZhAb5TBmi/YwC/1MI88eYx4E40vyXy2JuNEhH7GYy?=
 =?us-ascii?Q?VrrMFCnSenAAmo2hzsfdxHZYhgkGrbPyRldR05llRtedtWZRokUvaTyBw+qO?=
 =?us-ascii?Q?ORx4vyzXEmvzR1/tJFcP7br5TIwZXtTT3JVOs/ovgY5spX1gA4OLBoK7gbBE?=
 =?us-ascii?Q?gR3rCig0cuHWWo73csEV2lx5n+zs9Mmt38b0MXZ2htt/Q5zfspt4DA3kUEd2?=
 =?us-ascii?Q?kS0FLr7byNrCXbPkI9XajGK9wkMsMq5wAkfRzb4S6egNDXJqu2nkdAz7n+jK?=
 =?us-ascii?Q?RYHRvAreJCQ7QYYNErW9+oPnQTdBOXedXhuihDBiGm030GOjp2molCfa7d2W?=
 =?us-ascii?Q?3a5KWRXjIivfJIipoppASZ5HEdpSpCvGcE+/URPzZCvy/ZJFloW7ukvkoypC?=
 =?us-ascii?Q?4kD1WYI2aa0cbqw2GGS0yMQTEHtqTjR+MUA12iqy1qDuSb8VyosbGH8fkthW?=
 =?us-ascii?Q?7OXq2d3UHhNXTssSuFmQDo2iJMomCHyudKL+qX1UBLyL17GwveTPN/ymMM86?=
 =?us-ascii?Q?RVURh1AtLVTYilXo6NjownPOhdtn+zCq1q92+cvijsl3QUmbsN62rOXUj+zC?=
 =?us-ascii?Q?SQAKbMUNpNKSorj/PhIxuR0YD1TjY/7zyTcsB9gTv6S+cC8bPwn3NIfgg78j?=
 =?us-ascii?Q?mrzuYNQGJtG/4xatqnaPsE2MvaWjDEfGK7azUJV/KcHDpIWiONNUU6cVVb0c?=
 =?us-ascii?Q?yKO0pB9pHA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8b0eae1-2627-4762-eab0-08de6f3015f0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 20:55:45.3216 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rCq/eB2HiLwO+GXeXXuallz09HnNTxGI2vNY0nzXIjz21aezc4cvv4LlvdHnH/F3nF7koXV3NwcknbukdeOTlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8031
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[vger.kernel.org,intel.com,amd.com,gmail.com,ffwll.ch,redhat.com,nvidia.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,lists.freedesktop.org:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 041771599E3
X-Rspamd-Action: no action

From: Koen Koning <koen.koning@linux.intel.com>

Use subsys_initcall instead of module_init for the GPU buddy allocator,
so its initialization code runs before any gpu drivers.
Otherwise, a built-in driver that tries to use the buddy allocator will
run into a kernel NULL pointer dereference because slab_blocks is
uninitialized.

Specifically, this fixes drm/xe (as built-in) running into a kernel
panic during boot, because it uses buddy during device probe.

Fixes: ba110db8e1bc ("gpu: Move DRM buddy allocator one level up (part two)")
Cc: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: intel-xe@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Koen Koning <koen.koning@linux.intel.com>
Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/buddy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/buddy.c b/drivers/gpu/buddy.c
index 603c59a2013a..81f57fdf913b 100644
--- a/drivers/gpu/buddy.c
+++ b/drivers/gpu/buddy.c
@@ -1315,7 +1315,7 @@ static int __init gpu_buddy_module_init(void)
 	return 0;
 }
 
-module_init(gpu_buddy_module_init);
+subsys_initcall(gpu_buddy_module_init);
 module_exit(gpu_buddy_module_exit);
 
 MODULE_DESCRIPTION("GPU Buddy Allocator");
-- 
2.34.1

