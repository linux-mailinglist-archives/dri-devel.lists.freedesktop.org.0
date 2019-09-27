Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4CDC01B0
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 11:03:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59D826EEBF;
	Fri, 27 Sep 2019 09:03:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A94346EEB9
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2019 09:03:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 148DEAFA9;
 Fri, 27 Sep 2019 09:03:12 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com, sam@ravnborg.org,
 yc_chen@aspeedtech.com
Subject: [PATCH v3 0/5] drm/ast: Place cursor BOs at VRAM high-end
Date: Fri, 27 Sep 2019 11:03:04 +0200
Message-Id: <20190927090309.10254-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

KHdhczogZHJtL2FzdC9tZ2FnMjAwOiBQbGFjZSBjdXJzb3IgQk9zIGF0IFZSQU0gaGlnaC1lbmQp
CgpUaGlzIHBhdGNoc2V0IGNsZWFucyB1cCB0aGUgbWVtb3J5IG1hbmFnZW1lbnQgb2YgSFcgY3Vy
c29ycyBpbiBhc3QuIEl0CmZ1cnRoZXIgbW92ZXMgdGhlIGFsbG9jYXRlZCBjdXJzb3IgQk9zIHRv
IHRoZSBvZiB0aGUgdmlkZW8gUkFNIHRvIHJlZHVjZQptZW1vcnkgZnJhZ21lbnRhdGlvbi4KClRo
ZSBhc3QgZHJpdmVyIG1hbmFnZXMgY3Vyc29yIG1lbW9yeSBpbiBhIGRlZGljYXRlZCBHRU0gVlJB
TSBidWZmZXIKb2JqZWN0LiBJdCB1c2VzIGEgZG91YmxlLWJ1ZmZlcmluZyBzY2hlbWUgb2YgYWx0
ZXJuYXRpbmcgYmV0d2VlbiBvZmZzZXRzCndpdGhpbiB0aGUgR0VNIEJPLiBUaGUgY29kZSBpcyBj
b252b2x1dGVkIGFuZCBjYW4gbGVhZCB0byBtZW1vcnkKZnJhZ21lbnRhdGlvbiBpZiB0aGUgQk8g
aXMgc3RvcmVkIHRoZSBtaWRkbGUgb2YgVlJBTS4gVGhpcyBpcyBlc3BlY2lhbGx5CmEgcHJvYmxl
bSBhcyBhc3QgZGV2aWNlcyBvbmx5IGhhdmUgYSBzbWFsbCBhbW91bnQgb2YgdmlkZW8gbWVtb3J5
IChlLmcuLAo4IE1pQikuCgpXaXRoIHRoaXMgcGF0Y2hzZXQsIHRoZSBjdXJzb3IgaGFuZGxpbmcg
aW4gYXN0IGlzIGZpcnN0IHNwbGl0IHVwIGludG8Kc2VwYXJhdGUgZnVuY3Rpb25zIGZvciBjb3B5
aW5nIGN1cnNvciBpbWFnZXMsIG1hbmFnaW5nIGJ1ZmZlciBvYmplY3RzLApzZXR0aW5nIHNjYW5v
dXQgYWRkcmVzc2VzLCBhbmQgbW92aW5nIGFuZCBoaWRpbmcgdGhlIGN1cnNvci4gRnVydGhlcm1v
cmUsCnRoZSBkcml2ZXIgZGVkaWNhdGVzIGEgZmV3IEtpQiBhdCB0aGUgaGlnaCBlbmQgb2YgdGhl
IGRldmljZSdzIHZpZGVvCm1lbW9yeSB0byBzdG9yaW5nIHRoZSBjdXJzb3IncyBidWZmZXIgb2Jq
ZWN0cy4gVGhpcyBwcmV2ZW50cyBtZW1vcnkKZnJhZ21lbnRhdGlvbi4KClRoZSBwYXRjaHNldCBo
YXMgYmVlbiB0ZXN0ZWQgb24gYXN0IGhhcmR3YXJlLgoKdjM6CgkqIHNwbGl0LW9mZiBhc3QgcGF0
Y2hlcyBpbnRvIHNlcGFyYXRlIHNlcmllcwoJKiBtb3ZlIGFyb3VuZCBhc3Rfe3Nob3csaGlkZX1f
Y3Vyc29yIGluIGEgc2VwYXJhdGUgcGF0Y2gKCSogZml4IHNwYWNlLWJlZm9yZS10YWIgZXJyb3Ig
bmVhciBBU1RfSFdDX1NJR05BVFVSRV9DSEVDS1NVTQp2MjoKCSogcmVtb3ZlIFZSQU0gYnVmZmVy
cyBpbiBmYXZvciBvZiBHRU0gQk9zCgkqIG1hbmFnZSBCTyBwbGFjZW1lbnQgd2l0aCBwaW4gZmxh
ZwoKClRob21hcyBaaW1tZXJtYW5uICg1KToKICBkcm0vYXN0OiBEb24ndCBjYWxsIGFzdF9zaG93
X2N1cnNvcigpIGZyb20gYXN0X2N1cnNvcl9tb3ZlKCkKICBkcm0vYXN0OiBNb3ZlIGFzdF97c2hv
dyxoaWRlfV9jdXJzb3IoKSB3aXRoaW4gc291cmNlIGZpbGUKICBkcm0vYXN0OiBNb3ZlIGN1cnNv
ciB1cGRhdGUgY29kZSB0byBhc3Rfc2hvd19jdXJzb3IoKQogIGRybS9hc3Q6IE1vdmUgY3Vyc29y
IG9mZnNldCBzd2FwcGluZyBpbnRvIGFzdF9zaG93X2N1cnNvcigpCiAgZHJtL2FzdDogQWxsb2Nh
dGUgY3Vyc29yIEJPcyBhdCBoaWdoIGVuZCBvZiB2aWRlbyBtZW1vcnkKCiBkcml2ZXJzL2dwdS9k
cm0vYXN0L2FzdF9kcnYuaCAgfCAgNDMgKysrLS0tCiBkcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9t
b2RlLmMgfCAyMzUgKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tCiAyIGZpbGVzIGNo
YW5nZWQsIDE1OCBpbnNlcnRpb25zKCspLCAxMjAgZGVsZXRpb25zKC0pCgotLQoyLjIzLjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
