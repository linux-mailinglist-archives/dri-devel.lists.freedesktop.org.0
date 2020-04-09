Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D89F1A3391
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 13:52:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 772F46E11F;
	Thu,  9 Apr 2020 11:52:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2BB86E11F
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Apr 2020 11:52:55 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id 142so6585859ljj.7
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Apr 2020 04:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cugNM0MYMwvYB6JVKjp6QBOC3m4PBIaM8fGQ3sI5RXI=;
 b=ZQRLkz8SrqGBoy1cFTCaOpQ3gsz4gwawLH0iPCjo/NAQKLyHl+sj2/ma2N1kbcLe24
 feCzNRKC+HNo13gii3tgI6gKirTm+SkSTLP0Q5h78Pjr7d5QfmM6rS6/WlClq9JPVJh4
 JSYzlej3jis/47nYRe1TQUjIbHV7+a7Ew65JMIdWnJ5KZLwo5e/F64lUp5VTyfjUp93N
 XY1KCuTsGHfOHy7ASDDzAQMORv6Q+h7R3i8gsUgSGbtusjpjWlHjNAocMmGyGslQUB+I
 aef0Vk65zBojDI7KuFbAnpn1x+70zv0v56rKd++2KY53qjDRXjh66T0w/+Zxx3F/TMv3
 lFdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=cugNM0MYMwvYB6JVKjp6QBOC3m4PBIaM8fGQ3sI5RXI=;
 b=aoE2dPIEoheZdkfpcb2//AFNTl2Y5l+7ME8cGI49q4uEN/NWML8g5Rk3zb/Pgdg+4C
 RYcEYBmxQ5OkzI/18dKPkTIebQ9FXBaPwzXkdlIOj/KiAbYR9OTfWLZWDecwu+fAR9BK
 VbDh9gGZbLZHKI5gojnLjIl1vuPxnwmNGTC/Wz67q1jDV1q0IpjAqS3bFoQ6MZnFJebV
 qdtZigGSB+TYvK+mYulA4ThaROZ7CVUxQxyHkpetBf3sL8Vg9bIYuQKUFcT+HZaN+3m4
 RfLZoU+VpsAC3tnVVEEIxlPbG5CdGXO9lZYMF/pKferWfYeevHjIE6SZkjXzuf0B/OSl
 sAUA==
X-Gm-Message-State: AGi0Pua86O9JQDwuSzftZJdHKM2mpIQbDBnfwMTcmT8tzlgoi+sDDYUx
 78vG7O7RplUo9hqr7l87xvH6aof9fU0=
X-Google-Smtp-Source: APiQypKZ5DaP3UgdMuxkNI56uABnXE2pC8whhrqSPxH6ODD/2V/U5/KncOpMEYz76mTwSGFY0mkTdw==
X-Received: by 2002:a2e:9f13:: with SMTP id u19mr8155637ljk.14.1586433173814; 
 Thu, 09 Apr 2020 04:52:53 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 q21sm14959850ljh.38.2020.04.09.04.52.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Apr 2020 04:52:52 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Joonas=20Kylm=C3=A4l=C3=A4?= <joonas.kylmala@iki.fi>
Subject: [PATCH v1 0/3] drm/panel: update backlight support for samsung panels
Date: Thu,  9 Apr 2020 13:52:36 +0200
Message-Id: <20200409115239.5149-1-sam@ravnborg.org>
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
Cc: Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Hyungwon Hwang <human.hwang@samsung.com>, Sam Ravnborg <sam@ravnborg.org>,
 Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update the backlight handling in three samsung panels.
  - Use devm_ functions to automate cleanup
  - Utilize backlight support in drm_panel
  - Introduce a register backlight helper in all panels
    Using the same pattern in all panels makes it simpler
    to read the code.

With this change the backlight handling in these panels
is now much more like what we see in other panels.

Testing or any other feedback appreciated!

	Sam


Sam Ravnborg (3):
      drm/panel: update backlight handling for samsung-s6e3ha2
      drm/panel: update backlight handling for samsung-s6e63j0x03
      drm/panel: update backlight handling for samsung-s6e63m0

 drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c    | 55 +++++++++++++-----------
 drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c | 55 +++++++++++++-----------
 drivers/gpu/drm/panel/panel-samsung-s6e63m0.c    | 20 ++++-----
 3 files changed, 68 insertions(+), 62 deletions(-)


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
