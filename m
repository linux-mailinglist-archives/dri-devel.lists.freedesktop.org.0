Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C18D2A3F12
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 09:39:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01B5D6E858;
	Tue,  3 Nov 2020 08:39:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CC3189823
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 08:39:19 +0000 (UTC)
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20201103083917epoutp04da400f51bdc2ba9aaded630d918e01b7~D8rZddyxa1320613206epoutp04i
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 08:39:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20201103083917epoutp04da400f51bdc2ba9aaded630d918e01b7~D8rZddyxa1320613206epoutp04i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1604392757;
 bh=TCglbtrz9ylc1A1k4fQu6XkccEIYziLd2hbXm0siW8M=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=aVJxIqZGfyPEkrIZi7wclFbCk+pOpskDODt3YD/Brejnd/58ZjKsM97QJglG0G6Gr
 d2/z7LxtVmw3Zli+nXuctYC1fstI+631wgjz1UVDnwQAfzi7UJDPC2nnYVAfiMEFeb
 zEejPBnpCIvQJ6VxYsBHkepkm5jev6Ly57vQlacA=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTP id
 20201103083917epcas1p3b7dab39a99f37907acf8dc0f9c844cbc~D8rZK-bM12788827888epcas1p3T;
 Tue,  3 Nov 2020 08:39:17 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.40.157]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4CQNVn2VjszMqYkl; Tue,  3 Nov
 2020 08:39:13 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
 1D.A6.09577.13711AF5; Tue,  3 Nov 2020 17:39:13 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20201103083912epcas1p45295a663daa3b70c7d3b3bad96fe1765~D8rVFgLxf2279722797epcas1p4H;
 Tue,  3 Nov 2020 08:39:12 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20201103083912epsmtrp1ba81ef1ab61f4c480e51b755f00af3d8~D8rVEk8ti1706017060epsmtrp1F;
 Tue,  3 Nov 2020 08:39:12 +0000 (GMT)
X-AuditID: b6c32a39-c13ff70000002569-1e-5fa11731c11a
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 E8.AD.13470.03711AF5; Tue,  3 Nov 2020 17:39:12 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20201103083912epsmtip11397afa1b3b125b491cf6e88a0d09db2~D8rUtGTFL0602506025epsmtip1G;
 Tue,  3 Nov 2020 08:39:12 +0000 (GMT)
Subject: Re: [PATCH v7 0/6] Exynos: Simple QoS for exynos-bus using
 interconnect
