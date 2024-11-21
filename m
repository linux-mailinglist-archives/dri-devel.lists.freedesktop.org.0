Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A4E9D52FA
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 19:58:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C441910EA3A;
	Thu, 21 Nov 2024 18:58:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="oWOvYJbO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2057.outbound.protection.outlook.com [40.107.236.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2DB910EA2F
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 18:58:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bjz0rfncbu6dt8V5O8m8iKVX4lOSW714AuJjppkZwshGg+i55DGi+IwdkOr14E5hOPHak9XlSfq+GlrdPbtVMU7gAuQfX74tn1Qc9ZNCMH2ox53c77CDtuagpJ203R0W+efjdAEAd+sRdsB1jYYguSwmpvIP7PO1gacdJno60kmVzswjVzAlBGcEzqY/zf4oA/LjhQYBENTRNfYQt6sLx3T3iavRofwJwWcPLE/3x/FQaQcGzTQzcHE+P6QzeiwmhE03sELONW4j7Kp18Wk0p/dPxPAdlx3MQpoaoDjOQmJLrLo5IZPFzyXrnN8/nufEh8U4nRIQpn38BsBm3gblnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VnRn4vqRmR++doTQzsPto9aAq9gLODMSWv8RBvG9RUs=;
 b=EtO+oad+2VOdpzqZSEr4GnOnm3uIe5gR/OtpHo6WrpPwPbjgEf53anDNkBDtvA9rNyDBl5sn4Bss38Zsw4OY9aqcUOI/HgVUnH/mklUvWxPrtEhMKbf3ugPluOoPS2cynN1S/s9BIXkcx/OhbbW7RuIJSNAIJuqOKrStBtcXh9c6BPoFPcVMOTSqdj2dPjkwpXg9WU7oEFdmp/W1GhPXMT8jg/Hjq6l9qnd/AZpEv2UZQWpYO2RQc1JO8XVwL86HcSuQ42kDnHrMk4hFBwkjf3mRuMjvkr3SRBUcHLS0sTuGm34c3G83oJ8siOAVwWRJ0pIynVeFYIBsy/J5xmNMTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VnRn4vqRmR++doTQzsPto9aAq9gLODMSWv8RBvG9RUs=;
 b=oWOvYJbOM/0UHBL2dcaHNQGVuLSQhb/S/zyVfIU0CK0TJrlIs9JsRrRCDD8mFepfInRylxAOtIyz6s1+GNbVEVf4RiIU9RTlXbrUp28O5lGwfoSePvJfIWIVDXYfPbUIROhAoNVqhRwv5erXDaY/+pxtYe9wT+9ZRmkKaCQV2H8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DM4PR12MB5748.namprd12.prod.outlook.com (2603:10b6:8:5f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.15; Thu, 21 Nov
 2024 18:58:05 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8158.019; Thu, 21 Nov 2024
 18:58:05 +0000
Message-ID: <1e7057cc-c74e-48ff-8585-8b0db58e08bf@amd.com>
Date: Thu, 21 Nov 2024 12:58:04 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 01/13] Documentation: PM: Add documentation for S0ix Standby
 States
To: Antheas Kapenekakis <lkml@antheas.dev>, linux-pm@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, Kyle Gospodnetich <me@kylegospodneti.ch>
References: <20241121172239.119590-1-lkml@antheas.dev>
 <20241121172239.119590-2-lkml@antheas.dev>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20241121172239.119590-2-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR13CA0153.namprd13.prod.outlook.com
 (2603:10b6:806:28::8) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DM4PR12MB5748:EE_
