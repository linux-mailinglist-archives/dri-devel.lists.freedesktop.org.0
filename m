Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F3E29FF25
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 08:53:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BCCB6E962;
	Fri, 30 Oct 2020 07:53:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2072.outbound.protection.outlook.com [40.107.236.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7B556E964;
 Fri, 30 Oct 2020 07:53:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SNMAucOttP9vs4bo4dJueXQkvcevnYmXyx0uLHmg/5a20SsDGW43Xck72V2qD2/50osUPwK5dyE4bByA1rpiyZmd3AsKWBb85rw7yR9wAWFQLuvRsixrktaIYMgHu0Ey+TIIXNvWC2WwB0lCRFh1CngUOpFeb31E6b+sfKHZ8xB3Mw+dx0NYiBEFKLf1t7qdRoTrneNwFz3HO+S88716r8R9r2smgImEXXcNhF1Q17X/BR7qR+WBHRS7ToaR+Cuhez44slI6ckytwF4Z6FWjwyS734Jj0ho1p3avBTV+XXood+n7g0cM4LDS0/wE3b3IJ+sjIlBQNw0R0myy5GpcHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fzl5gviIFETWK+NjsJTopXHtk+UaM1dsBn2Zg6iI4bs=;
 b=XIOX5ax87fcLMvkyGLZwq3Hf4fkuDxBO8Adp8mI2yX0DBMuKlRXULHteulu3k6z0zAdb91QmQ3WEXZzSXJnHZ0OXIuQm5V9USTChbQF9zRed/1ZvmvQPl9wtkvH0i4EdcAczz+rZIZnTzu0r5ajooKnFTfmTkKVchwqPqgMhUhJyBdDk7kJYjIrKJWcgEgeeAOletNG7w+FDHuZw7DXz/jVjj68Q10iZ1COM6q57/M0NAWsy5t10dalP+Zd+WBVQBpSeBJw3HOBTHh3qf+XuwsoecmpeRPhyZ7PxyNJ0knj8vwXuXMhggQ+7XTBFU8e6rjXVkKYlm/+gLOR5xzKpVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fzl5gviIFETWK+NjsJTopXHtk+UaM1dsBn2Zg6iI4bs=;
 b=pEBiqpOeuYFp4u1cvoroD0DtShAU7tNA3+/1SVcmT2Qd5Raq3ZB3z5EfxhYQEAlvVh3cJ23+cVslt7iK7cVJzsIQiGZrwmHPNL/OMeDLvTvyldbwRVOtnwgvW2kIqTNnum/XZOi9rptpGtFjy2AUk8lt8AIzVqGZYHb9HPy1w6Q=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BY5PR12MB3764.namprd12.prod.outlook.com (2603:10b6:a03:1ac::17)
 by BYAPR12MB3269.namprd12.prod.outlook.com (2603:10b6:a03:12f::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.25; Fri, 30 Oct
 2020 07:53:34 +0000
Received: from BY5PR12MB3764.namprd12.prod.outlook.com
 ([fe80::21a4:4ed1:c6bb:5437]) by BY5PR12MB3764.namprd12.prod.outlook.com
 ([fe80::21a4:4ed1:c6bb:5437%5]) with mapi id 15.20.3499.027; Fri, 30 Oct 2020
 07:53:34 +0000
Subject: Re: linux-next: build failure after merge of the drm-misc tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>
References: <20201030110712.040bc95f@canb.auug.org.au>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <3c46b1d9-3bf4-9a76-5328-0fb3bb0b42f2@amd.com>
Date: Fri, 30 Oct 2020 08:53:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201030110712.040bc95f@canb.auug.org.au>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM3PR07CA0071.eurprd07.prod.outlook.com
 (2603:10a6:207:4::29) To BY5PR12MB3764.namprd12.prod.outlook.com
 (2603:10b6:a03:1ac::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM3PR07CA0071.eurprd07.prod.outlook.com (2603:10a6:207:4::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.10 via Frontend Transport; Fri, 30 Oct 2020 07:53:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 38d3431e-1ad5-499e-a138-08d87ca8e719
X-MS-TrafficTypeDiagnostic: BYAPR12MB3269:
X-Microsoft-Antispam-PRVS: <BYAPR12MB3269FE203325A0DB0098057883150@BYAPR12MB3269.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1013;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /FSlxOyKNiDpTqZMWCTo3ZSgS0RMknv1L8i8eJWtVelYyTfVNLUenhE9IwMKpAirL8XHlORdkiRuagEPG3KyZMxgnKX5WB5sb+DyXcVSlxFiZczvaViVEsSbrPeym3C3kaIoz2JNmZQ/FXzj8Y0ywKwFv3G3tM1W6QyJqF5hOgSReR5Swo/8M9C4jhfStT4ssugi1MEX0z4OIXrBRxssl2futtB5Q+8piiWAec7FxTd4gKAGpcyRsB7QfvZAUlHL64gDbkKTRYQ8tGo+XpXlCtnZSGEG3xHzMOJoUkH54k6M/MxuwsaDZwnTrOqfp4HsX2GFcBACvph49tR8Gde8xpvWFaobzux/SoiPsy24aQhnjmfLFa6wWfUvPRIKUVumDgEwzvsCg78WzpEYegh2Fqcs9v7ViaxYukVlHIsNUHM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB3764.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(376002)(396003)(346002)(136003)(86362001)(5660300002)(54906003)(16526019)(52116002)(4326008)(8676002)(186003)(6486002)(4744005)(478600001)(6666004)(31686004)(8936002)(31696002)(2906002)(36756003)(66556008)(316002)(66476007)(110136005)(66946007)(2616005)(43740500002)(309714004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: dgBjwBf4JXjQPHmBEdnDHd5P4S0TGBk7KmGPmE66EGtgmSLWJSar+o9rPqpnXSAhGkVBv89H7CZq6FlHjAL0MZUaCDSev3TnDJC0n44NxbX0CokyCFXb2UKMXsZ8rpy3dCyZd0pkqUlqipDRyl+rziMXbgNdeB4hsYvJkdZhxsSbfW55Qp+5hnZYFMImNXc+7xWm0ERn+CDgVvxs4Fz5IxNiCPWJFMMLD+0zDBUYno731e1/CBonXg0R7cFqvuGb2DD3P0iX1D6/vcQcll6o5q2mkVCDHj8EK6xHqJ+Ngpkp8SHENmMA95eMb7N3+HDP7+L7Dlqn6En2k393nKQ62Y5QE7U/PM2nlEERWSD0a/n90MktDm4Nr1caO100QwKw2kHfQR2cToiKvkGx/RZCSd1rJbrcR7cM3yUIC0I7jgGqyrAIwghuUCfwNa7aMul9026Ql5G2LpXkYhM+EI+s+5+99VDlRGaV+AdusIc5GDCJAd773l1jjQs+uzEoJE8jLSjNMxjW0jLH4gsbTz+1wjwtqFnjE9OQKM3lzjXzopqvrMm/lUSk/jqRM8w58gAG2yk0Cy5JDZAcVjrRufp2++zlOF6pknG59XZF0jaL7Q2y/S0p+95oaOKu1/KErAqUJSL67a4+r8Pm+ZkCAgrWHVu89GCcE/KZ9Wx5tZDiyjJIwioSn+KRmHJDpF3kNVxY+aEY4wkpR8tsKuBY8QDcKA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38d3431e-1ad5-499e-a138-08d87ca8e719
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB3764.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2020 07:53:34.8240 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vzzb4Uwwd6sH//ETXIR8ICQQedrM/xDctapFXTc66F7wUdqfDxkGefUfOKPsOP/S
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3269
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 30.10.20 um 01:07 schrieb Stephen Rothwell:
> Hi all,
>
> After merging the drm-misc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> drivers/gpu/drm/nouveau/nouveau_ttm.c: In function 'nouveau_ttm_init':
> drivers/gpu/drm/nouveau/nouveau_ttm.c:320:19: error: implicit declaration of function 'swiotlb_nr_tbl' [-Werror=implicit-function-declaration]
>    320 |  need_swiotlb = !!swiotlb_nr_tbl();
>        |                   ^~~~~~~~~~~~~~

Mhm, thanks for the note. Looks like there is some merge conflict to me.

In my tree there is an "#if IS_ENABLED(CONFIG_SWIOTLB) && 
IS_ENABLED(CONFIG_X86)" around that line making sure the function is 
available.

Going to take a look later today.

Christian.

> Caused by commit
>
>    ee5d2a8e549e ("drm/ttm: wire up the new pool as default one v2")
>
> I have used the drm-misc tree from next-20201029 for today.
>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
