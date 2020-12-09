Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2792D555F
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 09:26:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD74B6EA46;
	Thu, 10 Dec 2020 08:25:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x763.google.com (mail-qk1-x763.google.com
 [IPv6:2607:f8b0:4864:20::763])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7F606E9EC
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 11:03:19 +0000 (UTC)
Received: by mail-qk1-x763.google.com with SMTP id z188so769145qke.9
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Dec 2020 03:03:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lagfreegames.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=+yNHDbjJGRIEau55Sx3HGFzwv8bDOsO5T5HNaQdd1ic=;
 b=HRZ1+mceHIlFWMeT2gaNVfc7DuJTkAVGyhpnK+aYj99oEJyXSgCii8Hmf1bsf0sFJm
 4waqvvmWRTUAX591LIy8lfW1RhyzlmTnhWRat41Gz1heLUTBQTYkCWqihpeU4BkWu2H2
 OuDWxgTy5MkceDK6DBWk7d1plPsSX5DA/G1x2thx32/zFWKKnj53dpC9Ud1R3K3z9u1S
 eX7uYqXinX/5UEouts16E5NIKoxNBKPWYPvVzjviT11PUCU7ZNxkTD8WSw7EYo2dr6K5
 zTiMRTab4DfyFGtk35sPE0OYDnIEkk8IK0j+an+wm5isIokRuXQ2ntQeAfonRIlxMh8y
 dmsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=+yNHDbjJGRIEau55Sx3HGFzwv8bDOsO5T5HNaQdd1ic=;
 b=R4EIYBKu9GxafysK/SGSAIdM0Yvc/F+RvAhR0HAS/EIqJJ5dsSpGsUZiPNlatv2y4O
 2KvxupdRGYgwJDsfv1i0aDRc6jeXzIovMVM4q0Gn9KRnvsP2Hngs2hzQJtKXttjLj5ZD
 f1fHZQd3STEUi2Uut50ggy3aDtDnJ55XXAWEDPeoCz4ol+Z0MHL22b+9bnhub56DPIuu
 2YvWIwDV1n2i0wuws+SIvZR9lhy/SaF4f3G44p/CvkhQ+7vwKoYdUFv0GQ7AaiPnBGRD
 8IHsLUFm6rQuCfxQD0AZgKih1NudCO1/7caSA7GUK+wIxt1ylSYdl55ez9ugzGb+90IU
 xbXw==
X-Gm-Message-State: AOAM532WcqrsK29voqQSnZpIcAq9wgiqas5Mn6QiiBn7S5RkxP++NaVj
 VHnBaEoGhVsbe4yUyN6odUVbb0aOyfNC0vV+heXy+bwsMw9nkg==
X-Google-Smtp-Source: ABdhPJxg08p3/7iem4iIWmrMpZexapaJIJ8wXnppbRKg6buu+pZniYgiqrFOaMYiZpm+Huz0ck+ACOAJ1t19
X-Received: by 2002:a37:af83:: with SMTP id y125mr2276250qke.410.1607511798921; 
 Wed, 09 Dec 2020 03:03:18 -0800 (PST)
Received: from DESKTOP-G3VVM7A.localdomain (c-24-5-176-39.hsd1.ca.comcast.net.
 [24.5.176.39])
 by smtp-relay.gmail.com with ESMTPS id b18sm166117qkg.7.2020.12.09.03.03.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 09 Dec 2020 03:03:18 -0800 (PST)
X-Relaying-Domain: lagfreegames.com
From: James Park <jpark37@lagfreegames.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm: drm_basic_types.h, DRM_FOURCC_STANDALONE
Date: Wed,  9 Dec 2020 03:03:09 -0800
Message-Id: <1607511790-817-1-git-send-email-jpark37@lagfreegames.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <VOvpgkJSLSX_nWnr-hgXPJUyndzrUMaHHFos_Smu67du13TLRRPLDpySE45bht1cGd_xTsGoQbJ5gGT4Ofzmji1lXa5eZNCkmUf8QkUyWx0=@emersion.fr>
References: <VOvpgkJSLSX_nWnr-hgXPJUyndzrUMaHHFos_Smu67du13TLRRPLDpySE45bht1cGd_xTsGoQbJ5gGT4Ofzmji1lXa5eZNCkmUf8QkUyWx0=@emersion.fr>
X-Mailman-Approved-At: Thu, 10 Dec 2020 08:25:40 +0000
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
Acked-by: Simon Ser <contact@emersion.fr>

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
