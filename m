Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C551A1C8A7
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jan 2025 15:52:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A8FD10E371;
	Sun, 26 Jan 2025 14:52:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EE7A10E153
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 18:57:20 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id
 5614622812f47-3eb8559b6b0so1338880b6e.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 10:57:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737745040; x=1738349840;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xGMgmoY0LY1jYeHosksc3lEzyePSjrOJ+ms89qwpDbU=;
 b=oJkQpgsbAsEeBrQn7yT6bX5c2ljB2nT+/QrTOrcYYS++XKLPTjv/9p+JwgDhzy3GTV
 vKoVw9is5d0qWG5nMJSpqktQIBDNqPwlnB5guN2XzgvkupXJMFIORpe+Qz9WZeThb99j
 JAebBsxK8fnvyPhdyizuREqZPBeMxUr6xTcWYu9DqG96LOe4C1ZQJx3WCztq0m8CIh8W
 lnTcbNXoczBEyHcFXj2rSBIN6rbiioxmf+YsZ4areLPZZO44iezcEAqmPfHbGMlLQQpm
 9/wkUV4XuLxvMbTxK2Lc8YW/lgXZr0AmizwrKLZUOmYKw1qIXQCq3nUy1YKFIW0ejOsW
 nIlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAZ7W411nNL6jelKnwJeA6Ldr/c/lVVqyJPjk2ScxW1vG1datweUCxgGddEFRdWjavpLzv6E6ff1g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwvtJaETOjUbHWVzyE7/mgWh03ZiFav5TfTpmjwkCi3T/LLiP+L
 O3ob/L/S2dKpgWJxerenIpECRgcDkj7yyUFO2tgNAaXJAaimV/Yr
X-Gm-Gg: ASbGncuhzff0J5WjXtKDUvlW4nRSnJ36qEE0fOeAnAEmjVDrbnKAh68up3Eas5O4ytL
 oT5CuN9xuMqYGlsgJJ5wCtPzqZaDwNmKXu6XxPt4E476hJ6YkRZaSIbbWWinqesOI0qtpyboJ7h
 GetPUkg86WAcGSNTMYWyUEmzxl2PzH2vk2ZeHghyOXJ0Z8rQ9Yf3lReazduISdHQYb3P8B6IDDP
 lZJR5T1Frq+4glmuICyF2zIZvJzKSCX3ASAmXK7z2chTfqOqX6jeoW/f+wbj5TKpLX2iM4JdHdv
 ywN9vA==
X-Google-Smtp-Source: AGHT+IGY1WDfUPlJXzyGwuovW1DYiMaWm6sZuDaLLKCI/I7TLn7HTX47DkqdVsqMhk1rQsxOid4Utw==
X-Received: by 2002:a05:6808:2f0c:b0:3ea:6533:f1b2 with SMTP id
 5614622812f47-3f19fdd1248mr21671215b6e.30.1737745039871; 
 Fri, 24 Jan 2025 10:57:19 -0800 (PST)
Received: from muster.uejji.net ([47.188.205.107])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-3f1f08bcb0asm543915b6e.24.2025.01.24.10.57.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 10:57:18 -0800 (PST)
From: John Edwards <uejji@uejji.net>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Hans de Goede <hdegoede@redhat.com>
Cc: John Edwards <uejji@uejji.net>, Andrew Wyatt <fewtarius@steamfork.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] Handheld gaming PC panel orientation quirks
Date: Fri, 24 Jan 2025 18:47:53 +0000
Message-ID: <20250124184754.56506-2-uejji@uejji.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250116155049.39647-2-uejji@uejji.net>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 26 Jan 2025 14:52:19 +0000
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

Hello.

I am sending an updated patch series soon.

Thank you for your patience.

John Edwards
