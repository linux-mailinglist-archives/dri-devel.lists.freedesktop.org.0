Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E04219FE5E
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 21:47:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56A846E48E;
	Mon,  6 Apr 2020 19:47:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA5DF6E48E
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Apr 2020 19:47:54 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id v16so1066348ljg.5
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Apr 2020 12:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version:https
 :content-transfer-encoding;
 bh=4SJQjISjQj7z0dbBazspmBMJmy3hrwSahhMPuNVC720=;
 b=juZuFH++T/xbBcPddP734glx2G/1qFH1gpmvl034YTsuafEgOHfnSuKMesgr9QFHAn
 8xvB8LqcdyZw1kSintmRNZkDTIvgaErfh+aLPc/wu+CjZbhYYMnCmId2tzlsAtiq7B3I
 IzDjobQ0d+6ND18/Rjtbl/UzAKnfsa/fQLojWxauD372t6f9FWAuNKLReXRBqx45L3X2
 2iD1s/uPAYd0gasiWNolvTe2+tueh4wzfol90B2Oh48MGXeaetsqFdfGY0PbJuEBu3ke
 sJw0dDXSrsm1+NPtP1ocW2TmyttQVIVUoun6vkWioB52SFWoanfMXMJTw9hYLsgaaAca
 oU0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:https:content-transfer-encoding;
 bh=4SJQjISjQj7z0dbBazspmBMJmy3hrwSahhMPuNVC720=;
 b=nTje3PPOMZT+GnLUOaYFAvC7nhP+HjigPT68cD/StL3gOQ60qjiiHqicOaCCfqxgsZ
 I/3hO5EkaZY77OGuiYhzjpZmspnLR91wvos0on1BYlI190ZPjLHCQYqEHKYznVjTMk3B
 16TLI+Hi6LoyOEmi2FPDAzCRj9+cp6niT5sV/uQ9z9pjfnjSnoEx1EmPXMCyESTn4kMz
 sL/1tIXan3T3QhQgxgUMVmmwc2oQPpBlmMp9QCBhGseo53LSZLO4lb158Qh1EG9j74n4
 v35LDNJkM6bequz+kyYDY/Jy5cZMhf0nGYuwuNM5He7lvUgVLnUVaJHa7fmnI7IRv17z
 i5/Q==
X-Gm-Message-State: AGi0PuY6dF/mCDKpI8dLDw9Asebf/79iIhvH5RT1m04WYWA/m7UaNCQ/
 sE7xyd+7K48IGX/Jhau7zyZARhuBdZo=
X-Google-Smtp-Source: APiQypLeyZuhd1e4YBbXqgvU+lacbmohyb8REUNSHIhlO1Zrk5Fb0Bw2eOjnTQVO9wGUxex5HCkjbA==
X-Received: by 2002:a2e:b536:: with SMTP id z22mr544365ljm.24.1586202472728;
 Mon, 06 Apr 2020 12:47:52 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 b16sm10525276ljh.20.2020.04.06.12.47.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 12:47:51 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
	Lyude Paul <lyude@redhat.com>
Subject: [PATCH v2 0/3] drm: kernel-doc stuff
Date: Mon,  6 Apr 2020 21:47:43 +0200
Message-Id: <20200406194746.26433-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
https: //lore.kernel.org/dri-devel/faf63d8a9ed23c16af69762f59d0dca6b2bf085f.camel@redhat.com/T/#mce6480be738160e9d07c5d023e88fd78d7a06d27
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Liviu Dudau <liviu.dudau@arm.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Lyude - I added a "Co-developed-by: ..."
Can I get your s-o-b on the patch, to document that
you are OK with this to go in.
Needed on top of an r-b.

v2:
  - committed acked/reviewed patches
  - significantly updated the vbalnk patch based on a lot of good inputs
  - updated the writeback patch
  - wired drm_writeback.h to kernel-doc

        Sam

Sam Ravnborg (3):
      drm/vblank: Add intro to documentation
      drm: writeback: document callbacks
      drm/writeback: wire drm_writeback.h to kernel-doc

 Documentation/gpu/drm-kms.rst            |  3 ++
 drivers/gpu/drm/drm_vblank.c             | 53 ++++++++++++++++++++++++++++++++
 include/drm/drm_modeset_helper_vtables.h | 27 ++++++++++++++++
 include/drm/drm_writeback.h              |  9 ++++++
 4 files changed, 92 insertions(+)


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
