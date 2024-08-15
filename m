Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 211D89542F2
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 09:39:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DA1710E5BC;
	Fri, 16 Aug 2024 07:39:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kroah.com header.i=@kroah.com header.b="jWew8cyi";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="bnV2X2Ck";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 5544 seconds by postgrey-1.36 at gabe;
 Thu, 15 Aug 2024 11:22:03 UTC
Received: from fhigh4-smtp.messagingengine.com
 (fhigh4-smtp.messagingengine.com [103.168.172.155])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36DBB10E0F3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2024 11:22:03 +0000 (UTC)
Received: from phl-compute-05.internal (phl-compute-05.nyi.internal
 [10.202.2.45])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id 1E8FD1151D74;
 Thu, 15 Aug 2024 05:49:38 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-05.internal (MEProxy); Thu, 15 Aug 2024 05:49:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to; s=fm3; t=1723715378; x=1723801778; bh=FdEeSS6bn1a4+EeyUiAp0
 LL4fOJqFIrBmisl+3Lam6Y=; b=jWew8cyiFNqzqdC+EyxAjkTUHlbOyJPL7NAF6
 bX+0cbLVaf5nQkz6mdJ27IZRsa2w9gZYI3Pd30By1KKbaNDz4rF4sVWY3XO+Soq0
 3jIWoOELkM9MnNUTuFTgrh+a1vIoZ7kdSHpBRJcJDbB1PiRK2T8Y5odrWoZPXYLz
 V4q9S87v/KHEmrFnyN35AKAll6KkIQ0HXC9+65Y6W+030GsGh1NskbXAjIVfDkoW
 towNSU9uZXLzFBziOdFvtJ4BL8UIncM/FmlD65AQtzYrV7RvVSAiOdnwm0uAvgoP
 RLGUnMN03lCRt3jf691OyPFFmzArJF+gKecWkmzsf3HTFJ4qg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1723715378; x=1723801778; bh=FdEeSS6bn1a4+EeyUiAp0LL4fOJq
 FIrBmisl+3Lam6Y=; b=bnV2X2CkvMO5R6N0KNS/sJuiNB+RRQQWL8UEqxlSNXos
 D9Ht9Tpi0QOvNZP3o16R5n9CEy3itRxvRT8luyOH51XF3AH+VBQh9qUSsY8e01kf
 AYH8sO/HI0fNJoX4cSyQ5aiHA0mIwHB1bx4iyeXhrZdpL2eYXTHjkFnhWYpIfSgl
 t2n1iN8xZylhRguVVnCnYDMInw+fDA36klU8+mwxOBxBpKsy6ZA67NX+hjjcytSU
 O3UbzBkd68rj7+bNRkCwuB5XpT+A7107ToMcfbUihK/33X4FoywYqvXixMibidCV
 +QnB/yoO4y5jgugUaHhUjhlVDicz1pwZZ/S0DlOEDA==
X-ME-Sender: <xms:Mc-9ZnIY2F2245FDCPPi4Mn0HuMICWKiXahr3NdgSOBJKEJcGUeruQ>
 <xme:Mc-9ZrLwBsgFFNIA_BTB75BhrjIF1lV88yGjz_CE_MDnx88l368mfzdO4VZlGBS14
 KGrL-WefXxpln0>
X-ME-Received: <xmr:Mc-9Zvu_rJ7GpkjiHVT7WurjZCmKjzGNsa6RSRCuIXsAErrZsL6JCeW342RzIKHvTtFghTFZA4MgLPE6xDl2bPxcRzYgCpbYKPKRxDPnqOnfSIbi>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddruddtiedgvddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
 rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
 htshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfh
 rhhomhepifhrihhffhhinhcumfhrohgrhhdqjfgrrhhtmhgrnhcuoehgrhhifhhfihhnse
 hkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpefhgeffjeejhfeffeffhefhjedv
 ffdvgfffudfhgffhudelieefjeeludetvdelieenucffohhmrghinhepkhgvrhhnvghlrd
 horhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
 ghhrihhffhhinheskhhrohgrhhdrtghomhdpnhgspghrtghpthhtohepuddupdhmohguvg
 epshhmthhpohhuthdprhgtphhtthhopehsrhhinhhivhgrshdrkhgrnhgurghgrghtlhgr
 sehlihhnrghrohdrohhrghdprhgtphhtthhopegrmhgrhhgvshhhsehqthhirdhquhgrlh
 gtohhmmhdrtghomhdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdr
 khgvrhhnvghlrdhorhhgpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfh
 hrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhes
 vhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehgrhhifhhfihhnsehkrhhorg
 hhrdgtohhmpdhrtghpthhtohepshhtrggslhgvsehkvghrnhgvlhdrohhrghdprhgtphht
 thhopehquhhitggpvghkrghnghhuphhtsehquhhitghinhgtrdgtohhmpdhrtghpthhtoh
 epughmihhtrhihrdgsrghrhihshhhkohhvsehlihhnrghrohdrohhrgh
X-ME-Proxy: <xmx:Mc-9ZgasUK4O-h506OixpcqrTA-7liBCiEhtYwDhTErp3XSoqA8ReA>
 <xmx:Ms-9ZuZmsrhOQfBfasBuXSL6XEDhuztRLkWqukuu-rVpXBWq-mvzmQ>
 <xmx:Ms-9ZkAQV73dolPKiBsMZhb3DppLRgXKr-GzG1vEg175GXPoMUR6ug>
 <xmx:Ms-9Zsb8SMQshpUmswKcXYNrRolXPqNLToL7soQ9yY9XH5STpXYDzQ>
 <xmx:Ms-9ZgCz0VzyavjrrNP_pYAZZZz0v9a-fA8SFbPjJjbnoJlD06aIU8SQ>
