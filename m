Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yCmZBkwUcGlyUwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 00:48:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E9B4E17D
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 00:48:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D019D10E670;
	Tue, 20 Jan 2026 23:48:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="Ej00lvcu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CWXP265CU009.outbound.protection.outlook.com
 (mail-ukwestazon11021086.outbound.protection.outlook.com [52.101.100.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C595810E670;
 Tue, 20 Jan 2026 23:48:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ci2Z2279K92VWU0zT8DkVSDbe5tmlC4j3aiohrt8ik9WM6HYW9pqYGKF3iD/VBrJtYSkgrOYhaTjbTuHyVXYK7ydr6swkIj6ucQ/iZcZY8GM74GC/7U/UVKivlW5CEjrpfGWvWzK3dDb4GegyuxEY1kUGb0IeBdZ6TFLw1CY9s4aJ1XBTzB1RR9oRWMGCc19rPKM4UROvzAX7E1x63I6GdUe1zLJqDWtnLU3deEskmk9HQ7fZLZkoJ3ICWwFfhPhO1Bfb3qa90tlgK6WiMCgQ6soFMClgBhrYF0fQH7gQjm46UF0aRQ3vNiYtuF4brzaLgyb+vUKFynTQ3S5NAg9XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iIy8Q15/GAPZPrwth0xN7HbsxdXwa/1Wqi5DOz50KfU=;
 b=QjYfncrxvchH5ouSnmt9oJxvSmzFHTux8/af24Bp+k/ZgVy1bsIKeOhUddsDUJjmV7ewS8kuj/qaiVl6WNt/Is7fdFjPHMtLl9Ef8wezTK91SGAkcp412QQk1sGECKNJbryTTyrBax1gnVuo4vd5dZoLDDrlY0iO9r4mk99get+wVh+17enGdAR/YLS/NNimgSIy1EiHMaW1Edtiufcram+8TftBE5KZWpFfZVSdP/lbqd3C4CmoTV3fP4JLE7ngyRW4nCaKpjkvZQywUGevqT72KwzDGrrFgUi92T/3RAnpKx4kTstCme+DvPVxpSLDvpR0MShcyDV5S3/sVZej7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iIy8Q15/GAPZPrwth0xN7HbsxdXwa/1Wqi5DOz50KfU=;
 b=Ej00lvcuyOaUBje8uM320/yeaP3i2DjAGjiGcW6Hhqjnz1t2la/Ttz40mgQVPzWbnMoglHZM64w/DskqLP8A80EFlsmMRSATfCV13FeW1WdEnlq+VxhcgBlS5+wCSD/EXDspvEFdfzlLjnRtOPFz1+akgFBt4zGDxX4SCyNRoZE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB5144.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:285::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.13; Tue, 20 Jan
 2026 23:48:20 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9542.008; Tue, 20 Jan 2026
 23:48:20 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Jan 2026 23:48:18 +0000
Message-Id: <DFTTGUYGY72V.3VLVSCB2OOXIB@garyguo.net>
Cc: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Jonathan
 Corbet" <corbet@lwn.net>, "Alex Deucher" <alexander.deucher@amd.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, "Jani Nikula"
 <jani.nikula@linux.intel.com>, "Joonas Lahtinen"
 <joonas.lahtinen@linux.intel.com>, "Rodrigo Vivi" <rodrigo.vivi@intel.com>,
 "Tvrtko Ursulin" <tursulin@ursulin.net>, "Huang Rui" <ray.huang@amd.com>,
 "Matthew Auld" <matthew.auld@intel.com>, "Matthew Brost"
 <matthew.brost@intel.com>, "Lucas De Marchi" <lucas.demarchi@intel.com>,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Helge Deller" <deller@gmx.de>, "Danilo Krummrich" <dakr@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Edwin Peer"
 <epeer@nvidia.com>, "Alexandre Courbot" <acourbot@nvidia.com>, "Andrea
 Righi" <arighi@nvidia.com>, "Andy Ritger" <aritger@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "Alexey Ivanov" <alexeyi@nvidia.com>, "Balbir Singh"
 <balbirs@nvidia.com>, "Philipp Stanner" <phasta@kernel.org>, "Elle Rhumsaa"
 <elle@weathered-steel.dev>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, <joel@joelfernandes.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <amd-gfx@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <linux-fbdev@vger.kernel.org>
Subject: Re: [PATCH RFC v6 01/26] rust: clist: Add support to interface with
 C linked lists
From: "Gary Guo" <gary@garyguo.net>
To: "Joel Fernandes" <joelagnelf@nvidia.com>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260120204303.3229303-1-joelagnelf@nvidia.com>
 <20260120204303.3229303-2-joelagnelf@nvidia.com>
In-Reply-To: <20260120204303.3229303-2-joelagnelf@nvidia.com>
X-ClientProxiedBy: LO2P265CA0314.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::14) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB5144:EE_
X-MS-Office365-Filtering-Correlation-Id: ca2f743d-d623-4c7d-0959-08de587e63dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|10070799003|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S0tmTG9oOVJxYzhsY2I3Zk5YRjNpbHE5cnc4L2J2cTVXQUVveFJhZzRObzRE?=
 =?utf-8?B?SC95djEwS0N2eG9Sc0lqZktJQnJ5cDlWT2ttVTJCd3ZpalZpTjBsdEg3SXRy?=
 =?utf-8?B?RkhoMllWNk9hRlcxTWIyTkdSdGFNK2JyRmFlbHM1MEIvVU0vUndBZFgzck1R?=
 =?utf-8?B?dCtScThjMlk3U29qYjl2cmxMcXo1YkdjS3NRRUY0d2p0UnZBbU1TNFkwVk5Y?=
 =?utf-8?B?M1Y4YU13cll1YVBOZzcwc0ZyYmt6WHlxd0YxZVpTY2NRa0M1TWlZMTdoRGYr?=
 =?utf-8?B?WEtWNmhBcm5qUGlzOU5sWGhEaWo2WGo5Qkp0NTdQSkU2NUNDbWJURnV0MG5s?=
 =?utf-8?B?eUJqakZvMVVjd1l6WkdIQXJ2U0x2K0l4RDFQbmpadzRjcEFpb0xUZlFpelJG?=
 =?utf-8?B?VmorK1VVZjNzbVh2U09TaEQ4K3J4SDZKS1F2NTVOK1YxODZ4Y3pMMUlpaEd0?=
 =?utf-8?B?NTBMUS91dWpIQkFzWG9xZVorNGhXcjVaZC9DZzNsc0RZUDVxbTIySDVIcEk2?=
 =?utf-8?B?RDZmbER6blBicEZSTXlTcTNmNVZCU2ZRQVBydkxuTXFHM01rVkFsMzBGWXZE?=
 =?utf-8?B?Ly9jLzBveEtPMWlnelJ2SUJYWmQzTjkvS0xBR1BrWFAxdE1lM2o1eVpOSSt2?=
 =?utf-8?B?Z1I1Q2tHNU1GZ0lQeUF2UURKMUs5aW5pY3U3YUZBM1BvRGx5WVlhODJPMU9M?=
 =?utf-8?B?b0phNksyNTd0NEhDM0RqRklKWWdrUmZjQWZmenNXYkoxd0k5T3Y4b1ZFZmdh?=
 =?utf-8?B?eGRVVXdpYkZFY0E5WFN2dVVTbmJBWGVwa1daOHJnMDRXZjhENUR2SzZ3ZmZL?=
 =?utf-8?B?OFhRWHNrN09Mb0VuS1VCRk9QenBxLzhMQlZyMlVTZFFiU0VhaUdhTnVpeDNU?=
 =?utf-8?B?TGtEYTZJbFJFMEZMNzdRazcvaXdzSTByMnZQWDVuNC81MUFwNVl3S3ZhZkQr?=
 =?utf-8?B?eG9BdXFnQk9QUDJOb291NzFSY3ljRnNaaW82RGF1VTJxMEZjY3Fibks4bFdY?=
 =?utf-8?B?YVgybk5TdVd2S21MVjE3NE1BOGVMTXBDWStQUy9vT2Fpa3lOZGtPQ1pWYS9U?=
 =?utf-8?B?OWlhUjZkWmcvbGpCS3l5dDVGSXZxT21EbVUyOGpSTEE4K0F5eVlpSUV0K1dT?=
 =?utf-8?B?TElLdGRmVzNFaEkzL1VjNTNkSlE5SUF4dEJjemZHTVVuaVlvRWk3YkJjV1J5?=
 =?utf-8?B?WVJYQ0xqQ1VtSHpwWFp6QktRdjlud1NkdmFuQUtpRHhXM29lN3c4WG9yYW50?=
 =?utf-8?B?UCtPZERLS1lMV2NXcVgyY1dGREIyZ3hjSEFYZTlhVndDQUdXWlFsRVpjQ2xW?=
 =?utf-8?B?SWowRW9mNHVVZUROMGJMUUtZMmxySlJwSzVBQWVBcU0yNkg4Y01GOU80dkhu?=
 =?utf-8?B?dzVDbGFObEJmRk1CVnBmWmhhMW8rUFhBbksyNXhlTUZPbXNXQVRuRmRPREdB?=
 =?utf-8?B?OUd1aHc0bmlhUlhWenFJc0dWNnE3dUJpUnFuOXNPN0ltOGtEVE9pbEUybU5P?=
 =?utf-8?B?bnN0d1RwelpmaFNEb3FBcGxndUhYOC9HM05rV1EzOGVlL1pMU1IrM1FpV3Jy?=
 =?utf-8?B?Z2F3cWxLYSszcG50Y25hSXV1eUtlZjFFYUFoS01pTXgwdWpIcEVIUllYay9T?=
 =?utf-8?B?UHlRV3JsWUdwQS9yakhydlNrdENDeldMWXFnanU1dEFlSVE4Z1hna21XMFhR?=
 =?utf-8?B?L2p5cFJtcm9UTklwUmt5RzB1ZG40SnVoU2dwQ2x2UVgrTTk1RlpYRHpvczhP?=
 =?utf-8?B?TWkvVnRHM2RtTWNiSTJPdzk5bXQyRDhIcEthSyt4Nmt6akllam4wRFdscitq?=
 =?utf-8?B?L0JrYlBETkZ1d3J3SVZJb3NmenBibmRkeC93WFZ6SUg2TlkydnJDVStXMFZw?=
 =?utf-8?B?VVlwQTdtN0FKUXMxQVY2cG5ONUdGazhaYzUrQ01nU3htRzlMREF1UHArd1I1?=
 =?utf-8?B?M01JcXlROXhWV0tSMGRzVDExVlhHYjdmOGQ0dURHUUplWVN5SUlRWVF4Z0ts?=
 =?utf-8?B?MFV2VDc4OFI4MFJNVDZQc045V1Nlck5HK3dkQXpjbFNKZ3loWEZkZjhERm1L?=
 =?utf-8?B?Y0lFWTlKZm5sTHhtMjNaYTFybzZ5WHNSQUJTdkF3Q3JsQnZSMHRPVWRDY2l2?=
 =?utf-8?Q?on34=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(10070799003)(1800799024)(366016)(7053199007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGpqTWJpUEU2NzIyd2pQcURSOG8rVlR3bm9sbDZPLzdqWDNBMDJvZFh5bXNj?=
 =?utf-8?B?b0pQa2xvN3YzMWVxcFhNcExTR09nejkyRmp0SHlTbUFOekFsRHZnUUpBR3FG?=
 =?utf-8?B?MXFrKzdLOTE3Q0xLNS9HYzQrNnZWUXBXcUkwWTNFOE9Id2ljZWtqZVM5RTg3?=
 =?utf-8?B?dGJtcEk3Z0xPYlFHbmozY3o2ZnFuRUx1dVJNdHpyR0g1ZVIxMHQ5R2lzZ0JX?=
 =?utf-8?B?R0oyZnE2NHRzeXAyMEE3cVluWnJxRkx5dkZvU2VhRXFKUDhqWWFHbnJZTGE2?=
 =?utf-8?B?Z1RJS3dSVnYzSlgzRElGSjdreFJQSElaY0J6ZDdCTDkwVi8yT21oYmRmbzJJ?=
 =?utf-8?B?SklYamR3UzF3NWhMUEhOdG5keUNmbGJsRXdzbHFqUXVWZlZVQ1Qzdnp5UmVZ?=
 =?utf-8?B?MjFCaE1nODJrcW5CbGViN1Y5aExBN0JWelFabFdndjIwdmZIMG1uaGN6YWNj?=
 =?utf-8?B?NWhlaThmUUdMaHUwYmk3USsrUUJCN0tlWSttSGhYcWNWWmVrQ0RVMlp4KzVE?=
 =?utf-8?B?eUVPb3FEMitiUkxwWWZvUjY3WGY0QVkwcXBPZU5Sdk1xR1F0N1lLR0xwd3dX?=
 =?utf-8?B?Rk1IMkJKYTIyM1E0WUs4UHlhenJ1aUZBVCtZZ3ZYRGszWGh0TURoaE1Db3Ir?=
 =?utf-8?B?SGV6WmZERTZmK0J1U0pNVkR3S0hnbndBR1lwdmtVTUY2NDJPK2F6dHNncHkx?=
 =?utf-8?B?dUZ0NGZwemt5emFnNkxPOFlmNFRwWGdEaUlGcjhFTWVMOWxVYnpvRFNzblZD?=
 =?utf-8?B?WWNOUlh3bUJTU3p3eW55ZGNtUUx1T2hjbjkxZmdkVndqWTk5WDZHazhHN01U?=
 =?utf-8?B?Ly84NTJiUG8rNlI2Vks1U0RvQ0Z1N0hVTG9zcW5xcTBpVTM5NVEzTDlGKytB?=
 =?utf-8?B?VzUvb0tNU1dxL1VyZFphSWIzTWozMFBnTjc2dzNkOVJYejhubnk0THJVcGNj?=
 =?utf-8?B?aC9WdDIvMnZ2Y0lEeVliU00va1ZDS2NRUkJTT1o2NGp2cnN6VDA3dkUybXI4?=
 =?utf-8?B?cWtpemljTklOMGdVZDJPQlJtc1RzMkxqeXoyVUJqOUdsc3MyQVNFV29tNno0?=
 =?utf-8?B?N3ZzZ2RXak1GOXVMeHM2N1ZNR2hKL3JsZmlvOUNaSlFCUzdkQkZqMUs2K1Nr?=
 =?utf-8?B?SHAvYU44bGp3cEo1YXI5dC9LU1lrQ1MzVVdNOFdhZnlxU1RWdlpWUGp6N21K?=
 =?utf-8?B?aW5BY2NiUWFySGRwbjloeHNsczd2QUNNLzQ0Q1NjZi9GK1d6aHZMRFVIbm5j?=
 =?utf-8?B?YnQyL1l4bThoeEVwVjV6T2traHNYaHR1QVlrM3J5cHNScDQvL0hRdUlzbS85?=
 =?utf-8?B?VC9KVFVMZDEzdjFVQ0Y2dkZHbkJMaG11QjcybjhCRU54cWVObjh6bldrTnN4?=
 =?utf-8?B?V2taV2x4bThRZEVubzR5b0YvVkdia1hKNURaSmVUNHAweGlvMUxXUWVsRDcx?=
 =?utf-8?B?QktHKzhjREVjc1hrTkx1NmQ4TTc4SUF0YWQ5MW91ODRWUG9oMCsyOG9seEln?=
 =?utf-8?B?ZHJaQUROeWdUQU1zeUMvTFNsS1BwUXhqZjNpRjZLNHBwT3hldk5lb0ZvVEgw?=
 =?utf-8?B?Y3dWY1p0UVVtTEtYS0hKeHNXcHFlSlY3cTc1Tm1nQVlyVHYweCtVYStMNFVm?=
 =?utf-8?B?REM0ZGhObWhwdW9EWHVpZFlDZDdUMSt3K1FWVW8waC81V2MzUTFKdEtVYlQy?=
 =?utf-8?B?ZGNjU2Q3RlM2dWFWVWpYKy9DUTdtMCtSRDh2V3hlS2h3QVA5QXlKOXg4N2xz?=
 =?utf-8?B?K2hPWW10RTJBa0F0bmM2K2xiNHRSUjM1MWl3Umx6QUpOYjlLMmxhQ2s2cFRE?=
 =?utf-8?B?LzA5d0J5R01FSTNvUVBNVHo5c2JjVnBMNzhha3JsUndOZjF4UG1Hb2lLclRM?=
 =?utf-8?B?V2ZieWU0bmtBc0dWYjA3OS9kSDJIMHd3YWo1TjUzRk9hL1JGSlhKWTNkb3dH?=
 =?utf-8?B?N2twb3RSWHc5UGlhQ2g3SjlOWXEyMXNsSldVVXFRd1pMSVdKRWNJUEZVVU1C?=
 =?utf-8?B?MElSbDNtMGVmNnRpMzN4K1pmaHlPK2xROWtyaG45Rk1KZjJOWmt2bWtmZWlx?=
 =?utf-8?B?TC9ibEhvLy9UQzVBbnNLRjJ6clNqckwxVlFqd0l4clQ1dmFWTXljWE1wQUFO?=
 =?utf-8?B?elhiTDVDaUhHS3pwMElsQzVGNjRkQzVRUTFyaXZpL2lkL2xXVnpjZjgzUS94?=
 =?utf-8?B?ODlTUWZJajllOGF1Ni9KcTU5NjZRUDJSaE5Nc1p6MEVWVWEvRjJRMjdFSVht?=
 =?utf-8?B?Qm10VjN5ajAxbFdaYWdTbWZ5ZGhSVE9nK05SQzFjaTR0U05ldE8rZEdyTnly?=
 =?utf-8?B?UEZJc1JsNU5kKzRsVTNyc3RHUW8yN3BtbjVua1N1VE1BSSt2N1RhUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: ca2f743d-d623-4c7d-0959-08de587e63dd
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 23:48:19.8952 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +5YQ0TiB6N0uEVMhJqd+ojDj8qESCk/Ea03YldB9dSbOS9s/wqcn34+8PwZ5PLu65wGCX3KqxLGDkP52FBaQdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB5144
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,collabora.com,joelfernandes.org,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[52];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email]
X-Rspamd-Queue-Id: 80E9B4E17D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue Jan 20, 2026 at 8:42 PM GMT, Joel Fernandes wrote:
> Add a new module `clist` for working with C's doubly circular linked
> lists. Provide low-level iteration over list nodes.
>
> Typed iteration over actual items is provided with a `clist_create`
> macro to assist in creation of the `Clist` type.

This should read "CList".

---

I was quite dubious about the patch just from the title (everybody knows ho=
w
easy a linked list is in Rust), but it turns out it is not as concerning as=
 I
expected, mostly due to the read-only nature of the particular implementati=
on
(a lot of the safety comments would be much more difficult to justify, say,=
 if
it's mutable). That said, still a lot of feedbacks below.

I think something like is okay in the short term. However, there's an growi=
ng
interest in getting our Rust list API improved, so it could be ideal if
eventually the Rust list can be capable of handling FFI lists, too.

>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---
>  MAINTAINERS            |   7 +
>  rust/helpers/helpers.c |   1 +
>  rust/helpers/list.c    |  12 ++
>  rust/kernel/clist.rs   | 357 +++++++++++++++++++++++++++++++++++++++++
>  rust/kernel/lib.rs     |   1 +
>  5 files changed, 378 insertions(+)
>  create mode 100644 rust/helpers/list.c
>  create mode 100644 rust/kernel/clist.rs
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0d044a58cbfe..b76988c38045 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22936,6 +22936,13 @@ F:	rust/kernel/init.rs
>  F:	rust/pin-init/
>  K:	\bpin-init\b|pin_init\b|PinInit
> =20
> +RUST TO C LIST INTERFACES
> +M:	Joel Fernandes <joelagnelf@nvidia.com>
> +M:	Alexandre Courbot <acourbot@nvidia.com>
> +L:	rust-for-linux@vger.kernel.org
> +S:	Maintained
> +F:	rust/kernel/clist.rs
> +
>  RXRPC SOCKETS (AF_RXRPC)
>  M:	David Howells <dhowells@redhat.com>
>  M:	Marc Dionne <marc.dionne@auristor.com>
> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> index 79c72762ad9c..634fa2386bbb 100644
> --- a/rust/helpers/helpers.c
> +++ b/rust/helpers/helpers.c
> @@ -32,6 +32,7 @@
>  #include "io.c"
>  #include "jump_label.c"
>  #include "kunit.c"
> +#include "list.c"
>  #include "maple_tree.c"
>  #include "mm.c"
>  #include "mutex.c"
> diff --git a/rust/helpers/list.c b/rust/helpers/list.c
> new file mode 100644
> index 000000000000..6044979c7a2e
> --- /dev/null
> +++ b/rust/helpers/list.c
> @@ -0,0 +1,12 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/*
> + * Helpers for C Circular doubly linked list implementation.
> + */
> +
> +#include <linux/list.h>
> +
> +void rust_helper_list_add_tail(struct list_head *new, struct list_head *=
head)
> +{
> +	list_add_tail(new, head);
> +}
> diff --git a/rust/kernel/clist.rs b/rust/kernel/clist.rs
> new file mode 100644
> index 000000000000..91754ae721b9
> --- /dev/null
> +++ b/rust/kernel/clist.rs
> @@ -0,0 +1,357 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! A C doubly circular intrusive linked list interface for rust code.
> +//!
> +//! # Examples
> +//!
> +//! ```
> +//! use kernel::{
> +//!     bindings,
> +//!     clist::init_list_head,
> +//!     clist_create,
> +//!     types::Opaque, //
> +//! };
> +//! # // Create test list with values (0, 10, 20) - normally done by C c=
ode but it is
> +//! # // emulated here for doctests using the C bindings.
> +//! # use core::mem::MaybeUninit;
> +//! #
> +//! # /// C struct with embedded `list_head` (typically will be allocate=
d by C code).
> +//! # #[repr(C)]
> +//! # pub(crate) struct SampleItemC {
> +//! #     pub value: i32,
> +//! #     pub link: bindings::list_head,
> +//! # }
> +//! #
> +//! # let mut head =3D MaybeUninit::<bindings::list_head>::uninit();
> +//! #
> +//! # let head =3D head.as_mut_ptr();
> +//! # // SAFETY: head and all the items are test objects allocated in th=
is scope.
> +//! # unsafe { init_list_head(head) };
> +//! #
> +//! # let mut items =3D [
> +//! #     MaybeUninit::<SampleItemC>::uninit(),
> +//! #     MaybeUninit::<SampleItemC>::uninit(),
> +//! #     MaybeUninit::<SampleItemC>::uninit(),
> +//! # ];
> +//! #
> +//! # for (i, item) in items.iter_mut().enumerate() {
> +//! #     let ptr =3D item.as_mut_ptr();
> +//! #     // SAFETY: pointers are to allocated test objects with a list_=
head field.
> +//! #     unsafe {
> +//! #         (*ptr).value =3D i as i32 * 10;
> +//! #         // addr_of_mut!() computes address of link directly as lin=
k is uninitialized.
> +//! #         init_list_head(core::ptr::addr_of_mut!((*ptr).link));
> +//! #         bindings::list_add_tail(&mut (*ptr).link, head);
> +//! #     }
> +//! # }
> +//!
> +//! // Rust wrapper for the C struct.
> +//! // The list item struct in this example is defined in C code as:
> +//! //   struct SampleItemC {
> +//! //       int value;
> +//! //       struct list_head link;
> +//! //   };
> +//! //
> +//! #[repr(transparent)]
> +//! pub(crate) struct Item(Opaque<SampleItemC>);
> +//!
> +//! impl Item {
> +//!     pub(crate) fn value(&self) -> i32 {
> +//!         // SAFETY: [`Item`] has same layout as [`SampleItemC`].
> +//!         unsafe { (*self.0.get()).value }
> +//!     }
> +//! }
> +//!
> +//! // Create typed [`CList`] from sentinel head.
> +//! // SAFETY: head is valid, items are [`SampleItemC`] with embedded `l=
ink` field.
> +//! let list =3D unsafe { clist_create!(head, Item, SampleItemC, link) }=
;
> +//!
> +//! // Iterate directly over typed items.
> +//! let mut found_0 =3D false;
> +//! let mut found_10 =3D false;
> +//! let mut found_20 =3D false;
> +//!
> +//! for item in list.iter() {
> +//!     let val =3D item.value();
> +//!     if val =3D=3D 0 { found_0 =3D true; }
> +//!     if val =3D=3D 10 { found_10 =3D true; }
> +//!     if val =3D=3D 20 { found_20 =3D true; }
> +//! }
> +//!
> +//! assert!(found_0 && found_10 && found_20);
> +//! ```
> +
> +use core::{
> +    iter::FusedIterator,
> +    marker::PhantomData, //
> +};
> +
> +use crate::{
> +    bindings,
> +    types::Opaque, //
> +};
> +
> +use pin_init::PinInit;
> +
> +/// Initialize a `list_head` object to point to itself.
> +///
> +/// # Safety
> +///
> +/// `list` must be a valid pointer to a `list_head` object.
> +#[inline]
> +pub unsafe fn init_list_head(list: *mut bindings::list_head) {
> +    // SAFETY: Caller guarantees `list` is a valid pointer to a `list_he=
ad`.
> +    unsafe {
> +        (*list).next =3D list;
> +        (*list).prev =3D list;

This needs to be an atomic write or it'll depart from the C implementation.

> +    }
> +}

I don't think we want to publicly expose this! I've not found a user in the
subsequent patch, too.

Alice suggested to move this to bindings in v3 which I think is a good idea=
.
Also, even though it's against Rust name convention, for bindings we should=
 use
the exact name as C (so INIT_LIST_HEAD).

> +
> +/// Wraps a `list_head` object for use in intrusive linked lists.
> +///
> +/// # Invariants
> +///
> +/// - [`CListHead`] represents an allocated and valid `list_head` struct=
ure.
> +/// - Once a [`CListHead`] is created in Rust, it will not be modified b=
y non-Rust code.
> +/// - All `list_head` for individual items are not modified for the life=
time of [`CListHead`].
> +#[repr(transparent)]
> +pub struct CListHead(Opaque<bindings::list_head>);
> +
> +impl CListHead {
> +    /// Create a `&CListHead` reference from a raw `list_head` pointer.
> +    ///
> +    /// # Safety
> +    ///
> +    /// - `ptr` must be a valid pointer to an allocated and initialized =
`list_head` structure.
> +    /// - `ptr` must remain valid and unmodified for the lifetime `'a`.
> +    #[inline]
> +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::list_head) -> &'a Sel=
f {
> +        // SAFETY:
> +        // - [`CListHead`] has same layout as `list_head`.
> +        // - `ptr` is valid and unmodified for 'a.
> +        unsafe { &*ptr.cast() }
> +    }
> +
> +    /// Get the raw `list_head` pointer.
> +    #[inline]
> +    pub fn as_raw(&self) -> *mut bindings::list_head {
> +        self.0.get()
> +    }
> +
> +    /// Get the next [`CListHead`] in the list.
> +    #[inline]
> +    pub fn next(&self) -> &Self {
> +        let raw =3D self.as_raw();
> +        // SAFETY:
> +        // - `self.as_raw()` is valid per type invariants.
> +        // - The `next` pointer is guaranteed to be non-NULL.
> +        unsafe { Self::from_raw((*raw).next) }
> +    }
> +
> +    /// Get the previous [`CListHead`] in the list.
> +    #[inline]
> +    pub fn prev(&self) -> &Self {
> +        let raw =3D self.as_raw();
> +        // SAFETY:
> +        // - self.as_raw() is valid per type invariants.
> +        // - The `prev` pointer is guaranteed to be non-NULL.
> +        unsafe { Self::from_raw((*raw).prev) }
> +    }
> +
> +    /// Check if this node is linked in a list (not isolated).
> +    #[inline]
> +    pub fn is_linked(&self) -> bool {
> +        let raw =3D self.as_raw();
> +        // SAFETY: self.as_raw() is valid per type invariants.
> +        unsafe { (*raw).next !=3D raw && (*raw).prev !=3D raw }

While is this checking both prev and next? `list_empty` is just
`READ_ONCE(head->next) =3D=3D head`.

> +    }
> +
> +    /// Fallible pin-initializer that initializes and then calls user cl=
osure.
> +    ///
> +    /// Initializes the list head first, then passes `&CListHead` to the=
 closure.
> +    /// This hides the raw FFI pointer from the user.
> +    pub fn try_init<E>(
> +        init_func: impl FnOnce(&CListHead) -> Result<(), E>,
> +    ) -> impl PinInit<Self, E> {
> +        // SAFETY: init_list_head initializes the list_head to point to =
itself.
> +        // After initialization, we create a reference to pass to the cl=
osure.
> +        unsafe {
> +            pin_init::pin_init_from_closure(move |slot: *mut Self| {
> +                init_list_head(slot.cast());
> +                // SAFETY: slot is now initialized, safe to create refer=
ence.
> +                init_func(&*slot)

Why is this callback necessary? The user can just create the list head and
then reference it later? I don't see what this specifically gains over just
doing

    fn new() -> impl PinInit<Self>;

and have user-side

    list <- CListHead::new(),
    _: {
        do_want_ever(&list)
    }


> +            })
> +        }
> +    }
> +}
> +
> +// SAFETY: [`CListHead`] can be sent to any thread.
> +unsafe impl Send for CListHead {}
> +
> +// SAFETY: [`CListHead`] can be shared among threads as it is not modifi=
ed
> +// by non-Rust code per type invariants.
> +unsafe impl Sync for CListHead {}
> +
> +impl PartialEq for CListHead {
> +    fn eq(&self, other: &Self) -> bool {
> +        self.as_raw() =3D=3D other.as_raw()

Or just `core::ptr::eq(self, other)`

> +    }
> +}
> +
> +impl Eq for CListHead {}
> +
> +/// Low-level iterator over `list_head` nodes.
> +///
> +/// An iterator used to iterate over a C intrusive linked list (`list_he=
ad`). Caller has to
> +/// perform conversion of returned [`CListHead`] to an item (using `cont=
ainer_of` macro or similar).
> +///
> +/// # Invariants
> +///
> +/// [`CListHeadIter`] is iterating over an allocated, initialized and va=
lid list.
> +struct CListHeadIter<'a> {
> +    current_head: &'a CListHead,
> +    list_head: &'a CListHead,
> +}
> +
> +impl<'a> Iterator for CListHeadIter<'a> {
> +    type Item =3D &'a CListHead;
> +
> +    #[inline]
> +    fn next(&mut self) -> Option<Self::Item> {
> +        // Advance to next node.
> +        let next =3D self.current_head.next();
> +
> +        // Check if we've circled back to the sentinel head.
> +        if next =3D=3D self.list_head {
> +            None
> +        } else {
> +            self.current_head =3D next;
> +            Some(self.current_head)
> +        }

I think this could match the C iterator behaviour. When the iterator is cre=
ated,
a `next` is done first, and then subsequently you only need to check if
`current_head` is `list_head`.

This is slightly better because the condition check does not need to derefe=
rence
a pointer.

> +    }
> +}
> +
> +impl<'a> FusedIterator for CListHeadIter<'a> {}
> +
> +/// A typed C linked list with a sentinel head.
> +///
> +/// A sentinel head represents the entire linked list and can be used fo=
r
> +/// iteration over items of type `T`, it is not associated with a specif=
ic item.
> +///
> +/// The const generic `OFFSET` specifies the byte offset of the `list_he=
ad` field within
> +/// the struct that `T` wraps.
> +///
> +/// # Invariants
> +///
> +/// - `head` is an allocated and valid C `list_head` structure that is t=
he list's sentinel.
> +/// - `OFFSET` is the byte offset of the `list_head` field within the st=
ruct that `T` wraps.
> +/// - All the list's `list_head` nodes are allocated and have valid next=
/prev pointers.
> +/// - The underlying `list_head` (and entire list) is not modified for t=
he lifetime `'a`.
> +pub struct CList<'a, T, const OFFSET: usize> {
> +    head: &'a CListHead,
> +    _phantom: PhantomData<&'a T>,
> +}

