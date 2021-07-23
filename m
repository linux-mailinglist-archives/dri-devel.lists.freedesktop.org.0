Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB243D3C56
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 17:21:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D6D86F46A;
	Fri, 23 Jul 2021 15:21:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2056.outbound.protection.outlook.com [40.107.236.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBF7A6F934
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 15:21:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HqyWqMpShCtffvjvgWveJTjr+6lTLRMO6STyY4/AyrG/Iqw22Zlq4rpOKUHu6IzBOlikQFQSgq7DxUkEFlDKLVP9x+/cdaStnKdFH6ktqWo3jqTo7J2JCsWotU8ZlycFEfs8NEJTNjiWtt2kVaAr4ubtkM0ABOWLmwdKEphe5EnhPewcGOiJW+vdw5J0mT4nSH2jaEe5WOEc6ZTPbteyOOEoqXflj7BnTV7XyVYfdpPC/X/yYLlTjbfeNqMsXSg0RiJkmybkNGF5PHmvt+rGaJrmiz11GFnJMx4bafJEAA1y7ADMjv6tScdE6nahvfPg0mn/rxn7RPzDwumYIB560Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a4qW68KN6HqF6cGwUmcm4qenS7DWZcpoT0Ip99dMpbk=;
 b=YMHX93Np67iumZ+AdMa6sSwh23br2BY/gXAR8K14MAQw07GgJHVCWkqMi1HuRHgLkM/mzd73MEB/4wp9rqwrecYfBsGSomfSJxinfHIFyh5UvGKnpaVpBwC0WTDwMoLildF+J39y8vxjUnv/s+NpD3iFM6CDi2Alav28o9qt/UbzH/3nZv+1EvCEhGJQUhGlYZt7yg7hsbCyE3nITD3cT9GyWiPN2YzweywiaeojyfDnMVlqJxm5MbL/mCkLmtcrWK7HT4ITeHVC64CeGElgx46X7gmkOWpk6WxWj3WJrqFvfmu0Reb4baoYhDiSUrf/e4iG1bX/ucVYtb6V6FmWdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a4qW68KN6HqF6cGwUmcm4qenS7DWZcpoT0Ip99dMpbk=;
 b=FX8faqiHC9dxlt9vJbnD2z1Ul4cxUwyLJ1dPEFeczs2KRTRdO3EzVKpZe+zZ7qvBjJLGAiI+LWT2h++GWfN+XLybc0WhT0suDFnl7BpcJMxhsdk00yXlBLZQlIIybvjDyT6M6Q3wQWP38J5H1OhIFRFn3ZFgM/mwf4ucfzaiCWk=
Authentication-Results: igalia.com; dkim=none (message not signed)
 header.d=none;igalia.com; dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB5564.namprd12.prod.outlook.com (2603:10b6:610:65::24)
 by CH0PR12MB5171.namprd12.prod.outlook.com (2603:10b6:610:ba::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29; Fri, 23 Jul
 2021 15:21:16 +0000
Received: from CH2PR12MB5564.namprd12.prod.outlook.com
 ([fe80::a1f2:ad80:7e9f:db24]) by CH2PR12MB5564.namprd12.prod.outlook.com
 ([fe80::a1f2:ad80:7e9f:db24%5]) with mapi id 15.20.4352.029; Fri, 23 Jul 2021
 15:21:16 +0000
Date: Fri, 23 Jul 2021 11:21:13 -0400
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Jose Maria Casanova Crespo <jmcasanova@igalia.com>
Subject: Re: [PATCH] drm/prime: fix comment on PRIME Helpers
Message-ID: <20210723152113.pdy2luntrz22bubg@outlook.office365.com>
References: <20210723123307.31064-1-jmcasanova@igalia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210723123307.31064-1-jmcasanova@igalia.com>
X-ClientProxiedBy: BL0PR02CA0055.namprd02.prod.outlook.com
 (2603:10b6:207:3d::32) To CH2PR12MB5564.namprd12.prod.outlook.com
 (2603:10b6:610:65::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from outlook.office365.com (2607:fea8:56e0:6d60:83d9:99b1:c8f4:c46d)
 by BL0PR02CA0055.namprd02.prod.outlook.com (2603:10b6:207:3d::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26 via Frontend
 Transport; Fri, 23 Jul 2021 15:21:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ec57eff9-3cc7-4b78-c966-08d94ded8381
X-MS-TrafficTypeDiagnostic: CH0PR12MB5171:
X-Microsoft-Antispam-PRVS: <CH0PR12MB5171A300A7E51BBF303FAB9298E59@CH0PR12MB5171.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:431;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y1R/czdcRTKm3J3Dw9F6NLAtS/H57mXGuOZyubnfEGQWK3+Lb+LR3tC177uuZUcugzubJiPwmVzBOJDd6iXGYBf/LsYWXVblRGqEdVNV5g/xb2j1x08E6P2T10ZwJVbymJQpxmIcVi+4KLJYPjb0zPbDmVLvjORjHrpdEeGhiMztQIU+62YPjXyfWnbA5ZdsdhHvJviis9iXe9jpH3Ix8ws85OEwTfFLR8DteJgB0ToBTB9m3MTDYELIk4HJweTuw8vOJNPF3OfC2Y1Bazz/UvWiHDgLzhSdukG6obT9KNtuDDMge9cafs8SmZT5rR2nSh0jikxjUvxidYzFvbxGRIpSxSV8iFQuHalqqPRGwqdJKbTTVihUZjBpbaHlk+wSfxcRF4GKNcBJSMTv48PlEjOLoy/3lHYYacgsu7kTIUTfxpAWlHhRsG0lGPpOQN7+Mt2/i3gGCTURPpd8vem7tV6e4cVGhh6cjnUjusoHHtYGP5PSVRTHv2a+UmBOo84HZW6fA8zZOTRu9G80WUqaTCUP1uCtiCsU7u/0+IE68qIHhJ/u3GR46R4D18TP7tATMB8D41ZwDghc0Go67ukENdRGo/bV42oPp97FMXYJweZ8soAu6HMMP9rk0x1Pv53ny42vSuR6YQOMjZGt4i2ah3Tu2e2XVgTWn7by+YKKevJz6f76d+VNRqLy+Rp84PKSrhIQvSKvaoNEqrfji6TL4C9KVrWgNFn5IgwiyPh2ejI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5564.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(366004)(346002)(376002)(396003)(55016002)(4326008)(8676002)(966005)(1076003)(9686003)(38100700002)(83380400001)(6916009)(66476007)(66946007)(7696005)(52116002)(66556008)(8936002)(6506007)(478600001)(2906002)(86362001)(5660300002)(316002)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GUkSJijCTaTBnLulXT8PHMnJgok4Cx3wmq2JVgQwc7zCMv8FhH2yEhu4GEQ7?=
 =?us-ascii?Q?UDfkXhZsbWO5v7gTNkFTMMRLoARJ/EO/OBfr7oMw3Fb4qL1dE6DPhmASqtw1?=
 =?us-ascii?Q?oJvHapGXTa5yORx1kWYfH5NoWMsAKtPJe0x3twOYMLxEIbqSnkmPvqAeP5Ib?=
 =?us-ascii?Q?CWegXsPpzhI0G3Wi4S/doiXInbz6+1q9gC0QhOf0x+MAs44tRTB4AUKmT4ER?=
 =?us-ascii?Q?aqc0FIrdM2elXuQ61tL4VsZQx6WG2awCTtVdm20GtP+FgSpTapqZf4R61PF/?=
 =?us-ascii?Q?fb8BlEzkTWd6sF52q86JTPTdGqqNdvawM94Ab0GvBhd9OYH1wUTY57Czbe3Z?=
 =?us-ascii?Q?v5HpDMBGCBahsTEGMZn2qcqXINaeTY7yQQ5mZ88PkNI0shqcZKzNK5i6sQqc?=
 =?us-ascii?Q?U1WR5Ojcd5DFVtKWzJAGC+p/8D++DWY0dyYb7zAFdlXk1HngW2pCkpQ2kpf+?=
 =?us-ascii?Q?wwifY94kfF9eeDfBuL5tougdlxjygMliQUaJ42nUUJV6CvEeAYdRXqPFlh5o?=
 =?us-ascii?Q?lWCZXyRCKOaDcDDsJ3osbKYd9R9r5Cydq/w8ociLIYPvAfDCgJD+yhpz477E?=
 =?us-ascii?Q?XtzZFREOwTWyAljZjo3ECA9Ei1C9mhAYOQMeJ5TXXiiBtjzvmiZ9I9IlhUVz?=
 =?us-ascii?Q?iSZFitsd+UJnHwIhF0OshnsWRfF5MOvwyoEbnTHWtB9fAzjJagtYmAWAubNf?=
 =?us-ascii?Q?H5inywA/AaxQBOXCj357OWjMP+seL5afkSkN6QbPqmepqWQUAQ4gGTglkEQ+?=
 =?us-ascii?Q?BfvmrDS6sXNRX73OQYDXab6vrqg52WjlgVpL8GleoKcWe7Geuzhq/SAZCk3P?=
 =?us-ascii?Q?BTV0CadEJHpnc4qgLdPEaBMMjHa/dy8Unwro/yW/pOqh5HbH+LWOfsNzOeqb?=
 =?us-ascii?Q?N9ZLNHW3vEwJ2SGXO5TkxrIoCknGf0eWvgd3ooZUJJcvm54IdVApaoHY9UNC?=
 =?us-ascii?Q?n32f5NWqMZlF5663LCcGiJHooaW/qmfW0B5FXUxKeznbWXFR6LDZsSLs3iZS?=
 =?us-ascii?Q?Z3kBynW9Nj35fiLp4bKUa1nW1/wi3RoT98fJr7AOA8CzlwzSfHdBoeZU8SJ5?=
 =?us-ascii?Q?ndpqZLQVx+AU39DK0p6SzNO6AGfL5qe+s/gxUX/z4FZqSx0BGJUyK9ZjZ4z6?=
 =?us-ascii?Q?GcCvkRhyzVHH4OPF2Us3Zg3aPewSfEPmrZKJkux6i9IQPwWYp7dQJOto19cK?=
 =?us-ascii?Q?F9SBld4TSLhWvs9ZaXrPMT214dCyhZwcJgxwvVOZQyRiLkKMHpUhbnBwTbD3?=
 =?us-ascii?Q?rMLrhU5rVpMSbbcDzGscICjn8609DAPy+lC/9DP8LnuPXzw8qo5FnfMc3znw?=
 =?us-ascii?Q?kP2DJwZip4uuRa4t8YUFDGeNyi18wG8b9PpbV8BgfYrgiO9ayBDwlTz2/Qkc?=
 =?us-ascii?Q?ucTT+GGvzeUq26xcUzcRXWnSybSg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec57eff9-3cc7-4b78-c966-08d94ded8381
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5564.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2021 15:21:15.9978 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4QC3ajT+iO56xGMepQZQySBv+ir8yrh+OfrMWS92SI+T/uQ0kBFEX4OlUPmwP9wQZf+pZaaNWMjciAxJX0ybQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5171
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/23, Jose Maria Casanova Crespo wrote:
> s/Exporting/Importing
> 
> Fixes: 805dc614d58a8 ("drm/prime: Update docs")

Fixes flag here looks a little bit overkill. Anyway, this change lgtm

Reported-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com.>

> Cc: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Jose Maria Casanova Crespo <jmcasanova@igalia.com>
> 
> ---
>  drivers/gpu/drm/drm_prime.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index 2a54f86856af..178e18c28cab 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -549,7 +549,7 @@ int drm_prime_handle_to_fd_ioctl(struct drm_device *dev, void *data,
>   *
>   * FIXME: The underlying helper functions are named rather inconsistently.
>   *
> - * Exporting buffers
> + * Importing buffers
>   * ~~~~~~~~~~~~~~~~~
>   *
>   * Importing dma-bufs using drm_gem_prime_import() relies on
> -- 
> 2.20.1
> 

-- 
Rodrigo Siqueira
https://siqueira.tech
