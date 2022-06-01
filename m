Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D03753AB4E
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 18:51:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5635B10EF5A;
	Wed,  1 Jun 2022 16:51:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2057.outbound.protection.outlook.com [40.107.93.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0AD010EF58
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 16:51:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n7n3gVJHlhLIYT1jOpG2Tpu4EUkMd9TAb69afAmInfisP6ZJ+9hhI8Pa9BdGCx4y8KddcqgdJUnnqjKULLkf5p9CZy5Mu+VnbKabHzeShsWp/S+LbMx1JYdcBFB3BNcqs8AyxiIB2EJxNCm3PMKE6oqgGeuOPHNNj00kcVeD9TByIKZwNAEMo0uE5GuqRgA77qScuwgazSqig78l73KQyXCV67iq1DxdxajYMhsDvSfeXw40OQsSX4mbD6cE+vRKNoDSQYvfLukoIh7zNPUQ59LU8Md+UYaAsUUEYiHhRoM2ndNDzoWxuk0ijnRNIuTH7Xa7KBQfQWJ/r7TObWEFyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pdxxRgwH6DjwpHFyTikFRlVXdk872gTmsvjNu+ARmUA=;
 b=EcazeilTMGyJLMyIONfTqs9vJ6t4WgB8uImznBJVQFB8Ip1iVfyXOKoIiZ/MM0sWvgpir5paze0dat1wZuaA7/k6v7fzc4FnpKsygrEfkRMvOoPIZCZ2uALXSngN/fRjSpdtbccyzQsED9TB+XXuGNnWnpJ9PJ0SFbI/VKhx72yRRM54+GOfo1H0D0g5GovhWEFQltBsTINF4bHCU8tN2MFqsgvQWBJlJM3TNZnjUJSEt94unYz1SoPygeW5ZIITSUlBhQHM42So6puvCIB6WoPTs6PufK8u5okvGCHzySJyAehevXo29bPVHsVo2nS3zjhA52VSqtoskaMnSWEkJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pdxxRgwH6DjwpHFyTikFRlVXdk872gTmsvjNu+ARmUA=;
 b=x7b57uNzyNEqUoSWav7ecpGJGLOUo99u5ozAQfZ3k1XViJCHIaj57OQSx6tMF3txfR7MhHl5fpHS9Emx3BoBmBUwHD78AD7t5ESmEqDZTNZZfKrwF+Eb7gNBsxtzoserRXjWKMTpJhtzkCNl/yW1bGmuD0rPZVKjQ2aju1IXbr0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN6PR12MB1539.namprd12.prod.outlook.com (2603:10b6:405:6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Wed, 1 Jun
 2022 16:51:50 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7146:65ee:8fd3:dd03]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7146:65ee:8fd3:dd03%4]) with mapi id 15.20.5314.013; Wed, 1 Jun 2022
 16:51:50 +0000
Message-ID: <72bfef32-23d0-2fc8-587c-5f6747c73a27@amd.com>
Date: Wed, 1 Jun 2022 18:51:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4] dma-buf: Add a capabilities directory
Content-Language: en-US
To: Simon Ser <contact@emersion.fr>, dri-devel@lists.freedesktop.org
References: <20220601161303.64797-1-contact@emersion.fr>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220601161303.64797-1-contact@emersion.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0367.eurprd06.prod.outlook.com
 (2603:10a6:20b:460::10) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40d6c193-c7c8-416b-ddc4-08da43ef05f7
