Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE820115995
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2019 00:15:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84A906FAAA;
	Fri,  6 Dec 2019 23:14:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBDE86FAA7
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2019 23:14:57 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id b15so7684900ila.7
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Dec 2019 15:14:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nb5X/YG7EhxVVMb4rPYE5JMk9umoZgG5Z8q8yvwSs2M=;
 b=Lc2Ol/Pmr6V6cp2u7iYl+aBJIiFSLbR+bW6qMzliO7EKesfKUXInrI7VEuv7aIXLfQ
 VZq/lm05nPK6z8H/m3VU2Yd4HARhJwC5fSNAiNhXi0HtaAcdXQgc6J3yxCn5EvG+r5ax
 Qo4aMDMOqjL+cXkszAzTDhlyWO8MGk1/XRUgeY9RlbWPub3u7kRJvJ2O4H1ITqdNSz//
 d9xLhg0ZmpyUqqTFRfccl7FCb4FSG8OPTQKnX8Gx+dWJH9q3WT1fF5JUDP7DCR0nsVio
 ASCKcx/yBHtSCxOwHrxh0UAZ6jQdGb3zKHQ6bnqG7ySufxCj8RfX7dByiqCaN+Ahf4ay
 hVRw==
X-Gm-Message-State: APjAAAVCIVVDhgQ99XPvK3M4DxDezsApqA7PSWFMdYhPKmfh6KvlWqf8
 K34zDTkEgnt/PPnY/zvyp0DAAPHEV3c=
X-Google-Smtp-Source: APXvYqyszDdpM/3ud4bfV15wu6oE2QbjCevykqalAbVlwCBIN4naArSw84K73+sk7klQIdxWF+06mQ==
X-Received: by 2002:a92:8dc3:: with SMTP id w64mr15201727ill.68.1575674097195; 
 Fri, 06 Dec 2019 15:14:57 -0800 (PST)
Received: from ddavenport4.bld.corp.google.com
 ([2620:15c:183:0:92f:a80a:519d:f777])
 by smtp.gmail.com with ESMTPSA id b15sm4317946ilo.37.2019.12.06.15.14.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 06 Dec 2019 15:14:56 -0800 (PST)
From: Drew Davenport <ddavenport@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/6] drm/msm/dpu: Remove unnecessary NULL checks
Date: Fri,  6 Dec 2019 16:13:45 -0700
Message-Id: <20191206161137.3.I55d53dbb7c64256e4231a6b99c6e6d1c336f624b@changeid>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191206161137.1.Ibb7612c1ebcebe3f560b3269150c0e0363f01e44@changeid>
References: <20191206161137.1.Ibb7612c1ebcebe3f560b3269150c0e0363f01e44@changeid>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nb5X/YG7EhxVVMb4rPYE5JMk9umoZgG5Z8q8yvwSs2M=;
 b=NuMpicKsb6T6BeUCy+TlL4PJnkcDqAUqaRI0E66NpQifyU90z1WQQyECfu2NVtv0jA
 0bdI49nIuuwI4aiB/lszsIyNXya/559wjjVjvlvZZTdoQI097EexNyicnvZFeMHeIkho
 MUjJv2HRu6cwQ32HoRuTJf/Fo6/aKrxETWbAg=
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bruce Wang <bzwang@chromium.org>,
 Drew Davenport <ddavenport@chromium.org>, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZHB1X2NydGNfbWl4ZXIuaHdfbG0gd2lsbCBuZXZlciBiZSBOVUxMLCBzbyBkb24ndCBjaGVjay4K
ClNpZ25lZC1vZmYtYnk6IERyZXcgRGF2ZW5wb3J0IDxkZGF2ZW5wb3J0QGNocm9taXVtLm9yZz4K
LS0tCgogZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2NydGMuYyB8IDEzICsrKy0t
LS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9jcnRjLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfY3J0Yy5jCmluZGV4IGI5ZWQ4Mjg1
YWIzOS4uYmY1MTM0MTFiMjQzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3Av
ZHB1MS9kcHVfY3J0Yy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9j
cnRjLmMKQEAgLTE5NywxMCArMTk3LDYgQEAgc3RhdGljIHZvaWQgX2RwdV9jcnRjX2JsZW5kX3Nl
dHVwKHN0cnVjdCBkcm1fY3J0YyAqY3J0YykKIAlEUFVfREVCVUcoIiVzXG4iLCBkcHVfY3J0Yy0+
bmFtZSk7CiAKIAlmb3IgKGkgPSAwOyBpIDwgY3N0YXRlLT5udW1fbWl4ZXJzOyBpKyspIHsKLQkJ
aWYgKCFtaXhlcltpXS5od19sbSkgewotCQkJRFBVX0VSUk9SKCJpbnZhbGlkIGxtIGFzc2lnbmVk
IHRvIG1peGVyXG4iKTsKLQkJCXJldHVybjsKLQkJfQogCQltaXhlcltpXS5taXhlcl9vcF9tb2Rl
ID0gMDsKIAkJbWl4ZXJbaV0uZmx1c2hfbWFzayA9IDA7CiAJCWlmIChtaXhlcltpXS5sbV9jdGwt
Pm9wcy5jbGVhcl9hbGxfYmxlbmRzdGFnZXMpCkBAIC0xMTEzLDEyICsxMTA5LDkgQEAgc3RhdGlj
IGludCBfZHB1X2RlYnVnZnNfc3RhdHVzX3Nob3coc3RydWN0IHNlcV9maWxlICpzLCB2b2lkICpk
YXRhKQogCiAJZm9yIChpID0gMDsgaSA8IGNzdGF0ZS0+bnVtX21peGVyczsgKytpKSB7CiAJCW0g
PSAmY3N0YXRlLT5taXhlcnNbaV07Ci0JCWlmICghbS0+aHdfbG0pCi0JCQlzZXFfcHJpbnRmKHMs
ICJcdG1peGVyWyVkXSBoYXMgbm8gbG1cbiIsIGkpOwotCQllbHNlCi0JCQlzZXFfcHJpbnRmKHMs
ICJcdG1peGVyOiVkIGN0bDolZCB3aWR0aDolZCBoZWlnaHQ6JWRcbiIsCi0JCQkJbS0+aHdfbG0t
PmlkeCAtIExNXzAsIG0tPmxtX2N0bC0+aWR4IC0gQ1RMXzAsCi0JCQkJb3V0X3dpZHRoLCBtb2Rl
LT52ZGlzcGxheSk7CisJCXNlcV9wcmludGYocywgIlx0bWl4ZXI6JWQgY3RsOiVkIHdpZHRoOiVk
IGhlaWdodDolZFxuIiwKKwkJCW0tPmh3X2xtLT5pZHggLSBMTV8wLCBtLT5sbV9jdGwtPmlkeCAt
IENUTF8wLAorCQkJb3V0X3dpZHRoLCBtb2RlLT52ZGlzcGxheSk7CiAJfQogCiAJc2VxX3B1dHMo
cywgIlxuIik7Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
