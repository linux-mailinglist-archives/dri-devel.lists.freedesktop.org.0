Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E192CE9D5
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 09:34:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3086B6E140;
	Fri,  4 Dec 2020 08:33:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc61.google.com (mail-oo1-xc61.google.com
 [IPv6:2607:f8b0:4864:20::c61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D20D6E122
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Dec 2020 04:54:25 +0000 (UTC)
Received: by mail-oo1-xc61.google.com with SMTP id z13so1095846ooa.5
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Dec 2020 20:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lagfreegames.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=PaSbqBcYgPQDqHBtOo9OFqMx4zaVuZQk/ak/JaKydfw=;
 b=TTofd94uue+uhmYzgxdj+xitkTrwbkyLwCgkspdQJIROEkB008e25qczjkdNLYBRge
 WkS2zxNYnwW9F2bHg051KrDlwPIr32J90Wtv9DmAD/D7BaMj5Aj8YIs/NIruHuyq4gRm
 hCtI9Jw7nImSd3vpj99hFJ/DwFi4xv5SV4ffhIUuvWUtrx1rSe6b4hAKIBc33ON+v7IL
 YZKegFMeuXL2MfM0QcC9+EEkYSrbHijeetA/8PogoTAFQrpzU/2oSNqC4jPkKcoXYw3a
 RGG0VGeYnz3nZwaAlDNGAddp1+xczof9/8XRAF2JDQO/NCPbxWUEqzpPRCs9dIBzm803
 YmiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=PaSbqBcYgPQDqHBtOo9OFqMx4zaVuZQk/ak/JaKydfw=;
 b=o2eVe5fuXEFbtcvsPKLuz+bsmvKW0GrpkKidhgbnm5QMykcR1V7Mv0Y+XMPvRShrax
 TFK1hMtOaFtXghdz3pSUSyiojp62w46mBFMXFSwBBM5O/2BVcs07svfiSiAwIowAUd+Z
 ZQhNT2ht68rKTN5vb2iMdN+ivGjTn5hcwcZSrWtEQY6fBWnuhDJ9B0bf7qx4L1fb0A3N
 Nvb7KZIc/FvRBut8H13Ftbf4eQjTUi/xxrnv3D0uZzDd4x/FHuG6bPmD/cnlLTdRnIAf
 FezPJrzSTHgvKiqBSeoKzDudc1eGwnFIsoBUlQU+vVc3Ufk0kGYGEvwfbI+mZXejob8u
 1MGA==
X-Gm-Message-State: AOAM533W1vlIOyS6XLj6mpzt11GnJZWRlBygXZAXsTITD4722ciWKQEG
 AS5iclwxoEURjtVGEdZMyMzEuKFq3XemJ0xW5fPc6csy50hB5g==
X-Google-Smtp-Source: ABdhPJz9YBv4u3kGdbIgMAhyANchj6HBdAMV0liHs2toh8cqYPPWkYiJPVMYOSyqgkPFOTKxJvRU979/4Son
X-Received: by 2002:a4a:8552:: with SMTP id l18mr2163847ooh.10.1607057664477; 
 Thu, 03 Dec 2020 20:54:24 -0800 (PST)
Received: from DESKTOP-G3VVM7A.localdomain (c-24-5-176-39.hsd1.ca.comcast.net.
 [24.5.176.39])
 by smtp-relay.gmail.com with ESMTPS id g12sm229922oos.21.2020.12.03.20.54.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 03 Dec 2020 20:54:24 -0800 (PST)
X-Relaying-Domain: lagfreegames.com
From: James Park <jpark37@lagfreegames.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: Allow drm_fourcc.h without including drm.h
Date: Thu,  3 Dec 2020 20:53:36 -0800
Message-Id: <1607057617-145-1-git-send-email-jpark37@lagfreegames.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <CAKMK7uG3JbUuaJ3UUTHgeYCKnD9+n_bbeX=xka9o+TLJHwHJZQ@mail.gmail.com>
References: <CAKMK7uG3JbUuaJ3UUTHgeYCKnD9+n_bbeX=xka9o+TLJHwHJZQ@mail.gmail.com>
X-Mailman-Approved-At: Fri, 04 Dec 2020 08:33:34 +0000
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

Add DRM_FOURCC_STANDALONE guard to skip drm.h dependency.

This will allow Mesa to port code to Windows more easily.

Signed-off-by: James Park <jpark37@lagfreegames.com>

James Park (1):
  drm: Allow drm_fourcc.h without including drm.h

 include/uapi/drm/drm_fourcc.h | 6 ++++++
 1 file changed, 6 insertions(+)

-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
