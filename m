Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 355222B1C42
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 14:50:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65CA96E554;
	Fri, 13 Nov 2020 13:50:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EB3C6E4EC
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 13:50:09 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id h2so8243373wmm.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 05:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XGQ7i9boPClQe1oyR8utsPB6lLJWRf0r7to87NlJAVY=;
 b=tq3YEaY/3TDVCn8qdDXnhOaaOrrxOH5BxxOKr+wdKm7kChxUnNxuggo9rpj/reOkjV
 y2Vq9KREeLPXJ2WPiKYB3kyRIdXpbfStNqg8NRiCJGsQPIv4MByCZaHm49tkAMEe2wBs
 cfNqUTziP7ShG4PEJp8SzklYk/xeH3dDelLf/Wx2lp+x31i3n0JZoW9dx2eYNwmEwAKm
 RnODfEx3Pa5h79269T7DHlX6YJwhZRbTZBp1deopMe5/QXVB7d6soWsuO75rkZsRYhPk
 kqtEpTC9r9eMqE13Rg74gHGz0LWVhWtVR/MoppqMCXKEF4pTzRd7lbijMk2oOz7YZdp7
 hjAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XGQ7i9boPClQe1oyR8utsPB6lLJWRf0r7to87NlJAVY=;
 b=AEMzHQ1I/3F66T015iEqtQ7DcFfZ+jHVYf48ylNipUZ8GpCoubD+CiGp9iiavjPFp2
 5TGDqMH0k82wg1F8ItKGViPLeSzpHSciCry9VpQ4S4OrXPsFt1SY+8ILJiCDC31+8S0K
 tqXJf959fLTs0FSYsIcGZ/Zs7RWhI/VbSv86HBL/4NX/GYZkuBGz6DJwqxvi73i8OLvM
 ETLUfDi/7qZixEUiYBbZVodwPv+MdBlgYdW1I+j6wsVyw35aj3pFaMKVWagYOnt+KE3P
 tKYB+FqYYTvPmokEFUHJEFHYWJnC+LDAWrZ8T76zfirOKcCnZuw9SR6j8ArZjkflO3rq
 Kw7A==
X-Gm-Message-State: AOAM532rkXyJVHiKiZrUWjjcczhSPNDCHeUXBKzp/ikAHvkXAaT/4+X7
 9HG7BiuF4G1O7YlnxWx6+TD5Lw==
X-Google-Smtp-Source: ABdhPJwD0bDR7huq2ppkbFkSvCBisuFBCTTr0W+eZnfRWOkea8mefvO6GAjT1RzC0ZQfM0qVBMnLmw==
X-Received: by 2002:a1c:bb02:: with SMTP id l2mr2555867wmf.166.1605275407774; 
 Fri, 13 Nov 2020 05:50:07 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id t11sm4561614wrm.8.2020.11.13.05.50.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2020 05:50:07 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 21/40] drm/amd/amdgpu/amdgpu_virt: Make local function
 'amdgpu_virt_update_vf2pf_work_item()' static
Date: Fri, 13 Nov 2020 13:49:19 +0000
Message-Id: <20201113134938.4004947-22-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113134938.4004947-1-lee.jones@linaro.org>
References: <20201113134938.4004947-1-lee.jones@linaro.org>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZpcnQuYzo1NjA6Njogd2FybmluZzogbm8gcHJl
dmlvdXMgcHJvdG90eXBlIGZvciDigJhhbWRncHVfdmlydF91cGRhdGVfdmYycGZfd29ya19pdGVt
4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KCkNjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5k
ZXVjaGVyQGFtZC5jb20+CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdA
YW1kLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBW
ZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
CkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6IExlZSBK
b25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3ZpcnQuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV92aXJ0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmlydC5jCmlu
ZGV4IDhhZmY2ZWY1MGY5MTguLjkwNWI4NTM5MWU2NGEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92aXJ0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3ZpcnQuYwpAQCAtNTU3LDcgKzU1Nyw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1
X3ZpcnRfd3JpdGVfdmYycGZfZGF0YShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAlyZXR1
cm4gMDsKIH0KIAotdm9pZCBhbWRncHVfdmlydF91cGRhdGVfdmYycGZfd29ya19pdGVtKHN0cnVj
dCB3b3JrX3N0cnVjdCAqd29yaykKK3N0YXRpYyB2b2lkIGFtZGdwdV92aXJ0X3VwZGF0ZV92ZjJw
Zl93b3JrX2l0ZW0oc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQogewogCXN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2ID0gY29udGFpbmVyX29mKHdvcmssIHN0cnVjdCBhbWRncHVfZGV2aWNlLCB2
aXJ0LnZmMnBmX3dvcmsud29yayk7CiAKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
