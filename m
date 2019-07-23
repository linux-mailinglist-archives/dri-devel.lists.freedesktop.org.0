Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B499771F0F
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 20:22:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D75506E362;
	Tue, 23 Jul 2019 18:22:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E87F489EA6
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 10:11:02 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id t16so18879569pfe.11
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 03:11:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lP8X9sV2oWmdtbrAX4y948F6oht2Sk62ebuibfrRCgI=;
 b=FsiSb/JsG4x2CarCd9HEGDWi0BdZY5hk3PQf8/3wf9mXLQI8POcxS2IX93vXdinZmm
 y5pwIEAbuUS/n9ehuHr5w9IAq1ZtX4iaA0SxdOguovm2RCJlWPvw4zuXAC7QNaJpzvCu
 Tqdi6yRJr2ttJ8KB33GjV4xiAuS7SweXB+OBp2162eo97NPrE0QMREGeoYVyrP6+etdu
 wTEhb98kpHunInlHqXNQ6XD8fkLcfAGtJbK8dTGznyTxcCzddnTOT6XhIpIDRy7OXn4o
 kJ5TMZykRBBt4gHeVv+5Sgk4noYnTOj6fTxffpmzljtoI4gaEse6ZjiwpvDgOtI7nhhM
 dVng==
X-Gm-Message-State: APjAAAV6GrOcFFn47t43S9gWehAo7Go0DALDteiexrPe8b21LayPA0jq
 BYlpTgOFlhAdvkqOCORmzTc=
X-Google-Smtp-Source: APXvYqx6k9JPXdFGuvau+1Ruk+7CIKvE4sTfG9rgLFZmTSES9xLwIUxjnPTfV8K+SmpMvDM49GtUZQ==
X-Received: by 2002:a63:181:: with SMTP id 123mr77678792pgb.63.1563876662443; 
 Tue, 23 Jul 2019 03:11:02 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([89.31.126.54])
 by smtp.gmail.com with ESMTPSA id j15sm46736491pfe.3.2019.07.23.03.10.59
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 23 Jul 2019 03:11:01 -0700 (PDT)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Subject: [PATCH] drm/ast: Use dev_get_drvdata where possible
Date: Tue, 23 Jul 2019 18:10:38 +0800
Message-Id: <20190723101037.30192-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 23 Jul 2019 18:22:04 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lP8X9sV2oWmdtbrAX4y948F6oht2Sk62ebuibfrRCgI=;
 b=NRw86/e8mh77kdnNK9C7YaJaJcWd5Z8fJqD0ZErTbDzo8Azj7VtOvWFmg09hNrq1eM
 +f5bgAJWSLvg1MCX4zuKstidZiQFTzH2wn40SHV1iOtq6PsaibCw3225TRdqgmTVMgjs
 L7KLcu1jTSy54KpZMRjVMB3c9ViBrGIbj6nHd1c4CF7/YyFbqkvT4lnQsgL8SyQpmJWQ
 uuH/qICG+LlFawqvKfC13qSMcYuhmt9K64hlGCs6T75WVvtDdhGFgBx4nynKFTcUc9N9
 nUPCvtuSR0Io6JXte0qmeiIQz0g3tDwzSSoeALJT8xaPgW1ekjGlILFmU9ubhjM6oOFR
 iWCQ==
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
Cc: David Airlie <airlied@linux.ie>, Chuhong Yuan <hslester96@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW5zdGVhZCBvZiB1c2luZyB0b19wY2lfZGV2ICsgcGNpX2dldF9kcnZkYXRhLAp1c2UgZGV2X2dl
dF9kcnZkYXRhIHRvIG1ha2UgY29kZSBzaW1wbGVyLgoKU2lnbmVkLW9mZi1ieTogQ2h1aG9uZyBZ
dWFuIDxoc2xlc3Rlcjk2QGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9k
cnYuYyB8IDEyICsrKystLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwg
OCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9kcnYu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X2Rydi5jCmluZGV4IDM4MTE5OTdlNzhjNC4uY2My
MzljMGZjNTliIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9kcnYuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9kcnYuYwpAQCAtMTU1LDE1ICsxNTUsMTMgQEAgc3Rh
dGljIGludCBhc3RfcG1fc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpCiB9CiBzdGF0aWMgaW50
IGFzdF9wbV9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQogewotCXN0cnVjdCBwY2lfZGV2ICpw
ZGV2ID0gdG9fcGNpX2RldihkZXYpOwotCXN0cnVjdCBkcm1fZGV2aWNlICpkZGV2ID0gcGNpX2dl
dF9kcnZkYXRhKHBkZXYpOworCXN0cnVjdCBkcm1fZGV2aWNlICpkZGV2ID0gZGV2X2dldF9kcnZk
YXRhKGRldik7CiAJcmV0dXJuIGFzdF9kcm1fcmVzdW1lKGRkZXYpOwogfQogCiBzdGF0aWMgaW50
IGFzdF9wbV9mcmVlemUoc3RydWN0IGRldmljZSAqZGV2KQogewotCXN0cnVjdCBwY2lfZGV2ICpw
ZGV2ID0gdG9fcGNpX2RldihkZXYpOwotCXN0cnVjdCBkcm1fZGV2aWNlICpkZGV2ID0gcGNpX2dl
dF9kcnZkYXRhKHBkZXYpOworCXN0cnVjdCBkcm1fZGV2aWNlICpkZGV2ID0gZGV2X2dldF9kcnZk
YXRhKGRldik7CiAKIAlpZiAoIWRkZXYgfHwgIWRkZXYtPmRldl9wcml2YXRlKQogCQlyZXR1cm4g
LUVOT0RFVjsKQEAgLTE3MywxNSArMTcxLDEzIEBAIHN0YXRpYyBpbnQgYXN0X3BtX2ZyZWV6ZShz
dHJ1Y3QgZGV2aWNlICpkZXYpCiAKIHN0YXRpYyBpbnQgYXN0X3BtX3RoYXcoc3RydWN0IGRldmlj
ZSAqZGV2KQogewotCXN0cnVjdCBwY2lfZGV2ICpwZGV2ID0gdG9fcGNpX2RldihkZXYpOwotCXN0
cnVjdCBkcm1fZGV2aWNlICpkZGV2ID0gcGNpX2dldF9kcnZkYXRhKHBkZXYpOworCXN0cnVjdCBk
cm1fZGV2aWNlICpkZGV2ID0gZGV2X2dldF9kcnZkYXRhKGRldik7CiAJcmV0dXJuIGFzdF9kcm1f
dGhhdyhkZGV2KTsKIH0KIAogc3RhdGljIGludCBhc3RfcG1fcG93ZXJvZmYoc3RydWN0IGRldmlj
ZSAqZGV2KQogewotCXN0cnVjdCBwY2lfZGV2ICpwZGV2ID0gdG9fcGNpX2RldihkZXYpOwotCXN0
cnVjdCBkcm1fZGV2aWNlICpkZGV2ID0gcGNpX2dldF9kcnZkYXRhKHBkZXYpOworCXN0cnVjdCBk
cm1fZGV2aWNlICpkZGV2ID0gZGV2X2dldF9kcnZkYXRhKGRldik7CiAKIAlyZXR1cm4gYXN0X2Ry
bV9mcmVlemUoZGRldik7CiB9Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
