Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D5992B2BF
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 10:56:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11FBF10E33C;
	Tue,  9 Jul 2024 08:56:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="aY0VoWAF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 262ED10E33C
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 08:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720515391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=92rwpfULOwYA2s5GulSLICeLZXxrOACWBgizlUgjv3k=;
 b=aY0VoWAFwqssuwZvo5Sn93wZ15lFCX86HUuSGoc4g6JAErSKjFqTYgq9UGaRHGklXqUGmm
 nEVKfeXS8rtf/S5AxvSiQn1o1JbahmhyhsxNsxrM9cOS/PdpnWWVtLsU1MJikoJZRqyzQF
 sEKfMeORYl2pgGTG6a2PTClwFvxGy28=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-75-Xg-5ufZ0NJG0J6SvUaJ8AA-1; Tue, 09 Jul 2024 04:56:30 -0400
X-MC-Unique: Xg-5ufZ0NJG0J6SvUaJ8AA-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-52e9c23da78so748017e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2024 01:56:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720515388; x=1721120188;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mZo3i4FrLDziFrzuVJBLT1zQ9UdyZZW5nDEeprPuspY=;
 b=CE/9Yva/UHuwsxEtljet+pCqMikKi3oDAcWRLAv6U8UFfequXY1WLIf9VzsgbQkXOu
 fh0cFT+OQ6ewneyxIsWFnUn0TFo8RNq5Vy7mTdyTKxUB8jRMEQiBjjLYf/vw7B4VAtDJ
 kU8OeGaaTKCFp9VEETjMpA6/oVS22eiG55HuOn3jWCjyfq9ykJOb0t+D6rXz5XjOhyaH
 gp5QLkNbb2FhlhBt1+uSL90NkCfXL3guDmET9fWm9Jo289ytZb2n/ZJrAy/vWvlMyR3b
 JfWeX5N1bFJxDiR02vobeMseA7Bi3dkAJ5GOxU8Em0RGCqo7RXLeR9MHO2G2dJxDjl9k
 IN1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZnmPLzpSy/nUgaYeZPIarEkpYy2s5PVLqWcQkI6Xb4iBlfhXHDlOCj/HUd+y43GGLME3UHzJvCGq9SK95vT2MxL8JCzlU7L+Httjvqjv6
X-Gm-Message-State: AOJu0YzGaHXb7Tr4l2w3soNGD1DOUacTVfn2jKzRspH1aymjGWUv/Shg
 jG1DTRNnXNCyp6yRdouSOYtgy9IRR1ol3iPc05KsbInTFNPnQ5FO4wL65tFpQWspto7vjQBUFY8
 8eJu98l6u0tyU9mQGRkGnf06+jVffeYNJwA6UwMpPj8+q4ntz2lMdvsRA0Xg0y4LgVA==
X-Received: by 2002:a2e:a594:0:b0:2ec:4287:26ac with SMTP id
 38308e7fff4ca-2eeb3191af2mr13488581fa.4.1720515388754; 
 Tue, 09 Jul 2024 01:56:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJFO85FdSpN/tGtIniVZthBrr5afzWmwuyHHpTqaBS39B1vWHCFm7f/iojSiOOVOD1vzLidg==
X-Received: by 2002:a2e:a594:0:b0:2ec:4287:26ac with SMTP id
 38308e7fff4ca-2eeb3191af2mr13488161fa.4.1720515387987; 
 Tue, 09 Jul 2024 01:56:27 -0700 (PDT)
Received: from pstanner-thinkpadt14sgen1.remote.csb
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4266f741624sm29991115e9.41.2024.07.09.01.56.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 01:56:27 -0700 (PDT)
Message-ID: <426645d40776198e0fcc942f4a6cac4433c7a9aa.camel@redhat.com>
Subject: Re: [PATCH v9 10/13] PCI: Give pci_intx() its own devres callback
From: Philipp Stanner <pstanner@redhat.com>
To: Ashish Kalra <Ashish.Kalra@amd.com>
Cc: airlied@gmail.com, bhelgaas@google.com, dakr@redhat.com,
 daniel@ffwll.ch,  dri-devel@lists.freedesktop.org, hdegoede@redhat.com, 
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, sam@ravnborg.org, 
 tzimmermann@suse.de, thomas.lendacky@amd.com, mario.limonciello@amd.com
