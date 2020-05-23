Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3C01DF568
	for <lists+dri-devel@lfdr.de>; Sat, 23 May 2020 09:12:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15F676E0F8;
	Sat, 23 May 2020 07:12:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C0A06E0F8
 for <dri-devel@lists.freedesktop.org>; Sat, 23 May 2020 07:12:32 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id w10so15382746ljo.0
 for <dri-devel@lists.freedesktop.org>; Sat, 23 May 2020 00:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Tito/cIKpYp7qg7RaJtJHncFAPlnu9y151XLCbwB/V4=;
 b=KGxUPZRQTZVTv74w1Y3ci0/ntKk+afd+D1u6lSfEBYDRGbxLSnt1rJDGYDgd8zAEde
 gpXhAS819E+QWVPx2fcd9U4ZJ9PpOMq4LUiaDeJ1DsLcz1jw78X8nDqaYm/QOyvYNFz3
 bEkOx1ZcDMUnJNNHZLuHEHbJXBokckEAqDo5gjci6vhKWudWuoyV+Kd/JrjvTf9dv16A
 sjnH66wH1qdcMEIZNK4renUUXK1LNqZvkDwOMNN6yLnWAnIBaWrF0aAls0jcUTVtOzYB
 vBjN4lkvSRIm5g4Qi8FG6NI6vCNrtWTo1eacYKLvHlhUXRO9e09u0+/Wil1FzwDnMEne
 1uyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Tito/cIKpYp7qg7RaJtJHncFAPlnu9y151XLCbwB/V4=;
 b=hjihf1ZkvSz9nc/jzn2/HLC9VlVMRBVJmqHc3LVlkd4S1kfnfbILbWATxFirwqxhKy
 st8f4IeBRyHAb2eu0VDf4cqoQjPARlLD0oFcbtbsP00AISS8zEtPzryWUQbRfVT6bP1V
 DiQ2UdBY+iSFnm1SPMidSTbGVHj3t5UKLLiIebHUJHnoNfSR5wZ8xrN/sbtz9FkAtbsO
 qaLcJghowPfXBbAzi9vGcR0xml8ahTIvmc+jwLFyCHMpNrtEqMIZIW8hG/eBkj77mWAA
 pWiYp8Ci8kjuV5xGSQg9e6V4uVJUD/l2sCH776TEg9I5Gt05v9BBmSwx1EUiivGYnNqT
 4/pA==
X-Gm-Message-State: AOAM531tEk1aGl7ISbUqrxf6aQt5LRwAXisAGmiNVwwuJi3d3HfyGzC0
 wrkDOVWVjky5kuOwaOp6k1Y=
X-Google-Smtp-Source: ABdhPJynxRXP1Quybq2ZOWISo9WqWihX3qQD9A2X6kQEEMmfrY5tm/GDqfEpYDhP/G2YREe1NjgweQ==
X-Received: by 2002:a05:651c:2dc:: with SMTP id
 f28mr8996638ljo.36.1590217950421; 
 Sat, 23 May 2020 00:12:30 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:a998:8970:e934:d643])
 by smtp.gmail.com with ESMTPSA id m13sm2887730lfk.12.2020.05.23.00.12.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 May 2020 00:12:29 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: Lyude Paul <lyude@redhat.com>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v1 0/2] drm: update drm_vblank logging
Date: Sat, 23 May 2020 09:12:22 +0200
Message-Id: <20200523071224.1716837-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
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
Cc: Y David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace all logging functions in vblank with their drm_ counterparts.
As cocinelle and I are not yet good friends this was a pure mechanical
replacement.

It adds more lines because the added argument required some more lines
to be divided in two.

The patch was split in two:
- the logging functions
- the WARN functions

This was only done to ease the review a little.
The patch is done on top of drm-misc-next.

	Sam

Sam Ravnborg (2):
      drm/vblank: use drm_* functions for logging
      drm/vblank: use drm_WARN for all warnings

 drivers/gpu/drm/drm_vblank.c | 198 +++++++++++++++++++++++--------------------
 1 file changed, 108 insertions(+), 90 deletions(-)


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
