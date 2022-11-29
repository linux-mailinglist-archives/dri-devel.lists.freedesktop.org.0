Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DCE63BD64
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 10:57:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DC9110E047;
	Tue, 29 Nov 2022 09:57:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20606.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::606])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEEB710E047
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 09:56:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RGxm8TTVvUpm9pOLfCzz16i6A5rsMZuciG1XL4ltro/D6MMkRvmaY20vci8RACT4DibhjTfb3Hz1CRTDiRrJmrjbhBkgEgs73XDuBVlOkZfTPSmaOUKbZb+CwBDSYjRob3lvHToymtd2wXQgH/rLTfJ1scrk2DDaUF5gFEnxD/bh23SatbZS0d7oMwNEjlRhUubq2u4nL1t67qvWpAcbTY46FkEOJg1Ei4C6Rn5uRXNzM9uIdCs0cqSl6CUPXXMT9HmYvvE2XutHOPLiAJnBlPjXDBNJTnkLWN2r+PUyCqt8+XtpBYaenwGPNPConCSjCwoFsSqQ+F8SLwh4oKD/Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V6PRemTzn8ld+fKOQ0cHU/Obs9oW009HqNQbFC+CHK0=;
 b=VH/H4+D9NzgzvXELtjflO4zoQ/2ubCjhloFIGHpbrk3xEtNp73T6eFqHQMaOp0sqZquPLhk3hAwGbt+hf5xfK+MJmePkM75MWVMdHjDZz89kUkegIy9GCTAa1N/brEcy7qhA7daaW0I9dTBwk+sO4JthouJW8qJecvZ+4T3cPqJAC2CokAHUXdaE4+qeMAxoe0cnAqMGXhpTlZi1HFAEwdL34ROH5M6ENdnGeOFU6KmX1Ath834hG35o+7+kQU5T+ttWyzUMjWH9cCo7IYeKvL7pKm5VKF4Qg+lGFaL23fbMTkLGZRDWjh5vTDolMgFU+lpM2gftBL2y/fGbm31D4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V6PRemTzn8ld+fKOQ0cHU/Obs9oW009HqNQbFC+CHK0=;
 b=ShoSFmHmdIAR9eSOXi7keBXnSVm7RP6sQVEbp6JuPmX0xUeGYz1RcQxF9NQ07OZasncEeGH8iucXEWatggal4gF6tQi27ZFuidwlaj8oAoL4mlO4tHgL+URQr0ch6dPKobCojce/dxwf4cUSGqE3I8iol0NFry2DGBrj7dzKZc0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH0PR12MB8128.namprd12.prod.outlook.com (2603:10b6:510:294::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.11; Tue, 29 Nov
 2022 09:56:51 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421%7]) with mapi id 15.20.5857.023; Tue, 29 Nov 2022
 09:56:50 +0000