X-MS-Office365-Filtering-Correlation-Id: 25e57f20-8e3c-4129-fc5c-08dd0a5e6e9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RFhVNWlUeGVZalo5ck5WUEFmRHY1a0d4Y1RmUjBVR3hzd2hQeTYyNWNuNkls?=
 =?utf-8?B?VFpOWU9YMTAvRWtJbE84RUxaay9uRndYV1A4U1ZzS2hvbXFEakFHbTlVYXR1?=
 =?utf-8?B?VHZtT0VXOTdHeDM5RlVJSzhUeUdzUlplMUtpSEk4bndUNGZvY0FzK0dKT2xM?=
 =?utf-8?B?S3FaemNGSVZ6WEJpZGNESWtLNzNOMnRObm9Hc0RFZFhUUk5UUi9yUGFHR2N0?=
 =?utf-8?B?bjRTaVcxelQ4UzRwOVVSWkFWZjV4OWZnRkJ1WjB1N1BRdnA5ekF4YUJPb3FE?=
 =?utf-8?B?bFF6eTNTalJ0TmFpdGZEMGQ4WjVRMVY3cVVUZVBzVVluL25IY2hvaXd6d0RM?=
 =?utf-8?B?NVBUSGJ6d2J3UktxcFFyVnBKWUFJV1ZOdWtPSS9YWW5FKzlDeXRreUJzTGNZ?=
 =?utf-8?B?NXdYdWRrYjRwQlpCcndrSjdlcVFrQ0NVVDVoQjZGbmc3N1RTUlpRNW8xbFBW?=
 =?utf-8?B?SU1DQm5KYzRuZGlSb3FoeWxEQTZOV1BnTnpNU2Z2UGdqekE0eUs1cFJXdHV5?=
 =?utf-8?B?YUdNOTQ3Z1FPY0RadEhwaElKU29FanNvbGNlN3hLeXo3UVBMcFN2SUpuSkhj?=
 =?utf-8?B?UEdGTmFLdVlGRmdiZWdKdFJVL0dDYlUxcml1MVRNR3VqZWYwZ1VTZVhiM1U3?=
 =?utf-8?B?YUZUV0lOaTZsUTFSWkhPSE5ZRWo2dW84Rm5vWnVDZExqQ1VucFJNbFoxTnlN?=
 =?utf-8?B?ZmR5QWxCWnVVdjQwZHkwRDFBMEdjWXBuN0NGMHNaUlpZMXR3Rm9hYU9ta0x2?=
 =?utf-8?B?Mm0wdTduZkE5T1FxMlNzSWZMVjNJMWFLUSswYmFZczh1TW5jSEpaMjljcURI?=
 =?utf-8?B?L0JuUnNDQi9tZ25TK1lLaU4xcGowa0k0a2NURXFocWxqSlhDdzFHZXNoT0xt?=
 =?utf-8?B?aG1jNDRpTEV0TUdEUHZMS1NEMkljcXZpMWZEbnFTOWl5T3ZJVXI0YjBXQkRM?=
 =?utf-8?B?YUg4Sk00anh4disvSkgrdm16QWM4ZlhsZzQzQm9uWmFrekN6MUZSTmoxK0hh?=
 =?utf-8?B?cWxLQm1sRDAvOTRVa1E0YVBhTE44SmdqZXRDamF6ejZmbVhRVjFvOHAwaHpH?=
 =?utf-8?B?RVgrMXRCZkdVam9yYlZIZGZHa01nZjRzb2JZZ09icVY4Y3EyS1JucFl4U29H?=
 =?utf-8?B?UEN2MmcxMWM2aG5JdDNMYXB0TEoyL0REMGEreHNDbGdMbWw1WnZydUovcm5m?=
 =?utf-8?B?dXEvR3ZqZEpxSDdOL05EM1hjNFNXOG9sUzh5NWVZUGVrdXpRYksrSUtlUkN0?=
 =?utf-8?B?SnA1NmUyOURyc1lzODlJbk9ZOTV1TzVZbzM4QzJubDRwTVJnRjVOOW5JRVJp?=
 =?utf-8?B?OHl4UUZrMWpiMXRyUkxDNGJHejMxRVM5MzB4T1hvMHo3WmVQUGlKa0JMeWVX?=
 =?utf-8?B?aW1LZ3MvY0puODFTOFN2S2draE14WFkwNjRIZlR1K0dZTyt5Tjlmd1FIVU5y?=
 =?utf-8?B?K0ErSkJ6T0xaWHNSYmFNYlIwYnNwdU1mMGJXb215MGpaOE1DNDVPdW12WWE3?=
 =?utf-8?B?YzMzLzFaWmdiUzBCL0puQWFVR3BqeSswcEFFTzFuTjJBSnVteDIrSlR1TTNK?=
 =?utf-8?B?ZE1qUVQ1d2FycnU4RHhqSVFxcVJGQ1ZScGJNSE1rWUpDaDNibWdHODE0TnRr?=
 =?utf-8?B?Z2tiRUZDOFNDNXBkL0cwb09PMnR0d1JPdEdBSmVIeWlSMmhLWC9WSUh2RHc2?=
 =?utf-8?B?S3psc0lMdTkvalBUNEY1aFh4VGlQT2dyNVNSVzRqSlJHdU44Z1lyWTBWZzBj?=
 =?utf-8?Q?1pabH5pB5wjBKdT/jygxad3ivsTVM6ebmna89fr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFQxMnlNU2pkZDBZRnJsZ2F3UTZxZHJpRkIzdVlORzB0KzB2a1J6WkNHVWU5?=
 =?utf-8?B?QlVHN2xweWllYWtNOXRrK3JFenRtQjFMdVJ5aHpRRjNLWCt2YUJQd3Q0VXEy?=
 =?utf-8?B?YVFyekZscndOaGxzWjA5Y2pmc2JWTnZCaGlMZmxQSmF4YWpzUENWbzZvd1BB?=
 =?utf-8?B?ckxoUUNzVGJKdkNkU3lpdGswZk9WV2ZmVkwxeHRNRmpiOVJPYXMyVkJUWW9k?=
 =?utf-8?B?QTE3Y1ZWb1B3bkpTbnVYVUpOOUxxUm9SMnVzQm1sUUNveDN5Z2taOWhQd0ow?=
 =?utf-8?B?eHhrSGpvS3poTWpsanpxb2REbnhnVXoxUEpORUVDRmQrWEk4NU1iNkkwcnJq?=
 =?utf-8?B?QmdvclJQUDZoN1dBNWRmOVRwTU1BdjhLdTR5cnFDUHl0THcrN3RuSnVxRkh5?=
 =?utf-8?B?dWhyYWlEQ0JOd1lDbG0zNS83NStXazJYTlhibUUzam93aEU1UUtTVEVWY2hh?=
 =?utf-8?B?VktQYXM0Zk5wLzVwcDFRb2w2V2g1VFV0Y3Y3bTlTWmFhMTdqVWhmNzJiUlVl?=
 =?utf-8?B?NS9XYlJENTFBb25zWWpXdUFtcS84VHJZbEFFTnJTMVdmRmpvOVEvRDluWGo4?=
 =?utf-8?B?MExBU3huS2MxSFB1aXEzazk3QjRqMzhTM0JYZ0F4TWxmWml3NlhjS3Z0NVlQ?=
 =?utf-8?B?cVRWOTVWcEhjTmxiSzM0cUNHbkRFdlJCYkd3WkJmWTNWbEU3a1dBRnlJdjhK?=
 =?utf-8?B?SEx5Tk44MkVQdXRrZEtXTlZ6NHY4MzhzZHVXSUhyVkxxblZYcCtGZUVDdlVk?=
 =?utf-8?B?VnVLeU9pNjNJNUh3MGFSYXBPWjh0Q3JHd3dqMTFZZk1YVkhRNkhlVjU1ekxD?=
 =?utf-8?B?WVdCWW45NVB0VVhqcjNwbkNVUnJ2bVNEWU1BMlNGR01POG9WZndGV2VnTFI5?=
 =?utf-8?B?QXI3ampIWUdYakoyWXJ5MWlDSWtqVDBpaWR6dVZQNWpPbUM1SS9VUHFLRHdW?=
 =?utf-8?B?eCthcCtMeElCS1hETWlsYWxIaCtrU1kxZ1FxaFNkcC9GaHJQY0lrQUdLOU05?=
 =?utf-8?B?c2dOYXpCTWFsVzZKNE4rMVU1cmF3RGxuV3kwUUtTSkoySVB6NHhFNmNQaHFB?=
 =?utf-8?B?SmVaMXBvckJmVC9jMkNDNG13bHZBUTAyMUpCT1RVRGdqYUhvN3lkMngvT1Rv?=
 =?utf-8?B?dC9CQ3dPQmEzMkpMbU8raUNJbzJIOWhTZ2g4dWdJdE56b1VJcEZzRkdmTGcx?=
 =?utf-8?B?OGNkVmNMaVprUGwwMU9hRTBMc0NDZVBEeVdlZlFERC9yZnZrZGRIYmxXcTBR?=
 =?utf-8?B?OFA2VjF0RnZlbEVLdWEwTkVFc3EyTW44WDhjQ05zS0h0U3k3djR2b0N5cFFv?=
 =?utf-8?B?aTcyTUY5VXdRK0E2UitMV0ZyMXZ4TXpBMW5PUXZjYVVVM3NOSmErbGZGQlgv?=
 =?utf-8?B?RWxIUHBhdlZsWVQrWEN1NVRNbnh0SWtPMUFVM3FNN0dNUzNNcHIxQ1RJa3Bn?=
 =?utf-8?B?OFVDZGFIeEphMTgrUmRCcTJ1cm1sRnFFK242ZmQ2eXROWmxJSEVvS3JrN3pC?=
 =?utf-8?B?RGRzVlBqY0w0RzV0NjcwejJhSzFSUFVsMDdUYVkzUVNsdHErSU80YnpYOEV4?=
 =?utf-8?B?bWErMk5oelA2djRrR2pPMC9maTZlL2VpYkV1VkFnSmlpa2JxTTRCeGVLdGNW?=
 =?utf-8?B?ZjdBUE04MXRBVW9uYUxQNFMzZ3ZhakNSWm9sUi95Mlhpa3BqcE0zL0RLMFI0?=
 =?utf-8?B?UXJUR1NodXVvbjErTjZmdXhQNm9uUllnOUtEZ0NhOXJsZjlyZStPNlp3MDlK?=
 =?utf-8?B?eHVsNzlqYm9ETzMwYzFXR0ltSkg4cnBOdXBqdEljelJ6SmRTemNNRnU0dEZn?=
 =?utf-8?B?T0QxQlZITE4yY0Y1K3ViZnlVa2lyVndybWJUbVBKbEEvOEdhbHcvUjZjM0Rj?=
 =?utf-8?B?enlUZUpYTjNqRCtqTmk0Vmx4MFBXS1BuejR1dDg4MkcxbDJxZ2laS3lWaGZI?=
 =?utf-8?B?ZTBWWEc1Ti9NdEFqKy82cDUxZzJyTFI2cGk3amt6YVc2RmZ5bXdKaHNJc2pJ?=
 =?utf-8?B?eUVCdnR6UXZFdy9ad3pQSisySXB5L0RRQ1k5WW5rcE02UjVKUVZaQWhsNitV?=
 =?utf-8?B?YkxQL0tDZStNN25zTHEwZmgxSkpLWEIybW4vYUtrZW1rZWxDcHpQcFdiN3Jt?=
 =?utf-8?Q?DR+UINqczcu2Yi1ze/+sBY6lQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25e57f20-8e3c-4129-fc5c-08dd0a5e6e9e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 18:58:05.7132 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ur8snu8tQAMLaUa46RK9RoOd583D1jY2TcQvDLYTLpJwqj8wAvlI8TJObeUI+tOJm3fQbOHgeKB3EaHgjtYiUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5748
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

