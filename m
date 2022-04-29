Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2324514478
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 10:43:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F12B710FC8A;
	Fri, 29 Apr 2022 08:43:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D3EE10FC87
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 08:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651221792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LCV3P6hCzkrdCIrNXXA9bD+9VmWpW20bTzgfHeQMSC8=;
 b=B4tFrHdUqPjZ7QART1lMiJgqcp+fTtAMOA3d7V2gdLJdb+n3Q0KV/zQvZDh47TUhatNUba
 VJzgRl5YaGAxq5a47zIcCKOPBsKzV7J3+yOr4mTRfpeiBiq7p50qD+SwjRQMnYXLmDbVja
 V9oViRMimnt/Mvzyx96klNtp3JF+TUE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-494-IWhPxuGPMwG9iGN-ePWs-A-1; Fri, 29 Apr 2022 04:43:09 -0400
X-MC-Unique: IWhPxuGPMwG9iGN-ePWs-A-1
Received: by mail-wr1-f72.google.com with SMTP id
 d28-20020adf9b9c000000b0020ad4a50e14so2816434wrc.3
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 01:43:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LCV3P6hCzkrdCIrNXXA9bD+9VmWpW20bTzgfHeQMSC8=;
 b=ZW66N8Uvd5k727T2Q9Mva+cp/gJcNedtgBhnprJoNJtmNOYztLDHJsjgwe6ypP7xv2
 8MjGioSUIAgr+LAL5QcEOyWMcA8FGlLRLrb1iqGJXtSw6Fs+7JMmg/UCb91zihXGySLG
 OU3hMVz1mV6AQm/oZA8dQhreK95sLjRct60ZFih11M7x9a0zmXagoHATcKywD1Vu3YZz
 sBBy33/2k1zJrQPpM3uKL+DyqLKtcn8ljFzRY15JWM/xRbk2IxXSKZBsAZTbtDXLjFD8
 KKrA0DmHOmLYx9pC5gb2n8bCItsWn/bX1GHgtBiIPKfAd3cNq4rp0U/i4z8yMTYjHffh
 Zm4Q==
X-Gm-Message-State: AOAM532GhvasRnYQbAzZ1S3ESg7/4T5g7gEz2BeNU4PKKXTw2UulLWye
 xDggu7TrwzZH2sFejh1xA6PYGenlUrj6zbjaeS60BfwgqDu3TmsobKvlMkOsh9lUnadqNCCv8sR
 L5gfZXTOZcjitBn2XNCzmOb+/XyQg
X-Received: by 2002:adf:d213:0:b0:20a:d703:154f with SMTP id
 j19-20020adfd213000000b0020ad703154fmr23745176wrh.604.1651221788118; 
 Fri, 29 Apr 2022 01:43:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOOGOyZ1kriuI0rWlYEm4in0LjrxkZkAvL2COz8NgHTz+Sazyk8MTmZDUo3yafUN3PdSzrKA==
X-Received: by 2002:adf:d213:0:b0:20a:d703:154f with SMTP id
 j19-20020adfd213000000b0020ad703154fmr23745165wrh.604.1651221787882; 
 Fri, 29 Apr 2022 01:43:07 -0700 (PDT)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 f7-20020a05600c4e8700b00393f1393abfsm7199256wmq.41.2022.04.29.01.43.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 01:43:07 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [RFC PATCH v4 01/11] drm: Add a capability flag for simple
 framebuffer drivers
Date: Fri, 29 Apr 2022 10:42:43 +0200
Message-Id: <20220429084253.1085911-2-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429084253.1085911-1-javierm@redhat.com>
References: <20220429084253.1085911-1-javierm@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DRIVER_FIRMWARE flag denotes that a DRM driver uses a framebuffer
that was initialized and provided by the system firmware for scanout.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

(no changes since v1)

 include/drm/drm_drv.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index f6159acb8856..abab51705e36 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -94,6 +94,12 @@ enum drm_driver_feature {
 	 * synchronization of command submission.
 	 */
 	DRIVER_SYNCOBJ_TIMELINE         = BIT(6),
+	/**
+	 * @DRIVER_FIRMWARE:
+	 *
+	 * Denote a driver using a system framebuffer provided by the firmware.
+	 */
+	DRIVER_FIRMWARE                 = BIT(7),
 
 	/* IMPORTANT: Below are all the legacy flags, add new ones above. */
 
-- 
2.35.1

