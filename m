Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1CAA590F19
	for <lists+dri-devel@lfdr.de>; Fri, 12 Aug 2022 12:18:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96AF4AD1AB;
	Fri, 12 Aug 2022 10:18:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3466AD14C
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Aug 2022 10:18:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nCXAF/FnMUxxdXS6YuaPfVuL6GxBUdFmi/w24GwZsLoqEhAPYIvIjBqHRjsGnROSQ8mTZulHAGpoU0dL3/a3lq6AymhDkgIAR/cp8NrZwbLs5f5Q3Ly3NN1qCHUHyGP7UlKIdsHyyvVd3+CZQExmpCkMzATPHSzi3aPSJ3inMpB52Z17ft/Z0I8sfAxwSo2r0aZBMf6zslRoe3E2K9QU8I2nlRG0wrKiKAeQd+ex/RPi1QM8RQZrUh3e32jvMHhyu/BqJo+eD+MreiiZivkpdt45vgeltto6pySWT6/5AHqxL/Wgl+65h4memalIBWuCW1yO7ZyNVz00Xbgn7EfmNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b2Bsa9KXaen/2cEwrbLpiUY/HsaT/6XcNEMW/rb1I6E=;
 b=enRiuSqKm7XUU1P3x3jXDiybiBiW69IZVW+8uVJV/GErrAMYKnAF98tGkEpnQ5/OYY/uytRSOAZJiokj13ICyELhKsqHx+8DXJnDE2UDB20otWU5HdnFBaqACdPqN3ytztpcG0fLe5lNr6364jYloyCgJA9loOku/30laxRH6z4R9mUwabmzIpANa5dwvyNH9OdfejCGEt5i9npHBkD+fNk7RNdWNJe5pWwfoWAamh7NMBokrfV+Z7P4SmtAPrYuTQKLv8mGPA/TYgjfMk5YU7u8D0ON0RtqUn1mZy5Wfq9dbi0Hd3h5zYbfVsoOee6X75f+u8ZqQUMdT5Ugvelaxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b2Bsa9KXaen/2cEwrbLpiUY/HsaT/6XcNEMW/rb1I6E=;
 b=PHIv0rg2bDNHMbGX+4wuQhwfN1Vhpa48GnkJ4pgLB3G982EB1R4QBU8Vt0aR/Y0UGHxKbt157K8iUn0aVKm36PQHmO0fBUMjidPDtxkUWHmGYjALt7o5Tnw+9/N3h4Wf7kgRvrp0DK7PeRnmwBC8yHc5sEqYXlo/qU7eOAG2J9A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MWHPR12MB1359.namprd12.prod.outlook.com (2603:10b6:300:11::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Fri, 12 Aug
 2022 10:18:08 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5504.020; Fri, 12 Aug 2022
 10:18:08 +0000
Message-ID: <c92f34ca-db00-5709-f534-a95f1275461b@amd.com>
Date: Fri, 12 Aug 2022 12:18:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/1] tee: new ioctl to a register tee_shm from a dmabuf
 file descriptor
Content-Language: en-US
To: Olivier Masse <olivier.masse@nxp.com>, jens.wiklander@linaro.org,
 sumit.garg@linaro.org, sumit.semwal@linaro.org,
 op-tee@lists.trustedfirmware.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20220811135637.6332-1-olivier.masse@nxp.com>
 <20220811135637.6332-2-olivier.masse@nxp.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220811135637.6332-2-olivier.masse@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0150.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::19) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e561d6c-8075-49e6-6cda-08da7c4bf3cf