On 11/21/2024 11:22, Antheas Kapenekakis wrote:
> Add documentation about the S0ix Standby States that will be exposed
> to userspace as part of this series.
> 
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>   .../admin-guide/pm/standby-states.rst         | 133 ++++++++++++++++++
>   Documentation/admin-guide/pm/system-wide.rst  |   1 +
>   2 files changed, 134 insertions(+)
>   create mode 100644 Documentation/admin-guide/pm/standby-states.rst
> 
> diff --git a/Documentation/admin-guide/pm/standby-states.rst b/Documentation/admin-guide/pm/standby-states.rst
> new file mode 100644
> index 000000000000..96727574312d
> --- /dev/null
> +++ b/Documentation/admin-guide/pm/standby-states.rst
> @@ -0,0 +1,133 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: <isonum.txt>
> +
> +=====================
> +S0ix Standby States
> +=====================
> +
> +:Copyright: |copy| 2024 Antheas Kapenekakis
> +
> +:Author: Antheas Kapenekakis <lkml@antheas.dev>
> +
> +With the advent of modern mobile devices, users have become accustomed to instant
> +wake-up times and always-on connectivity. To meet these expectations, modern
> +standby was created, which is a standard that allows the platform to seamlessly
> +transition between an S3-like low-power idle state and a set of low power active
> +states, where connectivity is maintained, and the system is responsive to user
> +input. Current x86 hardware supports 5 different standby states, which are:
> +"Deepest run-time idle platform state" or "DRIPS" (S3-like), "Sleep", "Resume",
> +"Screen Off", and "Active".
> +
> +The system begins in the "Active" state. Either due to user inactivity or
> +user action (e.g., pressing the power button), it transitions to the "Screen Off"
> +state. 

