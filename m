Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0AE1363069
	for <lists+dri-devel@lfdr.de>; Sat, 17 Apr 2021 15:45:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 075A46E0DF;
	Sat, 17 Apr 2021 13:45:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-001d1705.pphosted.com (mx07-001d1705.pphosted.com
 [185.132.183.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF13D6E0D1
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Apr 2021 13:45:01 +0000 (UTC)
Received: from pps.filterd (m0209326.ppops.net [127.0.0.1])
 by mx08-001d1705.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13HDa5ut028883; Sat, 17 Apr 2021 13:44:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=S1;
 bh=FIYgSnmAVjYQO0YZCpmFSZbA+N33lXiBD8dve9NOCE8=;
 b=Pm7n6qXbW7j0u1ZqIX4qq/czfifRbAn6okdpoflAB3gQ526bVUgideYHRtX20kByi44h
 +Kx6LO3HpTlcvj0povsPdWjFPfUYiHqhMyW9exZ95VB53pYc1Ubrhy4gj4dtRXPi8xCn
 rYeDQdMUxm6InQEs1ebZ7a0VAopBuKanTbLkcN3umjM7O2hIbLWpy+teVPmBniHuY25r
 gq4Byh2Y1AZ4g1J3P5/vxS+279t/f6xOR618tXLoUauj3snRauRg4FQdsVXl1/HJ2C46
 eeBp0dZoLeenEz9IA5Aga5UAW71WCaLFxccDJdy3CKTnTb3fY/1prsc5nDxci7oQyFnF IQ== 
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2051.outbound.protection.outlook.com [104.47.13.51])
 by mx08-001d1705.pphosted.com with ESMTP id 37ynvkr6w8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 17 Apr 2021 13:44:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TcMkkYpO8iEmUtTawBHz+qgqOOkstO2Exjst5dOT0C0IzMCWN/wZuVDq6Y4y1ciuHMNZ+qHVVTfK8kPIBC8msVrQP68sFofYrJaVprg9DxRhXce6DRU9/0c6C1XcpL4qpS/NjM0E84Xcw8MVirWYfq++ZxrAkYMZjVcdKh0HDrXTeZymPF47RQMQeKV28/rMCIPs8q9mlilVA5WpCTof8FooI5kXQd3DGGRJ4AgGiiHkbKegbEFKpZMhnvGu6ao9bXFD9PBT+Pv5Vs4lGqy7bsJZ99wXg8iy5FUz0dTEIsiqlXO24wNO8ApgWPB6tltEchYN97Bf3sNUI9Cv1+xfTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FIYgSnmAVjYQO0YZCpmFSZbA+N33lXiBD8dve9NOCE8=;
 b=i4pbw8Kufqw3u30I64ziZ1imQpJ5FA1SssJKkLmsNjykL1PnLhX22SOWa6HxVDwaYTj6ybqPcMo54uhdyYF4AkOLD0YMVjZuzHv7T8UWo+osy3yCioEcC+hULRGhZAABAr/QkKPa3chblrJON9T7bG2JtJgDD/irgyChM/vKcBxHstDM3aM+dSg7ACjthRAwIhAuE8Cx2ScHK5rXtJwT1q7ZxidotiLZGR2fzEsj5sUklKL3QNXw6lUumO/SjFV+6g7FsxFmCkw46Xcd41CbqyBiSRd/U5wP2MF++FwZXuVrd757uo+eqi9KrXVqdrZwBNrONAsmP4d04mbPhVKCXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from AM9P193MB1491.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:306::20)
 by AM0P193MB0578.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:166::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Sat, 17 Apr
 2021 13:43:58 +0000
Received: from AM9P193MB1491.EURP193.PROD.OUTLOOK.COM
 ([fe80::35b3:3e5e:6533:84e0]) by AM9P193MB1491.EURP193.PROD.OUTLOOK.COM
 ([fe80::35b3:3e5e:6533:84e0%5]) with mapi id 15.20.4042.021; Sat, 17 Apr 2021
 13:43:58 +0000
From: <Peter.Enderborg@sony.com>
To: <songmuchun@bytedance.com>
Subject: Re: [External] [PATCH v4] dma-buf: Add DmaBufTotal counter in meminfo
Thread-Topic: [External] [PATCH v4] dma-buf: Add DmaBufTotal counter in meminfo
Thread-Index: AQHXM3Yw6ll+UCWErEeaPUdSTn+rzaq4rmwAgAAKFYA=
Date: Sat, 17 Apr 2021 13:43:58 +0000
Message-ID: <ac32baa5-94a5-bf7b-661e-aca66c0850bc@sony.com>
References: <20210417104032.5521-1-peter.enderborg@sony.com>
 <CAMZfGtWZwXemox5peP738v2awsHxABcpYeqccPunLCZzRXynBQ@mail.gmail.com>
