Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D59372FE8C5
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 12:30:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99E846E536;
	Thu, 21 Jan 2021 11:30:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16EC66E536;
 Thu, 21 Jan 2021 11:30:15 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id u25so2048603lfc.2;
 Thu, 21 Jan 2021 03:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hxvpmWPpBqokrFx9jp/xiv+/SQKoomU/0EeR829uAnQ=;
 b=oGT8QZ3j/M2Exai8DiQyNUauLIPlcclCbO9OqxP4Tvm1ri97aTr1+/t1n2rNfoRyx+
 SoRobL4OKZOw0KP24iDrVXpaIbEp1j/eLk/rEDh9KZUhcsTSk4W/VETQT9XUsbXLmKs7
 QlVSIkkqMZNuTQKmkdrMatDcgUupu0Bo3zakqRm5ddcV+fvUR+twxB//7SVMzWuQQE+n
 Tte6IWS5p+IrXqJQbupuQl7DF9/efWLmNa5kWz+QfKsgNO15iymlIeS7e8f54fBBxUcr
 kei/55j5CgPaix3LKGijJ2Z0YRoJuofzcVk7nFPcVNT2m6ZdlFKZgDwXMPAPv2dKizG8
 KkZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hxvpmWPpBqokrFx9jp/xiv+/SQKoomU/0EeR829uAnQ=;
 b=IX67gK0ZIUOOEVwlELnFQGXin2XUG4wqdbGgpl75s5Ag3T6/FRSNZSslig9QWlLDlF
 /0GHqQslwzUS3MN5hiwSyWiqN+xjfcma62iEXq2a9Dt7ehhva9+FI9SmMZVN5/npkTkm
 +UN4Ubzf0mkO/hut+XQF8/KKCewLPzq3vzwmwZ5kKAWBXP+a1F9xVIObhX/4KJalCsex
 3H9NWgAu2gv6OsIQAP0MjEHqwDfWzict0JNHOFnlLLoliTfjVIXaYsKPdFs0CHeAynnY
 79OCmTSkdVjDpZWD3xbDXwmQy4naT9MwBHru1xcdHaZRZ0b69O1qB1FYkUNd8/6wy7q5
 UkYg==
X-Gm-Message-State: AOAM533TtIeAf7wn7Sp/0kPvVyvg5KueGbty1tpBTWaPOmWNASnfSpPD
 3Jw0kItJjV1Axp0cNqRXrGk7oi7hM9luvyxezUXQnhHou9g=
X-Google-Smtp-Source: ABdhPJxveMBv01aHpgjn2gOTBWmM8HDrBd76NbrHGzgQcpaFfp1AMKcEnUvNJnxi4r/Uu1UrvM8NuFaI6HSe/MvXQug=
X-Received: by 2002:a05:6512:3251:: with SMTP id
 c17mr2562197lfr.443.1611228613503; 
 Thu, 21 Jan 2021 03:30:13 -0800 (PST)
MIME-Version: 1.0
References: <20210120110708.32131-1-jani.nikula@intel.com>
 <92f48ffdfa30c3941e0fd22337217f0b10d75ec8.camel@redhat.com>
 <875z3qmt5b.fsf@intel.com>
