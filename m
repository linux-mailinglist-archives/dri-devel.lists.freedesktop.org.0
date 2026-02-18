Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPQLI2Ytlmm5bwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 22:21:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBFB159EB7
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 22:21:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD80F10E686;
	Wed, 18 Feb 2026 21:21:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="T9adnT1f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010052.outbound.protection.outlook.com [52.101.61.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3AC710E672;
 Wed, 18 Feb 2026 21:21:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OVCO/eEgFujp+GV2WjG7kRFKIUDZTDiN5PvPZXHsCD+h+d5AwgVTJlxJEOg7SuYf5oOgqwdLLsnf8AmCnKoakrnbaQQxJgU9jtHZ2f5n69eGL2FHuwChQrlpU8Awbwjfww62zozBc5gXXautj7msQ2BQ4jZk33Y1sMafx5U9dgt4myHyRwuld+LSTLfXJTb7yBMoevI8VaFnAgpvqoXFGWgD6Y+g4SrFXNB1wwlqGDb6jNDrbggs5ca3QApKaV9pu3Yzs2j88e5d/0A4WK9zXujFxAzrtCSGzIQanG6nByoudhnmermUhFfosIz6aAAK8AP2PH3Pn8BJ0sKIG5frrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FYrQ0oImcRmSbiS5VjSEUo33f8pNIpVKM/QVwSSP8rA=;
 b=nmmNE6x7ERDdwWqJpStPytgelMlt5wRdW/6gjcNebXqgdMm2iJDR8to0ma0w2JRhGyVD+PfmlbWlhcMGpHlQ0YNkuhavkX/MqpDsg26/S9Qu2qYqNnZK3qY8toagOIHPw85xJvlg1QfV1dYDJqoN5YeGF4GRIWZKAFBMR+OztrsI0k5IfbQxzkusxNhSFpgYuyP8XuI1xPEDvPXn5654wyyqIYqQ6yfiP/3i8XCmjwkmIiFL5CVireaFkUEff5Y9u34UKpa3DSR5r7eYTauyUYL3znvxybX1choyb70ZP2iPX76hf5Y+RiOg1xMJ1DOqbmwqX7xe5F34yCrGAg4ZVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FYrQ0oImcRmSbiS5VjSEUo33f8pNIpVKM/QVwSSP8rA=;
 b=T9adnT1fia+Dlm7yR4wraWb908VgCNqtfmgPES4uZ4VrDNV7I+Yf0yz5KdbOPVYB+p3hOA4zjKdH/dc+QQeBS4VUztgXFrsgnBWk3nISowezkQTbsd+zRv8r1mMrcpGI0fk9eFMGSmfcqBn7KLJXlmTAm8psh+cXDg83fdup8ii5Ao6ssBhW1uKvnYpDTKyt85T7ye7xD3BV9v5bMS1uTd71+qk8AzzwAHnQhhLCAqTpKmX4BcEyGIdT6cDMaF4DM/8EVM28uVhNBpuX4wy+UfFOcy391+7sYOJkBEVgZtFeBIBjQ9RNR1y6H9ZZHojspwPX17gsdDSogajlwfPgmw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 PH0PR12MB999111.namprd12.prod.outlook.com (2603:10b6:510:38d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 21:21:32 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 21:21:32 +0000
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
 Zhi Wang <zhiw@nvidia.com>, Balbir Singh <balbirs@nvidia.com>,
 Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Eliot Courtney <ecourtney@nvidia.com>, joel@joelfernandes.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Joel Fernandes <joelagnelf@nvidia.com>, Nikola Djukic <ndjukic@nvidia.com>
Subject: [PATCH v7 17/23] nova-core: gsp: Return GspStaticInfo and FbLayout
 from boot()
Date: Wed, 18 Feb 2026 16:20:14 -0500
Message-Id: <20260218212020.800836-18-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260218212020.800836-1-joelagnelf@nvidia.com>
References: <20260218212020.800836-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN1PR10CA0028.namprd10.prod.outlook.com
 (2603:10b6:408:e0::33) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|PH0PR12MB999111:EE_
X-MS-Office365-Filtering-Correlation-Id: 081d2a67-fa21-4a3f-0b38-08de6f33b045
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5LqvLIFhrcS5n/wzU3oAgKX6b+UA5Jjwwp764OuEN1bK98u/cZ9/rPdiG8C9?=
 =?us-ascii?Q?6aEtaiKUqbispx47YE3Qswaz9/F1jralBuYDzjjeMfIAK1y7+kRZj5CHIPza?=
 =?us-ascii?Q?BSzsUN89C+s87nBcBD48VrD0nwIZXcPWnyTX9FvzfeWfaTyJATXGgwvmEghV?=
 =?us-ascii?Q?2QhfSgqdX8eS3DVNP9W6lzfBP160KPaZCJptkwKGAuiXk9n3bws1PNNcqixd?=
 =?us-ascii?Q?nD5iFY5dej0VbMhoV0l0LffiQi17f3qMOR2Ns9FdFfN0piCi6Qr0ne2j7ydH?=
 =?us-ascii?Q?BPxbWxvqANpZQ6fcYXDBUeFTu/M39bcdA6Bs79ld/YxgqlfSGpFbv2yX/Prf?=
 =?us-ascii?Q?JAoZUA2DIBrzqBUs4abOx+KpzEDtDGNjSfocpEvzLggRF5nESYq9UeMTpMD1?=
 =?us-ascii?Q?gz4/9eDQPTzjWELqnYVG6WT1nOhACuySAb9xqh1APfbBcSdOEnesJscSQpxd?=
 =?us-ascii?Q?Phi3stSo1iJrgICqQPOzM9cvwAsPBmB4U6Pm0hGe+VDtZc5Z8dA+IXKOYIVl?=
 =?us-ascii?Q?0wUVShS41nVDmJxnS4oFIouwdq5LloiDsEn7b2QdC4pCGHux8lGCeA9g2ZKl?=
 =?us-ascii?Q?BZ7KJzx3H67IE8QJgMGrdixxOKSNZgNhMEHSYDwWCoHcwG/L5dGWf+NAqaM+?=
 =?us-ascii?Q?JnBQOwZc+PJLvC58lxYwBvcnMVU0hQ8zbSJYBMnF2RD3eUQGgszQpt78IjkX?=
 =?us-ascii?Q?KkRicha3CgZRIIs1bApv+hsSRQbYNSmazwpuiC3PVCDsaNppLzBmRZZqGphU?=
 =?us-ascii?Q?Kyzu7klPyXiYHRankwt4HskqGIHrFetjnw+u7DcUcFHYiaDyM/WQzPrgqdJ6?=
 =?us-ascii?Q?qv6neV/qdHJq2VbjCJRPKlCk7IG9ThTu68XlpVMD8iAOM/M5M4Kr7Qk8Dpcp?=
 =?us-ascii?Q?xN+67ZQaekyd07YMwIyMrurE0k1l1haRgBnwsBg/1TIxLweEsnXQTi7OAOVv?=
 =?us-ascii?Q?u5hrQPerUfgDH8NiEDp2UNS8rrkrh07nAcR3G5OAasA5Lw3KAI49cySkr4mm?=
 =?us-ascii?Q?1QN62AVfW7a7LKraK94Qf/YQKzPa4ALneT3xynDjmFkw4TUqQC90N/YU+Kyv?=
 =?us-ascii?Q?7fZXrzcl0artw2Q+Lpoboluydopd8wcZ1VYYJvJP5a/qrbN/Frc/TIHUVhiN?=
 =?us-ascii?Q?L6zn+3x3Xfewe1LI72RjbXGCkkfPaV46KbYjfP0Up5/DIo68JScQWdSYV4jh?=
 =?us-ascii?Q?vlVM2mYKcE2iDnjD3OHZbUJteYJmeR3YvUZ7Lwc9vUOWScdg5q+zZoL1dNbn?=
 =?us-ascii?Q?Wo5wZvzyrgJLn/I6ywgvoIdzpWhrbEjuIu0WJ/bQEVObePVBly9Jti/FbS0z?=
 =?us-ascii?Q?d0CEpMY5suzZRILiDtFD2fgwd5THGnbDh5UYsFGGsTnsCbEPinb37ugbTiNU?=
 =?us-ascii?Q?93n3ZFgyJyhzWhrXeGXmcnR1zzLT0U/jMcnB1B7W5rnONutOUOaaIoxQLhYh?=
 =?us-ascii?Q?6Fk0+WUh1n1v2OFpHs9XFBXjaT+BFcH8inxTgYyGlfDD2xpF/Q/xmuJmxiup?=
 =?us-ascii?Q?/IBvLgpo/6CjJ0+bpxb5wJeQZ7Tu9rYCcShz1PNOa44mu3igflQ/HL54aLTp?=
 =?us-ascii?Q?HHn6cbQt97s1ExKCPyY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CzowEYdZMvgKpRuEWHVDfNCX55zlNvL0mwRLkO4fKnlQKYpMjiqzp8UAKUAa?=
 =?us-ascii?Q?Oo4gE5SUMHZEgG25SXsmDVMx/DID8F1dfHEQyjdbhdh6DCpWVBCfg9LskD9h?=
 =?us-ascii?Q?vPAl7hzjIPvlLLQpNluAq4FzAznPTlB0Lf631Ql2+5oK6Kr8Ih2QHzgPNJSg?=
 =?us-ascii?Q?Pt5luIQetESBjQAqXfKIoF6W1NWItbUkuIiGKtvhowtSfpdTRUh/E0PN4U/y?=
 =?us-ascii?Q?YLNmZrstP2/mv3PeUY+zAi+bq/I8XaBKuZR1fH6wDFLyNhQjYeRQ8JonFmfk?=
 =?us-ascii?Q?kBwlK3kpGMISCsFmwKQBBrBdgWI6ukmcCjAJOpIAYKj6IwUgR9J64UQgDDm1?=
 =?us-ascii?Q?mFvaWLJ1Z1hm31ULysDjayEUqryHPUxqfeiO2Lj1zjnnG648kI9h1AGZXq2v?=
 =?us-ascii?Q?SG2PMRbAeCRsRTWL6asPjG4N6wJRfPy7dK9KWr7vsM6Esaa7S/7SI1/sSI61?=
 =?us-ascii?Q?bU/TQnpssM4mNuuNRSglYELlZQNaYoqF6K1ug/GMRAAt3LKVs46htI1yQECw?=
 =?us-ascii?Q?cQj9J2TeGFsNGdIy73J4wGLEvCUl6xZVUJaWC7b2uQ8ZOa6p7Oz3jAq46qbU?=
 =?us-ascii?Q?L4tMgo/y6/sGL7xcCc8hTg7iPB9KAlwyzWmoqFSOU8vSYQ6dXBGZ1JqfsDbk?=
 =?us-ascii?Q?5I/aMI0NnItMbgMRRzs4WjEuWhbXDPUefolra1fdapVmVYMn/Rw/IRyysKNP?=
 =?us-ascii?Q?hJYvzAJFezrTXZxCxwxJgDqsbP3PiJViewJ277tX4poqcOBQ2klrUvql7ukq?=
 =?us-ascii?Q?I4/jebLVJyfWYnrgjfRGmPYip8BmAWdjqdLA1BtZtKCjnwkmIY6S+WXHPQb/?=
 =?us-ascii?Q?EwSvu2qnsqfAQON9XAiySzeIsMKpXKEUoMSeurYG4RhUM6gHlNu7+H9fppxa?=
 =?us-ascii?Q?wrSyjFTbk4wyI07q0+MVIveTdEyC2GdpiH/DVNdb2zbVbPCatChs30dGWzWG?=
 =?us-ascii?Q?g0EuDGbTOCxB4ocI5vEmEtL1+qaqA8C6MsNrsyVC/SFf3Qtu+d79gqDbmKjg?=
 =?us-ascii?Q?QdO4a9w3qwxw5eo+RPKx919513ei5U7405WWBJaPjVl7rxRibTgRuxE8TGuM?=
 =?us-ascii?Q?WBARNMIAnEvqMClyHz9siiwKjj+MdBxasGNISZyD2i6R+lTnd1PY70zrisLD?=
 =?us-ascii?Q?c6c0ci9PQT991Hw32SP6IHJt0sZUWpARotepf4JorHoq/yxwdDOnBkgvOUdv?=
 =?us-ascii?Q?5yPfkx0Azjz++mMePkkUhDJr/8gtkVfwrXc+attVt8KjttFrN8HFzsnwi5w+?=
 =?us-ascii?Q?lv41Ui46oOWSpaOTtVoHVuUT43deTn3kzofgQr6XI+C+p6XnjHKthavwsKon?=
 =?us-ascii?Q?cecJ5jVntCZ4Gf2sIMMeBFrVX2TWH+3BHBBr8p5K/QSK618QscklU+DHW9NA?=
 =?us-ascii?Q?e2Rj5M6AWtuWHNVC9+lKhkw8norA5fvntdM2UPZ0oQVb8CKkMw5UxglwsehB?=
 =?us-ascii?Q?CIuuPTunzARIFC6Z9ny6uOGCMpmc/j29XnMrhqfvCiJkxb324rlZE0Mt+6vh?=
 =?us-ascii?Q?+vJ8vx4STS6XE08VyEQ1Xy8ebCqdu6T1KggZRUN8yZ75E7tsr/+GUDcg0yOl?=
 =?us-ascii?Q?q63Nbgp6lAQbPoBj0kOgHi0nIdGrbg3Q44kiqqZ/ixgdfxCg6X5euEAkN99R?=
 =?us-ascii?Q?kB4RWujxgRQIyVnfaEYG89OM6u51AwkazRmEAMiJjOgd7SBGBjYdEopKMEUq?=
 =?us-ascii?Q?vPEV9tVLtQGGrfBolmay+eFie+oyGRdPUe2uR6Ea6JiDay903jVm0hjPCTlj?=
 =?us-ascii?Q?0ZaQhFnSNA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 081d2a67-fa21-4a3f-0b38-08de6f33b045
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 21:21:32.5695 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PDHYbGJHWgWy8iPvSQvLSSxYDxSJtQoZSIkxMJ6bJo/HdVjg1heaR2CQqjdl3DAof9HFKrQMcpevs0AAGelXJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB999111
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,collabora.com,joelfernandes.org,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	RCPT_COUNT_GT_50(0.00)[53];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Queue-Id: 0EBFB159EB7
X-Rspamd-Action: no action

Refactor the GSP boot function to return the GspStaticInfo and FbLayout.

This enables access required for memory management initialization to:
- bar1_pde_base: BAR1 page directory base.
- bar2_pde_base: BAR2 page directory base.
- usable memory regions in vidmem.

Cc: Nikola Djukic <ndjukic@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs      |  9 +++++++--
 drivers/gpu/nova-core/gsp/boot.rs | 15 ++++++++++++---
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 396d5bf57167..e217e5c7cb32 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -20,7 +20,10 @@
     },
     fb::SysmemFlush,
     gfw,
