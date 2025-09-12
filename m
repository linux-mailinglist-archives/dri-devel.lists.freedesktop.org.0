Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD07B556DF
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 21:25:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13ACE10ECD7;
	Fri, 12 Sep 2025 19:25:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=keysight.com header.i=@keysight.com header.b="2qS1EDqy";
	dkim=pass (1024-bit key; unprotected) header.d=keysight.com header.i=@keysight.com header.b="b1gwa/++";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-003cac01.pphosted.com (mx0a-003cac01.pphosted.com
 [205.220.161.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 553F710ECD7
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 19:25:37 +0000 (UTC)
Received: from pps.filterd (m0187213.ppops.net [127.0.0.1])
 by mx0b-003cac01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58CJGCxs022483;
 Fri, 12 Sep 2025 12:25:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=ppfeb2020; bh=
 6zTM/B0kNdlePWa+XW9hEUBx/zCfQwspIQo61wg5jBU=; b=2qS1EDqydfE3LEdy
 6Gd/oI+IP86SB9shfDNsIhQopdxbaSE3acnvUKvf/PQcfx+qUUAHsbUi6a2W4Dfu
 8QM9u7WO/yr9LUVB3vO+qEF27hNqiMXTQrLUmkBxR85K/joI+7WjRfg5yn0cAuVE
 ZOwTNT9ztbj7jebzBMjfqbyE487JgIElm2gOuWy0mneS5HvaztFIOgrbFwlPgfCI
 G+89Ok97dtR6XB7/r+jhK9ZXMq0mnxbESvjYqUEBS/DYj5z5JGXg7zEvsbcNc8KS
 OTqxbbnd70WbV+YKr1Gq1AA+5cOtsPrEvbBNgwiY3yRybjJydnrWfMUmRm83ZOnF
 QvRUMA==
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2048.outbound.protection.outlook.com [40.107.220.48])
 by mx0b-003cac01.pphosted.com (PPS) with ESMTPS id 4937hrpvxc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Sep 2025 12:25:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OSOPNZKQ+eH9DkgSYqOLovRGognRVcc3H3UJShZdIJ7KQYLvQKwa8XH1Cp5Ptfv0zerPZZziSDWwggPl7u6p8uBpVTcJNAQWNEFF2kiFoi6x8wMhpjyLjBlKukEOklvXBOFsWK+n9q8jmGPeZUJxzGijpu+51zbLlizeTROEnKmwHmtjsc1avMZZ/fdmPPSIaiRFUBvViFESRrRz20yqYh7I+Ef3cB6JjzRJJeR1HoZLUZ9sP4pEdDnD4i7Ehig/fj6QbcwtoKHpcjSqBWXUwEP1zb3UNSfMEPjoIaxdBkWlx9zn2yZWnEzmIlStGjW4nEsOEvqjRUGPi6sZ66ICSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6zTM/B0kNdlePWa+XW9hEUBx/zCfQwspIQo61wg5jBU=;
 b=XjAa0FShtKMgn0ydgLfAsTmdJSXAbs3WfqyY2ptdxkuResPDdi5Qe30iPc+gDUs0SVp84qIRM9H0/oZAAQNoS+TxCOTXW0dLWKQD6papNGMNZ6rP+3vKRqCnfgGMAR0faNECVrFMVwxk3agzLV2H7xsojBPDugt4Nrb02OP0G4R5dZWzVAKAcPvUistxzYyMgfkrQptoU5umbUcksslPSEHbItSsZyjZ9qDN5LNjRan68z4cbKc+rFP2l8+n2mawfUv26SWWybiIdcZ70BukPWVz0DUUfHanfQiEAwi8OwUf5tKMxNPUeQ5AeCpSD7t+1hYoQ4RpQFz2Kfv6No0D+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=keysight.com; dmarc=pass action=none header.from=keysight.com;
 dkim=pass header.d=keysight.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6zTM/B0kNdlePWa+XW9hEUBx/zCfQwspIQo61wg5jBU=;
 b=b1gwa/++4nm3KcxUSVEFe7olorOMxOB8AaaM/9FVkmYTt5Vd4k39qxm+LlVd28J4HKx9k572CjYjjpzDzzSETp3iPLWCyKC0W432rOgeUUY7iJq4XOopV2Oi6PnG5eIFMhrJftj4BiBbz9tkvVzJaBpcyfU1mWza0pL4QhvCSfE=
Received: from PH7PR17MB6130.namprd17.prod.outlook.com (2603:10b6:510:1f5::17)
 by DM4PR17MB6939.namprd17.prod.outlook.com (2603:10b6:8:181::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 19:25:15 +0000
Received: from PH7PR17MB6130.namprd17.prod.outlook.com
 ([fe80::54bb:3a4f:5f80:a51e]) by PH7PR17MB6130.namprd17.prod.outlook.com
 ([fe80::54bb:3a4f:5f80:a51e%5]) with mapi id 15.20.9094.021; Fri, 12 Sep 2025
 19:25:15 +0000
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
Subject: [PATCH V4] drm/bridge: ti-sn65dsi86: Add support for DisplayPort mode
 with HPD
Date: Fri, 12 Sep 2025 13:24:57 -0600
Message-ID: <20250912192457.2067602-1-john.ripple@keysight.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250910183353.2045339-1-john.ripple@keysight.com>
References: <20250910183353.2045339-1-john.ripple@keysight.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY5PR15CA0227.namprd15.prod.outlook.com
 (2603:10b6:930:88::25) To PH7PR17MB6130.namprd17.prod.outlook.com
 (2603:10b6:510:1f5::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR17MB6130:EE_|DM4PR17MB6939:EE_
X-MS-Office365-Filtering-Correlation-Id: b31189ae-d3ed-4d9f-acac-08ddf23219b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?d06ZAw7WAZczG6xj6Zo2opfL0Bxpe8A/brQ1fL2GpIb6yuNHQJUq3b+HcLDZ?=
 =?us-ascii?Q?1II1arw6carBE8t29+5tMFUuozU068jhBjjv7e7HEAqnAT/+Bdg6FzmO32F6?=
 =?us-ascii?Q?ukJrup1nxjFMjAVLzTQisIx2v9EjqrowAPuQY88RMJG25t1fvVAFu9eLZB/9?=
 =?us-ascii?Q?fKsQbDXiZQFnvERIkoUz87usXvjoM4hhxL6RqAELhD9zcj1hxXfOMtvNHV1h?=
 =?us-ascii?Q?EF3Cd/TGmicsVCfCF3sKA94FM6WaudY630eLnQpbCsHEOJ0ypqhvcFGDWKK0?=
 =?us-ascii?Q?I1lnI3Fts2wc2M4RsKHJp7vh3MWPWjmeE0+9U4fYGa0Kk0mkk814uHPMmT+J?=
 =?us-ascii?Q?LIYO4KwfIElon5/pXd5TQi/60z5n6e+n7IC3JibxUYNpiBCeClgUEKAJs/HB?=
 =?us-ascii?Q?aU7tYXfkAND0bj4s9LOHbaCP8iw/SJ2gp/Vm7Bemm+jxEj1VsyIEkBzd+B9D?=
 =?us-ascii?Q?CD5matJM+RZa9IZPH1cXZcmAgk8r5bW4bLSYTSZvc+Ge3Rw3QxYyunfIKV5u?=
 =?us-ascii?Q?aTd5Nzjfmc0HSuXqdxc1Xa+K3pmg/hL5tV1o35prc46YxS7uNqcNQ/65nbc2?=
 =?us-ascii?Q?5uUoUbV+dbeySFLs9/qho7jiXRuq3Iygagk+27/T2LTA1GueFz+ozepfBzOq?=
 =?us-ascii?Q?8U7B46vNNaZx1MnzOuGDq9Advp5GS5zbcFKiEBh0MEpGef8h6zttX20k3thz?=
 =?us-ascii?Q?My73OqdawwWZiqtkc1FnjQGc1OTsWXLEdtsbrK3+iy/VmT3h8GcT+5MVK2Gl?=
 =?us-ascii?Q?gUJjs7RzMp7dSw+OgMbT1Yj6TWypKHZXrj4L3KKOWqb9NRJyOScfw1uNiiEN?=
 =?us-ascii?Q?b+k5Ibt9365Y91qvXRkirQjbd9NH+N61+bdzINr+HFZRdMxaJEZcanjVxNDF?=
 =?us-ascii?Q?IeiVZpUpUOHRaGoTC81VxUD68R/vhHnkATgarZ9sg7DoYpqltSAn0G/PAEwi?=
 =?us-ascii?Q?nGlv9sAk8fSH/514idW6vNA4aORRgZBThtjKBOPNiPV6hiowlzwZCOBMC3QG?=
 =?us-ascii?Q?3xIfeKH6fW+I7G7TooiCbUhqFrRtv2oYMCEErqQ4A8yQ9lE5pWnfvDa1SqUf?=
 =?us-ascii?Q?8FGD+BT6gvrvkTfp/o4OaTHWFAw0BDjZHRNk9IDedMP0SeZPC5Zj7RNiUOGJ?=
 =?us-ascii?Q?onQzYxJMmk5LsyyeoQ/HplzjGf5Yb13G3naW7V5D2ib2en9j7m2Kqb6Zq6Sz?=
 =?us-ascii?Q?5XB4+AzCCon9+tucHuSy3QULw0VYHPjICEHHChtLvFZI2bAih+s7+NIJCZGf?=
 =?us-ascii?Q?9JWg3W1jZfy/YFAlsqF6c9mS6iFDoJC0OsrRksH6ZGUMakt/jseRM+DcstsD?=
 =?us-ascii?Q?cZW33rwIL85KPA95SKc+A8d8O2XR4rFuL1mMQyXcfD/DZLWEook/FSmS7QiG?=
 =?us-ascii?Q?bD653cAcFeI7XwojXXbb8KJ32+UnJFB2tlCZSx964+sA4BAP27uooiJ8YvX8?=
 =?us-ascii?Q?+ZgL0OlilMc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR17MB6130.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rL0zfIdlrjB5GDpuWWLtN1pmJtEJ5dkgSQN3adQ+N6ETmYTl5SCuf/HU9Rnc?=
 =?us-ascii?Q?ZvwoKFBSCiQ07Vh1ba8xes87mAqlwmXrv0H2MXHnib/oH8ciFtoEAzXQ+cmQ?=
 =?us-ascii?Q?Kib2VUZDQ3Pfsy0lgsOnauRlvRK5fX6ra0w6THck1Gzn6PIZNl+FwHJ4n6Fu?=
 =?us-ascii?Q?aG3QnfjxlM2ogK3jW528wh7+5YFiLgoiO9lgyDE4E6z7qOGS/tyuSQBXJYYj?=
 =?us-ascii?Q?HpeiUUGE5K7qRHL8xMlVbuqsxLxLirlQRZt4Dret/jPwdc03zdb4n4nkJN4I?=
 =?us-ascii?Q?6O+JQpgRjNiolB3B3Uv66+of/tU4Mo4EC+f/gSFnBlL+wB2a/TCgihGUTk6o?=
 =?us-ascii?Q?tpBA4e/PywYVe7V9lq4EOnzd6eeSEP/hWBKy8I0LFV5S8xYhLKLnn+s7B+7C?=
 =?us-ascii?Q?vIhedWzl0jgMLrcHP4UADAQcY5opEqEqrSYG5ePBQ3RDYoNBMZuL+HvX6v9m?=
 =?us-ascii?Q?umdmeQW8+4VE1tjKZf9wJ3tASXeMe+jRtjzbQswtrzEuevMzo/6DbNayO6ll?=
 =?us-ascii?Q?JP3YXCmIRZdXNf58rJfox1pol50efhqTLfDB5ntZr9DEKsz4DZWVJtS/6KXf?=
 =?us-ascii?Q?wsY22OnDvOqLp9dHpgpP6AxhyZsjqObgeUHDWtHLQMFV0CHQ1OMBCeJoK9/q?=
 =?us-ascii?Q?c2RaXQyhDW1Gr0T348eKgE/9ss8NYVaeS5bhltUbTROfyiE0gmD0kOsXCckt?=
 =?us-ascii?Q?Y5EbJmc3Q3uGz7qKEQPi6Uhv+WxPZki4r1QQ4O8i9ESPr2VSgS5XQx7ErDqt?=
 =?us-ascii?Q?tIrYn31LbdQiyKG7gN5qQSKZ/yoDQ/aJ53ln9+kUDCOiVtT9ToQiQaPjmTdv?=
 =?us-ascii?Q?/d0TxUwo9KGFX16afz7xKbiN2KM0RO1dp2KOLryCaCzCYM+ypdfVB/dXndur?=
 =?us-ascii?Q?k9Osrbx4y6xkQlHKUx+3BghuZ/4N5U3/Y+VzLDEy3wAcpdQ1s3BPfSh+9+Qc?=
 =?us-ascii?Q?NOmtuLcURH+2JSY/TF4ooVBwXYcgXcF+QfVwqiHnU0LI14ePTnzWsAb4okUf?=
 =?us-ascii?Q?IBXwaZZ5K/HAfXg4yrPoT7xIIuW5in0/m8SHmcfT+IAmmZQkHu4ia7jAM/FL?=
 =?us-ascii?Q?/1koQfsrMrYbN+hHt87S4JqYPWakvpSfcMKr+G3MF8ggU1IaoI9x4NyZQ6dw?=
 =?us-ascii?Q?imEswU/PPSFDd5BkaySsrdVRx2C4lxZrAkPf3ndl6I0/mPZUxN3qjolarTdY?=
 =?us-ascii?Q?f06V0C7tyYuyAoTxI286j1crHXLcEozGR/Jo/yZ8YDjCaXrq6P3hQU05tYCc?=
 =?us-ascii?Q?OWbLOYGBIa2zbqRN+6hgbOfWaQ+M1LjM4pFj7jAhAKU4K3GLIk883lQrXhvw?=
 =?us-ascii?Q?Bl1u7QPDf6SBs5oHeNC0xqwmH77ipnLmmBQecqFKuPcBXc/MLLmlfVDNdNrq?=
 =?us-ascii?Q?fgm8ZuSKjHjLxqhctNGZjSPrxdMn6tzeF3kH1AqJW4ukUrrSUYbnWIkkGCkh?=
 =?us-ascii?Q?EYfdzmvqo9/KgHoXWOQOlFTa6utxkZgd9OSikacZzjZsmkCt5Pb5yvRCm6Eo?=
 =?us-ascii?Q?rClO8pGEJftF1onBxnKK6mmkeONNIxe0LcIHVk5tG6TDioQrfzQ3bVzPo6DN?=
 =?us-ascii?Q?IJctnnugx9sSy8ScRd47xSEo3aTsyiEbtSvR0UfgmP8WYId4h2efAFVlkfV8?=
 =?us-ascii?Q?9A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: U7+oxlcdohWqyFlZeXOjFUIYz40Tp/5OWK7uigOyw2Wdv7w4wf4ZzMQSOcw7NUtym9HAFUO9PQPhSkvw30eOlX7f6La4OsB4KgZnZBZ+ZOQsf+Sz5LZu8TSKI5HA3Ud3S7qpinP/rcOfD6PT4i6NxBgW5sptBo9/aWU/OCYIpVR8rPCfLT/J44mzx+gh3Jlw4u7BEsJhsTPD0TscoMY/XoljIg/6XodlIBnJZxvuGC+vJfwCvDQMq9esztrRqL54weJ+RKrU6GWNQGZURizDQBvc9ztz+z8waLLxpkEubvJy7jZdrTXKBs3GzAmgAIsXA3q3WhhO5DFcuok0xjDJHpA4ykQ+/sYTb5J8jirvO0SyAgbyTHusE4HEj53jW6f/CNUuE+0GnVD91ADWYy0cRRhKvcEF0CVwzBpxbRRTCwzVJpKz56CBSf0fYtTCMbgrY6zclBm4mzCNwzrQitU2lXYoYbdXK2OnoDB4h31W5pLLxS2xUGa7kx/frVTVINg4syaDHyIpB8nPXrbCYLMJEkoXy2EpIgksU4E4cfYCKgkAVPOwBVmKi8UCV+dFTuPvHiqUzQKYzQ3BqEyZ+ptph7PbSrmqhtbEn1ewecpeGaH7pw5KeqHJInnlW2rmEx7r
X-OriginatorOrg: keysight.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b31189ae-d3ed-4d9f-acac-08ddf23219b4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR17MB6130.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 19:25:15.1640 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 63545f27-3232-4d74-a44d-cdd457063402
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oDn1Ls3GnEyNbX5ppmTF84VZWr9LWoCKhv2lmk3fhnJWqwfJSe5W0TNXfxHryfGUjZrq+7vqOAr3YkraTQiQiIHv2/Y16mPHvYT4QuwwPS4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR17MB6939
X-Authority-Analysis: v=2.4 cv=UKDdHDfy c=1 sm=1 tr=0 ts=68c4739d cx=c_pps
 a=TZoYUOSjQ4LR4/tQgtptEw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=vu2TTH8h0NUA:10 a=F6MVbVVLAAAA:8
 a=NYnuEPRvgIRkhLNBil4A:9 a=6mxfPxaA-CAxv1z-Kq-J:22
X-Proofpoint-ORIG-GUID: 1U5AiWIsD35BnfwgklD7x4lVt1Ae8fgV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEwMDA5NCBTYWx0ZWRfX6Z7mH/oSV7Ku
 1cfXNaapyhGVruJtwG96bsNknqh/hsoIJhIbL/I5b7TZvcA9EFe9v1AArd+dFt4KNUjsrXLDo1+
 CTqhrQVJrNX73/fWBdyym2Q4lYMYB/iGqpW/A9I0E0tqVfvrQur+CmZfx6JmJsybm/dhlBITs9I
 BVf7LPnv1Yi4t+hqru2rqREuL9HZ4eHl1SazQlaKDSJeoa0tklDKzCI9EGrLAAPz3uqRRfLABZK
 9sftE+s10tZd3YRvF4MZhmRDWYfZNteDe6qWGn0VAJrALbE0aFEdKXAWvwUK7e2GWhV/jzgl1Nb
 BmJ4iOI/lEscw8tvDgbF6QnDPKmeNZa0cb1vpp6pxtUGZHS8H291noGfq2MxEjLwkU1fZxniFWN
 4UkG25Oy
X-Proofpoint-GUID: 1U5AiWIsD35BnfwgklD7x4lVt1Ae8fgV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_07,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509100094
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
V3 -> V4:
- Formatting
- Allow device tree to set interrupt type.
- Use hpd_mutex over less code.
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 110 ++++++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index ae0d08e5e960..166920b2fcc7 100644
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
+				u8 *val)
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
+					 IRQ_EN);
+		if (ret)
+			pr_err("Failed to enable IRQ events: %d\n", ret);
+	}
+
 	return ret;
 }
 