In-Reply-To: <875z3qmt5b.fsf@intel.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 21 Jan 2021 08:30:01 -0300
Message-ID: <CAOMZO5Du9+DTYpuG3FNLRrO_LJVSJa3cdJWWwt_qzQDthGESkg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: fix build after dp quirk helper change
To: Jani Nikula <jani.nikula@intel.com>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFuaSwKCk9uIFRodSwgSmFuIDIxLCAyMDIxIGF0IDg6MjIgQU0gSmFuaSBOaWt1bGEgPGph
bmkubmlrdWxhQGludGVsLmNvbT4gd3JvdGU6Cgo+IFNlYW4sIFJvYiwgb3IgYW55b25lIHdpdGgg
YW4gYXJtIHRvb2xjaGFpbiBmb3IgbXNtIGF2YWlsYWJsZSwgY291bGQgSQo+IHRyb3VibGUgeW91
IHRvIGJ1aWxkIHRlc3QgdGhpcyBwbGVhc2U/CgpJIHRyaWVkIHRvIGJ1aWxkIGFmdGVyIGFwcGx5
aW5nIHlvdXIgcGF0Y2g6CgogIENDICAgICAgZHJpdmVycy9ncHUvZHJtL21zbS9kcC9kcF9jdHJs
Lm8KZHJpdmVycy9ncHUvZHJtL21zbS9kcC9kcF9jdHJsLmM6IEluIGZ1bmN0aW9uIOKAmGRwX2N0
cmxfdXNlX2ZpeGVkX252aWTigJk6CmRyaXZlcnMvZ3B1L2RybS9tc20vZHAvZHBfY3RybC5jOjE0
Mjk6MTE6IGVycm9yOiB0b28gZmV3IGFyZ3VtZW50cyB0bwpmdW5jdGlvbiDigJhkcm1fZHBfaGFz
X3F1aXJr4oCZCiAxNDI5IHwgICByZXR1cm4gKGRybV9kcF9oYXNfcXVpcmsoJmN0cmwtPnBhbmVs
LT5kZXNjLAogICAgICB8ICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+CkluIGZpbGUgaW5jbHVk
ZWQgZnJvbSBkcml2ZXJzL2dwdS9kcm0vbXNtL2RwL2RwX2N0cmwuYzoxNToKLi9pbmNsdWRlL2Ry
bS9kcm1fZHBfaGVscGVyLmg6MjEwMToxOiBub3RlOiBkZWNsYXJlZCBoZXJlCiAyMTAxIHwgZHJt
X2RwX2hhc19xdWlyayhjb25zdCBzdHJ1Y3QgZHJtX2RwX2Rlc2MgKmRlc2MsIHUzMiBlZGlkX3F1
aXJrcywKICAgICAgfCBefn5+fn5+fn5+fn5+fn5+Cm1ha2VbNF06ICoqKiBbc2NyaXB0cy9NYWtl
ZmlsZS5idWlsZDoyODc6CmRyaXZlcnMvZ3B1L2RybS9tc20vZHAvZHBfY3RybC5vXSBFcnJvciAx
Cm1ha2VbM106ICoqKiBbc2NyaXB0cy9NYWtlZmlsZS5idWlsZDo1MzA6IGRyaXZlcnMvZ3B1L2Ry
bS9tc21dIEVycm9yIDIKbWFrZVsyXTogKioqIFtzY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjUzMDog
ZHJpdmVycy9ncHUvZHJtXSBFcnJvciAyCm1ha2VbMV06ICoqKiBbc2NyaXB0cy9NYWtlZmlsZS5i
dWlsZDo1MzA6IGRyaXZlcnMvZ3B1XSBFcnJvciAyCm1ha2U6ICoqKiBbTWFrZWZpbGU6MTgxOTog
ZHJpdmVyc10gRXJyb3IgMgoKSSBoYWQgdG8gYWRkIHRoZSBleHRyYSBwYXJhbWV0ZXIgbGlrZSB0
aGlzOgoKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9kcC9kcF9jdHJsLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL21zbS9kcC9kcF9jdHJsLmMKQEAgLTE0MjAsMTYgKzE0MjAsMTQgQEAgdm9pZCBk
cF9jdHJsX2hvc3RfZGVpbml0KHN0cnVjdCBkcF9jdHJsICpkcF9jdHJsKQogc3RhdGljIGJvb2wg
ZHBfY3RybF91c2VfZml4ZWRfbnZpZChzdHJ1Y3QgZHBfY3RybF9wcml2YXRlICpjdHJsKQogewog
ICAgICAgIHU4ICpkcGNkID0gY3RybC0+cGFuZWwtPmRwY2Q7Ci0gICAgICAgdTMyIGVkaWRfcXVp
cmtzID0gMDsKCi0gICAgICAgZWRpZF9xdWlya3MgPSBkcm1fZHBfZ2V0X2VkaWRfcXVpcmtzKGN0
cmwtPnBhbmVsLT5lZGlkKTsKICAgICAgICAvKgogICAgICAgICAqIEZvciBiZXR0ZXIgaW50ZXJv
cCBleHBlcmllbmNlLCB1c2VkIGEgZml4ZWQgTlZJRD0weDgwMDAKICAgICAgICAgKiB3aGVuZXZl
ciBjb25uZWN0ZWQgdG8gYSBWR0EgZG9uZ2xlIGRvd25zdHJlYW0uCiAgICAgICAgICovCiAgICAg
ICAgaWYgKGRybV9kcF9pc19icmFuY2goZHBjZCkpCi0gICAgICAgICAgICAgICByZXR1cm4gKGRy
bV9kcF9oYXNfcXVpcmsoJmN0cmwtPnBhbmVsLT5kZXNjLCBlZGlkX3F1aXJrcywKLSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBEUF9EUENEX1FVSVJLX0NPTlNUQU5UX04pKTsKKyAgICAg
ICAgICAgICAgIHJldHVybiAoZHJtX2RwX2hhc19xdWlyaygmY3RybC0+cGFuZWwtPmRlc2MsIDAs
CisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRFBfRFBDRF9RVUlSS19D
T05TVEFOVF9OKSk7CgogICAgICAgIHJldHVybiBmYWxzZTsKIH0KCmFuZCB0aGVuIGl0IGJ1aWxk
cy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
