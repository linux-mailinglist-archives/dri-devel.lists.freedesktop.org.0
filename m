Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC3A3566C0
	for <lists+dri-devel@lfdr.de>; Wed,  7 Apr 2021 10:25:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D88A6E072;
	Wed,  7 Apr 2021 08:25:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2069.outbound.protection.outlook.com [40.107.237.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A21F6E072
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Apr 2021 08:25:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lMFE8jhJ9Hiao1DpWS7zl0QOt8ue9N3OybquWc1yNeGWIs6HGXTqqDOAuAD5kZFi1AbKKaIN9ZTjDAmZS1wg1Dkv2f6+aSDGJhWdzVjIBzg9m36I6/5ZrYNcc+rL91a3wAjAk9UzUTjHxJtgfX/HXZAdK8zgzzpMHd7lhcD96tKJKiZrlZ1tnfcWZun778J/C677aL00C5VmLprx/F5DNfRDnc9mGlcTXpBZ/FiJ6nWhws/sgGYVoZZCIMqqJG1OQNOlhmz2eD/fVuFuIhdkBopJbPchiDa1uyKOJIvt6V5osMc6hdkQAf/Fh9Jv6Ely76+Xk+ZhzieQ6yHNknOx3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EZ2/BbGEpNv66dsfNiUMHcvVZz1iCVFoRffOOzpxeL0=;
 b=irhY0ZFAexYtAFsFVb/y7XCh4DRp1od2m1d+AuKi8YW/J+7SLdeH7Y4I6G7cWYVrP+tNk15hcs2xvGP4wZh0bn4SQMEb4q3z4nSqRfeatNFs+Li77Jh4hyBvStMcb6lAm6/O+QaSgayWSfPpHAzwxVCp7PJDHfn2CsFzR5XEC6+TrzCzz8JZHkJdzeRjSot1Cn6m2ubBnakppg0M3eIK9c14kwwpYjqOpoHSTiaTK30SD6yyKcsHb3E7m/aD89inp8gWa+pyCIxLva/u+WfjlHOD73rL2W+bbifBk+WEHLyu7mRT3r7FBqbxDvf9Tti9EjvmjFTgXUMLWZ7zZqTpSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EZ2/BbGEpNv66dsfNiUMHcvVZz1iCVFoRffOOzpxeL0=;
 b=lMCkXWUWfPI06Ee6+coL9wD5GFr9UncF7Z/z6u0Vt0p++W+Y/SQnzet3Jwo5eiQYM2xjAgR/2N5JC6Mxy9Mcg7P6Mz0psOUl+vBpF3Aei71O0HWdmOXLebn/7by5Phuojv+27X4QV4GZsP79cP/o1ZMcBpIDSazYE0Vzw4XhpvI=
Authentication-Results: uniontech.com; dkim=none (message not signed)
 header.d=none;uniontech.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR12MB1248.namprd12.prod.outlook.com (2603:10b6:300:12::21)
 by MW3PR12MB4427.namprd12.prod.outlook.com (2603:10b6:303:52::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Wed, 7 Apr
 2021 08:25:18 +0000
Received: from MWHPR12MB1248.namprd12.prod.outlook.com
 ([fe80::5094:3a69:806f:8a28]) by MWHPR12MB1248.namprd12.prod.outlook.com
 ([fe80::5094:3a69:806f:8a28%5]) with mapi id 15.20.3999.033; Wed, 7 Apr 2021
 08:25:18 +0000
Date: Wed, 7 Apr 2021 16:25:09 +0800
From: Huang Rui <ray.huang@amd.com>
To: songqiang <songqiang@uniontech.com>
Subject: Re: your mail
Message-ID: <20210407082509.GA763729@hr-amd>
References: <20210407012746.16082-1-songqiang@uniontech.com>
Content-Disposition: inline
In-Reply-To: <20210407012746.16082-1-songqiang@uniontech.com>
X-Originating-IP: [58.247.170.245]
X-ClientProxiedBy: HK2P15301CA0006.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::16) To MWHPR12MB1248.namprd12.prod.outlook.com
 (2603:10b6:300:12::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hr-amd (58.247.170.245) by
 HK2P15301CA0006.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.4 via Frontend Transport; Wed, 7 Apr 2021 08:25:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ee157cf3-d9b3-4a9e-6663-08d8f99ead5e
X-MS-TrafficTypeDiagnostic: MW3PR12MB4427:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW3PR12MB442773747B72D6ABC7AC92B9EC759@MW3PR12MB4427.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:289;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wE07Tr+9cgXFnyewiMqqLXAbtYEYrVo3ieiSsmjXPdIJNyxHrgiZrOgEeAgLcNywBKtEWnToa4QksvCod9C2wzn+OIv9hSil5f5+m5QT4JFE2HLm6ko9oe/Q2SJ9Qcm84poQCakNSNZmMFUP2/9TVZpntqu+HPll6HpVt1IVGOQzcOKMLNdJQ75979dsaufUc+TxVfbF8/c9XybmKF800Mg3hASkvTx+pUUH8Url7tya/Z7K51g+Adkw9n8VM5N6aMGfetugIpU+xQVdJXPYxo4NXsUvDRPaNovySWfuFDeeaqQwHFkiXVCdBwdKGOvZTvwAxBQadOuK5qgzcN7JFRWSU6pqK6N5SL6/n7DcmHzYI3HFA1Rfhlu7MF9jDWb/ZUyhk4KVeMj145UIrO7zHhvBk9rBuyccNgrnEKJXvSEhQ7vYuMr+C3SKiB04dlPVN8qS+8MtfBs9oXDOXUq9+yDY/3obvLp5G1LNtPvwpF00nCxv/8CiSCPwumMsAsm09j3UKUmdcZcyP/rhI40FJbQzRfeYThjp+omVdqOD59OJrBHxQ7+3A9LEFlUcys40JiJW5JUVUBGX28t0qubrRvoL4r7G0ecedMrOspb+X+DEJ7J/JLqFKvJzkFiEs27QWPo1zj0EmpM8XnUjN9jKXquT3uN1LOiNA1ELUzO/R4paZKOpG0zjclzYbO+B/JNo1Jc7Y8L7yhRld2zYyJvvyNNh32WNcGRgJTTrtgMvgJ8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR12MB1248.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(346002)(366004)(376002)(39860400002)(316002)(956004)(186003)(6916009)(54906003)(4326008)(86362001)(5660300002)(16526019)(26005)(1076003)(52116002)(6496006)(8936002)(966005)(45080400002)(478600001)(33656002)(66946007)(66556008)(66476007)(83380400001)(8676002)(7116003)(38100700001)(2906002)(3480700007)(6666004)(38350700001)(9686003)(33716001)(55016002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?oIG7WiSe2KOcfOTk3iDHuwFM7znyK8yDlO3E4D+dXH2wx/4w3Wt5A8hMjoJK?=
 =?us-ascii?Q?GgYIYCro2mwFj5MnAwhoq4/o4VQRVAvMVmM6VV5ffW9zL6aAKxhCd6c4qxH/?=
 =?us-ascii?Q?o+WxQttG+jc5V+4vWcimkpvHelN2f7deZiQdeGGWiwMEcQuH+CiEBodQQeVU?=
 =?us-ascii?Q?kHuA1r+meW4ZYwgwnAMONFM+podEqnUAEPyuBBCxcf2XEGRQMxO4jHjXgFYo?=
 =?us-ascii?Q?/UNqkvrpseunvrjqJq9XKdWHH0SGbaanQck6vQoMYCT+CizGXFKqpmCpkW+Q?=
 =?us-ascii?Q?peDgmYgl3J87sVoQAvovWxthdexviSjLg7QOpPeefYOK1vVOUomjqc7BipOg?=
 =?us-ascii?Q?6z+JgBURw/c2WaNQrEBE2xXVK/FwzAQT88rIoUqcK+pGDMAjhdqRMtHNCpbh?=
 =?us-ascii?Q?vtedwRrRxGbsPAtpT79Q7K+AYJwx8LzTooSdV03CXs1SzL/32qEITJwd0p9a?=
 =?us-ascii?Q?kQLjf0Mm8RdSqQQdoRVaBae6CeoJ29N9YbPdwjF8tCMNDOMObqDH37WUmofR?=
 =?us-ascii?Q?dKBOh0RmG1DWyTnr4JSivpSQx302JdDBmSdcoRpMjR7R0d4Mix56LhLaS5uU?=
 =?us-ascii?Q?Vv8lejMGG8oWe6f4BIBW3MOU5lwpO+1D+A15htsJ+VOqHXYQCGkE4uE7fyFB?=
 =?us-ascii?Q?vHIFiorvF4YEqCP9tNqhSkgSvaMhk+K80n22R6gDu1klzTvq+NnyV9Ww7WPv?=
 =?us-ascii?Q?8+9Y+9DiGlg2HWeMVrZD+5l5zdDPAEAyuyIwB+BXEsGgSGqDDy8ZXTdpBwc9?=
 =?us-ascii?Q?Jc02JNcv6tlFRPGpjpK0JCfk6E57nWWrpyI3giooib5QhdYRlC2GIrIFGNaJ?=
 =?us-ascii?Q?QusKZAACOI9NvY5KQZVKb76l4QXM/YPfBy17LIRqqmMof9En3/0E/IzCaWrH?=
 =?us-ascii?Q?iEzLm2LMnT6TYmvp/b2tnkxVlpNyGLhXrt+Vo1EwulUBh/72w13a9xkJV/Gl?=
 =?us-ascii?Q?bbzXLq5VrcQ0BaF52+AW+B0EIg1EzqylW8YHGGdEAcBpc97BsuC64FxMWxgT?=
 =?us-ascii?Q?G0FckW4l/1qzhuKQ4z7DcxmvFihUKuXRJLyGRidQ75a5gcSiASYvMvIRC9k+?=
 =?us-ascii?Q?eTMnWez7KcKnbjUCG1o8Zae1uOkY/WQVZnV0TIDy3BDeG7zrK6IkbwoNJTp1?=
 =?us-ascii?Q?Cgtj6U8fwnwvrADsi1wP9TFEkqZAzpSTq5KysMdTcNHHi7/Ylzl6FWAlswh6?=
 =?us-ascii?Q?E3KpV15Kqd4+sfCROLPfn4uEuVLve0VP5HGffdplAXCWdllsX/YBFz7QNmsr?=
 =?us-ascii?Q?MfYCad6gBsKIvL7NodwpRkP6NDN9gawlQ4Y8UUMlHQeZSgFRUnLlJ7lNozxE?=
 =?us-ascii?Q?LQm97bmIJ97et3lZLFpMw180?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee157cf3-d9b3-4a9e-6663-08d8f99ead5e
X-MS-Exchange-CrossTenant-AuthSource: MWHPR12MB1248.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2021 08:25:18.4957 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qXVNYhtMIX3e7ujiEc9PCZgm67SCixwEHh5wIQ9AAMOVEp9rv8zhth8RbaZpy/GKnVMvWL3Scafufah/v9fTYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4427
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 07, 2021 at 09:27:46AM +0800, songqiang wrote:

Please add the description in the commit message and subject.

Thanks,
Ray

> Signed-off-by: songqiang <songqiang@uniontech.com>
> ---
>  drivers/gpu/drm/ttm/ttm_page_alloc.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_page_alloc.c b/drivers/gpu/drm/ttm/ttm_page_alloc.c
> index 14660f723f71..f3698f0ad4d7 100644
> --- a/drivers/gpu/drm/ttm/ttm_page_alloc.c
> +++ b/drivers/gpu/drm/ttm/ttm_page_alloc.c
> @@ -736,8 +736,16 @@ static void ttm_put_pages(struct page **pages, unsigned npages, int flags,
>  					if (++p != pages[i + j])
>  					    break;
>  
> -				if (j == HPAGE_PMD_NR)
> +				if (j == HPAGE_PMD_NR) {
>  					order = HPAGE_PMD_ORDER;
> +					for (j = 1; j < HPAGE_PMD_NR; ++j)
> +						page_ref_dec(pages[i+j]);
> +				}
>  			}
>  #endif
>  
> @@ -868,10 +876,12 @@ static int ttm_get_pages(struct page **pages, unsigned npages, int flags,
>  				p = alloc_pages(huge_flags, HPAGE_PMD_ORDER);
>  				if (!p)
>  					break;
> -
> -				for (j = 0; j < HPAGE_PMD_NR; ++j)
> +				for (j = 0; j < HPAGE_PMD_NR; ++j) {
>  					pages[i++] = p++;
> -
> +					if (j > 0)
> +						page_ref_inc(pages[i-1]);
> +				}
>  				npages -= HPAGE_PMD_NR;
>  			}
>  		}
> 
> 
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=04%7C01%7Cray.huang%40amd.com%7C4ccc617b77d746db5af108d8f98db612%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637533734805563118%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=9bSP90LYdJyJYJYmuphVmqk%2B3%2FE4JPrtXkQTbxwAt68%3D&amp;reserved=0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
