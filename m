Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F47D2FB10
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2019 13:40:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 656026E340;
	Thu, 30 May 2019 11:39:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A570589E0C;
 Wed, 29 May 2019 15:20:56 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id y11so1820535pfm.13;
 Wed, 29 May 2019 08:20:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=6eBFjJD3aKGHAnE+1SU5t9f9CGu+6Cenasy6t4yondY=;
 b=Lzwjog5e2HIBcVtT5UyjhsXMEw1Mcmq9FtaFMlXFrD0Dfb5RK/46ZDNCPyA2AHunDs
 1Et5yxCZlY0dPu71YEG/AYU5XAC+P29QCHGVnuKpH9wHSoB/cwlQoTnjVROWLg2cCyfc
 1+euiJACMns8MnynGGzsmyTvsi4dvl/W9/bYiccIM8IF+nb4okDZyPzKZZUZ4QJptVbK
 rDJj9Bc6TaF8aGOO31lQY/vm+iU9NO1mL0g2wCSXDGhCwQ6GR74aiH09KXlSECaoTXc3
 HrawL8gYrZTvMtrkUVHDdqdS012joPib19Kx7/LH8L7azQxERE1Ye10/rqShlsk9Uhl4
 OfWw==
X-Gm-Message-State: APjAAAUNF5XiaBl1yCkoebolB54DjMnUK5NnTvmjQS6k2JO4RiL140G8
 PR0Pqrh1F49B55ZlcTBiyLE=
X-Google-Smtp-Source: APXvYqwsK9X6twfjEGzAr+bheko4HzYhn9BKzUdjsEJUCaqDqloGZnrPP305oVLPbHSR/dRnlkFKIw==
X-Received: by 2002:aa7:9ab0:: with SMTP id
 x16mr140644220pfi.201.1559143256356; 
 Wed, 29 May 2019 08:20:56 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id r7sm6198321pjb.8.2019.05.29.08.20.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 29 May 2019 08:20:55 -0700 (PDT)
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To: robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
 jcrouse@codeaurora.org
Subject: [PATCH v2 1/2] a5xx: Define HLSQ_DBG_ECO_CNTL
Date: Wed, 29 May 2019 08:20:21 -0700
Message-Id: <20190529152022.42799-2-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190529152022.42799-1-jeffrey.l.hugo@gmail.com>
References: <20190529152022.42799-1-jeffrey.l.hugo@gmail.com>
X-Mailman-Approved-At: Thu, 30 May 2019 11:39:54 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=6eBFjJD3aKGHAnE+1SU5t9f9CGu+6Cenasy6t4yondY=;
 b=TMVdakylrYLBvS2e5FOebfvoGSXphrNfI/wi48cmsmulTCmDUCQl2XZ1pnfkPhD+Kz
 XXQ2h123ZVKesKWktsdo8DPi/oXehWqbtILrCjetGEarTs5bIVZzXUrBcjjlaBVQRoPB
 v/CX+hi/30AJi8edW2rfnzrw+G5BAR7oSPbCWEhPA0XmmRVvReTFw6NsxINTHxXpWJ2O
 ABs8j8l/DrtDCy7V9vYBKUj6b+wG4xnthkdYaUThkzm8qY+P4faUUsSVW8p0/izoDs2C
 PCrjyoH7HVE2b/gJAI5dxkS92vTsowAj7FB17FDLd9bb8ojtHKVeaIxHtXXuQXjLv2bX
 vhWg==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: marc.w.gonzalez@free.fr, linux-arm-msm@vger.kernel.org,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 freedreno@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

LS0tCiBybm5kYi9hZHJlbm8vYTV4eC54bWwgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKQoKZGlmZiAtLWdpdCBhL3JubmRiL2FkcmVuby9hNXh4LnhtbCBiL3JubmRiL2FkcmVu
by9hNXh4LnhtbAppbmRleCBhZTY1NGVlYi4uMTYyMDM1MTIgMTAwNjQ0Ci0tLSBhL3JubmRiL2Fk
cmVuby9hNXh4LnhtbAorKysgYi9ybm5kYi9hZHJlbm8vYTV4eC54bWwKQEAgLTE1MjMsNiArMTUy
Myw3IEBAIHhzaTpzY2hlbWFMb2NhdGlvbj0iaHR0cDovL25vdXZlYXUuZnJlZWRlc2t0b3Aub3Jn
LyBydWxlcy1uZy54c2QiPgogCiAJPHJlZzMyIG9mZnNldD0iMHgwZTAwIiBuYW1lPSJITFNRX1RJ
TUVPVVRfVEhSRVNIT0xEXzAiLz4KIAk8cmVnMzIgb2Zmc2V0PSIweDBlMDEiIG5hbWU9IkhMU1Ff
VElNRU9VVF9USFJFU0hPTERfMSIvPgorCTxyZWczMiBvZmZzZXQ9IjB4MGUwNCIgbmFtZT0iSExT
UV9EQkdfRUNPX0NOVEwiLz4KIAk8cmVnMzIgb2Zmc2V0PSIweDBlMDUiIG5hbWU9IkhMU1FfQURE
Ul9NT0RFX0NOVEwiLz4KIAk8cmVnMzIgb2Zmc2V0PSIweDBlMDYiIG5hbWU9IkhMU1FfTU9ERV9D
TlRMIi8+IDwhLS0gYWx3YXlzIDAwMDAwMDAxPyAtLT4KIAk8cmVnMzIgb2Zmc2V0PSIweDBlMTAi
IG5hbWU9IkhMU1FfUEVSRkNUUl9ITFNRX1NFTF8wIiB0eXBlPSJhNXh4X2hsc3FfcGVyZmNvdW50
ZXJfc2VsZWN0Ii8+Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
