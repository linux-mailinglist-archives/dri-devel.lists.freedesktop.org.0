Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFB9D3ABCB
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 15:26:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 344EB10E46F;
	Mon, 19 Jan 2026 14:26:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="zdJLdGeO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CWXP265CU008.outbound.protection.outlook.com
 (mail-ukwestazon11020083.outbound.protection.outlook.com [52.101.195.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB1D410E46F
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 14:26:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YwkMQB0+KZpKWcURHR0PrDWZidYivMz0KkjBx11+fysBZ2MCXV6JOr4lrAMgi/Loj4/Up9OXhzlGDXpvs4KhawWLdqAFmQ74hviaViTpLZZ4eZ8q5/sqKYhuwFseKF5a3MFE8TFBwK6ab/bioq+/x+pz3ylboHggmhzU6kWOcbZU/mLnuq/wYmNjePgdm0V0jqhPYMU+dK+W3FknF0bEAnZZ5KPLfKlO0hgotmg89j/jxk6bS+URSyqK8QIb7yZ+7CV2jiquGgKPNsZgffYsrRLnPruJUSPCFzUF7tR+0uP2IWvbz9uP/5yP8MkL/dCH5zFF8IkFMZXlGy9IP0olyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FRahEP+rSqooj8JLIZjuD2FHe904e7pHY/cRDSOMFEo=;
 b=iQqBjcsPUVZM+1RMY59hCKZLDyCXszJ/9DwJu9XvdHwVTAay+N9k6qHmI6gw2kAX26AvY9M7dyFV97R38fpmiUzKvSTbvBcB+sOxWy1mCjAkYwJIDmejLDgp1Pg8SgEYbqpJGgDjl1UfzWzB/MNqeiH6yBM/jo2+QpGGToK6odZ3TwcUc/ljdsO/E2p0dK9zziSdMoWFBP2dvq/GZQG6OoKqqc14JiMskhUru9m6voWeX1Ms4ORPGNK/dVRQ1SmvRUODPXGA5vhzVfBhj/LaVjla27RPXJWr86NsibfQDwR1vJhmkI/QyoHHkO/lryzJWbrj1WArotxQCuJBZc+Ilg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FRahEP+rSqooj8JLIZjuD2FHe904e7pHY/cRDSOMFEo=;
 b=zdJLdGeOlVpIYjpPkN+Lwjy/hCHKquKsen2BjM75E1aV34SkvRW7/y+wy7hLJgIzp+XK8sl3tLJ7/cW5NJ+PcJrUgAPHflYeiv9OaqAcDztm1PyX2eXjeYEmDsHDlCw4AEmZp0+nqSscmqAK4Jxt81j+PTHAO5khxM01CI2zRDg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO4P265MB6808.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:348::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Mon, 19 Jan
 2026 14:26:28 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 14:26:27 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Jan 2026 14:26:27 +0000
Message-Id: <DFSMW4IERCOT.1QCQ4CAY8KJFK@garyguo.net>
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
From: "Gary Guo" <gary@garyguo.net>
To: "Maxime Ripard" <mripard@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, "Viresh Kumar"
 <viresh.kumar@linaro.org>, "Danilo Krummrich" <dakr@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Drew Fustini" <fustini@kernel.org>, "Guo Ren"
 <guoren@kernel.org>, "Fu Wei" <wefu@redhat.com>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-riscv@lists.infradead.org>,
 <linux-pwm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260107-clk-type-state-v3-0-77d3e3ee59c2@collabora.com>
 <20260107-clk-type-state-v3-1-77d3e3ee59c2@collabora.com>
 <20260108-delectable-fennec-of-sunshine-ffca19@houat>
 <98CD0BF6-3350-40B9-B8A9-F569AE3E3220@collabora.com>
 <20260119-thundering-tested-robin-4be817@houat>
In-Reply-To: <20260119-thundering-tested-robin-4be817@houat>
X-ClientProxiedBy: LO4P123CA0441.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::14) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO4P265MB6808:EE_
X-MS-Office365-Filtering-Correlation-Id: 387a18f6-b65f-43b3-5417-08de5766bb95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZllXZEp2OG1SY1NHR045ZUxidjNsRi9tY1VCK1hQMVB5akZvSE9YcXZ1NW1K?=
 =?utf-8?B?cFJoRVkvMkpHWXBZMzQ3SW9uL1FBT20ya2ExWVNyc2Z1TWtBTDZ6bThLTGRN?=
 =?utf-8?B?ZE1heGMyamZQcURiTGkyTW9vdHRHNGRhbVltZlZkVXFMa3FLcW5JWitlV1Nx?=
 =?utf-8?B?b1dhU3hiYUJtNHdiM1NsUUZTZHdJZ3JheEJXd3ZyN01VbS95QWZ5M2t5TWZI?=
 =?utf-8?B?MWVLK3VBazZYWExXbDdmYjF3WUFlejdXZ0QwNm5iUzN3L1lkajRBeDU4MGQ5?=
 =?utf-8?B?cEFoUGdIVHJEa241UWRQVU1mdkxLLy9NVlFIVHJLa2x6YmtDK3FaVnovbXhZ?=
 =?utf-8?B?Zk9KTDVUeFNLa2JURTFONVg5cWZ1alZuZG5PUGFmWllhY1FYSndQZDJkK3hM?=
 =?utf-8?B?MjV6eGk0MGJaSHJQUnA4NVhRbGh4ZTlKa0syNUl5WXVmYTdLM0puTWJidlhp?=
 =?utf-8?B?N0pMQlNOSHFHY1R1N3FhOWpMQmgyakphM01xeU1ZZjBNMWt0UUI5UTJGV3dN?=
 =?utf-8?B?c3RYdDdOR1pRYzkySTlHZnl2Q2t6ckl0QVQxUDY2ZmxxL2lsQjF4by9EcDdU?=
 =?utf-8?B?WkdhelBUcU1UVFB6MzBWdVk2NGFaWjNxcGxNOWpMSTdBb05NNGEzd21LcHlr?=
 =?utf-8?B?QWw4aFpnNWNqT1BhTEx0ZEhzM1V4S3RCWjJ3aTNzdzQwcndoTzYvU0hKbzZy?=
 =?utf-8?B?WUdjczQyQ21Cb09GdENMQ1BvRFFzeFM1cGlmSE11UHMxZ1l6K3gwbDNwWERI?=
 =?utf-8?B?N1YrbWtzRHhQK0pUL0pZK1BhWHRNQThDZ25QNzk3MHRqYzVwZzhoaFRvQy93?=
 =?utf-8?B?RjQwV3pKN3psQ2IrMWJoTXlESklXMHEvY0NadFRVaUJHdytyWmZWRUFQa0dl?=
 =?utf-8?B?eWE3MGh1SkVieVBuY0UzL05xSGNtVGI1d2VvbFhLaHhiVU1RalVRYmFKTHlQ?=
 =?utf-8?B?ZGZuYUlTWmg3MDRZTit6MHRveWM2U1FvcDVqS3pJRFl0TVRGb0xLK3krRkdm?=
 =?utf-8?B?dEc5QVRRczE5WmRkaEg1Wlp4QzZUZTQ4cTJ5OGFlYUo5bTlsOFVldEtMYUti?=
 =?utf-8?B?bkh1cmZ0c1h5RllZMDFqNGVoblZkZE8wUVh5alpGRERpQUtzanJKcWpFTUYw?=
 =?utf-8?B?cXZhdExqVzcvaXlSRU5WOUlXVGVDVDFrOHFtOFQ0NmRqa0s5OFg2RmZ2M0xL?=
 =?utf-8?B?S3VUM05BcHI1WDFOMHNLYnN2RzNGSWpYVnpRb3MxbWZDNkxjUVlnUkJrUm81?=
 =?utf-8?B?NFVJT0Jld21zUzk1UytPVEZqT1BmZFhxTkd2UndlMVpOUlJ0SlBBc3B3aXov?=
 =?utf-8?B?RGdUOVU0N0VoN2IzRExKY3E2QVB3RXUxSStScDFLRjRLYUY4RDh6UDkxQWdo?=
 =?utf-8?B?OFI3T3RxeXZDdFM5VVBNSngvZXdOQlhPcmxtRzZZbnUzVjRlNGxvWkMrS3lH?=
 =?utf-8?B?SVlZN1o4OGxlKzM5NC84MEV2WkZkdDM1TUFqL3FMY09LZGtxa09RMW9ScDFK?=
 =?utf-8?B?ZWZQbWc5Y1JkSXpvTG04cklseFp4VGhiWWJ1QlBlbXpnU1FyUTdWYjJ0czhu?=
 =?utf-8?B?Ly94N2c4SkVLTGFNSFp0SWtxeHB2b0lIaVpXRlh2c2t1ZGpOVzg5NkNSekRE?=
 =?utf-8?B?YUhITVp0NjM1ZkJ5WnNYSGdPWklTVm1qOGJQT0dNLzI5VTluSCtjVmZubVIx?=
 =?utf-8?B?bHdCS2RFWmlhZ05BR1lBYkZVZmczZmFHeUFWaHEzTzkyMTlNdFlJOExZQ2hF?=
 =?utf-8?B?S1dTUlBlalkwaXRQcWpKTCtiL1I5cHJRdElrSFlwdnlWOUgzOFJNdm9EeTNv?=
 =?utf-8?B?N0ltekFSWUJ1RjFSYmxZaXNMVGdJYm1WcWR2bGFmWHpxOC8xelhIVzB6aExS?=
 =?utf-8?B?NklTN2djVExCSStMRWNka2pqZ1ZEbjZCcEF1a0hlYzkyZFphSy9ZR0pqNyta?=
 =?utf-8?B?ODEwOUVuYmhjWWhGL3JDRkxUTm5LdnRjWlkvWng4UnBsemxpRlhYVmw3NXJ4?=
 =?utf-8?B?WE1IakpLNGp6Z29zOFg4VEFBVXdlQXhZOS9RaDZRNjBZdi82ck1reXVjYmNj?=
 =?utf-8?B?WVdpYnFxRWdUME9DYm80SnJoNzhZTEU4Z2t5Tkoxa0dNNml4dHF6MjZHdnhP?=
 =?utf-8?Q?KpH0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXN5bXpYam0vbjdabmdKbUpZYkFoQmV0Ym9oS1ZtUkIranp0VEJKdWZrRGl0?=
 =?utf-8?B?djR2OWRRQUZTVk5IUFgyRDlIM3V3UjZhYVRDcTRTcEEyOUlJaVBSREhwc0ZP?=
 =?utf-8?B?alpDYmUvQU1pekVQbGVZYUk2emlLNXE0dUV5M3NhUmI4VjMybnVJSUY0NDQ0?=
 =?utf-8?B?TlFnZUh6RzZZS2g1TnFxcEVVRjJBb2VYazhNeGg4ODRCU3ArRzg5TTM5SHln?=
 =?utf-8?B?TXpKRkdEV0ZhQXRNYWY2c2NWcnNuOHA5SjBoQXNldjhaRGpuZkZVbjhLc1hm?=
 =?utf-8?B?anpoRHJ2ZmJOeGxWVCtaYnFkd09SN0s3K1R2REthOFV2aWNONU5uMEh6ci91?=
 =?utf-8?B?dHFnL05QZWpOa3RTSGcrNGNWeTVWYVcybDBEckVpTXEwYjJxZUpqZnhjMWU1?=
 =?utf-8?B?Z0JSSXFvQUlyS0h0anNoc1RQZWxjeE1LVjR2MlE5ZUo4ZklOQTZrb3ViLzB0?=
 =?utf-8?B?Zm1NMnI3WmFsNnVGSndLOEhYcUE0cEJRczJnOXIxMjQ2bVVJQ0NtMm5PMWN0?=
 =?utf-8?B?UXVvOWkwV3c1cHU0Z0FYRzNzSnI4bHpmb1NFZXFUWk5VU1RBbDR3dVNoYUEv?=
 =?utf-8?B?NDUwb2s5K25oR001Mi9WYUp6SjFBSmpibC9CN1JiT0hsNm5Wb0hsQWNHUnhK?=
 =?utf-8?B?c2VBYmNuM0RjZ3EyNWZCRDc3TUFSNXBHa0Z6RjQzRTRLQXVvdGdaYzBZOUxl?=
 =?utf-8?B?NTY3K1NRbUZQZm80QW83RkZUdm85a09VR0NOTUZjY2dTOUhiM3VQZGVQK2pO?=
 =?utf-8?B?VTVZY0lQdVBDYzNHejdNMVdMNExzeEJkNjdraHJTTHRSK1dVRG9xTkw3THJo?=
 =?utf-8?B?aGpVTHBESnFNV244VVlEbWtrSjN6UStvVGZ1aFFrWWV4OTdySE5WZEdRZzNU?=
 =?utf-8?B?ZFljbEVhclhRMjJyWWNSOVVIcFBHV2ltZnorQk1sQ2c0bVdxeFdCNk1td1R6?=
 =?utf-8?B?eG91SkxnekliVjN2NHY5bE40NG92YTkzU2VROEQ5RjN5aFhnZjNHK1VlRlk2?=
 =?utf-8?B?Qk5WQzREUWhEclgrVDlLUGNjdUpjbmxBemtBbWRxVUwrM2YwVVRQZTh6SGtr?=
 =?utf-8?B?N1h1OUpxZCtkNDNNRkp3aEdydnpJNmhDaGlSbUwrYXZOVjVFQlRNZVdaY0Q5?=
 =?utf-8?B?NG9JWldTQVJQK0RlVTd1a1NoMWpQTC82K0RBK3BPWVRxTGU3NCtyVUkrK1Fw?=
 =?utf-8?B?eVQzMWZlVGZNWXFuNjNEdmZZQ25rNis0SGdlbDBIMmxDY1pyNDJMSFBvSUdt?=
 =?utf-8?B?eDc1Z05aZmtCeXNBYU1RYitKVjZrOWs0SnFTRGZEUnRvVW0ycExzUUlKV1Zy?=
 =?utf-8?B?YWFvelNoOWx4d3hGQWdGeXR4L25DV1RRNjdRSllsQWt6cWxBT1JnYVhVYjRj?=
 =?utf-8?B?TFprR1kzYW15U3hnSldyVWhDbS8rWC9lUjJ1NUMza1U5dVhCdlc0WlpNU2lU?=
 =?utf-8?B?b0U4eTJNR3FFYm4vc0FTUVRwNEdPU2hFclBUMitPZHhpMTNJUys5SlBjclEy?=
 =?utf-8?B?c3dGQzBMNm8vWjA0MDhIclg4a2NGZzRJYXF1eUxPUXFBR0JZTS83dlBaK1Vw?=
 =?utf-8?B?L0Rjb00wLy8vR0Mzb0VPT2hKWnpZNjdlL0I4emoyZjY3TmZROGNjYnArcXNm?=
 =?utf-8?B?OHhRaUtLdHo0VGMxVVc5N0puWjE1S1hnZlUySE1xeHZZQ0JYTUxmb2R4MTFq?=
 =?utf-8?B?ZWx5cUxJSUgyclJPZ25Ca0ppK25hbkNUajJac1RWSFRrdUtkajA2akxUQ1Vk?=
 =?utf-8?B?Yyt1RWQrVHM5UkdJT05zUDM0ZldReW1KL1htQTlKbnpsRGZVQ1dNQU1EYndG?=
 =?utf-8?B?RG5lcVJ5bDRuM0hQTXlaSFE0ZHNxM3ZyUTJ2VEJXaWhnV0dIVzFyOFlCVWRM?=
 =?utf-8?B?RVp0bkppbFZBMVpTcmxnUVc3YXMxUXFvdzFuWUtHa090UG55K0hmMktrWW5y?=
 =?utf-8?B?U0FweVVOWllFTm9JRnNncHFtdjRZcDNjYUVXYXYySk4zb2s5TGRocUU1YVVV?=
 =?utf-8?B?T0IyeCtOQ0E0cWFVUTNsSGNwcklaRjMwejB4dzRxKzNIaExHL3owR3h6U2ZU?=
 =?utf-8?B?MjlDRlN4U2lCQ01NbkZLUzNrRks5OEpadHhwdUd2M1kwZm9jUTlaYlNFRWNJ?=
 =?utf-8?B?WFJQVDA2MDNEQm9MZktHN0RNbTEvczNucWxndE1kM281NWFwODVlZnY5S1hN?=
 =?utf-8?B?eTg0OFZITFFEQlRiY1d0V0NNNWFsR3lhK2xzQmdUdnU5M09abVdqUlRqMFJx?=
 =?utf-8?B?ZkJxdG9oSzdvSXBYbWcrSnBmQ0I4RW8rbUdRb3l4R3lYcEdGVDBKNTNJVTNq?=
 =?utf-8?B?N29MTkdGMW9jVHlMRzd5VlJQbEZNQ1VmS0JZQ2NubTNMSDQ3TkFTdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 387a18f6-b65f-43b3-5417-08de5766bb95
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 14:26:27.9220 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xGEMG41GEDy8gdJN2hFXOkYlsn1ore8lqW/gTsFMWIvAowczSld+iXw1i2tl3O0y5qgcKgYGE2yvUJkPhWXaxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6808
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

On Mon Jan 19, 2026 at 10:45 AM GMT, Maxime Ripard wrote:
> On Thu, Jan 08, 2026 at 11:14:37AM -0300, Daniel Almeida wrote:
>> Hi Maxime :)
>>=20
>> >=20
>> > I don't know the typestate pattern that well, but I wonder if we don't
>> > paint ourselves into a corner by introducing it.
>> >=20
>> > While it's pretty common to get your clock from the get go into a stat=
e,
>> > and then don't modify it (like what devm_clk_get_enabled provides for
>> > example), and the typestate pattern indeed works great for those, we
>>=20
>> Minor correction, devm_clk_get_enabled is not handled by the typestate
>> pattern. The next patch does include this function for convenience, but
>> you get a Result<()>. The typestate pattern is used when you want more
>> control.
>>
>> > also have a significant number of drivers that will have a finer-grain=
ed
>> > control over the clock enablement for PM.
>> >=20
>> > For example, it's quite typical to have (at least) one clock for the b=
us
>> > interface that drives the register, and one that drives the main
>> > component logic. The former needs to be enabled only when you're
>> > accessing the registers (and can be abstracted with
>> > regmap_mmio_attach_clk for example), and the latter needs to be enable=
d
>> > only when the device actually starts operating.
>> >=20
>> > You have a similar thing for the prepare vs enable thing. The differen=
ce
>> > between the two is that enable can be called into atomic context but
>> > prepare can't.
>> >=20
>> > So for drivers that would care about this, you would create your devic=
e
>> > with an unprepared clock, and then at various times during the driver
>> > lifetime, you would mutate that state.
>> >=20
>> > AFAIU, encoding the state of the clock into the Clk type (and thus
>> > forcing the structure that holds it) prevents that mutation. If not, w=
e
>> > should make it clearer (by expanding the doc maybe?) how such a patter=
n
>> > can be supported.
>> >=20
>> > Maxime
>>=20
>> IIUC, your main point seems to be about mutating the state at runtime? T=
his is
>> possible with this code. You can just have an enum, for example:
>>=20
>> enum MyClocks {
>> 	Unprepared(Clk<Unprepared>),
>>         Prepared(Clk<Prepared>),
>> 	Enabled(Clk<Enabled>),=20
>> }
>>=20
>> In fact, I specifically wanted to ensure that this was possible when wri=
ting
>> these patches, as it=E2=80=99s needed by drivers. If you want to, I can =
cover that in
>> the examples, no worries.
>
> Yes, that would be great. I do wonder though if it wouldn't make sense
> to turn it the other way around. It creates a fair share of boilerplate
> for a number of drivers. Can't we keep Clk the way it is as a
> lower-level type, and crate a ManagedClk (or whatever name you prefer)
> that drivers can use, and would be returned by higher-level helpers, if
> they so choose?
>
> That way, we do have the typestate API for whoever wants to, without
> creating too much boilerplate for everybody else.

One solution is to have a new typestate `Dynamic` which opts to track thing=
s
using variables.

struct Dynamic {
    enabled: bool,
    prepared: bool,
}

trait ClkState {
    // Change to methods
    fn disable_on_drop(&self) -> bool;
}

struct Clk<State> {
    ...
    // Keep an instance, which is zero-sized for everything except `Dynamic=
`
    state: State,
}

this way we can have runtime-checked state conversions.

Best,
Gary
