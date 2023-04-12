Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 079E86DF8FD
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 16:52:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A37B810E367;
	Wed, 12 Apr 2023 14:52:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF4E210E86F
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 14:52:13 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id i3so1869580wrc.4
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 07:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681311130; x=1683903130;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=u7/u19RWvvENJemjtBVMBbLRdSZzmMdDG1t+sOVENsQ=;
 b=D1iCTJ8Yuxco6rfGnGXZsSRJ+JCpLE9X7Irtr06FtxCkWT5ZEZ63Z3IuZqFjNqLPHI
 ZhY5bPDB5aBUb6RmvKjEald9FBr9RzDgxF2eB1xDQCLr23ihmoLYN3bREO4sAkOpbIrH
 1du+jup35mOEdsK5B0WKyVC84j6P3LwaMsKiGgtYlErjhsij7RnDfum0mQLXa/eBDOol
 9R7hr+9RsrUas4imBu8nKAtJgg4snWatsvDEnAPjIzr2uKt0sI7QND8+rwtIzavGTxpn
 2UWKWJIw46o1zjlOp8AdFhvUkEH1HomQHKB/bXC0PEvfc7yEX4zyDxh8VGRbIDD0jiTV
 jTHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681311130; x=1683903130;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u7/u19RWvvENJemjtBVMBbLRdSZzmMdDG1t+sOVENsQ=;
 b=SFSTOCTgcwgDPz/LEI8PhbTU1WDAS3d84cWZzZxDsF+UgT8A9qsmLNx+iMLUB7BHfA
 Z0RRpa9wfjeNojDWGqZcShysAaBiuBz7trcnX/3O8/lzYDvuX+Yp4C9Wqr2mK7efeJtK
 X26EKZxJT0MmkYblWgeywphApIDsngSjwVzxYiYQQt1Y0spqvDMvweQzSP+vV/2DWEb1
 eshEk6EHnmVaarBcbmrWr77TjfTzovUG3pbiNHTGOdvB0jXrZlVDsYhIBRUUNG6MUFnE
 EPcLeYyvcPS+ZYECANIme0o5NAyeoU8VRC+B1bxxl0cGTUnY/soS2ZoGzlLvTMnfKIyN
 pZYA==
X-Gm-Message-State: AAQBX9fM2y/VmJ4YWpBbpCYUGMbmvy9e21IDcFM8DXvneplrBTUPrn4n
 DLjAVZ9d4yk3JqpCyXUngc0=
X-Google-Smtp-Source: AKy350bTcte9bziHuZdbjaPIjzqJmgJEAqurTVmLfTuRcLgK3OzaJy7km49/VvZaHf054fhHqQb2LQ==
X-Received: by 2002:a5d:4fcc:0:b0:2ef:5066:7bd8 with SMTP id
 h12-20020a5d4fcc000000b002ef50667bd8mr2314184wrw.43.1681311129699; 
 Wed, 12 Apr 2023 07:52:09 -0700 (PDT)
Received: from able.fritz.box (p4fc2092b.dip0.t-ipconnect.de. [79.194.9.43])
 by smtp.gmail.com with ESMTPSA id
 e18-20020adfe392000000b002c56013c07fsm17304166wrm.109.2023.04.12.07.52.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 07:52:08 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: mcanal@igalia.com, stanislaw.gruszka@linux.intel.com, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, daniel@ffwll.ch, jani.nikula@linux.intel.com,
 mwen@igalia.com, maxime@cerno.tech, wambui.karugax@gmail.com,
 dri-devel@lists.freedesktop.org
Subject: DRM debugfs cleanup take 4
Date: Wed, 12 Apr 2023 16:52:01 +0200
Message-Id: <20230412145206.2483-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi guys,

took me some tries to get the Intel CI happy with this patch set.

This is the version rebased on drm-misc-next, for a CI run you actually
need to rebase the last patch to drm-tip. So I'm planning to merge 1-4
for this cycle and the last one after everything merged together again.

Please review,
Christian.


