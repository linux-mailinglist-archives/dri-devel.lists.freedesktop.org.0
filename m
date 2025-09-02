Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8DCB40A78
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 18:23:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B84810E3BD;
	Tue,  2 Sep 2025 16:23:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=keysight.com header.i=@keysight.com header.b="KvhuTv/K";
	dkim=pass (1024-bit key; unprotected) header.d=keysight.com header.i=@keysight.com header.b="r8g3lkOJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-003cac01.pphosted.com (mx0b-003cac01.pphosted.com
 [205.220.173.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E16B810E3BD
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 16:23:18 +0000 (UTC)
Received: from pps.filterd (m0187216.ppops.net [127.0.0.1])
 by mx0b-003cac01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5820sdad031676;
 Tue, 2 Sep 2025 09:23:00 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=ppfeb2020; bh=
 uGRfsMIdQo1dke/2SOfx+23NeJKv6fZUi3PrOJgfQ5Q=; b=KvhuTv/KJBGR+VpE
 FUhUgsPODauhiaE3B3urMYwS0Tiu+IcgO8IygHkFav98R2FQDQdE4Q9oUMtuufgC
 HRrcf/Oe7FayMKt5rxGIfRRUtUYQelkLw+iCxnhRyqJWsb7Ni1KHvWqib7R9CuAz
 SEVH64VyaDcqFrM6VnhC56NNZi8dtgDbFZqqxL3kJfQkzz9TdMHJxsxR5hXTrbuu
 7uSVelqu1GBD/wXotE6zHx+d/5QvmgqM/TOo0+XlItiQ5ogSh8VTshlYH0YMr5NS
 WNyC70SGbRUmNTxKRSJWj+indlNgsAFPeqzRHxIjzmwjwnOBDJ+LW6ZJk1We8O+z
 xmzP3A==
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2077.outbound.protection.outlook.com [40.107.96.77])
 by mx0b-003cac01.pphosted.com (PPS) with ESMTPS id 48uy64e1cn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Sep 2025 09:22:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pU5VlK7zHoHTDHPI/79QLEHQA8QBKrVBaSe/44sC+8fsTIRPTzpbTTHIQ4aXxu1fGk0xoYiDsFmhwltBxWofQFqD+0R97zCjRg0u2M/whiZtTy1KaKp1RtlwFqft/3q2O6Wwx3gBSa8XKEx22AjniMw2ZcaO1M7jWody/r+rRqsIR/YbTUmoBoc+TToErRuqgBxJzmHElev2kx7/V8bPYWmtZRw+2B0+w97zCpOAi9Zm2+16c6Bk1ECllCuX+s85ljnD5r4PpkXpMLWOaXqbp84jpXFs49/olcZmTWPmEZC6AP90F7PbqPEeSQvrkKZzuOFx9VP8y9v7VMcz8X6LQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uGRfsMIdQo1dke/2SOfx+23NeJKv6fZUi3PrOJgfQ5Q=;
 b=XPtoYqvjaZUeI7gPsk7X7HJjXxppqd6KkFJqTTU9kGU1+7qvIYZ7qfY9HzOSPWxtp/j1IVL8fvohVNAbP84MQnBeKA4XG5Mo+AgNSrvX72tWEOVG3qIjhgsNwx7jBvW0fq48svytRbKzg+AZ94137Zok448gU0js31DB5K1P/Mn1TtMhWAZy9jYSnmOFDtYgJEigKSlq5x7ZFALcqyiXK+g3arXoNtZmb4225WQHcGUcA6YMWu6g4BeZqOjLyk7tP3OT7/LiTPh6fhfh3xSRFIpxQhoLrXlavUIhlWV/Mw23BP2N8N3+2nj8c5NWvorPoHuYipQAdRYKGuQsY8FIIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=keysight.com; dmarc=pass action=none header.from=keysight.com;
 dkim=pass header.d=keysight.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uGRfsMIdQo1dke/2SOfx+23NeJKv6fZUi3PrOJgfQ5Q=;
 b=r8g3lkOJeX3scfbBE4nkJinSU0ES2o+T8GW/s2HiwGGTFIwozd3D2dXcSrBrd75Ncn7p1Ccq9NlPBS9GMN9cWkit6RTR4yuow3cELU84incBtMV6tqHNe+yJciTAdNT3sHeb1JKQ9lLa/CYqCGMf2R9RTo+adKuHxKiildLo/zM=
