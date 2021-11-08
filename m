Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFDA447F62
	for <lists+dri-devel@lfdr.de>; Mon,  8 Nov 2021 13:16:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFDA26E13A;
	Mon,  8 Nov 2021 12:16:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AE1D6E13A
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Nov 2021 12:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636373769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rYP45irqlvN4LwnhVHPJ2BU2KkkDGk/34c5IpHYqxRQ=;
 b=ae0NQtnWc+87Nt2leSN3gug3DQY7Fc4/VTS2tbs3HwCRFVxkfqOqKBVxR/YGDpMdIfTOP2
 W+0Jx5O+K/fTN1K6smEBs7qxGrA6JSDMVUGH+/4LehdmogRvnPAsemvXv4fwSUWIxp/5O7
 e86jhnh7CER8G6LYx0wUAkvunR7+cXk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-J2yI9gp-PxSRe6DTu7r9Ag-1; Mon, 08 Nov 2021 07:16:08 -0500
X-MC-Unique: J2yI9gp-PxSRe6DTu7r9Ag-1
Received: by mail-wr1-f70.google.com with SMTP id
 y10-20020adffa4a000000b0017eea6cb05dso3977612wrr.6
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Nov 2021 04:16:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rYP45irqlvN4LwnhVHPJ2BU2KkkDGk/34c5IpHYqxRQ=;
 b=xmyUEgPCZsK9jdf0iLa/vpYxofcjAc+kRmj3zYezlAlKDAfyJtMyeCzG4NWof37tIF
 GznK+d2IWAzlS060lvAf0OcZSfFtvnwfVsRNEZOnBymJl10nXDndzJ8NCtq7m6PBbye0
 70+3uA7jwyRFLTzGMT5GGM4V7sURTlQKE1FdrCtP7HRVQ/5Knbpu6HNQhseMlWc/S08n
 Xbo/JxhqWt/i6m7LXhMcWiWk6q4n+oDCa7PP2ApcXq5NEd48IYjCw5QAqHSzS8HRufxr
 m9KeDxi/W97u751qmkGSqFjfCc8GR8oOV9HvyxcviEr7fKpoJ0sWC05Q1I8le6HLzLlW
 AuZg==
X-Gm-Message-State: AOAM533EfwZoTxKJtJ+pTcVF1N2ijx9YSZl6hhggDictC2RJxlz7tJXP
 SrQJYPOHTxIteFCj13l/GEejPZAiGjCoPEZQnmosZHRfiH+yFPQQ5P9CXfZOMw3lkWXtF7AYuqN
 1bEx7WugAJxAsgCHPi2pqg6UOSn5n
X-Received: by 2002:adf:d1e3:: with SMTP id g3mr40570906wrd.300.1636373767254; 
 Mon, 08 Nov 2021 04:16:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzqmdnv8hB/1I80V7WFAMCesKfVcjz59XA/P6anCiMb+qZGLTd+pMQzzm8ZY1WF+8dDjHy4qA==
X-Received: by 2002:adf:d1e3:: with SMTP id g3mr40570869wrd.300.1636373767009; 
 Mon, 08 Nov 2021 04:16:07 -0800 (PST)
Received: from minerva.home ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id q4sm16866866wrs.56.2021.11.08.04.16.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 04:16:06 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/6] Documentation/admin-guide: Document nomodeset kernel
 parameter
Date: Mon,  8 Nov 2021 13:15:43 +0100
Message-Id: <20211108121544.776590-6-javierm@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211108121544.776590-1-javierm@redhat.com>
References: <20211108121544.776590-1-javierm@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Peter Robinson <pbrobinson@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The nomodeset kernel command line parameter is not documented. Its name
is quite vague and is not intuitive what's the behaviour when it is set.

Document in kernel-parameters.txt what actually happens when nomodeset
is used. That way, users could know if they want to enable this option.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

(no changes since v1)

 Documentation/admin-guide/kernel-parameters.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git Documentation/admin-guide/kernel-parameters.txt Documentation/admin-guide/kernel-parameters.txt
index 91ba391f9b32..ed9859fd0734 100644
--- Documentation/admin-guide/kernel-parameters.txt
+++ Documentation/admin-guide/kernel-parameters.txt
@@ -3521,6 +3521,10 @@
 			shutdown the other cpus.  Instead use the REBOOT_VECTOR
 			irq.
 
+	nomodeset	Disable kernel modesetting. DRM drivers will not be
+			loaded when this kernel boot parameter is used. The
+			simpledrm driver is the only DRM driver that loads.
+
 	nomodule	Disable module load
 
 	nopat		[X86] Disable PAT (page attribute table extension of
-- 
2.33.1

