Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F7578609
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2019 09:17:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B748989C6C;
	Mon, 29 Jul 2019 07:16:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C8816ED1F
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 11:28:43 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id p17so51157604ljg.1
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 04:28:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3k2Hu9dgPAg4mXrYLegY3cs+pkVK6DYl+EmmNBVrs0g=;
 b=G8TZgQdHuq69+12KzMhwSAitcyjk7R9len+bNXz6Bb61/fkkEsDdvwT36Rdu9axMe+
 NQdzDK3g9EYgRlEixKAvbxQItg/GHM5l4wMJmUWSR2A25G/FZSycYu47ayU020D8VIyp
 PzN+TPVanlr7bA+r4dTdh2ExV0WkYL/a7+Oy5Wzgu52q29McGliJ2CYD/S8Vg7vBY8d/
 NBP8adtF4abe/Y5o4ZkA/C0KKohB/rZ4eDC8J9Uqf32ND4/gG16MykE31uCYo8zvRYiq
 3cJAzwwWAivERD3T4tNQP8TBTtAtsGbRPOLW+Mm5SMxIkLvkMd9sGRImsksvoobD7Hl3
 SZwQ==
X-Gm-Message-State: APjAAAWFIz8lDDFi0UOlhabttMHLNHucx12zP9K0SWuePwoV9+OtR25a
 Sy4hJTMpFM0GAtu7JSIjypb4N/f5AnGbZw==
X-Google-Smtp-Source: APXvYqw+KmhWFJ1zRECph4WisbngzrlfWOBHrpPa5lKCQnCIAhc96KBxovwxIYgG7Y9bz3Q2OIIhRw==
X-Received: by 2002:a2e:3008:: with SMTP id w8mr50119116ljw.13.1564140521750; 
 Fri, 26 Jul 2019 04:28:41 -0700 (PDT)
