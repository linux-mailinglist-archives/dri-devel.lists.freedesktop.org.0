Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CF895136B
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 06:17:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B0C810E408;
	Wed, 14 Aug 2024 04:17:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="lXFt9dDh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2087.outbound.protection.outlook.com [40.107.220.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C692710E273;
 Wed, 14 Aug 2024 04:17:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VOJ+v07MlBRiK/GIKSs6qydpHOpOyx4wotDv0SWjLL36lYzVyt13r1JGB8IL90TcO9aMYqtokPamtyTGxxVCipKjGdznpx5QZ9eSpK//ueypsrDM5XapgnL9kFZuPMWbOJNkn6cLY61MmLVBEfjv+oMW+SGnq31VRBizHweYRAQccGnsdKLVrNWTGI/+DJu15Yq8cWnfUDolumH2MNe5cE8d7NVq27lOo+2r11T+tQxFUBL1u40hop87riH6eX1F71wXu8Lgo1niXjH+Y6bVMiiAVcAqipzgJZhO6qjFoLGfu+Fh+KJ2OoLIYVMHuc+a870+a05S5ztt/VapoJJcvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZVyp/Y2DX2yA1WEESLfQJK6NqR2yrqMV+ZRePUM+UZc=;
 b=NTAC1lA4fE8fxOFc04k79p2CV2ffDvJnnSYq/u5vxBFx63qFzD7jS/Z2GLgjWFpAVWK9nJb8KaZf1Oiyr6KPoqkMMdj0+mkxTwacLBTqwWXYpmRj65ocNHaVVHs/74PzlbYIf68qUYNRo0csJYePDEBLNQ+IIfMNep6em+J/lsEp+DapK+bejSIQJPFW1ZSyF6s/t9aG/e7gRAVJGYjJ0F5aoZcJoIisiwFMH2Cmnj/r1GQaHpIFNiK1Om9q47Z5ZGDD0O/NYBpUAjYEstt/29bK/3m3wNv5Wh0giFz9zcFT9yy0ojUmnBX4HtRR267RjjQ1sguxjMK2L6Hhli3KAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZVyp/Y2DX2yA1WEESLfQJK6NqR2yrqMV+ZRePUM+UZc=;
 b=lXFt9dDhQFA+Ajyna3a0ktnmjMamVqKL7L+8Gp46rRrZ/jOXzqcgrdwSt/dtEvgZUr54X9DKpRzCU2BS6arbV4Y3Ockot/cjNU4InGbASGm8MVABPs+CK0qUw6YkTWcFY7WrXlF3nvdk9Z3KfTC2wWf82mJzpcKxa212sl1tW6U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB6760.namprd12.prod.outlook.com (2603:10b6:a03:44c::18)
 by CH2PR12MB4150.namprd12.prod.outlook.com (2603:10b6:610:a6::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Wed, 14 Aug
 2024 04:17:41 +0000
Received: from SJ0PR12MB6760.namprd12.prod.outlook.com
 ([fe80::25c8:f399:b2e8:1947]) by SJ0PR12MB6760.namprd12.prod.outlook.com
 ([fe80::25c8:f399:b2e8:1947%5]) with mapi id 15.20.7849.023; Wed, 14 Aug 2024
 04:17:40 +0000
Content-Type: multipart/alternative;
 boundary="------------bNofUzotORi7Jxwb7XlLJu3P"
Message-ID: <adb96f92-ca20-43b5-b94d-085baeac8f83@amd.com>
Date: Wed, 14 Aug 2024 00:16:54 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/4] drm: Use full allocated minor range for DRM
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 Alex Deucher <alexdeucher@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 David Airlie <airlied@linux.ie>, Oded Gabbay <ogabbay@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Emil Velikov <emil.l.velikov@gmail.com>,
 Matthew Wilcox <willy@infradead.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, James Zhu <James.Zhu@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20230724211428.3831636-1-michal.winiarski@intel.com>
 <CADnq5_NwDn5DXPadzZtegUJ=y=LfVHykO7kG3edmiqRTTCxMNQ@mail.gmail.com>
 <nqsuaaibncfcnu3d5376ulujxfswbjwq3ptrivh6djpmvcpuih@fepbhcbik272>
