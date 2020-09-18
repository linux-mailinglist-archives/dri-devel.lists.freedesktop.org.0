Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC1B26FAD1
	for <lists+dri-devel@lfdr.de>; Fri, 18 Sep 2020 12:44:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FD436E147;
	Fri, 18 Sep 2020 10:44:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2060.outbound.protection.outlook.com [40.107.236.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F292D6E147
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 10:44:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g/vyS6ohzbKBvSLB8RZsbEU86e84rDEgsNyFI0NT8MV9YaxJNW8XMAf+CaSlYsOIutuPStwVEnkXw8I6IeEfrXXkXOfUB5hf9/0LSfccpiha0KmEtJGx3koIBuLBCXwQWRn0kZ6+eTOGzDketSgY3UBfSahGxCCluYVI6A0rCJM1eocpD+ByG+eNtZvUYRKsOuJNRmR1SmoI5a95yh75EEmQUTgdW1CnhoUKd8u4YNC4AnAWzaU60XGduxZw3OgGLIFFhhmHVTvhX8mJqthOc5LgCG1ibTEbroQTzkzzn9HZEx1uU2lEOFFYEY3rY4JCD7niPq/bnCvRF7M2tqGawQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fhpso8LmybAy9gowsstbpzRXw8CsV04dCna9zkruuGs=;
 b=ShYuzif5TmtiZA6w6KX8cJi+KxCDsRqC8N9gIUUqLR5Ney+ZxXYv4jHCkzvqp1S4TyZL+twfxq80z2MD8poCNT8OF8fNwQJknrx966nDd9NJ9GsTX2+u/FuxN8IHbL4RDb7hvsmpY2+zg7g/+G84eoMiXX+002jf6ZEL5KU7tFFhmuHv0sAfFSjNSo9+M0yXdZLsUMsRniZXCgh6l8vVgBZu1Kp5Ev6qPeFQ5AgenxQyDpJd/wKaPbS0Lc2OlJo8cKfQtlzEPw0SaRFvNpA0nJZvMquT/7DTrDFYeXuunX32vdgENX7twtbq9Oo1hrLBAYfyt9A9edKbHLN/QAc2MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fhpso8LmybAy9gowsstbpzRXw8CsV04dCna9zkruuGs=;
 b=OiXP0N6BrnTbyOMqiRXDupwPG1NZOOLk5tx7TmOaCDn1tk1LkX6Uofvxwwg0uoCT62tgXHCFLf8GY3isBbQ75QJmVyMbBz4E3OKeAJ0e7118aWe72P/D8YPfVH+TxXxtkDIy7tYDleLDecN5YcC87N6I+aC9ds19QibExTE7pY4=
Authentication-Results: hisilicon.com; dkim=none (message not signed)
 header.d=none;hisilicon.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR12MB1248.namprd12.prod.outlook.com (2603:10b6:300:12::21)
 by MWHPR12MB1951.namprd12.prod.outlook.com (2603:10b6:300:113::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14; Fri, 18 Sep
 2020 10:44:32 +0000
Received: from MWHPR12MB1248.namprd12.prod.outlook.com
 ([fe80::b885:8b56:a460:4624]) by MWHPR12MB1248.namprd12.prod.outlook.com
 ([fe80::b885:8b56:a460:4624%11]) with mapi id 15.20.3391.014; Fri, 18 Sep
 2020 10:44:32 +0000
Date: Fri, 18 Sep 2020 18:44:25 +0800
From: Huang Rui <ray.huang@amd.com>
To: Tian Tao <tiantao6@hisilicon.com>
Subject: Re: [PATCH] drm/ttm: update kernel-doc line comments
Message-ID: <20200918104425.GA2644518@hr-amd>
References: <1600422778-888-1-git-send-email-tiantao6@hisilicon.com>
Content-Disposition: inline
In-Reply-To: <1600422778-888-1-git-send-email-tiantao6@hisilicon.com>
X-ClientProxiedBy: HKAPR03CA0032.apcprd03.prod.outlook.com
 (2603:1096:203:c9::19) To MWHPR12MB1248.namprd12.prod.outlook.com
 (2603:10b6:300:12::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hr-amd (58.247.170.245) by
 HKAPR03CA0032.apcprd03.prod.outlook.com (2603:1096:203:c9::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3391.14 via Frontend Transport; Fri, 18 Sep 2020 10:44:30 +0000
X-Originating-IP: [58.247.170.245]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7d838d5d-500c-4f67-394e-08d85bbfd3cf
X-MS-TrafficTypeDiagnostic: MWHPR12MB1951:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR12MB1951BE5E632F89C053AD0263EC3F0@MWHPR12MB1951.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qVa9r4U+WAnmnQVStInFkrQybVl5ke3uOxlZOZ113dWqgikSJ7JiqF7hS4CR+0Gx+vnSjHoHVg2/xPZ7A0uD7c+ZGr36fy4tEiFh02qqJe5U70gLcN5wSW4tb+DiBKdmUm7FmlJz9+AjdaFOj1MByvIvIRdkv44gj+JSVeechocNb9+KN/+FxkKnHaESUkdBnq1SXD0Ecd/sJf3kn9eYE1JuBF/SFazPJJtqQ/xyrPpvHZxD+BrhucNjGmuTgRUfa9dz9VQQaQuvwd7GuNcZ2wSjWFrt9az33mI2tmpd09e16kKIJgDLe/rGtjC0lm3S28ZKt72Q2iHuO/ooQ2SutoQZ8THodWwfBgYa/KKUPYOKD0dyoybxo2BYMUIdnciy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR12MB1248.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(376002)(136003)(39860400002)(346002)(9686003)(86362001)(54906003)(956004)(16526019)(186003)(55016002)(5660300002)(478600001)(83380400001)(66556008)(66946007)(66476007)(1076003)(8676002)(4326008)(33716001)(15650500001)(6916009)(6666004)(316002)(33656002)(6496006)(52116002)(2906002)(8936002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: N8Oet9DkyVOcKvDbFGC/MiJLY9IkMy+7rjye+AYjZ7y5/NmqUpQ8Zu58VT7T9j6NefeX8QuvRTjSJcpRdIxT93up+n3r/OsHmMmsYikcmI+Hi/g6i7DsPOvxwSt8HM2VVG/e4wonhyjdbUlIF7N0uVTzBleWo/rlCneyAVHnUmrhwOS11V4PUqCxlmdKBJ6No8sI1AcL/NbJWbQtqVYrBMJfBBEziWVZmO46oSLtV1LW04zIFFAxd+8Ckd3/8T9f6gFQT6XwZfznm2G6sOI6IBfV6IbpTB5VXg3+bZKf1ohmiAZJdqukMNeb+5L55KJb9BdDVo1fI2YZQP5962STCTov1gyN4oYksTX1xGL6765FcSfTTaoJT1W4IaWVlEZOSEq5It4Z4RUvpt5A0ntwm7qdHAJ08YpvFLZRRbShXbhC/THSmBFQAshVGgAOly17T76GIv9HcH9VcJtZfD0qeuByY6vqhfUm159f/2WO3ZPIiGgEo0EmwK0w34m6rAQXtjBegI0xRdRWw+8dQOmDafiIPDibcv56l6sHrSoxgpYg0+kKMVeY2zwaYdD3S3vDX6PAbYx0mYDqddB/GyLHq/D4DAq0Ato81HeDC56AVBJJmKFtLPVoH3KeKgMW+vvRHy2wikV1kQ9FKzIfuxW/mw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d838d5d-500c-4f67-394e-08d85bbfd3cf
X-MS-Exchange-CrossTenant-AuthSource: MWHPR12MB1248.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2020 10:44:32.7227 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NKOiCeOrJAeWOsubV19TLjfHRkOvNDQsiCnkhvRf702WiY5t1pa3YuR3Qf8PukXcmGkNY4k0BEpPLuDxmLcFTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1951
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>,
 "linuxarm@huawei.com" <linuxarm@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 18, 2020 at 05:52:58PM +0800, Tian Tao wrote:
> Update kernel-doc line comments to fix warnings reported by make W=1.
> 
> drivers/gpu/drm/ttm/ttm_memory.c:271: warning: Function parameter or
> member 'glob' not described in 'ttm_shrink'
> drivers/gpu/drm/ttm/ttm_memory.c:271: warning: Function parameter or
> member 'from_wq' not described in 'ttm_shrink'
> drivers/gpu/drm/ttm/ttm_memory.c:271: warning: Function parameter or
> member 'extra' not described in 'ttm_shrink'
> drivers/gpu/drm/ttm/ttm_memory.c:271: warning: Function parameter or
> member 'ctx' not described in 'ttm_shrink'
> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

Acked-by: Huang Rui <ray.huang@amd.com>

> ---
>  drivers/gpu/drm/ttm/ttm_memory.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_memory.c b/drivers/gpu/drm/ttm/ttm_memory.c
> index acd63b7..0b51773 100644
> --- a/drivers/gpu/drm/ttm/ttm_memory.c
> +++ b/drivers/gpu/drm/ttm/ttm_memory.c
> @@ -259,7 +259,7 @@ static bool ttm_zones_above_swap_target(struct ttm_mem_global *glob,
>  	return false;
>  }
>  
> -/**
> +/*
>   * At this point we only support a single shrink callback.
>   * Extend this if needed, perhaps using a linked list of callbacks.
>   * Note that this function is reentrant:
> -- 
> 2.7.4
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
