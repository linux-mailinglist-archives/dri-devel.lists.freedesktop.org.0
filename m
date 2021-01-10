Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 296E82F0783
	for <lists+dri-devel@lfdr.de>; Sun, 10 Jan 2021 15:05:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C0D16E0BC;
	Sun, 10 Jan 2021 14:05:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38B2A6E0BC
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jan 2021 14:05:46 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id x126so9373416pfc.7
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jan 2021 06:05:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=PwUU1YKTRto1wQfZpKpX1jWiTQDtu3Oih3JGe/RizdY=;
 b=JJAczVYOJr2piove4sRN5rNQ5PwlhTMnhuEoiIVroZAG6Kje6V7y/pzjfw9iOFLPxb
 AdEwHEzOXTodscnF6Ex7EEL3VZTFdTGgQFz+XC8uD1+n8/J7FOtI2yz5SSjgHXLnTG6r
 f3+tWuWtUv9Tmdfqg67aS6UErR5yoIUyGhcqNsW4HaYGKEIzGA/tUNPVyZDdlBFW9jsw
 RdkOWj0pk7Sjo29ywJW3P8rnDWxGv4SYObrExO8M1k6kSDbkzet6HaAsPHwJ3lIJFvHU
 /qGcaRY8BwXymij38uC13l4wgzaCtLeGPrAi2bY7FDY0iGnRmC9/SteIJxVjUZAg4983
 BEXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PwUU1YKTRto1wQfZpKpX1jWiTQDtu3Oih3JGe/RizdY=;
 b=B50iZNGKwxEv6U4jdJHgauxKbPFjGoCSmT8DG20YzVNrvLaE3wV7Ot+7YNVwqYr6T/
 3DsFh9KSQYGrJA8Wd/mN9IjIFVhpI/zL6PnJf2FUQ+x5Ij87POC/kkneINYDbWKmZl69
 ++qVHFYMME+5aO6vzU6/HDNA1MHID2KaScqvnFMMzw13Zwkuk4F7vQ51GSDBPEU9O/K1
 7ADU2LVIUWyX2OThBndTi7jrRzvoheEcW94Da9X0FlsUkytScxLh0g9ojcQiUT9PEAdx
 JuU7llbciO+SGkGorQnOuhpzaQv//oIkvaW+htt/ZH12PRsjcSH7wDlXSls5YXv3Rojq
 1k0A==
X-Gm-Message-State: AOAM530AAWqBrHPw1fxQqqTsr7XZLYdgrU5sseZIJ5fbppwGV/CGW2jT
 KKmDZsXLa2ZjQWtZut6ebrY=
X-Google-Smtp-Source: ABdhPJxGzAwaLioVlxKIni4tPEBYRHzS+nPpywLkNSMnCzjcbzKfrhgLhTld4VFrP3s1WKMAZuIabQ==
X-Received: by 2002:aa7:9633:0:b029:19d:d05f:4964 with SMTP id
 r19-20020aa796330000b029019dd05f4964mr12246859pfg.23.1610287545891; 
 Sun, 10 Jan 2021 06:05:45 -0800 (PST)
Received: from adolin ([49.207.199.194])
 by smtp.gmail.com with ESMTPSA id ay21sm11828629pjb.1.2021.01.10.06.05.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jan 2021 06:05:45 -0800 (PST)
Date: Sun, 10 Jan 2021 19:35:41 +0530
From: Sumera Priyadarsini <sylphrenadin@gmail.com>
To: melissa.srw@gmail.com
Subject: [PATCH V4 3/3] drm/vkms: Add information about module options
Message-ID: <68b521bc789640a5f6437bcaa5d5960799be59c9.1610200411.git.sylphrenadin@gmail.com>
References: <cover.1610200411.git.sylphrenadin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1610200411.git.sylphrenadin@gmail.com>
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update vkms documentation to contain usage of `modinfo`
command and steps to load vkms with module options enabled.

Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
---
 Documentation/gpu/vkms.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 9e030c74a82e..45fe02f643a8 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -35,6 +35,16 @@ Now, to load the driver, use::
 On running the lsmod command now, the VKMS driver will appear listed.
 You can also observe the driver being loaded in the dmesg logs.
 
+You can use the `modinfo` command to see module options for vkms::
+
+  modinfo vkms
+
+Module options are helpful when testing, and enabling modules
+can be done while loading vkms. For example, to load vkms with cursor enabled,
+use::
+
+  sudo modprobe vkms enable_cursor=1
+
 To disable the driver, use ::
 
   sudo modprobe -r vkms
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
