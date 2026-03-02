Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wEN1CTHwpWlLHwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 21:16:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBCB1DF388
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 21:16:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBC3910E375;
	Mon,  2 Mar 2026 20:16:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="p6w1Pmwd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010003.outbound.protection.outlook.com [52.101.85.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCD7210E375;
 Mon,  2 Mar 2026 20:16:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uhd0XHluzPHXtxMwsifBc2GGQoSpdaGloI/0DaBRHkg1cQQLnQWQoEgEzoPoYmFeeRc4sjL0RaEJEGMyqpX6tvPtsoSEam24nkis8dCAr2RXKYZPp9UPs11E/Qnt+vo95C+jXd9MSmoDUcqBOeyo1YNRva8LE9Ij4Juv+n3iiSrrNZvdEKnG9IMhgvN2FKGaKt+8D2qQTpehmV9k0CHitreMw27ftw1CN1Vk8n5TdKEKhqvq50FdHPAdjlNmuj7adzv94i/+M7e9MXdwl5MTnvOjBSLxmgm4LDKRaGnVehDo6QamtKTAvZPYyUHcPzMrQdc3WgEn+HPQnTfNQ9vU/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GgwzQgAj/81wVN9uci1oycp95Eaf3p2HRuZirMegals=;
 b=J7gY3kYBk9rHnu2kcrC1ILomfBPG40CoQA0WpLIrHx4Z1fRl/bHS+L61gqbksobTjyoyaRoodQK97xXi5jyxDvxl3C8EJgNHGaYdaXoWBQRkoj9XZY2Vo8R4KSictOfJJeEO2uCweIAMehLZ66Sp3WLKWXu4AZ+XPYmucAK1+Jx5J5+Kxp/l5AV/qS1vDjDnfBxKP7Q7cx4BIONKbA+iNNd7BamoN0CzIHs6lgUVMzDOEkgbrcE1g+Ey0PHKajFPw3tZ+LFxw7bIsSwwI83hjNgSEdwXdoOx01ATdpN0RTn/xYUxardCCAg8YPuw7OVclsOwV0IptJDt1/8G0+niHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GgwzQgAj/81wVN9uci1oycp95Eaf3p2HRuZirMegals=;
 b=p6w1PmwdX9+G7R++z0/9amJXNgO+nvU1J0+J3CgicrBkvoeVDKZ/eWje8eVbPnq6H6/ruruD7t4F/eSeozGycZAd5QCm7cZ8qYFmaIE/Q2b2ORkKgzXXXG317a0yYFoWYy4NdVPLqKAteIkxNRr88/CxH1Tu+eyY+Mnsw2jLQPpF4qnzqY7m3j2H6Cv0eNVgQqbm0l1l+OivIsCGt9Ylu98B6uwSTUf7perNzqHS/k8unBtdBoZfJxXVekjhiZ//1mGLlulbJQMfGf7GVPeIBQIMWZtZdtB37X1zGY/inLp5Q2Vx4IpKsFIrlM5kY92VMtgaZHBXBaYX8tj//QQeIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 CH3PR12MB9454.namprd12.prod.outlook.com (2603:10b6:610:1c7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 20:16:36 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9654.015; Mon, 2 Mar 2026
 20:16:36 +0000
Message-ID: <26f0ae85-6284-4175-9f6b-812db91237bb@nvidia.com>
Date: Mon, 2 Mar 2026 15:16:34 -0500
User-Agent: Mozilla Thunderbird
From: Joel Fernandes <joelagnelf@nvidia.com>
Subject: Re: [PATCH v11 4/4] rust: gpu: Add GPU buddy allocator bindings
To: Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Dave Airlie <airlied@redhat.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Alexandre Courbot <acourbot@nvidia.com>, joel@joelfernandes.org
References: <20260224224005.3232841-1-joelagnelf@nvidia.com>
 <20260224224005.3232841-5-joelagnelf@nvidia.com>
 <DGPQDMR88BBG.2RO77IS0XQ0HF@kernel.org>
Content-Language: en-US
In-Reply-To: <DGPQDMR88BBG.2RO77IS0XQ0HF@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR06CA0029.namprd06.prod.outlook.com
 (2603:10b6:208:23d::34) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|CH3PR12MB9454:EE_
