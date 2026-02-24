Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOE8HPIlnmn5TgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 23:28:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E1918D383
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 23:28:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C448410E640;
	Tue, 24 Feb 2026 22:27:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WpsD5B2g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010002.outbound.protection.outlook.com
 [52.101.193.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F167310E207;
 Tue, 24 Feb 2026 22:27:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PrqodZGpLb5nyp2FifkS1Up7rtXKryUrd/cwLlX/zSpkYPWUvHpmnW9r55IRResf6uThApow5TCmoceYjGKOH541gl6UZ2oPJlh31zoNyfXdp+PjWnSi33jkO4yE9odFIjPjRzD4jt7ub7NVPrnK4+jtORfQWfh31UNGBwVtqMOzLn0TxVXHggXz9+MuqXl9BPM8An9UUMJ/vWpysVrpRnBxnbXtCovDIGw9BNBDSWpbZA7eFPc9Vfyj0Mtfy5tDMJs/qEedB8mF8g0mxY7AcjR5d2x5YTINfPKac0NoTGM1vrzBKroSqb6XsLakHnhR6r2EDmkhp5qLKRWQMUAbXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xps5yIEYa/Op1bdSplu5XssbMe3sxjwXBf55M9zp8o4=;
 b=yz7DYI/Kys3CLEuAiyqTp3GS21ClM57/2RMEzPWqOStIuWtrNdFpbosYcey7e9HXrLKIw/NiDUCtl1Z1Dg/gSQQaXxYBUcM9zI7PBPYCZ2mCuhmvp8c6HaNo/AbjXsBqeSqtlf9nBawCPMZC5N7g8ewX6X1dbsrG9U2PETDt94BM1xi/IQALckPV4qN2tiYMMFjH5ReWg4bkwbJqKRw8Y6JsclqixowEAZL6C5vn3jzYUDuAk4Nn6gVbaaFPbYPhnYQ9SSFmi5XBSq9cXUQhCJEeeE8cDXLBxG7dlODYUSKeiAEzrkHZ3OxN043A0y+e5hyLfxtKO/kexPGcdwczBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xps5yIEYa/Op1bdSplu5XssbMe3sxjwXBf55M9zp8o4=;
 b=WpsD5B2ghRFVip7/CLWf8ZsPUiXorJ/+0Q3aNZIpl5vtFR5Hd5ibQPwM39pub1C2/OpuoxhFYChnCmDzY5xkLjYML7Z/LtWuAeMEdGwPnhSaLRBAqJrMb0cnXPXHnN7am616f94Lz+NiKjom4cKnQP+8N1xT0Muu2arRUttwTF175m5p5E2RYwN9WMKpmQLzmd1K27Z0NFYu0kaG0LpmPodXkqChtpCHL54FOrGGvLFNgY7yRigAvCEDuvHhXYjuoPy+6AID2Yg1A6y0ZC1VoF2okN98fxoLKpKy5A69tTkALEz6yAgP7qYt0/HyPE4iTiKAHVGhjbo7SIjf6Y0RQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 PH7PR12MB5855.namprd12.prod.outlook.com (2603:10b6:510:1d6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 22:27:43 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 22:27:43 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Alex Gaynor <alex.gaynor@gmail.com>, Danilo Krummrich <dakr@kernel.org>,
 Dave Airlie <airlied@redhat.com>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>,
 Nikola Djukic <ndjukic@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>, Jonathan Corbet <corbet@lwn.net>,
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
 Helge Deller <deller@gmx.de>, John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, Andrea Righi <arighi@nvidia.com>,
 Andy Ritger <aritger@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Balbir Singh <balbirs@nvidia.com>, alexeyi@nvidia.com,
 Eliot Courtney <ecourtney@nvidia.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH v11 1/2] rust: ffi: Convert pub use to pub mod and create ffi
 module
Date: Tue, 24 Feb 2026 17:27:33 -0500
Message-Id: <20260224222734.3153931-2-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260224222734.3153931-1-joelagnelf@nvidia.com>
References: <20260224222734.3153931-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CYXPR02CA0014.namprd02.prod.outlook.com
 (2603:10b6:930:cf::20) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|PH7PR12MB5855:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f65e95b-ae11-4a66-c4a4-08de73f3ed57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yaWiKJ+Ps9D7Kq8ctTnShZXagswGgAiyxj3doB1CSWBXjuraYqSPlGfE6tSl?=
 =?us-ascii?Q?lu0HA0QB6VK2jc6gv7dT+A9jmhXUgxGNELjRYZKrnoxM/0QYPajabeOX0vk7?=
 =?us-ascii?Q?qNLxxoUMagAgQgjqaFZ1+UM0P5819LlsqEmhvglagoO+Hrqgt1z22rQ+dm/J?=
 =?us-ascii?Q?HtGEw6pX13pMy3yAd+vu3lSrkasMAKsjsl3dHGg5j5r7pG5ehH/2ScfOpGAB?=
 =?us-ascii?Q?aJvRSmvArLdVXYhsQd2ttl/lN3zwrYS1t1Lmz8VBNMcFH7l/nKpiV0uD+BVY?=
 =?us-ascii?Q?VUldwqY39kXhv4RJq+SY7teTzeMIKW0GGeNlcPRCdiGxOEml0bN4rPyAt9ex?=
 =?us-ascii?Q?g3yatFbgEi4DNc6nUFJMHflPyNJeBsXjisq6uD+IfDspKChwhAkNdC3lRbn4?=
 =?us-ascii?Q?Pd+UKcPCZCyFy0ZJyHViKGiEl9j9L7siyWy7/AkYgxls6E9NRD1ZwcVifl5E?=
 =?us-ascii?Q?tVvLU7pAJypY7Yq7VoMqGLPZeXwte/AbI2HQ+F50bPgzDF5Fr9VjUqeWWRWO?=
 =?us-ascii?Q?US3xrNFSjVh6ZXc65jUR96v6KZq0tVY/kloMu2kfZh1DBmv19gI8RX/9msH8?=
 =?us-ascii?Q?LfG5AaHCc94n2Un0BqwE16UT8o805FmuiF8+7aUiPkEPzpmhCPtlRGGTSaBG?=
 =?us-ascii?Q?UuDUY3t6WNZINMixAc+S3sa5QC5K+vp+LL268tNHZhkvEg/kcwJPtPTRtO70?=
 =?us-ascii?Q?WrWlAFb7DYCrL7NTyb98Ln87GmobzeA2PIGTgj6WNs464ybc/GRMHvO966Tr?=
 =?us-ascii?Q?j7a45sjRYIe0BKSH0kI9bl8K8AyeYELh1UhL8IsK+twxpH+sgEgzDH8BABxl?=
 =?us-ascii?Q?fzpG2h3nwexjcRtx1+bPpvC5AjcVqJY91ArHzCoMpRO4GtPTTTju5X1b0Xmt?=
 =?us-ascii?Q?s1XNs0MNRGFv0oJrD+WZscBP06tTIz+ZKuatKFQDGa47N6M6MdkdNMB87qiN?=
 =?us-ascii?Q?B7EQ359ztOisSEOGydVHk95U9SVqwUxWXsDrXUg13Yd378AfOcoQ25G2ueL6?=
 =?us-ascii?Q?kbiUAviGBvpSXbVZNpde2cBHI4mCrdsEmrK64hOa2n8QBUgmRXml/1NVA66y?=
 =?us-ascii?Q?WL6dXMs6fWgG6K+s4pFaSQxWOba/MdlfENm94zvZvR3/nId0XGP01byIL2WX?=
 =?us-ascii?Q?vlbh4mGB2vyWvmTfexSeKsx4SEQhPjAbRIvQUlHMmck9YJSv13CYaWm2E84e?=
 =?us-ascii?Q?MB7IdQhefdsyCjVD7jmTCi+BeYE8a9k1uHWEPc4Pjsz6EuMpxjcs/rBj1G76?=
 =?us-ascii?Q?MTat5oYXJm1ykgG7bYE1w/2Tf4kFQrVaHk2dvN3mRUnRd7YPFJAjaM6RQIBN?=
 =?us-ascii?Q?qzNowGUm6yWV4oWDskWwh1Ksk4ELmzb3Ts88E9cw5Y2IqQ8GDVLofqUvUCKh?=
 =?us-ascii?Q?01NNKswfMabvT0+vtmUnCwcvf/fUFz7DAm5XxtL5xsFWsN9mmjuHgd8jHrrn?=
 =?us-ascii?Q?N9gtzEu8wAdnFek3o6VI8GDHzJYcL2ZtCBQ+DvGsoP+HWmOKaQeRWgYOj3s2?=
 =?us-ascii?Q?vSSbI86k/+z8a1FltAAiY+mXNzNJxIIooLIlZmcEBwR90aJWqs8lf/rV++tt?=
 =?us-ascii?Q?guxsPbxchZOZfr1OlGY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MvB6QBEXCk44e3lVXRswf3Zn/QoPTMF86khzBdlXEGRivvlCACHHDSLylfNv?=
 =?us-ascii?Q?CUQ3qtR/SytPcrviHMwI4v/pCaOVO0Mx8lKQODox09U5p32KZhFyxmI3+Ca/?=
 =?us-ascii?Q?sJbZfQjRcTZFG2iREa1wmGWq3SklyMoVQvO4yLGYpXj3P/I1zZ8hfizdUkk0?=
 =?us-ascii?Q?oTTFO9OYzqIqcV8RfngsMuilioqMpkDeDxjGslXOmpE8XkDQwB70hM0IR6W/?=
 =?us-ascii?Q?xmi+RTcSYnIDqZCqcJWmN7RXZA8pX9wcpXWoS/TRn5WZxzPuBm9SRu3sjjJy?=
 =?us-ascii?Q?J12VXkPBq6AIC0uFlL362slyqFQknQZHMMCpBmd/HCam72BWKlJ7mqPwOKp7?=
 =?us-ascii?Q?FUGoO6O1sXslVTBYM5JiqyEFzp9Vn+bm6sCDykWKaWBBHXPBUc6iXhlYbsX3?=
 =?us-ascii?Q?rW+hkvPAl0lPIQ4mBAuVH0pudza7iL+JoKoZycxvwMr7n5n/pUx+1TbKHvgH?=
 =?us-ascii?Q?wg3OTbKAZIPQzxOod49Fl+4VB2WKN66LIcuORjMlvXBJHJjiJfweWH4nh5/g?=
 =?us-ascii?Q?34wC7HcHLQuwPGYqjTl41AI36gQjVkfwH4b5awyJUkRYIU/waXG8XDmVFiml?=
 =?us-ascii?Q?KRHh7p9dSspleTa0UgMihWfVqKVwuFvIDpuOvDdrsTnmXVfrrcVrNFfV7i/h?=
 =?us-ascii?Q?d2e3ygdLttcUpkf6VRtWUe0gdQJshBU8t2TFih0C0HnOXqn2LnQrpSF4P54N?=
 =?us-ascii?Q?Kii9nZ/TpMtjLOUflXMqGNrUBfQYl5iHgS3ujnIWpmgdUqHeTM0tF9bE0GwW?=
 =?us-ascii?Q?L/z4qzXHbKwFG1uHP40igwg7+uUtlXI/kDMQ2OXfUmNm3jO85llnlbbmM+LO?=
 =?us-ascii?Q?WMv2pG576BnYv+xt4w4yJFwUgNoc/QwfemMhaxeF/9rtx8d6zY4dqMwakhim?=
 =?us-ascii?Q?Z3mMEsZisnwn8p6TjdOI8/StJ+Xa1SMfFXuBLHM8crrndymBtVf62m9BxFTV?=
 =?us-ascii?Q?y2ZtdzRGYCivIUimDTJlmJ5MjpRVMyiM3+5G4l+i2KxGmBoL2xy+bsnHYSdq?=
 =?us-ascii?Q?gPSMczsBd3to9hQyOTQEUC5p4Ab/C75JdPXhBea2AWQvlCgVOTjRZWovh8l3?=
 =?us-ascii?Q?HeMKH00Oe3NPc32U92nl2L5jdissWLyxI0v3XQyDYE88Lt6oQ+BkaugtRF+l?=
 =?us-ascii?Q?AdHZ+XnafOyh9nDMvLVeu7T5f1hsTsnW3UENkd17mrutzX5Jmp4KBC3PYuWh?=
 =?us-ascii?Q?vb/Xxh50K0P6lpVYFOpRUJ718m1wxxXhOi0Eat1/+ymnPc2Gy9SAe2IBaNaM?=
 =?us-ascii?Q?m0+zAqoSlJw95yqJu0Zo/rsFL/LhVIoO7iwgQQDFzgTCidxg728XssAjBUuo?=
 =?us-ascii?Q?+MsAjd8ITNQuDe49S/Me4r7ZfRRIQMyvfadqzSCS2WGcYU2o79LrGNk5/SRK?=
 =?us-ascii?Q?BNAFiX6PklyrYWsMJbZ7Arlkg5ti2hNtwX4L7m4eFZ5lSpUPgRWKJ0SzIwAy?=
 =?us-ascii?Q?LA7NvZ3XjYHKYIw9gUysKcWdIZwl7CUhe+8uW6RZNzFX7i7Ng0qrH/yURmDP?=
 =?us-ascii?Q?JC+F8zRUslv0OWbmOaY4YVyWgl8Q7sXKz3ToYB3fFzPU+F1R91EgUj+FMhjr?=
 =?us-ascii?Q?iNif+dXubrQqSVwrWjCyt7m5SOD1O71PGR58gcqhtEje6xGW6jYmfsU3EN8Z?=
 =?us-ascii?Q?+8peVBB+lTjukFPbanSZ/zCalABrBot+9SP7Vq6+T++LwiYKsM2c7FIIdy8J?=
 =?us-ascii?Q?Y+9Cm/qLVTgfo2LvAGDlF0JU2OOthv9NKjWQCyEP8YIz+/DotwKCDZql44Be?=
 =?us-ascii?Q?hmum2B3L7A=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f65e95b-ae11-4a66-c4a4-08de73f3ed57
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 22:27:43.0821 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kMm+CE6UT7epqXjSotioTlujgidPxdBL1Id4tWk7rFVtbPNUfKNKGA5nJTakhzxoWfijhlcNEvrTYgZMU0cKBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5855
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
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,redhat.com,linux.intel.com,suse.de,ffwll.ch,collabora.com,nvidia.com,weathered-steel.dev,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	RCPT_COUNT_GT_50(0.00)[55];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-0.852];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lib.rs:url,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 20E1918D383
X-Rspamd-Action: no action

