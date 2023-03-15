Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EA96BA862
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 07:50:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4754710E917;
	Wed, 15 Mar 2023 06:50:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2061f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe13::61f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDB8610E917;
 Wed, 15 Mar 2023 06:50:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TtnsFPvRI+ZCQTi6LDD1S9e0ihawTzV3SkGeWaXLE09RhbU4u1yw84di+bAAk8gy5ju0SbJuulFX4UeRYoEP480kmhyH7J7ClO/j9MT2Xs+CWbuKyawAhO5Ly7GDFU5+hVlEEEgSwDZDrq52vmzGaIY7nn7X3eXO/gboSL8HpZLLqD3DmXUlfaScuSrJUv6zsivuqArig/NymP0oKHD+4cFsAsWzyu8AIIgsjLG6rIE0w78G/8FOeR9IX+3Wh5zlIiIne6ENG11V+CZRyRfmMJkN7JD0emcF3e1e6bVqApvJCidDiW9HSPxLepnijj4XoY3yzpuNrP5g29Gg6Zvf/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jzbVl/yx5DrEE6/AjikLXbhVVWbYOKgadlMTX5tIky0=;
 b=ksFv/4W6hERb6StSGK7bjp+4ECt4bhwxLvPegIouq6JVrQcjpmE20Zd0SKHMUkyc9/4IMcvkxOj6SK5N+xIxmoC02jnhhW1LYf1YYgkV+eZirTsahTz2UfIosCln5ssYvyKn9xZQ8/W1AORqzFP+OhtcnUfgr1YWiT/2SQQ7Rrk5AERetAziwS43UVucMsjdIB1VjP7uIq+qf/SJpCq+NA9t89X7tVAq58NVxX/dFUk3NvDg+b7kEIJoyqPfh4tNJFNEAr1q3vvJs35Dt/aWjbQd/lKXk8ShF1GmC2XMWJcfiue9IHcdWIN/1tAF7GLBHMzrBQwWfKgdKncdgyzZNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jzbVl/yx5DrEE6/AjikLXbhVVWbYOKgadlMTX5tIky0=;
 b=LY6XifRS1dF1S/xHyDHLsrcgUEe0OV8C9+jnJq7jRDQAKgVd/a/Tyc0tZXDzH+hkwIaXUgWGrNJT2SR5sMT2rCT7JflEZE3YVtBipOCsENYMpao27U9Zy1Wn581OkW4HolIFc+KGxu1pduoHcwyFayNazQDKNxYi/wF0sI6OFwjQrhyBlUv7zso1ZsEg1q8jPObMY9zF5apLWxX1cKnnwDLkgg8fzsoMy6AsLxVbEm3VKCwVAVa4KfkkAPuEg/OtM/WIIN17xKU0u7soIv9Zmi6WSFcAHPATWJrscdjuo2tLhbHhb8TKidyQX/12wvJKoposUPqXLXiLBr3gH3fE6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBAPR04MB7445.eurprd04.prod.outlook.com (2603:10a6:10:1a7::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.29; Wed, 15 Mar
 2023 06:49:58 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Wed, 15 Mar 2023
 06:49:58 +0000
Message-ID: <f5e03f2a-8176-528f-e885-9a97940367c0@suse.com>
Date: Wed, 15 Mar 2023 07:49:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH 1/5] x86/xen: disable swiotlb for xen pvh
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20230312120157.452859-1-ray.huang@amd.com>
 <20230312120157.452859-2-ray.huang@amd.com>
 <ea0e3852-87ba-984b-4010-5eeac3d6c507@suse.com>
 <alpine.DEB.2.22.394.2303141747350.863724@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2303141747350.863724@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0139.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBAPR04MB7445:EE_