Received: from localhost (c-243c70d5.07-21-73746f28.bbcust.telenor.se.
 [213.112.60.36])
 by smtp.gmail.com with ESMTPSA id m28sm9918367ljb.68.2019.07.26.04.28.41
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 26 Jul 2019 04:28:41 -0700 (PDT)
From: Anders Roxell <anders.roxell@linaro.org>
To: b.zolnierkie@samsung.com
Subject: [PATCH] video: fbdev: Mark expected switch fall-through
Date: Fri, 26 Jul 2019 13:28:35 +0200
Message-Id: <20190726112835.19928-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 29 Jul 2019 07:16:44 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3k2Hu9dgPAg4mXrYLegY3cs+pkVK6DYl+EmmNBVrs0g=;
 b=t8y9cuVI9+Yw19d8Lc6hWctxqxTCLkf+u1eC14W4J2NPPlqR5niIOpj/3Z6d0OtM/Y
 rTbYPQ30898Z1Dawsea0lsSoS6sks+mGr6HRiwT8DeDLpqq0wygMq3vzAhZkRDBZqFjq
 O9senNIWyuA3TPlYmPwaIcePkNEFE/HGREu5sjatKCeOvylXVwqKi8UUwcs9GUJLLq1A
 Fptqlzm0mzopq4E/Zvr2lhTDMd/AGFjNBofA/0xovrBZvfGsH7NK7MICsPtiDdXKjs1E
 94HbESg/f9jtKEfzdKW3WRLDb/O2lypJ6taEfpAfmSVV0Zyvo3KJ1rnuwIqFitDzz/n0
 gCAQ==
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
Cc: linux-fbdev@vger.kernel.org, Anders Roxell <anders.roxell@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbiBmYWxsLXRocm91Z2ggd2FybmluZ3Mgd2FzIGVuYWJsZWQgYnkgZGVmYXVsdCB0aGUgZm9s
bG93aW5nIHdhcm5pbmdzCndhcyBzdGFydGluZyB0byBzaG93IHVwOgoKLi4vZHJpdmVycy92aWRl
by9mYmRldi9zaF9tb2JpbGVfbGNkY2ZiLmM6IEluIGZ1bmN0aW9uIOKAmHNoX21vYmlsZV9sY2Rj
X2NoYW5uZWxfZmJfaW5pdOKAmToKLi4vZHJpdmVycy92aWRlby9mYmRldi9zaF9tb2JpbGVfbGNk
Y2ZiLmM6MjA4NjoyMjogd2FybmluZzogdGhpcyBzdGF0ZW1lbnQgbWF5IGZhbGwKIHRocm91Z2gg
Wy1XaW1wbGljaXQtZmFsbHRocm91Z2g9XQogICBpbmZvLT5maXgueXBhbnN0ZXAgPSAyOwogICB+
fn5+fn5+fn5+fn5+fn5+fn5+Xn5+Ci4uL2RyaXZlcnMvdmlkZW8vZmJkZXYvc2hfbW9iaWxlX2xj
ZGNmYi5jOjIwODc6Mjogbm90ZTogaGVyZQogIGNhc2UgVjRMMl9QSVhfRk1UX05WMTY6CiAgXn5+
fgouLi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3NoX21vYmlsZV9sY2RjZmIuYzogSW4gZnVuY3Rpb24g
4oCYc2hfbW9iaWxlX2xjZGNfb3ZlcmxheV9mYl9pbml04oCZOgouLi9kcml2ZXJzL3ZpZGVvL2Zi
ZGV2L3NoX21vYmlsZV9sY2RjZmIuYzoxNTk2OjIyOiB3YXJuaW5nOiB0aGlzIHN0YXRlbWVudCBt
YXkgZmFsbAogdGhyb3VnaCBbLVdpbXBsaWNpdC1mYWxsdGhyb3VnaD1dCiAgIGluZm8tPmZpeC55
cGFuc3RlcCA9IDI7CiAgIH5+fn5+fn5+fn5+fn5+fn5+fn5efn4KLi4vZHJpdmVycy92aWRlby9m
YmRldi9zaF9tb2JpbGVfbGNkY2ZiLmM6MTU5NzoyOiBub3RlOiBoZXJlCiAgY2FzZSBWNEwyX1BJ
WF9GTVRfTlYxNjoKICBefn5+CgpSZXdvcmsgc28gdGhhdCB0aGUgY29tcGlsZXIgZG9lc24ndCB3
YXJuIGFib3V0IGZhbGwtdGhyb3VnaC4KCkZpeGVzOiBkOTM1MTJlZjBmMGUgKCJNYWtlZmlsZTog
R2xvYmFsbHkgZW5hYmxlIGZhbGwtdGhyb3VnaCB3YXJuaW5nIikKU2lnbmVkLW9mZi1ieTogQW5k
ZXJzIFJveGVsbCA8YW5kZXJzLnJveGVsbEBsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvdmlkZW8v
ZmJkZXYvc2hfbW9iaWxlX2xjZGNmYi5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvc2hfbW9iaWxlX2xjZGNm
Yi5jIGIvZHJpdmVycy92aWRlby9mYmRldi9zaF9tb2JpbGVfbGNkY2ZiLmMKaW5kZXggYWMwYmNh
YzlhODY1Li5jMjQ5NzYzZGJmMGIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvc2hf
bW9iaWxlX2xjZGNmYi5jCisrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvc2hfbW9iaWxlX2xjZGNm
Yi5jCkBAIC0xNTk0LDYgKzE1OTQsNyBAQCBzaF9tb2JpbGVfbGNkY19vdmVybGF5X2ZiX2luaXQo
c3RydWN0IHNoX21vYmlsZV9sY2RjX292ZXJsYXkgKm92bCkKIAljYXNlIFY0TDJfUElYX0ZNVF9O
VjEyOgogCWNhc2UgVjRMMl9QSVhfRk1UX05WMjE6CiAJCWluZm8tPmZpeC55cGFuc3RlcCA9IDI7
CisJCS8qIEZhbGwgdGhyb3VnaCAqLwogCWNhc2UgVjRMMl9QSVhfRk1UX05WMTY6CiAJY2FzZSBW
NEwyX1BJWF9GTVRfTlY2MToKIAkJaW5mby0+Zml4LnhwYW5zdGVwID0gMjsKQEAgLTIwODQsNiAr
MjA4NSw3IEBAIHNoX21vYmlsZV9sY2RjX2NoYW5uZWxfZmJfaW5pdChzdHJ1Y3Qgc2hfbW9iaWxl
X2xjZGNfY2hhbiAqY2gsCiAJY2FzZSBWNEwyX1BJWF9GTVRfTlYxMjoKIAljYXNlIFY0TDJfUElY
X0ZNVF9OVjIxOgogCQlpbmZvLT5maXgueXBhbnN0ZXAgPSAyOworCQkvKiBGYWxsIHRocm91Z2gg
Ki8KIAljYXNlIFY0TDJfUElYX0ZNVF9OVjE2OgogCWNhc2UgVjRMMl9QSVhfRk1UX05WNjE6CiAJ
CWluZm8tPmZpeC54cGFuc3RlcCA9IDI7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
