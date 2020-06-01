Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1DA1EA17F
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jun 2020 12:05:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E970A6E02E;
	Mon,  1 Jun 2020 10:04:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 466D46E02E
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jun 2020 10:04:57 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200601100455euoutp012c0918b90eab2472191160251c980c31~UY2604j6b2452124521euoutp01G
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jun 2020 10:04:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200601100455euoutp012c0918b90eab2472191160251c980c31~UY2604j6b2452124521euoutp01G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1591005895;
 bh=CgeOOg8l1+lFHJgZGFt7jxgyRNwPoTigkymvXCh8EMw=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=P0JMFrnAZzYvc2OhZOQhqRbbnrUuHBjvH5/xj8LxDZ0HreUsxtYZqqLXtqr9n6Ksn
 n4baDK2Mj8S1Xy6c4gp9WMiS6WuTcdJNE7Cd1BHAEaUrwHZzM4Wmkik+0JgDp4mB7f
 Jc/BGJMf71rvncfm6knp0uK4m350uZBRIdz0a9SY=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200601100455eucas1p23dd2f70c3e31ee7ffa60bc23b638652c~UY26bJrvF3216432164eucas1p2P;
 Mon,  1 Jun 2020 10:04:55 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 7D.7F.60698.6C2D4DE5; Mon,  1
 Jun 2020 11:04:55 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200601100454eucas1p1b7aaa6f04b6bc51e0fbd4b51d248b217~UY26FsQBH0989109891eucas1p1f;
 Mon,  1 Jun 2020 10:04:54 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200601100454eusmtrp1b57feacee2e3849770ee74e65ddbf649~UY26E09Jh2405824058eusmtrp1B;
 Mon,  1 Jun 2020 10:04:54 +0000 (GMT)
X-AuditID: cbfec7f5-a29ff7000001ed1a-b1-5ed4d2c62288
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 26.40.07950.6C2D4DE5; Mon,  1
 Jun 2020 11:04:54 +0100 (BST)
