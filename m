Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB4335E6D
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 15:55:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7D5789291;
	Wed,  5 Jun 2019 13:55:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 024AB892B0
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 13:55:47 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id v18so2087470ljh.6
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jun 2019 06:55:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=OkhdtGg6hcxJilbzQGxwTeGhd+Kx0dtUmt+4WlgHGl8=;
 b=EdXYsHtLSW5of34R9NfbbrOqP7c87mFU8cKbslGgO0O0hCrc2OaqCVjIUKm+76vryZ
 r3fHHuVThGUOydFPXVA/fAdcptBklmn54hSStlfCo93zDdZRJMikOTOhlWl8QuqzRE7B
 NLpa9LmxhmeZ+D5a1vJ74OycjJFriTmP0eFY0V0nWZpOkKM2suZ0uEvgd8WtApDjgqCV
 MFlYSihfhEr6giTXf3aHlds+T33OxOJV8NOVbbzsbekxhGye9W4NcAJC9vGIGSeDpRQC
 9Tzvd0MPXpapdvYcXPFQz7ha4jk1YizqMWZJhC2fa7wfHyeWcpjnKS+F2r4Bt+naqtJM
 /S7w==
X-Gm-Message-State: APjAAAXETilSy/6QOzGRipsCXWht8OGUzG3k261Z0LBle17ff3/qVydv
 OoowmEOa4oMjpGRmKciTvQ4CC1VPsHE=
X-Google-Smtp-Source: APXvYqyozCG1aS5UOUozJW3ULPgYrMpJhPlZbc12PiVxPp4IeKMJUeocs3svcp3ieXRwS088OrSZZw==
X-Received: by 2002:a2e:89cc:: with SMTP id c12mr21271283ljk.90.1559742945221; 
 Wed, 05 Jun 2019 06:55:45 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id v7sm524318ljj.3.2019.06.05.06.55.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 05 Jun 2019 06:55:44 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 0/1] drm/sis: drop use of drmP.h
Date: Wed,  5 Jun 2019 15:55:38 +0200
Message-Id: <20190605135539.12940-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OkhdtGg6hcxJilbzQGxwTeGhd+Kx0dtUmt+4WlgHGl8=;
 b=OhhVSg1oSUxZ41C84nUm6ZWYWOiuI90wwt/cgpc8a42zivd9lbePvNzAr7w7vmf2pm
 qxwX+RDX0InKWuBkga8y8hTmMYIMvzLcoTb6gD5nyKgqrSwu2YGHHVWT6RpVjX4GsBoD
 GzjTzKIuIH1+NMhherSsqAo+UXdY+8JGT4f3KLyF1kGrgdgKeQ7oubBSPp34II7tKC0l
 kfQLTxbKoluHouoLYD43vuzzYDUt932w4+lk40PHhLzRY7ndr8E6CraaI2+zcm463kw/
 205X/ST+cycgjq+qkWQYA1loszYnLWLpMbZdKbMio87kZ6OaxZUVm9tXyR32fjHRnIcL
 TAlQ==
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
Cc: David Airlie <airlied@linux.ie>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RHJvcCB1c2Ugb2YgdGhlIGRlcHJlY2F0ZWQgZHJtUC5oIGZpbGUKClNhbSBSYXZuYm9yZyAoMSk6
CiAgICAgIGRybS9zaXM6IGRyb3AgZHJtUC5oIHVzZQoKIGRyaXZlcnMvZ3B1L2RybS9zaXMvc2lz
X2Rydi5jIHwgIDggKysrKystLS0KIGRyaXZlcnMvZ3B1L2RybS9zaXMvc2lzX2Rydi5oIHwgMTAg
KysrKy0tLS0tLQogZHJpdmVycy9ncHUvZHJtL3Npcy9zaXNfbW0uYyAgfCAgNyArKysrKy0tCiAz
IGZpbGVzIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
