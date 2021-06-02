Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC7E398CB4
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 16:25:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 463BE6E402;
	Wed,  2 Jun 2021 14:25:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2078.outbound.protection.outlook.com [40.107.96.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFAE76E402;
 Wed,  2 Jun 2021 14:25:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AFHhwrFgylGAyJb7CRdA0vlQXy4B/sra1SW3MmCrwHpixcFWdtJhTr4t/pyCyYMgmsgFHl009vTTp8bovil6HPVj7VbKC1Z35weM2g2myLyUzXdM/Dw9ap2P9Gyw11osbsnbkPQK3DXPqzsP/6qavVEx+5IOMDkYLsNUwoQfqAD+WvT/3F7xmRGbFAqF7dis97IdP7o7GRmh/KXTQpZz15BTklRPgZXT3QUD12dlEjbDsNIfH5InO5J/fJdZqk2Rh5O73f5SNFgRhGiw0XSYBBa9E9bbu6umpSliNCfw2huTBXMjwNSA5qlObda7TtnsGQxA4mCwpIWxxopJOjVuZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YefQREP5eQ2X7eJ+/WB6TnFrwATsHhPQlzwN0lmwwrA=;
 b=NftTT3MuN+hNR58cnTkZg1i8Qnj4tEAkKqB4jOtY+/0FDoUlZOKBWo/hSDPmSYTv11etWYbw6eDpI4ihVCqHlsD6w/2D5CidOX4VSFW30JOhxGzuzB2WsLZSVJ5OWdyX3hp07KyoTSEG4pdqp1hYnAlpJz8HTmYoTh1Y/1O+R0OOHWWs87ji0fxQThfoXZJX5Qu2rgSIhVPw1Ghf6AXCR35cwbiuCVNbENZcyo8hXwb6Netwz3/YGogEfe1otHmyMFwijDkoRcF3RF2Wg/uDwC92NsSerwBZCtgNvg7BTKxuDOSxX6RAYkjgIJ41a9QENAEEvlv+Ijd28nNCftM2zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YefQREP5eQ2X7eJ+/WB6TnFrwATsHhPQlzwN0lmwwrA=;
 b=jwGOVpQeRKacRpx4GH4B7EEZAPj1Dp5Si/JDdomXBY/MI606AcugKhTtgMt566TWJ1waWSwN7nQgdolURZn0XLR//2h/49glI8+yUZdQE+zUzPsAJ8qspuiKcd/5KMOfw9vjVz17HfYdVNkdvoeHYGrlq+PKgxO3QZK2KwpmyCI=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4494.namprd12.prod.outlook.com (2603:10b6:806:94::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22; Wed, 2 Jun
 2021 14:25:38 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 14:25:38 +0000
Subject: Re: [PATCH 2/7] xf86drm: Add function to retrieve char device path
To: Simon Ser <contact@emersion.fr>
References: <20210601201702.23316-1-andrey.grodzovsky@amd.com>
 <20210601201702.23316-3-andrey.grodzovsky@amd.com>
 <U1jbBlShrcZ8K1YtOccahqFpLii9JX-PhuZmcM2FgL-b9armKhfJq5kTFTK7JgQ0afiD60tXAh4nKuG3a7s83ezZA51uVPlFGjcLOusaiLk=@emersion.fr>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <9309c571-9c20-cf52-14c8-8a8afb57ae2d@amd.com>
Date: Wed, 2 Jun 2021 10:25:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <U1jbBlShrcZ8K1YtOccahqFpLii9JX-PhuZmcM2FgL-b9armKhfJq5kTFTK7JgQ0afiD60tXAh4nKuG3a7s83ezZA51uVPlFGjcLOusaiLk=@emersion.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:8571:b12a:bb3a:4df6]
X-ClientProxiedBy: YTXPR0101CA0050.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::27) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:8571:b12a:bb3a:4df6]
 (2607:fea8:3edf:49b0:8571:b12a:bb3a:4df6) by
 YTXPR0101CA0050.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.27 via Frontend
 Transport; Wed, 2 Jun 2021 14:25:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4279ee2e-6596-4333-506d-08d925d24af9
