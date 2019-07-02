Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6C35D338
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2019 17:44:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FD8589958;
	Tue,  2 Jul 2019 15:44:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 774EC89958
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2019 15:44:29 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id j19so18928758qtr.12
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jul 2019 08:44:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kfWPWLek+Gy43+eezXfh8eVjBj+6pFJ2g4xROl/XX14=;
 b=t8SSzYGNC0RPMzL0Q2nsAL1iE5rB630+eoYGENqvDZLbO+eoYJFcWt0CIFvqiSQmqE
 JjhIKQuIa/bB+3NXIMB7fkI7xco7pdqTSPzC7WEniKS41fOwZpRGBgNqBpuWfjgODK7U
 vdcYhWnTwuToyqudeajEQARTgx3o4BV6ROQQqsYGnWOGxM8CL0ssIuT4bsz6NqVBjWLO
 oDA/EmUOv8ZYKv4O//RPCotmh4gYJM+rDLB3WF3NJDlVUtgdWs2NROIyIfWljZIJq94E
 /Wqj4ONpA138agFuRZ7v43jtog2E0eoT1NW7AK7cqkYaeZBfE2ZTK+Rax079YCk5TXVv
 va6w==
X-Gm-Message-State: APjAAAUoD5UUPSfIlSzw9bKh84zPlK/dmPCU+dcV31Om/fBgKInJfNQd
 4aJ3ddJ7Qtb4cAwDI2fTqHXytyjPdS4=
X-Google-Smtp-Source: APXvYqxf14HBJmxdCsYRgJfYZHCwqdsOiHgJT0V1QUIyldFt4FZFC7ZkBJlaa591ZIzt78Xi/9TbVQ==
X-Received: by 2002:ac8:2d17:: with SMTP id n23mr25779712qta.132.1562082268324; 
 Tue, 02 Jul 2019 08:44:28 -0700 (PDT)
Received: from localhost ([2601:184:4780:7861:5010:5849:d76d:b714])
 by smtp.gmail.com with ESMTPSA id c127sm6362897qkg.121.2019.07.02.08.44.27
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 08:44:27 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] drm/bridge: ti-sn65dsi86: debugfs and mode_flags fix
Date: Tue,  2 Jul 2019 08:44:15 -0700
Message-Id: <20190702154419.20812-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kfWPWLek+Gy43+eezXfh8eVjBj+6pFJ2g4xROl/XX14=;
 b=m8sHp+PesxAz+xrB+8tq6DQqXluhdgjCtQ9rw6c+GGyf2EHzLqGzXBPZullZNv25iR
 rJN72x1FYIR5JfAt20csjgoJReIUsyZnHI+k8Juc+WZqQOhAEAyLy6FCYAc3EvkVhDe/
 z+KxNVhA0ADLOk6+r/CoL4Ruql9+LRxIXTBr1AtFkU1QMCIM8j0VgS4SY88Gvz8ha+Iz
 ppuFTtyidQHZJlEnK8EFT/xQfJab4b99W6Oy6XdvhcLoiQDgGAixtJ4oUl5A4bZ7grHP
 rBMADZirN1Fj7/IdDv2RVJiDQGnxoNHubC/Pxn5GPiK2x5Kef4T/58KFd4kBPgTV4tpn
 jq0w==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKSW4gcHJvY2VzcyBvZiBk
ZWJ1Z2dpbmcgcGFuZWwgb24gbXkgbGVub3ZvIHlvZ2EgYzYzMCwgSSBub3RpY2VkIHNvbWUKZXJy
b3JzIGluIHRoZSBkc2ktPm1vZGVfZmxhZ3MsIHdoaWNoIEkgZ3Vlc3Mgd2VyZSBqdXN0IGNhcmdv
LWN1bHQnZD8KClNpbmNlIGR1bXBpbmcgdGhlIHN0YXR1cyByZWdzIHdhcyB1c2VmdWwgdG8gbm90
aWNlIHRoaXMgcHJvYmxlbSwgSQpjbGVhbmVkIGl0IHVwIGFuZCB0dXJuZWQgaXQgaW50byBkZWJ1
Z2ZzLiAgVGhlIGxhc3QgcGF0Y2ggY29ycmVjdHMgdGhlCm1vZGVfZmxhZ3MuCgpUZXN0ZWQgb24g
Y2hlemEgYW5kIGM2MzAuCgpSb2IgQ2xhcmsgKDMpOgogIGRybS9icmlkZ2U6IHRpLXNuNjVkc2k4
NjogYWRkIGxpbmsgdG8gZGF0YXNoZWV0CiAgZHJtL2JyaWRnZTogdGktc242NWRzaTg2OiBhZGQg
ZGVidWdmcwogIGRybS9icmlkZ2U6IHRpLXNuNjVkc2k4NjogY29ycmVjdCBkc2kgbW9kZV9mbGFn
cwoKIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktc242NWRzaTg2LmMgfCA0NiArKysrKysrKysr
KysrKysrKysrKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA0NCBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQoKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
