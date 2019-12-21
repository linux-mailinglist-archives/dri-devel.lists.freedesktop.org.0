Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D38128866
	for <lists+dri-devel@lfdr.de>; Sat, 21 Dec 2019 10:56:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAF4B6E1D5;
	Sat, 21 Dec 2019 09:56:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7D8E6E1E0
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Dec 2019 09:56:09 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id j1so5114634lja.2
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Dec 2019 01:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H+dLqOL/SfUkyRbbgRnV4dn61GBo7BmJGzUQOs6joFM=;
 b=JZeznP9MVN+PU4fB2b/mn5VbJUriCYzsBUlsr+s/Nxw7cbJf3smo2mZxFvT3kBeW+I
 Ntml0FU3K8G30Y2HYr9jYOHY2SoG/DDbdWi6FIBZokYEYTOzrhc526NBs1gSutoG/h2R
 21S27UnA0X2MZE2N67oLFizzOy4/A0PpAkc1KJ2hqBGPa5CK8xy3i91Kecj4A5rFw2pz
 9J6hN3vJf8glGX8zorlrBU6bhTDDNB+DSQ+KBLQY8VZTIQhj28Wl4LrdChd89VqxG60Q
 Qx2OkuoCePdXyeNLT5w4gkl9n8TJGcpFsGl4UD7h9JZtuSRDXeapL0YUmTDADqt0tbEJ
 bPJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=H+dLqOL/SfUkyRbbgRnV4dn61GBo7BmJGzUQOs6joFM=;
 b=I+t6cUdcvo2OJqu+oHTcc9vAtIhkmV7cMDfN3aL7hF30BQuTAE0+8NsULAQ+7d7skC
 Bgrx3TTRk+VfzdXmMPPtMvqWNl0d06EfPWr1pFuG1N6hiJREeK+C22d4OQNyvHofOK4K
 nAsiMBVm3eM+k0JFyk4UnF6Qyj4+whTEQZaN/2xi3vHYxkDJikMszWJTHupDzacVUG2g
 jiwKH7du7APDf9jMRWGYDQ08PsJhz5LbNckVH/+k3QOudQbGFvw0F4QKsc7epImq9QbP
 Dr0xiw7Dji8t/IS2duHgyzl5eS649DvEe/9tWdDFKpMbCrWK8TfC9OWDINNgdlnyMs4+
 2cCg==
X-Gm-Message-State: APjAAAUPsl6nu06aiKGGq2KDwTrdTbTdPVnthguMLyEBgow2ka4rjT92
 xAOUTzHKx0DnWvunz/bOT7IIP2gB180=
X-Google-Smtp-Source: APXvYqyCcITjaq0QHm+Pw3ciAs5lDApCaeQho4B3ZDIwvZ62k7iwHsxX2RrXfSpiFAUVCXM/CLLagw==
X-Received: by 2002:a2e:98c4:: with SMTP id s4mr12582128ljj.102.1576922167892; 
 Sat, 21 Dec 2019 01:56:07 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 n23sm5187263lfa.41.2019.12.21.01.56.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Dec 2019 01:56:07 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [RFC PATCH 0/9] drm: add more new-style logging functions
Date: Sat, 21 Dec 2019 10:55:45 +0100
Message-Id: <20191221095553.13332-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
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
Cc: Joe Perches <joe@perches.com>, Sam Ravnborg <sam@ravnborg.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Jani Nikula introduced the new nice drm_* logging functions.
I looked at updating drm/panel/* to use these,
but was quickly faced with the fact that in
many cases there was a device * but no drm_device *.
And in some cases not even a device *.

So we would end up with a mixture of different type
of logging making it confusing when to use what.
Somethign that alos IMO hurts the readability of the code.

Likewise for review feedback where we cannot simply tell
people to use new style logging but have to explain when
to use what. This will be confusing.

This patchset starts by introducing brief documentation
of the new style logging functions - something I have missed.
And then it introduces new style logging for the remaining
types of logging.

    drm_dev_*	- when a device * is avialable
    drm_pr_*	- when no identification is available

The last patch change the now legacy logging functions to
use the new style logging functions and in the process
delete a few now unused functions.
No conversion of actual users included - that will come
later when we have agreed on namign etc.

The patchset is not yet tested - but it builds.
This is an early drop of the patches to trigger
feedback on naming, get early feedback on documentation,
and any other good comments.

	Sam

Sam Ravnborg (8):
      drm/print: document logging functions
      drm/print: move new style logging functions
      drm/print: add new logging helper for drm logging
      drm/print: add kernel-doc for drm_debug_enabled
      drm/print: rename drm_dev_dbg
      drm/print: add drm_dev_* logging functions
      drm/print: add drm_pr_ logging
      drm/print: let legacy logging use new style functions

 Documentation/gpu/drm-internals.rst |   6 +
 drivers/gpu/drm/drm_print.c         |  80 ------
 include/drm/drm_print.h             | 538 +++++++++++++++++++++++-------------
 3 files changed, 351 insertions(+), 273 deletions(-)


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
