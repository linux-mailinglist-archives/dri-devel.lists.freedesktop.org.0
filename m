Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B99935AD652
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 17:27:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E906610EA3F;
	Mon,  5 Sep 2022 15:27:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADC6A10EA3F
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 15:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662391644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=BENTc3SWGB4BWWG2iajoQJSVj5Fw7ENwsYJf9LzZDOc=;
 b=JrOArjWXRW1hBjT+62zajkBRDKxUnemuOT9iZg2MKtvgW17Z5CjxTAY5/p7KRQrmhKSf6O
 QgtfkZPMIEGkriRVkS8eacT2bdQd6aZF6tYPGRF7g/wVYcXmqTnO7RZs2C73HSwWjdl7xm
 zrH6HboQS9/31dGOU/iBNJBoKRL/wd0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-146-yB9NT8F-NeWaaWgBngPFoA-1; Mon, 05 Sep 2022 11:27:23 -0400
X-MC-Unique: yB9NT8F-NeWaaWgBngPFoA-1
Received: by mail-ej1-f72.google.com with SMTP id
 hp14-20020a1709073e0e00b00741a2093c4aso2506238ejc.20
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 08:27:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=BENTc3SWGB4BWWG2iajoQJSVj5Fw7ENwsYJf9LzZDOc=;
 b=PRt0rpBLCAk9gSEuBqmyXuacykEUPjtS3Orkxv+1UTtsezLUN60qBDHlD4ytY29org
 j2m7eCEUelYZIqVXC5rqrNTTlZulCozp2qa24fm0I1dcAWSL26QgAttFHaiVc0Ezrprb
 sX7xO7fPaS2pFrp+XLmBrmf1cNgX0P9hlDJTrMKxH9lRl0JHJzoo7f2CqlBSCfnBhYYS
 1ee/HOpLs9o7s5F1vfpIpEnHroiv2URFbV2l3h/WqiqeaeHKEscWFX7YcNgZ8E/63BgR
 KXBQoRH/3cfIsLCDJwxZlHGZdOnRnJeK8eWgyYtQGw3uWupgi5F16kCwl8XULkVEdNRB
 VYAQ==
X-Gm-Message-State: ACgBeo0z2UQDTX+KTWeYrWIzyfBmNiSDp3Tlq3WSXad1JUBt/iMnEuLV
 fCwk3mMCWoigD8CNM03oViihQRVZZJylpiycIYjybgsUL4+C6ExRHPzh0t4s8CPzMf/Kb25RWez
 YXtFNBVPrUehDLmpen0kQpr8XH/sc
X-Received: by 2002:aa7:cb13:0:b0:448:3759:8c57 with SMTP id
 s19-20020aa7cb13000000b0044837598c57mr34560725edt.8.1662391642887; 
 Mon, 05 Sep 2022 08:27:22 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4cgqjDj71pPF1s5eWep0UxzIGtBSbww7xJGV60Wk3FNDdc4XOKRNaNLC58VwLuKmtk2E0Qcw==
X-Received: by 2002:aa7:cb13:0:b0:448:3759:8c57 with SMTP id
 s19-20020aa7cb13000000b0044837598c57mr34560713edt.8.1662391642704; 
 Mon, 05 Sep 2022 08:27:22 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 r7-20020aa7cb87000000b0044ea7b8f57bsm1027934edt.1.2022.09.05.08.27.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 08:27:22 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 liviu.dudau@arm.com, brian.starkey@arm.com
Subject: [PATCH RESEND drm-misc-next 0/7] drm/arm/hdlcd: use drm managed
 resources
Date: Mon,  5 Sep 2022 17:27:12 +0200
Message-Id: <20220905152719.128539-1-dakr@redhat.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Danilo Krummrich <dakr@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This patch series converts the driver to use drm managed resources to prevent
potential use-after-free issues on driver unbind/rebind and to get rid of the
usage of deprecated APIs.

Danilo Krummrich (7):
  drm/arm/hdlcd: use drmm_* to allocate driver structures
  drm/arm/hdlcd: replace drm->dev_private with drm_to_hdlcd_priv()
  drm/arm/hdlcd: crtc: use drmm_crtc_init_with_planes()
  drm/arm/hdlcd: plane: use drm managed resources
  drm/arm/hdlcd: use drm_dev_unplug()
  drm/arm/hdlcd: crtc: protect device resources after removal
  drm/arm/hdlcd: debugfs: protect device resources after removal

 drivers/gpu/drm/arm/hdlcd_crtc.c | 78 ++++++++++++++++++++++++--------
 drivers/gpu/drm/arm/hdlcd_drv.c  | 36 ++++++++-------
 drivers/gpu/drm/arm/hdlcd_drv.h  |  2 +
 3 files changed, 79 insertions(+), 37 deletions(-)


base-commit: 8fe444eb326869823f3788a4b4da5dca03339d10
-- 
2.37.2