X-MS-Office365-Filtering-Correlation-Id: 06617256-5f83-46a7-42fd-08db25217d90
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IlAfPmXT9aa1mtt7WVL4rK5C5Wte7MHYwjaiMSgEceraEJEhBjT2p5G8jIzc+5alZiVt/D7+XFhH3sJf7r5odUEpwf5A9+k+dwaXDv/T/dJ/UZiyjqEWTIxgZ28P3VE+7zVKL2wO+cxQGm8+1cG2gJF8lZkiZm0VSx9gsxBOFdj2Wze0+n9wy2KwI+g88tRsUNCkMvXzA8rmTxxME/gpP9xKEXrQedoC//jWi2AONgo9kQ2T5SdzzqUooXg4xUqy/51SMeJ5FXsw7djEpcLTRKIEOlZzckBQYSsAUvleTuScQ0CWzSMjMVPrb/tnQvgms96W4N3FzxAeGEHeazLUyjPtKTz7Oqt9bNIRPF1o8VmU7tq9YBv4QtfsNEtTH15tZEjRKIZ43t9iQtL8vdV0aZlECvCmtodtzlFl1siAN/G/SGmzoYOXcQ4BZ25ko4/GzLq3qXa1FubSNsmMaKuZnrvIZYLqMQh3N26f1xFRo0gILcfBI++zt2ztd9zP05vyiPkp1gb1JsbTc0OpD+yidT39tR6+3J0QoOZYvWUz40Z9pQFrReRZSNSELLKtbeIvXQ0LNaVT8jjTsarfpiewtJ9WAkCzaMmZk6vnaoerrdb6EdRZuMg6v+awQtIlw9kJG76l/9jVcQv4JJwo1O6Ymzd17CzJh2MtpXDzmNyRfASLIyH859+c1fx2ilm/uyh6gUfCjl8S1Dv4li83T8/64Y0vfpzcx7RFzmtmhUw86AY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR04MB6560.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(376002)(346002)(366004)(39850400004)(136003)(451199018)(36756003)(7416002)(5660300002)(83380400001)(478600001)(6666004)(6486002)(6506007)(26005)(53546011)(6512007)(2616005)(186003)(66476007)(66556008)(66946007)(8676002)(6916009)(41300700001)(4326008)(8936002)(31696002)(86362001)(54906003)(316002)(38100700002)(2906002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MjN5ZDhJY0huRTNMeGxNbEV0anM4RitmUnNTc1hDajJMc0plZklDT1pUQWNR?=
 =?utf-8?B?cldvWlJqS3lLZ3JHdnhva2g4NEFPQjhZdURqVXM3Q1k2YW5PWS9YbGxOUzRt?=
 =?utf-8?B?OUxIdmpFaFQ4bEdwaVRQSTZqTUhGaEo0WW9sRzRnOTUwYkx1VlR3K2dTVWwr?=
 =?utf-8?B?YzNrVkd5OTcvMCtJRzBCckJENnpMS1NsMWo0UmZIL202NkMrQkl6V2lRb0Vj?=
 =?utf-8?B?ZXBFdFZETE05Yk43MTVEWStpc0tNS0tGOXgxRUVJQXpMSEt0eXFnUDhJVGRp?=
 =?utf-8?B?ZE0zYUliUzJSMEUzMk5UZHpTOE10dEhLR0l4YVJWTzBmNTBNY2NkcklMT0Ns?=
 =?utf-8?B?VVA5TEhmM3RKditYS3hPalJ5UC9tcDBTVFNGVkVPVzhZSzZLWVFOZVA1OWFC?=
 =?utf-8?B?L2ZDN1RkOXZ2K3NkRWdPeEVYWnAzUlJuSkVmQjdtNG1wSUlXeStsRGdTTkxj?=
 =?utf-8?B?OTBTSmU3VjJzRWdrTnZza0VORE1Zd0h6VzNiQkc4NW1ocW4xbVFWQk9leUNq?=
 =?utf-8?B?OXF6ejJGQW9kdUdnNGM2SjcwVzdzQkFHOCt6dm9JMnlFTG1PUzdxMzJ4SlF6?=
 =?utf-8?B?Tzl1NjAxckk2cDl1ZGd5VmpnVWM0SjRuUkZrc0s0TVhkelhFN3hBN1UxZWpV?=
 =?utf-8?B?RVVvN1V4ZzM3Rk5jczBLMTk1cXlXMWpQNEdOQlEwSVlObnc2MXNNMEhwRzVh?=
 =?utf-8?B?WEp4d3RDMVo2QXBlMkV0Ui96SWJwbjFTZTdnelhVOFQzUlF1VEFEZVdiMy9j?=
 =?utf-8?B?cm52czllN3M4amErck1MN2VOb09GNDhOVjh1anhTVnEzYXRibExUT05ZYkNP?=
 =?utf-8?B?UlhLQzBNcUoxNGFnU0xCZjRiNjlQVjVhWlBnTW9JNWhTMGFHdGY3U2hDWkx5?=
 =?utf-8?B?RTBnSXVmYXhRRGNzTEF3RlBYVU9WVmZBN1E1bjRTdG1DQmJXL0ZVNEdXS1hP?=
 =?utf-8?B?WTJ3SE5pREdGYWNpQllHT2hvSE5QZTNvM01UOHcySWNpcTVRMzZNVmRhVDlG?=
 =?utf-8?B?SlRBTW5PbGxvZ3F2cXZ0QVdObmY0dDZJa0E0cHVjeFh5enhqY254VFF3THF3?=
 =?utf-8?B?WkY1Y2tzTjRjQzR3UDRlUXIzc0hoNS9ua2UyZFZrNzRBNFM5Qk8yZ2VwRGFB?=
 =?utf-8?B?V1UxcENQNkdYbmJrRlozMHpnOXdrTXRWYVJNQk9JYUlkWlo4Q2RMTFgvOFFE?=
 =?utf-8?B?dmNzV2M5YTc2aC9GMWJQNVl5dDl0UmV4VklNc3R4VlNXYW15Mkd0ZGc3WExD?=
 =?utf-8?B?VDBEMms0WmpNVXczRlFJNnFLNjhBQVhtRVNrTGJ4RlRKOUNObG05WDdkeHBB?=
 =?utf-8?B?b28yV2pMck00WG9Dcms3Mzh5ck5VUmhPWS9PUWtaTVczS2oybUpidnh6U29E?=
 =?utf-8?B?bnAySlNxTkRBYVpBZHdpZ2U1M2JteWJRVTgyN2JoL0hVcmdWK08zMDYwVEF1?=
 =?utf-8?B?RGdESnErM0s0VDgxWXkxa0I3TkJCNzZrN3JvaFo3T3NZZ3NsQnJCZkFnSVlm?=
 =?utf-8?B?d1FWWUx3RXBZZ0FMaGRhQkF6UDN5dFJ1RVpPOU9lKzZsN3F0WTAybWI2SGVO?=
 =?utf-8?B?YlF6UldYN2laNTlUVU1iOW8xV2ZhTThPczNLNk01VU1KRnJERnk5Uk0yYnU1?=
 =?utf-8?B?YnQ3NlFQbHNZS0lpTGxpcWh1WFhUNVZUZTNta0lkZENzd2JKa0NKWTJwL1Jh?=
 =?utf-8?B?QktvQ3lKN2o3MVNVMzU1UVFZM2hwLzdxbzd5OGxyMG41ek1lQ2NYMW8rMldN?=
 =?utf-8?B?WjJQcXdrcmE3d0w1NDc3aElOeXBCVGYwQU42cjVUd3RoZ25HS2FQNE4yZkEz?=
 =?utf-8?B?dlZMajZQNXlWT2xmaC9rQUY1VlpydFJCT1kwdTcxcWx3anFud3dxNXQ0RFE5?=
 =?utf-8?B?VHVPSDUvbS9wcHNteGlsbVA0cTc1ayt2dTVSa1BGeVVHaXhUTGdWbXJEK3Y1?=
 =?utf-8?B?Z0I0cy9uK2NoaXBEdk5pN0t2ZTJyQm1weHVJU1IwczZIeE1YT2U2TUJoMGNa?=
 =?utf-8?B?cXBVbEQ2RXdlOXR6YzhSbmlmV2Q2KzhRWFZLdjN6V0VsYk1VRVhNVUUwN1ls?=
 =?utf-8?B?Z0grMTJzS0IzTTBEUGJWcmVJcE1VcUFFakllZHhuSFhEcm1DTlhHU0N4RElS?=
 =?utf-8?Q?RDC+kEvfm5GlxIdh/6CyiglsP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06617256-5f83-46a7-42fd-08db25217d90
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 06:49:57.6936 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DnfelH2g0m+8jfsfZsnfdbaZEgAoSmTBn/mC+WznUvdWV9/BZovw7KTH+VGGL9SHdRx3YaWN8k/3I+gatVbDfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7445
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
Cc: Juergen Gross <jgross@suse.com>, Honglei Huang <honglei1.huang@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Huang Rui <ray.huang@amd.com>, Chen Jiqian <Jiqian.Chen@amd.com>,
 Xenia Ragiadakou <burzalodowa@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Julia Zhang <julia.zhang@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15.03.2023 01:52, Stefano Stabellini wrote:
> On Mon, 13 Mar 2023, Jan Beulich wrote:
>> On 12.03.2023 13:01, Huang Rui wrote:
>>> Xen PVH is the paravirtualized mode and takes advantage of hardware
>>> virtualization support when possible. It will using the hardware IOMMU
>>> support instead of xen-swiotlb, so disable swiotlb if current domain is
>>> Xen PVH.
>>
>> But the kernel has no way (yet) to drive the IOMMU, so how can it get
>> away without resorting to swiotlb in certain cases (like I/O to an
>> address-restricted device)?
> 
> I think Ray meant that, thanks to the IOMMU setup by Xen, there is no
> need for swiotlb-xen in Dom0. Address translations are done by the IOMMU
> so we can use guest physical addresses instead of machine addresses for
> DMA. This is a similar case to Dom0 on ARM when the IOMMU is available
> (see include/xen/arm/swiotlb-xen.h:xen_swiotlb_detect, the corresponding
> case is XENFEAT_not_direct_mapped).

But how does Xen using an IOMMU help with, as said, address-restricted
devices? They may still need e.g. a 32-bit address to be programmed in,
and if the kernel has memory beyond the 4G boundary not all I/O buffers
may fulfill this requirement.

Jan