Received: from PH7PR17MB6130.namprd17.prod.outlook.com (2603:10b6:510:1f5::17)
 by DM6PR17MB4057.namprd17.prod.outlook.com (2603:10b6:5:25b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 16:22:55 +0000
Received: from PH7PR17MB6130.namprd17.prod.outlook.com
 ([fe80::54bb:3a4f:5f80:a51e]) by PH7PR17MB6130.namprd17.prod.outlook.com
 ([fe80::54bb:3a4f:5f80:a51e%5]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 16:22:55 +0000
From: John Ripple <john.ripple@keysight.com>
To: dianders@chromium.org
Cc: Laurent.pinchart@ideasonboard.com, airlied@gmail.com,
 andrzej.hajda@intel.com, dri-devel@lists.freedesktop.org,
 jernej.skrabec@gmail.com, john.ripple@keysight.com, jonas@kwiboo.se,
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, neil.armstrong@linaro.org, rfoss@kernel.org,
 simona@ffwll.ch, tzimmermann@suse.de
Subject: Re: [PATCH 2/2] drm/bridge: ti-sn65dsi86: break probe dependency loop
Date: Tue,  2 Sep 2025 10:22:46 -0600
Message-ID: <20250902162246.4143785-1-john.ripple@keysight.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <CAD=FV=VfCWFViDE1a5-_KtH0Pfo2EnCJeo2k8MaWuRHhmMPMMA@mail.gmail.com>
References: <CAD=FV=VfCWFViDE1a5-_KtH0Pfo2EnCJeo2k8MaWuRHhmMPMMA@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY5P221CA0101.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:930:9::36) To PH7PR17MB6130.namprd17.prod.outlook.com
 (2603:10b6:510:1f5::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR17MB6130:EE_|DM6PR17MB4057:EE_
X-MS-Office365-Filtering-Correlation-Id: 199f7254-821c-4fba-8ac9-08ddea3cf8dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PIadgNXJwSJXBc4e4C2lbPo2lx2SzAp/lspgR635mk6+K8m4cIRo3wkLtCEB?=
 =?us-ascii?Q?WBscitbv2B1ASejppSmXuRR5RMH4KvfzEb0sVklO1wvFSDZ6vkC/dy1NMqmz?=
 =?us-ascii?Q?3xGSQX3MzuAbsxHKqqGDFFUnp7SYZNkA3f+Z+MbLRYhdpWIWLVfSi8v731fi?=
 =?us-ascii?Q?scIu7oDSGEEsq6TAM3kZv5eaG7cHEWQXiSzgo4tvpsNt8BXz5fCTcWNRtn/K?=
 =?us-ascii?Q?GdvYjf92q+nq0ssHne1RfRTIYqSlqbJmLkHy8xVXzB7uIaPQ3NzwqUvMqL5/?=
 =?us-ascii?Q?zeiR3aWbAExKbg9APYFNp3MVNqTH7bPgSdr641D+pTFrS1VzlOacWIEIQd/k?=
 =?us-ascii?Q?pdcu2Q19VKeom+W5PXD0nnCbEgkckxB+cMhV/TXiFNu3exrnesy+PmhdEA4y?=
 =?us-ascii?Q?bo/0aPcsEDMe9sdfJZmICUc3yP+TNVAOjR9wvUqh2PAUcgUOR7f2KTg8ewtY?=
 =?us-ascii?Q?jHkv0Z4/llhmblNhGyrjjflq9me+ILRlvGSZMG1Ua9JJWo57gt5XhX0ia1Jp?=
 =?us-ascii?Q?H2dkpFLGfOJ3dnAd56Mr7X2v1dFHGzLr780rW4TZSA7z3xSFAWQz8R+GYZad?=
 =?us-ascii?Q?woEWpYtJOWwz1nE73WbPSrMIbXpJOJm2e5gQ19onf/soSs2OwCJuottlehBd?=
 =?us-ascii?Q?+s6WelL51Vjymb0snhtC5j5fWx3HM8a/+URR61Rbd/AElQL/j+ApusYLmc+2?=
 =?us-ascii?Q?RMyr/WKD0lkR0THysNlpyuIp2nd60+ge4t2pwcFO4fWspYoPFNkCVZMaxkGC?=
 =?us-ascii?Q?ht5VD7xm+IVJXx5Dzyj9iFuorbFELfGf58jCQ2dscz2uFGEME/ePEEMb1m0c?=
 =?us-ascii?Q?RtAbID76aF77ML+uEXTe5yOyCvAgO++UqtQx1yva8M7UKK8dFs72CznX1zTs?=
 =?us-ascii?Q?KLlDdPv3Eg/W8NaAgXMT8+jJcl5J+Zzb6gO80iQ2HL6zhz8vmi/n2ASXV7Ng?=
 =?us-ascii?Q?vXHNv5frWqudDY1thZJkhPxFPZoMluTZ6OHfF98oy6ubtsfvJ+/f/fQvDprJ?=
 =?us-ascii?Q?3RIMnK95Y0/DSTRHEIFXIVRtf4XkBkhdbNVSyy0OqVkC1s+G/RMzVValoS/V?=
 =?us-ascii?Q?wiJjeieQzHkTH90rZxck6RvIdCPHjOFojF14ZH/4E2ux2FcmAgB6DW98dg/6?=
 =?us-ascii?Q?UdTE/bozQSwHA5rVktO3A8Uj/cXjSU29lMb57m4n46vKq9w3llE7L8GASD1e?=
 =?us-ascii?Q?OL8PZ+F8PnE4/U1cYEi/f7MoyxCIK+qEx08Du9UpoqRATQi4DTvzl4S1QttW?=
 =?us-ascii?Q?r6WIKonN8LK8+AlapE5Z6htTH9BNK2Y1ZTkc+kLcvt8jLpaM2AT6VvbECE+K?=
 =?us-ascii?Q?6uLZh6mJB1TJWf3iI2IFOFqDcQOngmcIEzoaTYffc1sojzUSqaUnTGDjlJ9j?=
 =?us-ascii?Q?rBxCCcZP+aVgrLd1kKWcACl4EWQYXrylUZT0j1LITAlEfkcxRNXUVXCDhzt3?=
 =?us-ascii?Q?wxvULshR9wc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR17MB6130.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2Jx1i222FfLxLiWQGm5m3hSyHOd4nCR6VbaKXY9rJotRBsDSk4MWuqeipiQd?=
 =?us-ascii?Q?XpoJK4tr2DkO3QLOGCU8SHmpiqaxp0EPRHnP/j5DTXC10abGH66YSBaFb7OD?=
 =?us-ascii?Q?x22Hpjkj6wX9K7iAmUqCQy4CCGWpYxRdMXi77PpVJwWyV985ZFnTIJ/m2VzO?=
 =?us-ascii?Q?ENTmS3gpEGIBv7Z5D0M3m4ClsRyJB6NYJIV3NAn8UtC1v3f4Mry94V/Ijd+q?=
 =?us-ascii?Q?Jg4vn2yN+cT7WH75akWgKzy0WY9xihWCczQFTPZN++NwwESsDf6VJsMhqpiQ?=
 =?us-ascii?Q?+uwU0CvMurvOOfT5vJeZQchSlHJrkiw88BQwiwzaqAEll4iidGG3dU2bIw3W?=
 =?us-ascii?Q?Fbkh11zMAKwYstLcEKorTJtCTGMc1RFSTCFBS8Hhq+4zPNC4+DDp6oNuQak+?=
 =?us-ascii?Q?wtUmA5/6UFi0h7XyQf4Pd8kybU1XM7bNhUjeHbaFSEx950Dz/qZ395GVuQ6O?=
 =?us-ascii?Q?YHJMPTcEzOLPLjSRRvIYf6mkJNGf/KPtsSvh6w6mE4nAyzm8Dp/ZhufnZ+rw?=
 =?us-ascii?Q?3N++b+x6kZu4Q7w3VxuzKPlFDh+/XYjjT/SmW7CVbQc8n//J/iDvaJghmMzs?=
 =?us-ascii?Q?bPRNobny7oTGSa6UBBF5B8UAxmssX/QaPZA5exJIEncNhQDsJ96u+c3SgRsj?=
 =?us-ascii?Q?hKA8NasmyzFxwnpif3mFGIuG7YBDzoe1reX33pDhKEUk6bij1zgzLKM8104F?=
 =?us-ascii?Q?0sMip5sztZSrHWyFe3s3NcNS1X+0zqf5EeAirxSY36wvY3WLK/8N5pKgrWwh?=
 =?us-ascii?Q?MuBOnQCWpIWi0O/MZtVfOVZxqRjIA3z1ob+DbUSfOr3pmFhpqx2Avb2htmtQ?=
 =?us-ascii?Q?qSNq1aEinZC4sBDPwxZUJbNRPwxb4rT6iOYSQWtDV39P9BfIwbCD7DQNa6QE?=
 =?us-ascii?Q?SgHPw82x6J64Eh99dAhl8nrAJrdZcCkmfGGn6bpfgoLWYeikfLxHBhvGvJGk?=
 =?us-ascii?Q?dAo5gkpHL8CtKJoeUF7h7EXtji+zr1w37qTDvWwkl93VXP3Cj/qg8m57mbtq?=
 =?us-ascii?Q?JytEwZ8ajR5/mz7AxwLdzc6evvNV8750IC6JaM654EJag8cfr6dLxpV9h709?=
 =?us-ascii?Q?u2s0s8iFrwi7kMtWZnkHwe6lg2TxSSokjD8k5pMpCvQoWqZT5I2zVXxUPVkw?=
 =?us-ascii?Q?Fftk5dCdpY/+OiqvIXN+E7L7UGPygPErzq8pFPfqYlq0D8G5UnOYfwvMjRMB?=
 =?us-ascii?Q?B/znRL100FtGFy6GO6pOI0QUEFriv6C5HBcw/VpzEdmyTfaURz0upJW+VZ9T?=
 =?us-ascii?Q?fBHrJf3SSOcTnTJVI//svdalBI1X6ePyfMydDYUZuQ9Zmx5DzD69EivjDJwa?=
 =?us-ascii?Q?GcMQcrV7GhRne5KeMY+p15JbRXg5MyxRetEVPChVA2NczH+lFrEsnK9nk6YA?=
 =?us-ascii?Q?VRzcgqKT3tO7RdTP0nwhBZnw8rvKY/rUa5UaR47OKnIvxorp1RtHbI/zxof7?=
 =?us-ascii?Q?7g9yGkjykW02JvyqTpRgbZIYcuTTfoC1oDFK/FTujzPNTJMDDkyARgWJCKds?=
 =?us-ascii?Q?HLjmHC/gFuKSo46L6zkPpCF6xQjXY/6Yk/7MhF/IRmqE1vQLBb3sPRXDC9rU?=
 =?us-ascii?Q?bi/U5vF/ATHnB/Pq4Vsita8GRO+ZWdzPJurllJyHTpEH3qbvLzm1tMFojoes?=
 =?us-ascii?Q?Sw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: /C4XxUhazLD3M9oiqQgo7m71HOH43fGHpd1cPo3iXMJVUfQZFx98Ll28XeAzILSTCGFMDh9RBdzaj94O8oUDMjFfFZ76GyXY9lgoG/F2OQuKkwKDjuDTnl/S6oX4tJItGnWmjwP2anukMrZ679WQJeMAmINN8875drRkAGfr7syew5KCB0xizSI+Wd7bK6KckI0CPh2Lo3qg3/xKJNMl+836XhwwcR9R948LijIKXaI7to+2A09AbwTta9AV1ryxvhNxkKdKdDIHnh5MkpBjBAkmAskSoZ9Sp3igyuS1AtZ3zs7bBRIg0pUQ3h1NzrACod3hWhQ2A6rWoZEvupfCtc7Y/66C9P+0RAn869fuge3tCXAuFF2ZXTSEEd5b9W3vZpuj+q/qMShUcfmUXnaATCl6O4WmJeYm5BjMnIYLk2ucUz9v20UDvBpdDCHSjLaU+yVqLv1Y+YFkKw9yHzCMLsMaJXRNIvk93vt2dT8ia3jlQUJSncscklRqtVhERFPkCqjsuGrN1nSq+8ZHha7cbzeF4LaCWys8KA2Cs2Gom0p8s4YtCNccctQ9rqhpspDV3wOdUvrzBUq0EFHD5xof3rGHPdtqS426IdsBM879HhYw5pBYjIA4KW1DvXqu50Hi
X-OriginatorOrg: keysight.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 199f7254-821c-4fba-8ac9-08ddea3cf8dd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR17MB6130.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 16:22:55.2561 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 63545f27-3232-4d74-a44d-cdd457063402
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YDX8/omxP+thy5I6lZ2PECr7wmr+pBcrptSWjSdZSeZw/wxONTOuLQCS/Y/4b8LjqJI4+Mv4xr0BOG8Wj+6bEciEVlqDfppl7vWAvxIj0oY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR17MB4057
X-Proofpoint-GUID: 5Ukr42poTOKFgeIdv3bzLuZ2HDUtzl5Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDA5OCBTYWx0ZWRfXzYMtaeVYJqOD
 d3NzzS1m4UH3zw+z5FzEolkL2zAcEbZzKSe3OkTgVieQ8X7ELJyIDZYIL88QwIyVD3JEuUGQlOb
 ETYiOgD9jySvJe7m/MSyI/Vp8EFnxhTB+ZG/9ocvwW+a+NSV5o7bzSfSlUDF3EZIzQODKIpt/WF
 nJrs3xxM429nKMZxXePb5e/9H7kMbw5Ym+v82iEZkhrPFejy1W9y0eP+ZKDs5ETaBVAP6jAK+X6
 EUPYs67pvy0kh5eX3ZspR6ptb/eAzEpgTYIMJFXaav4S8VFYSSqIr21o9rMNs8zQ7HhBXvO5obp
 Q0SdW5k5tyRcVIqjUvoinBxojluzeRfd3oCc/xMIAvS9Zm0mTFIbFpDmGv3XdaFirHX30Jb2SEG
 ezvXL0d5
X-Proofpoint-ORIG-GUID: 5Ukr42poTOKFgeIdv3bzLuZ2HDUtzl5Q
X-Authority-Analysis: v=2.4 cv=U56SDfru c=1 sm=1 tr=0 ts=68b719e3 cx=c_pps
 a=ct44O7CZgj5oH0XY3SFooQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=vu2TTH8h0NUA:10
 a=Dt1IWgQg3EA3znxjQ7EA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300098
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

Hi,

>Which i2c bridge are you talking about? You mean the one created by
>i2c_add_adapter() in drm_dp_aux_register()? I guess I'm confused about
>why the DSI probe routine would even be looking for that adapter.

The i2c bridge I was seeing was created by the drm_bridge_add() function
in the ti_sn_bridge_probe() function. Without moving the ti_sn_attach_host()
function out of the ti_sn_bridge_probe() function I kept getting stuck in a 
loop during boot where the bridge would never come up. It's possible this
could be a unique interaction with the hardware I'm using and the nwl-dsi
driver. 

>In any case, I don't _think_ your patch is valid. Specifically, if you
>notice ti_sn_attach_host() can return "-EPROBE_DEFER". That's a valid
>error code to return from a probe routine but I don't think it's a
>valid error code to return from a bridge attach function, is it?

What error code would you suggest?
