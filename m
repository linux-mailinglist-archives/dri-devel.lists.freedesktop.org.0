Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B0796AC9
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 22:40:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B99426E884;
	Tue, 20 Aug 2019 20:40:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2C426E888
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 20:40:35 +0000 (UTC)
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0BD8480F81
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 20:40:35 +0000 (UTC)
Received: by mail-qt1-f199.google.com with SMTP id i1so183938qtm.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 13:40:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=cHHeRYCkyaey9HsID1Hx1OJNJnRmD52FkxYaiMYkKyc=;
 b=QJ89nnuk1NF1Ms2xtwCJbvctRvnK5lJzvXBUIqcR0ErDD1li6xEsHaaOt5cKu1q5ZC
 adqg1lbS8u4sCfRWxA5X/N9yo8ewr4vUUFUBaVOpo8A7iGW+zUMO0vEWLj+YWRixBXTm
 WdjmMcaB60qqR53G1PQQHWg+o33hbV7RVx6OY64HvfNspBEsgwnoCO9Ii5ad4ZWp1XcU
 F+Gztb9mXymWAuxnFKoTzgwpEGmddlX5t4nBmwTGkV5blevJPFUsbO85eZ6da76z87RR
 h+bAn6/j9yWvRMVn7OQXz5fHlntR0SgiKA/pHUqHjTlMdym9sHS/FlS3VhZYORqNeJ7t
 AJbA==
X-Gm-Message-State: APjAAAUyx1r0gdPoPbyAfJSMJC+1O3iJPNBMpjJ0H8OluRZkmWjhFDjh
 lwh1soWJZq/oOevaU6J1Dl6wT4MvQrt3QcK6XXN3OwPOgHwxqbfKUSllGRnZeqC6NsNE2Wi6KaJ
 5W5k08T+0HNVBvOpsYN87kWhZ9iY7
X-Received: by 2002:a37:6785:: with SMTP id
 b127mr26857026qkc.294.1566333634387; 
 Tue, 20 Aug 2019 13:40:34 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwuwoTyQHSS+8MD6od7RNup/T3YB4/gWGKd11qFl0QabNZ+cCvbwTd0Z9irS2EpWznnYos9Fw==
X-Received: by 2002:a37:6785:: with SMTP id
 b127mr26857008qkc.294.1566333634169; 
 Tue, 20 Aug 2019 13:40:34 -0700 (PDT)
Received: from dhcp-10-20-1-11.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id u57sm10981125qtk.29.2019.08.20.13.40.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 13:40:33 -0700 (PDT)
Message-ID: <3fd52300d144fcef26ceed8cec663ff513cc1e0c.camel@redhat.com>
Subject: Re: [PATCH v2 08/14] drm/dp-mst: Parse FEC capability on MST ports
From: Lyude Paul <lyude@redhat.com>
To: David Francis <David.Francis@amd.com>, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org
Date: Tue, 20 Aug 2019 16:40:33 -0400
In-Reply-To: <20190820191203.25807-9-David.Francis@amd.com>
References: <20190820191203.25807-1-David.Francis@amd.com>
 <20190820191203.25807-9-David.Francis@amd.com>
