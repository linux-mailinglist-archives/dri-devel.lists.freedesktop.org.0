Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D71D12D9C3
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2019 16:25:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7CC1894EB;
	Tue, 31 Dec 2019 15:25:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com
 [IPv6:2607:f8b0:4864:20::b42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEAF2892BC
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2019 15:25:05 +0000 (UTC)
Received: by mail-yb1-xb42.google.com with SMTP id l7so7540924ybp.1
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2019 07:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=JQ5dYmF0rf/lHGZhaVCzwstjsf269P1K3KCsUl6fqFE=;
 b=VEcgQagcdpQyplc+wRzoLfUeMGeGdTeFUrNLDs+J3Th32PFhamz3Sbj+MbfHhqQmXs
 rZcvP/bRE3l6/AGO9r3f+2kG9qLWgWxZYGka5/F6+keM4snmOv8KDe5VimV/XSBNl8oa
 MeVZUcVeiFQWzb9vxFyuKd/RJKwuGQVbA9MPAK+kw6zpKqNRdBfHgcoTlA8x8Xh29PNf
 QEVcB5ZSkXftoreJLDNDkCJSPp1F/2gQl2HmuiD4Yg3J+vgyp1E8cynEnSpcPMAa8oZe
 joLooEJEMn3bsH4SLo7qK64EVij/Dme9DaZOhZ9TDabkmWSzEvBfwSpjMtV01HMbNWH/
 SKFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=JQ5dYmF0rf/lHGZhaVCzwstjsf269P1K3KCsUl6fqFE=;
 b=Wg/xgkSAu76hpJ0TscgToEii20AVIj4SJ8Ezso5/OvgJZlIZKC/3mbaNxpcrijZvS8
 T4Wc1LKpXLdSN4OCAqYjUAh/6hhb83sI7nuvpBoEWiyIiu1jswh5414P8sonUptkU290
 c3TAXY5FJuomPQe+h5/1nnUW790gdgO1zKR10TYUIXw3Ublb8yL23ORMCMffTmoL60GK
 g/wjSgeky2SaWj2Il1FzGBzaHcOE2Gidates93R6H4rxMaeo7Avsfl6HvpeYgINSUDGZ
 /W77C9ZToU5Waasi26OI8ZtPL+xaf9TkoxbZGzpwbe7uVjv8UXUpwZK37VMMWFrul+zf
 3OOQ==
X-Gm-Message-State: APjAAAWjaDevUXIIqgctJo6fHGJazhCmIq8me3j/4TPBljKE/63GhlRY
 Sc/1MkJPtHsDsnmor62LP1bO8w==
X-Google-Smtp-Source: APXvYqxn8oRZUeKey21IA9voWo1FetoG0KJfD5qXnkQk4NAl2Dz2drtPDtS3CGogT2sQMrZXISnI3g==
X-Received: by 2002:a25:30d6:: with SMTP id w205mr34166546ybw.84.1577805905057; 
 Tue, 31 Dec 2019 07:25:05 -0800 (PST)
Received: from localhost ([2620:0:1013:11:1e1:4760:6ce4:fc64])
 by smtp.gmail.com with ESMTPSA id w142sm19311190ywa.87.2019.12.31.07.25.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Dec 2019 07:25:04 -0800 (PST)
Date: Tue, 31 Dec 2019 10:25:03 -0500
From: Sean Paul <sean@poorly.run>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20191231152503.GA46740@art_vandelay>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: dim-tools@lists.freedesktop.org, Stefan Mavrodiev <stefan@olimex.com>,
 dri-devel@lists.freedesktop.org, Ben Dooks <ben.dooks@codethink.co.uk>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Dave and Daniel,
2 fixes, 1 of which is marked for stable.


drm-misc-fixes-2019-12-31:
-sun4i: Fix double-free in connector/encoder cleanup (Stefan)
-malidp: Make vtable static (Ben)

Cc: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: Stefan Mavrodiev <stefan@olimex.com>

Cheers, Sean


The following changes since commit d16f0f61400074dbc75797ca5ef5c3d50f6c0ddf:

  Merge tag 'drm-fixes-5.5-2019-12-12' of git://people.freedesktop.org/~agd5f/linux into drm-fixes (2019-12-13 14:50:01 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2019-12-31

for you to fetch changes up to ac2917b01992c098b8d4e6837115e3ca347fdd90:

  drm/arm/mali: make malidp_mw_connector_helper_funcs static (2019-12-20 15:23:51 +0000)

----------------------------------------------------------------
-sun4i: Fix double-free in connector/encoder cleanup (Stefan)
-malidp: Make vtable static (Ben)

Cc: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: Stefan Mavrodiev <stefan@olimex.com>

----------------------------------------------------------------
Ben Dooks (Codethink) (1):
      drm/arm/mali: make malidp_mw_connector_helper_funcs static

Stefan Mavrodiev (1):
      drm/sun4i: hdmi: Remove duplicate cleanup calls

 drivers/gpu/drm/arm/malidp_mw.c        | 2 +-
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

-- 
Sean Paul, Software Engineer, Google / Chromium OS
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
