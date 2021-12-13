Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 779FD4726FA
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 10:57:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14F7A10E5AB;
	Mon, 13 Dec 2021 09:57:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7B9D10E505
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 09:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639389461; x=1670925461;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=arApOzW55QCWaM03l9JzgOv28xjKkFhYVfk0K1ugNUU=;
 b=AEi4PyVOJQkA/1I4vdIteX6GlxvJjsH86eW/mLf3kZCW/afKHkw8Slv0
 jJqlz4zIkyJrUL7xZR8CVCoCVS3HRhmIQLvBgfL3EpfSKn/Geu5kqB3SX
 fPLzvijSOSlfk++tzsIFU5b5q4BVA276kNo7Jstyvs5/0xjuLC+KT2MlH
 ZqJ6TYUjOFUeLvIMGpcT+Dsz6r0ONfi5myD+swApWjXyUa2yI1RjWylXJ
 TZD8PibLVL/Rv+YmRXCJfai7u4S04CTqRajPlyynMvmj6lMsaTV7r6Rjn
 iDeFu6gc41Q7LrAmCvKjWJrSzesSu0IoK/Ms4UUcC22T4u0yWDhfWaoAl w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10196"; a="237436548"
X-IronPort-AV: E=Sophos;i="5.88,202,1635231600"; d="scan'208";a="237436548"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 01:57:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,202,1635231600"; d="scan'208";a="681580971"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga005.jf.intel.com with ESMTP; 13 Dec 2021 01:57:24 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 13 Dec 2021 01:57:23 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 13 Dec 2021 01:57:23 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Mon, 13 Dec 2021 01:57:23 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Mon, 13 Dec 2021 01:57:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XKE0dMyJ0dBUaN+DfjEsQx8tcBuMoyEynpIi2VGbCcldvgF9vDTdS19GH8waoZurRIvsX3NTYjP3I99VsUYaW2Hk/x5sCX0ZenZ4dT4MCFBtHYeD+EDZ4bgxos1VD/vJ/fqnGGv6+vz189VnN9/BTvFvpZPVI74hP7Y1QeGeFaVs2Nj2+P7DRbiBIyTzUpqK5xVyKfYXVSfEvIuoSzaOnQpyBxF2CLCNAjjqKMAeS4QhZCLt3U8EHkBbZZiwCEWAyGyuKXM4fZWQ2y5dP6oZQF4ser+DbcKJYbXgX6vvbtAOB1TD8lZua7/n2RKJnDYj310SrSN8MZ61qmFaAVebew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cexc0sihSh2F0/3mGF69L3H55Hn0vHrZCCj4zlC+SVg=;
 b=BlNmmjSfATUxBqxscLBVZG+doDgdvgYabunPfW669W6r0hOkdV8rFglKK/MLrqGsRQq7iZN5fS4Os1LwsUk204YP61bDntyKcRO9sCbKkCDSop/27YjkJC/pHW0wu6GPQhUCUe5HJaWwjSkZipsNhvll7UxnACKXLL3iDTZ9k2yIqxi7LSnUrjNhlDIqV4cPdMNxa4+roXxTSdCbHnMAwBllgTNptHYOWoe7vW8lXSl73lmC1JkX3jlKfyglHvh82mDGqoFiC2P3SvlkH/OIl0wgivMzhF72/ZDALA98K55hDJSPuiHQvvB2qzterKAplfjJ24d1cJ89q400suQFfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cexc0sihSh2F0/3mGF69L3H55Hn0vHrZCCj4zlC+SVg=;
 b=EkN2/JSBt1LsawbwPPLAMoN7xP4OHM+nCvV/T6xXiT83qbBAfycMJdkI4I5iEaOVDx5uUmtPetVhE1CZdtgGmJgrgHvrN8Umiv3Q5jJAf5O1te89/DSIhpakI74HkOo6H6Xp6QKonQx4Uo/Fsb1hgtQwjuUa79whg4nExfr48ss=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3180.namprd11.prod.outlook.com (2603:10b6:5:9::13) by
 DM6PR11MB3660.namprd11.prod.outlook.com (2603:10b6:5:13c::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.24; Mon, 13 Dec 2021 09:57:18 +0000
Received: from DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::a94a:21d4:f847:fda8]) by DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::a94a:21d4:f847:fda8%7]) with mapi id 15.20.4755.028; Mon, 13 Dec 2021
 09:57:18 +0000
Message-ID: <84e905cd-5a0e-0b6d-1052-bc97acbfecdc@intel.com>
Date: Mon, 13 Dec 2021 10:57:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.0
Subject: Re: [PATCH v3 4/7] drm: exynos: dsi: Separate pre_enable,
 post_disable code
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Neil Armstrong <narmstrong@baylibre.com>, "Robert
 Foss" <robert.foss@linaro.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Sam Ravnborg <sam@ravnborg.org>, Michael
 Nazzareno Trimarchi <michael@amarulasolutions.com>, Inki Dae
 <inki.dae@samsung.com>
