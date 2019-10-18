Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8B5DD117
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 23:20:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5AD089B8F;
	Fri, 18 Oct 2019 21:20:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5174891C0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 21:20:41 +0000 (UTC)
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-MjWJDrThOo22JJrIlajryQ-1; Fri, 18 Oct 2019 17:20:37 -0400
Received: by mail-qt1-f197.google.com with SMTP id s14so7212807qtn.4
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 14:20:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=SRxHcppTmB0hjdYEOvrJozm0b4Yk6ZL+ZnrT6AYU+lk=;
 b=UzyTnLNJjpcIz7j9uZ5jO/B1Za0Dvi09uHvVRmMAXwL3+pgPCJkmc+sTX5D2bl//pK
 hEHH3Nlgk0SJgrljRUlpgPn1UeICL9qPczR0VgdgMrjckHKbw5v7r0fpiN8ISXp3Yw8v
 GoNnCzfsliUZCPK5cx75c3/JGPnlGGmODgBBHDzFzU2LjwPQSmrtyxAuTntIqWJWpN+5
 krEkDGPXobk48L6/dR3NmjpRT5iy1+NH38glXGgkDgayPJQKB716zWYKuS0/n4E5gJ5l
 ZD//VOwelGQHb/R/4RBKdImLCRocwnJtvRBFuMtox9yBWETpHBq+bBEiPe2nZc93A2c3
 J+gQ==
X-Gm-Message-State: APjAAAVXbcOnfZI1DuVB5wOTAjxMRikpSfIsqYIusH9OJRhCkQr13I6r
 rhdwpTsKzhSXEqTkBkww35anM+bo58lh+YfefPB8oeiT33+kQPuKpjre1MW5Jug30XGqX5GP9Y+
 yA8CXwFffQ4GRviX9D3qCDz9EEJ4s
X-Received: by 2002:ac8:6b12:: with SMTP id w18mr12228151qts.173.1571433637035; 
 Fri, 18 Oct 2019 14:20:37 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyW7pFvIpbHnFR+9jBLxaVopoDGplzAD5pdaKD4BLr9aH9xUTu98oArc6SCMud7h3dtN8ei6A==
X-Received: by 2002:ac8:6b12:: with SMTP id w18mr12228133qts.173.1571433636829; 
 Fri, 18 Oct 2019 14:20:36 -0700 (PDT)
Received: from dhcp-10-20-1-34.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id v141sm2734148qka.59.2019.10.18.14.20.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2019 14:20:36 -0700 (PDT)
Message-ID: <0acb4ae7e76dd22c4b727d3635740127dbffadb0.camel@redhat.com>
Subject: Re: [PATCH 02/15] drm/dp: Remove a gratuituous blank line
From: Lyude Paul <lyude@redhat.com>
To: Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org
Date: Fri, 18 Oct 2019 17:20:34 -0400
In-Reply-To: <20191015143509.1104985-3-thierry.reding@gmail.com>
References: <20191015143509.1104985-1-thierry.reding@gmail.com>
 <20191015143509.1104985-3-thierry.reding@gmail.com>
Organization: Red Hat
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30)
MIME-Version: 1.0
X-MC-Unique: MjWJDrThOo22JJrIlajryQ-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1571433640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5oGzUW+sxwI+pG/OPT54fknTgINkoIXIGeYAUkz/v/o=;
 b=TfBt6f84Covy78Fpbg4zNBsNPZ+La0DpLd5ydSycgr07aqJN3jZzD93WWokgMd7TTwfJeH
 vBY51dP5+p9tKjdHI3FCvP0W27Ov50V5EMyhE9ky3jNyLK/y29YBzRh1rDwo98/TEnycWa
 RG4KByJBrqG3wLFvzBPrG5NcRh/7CEM=
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

UmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+CgpPbiBUdWUsIDIwMTkt
MTAtMTUgYXQgMTY6MzQgKzAyMDAsIFRoaWVycnkgUmVkaW5nIHdyb3RlOgo+IEZyb206IFRoaWVy
cnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Cj4gCj4gSXQncyBpZGlvbWF0aWMgdG8gY2hl
Y2sgdGhlIHJldHVybiB2YWx1ZSBvZiBhIGZ1bmN0aW9uIGNhbGwgaW1tZWRpYXRlbHkKPiBhZnRl
ciB0aGUgZnVuY3Rpb24gY2FsbCwgd2l0aG91dCBhbnkgYmxhbmsgbGluZXMgaW4gYmV0d2Vlbiwg
dG8gbWFrZSBpdAo+IG1vcmUgb2J2aW91cyB0aGF0IHRoZSB0d28gbGluZXMgYmVsb25nIHRvZ2V0
aGVyLgo+IAo+IHYyOiBmaXggb3V0ZGF0ZWQgY29tbWl0IG1lc3NhZ2UgKFBoaWxpcHAgWmFiZWwp
Cj4gCj4gU2lnbmVkLW9mZi1ieTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4K
PiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYyB8IDEgLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2RwX2hlbHBlci5jCj4gYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jCj4gaW5k
ZXggZjM3Mzc5OGQ4MmY2Li44ZjJkN2M0ODUwY2EgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2RybV9kcF9oZWxwZXIuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVy
LmMKPiBAQCAtMjIwLDcgKzIyMCw2IEBAIHN0YXRpYyBpbnQgZHJtX2RwX2RwY2RfYWNjZXNzKHN0
cnVjdCBkcm1fZHBfYXV4ICphdXgsIHU4Cj4gcmVxdWVzdCwKPiAgCQl9Cj4gIAo+ICAJCXJldCA9
IGF1eC0+dHJhbnNmZXIoYXV4LCAmbXNnKTsKPiAtCj4gIAkJaWYgKHJldCA+PSAwKSB7Cj4gIAkJ
CW5hdGl2ZV9yZXBseSA9IG1zZy5yZXBseSAmIERQX0FVWF9OQVRJVkVfUkVQTFlfTUFTSzsKPiAg
CQkJaWYgKG5hdGl2ZV9yZXBseSA9PSBEUF9BVVhfTkFUSVZFX1JFUExZX0FDSykgewotLSAKQ2hl
ZXJzLAoJTHl1ZGUgUGF1bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
