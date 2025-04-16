Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F5FA9046B
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 15:32:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CE1610E918;
	Wed, 16 Apr 2025 13:32:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="mupRYoNx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 627EC10E918
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 13:32:39 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20250416133237euoutp0293e4aaac4b72861e01ff6083131971d3~2z8apn8iO0668406684euoutp02D
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 13:32:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20250416133237euoutp0293e4aaac4b72861e01ff6083131971d3~2z8apn8iO0668406684euoutp02D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1744810357;
 bh=kUFo/wLgztnLDigBiEFrgBwls65G+AeX0yLfanf6yv0=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=mupRYoNxftSMT8sljLcHjRIHg/DDpOP+gsLFvSjf9+5Bgs70dDQkmYBXLHJuQgRxg
 OdvJ/8xSH6MfwDiTbjFB8xHD6oH8LCggTBg1VYNWyU7v6yOAZV2a3ApUUm5r5Hc/A9
 QMDcDrk2jzNVgWggOw68D5TfhAHU/k0Qs10Hq6zI=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20250416133237eucas1p1db9410bcc5acc1b3167bb93a320f6030~2z8aPC9Ga0435904359eucas1p1N;
 Wed, 16 Apr 2025 13:32:37 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id EE.C7.20397.571BFF76; Wed, 16
 Apr 2025 14:32:37 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20250416133236eucas1p1d8f879ffa1724d77d3f8cdcefde84535~2z8ZttCPT0165501655eucas1p1o;
 Wed, 16 Apr 2025 13:32:36 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20250416133236eusmtrp1b0d189806d8483166b7cd28317c2a477~2z8Zs0mqn0448804488eusmtrp1W;
 Wed, 16 Apr 2025 13:32:36 +0000 (GMT)
X-AuditID: cbfec7f5-e59c770000004fad-4e-67ffb1759f3c
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 0D.D8.19654.471BFF76; Wed, 16
 Apr 2025 14:32:36 +0100 (BST)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250416133235eusmtip2b6501e479374913edd639f525f91f50e~2z8YmWHan0900709007eusmtip2v;
 Wed, 16 Apr 2025 13:32:35 +0000 (GMT)
