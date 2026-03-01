Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KLYTGG00pGmnaQUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 13:43:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B43B01CFA8D
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 13:43:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E821810E1FB;
	Sun,  1 Mar 2026 12:43:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="R37TrYOP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011065.outbound.protection.outlook.com [40.107.208.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A2BE10E1FB;
 Sun,  1 Mar 2026 12:43:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mkJVGy3KDwkMK+SqL3XmKp440BDdZ8dFgGR30neHByZlS3wYvEVpD6yKXHXFzk/d2jzOqPqB3LB+y2iMIznFtg3ZJ4QfW2JdtELYyTlo9FTp3tXz7ncJAuwL1zifqj2Hl1God8H0nKCoSlMBs+jcfp7+Q26q3j5sKurC7H8MPe8yDz1x/O6DbkE8xz81EXsP3wcRMkE7s00702pHjzCL++PdrXe3Cr19qMymEhJmmHF5NhD4LbTJGPXNz8oLPNDNsUECYk+/qwEMxYrR08bZ3t0b3gZmlxltwh4FEqk+3y1+GKxKH9LOql0WmvjoKeZb0LcuMWT0Zq3jO2gJWHOR7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vzl1jJpkVgXPOVUpccvYg6DMZZZc6KAD8I8e/auUorg=;
 b=nK58dS3tBEk3pwNPYLrLBIwDfoBbNYY3+TwCJEi8pfNFbMx3EKgDl2Sxo6kzKXaxxe3X7WJubeYo4EX+JSb+cEUz5WjLQAsdK0T29qULU8/Qt4nmmuO5WNF698vSGucHFPj/s8oaMbwGK99LaMAfdeYf4ts5Ask0Xv2xlkBOOPzAJXN1rDN8h1SxWGUdVx/xB68t/M3qUIe+iPP9ZCuHaNUQv10bw+6DEjPNR6ne97VHvcQ7kbTKRKD9X0Li3T2Uq9UO/tnPSOAVuZGaXvomz4V+dVwB87Y1mnByVSpQIUybgB0XCYNcrmjVUHqsGpVRESenwqfVg6zsLOQ73tGnCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vzl1jJpkVgXPOVUpccvYg6DMZZZc6KAD8I8e/auUorg=;
 b=R37TrYOPQVPeXvJv2Ui54sMojNyx5wG0eJJD3bo29UavfRZ9jjyRio5noaz1RBnfhmJULkyuAV4lXE+3h9YACnstq2Hvg3nrCl5STjECIRocn8wkqR1nOrh2Dz5EazZIkmNndKutzs9hAED9F38tq7NG1JFsKlaQ5vpVBt/c3VC3dk+n02P7r2ece1W0a2f4CgYPbs1N/VffzKfDBGYgGqguDwdh/aAtQRcZba6h3HCkG4nv3i3bO+Lw2lPvVtJ0Rf2VqQJo5iXzrFO2ZxajQrnZG/hTzm63MOgNJtXAgd284FdaQNhItGmMv1yBcSuOJl/68WfQjtbzK1l1SykLQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV2PR12MB999097.namprd12.prod.outlook.com (2603:10b6:408:353::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Sun, 1 Mar
 2026 12:43:17 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9654.020; Sun, 1 Mar 2026
 12:43:17 +0000
Content-Type: text/plain; charset=UTF-8
Date: Sun, 01 Mar 2026 21:43:13 +0900
Message-Id: <DGRGDFASWXB7.3NAK8RRTCV88P@nvidia.com>
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
Subject: Re: [PATCH v8 04/25] gpu: nova-core: gsp: Extract usable FB region
 from GSP
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260224225323.3312204-1-joelagnelf@nvidia.com>
 <20260224225323.3312204-5-joelagnelf@nvidia.com>
In-Reply-To: <20260224225323.3312204-5-joelagnelf@nvidia.com>
X-ClientProxiedBy: TYWP286CA0029.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV2PR12MB999097:EE_
X-MS-Office365-Filtering-Correlation-Id: e9d7fa68-bf77-4ef1-6f69-08de77901c6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|10070799003|366016|1800799024; 
X-Microsoft-Antispam-Message-Info: YNQwnE693ANX+SMEwAEEMb7F52EopXcJaa62+yZ8oCGYFa/sX2wGbRJghuMO09YX2CAm9XQTzkEdoMW7tBgcykiajt3nlAiFHlQdPqLbgPJkrehfggvC7BDGrZF/f4xBaTyEC3yN8LEtoxKDELhAawdp4PeUwLlSgZ4TLCOVTjTFRDu6z2ysaGSOlBduxVfQpETY8J5exx5mtf9q4XDQ8zjMZgKbHY8AKL7QPv+TkggHFPhG85pN9XIgGeSyQRUj20mOB3dcsATuUV52irSiZUCZG5n3AVha2Cuhm8obkxZlqHmNBrxzdIj2e070VEv5t6/yat6tp03F6WU9q8xyWLICiFulAPFMxszsP3VH94OJawsPBfFB1B24sPVoMfIBJ6ziZ5WFr85JRQN2SusE2rer8MxEeayIT9pgJbi/Gymo1AAQDV5ihTtetKJFX/6NrpVSrmKTOA3idz5rLWDDmgrukmy6zgWYCNve8fzTE6aOLrhIWg2kUuEdgZUe4jm255EUejIm0//8Xv/vbMmx0l7fmWUU+zsvhH8UwRx4fSDM7CaDdmEi9Gi8pdUcDrwZyj+i4YYuX6PMPAmq6N2Q2Yoa/XDSR2yJv7IByQ9Qb4bvAH/NOeQVLb52qrO4o8RPvO4NS8dy4P09+kc8I4l9/oBRTj40Kl8DM2TnAqKrywOc5Cj1MKA7dI3Ia3fj7XQWo+Uj1w1xi4gFMXXa0PbQCrGopKaHvv/nY7Mrll6eumU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(10070799003)(366016)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGFwRnFjVVgyWGRHSXViRXFHSGtTVm9RdFlWcDNKbXRkWitQcit3bGtxanVE?=
 =?utf-8?B?dW9QUWNTMldOT2swdUxZS25zNHBIRVBBcGFvYWJDVmdWQmtnYmY3bzZQVTlF?=
 =?utf-8?B?REFZY3R6eHhlditza3RYSDhRLzJEclFtb2hjTXByRmVTWm1RZEQzMlozZzZr?=
 =?utf-8?B?WTYzQWw5TG5kMkZnZC9YelNZM2dFajM4bjBFWWpQbkJSelJ0dExacWNHNDlp?=
 =?utf-8?B?bGZ4aGNEZHZNVFl2KyswTVg2aHZUZmxaUnhSQ3NWMVprZzdKSjg5WjV5Yk0x?=
 =?utf-8?B?Nit3OHh5OTNKY0VkdDNVZlhNT01OdjV5WndFUnc4MlBTczA5bThOV1pBdldv?=
 =?utf-8?B?YS9Ic2JKVExuRjZ2UlpKRFNjV0VYWTRqTHFiVjJEeWhIUlFSb2NLQ2NzVUlQ?=
 =?utf-8?B?dFo5eHorTGN1OThBZHpVdzFxRlFycmNtOUdrWG85VVorL25mblpKQ1V2V3FH?=
 =?utf-8?B?TUxhanJGdzUzdGQvRWN6MnJ5YTNOcFZXSUYyeXB2MVgwa2lDbGxXZkhqc3p5?=
 =?utf-8?B?V2NEWUVUbmt4KzFFbUVDeTVOMWdaclhBRlZac2QwTXdHZzdMNW5ORDdtVU9K?=
 =?utf-8?B?N0NqOFM2SEJ2ZncxSUpROXdVbGJjUkNFOHdXSkRjU2drR3I4NmxWclhPdzQ3?=
 =?utf-8?B?RmtkcUVpSitTNUtDdDZnVXppODJ5SE5xRkdZM2NEZTNBeHA0Sk9vZE1KY1JQ?=
 =?utf-8?B?ZWo5NmtwVWRRWUNiVzk1QzRqN0JXby8xNVpoTVp5MzFmUlFaVWpxVXl2b0ww?=
 =?utf-8?B?SWJteGZkcm9LTjgrOWl6a2xOZGxxbXBIbHllRUpHVE5RU0NCbUV1YlI1cy9O?=
 =?utf-8?B?bHQzcFFyYUlQMnBIcDd3Z2JlNVFsOUhFSTh3UWRUR0VLQnlOSldiNnpGVnJN?=
 =?utf-8?B?QTJCcExiWlBQeGV0UktsQXNrRnNZOHlVWitTNzF0bU1pcUQwTHdKa3g1NzBt?=
 =?utf-8?B?M2FZRDkwYnRHQmlHMEdIL3NjdkZDVXlNbDRKOFNQYitoclpSZE80UXVqaUlM?=
 =?utf-8?B?UHdva1lOMTBXandvZlR1V3NNV2xWYUJreFd2TUlGcktpaXFPMjBPL3JvQWJV?=
 =?utf-8?B?ZmJBQUo4SC95WnRFUW5EdEVYZTFpdSs2TGE3MHRhaUJ5RzFEM3p0cDR1eE42?=
 =?utf-8?B?RXdPMERML2tuQXN5NXd0TFFLMG5IZXVqbkc0VTZ3SzQxWVNOdGNvaXl0UGxy?=
 =?utf-8?B?RUdFbWVjRlJqcXlLeGJ5c2o3ZzJaTWpjNU5jSVVXODkvVkNFNUR3U0VhVnJn?=
 =?utf-8?B?WE05NCtIWFo5Y2VxSmRFTmNvQXBHUjZjc0JtNTlyekk0Y0NKcXQ4Yy9uZ3k1?=
 =?utf-8?B?Y1BwYVduMlg1UStNME15dDFNUHBrVDR6QW1KSEg3bWV4aUJDYk5BUndVQUFX?=
 =?utf-8?B?NzROd05Gc3pZNXllTnRyQnhYbXhobVhhVGo0eGNYRGsxTG1penBrendJakhX?=
 =?utf-8?B?UjNtLzBScFExZkhtdVhXcGlITjdtaGkxRWRSeldEbHYrTWMvemlVQytxU0VM?=
 =?utf-8?B?UzR2cjd2WkdjZVQ4WTRJZzZYb0hLdXF5MDBSYlczeWk5NkJ3cUpiQ1Q0UGJM?=
 =?utf-8?B?ZkxONkNwd2l5dGRWUmNnQWxwRlZsaEV0aFR2LzVIN1NnaCsxeDMxZ0x4ZEJw?=
 =?utf-8?B?VEhyNmdzbEc5R2x3V2JpeFl6d29malBieEdGajdYMS82cUpoK0V2Z1Y0d0cz?=
 =?utf-8?B?QXo3M3ZyWEdYeWs1ZWpZZEpQdEl3bFVVbWdIWWRmZ3dvWTFORUpsa3Nwa1My?=
 =?utf-8?B?cis4bERhWjBMRndCc2RWUVNuVlBxSXN1ZDNLRTJPazFUYXVoenp1d09YVHda?=
 =?utf-8?B?bnpiRUcwYmsrSm94OEk1NkpqM1ZtQ09McnZjNFJsTmRtaDhVODdwa0J5VG1W?=
 =?utf-8?B?azNyQjA5eTlQdzdQVDVxZlFzMWJaWHR1aWc2U1A1ZHAySW9Tcmcwb2ZYTDhT?=
 =?utf-8?B?MkxYeEJydi9BREpjdmJmOXNFbTQ0QnYwKzA2U3RMSit6b0h2TUI4THRBdjgz?=
 =?utf-8?B?NE9uMml4OE5PT2p2YUJreFc4WmpDMDJUclVjb09tUEtqbmUxeXhmc2J2MllN?=
 =?utf-8?B?MEdPemM0TVF3MWhuR04rM3RmejJod0pDaTNocXhJbndScnNCRkJyS1ZUTi9J?=
 =?utf-8?B?NVV0U0ZENUR2Uzh3T0RIcm1YcHdidWloSXRHbmZqenV4bUVtcStuM0liK3JT?=
 =?utf-8?B?SEtzRFREMUhNckhUUlF2OTNaRGpPUlNkNGpqU1BHQnFhUHNrcW43ZExiRDBk?=
 =?utf-8?B?RW02Vy9tQVVHOE5nN0QxM2tTWmNpK1ZLWEFrRkNzNzF1d3RYK0tMc3lIVXRZ?=
 =?utf-8?B?S0hnMGRReml2eGVNRm9DeWhhYUkraS9vTEJQMW10YVJoSVVLclpnYnlpOTM5?=
 =?utf-8?Q?xqK1MLRV9VRrq1/ny6P1eTTMyM0sfbbXoeefM1tgio1CR?=
X-MS-Exchange-AntiSpam-MessageData-1: jSZqI+HjZKAadw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9d7fa68-bf77-4ef1-6f69-08de77901c6d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2026 12:43:17.1752 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QlGrNUR4Av0cc7sffOwpREzJClYhkxYawW8NiwaQbw6YBJyqVcC7EYJ8XfHXHrMkV+ZJLJp6/0pqVOrzHRTxNg==
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[reg.limit:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim,nvidia.com:mid]
X-Rspamd-Queue-Id: B43B01CFA8D
X-Rspamd-Action: no action

On Wed Feb 25, 2026 at 7:53 AM JST, Joel Fernandes wrote:
> +    /// Extract the first usable FB region from GSP firmware data.
> +    ///
> +    /// Returns the first region suitable for driver memory allocation a=
s a `(base, size)` tuple.
> +    /// Usable regions are those that:
> +    /// - Are not reserved for firmware internal use.
> +    /// - Are not protected (hardware-enforced access restrictions).
> +    /// - Support compression (can use GPU memory compression for bandwi=
dth).
> +    /// - Support ISO (isochronous memory for display requiring guarante=
ed bandwidth).
> +    pub(crate) fn first_usable_fb_region(&self) -> Option<(u64, u64)> {
> +        let fb_info =3D &self.0.fbRegionInfoParams;
> +        for i in 0..fb_info.numFBRegions.into_safe_cast() {
> +            if let Some(reg) =3D fb_info.fbRegion.get(i) {
> +                // Skip malformed regions where limit < base.
> +                if reg.limit < reg.base {
> +                    continue;
> +                }
> +
> +                // Filter: not reserved, not protected, supports compres=
sion and ISO.
> +                if reg.reserved =3D=3D 0
> +                    && reg.bProtected =3D=3D 0
> +                    && reg.supportCompressed !=3D 0
> +                    && reg.supportISO !=3D 0
> +                {
> +                    let size =3D reg.limit - reg.base + 1;
> +                    return Some((reg.base, size));
> +                }
> +            }
> +        }
> +        None
> +    }

No need for an explicit index and two blocks here, and we have iterator
methods designed just to do just this:

    fb_info
        .fbRegion
        .iter()
        .take(fb_info.numFBRegions.into_safe_cast())
        // Skip malformed regions where limit < base.
        .filter(|reg| reg.limit >=3D reg.base)
        .find_map(|reg| {
            // Filter: not reserved, not protected, supports compression an=
d ISO.
            if reg.reserved =3D=3D 0
                && reg.bProtected =3D=3D 0
                && reg.supportCompressed !=3D 0
                && reg.supportISO !=3D 0
            {
                let size =3D reg.limit - reg.base + 1;
                Some(reg.base..reg.base.saturating_add(size))
            } else {
                None
            }
        })

Another thing, although not too important for now: we only take
advantage of the first available region in this series. This is ok for
now, but Nouveau for instance does collect all regions - so we should at
least have a TODO to align Nova to at least the same capability.

But this doesn't need to be done for this series; actually I'd prefer if
we start simple and get the buddy allocator in place before thinking
about this.
