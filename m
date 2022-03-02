Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9B74C9C1C
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 04:26:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FAC210E74B;
	Wed,  2 Mar 2022 03:26:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2058.outbound.protection.outlook.com [40.107.223.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 126AE10E74B;
 Wed,  2 Mar 2022 03:26:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XbFMl8ygbbuT4PyTmKV/u+beyNvicJ8Gt9pLl62uelHDmJcSWDQUY33kWrVnh7Dd3n1wHnzDww05i4IP7OWq+xWvKYsNlCQm5xovo2YQQDwC6Ce6kPDEcmL/zAhRd1b2S5xLYScdTF5YP7PwevykbdgRbHV0NPnE8Kgpg48Cm6WSlKM/QNLqGmyDPVjktP2yQeAcxdSt5u/14rgt5cN5ZOu7dA9YVrLu5hJrrNcRRRFHEUBePY260KDgFxAG0fG03P8p5LqdL8XOVJbdmaBq+9tZzxwldVKnvVFaC9ZYnYJMayUE2ertj5jdOs8RRkbSka7Lm2n+T/RAmwMdcPM1vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=arZxQ1tFCEKaKTiHRpXXomAgXeTQMuwVREWTutaEJsE=;
 b=Et4kSt/6mQZMPfAL2aeBTco4pDaFXznDLcBZi0NtjsqLZlqCHKcB8UoLL9tj+3EeQab3/wPngeWaum88iSLyDjoHk8ISudpKR22o2cMDdDZKZ2EcFLNoRfZTeuv2ke5bsKj2Qe0oHyX/mhcVX4AysHtsIbZZw1/y9ZbLiwmyihJtHGC0IVdEIq7YobWTZh6wdACG4ap1xg1H1jxsnhopi1lGpUXOhhdk7Snzlgtt1TWRkXhZQTlHs1y4qkmsNMdg4ubtq5kSna2Ob8X3yxFj/j5edDF5Kw5v4+pFof65X5UTpO/rI3NdbRwlwI9rrWjhStFYuuSQp2feHXguSD1YDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=arZxQ1tFCEKaKTiHRpXXomAgXeTQMuwVREWTutaEJsE=;
 b=TILwhgpX4MeFaSOL0yyS7iQw1XH0DYyEyF8YE9StfZfnZXJRdG4FZp1vp7gQCo5TzeEDM4T8pBr7idFjH0kTzJDUhnkTeL6hupzxCRnFFCW+Rj3AfK/aRK4HKuEYsWdg4244GYUd8Vj1sUw4/HZIYwU0rJSby3PjNCOOvB0T23k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by BN6PR1201MB0244.namprd12.prod.outlook.com (2603:10b6:405:54::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Wed, 2 Mar
 2022 03:26:15 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::a105:faab:243:1dd3]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::a105:faab:243:1dd3%11]) with mapi id 15.20.5017.027; Wed, 2 Mar 2022
 03:26:15 +0000