Received: from [106.210.123.115] (unknown [106.210.123.115]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200601100453eusmtip1513aa3d67c5574c6ef2fc1a93595396f~UY24sI_oJ1722217222eusmtip1d;
 Mon,  1 Jun 2020 10:04:53 +0000 (GMT)
Subject: Re: [RFC PATCH v5 3/6] PM / devfreq: exynos-bus: Add registration
 of interconnect child device
To: Chanwoo Choi <chanwoo@kernel.org>
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <8a977716-9e0e-5daf-fb22-32d943da42e5@samsung.com>
Date: Mon, 1 Jun 2020 12:04:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <CAGTfZH1KC=jpQ5GXNtEf1cn7+WqXJdqbbVKmpxr8Snh4GEy8bA@mail.gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02SaUhUURTHu2+bpzb2HE0PGgWDQgppYh8eVFbSMkWQ0YdA0Zr05ZKOMuOS
 kegQWi7JuICTmopo2rSoo2i4gTI56JjGuGQuzYeGYgwzN1omLJ/PyG+/c/7/e8/5Xy6NS2ZI
 TzpOkcIpFfIEKeVIdAz+HDtkNE9EHi4ax1hLdQ5iW7XNJFs8PUGw79Y+k2yNYZRkJ9aXKLa8
 V0+xJRYNwY6NtYhY/ccpkh3vqqJY7Vgfxr4wzIvYWXUTxeb0GkSsttRGnWRkel0eJZub6qFk
 lgIjJmurz5IVteuQbFW/P5QKczwWzSXEpXHKgODrjrH2J9/J5EKv23NlWlE2WnbNRzQNzBHQ
 NDjlI0dawjQhsDeYyXzksFmsIXjbTAjCKgJD8XvEC/yB5aeLlCA0ItAvfcKEYhmBrauf4l2u
 TBwYTfUint0YH2hZGSR5E840kDCUa926imIC4eHroi0WM8Ewoy8jeCYYb5h8psV43stEQKFl
 ARc8LjD0yErwezswl6FSE8i3ccYDZqw1mMAHoHOxChc2VdNgHXcS+DR86WndTuAKC8Z2kcD7
 wFRauBUTmHsICrtnRUKhQWAx1m6fOApzo78ofjDO+EJzV4DQPgUT9kZKeEdnmF50EXZwhpKO
 clxoi+FBrkRwe4NdV44J7AkF1j+EBkkrdgSr2JGmYkeaiv9zaxGhQx5cqioxhlMFKbh0f5U8
 UZWqiPGPSkrUo80fZ9owrr9Cfb9vDCCGRtLd4oPm8UgJKU9TZSQOIKBxqZs45I0pUiKOlmfc
 4ZRJ15SpCZxqAHnRhNRDHFRni5AwMfIU7hbHJXPKfypGO3hmo7vHw20bF6wlKQry/MuRqqXM
 VV/3EEitu3fxW8oJJVE3FDp/xe+M+XEUZVZkeiw5mCtP9o8qJFfXT6l7V8LPLX7d85yyroZh
 LpN998F2892wZGFYba+W/YjSmeorjbl58SHx6V5kp6GT6Nb41AVd8jOrg2I2skbccbrt7K4P
 UkIVKw/0w5Uq+V+3x83HbQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrHIsWRmVeSWpSXmKPExsVy+t/xu7rHLl2JMzg/R93i/rxWRouNM9az
 Wky8cYXF4vqX56wW84+cY7W48vU9m8X0vZvYLCbdn8Bicf78BnaLTY+vsVpc3jWHzWLG+X1M
 FmuP3GW3uN24gs2ide8RdosZk1+yOQh4bFrVyeZx59oeNo/73ceZPDYvqffo27KK0ePzJrkA
 tig9m6L80pJUhYz84hJbpWhDCyM9Q0sLPSMTSz1DY/NYKyNTJX07m5TUnMyy1CJ9uwS9jN/L
 vrMW9EhX3Jkyg72B8aNwFyMnh4SAicTHlW/Zuhi5OIQEljJK/Lr6k72LkQMoISUxv0UJokZY
 4s+1Lqia90A1q6awgSSEBTIlXnY8YQWxRQRUJTZ8OsYKUsQssJxV4tih9VAdHUwSr1qOsoNU
 sQkYSvQe7WMEsXkF7CRubZrCAmKzCKhIXF09gwnEFhWIlehe/IMdokZQ4uTMJywgF3EKBErM
 nmAIEmYWUJf4M+8SM4QtLnHryXwmCFteYvvbOcwTGIVmIemehaRlFpKWWUhaFjCyrGIUSS0t
 zk3PLTbSK07MLS7NS9dLzs/dxAiM623Hfm7Zwdj1LvgQowAHoxIP74Xzl+OEWBPLiitzDzFK
 cDArifA6nT0dJ8SbklhZlVqUH19UmpNafIjRFOi3icxSosn5wJSTVxJvaGpobmFpaG5sbmxm
 oSTO2yFwMEZIID2xJDU7NbUgtQimj4mDU6qB8dwmthDF531bGn7IT1/+9Pby5Iaizc7/Fy+Y
 5qG+pzL+tMmZ1gccMx6kTDG9JipXst8mJPB1E5t/W17qhsupLAenPF9bynlC6sbHYhMFfwHn
 AvXdPWuOLvrOoNTs8S5d9PZTrq0HQyZ+Vn/sYZBR3XT+mGOJ9/dqnbd84Ysf8d88sOdwaM2a
 PiWW4oxEQy3mouJEAABzid8BAwAA
X-CMS-MailID: 20200601100454eucas1p1b7aaa6f04b6bc51e0fbd4b51d248b217
X-Msg-Generator: CA
X-RootMTR: 20200529163225eucas1p1cfb2233c869dcc3dab84b754bbce17b6
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200529163225eucas1p1cfb2233c869dcc3dab84b754bbce17b6
References: <CGME20200529163225eucas1p1cfb2233c869dcc3dab84b754bbce17b6@eucas1p1.samsung.com>
 <20200529163200.18031-1-s.nawrocki@samsung.com>
 <20200529163200.18031-4-s.nawrocki@samsung.com>
 <CAGTfZH1KC=jpQ5GXNtEf1cn7+WqXJdqbbVKmpxr8Snh4GEy8bA@mail.gmail.com>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Georgi Djakov <georgi.djakov@linaro.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cc: Rob, devicetree ML

On 31.05.2020 01:57, Chanwoo Choi wrote:
> On Sat, May 30, 2020 at 1:33 AM Sylwester Nawrocki
> <s.nawrocki@samsung.com> wrote:
>>
>> This patch adds registration of a child platform device for the exynos
>> interconnect driver. It is assumed that the interconnect provider will
>> only be needed when #interconnect-cells property is present in the bus
>> DT node, hence the child device will be created only when such a property
>> is present.
>>
>> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
>>
>> Changes for v5:
>>  - new patch.
>> ---
>>  drivers/devfreq/exynos-bus.c | 17 +++++++++++++++++
>>  1 file changed, 17 insertions(+)
>>
>> diff --git a/drivers/devfreq/exynos-bus.c b/drivers/devfreq/exynos-bus.c
>> index 8fa8eb5..856e37d 100644
>> --- a/drivers/devfreq/exynos-bus.c
>> +++ b/drivers/devfreq/exynos-bus.c
>> @@ -24,6 +24,7 @@
>>
>>  struct exynos_bus {
>>         struct device *dev;
>> +       struct platform_device *icc_pdev;
>>
>>         struct devfreq *devfreq;
>>         struct devfreq_event_dev **edev;
>> @@ -156,6 +157,8 @@ static void exynos_bus_exit(struct device *dev)
>>         if (ret < 0)
>>                 dev_warn(dev, "failed to disable the devfreq-event devices\n");
>>
>> +       platform_device_unregister(bus->icc_pdev);
>> +
>>         dev_pm_opp_of_remove_table(dev);
>>         clk_disable_unprepare(bus->clk);
>>         if (bus->opp_table) {
>> @@ -168,6 +171,8 @@ static void exynos_bus_passive_exit(struct device *dev)
>>  {
>>         struct exynos_bus *bus = dev_get_drvdata(dev);
>>
>> +       platform_device_unregister(bus->icc_pdev);
>> +
>>         dev_pm_opp_of_remove_table(dev);
>>         clk_disable_unprepare(bus->clk);
>>  }
>> @@ -431,6 +436,18 @@ static int exynos_bus_probe(struct platform_device *pdev)
>>         if (ret < 0)
>>                 goto err;
>>
>> +       /* Create child platform device for the interconnect provider */
>> +       if (of_get_property(dev->of_node, "#interconnect-cells", NULL)) {
>> +                   bus->icc_pdev = platform_device_register_data(
>> +                                               dev, "exynos-generic-icc",
>> +                                               PLATFORM_DEVID_AUTO, NULL, 0);
>> +
>> +                   if (IS_ERR(bus->icc_pdev)) {
>> +                           ret = PTR_ERR(bus->icc_pdev);
>> +                           goto err;
>> +                   }
>> +       }
>> +
>>         max_state = bus->devfreq->profile->max_state;
>>         min_freq = (bus->devfreq->profile->freq_table[0] / 1000);
>>         max_freq = (bus->devfreq->profile->freq_table[max_state - 1] / 1000);
>> --
>> 2.7.4
>>
> 
> It looks like very similar like the registering the interconnect
> device of imx-bus.c
> and I already reviewed and agreed this approach.
> 
> Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
> 
> nitpick: IMHO, I think that 'exynos-icc' is proper and simple without
> 'generic' word.
> If we need to add new icc compatible int the future, we will add
> 'exynosXXXX-icc' new compatible.
> But, I'm not forcing it. just opinion. Anyway, I agree this approach.

Thanks for review. I will change the name to exynos-icc in next version, 
as I commented at other patch, it is not part of any DT binding, 
it is just for device/driver matching between devfreq and interconnect.


--
Thanks, 
Sylwester
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
