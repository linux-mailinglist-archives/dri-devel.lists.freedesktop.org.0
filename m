Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0164453417A
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 18:26:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B9CE89ED3;
	Wed, 25 May 2022 16:25:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2050.outbound.protection.outlook.com [40.107.101.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57B0C89ED3;
 Wed, 25 May 2022 16:25:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k7zAIomJ9rpvu9QlDolBQ5usbmMp4jAH+DjePj59fhtEPLOE3N9OdmRxjMd4r/5yYdv5nn9gX199YzpukXAtxLk5aZkVDCj6+UlkhzSbEA7i0l++26eym8TSVpxhbSuLaZ1naojKQ0l13tb4UVKs56axWj6RoQmymFLuMKjupN/rSSa68F8drV/sOnYwjhXtOxZfg8urdZNp5ooCh5mkPXD5PIM+AY5YO2Y/OMqsV1Fc7lHCei93Nzvi9kOxYT53+EnLKGaLBLgXcQDdCTXf9fBhhh1BR4NuyMfCpDgTmDBTg42mwIR5Ps4JL5517Rkmb20OAr9H07D4Ngb1npvk6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VIUKmz1emGMHI8YuL9Fj4o882wfzYeK5G3vvStG/FCU=;
 b=IegpwCXqM9sZuNjMzE9CCHEVcD1zfOf8WD46xKLxR6bIHJk7aFLNGE/pdsj9PBl7/RvsJCtO2Z/O0sqaeS0hhO8lanQ12/aRCTXqsPPlZdEFmKnFQjBl3j+uR+9CPN0vNlEOfZ75PQfUz9J14MhU0oGTC4FNKkM/IF6kzKKGcjs7y/5YQJuIl/ydaCENNjhdE/fwI9JvGujEMVdr61dwjmBmBw/E0OOzThNm0JRtCqquO95VSfI6gpNksqqlArukRwDIZZW2SISL1YENi4BnIcq3MVw2rZ19CfH8jDkrVsya8ZPf0Tigyrk/e3CzSUSlKUDUGE6xE6kWtN01Y0s2MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VIUKmz1emGMHI8YuL9Fj4o882wfzYeK5G3vvStG/FCU=;
 b=INFH7W2W2eBB+Qme7yeYr1/Tz9fnTY7RYjzjKFp6JIGe1ySMKbRfYrkGgHpVbQ7s8dFYnBcii0/8YKZJfd7ypm3dWUR1jgBq10oOXOXqgJe+16Nxf2muZbqoqUdWhDh5t5pyPzv3M5suH1/bKzV+/dGdH3HHO6+dQAbnuKVTbuCW7o1RzbpaFCokdcCxUXhRpA0t0UeZlfwbb4HkYBpsmalQgKPQpQAPtXv8tPhJGon2Eyg707XT3WhLjQZhmjvEMM7Mq2AoyuoH7Q74R9z9Y83Wf/CoVsT6J0rowtMqaEZeowUkFJJvicfgvnVaNZ2YXIs56SkrGsDJYotydDwWgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB2763.namprd12.prod.outlook.com (2603:10b6:5:48::16) by
 BN6PR1201MB0020.namprd12.prod.outlook.com (2603:10b6:405:56::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.15; Wed, 25 May
 2022 16:25:54 +0000
Received: from DM6PR12MB2763.namprd12.prod.outlook.com
 ([fe80::8d18:7673:ce09:c538]) by DM6PR12MB2763.namprd12.prod.outlook.com
 ([fe80::8d18:7673:ce09:c538%5]) with mapi id 15.20.5273.023; Wed, 25 May 2022
 16:25:54 +0000
Message-ID: <628007f0-22dc-c684-e530-f56a6e9186a4@nvidia.com>
Date: Wed, 25 May 2022 11:24:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 00/14] drm/kms: Stop registering multiple
 /sys/class/backlight devs for a single display
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Ben Skeggs <bskeggs@redhat.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, "Rafael J . Wysocki"
 <rafael@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>,
 Mark Gross <markgross@kernel.org>, Andy Shevchenko <andy@kernel.org>
References: <20220517152331.16217-1-hdegoede@redhat.com>
 <871qwrfcwr.fsf@intel.com>
From: Daniel Dadap <ddadap@nvidia.com>
In-Reply-To: <871qwrfcwr.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DS7PR03CA0192.namprd03.prod.outlook.com
 (2603:10b6:5:3b6::17) To DM6PR12MB2763.namprd12.prod.outlook.com
 (2603:10b6:5:48::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a87c65d9-3ed1-460a-ee01-08da3e6b3d7f
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0020:EE_
X-Microsoft-Antispam-PRVS: <BN6PR1201MB00209F60178BCB578CB127E5BCD69@BN6PR1201MB0020.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BBoUGErJ9da401z09cQfMDc6U0c3yypUmnSsEm6fFD9ZVWfK6sH/Tb98i7X00rb9qGK8oS1NZyn+6EQDM8dHWTIPLYCVXLrLr9BXN41KwmHkhxJe+1t4/IGYcf3uqMgnip0WZhuEtSwlDj5JpB8peZGE23jJxAfYl3lfG4bNeuTmgSp5oXrR64qZ7oz6cvmL4xJeHV8PNhldmbNMFTL9N/iuDFDt89UNWk9WkqWP3GCxVb3WgKLStBBn/E14ADGGnV426edJsonVESrbxLmLnpMLtFqjBUZ1inErKuYvBOotNKbNoFoS+EnbkEQM9xoDGitL4ovtYQbPcnpxO7/fNdgRwKptSNiscutCDiUDHc1pt9hMM/EZ80P4t8I0z8kFPsbeP7wng2zLazNT2uH3ZYAqhUSmCW1jL4sVrg3H5yRZP0GbUcZndUk1VNOqr1tbf/cPr5xir8cG0CtnPn2MeXTAfK3mxkZQMXeY8EkQ7tq6dHRuKf/Fu5mNn4EBl6D2BvyyiVdYsXd7itpBTgucbydrS+0aFFFLMDjnqrrLKuTL7oKYqOY//4U8fgJjKPjLliWVIYj5/u7eGoBY5c+zPTHDNh0SrICc8y4IQpr9cbSFOg2mgOpKb17JtW649jyqDj+r6ZqrCik0w0ea8FlUSwKY4Jnn2Mh07yqzoLjwLRi1XzMsyyffM0YC7T3m1YHCpDFFKOt2hVi14P1NATQfzFlm4/ViwrZYrt3LgJ1JuUWwHXLR58l5mzTzkd2lhyedIR7jKHtq+JfYBaY2gpji0z7m6OUb2Bz42vG4n22yYujgqUeiHzgEPEhgSDEGwVTaCJptJeigX4LongnnzQ6Ynv59yIz3cHesqwfeNsCWdvlNKwRtoPijEspCHxevXLRJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2763.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(36756003)(31686004)(54906003)(316002)(6506007)(2906002)(53546011)(38100700002)(921005)(110136005)(4326008)(508600001)(26005)(6666004)(66556008)(83380400001)(66946007)(66476007)(8676002)(86362001)(31696002)(186003)(966005)(8936002)(6486002)(2616005)(5660300002)(7416002)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L0dORG5XRWxFcDlLYS9POU8zMmRPbDhqOGdmWEEwSVVOUGpZN3dmaElUU0Jm?=
 =?utf-8?B?dUg2YjRkc2R5Mm5ya1UwSEhDcGpBUm9MQVBRSW1sdWltNkkyc3JGaVZNenU4?=
 =?utf-8?B?K2I5ajVscVozNGIvMEFJQnNSaE5kWG9DVkpJNDVRdGNRV2xkWFk1R1dDM2d0?=
 =?utf-8?B?NmtqMTZ1YWpCZmlNL1k3aWlLeTNMK2k1eDRIcVFnYUg4V20wODU3dTV4SEQy?=
 =?utf-8?B?NmpMRDZZL1YzKzhXTEVZVEF3SkR3Vnp3ZmlIQ0tyMlFRZnNXWTZpNDB5TjlE?=
 =?utf-8?B?enFyRkE4QnhFQWlxOGdVYWdoMFlUNTdRTnNaT0M1aGJabXhvQUlCdzZJQmJC?=
 =?utf-8?B?M05GU2FQRnRHOTBMR01nSWwrZjcrQmlaeDNvbXFncFdDRER2YTBiR24vbjl4?=
 =?utf-8?B?cUc4NVhHanMxS0pKNk9nMEJnTXdsU1lCTElFUEZ2eVR0elFBcjh3QzlYWC9o?=
 =?utf-8?B?ZjRFeDBCbUdWVG9TS1k2TTNxbmNkSGMyWFlQczdzcjdBemVjRDJHN083NDFN?=
 =?utf-8?B?QzltZWxoZ3Q1WnNzUzM5ZjFnR1VOeFEwWHdlSXB5bmREc3VpZnBYSkVleDls?=
 =?utf-8?B?c3RUS3BaMVJsZkZ1YjZWT1Y2WStMdVp1OGpyb0hqU3BYZkZ2TDNabmJka3p6?=
 =?utf-8?B?NjRjdVZYYVNrUWdxckJkT2hOZU9mbkN1MzBJNWh6R0Z3SmF4TDBKVG4xb3c2?=
 =?utf-8?B?em8vSnQ2YVJGcXZCc2JoZGVjclV1THNBd3dlR2FzMTlwdjBFZWM3TzdaZUtv?=
 =?utf-8?B?N0g1NmRHVGp4NlpJUzZ5SVNTYVo2dE8ycWs4OFJ5QzNkMWpnekYya3VuclFo?=
 =?utf-8?B?QURzRndNVlpuUlpRb09WZ0NkVU1kTk5tY1FQRmNodDRMcjVjTGdvTWx2Q2Zt?=
 =?utf-8?B?a0psTHVxZ2JSdU84OVBZcmIxSmRaMG5VTVRNT2E1Z04xR2h6SDNrSGR3cmtS?=
 =?utf-8?B?WUJoMmFFWjN3b0prRG9KcExRZS8xMUZoc0M0dlpxalRMM2hYaThlclloOXBu?=
 =?utf-8?B?aHVuVTJPOHVVOE96cElKSXE3OGt2WmNyM0Z5VXQ4UG0rbmhOeGd1Yi8zYThE?=
 =?utf-8?B?b2lXSHE1c0hveUVRa2pFS3gzVU03UEdPMHoreVdic0cxQ0NWRjFZNzFzU3Bp?=
 =?utf-8?B?S0crTnRHdmNMZUVncVJtOHJQbXd3SjhXeDdRQ1llRzNDdGEvVTh6TFRMWkcw?=
 =?utf-8?B?cVVMeXRTS2t1Zkx2dmltWGZLeW8xYlU4aHBVVjY1T3N2ZWMxSGJJNFpueHpo?=
 =?utf-8?B?Z1ovTmorbDdNb25MaWM3R0ZlaXRST0F6VEhXeXkycXdCd3c3cDFOVVlvYjVj?=
 =?utf-8?B?ek1xc25aaHh1VWd3MzR2OXRsR211SEl1YWR3SDVTVVhHUmNXaWw5TlhJeXl4?=
 =?utf-8?B?dE4xQ0dGVkcrNHl1cktUOTIwb3RVNFBSKyt0aktZbElJK3UxWVYyeVFiaVhC?=
 =?utf-8?B?aHZFS21YYjFPTmVMbC96cTBPanJIQkh2azN0Zmc4ZVV2bmxzUmxUczZBTGxk?=
 =?utf-8?B?cGQ5Sk1UZzZ1Yi8xZTh1MGE0S2FDWjZ4WXoyeXNqa2lvR0l2YXlKRmw4WHdw?=
 =?utf-8?B?b0FGYnFic1RiZ0NKSGZWTmlqUjh5aG5yVXZZdGhySjVVQXVtdGptdEkrYmZm?=
 =?utf-8?B?Wko5R2xKSkRWU1VRQjhXU05uUkd3eGlIZkFNVmxCUHNyeGFGam9EZWg4RmFS?=
 =?utf-8?B?R2FvN2MrbzRKVDM3S0pLU2Q0dk5TN3E3c3lRdTVxMWZza2V3NDFHUzBPdnI1?=
 =?utf-8?B?bHlweHU1M0E4T01MQkkySmI5TEU2QnlIdk5kNjkzdDJ6Nmk3SXlRbWs0R08r?=
 =?utf-8?B?aTZGbGVWQ2dicWxCTkxNemVmUEkxQ3MrdkgycSs0aUZzRFh0bHFlUjRPOG1R?=
 =?utf-8?B?elNFaWQxdFBOUEpBSGZXU2pqTjJHQk9TVStheFM0cGxjdWVvankrYURyczZo?=
 =?utf-8?B?OHU3NU9GclJDNlZnNWZkNk1ZWEpQcUZrWXFLdGhQeDlKczFKQmk2Mmc0R1JW?=
 =?utf-8?B?VlVCR0QzdmNZZUdzTlkxaUk5ODlsOUxBak5IcUduYjlBQVdBQmNDeFFGeEVZ?=
 =?utf-8?B?Vm5mVnIwRlkwZGRZcUlRRGxFdzhSVjN2cDB5MXlqMEVzNlNpUndwRmh3KzR5?=
 =?utf-8?B?ZzFMZ3hCaHNIcTZIZTY3MjY3L0crSUdGQnFINkVmMWEwTDZ0c2QyODh1Q0ht?=
 =?utf-8?B?VW95ZitoOS8vOEMzMGIxRXJzY09udTRsNmY4YnpvejJkc1ZpL0I1RHVxc3A2?=
 =?utf-8?B?Tk9oeStvNVhET2FwMG1oNUNTTjlmbERRMTlRYkpNUnlwdGhMVWtpeXhtbGVG?=
 =?utf-8?B?Smc2NXZXM2J3QnFnVmw4SGlaU2NTVFNSQ2IxeVk1TUlKcmpqdXdTUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a87c65d9-3ed1-460a-ee01-08da3e6b3d7f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2763.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2022 16:25:54.1969 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jgmg8z369dPHgWOSJgMPyHG5IxoX9mm5EeLDfGqM+4v9bsyIfCEpCPRs9VbFsYjRLs6PSlF3ol33JQsFVAtV/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0020
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

On 5/18/22 03:44, Jani Nikula wrote:
> On Tue, 17 May 2022, Hans de Goede <hdegoede@redhat.com> wrote:
>> Hi All,
>>
>> As mentioned in my RFC titled "drm/kms: control display brightness through
>> drm_connector properties":
>> https://lore.kernel.org/dri-devel/0d188965-d809-81b5-74ce-7d30c49fee2d@redhat.com/
>>
>> The first step towards this is to deal with some existing technical debt
>> in backlight handling on x86/ACPI boards, specifically we need to stop
>> registering multiple /sys/class/backlight devs for a single display.
> I guess my question here is, how do you know it's for a *single*
> display?
>
> There are already designs out there with two flat panels, with
> independent brightness controls. They're still rare and I don't think we
> handle them very well. But we've got code to register multiple native
> backlight interfaces, see e.g. commit 20f85ef89d94 ("drm/i915/backlight:
> use unique backlight device names").


This is one of my concerns as well. There are a small number of (mostly 
somewhat old) designs with more than one internal panel. Since the 
intent here is to tie the new backlight UAPI to DRM connectors, I think 
it should remain possible to address each panel individually (the goal 
is to stop having multiple backlight handlers, all of which control the 
same display, not to stop having multiple backlight handlers in 
general). Where I think it might get tricky is when the same display 
might be driven by one GPU or another at different times, for example, 
with a switchable mux. Notebook designs which use the 
nvidia-wmi-ec-backlight driver will use the same backlight handler for 
the display regardless of which GPU is currently driving it, but I 
believe there are other designs where the same panel might have 
backlight controlled by either the iGPU or the dGPU, depending on the 
mux state.


> So imagine a design where one of the panels needs backlight control via
> ACPI and the other via native backlight control. Granted, I don't know
> if one exists, but I think it's very much in the realm of possible
> things the OEMs might do. For example, have an EC PWM for primary panel
> backlight, and use GPU PWM for secondary. How do you know you actually
> do need to register two interfaces?


The "how do you know" question is one I am wondering as well. I need to 
check with some of our backlight experts here at NVIDIA to figure out 
how exactly reliably we are able to make this determination.


> I'm fine with dealing with such cases as they arise to avoid
> over-engineering up front, but I also don't want us to completely paint
> ourselves in a corner either.
>
> BR,
> Jani.
>
>
>> This series implements my RFC describing my plan for these cleanups:
>> https://lore.kernel.org/dri-devel/98519ba0-7f18-201a-ea34-652f50343158@redhat.com/
>>
>> Specifically patches 1-6 implement the "Fixing kms driver unconditionally
>> register their "native" backlight dev" part.
>>
>> And patches 7-14 implement the "Fixing acpi_video0 getting registered for
>> a brief time" time.
>>
>> Note this series does not deal yet with the "Other issues" part, I plan
>> to do a follow up series for that.
>>
>> The changes in this series are good to have regardless of the further
>> "drm/kms: control display brightness through drm_connector properties"
>> plans. So I plan to push these upstream once they are ready (once
>> reviewed). Since this crosses various subsystems / touches multiple
>> kms drivers my plan is to provide an immutable branch based on say
>> 5.19-rc1 and then have that get merged into all the relevant trees.
>>
>> Please review.
>>
>> Regards,
>>
>> Hans
>>
>>
>> Hans de Goede (14):
>>    ACPI: video: Add a native function parameter to
>>      acpi_video_get_backlight_type()
>>    drm/i915: Don't register backlight when another backlight should be
>>      used
>>    drm/amdgpu: Don't register backlight when another backlight should be
>>      used
>>    drm/radeon: Don't register backlight when another backlight should be
>>      used
>>    drm/nouveau: Don't register backlight when another backlight should be
>>      used
>>    ACPI: video: Drop backlight_device_get_by_type() call from
>>      acpi_video_get_backlight_type()
>>    ACPI: video: Remove acpi_video_bus from list before tearing it down
>>    ACPI: video: Simplify acpi_video_unregister_backlight()
>>    ACPI: video: Make backlight class device registration a separate step
>>    ACPI: video: Remove code to unregister acpi_video backlight when a
>>      native backlight registers
>>    drm/i915: Call acpi_video_register_backlight()
>>    drm/nouveau: Register ACPI video backlight when nv_backlight
>>      registration fails
>>    drm/amdgpu: Register ACPI video backlight when skipping amdgpu
>>      backlight registration
>>    drm/radeon: Register ACPI video backlight when skipping radeon
>>      backlight registration
>>
>>   drivers/acpi/acpi_video.c                     | 69 ++++++++++++++-----
>>   drivers/acpi/video_detect.c                   | 53 +++-----------
>>   drivers/gpu/drm/Kconfig                       |  2 +
>>   .../gpu/drm/amd/amdgpu/atombios_encoders.c    | 14 +++-
>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  9 +++
>>   .../gpu/drm/i915/display/intel_backlight.c    |  7 ++
>>   drivers/gpu/drm/i915/display/intel_display.c  |  1 +
>>   drivers/gpu/drm/i915/display/intel_opregion.c |  2 +-
>>   drivers/gpu/drm/nouveau/nouveau_backlight.c   | 14 ++++
>>   drivers/gpu/drm/radeon/atombios_encoders.c    |  7 ++
>>   drivers/gpu/drm/radeon/radeon_encoders.c      | 11 ++-
>>   .../gpu/drm/radeon/radeon_legacy_encoders.c   |  7 ++
>>   drivers/platform/x86/acer-wmi.c               |  2 +-
>>   drivers/platform/x86/asus-laptop.c            |  2 +-
>>   drivers/platform/x86/asus-wmi.c               |  4 +-
>>   drivers/platform/x86/compal-laptop.c          |  2 +-
>>   drivers/platform/x86/dell/dell-laptop.c       |  2 +-
>>   drivers/platform/x86/eeepc-laptop.c           |  2 +-
>>   drivers/platform/x86/fujitsu-laptop.c         |  4 +-
>>   drivers/platform/x86/ideapad-laptop.c         |  2 +-
>>   drivers/platform/x86/intel/oaktrail.c         |  2 +-
>>   drivers/platform/x86/msi-laptop.c             |  2 +-
>>   drivers/platform/x86/msi-wmi.c                |  2 +-
>>   drivers/platform/x86/samsung-laptop.c         |  2 +-
>>   drivers/platform/x86/sony-laptop.c            |  2 +-
>>   drivers/platform/x86/thinkpad_acpi.c          |  4 +-
>>   drivers/platform/x86/toshiba_acpi.c           |  2 +-
>>   include/acpi/video.h                          |  8 ++-
>>   28 files changed, 156 insertions(+), 84 deletions(-)
