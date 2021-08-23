Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E50843F48C5
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 12:36:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C2AD89AB6;
	Mon, 23 Aug 2021 10:36:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2078.outbound.protection.outlook.com [40.107.102.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5408A89AB6
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Aug 2021 10:36:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B6J2K4o+umf1++v+ffux2+KcDpW1HTVIf1YKd0ZxMfVgd3+fPo0fLpDn2SndqTez8CX3BTuQ5Eany8z1hUBli1Pq9siZRbdBTqvFdZZNwqV6G+NvJKE+tdOI0OpvAhtRJTctNxCSB5TjSzjeGHwOg3rZr1gGnnsGaxBLZCzzyLxY81C8VaiCZFiEcoerd++bPIq1w2mO5WzQLPwElKrHVdN95R9FDdjatq4y8agnEErlQuhwZMpBLjLU3AvDMMHPAwoi0zHTQha+XH/36eTc72TuVSD4lzIYhW5fz36lAGLNnUiYg2pmwp1KAzdp3eqFZEqdpIRV5E922DerhkA4qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5UZ/va3p8N0irgITNRD38yGyzIrX/w5JpG0ttd/7d24=;
 b=FCLcCNgIVFjvCZXzd5qNyC8I3PY8MqM1ZA/pvOwt1wJDdqNMh4e8agxXmcmOpguMyokX9xXJtcmVG4z+zhipdm1MUnQHlMkzc3a3ospc94u16ibDV+uO+Zo01Ct+N9iINvqEupCg7/01SKsuURdZT/CifdVrD/eK0Eu164WCDlG9392twl4yqoiwL5ZqtR2tw0gSFTI+bEnn4rMEO3Dctg65Xz2EyX8vBNPCU1RKfVoYC7QbmpN312t/IA9aGHHbKgxTzlpg6pzAOXI+/bTD3R4YFXHCQpHT96Zd+ihTtSORG1q8lJchI9FwsudtTP+8KGuXdxaOI2VFA2NOXf//fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5UZ/va3p8N0irgITNRD38yGyzIrX/w5JpG0ttd/7d24=;
 b=xMRwwkw7tvayyMd6+K4QO9aXqABsMBy0SqXEY3iBgjrdxfL5gqAHaHaoLd+gig6xgq/lhaq97Ql+YusTh+l7yXvgtp/kBC68/T9+0xomKwB75paALYncjLPgq9ijUM9Z4ehK3RAHlWf0bXvK5b85yIsPKWuJ7OAWTJcTz0SflIY=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4000.namprd12.prod.outlook.com (2603:10b6:208:16b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Mon, 23 Aug
 2021 10:04:06 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4436.024; Mon, 23 Aug 2021
 10:04:06 +0000
Subject: Re: Un-acked TTM patch
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <4da1794b868adf5de899c43bcc0780a6a10d492f.camel@linux.intel.com>
 <6f7555b1-f533-4bb5-1d11-07228f55d145@amd.com>
 <3894a035-54c6-2b88-839f-64888f7584de@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <e60f0888-f389-d577-227b-ac22811050a6@amd.com>
Date: Mon, 23 Aug 2021 12:03:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <3894a035-54c6-2b88-839f-64888f7584de@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: PR3P189CA0002.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:52::7) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.178.21] (91.14.161.181) by
 PR3P189CA0002.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:52::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Mon, 23 Aug 2021 10:04:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 29975a6a-19e9-4158-d4cd-08d9661d57b4
