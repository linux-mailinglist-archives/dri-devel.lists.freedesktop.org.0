Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA392512FC
	for <lists+dri-devel@lfdr.de>; Tue, 25 Aug 2020 09:21:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 910E76E86E;
	Tue, 25 Aug 2020 07:21:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2A1E6E47B
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Aug 2020 19:01:11 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id b17so9248289wru.2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Aug 2020 12:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wdQ01BYoCPmw8R8Z00rskwW2KNNCfLcU9jRwV6Y3oLE=;
 b=Jo/n8f/8sT2IZ+RQoFGB9GMENzmK6MQdXt1FuRuVCZWROngZY4b53ZPyFbwj7zB+Tb
 JRC/T8o3z3xhgHXn8XQdE4uxvMlT5D10mvkTmpSv8HzHsoMONZ6G3R9503U1BrMRkiXR
 7GeFKOTV87bkkB1w9eQ4xHNPGCff+4Mo+HxQjb7K0BmL+czAzo17CxDmV1rU9x5/p1Di
 aKF8XaDrwswFGGnP0o7jABfO7CVx/bb5GPwKWDLnS9UX/06OYuVq5VuTsUl/WP99ukrc
 wt+fx0bA42yeS7f47JWGF865+/wvNCYmBWqJKIhsfhM0cuvHQR5hzWM/0iuznhUX7fF5
 O9ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wdQ01BYoCPmw8R8Z00rskwW2KNNCfLcU9jRwV6Y3oLE=;
 b=lc7lAaENqxVSdPlE2ytNuVgRibC2FwwUcBnM9CpayvlMB0MRqVnk7kzuFmL6clLQtf
 4Elgfvh9SyRjf40cWerZHtsKyNHwe4J39R8LOGhXJ+SS6sRXXdT017NMYjqLhFw01OoM
 fq9a3MEBZg0ZzhiAi85knuvRcRihkV72RiydJ69Z9mUGv5HwDPBSiHGM1XtISQAoLEQJ
 5QYKV2kLQ7HonoiqXAi4QrbQmNpOZhdp2TN5x8pufaBaSDm9VtDpp3qk5Lhno06ZEepj
 oeFTraL3pHKtTIEQsA80G98u1qzgLZvfeUJajVdbI0yzOAMzGtDpi1WvQkbxJk+aHZTE
 B4Dw==
X-Gm-Message-State: AOAM531T17IfrxYOBRI2hjyaQ1BlWKd+uUkrk0DHOTe9sFrKI3qzl5PI
 zQRwDWEszptQZOPi/QZUzTw=
X-Google-Smtp-Source: ABdhPJzVvUy6pZx3R8VQKW3UFagoCxt/6r1yvhQT/F1aK33WZ4rvQDJTIiaPfFy5uqn6L2357joejw==
X-Received: by 2002:adf:ec45:: with SMTP id w5mr7155290wrn.415.1598295669674; 
 Mon, 24 Aug 2020 12:01:09 -0700 (PDT)
Received: from a-VirtualBox.Dlink ([103.120.71.253])
 by smtp.gmail.com with ESMTPSA id o5sm765769wmc.33.2020.08.24.12.01.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 12:01:09 -0700 (PDT)
From: Bilal Wasim <bilalwasim676@gmail.com>
To: enric.balletbo@collabora.com,
	chunkuang.hu@kernel.org
Subject: Re: [PATCH v4 0/7] Convert mtk-dsi to drm_bridge API and get EDID for
 ps8640 bridge
Date: Tue, 25 Aug 2020 00:01:02 +0500
Message-Id: <20200824190102.44454-1-bilalwasim676@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200501152335.1805790-1-enric.balletbo@collabora.com>
References: <20200501152335.1805790-1-enric.balletbo@collabora.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 25 Aug 2020 07:21:33 +0000
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
Cc: airlied@linux.ie, sam@ravnborg.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Laurent.pinchart@ideasonboard.com,
 Bilal Wasim <bilalwasim676@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Chun-Kuan, Enric,

Is there any plan to merge the following commits in this series to the mainline?

  drm/bridge: ps8640: Get the EDID from eDP control
  drm/bridge_connector: Set default status connected for eDP connectors

I see that rest of the patchset is already merged and available in 5.9-RC2. 

Thanks,
Bilal
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
