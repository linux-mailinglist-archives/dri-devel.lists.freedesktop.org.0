Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 594DA2CB6A4
	for <lists+dri-devel@lfdr.de>; Wed,  2 Dec 2020 09:20:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AB026EA0B;
	Wed,  2 Dec 2020 08:19:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe62.google.com (mail-vs1-xe62.google.com
 [IPv6:2607:f8b0:4864:20::e62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75BB86E4F8
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 10:02:37 +0000 (UTC)
Received: by mail-vs1-xe62.google.com with SMTP id k17so582957vsp.13
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Dec 2020 02:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lagfreegames.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=IT0bDvlSSAM8NaADEbGQqGWc9r4mnD3T3VYGbtLqXsA=;
 b=VLQFTkzy80RPjfcRt527rra7cc/Vz2/BA2chjCKvVkOwzmP3GJUcdohGQniSuFN8QY
 fL6BVphGdxkzw6nYt54zroXGMeMQutbODhoO4TiEGaj40C1LZqT8GEMY3dnINj+FsDmQ
 of/ftBGVeD7mC11x5G67TVa5WnF+wxbHGCvz8O8l0OkVb68YkRXr/44KVtMUuOntACbj
 L1z2m+CMM7OAOnDjRCNC4FyfY7Kjiiq+R2WarCNGtl/kSoJctIb3knny+Gs9MGOfzc2/
 HtY8Li8fFmmHdm8TxfHFa8Z++7c/XT2AQlPE3rglPKzxyGJY47GAvy4O/BE7IUpyCRIs
 Fr0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=IT0bDvlSSAM8NaADEbGQqGWc9r4mnD3T3VYGbtLqXsA=;
 b=JfmiBEwFm9aKtO0PpLKZ0TGbBZnmDD9vs/Mz3VvbslfHF5bcSN310r/Pwtg1pW0Pmv
 tYwJfSIB0T2Y7nVfy2K18gqNDDbM/URGrUQ0TKuI/K+G5ELk704EsiPH7ODEh/vwR+6z
 03sQwkR3vOpxyjSCZLxigbpg7MV0oNs7X4zKDGFA5w7xVi6574P+5psPaJ5psKid69Df
 1NHzXxCG2+sSYud3EndZnNYwSkRqr/fmGHkGsbIDzNjy46USpHvja0q19jbBzVM8EP4x
 BkZClKDUg3BrX2vuKLvSWreEAXDI7mvKdESetWsUqcE+nhUb/zaDPKJj0TEHMCt1crrv
 SJqQ==
X-Gm-Message-State: AOAM530A6vX9o4L0m5UY+IDA0nGaMjlMV6kqtyHcLuisdgq8I4DS4noS
 iuf2SxMP5ieUJagc0kfCaf6UjvFKikkMrzZqbHR6JlajLLlopQ==
X-Google-Smtp-Source: ABdhPJzmfhR099F2WVMLXt2flUSlx6ktEtDZYAAO0pJqJIaReVM2TRmvmXfG0IeOtVGzKDKDIjyBXK8ozyJZ
X-Received: by 2002:a67:80c1:: with SMTP id b184mr1596981vsd.18.1606816956678; 
 Tue, 01 Dec 2020 02:02:36 -0800 (PST)
Received: from DESKTOP-G3VVM7A.localdomain (c-24-5-176-39.hsd1.ca.comcast.net.
 [24.5.176.39])
 by smtp-relay.gmail.com with ESMTPS id e67sm206279vke.13.2020.12.01.02.02.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 01 Dec 2020 02:02:36 -0800 (PST)
X-Relaying-Domain: lagfreegames.com
From: James Park <jpark37@lagfreegames.com>
To: dri-devel@lists.freedesktop.org
Subject: drm: Fix drm.h uapi header for Windows
Date: Tue,  1 Dec 2020 02:01:55 -0800
Message-Id: <1606816916-3724-1-git-send-email-jpark37@lagfreegames.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Wed, 02 Dec 2020 08:19:47 +0000
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
