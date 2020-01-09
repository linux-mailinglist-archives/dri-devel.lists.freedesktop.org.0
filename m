Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F261135C83
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 16:20:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 324EC6E910;
	Thu,  9 Jan 2020 15:20:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D9856E910;
 Thu,  9 Jan 2020 15:20:41 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id t14so3254605wmi.5;
 Thu, 09 Jan 2020 07:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g2TlPDM2RcAObvbjZFrQdRqz44E2BJ0omGqCQYH/7Tc=;
 b=kzh+YICs6SMlfJRAI/l9EMcGtULjm2JV+NXGPNvBZzMBoojoNdeNiq5uzbRpIU2q/Z
 4Mexza3oz/zaBoLq3CX9R9FMKmalAWna2IsE94BBUX4DJDH28Bv2NmH1y3D8JcS4+bGW
 DUiaT1ZEX6ly8m9lB2twzz22wRlPLqwIB6t4nhrKBGR5n+aeWfKPrAlyZpLIwPtS1AG2
 U0benVoOLz4vWsYGQht7o5A94v/WjkUWLqAvCg92fBlnjyTELLyScKEE1EdWL0v3kPvo
 vRe1v3GTan/VrfijG67DKEEeHSUQTRzN6BXlD5khSUALGK+dskqSJFEs5RHQ3M6Kqmxp
 g/gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g2TlPDM2RcAObvbjZFrQdRqz44E2BJ0omGqCQYH/7Tc=;
 b=i/hbzUUZVXAM/vjVjt1HtaD4W9W6bhXRnM0WCk0WZpxeHYNaov13Q8ned5/kZ+QsOz
 kbFxO10JLsxjbn7G1ZEB/W73hHuF0rqbepvdR31rWYqLl53QdD88oQOJwnIjgml5kr4z
 +/w8LfJx7xtGMJV+zvhHgqqX21eh1ZJv6KzJZeabYf1tabco1CIKweB/KGvGjxbd5SwU
 9ogj4msUZ47YkzRLBOEejZtYiOkTBaxwDJQXoIPSPOSEk01LHOWnr/6O7OW18RZpv0zG
 hCy/8NGPLre5ZrsJPSTaCvrGBRnq+VT6wwzzr2iwYfn3dJxVej2JzI5JkfCZGFmbXvnK
 LVxQ==
X-Gm-Message-State: APjAAAWHcFR8jjT3ipUyFXB+dxq+ElWDR+NGzOY1fr5Adz2W2UvYPAII
 bVxZM1SxWzpL1UkS64lmIK3FgILfSzk=
X-Google-Smtp-Source: APXvYqw4CnRgFgtEeMGnqvqBixxaSSuzHN6+6XVnjW9dQBnKOzOuXDo0Yo2oWnQToOMYxowYxAJnRg==
X-Received: by 2002:a05:600c:2c44:: with SMTP id
 r4mr5393523wmg.140.1578583239450; 
 Thu, 09 Jan 2020 07:20:39 -0800 (PST)
Received: from twisty.localdomain ([2a01:c23:7c40:600:59fe:915f:cac1:6580])
 by smtp.gmail.com with ESMTPSA id r62sm3309872wma.32.2020.01.09.07.20.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2020 07:20:38 -0800 (PST)
From: Mario Kleiner <mario.kleiner.de@gmail.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: Some eDP fixes/improvements.
Date: Thu,  9 Jan 2020 16:20:26 +0100
Message-Id: <20200109152028.28260-1-mario.kleiner.de@gmail.com>
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
Cc: alexander.deucher@amd.com, mario.kleiner.de@gmail.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi and happy new year!

Since i now have a MBP 2017 to play with, with a 10 bit Retina panel,
and Polaris gpu, i'm trying to get it to get 10 bits, and found one
small bug [fix: patch1], and a quirk of Apples Retina eDP sink, for
which i propose patch2 as solution. I sent a similar patch to i915 to
make 10 bit Retina work with the Intel Kabylake igp on that machine.

If these make sense, it would be cool to still get them into drm-fixes
for Linux 5.5, so users of spring distro updates like Ubuntu 20.04 LTS
can get a more colorful new year.

thanks,
-mario


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