X-MS-TrafficTypeDiagnostic: BN6PR12MB1539:EE_
X-Microsoft-Antispam-PRVS: <BN6PR12MB15394B77E32E1857592B7AFF83DF9@BN6PR12MB1539.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L7yB1T8tQICICUmKDrLlKuFynlVfV3PkXtpeq5SOXGtkFYbiT8HbPnfYEYJPw9Yhnnn9gCy2WCOznf7JkMoNENrfpbfVcyX4lo303dUmG11+3F0vhvXwq2mwqmAe83FZFmId3jWguo6UdTU5e7ZzVepRgjQLrJCuvby+8zugI8WTwpTIqrsRbWVaTsWFxgjnXNru+57rItG2zFHE2tCeHldvE4zE66jywQsinpJjWOwRFpHYLWiXrGKbubsZpr3mmOj219i59b8q3HA5cN+i/mKFGksLU7wSVdek8sHRjWfGV/IxW3qeIEce5cd2KEvgmpbwl4stZurlgnVgUp4tsbPav1HrqXox3WG8y6XnQsKY+DVRKnS2YTxq9nBjf6NqoS6IM92Wg77+hxDGH7eaGh/d1dlBBXTjGxRD923/P83RjetpEUNDBYMnh/3Rj3QP+4bMp/8iLuHNhLKfczlQVP7ybMK/ad4IM23bFFKG0S02vlLrGH2HxoixoV9PpCpPU40yeRpFQCtl/VAWHtM97RJ1GioK3iKPxPjQnrwNeUSmSXxjgVseIUDedWhnDQl2x25voo6TEC2Nr6tnGvgagoN61DsQvDRV9VVAEAkcCyiEcPbGh93Rj3aheE7Ohu6qQlNgIrsVs9ZznqF7v6o1mtOlTX50f1sQDHW/169V25TlPQHVk5peb0nUL/FjhL3PvGvddqGszVMveFT6Z50bhMtdF3Jids60qNaQ5S/Bs8c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(30864003)(2616005)(5660300002)(2906002)(54906003)(6512007)(8936002)(86362001)(6506007)(186003)(6666004)(31696002)(316002)(66574015)(36756003)(31686004)(508600001)(38100700002)(4326008)(8676002)(66946007)(66476007)(6486002)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WU1WS2M3NUxJRkhKUkxxK2E3c2UwMDNyenpSeEhWV3pya2dXNGVXYnNHdHlC?=
 =?utf-8?B?cjdjN3VTMlhCN3J0NE5HV281dUxPaGxWaFB4eXJZQTdtSFprTXRXZy9MSGFH?=
 =?utf-8?B?RnBmRVg3QmxIZVBFZkM4TkFVVkhmUlVmc3FDdjc0bjIzdFFtem9wc3ZHd0FD?=
 =?utf-8?B?dENkai9lcjQ4SGFWNkt1Q01hUDdFbFFhQlRHT1dKSk5Hc2RKb3kvWVdRaCt2?=
 =?utf-8?B?ank3L1RtYWovWUFWTitCYUU2S3VhZkFVR0l3cHQ2TTk2UUNuSVlRQ2VGRnQ3?=
 =?utf-8?B?aDhaMEV2Q2lXZDNrY0kvelRuNzBxNWVIMVNXR3hUeU5uMUVHd3l2cHNMSDMy?=
 =?utf-8?B?dW0zT0ZFSzl1TGFBc0poYlRGeDdKRkN3bitxZFRmT0VCRFNqeCtVcEhZdmxv?=
 =?utf-8?B?bGJYUzdiQ1BhYUVZdXk5Sk9PSHRUdXNkcWhSWU9BY2RWZkl4NzFlc3pEZWlj?=
 =?utf-8?B?T0VRNzZLZEF3bjllWEF5ZTJYeTlHMFZwbnk5UDhvcjVodGRjeWhrMG1MVFRy?=
 =?utf-8?B?aXVsSVJYang0dm5sTU1mbS96VldRdjViSElCbGkxalZOcTlrTHZPTmJNeldW?=
 =?utf-8?B?cEJqSEZ0dWZ3Y2xiWHlZNktKdzVNKytpcSs3MTZQYUl1RUp6SnBWTWx2alIz?=
 =?utf-8?B?TS9tMTN2R2F5dnRPcjZNeVkxbm9iV1AzOFl0OU5lZTlhamlPb0pYLzhDcHNE?=
 =?utf-8?B?bkpFa0JQOFBBM0Nwb2MzK3NhR1VLb0lzUCtoNDEvSEhHTWxXalZMaGIwVmls?=
 =?utf-8?B?R0tpdmwzSjNFeEVmRVNTZXRoSGNaMGFZMFpiajhZNjNMRmoraS81N2E1T1hK?=
 =?utf-8?B?QXlta3pzbCtGREZpUTBWc2wvbjNjc3g2V2E0bVB0eUpweFBNOHNqK3JqWVB5?=
 =?utf-8?B?cWdVOEkxUHBZSnhLL2NsRVpoeXhXS085K2lVMUo1RU1TZnVuSTZBZ0NtZ0JF?=
 =?utf-8?B?ZnNKRUh4aEk2dGpJekF5QkkxZTBaQ014V1ZLSllKN2V0MXRlMWI3SzM3NVcv?=
 =?utf-8?B?dEtpMHViMUNkWU40eFJ0SVhGTnhDU3g0MmNzYnRkdlY2Snl0RWRyRUtsUU03?=
 =?utf-8?B?Qit2VVpFZ1BlWHVNKzZZVUhrcWgrNXJnMkowNUdCdW16dTZxZVM1K3o0MGs1?=
 =?utf-8?B?azVvTzEvM3owcjBsVGFMeVU4d3ByajArc2ZLaVp2WnN2TEJCaXhvUFlmVXpu?=
 =?utf-8?B?d3R4c2FZN0lPMUNQRXZPMjlSbHBqVWlDTXMwYjhUU0k1NFhoNWlvOElWVUZ1?=
 =?utf-8?B?aklQZVp4dUFQbXk4T1JMU0o3bUs0NzdYK1ZkeUxKdDdsUitWTXpMMVlkR3hV?=
 =?utf-8?B?UUNoSVpyMnpUbW9aeDdKY0dqd2ZDVG1UUTRRbFEyOHhzTlBJMXpSVmRiRnFF?=
 =?utf-8?B?OGI5QTVoVDVDb0ZtcGhoR0VYTm93RGlsNk9Sb2ZieU1oYUFwU0dZNUdSb1pM?=
 =?utf-8?B?QmFZaEhxRHh4SzRqVkZ4WWNqOFVraXNEZk5HdUZBbXdWNnp0SHVKa3pPdzFm?=
 =?utf-8?B?TGtJelhhQjB2WTF6bE5TOEY3YytWZ1JJYVN2V05hWHYvaGlqRVhpbjJZUnl4?=
 =?utf-8?B?enJucm1GQWcyMENqblViMXR2dGIrZmhrcTZCNUd5V0gyV1loZlJNRUhsNjJY?=
 =?utf-8?B?ZndPQ3d4WjV1eVFUZS9MaXN4UkY5VVdOM3A4U0xOTk93eDZCemVVUXk4Rkto?=
 =?utf-8?B?UnQ3UWFiWlhBSExUQTZSZDFyS3dWc0I0b2k1Yys3ZGVWa3pPVzJ3Vk1KSFVi?=
 =?utf-8?B?L3hJR0RZK3JrbmY3ajV3eVIyZGV2dE1EK2hJMVkwQ0x2RzNoa1d1TmUvTHll?=
 =?utf-8?B?ekdlOVF3b211UmF2b2VXN0hmTEQxVGIwMTlKVzhLdk9CVDUwSDE1bGJFVkVB?=
 =?utf-8?B?ckl4M3djcDlWTSt1SGtvYU1tZCtEY3RvVU9YMGxWdVJwUDh2WFpvYzNJUytH?=
 =?utf-8?B?bHJnRTlqdGZRMmdjbWNyZ2owMTAxVVJJbjBFbk02ckYxV0pWWG1raDBQaFha?=
 =?utf-8?B?Y2IvTGVpaU15aTF4T0gyR1RUa3Y3UkpwNC9Zdzd4elFzbUZuNFBDQitXNmNU?=
 =?utf-8?B?K09TdUpKNlpsM0pLQ3J1UEJTeUdOaGllVlVGeDdKNE0xcEdHcUN1OFNMZlZt?=
 =?utf-8?B?ZFh4eTNwVmlBUkptTDY0UGVmZHVuSDlpVUtDQmMvcHBsUDBzZXRwaUtmMnlp?=
 =?utf-8?B?ZUszTlE2SEVRZTc1bURkd0hqdytWYzB0RktRVjd5aFZGSW1uT1ZXTHhzUDJD?=
 =?utf-8?B?NjlialBxUGxmT0o2TTZPS2hVb2huQm00VVpPOHRkYkRadnlVRzlncE1LOU5E?=
 =?utf-8?B?VEtsYVlhdmltd3ZxUHhoSkhnTHBPU01PTEZwbzNRcDBzdDBJVVFNNThvK1V6?=
 =?utf-8?Q?7Gqdob55dyRYJxVJYLL0ULGjZR7JnFmu74da/3vAU+U+M?=
