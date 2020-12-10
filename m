Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1245B2D5E61
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 15:48:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52BF36E89E;
	Thu, 10 Dec 2020 14:48:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x364.google.com (mail-ot1-x364.google.com
 [IPv6:2607:f8b0:4864:20::364])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0DF36EA3D
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 09:13:00 +0000 (UTC)
Received: by mail-ot1-x364.google.com with SMTP id d8so4217322otq.6
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 01:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lagfreegames.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Cs6x8olmmpDU9tysB1VpkPKlGDi/8AUBQntivNXFziU=;
 b=fLNNstYtpUFDGhvcTknQSih0ZLfk6zVw5hJDUKTzL+HyKOLID8VdTBMaa6P6OUNAhR
 FrWntncY3Wawwy3KKdqcBO/KIAetLDIMciVMrCg5WgIV2K72BHsdXop8eb6Wq3qQO5iI
 KzjNPqXc2dCxImWm8PQzRYo12a9vWpEmLjCFqlJrFpMi3UkbH1fOrvmFYGJedcG0F1On
 WlM2XBU6Irb+oT6vVI2u2KEakSNQ6/i7oJ3ee8Q07Cv2sCHv56LlSTo2Th0I+fDbnSdF
 GJ2rkZYFBefy5aP/GH6GjEztZU4c3/LQBU3RJUNdPdVJR3sErShvSgsRUTn6TtSDM7DJ
 XmBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Cs6x8olmmpDU9tysB1VpkPKlGDi/8AUBQntivNXFziU=;
 b=P5r1RfF9sv8AeBMSaaMguhNB5AOcINOz/3l5pwORQGSyV4i9KjD2t5BFRTI5S4yOYI
 k+SitkH2XKXQCWT85ZZJu4bUalgalBotBBIjdhFOFlYngbLWbJYrdAzMRUNMCoWXIuGx
 Rx5MeMTWv/h2BBNbtDyxIgtUZYznQ9Dy4l7CDcWZ4lS9+Gw/1TdbZC5MOnMUQ3J8xs5d
 uST/kb0+FJmG42imb1f3/6jyjdZYNVFDRnqtgt3nchagULaZGF90S1Nx0QtonuufCbM+
 6UCtnVJQ23JCrPXhFojCXgIhci79/RHmbDo/EKd5FJqN3bDBv19/Rsiu2xDGgmzVDRqL
 jEmQ==
X-Gm-Message-State: AOAM530a18R1l9dxkmTa0Apx0/DxqMuNsa1NY8/Pa4ZWw8whHAKkK2rj
 LibaDrnLFg+dMTa9hlTOJ+rQL593kZbryv+nfqzSe+L9a9Txlg==
X-Google-Smtp-Source: ABdhPJykad59B0Ftal+4njYY52IcLOnRbQTSbuv/2hHHSB0c1yVPdqmmk636paJe6Q6tUhV84lJ7zUiQdfFi
X-Received: by 2002:a05:6830:1e41:: with SMTP id
 e1mr5185700otj.143.1607591579885; 
 Thu, 10 Dec 2020 01:12:59 -0800 (PST)
Received: from DESKTOP-G3VVM7A.localdomain (c-24-5-176-39.hsd1.ca.comcast.net.
 [24.5.176.39])
 by smtp-relay.gmail.com with ESMTPS id q24sm744353oov.1.2020.12.10.01.12.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 10 Dec 2020 01:12:59 -0800 (PST)
X-Relaying-Domain: lagfreegames.com
From: James Park <jpark37@lagfreegames.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm: drm_basic_types.h, DRM_FOURCC_STANDALONE
Date: Thu, 10 Dec 2020 01:12:53 -0800
Message-Id: <1607591574-949-1-git-send-email-jpark37@lagfreegames.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <20201210103553.1ae238d2@eldfell>
References: <20201210103553.1ae238d2@eldfell>
X-Mailman-Approved-At: Thu, 10 Dec 2020 14:48:10 +0000
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
Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>

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