To: Georgi Djakov <georgi.djakov@linaro.org>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>
From: Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <3e3038da-d5de-7ea9-9cb9-082ce63af91d@samsung.com>
Date: Tue, 3 Nov 2020 17:53:10 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
 Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <9285e2d4-f2fa-92f2-ba25-832f32f77d78@linaro.org>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHJsWRmVeSWpSXmKPExsWy7bCmrq6h+MJ4g5dtAhb357UyWmycsZ7V
 Yv6Rc6wWV76+Z7OYvncTm8Wk+xNYLM6f38BucXnXHDaLz71HGC1mnN/HZLH2yF12i9uNK9gs
 WvceYbc4/Kad1WLG5JdsDvwem1Z1snncubaHzeN+93Emj74tqxg9Pm+SC2CNyrbJSE1MSS1S
 SM1Lzk/JzEu3VfIOjneONzUzMNQ1tLQwV1LIS8xNtVVy8QnQdcvMATpXSaEsMacUKBSQWFys
 pG9nU5RfWpKqkJFfXGKrlFqQklNgWaBXnJhbXJqXrpecn2tlaGBgZApUmJCd8e3rY5aC39EV
 1/+vZ21gXGXSxcjJISFgInF+Ww9rFyMXh5DADkaJ9zvvsoEkhAQ+MUrM70+BSHxjlFh3aT0r
 TMf+h6eZIBJ7GSX2vt0B1f6eUeLThplgVcICQRJrJ7YzdjFycIgIREucO6MDUsMscJNJ4tGq
 e2Ar2AS0JPa/uAFm8wsoSlz98ZgRxOYVsJO4c3cRmM0ioCLx4v5RsBpRgTCJk9taoGoEJU7O
 fMICMp8TqP7gyWKQMLOAuMStJ/OZIGx5ie1v5zBDHH2BQ+LtBFUI20Vi95//UM8IS7w6voUd
 wpaSeNnfBmVXS6w8eYQN5GYJgQ5GiS37L0A1GEvsXzqZCWQvs4CmxPpd+hBhRYmdv+cyQuzl
 k3j3FRSkHEBxXomONiGIEmWJyw/uMkHYkhKL2zvZJjAqzULyzCwkH8xC8sEshGULGFlWMYql
 FhTnpqcWGxaYIsf1JkZwQtay3ME4/e0HvUOMTByMhxglOJiVRHhrIufFC/GmJFZWpRblxxeV
 5qQWH2I0BQbvRGYp0eR8YE7IK4k3NDUyNja2MDE0MzU0VBLn/aPdES8kkJ5YkpqdmlqQWgTT
 x8TBKdXAZC768/mOPxqr61sCD/xf43SmmDdN/v30uS848/8tFZGSf/rwRMDLXZvUlIq8xf+t
 OfioWMaEIWCTnjq3sw3ng1fzDq1VOa6SbFKXr2LDYN52WWRhYobS2+1f0ubI528uKDeUWZ37
 fVegenVHgmrkytXn9szJMN698155Tb2jnPut3hvB2Z67mK9u8l06vY5p17IXV87sn2BSLdei
 Pu+Uxf/4if9WRN8/HX9IaJNxf7FNgbCefmNA1Jz37su9xbf5abWIscW2dqcw/xA4lS2RU6nc
 m9vTvvMi8/ugW/vce7adS95uW54pa7bm0Wd/VvutjGmilZ4zI0SjD+dPmB8p1Ou4/FXuNZW1
 /PftbyxQYinOSDTUYi4qTgQAOrGY41EEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFIsWRmVeSWpSXmKPExsWy7bCSnK6B+MJ4g+Zrchb357UyWmycsZ7V
 Yv6Rc6wWV76+Z7OYvncTm8Wk+xNYLM6f38BucXnXHDaLz71HGC1mnN/HZLH2yF12i9uNK9gs
 WvceYbc4/Kad1WLG5JdsDvwem1Z1snncubaHzeN+93Emj74tqxg9Pm+SC2CN4rJJSc3JLEst
 0rdL4Mr49vUxS8Hv6Irr/9ezNjCuMuli5OSQEDCR2P/wNFMXIxeHkMBuRolr96cxQSQkJaZd
 PMrcxcgBZAtLHD5cDFHzllGiYeJNsBphgSCJtRPbGUFsEYFoiX/PzoLZzAI3mSQubvGAaPjO
 KDH173VWkASbgJbE/hc32EBsfgFFias/HoM18ArYSdy5uwjMZhFQkXhx/yhYjahAmMTOJY+Z
 IGoEJU7OfMICchAnUP3Bk8UQu9Ql/sy7xAxhi0vcejKfCcKWl9j+dg7zBEbhWUi6ZyFpmYWk
 ZRaSlgWMLKsYJVMLinPTc4sNCwzzUsv1ihNzi0vz0vWS83M3MYKjU0tzB+P2VR/0DjEycTAe
 YpTgYFYS4a2JnBcvxJuSWFmVWpQfX1Sak1p8iFGag0VJnPdG4cI4IYH0xJLU7NTUgtQimCwT
 B6dUA9PpbNtDHp/8tRlF6uVmfsm7YSZYsC1MP7zvhPzslp4FNaYrpmf9PHXKXilazZt9Sf3e
 swvzX9VsO6/Y1bJB22/hIlkf+w1+0pmVDG4+WdMjb7fYr/eOM3ScHnW4dcqy2Jz6PzP9XR/F
 vSy6Jx65bwnP8V1/z9nNn6dnGGhg4rBQ56TUERnX2Ci7cOf51++v6Aw9taLs/bdi7p1S3ZGd
 09kkhG0VG/WvpCg+XXHrk17dMofkYKVXf4PXfmK7e+IVu+qbjZ7sq78+fcv/4clWlniJ7JjQ
 xtDyXwyc+m2GVxifuDIsEfjMlBz4WtK9Z/6/042HA0xnnPnnPfHu5c2bdp3ss0vWiRY9ntDy
 9w+vqxJLcUaioRZzUXEiAJnPXcA9AwAA
