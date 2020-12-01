Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1E52C9692
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 05:43:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7DDF89C0D;
	Tue,  1 Dec 2020 04:42:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52FE389C0D
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 04:42:58 +0000 (UTC)
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20201201044255epoutp04f48958a32b1cadf514f5beb276fc2ae0~MfhBkz_zb2549525495epoutp041
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 04:42:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20201201044255epoutp04f48958a32b1cadf514f5beb276fc2ae0~MfhBkz_zb2549525495epoutp041
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1606797775;
 bh=18SaJaUnsne8hTcyft4kfCXmpIn437aEwoES1PGlRvg=;
 h=From:To:Cc:Subject:Date:References:From;
 b=Rp4nOVH7dD0wf17z3+jSlH00L6o8DJ6S8lPdqjpNNkUzea5b7U6zxtI+nvh4KybCM
 kYd7Mjs31RVl+VTO202YXn5rN/mFAvKMAZPoAwX1wbhSwq0mDpdmale0ito5H+/Vm3
 RsUpXiqpjUN5gHQ7HX5oI1P0LvnPSE8BdyaJ3rf8=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20201201044255epcas1p142edb8324fa20f96e77225ad63f2f52e~MfhBZkiP52308723087epcas1p1W;
 Tue,  1 Dec 2020 04:42:55 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.153]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4ClTx81NhXzMqYkf; Tue,  1 Dec
 2020 04:42:52 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 4C.F0.09582.7C9C5CF5; Tue,  1 Dec 2020 13:42:48 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20201201044247epcas1p321782889404edc13c2a8bdea2800e9a0~Mfg5yjJJR1184611846epcas1p3L;
 Tue,  1 Dec 2020 04:42:47 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20201201044247epsmtrp2f027e444b6098e4a25c7425741a0bd8c~Mfg5x5Eix1672316723epsmtrp24;
 Tue,  1 Dec 2020 04:42:47 +0000 (GMT)
