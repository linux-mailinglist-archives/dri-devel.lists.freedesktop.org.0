Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 356144FE9AC
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 22:52:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8CD910E76A;
	Tue, 12 Apr 2022 20:52:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2049.outbound.protection.outlook.com [40.107.212.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16D0110E75B;
 Tue, 12 Apr 2022 20:52:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S09im/zCASItpwSKAEDTOzZI86azw6NXwQKlvLh+k1PMuAjkBOsAu3rQOvMyR51nIRwk3PxI5is8hxDLjERqAMn01TnqF0qROgZmeUp7Vp7nFqVwteZy8aRVd6uKznfAzJr5xXg65CxA0CkJuwDp5+N4mJgrHg/02p9IUh+67LuImn39Uq8JC8S2RjVz559PZBHo5Tkk6OZauLpwAQ2bIXdqdKLrc+FeX7V9H1RJ7XXW4pyFanjlH2UdO8S2KB+rZ7SsPGpEgfCJsBbV76E81WmWjenpCzPAZXa+j+B9+f8fzTm17Py250MqVPdh2XVIS6ICZWwTQ/Zy3HAZB1hiTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IfVWEuGEmICti832VpE4k8TKv6BaSwcstmam9+2KYVs=;
 b=bAMb7FanxSdhSVY0M6L9k0AaI997zBxTH1b3ktP6qMTKgeUfR9kybg440dY6hp7ZlJ+skwaK2+mU6T5wlkCUnGAplml8301LRE3G4njpoMZCLg4femzGPdPsO9kS+eseCsdYRFG4asY2kZwR/6mWVo/nqK/k8mQ0uBnICFdaaEtDAI8rVE7DVPbS8hLe4KygGRQDcJqmRbWzKbounZ28jFx0tHMMmjsLvjEMmwUrNgmpsQSIEYiU5/RHHJGZd2gjtsCvLkiVQNOihqRh7ppEn+Jdku2+rmJgyBpT23IZTFahmPXsLB5ZaFFEXaE/8mDolkFVM824JsgwrUS/qzXi6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IfVWEuGEmICti832VpE4k8TKv6BaSwcstmam9+2KYVs=;
 b=LiknDqzVTkNMl4evPt00R9ToU+lknAws0qLExc6tK6K85s/ZH73kuewlTMWSXXd/CdBCGYqW6aS6KH77bUJf8mPmlk635qVKpwzyulqhfualus+cumb+dn2QVkJgBYFDuFOOOlVMdUlO1gN2G9rtT46KS5hNb5QtLvOgZI7gvnaIaZclKT/kn3u5TmwF63mdMprcm5QCY/A6m0z/ZcoPP0rbzoPatdtPSwdfqq6MB7jEy3EGPXSG+BGT+s2NJ3FJSIYtr2D5aNo4QDj3Gw96kSusL/wSBgezs1p4ED1CJHTEqiWbkIk65FBk4bctLg0So24jtns4IgI+wJugfniAiw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4206.namprd12.prod.outlook.com (2603:10b6:208:1d5::18)
 by CH2PR12MB5529.namprd12.prod.outlook.com (2603:10b6:610:36::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Tue, 12 Apr
 2022 20:52:35 +0000
Received: from MN2PR12MB4206.namprd12.prod.outlook.com
 ([fe80::211e:d78f:c944:6665]) by MN2PR12MB4206.namprd12.prod.outlook.com
 ([fe80::211e:d78f:c944:6665%7]) with mapi id 15.20.5144.030; Tue, 12 Apr 2022
 20:52:35 +0000
Message-ID: <c66642f9-2e8f-8c0c-d9d0-91489fe1413d@nvidia.com>
Date: Wed, 13 Apr 2022 02:22:21 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 33/34] vfio/mdev: Use the driver core to create the
 'remove' file
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Zhenyu Wang
 <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
References: <20220411141403.86980-1-hch@lst.de>
 <20220411141403.86980-34-hch@lst.de>
X-Nvconfidentiality: public
From: Kirti Wankhede <kwankhede@nvidia.com>
In-Reply-To: <20220411141403.86980-34-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR0101CA0049.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:20::11) To MN2PR12MB4206.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 49de4d41-3007-4a02-f92f-08da1cc65ee5
X-MS-TrafficTypeDiagnostic: CH2PR12MB5529:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB5529909C8658A0C2A70BF570DCED9@CH2PR12MB5529.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lDigYH6e5sxUv38FL3l80mlLQ4Ud9BIUOUHHuo4BgI9a+CXkC/VUKETXecLK2aalJfDSnh76pVEFNia764Wv7H9gp/fryC139LgVozX8UNGN7300rMAzieMajiMYAWw3W+yur/Llx9M7JJ6MVR5/NDKzLPxesxBbQDocOtWM7jWZsrpEndeBfMec1b6v2JYd+PgQlfSi/1bO/iSXWsmxF5ftm7VonkxnEXFSwgaccbBbhKMEKMbM5W+7OsXDBtEt/cQQ9x/XWfKJdVKv5Rnstflr2slIqrSpgQKWTdj3vYsRy9rtn5fpcPW6FbiHUcTALrcqqXS5REh7oUZuuGzHpWeiM4ig4DzZ9r59P4Ih4QsFjizH5o8/ggDtiOvMkYl8pQT6nv0Gfkm3xvhznwDycNwTorjlHA+iqxAHmcj2HZQaNJGHr9eaHL0Y0TTBXxAO4hsVEHF5DY5on9ATo21MaO8rBq9B35rLzwiQxxSJw2FkszvKLgrQMOqU3miwWEYmtLmwtYFPEJYon4c5MfqVxjrfyAPWVi3Xjt9JDbB4W+BK83AagGQGszFPdx2KDApjkXGrc3clm60dTtiMO0E3XhoOJtIblfiFhc39pG6v+6kuCHdonAh/JJe/qVUY+3cbRhJmT2I9AwPqwxRb3rwQtZEMS1aEckSYWEHDePKrrfQSwx2tpvgntksfCPfycnM4PA892lUapCAurpM5+LFECZJBS6wNCe3/BYmwydL6JH8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4206.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(110136005)(38100700002)(66556008)(66946007)(36756003)(316002)(86362001)(31696002)(4326008)(8676002)(508600001)(6486002)(83380400001)(66476007)(5660300002)(7416002)(8936002)(53546011)(26005)(6506007)(186003)(55236004)(6666004)(6512007)(31686004)(2616005)(4744005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rk9hdnE3Ujh6cldnRmt2VUxJWk91aHJTRFpzd3RENDhITjU4czRYV2pnb1R1?=
 =?utf-8?B?aVdySUxZVzVRVlVjT2x5bXA1aHJIWDZCajFaeEVuS1lsR2gxWGIzSExkbFIz?=
 =?utf-8?B?WHJ5ZlFUcnkyejQwOWYwMFdjK2d3NzRaM01XenVTdlMranh5R2lncmJZaFlZ?=
 =?utf-8?B?dlg2VTQ1UTZJQ1U5aDFLTUdFVnl0S1VLc2N6Zkhudm14am9UOUhOSGpmdGtr?=
 =?utf-8?B?STgvRmVwVGNiWXMyWndTa3pkMjZ3Ulc1NWhjWjd3SlAzcWVNOWtPOC9MOUgy?=
 =?utf-8?B?Y3ErekorWmdiQVI3VjJDTFV3K253bFY5UWtuMUNCZGJJWklMWDlYbHVPN3ZP?=
 =?utf-8?B?cE9JbFovM3hESmhCVlBEZkZJdVVYdHpzakRKL1hNdTJYai9BTHdxU1h0L1Ri?=
 =?utf-8?B?aGQ5Y1BkNUc0U2hmbjhmdWh0VER0RTlVNERoSFc4YlNFTEE4THliVVRRaTMx?=
 =?utf-8?B?OWxSTm9NdGpZalVsVnJkNURtc2syRVlkOWdOWVNDOWFtT05uR2J5VjRJbURz?=
 =?utf-8?B?N3BPN1kyU2ZxK24rdXhlY1ZwK2F2ditHOTdWV24rYlRhNmE3WDB5Z0VWSHl6?=
 =?utf-8?B?ajFOV0pKcEwvcTFFNElEYU8vNDRsRGlIVXJTS1I2VktibzVibE56cS9KV2F2?=
 =?utf-8?B?OGNwUHBKV0RKSEVrOHE1VS9ha3NvUGlldjBFYjRrMGN5K2lidmk3dzRmd0ZV?=
 =?utf-8?B?N1d5VURhc2t2VkZlOHVReHAwNVNYN1F3VnVaeXY5SmRnV1hXYWFSeDNEeERu?=
 =?utf-8?B?SzZTYW5ITmM0SFFSOFR2N0pNb3NHQ1Z6TWVMaldnMllkN0gzY2NEczlQMzZZ?=
 =?utf-8?B?QVp1Y09PZmt4Rm1Bb0NOT2ZsSXBxSytCbmx3MmRKL2Zkdm0wdStyTE1YK0pu?=
 =?utf-8?B?bzZlcmxkVHo0ZXY2bUZvL0E2S3ExclZPNkhacHMyc3ZaOENyVGgraCtJSXEv?=
 =?utf-8?B?ekdrNC9MTUM2MzNnV0F2Snd0WjI3Z0V0WjFhOTF5M2xVT2VxMVVXK2xNa0Q3?=
 =?utf-8?B?QmRLWE1uM01MSThoYlFQNTZUL2hvcmY1aTB6SHk4SEt6RTVlblJSc2tQbXRs?=
 =?utf-8?B?cENScDAzNWZRemt6aWxGNjVxMHVSWWN2VUlPbkxZZGFrRmhYOGFsbFJlL0sy?=
 =?utf-8?B?NGJCWlZKTTg5RndXWGZRK0JPQnFiL0doUXd3MVd6bjNKMlV5QmZUV1hlOFZZ?=
 =?utf-8?B?SzVUZ2ZrN2Q3aEQwYVFuNkhMMUpMNmk0Y09UeTR5TFgwMGpnQmpSdkRPRlRt?=
 =?utf-8?B?OVJqR2MwcyswbVY1cG9VVDJvb0ZiL1pldktQM0FWSzhlQys2Y2VWQXdjWFY4?=
 =?utf-8?B?S1FIMGN1aU9NODN2WHJRakwvbXROYVpqVktSQXNuTlpZRzFpTWwzSWVIeU9G?=
 =?utf-8?B?Y0tPRDI0YlJSQkFmblQ5YkdnNzlJdGlKVnZTdzFFTDA4cG8rdUVuU0FBcXRB?=
 =?utf-8?B?R1NWNWptOWgyOW1EVk5zWkY0a29jd1ZCdVIrRmxrMUNpdks5c3M3V1hYdENS?=
 =?utf-8?B?SU14eU9vWFI2ZDdmNEZsU1dUckZiaVZsaHIrOXdhWHVKbzkveVp2ZjZjQVhr?=
 =?utf-8?B?TUpaVnc1T1B6K1RWOS9pMUxibkcycENqR1FNZFFBRWk4ZkNJN2dqZ2tSc3M4?=
 =?utf-8?B?eXk5QU1GQVhoVmYweFlodkxNUW1Dd1lTNFE1azkvT3JHSEFWakxqTHJzWFpH?=
 =?utf-8?B?Um5oUVVwZUNYbks1bHNUOFhMaEhyalFRM2dzWUkzWDNCU1UrOFErV0VVWHN4?=
 =?utf-8?B?Mkk4T2NGdDBhYmtJT3l6anJQdm5hZUZmdk1lNVd1V2RFLzQ4b201TFNCM1J6?=
 =?utf-8?B?VFRtYmRmQjhLOEgvaFBOUlp3RFlZeml3YjJSNXU2NndmMUFSYkdyaU5VRGd5?=
 =?utf-8?B?YkFjVzV4L043STBkQ1ZMYmJGYnUyTmZ1ZzBBcUxpVEFGM1RzZjk4SDF6WTds?=
 =?utf-8?B?NGJ1L3NXcEQ1b1U2TEhOOFRWYUJvV3p6eFhHa3dNZHZYMjFEajVsaHBoa3dl?=
 =?utf-8?B?Zlp3R2hncXJjWGZNRXpQT21OYW1yc0FWZXhPd3dJcGgvMW85ZUR3Q1hiekxR?=
 =?utf-8?B?Rm9HZkZtYU9wYVZ4MWM2S2V5SFZOUDlEMEVJS1paU1JEaXdzRTRURVdycklD?=
 =?utf-8?B?NWNWdkJSTENtVU1BMy93cndGb3JNZTdaeEMyczN4V1FDUTZhTHFCSjcxNXdI?=
 =?utf-8?B?TmZyK0lxWlZWSzFaTDJ5b3BtOVNhOVA1c1dyRzJwcWxjUU5vU3RNRHU3bllZ?=
 =?utf-8?B?SmZYZmdMM0pBVmxrM2lnb0ZVTUxmQjYrdDlJUW8vUzZlK2ttN01uSVdrRnFl?=
 =?utf-8?B?dU85RGJOekc4cjBqZkM1MmNrbmNaUnBDbU0zYlczRVMzbUd2OFpZdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49de4d41-3007-4a02-f92f-08da1cc65ee5
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4206.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 20:52:35.1015 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P2SLjwJks7BIL2b0UQ9LUIeXwjIpNEKhn8xvOpqWrVTMSMiCZxCmAQmVh7AuD4/ceW0aPxrlABmK1KelPpDUvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB5529
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
Cc: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Jason Gunthorpe <jgg@nvidia.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/11/2022 7:44 PM, Christoph Hellwig wrote:
> From: Jason Gunthorpe <jgg@nvidia.com>
> 
> The device creator is supposed to use the dev.groups value to add sysfs
> files before device_add is called, not call sysfs_create_files() after
> device_add() returns. This creates a race with uevent delivery where the
> extra attribute will not be visible.
> 
> This was being done because the groups had been co-opted by the mdev
> driver, now that prior patches have moved the driver's groups to the
> struct device_driver the dev.group is properly free for use here.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   drivers/vfio/mdev/mdev_core.c    |  1 +
>   drivers/vfio/mdev/mdev_private.h |  2 ++
>   drivers/vfio/mdev/mdev_sysfs.c   | 19 ++++++++++---------
>   3 files changed, 13 insertions(+), 9 deletions(-)
> 

Reviewed-by: Kirti Wankhede <kwankhede@nvidia.com>
