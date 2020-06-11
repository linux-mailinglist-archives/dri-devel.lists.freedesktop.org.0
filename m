Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EF11F82AD
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jun 2020 12:18:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D44816E42D;
	Sat, 13 Jun 2020 10:17:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 568 seconds by postgrey-1.36 at gabe;
 Thu, 11 Jun 2020 11:20:38 UTC
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C44636E8F7
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 11:20:38 +0000 (UTC)
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20200611111107epoutp01ca942a75e0b131e92f6447f247d3dd9e~XeNlJyC3E0188401884epoutp014
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 11:11:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20200611111107epoutp01ca942a75e0b131e92f6447f247d3dd9e~XeNlJyC3E0188401884epoutp014
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1591873867;
 bh=m5J+ghZMJqGOXBmy3eWSpEpm7qa5DnNLLLRwQ72pHow=;
 h=From:To:Cc:Subject:Date:References:From;
 b=i7mTdp8Xns87CfUNeM83Z8EvUm5EgoaBTkT9Ud0y0YcrlLFau0FRP6AqqNN9oRdQK
 OANkSFxh3G5dMYq+2Ct/0cBDM0CvcIIGRpnjIpzTFzEUTuWVzcuC5osX5GySwpyFCW
 x66UWBzRyrdVym/n46IE/xiHAf3OybfD379c4GGA=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTP id
 20200611111107epcas2p4bb292c4c64c2ecc2819859a3055a7032~XeNkvu3B11259312593epcas2p4s;
 Thu, 11 Jun 2020 11:11:07 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.40.188]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 49jLkx5FfKzMqYlx; Thu, 11 Jun
 2020 11:11:05 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
 epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 67.7F.27013.74112EE5; Thu, 11 Jun 2020 20:11:03 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
 20200611111103epcas2p3b454a6086d4eab9c03a6eb58635d2357~XeNgtmFIh0129101291epcas2p3L;
 Thu, 11 Jun 2020 11:11:03 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200611111103epsmtrp15da611433d670aa1d1c5fcb42fb26550~XeNgs5vPW2149021490epsmtrp1I;
 Thu, 11 Jun 2020 11:11:03 +0000 (GMT)