So are you implicitly suggesting that userspace should be responsible 
for *telling* the kernel that the screen is off?  I feel some DRM 
helpers are missing to make it easy, but after such helpers are made the 
kernel "should" be able to easily tell this on it's own.

> Afterwards, it is free to transition between the "Sleep", "DRIPS", and
> +"Screen Off" states until user action is received. Once that happens, the system
> +begins to transition to the "Active" state. From "DRIPS" or "Sleep", it
> +transitions to "Resume", where the Power Limit (PLx) is restored to its normal
> +level, to speed up finishing "Sleep". Then, it transitions to "Screen Off".
> +If on "Screen Off" or after the transition, the display is prepared to turn on
> +and the system transitions to "Active" alongside turning it on.
> +
> +To maintain battery life, in the Windows implementation, the system is allocated
> +a maximum percentage of battery and time it can use while staying in idle states.
> +By default, this is 5% of battery or up to 2 days, where the system designer/OEM
> +is able to tweak these values. If the system exceeds either the battery
> +percentage or time limit, it enters Hibernation (S4), through a concept
> +called "Adaptive Hibernate".
> +
> +
> +S0ix Standby States
> +==================================
> +The following idle states are supported::
> +
> +                 ↓→  <Hibernate (S4)>

I think S4 distracts in this context.

