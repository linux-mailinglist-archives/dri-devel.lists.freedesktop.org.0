Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1542D0C57
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 09:58:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08A486E81B;
	Mon,  7 Dec 2020 08:57:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x463.google.com (mail-pf1-x463.google.com
 [IPv6:2607:f8b0:4864:20::463])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98DB789FCE
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Dec 2020 00:40:18 +0000 (UTC)
Received: by mail-pf1-x463.google.com with SMTP id c79so6498116pfc.2
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Dec 2020 16:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lagfreegames.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=GAZ0Q+AQi31vblISNFAKf/3/aBwZi7mu+wiptBtuhPo=;
 b=U0jUYFPZuq/Omgz4UfRCtVOK5AqhqVQcwt+EZbFx3gB942kpO5jnlLD6iK0dfoEti4
 woDZQDrxXdF4qCF6B9M8F266yAdL2dIaKp2QqUo4rrppOAnMmNq3TieiBM/7qOENcE7v
 46hKpwLx6KP3wtysc7aO6hTjIhlUj1hzRgCHXxmFvJ4Nn7cpU70qvYBdU7SXlCal0qSi
 D8NMjw4/brWzpnxAmJJmrFuvMSh/KNPc0ZC51u9mjUHL02yk2TFMgrAONev3hWqMGoGO
 lwLirG/QpX2z9R4/DRXz82XynhJKmb+dvgy87EPN5CFmtx14lbkuk4OGezrAa9nbjkKy
 Askg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=GAZ0Q+AQi31vblISNFAKf/3/aBwZi7mu+wiptBtuhPo=;
 b=OujFWRrygnbB9XBTspdGsZ8R+XODaHZpkPpBoTd82ceIZInR6x7MDHCDP9TLi1LlxG
 co/X6btMw56QrQSvp4GQlid8zyNCsTtCo8ZBwRcywBkxJoZRB5LJ+p3nK/m7i/OpZUUt
 MeRIEkyEfwBlEfE/3IVomsWwmI2FJjddKmG40ETGgIJK0sBUmJ8B/QuLwVS1gTAU4MOc
 uovE4HO8eKYzt0dkjCfpqp23ahq4eYe7BIgA/fEwHsBEwfwNroZWPefyZjnfrjnQTSyr
 4VfDFoKdyJHxixBUnsrCIO9dPAb9HoY4YfrfN+1XDHIK0YBAaRpYuGp81ECiK5lGt7ek
 6Fmg==
X-Gm-Message-State: AOAM530x1etkHtPvnWK9VrfYgw3X+WHALzAxgEvAbc+H/yf6wGHtcmzt
 A/O6+xogDklsqDXnUxXoGk9e8BMmTyOrJHWG+9oYZCnBkJ2QyA==
X-Google-Smtp-Source: ABdhPJzoLkZ236oGCklAeusHiwcvhvysgQ1Q4x/XcroJeTpfM6jOKeWyZuvslvtxfek3/C9VE4fzWBP2kAHO
X-Received: by 2002:a65:60c4:: with SMTP id r4mr13044584pgv.291.1607215218119; 
 Sat, 05 Dec 2020 16:40:18 -0800 (PST)
Received: from DESKTOP-G3VVM7A.localdomain (c-24-5-176-39.hsd1.ca.comcast.net.
 [24.5.176.39])
 by smtp-relay.gmail.com with ESMTPS id nu5sm807680pjb.14.2020.12.05.16.40.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 05 Dec 2020 16:40:18 -0800 (PST)
X-Relaying-Domain: lagfreegames.com
From: James Park <jpark37@lagfreegames.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: drm_basic_types.h, DRM_FOURCC_STANDALONE
Date: Sat,  5 Dec 2020 16:39:30 -0800
Message-Id: <1607215171-36-1-git-send-email-jpark37@lagfreegames.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <CABjik9dirbf13ZiVBvufitGJXja6Xvn=EqTG_VtvBHjaAwJATg@mail.gmail.com>
References: <CABjik9dirbf13ZiVBvufitGJXja6Xvn=EqTG_VtvBHjaAwJATg@mail.gmail.com>
X-Mailman-Approved-At: Mon, 07 Dec 2020 08:56:49 +0000
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
Cc: James Park <jpark37@lagfreegames.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Create drm_basic_types.h to define types previously defined by drm.h.

Use DRM_FOURCC_STANDALONE to include drm_fourcc.h, replacing drm.h
dependency with drm_basic_types.h.

This will allow Mesa to port code to Windows more easily.

Signed-off-by: James Park <jpark37@lagfreegames.com>

James Park (1):
  drm: drm_basic_types.h, DRM_FOURCC_STANDALONE

 include/uapi/drm/drm.h             | 14 ++--------
 include/uapi/drm/drm_basic_types.h | 52 ++++++++++++++++++++++++++++++++++++++
 include/uapi/drm/drm_fourcc.h      |  4 +++
 3 files changed, 58 insertions(+), 12 deletions(-)
 create mode 100644 include/uapi/drm/drm_basic_types.h

-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
