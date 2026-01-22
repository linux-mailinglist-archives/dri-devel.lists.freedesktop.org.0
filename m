Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8JaHAGKscmkkogAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 00:01:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9FE6E5D5
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 00:01:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7813B10EB8A;
	Thu, 22 Jan 2026 23:01:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="AQH4aKuY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CWXP265CU009.outbound.protection.outlook.com
 (mail-ukwestazon11021119.outbound.protection.outlook.com [52.101.100.119])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7DF910EB8A
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 23:01:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lv9F3nb8r3D51wggpI7+84IwZniS3IyOSEzAnRX+9ywxJUy/cWZUS8TU9E6iE+1Uc5Y+IR0FAMLXsDQ3SZGuX2Q30v9sFT+YktgMl467995kjHq0Hv1gKIj8bTumCnyZiB5aLyLP462e2Q3j+ve9N7oxQVMhUoSqV4GyTcrwqO7Rd5rG1SRIMtzlj4QDtqmGuAP/5hVCVesEVrI8uaKfstcHGHu+1NeM8fdPdEM7CMJ2XW3HYBFj+6UzyBQOMozG54gtKqHJaRZCv/ZPGpXeOrdxqQfvqa7Ze9GIlcrf08jNRcJlS0PRJHsbEDxXVmW15sox9YtEcQdOQ06H0UKv7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rXH9reEeKqkJP/J7ip8psj419yRUCCZEvnA9npDNREc=;
 b=Py/C6oemjXLzsPnyubBBKSK+XqJ8G87e9IyAg29qjlDMWqCbZtGjJQgXyXMiDMjH8atbdxakplUQxHWyvWZlIxwilHf7tnMGgoF6SPcoSxNLCKY+Na/4MCFeRof57BtClPAdS3RdOZgQ9tNJYv0zNo8wp2b8hvdd/osJju7Sn560EtnfPdgQCQZNS1JfQEe/sf65GQp8hVxHiTRz4Mv+vtCc+RO9q2WhcAL1JezXeMiE9KKAxevJJaA46rrt2csZGUiCphGEGfkdFbOhMisDr0BIiKS9MgbxrL7tGY8l4+bJswlCDtFDmh0OMBarG9Xbjt9Kj9YE28rrjzXi/edZig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rXH9reEeKqkJP/J7ip8psj419yRUCCZEvnA9npDNREc=;
 b=AQH4aKuYvT2nODg1WamEzIWldYuoJgcDRdOWLz0oyzxypvVCawF6JxoHX4n/h3i9vsjndFSMDJkBrjdOkYpEJsUkSizXCV+jI0yZLaO3ODCDD0/DX2VKVkLApWoIt0uc6Hi+5Bj40oIdrTexSPqvmjBbOkCfpQFQLbZvEEPTCO8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO4P265MB6572.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2f6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Thu, 22 Jan
 2026 23:01:47 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9542.010; Thu, 22 Jan 2026
 23:01:47 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 22 Jan 2026 23:01:46 +0000
Message-Id: <DFVHQBHQR2CW.2X27B7EP1WXTO@garyguo.net>
Cc: "Danilo Krummrich" <dakr@kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Simona Vetter" <simona@ffwll.ch>,
 "Alice Ryhl" <aliceryhl@google.com>, "Shankari Anand"
 <shankari.ak0208@gmail.com>, "David Airlie" <airlied@gmail.com>, "Asahi
 Lina" <lina+kernel@asahilina.net>, "Atharv Dubey" <atharvd440@gmail.com>,
 "Daniel Almeida" <daniel.almeida@collabora.com>
Subject: Re: [PATCH] rust/drm: Fixup import styles
From: "Gary Guo" <gary@garyguo.net>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, <lyude@redhat.com>,
 "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260122202804.3209265-1-lyude@redhat.com>
 <DFVEI4KHCNFS.2IT595IZJBGGT@kernel.org>
 <25d3c403781a88019340a47567ff85959b0c03bd.camel@redhat.com>
 <CANiq72k1b3DLEy_32ruWu1XBFK80oRDVzSer69ANL_232mmv-w@mail.gmail.com>
