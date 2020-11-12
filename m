Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 495FA2B0745
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 15:10:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 104986E21C;
	Thu, 12 Nov 2020 14:10:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B17A86E2E1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 14:10:54 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20201112141042euoutp02434d52e91537a66e9d0f23bf02cd655d~GyAVtFwcZ1436014360euoutp02o
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 14:10:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20201112141042euoutp02434d52e91537a66e9d0f23bf02cd655d~GyAVtFwcZ1436014360euoutp02o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1605190242;
 bh=Y8UGYXPQktNuVDpVrQPw+LqxbvaW5wF8I10yL3taz2M=;
 h=From:To:Cc:Subject:Date:References:From;
 b=OOsW2rXM8mlMH1wqXa2oxyC41Z3BE6HpRS3d/r5tpm5748oddno/joI5Fs2M3rvHK
 KjKEXHn+SMTg+WyI5KrHdjgxlxlAq/pT4Zw1iNnPS2RNPIOn2yOYNqcHYX+ZwyFUkj
 F+rIK5P6lsAVNFJYuaxPeYy/WyFdASuwWIJ/w3OE=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20201112141042eucas1p2eeada284ec969c498ac1e767c01401ce~GyAVOhRQV0207802078eucas1p2p;
 Thu, 12 Nov 2020 14:10:42 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 3F.C0.27958.2624DAF5; Thu, 12
 Nov 2020 14:10:42 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20201112141041eucas1p1a29130955afd4ec1d5d94cf17183920c~GyAUx8gtj2413224132eucas1p1Y;
 Thu, 12 Nov 2020 14:10:41 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20201112141041eusmtrp16859c0c7493f04e771cd58e726ce6c7d~GyAUxDcBG1172011720eusmtrp1G;
 Thu, 12 Nov 2020 14:10:41 +0000 (GMT)
X-AuditID: cbfec7f2-efdff70000006d36-2c-5fad426249f4
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id BE.FE.16282.1624DAF5; Thu, 12
 Nov 2020 14:10:41 +0000 (GMT)
