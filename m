Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8247DCEA4A
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 19:12:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5407C899E7;
	Mon,  7 Oct 2019 17:12:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A14B2899E7
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 17:12:38 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id l21so14531534lje.4
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Oct 2019 10:12:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=ATgajGM0knFDOvUFrlvTQaM/0CVyM2rtapT97uJvanc=;
 b=laRpqWhgrfcgMfAt6gg7JWJDtDR6DGe9UzIRLkmR27eBZvjuS6ivmGCZWGkEwzHyYH
 +UOfa7GzU5e/Yng8YFTN8ih/yaiGkbO1egyug43hC/TF71ehFPOc6MUNDOKzgy9NghiS
 cY5/HfUSCl6DbK58vP+ZcwrZC7CLy0p711pBTgzQDIy/9NiYCH9gadRewc4k+YCugwsj
 yZtv15BcC463wnffyk/WIRay0XWJAWxoexS9T5oeGjVtAt4tTinN3vICW1UpAIXFXLWM
 zvVFAl/w+K0BJw6LjZ9EQJlNjyyUmeEL/5fMRfmfsq9HA0mmDzQkbb6zWUjJ51m35VwW
 /MXg==
X-Gm-Message-State: APjAAAWDN5Cyy/LNKSdOiFpWfP4kO7ggmhYQxW3z2kkreDvZJ+bt4YHm
 yzCyqj3/CYLgnbTS4S5I1GMUMASI
X-Google-Smtp-Source: APXvYqz4S5s+dCpOC+ggKTbRpVghylzMw3HwRfcF29xLs+OdwiJ0PwZOXogGK1sC7U7O7dUr2j2t3A==
X-Received: by 2002:a2e:8789:: with SMTP id n9mr19258977lji.52.1570468356652; 
 Mon, 07 Oct 2019 10:12:36 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 t4sm3254663lji.40.2019.10.07.10.12.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2019 10:12:35 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 0/2]: Finally delete drmP.h
Date: Mon,  7 Oct 2019 19:12:22 +0200
Message-Id: <20191007171224.1581-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ATgajGM0knFDOvUFrlvTQaM/0CVyM2rtapT97uJvanc=;
 b=QE0ot6pPszM/1IYyPHY2EYCiXQV+WzGMkS4krechP1cAFAmNj4E+grOoeBKIg/InYZ
 dpZkIH/q2RDs1vlYpxFIdFlO8OAcRmesJJpcfuC3xblGLbWdKa8O4hQwovjiVmHQf4kH
 1FqX3/qf858dHCWt7i2fvDXDJGT5SPNxknzpJMf+/yIpdn6WPK3m6srDD4nLSTfJe3zS
 gPdLD0oRiJXGh/mLdtajR7J3xzr0oAMCFlggg3UcB2EE7/M+D45H3JJYzOnc4c7Nd+18
 Gef5SUNwmOrbdyQ3OKhwWY4MBOq7sZ9663MwFzwYduDSQ3Kvq0IAtNSUJjRd7ezfnFHl
 gSpg==
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
Cc: David Airlie <airlied@linux.ie>, Maxime Ripard <mripard@kernel.org>,
 Ben Skeggs <bskeggs@redhat.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Dariusz Marcinkiewicz <darekm@google.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T25lIHVzZXIgb2YgZHJtUC5oIHNuZWFrZWQgaW4gYWZ0ZXIgdGhlIG1lcmdlIHdpbmRvdy4KRHJv
cCB0aGUgdXNlIG9mIGRybVAuaCBhbmQgZGVsZXRlIHRoZSBoZWFkZXIgZmlsZSBmb3IgZ29vZC4K
ClNtYWxsIGJhbmQtYWlkIG9uIHRvcCBvZiBub3QgZ29pbmcgdG8geGRjIDotKQoKQnVpbGQgdGVz
dGVkIHdpdGggdmFyaW91cyBhcmNoaXRlY3R1cmVzIGFuZCBjb25maWdzLgoKCVNhbQoKU2FtIFJh
dm5ib3JnICgyKToKICAgICAgZHJtX2RwX2NlYzogZHJvcCB1c2Ugb2YgZHJtUC5oCiAgICAgIGRy
bTogZGVsZXRlIGRybVAuaCArIGRybV9vc19saW51eC5oCgogRG9jdW1lbnRhdGlvbi9ncHUvdG9k
by5yc3QgICB8ICAxMiAtLS0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9kcF9jZWMuYyB8ICAgNiAr
Ky0KIGluY2x1ZGUvZHJtL2RybVAuaCAgICAgICAgICAgfCAxMDMgLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogaW5jbHVkZS9kcm0vZHJtX29zX2xpbnV4LmggICB8
ICA1NSAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogNCBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKyksIDE3MiBkZWxldGlvbnMoLSkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
