Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EEg+FL6Sn2k9cwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 01:24:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C7819F5EA
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 01:24:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C2D810E0AE;
	Thu, 26 Feb 2026 00:24:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="tPmOJzeU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010024.outbound.protection.outlook.com [52.101.56.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0587D10E0AE;
 Thu, 26 Feb 2026 00:24:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wtDZI+QoxrXKru87hQh1Bu4sTj5/d3MYob2w5rc9SS56DpZEXP1Owlto/W3K2f27pfmhPZwJ8nLVszPnOVYUGXNcsaX3KHnk5sLz9PU1MmSOXqAr/jAfROxw3zbjh49ZHP1kk7cDdceyCdrS9D9BB2NY9rb66Tn7FvWzbqZVw3dZ/XHJVNYenDCnBk8KIivc1HuEHSncQL2N4RE8bopRrkoHCqs3csv471nnRlK6quLZk8WNaBxkj2wwSj6OfEOyA8DaNKe6f4mbek2mE9+nx22GQZ0PDNihbzrFVO7wYRCnNapO9iZXSlYkL8OqQ3Rjt1wGGyU76qAlwIEYRlD4xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h3TFJnQrX8AusUbzT5qgsy7sqCquIJfpW4wUDsmbnWY=;
 b=eWDmJjjtD96q4ZMbGVeU1o/P1bIYIb2WvGgsVuWaV+QZ+EMfSGK66x13P/ZU15fuSrqu9QK3RbFnmQbefTAGIb/KvTM4TcsES1lxbeBTDPgez2mMN6SXS0kSNtj6UxnR2iK8QoRRzBiV40t4ej2bMZGeAB8ZopLDEPUtOoa+x0T+ysNor8m5L3YzwKXDEXJMePCejEbDRWDuQ6dQAAOG5MRg9YqMGWcvyb/0XJp0gfi5/eugWhvuAibekaZvsCRxk7BhdWn/5besGl6FoUtQR/CHd9BT1ICTmrlVYYW8HDKQRir9WKzyEtuPIf3RCuT6ScO4urk9xGEA9Y6VNR/VHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h3TFJnQrX8AusUbzT5qgsy7sqCquIJfpW4wUDsmbnWY=;
 b=tPmOJzeULwOs18tiXnQ7SSHmfSXf/3PNgLo7gsATKr9A2lfEl/Hycq4zhmb8zKEMbmXrw+7abBCIi5ey5NWW1Vx6sVNpk9LS6Jzojk+LmqpGyzVURZllcx9NSxxFf1FZo+xQpqJHu3Et4B82J7veMXDYHHBIsKQehLHPOi0igi1XF1foADmwtXtWQKQKhXe2T7N7pfgk5a5aHma4bM8CmixgAVZQ8t6l2Ebqy7lPKXo+M0pjyIs4BXBIrmygwppQ37Kcu+r6lu2/jGbyXrENdbtWaJfj8cVjRulRph4tnrZb00TS2CAGmueBQkj6R6lmIdB4GNS1azbCRG5RDsMjZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 IA1PR12MB6259.namprd12.prod.outlook.com (2603:10b6:208:3e5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Thu, 26 Feb
 2026 00:24:19 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.017; Thu, 26 Feb 2026
 00:24:19 +0000
Date: Wed, 25 Feb 2026 19:24:17 -0500
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 Bjorn Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Alex Gaynor <alex.gaynor@gmail.com>, Danilo Krummrich <dakr@kernel.org>,
 Dave Airlie <airlied@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>,
 Nikola Djukic <ndjukic@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>, Jonathan Corbet <corbet@lwn.net>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Alistair Popple <apopple@nvidia.com>,
 Andrea Righi <arighi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 alexeyi@nvidia.com, Eliot Courtney <ecourtney@nvidia.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v11 2/2] rust: clist: Add support to interface with C
 linked lists
Message-ID: <1772065381.31e71601a63def39@nvidia.com>
References: <20260224222734.3153931-1-joelagnelf@nvidia.com>
 <20260224222734.3153931-3-joelagnelf@nvidia.com>
 <DGNW1KH6TCE1.3DIVLKYG6OURI@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DGNW1KH6TCE1.3DIVLKYG6OURI@nvidia.com>
