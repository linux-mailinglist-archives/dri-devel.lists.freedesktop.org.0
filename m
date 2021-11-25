Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB2F45D9FA
	for <lists+dri-devel@lfdr.de>; Thu, 25 Nov 2021 13:24:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0F2C6EB97;
	Thu, 25 Nov 2021 12:24:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BF956EB91
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 12:24:08 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10178"; a="259404077"
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; d="scan'208";a="259404077"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2021 04:19:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; d="scan'208";a="457388299"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga003.jf.intel.com with ESMTP; 25 Nov 2021 04:19:53 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 25 Nov 2021 04:19:53 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 25 Nov 2021 04:19:53 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 25 Nov 2021 04:19:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XTdajjLLV6+BIXZJcLYR/+N9Fz3P/yzXczK1nLlL/pG0xM1p4fFXmcpo+jtidqHcmOjgUxDvHsqOxqjqe3A39gzoNGpia9WmoFkjh0FjMLXTRVgSZHXvFWbIRt9ifWC41fozlerZYY89gYpVdUvX/xyYRJdI9QgwfVareUOYPAqkq89/hXh4Gbd4n+7cq+8C4EupsyxoVrmJ2YIRVkMdz1ABGxeIPpQdexWyIGTbTYKf9OWpJXpRghT0Q6PGeTX0P3X/Cpf/wVBQyB8xEOWl//mLm4RJeGXOaT+4+DGpumMehVh7MAfsba1Grgf4mTQMpgOeYf2rJJoIn8fTUKirTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n9ZwWcnfGwhE1R27Z/jj1MTyqeFfPWy0QlIxJPz4bvg=;
 b=CtwLURdBphKiaY9ar1mFeb53kqsbblPhDlxfmGeL5Bwh5Qth4FBnGfgkiYaCQDsQg8OFsT5QUFntb/cEMPOElXR95N6R3krRySB8FCHq+S7f9gn0ZWCMHrev1GQccNQDjRP7VwsgQriCpPd6mYw0nJg6kTVPfDdMcfKdrCtk+ihY5uhlXp9uef8FZU7GVKpA65Nut3N07ZOgRQSj30cmL8yge70Pf0fAFDhzeLXfBzmT9QGDbQIdPQ7xAgM2v7+Oic4vgmw7RO6hxaONIvMB4enoNoZj2fHjV8glv+1B3t6QRdEapYQ2TgNSosGVq8mkQdYtEhYEZIGegdKsUv/l6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n9ZwWcnfGwhE1R27Z/jj1MTyqeFfPWy0QlIxJPz4bvg=;
 b=zFBT3lB7rd3Lz5dSp0Ms767rdVltvBchiTz4si2zCLUhB34QMUD7sly6eXNqfDOCyNP2KkxfMQvvW42tbi0P5wppmUCrxgekc6U0lcFzZwRSrS04/4mxlmEp6Jt9jDev5KU53mz8wo4bp6qIa7t2Ipaxn66pbXZCHfG1VJ2IwM0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3180.namprd11.prod.outlook.com (2603:10b6:5:9::13) by
 DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.15; Thu, 25 Nov 2021 12:19:52 +0000
Received: from DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::a94a:21d4:f847:fda8]) by DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::a94a:21d4:f847:fda8%7]) with mapi id 15.20.4690.027; Thu, 25 Nov 2021
 12:19:52 +0000
Message-ID: <e3fe871d-2b9f-c15a-0fc6-97b2b4f7a0b0@intel.com>
Date: Thu, 25 Nov 2021 13:19:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.2
From: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: Exynos DSI bridge conversion
To: Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Dae <inki.dae@samsung.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Marek Vasut <marex@denx.de>, "Michael
 Tretter" <m.tretter@pengutronix.de>
References: <CAMty3ZBAQDVaOCZspgEmiuELncEbKCiRhTfojGcZV+-+7V31mg@mail.gmail.com>
Content-Language: en-US
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <CAMty3ZBAQDVaOCZspgEmiuELncEbKCiRhTfojGcZV+-+7V31mg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU2PR04CA0203.eurprd04.prod.outlook.com
 (2603:10a6:10:28d::28) To DM6PR11MB3180.namprd11.prod.outlook.com
 (2603:10b6:5:9::13)
