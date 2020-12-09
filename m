Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C992D466A
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 17:11:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FD166EA96;
	Wed,  9 Dec 2020 16:10:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750045.outbound.protection.outlook.com [40.107.75.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAE026EA96;
 Wed,  9 Dec 2020 16:10:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q5pS1KCK5WKJR6K+oUXWY8odqERAZ5Lnf7y26FEh/XKgvGLTpnYc8gpI0kFr7rIwzuAv/ekmfHNcO7rU+GZTiTxRa4rl1r0Xg2S5jTFzj0CP5zmHBl37wLVwJ+tO1YQAwk4RsDjFY7NOzdLWmQYgeQ4kj3gZBywyjRZ1FJnDjuz+bNbY15gm6wOQQ/7T6kFkvpSwuwnkokakPn/6UCVgVa7ynMJJMCKtHF0aMx9deiHTkp2aS4rUbKrCGN8bjekrv7qUQknyit1Nj4+/mxazZa5v8xcTFT+BCC4PyONuDsDIYtrAOPEBxvxgBe84/ptFgdB6K5bCYmJqC2XEXVor+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w7HlXYyvyJ7UQ5TJcbB/wsgmxLfytwe9GV+qTwWdXuc=;
 b=j9cVpDc+sxxhrNFOB/abrAuoZdhAGtCjhx8GjmWnW1Pb85YRLyPH1pb71a0U9FiG4hY4Kf6q7yxGZ72Ew05pTCb3lqN3ec2bE8sKY1PovyLOfpgNtM2XW82/bzqN1QTsg5Z591Egrxidw3RRN3pzYpBG28FciCD1Xa8E7Lpath8rsGGssZslB4B/JnJVHvgMiVovamWu63QWAxc7zAgxxxF5vHFDFUFzc5yeefsEqTmzj2ZGIRYFecaYTRuisE5aT72WB2nkSE2oGbsLdeorVibaKCoHIhi52A08oUgWz4BwvMQ9wrNS3qkmVuA3vU2w1VMC0iGjDJkC10vXl82L6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w7HlXYyvyJ7UQ5TJcbB/wsgmxLfytwe9GV+qTwWdXuc=;
 b=r3SrVZ9Lnmwh+ymUH410sjLAitat1iKB1dTP0MzmBdK8pUwotIbAu8HtPeJUMLmGTYTI9pCC8qh6aBOaSs6D4CBPaB1fCwFh2CJwES9IUVfaGBXbo1Xoc1BE9N91OFqrbALYPzqEMORchXnWrZCv6YhsGWGx1OghIevJhWo0kbM=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3962.namprd12.prod.outlook.com (2603:10b6:5:1ce::21)
 by DM6PR12MB2795.namprd12.prod.outlook.com (2603:10b6:5:41::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Wed, 9 Dec
 2020 16:10:55 +0000
Received: from DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::d055:19dc:5b0f:ed56]) by DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::d055:19dc:5b0f:ed56%6]) with mapi id 15.20.3654.012; Wed, 9 Dec 2020
 16:10:55 +0000
Subject: Re: linux-next: build warning after merge of the drm-misc tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>
References: <20201209210211.306f3c61@canb.auug.org.au>
From: Luben Tuikov <luben.tuikov@amd.com>
Message-ID: <4005f7bb-1a46-0357-cccd-5febae8c4fe1@amd.com>
Date: Wed, 9 Dec 2020 11:10:51 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
In-Reply-To: <20201209210211.306f3c61@canb.auug.org.au>
Content-Language: en-CA
X-Originating-IP: [165.204.54.211]
X-ClientProxiedBy: YT1PR01CA0149.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::28) To DM6PR12MB3962.namprd12.prod.outlook.com
 (2603:10b6:5:1ce::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.18.65] (165.204.54.211) by
 YT1PR01CA0149.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Wed, 9 Dec 2020 16:10:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 225e9c0e-38c8-4993-0969-08d89c5d01fc
