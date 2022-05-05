Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0EA451BA55
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 10:27:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7FC910ED7A;
	Thu,  5 May 2022 08:27:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2072.outbound.protection.outlook.com [40.107.220.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1FE410F15E
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 08:27:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UMoIgM79GOTRafyJxpNhQWvtjSdQKQpKVPo5GQC49oX8pl98AslC1vP5OnhCwAq0kVvkX0K1HOAooyGR9obQ8hrMy3KItoXZmJ5vo2idfLdN5qX1IHlsJ5nxG//kH1LG74PynPdD5dNvUBJ/RRZGdCroAwuLSTY3uAXAQPzlejXYp6vR6JQ7lLlHa52/4Ju04kuG6Rfmmj5ZtB7C4wZ6t3lQWYc+wXvbQoE7wN+xAeUHJRWvRPZ0E3FowyzfFay09yShESFQ/3ldHtsIoc9eN9M77NF4YMaTYGuzLe1YkYg1VkRLgNXk1mL9K0zZbuygETjgX3f33Ccwn2BtKfMv2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G02D3DeHiMd/N5MmuYJU+44VpRbdbzgvqodmTzx8mq4=;
 b=AydNjavk7aYCZlbSgS1IX1YK2A9iYGgtgqLJLGj5WM8bZSE+3MsvhRfAPVfjB1p7AC9l2yOsxiDFkVtOje7/8DNB8mrBkWsM3ttedIhA58u4Zn5WYP5mjorWvtCGDHtijRyIfhlpGY+U5ktTt8GEdzLOx5FOiYvs8PGFkBXmeCG/q3SENvzko4JfX8BMT0Fk5AgdE6sqwgo2KZOa3xXXoLUrqj/L/ULCRjt/ox1YqAu+gZIKiiMrmzFnmdOaF++S1V6Z28R+bTXX6ozHYObkpLHs78yAgYt07M4V4NVsOolgiZpaJ6rW9nkXmWJQcuoe/NZOY1eIdrX1kvNcRgwRBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G02D3DeHiMd/N5MmuYJU+44VpRbdbzgvqodmTzx8mq4=;
 b=JZBMgRcrZQBZhR0lwDoBrTkOyNkWG7yem2WIdoNZ1gYP/i9SFsn4KNwAK8rTuKFY+eNv8LiE23e/ozjyjk/4pTP+Ufsz5dmeCAAYJmCROMSGz9OWxvMS9Ic79YcEf4rZtfB8JpBkNhByQFZdVgfglEHv+8ggwkM1GISOiD3SCuU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DS7PR12MB6120.namprd12.prod.outlook.com (2603:10b6:8:98::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.24; Thu, 5 May 2022 08:27:44 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::fdba:2c6c:b9ab:38f]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::fdba:2c6c:b9ab:38f%4]) with mapi id 15.20.5206.025; Thu, 5 May 2022
 08:27:44 +0000
Content-Type: multipart/alternative;
 boundary="------------o8QpyQH7KQX30W9oPadFYydu"
Message-ID: <03423100-0266-1396-49ad-2b61d7331f6e@amd.com>
Date: Thu, 5 May 2022 10:27:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] dma-buf: Add an API for exporting sync files (v13)
Content-Language: en-US
To: Jason Ekstrand <jason@jlekstrand.net>
References: <20220504203404.1495485-1-jason@jlekstrand.net>
 <20220504203404.1495485-2-jason@jlekstrand.net>
 <7d478470-00fa-07a6-1479-dee80ced5b76@amd.com>
 <CAOFGe948_qtwrLd1DiHOJOkxK-iT_qU-3FG+uz4bGGnL7oKpCw@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAOFGe948_qtwrLd1DiHOJOkxK-iT_qU-3FG+uz4bGGnL7oKpCw@mail.gmail.com>
X-ClientProxiedBy: AM5PR04CA0025.eurprd04.prod.outlook.com
 (2603:10a6:206:1::38) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd9fc796-17c8-414d-c0bd-08da2e7120f6