X-AuditID: b6c32a48-d35ff70000006985-38-5ee21147b134
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 50.B4.08382.74112EE5; Thu, 11 Jun 2020 20:11:03 +0900 (KST)
Received: from Dabang.dsn.sec.samsung.com (unknown [12.36.155.59]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200611111102epsmtip10637ec99eba10fe6a80a9890ad26a72b~XeNgiaJRZ1633816338epsmtip1u;
 Thu, 11 Jun 2020 11:11:02 +0000 (GMT)
From: Hyesoo Yu <hyesoo.yu@samsung.com>
To: 
Subject: [PATCH] dma-buf: support to walk the list of dmabuf for debug
Date: Thu, 11 Jun 2020 20:28:41 +0900
Message-Id: <20200611112842.23636-1-hyesoo.yu@samsung.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrJKsWRmVeSWpSXmKPExsWy7bCmma674KM4gyXd6hZXvr5ns/jbeYHV
 4suVh0wWl3fNYbPo2bCV1eLU3c/sDmwed67tYfO4332cyeP2v8fMHn1bVjF6fN4kF8AalWOT
 kZqYklqkkJqXnJ+SmZduq+QdHO8cb2pmYKhraGlhrqSQl5ibaqvk4hOg65aZA3SBkkJZYk4p
 UCggsbhYSd/Opii/tCRVISO/uMRWKbUgJafA0LBArzgxt7g0L10vOT/XytDAwMgUqDIhJ2PD
 lJ2MBS8EK+bMzWpgfMTXxcjJISFgIjHt5R5mEFtIYAejxMld7l2MXED2J0aJu18WskM43xgl
 Fn5+wQLTsfh4LzNEYi+jxKlfu6GqvjNKHGn8wAhSxSagLnFiyzIwW0SARWLl9+8sIEXMAucZ
 Jd5dnQWU4OAQFnCTWNVqBlLDIqAqMXfKSrANvAJWEr8+7WSD2CYvMXH2XUaIuKDEyZlPwGqY
 geLNW2eDXSEhcIxdov3fNEaIBheJuwfesULYwhKvjm9hh7ClJF72t0HZ5RJnWx6xQjS3MEpc
 nHYVapuxxKxn7WDHMQtoSqzfpQ9iSggoSxy5BbWXT6Lj8F92iDCvREebEESjssT+ZfOgASQp
 8WhtOytEiYdE46NoSOjGSny9MZN1AqP8LCTPzELyzCyEtQsYmVcxiqUWFOempxYbFZggR+km
 RnAa1PLYwTj77Qe9Q4xMHIyHGCU4mJVEeAXFH8YJ8aYkVlalFuXHF5XmpBYfYjQFBu9EZinR
 5HxgIs4riTc0NTIzM7A0tTA1M7JQEud9Z3UhTkggPbEkNTs1tSC1CKaPiYNTqoFJZNOkuTnH
 1qW2pf5rl2M6rbnO/szt3++dl2dGsonMZT43q+vctFsX7r69cXPBjnWuuSJbfCRmhMf0fN/K
 9EpJUMWFv0Dn4yctHZbWaKPC7TZJPTOylyj3szHMy3edPWv+iefzPsz4v//C75D6IIO4c3Mf
 u9yulIrSKDszbQdXrmHokkbdtr5pgYKN1SreOxbcTKw18KlYfNbz+e8VV1btY9RtE4u7lGf5
 42T8iie+t68WRlv5/N3Xn5g/L3hes+L7zg+fF87/80r4H3P29mt/Tj9UkDLoSc35ZKt//qIe
 9/kbdVv9rVXWMtt7bfbf8UxR455D22qFy3rtW0qyfmz7mJuy23hfya3rRgUJZrZ3lViKMxIN
 tZiLihMBSl5KAQwEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBLMWRmVeSWpSXmKPExsWy7bCSnK674KM4g/YdLBZXvr5ns/jbeYHV
 4suVh0wWl3fNYbPo2bCV1eLU3c/sDmwed67tYfO4332cyeP2v8fMHn1bVjF6fN4kF8AaxWWT
 kpqTWZZapG+XwJWxYcpOxoIXghVz5mY1MD7i62Lk5JAQMJFYfLyXuYuRi0NIYDejxNfVIA5I
 QlJi1ueTTBC2sMT9liOsEEVfGSXePp3ODpJgE1CXOLFlGSOILSLAIrHy+3cWEJtZ4DKjxPFr
 pV2MHBzCAm4Sq1rNQMIsAqoSc6esBCvhFbCS+PVpJxvEfHmJibPvMkLEBSVOznwCNUZeonnr
 bOYJjHyzkKRmIUktYGRaxSiZWlCcm55bbFhgmJdarlecmFtcmpeul5yfu4kRHJhamjsYt6/6
 oHeIkYmD8RCjBAezkgivoPjDOCHelMTKqtSi/Pii0pzU4kOM0hwsSuK8NwoXxgkJpCeWpGan
 phakFsFkmTg4pRqYPJUuhFp/N7+1bS7P9b6PTquPXIhZYzkl/9xplZuO+frHPsimFf444v9k
 X8qSFt8f7YyTCjazGV0T5QmNEzU/cvm/sOGXzTt1HHtYHnsVr+Hct0LsSe5ixwvXUmIjfD0W
 TXV9ckIvVPo/d4i79hqFzVOf1yx4GJHc0yuk+Vd9gU7x+xfrF2j5XSx403Nu8WnBtfqNMjPM
 Q3Qamf//ezcrwifz++7FKWUBihdFxJZJiTIGZ1m/WNv7eu2FX/E/rnBG2X+OYL3NVeI1eyv3
 KxE/mV135aw8Gx9qb/7G8TCk0HCe7XsZp8csiR2RtV1axlJTH19ekvIt2XqZxYmKsBsfOMyS
 5D78yJzs0F47jWmhEktxRqKhFnNRcSIA8Kcrt7sCAAA=
X-CMS-MailID: 20200611111103epcas2p3b454a6086d4eab9c03a6eb58635d2357
X-Msg-Generator: CA
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200611111103epcas2p3b454a6086d4eab9c03a6eb58635d2357
References: <CGME20200611111103epcas2p3b454a6086d4eab9c03a6eb58635d2357@epcas2p3.samsung.com>
X-Mailman-Approved-At: Sat, 13 Jun 2020 10:16:46 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Hyesoo Yu <hyesoo.yu@samsung.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Let's support debugging function to show exporter
detail information. The exporter don't need to manage
the lists for debugging because all dmabuf list are
managed on dmabuf framework.

That supports to walk the dmabuf list and show the
detailed information for exporter by passed function
implemented from exporter.

That helps to show exporter detail information.
For example, ION may show the buffer flag, heap name,
or the name of process to request allocation.

Change-Id: I670f04dda4a0870081e1b0fd96b9185b48b9dd15
Signed-off-by: Hyesoo Yu <hyesoo.yu@samsung.com>
---
 drivers/dma-buf/dma-buf.c | 30 ++++++++++++++++++++++++++++++
 include/linux/dma-buf.h   |  2 ++
 2 files changed, 32 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 01ce125f8e8d..002bd3ac636e 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -1254,6 +1254,36 @@ void dma_buf_vunmap(struct dma_buf *dmabuf, void *vaddr)
 }
 EXPORT_SYMBOL_GPL(dma_buf_vunmap);
 
+int dma_buf_exp_show(struct seq_file *s,
+		     int (*it)(struct seq_file *s, struct dma_buf *dmabuf))
+{
+	int ret;
+	struct dma_buf *buf_obj;
+
+	ret = mutex_lock_interruptible(&db_list.lock);
+	if (ret)
+		return ret;
+
+	list_for_each_entry(buf_obj, &db_list.head, list_node) {
+		ret = mutex_lock_interruptible(&buf_obj->lock);
+		if (ret) {
+			seq_puts(s,
+				 "\tERROR locking buffer object: skipping\n");
+			continue;
+		}
+
+		ret = it(s, buf_obj);
+		mutex_unlock(&buf_obj->lock);
+		if (ret)
+			break;
+	}
+	mutex_unlock(&db_list.lock);
+
+	return 0;
+
+}
+EXPORT_SYMBOL_GPL(dma_buf_exp_show);
+
 #ifdef CONFIG_DEBUG_FS
 static int dma_buf_debug_show(struct seq_file *s, void *unused)
 {
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index ab0c156abee6..b5c0a10b4eb3 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -502,4 +502,6 @@ int dma_buf_mmap(struct dma_buf *, struct vm_area_struct *,
 		 unsigned long);
 void *dma_buf_vmap(struct dma_buf *);
 void dma_buf_vunmap(struct dma_buf *, void *vaddr);
+int dma_buf_exp_show(struct seq_file *s,
+		     int (*it)(struct seq_file *s, struct dma_buf *dmabuf));
 #endif /* __DMA_BUF_H__ */
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
