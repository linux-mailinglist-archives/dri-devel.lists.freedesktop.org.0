Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EF73CB316
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 09:14:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E9206E929;
	Fri, 16 Jul 2021 07:14:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2075.outbound.protection.outlook.com [40.107.243.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22CFC6E919;
 Fri, 16 Jul 2021 07:14:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c7rKeOpefamX+MRtYspqu+id9hQrWOLM2CK3tjGl2hD04Olu1d/tg6AD8WDh26yzXvkOc9otkf1ZrMmPArod6bXX5/HwP3AVEbWEj1iznI7AnmHlOy4nwxugNCyrudvFU62eFIGX17dkzOEfgIuZEZCetKZkj7plm7sarB+NCJcWWJKMbRG5h2ui3jJvntTEUoouj13A0NyiYNNxCNnXn86CmxTvu8OFPfAfyhQq57FGWf3qNRppBL/LeFbGH7cFGNdRXJ3G7UTHfa1lhvNHrgr4n4VOtNDHCU58E2IfpgyG9AtI6V5S5oOExnYSuRjrt9EcI9XY8Kv7B4m15fokqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6s3HULAHpH/8G3nZpJEN6arzpcIWy4KVbDhKnSw3FME=;
 b=ZvTVYrwngDT3dN+XKZzffGvaOUVtCgKecMdC7/SmG1Mtc5m1jasad1j9QesEBL187nLvmo0jWKFPraCXqHQ04WgUngQtCWbPFP4a8IQOB4nwbM1Sw25H9orKsaQrsss0sixvycjv2N2/kbf+OALQpTOoDjyWgUuKLlzQ/jMv5qbRNu/a4hNi7jR2bQn3BZUcWJ0W9MRgw2jNBN7+DlZQ98EsE+DySzCnicf7GZSFZRIsJBtPWv1Oqw2lwo9SaR9EMghtmvwLC9w3Nc5eQsZKqFh5yEE1ta8expVw5pNdovFbvajp+ojXWIeXQrInwtBfi2Z04DTqMesdtxiU7qAxYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6s3HULAHpH/8G3nZpJEN6arzpcIWy4KVbDhKnSw3FME=;
 b=YtbENP1PMZDclWraJ60WcK17ksjWoMGcEPTNuoju0AQp1pX4JUnK1/Jsx7nqGICGQNgz8tDY9La1C/MjGHEAgR3ZQszsgWc8uLtQXBTza1nSS0b3+wkk14ePUZvM25ObcRu8vCikiJMNYIaPsdK3px4Vh8V/5EP1yl12Up9neq4=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3790.namprd12.prod.outlook.com (2603:10b6:208:164::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Fri, 16 Jul
 2021 07:14:09 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4331.026; Fri, 16 Jul 2021
 07:14:09 +0000
Subject: Re: [PATCH 1/7] vgaarb: remove VGA_DEFAULT_DEVICE
To: Christoph Hellwig <hch@lst.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20210716061634.2446357-1-hch@lst.de>
 <20210716061634.2446357-2-hch@lst.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <f171831b-3281-5a5a-04d3-2d69cb77f1a2@amd.com>
Date: Fri, 16 Jul 2021 09:14:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210716061634.2446357-2-hch@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR05CA0085.eurprd05.prod.outlook.com
 (2603:10a6:208:136::25) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:e013:2fad:8ece:8234]
 (2a02:908:1252:fb60:e013:2fad:8ece:8234) by
 AM0PR05CA0085.eurprd05.prod.outlook.com (2603:10a6:208:136::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Fri, 16 Jul 2021 07:14:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8aebc0f1-1977-42dd-bc36-08d948294ddd
X-MS-TrafficTypeDiagnostic: MN2PR12MB3790:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB379002903B1A1EC4D253D1B883119@MN2PR12MB3790.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M8BCX88+XcAp4FVhXnz7Mj63uVnAfZRXeoC+KyodQ76SZ7Z20857UPuhcUZ9SyAWm+pRP5Glb/RFOCmbJBYadjlXyFJujIg9vLqk+QlGmT/NAh8ZxAbawEaXwunUm2RrNGAqvvzbxAAkBgsm8LBVM+Fxdv0LkGCBYIn8tmkTxhZ7TiA2oTCfgxT39AYojn7dyqHv5dJtN+nWG2dWMI2nM71r5bGXWiy0WZSZpoanSXhqz5DVks6AVMMzhJdbujM2YtkMxYQIcIWAzeJGD+OqsQqsDZuApRGeQ5IIX2tewYYQXiB0DwQQxgKaS9zk4KCEcj3BBre3MpKOpN6G+ktso2Ff0LClHc7leIbW+bmqB4uiVDlJqdHKqz1guOOFJF7Bc0fYWojMlgWSpmRcFUdP+zl9qiaSTeT4EOcUhK5ZchrlwUrlCgDPWeuK3uAxPbyd5Dz1UHamGkd61Rj6UTU+Moq0tffm4+uXKgwOyVyI/FGhAaXRwDmpD8oBQgu7rZ5Zw2728Xc4MLZ9My/7GUQuGlu6oXGh8s6Fo6tgFxWTCANXPpCywfD9Y1zBHdCtWpQerYqUAgRpSjjQ4sn/wWgug+mGrmAQ8PFroHgyMlaJ2PEGnLoscQKy/2shbpdQbWmd6ROYfmYm4DEtDhR1Pc/sdx6G78/JqslW6E/DUyH9WExxJk9jh4pKull1HIWj2mgXlXOMznst8vNOGzlN3qRtYl2KjqSMIudEtqTIjR45GcQNwfQCRGs5qLKzC6V8wC72
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(366004)(376002)(396003)(346002)(38100700002)(5660300002)(110136005)(2616005)(83380400001)(8676002)(66946007)(4744005)(186003)(31686004)(6486002)(86362001)(316002)(8936002)(6666004)(2906002)(54906003)(478600001)(36756003)(66476007)(4326008)(66556008)(7416002)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y09KM3Y4Rzh6Nm1TZEFpaG1Gc0d3VVoxdkFNbnVUdWdjZjlRVm9RZzd3b2to?=
 =?utf-8?B?ZUpVOEJOb2dYNkoxWU9sVklnaU9zbkI4c1I4VE1lelQzalJ5RmtiZ3JtMnRM?=
 =?utf-8?B?a2plY20ya2Z3N1FBODRZdFU3eUVNSkhpSEpzOUtNWU1KWHNrSXorLzlCVTAy?=
 =?utf-8?B?MWlyM3FTMWRrSlhKdTNMTDlyUFF0SGFxRWRjV3dqVEtlSm9HZ3huR0tTeEdT?=
 =?utf-8?B?SlM5bmpGdHFEWmVBNmIrdllwT3RaVCtlQWhla1hwM3ptc2dDaHBFZkJKamRi?=
 =?utf-8?B?RTg2SGs2OFd6V3BabTNXRjFaSGUzVHRUNXpueXNGRG5qMXFhc0h2YVNaSEJ5?=
 =?utf-8?B?b3dHdGpJQVJmMW1IRzNldUZ3dDdseUJMTjFmdUdXYVN6YXpKWEY0cm9qZ1ZK?=
 =?utf-8?B?VkJRSnBMWi9va00vMkZ0Q0UydzdhazA3ZThZbEdqNmZKMzVnZnRPZnNpTnhs?=
 =?utf-8?B?TGNBdWtveXdTS0pYMVhxYkdWOTVHMVR0Q2dydWNwUE5xYVR5NkRkOWFONSth?=
 =?utf-8?B?TG5Xa2dub2ZMRGpPMU8xRWpiSis5dXdHSVFyTEZnS1MvSDkxY1IwSlpHeEhP?=
 =?utf-8?B?RzVjcEtaMFZCZ0lUL1hGajN3T1JUWEk3VEM5SWhIYmFodElHKzJYRkgzTm1V?=
 =?utf-8?B?K2RoR25RNDUyUTRjRUFiKzNrZzFvanpxTzR3K2wvb3RhckRpa21CeFMzcGRQ?=
 =?utf-8?B?Q3JzeWhZd25ZNm9TWkFIR3VEeDNPNENXckw4cjQzdEZUV05qVjg0WUNIbXp0?=
 =?utf-8?B?aTZocVdrRmt3eHdkaGMxbkNIc1dKQU1NSmZtWnhTT00zeEdxS1JwN0EyQlJH?=
 =?utf-8?B?aVZaZmdvYTJQTEpnODhJWExtcVphVmxpU2sxZnpmSGlUSGVjdTVlTkMxTjRB?=
 =?utf-8?B?RkNZYjBldDFwK1ZwUUx0NklpR2tQd1dsZWVJZWxTWXFHRnQ2b2RjQ3VCSlha?=
 =?utf-8?B?TkQ5RWlvQjZjNHdRVXRIZHJRd3gzWmE2VGI3eWJ3ZzFEYzB5ZmF3N0M0QzNF?=
 =?utf-8?B?T3JxRDhZUldLdWV4ZjFtd2ZUTnlndDRyeWRyeGluTFlJZEFqYVFwV21RVzdC?=
 =?utf-8?B?b3d0ajF4U3ZvWkluNkxVbzN1Y1JyS3g5eDgycURpLzd3ejBFRzZCUkM1aW5Z?=
 =?utf-8?B?cHBzdjdyYkpOa2Y0cXVOQjE0VEw2ekdZb1p3RHJRcXI5cGR3VzkwVW9hZXBP?=
 =?utf-8?B?YTljck5WTE56M3hodlF6WmJzNDJHVkx5amowNHo1WEJ5V042ZlR4Ry85OGF5?=
 =?utf-8?B?YlZMYmt0UE93RGxIR2hza1dONE9xY215Ly92ckd0SWcrbk1vOGRtRDRtQ2Z1?=
 =?utf-8?B?ZHhVeW81aXVWekVScG5CcUZGNGZoUVkveUtrVGozMjdybUhNRngzQmIxajFC?=
 =?utf-8?B?Nkxhc1NjUFNYTWV4aXlxMHpNYjh6NTZEenRYTUdJbGxCVVhlN3puZ3RHQS90?=
 =?utf-8?B?MDVUK1B0Z3F5ZytHdVpPOGlRNWQ2Q0oxaWw5YjloeHY0UTBWZFV5V1MySXBT?=
 =?utf-8?B?ZVZ3QmhFZnVieHM4M1RORTZ1VHhxNGdjTWZRNUc0WXpHdmgzYUVrSWxHRVl5?=
 =?utf-8?B?R01lVEFMdGNJRHdSYm5QYVRPRDVmQXFuYVpaQzh6Uzhta0xBMTF5YjNZVzkw?=
 =?utf-8?B?Z1Z5T1lNM05mSy9YTk1xQk9WT1BGMkEwN2hVTVM1VjQvZk9SV21YMU5ZTkFq?=
 =?utf-8?B?aDd0dDZuc3Y3Wmh3c1p6cXp0MjVDSUZFTCtteHA1TURnNmZQK3MzelhQdkV3?=
 =?utf-8?B?aTQrKzhyL3oyWkVGa2wwcWE3OFZsQ2NPNDRNNFp6OWNIZm9LY3JuRW9qSzhv?=
 =?utf-8?B?TG5xSkxsMmdmRlBFV2xrUXgxTWU2ZDFpbktDbytGOGw2ajlPcExHMXpDUGVz?=
 =?utf-8?Q?9naPV9ygiMwep?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aebc0f1-1977-42dd-bc36-08d948294ddd
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2021 07:14:08.9800 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R9rR080WXzQ96bzhGe5JYvFUP4o+NFOr9ZU4CFxN3nOtx8UrnYZ8tc6beqgX1q9N
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3790
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
Cc: kvm@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Alex Williamson <alex.williamson@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, intel-gfx@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 16.07.21 um 08:16 schrieb Christoph Hellwig:
> The define is entirely unused.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

I'm not an expert for this particular code, but at least of hand 
everything you do here makes totally sense.

Whole series is Acked-by: Christian König <christian.koenig@amd.com>

Regards,
Christian.

> ---
>   include/linux/vgaarb.h | 6 ------
>   1 file changed, 6 deletions(-)
>
> diff --git a/include/linux/vgaarb.h b/include/linux/vgaarb.h
> index dc6ddce92066..26ec8a057d2a 100644
> --- a/include/linux/vgaarb.h
> +++ b/include/linux/vgaarb.h
> @@ -42,12 +42,6 @@
>   #define VGA_RSRC_NORMAL_IO     0x04
>   #define VGA_RSRC_NORMAL_MEM    0x08
>   
> -/* Passing that instead of a pci_dev to use the system "default"
> - * device, that is the one used by vgacon. Archs will probably
> - * have to provide their own vga_default_device();
> - */
> -#define VGA_DEFAULT_DEVICE     (NULL)
> -
>   struct pci_dev;
>   
>   /* For use by clients */