Date: Tue, 09 Jul 2024 10:56:26 +0200
In-Reply-To: <20240708214656.4721-1-Ashish.Kalra@amd.com>
References: <20240613115032.29098-11-pstanner@redhat.com>
 <20240708214656.4721-1-Ashish.Kalra@amd.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

From c24bd5b66e798a341caf183fb7cdbdf235502d90 Mon Sep 17 00:00:00 2001
From: Philipp Stanner <pstanner@redhat.com>
Date: Tue, 9 Jul 2024 09:45:48 +0200
Subject: [PATCH] PCI: Fix pcim_intx() recursive calls

pci_intx() calls into pcim_intx() in managed mode, i.e., when
pcim_enable_device() had been called. This recursive call causes a bug
by re-registering the device resource in the release callback.

This is the same phenomenon that made it necessary to implement some
functionality a second time, see __pcim_request_region().

Implement __pcim_intx() to bypass the hybrid nature of pci_intx() on
driver detach.

Fixes: https://lore.kernel.org/all/20240708214656.4721-1-Ashish.Kalra@amd.c=
om/
Reported-by: Ashish Kalra <Ashish.Kalra@amd.com>
Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
Hi Ashish,
I hacked down this fix that should be applyable on top.
Could you maybe have a first quick look whether this fixes the issue?
---
 drivers/pci/devres.c | 33 +++++++++++++++++++++------------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/pci/devres.c b/drivers/pci/devres.c
index 2f0379a4e58f..dcef049b72fe 100644
--- a/drivers/pci/devres.c
+++ b/drivers/pci/devres.c
@@ -408,12 +408,31 @@ static inline bool mask_contains_bar(int mask, int ba=
r)
 =09return mask & BIT(bar);
 }
=20
+/*
+ * This is a copy of pci_intx() used to bypass the problem of occuring
+ * recursive function calls due to the hybrid nature of pci_intx().
+ */
+static void __pcim_intx(struct pci_dev *pdev, int enable)
+{
+=09u16 pci_command, new;
+
+=09pci_read_config_word(pdev, PCI_COMMAND, &pci_command);
+
+=09if (enable)
+=09=09new =3D pci_command & ~PCI_COMMAND_INTX_DISABLE;
+=09else
+=09=09new =3D pci_command | PCI_COMMAND_INTX_DISABLE;
+
+=09if (new !=3D pci_command)
+=09=09pci_write_config_word(pdev, PCI_COMMAND, new);
+}
+
 static void pcim_intx_restore(struct device *dev, void *data)
 {
 =09struct pci_dev *pdev =3D to_pci_dev(dev);
 =09struct pcim_intx_devres *res =3D data;
=20
-=09pci_intx(pdev, res->orig_intx);
+=09__pcim_intx(pdev, res->orig_intx);
 }
=20
 static struct pcim_intx_devres *get_or_create_intx_devres(struct device *d=
ev)
@@ -443,7 +462,6 @@ static struct pcim_intx_devres *get_or_create_intx_devr=
es(struct device *dev)
  */
 int pcim_intx(struct pci_dev *pdev, int enable)
 {
-=09u16 pci_command, new;
 =09struct pcim_intx_devres *res;
=20
 =09res =3D get_or_create_intx_devres(&pdev->dev);
@@ -451,16 +469,7 @@ int pcim_intx(struct pci_dev *pdev, int enable)
 =09=09return -ENOMEM;
=20
 =09res->orig_intx =3D !enable;
-
-=09pci_read_config_word(pdev, PCI_COMMAND, &pci_command);
-
-=09if (enable)
-=09=09new =3D pci_command & ~PCI_COMMAND_INTX_DISABLE;
-=09else
-=09=09new =3D pci_command | PCI_COMMAND_INTX_DISABLE;
-
-=09if (new !=3D pci_command)
-=09=09pci_write_config_word(pdev, PCI_COMMAND, new);
+=09__pcim_intx(pdev, enable);
=20
 =09return 0;
 }
--=20
2.45.0

