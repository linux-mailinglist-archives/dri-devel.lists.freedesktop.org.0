Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E450448ACF7
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 12:50:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C410710E1E4;
	Tue, 11 Jan 2022 11:50:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A0B510E1E4
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 11:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641901807; x=1673437807;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=neUJWVr5GysyiJgqOt4XeAvkap5/YKjrm20+cy9wIiM=;
 b=Nwz4nYtrs/Aoohe62nIJ5pUX99CXz+ml4E1oH2yKHOA7GIKkuW/pktc8
 zR9Mg1JlQelGgqq8NxykQCUn2892hDhfhrKAkQTVQpWocnXagIgaZfYk0
 OqI+sm8nhNa/Cq2rS7U4qiCXl+BZ1CfsA85zg4chh0teJcr56W7/vewXi
 gquvBrPc4VAPc50umI8LxzGKOh9VcUuViScCsV9rSWjuzEzU+qPJcvoDE
 Gw3P7goCnNgy3DJke/goLVrg+MmOieZ5ehmxbvwa82OQhjTDODCKW46H2
 3BjqfUPfLSuBiXw7BywW4OQV7F7MA5YLddLbWAcQGvVmZzCSq7qVJP6l4 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10223"; a="230808872"
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; d="scan'208";a="230808872"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2022 03:50:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; d="scan'208";a="474508271"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 11 Jan 2022 03:50:06 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 11 Jan 2022 03:50:05 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 11 Jan 2022 03:50:05 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 11 Jan 2022 03:50:05 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 11 Jan 2022 03:50:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BM8Tn0iMa5QlY85c1/EctekgUb4Sec5vJXgK5Wv6DfJ6MhBwKJpaakXhLWieprEMJXQMvN7FmtPFcGsK6IbzBZmE7RsNt/2sy+IIewnv0PQxOh1DYL+Aq9GIwAscEoHj+OtbGyEzlejeYWlvdksXcbieCXQFw7LsH5iiip948Zx8iMEWBylZFKm4wTerLnj0u2JSguI06tGjQlechnVJ2YgXG1ycznTGb0ZfflWAJu4refOdPT7XatlBBtMm76CfDHfMzE7ua0B2Da7QHBKkGngYgnzDYzDzCc9X138+0ywH7nmtfUvtr0QhqS6KyRxmLv6ELUkucVKNPPUI6QkY6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aS4t3VVqJHo+zD+s2+NpCLJ7nG2MQFOoZgef+2qDq2U=;
 b=SnJ1GvhLFR4BMt8/asI3TqJ73lcpmywIyNU1bb0DS+m7rkZmzinYO4Jh6ZTtS0gm05fSPNaqMtSEwi9cGembboW4Z2438FW4LzEktvpnsQXHvqEi9cCdTEcU1UmCafF/AI9W3YVr8+UBktn3zYtET7FHfqZUHOIfduEM2CebH7ZCy/89AeAEwmo+BthQ/UXS/G18DFlzbkT9DSJbKPIkpurEENHlsZqvL8hzZJ4z3hJzUTxqivn5H0qToaow7MArmTkHV4mES/pxDyBoFtHOIQzH2NsvJ2jBQp5MILbiNKutsWxBZUFtZ8OXiT5ZSrKhlrE7UaxXzglV8RaitP24aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3180.namprd11.prod.outlook.com (2603:10b6:5:9::13) by
 DM5PR11MB1947.namprd11.prod.outlook.com (2603:10b6:3:110::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4867.9; Tue, 11 Jan 2022 11:50:02 +0000
Received: from DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::b47a:6157:f9b5:b01d]) by DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::b47a:6157:f9b5:b01d%3]) with mapi id 15.20.4867.012; Tue, 11 Jan 2022
 11:50:02 +0000
