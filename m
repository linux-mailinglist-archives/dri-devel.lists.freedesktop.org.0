Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B30C2EAC22
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jan 2021 14:44:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 545386E101;
	Tue,  5 Jan 2021 13:44:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A8DE6E108;
 Tue,  5 Jan 2021 13:44:10 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id e25so3124585wme.0;
 Tue, 05 Jan 2021 05:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oxBOSPXdt1KE4KRfESGM7lDH9UwLyaTef5/94sYT5Lg=;
 b=k9E22mhtoYSmxWgLV32Zz/wEftwzeTRJXDbpQLK6jVSyHqR/ukMZ4xEK9wd3kGdOu3
 ApSHMRCcDOAMuT5v8n/diwEZKz24dasn4j0Q6KXvok2eOdNYIkuFsTbk2XXtKoMOGb8F
 wjxt2ShqGzrkqLnm/BnTM6jH7hbioAlEQbj0ycjfaNkwqLSI27JVHkd1dkA3xQTITzGP
 0fSOqZeiriMZIA6pHXemwgiJ3jsELV3pLdhyK+LINiPYjIffVrZQMVPTcmgcZ5dNTMTj
 iYrcNgy1+HLmpZgWq0Hq7zMYcw58K1KjWeyXmC45kjNaUT/VD2CLE+gJaDcs/N8AqDzX
 w2xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oxBOSPXdt1KE4KRfESGM7lDH9UwLyaTef5/94sYT5Lg=;
 b=FISyLyWImvc6iML88xZxfchK0L4TKUDg69nTYXqToZ7VvStaKS4g3qWXpR1OUuJtxf
 GeBPdO6e3e+ehbh7CQzdDylr4fPp6zX8AJ9Srm/LjeuZr5WHOQ6lFGvpIvbdS61+h1eV
 7f2b4C3K/iKvf1soFC0Do6JukpvVWSu7bZX5yHMSUhWJECjqjTm55iwxKjIyP5ZMpRFj
 LIGH2HECY+Q6hj9M+tvh8IpwQwjGUxdqTNYAsFS0q673Ovd7X/T2opm0yJMiAXjyZ+kk
 38ziKP4O/PtYgGwefhMZfLmZL+F9DeJlHArXEtE1iY48Yxf1HqD5nIwaW4yV0TGLjutI
 VNBw==
X-Gm-Message-State: AOAM531RA68M9pe36cRkP1QbC/ikywkVBcFavRqCR4uHK8hXxS3RRiM/
 nK7ZOJGhqCjAndap5n0z40w=
X-Google-Smtp-Source: ABdhPJzEQpuZDGSyAKMlkTFO1nHHUn6kxF5BqQSJS9BhEdjJ9giJfYIF4nCODnMfgKaEKi9Q8gXe7A==
X-Received: by 2002:a1c:e10b:: with SMTP id y11mr3636179wmg.65.1609854249584; 
 Tue, 05 Jan 2021 05:44:09 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:3137:60b9:8d8f:7f55])
 by smtp.gmail.com with ESMTPSA id l20sm102191243wrh.82.2021.01.05.05.44.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 05:44:09 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: bhelgaas@google.com
Subject: [PATCH 1/4] pci: export pci_rebar_get_possible_sizes
Date: Tue,  5 Jan 2021 14:44:01 +0100
Message-Id: <20210105134404.1545-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210105134404.1545-1-christian.koenig@amd.com>
References: <20210105134404.1545-1-christian.koenig@amd.com>
MIME-Version: 1.0
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
Cc: devspam@moreofthesa.me.uk, linux-pci@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Darren Salt <devspam@moreofthesa.me.uk>

This is to assist driver modules which do BAR resizing.

Signed-off-by: Darren Salt <devspam@moreofthesa.me.uk>
---
 drivers/pci/pci.c   | 1 +
 drivers/pci/pci.h   | 1 -
 include/linux/pci.h | 1 +
 3 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index e578d34095e9..ef80ed451415 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -3579,6 +3579,7 @@ u32 pci_rebar_get_possible_sizes(struct pci_dev *pdev, int bar)
 	pci_read_config_dword(pdev, pos + PCI_REBAR_CAP, &cap);
 	return (cap & PCI_REBAR_CAP_SIZES) >> 4;
 }
+EXPORT_SYMBOL(pci_rebar_get_possible_sizes);
 
 /**
  * pci_rebar_get_current_size - get the current size of a BAR
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index f86cae9aa1f4..640ae7d74fc3 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -608,7 +608,6 @@ int acpi_get_rc_resources(struct device *dev, const char *hid, u16 segment,
 			  struct resource *res);
 #endif
 
-u32 pci_rebar_get_possible_sizes(struct pci_dev *pdev, int bar);
 int pci_rebar_get_current_size(struct pci_dev *pdev, int bar);
 int pci_rebar_set_size(struct pci_dev *pdev, int bar, int size);
 static inline u64 pci_rebar_size_to_bytes(int size)
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 22207a79762c..9999040cfad9 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1226,6 +1226,7 @@ void pci_update_resource(struct pci_dev *dev, int resno);
 int __must_check pci_assign_resource(struct pci_dev *dev, int i);
 int __must_check pci_reassign_resource(struct pci_dev *dev, int i, resource_size_t add_size, resource_size_t align);
 void pci_release_resource(struct pci_dev *dev, int resno);
+u32 pci_rebar_get_possible_sizes(struct pci_dev *pdev, int bar);
 int __must_check pci_resize_resource(struct pci_dev *dev, int i, int size);
 int pci_select_bars(struct pci_dev *dev, unsigned long flags);
 bool pci_device_is_present(struct pci_dev *pdev);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
