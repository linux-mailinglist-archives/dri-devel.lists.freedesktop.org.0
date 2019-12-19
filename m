Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A94125832
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 01:03:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3146E6EAA9;
	Thu, 19 Dec 2019 00:03:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCECD6EAA9
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 00:03:32 +0000 (UTC)
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20191219000330epoutp0162ec2833958064e52a8826b1041227ab~hnNtLgHBT0288402884epoutp01O
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 00:03:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20191219000330epoutp0162ec2833958064e52a8826b1041227ab~hnNtLgHBT0288402884epoutp01O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1576713810;
 bh=8fBB6QGYPy5ReA5RF7QCokohjlPLmZAX7X63ZJd8vl4=;
 h=From:To:Cc:Subject:Date:References:From;
 b=JvWh/Ykajyc8G2pXdlYkyWfFJ4viioaR/yNC7UYPeZmFhojebeDWmyl3066Tc895k
 6Hpo/abwn2nWoqkmXgqWlS5b7LQ65F+mBrMbd4UYapk1AvEHkwzaQbX8Jz1gmZxMLA
 REqXVi6HDD7VnTrvXpCVaXVBuYEyc8mFMzlgjJN4=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20191219000329epcas1p4c46feb601ebbde135308116d56ef86f3~hnNs8Y-pJ0419304193epcas1p4q;
 Thu, 19 Dec 2019 00:03:29 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.153]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 47dXCM2QhZzMqYkV; Thu, 19 Dec
 2019 00:03:27 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 94.B9.52419.B4EBAFD5; Thu, 19 Dec 2019 09:03:23 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20191219000323epcas1p4e611fadbe0280766b75ac01af5c68587~hnNmslCs-0417204172epcas1p4d;
 Thu, 19 Dec 2019 00:03:23 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20191219000323epsmtrp1b6e57ff6af3fccff90f693a83bbccbec~hnNmsCHI61786117861epsmtrp1v;
 Thu, 19 Dec 2019 00:03:23 +0000 (GMT)