Received: from AMDC3061.digital.local (unknown [106.120.51.75]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20201112141041eusmtip26d9bfce875c3e898a25ab50da413d3d6~GyAUBSU8z2680626806eusmtip2_;
 Thu, 12 Nov 2020 14:10:40 +0000 (GMT)
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
To: georgi.djakov@linaro.org, cw00.choi@samsung.com, inki.dae@samsung.com
Subject: [PATCH v9 0/5] Exynos: Simple QoS for exynos-bus using interconnect
Date: Thu, 12 Nov 2020 15:09:26 +0100
Message-Id: <20201112140931.31139-1-s.nawrocki@samsung.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBKsWRmVeSWpSXmKPExsWy7djP87pJTmvjDY6d5bO4P6+V0WLjjPWs
 Fte/PGe1mH/kHKvFla/v2Sym793EZjHp/gQWi/PnN7BbbHp8jdXi8q45bBafe48wWsw4v4/J
 Yu2Ru+wWtxtXsFm07j3CbnH4TTurxYzJL9kcBD02repk87hzbQ+bx/3u40wem5fUe/RtWcXo
 8XmTXABbFJdNSmpOZllqkb5dAlfGvj/nmQruaFQ8frWbqYHxk0IXIyeHhICJxMw9T1m6GLk4
 hARWMEqsfrCKEcL5wigxZdplZgjnM6PE5W+v2GBabq16zQSRWM4oseTcDoSWGR92g1WxCRhK
 9B7tA0pwcIgIeEqcbNAHqWEWaGaWaGjexAhSIyzgI3GzrxvMZhFQlXj4/QMziM0rYC1xetoj
 doht8hKrNxyAigtKnJz5hAXEZgaKN2+dDXaehEA7p8TTnrusEA0uEgc3LGWGsIUlXh3fAjVI
 RuL05B4WiIZmRome3bfZIZwJjBL3jy9ghKiylrhz7hcbyNnMApoS63fpg5gSAo4Su7eaQZh8
 EjfeCkLcwCcxadt0Zogwr0RHmxDEDBWJ36umM0HYUhLdT/6zQNgeEmvaX4KDR0ggVmL3miOM
 ExgVZiH5bBaSz2YhnLCAkXkVo3hqaXFuemqxYV5quV5xYm5xaV66XnJ+7iZGYGI7/e/4px2M
 c1991DvEyMTBeIhRgoNZSYRX2WFNvBBvSmJlVWpRfnxRaU5q8SFGaQ4WJXHeVbOBUgLpiSWp
 2ampBalFMFkmDk6pBiYu5XhBlpnh927sinkWt+SPy7E/3s9vpszdn/QzOkc+szzkyYu/y1hD
 +bf4XZ/xWfZ1UlNzHR9X++Fl11dNuH+pcEVv6PZHUx31fKP6khc8Vn9sUTrtYf5P55SsHG5/
 403r1WX4Hx/pqNuvbHnkp8aDeV5qk7b/bNV99C0lvEF2yuT9ue2pZmwRvJxeruZvT2wumN+z
 Za7Bvh+iN2+X75FwE53el5ISHtVn+i7BuLQq7pU/2+/vx3m18m+qHu3P2TVtfVmVi+Tc3tUd
 HZ0eE2v38Ln5vc94MvuLMNec1RorN6tef5nxUSH+8qkvm6/Us3koNTHdW5oXNV/4aFNc9arX
 q3OPHc3jfPzG+IPp42dKLMUZiYZazEXFiQCxL6ZV2wMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrCIsWRmVeSWpSXmKPExsVy+t/xe7qJTmvjDW780rW4P6+V0WLjjPWs
 Fte/PGe1mH/kHKvFla/v2Sym793EZjHp/gQWi/PnN7BbbHp8jdXi8q45bBafe48wWsw4v4/J
 Yu2Ru+wWtxtXsFm07j3CbnH4TTurxYzJL9kcBD02repk87hzbQ+bx/3u40wem5fUe/RtWcXo
 8XmTXABblJ5NUX5pSapCRn5xia1StKGFkZ6hpYWekYmlnqGxeayVkamSvp1NSmpOZllqkb5d
 gl7Gvj/nmQruaFQ8frWbqYHxk0IXIyeHhICJxK1Vr5m6GLk4hASWMkp8erebtYuRAyghJTG/
 RQmiRljiz7UuNoiaT4wSvQ862UASbAKGEr1H+xhBbBEBX4nVJyexgBQxC0xmlnh0uwWsSFjA
 R+JmXzdYEYuAqsTD7x+YQWxeAWuJ09MesUNskJdYveEAVFxQ4uTMJywgRzALqEusnycEEmYG
 KmneOpt5AiP/LCRVsxCqZiGpWsDIvIpRJLW0ODc9t9hIrzgxt7g0L10vOT93EyMw+rYd+7ll
 B+PKVx/1DjEycTAeYpTgYFYS4VV2WBMvxJuSWFmVWpQfX1Sak1p8iNEU6OqJzFKiyfnA+M8r
 iTc0MzA1NDGzNDC1NDNWEuc1OQLUJJCeWJKanZpakFoE08fEwSnVwMQoNEHTtUN1972Dsx4V
 LDfYIrCr7sMJ7X13Jq4xXzf786bSy3Nu/gu8dPl6UFVRtJOUsJ3bxtdHr68L85Kawc0jHcy/
 6ZenVsrlXtf1ebdiQk5a7Jsj8yChtO6mVNvafRPX35r6OoeDO51j1efD05bNqQk5oXtSx3OR
 NI+6pKL+x9e9mtdtW+X37LlQ5/SySl56tajlTA59/UZzLcXkq9InHtbVriqelBD1u2j7kxsG
 55ZPXK7sKvLkxmd+e+cc7ZeffBUSJiyKsRR0ylj4cGujxt2335RmpeQc6mkz3WmxrPNEXe2t
 6fvf1CuEf4tcfqNK6KzZY9bo8xNe9TmeylnZbe37ZE//yewJK49JF31QYinOSDTUYi4qTgQA
 bXqZ80cDAAA=
X-CMS-MailID: 20201112141041eucas1p1a29130955afd4ec1d5d94cf17183920c
X-Msg-Generator: CA
X-RootMTR: 20201112141041eucas1p1a29130955afd4ec1d5d94cf17183920c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201112141041eucas1p1a29130955afd4ec1d5d94cf17183920c
References: <CGME20201112141041eucas1p1a29130955afd4ec1d5d94cf17183920c@eucas1p1.samsung.com>
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
 krzk@kernel.org, s.nawrocki@samsung.com, linux-arm-kernel@lists.infradead.org,
 m.szyprowski@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


This patchset adds interconnect API support for the Exynos SoC "samsung,
exynos-bus" compatible devices, which already have their corresponding
exynos-bus driver in the devfreq subsystem.  Complementing the devfreq
driver with an interconnect functionality allows to ensure the QoS
requirements of devices accessing the system memory (e.g. video processing
devices) are fulfilled and allows to avoid issues like the one discussed
in thread [1].

This patch series adds implementation of the interconnect provider per each
"samsung,exynos-bus" compatible DT node, with one interconnect node per
provider.  The interconnect code which was previously added as a part of
the devfreq driver has been converted to a separate platform driver.
In the devfreq a corresponding virtual child platform device is registered.
Integration of devfreq and interconnect frameworks is achieved through
the PM QoS API.

A sample interconnect consumer for exynos-mixer is added in patch 5/5,
it is currently added only for exynos4412 and allows to address the
mixer DMA underrun error issues [1].

Changes since v8:
 - excluded from the series already applied dts patches, 
 - Co-developed-by/Signed-off-by tag corrections, Ack tags added,
 - the maintainers entry corrections adressing review comments,
 - Kconfig/Makefile improvements/corrections,
 - whitespace/indentation cleanup.

The series has been tested on Odroid U3 board. It is based on v5.10-rc1.

--
Regards,
Sylwester

Changes since v7:
 - drivers/interconnect/exynos renamed to drivers/interconnect/samsung,
 - added INTERCONNECT_SAMSUNG Kconfig symbol,
 - added missing driver sync_state callback,
 - improved the DT binding description,
 - added a patch adding maintainers entry,
 - updated comment in patch 7/7, typo fix (patch 1/7).

Changes since v6:
 - the interconnect consumer DT bindings are now used to describe dependencies
   of the interconnects (samsung,exynos-bus nodes),
 - bus-width property replaced with samsung,data-clk-ratio,
 - adaptation to recent changes in the interconnect code
   (of_icc_get_from_provider(), icc_node_add()).

Changes since v5:
 - addition of "bus-width: DT property, which specifies data width
   of the interconnect bus (patches 1...2/6),
 - addition of synchronization of the interconnect bandwidth setting
   with VSYNC (patch 6/6).

Changes since v3 [4] (v4 skipped to align with patchset [1]), detailed
changes are listed in patches:
 - conversion to a separate interconnect (platform) driver,
 - an update of the DT binding documenting new optional properties:
   #interconnect-cells, samsung,interconnect-parent in "samsung,exynos-bus"
   nodes,
 - new DT properties added to the SoC, rather than to the board specific
   files.

Changes since v2 [5]:
 - Use icc_std_aggregate().
 - Implement a different modification of apply_constraints() in
   drivers/interconnect/core.c (patch 03).
 - Use 'exynos,interconnect-parent-node' in the DT instead of
   'devfreq'/'parent', depending on the bus.
 - Rebase on DT patches that deprecate the 'devfreq' DT property.
 - Improve error handling, including freeing generated IDs on failure.
 - Remove exynos_bus_icc_connect() and add exynos_bus_icc_get_parent().

Changes since v1 [6]:
 - Rebase on coupled regulators patches.
 - Use dev_pm_qos_*() API instead of overriding frequency in
   exynos_bus_target().
 - Use IDR for node ID allocation.
 - Reverse order of multiplication and division in
   mixer_set_memory_bandwidth() (patch 07) to avoid integer overflow.


References:
[1] https://patchwork.kernel.org/patch/10861757/ (original issue)
[2] https://www.spinics.net/lists/linux-samsung-soc/msg70014.html
[3] https://www.spinics.net/lists/arm-kernel/msg810722.html
[4] https://lore.kernel.org/linux-pm/20191220115653.6487-1-a.swigon@samsung.com
[5] https://patchwork.kernel.org/cover/11054417/ (v1 of this RFC)
[6] https://patchwork.kernel.org/cover/11152595/ (v2 of this RFC)


Sylwester Nawrocki (5):
  dt-bindings: devfreq: Add documentation for the interconnect
    properties
  interconnect: Add generic interconnect driver for Exynos SoCs
  MAINTAINERS: Add entry for Samsung interconnect drivers
  PM / devfreq: exynos-bus: Add registration of interconnect child
    device
  drm: exynos: mixer: Add interconnect support

 .../devicetree/bindings/devfreq/exynos-bus.txt     |  71 +++++++-
 MAINTAINERS                                        |   8 +
 drivers/devfreq/exynos-bus.c                       |  17 ++
 drivers/gpu/drm/exynos/exynos_mixer.c              | 146 ++++++++++++++-
 drivers/interconnect/Kconfig                       |   1 +
 drivers/interconnect/Makefile                      |   1 +
 drivers/interconnect/samsung/Kconfig               |  13 ++
 drivers/interconnect/samsung/Makefile              |   4 +
 drivers/interconnect/samsung/exynos.c              | 199 +++++++++++++++++++++
 9 files changed, 450 insertions(+), 10 deletions(-)
 create mode 100644 drivers/interconnect/samsung/Kconfig
 create mode 100644 drivers/interconnect/samsung/Makefile
 create mode 100644 drivers/interconnect/samsung/exynos.c

-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
