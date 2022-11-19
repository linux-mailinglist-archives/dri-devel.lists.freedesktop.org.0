Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C58E630EFB
	for <lists+dri-devel@lfdr.de>; Sat, 19 Nov 2022 14:30:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A885410E0AE;
	Sat, 19 Nov 2022 13:30:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E14010E0AE
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Nov 2022 13:30:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lh/VU615o73bA5d2Tv6XnCwBrexHPDJK+SUMZBSLk9//GrfAEkE+V4m7WcAHsyarI2B3P7pvX9xS69L2kUv3PA1npuJTj6pVxXS5u2RO7Iq6/hAipRZjudRQsAYVcNy9lIAuduhS+8MyMIyr48sDWrIU9M2BoD+TVm0J/8q1eZzWFhNhjVaG4m1vOvbAEHZEgQFQtgnlmt4We588+N/4sadYlWkIOKuqlfOj97/bn42Yop5fVxg3HehOB1/LdxGkjzJ6XijORIfGAH7hl0X6JQhxCpw54Y4mpMUTnqFD+bHMbAJEHlVJwXAMfqXWUIFtTNZT+eRgBsE2j3QtBs27TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H+lIdGgpexxfLeR9oQ7+r/5l6u/vuyO22ixlLxnMaJw=;
 b=OduMyeznJU2stFBUHsX4mVJV7eVE8cRpvpAH/tR7rofDly3eetNrHwknVxPvwZ2+CzPExSfXAips5v38DhtI+gpyx2kFrZSV4jfjlO7E201ZSASSX/2RLLdtEzjZex+tToUb3g1VsBsAJXda3wmD+Fn8F4Bpzz2gTATfrDFmpILJWmw5FYzujXBcWblvIaEFy3acQ2d93F+jM2KViJCXgiX/rOlRGVs5HkrDp2UDq3sau2v1TWWOE4PFj0JBKw83gUGxnXnx7vt7kBxQb+vWwcfFCK2TH9S7Gc6I4SHGI9VqxY3/AccRUDVGpQ1L3ls2bS++svKgGLJVxOiv+eeCmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H+lIdGgpexxfLeR9oQ7+r/5l6u/vuyO22ixlLxnMaJw=;
 b=DeMG2cBWV7PkffAXNGvVsYgj+tmwWJfJ1mP9Hzn65Ks/ZFMRBUUk52LW5HFZQxGkmrrVnkViU2iULt3sFvZSVgdhS+oitDEajIq5wSW2/JPmADqOlhDNxxMVn0C79dX8Bq/oMxpO6gxBn0KPPVMWOEhBuN6G75ULr6+ylbFwNPE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM4PR12MB5796.namprd12.prod.outlook.com (2603:10b6:8:63::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Sat, 19 Nov
 2022 13:30:25 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421%7]) with mapi id 15.20.5834.009; Sat, 19 Nov 2022
 13:30:24 +0000
Content-Type: multipart/alternative;
 boundary="------------MRzKSxRHy2Vmz8qgKSY9N9hJ"
Message-ID: <83944425-c177-7918-bcde-9cf7296a613f@amd.com>
Date: Sat, 19 Nov 2022 14:30:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] dma-buf: Fix possible UAF in dma_buf_export
Content-Language: en-US
To: "T.J. Mercier" <tjmercier@google.com>
References: <20221117062152.3029018-1-cuigaosheng1@huawei.com>
 <f12a5dbe-4626-f6c7-236b-30bb16be1dd6@quicinc.com>
 <99d3aee6-ba3e-5333-6f79-ddbcfc0e8843@amd.com>
 <CABdmKX1UMB0L0PmHB59nijReZef6LUQ3XKXitHZo2YnUrJTz9Q@mail.gmail.com>
 <2c9fa595-e788-5474-4f2b-ffbd08a70d13@amd.com>
 <CABdmKX0KJJV0iQwy0aUNXcLc1DGyLjmh6_Y53asHEoh-uyHzAA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CABdmKX0KJJV0iQwy0aUNXcLc1DGyLjmh6_Y53asHEoh-uyHzAA@mail.gmail.com>
