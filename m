Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B533A32EBE
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2019 13:38:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1F5B8925B;
	Mon,  3 Jun 2019 11:37:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9083589226
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 11:21:09 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id cl9so1764076plb.10
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jun 2019 04:21:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=X1RK5o2YwgeeL35w0RyHVD/3IISKzcQZl/0CwWXVP98=;
 b=FN5b/qz5tp0LfPV1GdbnTk9JNxKdAksct4l70Phth1ruMucIluI2s+BW9ZqQKtxPjv
 GMR3lO3CMBqaUYwHu+xF7+tY4tiopmoG94vmuFCewXeInh/eQUsLSzJm9bZTHj0urZd0
 kSaMi8O/wXEcXmBG2Ic+yRLHWHbKgqd8gp3JpQiXvAihyQl9N5q6nv3B8YxbR+huqu2f
 YLNr4PEVSg/PUJA+deFiJdqaZUwyomGMHUhDLbO2wYPxcu3mi1FFTVx0PFSVKZGPuC8e
 iY2Yc2pJvtXk+YbzbkwPs+fJx09VAj5B6KI+ujGkTykeMnZoCkWqN8vCBAuktD3hX2VR
 HeQw==
X-Gm-Message-State: APjAAAUmWHpP3XR5xHSOO/j+XhB0Vq+VOWnDMF8xI3oLWgnz93Mtyvcf
 fo6+k5K4TUpE+VyPcXnUEcjktHcIqck=
X-Google-Smtp-Source: APXvYqzSsvxko30YbiYYj7LlgHGa9uI7nrhtHqowooQWCAP1T1BXmYkLkNNKs/3fagu6iNcApFp0uA==
X-Received: by 2002:a17:902:2869:: with SMTP id
 e96mr28060532plb.203.1559560869155; 
 Mon, 03 Jun 2019 04:21:09 -0700 (PDT)
Received: from localhost.localdomain (c-98-210-58-162.hsd1.ca.comcast.net.
 [98.210.58.162])
 by smtp.gmail.com with ESMTPSA id g9sm11792692pgs.78.2019.06.03.04.21.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 03 Jun 2019 04:21:08 -0700 (PDT)
From: shobhitkukreti@gmail.com
To: malat@debian.org
Subject: [PATCH v2] video: fbdev: Fix Warning comparing pointer to 0 reported
 by coccicheck
