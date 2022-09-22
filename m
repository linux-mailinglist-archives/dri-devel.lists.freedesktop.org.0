Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0614B5E645B
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 15:56:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 878A310E370;
	Thu, 22 Sep 2022 13:56:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com
 [45.249.212.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8C0310E36A
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 13:54:55 +0000 (UTC)
Received: from mail02.huawei.com (unknown [172.30.67.143])
 by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4MYGv81Zg8zKNpW
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 21:52:52 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.102.38])
 by APP2 (Coremail) with SMTP id Syh0CgC3VW8qaSxjR3npBA--.17148S4;
 Thu, 22 Sep 2022 21:54:52 +0800 (CST)
From: Wei Yongjun <weiyongjun@huaweicloud.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Markuss Broks <markuss.broks@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 00/10] drm/panel: Silence no spi_device_id warnings
Date: Thu, 22 Sep 2022 14:11:53 +0000
Message-Id: <20220922141204.1823931-1-weiyongjun@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: Syh0CgC3VW8qaSxjR3npBA--.17148S4
X-Coremail-Antispam: 1UD129KBjvJXoW7CF4rZFyktr1fCF48XFyUGFg_yoW8ZrykpF
 WUJFy5Ar98JrnIkayfCan2qr13Aa1IqaySqF9rK3Wq9an7AFWUJa93GFW5Ar1DJay7A3WI
 qF9rKr1xWa4rZw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUgEb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
 6cxKx2IYs7xG6r1S6rWUM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
 vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7Cj
 xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
 0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
 6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
 Cjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCj
 c4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4
 CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1x
 MIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJV
 Cq3wCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIY
 CTnIWIevJa73UjIFyTuYvjxUrR6zUUUUU
X-CM-SenderInfo: 5zhl50pqjm3046kxt4xhlfz01xgou0bp/
X-CFilter-Loop: Reflected
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
Cc: Wei Yongjun <weiyongjun1@huawei.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Wei Yongjun <weiyongjun1@huawei.com>

SPI devices use the spi_device_id for module autoloading even on
systems using device tree.

Commit 5fa6863ba692 ("spi: Check we have a spi_device_id for each DT
compatible") added a test to check that every SPI driver has a
spi_device_id for each DT compatiable string defined by driver
and warns if the spi_device_id is missing.

This series add spi_device_id entries to silence the warnings, and
ensure driver module autoloading works.

v1 -> v2:
 - post as patch series
 - add more detail to commit message
 - format spi ids the same format as of ids
 - remove unused driver_data from spi_device_id

Wei Yongjun (10):
  drm/panel: db7430: Silence no spi_device_id warning
  drm/panel: panel-ilitek-ili9322: Silence no spi_device_id warnings
  drm/panel: innolux-ej030na: Silence no spi_device_id warning
  drm/panel: novatek,nt39016: Silence no spi_device_id warning
  drm/panel: nv3052c: Silence no spi_device_id warning
  drm/panel: s6d27a1: Silence no spi_device_id warning
  drm/panel: s6e63m0: Silence no spi_device_id warning
  drm/panel: tpg110: Silence no spi_device_id warning
  drm/panel: ws2401: Silence no spi_device_id warning
  drm/panel: y030xx067a: Silence no spi_device_id warning

 drivers/gpu/drm/panel/panel-abt-y030xx067a.c      | 7 +++++++
 drivers/gpu/drm/panel/panel-ilitek-ili9322.c      | 8 ++++++++
 drivers/gpu/drm/panel/panel-innolux-ej030na.c     | 7 +++++++
 drivers/gpu/drm/panel/panel-newvision-nv3052c.c   | 7 +++++++
 drivers/gpu/drm/panel/panel-novatek-nt39016.c     | 7 +++++++
 drivers/gpu/drm/panel/panel-samsung-db7430.c      | 7 +++++++
 drivers/gpu/drm/panel/panel-samsung-s6d27a1.c     | 7 +++++++
 drivers/gpu/drm/panel/panel-samsung-s6e63m0-spi.c | 7 +++++++
 drivers/gpu/drm/panel/panel-tpo-tpg110.c          | 7 +++++++
 drivers/gpu/drm/panel/panel-widechips-ws2401.c    | 7 +++++++
 10 files changed, 71 insertions(+)

-- 
2.34.1