@@ -1211,6 +1251,8 @@ static void ti_sn65dsi86_debugfs_init(struct drm_bridge *bridge, struct dentry *
 static void ti_sn_bridge_hpd_enable(struct drm_bridge *bridge)
 {
 	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
+	const struct i2c_client *client = to_i2c_client(pdata->dev);
+	int ret;
 
 	/*
 	 * Device needs to be powered on before reading the HPD state
@@ -1219,11 +1261,33 @@ static void ti_sn_bridge_hpd_enable(struct drm_bridge *bridge)
 	 */
 
 	pm_runtime_get_sync(pdata->dev);
+
+	if (client->irq) {
+		/* Enable HPD events. */
+		ret = regmap_set_bits(pdata->regmap, SN_IRQ_EVENTS_EN_REG,
+				      HPD_REMOVAL_EN | HPD_INSERTION_EN);
+		if (ret)
+			pr_err("Failed to enable HPD events: %d\n", ret);
+	}
+	mutex_lock(&pdata->hpd_mutex);
+	pdata->hpd_enabled = true;
+	mutex_unlock(&pdata->hpd_mutex);
 }
 
 static void ti_sn_bridge_hpd_disable(struct drm_bridge *bridge)
 {
 	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
+	const struct i2c_client *client = to_i2c_client(pdata->dev);
+
+	if (client->irq) {
+		/* Disable HPD events. */
+		regmap_write(pdata->regmap, SN_IRQ_EVENTS_EN_REG, 0);
+		regmap_update_bits(pdata->regmap, SN_IRQ_EN_REG, IRQ_EN, 0);
+	}
+
+	mutex_lock(&pdata->hpd_mutex);
+	pdata->hpd_enabled = false;
+	mutex_unlock(&pdata->hpd_mutex);
 
 	pm_runtime_put_autosuspend(pdata->dev);
 }
@@ -1309,6 +1373,38 @@ static int ti_sn_bridge_parse_dsi_host(struct ti_sn65dsi86 *pdata)
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
+	ret = ti_sn65dsi86_read_u8(pdata, SN_IRQ_STATUS_REG, &status);
+	if (ret)
+		pr_err("Failed to read IRQ status: %d\n", ret);
+	else
+		hpd_event = status & (HPD_REMOVAL_STATUS | HPD_INSERTION_STATUS);
+
+	if (status) {
+		pr_debug("(SN_IRQ_STATUS_REG = %#x)\n", status);
+		ret = regmap_write(pdata->regmap, SN_IRQ_STATUS_REG, status);
+		if (ret)
+			pr_err("Failed to clear IRQ status: %d\n", ret);
+	} else {
+		return IRQ_NONE;
+	}
+
+	/* Only send the HPD event if we are bound with a device. */
+	mutex_lock(&pdata->hpd_mutex);
+	if (pdata->hpd_enabled && hpd_event)
+		drm_kms_helper_hotplug_event(dev);
+	mutex_unlock(&pdata->hpd_mutex);
+
+	return IRQ_HANDLED;
+}
+
 static int ti_sn_bridge_probe(struct auxiliary_device *adev,
 			      const struct auxiliary_device_id *id)
 {
@@ -1931,6 +2027,8 @@ static int ti_sn65dsi86_probe(struct i2c_client *client)
 	dev_set_drvdata(dev, pdata);
 	pdata->dev = dev;
 
+	mutex_init(&pdata->hpd_mutex);
+
 	mutex_init(&pdata->comms_mutex);
 
 	pdata->regmap = devm_regmap_init_i2c(client,
@@ -1971,6 +2069,18 @@ static int ti_sn65dsi86_probe(struct i2c_client *client)
 	if (strncmp(id_buf, "68ISD   ", ARRAY_SIZE(id_buf)))
 		return dev_err_probe(dev, -EOPNOTSUPP, "unsupported device id\n");
 
+	if (client->irq) {
+		ret = devm_request_threaded_irq(pdata->dev, client->irq, NULL,
+						ti_sn_bridge_interrupt,
+						IRQF_ONESHOT,
+						dev_name(pdata->dev), pdata);
+
+		if (ret) {
+			return dev_err_probe(dev, ret,
+					     "failed to request interrupt\n");
+		}
+	}
+
 	/*
 	 * Break ourselves up into a collection of aux devices. The only real
 	 * motiviation here is to solve the chicken-and-egg problem of probe
