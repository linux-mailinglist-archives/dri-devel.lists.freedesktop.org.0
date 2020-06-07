Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 249351F097D
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jun 2020 06:06:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AB6D6E11D;
	Sun,  7 Jun 2020 04:06:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A48426E114;
 Sun,  7 Jun 2020 04:06:13 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id e12so10624622eds.2;
 Sat, 06 Jun 2020 21:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/4M9n/jjdZ6jTzSVw7Lm0ovP1fYki6oC+p2XEevFF+8=;
 b=O4G6ogiPxqxqF93BRXpHaKQqOjsNunt+gDqsjpqQ7ZYZUf5JZAJTxamqAOpmImhC0t
 amvtjDlE2lrA+sIxok72lG6r1m/pRyE7x1kP9+LPDgGHgwUJyyY8xlblJvTrWcNbRXgy
 cZx6YO7CaickBeZhpNC/qSE0tOoTmzfilviKfDZVEk6hnh1jp8U9sbENvOOsC9HEXz8Y
 tUNbR9CpSBXDMFW4TQ5Jd7eCVvhLDViCHJEFkLC7iOWyCZx3dzeeICORRfkAfSsE/va+
 Mghz725kEH0tRJc9Zmyn4xkISXS6qxcWX9s1zMxxCTIvHDGMDpAHxRwdrK+zblHwlvAC
 5PJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/4M9n/jjdZ6jTzSVw7Lm0ovP1fYki6oC+p2XEevFF+8=;
 b=XhcbanNz3+kRI7vtviX7MVedpHTr2k4ZIz3t3UDS19DJLG9TLNo/NZAiQAXXPAhg0G
 s6qiVxRDcMUlBMEmJD4BEWEvt9hT8QEsXWh73FPgyPMpdvoLPKvmLMf2h52Ihh6H1XBS
 bOwhgO1UgxqekC2l99LgLgJZ9NU6zf2MvFL/HwUr5ohk/7HimdeDEzrDUYNik82kb9X1
 +Dxkb9DvbYfxhfYIvM3hwAdXM5khpZiy5sGWIaByL9SvwOGzY4M6chx5tw/HU3vQLxrJ
 rzK15h9vneb80rIOHsfEhwcOGKA7+Sv2ZqF3P+L3hQAfMAhFJ+qOvdoc4J1/P2m4JOzs
 3txQ==
X-Gm-Message-State: AOAM530Mcqn9MYBB+PB0oqLBByiu1JL0JAI6qGBgvoBDxQYLeDb+LXyk
 Ogw7Sstyy1Q/rbttx3iJxb8/xgES
X-Google-Smtp-Source: ABdhPJzkOthh8GTIJtfj/aSkVe9hiFPkXPFVBbW+sRIXe260iHSKDP9LHEYfOzIk9qv8mcPTZF+j5A==
X-Received: by 2002:a50:a701:: with SMTP id h1mr14707123edc.170.1591502771825; 
 Sat, 06 Jun 2020 21:06:11 -0700 (PDT)
Received: from twisty.localdomain
 (dynamic-2a01-0c23-8430-e100-f914-43b7-6b66-02cf.c23.pool.telefonica.de.
 [2a01:c23:8430:e100:f914:43b7:6b66:2cf])
 by smtp.gmail.com with ESMTPSA id w13sm7797243eju.124.2020.06.06.21.06.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Jun 2020 21:06:10 -0700 (PDT)
From: Mario Kleiner <mario.kleiner.de@gmail.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: Enable fp16 scanout on DCE 8 and DCE 10
Date: Sun,  7 Jun 2020 06:05:56 +0200
Message-Id: <20200607040558.15996-1-mario.kleiner.de@gmail.com>
X-Mailer: git-send-email 2.24.0
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
Cc: alexander.deucher@amd.com, nicholas.kazlauskas@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

So i'm sending these on the off-chance that DCE-8/10 do
support fp16 scanout without hw bugs. Would be nice to
enable this if it is supported, even if the hw can't do
HDR. This is also useful for non-HDR to get effectively
11 bpc precision from the fb to the display outputs for
more precise color reproduction.

thanks,
-mario


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
