Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAe2OjDpb2lhUQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 21:44:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 998E74B9E3
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 21:44:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A25D10E697;
	Tue, 20 Jan 2026 20:44:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ipjOho03";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010061.outbound.protection.outlook.com
 [40.93.198.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02E1A10E671;
 Tue, 20 Jan 2026 20:44:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hPOELA4RCc1I4Kxh89qQdE3snwFH9dil9udr5WdQTk/+h5BipFCg3ZvAo8DAuqUaacU7YuOBEtE2ovUpQLjYUBm52IO8uleB1vdWOH+OrOrxknLQjFnpkBfNp52Nzmqq/r5sNDyT4AnkrISJ5Hr2/ElTyx2N0sfDGR8JcAQol2oDMVl+DtJwHUNDvcJbSANxpp5KFnTrysF1zn95IN7CcQy//MAEjrdJm9SuYGpCGxbru5U3hgwlR0fdxifHHNuYq9Or6rLtMzkbQ3/nF9YTUskVbb4ltjJcyr142kzTmgMHEbQxJp6CIHrDzNQW+Xewx2e8qrLIT29wVfZNLx3GBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tTXG+TgdX/HtCScxD574jMcpp6DCh3lbzLSpC2RrNnw=;
 b=c46DdIYZ/raqVyprngzCAEpyVJLp0QQJos18PNUxmQ+M45MRO5+qLccMsHwVGtjfqtxf26nRdFquKUJvmoM3YOajKY0QB03dc5LGDZ3xt1QUA4MrrjSlk0VuAM9rC2Xs/KJDICpEvBqAXE78oCuUo79UCRecbjwajn+Ijavgx9ts1/p610MYCR7C0LhOQvbHS85SknFF5LFB1NnVwfTwQthM3hBL2WspXr3IOZ7YLWEsbT11itj8mmqipx9KpiD6Sodsc1TFfYDHcJJfHGKxo3hEuU6kcWWYjL+N0QLgSs0p2WELjbOFPa+79iULQEKB+wrNk/zYmnQzD1AG/L5AaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tTXG+TgdX/HtCScxD574jMcpp6DCh3lbzLSpC2RrNnw=;
 b=ipjOho03ibMI6G6KhZJxh4ToKjbqNr4rr8DjvKdchtpKEC1DJi8/cU0ChsyjWJ/x6LrCc6jvBe2NwobMgyBHlzAUFIYkQGUufeeBovesPN0UosXSdzYrokQVCyEe2C+UP2l3DZxaZsUhcCDYxh63qIRY6axcQuu84ou0xTnHahbBY7XEkDckwKWyQvbz0cGLX3TUqe1P2Y7wedFU+UJqB0pqhm5CbnLplafX+GObQV/ldjrtOAkL59AaCD9kzEDlNWSW2BiVaZee0P/tPp/bp4LXS/gltoUrxpEQZj2rwMHuxkMSiFMvOU19/vAegc8zxIsboeAKhMnZfCGtntN/Rw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 PH7PR12MB6809.namprd12.prod.outlook.com (2603:10b6:510:1af::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.12; Tue, 20 Jan 2026 20:44:13 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9542.008; Tue, 20 Jan 2026
 20:44:13 +0000
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
Subject: [PATCH RFC v6 13/26] nova-core: mm: Add unified page table entry
 wrapper enums
Date: Tue, 20 Jan 2026 15:42:50 -0500
Message-Id: <20260120204303.3229303-14-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260120204303.3229303-1-joelagnelf@nvidia.com>
References: <20260120204303.3229303-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR01CA0064.prod.exchangelabs.com (2603:10b6:208:23f::33)
 To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|PH7PR12MB6809:EE_
X-MS-Office365-Filtering-Correlation-Id: e0d5d854-ca0b-4d37-5201-08de5864ab8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YlVmRlpt9sQagsj+uGY6fQWq0DxRJhx6jnlQkALgoL66N74wRrykjhmOcfg1?=
 =?us-ascii?Q?+1hXxhI0Szq4tFgEqirrRQx2qlQlSguREduuHveIQHZ0IvBe17kJE4d26jCH?=
 =?us-ascii?Q?YsFYjVXQuEFJVjja68L3wjdVz7hoZwJSFIQopFdJ+bSFDJPAf+2EEwZSZHWO?=
 =?us-ascii?Q?5byyzXTUQAzVYrj2FK0fIOHtf7ZGiXaItvKvnjE57rc+QCel53+Wr/VuXiE3?=
 =?us-ascii?Q?WsHoZVdHCA++Jbm1SbL/E1AOErsBaDqHAHl6EkyglQBIaYLPYF6vG1QzElIB?=
 =?us-ascii?Q?Z7QB4EF5rSH39Pkf1k/9T4nUHpxxFJX12QD3UZmLj8jsgRWGUB5e+7j+kvT9?=
 =?us-ascii?Q?ocdvT4PjeZlS2XavROrOjN1Jr22tfIfYm1PPq5i7GuxTGB9jY9aAyezND8oP?=
 =?us-ascii?Q?B0ZRdfzxN3048q0ReJ5L7TgBXSlI64zAwUSrC9RaoiqY7hBSSTky9wV10459?=
 =?us-ascii?Q?SEEO48EuuNqoqWNa+Jy5yRjuHQSTMmRZKsLJQL0+cU1MTdGuOU4X45qfHCKB?=
 =?us-ascii?Q?DCbfHlGIyskyeuXtgDIKK/HeecvoX2LbW1UH376ngQ+0TGPAaPDiR2YIufA4?=
 =?us-ascii?Q?OrnNsN1CHMyvA13ytWUiSIJ58JNRRpRdx1d8QlSdGQ+iv1QlMbDZSTZETsqb?=
 =?us-ascii?Q?YM1LDKIb2rcfc6193QIcueefVPwXuShyEZGEVbgBZWOoDu5LnGa5WK4UsjzZ?=
 =?us-ascii?Q?jbwan/3SpyPpptSj94PH9Nv9cZGaK7ltgJVU7zknHyAGf7fVj/0Xjfw/vX4Q?=
 =?us-ascii?Q?vHIjV3pFObDOSxociTvCHVDeN5eVsY4NcCEpMbqgiC3Aq7piYSvLuL5283c/?=
 =?us-ascii?Q?IYVDJ07QBo0ZdN6p1QQ0Hk8bhU5m4gE8lhtPhCPE4uFeCOQfmruiGGovD3Yk?=
 =?us-ascii?Q?sS2YLhVShwpx7xo9tKx4fDMSyAmfgE89/pQ8Ih3rHHxDykpWN0+d8vXXooo4?=
 =?us-ascii?Q?BbGk9/kbq9eibgOGfhBgFOqH1iqrAdAO5xMq8nR+xS9CS0Kscl/xEsaLF7Pl?=
 =?us-ascii?Q?ln27VzaQcZnIMTbYPFnQtfKq08jRMY5VDOxl/747EgB/7OMEdBTxO5aXBad6?=
 =?us-ascii?Q?8FTPlWDGo0H4en1uarRCpmPYjgfp4jW1v2V9ljvwQ/EhNaV3xFRgUICutju0?=
 =?us-ascii?Q?lTKsUhwdpmaJ6b2VFlX2XLH2f5vG6CCMnCBt87N6Ah0RFEgBTm2OaGEXSuFJ?=
 =?us-ascii?Q?TFzufK11xgeynjzEuSvVKk5f5vCzohmYqAD/C2IdiEFE2GXMyujBEXC0byWx?=
 =?us-ascii?Q?IiffuunGPJffequftNi94MktowRsiCcO0ofyukWj+/lik3HyGqmkelpPbaLo?=
 =?us-ascii?Q?fjSyYim34StmhT/Wcum/YuDcFHHdjAayuHG86sB0UIC9ypTej1/4bwqxu3Kr?=
 =?us-ascii?Q?creMb+jJvUnw0JKqadb75UfiuZb4swLl6sZFYbGYct67MHUuJz6FKjJKTDX6?=
 =?us-ascii?Q?y01IN1DdotzvFWPy9NaOOjWTQxj5VDy1JfBbgPXNjsbYU2LVR0GPh6+KgZP0?=
 =?us-ascii?Q?BAOR5dP7zhjosAbpE21uPBieDDTjLZBDwApO2+NPyzGtYiERBolVsNI7oTtW?=
 =?us-ascii?Q?GHFEqYp6n1gGrESv6zE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oeBrQVnnbSXXsfosj5lkK7jgcO5Jm0zT0gt7LGbabP9qi5PvE/hdEL9jTXBs?=
 =?us-ascii?Q?ftIulQOXn9fSnO42Na2MDHlOPlhHLxL+aEyT0iHwXKaqPSb5cF8+LE7ljFj1?=
 =?us-ascii?Q?yvZCIDi6D1P996yEEN5j82CAsCibLM9PMZCNzYlGFuDwKdLu7Qo3ov7Z64Ok?=
 =?us-ascii?Q?bKFYXFq10JxDUePsJDrpwn1ZlZp5LsG0w7L60/dWQiEnqiSbIJ0y2268B1Pt?=
 =?us-ascii?Q?+VJC+YwPdVv7tDMAvqAUYUP3L4/aiaxpEc2zrNsXitagLPX7bcPWkiVdf/NB?=
 =?us-ascii?Q?toCRY/lLy9YtlQenDZWyBy14ZKH5ykwGvDcFlrKKvvwlLQYs0BToLUGZNRq1?=
 =?us-ascii?Q?8ukD9kKxkU1pPx2dhNOm7m/20nYuL4aEd8DLmH9EtcYaEq/i904CETASfm5Y?=
 =?us-ascii?Q?5mYcGA7P+ybzjOaQmkwjBb9Ckz0xYuIMmwMjaB4c7XfNinVpURwj8FY6EGU3?=
 =?us-ascii?Q?G+WX014V78KxJBc5L0NAAzM7wnRcco8mkFVRscs7YDsM3PU988FE8wYrTrFk?=
 =?us-ascii?Q?ldtk5Ksa7rGZJhHgWPdBbwCZvFXfCnkuqVEHodB3Z7QWB940xc9TRvX4DGed?=
 =?us-ascii?Q?FeSePhjs67aQVT7Esk6Jhkkcrb7vIDm2xtsYV8LZdO1yug6yY58csXWeS3qw?=
 =?us-ascii?Q?lYgI+oORbJyJnqt9ZuY7tmY2Rjnsn6XHatNbVl3sA83re/XjohljzOSSL8Pg?=
 =?us-ascii?Q?YqFNmKmmSEJsGbTOIdEQg3vAIW9/F/nlyS5ZGXiCftr4RCr7exFxUGIcDsn8?=
 =?us-ascii?Q?ne3NaarlLnTuzjlG0COlfzspQKXPeLo5NuUFHcoUeaJIA7yganM5k6uQqBYa?=
 =?us-ascii?Q?mIbOBxyvfQ3GwL64X3kF74rQno0CjiPFDI8IYwOiMFPHqC1nGjrCrz0tzCL+?=
 =?us-ascii?Q?mvFDACD6UiMzFBqfZ+XM4bkauP9nyujEO03MnmkNphYYgbA84MZCdx8E72EL?=
 =?us-ascii?Q?xiqnAHAJIlpxBqawsK6Ue53m+UHbn7qEE8lcxQsX51POFW6AHYMQHxL0ASir?=
 =?us-ascii?Q?JpgnCWvaUZug5h+Eq6ZKIOfgClIXR1C8jirQF/iqC4Vkc/U1hz9WNa3foK75?=
 =?us-ascii?Q?2aHBQg94EtBmmT5dAXT1rVIJkeron35KG1CvUDRbzdm0CEQReqWp7NyxUdOd?=
 =?us-ascii?Q?0xZnQK12hIH5hYjc/cRm7272CYJnIqMKRHlH2AtwRs5RmCWQ+tKrhvOv9rgr?=
 =?us-ascii?Q?s+HuwvSx9TOJwtxKz0+B7MyW7rnxBgFGdQ43hRIQWdLHtCWbbbBX9dOCZTr0?=
 =?us-ascii?Q?+1OgbjHiO4nan/teXOmezR9K1I0p4FmjdctuU0Fh/VO35X+gtGL89x2m3nuw?=
 =?us-ascii?Q?46dL4hvRO2g+1HyNfoKyAQxljJitGrpxxbgulnfcTNUUaMWVx/dDZYeZgkD3?=
 =?us-ascii?Q?5Dnix1iAdu7HV+dph8cENCOEzIKs2FIjs+JiSoPmPY6tC7q0jdSLP83AjFRY?=
 =?us-ascii?Q?HO7xxPd9tTWXlLjGhQGMoWN2MYkULQgpPIO1Au5IKutR7rWbumniP4HkkWPn?=
 =?us-ascii?Q?OqUrQxNSRICBFutK3CSSDX3tBz/PhBImJeLKwIIvkjYWh/7GMnVWj+zHJGWG?=
 =?us-ascii?Q?JCPHl3Tcczn2vVw+iv877PzxVVYy2Kitx4rjeVi+bhmrD+8KzxFMW340XJ6x?=
 =?us-ascii?Q?qa1sE+fPQ7BEtXpu02rZHkA1qxLpfPZKna5TyJRmvNhNTK/f67eqaGQ1ftT3?=
 =?us-ascii?Q?KiB3XSJBm8zp4rzDtUN4rY1UNzbf3I/GwwtD12WQdkg8S01t9t/BD8v1KKWg?=
 =?us-ascii?Q?n9P7vUnFCQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0d5d854-ca0b-4d37-5201-08de5864ab8f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 20:44:13.2995 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kvO0nXsnh6ipUjIZqHBCGRiLDldC6SuUoPJAul2aP44roDrNp/vlMqzCTXP7g4nlcPPh/hltj2Z72AOabr5YRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6809
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,nvidia.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 998E74B9E3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add unified Pte, Pde, and DualPde wrapper enums that abstract over
MMU v2 and v3 page table entry formats. These enums allow the page
table walker and VMM to work with both MMU versions.

Each unified type:
- Takes MmuVersion parameter in constructors
- Wraps both ver2 and ver3 variants
- Delegates method calls to the appropriate variant

This enables version-agnostic page table operations while keeping
version-specific implementation details encapsulated in the ver2
and ver3 modules.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/mm/pagetable/mod.rs | 194 ++++++++++++++++++++++
 1 file changed, 194 insertions(+)

diff --git a/drivers/gpu/nova-core/mm/pagetable/mod.rs b/drivers/gpu/nova-core/mm/pagetable/mod.rs
index 3b1324add844..72bc7cda8df6 100644
--- a/drivers/gpu/nova-core/mm/pagetable/mod.rs
+++ b/drivers/gpu/nova-core/mm/pagetable/mod.rs
@@ -10,6 +10,10 @@
 pub(crate) mod ver2;
 pub(crate) mod ver3;
 
+use super::{
+    Pfn,
+    VramAddress, //
+};
 use crate::gpu::Architecture;
 
 /// MMU version enumeration.
@@ -168,3 +172,193 @@ fn from(val: AperturePde) -> Self {
         val as u8
     }
 }
+
+/// Unified Page Table Entry wrapper for both MMU v2 and v3 `PTE`
+/// types, allowing the walker to work with either format.
+#[derive(Debug, Clone, Copy)]
+pub(crate) enum Pte {
+    /// MMU v2 `PTE` (Turing/Ampere/Ada).
+    V2(ver2::Pte),
+    /// MMU v3 `PTE` (Hopper+).
+    V3(ver3::Pte),
+}
+
+impl Pte {
+    /// Create a `PTE` from a raw `u64` value for the given MMU version.
+    pub(crate) fn new(version: MmuVersion, val: u64) -> Self {
+        match version {
+            MmuVersion::V2 => Self::V2(ver2::Pte::new(val)),
+            MmuVersion::V3 => Self::V3(ver3::Pte::new(val)),
+        }
+    }
+
+    /// Create an invalid `PTE` for the given MMU version.
+    pub(crate) fn invalid(version: MmuVersion) -> Self {
+        match version {
+            MmuVersion::V2 => Self::V2(ver2::Pte::invalid()),
+            MmuVersion::V3 => Self::V3(ver3::Pte::invalid()),
+        }
+    }
+
+    /// Create a valid `PTE` for video memory.
+    pub(crate) fn new_vram(version: MmuVersion, pfn: Pfn, writable: bool) -> Self {
+        match version {
+            MmuVersion::V2 => Self::V2(ver2::Pte::new_vram(pfn, writable)),
+            MmuVersion::V3 => Self::V3(ver3::Pte::new_vram(pfn, writable)),
+        }
+    }
+
+    /// Check if this `PTE` is valid.
+    pub(crate) fn is_valid(&self) -> bool {
+        match self {
+            Self::V2(p) => p.valid(),
+            Self::V3(p) => p.valid(),
+        }
+    }
+
+    /// Get the physical frame number.
+    pub(crate) fn frame_number(&self) -> Pfn {
+        match self {
+            Self::V2(p) => p.frame_number(),
+            Self::V3(p) => p.frame_number(),
+        }
+    }
+
+    /// Get the raw `u64` value.
+    pub(crate) fn raw_u64(&self) -> u64 {
+        match self {
+            Self::V2(p) => p.raw_u64(),
+            Self::V3(p) => p.raw_u64(),
+        }
+    }
+}
+
+impl Default for Pte {
+    fn default() -> Self {
+        Self::V2(ver2::Pte::default())
+    }
+}
+
+/// Unified Page Directory Entry wrapper for both MMU v2 and v3 `PDE`.
+#[derive(Debug, Clone, Copy)]
+pub(crate) enum Pde {
+    /// MMU v2 `PDE` (Turing/Ampere/Ada).
+    V2(ver2::Pde),
+    /// MMU v3 `PDE` (Hopper+).
+    V3(ver3::Pde),
+}
+
+impl Pde {
+    /// Create a `PDE` from a raw `u64` value for the given MMU version.
+    pub(crate) fn new(version: MmuVersion, val: u64) -> Self {
+        match version {
+            MmuVersion::V2 => Self::V2(ver2::Pde::new(val)),
+            MmuVersion::V3 => Self::V3(ver3::Pde::new(val)),
+        }
+    }
+
+    /// Create a valid `PDE` pointing to a page table in video memory.
+    pub(crate) fn new_vram(version: MmuVersion, table_pfn: Pfn) -> Self {
+        match version {
+            MmuVersion::V2 => Self::V2(ver2::Pde::new_vram(table_pfn)),
+            MmuVersion::V3 => Self::V3(ver3::Pde::new_vram(table_pfn)),
+        }
+    }
+
+    /// Create an invalid `PDE` for the given MMU version.
+    pub(crate) fn invalid(version: MmuVersion) -> Self {
+        match version {
+            MmuVersion::V2 => Self::V2(ver2::Pde::invalid()),
+            MmuVersion::V3 => Self::V3(ver3::Pde::invalid()),
+        }
+    }
+
+    /// Check if this `PDE` is valid.
+    pub(crate) fn is_valid(&self) -> bool {
+        match self {
+            Self::V2(p) => p.is_valid(),
+            Self::V3(p) => p.is_valid(),
+        }
+    }
+
+    /// Get the VRAM address of the page table.
+    pub(crate) fn table_vram_address(&self) -> VramAddress {
+        match self {
+            Self::V2(p) => p.table_vram_address(),
+            Self::V3(p) => p.table_vram_address(),
+        }
+    }
+
+    /// Get the raw `u64` value.
+    pub(crate) fn raw_u64(&self) -> u64 {
+        match self {
+            Self::V2(p) => p.raw_u64(),
+            Self::V3(p) => p.raw_u64(),
+        }
+    }
+}
+
+impl Default for Pde {
+    fn default() -> Self {
+        Self::V2(ver2::Pde::default())
+    }
+}
+
+/// Unified Dual Page Directory Entry wrapper for both MMU v2 and v3 [`DualPde`].
+#[derive(Debug, Clone, Copy)]
+pub(crate) enum DualPde {
+    /// MMU v2 [`DualPde`] (Turing/Ampere/Ada).
+    V2(ver2::DualPde),
+    /// MMU v3 [`DualPde`] (Hopper+).
+    V3(ver3::DualPde),
+}
+
+impl DualPde {
+    /// Create a [`DualPde`] from raw 128-bit value (two `u64`s) for the given MMU version.
+    pub(crate) fn new(version: MmuVersion, big: u64, small: u64) -> Self {
+        match version {
+            MmuVersion::V2 => Self::V2(ver2::DualPde::new(big, small)),
+            MmuVersion::V3 => Self::V3(ver3::DualPde::new(big, small)),
+        }
+    }
+
+    /// Create a [`DualPde`] with only the small page table pointer set.
+    pub(crate) fn new_small(version: MmuVersion, table_pfn: Pfn) -> Self {
+        match version {
+            MmuVersion::V2 => Self::V2(ver2::DualPde::new_small(table_pfn)),
+            MmuVersion::V3 => Self::V3(ver3::DualPde::new_small(table_pfn)),
+        }
+    }
+
+    /// Check if the small page table pointer is valid.
+    pub(crate) fn has_small(&self) -> bool {
+        match self {
+            Self::V2(d) => d.has_small(),
+            Self::V3(d) => d.has_small(),
+        }
+    }
+
+    /// Get the small page table VRAM address.
+    pub(crate) fn small_vram_address(&self) -> VramAddress {
+        match self {
+            Self::V2(d) => d.small.table_vram_address(),
+            Self::V3(d) => d.small.table_vram_address(),
+        }
+    }
+
+    /// Get the raw `u64` value of the big PDE.
+    pub(crate) fn big_raw_u64(&self) -> u64 {
+        match self {
+            Self::V2(d) => d.big.raw_u64(),
+            Self::V3(d) => d.big.raw_u64(),
+        }
+    }
+
+    /// Get the raw `u64` value of the small PDE.
+    pub(crate) fn small_raw_u64(&self) -> u64 {
+        match self {
+            Self::V2(d) => d.small.raw_u64(),
+            Self::V3(d) => d.small.raw_u64(),
+        }
+    }
+}
-- 
2.34.1