X-AuditID: b6c32a37-59fff7000001ccc3-ea-5dfabe4bbc8c
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 CE.32.06569.B4EBAFD5; Thu, 19 Dec 2019 09:03:23 +0900 (KST)
Received: from localhost.localdomain (unknown [10.113.221.211]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20191219000323epsmtip292808a3f730e320754c48f51706e5cd4~hnNmj3ZZb3112031120epsmtip2x;
 Thu, 19 Dec 2019 00:03:23 +0000 (GMT)
From: Inki Dae <inki.dae@samsung.com>
To: airlied@linux.ie
Subject: [GIT PULL] exynos-drm-fixes
Date: Thu, 19 Dec 2019 09:06:53 +0900
Message-Id: <1576714013-3788-1-git-send-email-inki.dae@samsung.com>
X-Mailer: git-send-email 2.7.4
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFKsWRmVeSWpSXmKPExsWy7bCmvq73vl+xBl9eqVj0njvJZHHl63s2
 ixnn9zE5MHts//aA1eN+93Emj8+b5AKYo7JtMlITU1KLFFLzkvNTMvPSbZW8g+Od403NDAx1
 DS0tzJUU8hJzU22VXHwCdN0yc4AWKSmUJeaUAoUCEouLlfTtbIryS0tSFTLyi0tslVILUnIK
 LAv0ihNzi0vz0vWS83OtDA0MjEyBChOyM9bf385S8I29YsaDy8wNjCfZuhg5OSQETCTW7F7K
 2MXIxSEksINRYkvPP2YI5xOjxNT2fhYI5xujRNO6o0AZDrCWru++EPG9jBKzL/yCav/CKPHm
 wnpGkLlsAqoSE1fcB9shIiAicXzZXzCbWcBN4s/Ssywgg4QFVCQOTOQDCbMAlT99v5MJxOYV
 cJZ4vuotO8R5chI3z3UyQ9g3WSX+7+WGsF0kJm45zAphC0u8Or4Fql5K4mV/G5RdLvHs3TMW
 iJtrJL7NrYAwjSUurkgBMZkFNCXW79KHKFaU2Pl7LiPEjXwS7772sEJU80p0tAlBlChJHLt4
 gxHClpC4sGQiNAg9JO5Pvg0WFxKIlXh24SzLBEbZWQgLFjAyrmIUSy0ozk1PLTYsMEaOoE2M
 4HSjZb6DccM5n0OMAhyMSjy8P1x/xQqxJpYVV+YeYpTgYFYS4b3d8TNWiDclsbIqtSg/vqg0
 J7X4EKMpMOQmMkuJJucDU2FeSbyhqZGxsbGFiaGZqaGhkjgvx4+LsUIC6YklqdmpqQWpRTB9
 TBycUg2MyY5s+v8je13jrY6XTw87culo/myb7fdcT7xLPMKbE1r9avOFb0d3/K9iOi1eUt/0
 3GTP5gX5Bx+LpU042Hhr+cUj+e6XGWUK55rNnPj0WFLY45qQ82HXo6632on+iPovvb7v7Der
 igD5lrOm9RGlqlOvJwdzqP497PPuwdvzTuVfX8REz44TU2Ipzkg01GIuKk4EAIvhA/9NAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrJJMWRmVeSWpSXmKPExsWy7bCSvK73vl+xBvcm8Fv0njvJZHHl63s2
 ixnn9zE5MHts//aA1eN+93Emj8+b5AKYo7hsUlJzMstSi/TtErgy1t/fzlLwjb1ixoPLzA2M
 J9m6GDk4JARMJLq++3YxcnIICexmlHj9zgUiLCGxZSsHhCkscfhwcRcjF1DFJ0aJOSueM4GU
 swmoSkxccZ8NxBYREJE4vuwvmM0s4CHxfs9qdpBeYQEViQMT+UDCLEDlT9/vBGvlFXCWeL7q
 LTuILSEgJ3HzXCfzBEaeBYwMqxglUwuKc9Nziw0LjPJSy/WKE3OLS/PS9ZLzczcxggNAS2sH
 44kT8YcYBTgYlXh4f7j+ihViTSwrrsw9xCjBwawkwnu742esEG9KYmVValF+fFFpTmrxIUZp
 DhYlcV75/GORQgLpiSWp2ampBalFMFkmDk6pBkaNvZ0GK2Vdqvan2nLMy2f+ft7pye3TvFzz
 5izNcZC7YmG3ew2j8qutSdrSi31MNu9nvTBzKqftppUKgmet7Dq32Hj1FlZKLJPmD5oZ6maa
 EV3m8JrR9nzEWg411tdXdTbO+6yyz/TQ7OfW863W7ynMLDvJ9vam3ibJrR+kEjm+/GvJNpAx
 nqXEUpyRaKjFXFScCAAUZ/ki/AEAAA==
X-CMS-MailID: 20191219000323epcas1p4e611fadbe0280766b75ac01af5c68587
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20191219000323epcas1p4e611fadbe0280766b75ac01af5c68587
References: <CGME20191219000323epcas1p4e611fadbe0280766b75ac01af5c68587@epcas1p4.samsung.com>
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
   Just one bug fixup which makes sure to unregister a component
   for Exynos gscaler driver.

   Please kindly let me know if there is any problem.

Thanks,
Inki Dae

The following changes since commit d1eef1c619749b2a57e514a3fa67d9a516ffa919:

  Linux 5.5-rc2 (2019-12-15 15:16:08 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-fixes-for-v5.5-rc3

for you to fetch changes up to 84c92365b20a44c363b95390ea00dfbdd786f031:

  drm/exynos: gsc: add missed component_del (2019-12-19 08:52:42 +0900)

----------------------------------------------------------------
Just one bug fixup
. Make sure to unregister a component for Exynos gscaler driver
  when the driver is removed.

----------------------------------------------------------------
Chuhong Yuan (1):
      drm/exynos: gsc: add missed component_del

 drivers/gpu/drm/exynos/exynos_drm_gsc.c | 1 +
 1 file changed, 1 insertion(+)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
