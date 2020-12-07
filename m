Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7822D2623
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 09:33:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 878676E9A6;
	Tue,  8 Dec 2020 08:32:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x564.google.com (mail-pg1-x564.google.com
 [IPv6:2607:f8b0:4864:20::564])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0632989BA3
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 18:16:33 +0000 (UTC)
Received: by mail-pg1-x564.google.com with SMTP id w4so9558945pgg.13
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Dec 2020 10:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lagfreegames.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=mfcoT+dkqAmRSPJPiKhIE9K5Q8V+2FK471WywH/rX5I=;
 b=LWBz4+pHyTpyhjfzQXJoUB3MS/VOHdilaVB0aNl06J3BbXPgtmLtMhVM2lOdUtgae5
 3+6gqPclXZCzLP7QN4/ZAZ/xpOPSt+YfnEmlznz75keaCuDUobn04kmo0Ug3omEvaeZy
 2A4ro+8xGggQaNlB7WTkg5QifIx3PiaWHoljOa8Av9TpXLQxTe38Xjc99OO09sYN483G
 nuHMj0etQKR8na6d0JyfSlCTJgD+6dP1t2zwB/m3DuiVRwy9SkiCbkyqC9dx/Kqtmb5a
 2NQ+fopYoPi3+wA51SxAoa1muiWRzodI5Td0EJrF21qyIEHIaRmgagM/6M76YbHOO//B
 RhSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=mfcoT+dkqAmRSPJPiKhIE9K5Q8V+2FK471WywH/rX5I=;
 b=G7ELK5TeexO3XvybVfkOhVdK8i0jrWyCkQofTD1u5pMji4j88AEHUFr+JZR5zL0Wb7
 LmiD3D5OMB4UkuRuoXQbPtd6UOskIX4WE64x9pljhFqorjJR4lTtQWl+uR5jotwmfZq5
 soupnDBW5CoKRgrTRYHNiynD2RkQI49FfaknO00J8jmhxQohen2z+hO9MO0MZOKnO0au
 a1Elx1I1bxpc/4ke3Q0uw82PZsxwQLcTYKDXDTwxDs198MLcD/xLuQjytn09pkZmLaq0
 yvteKqA9EDf2xTykByYO+jCQ/eCkx9qw25b7zSzjI6jYIE4d+rd+b3GrBw/o29ewocCN
 FxUw==
X-Gm-Message-State: AOAM531jqsUM2KiA1SFaWM7oMUknh430OwLNavYiDqjmPImyl+M8v/Kq
 WFuwSvrlqG87zq9bH5kOW5dR3xIeCpTNcRjuSAMpLGAqpSYUrw==
X-Google-Smtp-Source: ABdhPJwaor5SYJveU616ajYLB6UoTqIOfSk/ouNa9PsbGZvwcNEhFuae2B4DI9KHKk77nwvn63uI97jCMhld
X-Received: by 2002:a62:3205:0:b029:197:f692:6a8b with SMTP id
 y5-20020a6232050000b0290197f6926a8bmr17063616pfy.2.1607364992830; 
 Mon, 07 Dec 2020 10:16:32 -0800 (PST)
Received: from DESKTOP-G3VVM7A.localdomain (c-24-5-176-39.hsd1.ca.comcast.net.
 [24.5.176.39])
 by smtp-relay.gmail.com with ESMTPS id c18sm9523pjr.12.2020.12.07.10.16.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Dec 2020 10:16:32 -0800 (PST)
X-Relaying-Domain: lagfreegames.com
From: James Park <jpark37@lagfreegames.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm: drm_basic_types.h, DRM_FOURCC_STANDALONE
Date: Mon,  7 Dec 2020 10:15:38 -0800
Message-Id: <1607364939-640-1-git-send-email-jpark37@lagfreegames.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <202012080129.qAoCOovN-lkp@intel.com>
References: <202012080129.qAoCOovN-lkp@intel.com>
X-Mailman-Approved-At: Tue, 08 Dec 2020 08:32:06 +0000
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
Cc: James Park <jpark37@lagfreegames.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Create drm_basic_types.h to define types previously defined by drm.h.

Use DRM_FOURCC_STANDALONE to include drm_fourcc.h without drm.h.

This will allow Mesa to port code to Windows more easily.

Signed-off-by: James Park <jpark37@lagfreegames.com>

James Park (1):
  drm: drm_basic_types.h, DRM_FOURCC_STANDALONE

 include/uapi/drm/drm.h             | 12 ++-------
 include/uapi/drm/drm_basic_types.h | 52 ++++++++++++++++++++++++++++++++++++++
 include/uapi/drm/drm_fourcc.h      |  4 +++
 3 files changed, 58 insertions(+), 10 deletions(-)
 create mode 100644 include/uapi/drm/drm_basic_types.h

-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