X-ClientProxiedBy: FR2P281CA0148.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::6) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM4PR12MB5796:EE_
X-MS-Office365-Filtering-Correlation-Id: 15d2cda4-8272-4799-8be8-08daca3236db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yy5yWCTVV1pVM8AtdeYFKxJQmRYmcBaUSv1bA8ZAnVdg5XexlGVVlwJjDVqsJGx1nr39FHjqaoXYNcnJGWSG0IPciF9CDolmJD5lBVEo90Sbt4uFrYATZ9QBq0rqzrFvHvNLwydI+ws65mR0e+JNrCEjwenxI6U2+rHjydEKUSICJGuaCZe8+2AdN5gdNI+651J7Od3Mb5jtgT/rqygmb3F4hLCkjx1+OrTOfO2ZHp43bJIRbx6431uupYbQ7LFcr6QWJiqOggkEspmLQd2tzSXJS1GcuvMYFQZUknlmg7q6XXVCSY4/gUKOOStf9rMLqVBy0b+K/NMCRy7KY5QHcsGaRsMjJCBt1v8eGZPhCFZUpiCpdRRPyI3o4yVlqniQjD2HXGGaM2Pvib2EQLv38cBnPylZz9oaK4Pwzd9vio2RWBUx/+pcS9ftNTKaYukVp3LKgPWw0vY9rB0BQuOLxdIdWm4pXdbd2dg43DG4t9OeZbr37mH1bl2dOUjqhahvuS4XLI73pG8b3MY0e7L9E3fhReNABRfH4fZWE0eJVDK58TxIM82K06wC+Fejt6lMbhqHnJy+puMXAZ58ZWxhHcWxU/mwIRf26zV90Xl7bZqMNB9uXkCdEy5i0U5+0YAShJ5Gv+xNcZsfk2UZjXz4uGpb0zgWiW7ufUHzVIpYK3g/+YV4LLZGzBgOzNWTET9giOKPIA4YmJQ26kwI1CrUFxg5QgeIZzRRsO2WJhl/8/t50A/ZREy2iTCqOFZG+muj1K0mK17eyCX6tlCYVsjaVA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(396003)(366004)(136003)(39860400002)(376002)(451199015)(30864003)(4326008)(5660300002)(66946007)(66476007)(66556008)(8676002)(31686004)(54906003)(41300700001)(316002)(8936002)(6916009)(6506007)(478600001)(2906002)(186003)(36756003)(66574015)(33964004)(53546011)(6666004)(2616005)(6486002)(45080400002)(6512007)(38100700002)(83380400001)(166002)(31696002)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVZUOTNZYUpxRFJ6VEdnTmNMeXY1ZlR5N1RpVjZaekFIL2NvVkkyZ1J3cU52?=
 =?utf-8?B?UlJUQnZFbE50Tk5IUytabDhTR1pmME00ZmhHOHFBOEJINGJmbnNJa1cxMnlj?=
 =?utf-8?B?aVJlclQxTkZiYXVrTXFBZU1xQllIR2hRNWxRY0NLTUVMS1hVdDNVTFliMEsr?=
 =?utf-8?B?bGJkWGZRS1hRTnVOY3Vvb3lsY0R6YlFZRis3emFQT0pHTjNTMHNOV3dkOVhx?=
 =?utf-8?B?TURkSk9ubGZORVhVM3p0SGZhOUxVWVVWWWxGT0VhYnlETkQwaFFQWHNneHJO?=
 =?utf-8?B?NnZPV1JjTjRIcXBQRklSRGdlSVFwZkszV1c0ajNwamxzMk9ESHkwVEVHVUVy?=
 =?utf-8?B?RUs0alNteTQ3S1FXZU5CbFRmLzhpeFZoKzBQWXpSNlIySGV2WjJRZzl6NVcy?=
 =?utf-8?B?ZGM4b09hZDQ4VCt5Tzc3WVd2QkFreGlxWXhRYmdHNmlFQXBTVDlhbnIwQThj?=
 =?utf-8?B?MXNhK0ZnRGhkQnc2ZE9hVmxsemptV3A4RlZIY01wd1Z0NDQwSHJncWVPTVlC?=
 =?utf-8?B?NjB2TVJjcmhpV096MTR4UTdoMUhybWlEZlkyblRkV1l6MW1uVHp2N3Mza0xH?=
 =?utf-8?B?VUtBQmVqTVpRWHlWSjJOVGNoOUpLNWtONmFjUnduT3BBVkd4OEZ1TTMrSFdQ?=
 =?utf-8?B?NGhIRTJBLzFyRzJ3N29PWUgxMS9YY1d2aGF5a3VCWkVVRklIQWFkUENlYUVk?=
 =?utf-8?B?ekUvVjlKdkJZMUhGUzFnSXRaWUt3Y1ZvNmJPQ25Sc3lzN2FXQitQMlJ6MjNN?=
 =?utf-8?B?M1JHYy8vRGM3eHowSlFPeUNKenFiZEIzMnE4aWdGeWNlN0tLRHh0NHBEN0o0?=
 =?utf-8?B?dUVrMFQ5cVFkSXdXbnZHY3pnM0dwZ0NvUW95TWtwV3RzeXBpN0lSY3lwWUVT?=
 =?utf-8?B?ZjE3ZWtRWE5MQlptWGNhQ2VmS3lISkt0cENHVVdaOVEyRXZYTzBMQjBoRTEz?=
 =?utf-8?B?OEd0Q2xGTFVjY2picGV4ZjhCeCtxNGZjOW1hSk1GbnpmVTdUY1NuTVhrSjBB?=
 =?utf-8?B?WHhhTU9zWStmZTZYbXVrdXhiR1BOTXprMTdMTnVBN3JMcmZ1RDk3b0RBenAw?=
 =?utf-8?B?M3hQTTA0R0JBd2RvaFE1ZURoMXgrYmtpVFJhdXlXQThOdGQzV0hUbVc5cjlZ?=
 =?utf-8?B?c2Y0c0FUQmIySmd6djhDVkNJcHBqai9OZGRvRlhadm1wSk5ydk5yQUoyNUkv?=
 =?utf-8?B?d0F6Z0NhNHhrSVpHOVprcnYxc0RsMm5lU2JmdWQxU3prWkh0TDFKdXV4a0ty?=
 =?utf-8?B?aGxtcnBsVTU5MEhEakZzdTlMbnc0NnBTUi82L0lxcDU0d2ozL2tNSVlUYmdI?=
 =?utf-8?B?WEdKMFk0ZWY4eTV1dmZSNFYyVFo1WDdNK042RExLS2wxOHFjaGtHYlREM3NN?=
 =?utf-8?B?cldSczJDSnpOSHJVbHZreTcyVEhiLzZEVGpVVjBXcG10eFlqZUlUNnNGbTVw?=
 =?utf-8?B?Sjh5OXI4ZHFzdkhNWE15TlZVa2owOEo0bUh5emhsdUpmRHprdE9pVndoQWFX?=
 =?utf-8?B?bEFXUm9JaFkreVhNRmlLMG4raCtKV0xFTS9vbGtOQ3g0VFlRdUhRMDhoVjhr?=
 =?utf-8?B?U1lFb3AwZzZnbEwremNIVThWQlM4bHdsV0hCclFtNkVWTzcrc2RKd0RQTEIx?=
 =?utf-8?B?Zjk0YjNlaVdXMFFVNXFOd1BWT0ZlaS8zelZ3UHd0SkJxejZUSTVrLzBndU8z?=
 =?utf-8?B?T3RkK0luSWZxbXh4UUQyM1VHWXlFRHRTM2lNUExrd0FQRWt4NUpveEMyeVF0?=
 =?utf-8?B?UmRzSjVMaWpxVm51VTZkNmJTYmlXc2ZFSk0yUzlKdXB6ZHE3MXlRK2FMcUVr?=
 =?utf-8?B?UGViM3JRY3BxaTBueWgvMnFBWkg3RGJUM21pL3J1WlM3VjV0RnlCNk5OeW9K?=
 =?utf-8?B?NzgwaHR1S21rY1UvRFoyWjhQRC81MXJ1K2tvOURPZjQxQlVCOVM5d1pKTThP?=
 =?utf-8?B?RDU1dGFTeHVyVWdja3hQVjkvWjljRCtjK0hDVjM1aEUvT1g0eDNXNHoxSytQ?=
 =?utf-8?B?SGhneTlpTk9aZU5WcjFzT3B0eklVcXUvellvQ2NadUlUY3dvQTNwNlFWQU5i?=
 =?utf-8?B?NzRNQ1JTWWIyRmdPV2IwdHJpbXRqR25sNTBDVERXemVDOFZsNkRFeHVwNGlN?=
 =?utf-8?B?RzhtK3lJY0VvKzNpbFFkc09pWEJrTCs0WUlLVXBjSlpXUjdYMkw5RjlVaG9X?=
 =?utf-8?Q?+tAMTsNe5ZMo5l2v5VnB2HvNrIrQ4ei7zZuj84McRAZB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15d2cda4-8272-4799-8be8-08daca3236db
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2022 13:30:24.5442 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TGnb1ocN2q3J836iDs/YytGd1ZuaTanem1zddFEadv/b2A9BifdMXKfZ4IQIeZdh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5796
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
Cc: Pavan Kondeti <quic_pkondeti@quicinc.com>, dri-devel@lists.freedesktop.org,
 sumit.semwal@linaro.org, linaro-mm-sig@lists.linaro.org,
 Charan Teja Kalla <quic_charante@quicinc.com>,
 Gaosheng Cui <cuigaosheng1@huawei.com>,
 Dan Carpenter <dan.carpenter@oracle.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------MRzKSxRHy2Vmz8qgKSY9N9hJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 18.11.22 um 18:05 schrieb T.J. Mercier:
