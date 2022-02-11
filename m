Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4044F4B219D
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 10:22:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2001610EA4F;
	Fri, 11 Feb 2022 09:22:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9D0410EA4F
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 09:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644571338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/bi42S9VA+rXZukavob2heYyTf52jS05inWB/COJe28=;
 b=cwJSBbDO89lsiTeTHJcoRL1ij1EvhR93XQcMRc/HaFGoy546sJRGeFm45ihjSav6zUZvG4
 sSBWYEPBiOUkOcOJsadojq4k8n3gqvQ37VP5JvMoLnlTi0TIsi/QIwsmypwz+fXzIEXpM0
 QWlKOH7BL/KAV2W3X+7Xv1pzzzt9Gnw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-351-UYJWZ_mcMvCY0grr4tSSbw-1; Fri, 11 Feb 2022 04:22:17 -0500
X-MC-Unique: UYJWZ_mcMvCY0grr4tSSbw-1
Received: by mail-wr1-f69.google.com with SMTP id
 c9-20020adfa709000000b001dde29c3202so3630093wrd.22
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 01:22:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/bi42S9VA+rXZukavob2heYyTf52jS05inWB/COJe28=;
 b=geuXmR9COwMWprCnoaHUoLrqhMeXRimUrNlTGmuM2bgM8A8DH3VgPeBVWOEZR2/DIe
 uowyO2RLbOszOYFHMIFsHKnv4gd4vmN6te5AnvnHOlr7kJV+UWPeaUOJ2rDZvEWcZIR8
 3QMdXo7xw3ggDkQ7PZeIol8MbSU6f0lwSlV0bJcUPT5tJFUO2GXDhYbREPSPLobEfcT4
 jpCEHGxrJgRwlstf+paFTb+tsE3xhfybVQQxdb6mRD4VxbJTR4NDugc2RRgFPOdB+lHH
 eC3d9TGGopb87Hj+R8cMOw4HeDzISFRe0IEF7/MhHbYbfD7gNbeo9b0VD42Xs/8/dVqw
 NLqQ==
X-Gm-Message-State: AOAM5320r+uvFKQDvq9PnTmg5Hza3omiPs+rZ73AKkYdShp/41ou5/qI
 jpRzCKA55LLMXT7dK/iiTGZkX2uZNd/VHeYAgBPExY1vjp+66O8kUNVEw78WOuaNOT9tNXB3bYS
 lCAb8/0cpmyMp7yIq6G8rH3keAtIY
X-Received: by 2002:a7b:cbd7:: with SMTP id n23mr1369738wmi.76.1644571335925; 
 Fri, 11 Feb 2022 01:22:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxVyNwlqjVh91bNTF7uCkHKI+vxIB6I7J+ATyw7Om9fonGEf2KmhkFvJu7P23thXV+nsQsQLg==
X-Received: by 2002:a7b:cbd7:: with SMTP id n23mr1369727wmi.76.1644571335738; 
 Fri, 11 Feb 2022 01:22:15 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id z5sm4237804wmp.10.2022.02.11.01.22.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 01:22:15 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 5/6] MAINTAINERS: Add entry for Solomon SSD130x OLED
 displays DRM driver
Date: Fri, 11 Feb 2022 10:21:57 +0100
Message-Id: <20220211092157.2988713-1-javierm@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220211091927.2988283-1-javierm@redhat.com>
References: <20220211091927.2988283-1-javierm@redhat.com>
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
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To make sure that tools like the get_maintainer.pl script will suggest
to Cc me if patches are posted for this driver.

Also include the Device Tree binding for the old ssd1307fb fbdev driver
since the new DRM driver was made compatible with the existing binding.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---

(no changes since v3)

Changes in v3:
- Adapt MAINTAINERS entry to point to the new drivers/gpu/drm/solomon directory.

Changes in v2:
- Add Sam Ravnborg's acked-by to patch adding a MAINTAINERS entry (Sam Ravnborg)

 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d03ad8da1f36..05c306986ab0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6102,6 +6102,13 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	Documentation/devicetree/bindings/display/repaper.txt
 F:	drivers/gpu/drm/tiny/repaper.c
 
+DRM DRIVER FOR SOLOMON SSD130X OLED DISPLAYS
+M:	Javier Martinez Canillas <javierm@redhat.com>
+S:	Maintained
+T:	git git://anongit.freedesktop.org/drm/drm-misc
+F:	Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
+F:	drivers/gpu/drm/solomon/ssd130x*
+
 DRM DRIVER FOR QEMU'S CIRRUS DEVICE
 M:	Dave Airlie <airlied@redhat.com>
 M:	Gerd Hoffmann <kraxel@redhat.com>
-- 
2.34.1