Is there a reason that this is not

    #[repr(transparent)]
    struct CList(CListHead)

? We typically want to avoid putting reference inside the struct if it can =
be on
the outside. This allows `&self` to be a single level of reference, not too=
.

It also means that you can just write `&CList<_>` in many cases, and doesn'=
t need
`CList<'_, T>` (plus all the benefits of a reference).

> +
> +impl<'a, T, const OFFSET: usize> CList<'a, T, OFFSET> {
> +    /// Create a typed [`CList`] from a raw sentinel `list_head` pointer=
.
> +    ///
> +    /// # Safety
> +    ///
> +    /// - `ptr` must be a valid pointer to an allocated and initialized =
`list_head` structure
> +    ///   representing a list sentinel.
> +    /// - `ptr` must remain valid and unmodified for the lifetime `'a`.
> +    /// - The list must contain items where the `list_head` field is at =
byte offset `OFFSET`.
> +    /// - `T` must be `#[repr(transparent)]` over the C struct.
> +    #[inline]
> +    pub unsafe fn from_raw(ptr: *mut bindings::list_head) -> Self {
> +        Self {
> +            // SAFETY: Caller guarantees `ptr` is a valid, sentinel `lis=
t_head` object.
> +            head: unsafe { CListHead::from_raw(ptr) },
> +            _phantom: PhantomData,
> +        }
> +    }
> +
> +    /// Get the raw sentinel `list_head` pointer.
> +    #[inline]
> +    pub fn as_raw(&self) -> *mut bindings::list_head {
> +        self.head.as_raw()
> +    }
> +
> +    /// Check if the list is empty.
> +    #[inline]
> +    pub fn is_empty(&self) -> bool {
> +        let raw =3D self.as_raw();
> +        // SAFETY: self.as_raw() is valid per type invariants.
> +        unsafe { (*raw).next =3D=3D raw }

`self.head.is_linked()`?

> +    }
> +
> +    /// Create an iterator over typed items.
> +    #[inline]
> +    pub fn iter(&self) -> CListIter<'a, T, OFFSET> {
> +        CListIter {
> +            head_iter: CListHeadIter {
> +                current_head: self.head,
> +                list_head: self.head,
> +            },
> +            _phantom: PhantomData,
> +        }
> +    }
> +}
> +
> +/// High-level iterator over typed list items.
> +pub struct CListIter<'a, T, const OFFSET: usize> {
> +    head_iter: CListHeadIter<'a>,
> +    _phantom: PhantomData<&'a T>,
> +}
> +
> +impl<'a, T, const OFFSET: usize> Iterator for CListIter<'a, T, OFFSET> {
> +    type Item =3D &'a T;
> +
> +    fn next(&mut self) -> Option<Self::Item> {
> +        let head =3D self.head_iter.next()?;
> +
> +        // Convert to item using OFFSET.
> +        // SAFETY: `item_ptr` calculation from `OFFSET` (calculated usin=
g offset_of!)
> +        // is valid per invariants.
> +        Some(unsafe { &*head.as_raw().byte_sub(OFFSET).cast::<T>() })
> +    }
> +}
> +
> +impl<'a, T, const OFFSET: usize> FusedIterator for CListIter<'a, T, OFFS=
ET> {}
> +
> +/// Create a C doubly-circular linked list interface [`CList`] from a ra=
w `list_head` pointer.
> +///
> +/// This macro creates a [`CList<T, OFFSET>`] that can iterate over item=
s of type `$rust_type`
> +/// linked via the `$field` field in the underlying C struct `$c_type`.
> +///
> +/// # Arguments
> +///
> +/// - `$head`: Raw pointer to the sentinel `list_head` object (`*mut bin=
dings::list_head`).
> +/// - `$rust_type`: Each item's rust wrapper type.
> +/// - `$c_type`: Each item's C struct type that contains the embedded `l=
ist_head`.
> +/// - `$field`: The name of the `list_head` field within the C struct.
> +///
> +/// # Safety
> +///
> +/// The caller must ensure:
> +/// - `$head` is a valid, initialized sentinel `list_head` pointing to a=
 list that remains
> +///   unmodified for the lifetime of the rust [`CList`].
> +/// - The list contains items of type `$c_type` linked via an embedded `=
$field`.
> +/// - `$rust_type` is `#[repr(transparent)]` over `$c_type` or has compa=
tible layout.
> +/// - The macro is called from an unsafe block.

This is not a safe requirement, probably lift it up and say "This is an uns=
afe
macro.".

> +///
> +/// # Examples
> +///
> +/// Refer to the examples in the [`crate::clist`] module documentation.
> +#[macro_export]
> +macro_rules! clist_create {
> +    ($head:expr, $rust_type:ty, $c_type:ty, $($field:tt).+) =3D> {{
> +        // Compile-time check that field path is a list_head.
> +        let _: fn(*const $c_type) -> *const $crate::bindings::list_head =
=3D
> +            |p| ::core::ptr::addr_of!((*p).$($field).+);

`&raw const` is preferred now.

> +
> +        // Calculate offset and create `CList`.
> +        const OFFSET: usize =3D ::core::mem::offset_of!($c_type, $($fiel=
d).+);
> +        $crate::clist::CList::<$rust_type, OFFSET>::from_raw($head)
> +    }};
> +}
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index f812cf120042..cd7e6a1055b0 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -75,6 +75,7 @@
>  pub mod bug;
>  #[doc(hidden)]
>  pub mod build_assert;
> +pub mod clist;

Can we keep this pub(crate)?

Best,
Gary

>  pub mod clk;
>  #[cfg(CONFIG_CONFIGFS_FS)]
>  pub mod configfs;

