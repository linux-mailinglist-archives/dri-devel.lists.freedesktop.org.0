Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB30175308
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 06:21:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECA2C6E060;
	Mon,  2 Mar 2020 05:21:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F1A36E049
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 05:21:34 +0000 (UTC)
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20200302052132epoutp02fc4305c7e596060cbb20ffa684f99379~4ZSg1klsu0572205722epoutp02z
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 05:21:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20200302052132epoutp02fc4305c7e596060cbb20ffa684f99379~4ZSg1klsu0572205722epoutp02z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1583126492;
 bh=46U7FU8gZqtWA3A/O3G8YSmsPVOISmwZ93BWStiusDo=;
 h=From:To:Cc:Subject:Date:References:From;
 b=fh2lr15GPGDIvOHw0mABhefnfErn3EWm/7q3K9m++pPH/crfnvMfLDoVpYJvPY5RU
 kFQay9n55gRp48BroI+rNfriNZvy6ju3YRry+2uZOTKCQOWg2dQ6pxVV7b6OkDWgDR
 6DN0FF9ETBG908gH+5ZlZJaNjh2F9EuT5uXXHVkc=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200302052132epcas1p2faf1c9648f2f45967e1150ede67501c4~4ZSgrnnuO1418414184epcas1p2M;
 Mon,  2 Mar 2020 05:21:32 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.40.152]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 48W7m95QvQzMqYkq; Mon,  2 Mar
 2020 05:21:29 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 73.3F.48019.7D79C5E5; Mon,  2 Mar 2020 14:21:27 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200302052126epcas1p21d95dcf8a7e458a2332f0532cc2f6e3e~4ZSbQKrkC1172211722epcas1p2T;
 Mon,  2 Mar 2020 05:21:26 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200302052126epsmtrp17b372e373e82f0798dab0a384e6506a3~4ZSbPTtfr1145811458epsmtrp11;
 Mon,  2 Mar 2020 05:21:26 +0000 (GMT)
