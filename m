Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 379193889CA
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 10:52:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C0716ECF0;
	Wed, 19 May 2021 08:51:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2BCD6ECEE
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 08:51:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5A3B560C3F;
 Wed, 19 May 2021 08:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621414311;
 bh=Xxq1uGAbMGFgeGY3ywEv0OBhOMcnDBc4Aw7rV293abg=;
 h=From:To:Cc:Subject:Date:From;
 b=HDXmH4kOj1Ffc8/2cPIVagMkwv75xN8kuE4Rn2GW4zUfWOy+/uoxuQky8Dxr9RDVR
 fVbJMLGgIq+XN+7alWCEcvtKmIWWeiFvOiQyJ9+cMJ+eSmjCj1liIls/T2ERP28sI/
 Mx2fxh/6TMjsCdbJkuDfE+YtP5rjlL4GYJEyhOZQoAdSbeHyiSWV4ePGv7ROh0zXu8
 AjzAbT5IYTV7AdlhASpd63KP0Dt2giApS3oj5J8fG1nIer7c4N9j0aGbYuzwaHItI1
 /kiR1YGrJsdKvu92/Jkc0v9EXHz/fFBf6YBUXpnf+fLICsbgPu9SeBtSBORPjhj95H
 lVUyUg6TpgwrA==
Received: by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1ljHvh-007gXv-8w; Wed, 19 May 2021 10:51:49 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 00/10] Documentation build warning fixes
Date: Wed, 19 May 2021 10:51:37 +0200
Message-Id: <cover.1621413933.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-iio@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 kvm@vger.kernel.org, alsa-devel@alsa-project.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org,
 patches@opensource.cirrus.com, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jon,

This small series contain a series of fixes for the documentation. it is
against your docs-next branch.

Three of the patches fix duplicated symbols at the ABI documents.
There are still some ABI warnings from IIO, but all but one were
already fixed at linux-next. So, hopefully, after having everything
merged, the ABI warnings will be solved.

Mauro Carvalho Chehab (10):
  docs: update sysfs-platform_profile.rst reference
  docs: vcpu-requests.rst: fix reference for atomic ops
  docs: translations/zh_CN: fix a typo at 8.Conclusion.rst
  docs: sched-bwc.rst: fix a typo on a doc name
  docs: update pin-control.rst references
  docs: virt: api.rst: fix a pointer to SGX documentation
  docs: ABI: iommu: remove duplicated definition for
    sysfs-kernel-iommu_groups
  docs: ABI: sysfs-class-backlight: unify ambient light zone nodes
  docs: ABI: sysfs-class-led-trigger-pattern: remove repeat duplication
  iio: documentation: fix a typo

 Documentation/ABI/testing/sysfs-bus-iio       |   4 +-
 .../ABI/testing/sysfs-class-backlight         | 100 ++++++++++++++++++
 .../ABI/testing/sysfs-class-backlight-adp5520 |  31 ------
 .../ABI/testing/sysfs-class-backlight-adp8860 |  37 -------
 .../sysfs-class-backlight-driver-adp8870      |  32 ------
 .../testing/sysfs-class-led-driver-el15203000 |   9 --
 .../testing/sysfs-class-led-trigger-pattern   |   3 +
 .../ABI/testing/sysfs-kernel-iommu_groups     |  12 +--
 Documentation/scheduler/sched-bwc.rst         |   2 +-
 .../zh_CN/process/8.Conclusion.rst            |   2 +-
 Documentation/virt/kvm/api.rst                |   2 +-
 Documentation/virt/kvm/vcpu-requests.rst      |   2 +-
 include/linux/device.h                        |   2 +-
 include/linux/mfd/madera/pdata.h              |   2 +-
 include/linux/pinctrl/pinconf-generic.h       |   2 +-
 include/linux/platform_profile.h              |   2 +-
 16 files changed, 117 insertions(+), 127 deletions(-)
 delete mode 100644 Documentation/ABI/testing/sysfs-class-backlight-adp5520
 delete mode 100644 Documentation/ABI/testing/sysfs-class-backlight-adp8860
 delete mode 100644 Documentation/ABI/testing/sysfs-class-backlight-driver-adp8870
 delete mode 100644 Documentation/ABI/testing/sysfs-class-led-driver-el15203000

-- 
2.31.1