Message-ID: <44d7e2ac-b92a-b815-e4e9-9cb6ff9e8a49@intel.com>
Date: Tue, 11 Jan 2022 12:49:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.1
Subject: Re: [PATCH v4 0/6] drm: exynos: dsi: Convert drm bridge
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>
References: <CGME20211215101548eucas1p2a7f4a64ae55364181eec3db3ad5d6ef7@eucas1p2.samsung.com>
 <20211215101534.45003-1-jagan@amarulasolutions.com>
 <39f646d7-9d49-045a-2cf5-3cdc12486cb3@samsung.com>
 <CAMty3ZBmZo3wqzj2Si4Ydm1RtzGs7f89aCktgVvD==appfSCPQ@mail.gmail.com>
 <fe49e59a-1df7-fcdc-8258-581509bb8fe2@samsung.com>
 <CAMty3ZCSrqcnO1i5ADJhQx_Dt5GbT+-eyhauJhqg=wJXOTWK-A@mail.gmail.com>
 <fc773566-760d-19ec-0879-3ee88c06b425@samsung.com>
 <012176de-a246-4dfe-1779-e15f498f1d72@samsung.com>
 <e541c52b-9751-933b-5eac-783dd0ed9056@intel.com>
 <CAMty3ZBT0oXvT99px_vnn0xmZ3cc1H6VvAgL6nDVbhtLKFyy7w@mail.gmail.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <CAMty3ZBT0oXvT99px_vnn0xmZ3cc1H6VvAgL6nDVbhtLKFyy7w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0101CA0001.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::14) To DM6PR11MB3180.namprd11.prod.outlook.com
 (2603:10b6:5:9::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 525a9220-efab-460d-8249-08d9d4f880a6
X-MS-TrafficTypeDiagnostic: DM5PR11MB1947:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <DM5PR11MB19472710228CC7F94CF4F47AEB519@DM5PR11MB1947.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9sfNIKzaIQuUGrIIRX27pmoMzgjG6OyNit/R0ILjk6jrO5SXArgH1TQCdGBKhnXMpSp2hVk4ZbqqCDEhukfxaCxXFH96MFC0cL29mPUZ6Gl5p+l1tBzKmg4qXsa9Gnq9otZ+LL4x4DwPeeWr9KhzOsdeNLLjX0+v8cZZn4smNSTuSr8v98txoWrjGhwbaMi/4HnLgTx/fUrRo5L2tAJrpZIVNGbalbged8hqI+SO/ZbK4v2w5O8f9MFQ+TMOSx1neTWJgqavAkFP2scnYc0eyqVXi/YnYx3IJWM7hAyzMAc3xtdl9PPXLoE82+J1kYOZIAUbJwmCdCGeSgtpt1E7YZe/5Nqp5YV6M6JvEeoWIyMDszZQYxaslkRu6/nMv+7S2Nxm6AF0MscKwt5Y4AKf8SGIvJU7afBHjJzufnqwP5U+/KV1fcH1zUrOq3oK9YYjlNZZkQcs0fhoBh8L9pfvrCuxvSxl05Ysxu9BvTl8YdEshlrIZXChO2lRadwyPOOcNUP+DnHXAR2/IkteJNCScZefdkF9LzmATkE0acGZ9Vfg5Fh/+LLlJchVIYog+TTWHZ5KkjgWdJHGkacooGVyhtFw91+0VIu01wfqR8KKqiRqP7ZiqpENrrBtjnKpi7/bqHIPpL0M7CWEAor+P9us8cRXbaHhwgTuErRpcEiDCtm8mKSWItAJjZu24t99jV4lqRRkY0aNFVji9//kXWRcPlXjecruvjg9UllGFvTPmg4xdeMnV6lVfFeU68ytDL8sh9NXy81GEvgWx93p/yh+1XsTBasbnufA4BOiql3KIKDQiuKVnd22FMUFlqDy5K9B
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6512007)(54906003)(6666004)(6486002)(966005)(4326008)(508600001)(86362001)(31686004)(2906002)(36756003)(6506007)(6916009)(31696002)(7416002)(83380400001)(186003)(53546011)(36916002)(8676002)(316002)(26005)(66556008)(66476007)(5660300002)(44832011)(66946007)(38100700002)(82960400001)(8936002)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVpBOFM0blVuYzA5MUlIa0s0OXdHTFB6K1ljWTg0RFlQeUd3RmVrSmhyWmxC?=
 =?utf-8?B?ZkZraDNIRjlTNm5oTHBsSDFWRk1jS2c5c3ZkVlVhTmJmTkoycE1vVE5ERzI2?=
 =?utf-8?B?R1pQT1FUb1pzWUkzeVE2bXN5d3I0ZVAzY0xnU3VhS2lVSVFucHBqVkxuRkRV?=
 =?utf-8?B?a2FRb3pUQS9iMUNlbjZlanpvVytwTjU3ZlNJQWtvRnNQZHJPSlY5K1phanYr?=
 =?utf-8?B?d1NkM3E4YTVIWklzcTJhZFBFaDNqZmpRLzNXRHJXaHRIYTlHNWV2MUpFL3RN?=
 =?utf-8?B?Nk4rSjdoN0Q0OVJYNk0rQ25DOC9MT0VhMXYzdkhzYnVKcWU4cDNFcmlBa0py?=
 =?utf-8?B?eWliQVRNWkxCL0VXVXBHWnZPTjZPZ2xZZ1JnREhWY2dMVThpUlljTDNVZW9V?=
 =?utf-8?B?ZXBXTVNMQW04RWloU3EzMTRpWHhOMERJUHBuNWhQRkEzZHF6V1I1WGtrNjZW?=
 =?utf-8?B?VHNqNVl6NVRBWHh3eXdjb3FqL1I0WS96WkQxUnlFZ21adURiS2ozRFY3SzJn?=
 =?utf-8?B?d2E4NUQ1OXdCWmQ5OXgxS040TjMzYmRtL3dRTHoxYkdPSldBdzBRR0xaenNT?=
 =?utf-8?B?UU9DTnpTZm9BR3NvTjZQUHVvSTc1UHJ5UUduRVViaC9RT0ZNODErZTEzZVdG?=
 =?utf-8?B?VHlLdWxnQUR2K0lJS21JVnFrVFZ3cElBTW9TcTZTL3ltWXUzbm5WWDV4b2Ji?=
 =?utf-8?B?eXZIdEZnNkl0RjFKbjJlM0tYMm9iQTU1V01GMzcwMDEySWtMTFNsT1FtNFZV?=
 =?utf-8?B?N1d1blUwTTkwbmROR0JiRHNHc1NuSzBJUzM0VHV4VWpFTlp5d1lMbzdybkdJ?=
 =?utf-8?B?N1pVWGwyS0djMTFUSHRpSG9VVEdUS0ptaTQ0dG5nM21HZExpZ3RUNUcyT3pX?=
 =?utf-8?B?WTZ4bmd3V3JET21WRWVMTVRhQU00Q0taZ0xQaUZxSkQvcU85TDNRbzlneGxZ?=
 =?utf-8?B?MEZUbWFIOFY5eSs1VnlQZUVFMzFQYVpRcVoyOFNaSVI0NmU4N2JGTnN0T2pT?=
 =?utf-8?B?SzErb2VYZzN5MTYraEIyNFA5RXhFYU80akRXZEF3VUgvV0haNWV3VUprQTRK?=
 =?utf-8?B?a0M4VldBZ29KYW9JaGJkTWNHYzJ0YlVmMXBlL3M4RDB3MFV1RTdJUU9lZERt?=
 =?utf-8?B?dzZ6ZTN6VGdiRDlhd1lzSTRvalMrWXgvWjE2ckxXbnpvajZDY3NpM0VKR3NH?=
 =?utf-8?B?UWFtRDUzd0NvNjVZcWtxOUtMcE8xTGZ0dmpCNW9hck0zUWdMNThKUFZia0w1?=
 =?utf-8?B?Y0hYTFcwcmg1WTU3Wi9jQTJLS2Z5MVJBKys4c2x3bC9EdGMraTdhT0JMbnpp?=
 =?utf-8?B?UmdMQXpvVkIyUmNWSFhzaW1ROFpPNENOYkJOL004elZBcCtDNmQ2L3dJTWFh?=
 =?utf-8?B?dUxUeStUaHVqQ0w4alFleG10QkljbisyZmNoNlVCVnpseHJ1b3RPakVWUm8x?=
 =?utf-8?B?SW9XUkZQTmt4QzZkWXZZc1V0UkhjRTM5UWVsVVh3Myt5dzJvWWZGQnRxZzJU?=
 =?utf-8?B?KzlDeTZqaWFjcmdKbkJVYm50c25uN2FUSDNtSTM4M3ZuNUR3MVNQSkNDbm12?=
 =?utf-8?B?cExENzI2aThJV2hiMHE2ZHdOU0xvOEROMVBVYUQ5cFZnYzgrTDlpKzljQTFY?=
 =?utf-8?B?QW9tSmxGWG5rL3huaU1IdjVWSmlWWFNoTmdUcnpCS2xsWWg3ZFJBU3dtbGZT?=
 =?utf-8?B?c0JJYjFsRDRRNU8yNmgvRkJudHJUV2hwM2NCK0ZXNVhMbUEzUEdaMXlzamVu?=
 =?utf-8?B?MzkrbUpsb1ltY0NrcUU5RkxYekpmYXFpek5FY3hqcHFqbWhmcEl2QnJNL1Yr?=
 =?utf-8?B?bXhiUUdTWTUwSDd6S1I2a2N6TFZ2ZVJ0cW8zcGlsbFlCWWhtOFd2TmY0bEVN?=
 =?utf-8?B?VkViazlLaDJESlNBblgyK2lMdWxOZ2szWWRLeVBhZEhDZnVsc2ZQN1RZd1pD?=
 =?utf-8?B?TDIxSGlNKzZRZnAwMVY4THkrZEZkZzJsZWxDYkxPbXRxQk5pY2lBMWd0cU5n?=
 =?utf-8?B?Yzc0YW8zbWphWjJQR2lpbTV0QlVVNUZlaGdoUkRGY0tFN0ZwOG9oVkxSalp4?=
 =?utf-8?B?K3h2ZHMwcVEwNHMvajRmUFgycG15YTF1NDd3ZGxsYjQ0c2ZZS1ViK2N2L2JC?=
 =?utf-8?B?STBGSVJudzkydFZsajNvQWRmZ25obDlFSUNOamhyRmxuMkk5QWpQb3VLRTdv?=
 =?utf-8?Q?f77ps+nOG4MkasMIFf3JdlI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 525a9220-efab-460d-8249-08d9d4f880a6
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2022 11:50:02.7665 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GGSwECnJYmQDv/eKPRglDbvXc6nH6azk72cIwhC+DZljK61JV/iDNrIcMNYoT6NdQ3Q+7dl0RV6R40y2cYglmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1947
X-OriginatorOrg: intel.com
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-amarula@amarulasolutions.com,
 dri-devel@lists.freedesktop.org, Robert Foss <robert.foss@linaro.org>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Sam Ravnborg <sam@ravnborg.org>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jagan,

