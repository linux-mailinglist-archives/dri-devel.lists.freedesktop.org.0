Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6900BB9845
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 22:10:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 482426E0A6;
	Fri, 20 Sep 2019 20:09:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc44.google.com (mail-yw1-xc44.google.com
 [IPv6:2607:f8b0:4864:20::c44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF9916E0A6
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2019 20:09:57 +0000 (UTC)
Received: by mail-yw1-xc44.google.com with SMTP id x82so2900742ywd.12
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2019 13:09:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fPRCHQzpfEtb8pJUsApdl9+PA2f2wilGmwV36eHSwJw=;
 b=cGSywVpUIyTxQ0PrYUC60kI5rKQ+sfWVLUh0a63zO4w/Z/VYYYfevCTASny9p13WoM
 YBUo9/8ZV5W22D3f7L5ovMRULAkO2Zv5AI+lxeS+CVgt515DYwVptLvq1i1HJdWF1DkK
 Z+GRNnMpq7diq2dR8/BW1WFaMjvLwzmU7QI0WDxaWZVhYlWkFUk8aZaL0tvkZLplDeMW
 wIhO6U9dfip2sPf04QblkFKvtuHqCCDtJJL/nILsCxCgxPFWBNgVGMV4B3J90xmD60jE
 PEKImRqmTXBHQ8epxYaUicf/G+gGn5jIxgxEjEmGuVsg7fEyw7Ehod6fbCdGgVWlhWD0
 KUWw==
X-Gm-Message-State: APjAAAUcWOtzKyD4p2FZlidwBvz126VsUYBfY4Hsqf87iPDCE9Zd9HRf
 det9ib/lfktM4eW5TFBMiYOoFiEOBfFsdwxruZ8+/d/S7jY=
X-Google-Smtp-Source: APXvYqzK0C/i2SB82eJl+OB23YtwahG1WzvELYqmDwqX18Zw57PhUOtsAUdaCOM1Oi2vvaztcb67riyJvckS73UEUjg=
X-Received: by 2002:a81:92c3:: with SMTP id
 j186mr13116669ywg.372.1569010197120; 
 Fri, 20 Sep 2019 13:09:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190920172914.4015180-1-megous@megous.com>
In-Reply-To: <20190920172914.4015180-1-megous@megous.com>
From: Sean Paul <sean@poorly.run>
Date: Fri, 20 Sep 2019 16:09:21 -0400
Message-ID: <CAMavQKKLew+iyL5LVEE9hD9Gyt3WmbnUQf5a=h3OwdmSydzAGw@mail.gmail.com>
Subject: Re: [PATCH] drm: Remove redundant of_device_is_available check
To: megous@megous.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=fPRCHQzpfEtb8pJUsApdl9+PA2f2wilGmwV36eHSwJw=;
 b=Zm+UazHZXDVBPVmnbWqq42tkf0O74KCkKSHLn0pJ/FvfQ8e9QvCMQ/HN0Z+Yy7wnmI
 +3+M+Rk+ejc7xtzj/Aglz2pJiMsb0nbGkiSVlcZ9OZVto0xlb6mIl21gUe5zSqoy1iB+
 Xwr6ggqAAMTI1kn349tSiDMQnuJqBINH1/qgOjfxxaon457VjkYakk9AbvQrEdEX5XHN
 FNtqKXdp583UpURWn0jx4vasTm7bD3ajA5vLbDLkTOYJxLD83LVUFlA14dD/AzRwEpS4
 vUMUjYw3XYSPTX/5Azqpe4cNggVD8rZw6C67o0xuX3lXnG6DCUPHW6B+4VPJW2apWmND
 E+UQ==
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgMjAsIDIwMTkgYXQgMToyOSBQTSA8bWVnb3VzQG1lZ291cy5jb20+IHdyb3Rl
Ogo+Cj4gRnJvbTogT25kcmVqIEppcm1hbiA8bWVnb3VzQG1lZ291cy5jb20+Cj4KPiBUaGlzIGNo
ZWNrIGlzIGFscmVhZHkgcGVyZm9ybWVkIGJ5IG9mX2dyYXBoX2dldF9yZW1vdGVfbm9kZS4gTm8K
PiBuZWVkIHRvIHJlcGVhdCBpdCBpbW1lZGlhdGVseSBhZnRlciB0aGUgY2FsbC4KPgo+IFNpZ25l
ZC1vZmYtYnk6IE9uZHJlaiBKaXJtYW4gPG1lZ291c0BtZWdvdXMuY29tPgoKVGhhbmtzIGZvciB5
b3VyIHBhdGNoLCBJJ3ZlIGFwcGxpZWQgaXQgdG8gZHJtLW1pc2MtbmV4dC4KClNlYW4KCj4gLS0t
Cj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fb2YuYyB8IDUgLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQs
IDUgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9vZi5j
IGIvZHJpdmVycy9ncHUvZHJtL2RybV9vZi5jCj4gaW5kZXggNDNkODlkZDU5YzZiLi4wY2E1ODgw
M2JhNDYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9vZi5jCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2RybV9vZi5jCj4gQEAgLTI0NywxNyArMjQ3LDEyIEBAIGludCBkcm1fb2Zf
ZmluZF9wYW5lbF9vcl9icmlkZ2UoY29uc3Qgc3RydWN0IGRldmljZV9ub2RlICpucCwKPiAgICAg
ICAgICAgICAgICAgKnBhbmVsID0gTlVMTDsKPgo+ICAgICAgICAgcmVtb3RlID0gb2ZfZ3JhcGhf
Z2V0X3JlbW90ZV9ub2RlKG5wLCBwb3J0LCBlbmRwb2ludCk7Cj4gICAgICAgICBpZiAoIXJlbW90
ZSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9ERVY7Cj4KPiAtICAgICAgIGlmICghb2Zf
ZGV2aWNlX2lzX2F2YWlsYWJsZShyZW1vdGUpKSB7Cj4gLSAgICAgICAgICAgICAgIG9mX25vZGVf
cHV0KHJlbW90ZSk7Cj4gLSAgICAgICAgICAgICAgIHJldHVybiAtRU5PREVWOwo+IC0gICAgICAg
fQo+IC0KPiAgICAgICAgIGlmIChwYW5lbCkgewo+ICAgICAgICAgICAgICAgICAqcGFuZWwgPSBv
Zl9kcm1fZmluZF9wYW5lbChyZW1vdGUpOwo+ICAgICAgICAgICAgICAgICBpZiAoIUlTX0VSUigq
cGFuZWwpKQo+ICAgICAgICAgICAgICAgICAgICAgICAgIHJldCA9IDA7Cj4gICAgICAgICAgICAg
ICAgIGVsc2UKPiAgICAgICAgICAgICAgICAgICAgICAgICAqcGFuZWwgPSBOVUxMOwo+IC0tCj4g
Mi4yMy4wCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
