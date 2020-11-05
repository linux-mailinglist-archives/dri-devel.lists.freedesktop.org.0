Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7962A8178
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 15:52:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F126B6ED9E;
	Thu,  5 Nov 2020 14:52:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F05476ED9C
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 14:52:30 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id w1so2105157wrm.4
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 06:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rDbLk2JBRogslz/zoVgvVt10s2+/czAleqnbZF2PqCo=;
 b=GMWyFQ8DSD9byB9lddD/NyUUDqnEAbCbwAp0QAL61+0zBB45uUHwL8q4EDB8BuAAPn
 LQ577k4iflbvlAV0dzpguwoJ66yfIQ/YL0JdHZsm228lZVGpFv9vCCtjKk0Uu4QgBGIY
 n31UkVlb0RTvBCsfV1BL3t72WjAUYYUAasCYzceDyKYsl51RKexB49kUHCpteFFyKmnx
 /1z7S6EQgCudi7WRWd8ZXIl7NCwoqHJ1LbAT/tABZGCvU2bOmnckTynv0+WMyKHoFMph
 4fgVEyqsunNnBgJnRD9zNsJTwPCyrbL614n1ajhMjj52Q4uu5i6z3pq1NWixK4gt9xet
 KzUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rDbLk2JBRogslz/zoVgvVt10s2+/czAleqnbZF2PqCo=;
 b=qUeQIXRTswOzs5u+7fSruBsVimy+i1sPmAPwswTXals+DqTHwBGp+tABg6dsn+Un/t
 Ht5xJRQKqjnd9JWCSdbJHTQ8UivQ+gI7w4UhYMWLQ0idz06U0qryEX+NgCBudutoO/8D
 wLuOcKNTBevLE/b/EujOVlKgMbTTzS8lWK6BL9PGAqWXp3ileDnwvXpxBOvK6CbrxRzt
 0TM/3W4N7BjYDEAZ1181hMG7wDOZ/q8/ff+dj/5EhHROEuRCNCtMiENCj8gSSnJ03dJl
 j4i6nYIxbc/MQxB6onoc8lNG8m70o1uahB3XvkF2OZ1GJxGlu5K4/GWfkf8/gFuCR4sV
 IeDg==
X-Gm-Message-State: AOAM5310Xlr/GXkZ2Uo/BFyBJhs1h4VuzpDWMmHWNsjUJEduhUA8VwUa
 JOthMZpAjoS03+CUfITlZKhReQ==
X-Google-Smtp-Source: ABdhPJyGT71xib6DJdiI22PqqtneEPs2v/oITwMrzyxOxfCyY+tQfjZPt0a48UrqUZedobkzXWBqrA==
X-Received: by 2002:adf:e94b:: with SMTP id m11mr3380925wrn.35.1604587949674; 
 Thu, 05 Nov 2020 06:52:29 -0800 (PST)
Received: from dell.default ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id f5sm2631243wmh.16.2020.11.05.06.52.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 06:52:28 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 12/19] gpu: drm: bridge: analogix: analogix_dp_reg: Remove
 unused function 'analogix_dp_write_byte_to_dpcd'