MIME-Version: 1.0
Received: from [192.168.0.29] (88.156.143.198) by
 DU2PR04CA0203.eurprd04.prod.outlook.com (2603:10a6:10:28d::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.22 via Frontend Transport; Thu, 25 Nov 2021 12:19:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2595baf2-b827-4fdc-ee42-08d9b00de1e5
X-MS-TrafficTypeDiagnostic: DM8PR11MB5703:
X-Microsoft-Antispam-PRVS: <DM8PR11MB57035C31CD189A2C35E16F74EB629@DM8PR11MB5703.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9rQNJTNB4sHKpdton6FSSNpw+AhVvkajHNgDlXCNtypbag/f4n3BQ5QHXlPGFKS6FeN35Mz33tfizRHeetAyA/TI7GjYOYSZVcJnSulg0kItPr0tcn3xAtEd9VbZ0M7rvyxvjbCplvEd1TYOPsD+NaheylDk8zRrDQKcMFKXeENH4Xi63P1GVKCCoYF1Lx4lHFxKAfFTlIqtUT489axY6C2F48v0R5jrgYGASR8bkuCdV1MWZpFSnxjknNu4ZTXB4TTCAKJZ6suwFIJrJAv9leOIYZGT0yRa4rSZvt/nTvT5xZuW1YhNs0giBdUi44+5PlpALEsojXhs4TS/+BTWyi9c0iYFS5PE+NEX7/ZeEYjMEz56d+hPY+xzKk5BrJRyrtZ3rR39Q8/dN8wtqLsykO7ejYZzYMD1ToWLb8pmNiUoLxVjw8qKuG27N/jrOI821wX07E8WZ9qW4Qwb5f8mb77M3n8XNGGE2E23sYOloPfA3IAPbZL4gH4jXfGSnNDcG78YXfib4KzLONT6i2zMvQHLJEBXqky6wWfT2mUagoy/OP73XBeRC67Z+psOD0faVFqk5+w7gnMuJhglSleXnzcYIchbyWoIwAI7cy4sVlhni7AbQUT7n77F8+Xf4CXv26UddjuFjy2wlvpXm7h95kjtGvGTPEWFMm0MeJzSQL43JmtEtl17FGWB76AGT77wlt3hF/3Xit/Dv3bDPBxlp2XlOhWBl1P5OTqLirbL5Bw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(44832011)(5660300002)(186003)(956004)(86362001)(2616005)(8676002)(66946007)(2906002)(38100700002)(31686004)(6666004)(82960400001)(36916002)(66556008)(66476007)(31696002)(26005)(4326008)(110136005)(16576012)(36756003)(54906003)(316002)(53546011)(3480700007)(508600001)(6486002)(83380400001)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VG1yQVFjZ1pNV3Era2JJNUl4Tk5hYmhuUjQ3Qms4RXBEYXl3eGJqYlp2Z096?=
 =?utf-8?B?UDcyT2ZiMGVwVnBBYWlEajVCckFMZlM3TjQ5b2dQWnJNZFNSVFlCa1kvNTRR?=
 =?utf-8?B?aHVqdlordy9jamxBS3BBaHJITzd6UXdnNW1pVmdPQnJ4Q3Y3dHp5YXRWSDV3?=
 =?utf-8?B?OU03QUJmdjJxN1YzNFI0OGxRT2hwQmxQN2xKMWw5WitTZTFXOGNOMXBxUldi?=
 =?utf-8?B?N3c0MHhGUXljZ2hXbHRMa1FSMDM4Q0dmWitEbmZRb3YrSEVZWis5bTVjaWxS?=
 =?utf-8?B?ckNUZTVHTkNUU1lXSFAvM1pLcm40amRrZzJwc3JyY3ZFOHZ0akQ4eXZGMVFP?=
 =?utf-8?B?Y21jTWNEcGkveDFuZkpZbUxPTmRYOVNtYldyRGhIYVpwTWVWVzJ1S2VsTnAy?=
 =?utf-8?B?a3NGLzROWWpZd0EyQW1lKzlyRmxJNkNVZFdjdklWbHY1SlJ1RXE1SXNlUWpW?=
 =?utf-8?B?Y3dqNDdBK0xIY1dac1pNUklsL1o1RWNtTG5Wa0x4ZUZmTzhYVURNSTYwODZV?=
 =?utf-8?B?em51WFhoRnFneFFKK0hUOG9xYy9wMlkzT3gzSDZ4Lys1RnN1T2lxTGk4TTBU?=
 =?utf-8?B?V291d2haeWI3bXFEV0Z5dDRNaUcrWm9SRGdzSHhZVXVJT3p3SzEwQ3AxeHVx?=
 =?utf-8?B?Nmh1aTM4NjVMakE3cjZYWXhhdDZoSTNWYU9ubFp3VXNRa2MrR3p0dTVCbVBs?=
 =?utf-8?B?VVAwaDhvdjYvZys5TktkT0lGUms5bVhvc1F6RVBYcnFDY25DQjAxdUJManRQ?=
 =?utf-8?B?ZmRaOFhLMlB0bEhodzcrdGdHNzlIdXhmamYwaElmWDlSemo1ZGZkMzNxV3lx?=
 =?utf-8?B?SjJiMXJIMW0vczN5SmFuWHdqYjdOTlcvcVdWVG5DUVNwYUNzcHBnblRxZWRi?=
 =?utf-8?B?NlNGbUpncW5CdHIyS1EyNmtqRE1kV0czVm83NDZOelhycmc5emV4eWF6aDJi?=
 =?utf-8?B?d2YxcFZFN1czbXBsYnBqemFMNUwxN3Bzc1ZUc1BaSmdXZXZ1U3kzZU5Hbm5H?=
 =?utf-8?B?bzJUcmF0WTdjRkd3SytnazZqQXRBYmc4TDdaMjNCS2JwNFhhYnp6RXo3VTdj?=
 =?utf-8?B?WEs3bTEvdXFjZ2JpQWROakZueGUzcEM3eHdjNjJpNk92cXhEeVpndzFZeFpK?=
 =?utf-8?B?UjRjdzg1dUE0VVhGR0t3bXQwM0o4R09yaE5ibzQzN3NoWDZFRVY5ck5iclA3?=
 =?utf-8?B?RHVXaHhVQXFtZUg5Z2hoVncxeG9hdHh3ZjNpa2loYW4vRGtWWWxTYm5Vckpx?=
 =?utf-8?B?bnNTdUNWVWR2b2JicUFYVjduR3owQ3Y0SzRjUzZXSDhpcGJkRzVqUTF4K29F?=
 =?utf-8?B?Tk9YdFV3Y0hSUFNOcDJQSzR1Yms4THVQYXcrZ0VvaVFHZlRlT2gzWWxqZ09M?=
 =?utf-8?B?VzE4TU96YkIxcTRNRE5hRlEvQldGTUhIZWluS2w5ZHhBaDF6MWQzSGV5Q1pZ?=
 =?utf-8?B?MDBxL0tPYTY1K045RExjOEYvQWRKc0xyTFBtb25JQ2lKUTFBNkdrRXpNVko3?=
 =?utf-8?B?V0NKT25RcW1RVm01Ti94THJFWjVhQ3dIaXVRMjJNTzN1VXIyMytSUlB5aHpn?=
 =?utf-8?B?Zm52K0FjdUpSQUxCN3hMMGJEVWZxaWZETURkcjg1cTJ5WUFTTm5rRTBqaURP?=
 =?utf-8?B?NGtscmF1WHBka0lJdEtBYXNLdUJYdXZMSHhGYnB5ZzNnVk8vVlJRM3cwM3ly?=
 =?utf-8?B?M1B0YkRSVjN6bkFqZTR0Z09UWDg4Y3dCRmZCalU4SmtFYjhIN1hRWExWVkxN?=
 =?utf-8?B?d0tYcDFDR0hab2RXMHNSS09Kc2NMQVh4R1pBQXlyRGZLYzVhMFlZclE5RTU5?=
 =?utf-8?B?N3Jwa1BYTkI0bVZ5NFZDUkZQWlYrNG5MdTRnS05PZFpJUlM5bEtUU3R6Zklp?=
 =?utf-8?B?R0ZSU0ErY2lSck1LZmNvb3NXRjJvYjZLZmZzcmhScWFIa3M2YkFkQVpKZlBr?=
 =?utf-8?B?ZlNMTmd6dElEUUhVZkxZc1RWVW1vdlF3TXBzTUhvZkNDdVl4WGZVTlN6dnVq?=
 =?utf-8?B?VWp5RE5jMWVpU29JQWNaazhqaTVoeHZkZUdRbXJvSlo1cklXNmxFSjZyU05B?=
 =?utf-8?B?ZFg5SkF5MEt6OXB2OHBaUGhkWWtJZk5OSmtGcTlhRFoyMkVsVHdJdjdlcDFM?=
 =?utf-8?B?QVJQcjJjNENZWis3Q0V5bk1ncmFGQzZ3MXlON25zQUQzR3hCQmdoYUlDNHU4?=
 =?utf-8?Q?E2lHYXjOPeyXrGoqr1EvM4c=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2595baf2-b827-4fdc-ee42-08d9b00de1e5
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2021 12:19:52.2690 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JmUHg07JRXJ+Pn4/RV0/e8zfJE12H5VdiDp+VzgaK6Tf09C58AW70op61T4vORumdpSeja7EBeiLJDRf/e9MKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5703
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
Cc: linux-amarula <linux-amarula@amarulasolutions.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jagan,

On 25.11.2021 07:33, Jagan Teki wrote:
> Hi Andrej and all,

Andrzej :)