In-Reply-To: <CANiq72k1b3DLEy_32ruWu1XBFK80oRDVzSer69ANL_232mmv-w@mail.gmail.com>
X-ClientProxiedBy: LO4P123CA0419.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::10) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO4P265MB6572:EE_
X-MS-Office365-Filtering-Correlation-Id: 656ef3d4-ec23-4c15-d36e-08de5a0a381b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a2xGdWxzRHNMcE9FY3lsNTM1VFNPNkFIRSt0djVxMnZoQy9neHM5NFhuZWFW?=
 =?utf-8?B?VGVleUxoamRpM2FkMlVMOGgyOXJQbDJIQm9xdW1sZG0yZFJUT1NxbGJ0ZzFq?=
 =?utf-8?B?a24ySGRvS2llY290WTRYdFJOWFQzbzEwODZhSmxEdmV4Q1BaVk9jWU9oY0lm?=
 =?utf-8?B?Y0k4ZmpmTHRwQjhiek4rTnZrOHcrQUFjZFN5OVhaUTBLQW9OTlZiWWx3emt5?=
 =?utf-8?B?TlQ4cHFNT1JOZE1ETVNYckFET2E0N2llRVZSanpROWlVY0J1b3pLWTJnMWVt?=
 =?utf-8?B?Y0YzTnB5ODhZT2VGT1ZJR0l6dzhOb1BEYWdiRmNoK3o0UUp0Z243dTRKN1R3?=
 =?utf-8?B?QTIxY1Ntd04wQW5XdFBuL1kyS1VySjM5OUNWcGxQVnA2VGp6YytLRWs2U2tq?=
 =?utf-8?B?azZ3RS9pSDErSk9URzB1NG5lamdpcU03MTJqMzk5WWVITVBEOG1ZNHhjSEk3?=
 =?utf-8?B?dFkxR21tS2szWTI5SVpOd3ltbDg1RlIwcVlUVDNOT1cwVWdDMTJxeGo1ZDE5?=
 =?utf-8?B?VmdqYWxmTGZaQWxsdnY3RFRFOGxXdEdxMkhzbnREeHhuemVsR0NVY0hocVVx?=
 =?utf-8?B?ZDBPTThrdE53WlRPN3BQR3ByaU1vVDQxQnh5Y3VFajdTbm5EU1RldjVpak84?=
 =?utf-8?B?R0hKbUhtelFiS055dFkyNHBqVHFvZ01yVWNIOXR3QkF2RW1FbS9kbUhpS1VM?=
 =?utf-8?B?Qis2QUdXdW1pSkw5SnJ5eVlQcEp2Mm9kNzRFSEl3ODI2UkR3c2VFQXJwUTAv?=
 =?utf-8?B?UWF3c2xvYTREV1dVSk9uUVdMUzB1YjFJbEVDR0lTWXdlSncrL0VkUVZJY2xU?=
 =?utf-8?B?TGlwKzhPaU9LRldDRlFobWs4SUN6RXh6a09LMHNTNUlXRXowMVZYRGtoOE1E?=
 =?utf-8?B?NWhLSnY1dG5sZDlmUG5CbXFFTjNSazNyRGI2bzJ2K0lTTGxlWjZoYlJ3T29T?=
 =?utf-8?B?cGVzblJrZWVMZ3lVSlhwMGxxMDJCYjh0OE5wdE5rZlFpK2UwZ05IZ1NVQ1ND?=
 =?utf-8?B?NXcvdnFRZFkwL25RK09WbzFySktBS29mbitTTUdKTGpSQTVKcHRJZ3hCSThD?=
 =?utf-8?B?NFMzVWpwQmpmOEVBc2tucmNuSzhEL0NiTE1WUG9hZGdZUW5CVzZQZFhuUCtJ?=
 =?utf-8?B?RGFQOTlQT3l2ekpxSUlmeWRQWmFiUGJXb3RlT0x2cUxmcG91K1BZTUJTR09J?=
 =?utf-8?B?ZmVkdTBvRTdRNjNWSFpsd0FSRmdKRU5kVmNPTUd4QnpxZWttaUNaNFpNajVR?=
 =?utf-8?B?QjZNWEg1QlQvYVR5UW5LTkFUbTFUOFFCaTZPb2gySHEzakwramVZaXAyVTB6?=
 =?utf-8?B?bE1yZGJXZFpHcmx1M0hoNk8rUVdSTGtzS0IxdHZwNXJKcFVXWUJVM3RsR014?=
 =?utf-8?B?OW1QTlhKQXMvMWVmMnNSbzFSK1hCM3N2Yit5WlYxaHpYa25QQW4yNWdqdWZx?=
 =?utf-8?B?aDJMbzRvZHdZbFVNZlRkUEVhN1VkWFc5Nm4rdjlzV1FSSm1US3BMQll3VlRj?=
 =?utf-8?B?WHc4dlM3RjR4dGVuUXZHOFk1b0VPYklkSVpESDNoYjRKeG0vOUJIN3A2aUZI?=
 =?utf-8?B?MDY0SXA0MlBpeHFaZHREaXBxTVErVGNLZDB2VWpIamFkeFczWkFzeVE5RU1J?=
 =?utf-8?B?RGkwVVpmcDVITUMxZGduNXJ6SnkrUWcxL2hDaUdJbjFMbVhMZWNZOE94cHpW?=
 =?utf-8?B?VzJzNkY4RG5zdmMwV0ppZ3NZSnpHTldxR3dMb2IySVBpWjJad1pRbXg3dTA3?=
 =?utf-8?B?WFNSYUhwWjNWRmZOc0FtemRZbzFHWjBmc2hmUThkdzNOREFubHpXRmdVcUZE?=
 =?utf-8?B?NS9BOHd0Nnp2ZmFKUWFjNHM5R3l5cE1zNlZubGtCQmJwVUJYRUNma0xIb3d6?=
 =?utf-8?B?K2luQS9KSHVzbG41eU50bFkzNFYzYyt4cDZNK1JwUWFaaUN4RzRBUmRHaEIv?=
 =?utf-8?B?QnRPK1VPQzJTd1UyVU81ZzlRdENjTWVIaU9YMkNuWElrVGdscEZmYXhwRGNs?=
 =?utf-8?B?NmdPNXE5UDVxdGcwWEUwQTRoUDMrZm1kN2UvSzU3VDMzSzF2eGZvV1prczQ3?=
 =?utf-8?B?SkFYb0ZPaGw1YngzVGJSa3ZGVTJlRWlXa1FXK3ZMZnpPdWZyN1VuSXF2VGs4?=
 =?utf-8?Q?Qjww=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmFqVkkrOEI0L1V0K2tTVXRlbGZ6eDlrNkx3REVqOVphYWQzNGkxd013akFZ?=
 =?utf-8?B?ZjF6bFJ6L0YwTE5GOGlGV21oVWZVcWhHdGhFZ2pTcjlNTy9rNE5VNmFzdHh5?=
 =?utf-8?B?N2FJTDlvMmJuUWpaQ3lZbzNQeVIxbUY2MVlueVZ3bDNKZXV1WGFRMEFsVHpI?=
 =?utf-8?B?SXFPbGp3OTBzS1lUdXZoMmtCbksvOFEwd3AxUkhWdmtsd2wyUTdGd1dkYU41?=
 =?utf-8?B?WDR0Q3MwbEdQeS9hV1FCOW8wVDBjYXZ1Ny9yM2owaTBrcENDWHUwRXdzL2lq?=
 =?utf-8?B?L0N4RmNsWWwrd1J5ZUxrTHRuaml5cnhVYTlmNWhNclRpYnY2WXBUaE5aNURD?=
 =?utf-8?B?NVFuSVlOcDZkRWxsaXB0TFM4aUZhU3ZTaEFNWlFpOWJTa1hwQmtVVCtXUTJG?=
 =?utf-8?B?RTllZlhQOE45WFNITGJ3Zm9oNjkvWkZpYWxOM3RpTG04bzJOUHc4OWZoVWlz?=
 =?utf-8?B?elRRN2hPYXQvbUcvc2FqK2dySHk0emZwWDNMQ0s0c3ZpNXRic1l2aGVYZ3A0?=
 =?utf-8?B?cDNCNm5nL1ZyZUp6WEYrUzRTRmNscWxNS0NINzRCeXVZbHY2SUFxdy9PZU1J?=
 =?utf-8?B?WmxWeVkzenNWMjRMMWhnemhHRWVYbVQ2d214endxOVhJTFdMeURDcGJ0ZWk3?=
 =?utf-8?B?WWF3MCtscWNLbUlmSUVyRDZTY1hKSUtvV1BtT3pvTzRiVGh5VHJnMHVwLzBt?=
 =?utf-8?B?OTBpSlZBZ01uOEcyN1hab0pDMURDYTk0U3RIUGxLanBudHR5blNDaVRXbG1a?=
 =?utf-8?B?ckVzVjdpUC93WmM2eFNoa2RIQ2hBbVJBK0k3b2NJaTFFdU1vUWdJTEt3S0tJ?=
 =?utf-8?B?THRVSEg3SisvVXNZSFd0ZHJCK2puS0RKYlRZaGh0cGkzSWlZREFUVTBySzhr?=
 =?utf-8?B?eFJwT2pHTjdVai9wcTNMYU85SFdUQ3dLYmI3MFZLRGlablB2Mk80VGdNRE4z?=
 =?utf-8?B?OWx6ZVZIcGNkS29HeDFhejNnQTVVTDYxR2QrS0FtRzk4Z0M5NEtobm1laWV1?=
 =?utf-8?B?emhhT1dMeHVxK3M2UGF1NzJyeHBTYlBiMVhSbTNHS082QzN1cVdDNFgrcU1N?=
 =?utf-8?B?Z3UwYXo3dVkyWUtEMVpyb0huZzVtZHBqakxGcFc1d3pOY0dIYThab0JEemxB?=
 =?utf-8?B?ZmxJK0pjc3Z5aUVoSno3cjZ2NkhQVVdoQXVHOVNocVpnT0MxZHc1aXR2a0R3?=
 =?utf-8?B?d05vN2JSTXhLWEFZSFNXcTJtR1BmN1ZGWk9PMG0xNFZzeCt2NkZpbFF3N1RU?=
 =?utf-8?B?dEFTc0NIQnZ5cko1Vmdma3AvdkRjNnVxQjlWdld4ZkM0MHFLSTZoV1d2MGgw?=
 =?utf-8?B?MDN1NUlYbytsRXpxNWE4T0t6Ky9CODNTdmhNU2l3ZzNNQlZmNUd6Zkw2Qm92?=
 =?utf-8?B?VEJZeENBTnBQcWxvRnNlOGhqQ2NWWUljc1pHMzg5WkRGMVRRVkplUGdBc1BK?=
 =?utf-8?B?MlFlWUNVanZQOVVXdEx6bVcyTFRmdHR1ekYzSkJkNUVZVUR3Tnh5d3dxSER5?=
 =?utf-8?B?U1pBd2plMHUzRGlDcFk2WmM5OWVsREM1ZW1ZS2ZpTnU2M2R3ZzFqc2hLYzAw?=
 =?utf-8?B?V1hkemM2SjYxRDNDVUI3dUcyVHJhcFh1N1hTTWx4RUs2QlF0RThIRjJRaEwr?=
 =?utf-8?B?Smw1NW5UUUMyWURZK3I1a0xZcGNuVlA3QlVTdmlMVm81MDNNakFTN1E2QXlV?=
 =?utf-8?B?MnlJbkRSUlIyazk0ZU1nbkphUllHVWhwQTlad0RFQkJVd2Y1bHQ2M0x2QTAx?=
 =?utf-8?B?Q2RxdUVIWmQxZ3pNU21uU3J2OVc2Qjh2VEkrZHo2bkVvVUttL0g3MUluMnNS?=
 =?utf-8?B?TWtpQWd0OW9nMW9vSkRuT1BlamtNem53S2NGcC9zRDJjRU41NCs5MU9HUkFH?=
 =?utf-8?B?UXhoUzBFOTBzeWNNc1dCVHVkYVFhREJTWTJGa1U2SmlEUHlBSjhDSk1kQzFX?=
 =?utf-8?B?LzduVWJNbU1nc2N4c2tGVWJOSWFuaVdyMnI3U0Z6UUZhcDdzeHQ4Mm1KaDNR?=
 =?utf-8?B?YmVOUisrcjRmaU5sMUVmYzUzZUdMMHlKc09UOHF2WWhsTGZiY1p5VmZOOC93?=
 =?utf-8?B?NkhkNE9COUd6RGpjekNjOVM0S0d6Qy9QNGVvaHVMd1YxTTNlZTlSaDZaZi9W?=
 =?utf-8?B?NVNETUEvaXdlY0ZyZFAyOC85ZVY0U2hGMmd1UWZCZk1qY2xYMUl0Z2lobVhu?=
 =?utf-8?B?YktYTnhqT3lucDJubHVtNnZIVEhYM3NuSU5MOUhHUmJBd2tNYm1YWC9UUGNr?=
 =?utf-8?B?Sm9QNnNiVkx4RXB0UTVIeEtJVVpRTE9yYmdjaW92dGdOWVNxNjFpK3NrNlpp?=
 =?utf-8?B?dE9ub28rQjE3LzlEWEYvMUljQzlQb2ZQT2NyN2dRZWFDaE1JVFhTMzRGLzJv?=
 =?utf-8?Q?fT4XtUH3/NVJwa197BT2f8l31YiA6Pn2jY5isvUcRYtpw?=