> +    <DRIPS> ↔ <Sleep> ↔ <Screen Off> ↔ <Active>
> +        →       →  <Resume>  ↑
> +
> +.. _s2idle_drips:
> +
> +DRIPS
> +-----
> +
> +The "Deepest run-time idle platform state" or "DRIPS" is the lowest power idle
> +state that the system can enter. It is similar to the S3 state, with the
> +difference that the system may wake up faster than S3 and due to a larger number
> +of interrupts (e.g., fingerprint sensor, touchpad, touchscreen). This state
> +is entered when the system is told to suspend to idle, through conventional
> +means (see :doc:`sleep states <sleep-states>`). The system can only transition
> +to "DRIPS" while it is in the "Sleep" state. If it is not, the kernel will
> +automatically transition to the "Sleep" state before beginning the suspend
> +sequence and restore the previous state afterwards. After the kernel has
> +suspended, the notifications LSP0 Entry and Exit are used.
> +
> +.. _s2idle_sleep:
> +
> +Sleep
> +-----
> +
> +The "Sleep" state is a low power idle state where the kernel is fully active.
> +However, userspace has been partially frozen, particularly desktop applications,
> +and only essential "value adding" activities are allowed to run. This is not
> +enforced by the kernel and is the responsibility of userspace (e.g., systemd).
> +Hardware wise, the Sleep Entry and Exit firmware notifications are fired, which
> +may lower the Power Limit (PLx), pulse the suspend light, turn off the keyboard
> +lighting or disable a handheld device's gamepad. This state is associated with
> +the firmware notifications "Sleep Entry" and "Sleep Exit".
> +
> +.. _s2idle_resume:
> +
> +Resume
> +------
> +
> +The "Resume" state is a faux "Sleep" state that is used to fire the Turn On
> +Display firmware notification when the system is in the "Sleep" state but
> +intends to turn on the display. It solves the problem of system designers
> +limiting the Power Limit (PLx) while the system is in the "Sleep" state causing