References: <20211212181416.3312656-1-jagan@amarulasolutions.com>
 <20211212181416.3312656-5-jagan@amarulasolutions.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20211212181416.3312656-5-jagan@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0032.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:90::45) To DM6PR11MB3180.namprd11.prod.outlook.com
 (2603:10b6:5:9::13)
MIME-Version: 1.0
Received: from [192.168.0.29] (88.156.143.198) by
 AM6P194CA0032.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::45) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Mon, 13 Dec 2021 09:57:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 696154d7-e9ad-42d0-92e4-08d9be1ef2a1
X-MS-TrafficTypeDiagnostic: DM6PR11MB3660:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <DM6PR11MB36602DA10597149C0554D150EB749@DM6PR11MB3660.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TRK2Si3x3oymeId4J3XXiKxyi9VIffpn90WrSH7y6NTKp7M+4hAPBDsTg6Ef+OcbBweOOow5yVr9bTBbl5W/El1R0ghJgc0bllWCv/OJvScj1vW2Yr/L+FbJBRIEuuS1ndEojuWIo8PAeE8Az2Tz2H1IrctTBfM5t7O6AW0xHQNhN0gqHlJAeFnkOy5txqPFyV9p8sjcy9UOpGE38+o1kvssLe6t3RGeC0TFIDBbzaXLzkEvsAmA5kEotRknXmj+cNYYtVDy2ktaiE3GEXZoXLTIZm8RriEI/3wGcM+6VHRlgKwAQ2vU2zr0pnONW7Wjl1cIRU0Hce0Qpi7+k0WihW0/hBgr+e5GJmGl/F7Ao1Q7I9DZlKVZ7y8gUvi3uPKrCdZuvmcFKMEUYJmYaRT/RYn739B0uj/mhIG0lHxPqRn9WmCrmQIn4Eayd0lut655Zy7t1oClZuh0wnoaJYX2iwAnDuC22/Bxcg9N8yU47pVz+x7yiABg7wntMdLnegYklMAICG1jFukRW3LmbF0iUFZdBokVhFSXoLv0IHpDajqjn4sZLpECkQfHjPBd/jfVjh9JLi8EbUw5p/xFiGF6TdsQk8PkHVP5v1cgEhOyQOjJCc2rPA7G2O3vmAVRUg4T7au4qX7KDIef9UfZfzIX3whtqY+IcgUwTsd+ByoSs/VhCzqPDHJTUA13HA9LZ5zagKQvdMq/McAajKilH2u2VN42vnugISaz8oTqmOlHQqM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(36756003)(66946007)(6486002)(53546011)(316002)(8936002)(36916002)(7416002)(44832011)(83380400001)(66476007)(6666004)(2906002)(86362001)(38100700002)(4326008)(186003)(2616005)(110136005)(26005)(82960400001)(956004)(5660300002)(8676002)(66556008)(16576012)(31696002)(508600001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dEpsODZzMFJ0aE1vS2FrL0Y3cGZqSjgwbFdZSmtHOGlQYy9NK1NMVWp5eHFI?=
 =?utf-8?B?VkdNMGRETVJZUkVDUUR5NUJ5SjJueVNmMndhNk45M05OZEMva0ZONVNROHB2?=
 =?utf-8?B?NFAxTEUwKzZMUFdHVWR6WGxOby9rN2dzMDExQVQ1bjN3M29SeCtINHd1OHlH?=
 =?utf-8?B?VjhaWjdvRU5RbTJjaSs0K2pzemJYWDA5WUduVDRwYjhYRzR5bnFlNW02R29X?=
 =?utf-8?B?VzVzTHhEVEJ2S0djckNDVWlxNkpZa3J0QmE4WUpVSmZIcSs0aW1OM1ZqVFMr?=
 =?utf-8?B?R3ZkRG04UW1MNE9Bb2RTaG9VTU9iSG1taDUrdFdFVVZzTStFdkllblJqbXcw?=
 =?utf-8?B?dzAveGphUmdrK0w3QTJIU3hVQ3JRZDdjUjRaNDk0RkJYMzV1eDhjcG14cWlL?=
 =?utf-8?B?VkpvbllXUmE0cWJ3dlBPQ3I4SDdKVXpqb0tVY1pkNDdTck5pVE9qRUhZVWJ3?=
 =?utf-8?B?aUdsU044Y01hTVl1UWplWmVRTHJaYjZCMkZ6Y0R1T280Y0tlc1pkSmNyTEp6?=
 =?utf-8?B?dGcyVFJIUmprVEUxOE9QSVdLbEpTS280bUQwenpnSTdQRWxYcUhGU2dxeHlz?=
 =?utf-8?B?YWVaTjlWQUdmTUgxcFFPNHFqbkwzdDIrMjNEUFoyaS9QQytKdGM5V3VQT1Bl?=
 =?utf-8?B?V20yWlFsMDNwSytTUkdxRFFsdnRDb01sT1lTbkk0UjAwRkxFNHQ1OVAwQ1R3?=
 =?utf-8?B?OUFTcWY4VDJkU1BJLzFjczNwa05TQ2NtVVplY2hEcjFsOEZqSUNrTkhubUI4?=
 =?utf-8?B?QTVFL1pxc1hVYTB5TlE2Y1lYWW1tOFlGYlBLald5UndMQlN6bFI2bFd5RElW?=
 =?utf-8?B?RmxmQ0p0V0l4aDBWOS9JVnFTK2FxK0Z6SnBMZFAremN1TE5mSnJHNzUvb3Rw?=
 =?utf-8?B?SURwc2R5MEZlZUJyaFRNcjZBMzQ1dGs4d3NQdDU5aUN5ZmtBa3E4d0JmZVp6?=
 =?utf-8?B?TEo3STl1S3NqeGdQV3VoMWFEUElvNUU0cVdWZFBXUjd5WW1rS1lBN3RGVzdN?=
 =?utf-8?B?SUp5bG16UzRETG1OdTNxc1NQd3p3ZGFVeXk4V21UcHZxWnVVSmVVT3lNUG0r?=
 =?utf-8?B?OGttcU9TOE1WdkY0QmZ2UFlESDdFZERobXF4bGZVLzV2MmdDWVhsbW1qZ1Vx?=
 =?utf-8?B?NG5ncVl1bk1PM2ppUWNNb2xpV3hJRi8xYWR2YzNjUktCMGJ3Tzl0VmpSbHVM?=
 =?utf-8?B?S2doRHkrWkhGd0ZxNElrOEdxRTBxR2NGekVkR0NjemRFZS9ITStmVG12czNH?=
 =?utf-8?B?RWhlbG1HZVZNclJqV21qWWtoUXgzblNlZ2IwRmR1enVrMUpnL3BsWWpTR01Y?=
 =?utf-8?B?SVBzR3hIczlFZHBOYUJqZW91ODVTbjE0b29KVnRPekFpZmcrK0c0RmprZytv?=
 =?utf-8?B?OXRXTEZreHd1Q0VzbHNmR3NicHhHaEJwWGMxdmJmSFlqZ2Juek1CYTU1bnhu?=
 =?utf-8?B?Q0VEOWIzZVJSZ3lORlVNU3V5MWkwQTY5SUhWRTdUdUJFUmtCOEVPdXdMd1pM?=
 =?utf-8?B?ZXR5OEdVRE52ZzNSS0xNVzhnUWVlUGY1MzA3YkE2Y0hJS3lwbVdXVUl1cnlK?=
 =?utf-8?B?aDRsbVdRclhwalBNWDFPNU8ydFVjNytOaGM4Z2RSYWpya3B1amRLbmZieXFS?=
 =?utf-8?B?c0xJU1pNNFJtd3ZiWllSdjFIdnRrVzJMb3VTa04xczRMMkJpZ3F2OEY0T2FQ?=
 =?utf-8?B?VXQ1NWxLaURXUDBMQXpSK3ovYnpRZkV0Z3YvWStIblhPdENnbnF6YURoelEv?=
 =?utf-8?B?ZmR3cUtESEtyUDlBMWdYejVMTGthRm1VSEp6UkRJS05tRCt2dEFrTVkybXE5?=
 =?utf-8?B?WXhPWS8xVzQySVNQbjlGVmQxd0ttY0Vnd1lHdk00TkNVV3VqZmZlNmNNUlZP?=
 =?utf-8?B?aXp6REpITWRqZ3o5SGlXMnEzVFg2Vzd6Zmx1S0srSUZlZktTc2ZMV2xxQ2lB?=
 =?utf-8?B?NGZaOUNCcWxwSVZGVmpqN2thdWZwMW9DZ3MrN2Q4aXIxL2hrbkZvZTZtc2wz?=
 =?utf-8?B?YU1rR1liYzEveWJhdDZuOEZ6U01ENUVGYS9xZFRvcGg0TnlCU2tielE1K1VH?=
 =?utf-8?B?SGxPRURQVHZvVnNkaElXRUdFdHR4MjJGNGxjbHFDVmFtbGYyU1FPSkdmK0Fm?=
 =?utf-8?B?cGlSSjZpaXBia0ZMbG10eDB4bHltUGZ0OVRtQ21aRlcrRDExNDdWTCtlc25s?=
 =?utf-8?Q?HPjM9Wxu197Ib3z6a8nXeIk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 696154d7-e9ad-42d0-92e4-08d9be1ef2a1
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2021 09:57:18.0656 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IglOLls9CrjkJHE38UEVJw476gcipd0pz+Pr2IWE30pWypl31dnMGTDq7e2wqLBWTz2DpOS1odKKwFwxOpfG4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3660
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
Cc: linux-amarula@amarulasolutions.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 12.12.2021 19:14, Jagan Teki wrote:
> Existing driver is calling manual bridge pre_enable, enable,
> disable and post_disable helpers with their enable and
> disable functions.
>
> Separate the enable code with pre_enable and enable helpers
> like enable the DSI in pre_enable and set the display in enable.
>
> Separate the disable code with disable and post_disable helpers
> like disable the DSI in disable and reset the display in
> post_disable.
>
> This way the bridge functions are compatible with respective
> downstream bridge and panel_bridge drivers.
>
> Example of enable bridge function calls with panel_bridge is,
>
> [ 2.079030] panel_bridge_pre_enable: start
> [ 2.079043] panel_bridge_pre_enable: end!
> [ 2.079045] exynos_dsi_atomic_pre_enable: start
> [ 2.079723] exynos_dsi_atomic_pre_enable: end!
> [ 2.079728] exynos_dsi_atomic_enable: start
> [ 2.102500] exynos_dsi_atomic_enable: end
> [ 2.146505] panel_bridge_enable: start
> [ 2.148547] panel_bridge_enable: enable
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v3:
> - new patch
>
>   drivers/gpu/drm/exynos/exynos_drm_dsi.c | 25 ++++++++++++-------------
>   1 file changed, 12 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index 1450187c1edc..07083a545948 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -1377,10 +1377,9 @@ static void exynos_dsi_unregister_te_irq(struct exynos_dsi *dsi)
>   	}
>   }
>   
> -static void exynos_dsi_enable(struct drm_bridge *bridge)
> +static void exynos_dsi_pre_enable(struct drm_bridge *bridge)
>   {
>   	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
> -	const struct drm_bridge_funcs *funcs = dsi->out_bridge->funcs;
>   	int ret;
>   
>   	if (dsi->state & DSIM_STATE_ENABLED)
> @@ -1393,38 +1392,36 @@ static void exynos_dsi_enable(struct drm_bridge *bridge)
>   	}
>   
>   	dsi->state |= DSIM_STATE_ENABLED;
> +}
>   
> -	if (dsi->out_bridge)
> -		funcs->pre_enable(dsi->out_bridge);
> +static void exynos_dsi_enable(struct drm_bridge *bridge)
> +{
> +	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
>   
>   	exynos_dsi_set_display_mode(bridge);
>   	exynos_dsi_set_display_enable(dsi, true);
>   
> -	if (dsi->out_bridge)
> -		funcs->enable(dsi->out_bridge);
> -


Ok, apparently I haven't catch that in previous patch you have left out 
bridge attached to encoder->bridge_chain, before the previous patch out 
bridge was detached from bridge_chain, which assured exynos_dsi has full 
control about callbacks.

Does it mean that after prev patch all bridge calls were called twice, I 
think it is incorrect.


Regards

Andrzej



>   	dsi->state |= DSIM_STATE_VIDOUT_AVAILABLE;
> +
>   	return;
>   }
>   
>   static void exynos_dsi_disable(struct drm_bridge *bridge)
>   {
>   	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
> -	const struct drm_bridge_funcs *funcs = dsi->out_bridge->funcs;
>   
>   	if (!(dsi->state & DSIM_STATE_ENABLED))
>   		return;
>   
>   	dsi->state &= ~DSIM_STATE_VIDOUT_AVAILABLE;
> +}
>   
> -	if (dsi->out_bridge)
> -		funcs->disable(dsi->out_bridge);
> +static void exynos_dsi_post_disable(struct drm_bridge *bridge)
> +{
> +	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
>   
>   	exynos_dsi_set_display_enable(dsi, false);
>   
> -	if (dsi->out_bridge)
> -		funcs->post_disable(dsi->out_bridge);
> -
>   	dsi->state &= ~DSIM_STATE_ENABLED;
>   	pm_runtime_put_sync(dsi->dev);
>   }
> @@ -1438,8 +1435,10 @@ static int exynos_dsi_attach(struct drm_bridge *bridge,
>   }
>   
>   static const struct drm_bridge_funcs exynos_dsi_bridge_funcs = {
> +	.pre_enable			= exynos_dsi_pre_enable,
>   	.enable				= exynos_dsi_enable,
>   	.disable			= exynos_dsi_disable,
> +	.post_disable			= exynos_dsi_post_disable,
>   	.attach				= exynos_dsi_attach,
>   };
>   