Convert `pub use ffi` to `pub mod ffi` in lib.rs and create the
corresponding `rust/kernel/ffi/mod.rs` module file. Also re-export all C
type definitions from `ffi` crate so that existing `kernel::ffi::c_int`
etc. paths continue to work.

This prepares the ffi module to host additional sub-modules in later
patches (clist).

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 rust/kernel/ffi/mod.rs | 7 +++++++
 rust/kernel/lib.rs     | 3 +--
 2 files changed, 8 insertions(+), 2 deletions(-)
 create mode 100644 rust/kernel/ffi/mod.rs

diff --git a/rust/kernel/ffi/mod.rs b/rust/kernel/ffi/mod.rs
new file mode 100644
index 000000000000..7d844e9cb339
--- /dev/null
+++ b/rust/kernel/ffi/mod.rs
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! FFI infrastructure for interfacing with C code.
+
+// Re-export C type definitions from the `ffi` crate so that existing
+// `kernel::ffi::c_int` etc. paths continue to work.
+pub use ::ffi::*;
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 3da92f18f4ee..0a77b4c0ffeb 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -62,8 +62,6 @@
 // Allow proc-macros to refer to `::kernel` inside the `kernel` crate (this crate).
 extern crate self as kernel;
 
-pub use ffi;
-
 pub mod acpi;
 pub mod alloc;
 #[cfg(CONFIG_AUXILIARY_BUS)]
@@ -93,6 +91,7 @@
 pub mod drm;
 pub mod error;
 pub mod faux;
+pub mod ffi;
 #[cfg(CONFIG_RUST_FW_LOADER_ABSTRACTIONS)]
 pub mod firmware;
 pub mod fmt;
-- 
2.34.1

