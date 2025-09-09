Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5930B4A260
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 08:38:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFD7810E629;
	Tue,  9 Sep 2025 06:38:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DP9hRtGf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A3F410E635
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 06:38:00 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-24c89867a17so51349485ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 23:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757399880; x=1758004680; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HJiukvQMYchQJB9oFovtwsPeen/LDiO7bwNq5dPromA=;
 b=DP9hRtGf/Eq2TAj3Jw1zsqCemLdtuGfiNNUrRMsw/MperKWPsJHq4kpfywyH0DuUpN
 xYAMLCnYlj73V12fGjFG6fSQoZt2MBUoiwIl4DmcybiHpBEsrGscXuIdkFmY9ywMNzW0
 lfCz8uMxM6aEsaMhhxvUw7kXTAV8qWFYGzbix6kJL92IZ1hhvHpVkoEwcgPi4PwPRtnM
 xpQvJ7ax0OqrtUcBNtK7hgGIssJ2Tzhp9QNhPbOB3/Q7njqUiF7xjgjv4MSqw1M+7lQg
 YDO6TIsPHFxtZDIp67nU5oxkPMCHjiyvvm8U2gL1yibMo70fed7GMe5R5ESxChQvuur3
 NSkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757399880; x=1758004680;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HJiukvQMYchQJB9oFovtwsPeen/LDiO7bwNq5dPromA=;
 b=eZHAv+oGGUsvAnseCE70ebwh2cLkIU37FNB8KWLDjOgwyXGmibPyE7rz6QfwSwgE6H
 bMQPC4p8OcrGdmvGSJsNdbIg7jl3bP1pkoOvmEAhg04PFn7ZhB4XNdrNc1t6qkTZ82Rz
 6h3RmswEcTB2rNMqAxc8HxI4KwZr3XZ5jxwmqfCrtv9ltE1IWFdUoscGlikCT8Myoveb
 CROQMvkV5IUk4EWu7SQ3315wq22fKlLlj1iV/lBV+MXS7axMl2OLCf2qHd3OETKhwyPO
 xMcdmIKPKrNIhc3J6035GcnmfDCQ5XwWMNr5QpwGJa40uUi7PhCkFbh2l0OU7eccCZqN
 msfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXA+o4xvtH12A56KsGA+DQz9NudJD4RYuVFRXTmN2KjmduEKt5HLgPfj05kNZ3xXtAiwigYUnxN5vo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxD88vh0MvmKHTPLfwz79w3DdirvAj3PK5kb5OhiedsbFye91da
 XOJOv2YqIy/JFKTjLQXhdoAdGY5H3hsBzo0Q5UI0e1B2zYN2qgOgmyO2
X-Gm-Gg: ASbGncsag4SvnItqhKQnyAIgJMY8vR3h+yS+efbmN+/cK1X5ygIxM8S4LaPHTyTtT0a
 gWw8ymu3vD0o8FwM+wSBhTkF8YK1YzWDZRMXckpMKZ9EZUk5JSnB1RUwgam7b2oQgbpbz0102mb
 mjWH4IhOrrLCZ7iYeYyi/sojYPz+49pMZENwFniTqRQyik4hDLPcS/ezkNBYHmgcXcPk5rtrOk/
 dz0k3PUXCAT07ARDUH0G78kuy2jVkvBcph+VN8IbaN7BS4CJ8QzoFMYI4zdKPSB9777BYKR5Fjx
 J2+gfABkNecSavYI2wj2Uc/GhFR+NGvmYprFHX8GcnZGXT0bu7x5uCoBlZo/uF7VRySKg/QY9B2
 r6D+Hrv3Elyq7LEmvgakR8eFSqGduaNV9WRLh
X-Google-Smtp-Source: AGHT+IFotQUFwQ0lDMECPT4okq9EM0mj1zKB3mE36lhz+JWVRbzizXv+ZEreuSwiB9QKkN0vzAYNcw==
X-Received: by 2002:a17:902:ea09:b0:246:7a43:3f84 with SMTP id
 d9443c01a7336-2516d33d4ebmr152795015ad.5.1757399879430; 
 Mon, 08 Sep 2025 23:37:59 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24903724b94sm299653805ad.35.2025.09.08.23.37.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 23:37:58 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id 1C2AD4206923; Tue, 09 Sep 2025 13:37:56 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux Framebuffer <linux-fbdev@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>
Cc: Helge Deller <deller@gmx.de>, Jonathan Corbet <corbet@lwn.net>,
 Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH 0/3] Documentation: fbcon: formatting cleanup and improvements
Date: Tue,  9 Sep 2025 13:37:40 +0700
Message-ID: <20250909063744.30053-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=659; i=bagasdotme@gmail.com;
 h=from:subject; bh=pfVPxDxt9WcZWPqzB85AUj4avLsvCa8ghrZrU5R+vBk=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDBn7Tx20iWWJjb/lWBh8I1FUi3Guacrjs6uD9i9I019af
 tpCU0Wlo5SFQYyLQVZMkWVSIl/T6V1GIhfa1zrCzGFlAhnCwMUpABORyGb4n3z/yTEjjXcT+Vv+
 Xljb/Dg67vzpPRs1ys24ltkvtzayq2X4K2ixfbfWP88tBZvtPlSHWTg/m3lcer2I9ko59VUiS6/
 2cQMA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp;
 fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
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

Hi,

Here are reST formatting cleanup and improvements for fbcon documentation.
The shortlog below should be self-explanatory.

This series is based on docs-next tree.

Enjoy!

Bagas Sanjaya (3):
  Documentation: fbcon: Add boot options and attach/detach/unload
    section headings
  Documentation: fbcon: Reindent 8th step of attach/detach/unload
  Documentation: fbcon: Use admonition directives

 Documentation/fb/fbcon.rst | 42 ++++++++++++++++++++++----------------
 1 file changed, 24 insertions(+), 18 deletions(-)


base-commit: 7e5a0fe4e8ae2eb341f8ebbee2b24231a58fc28b
-- 
An old man doll... just what I always wanted! - Clara