X-AuditID: b6c32a37-8afff7000000256e-aa-5fc5c9c7bed0
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 87.A6.13470.7C9C5CF5; Tue,  1 Dec 2020 13:42:47 +0900 (KST)
Received: from localhost.localdomain (unknown [10.113.221.211]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20201201044247epsmtip1cbbab507383b55f817b5c8b9f6aaac67~Mfg5k713A0263202632epsmtip1s;
 Tue,  1 Dec 2020 04:42:47 +0000 (GMT)
From: Inki Dae <inki.dae@samsung.com>
To: airlied@linux.ie
Subject: [GIT PULL] exynos-drm-next
Date: Tue,  1 Dec 2020 13:50:27 +0900
Message-Id: <1606798227-31967-1-git-send-email-inki.dae@samsung.com>
X-Mailer: git-send-email 2.7.4
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrCKsWRmVeSWpSXmKPExsWy7bCmru6Jk0fjDS4cYrToPXeSyeLK1/ds
 FjPO72NyYPbY/u0Bq8f97uNMHp83yQUwR2XbZKQmpqQWKaTmJeenZOal2yp5B8c7x5uaGRjq
 GlpamCsp5CXmptoqufgE6Lpl5gAtUlIoS8wpBQoFJBYXK+nb2RTll5akKmTkF5fYKqUWpOQU
 WBboFSfmFpfmpesl5+daGRoYGJkCFSZkZ8yePYOl4BZXxdMzu9kaGL9xdDFyckgImEj83juX
 tYuRi0NIYAejxNfHi5kgnE+MEnu2bWaEcL4xSvw7/JwZpuXJziMsEIm9QIlPE6BavjBKrFv0
 ng2kik1AVWLiivtgtoiAiMTxZX/BbGYBN4k/S8+ygNjCAsoSu6/vYwWxWYDqN0xYCbaBV8BF
 4u7uRWwQ2+Qkbp7rZAZZICHQzC4xs+EwO0TCReLDy/VQRcISr45vgYpLSXx+t5cNqoFRYuKM
 00wQTgejxN3H11kgqowl9i+dDJTgADpJU2L9Ln2IsKLEzt9zGSEu5ZN497WHFaREQoBXoqNN
 CKJESeLYxRuMELaExIUlE6Fu8JA48H0VWFxIIFai8+ta5gmMsrMQFixgZFzFKJZaUJybnlps
 WGCMHE+bGMHJR8t8B+O0tx/0DjEycTAeYpTgYFYS4WX5dyReiDclsbIqtSg/vqg0J7X4EKMp
 MMQmMkuJJucD019eSbyhqZGxsbGFiaGZqaGhkjjvH+2OeCGB9MSS1OzU1ILUIpg+Jg5OqQam
 Lbt90udesU1en2N8JJJnxvbM/Z/+N9jlL6w/18yhmn1sRstzjw1aTK8q++e9PHx058RHjd5H
 e7XNUnXemp0X/f/j+o7Wrrsz7LtMfu+/GPGm5+jBC2t3f9Lf7M71OvayiZ74NrVN4Tt/zzi3
 1+kKy1TRvXeuP//Xo7hon6Tf5urprlU67edflCdm773wqGgnD7dCzeOIymv8n/RYNe4+3dy+
 YyNrZVrsg8k87ukiVYfCN39IfbV6Zs7GC3Mfi967Iia02zjtWG1anXFvzcr13Ck2yvNycv5d
 t5R68X2OxjHXhQfW+327ke3TeVPpms1OEaeFvR4L0m1qYsQWHVqjZrn4oU+ZWtdHmd15vQ4V
 bkosxRmJhlrMRcWJAA0yvH/HAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrHJMWRmVeSWpSXmKPExsWy7bCSnO7xk0fjDSb/kLLoPXeSyeLK1/ds
 FjPO72NyYPbY/u0Bq8f97uNMHp83yQUwR3HZpKTmZJalFunbJXBlzJ49g6XgFlfF0zO72RoY
 v3F0MXJySAiYSDzZeYSli5GLQ0hgN6PE7P5pQA4HUEJCYstWDghTWOLw4WKQciGBT4wSK5Yl
 g9hsAqoSE1fcZwOxRQREJI4v+wtmMwt4SLzfs5odxBYWUJbYfX0fK4jNAlS/YcJKZhCbV8BF
 4u7uRWwQJ8hJ3DzXyTyBkWcBI8MqRsnUguLc9NxiwwLDvNRyveLE3OLSvHS95PzcTYzgINDS
 3MG4fdUHvUOMTByMhxglOJiVRHhZ/h2JF+JNSaysSi3Kjy8qzUktPsQozcGiJM57o3BhnJBA
 emJJanZqakFqEUyWiYNTqoHp1M2y9qOflGLtwidtefx7f7zfsZtXNhilPYn+qq61/7B8w9e9
 547tPik1JVbY7GLukvhV6Tl+/UZfeLYmRGfxqltv3fVyZylLj+VhL9NrH9SFOfm87tybW3JX
 LC5mtYn9nl0ljJ0cDP9e3yqZyzE7wnJ3Jeu8k0v/Oh71qxU6aeX3VeMrd8Caz8qdqltYO/ov
 tdzznr1gew3HOZNrrp+eHExgLzvZqxViG1hRve/0u+8u7l8uHplxxFnrWuraXb1uRYJpmzn7
 X6jFPJnKZfe35K4v472GtzPt2b9xr+dXarEOMTvNcMbryYxeT9+w94dbznH/+hotnM6rraD3
 trN13gyXxY+qPjI+41D7rHlKiaU4I9FQi7moOBEATu41fnECAAA=
X-CMS-MailID: 20201201044247epcas1p321782889404edc13c2a8bdea2800e9a0
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201201044247epcas1p321782889404edc13c2a8bdea2800e9a0
References: <CGME20201201044247epcas1p321782889404edc13c2a8bdea2800e9a0@epcas1p3.samsung.com>
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
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave,

   Just a new mode support for HDMI and two clenups.

   Please kindly let me know if there is any problem.

Thanks,
Inki Dae


The following changes since commit 22f8c80566c4a29a0d8b5ebf24aa1fd1679b39e5:

  Merge tag 'drm-misc-next-2020-11-18' of ssh://git.freedesktop.org/git/drm/drm-misc into drm-next (2020-11-27 09:36:33 +1000)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-next-for-v5.11

for you to fetch changes up to e11e6df2a86779cfc73c4fb2e957ff7a70d89f68:

  drm/exynos: use exynos_dsi as drvdata (2020-12-01 11:38:29 +0900)

----------------------------------------------------------------
Add a new mode support for HDMI
- support for 1920x1200x60Hz mode.

Cleanups
- Drop in_bridge_node from exynos_dsi
- Use a exynos_dsi object instead of a encoder object as drvdata.

----------------------------------------------------------------
Marek Szyprowski (1):
      drm/exynos/hdmi: add support for 1920x1200@60Hz mode

Michael Tretter (2):
      drm/exynos: remove in_bridge_node from exynos_dsi
      drm/exynos: use exynos_dsi as drvdata

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 31 ++++++++++++-------------------
 drivers/gpu/drm/exynos/exynos_hdmi.c    |  9 +++++++++
 2 files changed, 21 insertions(+), 19 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