X-MS-TrafficTypeDiagnostic: DM6PR12MB2795:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB2795E3EE1FD690D8837362BC99CC0@DM6PR12MB2795.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:983;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kiDsXg3dqSJ5bdNQSX3+1KOw6CKySxc3dTRmyojkoYxkrKHoNMdfrnQvuLjDIBL30+lpxDBiB2CUWAOrpoMnGzIKzrvkGYp5sdN5hLb5pnFXZF8IWLU1d4mvfJ2UozriF672P+xUt3ZorKAmthj9edc2LWGMW/bT2WfrY8I00lE9MBjh+XrjTa5WaC3kvpyFHOgMeOvZDIObeGmkmgnFrCFdmKoRf2XBQ1fL0I0KtKLPr3pmdBwB98c3T9dcYF1TGsO1BPrvn+KcqxcWgI86uSd0EODV6XlCHFJbYv892eH3tvwdk6hjP+GqHwcfm98tV2RjeL2ZlpfoF2d0kSjBZQ0patbfuXd+vBGdLs6HGo2uDjCzwe9eD8FUQsErw06HfoCymf4Eq0pLEJb5UihgP7NhM9TE74sX4uBrGvEXKgI12oN4+3sv3UZeIBKQW/h/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3962.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(366004)(136003)(508600001)(8676002)(2906002)(4326008)(8936002)(54906003)(53546011)(34490700003)(44832011)(66946007)(66476007)(186003)(2616005)(31686004)(956004)(83380400001)(4744005)(16526019)(66556008)(110136005)(86362001)(52116002)(5660300002)(16576012)(36756003)(26005)(31696002)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?AiBLBMimMsy7ve7GfhX/rYVv2+qCEwqxsW8RzR13TTbyt3hHggdSqalG?=
 =?Windows-1252?Q?FNRs/V+gv/inkNYTXn973NOIlprJWNdD0PlyO1Y8DByKIcrqdyROPy/L?=
 =?Windows-1252?Q?JaE9ELYW6ev/me7msZRUN8u1dqjKJybnKTgaaa90MydmNcnJlfrSKI8d?=
 =?Windows-1252?Q?L2XS5JUrUHJq2Bcjgno/FBjXA/tjQX5WhFISwPIOawaHUrZ5QPXU/kN+?=
 =?Windows-1252?Q?GQFJPfa1GfyKjms2pIpHomfCEobmT71au9EuxKpKcfdsL7VqmYBXLOrJ?=
 =?Windows-1252?Q?XT90HKoj+2TghhT0Eb4KVj4thDxMUsT3KItJYiptE3H/7U86nxMTEF2i?=
 =?Windows-1252?Q?8xGtJGlXwWaGb7+Pp4FKvxMYJjPwMx0UIA0ikAXnwrlII0okm2X8ZMwr?=
 =?Windows-1252?Q?kMxhaFeI7WMHp18RY4nd0bYzJE2UJO05p/6R+yB/iY8p2OUuRgog/lvp?=
 =?Windows-1252?Q?6JO5hcJ9KwBRtMlje5viMaPdxrPGxmxncHqxoZ3qwOR34oRweaumedVZ?=
 =?Windows-1252?Q?fTk/FcUm0LJhMV9UM36mVtQ+Caha4ZlBpi1uuGG4ria8nqoy9j1D5czn?=
 =?Windows-1252?Q?1RJiY1ZbNt7dsyuFuUjErBVNvEt6p9omVZkKpoyd3h86TyOu7NPqD/62?=
 =?Windows-1252?Q?khMjv4dBYIbR1Y6Ai+aBwFKmMUcccWuqq/TAk50O1oqPxI2BBZh34Ub8?=
 =?Windows-1252?Q?Gzjwz7yZGVet7+6aQkQZZ00sSxn0ktLIsRFcmqqTUBlzIBLi8CNYoTpF?=
 =?Windows-1252?Q?5m7Bg2y+qJQ+WJTE+Ifl+8GMlA4SFbym3omndVP9fUx5Mqt9HO663fQz?=
 =?Windows-1252?Q?cVDo7FswhWJ462kDw3T6r3Gr5d7ta5MsyGmOfOrM0KGQ6MGgTXqr1tWl?=
 =?Windows-1252?Q?hr6dzsg2rR4eBDPjXbLv/Gi5pFuYou3eJo/yYFhlE0oeb1Fqp7aGGUmZ?=
 =?Windows-1252?Q?vmmSjH/ZZZWnhcfeaEbGZH+GwiKRHk80rC8fmwghBDcL9lUDnOwmHXLc?=
 =?Windows-1252?Q?9RORjpLrFp42DV26Jle3M/roeP57L06IkY3h3yNAuRd8TiMkG0GN1YN6?=
 =?Windows-1252?Q?AFThnY6kvhgbsuAg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2020 16:10:55.1321 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 225e9c0e-38c8-4993-0969-08d89c5d01fc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sHeQyS9spUhjaVgRB3sxP/ADhrjnj5pD+KcqaTn493f2Bc25YNS7+5Wvyqki7NjR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2795
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
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-12-09 05:02, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the drm-misc tree, today's linux-next build (htmldocs)
> produced this warning:
> 
> include/drm/gpu_scheduler.h:201: warning: Function parameter or member 'list' not described in 'drm_sched_job'
> 
> Introduced by commit
> 
>   8935ff00e3b1 ("drm/scheduler: "node" --> "list"")
> 

Thanks for the notification.

I'll send out a patch to fix this.

Regards,
Luben
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