> I'm trying to convert existing exynos dsi driver to bridge and make
> them accessible for i.MX8MM platform.
>
> I've a few questions on the existing exynos dsi driver and which is
> indeed incompatible to proceed to make the bridge conversion.


There were few problems the design of exynos_drm solved:

- avoid late exynos_drm creation - when exynos_drm deferred it's probe 
(waiting for panel, which was waiting for regulator, which was waiting 
for ...) , after some point of booting userspace assumed there is no 
graphic console at all and we ended with black screen - I do not know if 
it is still valid reason,

- avoid crashes due to panel unbind/rebind - it is still valid, if I 
remember correctly.

How it was solved? Exynos_drm does not wait for non-componetized panels 
(bridge support was added later) it is created as soon as all components 
are probed. It uses DSI attach/detach notifications and hotplug event to 
signal the panel appeared or will be removed, then the panel is 
dynamically added/removed from the pipeline - it is safe because 
pipeline is in disconnected state and componentized encoder has full 
control of panel ops.

Adding support for bridges complicated things, but the principle was 
similar.

With bridges decision was taken to not use bridge chain because:

- it has fixed and from DSI PoV broken call order - the issue many DSI 
developers are facing,

- it passes control of the bridge to DRM core - encoder loses the control.


To be clear, I am not a maintainer of exynos so I can only advice :)

