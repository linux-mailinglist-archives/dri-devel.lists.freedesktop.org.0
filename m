Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D63BE26BB4E
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 06:19:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67C8E6E978;
	Wed, 16 Sep 2020 04:19:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13CA36E978
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 04:19:53 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id nw23so8337976ejb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 21:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=g8cWVBaPNLnzSgqcn2EvlNciExfGEhy8n6zJKhgyLGY=;
 b=HmxSwm0OovzkCxb6twTWygAd8lE1IQIdJK/pnNlhudkcDAvwNB2VkZEXjK+o439Mlg
 aNIhcTN+zHEonutFOc71GrCZC3tbQ62+QypgOVkKO94o7PChFm74yh0ww//YT+22FiWV
 m23IttULJWQiJN6YTAiw3QHgnYxW4C+Pl8zsl20HGOvg8De2Uck3WauizKvvrl0lNCJ/
 c9p4uBLl/e8EvNS+doG7D/krb5XNDv9mn+ZTafVUIp/HvEojvs1sUWzItjJi8l3cv+iv
 0r3HqHoCwllwveqjO1gbbAq0vD6Qa0ee+nRc+LtKhi43XeytBrVXRKpGagop3PM7tyTE
 7n4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=g8cWVBaPNLnzSgqcn2EvlNciExfGEhy8n6zJKhgyLGY=;
 b=uCRf1O+ndU5kmn8cntuWo2Kpu4Y5Ch43Ch3ShS3AFLIq9QgVpGJKnKkfhE8mVDU7XK
 zgCKBIpVsCSEGyDXwH9ebtCBrpyNwfVPJ0iVSl3GYlPUs+0OqhnuX5i+FwKjhoOa/mmW
 ONIksArGq6Uqf020lbGj5lIXj/c2slY5GdyAFzskh/wPn2uVAjUF7n2b0Mtb4Bst1rOC
 00mf5nQf7uA+18ElcNnmwwP4pIxvl5uMEJZ4Zsq9mvNiZRov2YEY4UfWx2FnU/BULmlR
 EfjVJEu2p2g+nYZ1btOaxZQ+6MyTjL0gdpkVhOYRylL4T4qJ4gF4c9R/kXoJg2iMbc7Q
 cUVQ==
X-Gm-Message-State: AOAM530x+TIDYAN9Pojl/4c/k5GEUUJdiTVIIwrpJyLLZhMBH3KNEKwh
 ofbVBXr+GLNLjSAEAHScEUo00NAl0th7PIktTYE=
X-Google-Smtp-Source: ABdhPJwTDoYsC4QLzJtZLHw1JQWKT5WesmVnOIBSCISMFZ4xynjm+ObjrKST7Wi5UohMvbvTXfrGKJqCyDYfPUF4JOw=
X-Received: by 2002:a17:906:f92:: with SMTP id
 q18mr22673835ejj.237.1600229991703; 
 Tue, 15 Sep 2020 21:19:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9txcrHC77Quj6ufUHn0FD1-7b4YKO2MWFZGwJy8Tmj1i7g@mail.gmail.com>
 <6b59373e-c4e0-76b5-ffa7-d4bb954a1ffb@gmail.com>
In-Reply-To: <6b59373e-c4e0-76b5-ffa7-d4bb954a1ffb@gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 16 Sep 2020 14:19:40 +1000
Message-ID: <CAPM=9tzXsGqnbkUH30vUHd7zyenCNj=ikVjx6P1qWq9dx0jiEg@mail.gmail.com>
Subject: Re: some half-baked ttm ideas
To: "Koenig, Christian" <christian.koenig@amd.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAxNiBTZXAgMjAyMCBhdCAwMDoxMiwgQ2hyaXN0aWFuIEvDtm5pZwo8Y2tvZW5pZy5s
ZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gSGkgRGF2ZSwKPgo+IEkgdGhpbmsg
d2Ugc2hvdWxkIGp1c3QgY29tcGxldGVseSBudWtlIHR0bV90dF9iaW5kKCkgYW5kIHR0bV90dF91
bmJpbmQoKQo+IGFuZCBhbGwgb2YgdGhhdC4KPgo+IERyaXZlcnMgY2FuIHRvIHRoaXMgZnJvbSB0
aGVpciBtb3ZlX25vdGlmeSgpIGNhbGxiYWNrIG5vdyBpbnN0ZWFkLgoKR29vZCBwbGFuLCBJJ3Zl
IHB1dCBhIGJ1bmNoIG9mIHJld29yayBpbnRvIHRoZSBzYW1lIGJyYW5jaCwKCmh0dHBzOi8vZ2l0
aHViLmNvbS9haXJsaWVkL2xpbnV4L2NvbW1pdHMvdHRtLWhhbGYtYmFrZWQtaWRlYXMKCmJ1dCBJ
J3ZlIGZyaWVkIG15IGJyYWluIGEgYml0LCBJJ20gaGF2aW5nIHRyb3VibGUgcmVjb25jaWxpbmcg
bW92ZQpub3RpZnkgYW5kIHVuYmluZGluZyBpbiB0aGUgcmlnaHQgcGxhY2VzLCBJIGZlZWwgbGlr
ZSBJJ20gY2lyY2xpbmcKYXJvdW5kIHRoZSBhbnN3ZXIgYnV0IGhhdmVuJ3QgaGl0IGl0IHlldC4K
CkRhdmUuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