In-Reply-To: <CAMZfGtWZwXemox5peP738v2awsHxABcpYeqccPunLCZzRXynBQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: bytedance.com; dkim=none (message not signed)
 header.d=none;bytedance.com; dmarc=none action=none header.from=sony.com;
x-originating-ip: [37.139.156.40]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0d3df87c-1106-4dea-28c4-08d901a6da0f
x-ms-traffictypediagnostic: AM0P193MB0578:
x-microsoft-antispam-prvs: <AM0P193MB057817756DADD468E71E2533864B9@AM0P193MB0578.EURP193.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BUbVEqZ3V1mo5MZCdT32Y226PSKK28/NR0XE9sKemDNS+yOuwuXSq77bHlPRuyf46YKfMx52wG+OZZ+98LhL8ZueyPm00mv9kVR3Atw4cFNA9eUoBJZKJrO6rzDBY+gxRkp8Eou1JzhuDH1JejDFj5yjfVNgbvckLparxHw+sWOcAyHZ+Zc3DCssqx3DbzZNGakkwHchMrAokdP4TD3c9bRywrG5ppuBFWVOBfeGmgZVE4ZKjfW0twrLlJ3DjHH3eMPzWXcIDI5GMvmpFqxaAnxngeTrxJlv1tTIK8lTGMLjeId57Uul6BGZq/omNL+2EGZ1IvsYjDO9C1rGgmlSD6V/z4/EjQZpwPYhvCuHWfwmITdBDuM1cE3neMnym53rXRskOOrnQjXsZAKl2kQmzR/IHGziQKovmkVqtvc0AAJ+Nudr+K3/GsOKe05Ht2tIaHlbDE1PHub0LRP1lueYm/urxvXyjVtFzVl/Zzh6VBhmJyi8glRYbIhV8fLGuKIMKbRds6XpYCYIT4ceAue+R28fF4upiEMAui3iXuLUDh/y80oSlT6yPOOWzsIJLvxrWN90xITtGe7Tr4F1NGSpAsavxLbBPNAUZoLDiquX77FoP4WXpsadzeEoCpFb+DRpbFTg4Eu8e1+YhCI3EwSjpBjMj4Hp8kdrUJn6i14ewgSxUH36u5kVs0P/g6gnwRf4
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9P193MB1491.EURP193.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(376002)(39840400004)(396003)(6916009)(8676002)(6506007)(53546011)(478600001)(5660300002)(2616005)(83380400001)(6486002)(66556008)(8936002)(31686004)(36756003)(7416002)(4326008)(54906003)(71200400001)(2906002)(76116006)(186003)(316002)(66946007)(38100700002)(31696002)(66446008)(66476007)(64756008)(86362001)(6512007)(26005)(91956017)(122000001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?V2QwQ0pJSjkvK0JBeHB3QUQ4Q1M3N0JQQlZQY2dDOWxLV1Zub1ZBMnRPYVFY?=
 =?utf-8?B?NnU5THNMSGNYeU9hQ2NadkdROTFhQmd3R3JUQk9INy81RnVNcHJFQ0dUTzRN?=
 =?utf-8?B?L2djVzRjT0ZlQ25rZFJvUWxSMjg5MW1qd1dpcWI0MkxCbXFRWjZYNkRwNTRI?=
 =?utf-8?B?cE1pWTd1dFNPZ201UXQ2R1B2SGpLNGpNWmk0VlVKUDV0bTFHdk5NMDcreFY1?=
 =?utf-8?B?dlNBSkozV25PK0h3bU1jbkdSbkhlNVJKRldxbDB1eEJRczA3Ky9GOVE4eEVX?=
 =?utf-8?B?WEJqN25xaGlqRW1oOUpZcDVkRDdaa2E1R0lGMmlldDQ3MERMYURmWFFSeWJK?=
 =?utf-8?B?UnN0dWVwQ21lS1JyWWM2SDV0SjJsQkJGWFo4S0lPYUIvekV5Yll2NW9HWUhh?=
 =?utf-8?B?K00rQ1M4Qks1Q2V2U3F3Z21sQUdOOFAzSjBoNUJoQ0UzSnBOOFR2TnpsNTVB?=
 =?utf-8?B?Q29DanRISXNwQVpSVXB3SEE0UjBMTnppR3paQTRrYTNNSyt2SnRWVms1a3Rv?=
 =?utf-8?B?QWpRMWhvM3F4SkY1SFNJdTNndStDc1FrOTF0MjJVR3FxNTVFYnBVbUlnQWor?=
 =?utf-8?B?QVRiN2lHK3RTN29JdXhvS0hGVmVtblNjNUMrNjdXNW53TjNsMDBDanQzdTYy?=
 =?utf-8?B?aEs4bFdEYUNVaUdKQmJiVk5sdHhaSFkvZkVPVkFSekdlY282THVySThUREpF?=
 =?utf-8?B?REQvTjJJOU83TGR1K1NoakF4R043aEcyMk1rdGlObzhQQ0pjZTJ4Vld1MEcw?=
 =?utf-8?B?NWQzUkNPTXJ5UVRyb3d5VlNiRmFWalR6NzlzVW1ZV2wyRUJuM2JUOHV4UDRI?=
 =?utf-8?B?cVZwdWF1Y0FleEVUb2JXUGd1Y2xJOEZCcjd3UmI5RmlabFl3UERvcWpQRERG?=
 =?utf-8?B?NmJBTzU5THc0L2wyMnZMa3BlN1l1N1JaNEpzV1ZLRGxHZzNXVDUzN1A1cXBz?=
 =?utf-8?B?TktyenVnVk5GNWRkbVNJT2o3ZndxTnoydkhBeHdlRHVWeGo4aFYwVlRkQzVZ?=
 =?utf-8?B?SkU4VkRlQXUxVndWUWpEdVF5amtTaGE0bi9wdlYzdkxiVzhkd2xRcmJvZFhN?=
 =?utf-8?B?VFcydUt3Sm9yRnArNTlOSWlvK1dNenZzYVlQZTJGakRTTWFwOG56VUxDMEdq?=
 =?utf-8?B?RkViUGQzVU13UTNBYytiWmxUcEpLZlRRYml3VSt0VkoyTklqTWRZTjVpa1oz?=
 =?utf-8?B?bjZjRGxWaEYzdE12QXZuYnBsMTgwTStXRy93eCtEZlcwclZycUFGSWdwZnVi?=
 =?utf-8?B?M01BY3J6QnJxTFVsLzEzRXQxVXFJOFdTL0NuSWNpaGxJdDByQ2xIQ0QxZS9R?=
 =?utf-8?B?Z0VsMnlYTllWNi83MjhlWTBid09pSHNlOTdmSlF4T292eWZLOXd2bnV0MEU4?=
 =?utf-8?B?MWpkY0N1OTR6RDlySWR3QXR4WE5LRUZtUTBlNDR0emRKM2NnWHVoU3NyUG5O?=
 =?utf-8?B?TTFxbjdFVTNUVDd0MGE3MC9CV25NVHQ5OHA4NFRiM2FUOWRJVzgxUTd4TVhI?=
 =?utf-8?B?R212UzVzT2Y2U2JYMWxTakdsUTkwcWxZNjV6M09LbytkdHdoTVhyRjZKcDJZ?=
 =?utf-8?B?YjFJbTVBUm9Kd3dHMDZDMEc5b1NhNS9EMDBoaXNaejVOYkt3aVlQY2RueXpK?=
 =?utf-8?B?NlRMR2RKRjNKeVBxOXlGQ1BZZEN4Si9rclJZdXpzWVJuZ2hwWi91cFNMMm1J?=
 =?utf-8?B?ckc3YTJLZ2x6eldaQmZ3UysxRCtpL24yekpUaVhYS25oTExnUkUvakpvOHlM?=
 =?utf-8?Q?f/xqyfOdL77dv3Anr6Gfd9bwYNshzXi/672ZaZw?=
x-ms-exchange-transport-forked: True
Content-ID: <2E16C310D6431544AFA55D9E4C377D5D@EURP193.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9P193MB1491.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d3df87c-1106-4dea-28c4-08d901a6da0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2021 13:43:58.3574 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hqYvEcwhaeWF8vxtwPHjPu/uWdPNy5hqNLz2giwXTYdbOi2gHrEJkH8Et4/CAIITXuEln/brrdguiKqG1QOhaXkBDvXmGHELMABaojj1gf4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P193MB0578
X-Proofpoint-ORIG-GUID: CcUlwSf88ipuyyWt2LD_k6szu02v3Lf7
X-Proofpoint-GUID: CcUlwSf88ipuyyWt2LD_k6szu02v3Lf7
X-Sony-Outbound-GUID: CcUlwSf88ipuyyWt2LD_k6szu02v3Lf7
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-17_09:2021-04-16,
 2021-04-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 impostorscore=0 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104170096
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
Cc: mhocko@suse.com, neilb@suse.de, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, adobriyan@gmail.com,
 linaro-mm-sig@lists.linaro.org, shakeelb@google.com, willy@infradead.org,
 samitolvanen@google.com, guro@fb.com, linux-fsdevel@vger.kernel.org,
 akpm@linux-foundation.org, christian.koenig@amd.com, rppt@kernel.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/17/21 3:07 PM, Muchun Song wrote:
> On Sat, Apr 17, 2021 at 6:41 PM Peter Enderborg
> <peter.enderborg@sony.com> wrote:
>> This adds a total used dma-buf memory. Details
>> can be found in debugfs, however it is not for everyone
>> and not always available. dma-buf are indirect allocated by
>> userspace. So with this value we can monitor and detect
>> userspace applications that have problems.
>>
>> Signed-off-by: Peter Enderborg <peter.enderborg@sony.com>
>> ---
>>  drivers/dma-buf/dma-buf.c | 13 +++++++++++++
>>  fs/proc/meminfo.c         |  5 ++++-
>>  include/linux/dma-buf.h   |  1 +
>>  3 files changed, 18 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>> index f264b70c383e..197e5c45dd26 100644
>> --- a/drivers/dma-buf/dma-buf.c
>> +++ b/drivers/dma-buf/dma-buf.c
>> @@ -37,6 +37,7 @@ struct dma_buf_list {
>>  };
>>
>>  static struct dma_buf_list db_list;
>> +static atomic_long_t dma_buf_global_allocated;
>>
>>  static char *dmabuffs_dname(struct dentry *dentry, char *buffer, int buflen)
>>  {
>> @@ -79,6 +80,7 @@ static void dma_buf_release(struct dentry *dentry)
>>         if (dmabuf->resv == (struct dma_resv *)&dmabuf[1])
>>                 dma_resv_fini(dmabuf->resv);
>>
>> +       atomic_long_sub(dmabuf->size, &dma_buf_global_allocated);
>>         module_put(dmabuf->owner);
>>         kfree(dmabuf->name);
>>         kfree(dmabuf);
>> @@ -586,6 +588,7 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
>>         mutex_lock(&db_list.lock);
>>         list_add(&dmabuf->list_node, &db_list.head);
>>         mutex_unlock(&db_list.lock);
>> +       atomic_long_add(dmabuf->size, &dma_buf_global_allocated);
>>
>>         return dmabuf;
>>
>> @@ -1346,6 +1349,16 @@ void dma_buf_vunmap(struct dma_buf *dmabuf, struct dma_buf_map *map)
>>  }
>>  EXPORT_SYMBOL_GPL(dma_buf_vunmap);
>>
>> +/**
>> + * dma_buf_allocated_pages - Return the used nr of pages
>> + * allocated for dma-buf
>> + */
>> +long dma_buf_allocated_pages(void)
>> +{
>> +       return atomic_long_read(&dma_buf_global_allocated) >> PAGE_SHIFT;
>> +}
>> +EXPORT_SYMBOL_GPL(dma_buf_allocated_pages);
> dma_buf_allocated_pages is only called from fs/proc/meminfo.c.
> I am confused why it should be exported. If it won't be called
> from the driver module, we should not export it.

Ah. I thought you did not want the GPL restriction. I don't have real
opinion about it. It's written to be following the rest of the module.
It is not needed for the usage of dma-buf in kernel module. But I
don't see any reason for hiding it either.


> Thanks.
>
>> +
>>  #ifdef CONFIG_DEBUG_FS
>>  static int dma_buf_debug_show(struct seq_file *s, void *unused)
>>  {
>> diff --git a/fs/proc/meminfo.c b/fs/proc/meminfo.c
>> index 6fa761c9cc78..ccc7c40c8db7 100644
>> --- a/fs/proc/meminfo.c
>> +++ b/fs/proc/meminfo.c
>> @@ -16,6 +16,7 @@
>>  #ifdef CONFIG_CMA
>>  #include <linux/cma.h>
>>  #endif
>> +#include <linux/dma-buf.h>
>>  #include <asm/page.h>
>>  #include "internal.h"
>>
>> @@ -145,7 +146,9 @@ static int meminfo_proc_show(struct seq_file *m, void *v)
>>         show_val_kb(m, "CmaFree:        ",
>>                     global_zone_page_state(NR_FREE_CMA_PAGES));
>>  #endif
>> -
>> +#ifdef CONFIG_DMA_SHARED_BUFFER
>> +       show_val_kb(m, "DmaBufTotal:    ", dma_buf_allocated_pages());
>> +#endif
>>         hugetlb_report_meminfo(m);
>>
>>         arch_report_meminfo(m);
>> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
>> index efdc56b9d95f..5b05816bd2cd 100644
>> --- a/include/linux/dma-buf.h
>> +++ b/include/linux/dma-buf.h
>> @@ -507,4 +507,5 @@ int dma_buf_mmap(struct dma_buf *, struct vm_area_struct *,
>>                  unsigned long);
>>  int dma_buf_vmap(struct dma_buf *dmabuf, struct dma_buf_map *map);
>>  void dma_buf_vunmap(struct dma_buf *dmabuf, struct dma_buf_map *map);
>> +long dma_buf_allocated_pages(void);
>>  #endif /* __DMA_BUF_H__ */
>> --
>> 2.17.1
>>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
