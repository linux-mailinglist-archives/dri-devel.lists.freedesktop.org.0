Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0584CB5204A
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 20:35:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2302310E114;
	Wed, 10 Sep 2025 18:34:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=keysight.com header.i=@keysight.com header.b="MSAM+c55";
	dkim=pass (1024-bit key; unprotected) header.d=keysight.com header.i=@keysight.com header.b="UvQ3pWIc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-003cac01.pphosted.com (mx0a-003cac01.pphosted.com
 [205.220.161.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFE8A10E114
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 18:34:54 +0000 (UTC)
Received: from pps.filterd (m0187214.ppops.net [127.0.0.1])
 by mx0b-003cac01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ABk7Ga029729;
 Wed, 10 Sep 2025 11:34:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=ppfeb2020; bh=
 YEYpVie+/YCB8wmKsmRi3A74g1hhWkixVCeCbcFu+7Q=; b=MSAM+c557dESH9tu
 vKQJ6RxgTQ+rWoJR0KvZ4MMTMWTBLAmEY5dV+q9U9+ZazdlF+8FYG+eKvZb7+Vqz
 aNCihK6Y1MTrM5rrCkfXSEKIog/CTtOB2hRXAhCAluBcGdwIDlHWoCR55XypS8w2
 /C7j/Vr3Ysh8tXO7eIPXdi1kPUt3VEy5lvnjdDYoBzOyzB0yHgw6HfIuYDzZwlSL
 BTSPTg6nT+nrv/A3IhtwSx/V1u/TxwvNg0mwZyG7NQEv4Q/nFSiOFxp2gizGINQB
 bd3qIuYUaf8Z6a1dDT/pRtpeTRksS7fYXJQtWsvIZrwhImY8zx2PcR2p3ACcz3W7
 OfKYTg==
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2085.outbound.protection.outlook.com [40.107.237.85])
 by mx0b-003cac01.pphosted.com (PPS) with ESMTPS id 4938b48wf5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Sep 2025 11:34:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eBJ+YfsQXRm4d9L/jIB2UHgLju4jGrfcFJcw+NnBkMB8aNTVRVFChSRO+d1kd7o+u/Gx6oloH1qt0TJb2N4Op+N6MNdNWc5XGPtbL/FBTDrcvYEa0EBd+WYT6JfzBXsoOtNsOY2vtXPdNqIxDvE1C/WdrpOcQ0SfXZAA65JHNYkzoOD+h6bKykNg4KY9sGPl3yfAAc3D+s3d8AlDyaw8GurfimBED5AKjhksemm6mJ+h0j7piy9yaI8253X/wZtgnWEjTIjTSeqXo1Fy9eF8RqCzpXW99gEmACpOuuli5HMDl+WDCVzTvRJVQYD3UmHgeNfIHzZErdz+dPyTVZbyxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YEYpVie+/YCB8wmKsmRi3A74g1hhWkixVCeCbcFu+7Q=;
 b=J8H2j3WnnqbPe/SoG8N5T2axd0+nsfgqiqRPl4ob/CPDXNSaZ6Mvs7AfE4jruABARR66BoGY1F2WDD0sQrSID5TZy6Ikj2KzpA/vwBaKS01Fvut4uf25CLi/AILNwvnAMl3saQp+kXNLcPiKBGD/uG9XnfynzDxLdQiZbmEyxF0qmYN/ED0uFaiRkcFYLzze/KLlJvMTDAzuJ176JXNLl8VbEHhV9mYZMQnctbQrUeA8ww5S/clHK9fZs3fhB8zx3jngWTXidLF/8tt+UY17bOsBgMDSnDXRriVL7ZidvsegI+b7gMP5U7D4nBQZwQ6FjGZhy9UfeovTtfwaAiTduw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=keysight.com; dmarc=pass action=none header.from=keysight.com;
 dkim=pass header.d=keysight.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YEYpVie+/YCB8wmKsmRi3A74g1hhWkixVCeCbcFu+7Q=;
 b=UvQ3pWIcjby3Y/QsEjQtTUd11sWBXq4bOnxMcgE90k69M+Mdt+LD2gRtNsSCni+uJH18ylmAXzw1GrhnbXTOY3eIT8dFuZyzBN0KNlXNd/8ppmsPNkXOY4I5USWRUvy3wjDblj3P4+JIrWJti/q3Ew5fxhuBp/bXIa5OYtrmgL8=