Content-Language: en-US
From: James Zhu <jamesz@amd.com>
Organization: AMD RTG
In-Reply-To: <nqsuaaibncfcnu3d5376ulujxfswbjwq3ptrivh6djpmvcpuih@fepbhcbik272>
X-ClientProxiedBy: YQZPR01CA0052.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:88::21) To SJ0PR12MB6760.namprd12.prod.outlook.com
 (2603:10b6:a03:44c::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB6760:EE_|CH2PR12MB4150:EE_
X-MS-Office365-Filtering-Correlation-Id: 425ea385-ccd9-481f-a8e4-08dcbc18093d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info: PomTOQC47km3WP0vldS8OlhRFFK6UAsKq99x4Iir1AjHnDLd8cUh9y09DMtm3LvI+M5BPPEvmda2lVlk1tgleNVchh7jY1jYqrHxZV2wWh7izazjIKCydWvGI5qF4RNlbAIJj/RdfeNZRTMv3yf6ko7XpXNGCEhuJ6FtEonHGj2lgf48oPcnbi6JACo0DNd/ZgXN/LjSLJHbQQdm9vY5t7SP6nLy5qkfrxKkvqXVfmI0TwnuinsT77eczZPpk6DS/D6y/dSUNBUEB0r3AhbRTNK3WePsyo+9dCgiYidUuomsR8XY8xGGJ5w18DGnyWp3eTGMqMRJFmhTU0mbSJWS+VKPp7BN27050mtfIqJLh6LxJ45W+4MwLrVcMcoxajqqGiQXXMxkfHao/S7lSeonqJYi+8Q9afSeT/bbihjAGaMwlkernA8i7y9NczmsG15Obiz1wiTMla3pFReeqxGY7gUKVEgVt8mZwU6bKT7tqyWND0Ft/miCbYBVSCu/7wxo79NSMIefoFt+VDNM7YyIZujkTdNfjl0jrsAuIPk+lIOCG4FiZQjwV2718SaDi9KeonKu7+UTuleHy8pQ4TmkM4dkuVy/Mqu61+l7QvnkyNiuKOs1gMKmFo+xCENGjvJJNc7sAfZk5E9EcZtsHlEyjlFgMp59s4ze4u1aw2slVn0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB6760.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YW5CY0h5NjN6NGRGU0VGTUl1TElzaXdZM21mUDl5LytMemVaczBrbkxGaWcz?=
 =?utf-8?B?TlkxNmVaY1JRVWJRMjhFNm5ub2xhWkpKU2psZGR1T0ZWYjFjcmJ0czRIcm04?=
 =?utf-8?B?MExSTWdScksxR2hUNlRUNXpYdnJSWS9HZk1ZTTIreU92ZzVpL3BxOWx1TTRI?=
 =?utf-8?B?MjdVZWlCbDR0MVVBbHBxMUZPVStYT2ZMcFQ1akpNbzZQM1hnanlEU3JSNmJV?=
 =?utf-8?B?YWM2OEhZYWdpZFpLUUM1STlBV045REc0eVNhOGlyMUJPTlZLTDArUGxqNzV6?=
 =?utf-8?B?cWp1dnhhYjBGRHkzZnMybk12RDNNY2RiUWpYMnZWN3h2U2hWaUNKMWxQVmYx?=
 =?utf-8?B?UStjZzJTNFF4VDNjWnJmZ0Zwd2IwN053cFQ1NHB2TGp3QlRROFN4NFRPOTVo?=
 =?utf-8?B?d2txSUs0bmJDaXplNFB3dndzcEZnQzdVS1ppTnNsZ2RoQUtxLzJlY1djV3Nw?=
 =?utf-8?B?akdUc2VNSHhaUzJ6Nk00Y05OK29UaEU1YmZGYUlzeDROQUZDeDdicER6SUoy?=
 =?utf-8?B?dmxqb1NnZlpxNTFjSGhjNWg5Q3FKcng0VWtBQjF0dW5wRjlReUN5STYrY2Va?=
 =?utf-8?B?NFExK2R0NTgwTDNXc1FibzVtVWxvby90YTk1QVp5N29CTEZ6anBvd3N5dEtU?=
 =?utf-8?B?VG0vNTdzbXkzb09PN0lvd2RGd2hQSVpmU2VhTmNSUlJaV21aUHZMeDhnZTRH?=
 =?utf-8?B?TnRnc1dwNVVuSDE3OUd6dW5VNkFxQTRMdGp2VW1ydGZqaEdOQUNXR0tFdnQ0?=
 =?utf-8?B?SjNKRER0RGxkSUdERWRrZVROZmQxUm5iTDcwYkR4Y2JYRGlZSXc4UWozV2h1?=
 =?utf-8?B?L3NCeUl2djEvcVg4UTJFZkVtRllQcmcvZlF4TjZ3OE5IYkFPTlJpdmh4OU13?=
 =?utf-8?B?dUFtQXhCM0VZdFIzYS92dG1oMlN1WXFQZjdVZkxUcVBFM3ZsTzRBd2VKZVlP?=
 =?utf-8?B?S0lseVR0WStuM0FiVC9qTXdtNW9SdGtpZXdmZGpDNjdodis1MXlhQTJkZkRl?=
 =?utf-8?B?cEk4NzkxeHV0YlQvT2Fpa3h3bjVrV3N5SEhLVjU5OGFTaGh2ZmxESWxaQnpB?=
 =?utf-8?B?bTBuNmptT3Q2NUMwV0NoUVhJL3RUWG0xSzVidXdnMmhFNjZkWVJVZER5aVhY?=
 =?utf-8?B?eTg3L3YzaWRwYkdSZEJnUzM1VmhQeHkyUXo2SFVaOFc3QVFLeHBBWlhmNjRn?=
 =?utf-8?B?MG9kaHlIemFWSDFqOGt4cmdkaXZPWk0vVmJselZKK0dIbHpLMG11enFHdmxY?=
 =?utf-8?B?K1NBSCtISTZWV09tZWdYaWJ3ck9HZExTenFXekQwSE1MQlFhV0lySmMyU1Zl?=
 =?utf-8?B?d2lYd29hOURhUGo1dEVONm1za084QVJkem8wSUNocFhtcmVKSWFmMGU4eW9O?=
 =?utf-8?B?bjBqT3I2b1QwUTJIWVYyYkJCTnVibmZGZ3VCenNBWHcvcG1IL2hWbHdNcnhy?=
 =?utf-8?B?WG5KbDdrOWhtY1p3emVYUndpZmRNMWVpTGxvcFU0Rmsya0pYR3lPOEFESDl2?=
 =?utf-8?B?UUtpcGo5YXM1bmdaaFZlUjZHWXFIWDJOajkvTE9sU2YrWHdoc2ZMU0podGdj?=
 =?utf-8?B?bFA4ZmtkbGlqVlhIQXlXSFdmcHU4dzV1OU1uVHJmVGNRQ2dCTGcydXFvempY?=
 =?utf-8?B?VG1CV0N2RkhlNkxMV3RUWXBXUlRiSnVSOUZwUnhIdjlDeUdka3FnSm5hOEs2?=
 =?utf-8?B?WDBQdGx5Um9oZ3V1YjZJR0I2YUJYUU54eWtvWXAxNGtKc0lObUtCNVJwb0VU?=
 =?utf-8?B?SzFrR25CMGoydHEwTmhGbGEvbklyS2IvRldKVWo1U2p4ZjY0TnR2cEtuRGVt?=
 =?utf-8?B?Qi93RWdHS0htenFGU2NScXJVZDFDa3l0R2lMZmtSbUdaOTVIQUpYbkJYRDFj?=
 =?utf-8?B?eFFWcVNCNzV3RnRwSUhOdjVNV0pKelZKMm1iZnI2UC9yeWtYMWRaeWQ1WFlv?=
 =?utf-8?B?RDZDTlRPU2U0TENNbkh1cktkYjdIV2I5Ykw3MG9pcmhXYy9WQjFQN2pxQ0dO?=
 =?utf-8?B?cWZCamsxbXJPWVVqQkJ3RXQra1RJU0JXSTRJbitwb3A5MklYZkdFSUhXTm5z?=
 =?utf-8?B?Z3p5aE9uWVBiWnlEUVZYRjZ2d3NZV252WElvQVZVMmdRZVJMejJFcDAyM0RE?=
 =?utf-8?Q?4nGs=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 425ea385-ccd9-481f-a8e4-08dcbc18093d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB6760.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 04:17:40.1974 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W6jdqL5lLBi3nB7w0QJqVtac7nsLGHU0I/txwLxJz9Zd26TXwTr9uzYBHjj08qzq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4150
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

--------------bNofUzotORi7Jxwb7XlLJu3P
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Michal

I did give Tested-by before. If you need Acks, Here I can give

Acked-by:JamesZhu<James.Zhu@amd.com>fortheseries

Best Regards!

James

On 2024-08-13 20:18, Michał Winiarski wrote:
> On Mon, Aug 12, 2024 at 01:38:38PM GMT, Alex Deucher wrote:
>> Are there any objections to this series?  We have been running into
>> this limit as a problem for a while now on big servers.
> I don't think there were any objections, just a general lack of
> interest - so there are no R-b / Acks.
> If you're interested to have a go at it - I can resend it.
> It should still apply on latest drm-tip.
>
> -Michał
>
>> Alex
>>
>> On Mon, Jul 24, 2023 at 5:15 PM Michał Winiarski
>> <michal.winiarski@intel.com>  wrote:
>>> 64 DRM device nodes is not enough for everyone.
>>> Upgrade it to ~512K (which definitely is more than enough).
>>>
>>> To allow testing userspace support for >64 devices, add additional DRM
>>> modparam (force_extended_minors) which causes DRM to skip allocating minors
>>> in 0-192 range.
>>> Additionally - convert minors to use XArray instead of IDR to simplify the
>>> locking.
>>>
>>> v1 -> v2:
>>> Don't touch DRM_MINOR_CONTROL and its range (Simon Ser)
>>>
>>> v2 -> v3:
>>> Don't use legacy scheme for >=192 minor range (Dave Airlie)
>>> Add modparam for testing (Dave Airlie)
>>> Add lockdep annotation for IDR (Daniel Vetter)
>>>
>>> v3 -> v4:
>>> Convert from IDR to XArray (Matthew Wilcox)
>>>
>>> v4 -> v5:
>>> Fixup IDR to XArray conversion (Matthew Wilcox)
>>>
>>> v5 -> v6:
>>> Also convert Accel to XArray
>>> Rename skip_legacy_minors to force_extended_minors
>>>
>>> Michał Winiarski (4):
>>>    drm: Use XArray instead of IDR for minors
>>>    accel: Use XArray instead of IDR for minors
>>>    drm: Expand max DRM device number to full MINORBITS
>>>    drm: Introduce force_extended_minors modparam
>>>
>>>   drivers/accel/drm_accel.c      | 110 +++------------------------------
>>>   drivers/gpu/drm/drm_drv.c      | 105 ++++++++++++++++---------------
>>>   drivers/gpu/drm/drm_file.c     |   2 +-
>>>   drivers/gpu/drm/drm_internal.h |   4 --
>>>   include/drm/drm_accel.h        |  18 +-----
>>>   include/drm/drm_file.h         |   5 ++
>>>   6 files changed, 69 insertions(+), 175 deletions(-)
>>>
>>> --
>>> 2.41.0
>>>
--------------bNofUzotORi7Jxwb7XlLJu3P
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Michal</p>
    <p>I did give&nbsp;Tested-by before. If you need Acks, Here  I can give </p>
    Acked-by:<span style=" color:#c0c0c0;"> </span>James<span style=" color:#c0c0c0;"> </span>Zhu<span style=" color:#c0c0c0;">
    </span><a class="moz-txt-link-rfc2396E" href="mailto:James.Zhu@amd.com">&lt;James.Zhu@amd.com&gt;</a><span style=" color:#c0c0c0;"> </span><span style=" color:#ff9d04;">for</span><span style=" color:#c0c0c0;"> </span>the<span style=" color:#c0c0c0;"> </span>series
    <p><style type="text/css">p, li { white-space: pre-wrap; }</style></p>
    <p>Best Regards!</p>
    <p>James</p>
    <div class="moz-cite-prefix">On 2024-08-13 20:18, Michał Winiarski
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:nqsuaaibncfcnu3d5376ulujxfswbjwq3ptrivh6djpmvcpuih@fepbhcbik272">
      <pre class="moz-quote-pre" wrap="">On Mon, Aug 12, 2024 at 01:38:38PM GMT, Alex Deucher wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Are there any objections to this series?  We have been running into
this limit as a problem for a while now on big servers.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I don't think there were any objections, just a general lack of
interest - so there are no R-b / Acks.
If you're interested to have a go at it - I can resend it.
It should still apply on latest drm-tip.

-Michał

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Alex

On Mon, Jul 24, 2023 at 5:15 PM Michał Winiarski
<a class="moz-txt-link-rfc2396E" href="mailto:michal.winiarski@intel.com">&lt;michal.winiarski@intel.com&gt;</a> wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
64 DRM device nodes is not enough for everyone.
Upgrade it to ~512K (which definitely is more than enough).

To allow testing userspace support for &gt;64 devices, add additional DRM
modparam (force_extended_minors) which causes DRM to skip allocating minors
in 0-192 range.
Additionally - convert minors to use XArray instead of IDR to simplify the
locking.

v1 -&gt; v2:
Don't touch DRM_MINOR_CONTROL and its range (Simon Ser)

v2 -&gt; v3:
Don't use legacy scheme for &gt;=192 minor range (Dave Airlie)
Add modparam for testing (Dave Airlie)
Add lockdep annotation for IDR (Daniel Vetter)

v3 -&gt; v4:
Convert from IDR to XArray (Matthew Wilcox)

v4 -&gt; v5:
Fixup IDR to XArray conversion (Matthew Wilcox)

v5 -&gt; v6:
Also convert Accel to XArray
Rename skip_legacy_minors to force_extended_minors

Michał Winiarski (4):
  drm: Use XArray instead of IDR for minors
  accel: Use XArray instead of IDR for minors
  drm: Expand max DRM device number to full MINORBITS
  drm: Introduce force_extended_minors modparam

 drivers/accel/drm_accel.c      | 110 +++------------------------------
 drivers/gpu/drm/drm_drv.c      | 105 ++++++++++++++++---------------
 drivers/gpu/drm/drm_file.c     |   2 +-
 drivers/gpu/drm/drm_internal.h |   4 --
 include/drm/drm_accel.h        |  18 +-----
 include/drm/drm_file.h         |   5 ++
 6 files changed, 69 insertions(+), 175 deletions(-)

--
2.41.0

</pre>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------bNofUzotORi7Jxwb7XlLJu3P--