X-MS-Exchange-AntiSpam-MessageData-1: 8YLTxh+DblfQAw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40d6c193-c7c8-416b-ddc4-08da43ef05f7
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2022 16:51:50.5533 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g4jlco8xkAcVy3/afA2/UE96hPiw7BskVviET0Ce2rGkPz63doFsTXoy8o2I8Tkq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1539
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
Cc: Jason Ekstrand <jason.ekstrand@collabora.com>, Greg KH <greg@kroah.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 01.06.22 um 18:13 schrieb Simon Ser:
> To discover support for new DMA-BUF IOCTLs, user-space has no
> choice but to try to perform the IOCTL on an existing DMA-BUF.
> However, user-space may want to figure out whether or not the
> IOCTL is available before it has a DMA-BUF at hand, e.g. at
> initialization time in a Wayland compositor.
>
> Add a /sys/kernel/dmabuf/caps directory which allows the DMA-BUF
> subsystem to advertise supported features. Add a
> sync_file_import_export entry which indicates that importing and
> exporting sync_files from/to DMA-BUFs is supported.
>
> v2: Add missing files lost in a rebase
>
> v3:
> - Create separate file in Documentation/ABI/testing/, add it to
>    MAINTAINERS
> - Fix kernel version (Daniel)
> - Remove unnecessary brackets (Jason)
> - Fix SPDX comment style
>
> v4: improve sysfs code (Greg)
>
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Reviewed-by: Jason Ekstrand <jason.ekstrand@collabora.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Greg KH <greg@kroah.com>

