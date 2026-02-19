Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4FaSLD4gl2kJvAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 15:37:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEC515F9DC
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 15:37:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D76710E194;
	Thu, 19 Feb 2026 14:37:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="fLtRFDlA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CWXP265CU009.outbound.protection.outlook.com
 (mail-ukwestazon11021122.outbound.protection.outlook.com [52.101.100.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 060C510E194;
 Thu, 19 Feb 2026 14:37:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wZtf3vbpBvrpqAVk3p3I8wn6vHyE01o53KMyoNbed7bsA/+S98o/SvFLI59AHG9VxKkAzv72swXSbjz2qddi6puSWNhAIlwjHd0VsIeTAND5u/+Gixk3NTVD7k3qnF2nhqsYKZ4VissjcsKOPaZDuW2wlSY7Xf6MTjlOROj0FmitWUpSUSjS5/epvUZragSc7NT3jf2vuKIpVJaGgqDTfO+ZyndLhHRBk7m4RqKMueUrljGydGW92tC7VceCqKceRPlZBvRk8xkBLHpRl3SrDSyKzxk+VxJZb065uawzm+WOYMxgDLgH7KtRj1RBjjg2RPiedE5sOr517nEUfBEcoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GygnEi3KRfS9oXoP1dN/v0KtuUjYfLsXiovbMQltHww=;
 b=B7Chrm9WjWCx9FmWUAwZRw8PNnxhVz/0EeLzWRA8yIPSj3zq+j6h2Yx1NjJNnEW8LH1GK5jSwLXez5JdI6Qq46h/nw+WuP8GsdYyvGOmcdT1wTZ8le9uCZ0+zX+8OtLpXFRvThntsVKAdPys4nhknSqUrNmN4E6WgZ2h4lwkBzQK6ukewTyOF7rmKlBhFhVFAe9GgZNu2I8k4/zOTZm1dbpeBATCnT1aH4/1sDOFZqKmr0f//lGH3tYmgZB5OOhpOCq3WQQ0ZfkXCvUK+e5aMlvs7TIWNwsh0kZZpZ2y4b5Z2uUJrSWE2RXHq2xiJZyQc/QMW20lqAwjv2GLrMjaOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GygnEi3KRfS9oXoP1dN/v0KtuUjYfLsXiovbMQltHww=;
 b=fLtRFDlAGNYyLqylcO7USP+bQap6/YG551H9GeOBb7/GfVC5ugborq1XY9xO2B7c2zpSHSAyC8iQeAtdnV/UM7a08SFtjlo17D+/mqz+4rwnBLj7WFwzv6OUJAPoPslxvCTFLhT5JS7yaNwolYz+tH3MlbpJXLfVW3pX3p0iYYk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO4P265MB6795.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2f9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 14:37:43 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 14:37:43 +0000
Date: Thu, 19 Feb 2026 14:37:42 +0000
From: Gary Guo <gary@garyguo.net>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin
 <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Alexandre Courbot
 <acourbot@nvidia.com>, Dave Airlie <airlied@redhat.com>, Daniel Almeida
 <daniel.almeida@collabora.com>, Koen Koning <koen.koning@linux.intel.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, Nikola Djukic <ndjukic@nvidia.com>
Subject: Re: [PATCH v10 5/8] rust: clist: Add support to interface with C
 linked lists
In-Reply-To: <DGIWDQTR76Y5.34L9IHKU2SEKI@kernel.org>
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-6-joelagnelf@nvidia.com>
 <DGIWDQTR76Y5.34L9IHKU2SEKI@kernel.org>
Message-ID: <78442de05ecae22cb44765d60cb19988@garyguo.net>
X-Sender: gary@garyguo.net
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0287.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:38f::15) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO4P265MB6795:EE_
X-MS-Office365-Filtering-Correlation-Id: e13e1ea2-0569-4534-dd7a-08de6fc470c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fiUuQ30315GJUqPeGBMEavtciPsFpWJXDo57/cRGFRgnM+Lc5W8IgP6nTVtm?=
 =?us-ascii?Q?9kzB1mJ4YiuK2JuBI3GAIwNXI2HgFkNN+4h44o4ulK5fpGYQAPDtSUPb5f7k?=
 =?us-ascii?Q?7oo//DtKsKkpVDQdMfvogZfm2fFSpqrzt3j/EYMgg3aCO9GRTwfg9YzlFbep?=
 =?us-ascii?Q?mudNY+VmPOWXx7OCEDxzB7tcSAWQNRc0oMOc3AZpgWS99CU5kvPbq4w57PpV?=
 =?us-ascii?Q?b4MOMF/2Wf3Qc1sJgNlpdl60qhNASPifDK8h4P5ymobzeVo2KeAtwIm0aBAs?=
 =?us-ascii?Q?DRC7uQD82BdN3E6gtJJzqi9GYB4HA6XJfggb55v7+YwIm2351sGr0ae+OFOl?=
 =?us-ascii?Q?017bXNHg83MF0ts8ydDJm3SZ8CYHcRREd/fXgFGRv9zPv3Lyx52rROw9UkZ0?=
 =?us-ascii?Q?PqFe1/KQLwlajUY5qz8+VPSIZkb6Wx7Nm9AQxEHl6NlOcodIkrJULaQeFmKJ?=
 =?us-ascii?Q?dczEUAnf0/XrjiZLoHdTn+kEyfOCnca1mbExfNJYXprsuLUEL2YaTEMLn1Pm?=
 =?us-ascii?Q?ds2TeJx+MST4KN+NtF7tYwLktvUe+M2atAKBNx/laPvudfGB/nJN2z5Jm4t+?=
 =?us-ascii?Q?8Wu14bqsLZ8OuF2gtq2RhLBvzL82OKAU+szpr05pJhQvXrbSdlefx5Xe4rC/?=
 =?us-ascii?Q?RAFMYKZrYc5t208DXqg8SEGCw1+QKotpz76oFlEWMX9DS5PC0i3RXVQdHfvL?=
 =?us-ascii?Q?yNg6nYNsIW1wV4yQEIsoO1y10F8fmK8dnwx2dAm6MGPJwzppHlfUOv+IvWuN?=
 =?us-ascii?Q?R9nlETOBs7ct9l23l7C64Cf9s5CTyqeIbdoHqf9gl5c0/h64Am5TumBVHwrV?=
 =?us-ascii?Q?GF1OIG5OAGhfTZAaf3l6D2fEI6dmlHMFYgby42JcNgx2AsMlBKre05eL8r7m?=
 =?us-ascii?Q?hoJg5j/kUgHE4kBTVlZ6Wt+v2OTre8cxHGhlFlEPgRI9cfUN5iHixEqcA4Fq?=
 =?us-ascii?Q?AS3m7fvS60/Kaw1A9flXHU5Ssa2jy8pCWGkZ9hYPsQJzkhcbUBDv//ihMSZs?=
 =?us-ascii?Q?BcDuNpf4Jae+f9zTiQGb70GDBLFctKYW+o7YElDdawNcodvzbJesdvXLz1d8?=
 =?us-ascii?Q?/kf/xeQVcEJkxVdcpUm925BPr6tHH516qWiLliw1zf/O87OmDGFnX1urL4cq?=
 =?us-ascii?Q?I1HmndxZtVEDYtKE9Arfz7eWSveCboLm29dKGvqn0ostgnOWi8b6YhTZWvh+?=
 =?us-ascii?Q?soA//9t/Hv0eE2o9t2K6LkE1a/HWZOUx2pn7Qy8NNwU6+qlsCAlgq0gJ11K4?=
 =?us-ascii?Q?164J0gdrywuVWD1l0PtXKvjw+GfeF9yT+o7AWjAnojqE8geOG+eab2aS507Q?=
 =?us-ascii?Q?xIJ6ibDXCthdI8oXSEXax/OzbcbJx7omNwAV8AcqnIsNo6JBKImyv7qD1GlR?=
 =?us-ascii?Q?zZsshh3qS4zRbzxaHuyiTKaK3ABeXmyiEMmSl9bpnHdLMGKH7W2aigTH6gpi?=
 =?us-ascii?Q?2zkk3tLfJFNRZgoDtXW+AG2JKNBx+gWEQVe6bnmQG7jCeqbLRCD9QDu9hM61?=
 =?us-ascii?Q?E86qnBWizAuXTvXtAiTdEkG7J9R1cA4waqPbRcrx+wYUm6OHKg/GdmnPtoQA?=
 =?us-ascii?Q?uAzAH3W6UCm62C3wlrE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ABb7KvkA5hTItLJNIN9KDNY9Yl5mAHj/+qAvyd7cN+dZ0x2cSqEw6kr6Jjrg?=
 =?us-ascii?Q?whE+8mzGQA0roTsTo0KIhxxyJ7JdH1epDuE/5ao48BWvM25tCKriCNrNstMB?=
 =?us-ascii?Q?x4Tr01iBq9XTeB1kFagd9r8uQuH22esVrzMO2KNwA0GbP22oai9nggIfUAGG?=
 =?us-ascii?Q?Axxz5iDvts/jLDrSlAmMPwDa+Kd7+b7S9bd0lP2gWvw6iTX/xlDEubGCznh+?=
 =?us-ascii?Q?zA71tc88Qf1hSrPrdxCc6K5GiBzp2K8urr0IR/SaHRcXcxqAiFzaWbW3r5qa?=
 =?us-ascii?Q?u7CdAKWmVs3hMo2xomiiiBzK/+LVhh9UUUfUszX3s1AYEA94vu3lBvpX7uri?=
 =?us-ascii?Q?WfG0B45iHd/rZgUyWfZSGPJEI59S5OCySNFrZco0Bpg5s1GIGn7a1iLJWvZ8?=
 =?us-ascii?Q?zFng0K4wlMyuPGbsqlFuP5FvDEFHv5xzbVCc34BfrBnznO0rUTTUbHCijpEk?=
 =?us-ascii?Q?kc6ZM5BC+KmupJjdsj04yfqDSn2lJp93U2zAgqmuVhZ4hIbCFM155EjWE05D?=
 =?us-ascii?Q?tC8MFVLKUw4g7jBN1v2H6A2iIXaXxsYZWOrLuIT+tx25hOczlONWQk2kpheN?=
 =?us-ascii?Q?PFXDm7pmsxzxVS4CHNgeStL4/vKqvIJKaxk8gL359imphMcLp21jwgXLiZtY?=
 =?us-ascii?Q?1vS31Ntt3Llqtg3uD9UMuDG3LikH6eTaOzEZhGJwN31DMogedgnkZlV/F0Lg?=
 =?us-ascii?Q?MY1fin7K7KCXRsnjsr6LDwQAr65YVVFhW7mt0mNlQkKe2vv6wMc2hf3WNIdD?=
 =?us-ascii?Q?caO5klpfDAuq+a15vdQOrENy64VqpiWetRrHL4uR/iI1olvwFiHHkYjIvDjI?=
 =?us-ascii?Q?GeiRSrZofv1mCnEyfRmIc2f0Ljufz0d+G2cimTqvUBarYCQFbu308jUBIW1B?=
 =?us-ascii?Q?mqfcbR6EqtuQ2HII9IRfHGw6gJ4HQi987BLodrEkyaSIh+BFtCVLzMESP7Bg?=
 =?us-ascii?Q?tdo5Cjoa+LT6EdVYs4HbNzYRfBD2m+vlXxRPTAdF9xhRSCqGSG2KGtqIF8BO?=
 =?us-ascii?Q?xU+LAzE0UCmS3E2f3s84Pdzbf79ZFvDgztGJlH1JySj8wpvJVCysARFKtcry?=
 =?us-ascii?Q?w21lfSpY9CreKDhduVmBIPQaJzHPyoU3dHFiLO8p8Ln5X2ZhLMWdDmzjIOEd?=
 =?us-ascii?Q?kpRx4y6As+bbvMEbxo4l/vINvKL7wXvTY6nqTsknVGH/pDW8AvKPD8XS9khO?=
 =?us-ascii?Q?vgR0F6Di4oEOc2Qy/jolf0vuDLUIRmhuFWEfKcJN2s22cDTH392vSyusUtg3?=
 =?us-ascii?Q?1f9ATkPKw6db3P4Jum8k2Sl35dp2FhrCzvzytuhP+/uoBAIEqJIrGa9x46vJ?=
 =?us-ascii?Q?bUO2lnsKoHuyLXvLaZc4kK4Ekdhxyay5BM10ssNWF8XSF1pxn0rmuy/dwExL?=
 =?us-ascii?Q?SjtkBaAzkuu0zWbens1CFAG0ArVRZZEUZ+IAHIVgvpCD4i20VnKNgiWXq8RC?=
 =?us-ascii?Q?lE0d1Z6Id7miuDF0Fh/o49I5OrVsaMeGxb95uFiUmVbwKCB7hqNSOnBrpLvY?=
 =?us-ascii?Q?Cz2tMo198kmb9fhshTfKD0FuukCTqXW/kZuMbaXAKgRRTDGYa7L+ROOBkO9I?=
 =?us-ascii?Q?Uo8TYxp/CoFmXnCTKzyKdLuow4bcqru35YZ4w1paqB4z7ogEMWjEm/PYiqZE?=
 =?us-ascii?Q?+wXZXDOs0gIurzSwZVJM9bq+ABHUchV0tlgzPnqmokXdgjz1b9NTsl2SkU4e?=
 =?us-ascii?Q?A0DNvLs+Abg4mt+CmxuImt2Z1q1ZZb6ZtpegZNzgIo/lnlGz82VG2iaCuhwv?=
 =?us-ascii?Q?KU8kCx4fJg=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: e13e1ea2-0569-4534-dd7a-08de6fc470c9
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 14:37:43.0465 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HfYe44vGRgPlYkM8q98r5JqhsD+07mCKieHrJO4JS6S9Ui5XYhTHxFJfc15QJ8yn6QaaBcSBEpJW3uJuV/AT5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6795
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[nvidia.com,vger.kernel.org,kernel.org,protonmail.com,google.com,umich.edu,redhat.com,collabora.com,linux.intel.com,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,garyguo.net:mid,garyguo.net:dkim]
X-Rspamd-Queue-Id: 0EEC515F9DC
X-Rspamd-Action: no action

On 2026-02-19 11:21, Danilo Krummrich wrote:
> 
> Examples don't necessarily need '//' at the end, as they are not 
> automatically
> formatted anyways.
> 
> (I hope that we will have a solution for import formatting before 
> rustfmt
> supports doc-comments. :)

There is format_code_in_doc_comments option in rustfmt, unfortunately 
it's unstable.

Best,
Gary
