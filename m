Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4L4zMvYzpGmnaQUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 13:41:26 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3961CFA4F
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 13:41:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D29510E246;
	Sun,  1 Mar 2026 12:41:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Cfu+ixI8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010038.outbound.protection.outlook.com [52.101.85.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E540210E1FB;
 Sun,  1 Mar 2026 12:41:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uAF/wOVpbYZJ1c1TzgDIskc2g5P51nbtH+3jYGNLGD2z1gXgvWEIMGCVfyTWp+5e0eHaEElcEwcLf6onXWRxgRfRObWOz6AbWZzcrwuPnuQLG+97opERHJ7w5RKUiljMhW6yLrfRVQITK9HieE3fr9AX0LqMaof+DcaU0y5mpiJhUdHHrTiIG4ElFAFeka/Fr4WmvI1XbJ3003wAZ+18tV9aRcRzhbhLd+vCmc7ADhXToYEDQTUbcGiD+3NHP28LPT/KUXnlxm+b31XBpSveTE2GKJZbv9G5wRpUsHywVjIvegtCwZfyZuhgA+0Z2/CSDOjLvOI6Q3TBpQWIYSCvjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6SodWHv/lbK+drIOwcX3wjuY+W0DwNMnIRIzJWxssaA=;
 b=Qc4HKHGzJ0QQ9eSzUX3xbNris37kv6CqKaw0ktYjGeYibghwUQGJJTQf/0JSrHjf/m95a75dCSKPPGrR6xOSzVbgWvi2Hx5ohU9o9Ege74KfhG6qibWYZHO0OPnuGtzSTbl/llkFDvr3Gt5iVvth1sdUCAVEZsprNCVyeECWn/QE6oLNxaB2B6SQ3n/+BQf8M1DSzITEaRb/GIFUrhTHYbdz0IHjC06l1VgUO3iHOBg05nCnNMFWADKFcZu08sp2/LoyOUCeFIXj4GdZH2NH6SfKd2DAM0pf1iAWPlgneQsGId0Bm3YqF7i6uFosLSiu6qKiHJEzpFKCdKinKZuWvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6SodWHv/lbK+drIOwcX3wjuY+W0DwNMnIRIzJWxssaA=;
 b=Cfu+ixI8xa5Mxew4cSjGYqQmTxvbgOF5Y9CEkL6XC1/lds9js+RLoWJNAQ9P8hoLBIkMZkU7bXl8iJPAaBPEO7caGgWEWxwRwOdehRm2XEJhNVdfX3+pxKkl6To7WgkEtDb/Fiz3iCuVGspaNjRHqoil38Y04MlqEeWlHi3wKe/3KGNGe2umPuvj/tHjVB5iXksfK/yh0NpfovoTEY021SlrE3LU5Mth7CunY3SYpUDJrImmThB8vsIZnRvxoJBN67302JdZBOAdrwf1v3fwxoA/YyuP7q5hfa09aqaAQOVT83P+DC7mGO+6DReLOCyzAAQyCCvb3qiB6tFAEjgpLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV2PR12MB999097.namprd12.prod.outlook.com (2603:10b6:408:353::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Sun, 1 Mar
 2026 12:41:20 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9654.020; Sun, 1 Mar 2026
 12:41:19 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 01 Mar 2026 21:41:16 +0900
Message-Id: <DGRGBXN7OBMF.1QD1GGQ1UDPWF@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
Cc: <linux-kernel@vger.kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Dave Airlie" <airlied@redhat.com>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Koen Koning"
 <koen.koning@linux.intel.com>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "Nikola
 Djukic" <ndjukic@nvidia.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Simona Vetter" <simona@ffwll.ch>, "Jonathan Corbet" <corbet@lwn.net>,
 "Alex Deucher" <alexander.deucher@amd.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, "Jani Nikula"
 <jani.nikula@linux.intel.com>, "Joonas Lahtinen"
 <joonas.lahtinen@linux.intel.com>, "Rodrigo Vivi" <rodrigo.vivi@intel.com>,
 "Tvrtko Ursulin" <tursulin@ursulin.net>, "Huang Rui" <ray.huang@amd.com>,
 "Matthew Auld" <matthew.auld@intel.com>, "Matthew Brost"
 <matthew.brost@intel.com>, "Lucas De Marchi" <lucas.demarchi@intel.com>,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Helge Deller" <deller@gmx.de>, "Alex Gaynor" <alex.gaynor@gmail.com>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Andrea Righi" <arighi@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "Philipp Stanner" <phasta@kernel.org>, "Elle Rhumsaa"
 <elle@weathered-steel.dev>, <alexeyi@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, <joel@joelfernandes.org>,
 <linux-doc@vger.kernel.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <linux-fbdev@vger.kernel.org>
Subject: Re: [PATCH v8 01/25] gpu: nova-core: Select GPU_BUDDY for VRAM
 allocation
References: <20260224225323.3312204-1-joelagnelf@nvidia.com>
 <20260224225323.3312204-2-joelagnelf@nvidia.com>
In-Reply-To: <20260224225323.3312204-2-joelagnelf@nvidia.com>
X-ClientProxiedBy: TYCP286CA0054.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV2PR12MB999097:EE_
X-MS-Office365-Filtering-Correlation-Id: 34da1d7a-0d9f-498f-9202-08de778fd68e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|10070799003|366016|1800799024; 
X-Microsoft-Antispam-Message-Info: PhJZWGuTLSnXKMELPuJkwtE5lACmfxVaJlKHi2iOtrV10Rcf6+rkL3XEk7KIF7w/iMAd6huerQAAq0YHkKBQR+B2cV66gqZS49CDP+yLHiIk7xruYwS1cO3HqCtzJOtWnAazsFcFgA0tmYo7bh7VqfdL8WcLtSNY9TUDjA8agEwDxwyiBAmSvcsq1H3DGBud+Gn3jEh8Wa64q4s62VlynrKnWxKEoOzEiEmK7pQGqBPZLkhOvi4mhyXmhTw/4SDsCa1J9u26L9KT33NPvo0rFTFdI8QYWGiBpiu+K5rVhPommVmlFdUFo8Wfn61RyCaANSdZe2lG+ZUMydwf+aVgfgCl9uCXMoYuS48JkyDd+vh6BLqBYfPqSTc8eN23FFhvfkHDNnNqzQ1JrvETt0dUWJMNDv/+CxElq5Vbp3IL305WKwzCDHicMT1xmftEjRuhYFhbt5S9GpEEwYw2XrdO/QcKEro9Jn6mRhE5tOktkyJhj5UQchhU4ITqxZyFaixVSPeJ9b/msiI7rbjOwsd88hTvWLs66pO0eu/QEoWZBwusdc9Iz5Zv6OWca7XPVeN6H1d5es5w40ZriG5peiBUowTjeiFPISHUkcKT1ER3QZGMfcHwFUyTudMyjVoIIAQqFSbyFbHRIkqIdFl25JdvWkUHpLAt2sedyO9LCqKztdku5WUkuIONZ8prU/rxTss6wehvVOYL9nYUlXle0pIu71DsHOtb2F+3YM2FFBF1FRQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(10070799003)(366016)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SjlaY2dmZHg3YmZ6UVBDNG5EUk5aWnQrcWJLVlNxZFRoS0ZrREg3L2pmK0Zp?=
 =?utf-8?B?UmtUWHBWeHZFMHFycTJIV1Nqby9VMFk1WGNzaVluWFlpaXFKTzhReFJkMGFS?=
 =?utf-8?B?MXF2Y2NkbVphUG9rd0VDemd0MTJQNXgxMWZlMlMyRVNTSGI5QXQwN1YwS3B0?=
 =?utf-8?B?Nk9qWXFYMlBsUjFwcG5zcUJpNlp2Q1h0UHNSZDFSQXVCQnZZbC9yVHpYeUhZ?=
 =?utf-8?B?YUU2S0IydU5idzV1ZWZ1bTVqR0ZROUhrMmF1OWVkK1NuUFkyV2dseWM4VVZj?=
 =?utf-8?B?NWhOTVA0R2paMXFTRGpmU1FWN243RjJIOUZGTWJuUkM2ajNDT2h2MzB2b1Nx?=
 =?utf-8?B?NTFGeEVKdFFWc1pqbnlhV1RGdDU0RFVzbnhlSnRpVjF5SjlLYmlsaFhCM05F?=
 =?utf-8?B?UDFIWkFlQ1R6UjQwYk1IRGcySm1BczIycmVyVUZPZWl1V0pYWmg2cjZYSG1L?=
 =?utf-8?B?SGRDWWxpOGhaaGFXMzZldGNZTTJkT0tVWXFlZjMrYzlRM0pNM0FJaVVCbmZ6?=
 =?utf-8?B?UmpNOWhOWENLTmRMU0tIazZid0J3QW8zTWZ4RGpyaXJqNFptdzh2VC91ZUg0?=
 =?utf-8?B?T3IxNTU2TE5jUTQ4Y1BBUXNnRXRYRGc1bTY2enpWY2tYWjFrNzQycldRSVhB?=
 =?utf-8?B?eVhaN2JMeUxObkhCSkt2ZkpDNGRLRXdBQ0RENnlPdVJwUmt3UUU2UGI5RmdH?=
 =?utf-8?B?cGw3a25mcXBaV05hdy9tbSs4Yk1lSkVTMm5IcnhrTFVmRjU0TnhyYnMvSGsw?=
 =?utf-8?B?ZjFUVExxUWZaYkhaZUFTVVJpUm5zd1RRakJqc21KTGRCSzZJQmFQemtkWXA2?=
 =?utf-8?B?K1h5Y2dUaTlZVDAvekIvV0l2VVRxSG1iZkxsczZtRDY1aDhXb1dON2ltZ29W?=
 =?utf-8?B?K29tK3ZtK2xlV2k5bm5heTFGN0pTL0gyVmhrY3RIMnpkRXZFaTlGeGR1eGlm?=
 =?utf-8?B?OXFtczJQMlY4T1hTWUZ4SnV5TlRoWi9IVkkyZElMWmZhSUJLTkE2Q1NoUlJa?=
 =?utf-8?B?dFgyQVVLQmxIbzlNOWF6MUEzWkF3N0oyUmpQbWpJUlhNRXh5VHNuMzgvMHc3?=
 =?utf-8?B?Q0E2a3FSbmEwb0I0WThBa3c4VVZOTS9USXBGSUhNZ0pCVWpQUlFWNEJZN1JE?=
 =?utf-8?B?T0RaOGphTUZucEhJcHd0Y0NJVG8yVmN1VkJROGd2dlFxZEtkKzNFYmxXdHBi?=
 =?utf-8?B?OGVWakNEQWp4RmZVQWk4eXBhV2tIZmlYTW5GbDlEd1RsekZEVmVxTVBuZ21X?=
 =?utf-8?B?b3RiY3p4Z1dmMnJJTDhnY2ZqcEpUL01UTDNZRXlWbWtWUks4ZTZtbUpiSDFU?=
 =?utf-8?B?VERyWmp2SW9IVWRxM0FrZ2xZK3dkN1NwU0huWDVYYmhWbkFmL2RKTWYrWjJn?=
 =?utf-8?B?VXY2RkV1ME5nWkdZN1UvR3V3VG8vQ2FSTCtHOHJvaXJ3Q1VUdFRjTTlnS3Rt?=
 =?utf-8?B?YW4yanpXRTVvMEFHcm9ZZ0E3RVlEbEFNQXhDdFRCekZicUowTnJzTWo3UDZj?=
 =?utf-8?B?dlE0b25FcjRWR3RRVHZ1WlR3K2lsaHJrVzR5ZFRvNkVrQ3h3eHNsdGdzT1NU?=
 =?utf-8?B?aDlad1UzZHBYMlIvaFIwRlJJbFkxQmhMRUR3ZlFmNWU3bGFuT0JuYzlLeWdv?=
 =?utf-8?B?azRpaGNaTVdEZXl1UDVpbnBDeUllNmlDc2p3ZGJoYkhaa0RwYkZiQUViVW1z?=
 =?utf-8?B?NFBpYzR0TElvclZXdWN3aVpGTFhNam5iVXZWTmlDR1o4RUJZMmk4UVgvMlg3?=
 =?utf-8?B?eGxmQUdnL0YyeGM2ZkxNU2wrR2Q1b3NVenp0TjEzRVRMN2hScDZJcjgzN2JG?=
 =?utf-8?B?R1pSR3NaRUF5VUlpaXF3M2JuUmRmS2c1M3k1VDBNRnZadExhOWErWVVvNWxJ?=
 =?utf-8?B?RFZkRG5hRHZmeXJJZURTOVRPSGNzVkhMYkl4MkdiR2JIZ29nTXQ4TkVvKytn?=
 =?utf-8?B?OVdzSk9YSk16NEswd1Q3REFBRWRSV3kzN1JxbXR5elYxaFVUN3RJVmtOaTFV?=
 =?utf-8?B?RDdpZFBHUGMrSVkyaEt0VDhSTEpIcnNZWjYwT09PV1RJVUNzaVNld3c0YXVj?=
 =?utf-8?B?QUg3TWM2OStwWWRlYSs0MVpGT01KSDFHaDBsWCs3ekh4eHJ4NXRxaWMrNEp5?=
 =?utf-8?B?MG5WOXBKY1NuWDNtSnZWanl6VlU2SVF4aEhUaGltTWpnTDFqeHc3TU9DSDZV?=
 =?utf-8?B?aDNNN1BFZHhCMXFjYlkwRFpoaDhhVnN4aUZ5dDJHRS9NUmxwNG1PQ2psZktt?=
 =?utf-8?B?TW1kdVJJU0txcXlGdkpJU0M1eFZmZnlIWTRyanNRQUhndysvWWYvb0RqUEoz?=
 =?utf-8?B?d1ZkakZ2ak8yd0wxQzlzYWl1VjdURU55bFJaai9vdlh3KzMwaVNnS2VDdEZx?=
 =?utf-8?Q?spsaR8VERAmABNtanDA4fVXEapgdgTOqDEKYl8xkUXG4H?=
X-MS-Exchange-AntiSpam-MessageData-1: PHdex2xCoxeF9g==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34da1d7a-0d9f-498f-9202-08de778fd68e
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2026 12:41:19.8738 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CaeQ8NRE1JI9LG0GWyI9LosuL9Jp3EEXkSEM74npwmqFzO5jIAczBsWLvikjzbUsJhID8Bs9KkiPCaez30gx0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB999097
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
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,redhat.com,collabora.com,linux.intel.com,lists.freedesktop.org,nvidia.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,gmail.com,weathered-steel.dev,joelfernandes.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 7D3961CFA4F
X-Rspamd-Action: no action

On Wed Feb 25, 2026 at 7:52 AM JST, Joel Fernandes wrote:
> nova-core will use the GPU buddy allocator for physical VRAM management.
> Enable it in Kconfig.

Let's merge this one-liner with the first patch of this series that
actually requires GPU_BUDDY.