Received: from DS0PR17MB6128.namprd17.prod.outlook.com (2603:10b6:8:c3::20) by
 PH0PR17MB4878.namprd17.prod.outlook.com (2603:10b6:510:8c::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.22; Wed, 10 Sep 2025 18:34:34 +0000
Received: from DS0PR17MB6128.namprd17.prod.outlook.com
 ([fe80::e5ad:766b:1f5d:e7a9]) by DS0PR17MB6128.namprd17.prod.outlook.com
 ([fe80::e5ad:766b:1f5d:e7a9%6]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 18:34:33 +0000
From: John Ripple <john.ripple@keysight.com>
To: john.ripple@keysight.com
Cc: Laurent.pinchart@ideasonboard.com, airlied@gmail.com,
 andrzej.hajda@intel.com, blake.vermeer@keysight.com,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 jernej.skrabec@gmail.com, jonas@kwiboo.se,
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 matt_laubhan@keysight.com, mripard@kernel.org,
 neil.armstrong@linaro.org, rfoss@kernel.org, simona@ffwll.ch,
 tzimmermann@suse.de
Subject: [PATCH V3] drm/bridge: ti-sn65dsi86: Add support for DisplayPort mode
 with HPD
Date: Wed, 10 Sep 2025 12:33:52 -0600
Message-ID: <20250910183353.2045339-1-john.ripple@keysight.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250908203627.3750794-1-john.ripple@keysight.com>
References: <20250908203627.3750794-1-john.ripple@keysight.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CYXPR02CA0096.namprd02.prod.outlook.com
 (2603:10b6:930:ce::7) To DS0PR17MB6128.namprd17.prod.outlook.com
 (2603:10b6:8:c3::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR17MB6128:EE_|PH0PR17MB4878:EE_
X-MS-Office365-Filtering-Correlation-Id: 33a0c718-490b-4868-cc57-08ddf098afef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?l987TwR5LhuQuGtNZLYlQRnrgR740sX95B/jwq37Dlx9juxZ2mCk2FcmcmkN?=
 =?us-ascii?Q?HSWOV363Q84/jOkJIzfATE4XPOIKl8biYXxi+ZmPzjCMJ+hgEHIWuPCxkdU9?=
 =?us-ascii?Q?lPyxAJzZMyL9uT29l5n9bkXFMEQRCPg0XDkwGxVQJh1djzedwR2mRc6X2US2?=
 =?us-ascii?Q?lm+3RXyp49MOj6xMSNnYTZC7UB/gICnSa8B0qjIfFzFGJWpo4KY9IdjbrXW+?=
 =?us-ascii?Q?pQQ/egZTedG84DYvJfzLyVmeOe8aZGaBTcioljk5KvSwPHAs/hepSx4ADSJC?=
 =?us-ascii?Q?PRduer67PSAUfAJ2hyLVc9sQTO75ds9yaR12s/TsXGIaX9U9pz0cwyYVwTX3?=
 =?us-ascii?Q?bAuMhU3lrTPJb1E3G0yBvR14r9D1Lp9MM6xZFRcquCwoyl0fzGR0fFmGs3SA?=
 =?us-ascii?Q?iaBxQYOkAAeY8FRsWNg29YsW7DLWjrMBZOJy0Sg/mIRvrFxKtnVPSdLoeAa6?=
 =?us-ascii?Q?V6AGjv2UFhcA4sDvtadp0hXhuBSrhyaxTD957RQ2fLjNFi/qVJ08gl3QwtFO?=
 =?us-ascii?Q?cE86uN3l5+y8ulNMDL5Mfjy1pjHGxGM/EmXuztsEZ8Eb0HgB+K7fDpPL/H3m?=
 =?us-ascii?Q?64IwkC75y8WQhd48op2nXEI04ph/O8hmLImKDy5QaylIm8Tlzf0P0xYZP37x?=
 =?us-ascii?Q?LvBiT9xAvMizHw/0tGwvSk4Y9nMW3i6ib8uImB6FZPni+yKmgXYxZhDPmBIf?=
 =?us-ascii?Q?qOhhMNSit6DViW6XAgOtwPtasvZkcVX7SLmBek5xkxkSPi16CB8ahum+Yvg7?=
 =?us-ascii?Q?jvslv5XkW4uzpk4//bAlXso7Mcm8W8dU6pZdW4ANj2zPfBKeqd9p1zVbSV7M?=
 =?us-ascii?Q?aZpG4meQ/Pk8v6vFUg28xh9TDYYld4e81h8VyjopUTfMVH0VVvI09tCK/mI+?=
 =?us-ascii?Q?wHc0xPbU1hzCIpPihdUFCHb5gZzmYLWitseO9nXTfX4+i27WHiijWRjn1QCe?=
 =?us-ascii?Q?3Mk2AwdBLdZJnPiHExaUWnxvlFXtyQ2fHOJQSx0tZJkZUYKBFFyJE63Nsjhp?=
 =?us-ascii?Q?QvxisEUdXbhiCzVmlOJqYIerHocYOmh5eno5muZRWd0IKYvcDVX2VVqdSNW3?=
 =?us-ascii?Q?DZU1VAQ/iY4nd5Y0JgjNn21FaCx0sfWFwb57Si/e+tD7XLlOcGwct3dgB30M?=
 =?us-ascii?Q?o201zDEu3WjJnkmt1eEGlJMNo7ALNo6ZQ8X37FowWhnUV/mq/BMSDVCZhkHJ?=
 =?us-ascii?Q?QUGC6fjtIRGhCNIq3q04GELZ0rnVk3k5BA+xzJPpc40tkN1NKMY/VbP5XWiw?=
 =?us-ascii?Q?qaG8tb4/K3b5pHfDEuG0sNAtTCtvvgg/mNKU2K89w8YluPhGiFAhQaDVSaBe?=
 =?us-ascii?Q?I+euFA6YAXPem//n5EqXIvBn+ueK93GQ/SP6UQh0Psj7UyrQLW9xR5Cn7Gfm?=
 =?us-ascii?Q?+MajSheIeZA3XsSYhlUfZaeQKZ3+1wn5BHf3X/1+ogMC/ZRnavWFCTFtz4jt?=
 =?us-ascii?Q?OEp5Ei4p4gs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR17MB6128.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aHzBiekeCX8KwwRPtTV8DUfTro5o2KJ9HWSCPwIhUVqRRXeqR0KeLErRb4cx?=
 =?us-ascii?Q?yHyRw8xJwkKsW3wrrFsE/f7verwK7w/IOoqzGkMCYFmRY/lCTWxTnu706b/e?=
 =?us-ascii?Q?97PeVeoCfMUaXEygt9sy8dX+z60lsmDijpjhgwcwwNy5wiR0QvYJxZdjbUH0?=
 =?us-ascii?Q?xJGfvizNQmBP6nyjaTjS8hMPPJlQfkHooNJRyGkt425p5lfvTHrCsG2Jjmrt?=
 =?us-ascii?Q?iKYr/SBgpQr0QwsSxsTCfNMmdWD+Oe/Vo0NWhPC1Ddbrke9YEhFIM4Lywx6g?=
 =?us-ascii?Q?ufyF079uAzd36fb0NPl0qj3GyHmA0pWCNN/ptWKQ4+JmT/6uufXmP3+CDNV0?=
 =?us-ascii?Q?FuV4PiUNlFNq1F3tAqLbO5BDqzHXoJ3JFz8zh/aRF7il8jGEJw9AY1AYUFZE?=
 =?us-ascii?Q?o4hdhB4E8+Sc4YkIeJS2AGFYPV1mLfs1ZzX/5Zjp9L7WOr2rVn1sMXkWX8Wd?=
 =?us-ascii?Q?oTPlI8YIAskHl3SLFB+9HdLlG3EMEIpjXs0i787fNcCoLoEMPWH14tbBVH/j?=
 =?us-ascii?Q?o9W9HTnSi6DOuXss3uq6swWqpuTuJDH/xfPSfCVILtz6RsyBAIj6LYCuQZnp?=
 =?us-ascii?Q?OQrALxEyzUo6pw83gVSPtkenXJ5VgxC5XpnJMk3tK8RTOP5aZWEY75YibnwG?=
 =?us-ascii?Q?EFNbwkgylY678oc5xhJm5MgoALo2MbXJFZ2OWJkDrU4ielcqDyMyOAKuDhZ8?=
 =?us-ascii?Q?XTvR28uXeHIemghT84V7cA46VmQ8f6vpJ+bRJZm+9H9KFbvETHPo13fShKsB?=
 =?us-ascii?Q?mlgxCysJ04mBCaRrL0mMDJHryBAeq6HgeTDeuXXbwS9fuEUjeo/KrcSBifaQ?=
 =?us-ascii?Q?Pqk8Tg1j8bXYin9fBZEW0CCkX753qOpVit9K7aRoY7UKdHYAZV/+rFThI8ag?=
 =?us-ascii?Q?BJmXyJaSBXaDdEAa2BWrKj0xQugGLZZVykpj/XCXqMOJNASBex1Fhx/4AXCT?=
 =?us-ascii?Q?8AwC0WzPFViWzosd8/TFd5CdQzfs2y98+lU5ezFfMzUWQkal2VUZ2J3rqrT9?=
 =?us-ascii?Q?8cQn5rjrP1T0hBjTP3NozrpXZNkz+EES9U4pDpxrIhacr2Qv46+u9OOdyAsc?=
 =?us-ascii?Q?ROLc4wAk6BPIAy4JVkH4yiVfFpzmGXFGIixZfThTwGoMdyxUL94oFzhpRUO0?=
 =?us-ascii?Q?NAlOjf1OJLO+5yL3mrljVBnp3Bh00Ziw5hy+O9WdgHmVffqH53JmW78bYbE/?=
 =?us-ascii?Q?Hzeq/fsNcNOnz6Hf9KVVuVmX5TNz7PN5JZrE3JTUg6EFUso0iyamuz4YkLg/?=
 =?us-ascii?Q?XgybUm6J+10uKEFog7o+Ge/3XQIpzximv5aDOForBy/Typss0zKhdXHeb/Fg?=
 =?us-ascii?Q?B2KWStMQv7aY+fcPvs67TDZKw4dIQoVP3+TF2FDHdu5V2wy2tjOBxkmMxgQT?=
 =?us-ascii?Q?12VMmtMO6T0xkGXLghr7Ed7IpbOVZV89z04yszcdn/kG001qIQOSFyYfN40J?=
 =?us-ascii?Q?yDu9JrQ0bHXQPia6ESiiNDNssSH2/Dij39vAedhdQvydFZ3KmaZAVOdnSqfl?=
 =?us-ascii?Q?9rrzvrsIWyDI5Qbc6ew/pd4m8f+y0mgKiMQfNCDPQrGKEkZv+qpjLsm04pFD?=
 =?us-ascii?Q?KnNJBOScnuB9g0gk4tHB2y5aPOCH9pbTHomiwzfbzpYfdjc4ROUbBdy2U4vZ?=
 =?us-ascii?Q?3g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: lEB2efKU7qoQrtOiXo1BN5V182NOAeC3oEaGseZkGdK3Eoid2n+xwr2+djf86sojbZwu58KN+A0nx+K/XgTIQOPtFDpl+mHLCVGF6DuAqydgzEEmBkHnFmhMhNIR/ogUgq6JJkL0iViLMoPhVkdry2E1CRiwqVAlclkflimp5xCIEaYlFO5bNPEqghA/v19fVxQVxk3L34IfWapjDSQP++69CUXKeRqr1LZd6TMaVeCnmdomp1fh1XJxUDNiildhMKPREBE8GtusUDld1IbcY/zzLT2NqR8rTfsP04enjRUt9tZkXZMP/19MMbkhUlxo5SxC4a4RM9wOkM0n/7urRxGvtPuegUNf1lCYHa/k5uNnOmeDFUVY/HAE6k/bEc70USLskD7wPp1RFT7+b9nhy+527VkB70SmGvLjWo/EDS3YuJQvwG/6DZ9luhSnpzG2TVS22BdXQcQ4Vc+HNKD5Vx8xeuBib8moOcfLAXcGgd6s1ZtloJIemsdR8/1UfHkb/AVh2N5MuONrSgb2D0ts9Go58Nf9BbXPmg4Ol0MeZTEbScbo5/KXaJELxabvcccZf7bGjiLmbv72XQrVshad+xh7mIeLTlNMdwWPCM3y0QogvHriKeYpS6hd1jzF156L
X-OriginatorOrg: keysight.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33a0c718-490b-4868-cc57-08ddf098afef
X-MS-Exchange-CrossTenant-AuthSource: DS0PR17MB6128.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 18:34:33.7619 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 63545f27-3232-4d74-a44d-cdd457063402
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ahIzlcUBKOlFihDkX0k1rK+S7s2baYurCzngT0MtjWZcRbuxI6eWLSgrSRYCqqdGwg6bWMLCwmIW5IG5LgbVo5+85BtdMFa2CorHJ07yvY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR17MB4878
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEwMDEwMiBTYWx0ZWRfX3MWug17kPtlN
 vzdZEoSZVv1/UaIRGAOcNfCXVoYl3xgB/KeNmF7pxYt3WqKGGEWCHyVZHuq4YXtYaQ9BP/vKOip
 Xap67O+l35UR9UyVAISMfcPqdLewOW0GtGGjAfiHXgPqOp7n0BaMKycG93/RppRHaxcunD6ggfu
 X9hZl9bcmHpGBqwloFTJGVLW3FuLW2i6G8A9rQNFvotSv+oHJG22FcPm9OfavgPc2WXJmxaCEso
 DmhWlEpfiSCKoDNnbBVEpnH8hA0gKx3mclEPaxrK7BSiZibrYmJu3+4M+o+oUPNxRwXBfExuHuH
 NbGgGVddHtLWsv4DAXSHIqA+BDtz1OkzlknB1dlNB4IjcFTN96q3r2ydnOATPqz9WCV16f9Kmx3
 eVRuiiBG
X-Proofpoint-GUID: vlhaCQ-OG6g-M9Jcx4fxKTz1zFJLlVi-
X-Authority-Analysis: v=2.4 cv=Lcc86ifi c=1 sm=1 tr=0 ts=68c1c4bc cx=c_pps
 a=XbCLgsAEGm7m6p89S+a4Ww==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=vu2TTH8h0NUA:10 a=F6MVbVVLAAAA:8
 a=MBzh4j0jN5ipS1elumoA:9 a=6mxfPxaA-CAxv1z-Kq-J:22
X-Proofpoint-ORIG-GUID: vlhaCQ-OG6g-M9Jcx4fxKTz1zFJLlVi-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_03,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509100102
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

Add support for DisplayPort to the bridge, which entails the following:
- Get and use an interrupt for HPD;
- Properly clear all status bits in the interrupt handler;

Signed-off-by: John Ripple <john.ripple@keysight.com>
---
V1 -> V2: Cleaned up coding style and addressed review comments
V2 -> V3:
- Removed unused HPD IRQs
- Added mutex around HPD enable/disable and IRQ handler.
- Cleaned up error handling and variable declarations
- Only enable IRQs if the i2c client has an IRQ
- Moved IRQ_EN to ti_sn65dsi86_resume()
- Created ti_sn65dsi86_read_u8() helper function
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 126 ++++++++++++++++++++++++++
 1 file changed, 126 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index ae0d08e5e960..da1508c14145 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -106,10 +106,21 @@
 #define SN_PWM_EN_INV_REG			0xA5
 #define  SN_PWM_INV_MASK			BIT(0)
 #define  SN_PWM_EN_MASK				BIT(1)
+
+#define SN_IRQ_EN_REG				0xE0
+#define  IRQ_EN					BIT(0)
+
+#define SN_IRQ_EVENTS_EN_REG			0xE6
+#define  HPD_INSERTION_EN			BIT(1)
+#define  HPD_REMOVAL_EN				BIT(2)
+
 #define SN_AUX_CMD_STATUS_REG			0xF4
 #define  AUX_IRQ_STATUS_AUX_RPLY_TOUT		BIT(3)
 #define  AUX_IRQ_STATUS_AUX_SHORT		BIT(5)
 #define  AUX_IRQ_STATUS_NAT_I2C_FAIL		BIT(6)
+#define SN_IRQ_STATUS_REG			0xF5
+#define  HPD_REMOVAL_STATUS			BIT(2)
+#define  HPD_INSERTION_STATUS			BIT(1)
 
 #define MIN_DSI_CLK_FREQ_MHZ	40
 
@@ -153,6 +164,8 @@
  * @ln_polrs:     Value for the 4-bit LN_POLRS field of SN_ENH_FRAME_REG.
  * @comms_enabled: If true then communication over the aux channel is enabled.
  * @comms_mutex:   Protects modification of comms_enabled.
+ * @hpd_enabled:   If true then HPD events are enabled.
+ * @hpd_mutex:     Protects modification of hpd_enabled.
  *
  * @gchip:        If we expose our GPIOs, this is used.
  * @gchip_output: A cache of whether we've set GPIOs to output.  This
@@ -190,7 +203,9 @@ struct ti_sn65dsi86 {
 	u8				ln_assign;
 	u8				ln_polrs;
 	bool				comms_enabled;
+	bool				hpd_enabled;
 	struct mutex			comms_mutex;
+	struct mutex			hpd_mutex;
 
 #if defined(CONFIG_OF_GPIO)
 	struct gpio_chip		gchip;
@@ -221,6 +236,23 @@ static const struct regmap_config ti_sn65dsi86_regmap_config = {
 	.max_register = 0xFF,
 };
 
+static int ti_sn65dsi86_read_u8(struct ti_sn65dsi86 *pdata, unsigned int reg,
+			     u8 *val)
+{
+	int ret;
+	unsigned int reg_val;
+
+	ret = regmap_read(pdata->regmap, reg, &reg_val);
+	if (ret) {
+		dev_err(pdata->dev, "fail to read raw reg %#x: %d\n",
+			reg, ret);
+		return ret;
+	}
+	*val = (u8)reg_val;
+
+	return 0;
+}
+
 static int __maybe_unused ti_sn65dsi86_read_u16(struct ti_sn65dsi86 *pdata,
 						unsigned int reg, u16 *val)
 {
@@ -379,6 +411,7 @@ static void ti_sn65dsi86_disable_comms(struct ti_sn65dsi86 *pdata)
 static int __maybe_unused ti_sn65dsi86_resume(struct device *dev)
 {
 	struct ti_sn65dsi86 *pdata = dev_get_drvdata(dev);
+	const struct i2c_client *client = to_i2c_client(pdata->dev);
 	int ret;
 
 	ret = regulator_bulk_enable(SN_REGULATOR_SUPPLY_NUM, pdata->supplies);
@@ -413,6 +446,13 @@ static int __maybe_unused ti_sn65dsi86_resume(struct device *dev)
 	if (pdata->refclk)
 		ti_sn65dsi86_enable_comms(pdata, NULL);
 
+	if (client->irq) {
+		ret = regmap_update_bits(pdata->regmap, SN_IRQ_EN_REG, IRQ_EN,
+			IRQ_EN);
+		if (ret)
+			pr_err("Failed to enable IRQ events: %d\n", ret);
+	}
+
 	return ret;
 }
 
@@ -1211,6 +1251,9 @@ static void ti_sn65dsi86_debugfs_init(struct drm_bridge *bridge, struct dentry *
 static void ti_sn_bridge_hpd_enable(struct drm_bridge *bridge)
 {
 	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
+	const struct i2c_client *client = to_i2c_client(pdata->dev);
+	int ret;
+	unsigned int val;
 
 	/*
 	 * Device needs to be powered on before reading the HPD state
@@ -1219,11 +1262,32 @@ static void ti_sn_bridge_hpd_enable(struct drm_bridge *bridge)
 	 */
 
 	pm_runtime_get_sync(pdata->dev);
+
+	mutex_lock(&pdata->hpd_mutex);
+	if (client->irq) {
+		/* Enable HPD events. */
+		val = HPD_REMOVAL_EN | HPD_INSERTION_EN;
+		ret = regmap_update_bits(pdata->regmap, SN_IRQ_EVENTS_EN_REG, val, val);
+		if (ret)
+			pr_err("Failed to enable HPD events: %d\n", ret);
+	}
+	pdata->hpd_enabled = true;
+	mutex_unlock(&pdata->hpd_mutex);
 }
 
 static void ti_sn_bridge_hpd_disable(struct drm_bridge *bridge)
 {
 	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
+	const struct i2c_client *client = to_i2c_client(pdata->dev);
+
+	mutex_lock(&pdata->hpd_mutex);
+	pdata->hpd_enabled = false;
+	if (client->irq) {
+		/* Disable HPD events. */
+		regmap_write(pdata->regmap, SN_IRQ_EVENTS_EN_REG, 0);
+		regmap_update_bits(pdata->regmap, SN_IRQ_EN_REG, IRQ_EN, 0);
+	}
+	mutex_unlock(&pdata->hpd_mutex);
 
 	pm_runtime_put_autosuspend(pdata->dev);
 }
@@ -1309,6 +1373,44 @@ static int ti_sn_bridge_parse_dsi_host(struct ti_sn65dsi86 *pdata)
 	return 0;
 }
 
+static irqreturn_t ti_sn_bridge_interrupt(int irq, void *private)
+{
+	struct ti_sn65dsi86 *pdata = private;
+	struct drm_device *dev = pdata->bridge.dev;
+	u8 status;
+	int ret;
+	bool hpd_event = false;
+
+	mutex_lock(&pdata->hpd_mutex);
+	if (!pdata->hpd_enabled) {
+		mutex_unlock(&pdata->hpd_mutex);
+		return IRQ_HANDLED;
+	}
+
+	ret = ti_sn65dsi86_read_u8(pdata, SN_IRQ_STATUS_REG, &status);
+	if (ret)
+		pr_err("Failed to read IRQ status: %d\n", ret);
+	else
+		hpd_event = status & (HPD_REMOVAL_STATUS | HPD_INSERTION_STATUS);
+
+	if (status) {
+		drm_dbg(dev, "(SN_IRQ_STATUS_REG = %#x)\n", status);
+		ret = regmap_write(pdata->regmap, SN_IRQ_STATUS_REG, status);
+		if (ret)
+			pr_err("Failed to clear IRQ status: %d\n", ret);
+	} else {
+		mutex_unlock(&pdata->hpd_mutex);
+		return IRQ_NONE;
+	}
+
+	/* Only send the HPD event if we are bound with a device. */
+	if (dev && hpd_event)
+		drm_kms_helper_hotplug_event(dev);
+	mutex_unlock(&pdata->hpd_mutex);
+
+	return IRQ_HANDLED;
+}
+
 static int ti_sn_bridge_probe(struct auxiliary_device *adev,
 			      const struct auxiliary_device_id *id)
 {
@@ -1931,6 +2033,8 @@ static int ti_sn65dsi86_probe(struct i2c_client *client)
 	dev_set_drvdata(dev, pdata);
 	pdata->dev = dev;
 
+	mutex_init(&pdata->hpd_mutex);
+
 	mutex_init(&pdata->comms_mutex);
 
 	pdata->regmap = devm_regmap_init_i2c(client,
@@ -1971,6 +2075,28 @@ static int ti_sn65dsi86_probe(struct i2c_client *client)
 	if (strncmp(id_buf, "68ISD   ", ARRAY_SIZE(id_buf)))
 		return dev_err_probe(dev, -EOPNOTSUPP, "unsupported device id\n");
 
+	if (client->irq) {
+		ret = devm_request_threaded_irq(pdata->dev, client->irq, NULL,
+						ti_sn_bridge_interrupt,
+						IRQF_TRIGGER_RISING |
+						IRQF_TRIGGER_FALLING |
+						IRQF_ONESHOT,
+						"ti_sn65dsi86", pdata);
+
+		if (ret) {
+			return dev_err_probe(dev, ret,
+					     "failed to request interrupt\n");
+		}
+
+		/*
+		 * Cleaning status register at probe is needed because if the irq is
+		 * already high, the rising/falling condition will never occur
+		 */
+		ret = regmap_write(pdata->regmap, SN_IRQ_STATUS_REG, 0xFF);
+		if (ret)
+			pr_warn("Failed to clear IRQ initial state: %d\n", ret);
+	}
+
 	/*
 	 * Break ourselves up into a collection of aux devices. The only real
 	 * motiviation here is to solve the chicken-and-egg problem of probe
