Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A55DE116A0D
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 10:47:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 386026E378;
	Mon,  9 Dec 2019 09:47:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FD246E0AD
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Dec 2019 17:19:01 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id q9so12942480wmj.5
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Dec 2019 09:19:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Gu+8XaIloextUHW957Mh8GSvlNfk6Ho+2WvTpE6YLbI=;
 b=eJ2O6hh5h8EVxivlHRD9bBY2UvtLzrAmaCtTSmRwgGeG/wyRhB29b+IvaMdSdsFenX
 gcI9ZZMnVjLaV//EWzRdfWHfSCqcUEayNDqBuU6ac9njlfBJ9EPDnTkjWf12JpgMOJB3
 NrO6ihqV+IM2vxswaSRF409mk5yyg08m7vORs8DRMDLlINS/we5ZDP79VtXw3Tro3BQi
 o/+BCHGMqXlNRk+dgrW0wF/Wp/5NPZMGZF2/uuP9rEbnLJ0Cjs523vRohAKSXA3N2gDs
 U8Nq7bJzblF5SkXIvU1zZBshqkL5y14stU+z3G0kyRGW8mf0dlntylryhp/LDOiOE/3t
 xebg==
X-Gm-Message-State: APjAAAU2XvL8YNVNQ1bx7C4t+vkkDhJjyI5IEWSF0gV8xyMUzmz19hRD
 8bW0/+kBlGTjRF5BjWJOrXY=
X-Google-Smtp-Source: APXvYqwl5vSlTNtHmhBHy96IhpgjESZ2vDOODYVSQ2Xh9Rx4mQ3d3VrOlJuOKtGiQrnauWl4d2kqKA==
X-Received: by 2002:a7b:c0d8:: with SMTP id s24mr21854540wmh.30.1575825539428; 
 Sun, 08 Dec 2019 09:18:59 -0800 (PST)
Received: from localhost.localdomain
 (p200300F1371AD700428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:371a:d700:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id g25sm11791383wmh.3.2019.12.08.09.18.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Dec 2019 09:18:58 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	narmstrong@baylibre.com
Subject: [PATCH v2 0/2] Meson VPU: fix CVBS output
Date: Sun,  8 Dec 2019 18:18:30 +0100
Message-Id: <20191208171832.1064772-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 09 Dec 2019 09:46:36 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Gu+8XaIloextUHW957Mh8GSvlNfk6Ho+2WvTpE6YLbI=;
 b=ntEJWwp25ChtTEmus7kaTseWRnnt4433csuQqPdH/cYACBb1MO4xJwO6wWHQSbA1zX
 fnvaiAiCgGo6ynY4RRumZL14YYOP3zCqSF4rsoFfG1tolFIeD7zxZmUrSvCozM1FYu24
 W6dBfwOmS1aJ9rdS0GUPN8FNgBc0R8OOKA60VHUzqem2s824NyrULJx866i9Ki4Qc/sr
 UtmZIGkGJvCe7lkSG7zeMxMcAEaaksaFIAjCP9+FuItI1MzF1rF3XUfTuG4dUaYTGTOl
 8BvS68O2VO0h1jM4/ypFZCnn/tkW44q/aSUi/ciFzL8FS7nu1DEJBpchEeiwDIRmeVI4
 q5sA==
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGdvYWwgb2YgdGhpcyBzZXJpZXMgaXMgdG8gZml4IHRoZSBDVkJTIG91dHB1dCB3aXRoIHRo
ZSBNZXNvbiBWUFUKZHJpdmVyLiBQcmlvciB0byB0aGlzIHNlcmllcyBrbXNjdWJlIHJlcG9ydGVk
OgogIGZhaWxlZCB0byBzZXQgbW9kZTogSW52YWxpZCBhcmd1bWVudAoKQ2hhbmdlcyBzaW5jZSB2
MSBhdCBbMF06Ci0gYWRkIHBhdGNoIHRvIHJlbW92ZSBkdXBsaWNhdGUgY29kZSAodG8gbWF0Y2gg
cGF0Y2ggIzIgZWFzaWVyKQotIHVzZSBkcm1fbW9kZV9tYXRjaCB3aXRob3V0IERSTV9NT0RFX01B
VENIX0FTUEVDVF9SQVRJTyBhcyBzdWdnZXN0ZWQKICBieSBOZWlsCgoKWzBdIGh0dHBzOi8vcGF0
Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTEyNjgxNjEvCgoKTWFydGluIEJsdW1lbnN0aW5nbCAo
Mik6CiAgZHJtOiBtZXNvbjogdmVuYzogY3ZiczogZGVkdXBsaWNhdGUgdGhlIG1lc29uX2N2YnNf
bW9kZSBsb29rdXAgY29kZQogIGRybTogbWVzb246IHZlbmM6IGN2YnM6IGZpeCBDVkJTIG1vZGUg
bWF0Y2hpbmcKCiBkcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fdmVuY19jdmJzLmMgfCA0OCAr
KysrKysrKysrKysrKy0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjcgaW5zZXJ0aW9ucygr
KSwgMjEgZGVsZXRpb25zKC0pCgotLSAKMi4yNC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
