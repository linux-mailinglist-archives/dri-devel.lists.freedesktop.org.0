Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B0D3F26D4
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 08:33:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEA926EA01;
	Fri, 20 Aug 2021 06:33:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3015D6EA01
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Aug 2021 06:33:44 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id t1so8192139pgv.3
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 23:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uizvbGrAGell6LdMB1pzSSzYApXRoXyVsqw6ZRcvWA4=;
 b=1FzClz4/cP22vIiJuVHlGAzTd7Ib7PAHSg++BBzrNQtZk87GbqGXy33+JHRwf2bG9w
 /V0nlxAvcTWDyoxqzpRitPEur2uuK0JjEeAQn5sVKYYw1vg5x2QJ3nMjtQW1JL0a2xg2
 5nhStFIcR+G5IRnwzRVyz8irwDXqNtlKGnCjjECvPtu7SQneOWh2nyFqxpTN6TunXVuP
 dZcbr0y8GdXgoT/sK3cl+fBc19NSRh+Yt5+JnikFM5omtG/nNKhBi1imRFMJQGPGRP0q
 eBxA0spBPqp0bKuF8yK7T/zHFoDkzxdKTMF/S+cSm6auSGc/Eq1UTY3B1GZXHM+f15SY
 5sTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uizvbGrAGell6LdMB1pzSSzYApXRoXyVsqw6ZRcvWA4=;
 b=sgJi/mp45ydZ2r87CGRqGw91N9M15j/w6Q/e0tjJ/vrLju/XM275n12/t44tnQWhnl
 X+Mhf792b1equCOt1UfwVmu71/NY8Sz/IpRqp5N4oGFra9FWseRSbwCjmfEGgygWi9Uj
 3Utv2ADimbGy4SlhBuz9PhtSeYa3jdFrnDcDuwPBjTF36GL/POD7/WT6gdBBFb7Y5jxg
 IW+tCRcV+oBrcclTC8kd2d5clpbZWu5idVqSqudkYR4ycRn44ETfXcQkNnZ0gT1k4jvn
 xRWZVtqThWnwgyf2WlW2e29Eg46y2XQB+DSx1oezil2aZsQJFytTTu9pySBu4BQOTFga
 wOjQ==
X-Gm-Message-State: AOAM531yLwS2X8+V3buko6EFf7jnZVBg5cEGWp5z0zSjFRLODhjpE+jK
 qm2ZQ2Pgye2r48v58BRCezpc7A==
X-Google-Smtp-Source: ABdhPJz4dCXSZ33XEWhwSZMTETDWB1y7AOtiIjlAEa80L0dWADYvBITxJsFjeraeegigfhEzzLTfUQ==
X-Received: by 2002:a63:1460:: with SMTP id 32mr17343074pgu.323.1629441223783; 
 Thu, 19 Aug 2021 23:33:43 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.213])
 by smtp.gmail.com with ESMTPSA id a10sm5612160pfn.48.2021.08.19.23.33.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 23:33:43 -0700 (PDT)
From: yangcong <yangcong5@huaqin.corp-partner.google.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, dianders@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 yangcong <yangcong5@huaqin.corp-partner.google.com>
Subject: [v2 0/2] drm/panel: boe-tv101wum-nl6: Support enabling a 3.3V rail
Date: Fri, 20 Aug 2021 14:33:35 +0800
Message-Id: <20210820063337.44580-1-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210819124844.12424-1-yangcong5@huaqin.corp-partner.google.com>
References: <20210819124844.12424-1-yangcong5@huaqin.corp-partner.google.com>
MIME-Version: 1.0
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

Compared to v1, "pp3300-supply" is removed in the required list:
dt-bindings: drm/panel:
   - reg
   - enable-gpios
   - pp1800-supply
-  - pp3300-supply
   - avdd-supply
   - avee-supply

yangcong (2):
  drm/panel: boe-tv101wum-nl6: Support enabling a 3.3V rail
  dt-bindings: drm/panel: boe-tv101wum-nl6: Support enabling a 3.3V rail

 .../bindings/display/panel/boe,tv101wum-nl6.yaml      |  3 +++
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c        | 11 +++++++++++
 2 files changed, 14 insertions(+)

-- 
2.25.1