X-ClientProxiedBy: MN0P220CA0009.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:52e::34) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|IA1PR12MB6259:EE_
X-MS-Office365-Filtering-Correlation-Id: c41bce80-935a-490f-7bd9-08de74cd61c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 7JZcPqiqftaTV7p8tZepSpK5KFNguf6ci4AeGsS98FRNwbUcI3yqyUy1KeQHuCvGQFSXGwtTBucM+2q4Sir8AG4ofSppl7DdZO3Pu82TB3PD247rfxlmyCCO8ibd4y2d3dI2KjkRTRuWXByki/TnwveX40c43uXIxtmH/IOAuK5FTyxQE7E2p7xct3kZiQNnTIv/2dBxyQ7KBDhIbd6VWUhmeN8lRhuek4ribt2IO9XbSnGWOa8tnDvVoJyx9EXz5x1PbZJ1/TD7DxxofGF5EWseTSsfa66W99sd8pdipXNrDXldvzZ02l/A+oqp3LvTFsWz11+GmeqrtVUXVLthqEX98Ut8uCOrkmqr0f0jPWjwqc6D+Zl6iI65pyq+qn3h0GYcE3YJzsEem9sttZlkfkpk/TchUA2JtVPwJFpV40aISRCTPo7IobzQb/Nz6Y0LoRu7RPoMozyU86z+NAikZiCMKhsrvSzyMOfflOLemcbZfNXSHECrnRtIfKY5J6ZWT8XqRLGeEhBekqLoDobjs4Hf57aKiLV9mAUedWkVe+Y/J+fV/+cp8t8DLfpNonrP0yl8Tcj8IZI4Ge87WWiXpDahPePC7+ti2ElVs9GvfaC1zlZHOGNrZHcpFgYEZPlzkI5g9G6xQCqdPwQfrhMMob5bRyUgdzHPANNi2zwN0FEpK1r0WbrjjYh+bOoiidp5NhcBabknayTTF81r7K5dDlepf5jkUaVTjPodVNMzk1Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W8PfFYyQkDETfYXsibtszWZXmJ5P77lbsyQlSXYHWNLGsAMvx7f9qPLFBXj+?=
 =?us-ascii?Q?X/nUTqID9PT/ze17PsOP4/RWEAHkCKvgMpbiUJED4dpWbwSx8wssGyAZmirO?=
 =?us-ascii?Q?056ivssN6YVjSsdpZQFzDe1ZEFIKxpZNTFJScmNr/QUjbUEqjF5i2C07saeC?=
 =?us-ascii?Q?jY7oPD6W2o5H8ZC2vphRXhNry0JEGd3aqObJ2KC1DUapItB8arupjWTGc3rq?=
 =?us-ascii?Q?XhbWdQGW7S3QLbvK2qaebT3L0XbamcMrAQdxmYiXcEyieBHhLM+xS5Janhvz?=
 =?us-ascii?Q?F8SM43wkTxeDqY/7sxjmV5dfCbMIX2bp2tkgiCgAA+Jh7Ky/teGN94NDkBm1?=
 =?us-ascii?Q?VOtam/5D2/uPNMnneQZcyprWJyAmknV6lzEJR38s8cHyPKFi737YJuh8qjEM?=
 =?us-ascii?Q?x8kQnrcb5/MFrUTbWOU/qUvIEF//wZbz59jStK17YZJoOGvZuUHw2AuyN1Nd?=
 =?us-ascii?Q?ilxdb1mqIXsTkN9XxmMcgSZrxN0PIwE2WIokCBg49J/z+AuJHZmrgzJc/sqe?=
 =?us-ascii?Q?gC8Ps3DnIeIX2LwuvDxY2BdWBYAgCEa0SSzFMW6zm3iPkhNa5V45tV/xv8S8?=
 =?us-ascii?Q?33t1sfGmTEtwKaObl0wWp/+8FiPPdyDtfPiiNIQYctI3/BmDoOSjizOp4Hz3?=
 =?us-ascii?Q?3yrwFMd+Rp1ccxU57EMVUyyjNWMg/Hg7VymAoM/aH5d50A2tWIgf8Q7rfSNJ?=
 =?us-ascii?Q?krsgogH2dvKfwB4Noz3k+A+981QQ5QjFa2snCpWTOSdFf3pnAkpWHXzzydcx?=
 =?us-ascii?Q?xs6+l6Tld2tfjEIWTKeSHfK39N8QB+3HsOOv44ClHDOFpnmajBv7wXWwYX35?=
 =?us-ascii?Q?Z1sWrFViZCU0Ek4bjAlDp8EjXZ3+6IDeADNNZ3vQ758X2aa8MCe+T7mW1IUe?=
 =?us-ascii?Q?HTWTuOEKkxEtgAg7GEKzrOfoD7F/JEard843okWMqWGT1316D6Tr4LpXBkws?=
 =?us-ascii?Q?cdaq12L5hTowcrbsQEYPZIftGZA9adIP6OBednvymaRZyw2BnttzhaSf3nUk?=
 =?us-ascii?Q?rZfcU8JTlBSF7DyLiy66FEk2m+kZ1PUFrh7AA0RKJnccH0o2sLxrEh1Gw1uu?=
 =?us-ascii?Q?Q3mJ2RqZKf3xd37JUT50Ci206CqUH4Ci0zX9VpOnGs389e22mvwWBHtd0FEL?=
 =?us-ascii?Q?GzklDQdIYH6zKN7obZqfz25IHfncE9N8Q5Q1FNvfcO7/9Q67hSLdxV1+rauZ?=
 =?us-ascii?Q?aoj85S0SH29BszvF3mTaD+zHWgEUSbjX9/0IcectSlKsCoMwi19ItjPIYp8/?=
 =?us-ascii?Q?lA4W6zhmbx3Gpj2zptyHo8a5MqQ4AduVtYkrYjTkSOyIBZtv/sn37EdirRvW?=
 =?us-ascii?Q?6y/M3sVxCc/4t4IVAlY7HilAJaJUlI8ELq9b2nWbvfC+pspv7HwV/iaAHpur?=
 =?us-ascii?Q?UQftt4wcUJxd1A/7e7Lt4VxRGC1uskgTUs1qCpDF76yHBgXIF9TCzW3iaSg/?=
 =?us-ascii?Q?7Yusu4kaBlMHdunmqsx0bh+UzGZEX4LubE7O2OuZ7aYe+rwCaivFEjRg7QLR?=
 =?us-ascii?Q?RvvTev0OxhvJUsmIHbHfnfUk7/awh90bJQBTiZg0ylcK1MvCX7PkOf2TOzP0?=
 =?us-ascii?Q?cMYYo3GAaVAr7enNMlQMWgHqmqRWGNpl1fgdNNyEZpGONqVOxrCPTgxzwc+I?=
 =?us-ascii?Q?0RU09Rk4Z7g8dMG9zGph3JQzSRGnXiCtF3RaxQDObVCVsdnv0uVI5g8KJnuC?=
 =?us-ascii?Q?Zpc/zZsih7IifjxN1xzwM/YDRJcgPK9fn79Eesj5BbWnU73dwF6H6pncKHWQ?=
 =?us-ascii?Q?oCswHImdzQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c41bce80-935a-490f-7bd9-08de74cd61c1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 00:24:19.2546 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2x6ksK3eON3BIPPAaGSGEUVLANI2msCLTbUu2q+HozF+QmMPlz3vfYJZgd0SihMGG99kz1Z6lUui4/g/mv7lLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6259
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
	RCPT_COUNT_TWELVE(0.00)[47];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,redhat.com,linux.intel.com,ffwll.ch,collabora.com,nvidia.com,weathered-steel.dev,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,Nvidia.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: F3C7819F5EA
X-Rspamd-Action: no action

On Wed, 25 Feb 2026 17:09:22 +0900, Alexandre Courbot wrote:
> On Wed Feb 25, 2026 at 7:27 AM JST, Joel Fernandes wrote:
>> Add a new module `clist` for working with C's doubly circular linked
>> lists. Provide low-level iteration over list nodes.

<snip>

> +        // SAFETY: `item_ptr` calculation from `OFFSET` (calculated using offset_of!)
>
> `item_ptr` does not exist.

Good catch, thanks! Fixed.

-- 
Joel Fernandes

