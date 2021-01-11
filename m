Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A17F82F1E96
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 20:08:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE08289DC7;
	Mon, 11 Jan 2021 19:08:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B6FE89DC7
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 19:08:27 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id lj6so118136pjb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 11:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=59nxlB8VZ+hnhNiWW6MUdoxkOzActMtX+5zF/bfPh1Y=;
 b=BtHHfhFFehHqijgd2JLtWspyu1TNSHowLc8fSW3rAWzcqy6xsNKgsAhQvOrpbpqQGb
 MXhlAdjtFzXin3c+3JG0FeKcznojdvFnGryg6bBCalkNcW1hAGp352mHCOOqJ3J680aG
 1wbKLVVdmHBfvhCdSjdEyL6TBHnwApIUA70rNCENHPcQ2zUg98i7jS/t6aIt853CTidc
 trm1GssAYCUqOP4MHs5SPfZE7PbMsxdvxirfzVryCLwtxU8+0icOtsf7ld7mVrbOi4Iw
 Sx82XPsr1PYt3jpH7/lIlfne40Xw2XGTZ3r5n5udYSkR6MoOj5S8LfJ92gV7GKQ3Dif/
 obtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=59nxlB8VZ+hnhNiWW6MUdoxkOzActMtX+5zF/bfPh1Y=;
 b=l2scz3jNTm6goZBV1v+rewmL28Z+exmY9luWgy6pRTzukc+G3KIoyWMvVUJ/TTHo+u
 PpI7oR9hoTD/DrIULyphklkU7oxGe9T9KIHHkZ7hJgp5esgIRI1po43dg83Yxp7jx+yz
 gkk/dFT3VqlLTKBom/UOrsMUfn2lGpMohYJoFKzCG0N0+U5yjwmtluqww+fEBlABYpFh
 5RpSv14Hz4KRUAecXEX37BYSU2q7efCP/lMb80lSlTrPmEUJfbt68qDCsEYCECbRL55z
 jKgPtXVZW3LOBHpgFGfGIRF0bOsvLJEQWkMRe/UONhNrcxvpG81KXNaWBIo5rA3gGPSo
 G1Ww==
X-Gm-Message-State: AOAM533SDf9NlUUL5HbZFIt3odYMLadm1U5PtK0ELrdagz6QPgF5hREZ
 z+K7a5OOg5W6vXOFWGNQG1NGHWc9wdM=
X-Google-Smtp-Source: ABdhPJzvMZhgRoL6SXI9kfx/HNdUrpg4WN0yhU39irWcBBSkyBHwtbvDQt0vKFcFLjncu6yDuiwLOA==
X-Received: by 2002:a17:90a:9483:: with SMTP id s3mr29595pjo.85.1610392107222; 
 Mon, 11 Jan 2021 11:08:27 -0800 (PST)
Received: from adolin ([49.207.206.164])
 by smtp.gmail.com with ESMTPSA id y9sm133083pjt.37.2021.01.11.11.08.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:08:26 -0800 (PST)
Date: Tue, 12 Jan 2021 00:38:22 +0530
From: Sumera Priyadarsini <sylphrenadin@gmail.com>
To: melissa.srw@gmail.com
Subject: [PATCH V5 3/3] drm/vkms: Add information about module options
Message-ID: <4fbc6459377c1dcbe8e6648718453d5693f6451c.1610391685.git.sylphrenadin@gmail.com>
References: <cover.1610391685.git.sylphrenadin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1610391685.git.sylphrenadin@gmail.com>
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
 Documentation/gpu/vkms.rst | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 9e030c74a82e..2c9b376da5ca 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -35,6 +35,18 @@ Now, to load the driver, use::
 On running the lsmod command now, the VKMS driver will appear listed.
 You can also observe the driver being loaded in the dmesg logs.
 
+The VKMS driver has optional features to simulate different kinds of hardware,
+which are exposed as module options. You can use the `modinfo` command
+to see the module options for vkms::
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