X-MS-TrafficTypeDiagnostic: DS7PR12MB6120:EE_
X-Microsoft-Antispam-PRVS: <DS7PR12MB6120F279E364C00C4FD047D983C29@DS7PR12MB6120.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4xJmhGV3xHnnwVzEI9E8+BaE5ozpNoCNxasRfR319ushrJm8JD+0lwv8QJnO9+pnKNSAjRddssalIaxgGvWadsKMFdKrTZCM1hv+MfvYbKQQHV+AL5sGOkevZVBm6Xey6rmjyhcRuRuiQWwVjmF9p4Bw/rl+sn/Glqy3Ga9c35jdg4GYbRoZgf8Fv2MtAoqUizM0XI64OiugHDWbKDV5vlQN+/vh6nf5EAhE7Uxv2Q2N1XVZ3hsiOLcfSWHUBiRylPP7kz1eZ/CrchBbqWhcK2txLnk1P8Yq/Zt0CwHmS9g+ikXHYAqnfzmOBvXLQMDdG973iLtYk0W5PFNxRKTp3te7V3CmA/Pht6S1nizA4T/1ErHMJaZJA4b/hK1JK4ZxSekye40T9tEPMqDzswW1hV7P9ECXHecc9RpNnvWUYV2NShzQGYacePPcw5QrB8tt75kGzfqWytBC1ieJRzxVsxuA9e5yIvS1JTTM8cAuCjaTHLssFgCrWX4md6WYCfWUZATlnZ45tT/zWjRf8LXVFQqlXIliytZiybQlNpkWL4reNxJyb3Jqa5MrFpRxvEakrWXNMkcpkIjiHGxlzKbTbY2/VlxagybHnF3JzIpmk90Nwbk/hkKU52zY2zYIZUtljsdioW7xY/Cbruz2z2j5Vj0HTp6hUoOkxJj05Ya+Z5R0aJHdlvgSlDKQyXhjyPxuTxomIsAS8Ovz9NP1nRdhRab7FDrZz1j88SVfHH538H/0/YsCmdj7OfPgB/BvASxG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8676002)(66946007)(66556008)(66476007)(66574015)(83380400001)(31686004)(4326008)(6916009)(54906003)(2616005)(186003)(316002)(26005)(86362001)(2906002)(31696002)(6512007)(6506007)(53546011)(33964004)(6666004)(36756003)(5660300002)(38100700002)(8936002)(6486002)(508600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVoxWTI4Z2dwS0JIbzJVOVN6SFJIb0xYWTVuL0htMzRIcnVKM2dMeVA2Z3Mr?=
 =?utf-8?B?QWRpaERvSi9hNGN4K0hhMk9xMW0wYnY2TVQvTStYSi9PbE92eHpsalhxcnpW?=
 =?utf-8?B?UUk1bUpuUzhBYVUvVEg5dTdjRWdRdDZpM2VDMGJSSS9RSFdQaTIyYnhhN0Z4?=
 =?utf-8?B?NHZCejBVc29oK0lVM29qenArREpxREg4L3FNVW9mb0tpRzZlZW9tcEJQUFp2?=
 =?utf-8?B?MkFsdW9LZlZmTTZuU3B4RmJUOU9BcmpuZjhsQXB0SkN4V0JscmtxL1FaM1lt?=
 =?utf-8?B?ZUFJZkxvek1BWHJIcG1iU3kwaDk1cncwYWFVSVlkNzY2RWl6VnJxb3RKaWV4?=
 =?utf-8?B?OFNsV1Y5cGVkdGM1emZHSHN2L1pLbE1MRk9YRTAwRUtQVi9UMURlUzByS05Y?=
 =?utf-8?B?TXJaQ2dISGZuK3dZN1lITlBhdmZjOGM2Tlp3SEtwNmVOL1lwM2UyZyt3bGw1?=
 =?utf-8?B?UFpHejNtKzdGSWNlVDN1aVV4VU1qbkRqZ05PU3VlL3lTL0pINVJyYzRBL1VD?=
 =?utf-8?B?QmNPRXozU0RkcThEdUlRU3g0VzVCUkVJYVMzWXFYOHgxdHhKZE1JU2JIQTJ2?=
 =?utf-8?B?MHZqVkVnRmE2UzdacHhIbGxJeFo5V2p3Q0djYVRLaUpJUjhXbkFsZGY0OTZn?=
 =?utf-8?B?VjQ0ZFRCbVIzNUxiWVNBSlB0R2VlelE3cGYyTFhEYzBPQXhyM3FDZS9xNlRL?=
 =?utf-8?B?VkJydlIzVFMxK0ZIcUw3akVuYk1DaUdLa3BOT21FU1NhMjlsdm1rNzF1VHp2?=
 =?utf-8?B?MXJ2Wll2WHllY3BUdlNiUGM1RkMvamVWWU54NG5kNEZBOGZIazg3TUpyaGpy?=
 =?utf-8?B?NEJUSXNLcmVHQkVVT2ZJTUN0ZnNGZWdGaVpWTlhIdGdpdGdSQUVlNG45ZjZ4?=
 =?utf-8?B?K1kreG9MRnIvdW5PdncwdzNzdnlXZ3BjMm8yOEJ0NU40anU0Y2NsRXlJZWNz?=
 =?utf-8?B?Z0J1d3dvekZBVnBteDJuQTNQenNsRmhWd1EzRnZVanR6MEw2OFdoN3hzNnlK?=
 =?utf-8?B?bi9OSXI0dXcwSzBRM1ltenhXTllsMnJSbFlLN3N4T1NhN2NHc3k5K1RZclFt?=
 =?utf-8?B?TUw0R01XMGZWQ2JPQnJJOHFBcVAyaVdkQ2NQSUpoR0NySVdxWWZ6MFFBaElY?=
 =?utf-8?B?Y3RQUkNRNVZycmNqNDdOVElhVmJ3S0lKMFZTSyttZ1ZDM2s4dlFGOExMNTJE?=
 =?utf-8?B?UjVwSncwZzJweDBoTFZaWFhuUGU5ZUcweGU2cEU1dGZPVmw0RXFhRW40Sjkz?=
 =?utf-8?B?TDdyYnFBZjN0V0kraWpLMUd2ckV4OFNuS0VEUnhIbXlqU0FJVVd1R21aMzN1?=
 =?utf-8?B?RWxocWxzTWVWTzVWNUFVbFowQUh4STRqWWxTRXlRb09JaWNJMFlEQU1iYkdH?=
 =?utf-8?B?Q0xiY1doVk9TM25oaEFWbVd3NDJacHVud0NTZHloV0lVQ0ZBTGlDdXZZbFRv?=
 =?utf-8?B?WmZ2eGdHODUxSldRQXB1M3VxcnJCZjk1b2N0NjBPUlEya0I1ZDRWQWNZeWFr?=
 =?utf-8?B?ckkwWjVHWUVLbjBZK25TczhUSTJJczVWbHNTVFUySEo0dzJ6UWtlOUxTL0Jy?=
 =?utf-8?B?dlVhQ2xaZnZJY0MzZllCWkZNMkp4Y1crVkk5bWZGOWpTU2k3cENnc3hLWkNV?=
 =?utf-8?B?ZElqK3ZTZGd3V2VVVEFXZzk1MjFIQnkwTGowYTlYazJ1SG1KY1c0djMrd0JI?=
 =?utf-8?B?NmxncmMxR0ZrYnlCVWpkVnhRZy9EbWlMNFhwb2o5UXR2L05vSEZiRE9ZVDV4?=
 =?utf-8?B?SU9xK245OXFiUENTeFRZS2JRSnBSbW5nWmhQVGF6azc3SkNIQ0UxanpwamxH?=
 =?utf-8?B?Ly90N3YxNm9PcFNyUnFMbEJCQkh0eDZqSkxnQXNnbk81aHR3b1B0aWhQL1lL?=
 =?utf-8?B?TWMzMkdmeGxWS20xeE1BQXQxdmlwdnJOZnZVSCtuaHhZWEtaZ0sxVU5HNm9F?=
 =?utf-8?B?TW5Ka3lMWXk5ai85emlBdVR0M0VjQjNFOEc4akZWTFZEd01DMWhwQWZQZ1V5?=
 =?utf-8?B?dEh2WmVUYlQza2ZNdnlBZHNGMksxVkJ6ZG9wbE1YaFR0UGdKblFwL3A5OEl2?=
 =?utf-8?B?L0VjdFJWbzFIU1UvOXhteFJjRlpZZE1Na1p2N0dLM0RFdG1YQzdnZFFkejlR?=
 =?utf-8?B?REx3VUdhQWt1aEhQdytFQkdEWDBPWlhGQnF2cmM2Wi9kN29PODhpbVVhV2pC?=
 =?utf-8?B?dDhzYnh6VmVoSTE2QTZXWEtYV2JGTUQyUk9GN1dDVHVOQ3hlZGJkMjg5Y2R0?=
 =?utf-8?B?TWxmT3pyT1A3eFFURHpTaW0wRG1jbWhYYjZ2bjRGaFpVa2svY1hmcm9nby9l?=
 =?utf-8?B?aGowSndDTzEyVFR5ekcwcXYxK04rbERNa0hTd0ZVRFYrSUNZY1gxUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd9fc796-17c8-414d-c0bd-08da2e7120f6
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 08:27:44.7601 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zCnmZzUvyhNACDolNeB5kpWctmOTREZook9ceKnmJJw4FUhEreqglfD9YD2E8o7s
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6120
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
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------o8QpyQH7KQX30W9oPadFYydu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 05.05.22 um 10:10 schrieb Jason Ekstrand:
> On Thu, May 5, 2022 at 1:25 AM Christian König 
> <christian.koenig@amd.com> wrote:
>
>     [SNIP]
>     > +     fd_install(fd, sync_file->file);
>     > +
>     > +     arg.fd = fd;
>     > +     if (copy_to_user(user_data, &arg, sizeof(arg)))
>     > +             return -EFAULT;
>
>     I know we had that discussion before, but I'm not 100% any more
>     what the
>     outcome was.
>
>     The problem here is that when the copy_to_user fails we have a file
>     descriptor which is valid, but userspace doesn't know anything
>     about it.
>
>     I only see a few possibilities here:
>     1. Keep it like this and just assume that a process which you
>     can't copy
>     the fd to is also dying (a bit to much assumption for my taste).
>
>     2. Close the file descriptor when this happens (not ideal either).
>
>     3. Instead of returning the fd in the parameter structure return
>     it as
>     IOCTL result.
>
>     Number 3 is what drm_prime_handle_to_fd_ioctl() is doing as well and
>     IIRC we said that this is probably the best option.
>
>
> I don't have a strong preference here, so I'll go with whatever in the 
> end but let me at least explain my reasoning.  First, this was based 
> on the FD import/export in syncobj which stuffs the FD in the args 
> struct.  If `copy_to_user` is a problem here, it's a problem there as 
> well.  Second, the only way `copy_to_user` can fail is if the client 
> gives us a read-only page or somehow manages to race removing the page 
> from their address space (via unmap(), for instance) with this ioctl.  
> Both of those seem like pretty serious client errors to me.  That, or 
> the client is in the process of dying, in which case we really don't care.

Yeah, I know about that copy_to_user() issue in the syncobj and also 
some driver specific handling.

That's why we discussed this before and IIRC somebody indeed ran into an 
issue with -EFAULT and that was the reason all this bubbled up.

I don't have a strong preference either, but I think we should try to 
learn from previous mistakes and design new interfaces based on such 
experience.

Christian.

>
> --Jason
>

--------------o8QpyQH7KQX30W9oPadFYydu
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 05.05.22 um 10:10 schrieb Jason Ekstrand:<br>
    <blockquote type="cite" cite="mid:CAOFGe948_qtwrLd1DiHOJOkxK-iT_qU-3FG+uz4bGGnL7oKpCw@mail.gmail.com">
      
      <div dir="ltr">
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Thu, May 5, 2022 at 1:25
            AM Christian König &lt;<a href="mailto:christian.koenig@amd.com" moz-do-not-send="true" class="moz-txt-link-freetext">christian.koenig@amd.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">[SNIP]<br>
            &gt; +&nbsp; &nbsp; &nbsp;fd_install(fd, sync_file-&gt;file);<br>
            &gt; +<br>
            &gt; +&nbsp; &nbsp; &nbsp;arg.fd = fd;<br>
            &gt; +&nbsp; &nbsp; &nbsp;if (copy_to_user(user_data, &amp;arg,
            sizeof(arg)))<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return -EFAULT;<br>
            <br>
            I know we had that discussion before, but I'm not 100% any
            more what the <br>
            outcome was.<br>
            <br>
            The problem here is that when the copy_to_user fails we have
            a file <br>
            descriptor which is valid, but userspace doesn't know
            anything about it.<br>
            <br>
            I only see a few possibilities here:<br>
            1. Keep it like this and just assume that a process which
            you can't copy <br>
            the fd to is also dying (a bit to much assumption for my
            taste).<br>
            <br>
            2. Close the file descriptor when this happens (not ideal
            either).<br>
            <br>
            3. Instead of returning the fd in the parameter structure
            return it as <br>
            IOCTL result.<br>
            <br>
            Number 3 is what drm_prime_handle_to_fd_ioctl() is doing as
            well and <br>
            IIRC we said that this is probably the best option.<br>
          </blockquote>
          <div><br>
          </div>
          <div>I don't have a strong preference here, so I'll go with
            whatever in the end but let me at least explain my
            reasoning.&nbsp; First, this was based on the FD import/export in
            syncobj which stuffs the FD in the args struct.&nbsp; If
            `copy_to_user` is a problem here, it's a problem there as
            well.&nbsp; Second, the only way `copy_to_user` can fail is if
            the client gives us a read-only page or somehow manages to
            race removing the page from their address space (via
            unmap(), for instance) with this ioctl.&nbsp; Both of those seem
            like pretty serious client errors to me.&nbsp; That, or the
            client is in the process of dying, in which case we really
            don't care.</div>
        </div>
      </div>
    </blockquote>
    <br>
    Yeah, I know about that copy_to_user() issue in the syncobj and also
    some driver specific handling.<br>
    <br>
    That's why we discussed this before and IIRC somebody indeed ran
    into an issue with -EFAULT and that was the reason all this bubbled
    up.<br>
    <br>
    I don't have a strong preference either, but I think we should try
    to learn from previous mistakes and design new interfaces based on
    such experience.<br>
    <br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:CAOFGe948_qtwrLd1DiHOJOkxK-iT_qU-3FG+uz4bGGnL7oKpCw@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div><br>
          </div>
          <div>--Jason</div>
          <br>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------o8QpyQH7KQX30W9oPadFYydu--