X-MS-TrafficTypeDiagnostic: MN2PR12MB4000:
X-Microsoft-Antispam-PRVS: <MN2PR12MB40005701223544739E8C3CAD83C49@MN2PR12MB4000.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B2vORA3qzrd7P4JEpimyq0CZeaPOTEmhC4Pn9+0gCOvQeltFV6liu/6KMCLANt4wshfbNXXYrxftZPv7VsOaUmLDM0EH/YGNoHzCXXL1KRTCLyxKwrhfkPUepWslF/jrD97H06JMPtUvHWWhQVYDnDsfe6PqQZJV3J/26agSq0CoDxv/yFwYYQ9IsDogPwGaaKM9nLv6XPer3U1Eyq2bcFWgUpb1d3BkTkkE+++qtHl+aQnLIY03YY/S1xS6GX2oP5i8tgqBnRECo2Zoki1oJieqP2y/JC5fdZNSRwPifZMi+bwC/24GR6km2DV4Or1vtwUmVZ6mRSxo9gcyiJnu7t6HpDpCmgWhAoWjPFOrFrxAPG0ku+WVC7MuiMONOtt2EE4h/MMzKhf5dZW4C3uyXGIYag6Q7VJzy94NNeHglLwlemxkp2uPUX8t9Ngs6Jz/EVNGaqKsB0TIyBd46sG33C2GN7G+f0wztcrPdST4s1Q6hy5tCU7P8JGuqGbFGmPDYyiYoH2QgEKZM4yrxi2iS/qVh9FpVj/yR1Wph10H5CMh4Oxx3ya+kXxZYX9tVrIIZoXM7wxd4sNo1QlEw59sNi9SQdFWHR4qOksRG7oIJekvTSDt7YR2Kg43oNYGvbLNdYaAXjdv5SZp8Jrdr519hbBoRRv7EHDkExTwE+S8KX1tT0YruLhzlMCezD7c+O25x19d8dbIk6LlTgNzNqt//kRVadzRIDLZ+AitxPD8NwA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(3480700007)(36756003)(53546011)(2616005)(16576012)(956004)(316002)(5660300002)(6486002)(508600001)(186003)(2906002)(66946007)(66476007)(31696002)(66556008)(4744005)(26005)(38100700002)(31686004)(83380400001)(8676002)(6666004)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUZMeFYrVkxBWEtrV3o0TUhjNEJBTXJzay9QOUxub1J6RWdmaURNbDhtVXNw?=
 =?utf-8?B?UHU5YTB1QUZIU1JwR2l0MUpYTEJXamVQRnYzRzFWVzIxWXJUNFhoNm1uVHZS?=
 =?utf-8?B?L0Rya3RTNVpwNUpmL3lCTTJxNEpVQXErdEVRVmRWZzhRMjN1dnQyblhHZzE2?=
 =?utf-8?B?SnNjMXhXb1lCZUZCbW9yQlNrYUtGZ0xuMnlpUWVHRTdta1lydFE2RkpuMlVp?=
 =?utf-8?B?ZUl0bjVzd1IwOGxRMGF6eW42c081c2JhVlJNcDBUeEp6RE1QWXdpdzRYNlRq?=
 =?utf-8?B?UHcwdzF0YmtNU3packk3T0Y0ZXA4UjNFSFp3WkVpMTgvME0xaGV0bVRQMVZI?=
 =?utf-8?B?c0ZVVm1MOW1oZm1TZEJRQXZmUU5EMWcvVEg4ZDh4N094QnVwdXhGV1VEMzhj?=
 =?utf-8?B?OExiaDBPZWwvNk9vZzN3THh2bXQrVloyY0lPV1BVZGdjN3o5b3hnUFFhelVr?=
 =?utf-8?B?Nk1kNWhtaStIZzMreWZBZTBVejF0MkJ5MFdiUGxKajJyVjBNTDJDamVWclhY?=
 =?utf-8?B?YzJ5OFlEZC9WZDBKdEJPbTJKODhaQWJGYnMxbG5ZZlgzSTVTcjVUTnQxaFFD?=
 =?utf-8?B?VmMzUHYvVnJHdnZXSklPUVdRR2JycFB5eFhvdUFpM0VQK3drc2VMSTRnZzVq?=
 =?utf-8?B?c0cwK2tTUjBHV09mVE55OVArYnBMYlYwanVDSkxRd2NOVmw2ekJCNEc4Rks3?=
 =?utf-8?B?WjVmcGx5QWxUK0Y0MXlnSWtndFZ3NWh3Nm5QZGdCdGxZQS8yRVIwMTJUMjhW?=
 =?utf-8?B?c1F6bm5pUVV5Y0d4ZXR2RStMaDhLeGxaeXEyOUg3YXdvNlBGVVEzUXNEODlZ?=
 =?utf-8?B?YlVOblJqcG1YUjB2NVJkWldSZEo4dkFpdlFickw4aUhOeGRac1laNDJsUkov?=
 =?utf-8?B?MXVUZDF4ZmZyMlp5SWc1bWUrci9YUE1za2Z0bmR0RXhMZG1jbHlYYU82am9w?=
 =?utf-8?B?dnhsajJPdnJlZkllV2EvSEJ3d0RNRkN4S2p4bTFRclh1T2o1RUlWNGx6VGZP?=
 =?utf-8?B?LzBqdzd3b0hrZExvSDYzUVpsSlJOMDZBZWs2K0xQQ284SnNwcnllQVlMdDRB?=
 =?utf-8?B?SDM4c25iWFYvQzZka1hoYWpxbDJPOW15Y3V0dVQ5WGFtTVJtR1ozRHhPTlVo?=
 =?utf-8?B?UGZQbFBVNHEwOWVJTS9aOGRlY1ZZb3d2THdneDYwRFN6VEhKaGU0N2N5cXhz?=
 =?utf-8?B?dFMrTUlrc3NKM1JDUWlVbnNpenpEQWlCczVOWU1naWhkc21HNXJOMmI2c0hq?=
 =?utf-8?B?eXBlMS9SYXd5aDN2cWcrdTdMTkpDU0NYQ0swblZ0STBoenVjaEthaXpSc3Ft?=
 =?utf-8?B?WURueHNoYi9PRXhaVU1LcmJPTmxxRDNEKy9DdWFzT1NFNWd4MXBxMjZTVHlo?=
 =?utf-8?B?ZkpwNGN2eTMrRExJOVdBTjlKR0NPQVM0Ym9UU3RURnBaMUlRVlBqRDB0ZVNp?=
 =?utf-8?B?L25OaU5CcWZEaklFTHRJdGt6UmVUS3hrVHQ1Um93eEpPSXVoM05jdDRWVC9E?=
 =?utf-8?B?amoyNUtNRC85SWt5S1VHaVJ1ZkN3b2R2RGw4TGZielk3L21JN2cycXpFbElP?=
 =?utf-8?B?SnFkVldUd2pTblBGSmxDZ042SlVUSTlDKzBTeWRVWkxPVmkzcU9Bd1ZJNWpT?=
 =?utf-8?B?UmI1SDdDT21FaUFBMXZHZzBlY1E3K2R2OGsxUkF3OTRqUzYyaXc4NzdtYnhw?=
 =?utf-8?B?UzJFTDA2Yjl4RFAxQlc3cFFha2F2OUtsYzdRNCtYY1ZWanBJa1JYZEpseFBu?=
 =?utf-8?Q?uixAEXhPzSNPj1mDRqUGOkTmkgO7vSkCiLUAaf3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29975a6a-19e9-4158-d4cd-08d9661d57b4
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2021 10:04:06.2758 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RB4fi9QAEx24QZytDVax/l8yrYELNn+joa0Ejb2G0dVN5Uz1Fgbq/3ah6Br+ELsa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 23.08.21 um 12:01 schrieb Thomas Hellström:
>
> On 8/23/21 11:10 AM, Christian König wrote:
>> Hi Thomas,
>>
>> sorry for the delay. I was on vacation and still digging though 
>> everything.
>>
>> Just added an rb to the second patch, but can't find the first one 
>> anywhere in my mailbox. Going to double check that on patchwork instead.
>>
>> Did you had a chance taking a look at the patches about moving the 
>> LRU into the resources?
>>
>> Thanks,
>> Christian.
>>
>
> Hi, Christian,
>
> Yes, I just replied on two of those with a major concern. The other 
> ones look OK from a cursory look, will dig a bit deeper into those If 
> I can get some time over today.
>
> Thanks,
>
> Thomas
>
> BTW is it ok to merge the TTM patch you r-b:d through drm-intel-next?

Yeah, feel free to go ahead with that. For those I can't see much of a 
conflict potential.

Thanks,
Christian.

>
> Thanks,
>
> Thomas
>
>