X-MS-Office365-Filtering-Correlation-Id: b9b35156-3211-4cb4-2950-08de78989b00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 2VN07RUWEhbRVLsY6OGJnJV0lkeEs39eZhuPSbJQCRJiUAE0QJZgHAny3d0CglajZFZfz0lh0FH4/pLlqEFGF87NpcI1fC9DdDixULip4fDlScw/1b4ej+OgNx2kA5JIyBK/3dHHCPyUkcPj4yT0bSsI9czlWIlfBb2oewbqLDRAtIwHYt1ibmMOHjsZa5SskYTjYUClp8GQkV31hUrS4jDB8NIDrC6JKPhMCc54fnm5smZvOFAKJPNbzrcEvDyVHusrK2st1FS6WcgLbWX+zFPEXyfslceMV1Mq+GP6kDGC+26H/F5Sum0aKBY9WVlBntWACKDwS2TNtl+p1QYAvdRrobIhBDusnjiB32MFLeBjXLVy0ReeNmvPpVpM42AU0Xn8JZx5Hz1wcoCPcBmzsssLi9iQgO2Jsj883CYNUno8J/Cb0atnhynrtCcOenNT2xoHN+hOqMGIwSYYXXWyA0yIIRlGsY0KnX6dnYInrpI7jV51fOyb+RLRdZQNVDjzlqzF6H5jHgNwQ0BaO6Pl3FalSGzbuFmi8CvHvIA8c64n5A/dILIKVAXBUuGa2wqO1Sb5hsy98WnNNwQwaXL4BY45nruO3tplL88P6MCDyFcO908MFHcSnNIM5lWXhNpGR66RRSI/6g10nDk/fgIzxq3gzPwZXF0QC4PQoMzD2fSMMLTkfnpR+GeXR0pnpCZFrerBRq4h1wjAcqaqd2b++A54ujWT4kJV4YibKvSKZ/I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2pwczFENzB5dnRoZytDNGVuUnFMZUtNSE9qbUVmVFZJNkNpRkdCVmV4RHVx?=
 =?utf-8?B?cGtGR1F6RWZjWENvV2UzdXZkWEFpQWR2MlVQbWlrdDJ6d21XcGMrNXVCNDVH?=
 =?utf-8?B?bkN6eWdYaFN4RzI2bWxkNzBBWUluNDRmQ29RT25KK1NTQnVYaVQvU0Q4RWpT?=
 =?utf-8?B?MDBwMlN2Vy9NcWxORnFJcGhVc2UxZk1iSEpvNTRKTFp6Z2dRNUdIM0laZUtO?=
 =?utf-8?B?dGl6ak4wQ2E2cGR0eFhrNnIyZEsyMUFxRGhlUEJrN2UyY0JPOUpsdWFISnRD?=
 =?utf-8?B?bk1JclRkZXV3dFhBZnJ5Ry94c2FxWXNXT3NpSmcwYi9SMW1UU0ZoUUc5SWhW?=
 =?utf-8?B?NTU3WVMvZGVWamVseWtOWnVVRWYydzZJZitDNnhEdGUwbi93d2N1YjF1Wm4r?=
 =?utf-8?B?YzMwNzBabFhsRDB4b3c2b0ZqYUYzNGp0TThkM0FWczFDcE5EMEFwbWttYlBs?=
 =?utf-8?B?MXpTLzVrZEpXR211Nmx1b3ZpRC9OQmJrUW9OTzhRY0R5UHBtZ1JJQ1FYbVZs?=
 =?utf-8?B?SXBvUnlpbnl2R1AxdzQ1L1N0VzJoR3hWTDVIRlNrRzZNSVd2YkhKWEswR1pi?=
 =?utf-8?B?bjBKM0kzQ3B1MWVNcDYrOTlLbG52RUV4TFhJVnhWcjlNZGRDVXpJY2dtTW50?=
 =?utf-8?B?QmxuU2FvOUJjVDg3aVZkQTJ6K0loT3ZoTjliRVcwOTZVb2JvaUozdG42NWRy?=
 =?utf-8?B?eUcrb204RFhaZzhnVkpXVjh4U0F3OXhiSk10WWxLbTVIQmY4S1BtZUcyTmxz?=
 =?utf-8?B?VTIvbXhCQnVSelpVWDAyVUV5eFBoWEpDSTc0QkplRWhkZUFhSEJYQkFqWVdr?=
 =?utf-8?B?dHl6OVdDaysxR3A4SVljc0tHWXRSMkdSbHhsVW4wbDBEUjJGNkt3MUVidUUw?=
 =?utf-8?B?RWx3SGV3dWw3OHFkNjNtL0JNWitEVzdMSFdFdTJiU0ZISUZobnZpYmNBY1Bn?=
 =?utf-8?B?ZXprVUJCQXY5Z1N2OUlqSXFVcjYzNEVISU1hd0ZnV050UEFJakRTWjA0TUR5?=
 =?utf-8?B?aHc1Vkc5cXFsbVhmcXFWY0tsVzRLTXhYN3RXNTBaQVVBWWpDbU1JVmk0cnJz?=
 =?utf-8?B?amhQY0w2VXZ4NHVlc0pjSlU1VHBXZ2RMaWZPSFd1VWhUYWI1NE85VW90RDhR?=
 =?utf-8?B?NFpvZU1DUCtjMC8wclRZTUJPczN5UWl5RGw1eFJZcENIQnFlQTFRN05JVUg4?=
 =?utf-8?B?a0h3cTdhUWdGeTg4eTFPK3NTVzBvcTVtOEdReVd2bXNsRW83WjV6MHlnR2ZH?=
 =?utf-8?B?ekx5YkZJNWRXWnJheFZndDNvRVlGdXlHT2M1L3YwT3Q2bFh4Mi9iWHBNektN?=
 =?utf-8?B?SXNxelhrZ0NtWFozYUxJYWNaY1h4enRzZ01UaEMrSkk4cWFTVUM2Q0w2QVly?=
 =?utf-8?B?WDF6cWNMdHdqbXRaOTFONGZhZUxoSitxdE5xS3FGYlNZUkFxeWlta2ttN2Zx?=
 =?utf-8?B?eitlZVVEbUNWdmRLY21NUmRObmVFK1VWeU43SyszR2FwQmxlUUMrNzc3MGN5?=
 =?utf-8?B?WlcvZzVyd3BPWi9SQ2pyQ1VyNG1XSDhqbDNEWktXK0xudWRWOFZKL1NzbG5S?=
 =?utf-8?B?ZmhaaVNMUWk2bW5rSFZCTEMyZVdHaGZqSTd1d3oxdGw1dmVtaldpU2xpNEQ5?=
 =?utf-8?B?YVZTYVhYb3JKa2lyVEVBWnNTRzdNSUFwZjdIQ1BDWnVVaEF4QXM5UEtRYUF6?=
 =?utf-8?B?K3M4T25xY2I2WEN2MkFMZU9uRTNjRTdQMnhndWZqU0lyZHpsSzc0Q213YUM2?=
 =?utf-8?B?dEV6cFJzVDA2Y3NrV0hWd244azBjM2o2Yll4U1RaYTRNUi9XOHZPWi9vOFha?=
 =?utf-8?B?bkg1UlVEckNaTlJnc0RGM0dwODgycUVmZFlTL0lyeHFlZnliRS9oWWJHS2Rt?=
 =?utf-8?B?M1NtOE5sckVxSmNXdGUvSDBNcm5FWlhsY2I2QjFsbFdXd3h2QU1MRWVWenph?=
 =?utf-8?B?RU1DQkxUblM1bW9CVDdkVlEzYmV6MkIyOTJ6WHduQ2VlTU8yLzRXNXZSYjdL?=
 =?utf-8?B?d2pEeWFWb3o3TVV1dXNJWW50S1JoSGUycHpGL1lKSDRsaVhpamZTbWtWZ2FQ?=
 =?utf-8?B?K09HbWtGRmR3c1FGRWcrODFzc0ExOXRuY1V4YnRyaVVpWG1Da0xJVHNwZFZU?=
 =?utf-8?B?dnlhSzIyaFdPRk9UZzJrbjNlNytRbisrREFGSlZPM2xXa3E4by9ndlllRmph?=
 =?utf-8?B?WkpVR0FtUUpXOVRBVFZHTzNJbFRLNTJxQjhwQTdRNE1Vd3FqTDNpNzdhZC9h?=
 =?utf-8?B?VUdjMk5vNVd5bEtUSDBiNk1SbzRSY0t4b0M0V3E4UitTWjh3MmxwaHhQUkZ2?=
 =?utf-8?B?Y0pnQ0h1eDdQMnpDajVKc252clQ5L25BQUZSek9BTnRkc2Mvd0JLQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9b35156-3211-4cb4-2950-08de78989b00
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 20:16:36.6658 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wQcvCShf+CWmqjsmZ8VBwaV00P0tS90rho8heHFzZ6fZ9MrZ9d6J7diuZYe5rjaep2xJoV99vcv4M1nauQri4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9454
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
X-Rspamd-Queue-Id: 6DBCB1DF388
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,Nvidia.com:dkim];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+]
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 01:08:21PM +0100, Danilo Krummrich wrote:
> > +#[cfg(CONFIG_GPU_BUDDY)]
>
> Has to be #[cfg(CONFIG_GPU_BUDDY = "y")] for now.

Fixed, thanks.

--
Joel Fernandes

