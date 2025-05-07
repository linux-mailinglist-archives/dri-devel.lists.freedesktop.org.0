Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F7FAB0BC4
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 09:33:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6047210E9C9;
	Fri,  9 May 2025 07:33:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kfwpFN54";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08CA710E1C4
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 21:55:56 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-5fbee929e56so617339a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 May 2025 14:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746654949; x=1747259749; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=OCKpBqtn4nrcGr1i/oO1+zpQHkH9eaZfGFNJclKiO+o=;
 b=kfwpFN54q3yRq+SLtl/OpWhDVfjuVxitVOj7KlmY6oCYMU65llZB/WqPqwt4XlkG1K
 STFhoLDfbzEh0vhnSRjhV2oE0jfiBfCX8v8RoswDS5kkdqF4v7m76F7eb8C+P5X1MQIU
 ViwVHy92Bbbg7SXCBOYdM6iigoT6bFBRFyrngqcB3W28Qb7yNOK7kYx9s7Y8jp0pZnj9
 C6rj9uAA0o7yi0lRkYJshlEcmoBDTYKlKiIAojFfVTc+JB3MxuAKWwBUptYSYGD697Xu
 A/k4L7NZgTNYOwZgMy13Z0HDaNlFlq1fikQOIvKafMNLWfVqPBHo9OguUVyBDfPxBAoB
 llTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746654949; x=1747259749;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OCKpBqtn4nrcGr1i/oO1+zpQHkH9eaZfGFNJclKiO+o=;
 b=NIj4TZgwTU/ZGVw9g43rMIDG4VKbvHb5yBEMNmZyr6ER1jv6ylcTWuC9G8r8AnjjAz
 zKkekDjwPt/XpRW5TGDY8F4gr2NYjzlAPS+KnsMlBDnLKuKQBwD9aiaAA4xrvZTG9Znu
 IgfQ/KgHoJ1JknvU1AvDFbFTVq1TNe+eHOVtoqRNe6KvKB1Ft125TMpgV28a9DyPYaAG
 +Ags2vv06lorHHxM4Wapf6ZuaW5n+rZhwxOio6Ko6pzzQSPnp3lUnqmnCmYB31fcMvJ+
 ERFOcP8nQJmhvpvGeftGUH3ME4DXy0AEyq4LqQBA1bJ8L8ifewopmA9rXkgB2SPS5ji0
 uv9Q==
X-Gm-Message-State: AOJu0YykMLMfbs8AE1oSckQF/9PTM51SYn9fWfd57kFx/lWTscHe0XQV
 c562vx+IQreKP6C196A5AYIBfcX/wNjRzXJFu3+0uZvdWjRV5vbwroP3gqfyCo7ytKfg9D/lluG
 6XKszMySWJBnkvwcJfuSX0pwQOG8/viD4KJ4=
X-Gm-Gg: ASbGnct1zH9WSJk2cKnkNZYKwyUx41y1QWbyZuPLO6MAUOwvLP5RPHkwFAceTI25BjN
 XWuLUs7jmxm2UOn/D6Iz7d59R1dkGryJLSsdUIiStTOn6u3fn7/G6Uz1vLQS078dGddm2qFWT2F
 0xL8K5YX2rvAAuUa0yMPX+hQ==
X-Google-Smtp-Source: AGHT+IFg4ITILUSAc56OK0hvddCS+SXqP9a0Mhktmg9UvN3VMKyyLrmYBIzWJ9iA+YLajZnihSAyDLGr6TtlZQxiP4g=
X-Received: by 2002:a17:907:9717:b0:ad1:7db1:82be with SMTP id
 a640c23a62f3a-ad1e8e2a088mr462412766b.50.1746654948740; Wed, 07 May 2025
 14:55:48 -0700 (PDT)
MIME-Version: 1.0
From: Morales Manuel <m2581063@gmail.com>
Date: Wed, 7 May 2025 15:55:36 -0600
X-Gm-Features: ATxdqUGpJTRnv4oupnis4t2vY4M3ujL4XYv9ERur1JksLaJCPTh760-aTwXffd8
Message-ID: <CANzsOTKR=t6PN=aLN2m7+TW0+nD6jTH=vn9qWP-Pzn9j5EeX9g@mail.gmail.com>
Subject: Re: [PATCH 5/5] drm/i915: Allow vblank interrupts during modeset and
 eliminate some vblank races
To: dri-devel@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="000000000000c3d0e0063492cb61"
X-Mailman-Approved-At: Fri, 09 May 2025 07:33:29 +0000
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

--000000000000c3d0e0063492cb61
Content-Type: text/plain; charset="UTF-8"



--000000000000c3d0e0063492cb61
Content-Type: text/html; charset="UTF-8"

<div dir="auto"></div>

--000000000000c3d0e0063492cb61--