On 11.01.2022 10:32, Jagan Teki wrote:
> Hi Andrzej,
>
> On Tue, Dec 28, 2021 at 4:18 PM Andrzej Hajda <andrzej.hajda@intel.com> wrote:
>> Hi Marek,
>>
>> On 23.12.2021 10:15, Marek Szyprowski wrote:
>>> Hi Jagan,
>>>
>>> On 18.12.2021 00:16, Marek Szyprowski wrote:
>>>> On 15.12.2021 15:56, Jagan Teki wrote:
>>>>> On Wed, Dec 15, 2021 at 7:49 PM Marek Szyprowski
>>>>> <m.szyprowski@samsung.com> wrote:
>>>>>> On 15.12.2021 13:57, Jagan Teki wrote:
>>>>>>> On Wed, Dec 15, 2021 at 5:31 PM Marek Szyprowski
>>>>>>> <m.szyprowski@samsung.com> wrote:
>>>>>>>> On 15.12.2021 11:15, Jagan Teki wrote:
>>>>>>>>> Updated series about drm bridge conversion of exynos dsi.
>>>>>>>>> Previous version can be accessible, here [1].
>>>>>>>>>
>>>>>>>>> Patch 1: connector reset
>>>>>>>>>
>>>>>>>>> Patch 2: panel_bridge API
>>>>>>>>>
>>>>>>>>> Patch 3: Bridge conversion
>>>>>>>>>
>>>>>>>>> Patch 4: Atomic functions
>>>>>>>>>
>>>>>>>>> Patch 5: atomic_set
>>>>>>>>>
>>>>>>>>> Patch 6: DSI init in enable
>>>>>>>> There is a little progress! :)
>>>>>>>>
>>>>>>>> Devices with a simple display pipeline (only a DSI panel, like
>>>>>>>> Trats/Trats2) works till the last patch. Then, after applying
>>>>>>>> ("[PATCH
>>>>>>>> v4 6/6] drm: exynos: dsi: Move DSI init in bridge enable"), I get no
>>>>>>>> display at all.
>>>>>>>>
>>>>>>>> A TM2e board with in-bridge (Exynos MIC) stops displaying anything
>>>>>>>> after
>>>>>>>> applying patch "[PATCH v4 2/6] drm: exynos: dsi: Use drm
>>>>>>>> panel_bridge API".
>>>>>>>>
>>>>>>>> In case of the Arndale board with tc358764 bridge, no much
>>>>>>>> progress. The
>>>>>>>> display is broken just after applying the "[PATCH v2] drm: bridge:
>>>>>>>> tc358764: Use drm panel_bridge API" patch on top of linux-next.
>>>>>>>>
>>>>>>>> In all cases the I had "drm: of: Lookup if child node has panel or
>>>>>>>> bridge" patch applied.
>>>>>>> Just skip the 6/6 for now.
>>>>>>>
>>>>>>> Apply
>>>>>>> -
>>>>>>> https://protect2.fireeye.com/v1/url?k=a24f3f76-fdd40659-a24eb439-0cc47a31cdf8-97ea12b4c5258d11&q=1&e=37a169bf-7ca5-4362-aad7-486018c7a708&u=https%3A%2F%2Fpatchwork.amarulasolutions.com%2Fpatch%2F1825%2F
>>>>>>> -
>>>>>>> https://protect2.fireeye.com/v1/url?k=a226360f-fdbd0f20-a227bd40-0cc47a31cdf8-ebd66aebee1058d7&q=1&e=37a169bf-7ca5-4362-aad7-486018c7a708&u=https%3A%2F%2Fpatchwork.amarulasolutions.com%2Fpatch%2F1823%2F
>>>>>>>
>>>>>>> Then apply 1/6 to 5/6.  and update the status?
>>>>>> Okay, my fault, I didn't check that case on Arndale.
>>>>>>
>>>>>> I've checked and indeed, Trats/Trats2 and Arndale works after the above
>>>>>> 2 patches AND patches 1-5.
>>>>>>
>>>>>> The only problem is now on TM2e, which uses Exynos MIC as in-bridge for
>>>>>> Exynos DSI:
>>>>>>
>>>>>> [    4.068866] [drm] Exynos DRM: using 13800000.decon device for DMA
>>>>>> mapping operations
>>>>>> [    4.069183] exynos-drm exynos-drm: bound 13800000.decon (ops
>>>>>> decon_component_ops)
>>>>>> [    4.128983] exynos-drm exynos-drm: bound 13880000.decon (ops
>>>>>> decon_component_ops)
>>>>>> [    4.129261] exynos-drm exynos-drm: bound 13930000.mic (ops
>>>>>> exynos_mic_component_ops)
>>>>>> [    4.133508] exynos-dsi 13900000.dsi: [drm:exynos_dsi_host_attach]
>>>>>> *ERROR* failed to find the bridge: -19
>>>>>> [    4.136392] exynos-drm exynos-drm: bound 13900000.dsi (ops
>>>>>> exynos_dsi_component_ops)
>>>>>> [    4.145499] rc_core: Couldn't load IR keymap rc-cec
>>>>>> [    4.145666] Registered IR keymap rc-empty
>>>>>> [    4.148402] rc rc0: sii8620 as /devices/virtual/rc/rc0
>>>>>> [    4.156051] input: sii8620 as /devices/virtual/rc/rc0/input1
>>>>>> [    4.160647] exynos-drm exynos-drm: bound 13970000.hdmi (ops
>>>>>> hdmi_component_ops)
>>>>>> [    4.169923] exynos-drm exynos-drm: [drm] Cannot find any crtc or
>>>>>> sizes
>>>>>> [    4.173958] exynos-drm exynos-drm: [drm] Cannot find any crtc or
>>>>>> sizes
>>>>>> [    4.182304] [drm] Initialized exynos 1.1.0 20180330 for
>>>>>> exynos-drm on
>>>>>> minor 0
>>>>>>
>>>>>> The display pipeline for TM2e is:
>>>>>>
>>>>>> Exynos5433 Decon -> Exynos MIC -> Exynos DSI -> s6e3ha2 DSI panel
>>>>> If Trats/Trats2 is working then it has to work. I don't see any
>>>>> difference in output pipeline. Can you please share the full log, I
>>>>> cannot see host_attach print saying "Attached.."
>>>> Well, there is a failure message about the panel:
>>>>
>>>> exynos-dsi 13900000.dsi: [drm:exynos_dsi_host_attach] *ERROR* failed
>>>> to find the bridge: -19
>>>>
>>>> however it looks that something might be broken in dts. The in-bridge
>>>> (Exynos MIC) is on port 0 and the panel is @0, what imho might cause
>>>> the issue.
>>>>
>>>> I've tried to change in in-bridge ('mic_to_dsi') port to 1 in
>>>> exynos5433.dtsi. Then the panel has been attached:
>>>>
>>>> exynos-dsi 13900000.dsi: [drm:exynos_dsi_host_attach] Attached s6e3hf2
>>>> device
>>>>
>>>> but the display is still not working, probably due to lack of proper
>>>> Exynos MIC handling. I will investigate it later and let You know.
>>> I've played a bit with the Exynos DRM code and finally I made it working
>>> on TM2(e). There are basically 3 different issues that need to be fixed
>>> to get it working with the $subject patchset:
>>>
>>> 1. Port numbers in exynos5433 dsi/dts are broken. For all pre-Exynos5433
>>> boards the panel was defined as a DSI node child (at 'reg 0'),
>>
>> True, emphasis that it is reg 0 of DSI bus.
>>
>>
>>>    what
>>> means it used port 0.
>>
>> And this does not seems true to me. Established practice is (unless I
>> have not noticed change in bindings :) ) that in case of data bus shared
>> with control bus the port node is optional. In such case host knows
>> already who is connected to its data bus, it does not need port node.
>> And if there is no port node there is no port number as well.
>>
>> As I quickly looked at the exynos bindings they seems generally OK to
>> me, if there is something wrong/suspicious let me know.
>>
>>
>>>    Then, Exynos5433 introduced so called RGB-in at
>>> port 0 and panel at port 1 (as described in the dt bindings).However
>>> the committed Exynos5433 dtsi and TM2(e) dts still defined panel as a
>>> DSI child (with reg=0, so port 0) and Exynos MIC as of-graph at port 0.
>>> The Exynos DSI code however always searched for a panel as a DSI child
>>> node, so it worked fine, even though the panel and exynos mic used in
>>> fact the 'port 0'. IMHO this can be fixed by the following patch:
>>>
>>> diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
>>> b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
>>> index bfe4ed8a23d6..2718c752d916 100644
>>> --- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
>>> +++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
>>> @@ -1046,8 +1046,8 @@
>>>                                    #address-cells = <1>;
>>>                                    #size-cells = <0>;
>>>
>>> -                               port@0 {
>>> -                                       reg = <0>;
>>> +                               port@1 {
>>> +                                       reg = <1>;
>>>                                            dsi_to_mic: endpoint {
>>>                                                    remote-endpoint =
>>> <&mic_to_dsi>;
>>>                                            };
>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>>> b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>>> index d2933a70c01f..e8e2df339c5f 100644
>>> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>>> @@ -220,8 +220,8 @@ enum exynos_dsi_transfer_type {
>>>     };
>>>
>>>     enum {
>>> -       DSI_PORT_IN,
>>> -       DSI_PORT_OUT
>>> +       DSI_PORT_OUT,
>>> +       DSI_PORT_IN
>>>     };
>>>
>>>     struct exynos_dsi_transfer {
>>> --
>>>
>>> 2. (devm_)drm_of_get_bridge() ignores panel's 'reg' property and it is
>>
>> I guess drm_of_get_bridge should not be used in exynos_dsi_host_attach
>> at all - there are no ports here, only of_node of the sink.
>>
>> Since there is no helper to workaround the dualism panel/bridge you
>> should still use of_drm_find_bridge and of_drm_find_panel pair.
> We have 2 use cases so far for adding input and outputs for a given host node.
>
> 1. with ports
>
>      dsi {
>              compatible = "samsung,exynos5433-mipi-dsi";
>              #address-cells = <1>;
>              #size-cells = <0>;
>
>               ports {
>                                  #address-cells = <1>;
>                                  #size-cells = <0>;
>
>                                  port@0 {
>                                          reg = <0>;
>                                          dsi_to_mic: endpoint {
>                                                  remote-endpoint = <&mic_to_dsi>;
>                                          };
>                                  };
>
>                             port@1 {
>                                         reg = <1>;
>
>                                        dsi_out_panel: endpoint {
>                                                  remote-endpoint =
> <&dsi_in_panel>;
>                                        };
>                               };
>              };
>
>              panel@0 {
>                      compatible = "samsung,s6e3hf2";
>                      reg = <0>;
>                      vdd3-supply = <&ldo27_reg>;
>                      vci-supply = <&ldo28_reg>;
>                      reset-gpios = <&gpg0 0 GPIO_ACTIVE_LOW>;
>                      enable-gpios = <&gpf1 5 GPIO_ACTIVE_HIGH>;
>
>                      port {
>                                      dsi_in_panel: endpoint {
>                                             remote-endpoint = <&dsi_out_panel>;
>                                       };
>                      };
>              };
>      };
>
>
> 2. with port
>
>      dsi {
>              compatible = "samsung,exynos5433-mipi-dsi";
>              #address-cells = <1>;
>              #size-cells = <0>;
>
>              port {
>                      dsi_to_mic: endpoint {
>                              remote-endpoint = <&mic_to_dsi>;
>                      };
>              };
>
>              panel@0 {
>                      compatible = "samsung,s6e3hf2";
>                      reg = <0>;
>                      vdd3-supply = <&ldo27_reg>;
>                      vci-supply = <&ldo28_reg>;
>                      reset-gpios = <&gpg0 0 GPIO_ACTIVE_LOW>;
>                      enable-gpios = <&gpf1 5 GPIO_ACTIVE_HIGH>;
>              };
>      };
>
> We have a patch which do find the panel/bridge as a child node[1] via
> devm_drm_of_get_bridge. However that based on the above use cases
> where child panel/bridge added as per 2 use case and there is no
> possibility of child node in 1 use case as it has a feasibility to add
> outputs via 'ports'.
>
> Since exynos5433 has 'ports' in host node, this patches [2] added
> panel via port@1.
>
> [1] https://patchwork.amarulasolutions.com/patch/1823/
> [2] https://patchwork.amarulasolutions.com/patch/1836/


Maybe I am missing something, but you do not have to 'find' 
panel/bridge, you have it already - it is 'device' argument of 
exynos_dsi_host_attach.

For me it looks odd when panel calls 'hey I am here, ready to proceed' 
(exynos_dsi_host_attach callback), and then dsi host ignores this call, 
instead it look for panel using different mechanism.


Regards

Andrzej


>
> Thanks,
> Jagan.