Message-ID: <14b6a691-d31e-2e54-cf91-352b9b30414d@amd.com>
Date: Tue, 1 Mar 2022 22:26:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: linux-next: build warning after merge of the drm-misc tree
Content-Language: en-US
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>
References: <20211117134926.1d339d71@canb.auug.org.au>
 <20220120142639.02c54ae9@canb.auug.org.au>
 <20220302123126.65bcbc82@canb.auug.org.au>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <20220302123126.65bcbc82@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0430.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::15) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8c9d8dbe-97bf-4050-fccd-08d9fbfc687a
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0244:EE_
X-Microsoft-Antispam-PRVS: <BN6PR1201MB02448657769B44E183262301EA039@BN6PR1201MB0244.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rTU17CG29J0aJR9uBYuUz2w84HJ7JsGDF+ABd5NMKtJJE6F9tXRcmNgPTSRWOm5dQvt/McfvE3aT19aLO3+88VYNIjhlw7QyVEhd1BAtJ40Maecpp4LU6zUXTE6xZqAEVCaWhAkQibhMV16nC4vNiuy/eDhFHVg/D9QobVbO1oQY57jiXPVcVqxtIZa/g2cETzrLQUFgEl7uVLnflihABPS5VGprBlwHv1yFA3LK+W8RlgpNbLH2He9igiipG1eywewybtYZp7Oy8HXl7dR0F3lsRgXYZPLTGB5bgwPojQFL1+DldPhgRbZwkRHJJl+K+yKyoG5IAlWPpcDyawziYkEXMgsV4ZBUCHqo0V24cMsY9EaTTb8dRCH1jdcxDOrnkTONGuxTSjnA0Id3khc+yQw4uFyvfoqvvdtSsiquHo+FEE13e9+4dIusacIVjSyF0iDfZmw+xw4HH7ngzZ8PpS3h9CEp+ChxwwW2tzl1ULSq5bUsEbdEx1rJmqUZEhfQiF/Ebeg8Zrw2LdZdVtgRYqQeLRUEf9TKxowQrYlmCN/TWCSSnOw/VO6Rw7HfdxLXVhTlXdXt3FkdweK+d3eVKTMA8dHRd0SFfl/WCFU6vGTopgc0V3xlRyyLwy5CnhwpLbVFEdVu1L+bJ1KO/GeEjFi6XO3fAy/7RHcfTJcyvrc2NONRf0U0hIguOyrkSlYDYFq/7WfKKKvUXlgs0Ld8JWv4hSBkb6rbWhY4JtYhsoI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38100700002)(6512007)(53546011)(6506007)(186003)(2616005)(83380400001)(2906002)(110136005)(54906003)(316002)(8936002)(4326008)(8676002)(31686004)(6486002)(66476007)(508600001)(66556008)(66946007)(31696002)(6666004)(44832011)(4744005)(36756003)(86362001)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFE2bXcyMnJmUk0xNlFyOFpZa0Y4SEJ4NlFaVnJ1YzNUMWp2eGlMSXFBMzJT?=
 =?utf-8?B?K2dsamhySndKSEQrNWsrM3JZRjZjdGZMeUdyRTE1aWNrN2FFMnBlM2Njcng0?=
 =?utf-8?B?bEpqNUhrL1RFSnVVbG1QalRjKytGVnlRU1R2bkV2dEY1YU1CWkVDL3RZaklu?=
 =?utf-8?B?VFhqK3FRRXBaWnFROTZSeDllWGR4Ym9QYlZrWnhuSjZ2NVo0WVNRY3pRTTgz?=
 =?utf-8?B?U3M2Y0pPT0ljSzIzZVVlT0Z6eFhnR1U4dVFWREhINGZpdUpLc3pQYkJ3ZDda?=
 =?utf-8?B?Umt5WUZtY3ZibzRQVDR0MHZ4OUVodTlqeVFuVkRXSGk2YlEzTStkY3d3czBC?=
 =?utf-8?B?WnluMENKQjllN2VpY2xVK2R5Ry94aVpKOUd2OFFJTkhobVliNWxzVGVDR09E?=
 =?utf-8?B?MHlHV1FLTmgyNmlRY1hMa0pmMXErVHVEY0R1eUE3bGpocTFDd0p5Tk5SVjI0?=
 =?utf-8?B?bFZZek1adUJIUHlqV21GUHl6ZEVMUG9BUGNjcUtUdXJDTFl4NGpTUW1WdUlF?=
 =?utf-8?B?dzMrTDRqNlpNblI5dWxaZzVPbmpRMEE1emJjaW5uUXJzSDRKbmxBYlNIZEFN?=
 =?utf-8?B?ZStyZHNENEVMQzZwdkNlY1MrY1dGQ3FkZWtKdjNBR1gyQm5PK2ppS2RqNzRa?=
 =?utf-8?B?THI0V2VTaUpITGluRkJEYllPRXZ6NnJkempiUU1iVlhYd0NXc00zMzJlaEFl?=
 =?utf-8?B?VTc5ekdXTmhKOUpyRnJIenkxRHpwTkhjZ0F6UFpUbFdPdDJtZzRVMzhpZmV6?=
 =?utf-8?B?b1RnZHVySjY1c2d3dVZxYXdpTm0vUkZ4QjBnTFhTVE9mcXFhY2NXRnJOK0JO?=
 =?utf-8?B?K290Rzh1RzFFYWxLQzBsNldhYUlZQzB5TkdGZXJUMERrbys0QVU4enNKcjRW?=
 =?utf-8?B?dnYxRzVNL0cySEFzbjhlejVlaXpRZjlaNnNkcEFQQm9OWHNPcjdtdFM1b3NK?=
 =?utf-8?B?Mk1LK0VMSmZXa29SK1pYQ0Y0Z0tWV2tBVEJnRTAwN1puV2hMTm1MYXozT1pX?=
 =?utf-8?B?cHYxKys2YjRKWDkrVjJjWkJ2Z0E5ME5mR3hOcWFNT3cvbzNWN1FnTkNDWHhZ?=
 =?utf-8?B?QjdXa216M0lLMlo3YmVEamhIZVJhKys3N2N0MjBhWVdTbWk5ZEJVaUQ1NmFy?=
 =?utf-8?B?dmhDR0gxNkVmVW01RW9TbUJmWWE5SEJPNUVKNmVKKzc3VEkvSjExRm9OdjRj?=
 =?utf-8?B?TnRSOGtvZUdNRnJqbGg2U3FsLzhIanRKQWd1eEVzblpmbWhQYVpyem5XeU1D?=
 =?utf-8?B?bTVnS2hGMHlnMUVWOUVCTkNoeGhmOUlDWVhaNlhvaUlPYWFWWkh5emYxaENG?=
 =?utf-8?B?Y3VlSmhIeUdpVEpiVFhwS09XMmZTeEFqMDNkeUpPT2xsK2Fpa0tINjBhb01a?=
 =?utf-8?B?V3pLNkh4NU1QaVJZNS8rcXdIcGVKUUVObUtCeGdxV1VGaVI5U0RWYXFzSzAr?=
 =?utf-8?B?ZHo3OS8rUHdySC9TL1VWazVtR3E2ejVueXQvWk5ETzdRVnQxL21iSlRrSHZh?=
 =?utf-8?B?VkdUb2VvczRIbEJnMnROWWhuYnEyRkNjcUJVNE5za3JmTTdic3djNERTRVZt?=
 =?utf-8?B?b0puY2hLdlhkYS90eWoyM0hQNFlUZkRRNE1Sd3Nwait3N2E4S1ZNTzdhYjk3?=
 =?utf-8?B?NWViOG5kVW9VL2lHY2lnR1d1cXdnZDBpOTNRYkNVYnJwM0JFWm01a3VhM1Zn?=
 =?utf-8?B?eG50K3Z6ZUE2cUZIa1dMWFB1bUU2eDd4QTFpbFdHZFhoV2t4a0R1bC9sT2Vs?=
 =?utf-8?B?SXBlMC9rVENRM09ZMFE4TWpPS2tLTmF5aHRoOUtqUkc3dmw1dXI1aWh5U3dL?=
 =?utf-8?B?cU9EeUo2enZRakdQNnJvSXR3dDMzZHhrY2JiUEwvQThjRFZKUHdZMUNBd3Qz?=
 =?utf-8?B?Sk1HRmk0NXJRTUxMemMyMkVpODBkQXZhdUNKSHZCUnc2NDRuTlV4V3FPZzRa?=
 =?utf-8?B?NjRLbkpudFF0aXJXb1FDYy9aZDk1M2M0eGRlb2J1VVRzU2lRMk5nb1ovVVlP?=
 =?utf-8?B?ZEYza0pNWjVDWVdUSHpSNEt6bHF2RHdWbEpCU0dEeHhnSUh1S293NTc0M0tl?=
 =?utf-8?B?RkRKckdTY0sremczK05zNUo5TXRkeXlIQkErV1FQKzBNZXdKM3RRNWw1YTNw?=
 =?utf-8?B?NWRxbmtVTHJJb0Q5Y1NDSldvbjNQSFdPTXMxNVBjSWNxUDFhVXpmWUJSYzlE?=
 =?utf-8?B?WUk5TzdYYS9KLzBYWFEwSE1tNmc4TU9oWVRrMVJnc0ZVb1RDbkt2Q1VUQWVa?=
 =?utf-8?Q?wL9m9pCZYOx4yQNrkcxh0ktRVxfPYIll0L+6JiiUKs=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c9d8dbe-97bf-4050-fccd-08d9fbfc687a
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2022 03:26:15.7075 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N95FvjjAkGa+XS6d3wIJDepVFrkLbXWT/JM/Qy/AfnBlptfLzKmGfK/DPM+xTOLSWlc+ESy5tT7yR45B/HJ/qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0244
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Please check you have commit c7703ce38c1e Andrey Grodzovsky   3 weeks 
ago    drm/amdgpu: Fix htmldoc warning

Andrey

On 2022-03-01 20:31, Stephen Rothwell wrote:
> Hi all,
>
> On Thu, 20 Jan 2022 14:26:39 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> On Wed, 17 Nov 2021 13:49:26 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>> After merging the drm-misc tree, today's linux-next build (htmldocs)
>>> produced this warning:
>>>
>>> include/drm/gpu_scheduler.h:316: warning: Function parameter or member 'work' not described in 'drm_sched_job'
>>>
>>> Introduced by commit
>>>
>>>    542cff7893a3 ("drm/sched: Avoid lockdep spalt on killing a processes")
>> I am still seeing this warning.
> I am still seeing this warning.
>