AFAIK, PLx is an Intel specific acronym, it's probably better to be more 
generic in documentation.  You mentioned PLx in a commit too.

> +the system to wake up slower than desired. This firmware notification is used
> +to restore the normal Power Limit of the system, while having it stay in the
> +"Sleep" state.  As such, the system can only transition to the "Resume" state
> +while in the "Sleep" state and cannot re-transition to the "Sleep" state
> +afterwards.
> +
> +.. _s2idle_screen_off:
> +
> +Screen Off
> +----------
> +
> +The "Screen Off" state is the state the system enters when all its displays
> +(virtual or real) turn off. It is used to signify the user is not actively
> +using the system. The associated firmware notifications of "Display On" and
> +"Display Off" are used by manufacturers to turn off certain hardware
> +components that are associated with the display being on, e.g., a handheld
> +device's controller and RGB. Windows implements a 5-second grace period
> +before firing this callback when the screen turns off due to inactivity.
> +
> +.. _s2idle_active:
> +
> +Active
> +------
> +
> +Finally, the "Active" state is the default state of the system and the one it
> +has when it is turned on. It is the state where the system is fully operational,
> +the displays of the device are on, and the user is actively interacting with
> +the system.
> +
> +Basic ``sysfs`` Interface for S0ix Standby transitions
> +=============================================================
> +
> +The file :file:`/sys/power/standby` can be used to transition the system between
> +the different standby states. The file accepts the following values: ``active``,
> +``screen_off``, ``sleep``, and ``resume``. File writes will block until the
> +transition completes. It will return ``-EINVAL`` when asking for an unsupported
> +state or, e.g., requesting ``resume`` when not in the ``sleep`` state. If there
> +is an error during the transition, the transition will pause on the last
> +error-free state and return an error. The file can be read to retrieve the
> +current state (and potential ones) using the following format:
> +``[active] screen_off sleep resume``. The state "DRIPS" is omitted, as it is
> +entered through the conventional suspend to idle path and userspace will never
> +be able to see its value due to being suspended.

If you follow my above suggestion, I think this file is totally 
unnecessary and then there is no compatibility issue.

It would mean that userspace if it wants to see this "screen off" state 
and associated performance needs to do literally just that - turn the 
screens off.

> +
> +Before entering the "Screen Off" state or suspending, it is recommended that
> +userspace marks all CRTCs as inactive (DPMS). Otherwise, there will be a split
> +second where the display of the device is on, but the presentation of the system
> +is inactive (e.g., the power button pulses), which is undesirable.
> \ No newline at end of file
> diff --git a/Documentation/admin-guide/pm/system-wide.rst b/Documentation/admin-guide/pm/system-wide.rst
> index 1a1924d71006..411775fae4ac 100644
> --- a/Documentation/admin-guide/pm/system-wide.rst
> +++ b/Documentation/admin-guide/pm/system-wide.rst
> @@ -8,4 +8,5 @@ System-Wide Power Management
>      :maxdepth: 2
>   
>      sleep-states
> +   standby-states
>      suspend-flows