-    gsp::Gsp,
+    gsp::{
+        commands::GetGspStaticInfoReply,
+        Gsp, //
+    },
     mm::GpuMm,
     regs,
 };
@@ -258,6 +261,8 @@ pub(crate) struct Gpu {
     /// GSP runtime data. Temporarily an empty placeholder.
     #[pin]
     gsp: Gsp,
+    /// Static GPU information from GSP.
+    gsp_static_info: GetGspStaticInfoReply,
 }
 
 impl Gpu {
@@ -298,7 +303,7 @@ pub(crate) fn new<'a>(
 
             gsp <- Gsp::new(pdev),
 
-            _: { gsp.boot(pdev, bar, spec.chipset, gsp_falcon, sec2_falcon)? },
+            gsp_static_info: { gsp.boot(pdev, bar, spec.chipset, gsp_falcon, sec2_falcon)?.0 },
 
             bar: devres_bar,
         })
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index be427fe26a58..7a4a0c759267 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -32,7 +32,10 @@
     },
     gpu::Chipset,
     gsp::{
-        commands,
+        commands::{
+            self,
+            GetGspStaticInfoReply, //
+        },
         sequencer::{
             GspSequencer,
             GspSequencerParams, //
@@ -127,6 +130,12 @@ fn run_fwsec_frts(
     /// structures that the GSP will use at runtime.
     ///
     /// Upon return, the GSP is up and running, and its runtime object given as return value.
+    ///
+    /// Returns a tuple containing:
+    /// - [`GetGspStaticInfoReply`]: Static GPU information from GSP, including the BAR1 page
+    ///   directory base address needed for memory management.
+    /// - [`FbLayout`]: Frame buffer layout computed during boot, containing memory regions
+    ///   required for [`GpuMm`] initialization.
     pub(crate) fn boot(
         mut self: Pin<&mut Self>,
         pdev: &pci::Device<device::Bound>,
@@ -134,7 +143,7 @@ pub(crate) fn boot(
         chipset: Chipset,
         gsp_falcon: &Falcon<Gsp>,
         sec2_falcon: &Falcon<Sec2>,
-    ) -> Result {
+    ) -> Result<(GetGspStaticInfoReply, FbLayout)> {
         let dev = pdev.as_ref();
 
         let bios = Vbios::new(dev, bar)?;
@@ -243,6 +252,6 @@ pub(crate) fn boot(
             Err(e) => dev_warn!(pdev.as_ref(), "GPU name unavailable: {:?}\n", e),
         }
 
-        Ok(())
+        Ok((info, fb_layout))
     }
 }
-- 
2.34.1

