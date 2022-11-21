Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77572633078
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 00:07:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7CF2891E1;
	Mon, 21 Nov 2022 23:06:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6964891E1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 23:06:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Smzhu+BD+7ZkaCo2EzcNSqkWqQrni9wVJYSplH7XkChDYMmVVG2lPtFB2mXwlP9kMcMsz9hHnNrw8gnze5W6xLXIAns52OA3XvwZTm1d1DT6I1lednUxKLyY9vpn/i2RYDvh9yMV1p7YeXIQs26MFUSFwPmyAvJDUZTFWrWlbrSyCtrW92tr5tWHWtMskI4z/h4CO+87cYRep70nTweyjF0tY+0uB3ZvQV/YG14Rj2dSdZy578DP0TnvE+itc21UwfNRbn8IUtZsrhdtrB80RxfSEnObD//wNvVSvBrwfUhVueZt5fZEgO8enixMba/QnmN7OBjd8SqA4p8knUBEBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DBvebb4dQoIg8K3iWPU/Zr1rpI4qFKDTXdlG0ONEZzQ=;
 b=cMSt22wCYHYnG2nRYFEBypWQO7zlC6q7OAXYGgpRfIDJrhB+pMqVD/9Yx7If8WJwF3xL6i/hbVk3jQLQ15s/552JqJDsh2KMD547hOZQG8FEuRzrX24d0SwRg8A0EzkxVHcixz22byGH40AZmkDoQHF3s2ape4V0NV7vigrOJjuG+3z9dpgo0PwIiSw1ZcpbtRHj1p+/xftny7Yqs7mtiUny+HjNsVEH60WYmTYaf+sLueYTVlzaPCnMzmdZXZbwuFKa2R98bIz5Nhi9kwd2YlqLq7Z+M7tjMze8OOvsQZFqaEICMsSeJub4J2xc0RrOZuHRUR1ThecxlxI+939gqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DBvebb4dQoIg8K3iWPU/Zr1rpI4qFKDTXdlG0ONEZzQ=;
 b=l3qvPyNtuYPHg9swZko59c9OQOjNLqSPIfFlpoXfYxYeaB03AwfN0cfoJl2iry2BpRkYxJMM0PomLkOMvbglhVGKbuQ84HEDfODtuQoluOg0mtLNkLBUrbLBNcMPRqnizFEgAVG5GiINNIrIJrD9Y8XHVP/HDV82uccl3r5aZoE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4502.namprd12.prod.outlook.com (2603:10b6:208:263::20)
 by CY8PR12MB7563.namprd12.prod.outlook.com (2603:10b6:930:96::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Mon, 21 Nov
 2022 23:06:48 +0000
Received: from MN2PR12MB4502.namprd12.prod.outlook.com
 ([fe80::ff07:a59a:76b4:f06]) by MN2PR12MB4502.namprd12.prod.outlook.com
 ([fe80::ff07:a59a:76b4:f06%9]) with mapi id 15.20.5834.015; Mon, 21 Nov 2022
 23:06:48 +0000
Message-ID: <02c514c0-62c4-1cdf-5d3f-b3d8942ef005@amd.com>
Date: Mon, 21 Nov 2022 15:06:44 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 0/4] new subsystem for compute accelerator devices
Content-Language: en-US
To: Oded Gabbay <ogabbay@kernel.org>
References: <20221119204435.97113-1-ogabbay@kernel.org>
From: Sonal Santan <sonal.santan@amd.com>
In-Reply-To: <20221119204435.97113-1-ogabbay@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR01CA0013.prod.exchangelabs.com (2603:10b6:a02:80::26)
 To MN2PR12MB4502.namprd12.prod.outlook.com
 (2603:10b6:208:263::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4502:EE_|CY8PR12MB7563:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e8d123d-9b9e-440b-5b15-08dacc151116
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Mdum9taGacItL0e0J0zDXhoOSluOurEt2bjZufyknWiqTmL1zX924RTZ6sPP6PC8435sFJBZEt0ZewuC3Y2isU7JxrjIkCeyKsbhzTFYMI0X07/H5/ScHAz5zQAoyaOQdMsdH0sdPYwnOdyMKhk7A//qJKr6qd+E8QNnIJywPtVM1pZJ/+z6V+98nGMrE8DHxpsviLMWFS4yYF8JRbFHm6A7TfaiupOS8NRbkn6Lql0sdLp3kCk443wSyqGeGzBTgAxGHHEU+D/wISo3ff419ZEbWl0olsIrXbhqnqfWDfNZ+4gkleGypw/eN4yXIWpGVlEPlw4FNLCcE+MVOOjT/y5mwWR6C3EPy5/VFYh3lI6ga2r7vagNEJBxyvVd7+KRTB2j1qMpX+Rm35ggxu6131eH+dfgOYkXzdOX+S3+QGme59tcZ1xDEne0m74BACeQvaxtIv+7fEqbnqn6SNjmOOVfLNjQIDxaDQewjDE0p1ELIX1pllBGUmm5Bsk1YNEA4w3j2GY4imQ8oOvfKRCh/wKYTaQ8+2p/8bdZ11MsZad8W8Q3ntTO87QiNSvP5zljFbSQh0t8y1ru7o7hWIcaGlGJ/ACo0jkVpMFNbK/CkhCSd275ygR1tG/IQs6Bcd1l28fBa9bouI1TIt4gnPlUwKWkwNXH8mLTNxEx+DZ6EmhwpyfX0asjFRIWNEZFuzeIxzB7wE1BOKkL6JSrbOY4t42hyi1r22WCrF46x5N7R2j3qwj4kwH6cq7ytErcxkmRQmYgCRmd+HenUCEnSCo0AKmmJU1AAnYO2tT2bHD5nBE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4502.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(396003)(136003)(376002)(366004)(39860400002)(451199015)(66556008)(66946007)(66476007)(36756003)(53546011)(8676002)(4326008)(5660300002)(8936002)(31696002)(41300700001)(6512007)(86362001)(6666004)(44832011)(26005)(6506007)(83380400001)(186003)(2616005)(54906003)(6916009)(6486002)(316002)(966005)(38100700002)(478600001)(7416002)(31686004)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LzhSejRCVGRWZlVHT29YTEM1eFRETnFWa0hRQ20zb0N5V1N6MFFlUEFqNW9a?=
 =?utf-8?B?UkdEdU9VTTVXTHg0cFJNWm1qWFVnYzFyOXhzWEVOSlVEcmZqZFNudzBXQllY?=
 =?utf-8?B?RjB6czJnUWIxc3ViZFdwTmk1RHFmWlV6QTVoUWJ2WVQ5a2dzWG1CdEtoaWo1?=
 =?utf-8?B?VC9INW5tR1BuRlQ4VWVOTlRlTGJSRmRrVDRnT0pyVXd0VWUwK01QYUZNZHdC?=
 =?utf-8?B?a0RrN1JTMFRNTVlZT2tYQlF4SWcyNjhZajdmcDJzY3pLTWlhUHdsdWpYZ1ZE?=
 =?utf-8?B?MkJWcVdtM1BPWUdzTVlxT0hYT1FYK0JjTWhVajZEaDltMXpkc282Y0lYQVF6?=
 =?utf-8?B?Ky80ZDEzemh2YWlzSHdWSU1RazZjWHByZHJUeFd5cnNQekt0MkwwVjdvWjlL?=
 =?utf-8?B?VW0xcTkvNFJrR0VWekk5NHhuZ0R6TEdST0MxOVlJOThicEZYeVNTTHBkNS9a?=
 =?utf-8?B?amRHSlh4bzVFRDVvMWNaOExpNzVWaUZ5QktCM0NQZFV4dzRXOGNXSTM3d2d2?=
 =?utf-8?B?NGlWTnBCUXVIZTdoNThGY1VaT3o1Q1hndG1ScVZZRUxSSndVL2pSMS9WdGZm?=
 =?utf-8?B?MnA2OUNjc1dLcm96QVdDT0hFU2Q4L1BrczFEak9WcUg2c21tVHVOMWs4SlRB?=
 =?utf-8?B?L1lHNjZ0MW55MmFZK0ozb3gydXNzVTd6K25DVGhCSkt0UFJYV1NIREJnSmVu?=
 =?utf-8?B?Vm9kckd4VWRJcnMvd25ZY2M1QzhOaTdJajJtalQ1dTdleDNrZTRIbDk3azBi?=
 =?utf-8?B?bnlURmZ1RVZBSFJqb3hpdU0yQVliWXp5aEV0M2sxdktEZnhCbzZjWmxqalIw?=
 =?utf-8?B?RE5oKy83d1lOMGZicXgyOUJSMldwOGtCMG0wWHZhbWV1TFVyVkxWbmdtUll1?=
 =?utf-8?B?K2ZsMjFseXhkWFE3OHA1b0hNZm43aXZNTTVuckJnLzIzMHl0UHQwQ29VdUhy?=
 =?utf-8?B?L3dzc2xPNkpuMEZjMzBvWk5aUk5pQkNpK3hubHpqL1pXbmd0c0RtMTRBOW95?=
 =?utf-8?B?VWJQMGhIc1pMa2VyOXBKWXdJbkkvRWE0dXgreC8rWjk4Ly9lV0l1V1hSNEM3?=
 =?utf-8?B?WUhOM283S3hlMnZNOHN4Tk5PZTAwUDd6WXJiVjVaRUw2TVMrcUprMHZ4U3V5?=
 =?utf-8?B?bUFraGRSQ2N2UHRsaTZnbHdmckNZSkZ3cm5SUjdmZ3JUQUxsTkpOWG4vSWZy?=
 =?utf-8?B?YVRTbWdiVGlJUkxQRWJWYjhCT2hKWEFOVmdBQ2o4TVkyK0FwYTFjZVUxUUJ1?=
 =?utf-8?B?RmhFeHlBcEE5cldvaVZHZ3RINVpXUUU1em94QWQyeHNvK3pzNXlJYkh0R29V?=
 =?utf-8?B?ZDZRdWtkdUFITTNsTi9qamxtNHF1UGJobmoycitrV2U2RFNVUWhqbkJRYS9n?=
 =?utf-8?B?UWh5R1djSmZWK1pLMlo4L2hoWUhlWms0a0NKdlBIazVtNzhqeTdKZThBZ2Nq?=
 =?utf-8?B?b3NCd1c4dEcwTFF3Vm1tendRVUhVRnczelBYR1ZoNTZHV0V0bWtRS1NoTGg4?=
 =?utf-8?B?TURPTUNGTVR0ZEdDbGhweTlSMWI2SVlIMTdEanpHY3JDVm51VjdyT1pWUTRs?=
 =?utf-8?B?WXRhREZBdk1aeEF6VHVhQlpWbEN6MGJTOTlYaC8xQjBWdEZScDZpV1FHOGlo?=
 =?utf-8?B?OXdBRTBLQnVUNHJXOFN5MGU3WHhLMGVDdGxCMU44bEdGRWhmNS9UeEI1YmNm?=
 =?utf-8?B?MzBmNUVvbWNhUDJmQjB1aE1mLytqNE1rOTZKNU5odFNzVTFtWGpKTW5hTzNH?=
 =?utf-8?B?M0pSMHRSa1FBemFSUmJiYXNzemJ3d0tvT0Yzb240OWxPa0hHcjQyaStETmdQ?=
 =?utf-8?B?MTVYeUtocU14UlpHbUNMYStqY1N5a2QyWXh6SG5zYlVjRVdHRG1sSWtQNHh2?=
 =?utf-8?B?bVk4S1RkR1J4UWpORkR6bHVROHZsbFpVVUpGN21XRjNpdm43N25haFVXMXlw?=
 =?utf-8?B?cjhTMm9qNWtsQWl1dlIxYlJMNnRlM0M2TXk5L3dML2g5Zkw0NzgzTTRKeGlR?=
 =?utf-8?B?SDN3MmMwVUtlQnVtMmx4clpFeTNrVFZZRVAwUGIraWY5K0NlZlRWWVNyQmo0?=
 =?utf-8?B?VHROd05QMXVDb0lRT3dtZ21sdjhaUlQxWVlhY2JrSWwrMzJzdkQyR0hOMEpx?=
 =?utf-8?Q?wJ+I52EPnySNFxdmqjeVu4CqP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e8d123d-9b9e-440b-5b15-08dacc151116
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4502.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2022 23:06:48.0965 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VX1Qka41YHQW35T7ahutMLFFbvF6A863XA1QEjRPpxMd7ThJteFqQcBsB6Q+YV4t
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7563
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiho Chu <jiho.chu@samsung.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Christopher Friedt <chrisfriedt@gmail.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Kevin Hilman <khilman@baylibre.com>,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/19/22 12:44, Oded Gabbay wrote:
> This is the fourth (and hopefully last) version of the patch-set to add the
> new subsystem for compute accelerators. I removed the RFC headline as
> I believe it is now ready for merging.
> 
> Compare to v3, this patch-set contains one additional patch that adds
> documentation regarding the accel subsystem. I hope it's good enough for
> this stage. In addition, there were few very minor fixes according to
> comments received on v3.
> 
> The patches are in the following repo:
> https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/accel.git/log/?h=accel_v4
> 
> As in v3, The HEAD of that branch is a commit adding a dummy driver that
> registers an accel device using the new framework. This can be served
> as a simple reference.
> 
> v1 cover letter:
> https://lkml.org/lkml/2022/10/22/544
> 
> v2 cover letter:
> https://lore.kernel.org/lkml/20221102203405.1797491-1-ogabbay@kernel.org/T/
> 
> v3 cover letter:
> https://lore.kernel.org/lkml/20221106210225.2065371-1-ogabbay@kernel.org/T/

Thanks for defining the new accel subsystem. We are currently working on
DRM based drivers for unannounced acceleration devices. I am fine with
these changes with the assumption that the choice of using classic DRM
or accel is left up to the individual driver.

-Sonal

> 
> Thanks,
> Oded.
> 
> Oded Gabbay (4):
>   drivers/accel: define kconfig and register a new major
>   accel: add dedicated minor for accelerator devices
>   drm: initialize accel framework
>   doc: add documentation for accel subsystem
> 
>  Documentation/accel/index.rst         |  17 ++
>  Documentation/accel/introduction.rst  | 109 +++++++++
>  Documentation/admin-guide/devices.txt |   5 +
>  Documentation/subsystem-apis.rst      |   1 +
>  MAINTAINERS                           |   9 +
>  drivers/Kconfig                       |   2 +
>  drivers/accel/Kconfig                 |  24 ++
>  drivers/accel/drm_accel.c             | 323 ++++++++++++++++++++++++++
>  drivers/gpu/drm/Makefile              |   1 +
>  drivers/gpu/drm/drm_drv.c             | 102 +++++---
>  drivers/gpu/drm/drm_file.c            |   2 +-
>  drivers/gpu/drm/drm_sysfs.c           |  24 +-
>  include/drm/drm_accel.h               |  97 ++++++++
>  include/drm/drm_device.h              |   3 +
>  include/drm/drm_drv.h                 |   8 +
>  include/drm/drm_file.h                |  21 +-
>  16 files changed, 711 insertions(+), 37 deletions(-)
>  create mode 100644 Documentation/accel/index.rst
>  create mode 100644 Documentation/accel/introduction.rst
>  create mode 100644 drivers/accel/Kconfig
>  create mode 100644 drivers/accel/drm_accel.c
>  create mode 100644 include/drm/drm_accel.h
> 
> --
> 2.25.1
> 