Date: Thu,  5 Nov 2020 14:45:10 +0000
Message-Id: <20201105144517.1826692-13-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201105144517.1826692-1-lee.jones@linaro.org>
References: <20201105144517.1826692-1-lee.jones@linaro.org>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jingoo Han <jg1.han@samsung.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Jason Yan <yanaijie@huawei.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbmFsb2dpeF9kcF9yZWcuYzo1NzE6NTogd2Fybmlu
Zzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhhbmFsb2dpeF9kcF93cml0ZV9ieXRlX3Rv
X2RwY2TigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQoKQ2M6IEFuZHJ6ZWogSGFqZGEgPGEuaGFq
ZGFAc2Ftc3VuZy5jb20+CkNjOiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5j
b20+CkNjOiBMYXVyZW50IFBpbmNoYXJ0IDxMYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5j
b20+CkNjOiBKb25hcyBLYXJsbWFuIDxqb25hc0Brd2lib28uc2U+CkNjOiBKZXJuZWogU2tyYWJl
YyA8amVybmVqLnNrcmFiZWNAc2lvbC5uZXQ+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGlu
dXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBKYXNvbiBZYW4g
PHlhbmFpamllQGh1YXdlaS5jb20+CkNjOiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+
CkNjOiBKaW5nb28gSGFuIDxqZzEuaGFuQHNhbXN1bmcuY29tPgpDYzogZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPgotLS0KIC4uLi9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbmFsb2dpeF9kcF9yZWcu
YyB8IDQ0IC0tLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0NCBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4
X2RwX3JlZy5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbmFsb2dpeF9kcF9y
ZWcuYwppbmRleCBmYWZiNGI0OTJlYTA0Li45Y2U0NWM3NTdmOGM4IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4X2RwX3JlZy5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXhfZHBfcmVnLmMKQEAgLTU2OCw1MCAr
NTY4LDYgQEAgc3RhdGljIGludCBhbmFsb2dpeF9kcF9zdGFydF9hdXhfdHJhbnNhY3Rpb24oc3Ry
dWN0IGFuYWxvZ2l4X2RwX2RldmljZSAqZHApCiAJcmV0dXJuIHJldHZhbDsKIH0KIAotaW50IGFu
YWxvZ2l4X2RwX3dyaXRlX2J5dGVfdG9fZHBjZChzdHJ1Y3QgYW5hbG9naXhfZHBfZGV2aWNlICpk
cCwKLQkJCQkgICB1bnNpZ25lZCBpbnQgcmVnX2FkZHIsCi0JCQkJICAgdW5zaWduZWQgY2hhciBk
YXRhKQotewotCXUzMiByZWc7Ci0JaW50IGk7Ci0JaW50IHJldHZhbDsKLQotCWZvciAoaSA9IDA7
IGkgPCAzOyBpKyspIHsKLQkJLyogQ2xlYXIgQVVYIENIIGRhdGEgYnVmZmVyICovCi0JCXJlZyA9
IEJVRl9DTFI7Ci0JCXdyaXRlbChyZWcsIGRwLT5yZWdfYmFzZSArIEFOQUxPR0lYX0RQX0JVRkZF
Ul9EQVRBX0NUTCk7Ci0KLQkJLyogU2VsZWN0IERQQ0QgZGV2aWNlIGFkZHJlc3MgKi8KLQkJcmVn
ID0gQVVYX0FERFJfN18wKHJlZ19hZGRyKTsKLQkJd3JpdGVsKHJlZywgZHAtPnJlZ19iYXNlICsg
QU5BTE9HSVhfRFBfQVVYX0FERFJfN18wKTsKLQkJcmVnID0gQVVYX0FERFJfMTVfOChyZWdfYWRk
cik7Ci0JCXdyaXRlbChyZWcsIGRwLT5yZWdfYmFzZSArIEFOQUxPR0lYX0RQX0FVWF9BRERSXzE1
XzgpOwotCQlyZWcgPSBBVVhfQUREUl8xOV8xNihyZWdfYWRkcik7Ci0JCXdyaXRlbChyZWcsIGRw
LT5yZWdfYmFzZSArIEFOQUxPR0lYX0RQX0FVWF9BRERSXzE5XzE2KTsKLQotCQkvKiBXcml0ZSBk
YXRhIGJ1ZmZlciAqLwotCQlyZWcgPSAodW5zaWduZWQgaW50KWRhdGE7Ci0JCXdyaXRlbChyZWcs
IGRwLT5yZWdfYmFzZSArIEFOQUxPR0lYX0RQX0JVRl9EQVRBXzApOwotCi0JCS8qCi0JCSAqIFNl
dCBEaXNwbGF5UG9ydCB0cmFuc2FjdGlvbiBhbmQgd3JpdGUgMSBieXRlCi0JCSAqIElmIGJpdCAz
IGlzIDEsIERpc3BsYXlQb3J0IHRyYW5zYWN0aW9uLgotCQkgKiBJZiBCaXQgMyBpcyAwLCBJMkMg
dHJhbnNhY3Rpb24uCi0JCSAqLwotCQlyZWcgPSBBVVhfVFhfQ09NTV9EUF9UUkFOU0FDVElPTiB8
IEFVWF9UWF9DT01NX1dSSVRFOwotCQl3cml0ZWwocmVnLCBkcC0+cmVnX2Jhc2UgKyBBTkFMT0dJ
WF9EUF9BVVhfQ0hfQ1RMXzEpOwotCi0JCS8qIFN0YXJ0IEFVWCB0cmFuc2FjdGlvbiAqLwotCQly
ZXR2YWwgPSBhbmFsb2dpeF9kcF9zdGFydF9hdXhfdHJhbnNhY3Rpb24oZHApOwotCQlpZiAocmV0
dmFsID09IDApCi0JCQlicmVhazsKLQotCQlkZXZfZGJnKGRwLT5kZXYsICIlczogQXV4IFRyYW5z
YWN0aW9uIGZhaWwhXG4iLCBfX2Z1bmNfXyk7Ci0JfQotCi0JcmV0dXJuIHJldHZhbDsKLX0KLQog
dm9pZCBhbmFsb2dpeF9kcF9zZXRfbGlua19iYW5kd2lkdGgoc3RydWN0IGFuYWxvZ2l4X2RwX2Rl
dmljZSAqZHAsIHUzMiBid3R5cGUpCiB7CiAJdTMyIHJlZzsKLS0gCjIuMjUuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