>
>
> On Fri, Nov 18, 2022 at 12:27 AM Christian König 
> <christian.koenig@amd.com> wrote:
>
>     Am 18.11.22 um 03:36 schrieb T.J. Mercier:
>     > On Thu, Nov 17, 2022 at 2:16 AM Christian König
>     > <christian.koenig@amd.com> wrote:
>     >> Am 17.11.22 um 08:48 schrieb Charan Teja Kalla:
>     >>> Sometime back Dan also reported the same issue[1] where I do
>     mentioned
>     >>> that fput()-->dma_buf_file_release() will remove it from the list.
>     >>>
>     >>> But it seems that I failed to notice fput() here calls the
>     >>> dma_buf_file_release() asynchronously i.e. dmabuf that is
>     accessed in
>     >>> the close path is already freed. Am I wrong here?
>     >>>
>     >>> Should we have the __fput_sync(file) here instead of just
>     fput(file)
>     >>> which can solve this problem?
>     >>>
>     >>>
>     [1]https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fall%2F20220516084704.GG29930%40kadam%2F&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C7d87a302d300479ecfa608dac90dc9f4%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638043358319479671%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=erPl1hGdfLbfCxK3J3xiIR9boJbgj6hPUnCBvZFobog%3D&amp;reserved=0
>     <https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fall%2F20220516084704.GG29930%40kadam%2F&data=05%7C01%7Cchristian.koenig%40amd.com%7Ca7d0f99c9d8440a4c6d208dac98717cd%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638043879326367851%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=V38k91cCy446dyGpmRQWTNn5U8u2zSfCAgIRmACukq4%3D&reserved=0>
>     >> That doesn't look like the right solution to me either.
>     >>
>     >> Essentially we have two separate tear down methods for the dma_buf
>     >> object here:
>     >>
>     >> 1. It's not completely initialized and we can call
>     kfree()+module_put()
>     >> to clean up.
>     >>       There is actually a dma_resv_fini() here. That should
>     probably be
>     >> fixed.
>     >>
>     >> 2. The dma_buf object is fully initialized, but creating the
>     sysfs stats
>     >> file failed.
>     >>       In this case we should *not* clean it up like we
>     currently do, but
>     >> rather call fput().
>     >>
>     >> So the right thing to do is a) fix the missing dma_resv_fini()
>     call and
>     >> b) drop the setting d_fsdata=NULL hack and properly return
>     after the fput().
>     >>
>     > This looks right to me if by properly return you mean return
>     > ERR_PTR(ret); at the end of err_sysfs after the fput. (letting
>     > dma_buf_file_release and dma_buf_release do the full cleanup)
>
>     Yes, exactly that's the idea.
>
>     The only alternatives I can see would be to either move allocating
>     the
>     file and so completing the dma_buf initialization last again or just
>     ignore errors from sysfs.
>
>     > If we still want to avoid calling dmabuf->ops->release(dmabuf) in
>     > dma_buf_release like the comment says I guess we could use
>     sysfs_entry
>     > and ERR_PTR to flag that, otherwise it looks like we'd need a bit
>     > somewhere.
>
>     No, this should be dropped as far as I can see. The sysfs cleanup
>     code
>     looks like it can handle not initialized kobj pointers.
>
>
> Yeah there is also the null check in dma_buf_stats_teardown() that 
> would prevent it from running, but I understood the comment to be 
> referring to the release() dma_buf_ops call into the exporter which 
> comes right after the teardown call. That looks like it's preventing 
> the fput task work calling back into the exporter after the exporter 
> already got an error from dma_buf_export(). Otherwise the exporter 
> sees a release() for a buffer that it doesn't know about / thinks 
> shouldn't exist. So I could imagine an exporter trying to double free: 
> once for the failed dma_buf_export() call, and again when the 
> release() op is called later.