As I understand the idea in your patchset is to convert exynos_dsi to 
standard bridge, and loose above 'benefits'?

If so then lets go to the details.


> 1. Hotplug event
>
> Commit from 295e7954c0d3fdbe0550d13e3cf4dd4604d42c68 which is waiting
> for drm to hotplug the downstream devices like panel or bridge to
> probe.
>
> Any idea how it works?


As described earlier exynos_drm is already working but since there is no 
panel DSI pipeline is in disconnected state.

In exynos_dsi_host_attach exynos_dsi knows the panel has been registered 
so it finds it, attaches it to the pipeline and gather panel properties.

It is done under mutex as DSI attach is asynchronous call from DRM PoV.

Then hotplug event is generated to inform DRM about the change.


> what if we move drm_bridge_attach in bind
> callback so-that binding will start once all the devices get attached.

Yes, but you should also postpone bind till the bridge appears (ie, move 
component_add to the end of dsi_host_attach cb).


> 2. Host register in bind
>
> Usual host registration is done in the probe, but the driver registers
> host in bind once the in_bridge is attached. any idea why?


Host registration is in bind to be sure exynos_drm is already created.

Putting DSI host registration in probe would create multiple concurrent 
scenarios in dsi_host_attach/detach callbacks:

1. exynos_drm not yet created - we should postpone panel attach.

2. exynos_drm created - we can attach now.

Since DSI and DRM frameworks are asynchronous, it is possible that 
creation/removal of exynos_drm can happen during dsi_host_attach/detach 
cb. So it would require additional synchronization.

So the above is the simplest solution.

Regarding in_bridge I am not sure how it exactly works I was not 
involved in it's 'design'.


>   What if we
> find the DSI as an output port in MIC and start attaching from there?
>
> 3. CRTC handling in DSI
>
> Commit from c038f53842cf840889473d219ace7f9121694e8d is trying to send
> the DSI flags information to CRTC with a function call. any specific
> reason for this? Any proper way of doing this move out from DSI?


Some panel info should be somehow passed to display controller (CRTC), 
at the time of writing it was the simplest one - as ExynosDSI was the 
part of Exynos Display Subsystem.

i80 stands for command mode, you can look at other command mode drivers 
(I hope there are some) how it can be done in more generic way.


> 4. Mutex calls while assigning device attributes.
>
> Assignment of lanes, format, mode_flags are done in mutex context, I
> think we can even do it in normal context isn't it? or any specific
> reason for doing this?


DSI host callbacks are asynchronous with DRM. With careful approach you 
could probably omit them.


> 5. Clock rates.
>
> pll_clk_rate, burst_clk_rate, burst_clk_rate are these clock rates
> retrieved from DT. which is not a proper way to support multi
> platform. I think pll-clock and burst-clock are computed based on
> panel pixel or bridge clocks. any specific computation for these to
> handle dynamically on code?


I also though about it, there was even some discussion on dri-devel 
about it. Calculated clocks seems for me more generic as well, bu on 
other side often platform specs provides only fixed ratings often 
encoded in initialization sequence of devices. I guess we should support 
both approaches. Of course it does not mean there is no place for 
improvement.


Regards

Andrzej


>
> All this information is essential for me to move this further as I
> don't have direct hardware and I'm trying to take some help from Marek
> Szyprowski.
>
> Please take some time, and help me.
>
> Thanks,
> Jagan.