Message-ID: <dea4806e-f96a-262a-e0d5-ae60c199458c@amd.com>
Date: Tue, 29 Nov 2022 10:56:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] doc: add dma-buf IOCTL code to table
Content-Language: en-US
To: Simon Ser <contact@emersion.fr>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20221128133853.355645-1-contact@emersion.fr>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20221128133853.355645-1-contact@emersion.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0003.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::13) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH0PR12MB8128:EE_
X-MS-Office365-Filtering-Correlation-Id: c12d01eb-bb17-4762-525f-08dad1f00954
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jbkYQw0zr9MkTEEcX7BMTwduxwMMFY3D5aUgYfJ9/bjJKKoilDYHZ0nCMPAlkJAqp3PdEaSZpxG7Qi6yXPLqV4IIYRwYfq44Okci1n/fv3LL5aC7kxvicgcGG7tzvsmqXxoOlEOSAEIzvF8Ltf2Knfv4aO/qIKKrKw+cpktbXbUqJHcpvWZZKOn2Uun2sGe3ZgofQKMHxLmkTL4JI9taSVpxNSkmwQskoYJX+EFKgin8yBS0kBnsFt0S4r8Y8BniSVsWue8T8/9DUKE1NmYfrGmPCWlMUzGd70Qi6AmZKAjSx5OGmF+4KWCmwHhLAPrnztDmVIi71tgTZs8Bh/Lp3ZA5fysDnuHL1CNRxQNKW4cOWxTZFPMumJjb9thJSfzESoLCltMqdaTrCduRkZ/D/LE0SP3qz7PGx3RKht5k1VQvsPDr0fJ+LImRS5dX1O1CjXI4S4QEL1rM0nn9PopedgchqY7SM+Yfht1/l95iYp+CgA/VDNDFaTzH94YBetSk7JxYDlmTePUZWb4I9AEf1rOVvsUZQSnjWpJnBgjMhb41N+GDGKXruTq0AWAD0xB40i7QXDpzsbAF0RjX0vnNNCrhfTiuXJB69z99WrKPxJhSQDouOpladpZis9en1NSGcY1w+5+NjIZcfYo940ou2TVhq1cZIbokh4h7dTTQEojFIr7B6NwPC/jjfYIxDRb5or7JoWyIDVR3WMs0IP2ngnuO84G/Xl72StnTsVKnXCY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(346002)(136003)(376002)(366004)(451199015)(8676002)(41300700001)(316002)(54906003)(66946007)(66556008)(4326008)(31686004)(66476007)(5660300002)(2616005)(36756003)(6486002)(2906002)(186003)(31696002)(6506007)(478600001)(8936002)(86362001)(38100700002)(6512007)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTBhK0ltb2UzL040d3ZNekhudjVCK2Nnb0tGOElBNkVRTXFaZCtXbWZYcXg0?=
 =?utf-8?B?bk9vNlRnWUhwV3dYUU42cUdoeGRtekkzVllGRHEwMzZXUFMzUFlyRlRRTXpi?=
 =?utf-8?B?V2kxYlIwNXYzSzRhM2tFVFJiMjN6QUZKNUdhNWF1TVhEUmRQK3ZMWVRyN0Jr?=
 =?utf-8?B?UzUrODB1bnlMT1JJYk83SVo4NGJtVUhmNCtjZ2dEU0dUM3ROMG52VmVQWUd0?=
 =?utf-8?B?WkwxbGZvY2p1R0hWRjliQU9GSDFDMlh3UFlNczUwell2czZHNi9vVzREb1V5?=
 =?utf-8?B?aW1CODVJbFNPejBXYVBlcFA4UnE2VkUyVVpXQjF2SE9NWWw2R2s1M3c0SjRU?=
 =?utf-8?B?Y1YybnB4cThTdHNrdUJkdnpqZDFHK2xHVUQxSms0WUFDcmxRZmNYaVpTOGxv?=
 =?utf-8?B?N0ZGR2k2Q3c5d0p6YmhzRktad05FQTNkOCt5WVUzdlZRT1pPcE5JdXZUQjdm?=
 =?utf-8?B?V1Y5YUpqMmVLUy92RjJ5TDB3MVRhZStmLzY2VGhxM1BhTXI3UlRlM09jbWhs?=
 =?utf-8?B?Yy9MQ25aTzA0bS9NT3RnRkZ2UW4vYktTZWRvVUJTSXg3bEpEUExWOHNkM2Vw?=
 =?utf-8?B?c0VtUUZIL2Z3Tng2dWxtaC82ZmlQeVNtOW5WY0xQaFdDUGhTbEprSHJxUlB5?=
 =?utf-8?B?TE42Zmx4bmlPMjZ3NHphRFBSdGlYdDFONTd4WTJsWVV2elB5Y2FrNGM3QjhH?=
 =?utf-8?B?TVE3aUEzMzRnckcrb0ZKZmJ6dE1EckQ2Vm1SWmNESUJJMDJ5N3dRdVhRemVH?=
 =?utf-8?B?YXBSbEp2VUM3blNJQ1lkanZrTkRJelNNbUxsTWNpc3o3aUxmVnM0eUQ0dThU?=
 =?utf-8?B?Vy9qa2d1eDNjQnJGaVR3UlFsZi9ZUGxqN1E5b1pzaGZRRk8xem9QRHFXWVZy?=
 =?utf-8?B?c1VGMmRCdHhrcTZobndtRExkNm1BcjVzSjVRc0c3T1QwWmI5OTdYNVBtU3g1?=
 =?utf-8?B?ZVBzdDdXaXpvbnowRktsMEtPQk41UklMUmwrMlBnejFoeFRER0t2KzkrYkxW?=
 =?utf-8?B?QUdYT2UzWmkzSWFvNFpnVDJhWFFPUTY0Z1RvMDNJeTY4WTZVQi85MU82VVoz?=
 =?utf-8?B?ckx0aTdObFc1SEFwc1R4akV1ZWJLMGFmZHM3akRkRlVXQ1B1UHFWUDlNejY5?=
 =?utf-8?B?bm0vVkp1NzNiQVFtKzRiOS9KcFFTSnJqUXMrY2hPQ2U5SU9oZjFYRjJDcFBv?=
 =?utf-8?B?ekRpMm90QmRaQ0JIRm9pc2dyMmFmUEM3a3dIcnkydXRoajJCMzFmZGVQQVVL?=
 =?utf-8?B?N2hUOHNvM2l4TnVHRTZJQzJCN2VtSDVJOU1KMHVTcFMzV3FvREhhMlVGTjdy?=
 =?utf-8?B?ZVdYc3BjcWhhcGlPM1UrVkNvbG5NRW0vQTEwL0wrcTAvdzBsSithSkFJakZB?=
 =?utf-8?B?VnAvbElQYmdOc2p2a25ickFoeDdaWjgrTExqSGY5UVNLVWlVcmZ2c0gybktk?=
 =?utf-8?B?b25oT20rN3pnOHVmbk9qdzg0bVZvcTIxcmJjYkQwR3dZQjN1UWtwTUV2WUpt?=
 =?utf-8?B?V1NIS2x6L2R2MjJEbDhLMExCbGtOUXBHRUZackhkRUxFcTBTVUlqM0NaaWhF?=
 =?utf-8?B?Vmd1RVhxT0haWGo2cm8wbEJJK1lHWkJNNnZUTVc2aXhrV2tuYys1K3BVQlVk?=
 =?utf-8?B?WXNTQ2RoQmRnc1BLNUJKQUpyNUc1Wm9hZTFScGIxdjNoUjZtZ1NUSllZVW5K?=
 =?utf-8?B?aEtsUW00VVZiN0piVEp2UjZldDdUV0x3T1VhYnl6aitzTlFkeW1lTjlZSTgw?=
 =?utf-8?B?RkRtSGpXbWhkVllTa3psRHBJUTVmZ1J2NzNhYzBQZ0YvczAxSUlYMFpDTFdx?=
 =?utf-8?B?S0hvaitielhWSVIrYXFYQWdDOUNhODNKOXdaZHY0aUdRWFdoY2Nxb2VPNWtX?=
 =?utf-8?B?cmRlYUtXUTQ2enNnSFd1bnY0L1F6ZnM0THFHMUFhV0kzM09NaDZrcXBVa1F2?=
 =?utf-8?B?WHI5elNIRDR6Y1hiRndxVjJQSWZ5dmJ3akVyemJFeERKTFdWTkZtMlJtaFhM?=
 =?utf-8?B?ZXBaQ3pUdGNBSU9FalJjT0JNQU1NZWxyMlhpQkVvc3loV0tLTVFKOTJ4cXVJ?=
 =?utf-8?B?cDc1eWw1QlpzckJZcHdGeERVUEFSWGFrT2ptREVQTWM2K0tnOTV2cHFXZ3A1?=
 =?utf-8?B?aVdiMHhPTWttMHl1QkRHeUlIekVrNEtnZnBSTVZadGFZWXhGbzlzSDROdXNo?=
 =?utf-8?Q?vV7Ypm8QS+Yjfci4YmMsRWVSAu4NoQiEursEWZPD9oZ5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c12d01eb-bb17-4762-525f-08dad1f00954
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2022 09:56:50.7723 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8qR1t2frYq2dO+ULJmsSa8N8Sb2+xM0DvqZQCxK7+ODjUoyAASIfxqfjB1be+CT6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8128
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 28.11.22 um 14:39 schrieb Simon Ser:
> The code 'b' is used for dma-buf IOCTLs.
>
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>

Reviewed-by: Christian König <christian.koenig@amd.com>

Should I also push this?

> ---
>   Documentation/userspace-api/ioctl/ioctl-number.rst | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
> index 5f81e2a24a5c..184a7a222701 100644
> --- a/Documentation/userspace-api/ioctl/ioctl-number.rst
> +++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
> @@ -221,6 +221,7 @@ Code  Seq#    Include File                                           Comments
>   'a'   00-0F  drivers/crypto/qat/qat_common/adf_cfg_common.h          conflict! qat driver
>   'b'   00-FF                                                          conflict! bit3 vme host bridge
>                                                                        <mailto:natalia@nikhefk.nikhef.nl>
> +'b'   00-0F  linux/dma-buf.h                                         conflict!
>   'c'   all    linux/cm4000_cs.h                                       conflict!
>   'c'   00-7F  linux/comstats.h                                        conflict!
>   'c'   00-7F  linux/coda.h                                            conflict!