Organization: Red Hat
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
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
MDgtMjAgYXQgMTU6MTEgLTA0MDAsIERhdmlkIEZyYW5jaXMgd3JvdGU6Cj4gQXMgb2YgRFAxLjQs
IEVOVU1fUEFUSF9SRVNPVVJDRVMgcmV0dXJucyBhIGJpdCBpbmRpY2F0aW5nCj4gaWYgRkVDIGNh
biBiZSBzdXBwb3J0ZWQgdXAgdG8gdGhhdCBwb2ludCBpbiB0aGUgTVNUIG5ldHdvcmsuCj4gCj4g
VGhlIGJpdCBpcyB0aGUgZmlyc3QgYnl0ZSBvZiB0aGUgRU5VTV9QQVRIX1JFU09VUkNFUyBhY2sg
cmVwbHksCj4gYm90dG9tLW1vc3QgYml0IChyZWZlciB0byBzZWN0aW9uIDIuMTEuOS40IG9mIERQ
IHN0YW5kYXJkLAo+IHYxLjQpCj4gCj4gVGhhdCB2YWx1ZSBpcyBuZWVkZWQgZm9yIEZFQyBhbmQg
RFNDIHN1cHBvcnQKPiAKPiBTdG9yZSBpdCBvbiBkcm1fZHBfbXN0X3BvcnQKPiAKPiBTaWduZWQt
b2ZmLWJ5OiBEYXZpZCBGcmFuY2lzIDxEYXZpZC5GcmFuY2lzQGFtZC5jb20+Cj4gLS0tCj4gIGRy
aXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgfCAyICsrCj4gIGluY2x1ZGUvZHJt
L2RybV9kcF9tc3RfaGVscGVyLmggICAgICAgfCAzICsrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDUg
aW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21z
dF90b3BvbG9neS5jCj4gYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCj4g
aW5kZXggZDc4OWI3YWY3ZGJmLi5iNDBkOTc1YWVjNzYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1f
ZHBfbXN0X3RvcG9sb2d5LmMKPiBAQCAtNTUyLDYgKzU1Miw3IEBAIHN0YXRpYyBib29sCj4gZHJt
X2RwX3NpZGViYW5kX3BhcnNlX2VudW1fcGF0aF9yZXNvdXJjZXNfYWNrKHN0cnVjdCBkcm1fZHBf
c2lkZWJhbmQKPiAgewo+ICAJaW50IGlkeCA9IDE7Cj4gIAlyZXBtc2ctPnUucGF0aF9yZXNvdXJj
ZXMucG9ydF9udW1iZXIgPSAocmF3LT5tc2dbaWR4XSA+PiA0KSAmIDB4ZjsKPiArCXJlcG1zZy0+
dS5wYXRoX3Jlc291cmNlcy5mZWNfY2FwYWJsZSA9IHJhdy0+bXNnW2lkeF0gJiAweDE7Cj4gIAlp
ZHgrKzsKPiAgCWlmIChpZHggPiByYXctPmN1cmxlbikKPiAgCQlnb3RvIGZhaWxfbGVuOwo+IEBA
IC0yMTgwLDYgKzIxODEsNyBAQCBzdGF0aWMgaW50IGRybV9kcF9zZW5kX2VudW1fcGF0aF9yZXNv
dXJjZXMoc3RydWN0Cj4gZHJtX2RwX21zdF90b3BvbG9neV9tZ3IgKm1nciwKPiAgCQkJRFJNX0RF
QlVHX0tNUygiZW51bSBwYXRoIHJlc291cmNlcyAlZDogJWQgJWRcbiIsCj4gdHhtc2ctPnJlcGx5
LnUucGF0aF9yZXNvdXJjZXMucG9ydF9udW1iZXIsIHR4bXNnLQo+ID5yZXBseS51LnBhdGhfcmVz
b3VyY2VzLmZ1bGxfcGF5bG9hZF9id19udW1iZXIsCj4gIAkJCSAgICAgICB0eG1zZy0KPiA+cmVw
bHkudS5wYXRoX3Jlc291cmNlcy5hdmFpbF9wYXlsb2FkX2J3X251bWJlcik7Cj4gIAkJCXBvcnQt
PmF2YWlsYWJsZV9wYm4gPSB0eG1zZy0KPiA+cmVwbHkudS5wYXRoX3Jlc291cmNlcy5hdmFpbF9w
YXlsb2FkX2J3X251bWJlcjsKPiArCQkJcG9ydC0+ZmVjX2NhcGFibGUgPSB0eG1zZy0KPiA+cmVw
bHkudS5wYXRoX3Jlc291cmNlcy5mZWNfY2FwYWJsZTsKPiAgCQl9Cj4gIAl9Cj4gIAo+IGRpZmYg
LS1naXQgYS9pbmNsdWRlL2RybS9kcm1fZHBfbXN0X2hlbHBlci5oCj4gYi9pbmNsdWRlL2RybS9k
cm1fZHBfbXN0X2hlbHBlci5oCj4gaW5kZXggZGRiNTE4ZjIxNTdhLi5mYTk3Mzc3M2E0YTcgMTAw
NjQ0Cj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2RwX21zdF9oZWxwZXIuaAo+ICsrKyBiL2luY2x1
ZGUvZHJtL2RybV9kcF9tc3RfaGVscGVyLmgKPiBAQCAtMTA4LDYgKzEwOCw4IEBAIHN0cnVjdCBk
cm1fZHBfbXN0X3BvcnQgewo+ICAJICogYXVkaW8tY2FwYWJsZS4KPiAgCSAqLwo+ICAJYm9vbCBo
YXNfYXVkaW87Cj4gKwo+ICsJYm9vbCBmZWNfY2FwYWJsZTsKPiAgfTsKPiAgCj4gIC8qKgo+IEBA
IC0zMTIsNiArMzE0LDcgQEAgc3RydWN0IGRybV9kcF9wb3J0X251bWJlcl9yZXEgewo+ICAKPiAg
c3RydWN0IGRybV9kcF9lbnVtX3BhdGhfcmVzb3VyY2VzX2Fja19yZXBseSB7Cj4gIAl1OCBwb3J0
X251bWJlcjsKPiArCWJvb2wgZmVjX2NhcGFibGU7Cj4gIAl1MTYgZnVsbF9wYXlsb2FkX2J3X251
bWJlcjsKPiAgCXUxNiBhdmFpbF9wYXlsb2FkX2J3X251bWJlcjsKPiAgfTsKLS0gCkNoZWVycywK
CUx5dWRlIFBhdWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
