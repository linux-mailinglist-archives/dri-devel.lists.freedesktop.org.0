Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B63D4FD797
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2019 09:05:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD8276E0CF;
	Fri, 15 Nov 2019 08:05:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F6C56E2F9
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 13:25:26 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id t26so5892998wmi.4
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 05:25:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=q25FqYYq1HlyGPjqgeEbhuqnD600bhraE2cbn15efDk=;
 b=XV73ivsjjw/lFVgnNcL+CrtlLvPRIoUmPsDtGpruk46KT3u9enrF9gW86DzAl6lz8n
 UCtfJQ92Q9PUIIdRtVsclUmjv9c1SseqbjQ+QdmCEu2pBLlyldn3TSfPvmklRd+GkEP9
 Y4jXFPzdOBBouy9+8q4qgOeIq2T8PiM9ZvyvcBxNyJFVAt0+3Py4KkDF+RZvAuzJy0L9
 Y6hi9P/P/LVRu1qP+hO4ymgMs/02WSU6R7PgdUComanueE0aJp1XtRQAUVws01TGqB0v
 MMPUIizVSs3jrATNr3dXL6nF64e5+ok9kG/qD4v79FHaRYuIRPKXGkg3Oe7Z1aF7mRLm
 4DjA==
X-Gm-Message-State: APjAAAWnorByeOZsGmpR4QXD9Qehk1pmOqBIOCc+gN9LqcE7Glb6km4y
 +kj8P1HXxZw/AFu0f7h6Oxg=
X-Google-Smtp-Source: APXvYqxDxppIeOPFqQWV1zapmmqSUALzzrPUav1RgTbEN138v5mV58ouZdmPPao15Uvzkn43K/TCWg==
X-Received: by 2002:a1c:e386:: with SMTP id a128mr8279022wmh.52.1573737925338; 
 Thu, 14 Nov 2019 05:25:25 -0800 (PST)
Received: from localhost.localdomain ([197.254.95.38])
 by smtp.googlemail.com with ESMTPSA id l4sm5897905wme.4.2019.11.14.05.25.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2019 05:25:24 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, hjc@rock-chips.com
Subject: [PATCH 1/2] drm/print: add DRM_DEV_WARN macro
Date: Thu, 14 Nov 2019 16:25:19 +0300
Message-Id: <20191114132520.7323-1-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Fri, 15 Nov 2019 08:05:26 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=q25FqYYq1HlyGPjqgeEbhuqnD600bhraE2cbn15efDk=;
 b=Rds8wS/qzXNcvC3Yd9f/9XdyvTQZ3Uht/UdVssSaiVWMebYp+LefE9/zU1mQKhPYcG
 rqPaBRv9FIUj1gh70+cLk7DG/OrEI9Zf+eFRgqaRCH+dZam7uZLaGPgmIGf4MQz6UeNy
 BtAq2oFoy958LNz9eMEe0z+wc4DgSymvgksD4Oh9j846cWK2FiE2j66n2K13H+fgH8Y1
 P5Qss2xAvPiMNCGzltZv3vh8w0Kgclob0u9jLh9M2yumRm2YjnEDIOc+njNf16DNfWuP
 nWHjjdqV1qnlKajPHaqXymwBjZ3sKCpaT6Kd70M99pjohJRP0RP0Pf2lcpfp4LdLUw3i
 VPQQ==
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
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIHRoZSBEUk1fREVWX1dBUk4gaGVscGVyIG1hY3JvIGZvciBwcmludGluZyB3YXJuaW5ncwp0
aGF0IHVzZSBkZXZpY2UgcG9pbnRlcnMgaW4gdGhlaXIgbG9nIG91dHB1dCBmb3JtYXQuCkRSTV9E
RVZfV0FSTiBjYW4gcmVwbGFjZSB0aGUgdXNlIG9mIGRldl93YXJuIGluIHN1Y2ggY2FzZXMuCgpT
aWduZWQtb2ZmLWJ5OiBXYW1idWkgS2FydWdhIDx3YW1idWkua2FydWdheEBnbWFpbC5jb20+Ci0t
LQogaW5jbHVkZS9kcm0vZHJtX3ByaW50LmggfCA5ICsrKysrKysrKwogMSBmaWxlIGNoYW5nZWQs
IDkgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9wcmludC5oIGIv
aW5jbHVkZS9kcm0vZHJtX3ByaW50LmgKaW5kZXggNWI4MDQ5OTkyYzI0Li42ZGRmOTFjMGNiMjkg
MTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2RybV9wcmludC5oCisrKyBiL2luY2x1ZGUvZHJtL2Ry
bV9wcmludC5oCkBAIC0zMjksNiArMzI5LDE1IEBAIHZvaWQgZHJtX2Vycihjb25zdCBjaGFyICpm
b3JtYXQsIC4uLik7CiAjZGVmaW5lIERSTV9XQVJOX09OQ0UoZm10LCAuLi4pCQkJCQkJXAogCV9E
Uk1fUFJJTlRLKF9vbmNlLCBXQVJOSU5HLCBmbXQsICMjX19WQV9BUkdTX18pCiAKKy8qKgorICog
V2FybmluZyBvdXRwdXQuCisgKgorICogQGRldjogZGV2aWNlIHBvaW50ZXIKKyAqIEBmbXQ6IHBy
aW50ZigpIGxpa2UgZm9ybWF0IHN0cmluZy4KKyAqLworI2RlZmluZSBEUk1fREVWX1dBUk4oZGV2
LCBmbXQsIC4uLikJCQkJCVwKKwlkcm1fZGV2X3ByaW50ayhkZXYsIEtFUk5fV0FSTklORywgZm10
LCAjI19fVkFfQVJHU19fKQorCiAvKioKICAqIEVycm9yIG91dHB1dC4KICAqCi0tIAoyLjE3LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
