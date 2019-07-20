Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8F16EE7B
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jul 2019 10:45:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DABE16E888;
	Sat, 20 Jul 2019 08:45:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A64C6E888;
 Sat, 20 Jul 2019 08:45:53 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id u10so23283160lfm.12;
 Sat, 20 Jul 2019 01:45:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=p3bRIQYSge6D2QnOFXWuP9YmXuP5o4pBUBzkC0kUxBE=;
 b=HDeUv/Hm7aQ5z9pNRqbcFxpTxLqtLKaeNy5EAjUPMQD+NGl9+FgNisrbhwJ2VeXm38
 ULIVg52cVyL3j0krtZ3wCG1JGJ/ZhTJ4yickFEj6q/qPleKGKedhExNWsA2zuJGQHj31
 I4D2RTxcgFexvuTKx31XqwyB+ZIhkQVybNdPMe2Kgo1c0tNNbhl7ObhyKxjblnmUpnec
 sz/4ZLPTRYP4nJEyCtkOv2X+wiDxFcEbhhRyW9lH4V6bbLoGKf+xzTKMIGtDUdru97tV
 Y445tmS5C++ekNry1h2DYr2+MjA2tN/1w0PU9B/f63CUNkfYd6S3oSMHzYI2DXYNAGjT
 mQtw==
X-Gm-Message-State: APjAAAV9bMtYGKYuZD7oS8jAOWfif2BUcqdro4e40xwEZZBDO7IkSlj7
 MdRy/2bmUXpjWe5zkcKq/vLlWvgbWDA=
X-Google-Smtp-Source: APXvYqxX4eFUOUnLAMbUaVu1hwwIzaDFr/f2i0z9fBJ4UzQUD0kl92//ReLJG6231imk4lL/oVlSiQ==
X-Received: by 2002:ac2:47e8:: with SMTP id b8mr11486460lfp.84.1563612351190; 
 Sat, 20 Jul 2019 01:45:51 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 o3sm5047022lfb.40.2019.07.20.01.45.49
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 20 Jul 2019 01:45:50 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
	openchrome-devel@lists.freedesktop.org
Subject: [PATCH v2 0/6] drm/via: drop use of deprecated headers drmP.h and
 drm_os_linux.h
Date: Sat, 20 Jul 2019 10:45:23 +0200
Message-Id: <20190720084527.12593-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p3bRIQYSge6D2QnOFXWuP9YmXuP5o4pBUBzkC0kUxBE=;
 b=s3Fj4SNRLUahpNi7B0tBWzPscL94AdhOn/Yqy0GtXSJbfkiHKj2SqRUtjT9qIRroO8
 5pjy08F4njv2JfEnofWlhe+VFhtPkQneCxfUKYoaT1/9YqcDsqowNOjtOyS1LrUr+vTg
 bDz3kFna5Jf361ilnEbAZiLMF8luYLANGTouuJTQnPL3VacejRllf5bk3OUpfa15Y/f+
 /HBbJQcvVCNf1RqfbjrRYe4HcHHOuS8x9ZetvQLvzjRzjEjbIBSJd1nhOBs2bayHoy2+
 XBB4XaGApcDjjyIG1IYWlIW5b5XHM71yNvA/EfqV1fTM9qD02pOmHQv1Kg06ejCwU64n
 meag==
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
 Kevin Brace <kevinbrace@gmx.com>, Mike Marshall <hubcap@omnibond.com>,
 Ira Weiny <ira.weiny@intel.com>, Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBpcyBzb21lIGphbml0b3JpYWwgdXBkYXRlcyB0byB0aGUgdmlhIGRyaXZlcgp0aGF0IGlz
