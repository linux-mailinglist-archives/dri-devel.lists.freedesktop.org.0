Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 005627EECE
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 10:20:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D61EC6ED01;
	Fri,  2 Aug 2019 08:19:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5D5F6E4B1
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2019 11:18:57 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id n4so73235832wrs.3
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Aug 2019 04:18:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=LeVi3M3rABqtJE3t2RPfqLsPOq3zZyV/m8kt+qnj1zQ=;
 b=qb9DmreDV/ZT+89pgOIeYjQdRyxzFhzemHVtkZFqmt1W6SCwNvxUhPrNyfTKaS5r8a
 jYtD7Bs89FNFsTpoQcx8uhFmUt5G4h+jA9zVQ7F5gUwnNUbS4AisoReSUu366Sktbyl4
 rwnUF794UrjEyNbuzhHIGEaRNIew52vIt22J2UjTtAORTc8QsxzwKIAxmTMtXTIpKalw
 +Ve40JoVHq0vI+6OQO5QXhzFvtkucVO4KYqc+KFa7Sqy7r3S9djTGQ/xhCh6iMxVNY0z
 cmsJeVvd+Y/HAAnadlbtfSn8N05lTu11FwWLFimyMROGzGcbNtXkqCnD5ZnrFTj/QCmn
 ohLA==
X-Gm-Message-State: APjAAAXn3fL9Eq0brHWDnzoO817okETutKd3KsQoQyReCUd+onJ7zEvJ
 V3LjT72TIkvwv5vHSc92pgo=
X-Google-Smtp-Source: APXvYqzkBr+Wu2cLABxcKSHKUUQ0ibXMKozvJEjKAQG4ccxFTxDQ1e/E7TFcA1iSTj9mjHfYdmRdag==
X-Received: by 2002:adf:cd81:: with SMTP id q1mr138879876wrj.16.1564658336375; 
 Thu, 01 Aug 2019 04:18:56 -0700 (PDT)
Received: from villeb-dev (mail.bytesnap.co.uk. [94.198.185.106])
 by smtp.gmail.com with ESMTPSA id v29sm138629wrv.74.2019.08.01.04.18.55
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 01 Aug 2019 04:18:55 -0700 (PDT)
From: Ville Baillie <vmbaillie@googlemail.com>
X-Google-Original-From: Ville Baillie <villeb@bytesnap.co.uk>
Date: Thu, 1 Aug 2019 11:18:53 +0000
To: marex@denx.de, stefan@agner.ch, airlied@linux.ie, daniel@ffwll.ch,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] mxsfb: allow attachment of display bridges
Message-ID: <20190801111853.GA24574@villeb-dev>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Fri, 02 Aug 2019 08:19:03 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:date:to:subject:message-id:mime-version:content-disposition
 :user-agent;
 bh=LeVi3M3rABqtJE3t2RPfqLsPOq3zZyV/m8kt+qnj1zQ=;
 b=cMBE9seZV2rlWrwD2KSNK2iWozGJLstP/lvQ+YuIn90t6OWhU12fBOEveO6RbxX9aL
 RMm9jrco/0XpmcQmpbqsEjqHIW7hrZYavnobjlr+r0u81MoRD7JcNL0o7RT40C4uCFr3
 SpUhON10c6PLS13qVPaUoTIPpxcc/CrnNpASxtihabzo0fcrkp4FrISwWzBhlVLYJO6S
 SDT9V5OeGeyKMNHBgviitf5enbpmM51k/73Rfbz8Rd734Uq8HnkMA/ZncJ29p4bXqhts
 Xog6k+u/97wt5HmBnP1cmlRrsWLDbKCq3Oh3xcKOcssc0iK0VHZwHS0KW4HZb3IeMt33
 TP1w==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

