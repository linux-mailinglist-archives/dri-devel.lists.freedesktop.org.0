Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gIJBFvpffmmPXwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jan 2026 21:03:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C702C3C93
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jan 2026 21:03:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EF9910E0EC;
	Sat, 31 Jan 2026 20:03:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WXo+R+SB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013033.outbound.protection.outlook.com
 [40.93.201.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D17F910E0EC;
 Sat, 31 Jan 2026 20:03:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kqIB3FmvkgE1m41hQAatp1yREs/3npVDHZsJN0IOMxpMFGufsL3be1AJfb4qBv4ASSapHZlpB1zyTTrfEuLBvoRUcf4UPUAJT9fcfP8GVDP1qH5xEKDiBGqMH7zz+f10LCP4oAPWwWvycxrdWZRRi+OeOif+ZzmmIQYN9b6EOeTkupjoSKW/BddUTdBlvMq2t8T2jAjBW9ze/HxKTp4BIo5OAOFGIaWO7p8c1JgfZa1Xp7I3BnSlfYWW+RfpZfnTorYwFH91AFgdeGZXX2hgACJR1RvsiU8J7q8JHrdkZwzZ9z/p2JpLFX2ApHf5B/CoBxNDYi46MzbNKSenoL2s2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HXHuxTcPklyD7XVFazYXv08xqs9ryiH3LZt4C6BhNNM=;
 b=I6V/Hsf/QzMWXbYcIZTNzC9cM+kq4E4OIVBR8ez3P2JKTVv4gJT5ewv/vZzCGE4+rI5UwDCslVMnTGWqwO3aGpY52+y86FdTkKTa4HAtbkdp6gyl9tL9dZstGnxC+PyZarE5yRBr7Tou6DmgSjQ+AdeqEDPxuX1xcqM7eIzQkmFcVPwh6Bv8k5YfQ9uAOfCmgYLDUqRm4PqB7sHR/7iEcIFmUQADPJ2lAg7q4Kaq4wq+qXMWye/rw49FWOvWJrob6GNIeE9/0ntkZBy1kXs7QG+iLSG0/QDofcf/jKhX6nXdRM3/1td8D8/+0xYOSGEFASA2UsUO+iAdtDfeBWt0LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HXHuxTcPklyD7XVFazYXv08xqs9ryiH3LZt4C6BhNNM=;
 b=WXo+R+SBfiSEvNpA2dubGn3020bP5Y2/NkNCYkP1w+kqhUQ21aMRhYeGP8AyjcVq+tMNxynE00ljRF3LOmJoFhtR4lishn15Veei45FHZNbAR9fu6r0ZsM2iJb2m3QT56j035kF/fclcpDKyntHmIX+FJvKqToNVqg/hAE3+5faziG/+E2r5lpcOn59zei3YYRO3o1EmKP7zuA26pWPId4xos4tUwrl2OcnBlgdcBYuiBT3ieLFdIAa0cRCR5KtK9yQiQzOdrb4cxwjCS9ZMtZaST+i0q+VBVgQ3VtIiDS4SLY8jI7OCvoZOr9hRkIUR9fBfd93tzZAZJNNctdPi9g==
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 CH2PR12MB9493.namprd12.prod.outlook.com (2603:10b6:610:27c::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.15; Sat, 31 Jan 2026 20:02:53 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9564.007; Sat, 31 Jan 2026
 20:02:53 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Dave Airlie <airlied@gmail.com>
CC: John Hubbard <jhubbard@nvidia.com>, Danilo Krummrich <dakr@kernel.org>,
 Zhi Wang <zhiw@nvidia.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Vivi Rodrigo <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Rui Huang <ray.huang@amd.com>, Matthew
 Auld <matthew.auld@intel.com>, Matthew Brost <matthew.brost@intel.com>, Lucas
 De Marchi <lucas.demarchi@intel.com>, Thomas Hellstrom
 <thomas.hellstrom@linux.intel.com>, Helge Deller <deller@gmx.de>, Alice Ryhl
 <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor
 <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
 <gary@garyguo.net>, Bjorn Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin
 <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross
 <tmgross@umich.edu>, Alistair Popple <apopple@nvidia.com>, Timur Tabi
 <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, Alexandre Courbot
 <acourbot@nvidia.com>, Andrea Righi <arighi@nvidia.com>, Andy Ritger
 <ARitger@nvidia.com>, Alexey Ivanov <alexeyi@nvidia.com>, Balbir Singh
 <balbirs@nvidia.com>, Philipp Stanner <phasta@kernel.org>, Elle Rhumsaa
 <elle@weathered-steel.dev>, Daniel Almeida <daniel.almeida@collabora.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>
Subject: Re: [PATCH RFC v6 05/26] nova-core: mm: Add support to use PRAMIN
 windows to write to VRAM
Thread-Topic: [PATCH RFC v6 05/26] nova-core: mm: Add support to use PRAMIN
 windows to write to VRAM
Thread-Index: AQHcik11qyGZbBwvz0WzOgfFZFFt+bVcRXGAgACjSACAAezQAIAIsj4AgAJhzICAAAyjgIAADTCAgAAbz4CAASb1AIAAYOAAgAEdhdQ=
Date: Sat, 31 Jan 2026 20:02:53 +0000
Message-ID: <BCC6B1EE-D690-4874-8CDC-75AD6B6864D5@nvidia.com>
References: <97af2d85-a905-44d4-951f-e56a40f4312e@nvidia.com>
 <20260130015901.GA301119@joelbox2>
 <c064fbdc-9202-437d-80ff-6134d2a33778@nvidia.com>
 <70d88203-2fe1-4bde-b254-51e8107744eb@nvidia.com>
 <CAPM=9twm1x9rH==uoGQLYa8b4feQMz=Ne14WPuhCPy9_H1u5Tw@mail.gmail.com>
In-Reply-To: <CAPM=9twm1x9rH==uoGQLYa8b4feQMz=Ne14WPuhCPy9_H1u5Tw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR12MB6486:EE_|CH2PR12MB9493:EE_
x-ms-office365-filtering-correlation-id: f4c04a37-8f0b-4eba-1988-08de6103b805
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?WkZ6WDdoMXQ5bnNNbTJLU0NRNWdVdmp6UlNyZ1c5MTZrUXdUWkxCei9kb0Mw?=
 =?utf-8?B?dVZWWjc0SVp4bW9hK2FnQ0wxZ0FkOVlPemdjV29wbEhuQXZWVG5hbWpMa1RM?=
 =?utf-8?B?WjU4cStUUTJMK3phYjVKK0VGaHBmcnV6Z3V6OHY0ZzhHd2FPeFovei9pMUR5?=
 =?utf-8?B?VjFsMmVldXBBdG5zT0FZVjhKK01IaHNOaUV6bEhQY3htWE9CSmFWQlhwb21R?=
 =?utf-8?B?UDhoQkhOMmtocUM4aVF1N0srViswNVJMQis4VEpQb2Y5Si92cnIwVVY3Y2dY?=
 =?utf-8?B?blIyZFhMQllhbllyeUsrQVhDRCtEb0h3NzVUcXBlU1Nhb01ISGRlSjRIcU9X?=
 =?utf-8?B?cEkzTUpON0lGUE5QUGl0ZTNJaHNSc0Vlb1RPbEE2Uy9iWitNbkhyV3d1Wnl5?=
 =?utf-8?B?UEFVTkVKc2FaRVNIdzNzQ25XRUt1MzNMVnNrM0pKTmhlNUx3dDV4RUh3QVNT?=
 =?utf-8?B?b0hVMzdFWlF5N0pxMmdrMDNldkNka09CYWc2WS9Pak5iRUpvVEhUNkErTWxP?=
 =?utf-8?B?RWxQaVFRZ3FuZjFwaSt5RUpHWHFpWTNWSW1kZ1JvajFDNWVSazY5N0xQSlJH?=
 =?utf-8?B?cnNvSytLZytuQXFBRmZReHNBSWJGRzdKcDhqQnhuZDIzVmQ0N1kwSllUNlN6?=
 =?utf-8?B?N1dBbnNpRFhRL09teWQ5RjVYVDRYaW10TDhYejlvRkNSNnJ4Tjk4V0NKS2Ey?=
 =?utf-8?B?emVVM3lidU1Ic1VWMUZ5ZUdTRTVnK0sxNytJUmpoOXZjRVBCWEhPVXNZNGQ5?=
 =?utf-8?B?c2tCUlU0T2h6TjF4TWV1aWN3VkZZdmlLRXlYcVhwVmtjVmlHWFN6TG90VUJ3?=
 =?utf-8?B?allYQVl3TDl5anJhZXpCUXJGRDBSd1F5UlJQTnc4UUcxN29TN21GZlZnNzRR?=
 =?utf-8?B?NHZzRVB4L052cmQwd003NnVSVDBYYXlTcEFrT0s1Z2FSVlZvaHl6REhoa0Ja?=
 =?utf-8?B?d05PcWNwL2d2M1MvZlh2Tzd0QnpYYjVmVE90eFB5bVBhTWFPbGYyUUg0L0p2?=
 =?utf-8?B?ODhIajZPNWk2RG8xWWVFdnBxSVg3SUJobTBCalR0ai9RQ0FzOGQ3aUQvclRs?=
 =?utf-8?B?V3oyRkRzbFEvbkpiN1NqOEhVeHpKYzhJWGlnQy95NXhiNVIyM3BjQUlsY2Rv?=
 =?utf-8?B?TFZtVzV5bkd3eWdVQndkejlncTlRUzFmeUk5WEdGa2FlZ1d4Z05PT3N3NVlw?=
 =?utf-8?B?YlNUMlYxWUY5bXNDZlYyODRIUlhWbjNjUFB0dGhNdEVYL0prTCs5Z3R1ZUR3?=
 =?utf-8?B?UXczaUZzTGhnT3hXQkdsb1h0c1VjMUYwMlFuWmFFU3FoTnVJN2JoOFgyNXh4?=
 =?utf-8?B?NjVqWEs3QVhqdUZUa240VXBuZWhqK1hKdndWQ1JYdHptRHM2VjM2Q3B6Uk8z?=
 =?utf-8?B?ZzI1Y3hxTUJhbFdRSHh5TDhkVkxXOGNadkQ2Sm0zMHltREdSMno2WWw4SlFj?=
 =?utf-8?B?RlVBbW01ODZ4bHB3Q0pzcDltYkFNVTM4VkNWVWJDb1FYTUxxU2VWR3llVEh4?=
 =?utf-8?B?N3dueldWQ09jbkVLQzRBNWVFNFJDd2JIbEthcG4vN1dGdnBQUUVsREF0R3VL?=
 =?utf-8?B?bjBNYjNkQjhCZ1M5SWZHbU5WSytTR2k3V1RBbXQ3eVhqTWJaZDJyUGtrREww?=
 =?utf-8?B?YjhBSkgwL2lwelFRL3FhQ0t1Q05zV2MxUXZob09JSXJYem8wVTNMMS9wUmo1?=
 =?utf-8?B?OThJeUdRN1NPOE1SZ0QyTnhmZTNjQ2hUVWw1dEpCbHhKUXdDSkppdndDY0l5?=
 =?utf-8?B?cHh1SjhBU1M1WlZiTHZTaUNrY0VpVUVjSGovV0tTWTAxZHUxRzlsdVJqc01L?=
 =?utf-8?B?cDZIek5odEVGRTE1MnZnM3VDVVFQbTVwcmFraGxtcjV6ZWtuUDYwb1JVNUkx?=
 =?utf-8?B?VHFvRTJRd29KL0FWT2VYYkVDOGJWcVFpZThsZFdiSG1lMHhnUWZTcjE0d3FG?=
 =?utf-8?B?SDZhWFl1QkNpZWRSVzFGejltazdKaU5TWEZqZjg2UlJ3L3NLS3hhajEwbE1s?=
 =?utf-8?B?Wmdrb05KN25BbHA2b2RhRWxuOG1URlZLc3lWRDlBSHIxRWxXbUVQMWo1ZUYr?=
 =?utf-8?B?YzNzcFdIcVFtbldxVE85WUJkY1JFdkVscDY1V2xIZkhxeUdsbm9LVDdyVVAz?=
 =?utf-8?B?Z0I3ZUFkUnprVXZqQmE0aHB3aDFDbWxSM3pkOUlCNGJKRUdIVWU4UEF5d3Rl?=
 =?utf-8?Q?YVe3v9LRplgyzeb4OxPhLGE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UVFjaFhsZmw0bG5IY21GTk5Wckc0bVhRanNSR3dta0dZcUdsTTlRdW42RTBo?=
 =?utf-8?B?WFcyQmpUc3V5ajVuOTVsOXozMW5VS2xmQlpNT3NlNEp2UHVlc2VFQlhCamJW?=
 =?utf-8?B?aXN2TUZ3UHRJVjlBaDVRZ0ZvelNBMWIzb2JPRi9mZk5XTmQweS8xSzd6c2xw?=
 =?utf-8?B?OHpGTGRHVllaNUNKVys5ai8yaG5oQ29XTFQyZFYyVVRMdTNGbGpqQXY5TzBU?=
 =?utf-8?B?NkFpZVVoalplUkpFSkkrQS9DQ0JPbEFJT01qYkp5Q1gya2lpVVB2eEY2Zysx?=
 =?utf-8?B?anh0Z1VvcDlrMHQrK3h2Ujh1NG14dTRiNUtSc0E1Nk1VZ1EvOW1wNVYyRW5M?=
 =?utf-8?B?dEJmUVdsRy9LbGh6bFFlZXpEbURPeGJrMzFqNDc0U3FheUZSKzV6L0JPYlRx?=
 =?utf-8?B?Y3RoVkpCV2hKTExydnFKSTdOREdkMXFEbVhSSUdpMkd6bjA1YjlYenJCNGlK?=
 =?utf-8?B?UnRTaVlJMWVvNGFNVzFZb1hycVdnWm0renNqNzJoWnRmVEtaeGVSZXdLcnR5?=
 =?utf-8?B?RHlBTTdRcnVtczB2L3FuRkhqS2YwbjAxbnJUc1FNd216RG1ON2NMcS9DbVFs?=
 =?utf-8?B?T1ZOc0xRb1I4TzFhcVJJZFo5MXFrOE9XcGpINmZPQ0ZnUU52VXNhWjhZSEc1?=
 =?utf-8?B?eGZ5aFhIZlJBbHFMUncyN3lyd1luMmhPTkcvOUVld1FhcTU0a0xXa2dGYmNn?=
 =?utf-8?B?RmkvbWZSVnljL2V6bis1TlFjMlVySlMwckpKTUNldDVDQ0tJemVrR2hPSC9w?=
 =?utf-8?B?WFcyUDZwZmU1TlhuZlVmMFNiczRsMklzN08wSklLcjluKzYvaFNZZjh0Rjdx?=
 =?utf-8?B?SkdyVWV1d3pIb2NYVWErSlBjM0hvUmtRU1lNRitaSFkrYW9VcVl4b1VHOHA3?=
 =?utf-8?B?K1djTDhNb0o2enRIb2VxeGJHSzBYek45dnhXMUVERlp4VVArcWhVekVXV240?=
 =?utf-8?B?SnlmMEo1ZmFhdXZNTFZVTE5uSk9mNEpRVzVVYUhCR2dNcDJvUjNlQVJaOURz?=
 =?utf-8?B?K1BzcSthZ3JnTzhDbGdEMUlRYmdGU2lzZHA2MFg5bS9WcUxZa095dFAxWnBq?=
 =?utf-8?B?azR4c1RWcjJJclJyZXNDM3VhU1E0TDVCK095UHNqb2U0RGI0YU1LRXRsWkNn?=
 =?utf-8?B?S3FpamZvbm5OYjA1alN1U2VXL2lNeGlra2JRa3pqdFBHUVRvMFk3S3p3dDl4?=
 =?utf-8?B?UHp3b2dZdjFkK1FNVjRVNU5SNFVTakIwK2tmcDJmVTlkTDU0RmlNclRubGkv?=
 =?utf-8?B?RlF1ZWx6ZEFDQUFEcEsxR00vUmw4LzdsSitJMXRkQXBTTUdNWlhqaUZUVUhT?=
 =?utf-8?B?NWJuQkpYV3FwZFRCVzE0UzVtNnNlUkhQY1c1SURmWXZwMDREMTdtOU9zTGdB?=
 =?utf-8?B?RGdBcGJ2VDRoTzlRWTVydlZ5M0N1bldmL0VGZFJhK0crcHlCeUJQVjhLaDJi?=
 =?utf-8?B?ZnJrR21raUJTL3hxUkFPU3hpNDJqN2l0Q1V3RG9vdVNXMFBmM3FJNEF3Q2Nt?=
 =?utf-8?B?SnpIUFBNWVRtZXZXSVRuVnczSk9SVTk3cDBKOURjYS81SW9GWlhmUHE0WG9L?=
 =?utf-8?B?MTkwUWFTTlU3RmdOWm1STElvZDRUVFl6RlNHRUJnV04zOTRVSHVRQ2U3U0pa?=
 =?utf-8?B?aDFFRUlZYU9GWUM2N0V5WFJaMWVGcFpEUGg2UFFDWFpXcGsvUHlpbDUxUlN2?=
 =?utf-8?B?Slo5UUhoRkJHNE9MUHIvNjNCQnAxayt3WmFSQnZKdDRrZ1orc1AxUUVKMU9x?=
 =?utf-8?B?L1p2WS90TXE4Ynllem5IZng4VnlwdGFsVHB1cHRKUEJyOVVEYXJ5bWg5Rzgy?=
 =?utf-8?B?SFNLVm5KZXNDOUlBRDdZditoQ1pXTFlUcE5zaVgvMjl6TllIMXdzeExXRkNF?=
 =?utf-8?B?ODNheUFDNHhKZU5vM1NsQjVwZ0VNNmoyNTU5NUdvRWtYYkZka3AweG5pSnMw?=
 =?utf-8?B?cVFwQUZYeHdsUnIyL0k3V2JLZVNaOUZXa2k4a1JRLzBYUXdyTFZyR2w1Q3dP?=
 =?utf-8?B?ZEhkVFk3ZXdNMDB2MXB3QVhGOW5jb3VIQ3NOWUNsYTRxZ084N3Z3UWJ3Ymcw?=
 =?utf-8?B?S1kwdkNtSEkyY0wyWkhiaExDenhheldMdE1HVWZKQnVLc1hEMmNJaVNvdkU1?=
 =?utf-8?B?bHRuSGdCdTRSQUhJQ1JNaWpsL0ttUWdlK1VDeW9abXkrRTg4V3ZTZGdodVB4?=
 =?utf-8?B?OGpVQ2dPaGxaaG51NzFjUXQ0ZTl2ek5FS0haVkttTE5HTXZoaFBjQTNCc2Nv?=
 =?utf-8?B?WDZheG9FS09aa3dzU2QxdmFSWDFpSktZUDlLNzhlNUxmUWlPVzRtNkxRRWtn?=
 =?utf-8?B?bmlzZnNhTDJNUzVMVFRBeGZDSXpmNXFGOWdTbklSMm16ZTViSjlFQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4c04a37-8f0b-4eba-1988-08de6103b805
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2026 20:02:53.2721 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y5XojMz2KkYS/yg24ZB8LHy9wAtycriWfrlEjZ9P8rbeUD451TBEm6c47INZ3AhtuUHUvK/wOEVgp5a3cSA5Rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9493
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
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_GT_50(0.00)[50];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[nvidia.com,kernel.org,vger.kernel.org,linux.intel.com,suse.de,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,gmail.com,garyguo.net,protonmail.com,umich.edu,weathered-steel.dev,collabora.com,lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 0C702C3C93
X-Rspamd-Action: no action

SGkgRGF2ZSwNCg0KPiBPbiBKYW4gMzAsIDIwMjYsIGF0IDEwOjAx4oCvUE0sIERhdmUgQWlybGll
IDxhaXJsaWVkQGdtYWlsLmNvbT4gd3JvdGU6DQo+IA0KPiDvu79PbiBTYXQsIDMxIEphbiAyMDI2
IGF0IDA3OjE0LCBKb2VsIEZlcm5hbmRlcyA8am9lbGFnbmVsZkBudmlkaWEuY29tPiB3cm90ZToN
Cj4+IA0KPj4gDQo+PiANCj4+PiBPbiAxLzI5LzIwMjYgMTA6MzggUE0sIEpvaG4gSHViYmFyZCB3
cm90ZToNCj4+PiBPbiAxLzI5LzI2IDU6NTkgUE0sIEpvZWwgRmVybmFuZGVzIHdyb3RlOg0KPj4+
PiBPbiAxLzI5LzI2IDg6MTIgUE0sIEpvaG4gSHViYmFyZCB3cm90ZToNCj4+Pj4+IE9uIDEvMjkv
MjYgNDoyNiBQTSwgSm9lbCBGZXJuYW5kZXMgd3JvdGU6DQo+Pj4+Pj4gQmFzZWQgb24gdGhlIGJl
bG93IGRpc2N1c3Npb24gYW5kIHJlc2VhcmNoLCBJIGNhbWUgdXAgd2l0aCBzb21lIGRlYWRsb2Nr
DQo+Pj4+Pj4gc2NlbmFyaW9zIHRoYXQgd2UgbmVlZCB0byBoYW5kbGUgaW4gdGhlIHY2IHNlcmll
cyBvZiB0aGVzZSBwYXRjaGVzLg0KPj4+Pj4+IFsuLi5dDQo+Pj4+Pj4gbWVtb3J5IGFsbG9jYXRp
b25zIHVuZGVyIGxvY2tzIHRoYXQgd2UgbmVlZCBpbiB0aGUgZG1hLWZlbmNlIHNpZ25hbGluZw0K
Pj4+Pj4+IGNyaXRpY2FsIHBhdGggKHdoZW4gZG9pbmcgdGhlIHZpcnR1YWwgbWVtb3J5IG1hcC91
bm1hcCkNCj4+Pj4+IA0KPj4+Pj4gdW5tYXA/IEFyZSB5b3Ugc2VlaW5nIGFueSBhbGxvY2F0aW9u
cyBoYXBwZW5pbmcgZHVyaW5nIHVubWFwPyBJIGRvbid0DQo+Pj4+PiBpbW1lZGlhdGVseSBzZWUg
YW55LCBidXQgdGhhdCBzb3VuZHMgc3VycHJpc2luZy4NCj4+Pj4gDQo+Pj4+IE5vdCBhbGxvY2F0
aW9ucyBidXQgd2UgYXJlIGFjcXVpcmluZyBsb2NrcyBkdXJpbmcgdW5tYXAuIE15IHVuZGVyc3Rh
bmRpbmcNCj4+Pj4gaXMgKGF0IGxlYXN0IHNvbWUpIHVubWFwcyBoYXZlIHRvIGFsc28gYmUgZG9u
ZSBpbiB0aGUgZG1hIGZlbmNlIHNpZ25hbGluZw0KPj4+PiBjcml0aWNhbCBwYXRoICh0aGUgcnVu
IHN0YWdlKSwgYnV0IERhbmlsby95b3UgY2FuIGNvcnJlY3QgbWUgaWYgSSBhbSB3cm9uZw0KPj4+
PiBvbiB0aGF0LiBXZSBjYW5ub3QgYXZvaWQgYWxsIGxvY2tpbmcgYnV0IHRob3NlIHNhbWUgbG9j
a3MgY2Fubm90IGJlIGhlbGQgaW4NCj4+Pj4gYW55IG90aGVyIHBhdGhzIHdoaWNoIGRvIGEgbWVt
b3J5IGFsbG9jYXRpb24gKGFzIG1lbnRpb25lZCBpbiBvbmUgb2YgdGhlDQo+Pj4+IGRlYWRsb2Nr
IHNjZW5hcmlvcyksIHRoYXQgaXMgcHJvYmFibHkgdGhlIG1haW4gdGhpbmcgdG8gY2hlY2sgZm9y
IHVubWFwLg0KPj4+PiANCj4+PiANCj4+PiBSaWdodCwgT0sgd2UgYXJlIG9uIHRoZSBzYW1lIHBh
Z2Ugbm93OiBubyBhbGxvY2F0aW9ucyBoYXBwZW5pbmcgb24gdW5tYXAsDQo+Pj4gYnV0IGl0IGNh
biBzdGlsbCBkZWFkbG9jaywgYmVjYXVzZSB0aGUgZHJpdmVyIGlzIHR5cGljYWxseSBnb2luZyB0
bw0KPj4+IHVzZSBhIHNpbmdsZSBsb2NrIHRvIHByb3RlY3QgY2FsbHMgYm90aCBtYXAgYW5kIHVu
bWFwLXJlbGF0ZWQgY2FsbHMNCj4+PiB0byB0aGUgYnVkZHkgYWxsb2NhdG9yLg0KPj4gDQo+PiBZ
ZXMgZXhhY3RseSENCj4+IA0KPj4+IA0KPj4+IEZvciB0aGUgZGVhZGxvY2sgYWJvdmUsIEkgdGhp
bmsgYSBnb29kIHdheSB0byBicmVhayB0aGF0IGRlYWRsb2NrIGlzDQo+Pj4gdG8gbm90IGFsbG93
IHRha2luZyB0aGF0IGxvY2sgaW4gYSBmZW5jZSBzaWduYWxpbmcgY2FsbGluZyBwYXRoLg0KPj4+
IA0KPj4+IFNvIGR1cmluZyBhbiB1bm1hcCwgaW5zdGVhZCBvZiAibG9jaywgdW5tYXAvZnJlZSwg
dW5sb2NrIiBpdCBzaG91bGQNCj4+PiBtb3ZlIHRoZSBpdGVtIHRvIGEgZGVmZXJyZWQtZnJlZSBs
aXN0LCB3aGljaCBpcyBwcm9jZXNzZWQgc2VwYXJhdGVseS4NCj4+PiBPZiBjb3Vyc2UsIHRoaXMg
aXMgYSBsaXR0bGUgY29tcGxleCwgYmVjYXVzZSB0aGUgYWxsb2NhdGlvbiBhbmQgcmVjbGFpbQ0K
Pj4+IGhhcyB0byBiZSBhd2FyZSBvZiBzdWNoIGxpc3RzIGlmIHRoZXkgZ2V0IGxhcmdlLg0KPj4g
WWVzLCBhbHNvIGF2b2lkaW5nIEdGUF9LRVJORUwgYWxsb2NhdGlvbnMgd2hpbGUgaG9sZGluZyBh
bnkgb2YgdGhlc2UgbW0gbG9ja3MNCj4+ICh3aGljaGV2ZXIgd2UgdGFrZSBkdXJpbmcgbWFwKS4g
VGhlIEdQVSBidWRkeSBhY3R1YWxseSBkb2VzIEdGUF9LRVJORUwNCj4+IGFsbG9jYXRpb25zIGlu
dGVybmFsbHkgd2hpY2ggaXMgcHJvYmxlbWF0aWMuDQo+PiANCj4+IFNvbWUgc29sdXRpb25zIC8g
bmV4dCBzdGVwczoNCj4+IA0KPj4gMS4gYWxsb2NhdGluZyAoVlJBTSBhbmQgc3lzdGVtIG1lbW9y
eSkgb3V0c2lkZSBtbSBsb2NrcyBqdXN0IGJlZm9yZSBhY3F1aXJpbmcgdGhlbS4NCj4+IA0KPj4g
Mi4gcHJlLWFsbG9jYXRpbmcgYm90aCBWUkFNIGFuZCBzeXN0ZW0gbWVtb3J5IG5lZWRlZCwgYmVm
b3JlIHRoZSBETUEgZmVuY2UNCj4+IGNyaXRpY2FsIHBhdGhzIChUaGUgaXNzdWUgaXMgYWxzbyB0
byBmaWd1cmUgb3V0IGhvdyBtdWNoIG1lbW9yeSB0byBwcmUtYWxsb2NhdGUNCj4+IGZvciB0aGUg
cGFnZSB0YWJsZSBwYWdlcyBiYXNlZCBvbiB0aGUgVk1fQklORCByZXF1ZXN0LiBJIHRoaW5rIHdl
IGNhbiBhbmFseXplDQo+PiB0aGUgcGFnZSB0YWJsZXMgaW4gdGhlIHN1Ym1pdCBzdGFnZSB0byBt
YWtlIGFuIGVzdGltYXRlKS4NCj4+IA0KPj4gMy4gVW5mb3J0dW5hdGVseSwgSSBhbSB1c2luZyBn
cHUtYnVkZHkgd2hlbiBhbGxvY2F0aW5nIGEgVkEgcmFuZ2UgaW4gdGhlIFZtbQ0KPj4gKGNhbGxl
ZCB2aXJ0X2J1ZGR5KSwgd2hpY2ggaXRzZWxmIGRvZXMgR0ZQX0tFUk5FTCBtZW1vcnkgYWxsb2Nh
dGlvbnMgaW4gdGhlDQo+PiBhbGxvY2F0ZSBwYXRoLiBJIGFtIG5vdCBzdXJlIHdoYXQgZG8geWV0
IGFib3V0IHRoaXMuIElTVFIgdGhlIG1hcGxlIHRyZWUgYWxzbw0KPj4gaGFzIHNpbWlsYXIgaXNz
dWVzLg0KPj4gDQo+PiA0LiBVc2luZyBub24tcmVjbGFpbWFibGUgbWVtb3J5IGFsbG9jYXRpb25z
IHdoZXJlIHByZS1hbGxvY2F0aW9uIG9yDQo+PiBwcmUtYWxsb2NhdGVkIG1lbW9yeSBwb29scyBp
cyBub3QgcG9zc2libGUgKEknZCBsaWtlIHRvIGF2b2lkIHRoaXMgIzQgc28gd2UNCj4+IGRvbid0
IGZhaWwgYWxsb2NhdGlvbnMgd2hlbiBtZW1vcnkgaXMgc2NhcmNlKS4NCj4+IA0KPj4gV2lsbCB3
b3JrIG9uIHRoZXNlIGlzc3VlcyBmb3IgdGhlIHY3LiBUaGFua3MsDQo+IA0KPiBUaGUgd2F5IHRo
aXMgd29ya3Mgb24gbm91dmVhdSBhdCBsZWFzdCAoYW5kIEkgaGF2ZW4ndCB5ZXQgcmVhZCB0aGUN
Cj4gbm92YSBjb2RlIGluIGRlcHRoKS4NCj4gDQo+IElzIHdlIGhhdmUgNCBzdGFnZXMgb2Ygdm1t
IHBhZ2UgdGFibGUgbWdtdC4NCj4gDQo+IHJlZiAtIGxvY2tlZCB3aXRoIGEgcmVmIGxvY2sgLSBj
YW4gYWxsb2NhdGUvZnJlZSBtZW1vcnkgLSBqdXN0IG1ha2VzDQo+IHN1cmUgdGhlIHBhZ2UgdGFi
bGVzIGV4aXN0IGFuZCBhcmUgcmVmZXJlbmNlIGNvdW50ZWQNCj4gbWFwIC0gbG9ja2VkIHdpdGgg
YSBtYXAgbG9jayAtIGNhbm5vdCBhbGxvY2F0ZSBtZW1vcnkgLSBmaWxsIGluIHRoZQ0KPiBQVEVz
IGluIHRoZSBwYWdlIHRhYmxlDQo+IHVubWFwIC0gbG9ja2VkIHdpdGggYSBtYXAgbG9jayAtIGNh
bm5vdCBhbGxvY2F0ZSBtZW1vcnkgLSByZW1vdmVzDQo+IGVudHJpZXMgaW4gUFRFcw0KPiB1bnJl
ZiAtIGxvY2tlZCB3aXRoIGEgcmVmIGxvY2sgLSBjYW4gYWxsb2NhdGUvZnJlZSBtZW1vcnkgLSBq
dXN0IGRyb3BzDQo+IHJlZmVyZW5jZXMgYW5kIGZyZWVzIChub3Qgc3VyZSBpZiBpdCBldmVyIG1l
cmdlcykuDQoNClRoYW5rcyBmb3Igc2hhcmluZyB0aGlzLCB5ZXMgdGhpcyBpcyBzaW1pbGFyIHRv
IHdoYXQgSSBhbSBjb21pbmcgdXAgd2l0aC4NCg0KT25lIHRoaW5nIGlzIE9wZW5STSAoYW5kIHRo
ZSBMaW51eCBrZXJuZWwpIGhhdmUgZmluZXIgZ3JhaW5lZCBsb2NraW5nLg0KDQpCdXQgSSB0aGlu
ayB3ZSBjYW4ga2VlcCBpdCBzaW1wbGUgaW5pdGlhbGx5IGxpa2Ugd2UgZG8gZm9yIE5vdXZlYXUg
d2l0aCBhZGRpdGlvbmFsIGNvbXBsZXhpdHkgcHJvZ3Jlc3NpdmVseSBhZGRlZC4NCg0KSm9lbCBG
ZXJuYW5kZXMNCg0KDQo+IA0KPiBTbyBtYXBzIGFuZCB1bm1hcHMgY2FuIGJlIGluIGZlbmNlIHNp
Z25hbGxpbmcgcGF0aHMsIGJ1dCB1bnJlZnMgYXJlDQo+IGRvbmUgaW4gZnJlZSBqb2IgZnJvbSBh
IHdvcmtxdWV1ZS4NCj4gDQo+IERhdmUuDQo+PiANCj4+IC0tDQo+PiBKb2VsIEZlcm5hbmRlcw0K
Pj4gDQo=