Message-ID: <b9c4182d-38c2-4173-a35a-0e1773c8f2ed@samsung.com>
Date: Wed, 16 Apr 2025 15:32:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] PM: device: Introduce platform_resources_managed
 flag
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei
 <wefu@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Ulf Hansson
 <ulf.hansson@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, Frank
 Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 m.szyprowski@samsung.com, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <CAJZ5v0irRq8_p35vf41_ZgomW0X=KZN+0HqwU2K9PvPRm8iZQA@mail.gmail.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0xTdxTH+d3e3l7Qkmu14RexY6tOGQ7Eucdvm+AeLrkJcRNdYjRZZpWb
 6gQKfTidMwMGtkJhFsbUClIYAdLwKo+uEKALsrYE1ugGk2kLZoAUpAKr4MStznJx47/P+Z5z
 ft9zTn4kR6An1pPHU5WMPFWSLCZCcLPtkTNaZXoijR0tWo0cNyswVNvpxNC972YJVNbj5KLh
 X1owNDA/Q6D68es85OnMxNGkfphAv7aXEMiX3wOQ2ZdNoLoeNw+Vz7XiqNLSDtC581Vc5B52
 4Egzk8FBpQ+KOehJh4WHrty38lDLtI6L7HUHULb1W/wdSHcuGHC6Te/m0dq2fkA3Gc8TtOu3
 DoK+2ptIj+TZMbq58is6u86G0d/8E0vPdA0SdEGLEdDNfWdoX9Nze0MPhexMYpKPn2Tk2+IP
 hxyb7vdy02ybTrUPNWMZ4OaGXBBMQupVOFDagOWCEFJA1QB49Z5uOXgA4MSoD2cDH4D1ngbu
 s5au2UqCTVQDWKr5CwskBJQXQPWiLMB8Kh66PBUgwDj1Ihy+3U+w+hrYe3kMD7CQioAjty7x
 AryW2g8bHy4s1ayjtsLKikFOwIBDNRKwMLNqyZlDhcFbY2VLZgT1CrxTXbakB1OJsN+Yx2Nr
 IuDXrVeWmiFVGgJvqBcJduzd8HKhncfyWjhlb1nmDbCvSIuzLIN3Wv/ksPwlbNPal/lt6HIG
 3iGfGrwEG9q3sfK7cDJzghuQIRUKh7xr2BFCYaH5IoeV+VBzTsBWb4bF2vz/TJ01ZuwCEOtX
 XEW/Ykn9imX0//saAG4EYYxKkSJlFDtSmc9jFJIUhSpVGnNUltIEnn7fPr993gJqpuZiugFG
 gm4ASY54Hd/5hl8q4CdJTn/ByGWfylXJjKIbhJO4OIxfYc2RCiipRMmcYJg0Rv4si5HB6zOw
 s/HvRYrUo5GrErHJl8PTB+XuIIyOO/nT0EePwk18/R9B2k/ix5Jrd1mu/RAFRBPbs5raHx+M
 UZZcX6zy/N5x/8iHyqCsCI3j7KGChQ+irEKl7uPdTt2N1+27asvjeI/HX8iNpfzizP0pp7mr
 VUIyp1Oo/zl6QH0gwRpJ70kTWcZH1bb8aVtc9JYzJ/blVLWmN0s/2/qjbqffEHo7rHHzNUPe
 hXnj7N33TcNHs++6RM2hGz0JsrGRfTsONg2SRy5lac3lRYZZh//Nt9Amnnmq4LBX4Y3fonn4
 vXDKSrkTxmzpLv2qkkRH/ZCbfH7uNcPemlp6wHSqq1hUfTEp6u9ekxhXHJNsj+LIFZJ/Ae0k
 Y0QtBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLKsWRmVeSWpSXmKPExsVy+t/xe7olG/+nG2x/p2lx4voiJos1e88x
 Wbye9oHNYv6Rc6wW9y5tYbK48vU9m8W6pxfYLV7sbWSxeDnrHpvF5V1z2Cw+9x5htNj2uYXN
 Yu2Ru+wWCz9uZbFYsmMXo0Vb5zJWi7v3TrBYdLxvYLaY+2Uqs8X/PTvYLWa/289useXNRFaL
 42vDLVr2T2FxkPDY+20Bi8fOWXfZPXp2nmH02LSqk83jzrU9bB7zTgZ63O8+zuSxeUm9R8va
 Y0we/X8NPN7vu8rm0bdlFaPH5tPVHp83yQXwRenZFOWXlqQqZOQXl9gqRRtaGOkZWlroGZlY
 6hkam8daGZkq6dvZpKTmZJalFunbJehlvDnzlrXgmErFrhubmRoYr8t0MXJySAiYSOz7sISt
 i5GLQ0hgKaNEx/XpbBAJGYlr3S9ZIGxhiT/XuqCKXjNKPNuynRUkwStgJ3HnxSJGEJtFQFXi
 3u0zbBBxQYmTM5+ANYsKyEvcvzWDHcQWFgiW2PD9G1iNiIC2xJJFV5lBhjILbGKTWLVyPjvE
 hgVMEu9WHwKbyiwgLnHryXwmEJtNwEjiwfL5YJs5BQIlzqzqBmrgAKpRl1g/TwiiXF6ieets
 5gmMQrOQ3DELyaRZCB2zkHQsYGRZxSiSWlqcm55bbKRXnJhbXJqXrpecn7uJEZhuth37uWUH
 48pXH/UOMTJxMB5ilOBgVhLhPWf+L12INyWxsiq1KD++qDQntfgQoykwLCYyS4km5wMTXl5J
 vKGZgamhiZmlgamlmbGSOC/blfNpQgLpiSWp2ampBalFMH1MHJxSDUzcGy7sjDoYbr79X0vd
 wRkHsvjkNQ6rJvkcZy30+/7P0mI385ZJp6w4NvT9mXNy0u7m5J8vvsZrex2eeGbzxIIjM6TC
 3PYL6QkF/XqjnLtN+nlNwDxWr3abn7y3hWsyrn+2nROxNsPm6aVZa+bYtipXOKfpvNq77Mob
 pZ7D0ut1fzH8KSrpcVrgIO67X8dw6h63hxVyycWPQk5xHUisOP1tWsS/be+v1D07U+q3zULZ
 qPm101Up/vMGG36/iztygO3U58uuW3T4zj1aWDzBM3f9rH1hbfcsy4SZDnftPeP/+t/a6Ct/
 pIOq/T2OaskfXhwt48rcN8lkTdAUn2232o4XrdrXGWua+dk/5p27UPxDJZbijERDLeai4kQA
 hHVuJcADAAA=
X-CMS-MailID: 20250416133236eucas1p1d8f879ffa1724d77d3f8cdcefde84535
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250414185314eucas1p1ae57b937773a2ed4ce8d52d5598eb028
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250414185314eucas1p1ae57b937773a2ed4ce8d52d5598eb028
References: <CGME20250414185314eucas1p1ae57b937773a2ed4ce8d52d5598eb028@eucas1p1.samsung.com>
 <20250414-apr_14_for_sending-v2-0-70c5af2af96c@samsung.com>
 <20250414-apr_14_for_sending-v2-1-70c5af2af96c@samsung.com>
 <CAJZ5v0irRq8_p35vf41_ZgomW0X=KZN+0HqwU2K9PvPRm8iZQA@mail.gmail.com>
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