X-AuditID: b6c32a38-23fff7000001bb93-a0-5e5c97d74cd3
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 03.D4.06569.6D79C5E5; Mon,  2 Mar 2020 14:21:26 +0900 (KST)
Received: from localhost.localdomain (unknown [10.113.221.211]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200302052126epsmtip2a547560c39c86dc5d6cd0f31c4de63fa~4ZSbCr3-Z1188611886epsmtip2O;
 Mon,  2 Mar 2020 05:21:26 +0000 (GMT)
From: Inki Dae <inki.dae@samsung.com>
To: airlied@linux.ie
Subject: [GIT PULL] exynos-drm-fixes
Date: Mon,  2 Mar 2020 14:25:52 +0900
Message-Id: <1583126752-30477-1-git-send-email-inki.dae@samsung.com>
X-Mailer: git-send-email 2.7.4
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPKsWRmVeSWpSXmKPExsWy7bCmru716TFxBufeMFv0njvJZHHl63s2
 ixnn9zE5MHts//aA1eN+93Emj8+b5AKYo7JtMlITU1KLFFLzkvNTMvPSbZW8g+Od403NDAx1
 DS0tzJUU8hJzU22VXHwCdN0yc4AWKSmUJeaUAoUCEouLlfTtbIryS0tSFTLyi0tslVILUnIK
 LAv0ihNzi0vz0vWS83OtDA0MjEyBChOyM47MO8ZWMJGnYu+HbpYGxl6uLkYODgkBE4m9txK7
 GLk4hAR2MEps3PCXGcL5xChx4fBRdgjnG6NE26JTQA4nWEfz8rmsEIm9jBL3Ti9ng3C+MEos
 f9rMBlLFJqAqMXHFfTBbREBE4viyv2A2s4CbxJ+lZ1lAdgsLqEgcmMgHEmYBKt+4qQGshFfA
 RWLLmkPMEMvkJG6e6wQ7SULgJqvElb43UFe4SHyZdpgRwhaWeHV8C1RcSuJlfxs7REMzo8TE
 GaeZIJwORom7j6+zQFQZS+xfOpkJ5ApmAU2J9bv0IcKKEjt/z2WEOJRP4t3XHlZIIPFKdLQJ
 QZQoSRy7eANqr4TEhSUT2SBsD4mrSyEhJCQQK/Gjs5FxAqPsLIQFCxgZVzGKpRYU56anFhsW
 mCDH0iZGcOLRstjBuOeczyFGAQ5GJR7eHc+j44RYE8uKK3MPMUpwMCuJ8PpyAoV4UxIrq1KL
 8uOLSnNSiw8xmgKDbyKzlGhyPjAp5pXEG5oaGRsbW5gYmpkaGiqJ8z6M1IwTEkhPLEnNTk0t
 SC2C6WPi4JRqYNSzWsh/xEHlvU6pbtW0yZ9LTt4+phv6sp/1v0xTaFrl+ykcX/ds289i9ES/
 eq9uw+kvQk1Kye+mcD69OSXsZVAf31k/R8vudDaGZRrHPy00yDH+5D61SKxhUQan0+J4Jdt7
 C+yYDaUCY7TUGRxkm6I8zbefzazY/vr2bBYZ7ZBJ+an151KPKLEUZyQaajEXFScCAE9c/shS
 AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFJMWRmVeSWpSXmKPExsWy7bCSvO616TFxBvf3Clr0njvJZHHl63s2
 ixnn9zE5MHts//aA1eN+93Emj8+b5AKYo7hsUlJzMstSi/TtErgyjsw7xlYwkadi74dulgbG
 Xq4uRk4OCQETieblc1m7GLk4hAR2M0pc+rOKqYuRAyghIbFlKweEKSxx+HAxSLmQwCdGiSXr
 jUBsNgFViYkr7rOB2CICIhLHl/0Fs5kFPCTe71nNDtIqLKAicWAiH0iYBah846YGsBJeAReJ
 LWsOMUNcICdx81wn8wRGngWMDKsYJVMLinPTc4sNC4zyUsv1ihNzi0vz0vWS83M3MYJDQEtr
 B+OJE/GHGAU4GJV4eHc8j44TYk0sK67MPcQowcGsJMLrywkU4k1JrKxKLcqPLyrNSS0+xCjN
 waIkziuffyxSSCA9sSQ1OzW1ILUIJsvEwSnVwKjxa+PbIFbXmIkppsKHZJUdTOaXJmg+uGzQ
 vTlDMUUyuEC9QXrft1smyq/eChUXfGFdFC30aqlzKWPT+qnLOM/s8H1RrvPzwqSLZ4/rMtYc
 nzRV3k9D+2ND4J0vFyWPyBVJPX4zoyCxmmf5nEuibNeOvNWUfunb132J63rTzg33rjI5yz09
 fV6JpTgj0VCLuag4EQAas55s/QEAAA==
X-CMS-MailID: 20200302052126epcas1p21d95dcf8a7e458a2332f0532cc2f6e3e
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200302052126epcas1p21d95dcf8a7e458a2332f0532cc2f6e3e
References: <CGME20200302052126epcas1p21d95dcf8a7e458a2332f0532cc2f6e3e@epcas1p2.samsung.com>
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

   Just three fixups - fix a kernel oops and regulator warning
   at booting time, and correct to print out an error message.

   Please kindly let me know if there is any problem.

Thanks,
Inki Dae

The following changes since commit f091bf39700dd086ab244c823f389556fed0c513:

  Merge tag 'drm-intel-fixes-2020-02-27' of git://anongit.freedesktop.org/drm/drm-intel into drm-fixes (2020-02-28 12:40:49 +1000)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-fixes-for-v5.6-rc5

for you to fetch changes up to 3b6a9b19ab652efac7ad4c392add6f1235019568:

  drm/exynos: hdmi: don't leak enable HDMI_EN regulator if probe fails (2020-03-02 13:02:41 +0900)

----------------------------------------------------------------
Three fixups
- fix a kernel oops problem in case that driver is loaded as module.
- fix a regulator warning issue when I2C DDC adapter cannot be gathered.
- print out an error message only in error case excepting -EPROBE_DEFER.

----------------------------------------------------------------
Marek Szyprowski (3):
      drm/exynos: dsi: propagate error value and silence meaningless warning
      drm/exynos: dsi: fix workaround for the legacy clock name
      drm/exynos: hdmi: don't leak enable HDMI_EN regulator if probe fails

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 12 +++++++-----
 drivers/gpu/drm/exynos/exynos_hdmi.c    | 22 ++++++++++++----------
 2 files changed, 19 insertions(+), 15 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