Feedback-ID: i1d2843be:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 15 Aug 2024 05:49:36 -0400 (EDT)
From: Griffin Kroah-Hartman <griffin@kroah.com>
To: srinivas.kandagatla@linaro.org,
	amahesh@qti.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Griffin Kroah-Hartman <griffin@kroah.com>,
 stable <stable@kernel.org>, Ekansh Gupta <quic_ekangupt@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Joel Selvaraj <joelselvaraj.oss@gmail.com>
Subject: [PATCH] Revert "misc: fastrpc: Restrict untrusted app to attach to
 privileged PD"
Date: Thu, 15 Aug 2024 11:49:20 +0200
Message-ID: <20240815094920.8242-1-griffin@kroah.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 16 Aug 2024 07:39:16 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit bab2f5e8fd5d2f759db26b78d9db57412888f187.

Joel reported that this commit breaks userspace and stops sensors in
SDM845 from working. Also breaks other qcom SoC devices running postmarketOS.

Cc: stable <stable@kernel.org>
Cc: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reported-by: Joel Selvaraj <joelselvaraj.oss@gmail.com>
Link: https://lore.kernel.org/r/9a9f5646-a554-4b65-8122-d212bb665c81@umsystem.edu
Signed-off-by: Griffin Kroah-Hartman <griffin@kroah.com>
---
 drivers/misc/fastrpc.c      | 22 +++-------------------
 include/uapi/misc/fastrpc.h |  3 ---
 2 files changed, 3 insertions(+), 22 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 5204fda51da3..339d126414d4 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2085,16 +2085,6 @@ static int fastrpc_req_mem_map(struct fastrpc_user *fl, char __user *argp)
 	return err;
 }
 
-static int is_attach_rejected(struct fastrpc_user *fl)
-{
-	/* Check if the device node is non-secure */
-	if (!fl->is_secure_dev) {
-		dev_dbg(&fl->cctx->rpdev->dev, "untrusted app trying to attach to privileged DSP PD\n");
-		return -EACCES;
-	}
-	return 0;
-}
-
 static long fastrpc_device_ioctl(struct file *file, unsigned int cmd,
 				 unsigned long arg)
 {
@@ -2107,19 +2097,13 @@ static long fastrpc_device_ioctl(struct file *file, unsigned int cmd,
 		err = fastrpc_invoke(fl, argp);
 		break;
 	case FASTRPC_IOCTL_INIT_ATTACH:
-		err = is_attach_rejected(fl);
-		if (!err)
-			err = fastrpc_init_attach(fl, ROOT_PD);
+		err = fastrpc_init_attach(fl, ROOT_PD);
 		break;
 	case FASTRPC_IOCTL_INIT_ATTACH_SNS:
-		err = is_attach_rejected(fl);
-		if (!err)
-			err = fastrpc_init_attach(fl, SENSORS_PD);
+		err = fastrpc_init_attach(fl, SENSORS_PD);
 		break;
 	case FASTRPC_IOCTL_INIT_CREATE_STATIC:
-		err = is_attach_rejected(fl);
-		if (!err)
-			err = fastrpc_init_create_static_process(fl, argp);
+		err = fastrpc_init_create_static_process(fl, argp);
 		break;
 	case FASTRPC_IOCTL_INIT_CREATE:
 		err = fastrpc_init_create_process(fl, argp);
diff --git a/include/uapi/misc/fastrpc.h b/include/uapi/misc/fastrpc.h
index 91583690bddc..f33d914d8f46 100644
--- a/include/uapi/misc/fastrpc.h
+++ b/include/uapi/misc/fastrpc.h
@@ -8,14 +8,11 @@
 #define FASTRPC_IOCTL_ALLOC_DMA_BUFF	_IOWR('R', 1, struct fastrpc_alloc_dma_buf)
 #define FASTRPC_IOCTL_FREE_DMA_BUFF	_IOWR('R', 2, __u32)
 #define FASTRPC_IOCTL_INVOKE		_IOWR('R', 3, struct fastrpc_invoke)
-/* This ioctl is only supported with secure device nodes */
 #define FASTRPC_IOCTL_INIT_ATTACH	_IO('R', 4)
 #define FASTRPC_IOCTL_INIT_CREATE	_IOWR('R', 5, struct fastrpc_init_create)
 #define FASTRPC_IOCTL_MMAP		_IOWR('R', 6, struct fastrpc_req_mmap)
 #define FASTRPC_IOCTL_MUNMAP		_IOWR('R', 7, struct fastrpc_req_munmap)
-/* This ioctl is only supported with secure device nodes */
 #define FASTRPC_IOCTL_INIT_ATTACH_SNS	_IO('R', 8)
-/* This ioctl is only supported with secure device nodes */
 #define FASTRPC_IOCTL_INIT_CREATE_STATIC _IOWR('R', 9, struct fastrpc_init_create_static)
 #define FASTRPC_IOCTL_MEM_MAP		_IOWR('R', 10, struct fastrpc_mem_map)
 #define FASTRPC_IOCTL_MEM_UNMAP		_IOWR('R', 11, struct fastrpc_mem_unmap)
-- 
2.46.0