On 4/15/25 18:42, Rafael J. Wysocki wrote:
> On Mon, Apr 14, 2025 at 8:53 PM Michal Wilczynski
> <m.wilczynski@samsung.com> wrote:
>>
>> Introduce a new dev_pm_info flag - platform_resources_managed, to
>> indicate whether platform PM resources such as clocks or resets are
>> managed externally (e.g. by a generic power domain driver) instead of
>> directly by the consumer device driver.
> 
> I think that this is genpd-specific and so I don't think it belongs in
> struct dev_pm_info.
> 
> There is dev->power.subsys_data->domain_data, why not use it for this?

Hi Rafael,

Thanks for the feedback.

You're right — this behavior is specific to genpd, so embedding the flag
directly in struct dev_pm_info may not be the best choice. Using
dev->power.subsys_data->domain_data makes more sense and avoids bloating
the core PM structure.

> 
> Also, it should be documented way more comprehensively IMV.
> 
> Who is supposed to set it and when?  What does it mean when it is set?

To clarify the intended usage, I would propose adding the following
explanation to the commit message:

"This flag is intended to be set by a generic PM domain driver (e.g.,
from within its attach_dev callback) to indicate that it will manage
platform specific runtime power management resources — such as clocks
and resets — on behalf of the consumer device. This implies a delegation
of runtime PM control to the PM domain, typically implemented through
its start and stop callbacks. 

When this flag is set, the consumer driver (e.g., drm/imagination) can
check it and skip managing such resources in its runtime PM callbacks
(runtime_suspend, runtime_resume), avoiding conflicts or redundant
operations."

This could also be included as a code comment near the flag definition
if you think that’s appropriate.

Also, as discussed earlier with Maxime and Matt [1], this is not about
full "resource ownership," but more about delegating runtime control of
PM resources like clocks/resets to the genpd. That nuance may be worth
reflecting in the flag name as well, I would rename it to let's say
'runtime_pm_platform_res_delegated', or more concise
'runtime_pm_delegated'.

[1] - https://lore.kernel.org/all/a3142259-1c72-45b9-b148-5e5e6bef87f9@samsung.com/

> 
>> This flag enables device drivers to cooperate with SoC-specific PM
>> domains by conditionally skipping management of clocks and resets when
>> the platform owns them.
>>
>> This idea was discussed on the mailing list [1].
>>
>> [1] - https://lore.kernel.org/all/CAPDyKFq=BF5f2i_Sr1cmVqtVAMgr=0FqsksL7RHZLKn++y0uwg@mail.gmail.com/
>>
>> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
>> ---
>>  include/linux/device.h | 11 +++++++++++
>>  include/linux/pm.h     |  1 +
>>  2 files changed, 12 insertions(+)
>>
>> diff --git a/include/linux/device.h b/include/linux/device.h
>> index 79e49fe494b7c4c70d902886db63c4cfe5b4de4f..3e7a36dd874cfb6b98e2451c7a876989aa9f1913 100644
>> --- a/include/linux/device.h
>> +++ b/include/linux/device.h
>> @@ -881,6 +881,17 @@ static inline bool device_async_suspend_enabled(struct device *dev)
>>         return !!dev->power.async_suspend;
>>  }
>>
>> +static inline bool device_platform_resources_pm_managed(struct device *dev)
> 
> Could this function name be shorter?

Maybe:

static inline bool dev_is_runtime_pm_delegated(struct device *dev);
static inline void dev_set_runtime_pm_delegated(struct device *dev, bool val);

Regards,
Michał

> 
>> +{
>> +       return dev->power.platform_resources_managed;
>> +}
>> +
>> +static inline void device_platform_resources_set_pm_managed(struct device *dev,
>> +                                                           bool val)
> 
> Ditto?
> 
>> +{
>> +       dev->power.platform_resources_managed = val;
>> +}
>> +
>>  static inline bool device_pm_not_required(struct device *dev)
>>  {
>>         return dev->power.no_pm;
>> diff --git a/include/linux/pm.h b/include/linux/pm.h
>> index f0bd8fbae4f2c09c63d780bb2528693acf2d2da1..cd6cb59686e4a5e9eaa2701d1e44af2abbfd88d1 100644
>> --- a/include/linux/pm.h
>> +++ b/include/linux/pm.h
>> @@ -670,6 +670,7 @@ struct dev_pm_info {
>>         bool                    no_pm:1;
>>         bool                    early_init:1;   /* Owned by the PM core */
>>         bool                    direct_complete:1;      /* Owned by the PM core */
>> +       bool                    platform_resources_managed:1;
>>         u32                     driver_flags;
>>         spinlock_t              lock;
>>  #ifdef CONFIG_PM_SLEEP
>>
>> --
>> 2.34.1
>>
>>
> 
