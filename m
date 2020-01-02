Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7FA12EC1B
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2020 23:15:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BF73892B9;
	Thu,  2 Jan 2020 22:15:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 186FE892B9
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2020 22:15:27 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id h23so42149443ljc.8
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jan 2020 14:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uUUP/1Y6oOdsC9ROslrWc363EJHpn33hi6dmtmQlw58=;
 b=CpHQ/JjI5rg5EM8Wgm9M77Eg7+bTrEjUs9n1kUAkB9HFRIdugcclcsbJJ+a7E780pN
 qFUffcptU0PVf+wysPgLJ2yWK3iKIv7Btxt27OSfc/ZC302Ll/MjThPcUgXW4r/AP9vq
 nHX89RAJtI7L4FC7L4/5nYdcXixHSQ+FDOp30rQ++KVzEmE3Sp1Umz1Aa1np2Ou1XwBg
 VAxuJQCUcEG+rwEWnl8EHrF9yFKDok70Db7Acfgg/jWofoVdDCA2ip87Zo65tkri5l6S
 A/XOuImURgPLwfF+1Npt5idNQFm/o0rMFzDjSU3P5iol2YXDRytAO1fbyNWWZBfOP6/G
 H3Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=uUUP/1Y6oOdsC9ROslrWc363EJHpn33hi6dmtmQlw58=;
 b=asp16q5dBacFDkWMt1rm1eqGoqAQj/4tMb3r+Y/b/YsWtZKLfhe8izGYYXh7RkdIcX
 NuK+b37IdX6TBAqkzXo78Tdl3jiWVWTiUHzTFLzsVhVeSHoVPs6fWBKSUNqwbx6qsHh4
 /yKQEhwu9cakJBAi4SphSEV1NK3tmkHlAoBWZiahi0pyVGNSnk75zeerhiNT4UK7tf1+
 4sXe1lz538UdQpztUbTsT2jaLEed3LshdXpToT/h5T4RTUEA9YicWOvKqygPYhctoepr
 heZ/ZCbNSiZrOjwORpKehtBbi9bMCbrwsJGfPNrlv3qPlYq45kyzwt5sV3BH5KMghad8
 2vUw==
X-Gm-Message-State: APjAAAVM++xsra5T6gWsf7adQC6Pj8l6iWm/Xr75vO9vz8HdphF6v/JG
 lY4sDDyjgf8V3rCTaYTV2ThbgBgZ
X-Google-Smtp-Source: APXvYqzWN6SewVYPoxbyrGTgjDZ+9jDJHRO1P10XtC5CTNexiliPN83M4EyyIA8F4jdvYdNszGIYzQ==
X-Received: by 2002:a2e:9510:: with SMTP id f16mr35866298ljh.249.1578003325179; 
 Thu, 02 Jan 2020 14:15:25 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 z7sm23499965lji.30.2020.01.02.14.15.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jan 2020 14:15:24 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 0/2] drm: document logging functions
Date: Thu,  2 Jan 2020 23:15:17 +0100
Message-Id: <20200102221519.31037-1-sam@ravnborg.org>
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

Add kernel-doc for the drm_ and DRM_ logging
functions.
This is the documentation that I missed when I started to use
the logging functions.

Version 1 of this patchset included drm_ variants of the existing
logging functions - but they are left out for now.
The idea is that we should try to use drm_ logging in favour
of the the variants that take a device *.

This patchset document the existing logging functions with
no functional changes.
And the documentation is properly wired up in drm-internals.rst

	Sam

Sam Ravnborg (2):
      drm/print: document drm_ logging functions
      drm/print: document DRM_ logging functions

 Documentation/gpu/drm-internals.rst |   6 ++
 include/drm/drm_print.h             | 164 +++++++++++++++++++++++++++++++++---
 2 files changed, 159 insertions(+), 11 deletions(-)


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