X-MS-TrafficTypeDiagnostic: MWHPR12MB1359:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L3ctZAlf3MJWoB476e+gOsCBbmdvewPFVaaOx+2ePx+kHXHF+JRk7akohijHnu3pOhO9eCOQrrM3YA/Y77a+VyJklk5QWjQLh8aw5nQ/2UIR/IrelVzjfSekki7oGrEUT3669wQOdlRfXHJwqRQxAE/qfYJWAFlFVneowrRIk/ROUY6Zu/YCMgWHoSyvN8oiZRt9LgDpvo7cm0Wn5f/Li8tXazzEklHfZRjn9EKzl0PK0OzduQ1PYHQh0dt0601I0ltebyp1kCidcNOGA6ww+eRtocH49VC2QH8JTazLtyz/8veEciLo6pJCtlRuCt6YNd3ryCoxnC6vLZAs1N3bO+8QZw1ORq8p6AVJaj/5dl7uBmM7EpdvMeN3D6c/Sibrzv1sV+Dy22xE+HZSIX9QD140mrd8ovQ+Az6DlBGEetSz5O5Bhg/PwVpKCTQZpeFgvHHophevDLaT/hg9F3F8y8vy0Yjt4mNWJ6nKZ6nNWLDjiIPz7LjQRqeZTqTaFVd+qxbsF95jSIn2xFMURajV2ZT+WR/UjpYnDEO2usLQ9hI7fXIVSkUbH0LVl+dWdfiAN1tO/6pPfbHOi9y0AGGbXJofSZoUJZmBbXlmcaWBl10T1Odu8RjXgQCdhpLEdJO2Di0kT+/30f3gRYWgp7nq8/eHhkGREGX3yHgn1gbwZkcJs+1L74nSbEphhB91g7i+y3Sx0ay6sH7koO5VP+hqEJXIb4xBu3h+Rbkd/YwTc7XIK/ogiarMjYe2jJjZViLjHoXBZihCTbFjtVTH881UpkHCo8F15/A23CU+OMpqbjI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(376002)(346002)(366004)(39860400002)(396003)(4326008)(86362001)(31696002)(2906002)(30864003)(66946007)(66476007)(8676002)(38100700002)(66556008)(8936002)(316002)(41300700001)(83380400001)(5660300002)(186003)(6506007)(31686004)(6666004)(2616005)(36756003)(26005)(6486002)(6512007)(478600001)(966005)(7416002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjRoRmtrTml1bHJnNlhGVFpwQXVldGJYVy8wQldiOWpKWE9YMW96UlVJVmNV?=
 =?utf-8?B?Umh0cUxwS0o0dTIwSThIV3YxczdFS1FkZHJXVTl2WGVaQktGelVBcXVkQVVN?=
 =?utf-8?B?SWhtU0VyaXFrR0xXMlVSSEtoRm5QMW1WTThsRXhZdUZSNTdWWnJFRGp3L29E?=
 =?utf-8?B?ZW43eHZ6SHlqWlNicVdWYnI2Q3RQSjdEQmtIdmZVMW1Nc2JraU42TU1reUpT?=
 =?utf-8?B?a29rRitGV0puc1RmbEFhQUhudUtkdDFRRVpCM3EwZW5XSm56KzMzSjNQOGQw?=
 =?utf-8?B?azRHTDczdXdlbVlRUzJnZjI5NnlVRnp2aFRrTjBmOUZNRGVFTFdHdUxUTXJz?=
 =?utf-8?B?SURLQ1dRSW8yU2QyeWk5VERqWTNvamRvVDFQd2VJWkVGZEo3Q0FwMXB1WTI1?=
 =?utf-8?B?T3oxYStvbUU2Ymk1Rm1OVkpXcnZOQWZWbU8rRzBLOWZCa0Q2NjB6V3hhaU11?=
 =?utf-8?B?dzZGZjg4bm9VQTBuR0VlRFpBZmdKdm1YZzBiUkg2UDNYbjdKWWpXazUrYnpU?=
 =?utf-8?B?ZkhpcWcyZUVpMUpBbWVYTWV6UURLZFlwMmtremo0U2M5Ly91VE9vNFc4M1Fn?=
 =?utf-8?B?K25aMHRuaEJZTHRuU0I1SEFuL1FtdjlkVld5QXFpSDZRQm1WSVRKQlFEbHNm?=
 =?utf-8?B?dG02bGhhRVRqK2RtKzZ4bmFxa2pCaFhuMHJVenFsRmRpcmlzaFhlZGgvbUFT?=
 =?utf-8?B?L3hFUys0MGliSmVuRTBqOGRuTEcxdTdoNE9CTEtwcUpLTmlVcDZDby9sVCtM?=
 =?utf-8?B?MlozQm9wVk1JMHpCSllOTEV0VFoxUVNxUjJlMWp3dTdIOTVHWnQ1TkNVdzYr?=
 =?utf-8?B?MngrL1RWZWljTEdVSUVVUzBKWGdBTWIwSitibU5zYTh4RDRqZDB6TEllNlBH?=
 =?utf-8?B?UC9lcDJGdER6bDg5OXdJYXlZMkR0RzYxUE9IbkJQVVhKS0NTaEFKZzJ4V2x2?=
 =?utf-8?B?ZlZRMW13V3VQZXJhay8zRTNZL2oyeGxVeVlmOE51ZE9sRkV1UklMR1kxR1Z1?=
 =?utf-8?B?eDBma1MxUEIyVkNCRHVXUXA3V3l6YU9BVEkwZEpEd2xxR2tSaW5jdzVnYXFm?=
 =?utf-8?B?SW8vOCtxNWtKL1BINXIyQjc2ckswOFlnd0FZQmNGWVVNa2RHZjlBRW5HZXBS?=
 =?utf-8?B?dEFjTkoxU085ZjlUb3ZQY0JZd2lyYTNIZVV5M3AzRW9yb3k1RHBDTlVxZERi?=
 =?utf-8?B?UGpObUhwOXpDb2dqbU9XTXF1eVc5MFVjQThoZHU2MTI3b25pL1FNcTdFVHhW?=
 =?utf-8?B?d05YMWo2Q3RIY2lmWFcybi9nSVVIejJvc1A2cXlLaXpHNEhMelJkRXR2Wkpu?=
 =?utf-8?B?UytUSEx4clVtZ3BUZHdncXo3OUJPN0dTYVIyK2tVWEVEUVltY3RablE5bnFQ?=
 =?utf-8?B?Z3YvaVd2RVplNy9xSEFiakp5OVVrT3QzbWdmVDVVQ3lYOVhTZ0VFcG5CTURL?=
 =?utf-8?B?dmVYTW12cStJa0pKVEQ5d0FlUnBWRjAwVmJDUzBoeWxsK00ycjlXY2ZyTjh2?=
 =?utf-8?B?M00vUENDMkRQUGhVRkdseldMZFZqdityT3dsZVlyU1RIZWQ5UDQ5RnVrOUNE?=
 =?utf-8?B?K2wwS0ZMbDJUNHdYTUNCcmdQeGt5TWE3ZnFVb0JrUFRadFJQazQyNTlJM1dK?=
 =?utf-8?B?VDlhUmw3UWhocmpFN3lQTWUzOTByciswZkJmNk9KUzdkU3FhNjVmeld1VkEx?=
 =?utf-8?B?MXY2YXZCWlhZejN2L3hScjZnQWxuWFhuTWUrWmtIY1ZNaUVHWGYvL3VkSTRO?=
 =?utf-8?B?SXRYaERadzdLaDlBQVFJWWhiMVFhaG4zdDRwdGZtMnVZb3RudCtRZ3d3V2N0?=
 =?utf-8?B?aWpqNExxMkMyQWdMSUNNRGdIeVd5RkZIRkYwb1RUdG9hRHdEeG9SakJVSGpG?=
 =?utf-8?B?bzVWbktCVUl1WEUrTTBSZkFqbGEwRkVlMytET0NNTFZiTmZoR3VxV0ZNRTEw?=
 =?utf-8?B?SGFOUDc1WWM1bWg5dzdQNExlRllnZkxGOFhpZGlFS0dMOHREZ2dUaGRWQ2du?=
 =?utf-8?B?WGtQMmRLazRZTG9LRElaOXJDZCtFWWxlV295QUFiRVAzUDBSdTNJR3U4VVhE?=
 =?utf-8?B?YU1jak9KYy9rWW1YcERVaCtxZS9HVEVYczdhWWF4aUM4ekhWdHMrRFRKdHdt?=
 =?utf-8?Q?EMrJZgqvocV2/cJ6dAIpZqUZY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e561d6c-8075-49e6-6cda-08da7c4bf3cf
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2022 10:18:08.2757 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Mu1JnebuKHdphbSO2pFxaQKhJeFFd1m3/a/hec5hjlckL0sQGa/qFA1iwyrVEQV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1359
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
Cc: clement.faure@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Etienne,

at least I don't see anything obvious broken.

Just two comments:

1. Dmitry is working on a change which renames some functions and makes 
it mandatory to call them with the dma_resv lock held.

Depending on how you want to upstream this change you will certainly run 
into conflicts with that.

2. Would it be possible to do this dynamically? In other words does the 
tee driver has a concept of buffers moving around?

Am 11.08.22 um 15:56 schrieb Olivier Masse:
> From: Etienne Carriere <etienne.carriere@linaro.org>
>
> This change allows userland to create a tee_shm object that refers
> to a dmabuf reference.
>
> Userland provides a dmabuf file descriptor as buffer reference.
> The created tee_shm object exported as a brand new dmabuf reference
> used to provide a clean fd to userland. Userland shall closed this new
> fd to release the tee_shm object resources. The initial dmabuf resources
> are tracked independently through original dmabuf file descriptor.
>
> Once the buffer is registered and until it is released, TEE driver
> keeps a refcount on the registered dmabuf structure.
>
> This change only support dmabuf references that relates to physically
> contiguous memory buffers.

That sounds like a pretty hard restriction, but I obviously don't see 
how to avoid it either.

Regards,
Christian.

>
> New tee_shm flag to identify tee_shm objects built from a registered
> dmabuf: TEE_SHM_EXT_DMA_BUF. Such tee_shm structures are flagged with
> TEE_SHM_EXT_DMA_BUF.
>
> Co-Developed-by: Etienne Carriere <etienne.carriere@linaro.org>
> Signed-off-by: Olivier Masse <olivier.masse@nxp.com>
> From: https://github.com/linaro-swg/linux.git
> (cherry picked from commit 41e21e5c405530590dc2dd10b2a8dbe64589840f)
> ---
>   drivers/tee/tee_core.c   | 38 +++++++++++++++
>   drivers/tee/tee_shm.c    | 99 +++++++++++++++++++++++++++++++++++++++-
>   include/linux/tee_drv.h  | 11 +++++
>   include/uapi/linux/tee.h | 29 ++++++++++++
>   4 files changed, 175 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
> index 8aa1a4836b92..7c45cbf85eb9 100644
> --- a/drivers/tee/tee_core.c
> +++ b/drivers/tee/tee_core.c
> @@ -355,6 +355,42 @@ tee_ioctl_shm_register(struct tee_context *ctx,
>   	return ret;
>   }
>   
> +static int tee_ioctl_shm_register_fd(struct tee_context *ctx,
> +				     struct tee_ioctl_shm_register_fd_data __user *udata)
> +{
> +	struct tee_ioctl_shm_register_fd_data data;
> +	struct tee_shm *shm;
> +	long ret;
> +
> +	if (copy_from_user(&data, udata, sizeof(data)))
> +		return -EFAULT;
> +
> +	/* Currently no input flags are supported */
> +	if (data.flags)
> +		return -EINVAL;
> +
> +	shm = tee_shm_register_fd(ctx, data.fd);
> +	if (IS_ERR(shm))
> +		return -EINVAL;
> +
> +	data.id = shm->id;
> +	data.flags = shm->flags;
> +	data.size = shm->size;
> +
> +	if (copy_to_user(udata, &data, sizeof(data)))
> +		ret = -EFAULT;
> +	else
> +		ret = tee_shm_get_fd(shm);
> +
> +	/*
> +	 * When user space closes the file descriptor the shared memory
> +	 * should be freed or if tee_shm_get_fd() failed then it will
> +	 * be freed immediately.
> +	 */
> +	tee_shm_put(shm);
> +	return ret;
> +}
> +
>   static int params_from_user(struct tee_context *ctx, struct tee_param *params,
>   			    size_t num_params,
>   			    struct tee_ioctl_param __user *uparams)
> @@ -829,6 +865,8 @@ static long tee_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>   		return tee_ioctl_shm_alloc(ctx, uarg);
>   	case TEE_IOC_SHM_REGISTER:
>   		return tee_ioctl_shm_register(ctx, uarg);
> +	case TEE_IOC_SHM_REGISTER_FD:
> +		return tee_ioctl_shm_register_fd(ctx, uarg);
>   	case TEE_IOC_OPEN_SESSION:
>   		return tee_ioctl_open_session(ctx, uarg);
>   	case TEE_IOC_INVOKE:
> diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
> index 836872467dc6..55a3fbbb022e 100644
> --- a/drivers/tee/tee_shm.c
> +++ b/drivers/tee/tee_shm.c
> @@ -4,6 +4,7 @@
>    */
>   #include <linux/anon_inodes.h>
>   #include <linux/device.h>
> +#include <linux/dma-buf.h>
>   #include <linux/idr.h>
>   #include <linux/mm.h>
>   #include <linux/sched.h>
> @@ -12,6 +13,14 @@
>   #include <linux/uio.h>
>   #include "tee_private.h"
>   
> +/* extra references appended to shm object for registered shared memory */
> +struct tee_shm_dmabuf_ref {
> +     struct tee_shm shm;
> +     struct dma_buf *dmabuf;
> +     struct dma_buf_attachment *attach;
> +     struct sg_table *sgt;
> +};
> +
>   static void shm_put_kernel_pages(struct page **pages, size_t page_count)
>   {
>   	size_t n;
> @@ -71,7 +80,16 @@ static void release_registered_pages(struct tee_shm *shm)
>   
>   static void tee_shm_release(struct tee_device *teedev, struct tee_shm *shm)
>   {
> -	if (shm->flags & TEE_SHM_POOL) {
> +	if (shm->flags & TEE_SHM_EXT_DMA_BUF) {
> +		struct tee_shm_dmabuf_ref *ref;
> +
> +		ref = container_of(shm, struct tee_shm_dmabuf_ref, shm);
> +		dma_buf_unmap_attachment(ref->attach, ref->sgt,
> +					 DMA_BIDIRECTIONAL);
> +
> +		dma_buf_detach(ref->dmabuf, ref->attach);
> +		dma_buf_put(ref->dmabuf);
> +	} else if (shm->flags & TEE_SHM_POOL) {
>   		teedev->pool->ops->free(teedev->pool, shm);
>   	} else if (shm->flags & TEE_SHM_DYNAMIC) {
>   		int rc = teedev->desc->ops->shm_unregister(shm->ctx, shm);
> @@ -195,7 +213,7 @@ struct tee_shm *tee_shm_alloc_user_buf(struct tee_context *ctx, size_t size)
>    * tee_client_invoke_func(). The memory allocated is later freed with a
>    * call to tee_shm_free().
>    *
> - * @returns a pointer to 'struct tee_shm'
> + * @returns a pointer to 'struct tee_shm' on success, and ERR_PTR on failure
>    */
>   struct tee_shm *tee_shm_alloc_kernel_buf(struct tee_context *ctx, size_t size)
>   {
> @@ -229,6 +247,83 @@ struct tee_shm *tee_shm_alloc_priv_buf(struct tee_context *ctx, size_t size)
>   }
>   EXPORT_SYMBOL_GPL(tee_shm_alloc_priv_buf);
>   
> +struct tee_shm *tee_shm_register_fd(struct tee_context *ctx, int fd)
> +{
> +	struct tee_shm_dmabuf_ref *ref;
> +	int rc;
> +
> +	if (!tee_device_get(ctx->teedev))
> +		return ERR_PTR(-EINVAL);
> +
> +	teedev_ctx_get(ctx);
> +
> +	ref = kzalloc(sizeof(*ref), GFP_KERNEL);
> +	if (!ref) {
> +		rc = -ENOMEM;
> +		goto err_put_tee;
> +	}
> +
> +	refcount_set(&ref->shm.refcount, 1);
> +	ref->shm.ctx = ctx;
> +	ref->shm.id = -1;
> +
> +	ref->dmabuf = dma_buf_get(fd);
> +	if (IS_ERR(ref->dmabuf)) {
> +		rc = PTR_ERR(ref->dmabuf);
> +		goto err_put_dmabuf;
> +	}
> +
> +	ref->attach = dma_buf_attach(ref->dmabuf, &ref->shm.ctx->teedev->dev);
> +	if (IS_ERR(ref->attach)) {
> +		rc = PTR_ERR(ref->attach);
> +		goto err_detach;
> +	}
> +
> +	ref->sgt = dma_buf_map_attachment(ref->attach, DMA_BIDIRECTIONAL);
> +	if (IS_ERR(ref->sgt)) {
> +		rc = PTR_ERR(ref->sgt);
> +		goto err_unmap_attachement;
> +	}
> +
> +	if (sg_nents(ref->sgt->sgl) != 1) {
> +		rc = PTR_ERR(ref->sgt->sgl);
> +		goto err_unmap_attachement;
> +	}
> +
> +	ref->shm.paddr = sg_dma_address(ref->sgt->sgl);
> +	ref->shm.size = sg_dma_len(ref->sgt->sgl);
> +	ref->shm.flags = TEE_SHM_EXT_DMA_BUF;
> +
> +	mutex_lock(&ref->shm.ctx->teedev->mutex);
> +	ref->shm.id = idr_alloc(&ref->shm.ctx->teedev->idr, &ref->shm,
> +				1, 0, GFP_KERNEL);
> +	mutex_unlock(&ref->shm.ctx->teedev->mutex);
> +	if (ref->shm.id < 0) {
> +		rc = ref->shm.id;
> +		goto err_idr_remove;
> +	}
> +
> +	return &ref->shm;
> +
> +err_idr_remove:
> +	mutex_lock(&ctx->teedev->mutex);
> +	idr_remove(&ctx->teedev->idr, ref->shm.id);
> +	mutex_unlock(&ctx->teedev->mutex);
> +err_unmap_attachement:
> +	dma_buf_unmap_attachment(ref->attach, ref->sgt, DMA_BIDIRECTIONAL);
> +err_detach:
> +	dma_buf_detach(ref->dmabuf, ref->attach);
> +err_put_dmabuf:
> +	dma_buf_put(ref->dmabuf);
> +	kfree(ref);
> +err_put_tee:
> +	teedev_ctx_put(ctx);
> +	tee_device_put(ctx->teedev);
> +
> +	return ERR_PTR(rc);
> +}
> +EXPORT_SYMBOL_GPL(tee_shm_register_fd);
> +
>   static struct tee_shm *
>   register_shm_helper(struct tee_context *ctx, unsigned long addr,
>   		    size_t length, u32 flags, int id)
> diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
> index 911cad324acc..40ddd5376c2d 100644
> --- a/include/linux/tee_drv.h
> +++ b/include/linux/tee_drv.h
> @@ -25,6 +25,7 @@
>   #define TEE_SHM_USER_MAPPED	BIT(1)  /* Memory mapped in user space */
>   #define TEE_SHM_POOL		BIT(2)  /* Memory allocated from pool */
>   #define TEE_SHM_PRIV		BIT(3)  /* Memory private to TEE driver */
> +#define TEE_SHM_EXT_DMA_BUF     BIT(4)  /* Memory with dma-buf handle */
>   
>   struct device;
>   struct tee_device;
> @@ -276,6 +277,16 @@ struct tee_shm *tee_shm_alloc_kernel_buf(struct tee_context *ctx, size_t size);
>   struct tee_shm *tee_shm_register_kernel_buf(struct tee_context *ctx,
>   					    void *addr, size_t length);
>   
> +/**
> + * tee_shm_register_fd() - Register shared memory from file descriptor
> + *
> + * @ctx:	Context that allocates the shared memory
> + * @fd:		Shared memory file descriptor reference
> + *
> + * @returns a pointer to 'struct tee_shm' on success, and ERR_PTR on failure
> + */
> +struct tee_shm *tee_shm_register_fd(struct tee_context *ctx, int fd);
> +
>   /**
>    * tee_shm_is_dynamic() - Check if shared memory object is of the dynamic kind
>    * @shm:	Shared memory handle
> diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
> index 25a6c534beb1..6f84060ad005 100644
> --- a/include/uapi/linux/tee.h
> +++ b/include/uapi/linux/tee.h
> @@ -121,6 +121,35 @@ struct tee_ioctl_shm_alloc_data {
>   #define TEE_IOC_SHM_ALLOC	_IOWR(TEE_IOC_MAGIC, TEE_IOC_BASE + 1, \
>   				     struct tee_ioctl_shm_alloc_data)
>   
> +/**
> + * struct tee_ioctl_shm_register_fd_data - Shared memory registering argument
> + * @fd:		[in] File descriptor identifying the shared memory
> + * @size:	[out] Size of shared memory to allocate
> + * @flags:	[in] Flags to/from allocation.
> + * @id:		[out] Identifier of the shared memory
> + *
> + * The flags field should currently be zero as input. Updated by the call
> + * with actual flags as defined by TEE_IOCTL_SHM_* above.
> + * This structure is used as argument for TEE_IOC_SHM_REGISTER_FD below.
> + */
> +struct tee_ioctl_shm_register_fd_data {
> +	__s64 fd;
> +	__u64 size;
> +	__u32 flags;
> +	__s32 id;
> +} __aligned(8);
> +
> +/**
> + * TEE_IOC_SHM_REGISTER_FD - register a shared memory from a file descriptor
> + *
> + * Returns a file descriptor on success or < 0 on failure
> + *
> + * The returned file descriptor refers to the shared memory object in kernel
> + * land. The shared memory is freed when the descriptor is closed.
> + */
> +#define TEE_IOC_SHM_REGISTER_FD	_IOWR(TEE_IOC_MAGIC, TEE_IOC_BASE + 8, \
> +				     struct tee_ioctl_shm_register_fd_data)
> +
>   /**
>    * struct tee_ioctl_buf_data - Variable sized buffer
>    * @buf_ptr:	[in] A __user pointer to a buffer

