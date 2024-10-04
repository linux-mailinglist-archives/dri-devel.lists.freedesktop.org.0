Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8022C990787
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 17:31:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 802EB10EA38;
	Fri,  4 Oct 2024 15:31:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KTLr3Cf9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49CAF10EA38
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2024 15:24:36 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id
 5b1f17b1804b1-42cb7a2e4d6so23014865e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Oct 2024 08:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728055474; x=1728660274; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gBEcrk99pLwxmiJHtfJfKgyMHG/gC+Hf5TZACV40Dqc=;
 b=KTLr3Cf9PcXtgypbMqCQbLi2WXT7SRzc3JFkJT73h7XDtVQBTAvxqp95351gRu/QGy
 jzuxBta37+OY37D/6cmpXp0Q7ZDH56zTSKX0H5DG6buWh/8o8/HpXEgIfL7RiARwDa2h
 TcA5lD8vGrDDq9hGvkJVDtfsiWFSfxyXqPnKkDpkujJwl22y4WztZxuNMO2hK/nNjOSg
 eoxmBddhKq3wopF0Cv+y0gdoyap2nQ5dZWLcJLsW15aIXpKOjoZI9YJ0GdUrT7wTFxIM
 LlqUU1rFi+NhmhRw5irhlgr1oxodiU+xcloLnHDCdbI3NJptv4cCqtvhZvWyh59fF0ub
 Ypmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728055474; x=1728660274;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gBEcrk99pLwxmiJHtfJfKgyMHG/gC+Hf5TZACV40Dqc=;
 b=eofKRTEFBaZxPE2WbvWycYso/lZfois81pkGjCU+PLOufmeZhz7Ktj9RQ/hhTEriaj
 AXmCSfjFEeyGbSovE3RXS2H9b93wCYK16kbMGUD64EzeyOhIWK0yll549xDxje5JcQ+k
 z+HceexHmGajpDKK2cI+NqIh74vbKcungHdoITCCn6X5hv9c0qdEIOSDlkzBZQYPYo6I
 6/vIc8zVuVc3T7eM+QapAyUp2cop9u58yIbpHKvzFcJ/kwf/5PeB+nI/kbvonPMHf0ac
 opWQJVktLdaBKPnWrRCpzNIUsHpGpjC59vtyYjAOnjjy+fjUna4WUgCCY3u4FgPaNIb7
 J+zA==
X-Gm-Message-State: AOJu0YzAeZMlLg2yYas7ZqYL1Mm9i9PCPv7HGDvV8U7HMohpUG1CR2zB
 FvR+CR8Rv17ZSyGNJ7UHkiu1BgvqV2qizWXzs5PNUvX6U0N0DGpi
X-Google-Smtp-Source: AGHT+IGNZoBBCwh9bvJvyw0BHHpRZMKCQqvyxWnYs3vbrVfla9eIZqQ6Oj9nLBMCnSg/iAmXYFRlHg==
X-Received: by 2002:a5d:64e7:0:b0:371:c51a:3b2a with SMTP id
 ffacd0b85a97d-37d0e6d31edmr3034859f8f.4.1728055474346; 
 Fri, 04 Oct 2024 08:24:34 -0700 (PDT)
Received: from localhost.localdomain ([83.165.96.99])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d081f7103sm3466317f8f.1.2024.10.04.08.24.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Oct 2024 08:24:33 -0700 (PDT)
From: Gonzalo Silvalde Blanco <gonzalo.silvalde@gmail.com>
To: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, thomas.zimmermann@suse.de,
 Gonzalo Silvalde Blanco <gonzalo.silvalde@gmail.com>
Subject: [PATCH v2] fbdev: sstfb: Make CONFIG_FB_DEVICE optional
Date: Fri,  4 Oct 2024 17:24:29 +0200
Message-Id: <20241004152429.4329-1-gonzalo.silvalde@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <1db0e2db-97e0-492f-ba89-0a1f49ca4498@suse.de>
References: <1db0e2db-97e0-492f-ba89-0a1f49ca4498@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 04 Oct 2024 15:31:41 +0000
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

The sstfb driver currently depends on CONFIG_FB_DEVICE to create sysfs
entries and access info->dev. This patch wraps the relevant code blocks
with #ifdef CONFIG_FB_DEVICE, allowing the driver to be built and used
even if CONFIG_FB_DEVICE is not selected.

The sysfs setting only controls the VGA pass-through state and is not
required for the display to work correctly.
(See: http://vogonswiki.com/index.php/VGA_passthrough_cable
for more information.)

Tested by building with and without CONFIG_FB_DEVICE, both of which
compiled without issues.

Signed-off-by: Gonzalo Silvalde Blanco <gonzalo.silvalde@gmail.com>
---
 drivers/video/fbdev/sstfb.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/sstfb.c b/drivers/video/fbdev/sstfb.c
index f8ae54ca0cc3..8d2e9d1f8d80 100644
--- a/drivers/video/fbdev/sstfb.c
+++ b/drivers/video/fbdev/sstfb.c
@@ -716,6 +716,7 @@ static void sstfb_setvgapass( struct fb_info *info, int enable )
 	pci_write_config_dword(sst_dev, PCI_INIT_ENABLE, tmp);
 }
 
+#ifdef CONFIG_FB_DEVICE
 static ssize_t store_vgapass(struct device *device, struct device_attribute *attr,
 			const char *buf, size_t count)
 {
@@ -736,10 +737,10 @@ static ssize_t show_vgapass(struct device *device, struct device_attribute *attr
 	struct sstfb_par *par = info->par;
 	return sprintf(buf, "%d\n", par->vgapass);
 }
-
 static struct device_attribute device_attrs[] = {
 	__ATTR(vgapass, S_IRUGO|S_IWUSR, show_vgapass, store_vgapass)
 	};
+#endif
 
 static int sstfb_ioctl(struct fb_info *info, unsigned int cmd,
 			unsigned long arg)
@@ -1435,10 +1436,10 @@ static int sstfb_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	}
 
 	sstfb_clear_screen(info);
-
+#fdef CONFIG_FB_DEVICE
 	if (device_create_file(info->dev, &device_attrs[0]))
 		printk(KERN_WARNING "sstfb: can't create sysfs entry.\n");
-
+#endif
 
 	fb_info(info, "%s frame buffer device at 0x%p\n",
 		fix->id, info->screen_base);
@@ -1467,8 +1468,9 @@ static void sstfb_remove(struct pci_dev *pdev)
 
 	info = pci_get_drvdata(pdev);
 	par = info->par;
-
+#ifdef CONFIG_FB_DEVICE
 	device_remove_file(info->dev, &device_attrs[0]);
+#endif
 	sst_shutdown(info);
 	iounmap(info->screen_base);
 	iounmap(par->mmio_vbase);
-- 
2.39.5

