Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AA2A9F9B5
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 21:37:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DE7C10E6D4;
	Mon, 28 Apr 2025 19:37:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="QnGMTk7+";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Efo2UldV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97C8510E6D3;
 Mon, 28 Apr 2025 19:37:46 +0000 (UTC)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SJW4aV029038;
 Mon, 28 Apr 2025 19:37:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2023-11-20; bh=7CaGSn2j7ZfICgO9CQ
 RNpcffhtHzxyxrBPcJk59xNGY=; b=QnGMTk7+5cO2bWi8yPwAz/dzR9C9RAylhd
 DTIVhHLUzvSVXKZ1SoL+nbEKK68t9qa3ADpRNRUZoCoS8Vn3OPUiCWaqfcem9PEY
 uGZv0oqdOoJPJSK4VBWpCBoW3LOG5VJjifS+5wIQkKXkNNjoaVqYBcE0vZyaFw/t
 znnCCA5SMV3JxZUXwFTZWDFy0n2QfaiaiDzWPTvY1EPF+126N6kIfga6r0WwjMTN
 GVkSsksjiHiZpD/7Rbh/BQLhFVJKfbcv+CNxi3Q79bWK4sfRmvd+r08hxPhAC4yA
 X69PMn3eKeQL6PB/y9MRCC8x1UN6XGqofv/alfzezd8NlImtEF3Q==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46afwpr07q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Apr 2025 19:37:18 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 53SITeiH014000; Mon, 28 Apr 2025 19:37:17 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com
 (mail-centralusazlp17011028.outbound.protection.outlook.com [40.93.13.28])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 468nx8vyw3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Apr 2025 19:37:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DhvCadNcPycWXHRBcUUpI/qqf5zqR05qx3MFmzFdB23TqPk7naKbt8zvE3rdw9WtVhecpySdE+rxGyrh/rm+Z6jNEEWFGvTC9mCMsVlTs/e7+oWRMwhovaXJfgdRCRUSeE/49LlqG3so55i27FZLVloumkqAj/WC4MTjsxe36x1JXt/0xvX2Tl9PJyUcF6MKBp1IlOCyR82nnBJf62W37DDlVsPTltj/TC6PDKWFe5pryElReGAPPx9RsJvU6ANeOgZgaLyXT6MIaC78nsVkywnWXDwGZj1LkpXKwM3mo92S80PcfKVjOlFcDEBpAf0fWTN3NmByyjTsczY4Re95Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7CaGSn2j7ZfICgO9CQRNpcffhtHzxyxrBPcJk59xNGY=;
 b=n7WYlo3br5GIpI/oPGtvTZMiK1taEUZNrkWVvXcBSEHdkpD85w7OExeTTkOHIJBGZKpj2pfkTxR2wwzTwAfh0mIOrX1w4iIoW7JhxGs6W88PMpS+mnWo3JdjVAojFzT2lD8I6XJ1Fr9QgIyyvEQvw54Ic5PpQMK/25gQgJSKFHT8Y5oyTc4c7A3EoulLBnA6xQ98FZ5Kd3XmhQhsVFHfiA7lTQKHjZF6zAqgJgDxEaPzB0b1YP6P0FJiTKE35hVjtvrFRHGzt1BRjzoX/Bn7jtihPW6Il0gKquEE4tOL16r87nvJLCYkgmSa8x5Q37y3Yl+rWN2St1L1px1TcyU1iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7CaGSn2j7ZfICgO9CQRNpcffhtHzxyxrBPcJk59xNGY=;
 b=Efo2UldVdbLNOzEWRN1OSH5/cAZ+BINXbBUtSqk4MMNT3vfG5cCHUJKu9CuRP8QNddHAox+Y24ZbgSyuiS7DtrQZlgJ0Pycpwt8QNchsIRYVQg7igOoCI59OI2cPBjzg2aENk6P/eE9QMn20RLtkTA/XPZ/D0XS7+H6VVrDeG40=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SN7PR10MB6667.namprd10.prod.outlook.com (2603:10b6:806:299::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Mon, 28 Apr
 2025 19:37:14 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 19:37:14 +0000
Date: Mon, 28 Apr 2025 20:37:12 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, x86@kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrew Morton <akpm@linux-foundation.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>
Subject: Re: [PATCH v1 05/11] mm: convert VM_PFNMAP tracking to
 pfnmap_track() + pfnmap_untrack()
Message-ID: <f08118b3-0736-4a5d-b780-8e3d88f45c02@lucifer.local>
References: <20250425081715.1341199-1-david@redhat.com>
 <20250425081715.1341199-6-david@redhat.com>
 <aAvvQ1h9bg11hiqI@x1.local>
 <bbadf008-9ffc-4628-9809-2d8cf104a424@redhat.com>
 <aA-n9hvSX9JLsRM-@x1.local>
 <7a26e29c-d889-450a-a5e1-ce671f09e4c8@redhat.com>
 <aA-rtji7ujQgckbM@x1.local>
 <884fab29-e16a-4663-8e33-885bc70ca2f7@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <884fab29-e16a-4663-8e33-885bc70ca2f7@redhat.com>
X-ClientProxiedBy: LO2P265CA0240.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::36) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SN7PR10MB6667:EE_
X-MS-Office365-Filtering-Correlation-Id: 674f713d-3757-4239-8376-08dd868c1407
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Q7v/EXeImx0wJjHDPawVxthNaXQVGLrIDawFlkG2kiVJ3xlv1TUfDVvOVvh/?=
 =?us-ascii?Q?pJu3nYTmFgREae16URw3yvMvB1zXJ6CvplcxhR9L2q/FUCS4Vzz1J93A/gSH?=
 =?us-ascii?Q?6Wcs6Ak11UghkvmFbHLWDyUjLZeYVa+FrEHEdW7rlC7fLqirECjZF5YYTqWV?=
 =?us-ascii?Q?4qn+r/YgHo4SDRonpYOianBJPZxgS40fvGMY6sTbwwzFHNvkQUJ3V4w3NPeO?=
 =?us-ascii?Q?Y9n5X5MCGI1WI0JnZKReK0TNUXxl9Ksu3TX4I/xtgQpXiZjbXDGemYmkaxqV?=
 =?us-ascii?Q?eMySyLz60vgsAChbEVniZRwQhS9uqx2A3dzPjeDfuJ0Tn8lq+IvrzgzfCwbh?=
 =?us-ascii?Q?bRqGa/FUwUdiS6bX7IJh2PSTM3w1QbRexsjxPuPSzTYVe+3hqq6SddK+FpQb?=
 =?us-ascii?Q?vJwujpKw8z3JgGX4hYf/DDRqpS3s3fm9WUIA1qd9LL0xDSicu93vuWnB1r6T?=
 =?us-ascii?Q?FQ8mHSiBW4nU1t+8HPhx2reo2hbSHyceD0jp68MxhUxAZ+CGLbdiIiTJ3q3N?=
 =?us-ascii?Q?2Pmh2kviqQsJ/7bwDfgzjMNdSVwJ5viy4tgYbJWBtKy7yBqLswUMloIw9R0W?=
 =?us-ascii?Q?OlY9SBkFtu33fLWuQNnxjMflh88izFGsWZg4PnCWm1IT0aYBicigm5MIc7hm?=
 =?us-ascii?Q?yWwbFMVnEVKtd/v6Fx8nD/S4+SDLOXdEUP6rnl2ahkr8xzXWhIxF1BXxCS1e?=
 =?us-ascii?Q?B13BBUX9h3la7tSXHXtfcbxudn7tD20ylowQ/KMzP2rOiTfZxqZHK6ZpBoxz?=
 =?us-ascii?Q?1zTzzZJN2T4Pe+du46LJosodzJlYhI8wXKjCR7cYPlvys7Exy3UNvLLN4w4X?=
 =?us-ascii?Q?cZBekxISq+bE9R1lWzx/tOW5FFBetuq4INh8g0pv7Cu0Jk/8kdiv+CeLW4IT?=
 =?us-ascii?Q?Iu48OovgSZXdPWKdJ4wId8Hh4GVplW8xMvi9iownDN6JcwIdRxp5uaNLlRAx?=
 =?us-ascii?Q?lCOq5DWHhaDB7qb+CnNF5kyNFP2r7mox2Bxu0fWIWy8cwkDxd7s5Yk1O1HqR?=
 =?us-ascii?Q?sENp+yzHKM48r5qjUP1Rm5iMXNG52rnHJyRFRnair5dWc79duzCuyv6ciDJ+?=
 =?us-ascii?Q?wN/lBhwoQ/fZDpz/Y08tmXTSYCA8fOyXPxWV6lDY9rlDcecpNPXrWIEtZ/Wh?=
 =?us-ascii?Q?XDVXv+TdZIKKEL9vE1mfL6y9KOmvmvSsWUe7Ta/kU/SSiymhhUf86zXZeU4E?=
 =?us-ascii?Q?YHL3bvUH3iQBkQTWmRMb/sI+by68S3f1lBo0U55ajQO81UiDj0qasDdwzk3F?=
 =?us-ascii?Q?0t137msG1FsLhV/C/7A0UEUoUcHnrZ1e6Qk5Tk9kkfbF7WSEuRKYOoQWjkSA?=
 =?us-ascii?Q?Y3itMOVAs4PEb45QECg+QXOWYZfM9xDFtgu7OHJzizfzMHpIhHTvEgR3GpGN?=
 =?us-ascii?Q?Q0pbChgL3Pxkwpg1IOf6a/6Lf3kb3qS8hpBerk7TNxhYtxBKKIk61PGKtRAA?=
 =?us-ascii?Q?al2ts3ideZE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR10MB8218.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EGsOWrxKI0bwvr0Ew2BpHhZdClmb2eHP0b1BH0cDfksrN0qSWejhv/pdPll9?=
 =?us-ascii?Q?0wUT+ePJZkVkXzv3eSnHkfFFPFdC1nHlozdtg3XHSMYFYKrzKqPt1tMN+kw8?=
 =?us-ascii?Q?ZHQdUfeRPLGUPb5NVWtaYDyZHwZ1OFSbunPCDNvRQTxOtEwtsroekDBPAr0p?=
 =?us-ascii?Q?LnI8C3baoOUsQi7b4r1W6BVc5qU0WzquZdkVFOIToCS8CTpxvddEG9PXlb84?=
 =?us-ascii?Q?XPeBFUxcIgQwIFfXFz2gEvHV8I9neZP1Sb1pEn0B4CT2vDpeOmnyG2gIp2Tf?=
 =?us-ascii?Q?JPOz0H7V2tgnsDREJ74wMG4tREZecuc1tuT1wHAlfzmY+zrUaOlyLTn9Wcns?=
 =?us-ascii?Q?xJlKqJrtLvpaxkvJj4wiAnCzhGsi/KY/p0Yg8YBysBP6uapRdU7etPV2jIv0?=
 =?us-ascii?Q?nsHwVAPpl0W2zt2GkDuVKXxWe+LyNkYETUbNqwLgTzApq3ULPw8skoLt2GkH?=
 =?us-ascii?Q?NjtQmhdqaXqqojL1iDDsqZlJ2Ly3jDKx/GHJnOPO8IVqB8uKXVQtDOxfA2tG?=
 =?us-ascii?Q?0FL9m2kda1H4aou3uZ1SocxOVKvSq19KUNuxkoj/ba4pstzxcTCV5RWQsdw8?=
 =?us-ascii?Q?pw/pL2yhJG7X7bAKlLLVDToBXz2mwfz1g6FNremG0WUsSaSqACa907ju7t8d?=
 =?us-ascii?Q?e6K7xPkrNg/4xEkFkMvNUCAcyzT2nImWLiX/ZJ1BL6ilJJpRBCSzCPAbLIT/?=
 =?us-ascii?Q?Lbhyz0BpH9hr1DMXoQ15VDD2vzTk5kmQUDof2G4GqBd23ISy5TDdcVPqYELg?=
 =?us-ascii?Q?zGph0l5f8PRuvyH/hD6XMuTiohqHTgn33RnWrYnEaXdPYKVajFYECrA9JDdC?=
 =?us-ascii?Q?KcL+qGjz4CKsEFWUsm97aSZkXuD65WWHM6XhAJFqMeNZO3vtkzYuhpIk+ZMz?=
 =?us-ascii?Q?mtHmdoo3i2PKOq0AyZPYawL9yC3hkLSZTyVyMXs7HOzLlgJ5ItGOAdJNHiEn?=
 =?us-ascii?Q?g1d/j8XL/7mgzImKRUobhH4vd0ntvUOxozflzIi50R/thMwu02kqFfhgpzCW?=
 =?us-ascii?Q?7HjA913BU96wJOaQpUgvHS5DfKK9j98UPdNIgbuZRqOcBpxfTJwBvk8hzP/T?=
 =?us-ascii?Q?/wXzubhMxREJxYNhRfUh2bA2wYUr7H7T+QYIbJiy6ag9QFrdyLjWNDY9RzXC?=
 =?us-ascii?Q?IZgg7XqlcOXL1XaP/wD03rf24MV6/rmd/QKXXzI/0Cd9368kSVfvgwlyZC+E?=
 =?us-ascii?Q?xsSRo1VQ4xBc5RnjlJU/CTsG8pz3ogQ2yKXA/tcg5RZcTfrew0KpSAeVtgTi?=
 =?us-ascii?Q?QWH7xZMhLbbxNqSL1WtvQ22JcKdogAc0AhiKUF3XCT6xFknpW7Z/XMlhID8Y?=
 =?us-ascii?Q?p9xtSoNpKcSOWz3hFpLqb6Kpe+mnjfwKXU8f6WCY0A/qZFDx1rnTqTArDq/1?=
 =?us-ascii?Q?sn/gorUg0YSXLKMq9LnWPHruPo4NnbJdxBWogmI/BKTsa8n7KYoDJ6gRsEKk?=
 =?us-ascii?Q?RZHqFofuS2hdpisbiQSGh63+cDIHzUupBYmeX6QiN/52Fl0gJpaB0JCQb/q5?=
 =?us-ascii?Q?gs6T9ANOQNYXtY16UVkNnGD6vJwF8hUYIyZpV6eB/EmwHMOlw6Zd5U1NRF1W?=
 =?us-ascii?Q?N1vGG0MPVKB1mHgPQ3/05p5uGDepgNiwEtdK0ilAuSGS6RjSIqKOecXIaC2g?=
 =?us-ascii?Q?ww=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 7kbABXC1bpKf/GPBIwqWBUcRX8C0ERYZUVMZW1aahdKNYcKdP/huF+XyidUD73SyNBeQxh8Be+ylSIPWN1SAE5i4lOleaa+svcY29cxlCHwm0v1zTRlXKGa5QaUpRa1aTpqR0d71wvG7VYgYYmJ4d4w1nUt6ttFyjGbyR7yYlpmgLxXLOp0kkXwX+cKQQ7SZN3bBbS//3ekGiPY/cYWcpHQMEzYUVJOTvzvp4InslWatD/7TXAzLB06C6/IdLZd7AC4+BY7Z7vLHRAssgbwNPgv4/KiAk4VZPJBMPwTI7B9RDcfbWfdivlQMsdjn4s89hN6KMq5b+vazkNERyeoAIeyIEPNooztqmYrFBJDKYlFlDc6bFr9i5ZtTCKKqks2THdsTNlOSgvT/Dw3/oL5y5bcbRk3vo0a3IB5++yLdQFElfEtvvIzf1HKPXJaXYTmii+qwNRhIMWDML+/PdJeAdVxiOwE/w7HaScTYPPHbfR5c6lA4qomIrxSNt9+kA+JrLoUJuO+v+tOe3IsBZjdkblrebDCkPLSaOXjx3KMvGZB8Eqv7NxfGPYRqHVaG5p8EnHNyYJ2XRkaqCTdfwwKOn7sd61UfkXivRxNYUu2HwD4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 674f713d-3757-4239-8376-08dd868c1407
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 19:37:14.7260 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /NTLHYRp+2zznrxA4OtuTUEz2UYeHv9gpeumLaabm7LzVExR2ESJhCaoTsSSAvv3VUa3X4bF+/x/HadOxOyA99E28AMHRmzOScRwWF2IXig=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6667
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_07,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0 phishscore=0
 bulkscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2504280157