IHJlcXVpcmVkIHRvIGdldCByaWQgb2YgZGVwcmVjYXRlZCBoZWFkZXJzCmluIHRoZSBkcm0gc3Vi
c3lzdGVtLgoKVGhlIGZpcnN0IHRocmVlIHBhdGNoZXMgcHJlcGFyZSBmb3IgdGhlIHJlbW92YWwg
b2YgZHJtUC5oLgpUaGUgbGFzdCBwYXRjaCByZW1vdmUgdXNlIG9mIGRybVAuaCBhbmQgcmVwbGFj
ZSB3aXRoIG5lY2Vzc2FyeQppbmNsdWRlIGZpbGVzIHRvIGZpeCBidWlsZC4KCkJ1aWxkIHRlc3Rl
ZCB3aXRoIHZhcmlvdXMgY29uZmlncyBhbmQgdmFyaW91cyBhcmNoaXRlY3R1cmVzLgoKSSBoYWQg
cHJlZmVycmVkIHRoYXQgdGhlIHZpYSBkcml2ZXIgd2FzIHJlcGxhY2VkIGJ5IHRoZQpvcGVuY2hy
b21lIGRyaXZlciwgYnV0IHVudGlsIHdlIGhhdmUgaXQgdGhlbiB3ZSBuZWVkCnRvIGRlYWwgd2l0
aCB0aGUgbGVnYWN5IHZpYSBkcml2ZXIgd2hlbiByZW1vdmluZyBvbGQgY3J1ZnQKaW4gdGhlIGRy
bSBzdWJzeXN0ZW0uCgp2MjoKLSBBZGQgYSBjb3B5IG9mIERSTV9XQUlUX09OIHRvIHRoZSB2aWEg
ZHJpdmVyLCBrZWVwaW5nCiAgdGhlIGNoYW5nZXMgdG8gdGhpcyBsZWdhY3kgZHJpdmVyIHRvIGEg
bWluaW11bS4KICBUaGlzIGFsc28gZ2l2ZXMgbXVjaCBtb3JlIGNvbmZpZGVuY2UgdGhhdCB0aGUK
ICBkcml2ZXIgY29udGludWVzIHRvIHdvcmsgYXMgdGhlcmUgaXMgbm8gY2hhbmdlcwogIGluIGxv
Z2ljLiBUaGVyZWZvcmUgZHJvcHBlZCAiUkZUIi4KLSBBZGRlZCBDYzogTWljaGVsIETDpG56ZXIg
PG1pY2hlbEBkYWVuemVyLm5ldD4gdG8gYWxsCiAgcGF0Y2hlcywgYXMgTWljaGFlbCBoYXZlIGNv
bW1lbnRlZCBvbiB0aGUgc2VyaWVzLgoKCVNhbQoKU2FtIFJhdm5ib3JnICg0KToKICAgICAgZHJt
L3ZpYTogZHJvcCB1c2Ugb2YgRFJNKFJFQUR8V1JJVEUpIG1hY3JvcwogICAgICBkcm0vdmlhOiBh
ZGQgVklBX1dBSVRfT04oKQogICAgICBkcm0vdmlhOiBtYWtlIHZpYV9kcnYuaCBzZWxmLWNvbnRh
aW5lZAogICAgICBkcm0vdmlhOiBkcm9wIHVzZSBvZiBkcm1QLmgKCiBkcml2ZXJzL2dwdS9kcm0v
dmlhL3ZpYV9kbWEuYyAgICAgIHwgIDkgKysrKystCiBkcml2ZXJzL2dwdS9kcm0vdmlhL3ZpYV9k
bWFibGl0LmMgIHwgMTcgKysrKysrKy0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vdmlhL3ZpYV9kcnYu
YyAgICAgIHwgIDcgKysrLS0KIGRyaXZlcnMvZ3B1L2RybS92aWEvdmlhX2Rydi5oICAgICAgfCA1
NyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLQogZHJpdmVycy9ncHUvZHJt
L3ZpYS92aWFfaXJxLmMgICAgICB8ICA4ICsrKystLQogZHJpdmVycy9ncHUvZHJtL3ZpYS92aWFf
bWFwLmMgICAgICB8ICA2ICsrKy0KIGRyaXZlcnMvZ3B1L2RybS92aWEvdmlhX21tLmMgICAgICAg
fCAgNyArKysrLQogZHJpdmVycy9ncHUvZHJtL3ZpYS92aWFfdmVyaWZpZXIuYyB8IDEwICsrKy0t
LS0KIGRyaXZlcnMvZ3B1L2RybS92aWEvdmlhX3ZpZGVvLmMgICAgfCAgNSArKy0tCiA5IGZpbGVz
IGNoYW5nZWQsIDk5IGluc2VydGlvbnMoKyksIDI3IGRlbGV0aW9ucygtKQoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
