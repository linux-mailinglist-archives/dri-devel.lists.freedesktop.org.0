Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DAF1605A7
	for <lists+dri-devel@lfdr.de>; Sun, 16 Feb 2020 19:59:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B5FF6E0F2;
	Sun, 16 Feb 2020 18:59:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E68406E064;
 Sun, 16 Feb 2020 18:58:59 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id j17so18003751edp.3;
 Sun, 16 Feb 2020 10:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=TpSnAm25wPH3VK0kJpyji9KLpcsDX0bDNOrEow0wYDU=;
 b=XnZuw9VL9yN1jLsAx6YdGK2KohRde5WRWCFPYbCRcnpz3Hax8NrMNebQ0lYwn9E+7z
 rsiNm3xPCjqwZWDDWetG/IFB1MWkU6CZWvwb4S3RzYfHCcBS5K8bB5+MmMSkpBQ13AsL
 wssgh9SbwPNL/dC0KgAo7cEOWFq2GKMlqJCcfuEqCcs3DWKa/3dWbPZl5GNoUANh97cN
 0z6t1wZYjV/lRRDvF05arfMlwc74YZPvukdLtdNL80ISzFyxvWMfSlwn9yl1nwx4zBmv
 e54ow2c8uLDPXu/wTd62NO6fCJJ0l+SbgL8HNMLUEI14g2urF3Vz0AMgtwvicHQy26j+
 L/NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=TpSnAm25wPH3VK0kJpyji9KLpcsDX0bDNOrEow0wYDU=;
 b=i6bCIb6SmYPl0Q0asSWA1y5ZVxSyMxYNqhOk5PUjT+xjj7ZLXF/shSdItUMrVqKh8F
 jqZmCAYGr2meT4yFuRZLL8mllVk3I0Q3DKD2qTsz/6ssTgf1u4sOEtwtDk9n8VWd822P
 hNQQtlXNp8Bxnp6Ig0GOwuimxf4u9OSJhXnA68snEssdUyHvTcgIJGmNbvz+okPi5lzI
 geELfi08bUNQIx/ZR6JNHmycT9Qr09iDe78aRgmV7A3Gqyz76mNih6cc54uXSpoPPjVk
 UfFd/sp+uIxr7eCasn3xwkGIn8U274dkofGIUMHp1HTcJ0zfMG4hJdYCCsKQiSz+Blgt
 Sxkw==
X-Gm-Message-State: APjAAAU6E0nbhPRWZnq59cE3vScErD9dx3QawuczkVPi3mJmwB6BKEJX
 iZN12pwMZUbEJwAapKR7QLSAbdkeVxAHe3b0hIk=
X-Google-Smtp-Source: APXvYqz4RNqAGJljIzya51CavkeE9kiK2ePBXoWIbclr9Eu1ewnwe7TGrR0E86C6CgQXn1SdrKQdTCu70fouurNH4lY=
X-Received: by 2002:a17:906:19d8:: with SMTP id
 h24mr11500861ejd.166.1581879538251; 
 Sun, 16 Feb 2020 10:58:58 -0800 (PST)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Sun, 16 Feb 2020 10:58:48 -0800
Message-ID: <CAF6AEGshz5K3tJd=NsBSHq6HGT-ZRa67qt+iN=U2ZFO2oD8kuw@mail.gmail.com>
Subject: [pull] drm/msm: msm-fixes-v5.6-rc2
To: Dave Airlie <airlied@gmail.com>
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
Cc: Sean Paul <sean@poorly.run>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave,

Got a few more fixes this time around, so decided to send a dedicated
-fixes PR rather than try to route these all through -misc like we do
when there are only a couple misc fixes.  It mostly boils down to
fixing fallout from new hw enablement (sc7180):

+ fix UBWC on GPU and display side for sc7180
+ fix DSI suspend/resume issue encountered on sc7180
+ fix some breakage on so called "linux-android" devices
  (fallout from sc7180/a618 support, not seen earlier
  due to bootloader/firmware differences)
+ couple other misc fixes


The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git drm-msm-fixes-2020-02-16

for you to fetch changes up to 8fc7036ee652207ca992fbb9abb64090c355a9e0:

  drm/msm/dpu: fix BGR565 vs RGB565 confusion (2020-02-13 13:54:12 -0800)

----------------------------------------------------------------
Akhil P Oommen (1):
      drm/msm/a6xx: Correct the highestbank configuration

Brian Masney (1):
      drm/msm/mdp5: rate limit pp done timeout warnings

Harigovindan P (2):
      drm/msm/dsi: save pll state before dsi host is powered off
      drm/msm/dsi/pll: call vco set rate explicitly

John Stultz (1):
      drm: msm: Fix return type of dsi_mgr_connector_mode_valid for kCFI

Jordan Crouse (3):
      drm/msm/a6xx: Remove unneeded GBIF unhalt
      drm/msm/a6xx: Update the GMU bus tables for sc7180
      drm/msm: Fix a6xx GMU shutdown sequence

Kalyan Thota (1):
      msm:disp:dpu1: add UBWC support for display on SC7180

Rob Clark (1):
      drm/msm/dpu: fix BGR565 vs RGB565 confusion

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c       | 37 +++++++++++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c       | 65 ++--------------------
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c       | 85 ++++++++++++++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c |  4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c    | 58 +++++++++++++++++++-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c   |  4 +-
 drivers/gpu/drm/msm/dsi/dsi_manager.c       |  7 ++-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c       |  4 --
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c  |  6 ++
 9 files changed, 170 insertions(+), 100 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