X-Proofpoint-GUID: U17ajDCsuSaYW0qh30Tqxzr25px05SNR
X-Proofpoint-ORIG-GUID: U17ajDCsuSaYW0qh30Tqxzr25px05SNR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDE1OCBTYWx0ZWRfX0tGWmwD+mZGS
 Zf4WsWSTub7TyaC5SqkkdAqTCqxH9CH/QK3BSdij81BAoGASaeTd6MR3s309Q3L4f4cB66wvvSz
 X/ol0Opf6fPaQH6VNhG7UnXm6XgSaQ5uyWDpPX2C3rwIcoZGk2QmPGSKo9YVEuFMl/zCqcf9+q6
 z6Epm2/vAdmcKt/x4PQzLVPYx1ZLudDafoMnIDpjumBIQZsKEzfUYt0QPtf67ZkGLJl7af5QIDh
 NaQ/h0MXIrzMmtEH4Y+A0fXmObPk/scowuqeEqhvSrXZGiRqoZm3FNonHdCN/K19x+QzhCCbdXA
 /iF9b4B/+hrE2HNojiRhknGLUcVn5reAa3LBk2VQx8DotuE0+ZIVlT7UfrLXLDGLDbfDlUhrHbm
 Rp/dFG7d
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

On Mon, Apr 28, 2025 at 07:23:18PM +0200, David Hildenbrand wrote:
> On 28.04.25 18:24, Peter Xu wrote:
> > On Mon, Apr 28, 2025 at 06:16:21PM +0200, David Hildenbrand wrote:
> > > > Probably due to what config you have.  E.g., when I'm looking mine it's
> > > > much bigger and already consuming 256B, but it's because I enabled more
> > > > things (userfaultfd, lockdep, etc.).
> > >
> > > Note that I enabled everything that you would expect on a production system
> > > (incld. userfaultfd, mempolicy, per-vma locks), so I didn't enable lockep.
> >
> > I still doubt whether you at least enabled userfaultfd, e.g., your previous
> > paste has:
> >
> >    struct vm_userfaultfd_ctx  vm_userfaultfd_ctx;   /*   176     0 */
> >
> > Not something that matters.. but just in case you didn't use the expected
> > config file you wanted to use..
>
> You're absolutely right. I only briefly rechecked for this purpose here on
> my notebook, and only looked for the existence of members, not expecting
> that we have confusing stuff like vm_userfaultfd_ctx.
>
> I checked again and the size stays at 192 with allyesconfig and then
> disabling debug options.

I think a reasonable case is everything on, except CONFIG_DEBUG_LOCK_ALLOC and I
don't care about nommu.

So:

CONFIG_PER_VMA_LOCK
CONFIG_SWAP
CONFIG_MMU (exclude the nommu vm_region field)
CONFIG_NUMA
CONFIG_NUMA_BALANCING
CONFIG_PER_VMA_LOCK
CONFIG_ANON_VMA_NAME
__HAVE_PFNMAP_TRACKING

So to be clear - allyesconfig w/o debug gives us this yes? And we don't add a
cache line? In which case all good :)


>
> --
> Cheers,
>
> David / dhildenb
>
