Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FB79C8E09
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 16:30:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28D3710E803;
	Thu, 14 Nov 2024 15:30:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="U7Fl2dxY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C8DF10E7FD;
 Thu, 14 Nov 2024 15:30:25 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-5cf6f367f97so985111a12.0; 
 Thu, 14 Nov 2024 07:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731598223; x=1732203023; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=szKhuhQmiVIM02ZbdgLbY1lco3UqzkBAMcoq3GvKKrk=;
 b=U7Fl2dxYTMDjVSgXg5w5kHeUg7KTJ41PwIFv/W8kCfs0rmYQIzU5u6RNUTyBaE3FcS
 8r/xYkj7l6bbS1Bfqf18hFu78mt/h32TC3J6P9JjJFCY7KVvH0vmg23s1jMAkRkRp0AH
 KWdV2ApwpWEh3MEVmY4OAvXKBA5pAD6MHTmwItWxJga/i2FSjMXVsbds9lH5vVXmlJfq
 cNH6NiR2jwJoTBJdDhSb/pDNjbhTyoQHPYNJldF5YhY5cAB6x1U6OL1HYuRb5EAykUPP
 +T8kBWxCGIUCc11LkfXnxlywNu7BItud4cWON5pMoacq1nobBcc0gse4sTr1ChwMzzPE
 b5vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731598223; x=1732203023;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=szKhuhQmiVIM02ZbdgLbY1lco3UqzkBAMcoq3GvKKrk=;
 b=DtHNPBGIQuuIwPahwmlDK4MMQ0FBv74eKHK+cLgCaUP4bkjGuCIffzinhJCFUTsfgD
 YyvdZYBDWxyze1z4IVcoJOZ7ITwoS60LMshPyhMRHO8JHbTxhJW8LFFPkcyYWVXy1/jJ
 caeI5lCi+W8bh7zUOvNBLtn1hIkzLJ5muGjvU+a2LxpDWMkD3dgGoiW12BtRxM2z0+9z
 6TKhoCKqk9unheY4FQ8c+17dpywG7WduhryCeS9KEBK+pIRwkhMrwC97xGQ19VDelIn+
 ES1YzKraPq4wAtFBmSoTprxeQq1PVr5d/blPj0pGqPFTt5X1slCDJjjul1/ZaXEXGAbr
 TX2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVO8LBBbqMyOrELd3YMdOEy1Nbm/jDoIiLqw8nAhGAFXsjCZKUSf4X+zK69m5szRydBj3/3vm1g9cE=@lists.freedesktop.org,
 AJvYcCWSFaYAI9zz+S2EsN3y0AeAmqU1wie5gHMPi9qhmZTJWmrrvFKUOQ0EnOVgTGiAwN3ROP836nAk@lists.freedesktop.org,
 AJvYcCWyA8hgwzSdFZyzHCzKH+9z3MQc76AfRw/Lw6dv+Z0NJrjOLd4+KbSjuyf5GaSnQ4fop1clqGxRjzm/@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzuvRPJZL/AjBff2kjAXSueery8+cNENEDuZAI4KrBxBotoG2CH
 POeoyulIpK0uCr73rFkvy+UOa5o0DNdwF2jOgXqIYNp3igmE2dNF
X-Google-Smtp-Source: AGHT+IFn0AJrpN7erqmeNM/7HGlotZXPzE8O1SvFHPedjgfZG+/b95RXkljUudU1q+VN+H1HIMSRZw==
X-Received: by 2002:a17:907:31c2:b0:a99:fb56:39cc with SMTP id
 a640c23a62f3a-aa1f810644amr669660066b.38.1731598223137; 
 Thu, 14 Nov 2024 07:30:23 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:15c9:2500:bb23:40f5:fe29:201])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e046919sm74063266b.156.2024.11.14.07.30.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2024 07:30:22 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: kraxel@redhat.com, airlied@redhat.com, alexander.deucher@amd.com,
 zack.rusin@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 virtualization@lists.linux.dev, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Switch remaining drivers over to drm_exec
Date: Thu, 14 Nov 2024 16:30:13 +0100
Message-Id: <20241114153020.6209-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Hi guys,

switching the remaining driver over to drm_exec, cleaning up XE and the
finally remove ttm_execbug_util since it isn't used any more.

When I originally posted the patch set for drm_exec vmwgfx was to
complicated to trivially switch over. This is now done with this patch
set.

Additional to that radeon and QXL were never pushed because I couldn't
get an rb for them.

Please review and/or comment,
Christian.