I can't judge about the sysfs API usage stuff, but everything else is 
Reviewed-by: Christian König <christian.koenig@amd.com>.

Regards,
Christian.

> ---
>   .../ABI/testing/sysfs-kernel-dmabuf-caps      | 13 ++++++
>   MAINTAINERS                                   |  1 +
>   drivers/dma-buf/Makefile                      |  2 +-
>   drivers/dma-buf/dma-buf-sysfs-caps.c          | 31 +++++++++++++
>   drivers/dma-buf/dma-buf-sysfs-caps.h          | 15 +++++++
>   drivers/dma-buf/dma-buf-sysfs-stats.c         | 16 ++-----
>   drivers/dma-buf/dma-buf-sysfs-stats.h         |  6 ++-
>   drivers/dma-buf/dma-buf.c                     | 45 +++++++++++++++++--
>   include/uapi/linux/dma-buf.h                  |  6 +++
>   9 files changed, 115 insertions(+), 20 deletions(-)
>   create mode 100644 Documentation/ABI/testing/sysfs-kernel-dmabuf-caps
>   create mode 100644 drivers/dma-buf/dma-buf-sysfs-caps.c
>   create mode 100644 drivers/dma-buf/dma-buf-sysfs-caps.h
>
> diff --git a/Documentation/ABI/testing/sysfs-kernel-dmabuf-caps b/Documentation/ABI/testing/sysfs-kernel-dmabuf-caps
> new file mode 100644
> index 000000000000..f83af422fd18
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-kernel-dmabuf-caps
> @@ -0,0 +1,13 @@
> +What:		/sys/kernel/dmabuf/caps
> +Date:		May 2022
> +KernelVersion:	v5.20
> +Contact:	Simon Ser <contact@emersion.fr>
> +Description:	This directory advertises DMA-BUF capabilities supported by the
> +		kernel.
> +
> +What:		/sys/kernel/dmabuf/caps/sync_file_import_export
> +Date:		May 2022
> +KernelVersion:	v5.20
> +Contact:	Simon Ser <contact@emersion.fr>
> +Description:	This file is read-only and advertises support for importing and
> +		exporting sync_files from/to DMA-BUFs.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 11da16bfa123..8966686f7231 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5871,6 +5871,7 @@ L:	dri-devel@lists.freedesktop.org
>   L:	linaro-mm-sig@lists.linaro.org (moderated for non-subscribers)
>   S:	Maintained
>   T:	git git://anongit.freedesktop.org/drm/drm-misc
> +F:	Documentation/ABI/testing/sysfs-kernel-dmabuf-caps
>   F:	Documentation/driver-api/dma-buf.rst
>   F:	drivers/dma-buf/
>   F:	include/linux/*fence.h
> diff --git a/drivers/dma-buf/Makefile b/drivers/dma-buf/Makefile
> index 4c9eb53ba3f8..afc874272710 100644
> --- a/drivers/dma-buf/Makefile
> +++ b/drivers/dma-buf/Makefile
> @@ -1,6 +1,6 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   obj-y := dma-buf.o dma-fence.o dma-fence-array.o dma-fence-chain.o \
> -	 dma-resv.o
> +	 dma-resv.o dma-buf-sysfs-caps.o
>   obj-$(CONFIG_DMABUF_HEAPS)	+= dma-heap.o
>   obj-$(CONFIG_DMABUF_HEAPS)	+= heaps/
>   obj-$(CONFIG_SYNC_FILE)		+= sync_file.o
> diff --git a/drivers/dma-buf/dma-buf-sysfs-caps.c b/drivers/dma-buf/dma-buf-sysfs-caps.c
> new file mode 100644
> index 000000000000..6eb27b81469f
> --- /dev/null
> +++ b/drivers/dma-buf/dma-buf-sysfs-caps.c
> @@ -0,0 +1,31 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * DMA-BUF sysfs capabilities.
> + *
> + * Copyright (C) 2022 Simon Ser
> + */
> +
> +#include <linux/kobject.h>
> +#include <linux/sysfs.h>
> +
> +#include "dma-buf-sysfs-caps.h"
> +
> +static ssize_t sync_file_import_export_show(struct kobject *kobj,
> +					    struct kobj_attribute *attr,
> +					    char *buf)
> +{
> +	return sysfs_emit(buf, "1\n");
> +}
> +
> +static struct kobj_attribute dma_buf_sync_file_import_export_attr =
> +	__ATTR_RO(sync_file_import_export);
> +
> +static struct attribute *dma_buf_caps_attrs[] = {
> +	&dma_buf_sync_file_import_export_attr.attr,
> +	NULL,
> +};
> +
> +const struct attribute_group dma_buf_caps_group = {
> +	.name = "caps",
> +	.attrs = dma_buf_caps_attrs,
> +};
> diff --git a/drivers/dma-buf/dma-buf-sysfs-caps.h b/drivers/dma-buf/dma-buf-sysfs-caps.h
> new file mode 100644
> index 000000000000..e40a93513f06
> --- /dev/null
> +++ b/drivers/dma-buf/dma-buf-sysfs-caps.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * DMA-BUF sysfs capabilities.
> + *
> + * Copyright (C) 2022 Simon Ser
> + */
> +
> +#ifndef _DMA_BUF_SYSFS_CAPS_H
> +#define _DMA_BUF_SYSFS_CAPS_H
> +
> +struct attribute_group;
> +
> +extern const struct attribute_group dma_buf_caps_group;
> +
> +#endif // _DMA_BUF_SYSFS_CAPS_H
> diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.c b/drivers/dma-buf/dma-buf-sysfs-stats.c
> index 2bba0babcb62..e2e62f83ce18 100644
> --- a/drivers/dma-buf/dma-buf-sysfs-stats.c
> +++ b/drivers/dma-buf/dma-buf-sysfs-stats.c
> @@ -141,23 +141,14 @@ static const struct kset_uevent_ops dmabuf_sysfs_no_uevent_ops = {
>   	.filter = dmabuf_sysfs_uevent_filter,
>   };
>   
> -static struct kset *dma_buf_stats_kset;
>   static struct kset *dma_buf_per_buffer_stats_kset;
> -int dma_buf_init_sysfs_statistics(void)
> +int dma_buf_init_sysfs_statistics(struct kset *kset)
>   {
> -	dma_buf_stats_kset = kset_create_and_add("dmabuf",
> -						 &dmabuf_sysfs_no_uevent_ops,
> -						 kernel_kobj);
> -	if (!dma_buf_stats_kset)
> -		return -ENOMEM;
> -
>   	dma_buf_per_buffer_stats_kset = kset_create_and_add("buffers",
>   							    &dmabuf_sysfs_no_uevent_ops,
> -							    &dma_buf_stats_kset->kobj);
> -	if (!dma_buf_per_buffer_stats_kset) {
> -		kset_unregister(dma_buf_stats_kset);
> +							    &kset->kobj);
> +	if (!dma_buf_per_buffer_stats_kset)
>   		return -ENOMEM;
> -	}
>   
>   	return 0;
>   }
> @@ -165,7 +156,6 @@ int dma_buf_init_sysfs_statistics(void)
>   void dma_buf_uninit_sysfs_statistics(void)
>   {
>   	kset_unregister(dma_buf_per_buffer_stats_kset);
> -	kset_unregister(dma_buf_stats_kset);
>   }
>   
>   int dma_buf_stats_setup(struct dma_buf *dmabuf)
> diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.h b/drivers/dma-buf/dma-buf-sysfs-stats.h
> index a49c6e2650cc..798c54fb8ee3 100644
> --- a/drivers/dma-buf/dma-buf-sysfs-stats.h
> +++ b/drivers/dma-buf/dma-buf-sysfs-stats.h
> @@ -8,9 +8,11 @@
>   #ifndef _DMA_BUF_SYSFS_STATS_H
>   #define _DMA_BUF_SYSFS_STATS_H
>   
> +struct kset;
> +
>   #ifdef CONFIG_DMABUF_SYSFS_STATS
>   
> -int dma_buf_init_sysfs_statistics(void);
> +int dma_buf_init_sysfs_statistics(struct kset *kset);
>   void dma_buf_uninit_sysfs_statistics(void);
>   
>   int dma_buf_stats_setup(struct dma_buf *dmabuf);
> @@ -18,7 +20,7 @@ int dma_buf_stats_setup(struct dma_buf *dmabuf);
>   void dma_buf_stats_teardown(struct dma_buf *dmabuf);
>   #else
>   
> -static inline int dma_buf_init_sysfs_statistics(void)
> +static inline int dma_buf_init_sysfs_statistics(struct kset *kset)
>   {
>   	return 0;
>   }
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 5e1b0534b3ce..61c5be57558e 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -30,6 +30,7 @@
>   #include <uapi/linux/dma-buf.h>
>   #include <uapi/linux/magic.h>
>   
> +#include "dma-buf-sysfs-caps.h"
>   #include "dma-buf-sysfs-stats.h"
>   
>   static inline int is_dma_buf_file(struct file *);
> @@ -1546,22 +1547,57 @@ static inline void dma_buf_uninit_debugfs(void)
>   }
>   #endif
>   
> +/* Capabilities and statistics files do not need to send uevents. */
> +static int dmabuf_sysfs_uevent_filter(struct kobject *kobj)
> +{
> +	return 0;
> +}
> +
> +static const struct kset_uevent_ops dmabuf_sysfs_no_uevent_ops = {
> +	.filter = dmabuf_sysfs_uevent_filter,
> +};
> +
> +static const struct attribute_group *dma_buf_sysfs_groups[] = {
> +	&dma_buf_caps_group,
> +	NULL,
> +};
> +
> +static struct kset *dma_buf_kset;
> +
>   static int __init dma_buf_init(void)
>   {
>   	int ret;
>   
> -	ret = dma_buf_init_sysfs_statistics();
> +	dma_buf_kset = kset_create_and_add("dmabuf",
> +					   &dmabuf_sysfs_no_uevent_ops,
> +					   kernel_kobj);
> +	if (!dma_buf_kset)
> +		return -ENOMEM;
> +
> +	ret = sysfs_create_groups(&dma_buf_kset->kobj, dma_buf_sysfs_groups);
>   	if (ret)
> -		return ret;
> +		goto err_kset;
> +
> +	ret = dma_buf_init_sysfs_statistics(dma_buf_kset);
> +	if (ret)
> +		goto err_kset;
>   
>   	dma_buf_mnt = kern_mount(&dma_buf_fs_type);
> -	if (IS_ERR(dma_buf_mnt))
> -		return PTR_ERR(dma_buf_mnt);
> +	if (IS_ERR(dma_buf_mnt)) {
> +		ret = PTR_ERR(dma_buf_mnt);
> +		goto err_sysfs_stats;
> +	}
>   
>   	mutex_init(&db_list.lock);
>   	INIT_LIST_HEAD(&db_list.head);
>   	dma_buf_init_debugfs();
>   	return 0;
> +
> +err_sysfs_stats:
> +	dma_buf_uninit_sysfs_statistics();
> +err_kset:
> +	kset_unregister(dma_buf_kset);
> +	return ret;
>   }
>   subsys_initcall(dma_buf_init);
>   
> @@ -1570,5 +1606,6 @@ static void __exit dma_buf_deinit(void)
>   	dma_buf_uninit_debugfs();
>   	kern_unmount(dma_buf_mnt);
>   	dma_buf_uninit_sysfs_statistics();
> +	kset_unregister(dma_buf_kset);
>   }
>   __exitcall(dma_buf_deinit);
> diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
> index 70e213a0d7d9..ab3afd5da75a 100644
> --- a/include/uapi/linux/dma-buf.h
> +++ b/include/uapi/linux/dma-buf.h
> @@ -114,6 +114,9 @@ struct dma_buf_sync {
>    * ordering via these fences, it is the respnosibility of userspace to use
>    * locks or other mechanisms to ensure that no other context adds fences or
>    * submits work between steps 1 and 3 above.
> + *
> + * Userspace can check the availability of this API via
> + * /sys/kernel/dmabuf/caps/sync_file_import_export.
>    */
>   struct dma_buf_export_sync_file {
>   	/**
> @@ -146,6 +149,9 @@ struct dma_buf_export_sync_file {
>    * synchronized APIs such as Vulkan to inter-op with dma-buf consumers
>    * which expect implicit synchronization such as OpenGL or most media
>    * drivers/video.
> + *
> + * Userspace can check the availability of this API via
> + * /sys/kernel/dmabuf/caps/sync_file_import_export.
>    */
>   struct dma_buf_import_sync_file {
>   	/**