Oh, very good point as well. Yeah, then creating the file should 
probably come last.

Regards,
Christian.

>
>     Regards,
>     Christian.
>
>     >
>     >   >
>     >> Regards,
>     >> Christian.
>     >>
>     >>> Thanks,
>     >>> Charan
>     >>> On 11/17/2022 11:51 AM, Gaosheng Cui wrote:
>     >>>> Smatch report warning as follows:
>     >>>>
>     >>>> drivers/dma-buf/dma-buf.c:681 dma_buf_export() warn:
>     >>>>     '&dmabuf->list_node' not removed from list
>     >>>>
>     >>>> If dma_buf_stats_setup() fails in dma_buf_export(), goto
>     err_sysfs
>     >>>> and dmabuf will be freed, but dmabuf->list_node will not be
>     removed
>     >>>> from db_list.head, then list traversal may cause UAF.
>     >>>>
>     >>>> Fix by removeing it from db_list.head before free().
>     >>>>
>     >>>> Fixes: ef3a6b70507a ("dma-buf: call dma_buf_stats_setup after
>     dmabuf is in valid list")
>     >>>> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
>     >>>> ---
>     >>>>    drivers/dma-buf/dma-buf.c | 3 +++
>     >>>>    1 file changed, 3 insertions(+)
>     >>>>
>     >>>> diff --git a/drivers/dma-buf/dma-buf.c
>     b/drivers/dma-buf/dma-buf.c
>     >>>> index b809513b03fe..6848f50226d5 100644
>     >>>> --- a/drivers/dma-buf/dma-buf.c
>     >>>> +++ b/drivers/dma-buf/dma-buf.c
>     >>>> @@ -675,6 +675,9 @@ struct dma_buf *dma_buf_export(const
>     struct dma_buf_export_info *exp_info)
>     >>>>       return dmabuf;
>     >>>>
>     >>>>    err_sysfs:
>     >>>> +    mutex_lock(&db_list.lock);
>     >>>> +    list_del(&dmabuf->list_node);
>     >>>> +    mutex_unlock(&db_list.lock);
>     >>>>       /*
>     >>>>        * Set file->f_path.dentry->d_fsdata to NULL so that when
>     >>>>        * dma_buf_release() gets invoked by dentry_ops, it exits
>

--------------MRzKSxRHy2Vmz8qgKSY9N9hJ
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 18.11.22 um 18:05 schrieb T.J. Mercier:<br>
    <blockquote type="cite" cite="mid:CABdmKX0KJJV0iQwy0aUNXcLc1DGyLjmh6_Y53asHEoh-uyHzAA@mail.gmail.com">
      
      <div dir="ltr">
        <div dir="ltr">
          <div class="gmail_default" style="font-family:arial,sans-serif;font-size:small"><br>
          </div>
        </div>
        <br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Fri, Nov 18, 2022 at
            12:27 AM Christian König &lt;<a href="mailto:christian.koenig@amd.com" moz-do-not-send="true" class="moz-txt-link-freetext">christian.koenig@amd.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">Am 18.11.22 um 03:36
            schrieb T.J. Mercier:<br>
            &gt; On Thu, Nov 17, 2022 at 2:16 AM Christian König<br>
            &gt; &lt;<a href="mailto:christian.koenig@amd.com" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">christian.koenig@amd.com</a>&gt;
            wrote:<br>
            &gt;&gt; Am 17.11.22 um 08:48 schrieb Charan Teja Kalla:<br>
            &gt;&gt;&gt; Sometime back Dan also reported the same
            issue[1] where I do mentioned<br>
            &gt;&gt;&gt; that fput()--&gt;dma_buf_file_release() will
            remove it from the list.<br>
            &gt;&gt;&gt;<br>
            &gt;&gt;&gt; But it seems that I failed to notice fput()
            here calls the<br>
            &gt;&gt;&gt; dma_buf_file_release() asynchronously i.e.
            dmabuf that is accessed in<br>
            &gt;&gt;&gt; the close path is already freed. Am I wrong
            here?<br>
            &gt;&gt;&gt;<br>
            &gt;&gt;&gt; Should we have the __fput_sync(file) here
            instead of just fput(file)<br>
            &gt;&gt;&gt; which can solve this problem?<br>
            &gt;&gt;&gt;<br>
            &gt;&gt;&gt; [1]<a href="https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fall%2F20220516084704.GG29930%40kadam%2F&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7Ca7d0f99c9d8440a4c6d208dac98717cd%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638043879326367851%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=V38k91cCy446dyGpmRQWTNn5U8u2zSfCAgIRmACukq4%3D&amp;reserved=0" originalsrc="https://lore.kernel.org/all/20220516084704.GG29930@kadam/" shash="ieRIwtZCsqNLyz+VNp3uDCXDEBO2AipZlVgH68yc0pi73UxVelyvquG6ezi3TfichHqBK3iW3rV/NiwhiXbMZfPrvlEOVQU7erD2EE3HrSOQn5pXaUbfPArTnw6TXeAEOQk0x1L/Jf+pBvPreiEGB53nViw5koD0pBgbRWf1xxY=" rel="noreferrer" target="_blank" moz-do-not-send="true">https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fall%2F20220516084704.GG29930%40kadam%2F&amp;amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C7d87a302d300479ecfa608dac90
 dc9f4%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638043358319479671%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;amp;sdata=erPl1hGdfLbfCxK3J3xiIR9boJbgj6hPUnCBvZFobog%3D&amp;amp;reserved=0</a><br>
            &gt;&gt; That doesn't look like the right solution to me
            either.<br>
            &gt;&gt;<br>
            &gt;&gt; Essentially we have two separate tear down methods
            for the dma_buf<br>
            &gt;&gt; object here:<br>
            &gt;&gt;<br>
            &gt;&gt; 1. It's not completely initialized and we can call
            kfree()+module_put()<br>
            &gt;&gt; to clean up.<br>
            &gt;&gt;&nbsp; &nbsp; &nbsp; &nbsp;There is actually a dma_resv_fini() here.
            That should probably be<br>
            &gt;&gt; fixed.<br>
            &gt;&gt;<br>
            &gt;&gt; 2. The dma_buf object is fully initialized, but
            creating the sysfs stats<br>
            &gt;&gt; file failed.<br>
            &gt;&gt;&nbsp; &nbsp; &nbsp; &nbsp;In this case we should *not* clean it up like
            we currently do, but<br>
            &gt;&gt; rather call fput().<br>
            &gt;&gt;<br>
            &gt;&gt; So the right thing to do is a) fix the missing
            dma_resv_fini() call and<br>
            &gt;&gt; b) drop the setting d_fsdata=NULL hack and properly
            return after the fput().<br>
            &gt;&gt;<br>
            &gt; This looks right to me if by properly return you mean
            return<br>
            &gt; ERR_PTR(ret); at the end of err_sysfs after the fput.
            (letting<br>
            &gt; dma_buf_file_release and dma_buf_release do the full
            cleanup)<br>
            <br>
            Yes, exactly that's the idea.<br>
            <br>
            The only alternatives I can see would be to either move
            allocating the <br>
            file and so completing the dma_buf initialization last again
            or just <br>
            ignore errors from sysfs.<br>
            <br>
            &gt; If we still want to avoid calling
            dmabuf-&gt;ops-&gt;release(dmabuf) in<br>
            &gt; dma_buf_release like the comment says I guess we could
            use sysfs_entry<br>
            &gt; and ERR_PTR to flag that, otherwise it looks like we'd
            need a bit<br>
            &gt; somewhere.<br>
            <br>
            No, this should be dropped as far as I can see. The sysfs
            cleanup code <br>
            looks like it can handle not initialized kobj pointers.<br>
          </blockquote>
          <div><br>
          </div>
          <div class="gmail_default" style="font-family:arial,sans-serif;font-size:small">Yeah
            there is also the null check in dma_buf_stats_teardown()
            that would prevent it from running, but I understood the
            comment to be referring to the release() dma_buf_ops call
            into the exporter which comes right after the teardown call.
            That looks like it's preventing the fput task work calling
            back into the exporter after the exporter already got an
            error from dma_buf_export(). Otherwise the exporter sees a
            release() for a buffer that it doesn't know about / thinks
            shouldn't exist. So I could imagine an exporter trying to
            double free: once for the failed dma_buf_export() call, and
            again when the release() op is called later. <br>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    <br>
    Oh, very good point as well. Yeah, then creating the file should
    probably come last.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:CABdmKX0KJJV0iQwy0aUNXcLc1DGyLjmh6_Y53asHEoh-uyHzAA@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            <br>
            Regards,<br>
            Christian.<br>
            <br>
            &gt;<br>
            &gt;&nbsp; &nbsp;&gt;<br>
            &gt;&gt; Regards,<br>
            &gt;&gt; Christian.<br>
            &gt;&gt;<br>
            &gt;&gt;&gt; Thanks,<br>
            &gt;&gt;&gt; Charan<br>
            &gt;&gt;&gt; On 11/17/2022 11:51 AM, Gaosheng Cui wrote:<br>
            &gt;&gt;&gt;&gt; Smatch report warning as follows:<br>
            &gt;&gt;&gt;&gt;<br>
            &gt;&gt;&gt;&gt; drivers/dma-buf/dma-buf.c:681
            dma_buf_export() warn:<br>
            &gt;&gt;&gt;&gt;&nbsp; &nbsp; &nbsp;'&amp;dmabuf-&gt;list_node' not removed
            from list<br>
            &gt;&gt;&gt;&gt;<br>
            &gt;&gt;&gt;&gt; If dma_buf_stats_setup() fails in
            dma_buf_export(), goto err_sysfs<br>
            &gt;&gt;&gt;&gt; and dmabuf will be freed, but
            dmabuf-&gt;list_node will not be removed<br>
            &gt;&gt;&gt;&gt; from db_list.head, then list traversal may
            cause UAF.<br>
            &gt;&gt;&gt;&gt;<br>
            &gt;&gt;&gt;&gt; Fix by removeing it from db_list.head
            before free().<br>
            &gt;&gt;&gt;&gt;<br>
            &gt;&gt;&gt;&gt; Fixes: ef3a6b70507a (&quot;dma-buf: call
            dma_buf_stats_setup after dmabuf is in valid list&quot;)<br>
            &gt;&gt;&gt;&gt; Signed-off-by: Gaosheng Cui &lt;<a href="mailto:cuigaosheng1@huawei.com" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">cuigaosheng1@huawei.com</a>&gt;<br>
            &gt;&gt;&gt;&gt; ---<br>
            &gt;&gt;&gt;&gt;&nbsp; &nbsp; drivers/dma-buf/dma-buf.c | 3 +++<br>
            &gt;&gt;&gt;&gt;&nbsp; &nbsp; 1 file changed, 3 insertions(+)<br>
            &gt;&gt;&gt;&gt;<br>
            &gt;&gt;&gt;&gt; diff --git a/drivers/dma-buf/dma-buf.c
            b/drivers/dma-buf/dma-buf.c<br>
            &gt;&gt;&gt;&gt; index b809513b03fe..6848f50226d5 100644<br>
            &gt;&gt;&gt;&gt; --- a/drivers/dma-buf/dma-buf.c<br>
            &gt;&gt;&gt;&gt; +++ b/drivers/dma-buf/dma-buf.c<br>
            &gt;&gt;&gt;&gt; @@ -675,6 +675,9 @@ struct dma_buf
            *dma_buf_export(const struct dma_buf_export_info *exp_info)<br>
            &gt;&gt;&gt;&gt;&nbsp; &nbsp; &nbsp; &nbsp;return dmabuf;<br>
            &gt;&gt;&gt;&gt;<br>
            &gt;&gt;&gt;&gt;&nbsp; &nbsp; err_sysfs:<br>
            &gt;&gt;&gt;&gt; +&nbsp; &nbsp; mutex_lock(&amp;db_list.lock);<br>
            &gt;&gt;&gt;&gt; +&nbsp; &nbsp; list_del(&amp;dmabuf-&gt;list_node);<br>
            &gt;&gt;&gt;&gt; +&nbsp; &nbsp; mutex_unlock(&amp;db_list.lock);<br>
            &gt;&gt;&gt;&gt;&nbsp; &nbsp; &nbsp; &nbsp;/*<br>
            &gt;&gt;&gt;&gt;&nbsp; &nbsp; &nbsp; &nbsp; * Set
            file-&gt;f_path.dentry-&gt;d_fsdata to NULL so that when<br>
            &gt;&gt;&gt;&gt;&nbsp; &nbsp; &nbsp; &nbsp; * dma_buf_release() gets invoked by
            dentry_ops, it exits<br>
            <br>
          </blockquote>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------MRzKSxRHy2Vmz8qgKSY9N9hJ--
