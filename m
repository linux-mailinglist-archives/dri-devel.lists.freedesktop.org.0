Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D71492CD0EA
	for <lists+dri-devel@lfdr.de>; Thu,  3 Dec 2020 09:15:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59B596E0C8;
	Thu,  3 Dec 2020 08:14:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x363.google.com (mail-ot1-x363.google.com
 [IPv6:2607:f8b0:4864:20::363])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D48316EA0E
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Dec 2020 09:08:28 +0000 (UTC)
Received: by mail-ot1-x363.google.com with SMTP id 11so981197oty.9
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Dec 2020 01:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lagfreegames.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=cqnqressiNHlILsKyNisYko29sy3I3Q5Qe64an/iX98=;
 b=QV7L3XuOPKZLv3dw/c0jdkCBQJrXzGCJzZx2B/c07AIcZCpniFKRo6r54NJibxCiqs
 RKHjELp3BidyGB4nHW8CFsSV0QHIq1THTovvWKMaj3HBBaqH7j2JIQwR4BxwX7l8uZH5
 8VRkMtNYcjxkV18oiPB6sPrftqMfoLf+05X/aoRQ2SQINZ2IO9Av0zO7rQE/CB8vTakG
 AIvS4+8GpHeIq5T3P1vtAx1LXUr7a/HCLosZZ7nSfM0H3c8V3s5zg7d5lPNmdjULZgfY
 3aJCNHeeSXktX1VwoX8IufOEGmk7kNN3h5YRV9eY/AiWrAZZUE17hTJpV+nrE/MfWIYN
 l44g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=cqnqressiNHlILsKyNisYko29sy3I3Q5Qe64an/iX98=;
 b=gGNecY5ylBdg8IGCJEbL5WJv2sBA5owxG+qNVCMx2GZetrd13b5ZAqH2LfdPtNDLSj
 jIoUmHbkQY4yG420/qvVpGqnD4jHbxEbp8qxKWh7SIDh1TtXsP92bDSD7xERQ/muuCqn
 sDevvF+lSYMAyFpXm3w3/7rVlq1sH+9S8VnxeZdzjYZ55LDl0pqc+5suAuolzS5s1Xpg
 sQ//+oYLib2obpJ6TnwYBDZW+kbAE/XDvOprCwxPttWfbUtx+iP1n4ht8EkGAwKCiS+s
 dlG7CFCo4KgYcysZYPeP+0w1Kjiccgz2Bxh18eZnBdC5wwyuQjhGeecgjYLBfYu/sBS1
 jr6A==
X-Gm-Message-State: AOAM533rek0YIgY3siQzFvx2YLo8qNVdjWFUaFaoW0oXbCzwWDWBOs8n
 291rQQy9RWV7gRXLyDoTf2MPzQ3vA2P4OV8f1qVpKdlBXqGasg==
X-Google-Smtp-Source: ABdhPJzYrsfiLUvLrBuDB6kmo2YyHnL7TtJ5jHlVTJqA406toX2bbUwzvZP+GuNjWWaab5jxpF8uUEEi5Y/Q
X-Received: by 2002:a9d:261:: with SMTP id 88mr1094908otb.202.1606900108183;
 Wed, 02 Dec 2020 01:08:28 -0800 (PST)
Received: from DESKTOP-G3VVM7A.localdomain (c-24-5-176-39.hsd1.ca.comcast.net.
 [24.5.176.39])
 by smtp-relay.gmail.com with ESMTPS id l13sm198262otb.10.2020.12.02.01.08.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 02 Dec 2020 01:08:28 -0800 (PST)
X-Relaying-Domain: lagfreegames.com
From: James Park <jpark37@lagfreegames.com>
To: contact@emersion.fr,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: Fix drm.h uapi header for Windows
Date: Wed,  2 Dec 2020 01:07:15 -0800
Message-Id: <1606900036-126-1-git-send-email-jpark37@lagfreegames.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <xOk1dXNl1GdnDlbmgZsJHYWhW2KQB2oQCBLJ9NvRfmjr7mLqEtX2Bn85XMOWwagoS9diq7pu0EddxiiPncxxN-ZrY8KoueFO67kmqiw1CdM=@emersion.fr>
References: <xOk1dXNl1GdnDlbmgZsJHYWhW2KQB2oQCBLJ9NvRfmjr7mLqEtX2Bn85XMOWwagoS9diq7pu0EddxiiPncxxN-ZrY8KoueFO67kmqiw1CdM=@emersion.fr>
X-Mailman-Approved-At: Thu, 03 Dec 2020 08:14:41 +0000
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

Attempting to submit patch in response to https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/6162#note_712454

This will allow Mesa to port code to Windows more easily.

Hide BSD header and drm_handle_t behind _WIN32 check.

Change __volatile__ to volatile, which is standard.

Signed-off-by: James Park <jpark37@lagfreegames.com>

James Park (1):
  drm: Fix drm.h uapi header for Windows

 include/uapi/drm/drm.h | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
