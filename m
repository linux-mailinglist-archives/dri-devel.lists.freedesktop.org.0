Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 737B222860E
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 18:42:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61C8F6E29B;
	Tue, 21 Jul 2020 16:42:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35A206E29B
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 16:42:49 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id o11so21855009wrv.9
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 09:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CO8ltPArAPUdBjw6bWGQZLeu5Bx+TgrPvU6n01tz240=;
 b=IqlI+0Ot+ZGos0Pp8ZRMuoIUJu6pSsr8FMdpqo50jn/q3zZpH7TZ6Vq+f5Pxhyi9GN
 UnXYs2QsSxbWFJ/eRfnrT9q8pyIGLN0A3mgDmdPPOh51XJW3lHaRcRFkzmQcwndgaoy0
 oPFlQ28ri2qn9nTPKm+2VWQCD1J4eNRYNHGSq+w2ADI9EhjGFLha2ywEIgfGk5zFL8vY
 CEKzLsSWACDvw2Ts+CE7im8G+WTi6EP4MzKdWU2+HnxjlxJw+4IQ+vr11RhXfmYF27dN
 NRpW1mpVFQvei+y9GrufbPbuXHmDFoTzkJk/5L8w9jbG3a1fAwxynu2sk4UtDsEf1MjN
 MuFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CO8ltPArAPUdBjw6bWGQZLeu5Bx+TgrPvU6n01tz240=;
 b=J93Wph5HO5ISpF8DU3neXsQjeEDZXOCpnYpXdW1XhxLIjKRxTwHkmyN1cS32F5mGHX
 R2OvF+Yue3WBS/yII112bIM2aE7KHi7Lkpp4O9D3/2qk9YlAgPQw7mvq4eBQnIURo5N4
 c7UqGhiFQouYP9jQR8ROT8U64o2B/6pHvE2eASEPA4JI2Mg5g+NIY/Nj2h+cznCJMsso
 w7L/wrFrfiRmqmdBudnq1sYT5pVSwmlETkQDdRvdn3NGVSDXco5c7lrGn5kwkbXSUx/B
 5hu91zEVlLI1ORNXW5zgwI72LWKcjwsncysvGJZzPrWwmAn9Ebb5bGFcoG+TBcfCuDRG
 CXWA==
X-Gm-Message-State: AOAM532guitWvhznQhGZc6b6Pi3c75JlTvGV9rECce6AeNuhbdE/4U+I
 EDzihX7EBejuBjBJVWcewDSuRA==
X-Google-Smtp-Source: ABdhPJwNVbDAYojp2CjDF+i1OzxbUBejGrOQEVglMRAPBlKuVKe0LZXQjaN8lWErukT81SQphXvdzw==
X-Received: by 2002:adf:f10a:: with SMTP id r10mr26816377wro.406.1595349767955; 
 Tue, 21 Jul 2020 09:42:47 -0700 (PDT)
Received: from localhost.localdomain ([2.27.167.94])
 by smtp.gmail.com with ESMTPSA id m4sm3933524wmi.48.2020.07.21.09.42.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 09:42:47 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: jejb@linux.ibm.com,
	martin.petersen@oracle.com
Subject: [PATCH 36/40] scsi: lpfc: lpfc_sli: Ensure variable has the same
 stipulations as code using it
Date: Tue, 21 Jul 2020 17:41:44 +0100
Message-Id: <20200721164148.2617584-37-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200721164148.2617584-1-lee.jones@linaro.org>
References: <20200721164148.2617584-1-lee.jones@linaro.org>
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
Cc: Dick Kennedy <dick.kennedy@broadcom.com>, linux-scsi@vger.kernel.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 James Smart <james.smart@broadcom.com>, linaro-mm-sig@lists.linaro.org,
 Lee Jones <lee.jones@linaro.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

J3BnX2FkZHInIGlzIG9ubHkgdXNlZCB3aGVuIENPTkZJR19YODYgaXMgZGVmaW5lZC4gIFNvIG9u
bHkgZGVjbGFyZSBpdAppZiBDT05GSUdfWDg2IGlzIGRlZmluZWQuCgpGaXhlcyB0aGUgZm9sbG93
aW5nIFc9MSBrZXJuZWwgYnVpbGQgd2FybmluZyhzKToKCiBkcml2ZXJzL3Njc2kvbHBmYy9scGZj
X3NsaS5jOiBJbiBmdW5jdGlvbiDigJhscGZjX3dxX2NyZWF0ZeKAmToKIGRyaXZlcnMvc2NzaS9s
cGZjL2xwZmNfc2xpLmM6MTU4MTM6MTY6IHdhcm5pbmc6IHVudXNlZCB2YXJpYWJsZSDigJhwZ19h
ZGRy4oCZIFstV3VudXNlZC12YXJpYWJsZV0KIDE1ODEzIHwgdW5zaWduZWQgbG9uZyBwZ19hZGRy
OwogfCBefn5+fn5+CgpDYzogSmFtZXMgU21hcnQgPGphbWVzLnNtYXJ0QGJyb2FkY29tLmNvbT4K
Q2M6IERpY2sgS2VubmVkeSA8ZGljay5rZW5uZWR5QGJyb2FkY29tLmNvbT4KQ2M6IFN1bWl0IFNl
bXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNo
cmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwpD
YzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogbGluYXJvLW1tLXNpZ0BsaXN0
cy5saW5hcm8ub3JnClNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5v
cmc+Ci0tLQogZHJpdmVycy9zY3NpL2xwZmMvbHBmY19zbGkuYyB8IDQgKysrLQogMSBmaWxlIGNo
YW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvc2NzaS9scGZjL2xwZmNfc2xpLmMgYi9kcml2ZXJzL3Njc2kvbHBmYy9scGZjX3NsaS5jCmlu
ZGV4IGM0NGVlZDcwOWQ1ZmMuLjI3OGVhMGQ3NGI0YTggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc2Nz
aS9scGZjL2xwZmNfc2xpLmMKKysrIGIvZHJpdmVycy9zY3NpL2xwZmMvbHBmY19zbGkuYwpAQCAt
MTU4MTAsOCArMTU4MTAsMTAgQEAgbHBmY193cV9jcmVhdGUoc3RydWN0IGxwZmNfaGJhICpwaGJh
LCBzdHJ1Y3QgbHBmY19xdWV1ZSAqd3EsCiAJdWludDE2X3QgcGNpX2JhcnNldDsKIAl1aW50OF90
IGRwcF9iYXJzZXQ7CiAJdWludDMyX3QgZHBwX29mZnNldDsKLQl1bnNpZ25lZCBsb25nIHBnX2Fk
ZHI7CiAJdWludDhfdCB3cV9jcmVhdGVfdmVyc2lvbjsKKyNpZmRlZiBDT05GSUdfWDg2CisJdW5z
aWduZWQgbG9uZyBwZ19hZGRyOworI2VuZGlmCiAKIAkvKiBzYW5pdHkgY2hlY2sgb24gcXVldWUg
bWVtb3J5ICovCiAJaWYgKCF3cSB8fCAhY3EpCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
