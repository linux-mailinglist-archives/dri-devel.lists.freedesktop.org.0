Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 461B158807C
	for <lists+dri-devel@lfdr.de>; Tue,  2 Aug 2022 18:50:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDE4891B09;
	Tue,  2 Aug 2022 16:49:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2052.outbound.protection.outlook.com [40.107.244.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D128A91C33;
 Tue,  2 Aug 2022 16:49:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XUata67gSHaGPRoxjjeTm8mRBhb/9NM0svcE01lp+TF60jQVkgsJJIzZShYmV/iXODfpAVMKcwJVgk2QCoSLw8++cDlf+m/3k5cQyH691ua/ylIpYA4TBN48E+xxRSOw5UEwfnIk5ywlGrmg5/hlEI3aiqGmc2riSCP7PRBCgxG18dJzybYS61EOTb9BM8ZeYDjj7bPX9Hyysa3DK0sKuoH4CjXazL/Spk4hqwYN3PY2KOZPpaVnCctBTEW5IqXjMW3TbECrD7cFuJJs8xk7nAtARYA8GRYkZ04kvhXJArmUnjM5QAXI6rdeLBniyQTgrQPCdjLc6exWQarR9ptoMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=diCJJRpSjE6HZCLBpSbHRMI2iUZ77Sss/ktXaBchjnA=;
 b=cZ50FKY+DQL/mgNYbCATogBiHb/AACdezK7KqekhlS3ACqqTpA34Tptt2ykxYX/84A6Gplf+b6MA++94MjYdvycOIEUyNlTyUmMqA5lXfywwteQkBAa7uDCm39G6Gjw0+qNXcLZegjKGx6OkYrcUXhaa0rRjSo9U58MPiiXio7YOBjvswBtvv41d9DAjmWJrXBeWMt+wpao8J6VQUSyD/2ZOT03tIj9lywynGH2QEfwTSy+OYocEXwvgSYdwZpRz8oqlrhWxGh2hB4WGEqfXB5htvaH2CCCQlhpbxi75D0D4MeddcMJjcpxekEyHx4Il/BcN/WU2c0mSnKstF0w9rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=diCJJRpSjE6HZCLBpSbHRMI2iUZ77Sss/ktXaBchjnA=;
 b=e263jZDmL+Ct39zO8QTsmNh9QR1ivaFXuzZD9/BF2YhMI0fYTnjarCq1w2a5p+5K+j9DoO52uzGp6SAoQgssNcHgwLXcrBd4TXqiCJ8l7ZvVg1SMxyq87IdMEn5AZO6E8iLcTOduBFbSr+RDcyd1mK09EN48QPz50Dm71cme0naWMdIzUvcnquzLdfQ599EWPcXs9tzjH4s8gBzH5vvKge71WUupWF0a/fgoInsx/gjIPYWgF52TBSIE/pc5Zn2GDD99WxsAFwo++WDnJTMgXPXbTAyvRAVahmCGKHXp9cJ5xpH3uDO5n0EVYq4F5Y7RBIetR6SYXQmjMRClFHR1Ig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB2763.namprd12.prod.outlook.com (2603:10b6:5:48::16) by
 BY5PR12MB4902.namprd12.prod.outlook.com (2603:10b6:a03:1dd::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5482.12; Tue, 2 Aug 2022 16:49:41 +0000
Received: from DM6PR12MB2763.namprd12.prod.outlook.com
 ([fe80::6012:2e0d:2697:8b02]) by DM6PR12MB2763.namprd12.prod.outlook.com
 ([fe80::6012:2e0d:2697:8b02%3]) with mapi id 15.20.5482.016; Tue, 2 Aug 2022
 16:49:41 +0000
Message-ID: <5cfb26a2-ec7b-578e-dc01-79776dc7e0c9@nvidia.com>
Date: Tue, 2 Aug 2022 11:49:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 01/29] ACPI: video: Add
 acpi_video_backlight_use_native() helper
Content-Language: en-US
To: Hans de Goede <hdegoede@redhat.com>, Ben Skeggs <bskeggs@redhat.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Xinhui <Xinhui.Pan@amd.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Lukas Wunner <lukas@wunner.de>, Mark Gross <markgross@kernel.org>,
 Andy Shevchenko <andy@kernel.org>
References: <20220712193910.439171-1-hdegoede@redhat.com>
 <20220712193910.439171-2-hdegoede@redhat.com>
 <641cb059-48f5-5f05-5ec2-610f1215391c@nvidia.com>
 <20e4ffcf-2a3a-e671-5f98-1602b78df3cb@nvidia.com>
 <331ebd23-d2a4-bb33-5462-b9bd3284ab69@redhat.com>
From: Daniel Dadap <ddadap@nvidia.com>
In-Reply-To: <331ebd23-d2a4-bb33-5462-b9bd3284ab69@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DS7PR03CA0123.namprd03.prod.outlook.com
 (2603:10b6:5:3b4::8) To DM6PR12MB2763.namprd12.prod.outlook.com
 (2603:10b6:5:48::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 420bb7ab-aace-4e72-23a9-08da74a6febc
X-MS-TrafficTypeDiagnostic: BY5PR12MB4902:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZIzS6OwGacw2P3UWKCxovTQNOhNiELjnpaqBVaXWouIfhAgiUvhJHPUpR/DuVab9HaQTR8x9Y/jl5Jl+Q8Szehtwko/zc4yGAUSfjg4IDOBbNfUpLXLThpc17DOQZCjM0mjd4b9+Un7783LNTAmSeFUFnn19bFTiwiDIQD4FoLQFqaohAxot0ONszof9vJ02MGlmCeM3cBpNAbLNHh8nZ3P3S916epbh15ME6zQeO3X/AaJ/XAVUrjxjKx5gb3qvXxN11QYSHozkmHVAt71pw1nBVQl2+5MxrBZGcev9FA91p94UiKpKB2JDmnY15VnS8NLKWc7zEWA0H2c4b2Kw0ePffQOAAwZhdkmp2E096MsmiwpBjLvYmx106eI+x1D0S6PTHZ3gXBCyMaNZfIbfU3qNEyXhAl6kC6wLT4aiJFYJPnQ3niJVKA7ldmqiEXDOib8QcUsh0hWXoa3SPw2Cfm0TppnWAI0zhLu+bjX6XEeu+95qTO46YI6sXJRlZ+3l0+z9w3hkYQ3rUu5rK5dA/VJI/G54IfUXeQUVymTcfPsnFIPQke7AqF8R+EX1/U+gjCHEff+Uc3O2PWEqI3DCNpqH3nqASPFBeHheRPPuyE2XRbNnPY4Ih0EgF1lZfu/4HzSY6tZV1Ya/rsl9WFTXA51b/R7WMxfK9gIjNLcSAzhK7G590KIjInquue+IvtCFWRYEVP1Zg+SnqLtFG1wkcQuyr/4pyPG9/WCU/23IHEhKvLOfx5E+aHYrEWJCRUsOBEVejkapGC0QUAr4UyA38WoyoFor9i4K/VwahMJBHVU4fK2ohhFbjIuoOOcdDTkP3etUQ1GUmCld6C1ggFxgsRjVjztFnsbJgV7LmIANqJs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2763.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(346002)(136003)(396003)(366004)(39860400002)(26005)(53546011)(6512007)(86362001)(41300700001)(6666004)(6506007)(110136005)(31696002)(54906003)(316002)(478600001)(6486002)(38100700002)(921005)(2616005)(83380400001)(186003)(7416002)(30864003)(5660300002)(4326008)(31686004)(66556008)(8676002)(36756003)(66946007)(8936002)(66476007)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STFFbVoyZlIrYzB4NTdvK0dFeFNURkVLcmNBNWd3YkIzQ3YvZ2Z5Rmd6Q09y?=
 =?utf-8?B?R0k3MEdYeXBiNVpVQ0sxVGhSMjd1QnJ5YlVGaGl2N3RmRnBQSU1YaHI3dXJm?=
 =?utf-8?B?M2swSEZIdEU3YzZyWCs2QmJLMytFOVJUZ3NYSnBYUHJtMUJMRUZVTTMwOU1O?=
 =?utf-8?B?ZEV1T2NUbUJaZ3Q1N0pZWFVpREIrSFd3cEZQbTNOL24wdVkxb2E0VHBuVlZy?=
 =?utf-8?B?a29vWnJTblZyZzdZUTgyMHRjT1RTalJTMXAvWXJlNC9pMEJRMWd3S3BkR0dF?=
 =?utf-8?B?Mmp3WE9RM3NNWk1UMDFoUVBxSzZqTGdsOFhCbzZIaitHbkQ5dWlXbUFhcEJq?=
 =?utf-8?B?QlgyL01jT0hKUGM5NnZmUXJ4bjRKUGRBZUMvVEliSnFrdUlOQk13MFR4aHdj?=
 =?utf-8?B?MzViNHQrak14eUZkckpBb3NaWUorRjlYYjlzK1hkQzVWL2VpUE95bWtscCti?=
 =?utf-8?B?U3VSbUtvQ0J5RGk3Wk00cHNyU01zZVBwblc2dHBGeWFrYlhtZlhXZlJMRXNx?=
 =?utf-8?B?dStEZ0FVRkVFV2Rhak5TUmlpcURWbFNYQkRJTngxMHpkOEtSNGMzWTFjREhD?=
 =?utf-8?B?WVM3V0V4WjlxWjloVjI2TlkzZDdSRzdIZ3U1Qm50VjlrRVN0Vk5PZU1MT29W?=
 =?utf-8?B?SlErakN4OFYvUlJsYUh0Uzh1UEt1WHgyVGNKaHczaWh2ZjdQUDJkTTdTVDNT?=
 =?utf-8?B?Ukt3amlGR0M5L1BoOWhjYk9RMk5aemNkVjBjWTgvVXdsWENmNFFGbUJTZko0?=
 =?utf-8?B?eHEwdGY4MmhrQUhLMTIyWXM1dXVRL1EvYnRZTElSVUVJSWJkSjdQTkhvT1R0?=
 =?utf-8?B?WmtoSFBreWRRMFdMZGFFMGFKUHlzRDRaSERHcUdpRkNyR0xRVmViWk8xdnhE?=
 =?utf-8?B?dEZGcllOcVErL3gzbUQ2WnNPeW1OZnZ4SHVNZmtSMnVJQ0lSdzdJOWxvNVVG?=
 =?utf-8?B?LzhIcmVnZ3RoTUxuVFl4b0hxSVhxRHVpeFUvZGx3UjhMU0JHVjdUTGE4UGVk?=
 =?utf-8?B?ODZob2RxZEI5amV0WmMzQ282OWpwTHRJNzlOTktKQWZUK0g0SmJqZkV3cU9l?=
 =?utf-8?B?M0ZlclRWdC9kVnh6MFVIWjhrRlArRTFFNm9abm5GYU5zMlA2emZSZ2JIbnVW?=
 =?utf-8?B?TEZZNGVqQTVQaGR6d1NFWTlWZjh5ZUtuZklkQlJNejkwZkwvcTdEQjk3STVK?=
 =?utf-8?B?aGt1Umx0WlJ1RWJSRURoYklKeWFJQ29ya1FTZ1lCbW5ONW5lMlB1WEtDSkRa?=
 =?utf-8?B?L3hiOGhMajV2bTVLWUs2c2NyZTU2R0pVY3FxZ29oRUljRGhaQ3hhY21jYTVw?=
 =?utf-8?B?MTZrZFpjcTc2dnNPMTZFVHNlNmYwRWNyQWNpM3VrL0JsVVlSeUo1MkxLSFUy?=
 =?utf-8?B?aVhrUXJzbGNJempWQzh1amNVRVB4V3pNQUNIeFlmWW82djA4R0cwdDdBM1lG?=
 =?utf-8?B?U1JQSi82cG03RHc1RGE1cHFjWXlkeEtTKytuaGVQNU4yQ3V5OCtlYmZYUVM0?=
 =?utf-8?B?QXhBVUN3Qm9yTHNneUMxUzR2Tyt6VFdlNU5ncnA4WmI3bTMxWUtjaGVESEoy?=
 =?utf-8?B?OC9HR3U2Vjdaa1U3ODVQOGMvbXc3M1ZhRDh4TE5LaURnMGVZaHd2YlJHUWVV?=
 =?utf-8?B?M0Z1ajYrTXNoMHZEY3V2OEd3U3Avdm53Um8rOFNzdVhJaDUvNVhwY2FKQisw?=
 =?utf-8?B?RHFMNGNTdDhEVDdTczRnUnVJcDlYUS9aY3RNUHVnUUpxS2R6c0EyL3g5ODVn?=
 =?utf-8?B?SlpTQVM1ZVQwbkJZdXIvOXJOVU9tMEJuVUZZMkczeCtKcHJBbXI2UUUzTnJR?=
 =?utf-8?B?Y2poOXUxRGRnTmgrZXlPeE0vcDBwcmxiQzU4cCswOXhVOTRCY0xNcElEWHJ6?=
 =?utf-8?B?V3FDSFpNWlhtWHV6UUwzWHN1RDVVa2FtbEVtZmlJMjBZMkhiZUxCWTR4cC9r?=
 =?utf-8?B?Qy95MkorZE51Ym9DaXU0NVBRenVKZFM2VmZKeW9rUGxZa1VJSzQzYS9RTVpr?=
 =?utf-8?B?NEdsQlRTSXZXc0tUWCtnMDNIbU9ISHFpVnVwRUlxVWhaVDVXQ0lGejFFUEtM?=
 =?utf-8?B?S2ZhVGpLV0xURmJrTnJvaVYvUER4T1pmU0RRNWJNMDNSKzV6WXgzYlh5Qnox?=
 =?utf-8?Q?iXwgkBBCviPtvoyJ/PxIDOIus?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 420bb7ab-aace-4e72-23a9-08da74a6febc
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2763.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2022 16:49:41.5513 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OpHMoa7ZCB9bhGKUu6n8li3ytbnz8WoK/iOWcH+XI44PJGOHQfqmdw5nNg5sEFujQuoOZziyW4BT5Tk4qxelmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4902
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 intel-gfx <intel-gfx@lists.freedesktop.org>, amd-gfx@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Len Brown <lenb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/2/22 06:31, Hans de Goede wrote:
> Hi Daniel,
>
> On 7/21/22 23:30, Daniel Dadap wrote:
>> On 7/21/22 16:24, Daniel Dadap wrote:
>>> On 7/12/22 14:38, Hans de Goede wrote:
>>>> ATM on x86 laptops where we want userspace to use the acpi_video backlight
>>>> device we often register both the GPU's native backlight device and
>>>> acpi_video's firmware acpi_video# backlight device. This relies on
>>>> userspace preferring firmware type backlight devices over native ones, but
>>>> registering 2 backlight devices for a single display really is undesirable.
>>>>
>>>> On x86 laptops where the native GPU backlight device should be used,
>>>> the registering of other backlight devices is avoided by their drivers
>>>> using acpi_video_get_backlight_type() and only registering their backlight
>>>> if the return value matches their type.
>>>>
>>>> acpi_video_get_backlight_type() uses
>>>> backlight_device_get_by_type(BACKLIGHT_RAW) to determine if a native
>>>> driver is available and will never return native if this returns
>>>> false. This means that the GPU's native backlight registering code
>>>> cannot just call acpi_video_get_backlight_type() to determine if it
>>>> should register its backlight, since acpi_video_get_backlight_type() will
>>>> never return native until the native backlight has already registered.
>>>>
>>>> To fix this add a new internal native function parameter to
>>>> acpi_video_get_backlight_type(), which when set to true will make
>>>> acpi_video_get_backlight_type() behave as if a native backlight has
>>>> already been registered.
>>>>
>>>> And add a new acpi_video_backlight_use_native() helper, which sets this
>>>> to true, for use in native GPU backlight code.
>>>>
>>>> Changes in v2:
>>>> - Replace adding a native parameter to acpi_video_get_backlight_type() with
>>>>     adding a new acpi_video_backlight_use_native() helper.
>>>>
>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>> ---
>>>>    drivers/acpi/video_detect.c | 24 ++++++++++++++++++++----
>>>>    include/acpi/video.h        |  5 +++++
>>>>    2 files changed, 25 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/acpi/video_detect.c b/drivers/acpi/video_detect.c
>>>> index becc198e4c22..4346c990022d 100644
>>>> --- a/drivers/acpi/video_detect.c
>>>> +++ b/drivers/acpi/video_detect.c
>>>> @@ -17,8 +17,9 @@
>>>>     * Otherwise vendor specific drivers like thinkpad_acpi, asus-laptop,
>>>>     * sony_acpi,... can take care about backlight brightness.
>>>>     *
>>>> - * Backlight drivers can use acpi_video_get_backlight_type() to determine
>>>> - * which driver should handle the backlight.
>>>> + * Backlight drivers can use acpi_video_get_backlight_type() to determine which
>>>> + * driver should handle the backlight. RAW/GPU-driver backlight drivers must
>>>> + * use the acpi_video_backlight_use_native() helper for this.
>>>>     *
>>>>     * If CONFIG_ACPI_VIDEO is neither set as "compiled in" (y) nor as a module (m)
>>>>     * this file will not be compiled and acpi_video_get_backlight_type() will
>>>> @@ -548,9 +549,10 @@ static int acpi_video_backlight_notify(struct notifier_block *nb,
>>>>     * Arguably the native on win8 check should be done first, but that would
>>>>     * be a behavior change, which may causes issues.
>>>>     */
>>>> -enum acpi_backlight_type acpi_video_get_backlight_type(void)
>>>> +static enum acpi_backlight_type __acpi_video_get_backlight_type(bool native)
>>>>    {
>>>>        static DEFINE_MUTEX(init_mutex);
>>>> +    static bool native_available;
>>>>        static bool init_done;
>>>>        static long video_caps;
>>>>    @@ -570,6 +572,8 @@ enum acpi_backlight_type acpi_video_get_backlight_type(void)
>>>>                backlight_notifier_registered = true;
>>>>            init_done = true;
>>>>        }
>>>> +    if (native)
>>>> +        native_available = true;
>>>>        mutex_unlock(&init_mutex);
>>>>          if (acpi_backlight_cmdline != acpi_backlight_undef)
>>>> @@ -581,13 +585,25 @@ enum acpi_backlight_type acpi_video_get_backlight_type(void)
>>>>        if (!(video_caps & ACPI_VIDEO_BACKLIGHT))
>>>>            return acpi_backlight_vendor;
>>>>    -    if (acpi_osi_is_win8() && backlight_device_get_by_type(BACKLIGHT_RAW))
>>>> +    if (acpi_osi_is_win8() &&
>>>> +        (native_available || backlight_device_get_by_type(BACKLIGHT_RAW)))
>>>>            return acpi_backlight_native;
>>>>          return acpi_backlight_video;
>>>
>>> So I ran into a minor problem when testing the NVIDIA proprietary driver against this change set, after checking acpi_video_backlight_use_native() before registering the NVIDIA proprietary driver's backlight handler. Namely, for the case where a user installs the NVIDIA proprietary driver after the video.ko has already registered its backlight handler, we end up with both the firmware and native handlers registered simultaneously, since the ACPI video driver no longer unregisters its backlight handler. In this state, desktop environments end up preferring the registered but non-functional firmware handler from video.ko. (Manually twiddling the sysfs interface for the native NVIDIA handler works fine.) When rebooting the system after installing the NVIDIA proprietary driver, it is able to register its native handler before the delayed work to register the ACPI video backlight handler fires, so we end up with only one (native) handler, and userspace is happy.
>>>
>>> Maybe this will be moot later on, when the existing sysfs interface is deprecated, and it probably isn't a huge deal, since a reboot fixes things (I imagine installing an in-tree DRM/KMS driver on an already running kernel isn't really a thing, which is why this isn't a problem with the in-tree drivers), but would it make sense to unregister the ACPI video backlight handler here before returning acpi_backlight_native? That way, we'll briefly end up with zero backlight handlers rather than briefly ending up with two of them. Not sure if that's really any better, though.
>>>
>> Thinking about this a little more, maybe it's better not to overly complicate things, and just assert that users of the NVIDIA proprietary driver will need to reboot after installation in order to get the backlight working, at least until we get further along in this effort and the backlight interface transitions to the DRM connector property you have proposed.
> Right, this series stops unregistering the acpi_video# /sys/class/backlight
> devices because the idea is to never register them in the first place.
>
> Registering them in the first place causes 2 problems:
>
> 1. It causes userspace to see udev events for the register + unregister
> and by the time the systemd backlight level save/restore helper runs
> from udev the unregister has already happened and it logs ugly errors.
> More in general this kinda racy behavior just is ugly.
>
> 2. On some hw merely registering the backlight device, which I think
> at least tries to retrieve the current level through ACPI, is causing
> issues. So now we have DMI quirks to force the native backlight on
> some devices, even though the heuristics also say native eventually,
> just to avoid the race. Avoiding the add + remove dance allows
> us to drop a bunch of quirks and likely also fixes issues on other
> devices which we don't yet know need the quirk.


Yes, those sound like good reasons to avoid registering the ACPI video 
backlight driver wherever possible.


> So this patch-set changes the acpi_video.c code to no longer register
> the acpi_video# backlight devices at init time *at all*. Instead native
> drivers are supposed to now call acpi_video_register_backlight()
> when they have found an internal panel. But to avoid this causing
> the acpi_video# backlight devices to not show up at all in some
> cases (e.g. native kms drivers blacklisted) the acpi_video code
> also calls acpi_video_register_backlight() itself after 8 seconds.
>
> I believe this is what you are hitting, the 8 seconds have passed
> before the nvidia driver calls acpi_video_backlight_use_native(),
> so the acpi_video# backlight devices have registered (and no longer
> go away).
>
> This is not only a problem when installing the nvidia binary driver
> for the first time. It can also be a problem if the binary driver
> is not in the initrd and leaving the initrd takes longer then
> 8 seconds, say because of a diskcrypt password. So I believe that
> this really can be a problem with the nvidia binary driver.


Hmm. I hadn't considered the case of the binary driver being absent from 
the initrd, and the possibility of the transition out of the initrd 
happening after the timeout. Yes, this is a bigger problem than the 
"only after first installing the driver" scenario I ran into.


> But I think this is easy to fix. We could make the 8 second
> delay configurable by replacing the ACPI_VIDEO_REGISTER_BACKLIGHT_DELAY
> define with a module-parameter; and we could make "0" as value mean
> that acpi_video.c will never call acpi_video_register_backlight()
> itself.
>
> Since the various (also counting distor packaging) nvidia binary
> driver installers already all modify the kernel commandline to
> blacklist nouveau, then the installers can just also pass this
> parameter and then acpi_video.c will never register the acpi_video#.


This sounds like a reasonable compromise, but I worry that it may be 
difficult to determine whether a system definitely doesn't need the ACPI 
video backlight driver. On the other hand, the last system that I recall 
personally seeing that did use the ACPI video backlight driver was a 
little over 10 years ago, so it's possible that there are no systems 
which use that driver which are supported by current versions of the 
NVIDIA proprietary driver. I'll have to do some research to determine 
what types of systems actually used video.ko's backlight driver, unless 
you happen to know already.


> This does mean that the nvidia binary driver then must call
> acpi_video_register_backlight() when an internal panel is found.
>
> Note the current patches to amdgpu/nouveau skip the calling of
> acpi_video_register_backlight() when
> the acpi_video_backlight_use_native() call returns true and they
> have registered their own backlight. But calling it always is ok
> *as long as the driver is driving the laptops internal panel* !
>
> acpi_video_register_backlight() contains:
>
>         if (acpi_video_get_backlight_type() != acpi_backlight_video)
>                  return 0;
>
> So calling it when a native backlight has already been registered
> is a no-op.


The NVIDIA proprietary driver will already know when it has registered 
its own backlight handler, so there probably isn't any need to always 
call it when driving an internal panel. I'll have to double-check to see 
if we have already determined whether a panel is connected before 
registering the backlight handler: I am pretty certain that is the case.

One further potential difficulty that I anticipate is that not all 
dynamic mux systems use the EC backlight driver (or a similar, 
GPU-agnostic driver), and rather have whichever GPU happens to be 
connected at the time be responsible for the backlight. I had initially 
thought that supporting the EC backlight interface was a requirement for 
OEMs to implement dynamic mux support, but I recently learned this is 
not true in all cases. On Windows, this requires coordinating the 
backlight controls of the two GPU drivers across a mux switch, to load 
the state of the switched-away-from GPU and set it on the switched-to 
GPU. I imagine for these systems we may need to do some similar 
save/restore, probably managed by vga-switcheroo, but it would require 
having both GPU drivers register their own native backlight handlers 
(and possibly while one of them is not connected to the panel).

Dynamic mux switching isn't actually supported on Linux, yet, so we 
should be able to kick this particular can a little further down the 
road, but in the meantime we should probably start planning for how best 
to handle this sort of system under the "only one backlight handler per 
panel" model. Maybe the vga-switcheroo handler can register its own 
backlight handler, that then negotiates the actual backlight settings 
between the relevant GPU drivers, possibly through a new vga-switcheroo 
client callback. I'll have to think about this a bit more.


> Please let me know if the proposed solution works for you and
> if you want me to make ACPI_VIDEO_REGISTER_BACKLIGHT_DELAY a
> module-option for the next version.


I do think it should be workable, apart from the concern I mentioned 
above about knowing when to set the module option to disable the ACPI 
video backlight driver. I'll need to get a better understanding of 
exactly which systems actually use that driver.


> Regards,
>
> Hans
>
>
> p.s.
>
> I think that eventually I might even try to make the new
> module-param default to 0 / default to not having acpi_video.c
> do the registering itself ever and see how that goes...

Would the GPU drivers then be responsible for calling acpi_video_register_backlight() again? My understanding was that part of the intention here was to make that no longer necessary.

>
>>>>    }
>>>> +
>>>> +enum acpi_backlight_type acpi_video_get_backlight_type(void)
>>>> +{
>>>> +    return __acpi_video_get_backlight_type(false);
>>>> +}
>>>>    EXPORT_SYMBOL(acpi_video_get_backlight_type);
>>>>    +bool acpi_video_backlight_use_native(void)
>>>> +{
>>>> +    return __acpi_video_get_backlight_type(true) == acpi_backlight_native;
>>>> +}
>>>> +EXPORT_SYMBOL(acpi_video_backlight_use_native);
>>>> +
>>>>    /*
>>>>     * Set the preferred backlight interface type based on DMI info.
>>>>     * This function allows DMI blacklists to be implemented by external
>>>> diff --git a/include/acpi/video.h b/include/acpi/video.h
>>>> index db8548ff03ce..4705e339c252 100644
>>>> --- a/include/acpi/video.h
>>>> +++ b/include/acpi/video.h
>>>> @@ -56,6 +56,7 @@ extern void acpi_video_unregister(void);
>>>>    extern int acpi_video_get_edid(struct acpi_device *device, int type,
>>>>                       int device_id, void **edid);
>>>>    extern enum acpi_backlight_type acpi_video_get_backlight_type(void);
>>>> +extern bool acpi_video_backlight_use_native(void);
>>>>    extern void acpi_video_set_dmi_backlight_type(enum acpi_backlight_type type);
>>>>    /*
>>>>     * Note: The value returned by acpi_video_handles_brightness_key_presses()
>>>> @@ -77,6 +78,10 @@ static inline enum acpi_backlight_type acpi_video_get_backlight_type(void)
>>>>    {
>>>>        return acpi_backlight_vendor;
>>>>    }
>>>> +static inline bool acpi_video_backlight_use_native(void)
>>>> +{
>>>> +    return true;
>>>> +}
>>>>    static inline void acpi_video_set_dmi_backlight_type(enum acpi_backlight_type type)
>>>>    {
>>>>    }
