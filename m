Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFFE1D49FB
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 11:54:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FE036EC38;
	Fri, 15 May 2020 09:54:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE6EF6E132
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 09:54:08 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id m12so1685121wmc.0
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 02:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UgKCP0E66GrIssr4PSamPr7IwENtNcpBp6wlTsjszoo=;
 b=uO39bj4PKYS2NEzcyP6/0Y5vJSSSyAai9wN0X1f9+yrz5/f6mU9Ada2vk0gJuY9uNr
 INjNrRYFfW9/EA3dTJs6uS4bG43KyNbjkvU/BRvBl/Mw3v6ufZDq4VzRbATRY98I6MB4
 3WwpgDlGwFI7abb/fP0sGJWQfRvKx67gBsvBa8fxoEh0bFQPU3tOBdTwvUrydT+f80mg
 xebHpVZtkoBbEDuFFUqyWLc/p8lNYD5p4jO+/7nAij4tnXKys3CZGqLpIUG/piaq9nV0
 vQpHj9D1Dv8F4r7YjFGROdW2G10JLQwATRo2RETKd4uDAcq+ReV1enSNT0KEIFdfTRYE
 3lzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UgKCP0E66GrIssr4PSamPr7IwENtNcpBp6wlTsjszoo=;
 b=hW31l7zJy8++omErRRJ5FDdk4k/MJzddZx5xJn+PkgkizCHbVvLWVU+21z+vhP/Y5Z
 Z1qFg2xxaTinxuIGc0R2h64xY3hhpY6S3W0T6AE2kkkZGTWyNjO0CegjRESEL7aChklr
 2Ncp3gwrmRfN/jShdHP1bf0kS9m56+hZrXYalJpixBtlNJx7CZIS4P3QHrapYWSLiPPD
 t9Kw1J/rTCgEyP8X1B65UCY+4KQBs8NDYi1u+WIV6hYAIx7I1Uy3lpXmR6RtEmrV0SWC
 zC91/vonxBI6Ma7wYPiz5u/aWByK23HpsXCvQ/barh+yeiuJk4qDitkoS1kAw+DEERzU
 NwRA==
X-Gm-Message-State: AOAM533hs6Z1WvQcoEFXYvQq/se6wwk06h8VBZwrjLvN/AkFzSTPVt3Y
 533P6o4l0Wcep2ft7TBglE+sedSw
X-Google-Smtp-Source: ABdhPJwTFglqnCJfE2KMz60BQeTVykFZPBU/sf3S5ZJC2+Au++YjY/CwuxqdrQhuNWWHB4AJmZpZZQ==
X-Received: by 2002:a7b:c84b:: with SMTP id c11mr3055049wml.19.1589536447238; 
 Fri, 15 May 2020 02:54:07 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id s12sm2705817wmc.7.2020.05.15.02.54.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 02:54:06 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 05/38] drm/doc: add WARNING for drm_device::struct_mutex
Date: Fri, 15 May 2020 10:50:45 +0100
Message-Id: <20200515095118.2743122-6-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200515095118.2743122-1-emil.l.velikov@gmail.com>
References: <20200515095118.2743122-1-emil.l.velikov@gmail.com>
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
Cc: emil.l.velikov@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Emil Velikov <emil.velikov@collabora.com>

The mutex should be used, only by legacy drivers. Add a big warning to
deter people from using it.

Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
 include/drm/drm_device.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index a55874db9dd4..0988351d743c 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -146,6 +146,9 @@ struct drm_device {
 	 * @struct_mutex:
 	 *
 	 * Lock for others (not &drm_minor.master and &drm_file.is_master)
+	 *
+	 * WARNING:
+	 * Only drivers annotated with DRIVER_LEGACY should be using this.
 	 */
 	struct mutex struct_mutex;
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