Date: Mon,  3 Jun 2019 04:19:12 -0700
Message-Id: <1559560752-12314-1-git-send-email-shobhitkukreti@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <CA+7wUswLsZ7PF6Pi8Oz=9287UYZQeKCFJHP7FDtPf1Cq8PO7ag@mail.gmail.com>
References: <CA+7wUswLsZ7PF6Pi8Oz=9287UYZQeKCFJHP7FDtPf1Cq8PO7ag@mail.gmail.com>
X-Mailman-Approved-At: Mon, 03 Jun 2019 11:37:53 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=X1RK5o2YwgeeL35w0RyHVD/3IISKzcQZl/0CwWXVP98=;
 b=E9NczHkk6piU+jYvDH5MHbfCTe0nwwlQBO4NKK5OqqL8t8Di7UBvUy5RqhvzpmEXYM
 4uDpdSAyFkQAYmOl7DJNWyqhauAaVlINrxQCpIV3S+yKsGA0PqD1sxH3ysIQ1buEOGwm
 oYspBYwVphRJxVlce0VEuaZN9IjOldoI9Qm0c30PDUVtqRzE9kZ0WUHD++dEgtLLVuf2
 mrM96XS6XEmgsw1Ert1vhQMFigjEO/7ipzTNHtVuJRIgzx4izfJ5k4Y/35exZFXoICFu
 50yzoZD4MUaCvDtrV6KiTr6LY7sCXvkpjynV0Sli1NMyuXXpkn+/aBL6E49tcCfqxq4b
 aFKA==
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
Cc: Shobhit Kukreti <shobhitkukreti@gmail.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, b.zolnierkie@samsung.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2hvYmhpdCBLdWtyZXRpIDxzaG9iaGl0a3VrcmV0aUBnbWFpbC5jb20+CgpGaXhlZCBX
YXJuaW5nIENvbXBhcmluZyBQb2ludGVyIHRvIDAuIENoYW5nZWQgcmV0dXJuIHZhbHVlIHRvIC1F
Tk9NRU0gdG8KcmVwb3J0IGt6YWxsb2MgZmFpbHVyZQoKZHJpdmVycy92aWRlby9mYmRldi9jb250
cm9sZmIuYzogV0FSTklORyBjb21wYXJpbmcgcG9pbnRlciB0byAwCmRyaXZlcnMvdmlkZW8vZmJk
ZXYvY29udHJvbGZiLmM6IFdBUk5JTkcgY29tcGFyaW5nIHBvaW50ZXIgdG8gMApkcml2ZXJzL3Zp
ZGVvL2ZiZGV2L2NvbnRyb2xmYi5jOiBXQVJOSU5HIGNvbXBhcmluZyBwb2ludGVyIHRvIDAKClNp
Z25lZC1vZmYtYnk6IFNob2JoaXQgS3VrcmV0aSA8c2hvYmhpdGt1a3JldGlAZ21haWwuY29tPgot
LS0KQ2hhbmdlcyBpbiB2MjoKIC0gTW9kaWZpZWQgY29tbWl0IG1lc3NhZ2UgdG8gcmVwb3J0IGNo
YW5nZSBpbiByZXR1cm4gdHlwZQoKIGRyaXZlcnMvdmlkZW8vZmJkZXYvY29udHJvbGZiLmMgfCA4
ICsrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29udHJvbGZiLmMgYi9kcml2ZXJz
L3ZpZGVvL2ZiZGV2L2NvbnRyb2xmYi5jCmluZGV4IDdhZjhkYjIuLjA3OTA3YzUgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29udHJvbGZiLmMKKysrIGIvZHJpdmVycy92aWRlby9m
YmRldi9jb250cm9sZmIuYwpAQCAtMTgyLDcgKzE4Miw3IEBAIGludCBpbml0X21vZHVsZSh2b2lk
KQogCWludCByZXQgPSAtRU5YSU87CiAKIAlkcCA9IG9mX2ZpbmRfbm9kZV9ieV9uYW1lKE5VTEws
ICJjb250cm9sIik7Ci0JaWYgKGRwICE9IDAgJiYgIWNvbnRyb2xfb2ZfaW5pdChkcCkpCisJaWYg
KGRwICE9IE5VTEwgJiYgIWNvbnRyb2xfb2ZfaW5pdChkcCkpCiAJCXJldCA9IDA7CiAJb2Zfbm9k
ZV9wdXQoZHApOwogCkBAIC01ODAsNyArNTgwLDcgQEAgc3RhdGljIGludCBfX2luaXQgY29udHJv
bF9pbml0KHZvaWQpCiAJY29udHJvbF9zZXR1cChvcHRpb24pOwogCiAJZHAgPSBvZl9maW5kX25v
ZGVfYnlfbmFtZShOVUxMLCAiY29udHJvbCIpOwotCWlmIChkcCAhPSAwICYmICFjb250cm9sX29m
X2luaXQoZHApKQorCWlmIChkcCAhPSBOVUxMICYmICFjb250cm9sX29mX2luaXQoZHApKQogCQly
ZXQgPSAwOwogCW9mX25vZGVfcHV0KGRwKTsKIApAQCAtNjgzLDggKzY4Myw4IEBAIHN0YXRpYyBp
bnQgX19pbml0IGNvbnRyb2xfb2ZfaW5pdChzdHJ1Y3QgZGV2aWNlX25vZGUgKmRwKQogCQlyZXR1
cm4gLUVOWElPOwogCX0KIAlwID0ga3phbGxvYyhzaXplb2YoKnApLCBHRlBfS0VSTkVMKTsKLQlp
ZiAocCA9PSAwKQotCQlyZXR1cm4gLUVOWElPOworCWlmIChwID09IE5VTEwpCisJCXJldHVybiAt
RU5PTUVNOwogCWNvbnRyb2xfZmIgPSBwOwkvKiBzYXZlIGl0IGZvciBjbGVhbnVwcyAqLwogCiAJ
LyogTWFwIGluIGZyYW1lIGJ1ZmZlciBhbmQgcmVnaXN0ZXJzICovCi0tIAoyLjcuNAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
