Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5D73D56F8
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 12:04:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3ECA6E907;
	Mon, 26 Jul 2021 10:04:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DE3D6E426
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 10:04:09 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 m2-20020a17090a71c2b0290175cf22899cso13509667pjs.2
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 03:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=iTthFeXuLSiIUMa3m+4Ohdcl4oADyXk96wm5bV/p9oU=;
 b=vJIdihC+g2Azx04o9rgoCp7rnMd632rNxshuywo9qNg5Wy055TCu8SPgXGacBtOKwg
 /YG7QLuuuZpp697xTiltPGa9+1p2yxkbTHktCC5avzFW9YLjjCrxwMAVQ6JhGinRXyxx
 znUuws0MdbPwxYGTj7UhhUDARdSJdeQjEpCoESByilP/ji12jRu+ubKxNZpeMLOgKsUZ
 iNojZFYEY8OOZX4OsH8htGq3f7pxhup4sz5jOd/j9GzBSBVbSBAGYL22kBfyvIRcgqvu
 a0HqMttUJVK2JyARnGwiUGOOxUmCuN9RlL6y2C6lmiN3m2k9ro37ecVX26DBs3BR274g
 kSkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=iTthFeXuLSiIUMa3m+4Ohdcl4oADyXk96wm5bV/p9oU=;
 b=LJacXQjKYQtCdm8jlT0SYKnFVd0l8SOkOwgD7Fa5NjkIxg56LZk/ZdLu0yPJSlt/MJ
 0CQNeoE3j01o50cLSVQG/xqw26DenDtKaeHHWi2b8RNWm4Oybi5vXgSyqYML+ipnHQ3c
 LP975Ks3m6zb2ByNfRgnQBuGe85HTMZXRNBQQodblm1QSYBQFDpzE9Q7cOlq0VskWaGZ
 76jMmqJq4DwxK2CcTZpqB9R6rEM9P3S/3vNVHM9Y+l4rTWRojJNI1DqG0gsT+rdjtQvF
 9+soE3IQZDEtfgHzE6QkwJvH57DFNCCSVmxr15uBknE51pl4iuICIAjVIMjw7NbinQUm
 eLQA==
X-Gm-Message-State: AOAM531U1aQ36suIAgAAGsyiM2XBRHj9jbrZwHyO0ozGFsdSozyIniGQ
 ZoK17kWH6VkxfZBHv31xZA==
X-Google-Smtp-Source: ABdhPJzrNNFsW1crC5/beByynKLR7eFw1C9JM/3djwpzVQGlwUVN78ImeoktPNI+9MZkIGv1dY5/vA==
X-Received: by 2002:a17:90b:46c9:: with SMTP id
 jx9mr5665906pjb.70.1627293848939; 
 Mon, 26 Jul 2021 03:04:08 -0700 (PDT)
Received: from vultr.guest ([107.191.53.97])
 by smtp.gmail.com with ESMTPSA id ft7sm13504530pjb.32.2021.07.26.03.04.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 26 Jul 2021 03:04:08 -0700 (PDT)
From: Zheyu Ma <zheyuma97@gmail.com>
To: adaplas@gmail.com
Subject: [PATCH v2 0/3] Error out if 'pixclock' equals zero
Date: Mon, 26 Jul 2021 10:03:52 +0000
Message-Id: <1627293835-17441-1-git-send-email-zheyuma97@gmail.com>
X-Mailer: git-send-email 2.7.4
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
Cc: linux-fbdev@vger.kernel.org, Zheyu Ma <zheyuma97@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Zheyu Ma (3):
  video: fbdev: asiliantfb: Error out if 'pixclock' equals zero
  video: fbdev: kyro: Error out if 'pixclock' equals zero
  video: fbdev: riva: Error out if 'pixclock' equals zero

 drivers/video/fbdev/asiliantfb.c | 3 +++
 drivers/video/fbdev/kyro/fbdev.c | 3 +++
 drivers/video/fbdev/riva/fbdev.c | 3 +++
 3 files changed, 9 insertions(+)

-- 
2.17.6