X-CMS-MailID: 20201103083912epcas1p45295a663daa3b70c7d3b3bad96fe1765
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201030125221eucas1p14e525f75c4b8dadae04144ce7684d776
References: <CGME20201030125221eucas1p14e525f75c4b8dadae04144ce7684d776@eucas1p1.samsung.com>
 <20201030125149.8227-1-s.nawrocki@samsung.com>
 <b586c2b7-9ca1-e641-b70c-27493ffd05e0@samsung.com>
 <9285e2d4-f2fa-92f2-ba25-832f32f77d78@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org, sw0312.kim@samsung.com, a.swigon@samsung.com,
 robh+dt@kernel.org, linux-kernel@vger.kernel.org, myungjoo.ham@samsung.com,
 krzk@kernel.org, m.szyprowski@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Georgi,

On 11/3/20 5:29 PM, Georgi Djakov wrote:
> Hi Chanwoo and Sylwester,
> 
> On 11/3/20 09:54, Chanwoo Choi wrote:
>> Hi Sylwester,
>>
>> When I tested this patchset on Odroid-U3,
>> After setting 0 bps by interconnect[1][2],
>> the frequency of devfreq devs sustain the high frequency
>> according to the pm qos request.
>>
>> So, I try to find the cause of this situation.
>> In result, it seems that interconnect exynos driver
>> updates the pm qos request to devfreq device
>> during the kernel booting. Do you know why the exynos
>> interconnect driver request the pm qos during probe
>> without the mixer request?
> 
> That's probably because of the sync_state support, that was introduced
> recently. The icc_sync_state callback needs to be added to the driver
> (i just left a comment on that patch), and then check again if it works.
> 
> The idea of the sync_state is that there could be multiple users of a
> path and we must wait for all consumers to tell their bandwidth needs.
> Otherwise the first consumer may lower the bandwidth or disable a path
> needed for another consumer (driver), which has not probed yet. So we
> maintain a floor bandwidth until everyone has probed. By default the floor
> bandwidth is INT_MAX, but can be overridden by implementing the get_bw()
> callback.

Thanks for guide. I tested it with your comment of patch2.
It is well working without problem as I mentioned previously.

I caught the reset operation of PM QoS requested from interconnect
on kernel log. In result, after completed the kernel booting,
there is no pm qos request if hdmi cable is not connected.

[Test Result]
1. Set 622080 Bps with HDMI cable