X-MS-Exchange-AntiSpam-MessageData-1: Zk7aJMllsviLTw==
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 656ef3d4-ec23-4c15-d36e-08de5a0a381b
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 23:01:47.1358 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G+brnQOS+knrfx+JoWUDztWCKhyfw+zXyd7tE7CVkGJbvwHBCxbgddA8qHHlz5b3Jrtx3tICbZGnO2SG9X4xaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6572
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
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,redhat.com,garyguo.net];
	FORGED_SENDER(0.00)[gary@garyguo.net,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:dakr@kernel.org,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:ojeda@kernel.org,m:simona@ffwll.ch,m:aliceryhl@google.com,m:shankari.ak0208@gmail.com,m:airlied@gmail.com,m:lina+kernel@asahilina.net,m:atharvd440@gmail.com,m:daniel.almeida@collabora.com,m:miguel.ojeda.sandonis@gmail.com,m:lyude@redhat.com,m:gary@garyguo.net,m:shankariak0208@gmail.com,m:lina@asahilina.net,m:miguelojedasandonis@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[garyguo.net:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.555];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,lists.freedesktop.org,ffwll.ch,google.com,gmail.com,asahilina.net,collabora.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,kernel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 6B9FE6E5D5
X-Rspamd-Action: no action

On Thu Jan 22, 2026 at 9:52 PM GMT, Miguel Ojeda wrote:
> On Thu, Jan 22, 2026 at 10:34=E2=80=AFPM <lyude@redhat.com> wrote:
>>
>> Just a random musing - it would actually be quite nice if we could have
>> some sort of automated style check for this. I have to assume the linux
>> kernel probably isn't the only project out there with its own prelude=E2=
=80=A6
>
> Yeah, that would be quite nice indeed -- we have discussed this a few
> times (most recently a couple weeks ago, including whether Klint could
> be used for that and for detecting "long import paths", i.e. when we
> have a re-export we prefer, but that has edge cases; as well as
> related bits like a `klint::moved` annotation -- Cc'ing Gary).

This is tracked in https://github.com/Rust-for-Linux/klint/issues/5.

Best,
Gary

>
> Cheers,
> Miguel

