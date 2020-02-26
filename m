Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 647CD171212
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 09:13:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65E116EC12;
	Thu, 27 Feb 2020 08:13:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 209266E431
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 10:07:07 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9830B1FB;
 Wed, 26 Feb 2020 02:07:06 -0800 (PST)
Received: from [10.37.12.169] (unknown [10.37.12.169])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D265E3F9E6;
 Wed, 26 Feb 2020 02:06:56 -0800 (PST)
Subject: Re: [PATCH v3 4/4] drm/panfrost: Register to the Energy Model with
 devfreq device
To: Rob Herring <robh@kernel.org>
References: <20200221194731.13814-1-lukasz.luba@arm.com>
 <20200221194731.13814-5-lukasz.luba@arm.com>
 <CAL_JsqJ1D6Cf2cxdskDS2JCEe8ja6uUeoSpA3i-wxNgi=S1SYA@mail.gmail.com>
From: Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <96d3287c-4559-7c4a-2f99-0a3aad9e42f6@arm.com>
Date: Wed, 26 Feb 2020 10:06:55 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJ1D6Cf2cxdskDS2JCEe8ja6uUeoSpA3i-wxNgi=S1SYA@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 27 Feb 2020 08:13:09 +0000
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
Cc: Nishanth Menon <nm@ti.com>, juri.lelli@redhat.com,
 Peter Zijlstra <peterz@infradead.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, bsegall@google.com,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Morten Rasmussen <Morten.Rasmussen@arm.com>, patrick.bellasi@matbug.net,
 Amit Kucheria <amit.kucheria@verdurent.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Kevin Hilman <khilman@kernel.org>, Andy Gross <agross@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Steven Price <steven.price@arm.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Ingo Molnar <mingo@redhat.com>, NXP Linux Team <linux-imx@nxp.com>,
 Zhang Rui <rui.zhang@intel.com>, mgorman@suse.de, orjan.eide@arm.com,
 "open list:THERMAL" <linux-pm@vger.kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Steven Rostedt <rostedt@goodmis.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-omap <linux-omap@vger.kernel.org>, Dietmar.Eggemann@arm.com,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, David Airlie <airlied@linux.ie>,
 javi.merino@arm.com, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 qperret@google.com, Stephen Boyd <sboyd@kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Sascha Hauer <kernel@pengutronix.de>, Sudeep Holla <sudeep.holla@arm.com>,
 Shawn Guo <shawnguo@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

On 2/25/20 8:57 PM, Rob Herring wrote:
> On Fri, Feb 21, 2020 at 1:48 PM Lukasz Luba <lukasz.luba@arm.com> wrote:
>>
>> Add device to the Energy Model framework. It will create a dedicated
>> and unified data structures used i.e. in the thermal framework.
>> The power model used in dev_pm_opp subsystem is simplified and created
>> based on DT 'dynamic-power-coefficient', volatage and frequency. It is
> 
> typo.

I'll fix it.

> 
>> similar to the CPU model used in Energy Aware Scheduler.
>>
>> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
>> ---
>>   drivers/gpu/drm/panfrost/panfrost_devfreq.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
>> index 413987038fbf..d527a5113950 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
>> +++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
>> @@ -105,6 +105,8 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
>>          }
>>          pfdev->devfreq.devfreq = devfreq;
>>
>> +       dev_pm_opp_of_register_em(dev, NULL);
> 
> Can't fail?

Yes, it can fail but the function does not return anything. It can
easily fail, it's looking for "dynamic-power-coefficient" in the device
node. The DT binding for the devfreq devices would also be good to add..

I would have to probably change it into returning 'int' and modify all
old cpufreq drivers.

> 
>> +
>>          cooling = of_devfreq_cooling_register(dev->of_node, devfreq);
>>          if (IS_ERR(cooling))
>>                  DRM_DEV_INFO(dev, "Failed to register cooling device\n");
>> @@ -118,6 +120,7 @@ void panfrost_devfreq_fini(struct panfrost_device *pfdev)
>>   {
>>          if (pfdev->devfreq.cooling)
>>                  devfreq_cooling_unregister(pfdev->devfreq.cooling);
>> +       dev_pm_opp_of_unregister_em(&pfdev->pdev->dev);
>>          dev_pm_opp_of_remove_table(&pfdev->pdev->dev);
> 
> Does it make sense to keep this (and the registration side) as
> separate calls? Perhaps there's some ordering requirement with
> everything between dev_pm_opp_of_add_table() and
> dev_pm_opp_of_register_em()?

Yes, dev_pm_opp_of_register_em() uses em_data_callback which operates
on OPPs to calculate power values and costs, so the the OPP table should
be already there.

> 
> While you're just adding 2 lines, it seems there's a lot of complexity
> exposed to the driver just to initialize devfreq/opp.

It depends, for example devfreq devices like buses would likely never
use the energy model. Potential clients would be GPUs, DSPs, ISPs.

Could you help me with defining a DT binding for this
"dynamic-power-coefficient" entry? It could be used in different types
of devices. Should it be placed in each of these devices documentation
file, or in some one common file?

Thank you for your comments.

Regards,
Lukasz


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