root@localhost:~# cat /sys/kernel/debug/devfreq/devfreq_summary;
dev                            parent_dev                     governor        timer      polling_ms  cur_freq_Hz  min_freq_Hz  max_freq_Hz
------------------------------ ------------------------------ --------------- ---------- ---------- ------------ ------------ ------------
soc:bus_dmc                    null                           simple_ondemand deferrable         50    400000000    155520000    400000000
soc:bus_acp                    soc:bus_dmc                    passive         null                0    267000000    100000000    267000000
soc:bus_c2c                    soc:bus_dmc                    passive         null                0    400000000    100000000    400000000
soc:bus_leftbus                null                           simple_ondemand deferrable         50    200000000    100000000    200000000
soc:bus_rightbus               soc:bus_leftbus                passive         null                0    200000000    100000000    200000000
soc:bus_display                soc:bus_leftbus                passive         null                0    200000000    160000000    200000000
soc:bus_fsys                   soc:bus_leftbus                passive         null                0    134000000    100000000    134000000
soc:bus_peri                   soc:bus_leftbus                passive         null                0    100000000     50000000    100000000
soc:bus_mfc                    soc:bus_leftbus                passive         null                0    200000000    100000000    200000000
root@localhost:~# cat /sys/kernel/debug/interconnect/interconnect_graph;
digraph {
        rankdir = LR
        node [shape = record]
        subgraph cluster_1 {
                label = "soc:bus_dmc"
                "2:bus_dmc" [label="2:bus_dmc
                        |avg_bw=622080kBps
                        |peak_bw=622080kBps"]
        }
        subgraph cluster_2 {
                label = "soc:bus_leftbus"
                "3:bus_leftbus" [label="3:bus_leftbus
                        |avg_bw=622080kBps
                        |peak_bw=622080kBps"]
        }
        subgraph cluster_3 {
                label = "soc:bus_display"
                "4:bus_display" [label="4:bus_display
                        |avg_bw=622080kBps
                        |peak_bw=622080kBps"]
        }
        "3:bus_leftbus" -> "2:bus_dmc"
        "4:bus_display" -> "3:bus_leftbus"
}root@localhost:~# cat /sys/kernel/debug/interconnect/interconnect_summary;
 node                                  tag          avg         peak
--------------------------------------------------------------------
bus_dmc                                          622080       622080
  12c10000.mixer                         0       622080       622080
bus_leftbus                                      622080       622080
  12c10000.mixer                         0       622080       622080
bus_display                                      622080       622080
  12c10000.mixer                         0       622080       622080



2. Set 0Bps without HDMI cable
root@localhost:~# cat /sys/kernel/debug/devfreq/devfreq_summary;
dev                            parent_dev                     governor        timer      polling_ms  cur_freq_Hz  min_freq_Hz  max_freq_Hz
------------------------------ ------------------------------ --------------- ---------- ---------- ------------ ------------ ------------
soc:bus_dmc                    null                           simple_ondemand deferrable         50    100000000    100000000    400000000
soc:bus_acp                    soc:bus_dmc                    passive         null                0    100000000    100000000    267000000
soc:bus_c2c                    soc:bus_dmc                    passive         null                0    100000000    100000000    400000000
soc:bus_leftbus                null                           simple_ondemand deferrable         50    100000000    100000000    200000000
soc:bus_rightbus               soc:bus_leftbus                passive         null                0    100000000    100000000    200000000
soc:bus_display                soc:bus_leftbus                passive         null                0    160000000    160000000    200000000
soc:bus_fsys                   soc:bus_leftbus                passive         null                0    100000000    100000000    134000000
soc:bus_peri                   soc:bus_leftbus                passive         null                0     50000000     50000000    100000000
soc:bus_mfc                    soc:bus_leftbus                passive         null                0    100000000    100000000    200000000
root@localhost:~# cat /sys/kernel/debug/interconnect/interconnect_graph;
digraph {
        rankdir = LR
        node [shape = record]
        subgraph cluster_1 {
                label = "soc:bus_dmc"
                "2:bus_dmc" [label="2:bus_dmc
                        |avg_bw=0kBps
                        |peak_bw=0kBps"]
        }
        subgraph cluster_2 {
                label = "soc:bus_leftbus"
                "3:bus_leftbus" [label="3:bus_leftbus
                        |avg_bw=0kBps
                        |peak_bw=0kBps"]
        }
        subgraph cluster_3 {
                label = "soc:bus_display"
                "4:bus_display" [label="4:bus_display
                        |avg_bw=0kBps
                        |peak_bw=0kBps"]
        }
        "3:bus_leftbus" -> "2:bus_dmc"
        "4:bus_display" -> "3:bus_leftbus"
}root@localhost:~# cat /sys/kernel/debug/interconnect/interconnect_summary;
 node                                  tag          avg         peak
--------------------------------------------------------------------
bus_dmc                                               0            0
  12c10000.mixer                         0            0            0
bus_leftbus                                           0            0
  12c10000.mixer                         0            0            0
bus_display                                           0            0
  12c10000.mixer                         0            0            0


Thanks,
Chanwoo Choi

> 
> Thanks,
> Georgi
> 
>>
>> PS. The passive governor has a bug related to PM_QOS interface.
>> So, I posted the patch[4].
>>
>>
>> [1] interconnect_graph
>> root@localhost:~# cat /sys/kernel/debug/interconnect/interconnect_graph 
>> digraph {
>>         rankdir = LR
>>         node [shape = record]
>>         subgraph cluster_1 {
>>                 label = "soc:bus_dmc"
>>                 "2:bus_dmc" [label="2:bus_dmc
>>                         |avg_bw=0kBps
>>                         |peak_bw=0kBps"]
>>         }
>>         subgraph cluster_2 {
>>                 label = "soc:bus_leftbus"
>>                 "3:bus_leftbus" [label="3:bus_leftbus
>>                         |avg_bw=0kBps
>>                         |peak_bw=0kBps"]
>>         }
>>         subgraph cluster_3 {
>>                 label = "soc:bus_display"
>>                 "4:bus_display" [label="4:bus_display
>>                         |avg_bw=0kBps
>>                         |peak_bw=0kBps"]
>>         }
>>         "3:bus_leftbus" -> "2:bus_dmc"
>>         "4:bus_display" -> "3:bus_leftbus"
>>
>>
>> [2] interconnect_summary
>> root@localhost:~# cat /sys/kernel/debug/interconnect/interconnect_summary 
>>  node                                  tag          avg         peak
>> --------------------------------------------------------------------
>> bus_dmc                                               0            0
>>   12c10000.mixer                         0            0            0
>> bus_leftbus                                           0            0
>>   12c10000.mixer                         0            0            0
>> bus_display                                           0            0
>>   12c10000.mixer                         0            0            0
>>
>>
>> [3] devfreq_summary
>> root@localhost:~# cat /sys/kernel/debug/devfreq/devfreq_summary 
>> dev                            parent_dev                     governor        timer      polling_ms  cur_freq_Hz  min_freq_Hz  max_freq_Hz
>> ------------------------------ ------------------------------ --------------- ---------- ---------- ------------ ------------ ------------
>> soc:bus_dmc                    null                           simple_ondemand deferrable         50    400000000    400000000    400000000
>> soc:bus_acp                    soc:bus_dmc                    passive         null                0    267000000    100000000    267000000
>> soc:bus_c2c                    soc:bus_dmc                    passive         null                0    400000000    100000000    400000000
>> soc:bus_leftbus                null                           simple_ondemand deferrable         50    200000000    200000000    200000000
>> soc:bus_rightbus               soc:bus_leftbus                passive         null                0    200000000    100000000    200000000
>> soc:bus_display                soc:bus_leftbus                passive         null                0    200000000    200000000    200000000
>> soc:bus_fsys                   soc:bus_leftbus                passive         null                0    134000000    100000000    134000000
>> soc:bus_peri                   soc:bus_leftbus                passive         null                0    100000000     50000000    100000000
>> soc:bus_mfc                    soc:bus_leftbus                passive         null                0    200000000    100000000    200000000
>>
>>
>> [4] PM / devfreq: passive: Update frequency when start governor
>> https://patchwork.kernel.org/project/linux-pm/patch/20201103070646.18687-1-cw00.choi@samsung.com/
>>
>>
> 
> 


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