LS0tCiBkcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfZHJ2LmMgfCAyMCArKysrKysrKysrKysr
KysrLS0tLQogZHJpdmVycy9ncHUvZHJtL214c2ZiL214c2ZiX2Rydi5oIHwgIDEgKwogZHJpdmVy
cy9ncHUvZHJtL214c2ZiL214c2ZiX291dC5jIHwgMTQgKysrKysrKysrKystLS0KIDMgZmlsZXMg
Y2hhbmdlZCwgMjggaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vbXhzZmIv
bXhzZmJfZHJ2LmMKaW5kZXggNmZhZmM5MGRhNGVjLi5jMTlhN2I3YWEzYTYgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9teHNmYi9teHNmYl9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
bXhzZmIvbXhzZmJfZHJ2LmMKQEAgLTIyOSwxMCArMjI5LDIyIEBAIHN0YXRpYyBpbnQgbXhzZmJf
bG9hZChzdHJ1Y3QgZHJtX2RldmljZSAqZHJtLCB1bnNpZ25lZCBsb25nIGZsYWdzKQogCQlnb3Rv
IGVycl92Ymxhbms7CiAJfQogCi0JcmV0ID0gZHJtX3BhbmVsX2F0dGFjaChteHNmYi0+cGFuZWws
ICZteHNmYi0+Y29ubmVjdG9yKTsKLQlpZiAocmV0KSB7Ci0JCWRldl9lcnIoZHJtLT5kZXYsICJD
YW5ub3QgY29ubmVjdCBwYW5lbFxuIik7Ci0JCWdvdG8gZXJyX3ZibGFuazsKKwlpZiAobXhzZmIt
PnBhbmVsKSB7CisJCXJldCA9IGRybV9wYW5lbF9hdHRhY2gobXhzZmItPnBhbmVsLCAmbXhzZmIt
PmNvbm5lY3Rvcik7CisJCWlmIChyZXQpIHsKKwkJCWRldl9lcnIoZHJtLT5kZXYsICJDYW5ub3Qg
Y29ubmVjdCBwYW5lbFxuIik7CisJCQlnb3RvIGVycl92Ymxhbms7CisJCX0KKwl9IGVsc2UgaWYg
KG14c2ZiLT5icmlkZ2UpIHsKKwkJcmV0ID0gZHJtX2JyaWRnZV9hdHRhY2goJm14c2ZiLT5waXBl
LmVuY29kZXIsIG14c2ZiLT5icmlkZ2UsCisJCQkJTlVMTCk7CisJCWlmIChyZXQpIHsKKwkJCWRl
dl9lcnIoZHJtLT5kZXYsICJDYW5ub3QgY29ubmVjdCBicmlkZ2VcbiIpOworCQkJZ290byBlcnJf
dmJsYW5rOworCQl9CisJfSBlbHNlIHsKKwkJZGV2X2Vycihkcm0tPmRldiwgIk5vIHBhbmVsIG9y
IGJyaWRnZVxuIik7CisJCXJldHVybiAtRUlOVkFMOwogCX0KIAogCWRybS0+bW9kZV9jb25maWcu
bWluX3dpZHRoCT0gTVhTRkJfTUlOX1hSRVM7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
bXhzZmIvbXhzZmJfZHJ2LmggYi9kcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfZHJ2LmgKaW5k
ZXggZDk3NTMwMGRjYTA1Li40MzZmZTRiYmI0N2EgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9teHNmYi9teHNmYl9kcnYuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfZHJ2
LmgKQEAgLTI5LDYgKzI5LDcgQEAgc3RydWN0IG14c2ZiX2RybV9wcml2YXRlIHsKIAlzdHJ1Y3Qg
ZHJtX3NpbXBsZV9kaXNwbGF5X3BpcGUJcGlwZTsKIAlzdHJ1Y3QgZHJtX2Nvbm5lY3RvcgkJY29u
bmVjdG9yOwogCXN0cnVjdCBkcm1fcGFuZWwJCSpwYW5lbDsKKwlzdHJ1Y3QgZHJtX2JyaWRnZQkJ
KmJyaWRnZTsKIH07CiAKIGludCBteHNmYl9zZXR1cF9jcnRjKHN0cnVjdCBkcm1fZGV2aWNlICpk
ZXYpOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL214c2ZiL214c2ZiX291dC5jIGIvZHJp
dmVycy9ncHUvZHJtL214c2ZiL214c2ZiX291dC5jCmluZGV4IDkxZTc2ZjljZWFkNi4uNzdlMDNl
YjBmY2E2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfb3V0LmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL214c2ZiL214c2ZiX291dC5jCkBAIC03OCw5ICs3OCwxMSBAQCBp
bnQgbXhzZmJfY3JlYXRlX291dHB1dChzdHJ1Y3QgZHJtX2RldmljZSAqZHJtKQogewogCXN0cnVj
dCBteHNmYl9kcm1fcHJpdmF0ZSAqbXhzZmIgPSBkcm0tPmRldl9wcml2YXRlOwogCXN0cnVjdCBk
cm1fcGFuZWwgKnBhbmVsOworCXN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2U7CiAJaW50IHJldDsK
IAotCXJldCA9IGRybV9vZl9maW5kX3BhbmVsX29yX2JyaWRnZShkcm0tPmRldi0+b2Zfbm9kZSwg
MCwgMCwgJnBhbmVsLCBOVUxMKTsKKwlyZXQgPSBkcm1fb2ZfZmluZF9wYW5lbF9vcl9icmlkZ2Uo
ZHJtLT5kZXYtPm9mX25vZGUsIDAsIDAsICZwYW5lbCwKKwkJCSZicmlkZ2UpOwogCWlmIChyZXQp
CiAJCXJldHVybiByZXQ7CiAKQEAgLTkxLDggKzkzLDE0IEBAIGludCBteHNmYl9jcmVhdGVfb3V0
cHV0KHN0cnVjdCBkcm1fZGV2aWNlICpkcm0pCiAJcmV0ID0gZHJtX2Nvbm5lY3Rvcl9pbml0KGRy
bSwgJm14c2ZiLT5jb25uZWN0b3IsCiAJCQkJICZteHNmYl9wYW5lbF9jb25uZWN0b3JfZnVuY3Ms
CiAJCQkJIERSTV9NT0RFX0NPTk5FQ1RPUl9Vbmtub3duKTsKLQlpZiAoIXJldCkKLQkJbXhzZmIt
PnBhbmVsID0gcGFuZWw7CisJaWYgKCFyZXQpIHsKKwkJaWYgKHBhbmVsKQorCQkJbXhzZmItPnBh
bmVsID0gcGFuZWw7CisJCWVsc2UgaWYgKGJyaWRnZSkKKwkJCW14c2ZiLT5icmlkZ2UgPSBicmlk
Z2U7CisJCWVsc2UKKwkJCXJldHVybiAtRUlOVkFMOworCX0KIAogCXJldHVybiByZXQ7CiB9Ci0t
IAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