X-MS-TrafficTypeDiagnostic: SA0PR12MB4494:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4494E52BF5E77D9306478C10EA3D9@SA0PR12MB4494.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S552NGmCarcRDqqDKs8SNUVJnHyXRV+49hDCqvmuuMeN+R5qCx2zb0ZG/oXClYj7y/eecbAbTnEG8qEjshjFBeiPIFsgXvnUSJKyAb2fpIrf1iWzdvgQt7JwUQjCcgm1dxltZwV/8lXy2Ib4v6qSd31y2nEtOYFTyxhFqXiO+wB+ANux/WRViCak9W2yd9MJDOi4cWi/mQpeDprJIFyYgFZhVbXrG0o0fLciNl5pMyS+kQNCV96YQ1xnqXmbPe6avccvvYYU2q8EorFwUpD5ANbOL//ym7b4ysSrIErCncMmVOauH3LwVS4kt9ugVta2NGG114Dw2iKcNyh2GOdFqumdzQBYBZJSNpkJpouMJuhLkOg9Gs0ojpWWJCTuZGwnwPTgComO28QkkIs5Ik7s8mzEBNoe2fA9K2YMggP2GHBXFRi6sW7KXqywIHHg8qyicMpun47xf+PDex17sC8gAa+tzKvNJnswKZY6lCV+wB92Jn5VxbDUxiYkkd7EIBCmWkMX6XUVJxgI3+/1vStU/x55XBDMdIa/H/9KEV+5EIRweFaiEerbGl3k+qMiU217dFvUrWs2YNWUm57VyTphhp2EGOIcg7EFb7DDSmyzzrmqAmXe16ZQCW11jcfxumtbY2E6R0Nb8832suJ/jl2rAqnT1WWiBi7yoz7SDArpmZLHdjoHQOUfpGPMDcZnCTfT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(39860400002)(376002)(366004)(346002)(31696002)(19627235002)(8936002)(8676002)(36756003)(478600001)(44832011)(2616005)(38100700002)(5660300002)(66556008)(2906002)(66946007)(66476007)(316002)(4326008)(31686004)(86362001)(186003)(52116002)(16526019)(6916009)(6486002)(53546011)(558084003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZWxiT3pkTWQvSEFpZTRtdFRxVENucHkrQ2tIQitxNzQ2NUh5V0hrSnF5K0xn?=
 =?utf-8?B?Q09yQVBMbktOTHV1L0wrTnFLNWViQ2piWmxaRDhsUHpJVFB0VUNtUFlVVDBO?=
 =?utf-8?B?T0lIZFZiRXkvUG5mT2dvN2pzRkNQR1V1WXFOeFVodDI5bDlmQSs4cTNvTmRN?=
 =?utf-8?B?elRSam8xTVA0K2oxL2MvVU8wRFpOeU9jWFk3Q2Zlc2ppSERFZ29tR29qWThN?=
 =?utf-8?B?d3BQK0tuV2tLOWF6QnNZUGJYcjlhWWhtM0l2TTB4U0Fmc3dSY2FWMVk2N3hz?=
 =?utf-8?B?azhoaGNQRUJKaEpCbStaUjBqT0wxZ2pBZFlxYklhcVdlZ041TzhjWUZPWENs?=
 =?utf-8?B?Qmh3Q0xKOXhheDlrc21EODhqOHNadlRTWWpXeEs2ekpPcFMrMmpndEs0akUy?=
 =?utf-8?B?U2VTNmRJUE40N1FuR0oyZ3h4ZHdieTNLVGVpYkRnVHFKb1I0Nnl0YTZmM2VY?=
 =?utf-8?B?UkloUFUzYm5EaTNURjEycjNlekNnM0l0V1ZyWUtYQ0R4Y215b2hHYWFRZ1hQ?=
 =?utf-8?B?Y283eTBvejhiS2s4SXQ3NXV5Z25FSWsyUjB6NzhJakxHUVRnalRHc3hVUzg2?=
 =?utf-8?B?eXRQaHowc1lyamlqc0VPTmZDandWMWk4SWVJV1hKd3M4SjNVZzVIazRpM0JJ?=
 =?utf-8?B?WnRMK3V1T3hIeSsySkNLYmZjdEYvTkxzd2l4T2dudEs2b1lzU2ZHWmJucVdB?=
 =?utf-8?B?V3VMSS9FMk02LzFTdmlScVdOczRaNm84SHBUZlVFRDE2YzVsSW96NFpmSnc0?=
 =?utf-8?B?eEVuZ1JzSllGMUJDNGpvTWdQMzdLb1NJY3BYdnlvVlNlU1huNnJiMTdCVjdk?=
 =?utf-8?B?Rlg1SEJnZk45d3UxbEtHZnVVbGtpYmhMMitnK2w0azBtRjJaMkFMMEhlSmFt?=
 =?utf-8?B?T3Y0NlgxQXROVS9CTUF1c0xkRGFRWVRwTisrL0laQjRqR1VsTHJKVWdJcUp2?=
 =?utf-8?B?ZHFTdGdMUUs2T2FGdW05REFQc0NwNFhZYktpeHhoVDBiWUxlQVNaMnZWd0Rh?=
 =?utf-8?B?dmNOUUh5YVBkR1hQQ0xXQ0dVWkYycWpzaVJKRE1OUkxCRnl5alFmbm5CQlpO?=
 =?utf-8?B?RHVRLzluN093M0Y2Vk1wdytYdWp4Z3VQbE9UUUJ1NUdQemVMWDhNdVpYVjJ1?=
 =?utf-8?B?WERVdmU4QUl2OE43YVN5bkorbFZiMVNQWlRNVUNqalZORHBkM1U1SzJOMkhx?=
 =?utf-8?B?RGRuN2hMUWxUb1BsaFdPbVZWdDloUlRtS2U3Qlg4cHZ0WFhzR3FHKzdUdEla?=
 =?utf-8?B?RWhGTnlBamFnT0NSNmxmVVlTWmdMQjcxeEt1YjMvZno5YytHMnhBQXg2ZEJ0?=
 =?utf-8?B?ZGVjTWlBM0U2TUQwL2dVdG9UTzZXR25RSXFnbkNrTEEvaThCWDlncll1MkQv?=
 =?utf-8?B?Q2Zpb3kycjQ1aUovU2JrZkxGVDFNL2xzam9XZllZUm9OZkxVeHl2b2FFem5H?=
 =?utf-8?B?MDJkd2VEUDdFYWNBeFRKUUtWNzFadGVXVG9QL3BZRlBKTlVJMTlQeTc2cVZW?=
 =?utf-8?B?ZDJ3NUZNelF6VDdDVHM2UnZFY3BKTU9SUThNbFNrdkxlRlR6ZU52a0R2QnlU?=
 =?utf-8?B?eU1YLzYxWDQ0VThET0cwNmhXSU1iRHlIYzBEK1NEMDBnblFCUkN2b3V2RDMy?=
 =?utf-8?B?QXJoRWFxOXhoN2RkWXBGOEMrYzdjK3JNVjhhYjJYaVk4dEc4ZlRtSHJOTmho?=
 =?utf-8?B?cXlDajFQTW13MnduNkFWVkhxMzJpcnhNNE5MSVFHaktOV21DTWl3aUp0WGlM?=
 =?utf-8?B?bUdxeXp1c2J5RkRmSTIrc0xmbm81NUlpM1F4aEwrR1h0U01pWnczWTRxZHJo?=
 =?utf-8?B?SUhMQVZtN3M4aDQrSTFHWVhpWnpvKzdTa1Y4ZzFMY0x3c2lyb01aRk4rdHpE?=
 =?utf-8?Q?CopecsQnVdrJF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4279ee2e-6596-4333-506d-08d925d24af9
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2021 14:25:38.1918 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jS+F6Zbdi1Ze24edL4/3NE+/k/xB50zBGoc0obXKtcLbxbez+Yv69reilrd7FwbzF7bFw6t9cshKXvrtW62yjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4494
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
Cc: Alexander.Deucher@amd.com, ckoenig.leichtzumerken@gmail.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It calls drmNodeIsDRM which is private function itself so - if i 
implement it in amdgpu part
I still need to expose drmNodeIsDRM. Note that this function is 
basically a subset of drmGetDeviceNameFromFd2

Andrey

On 2021-06-02 5:16 a.m., Simon Ser wrote:
> Do we really need to make this a public API?
