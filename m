Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88526D3996
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 08:48:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE4046EBAE;
	Fri, 11 Oct 2019 06:48:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61E206EABF
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 07:54:35 +0000 (UTC)
Received: from [167.98.27.226] (helo=[10.35.6.110])
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1iITHN-00025B-A9; Thu, 10 Oct 2019 08:54:33 +0100
Subject: Re: [PATCH] drm/scheduler: make unexported items static
To: linux-kernel@lists.codethink.co.uk
References: <20191009121447.31017-1-ben.dooks@codethink.co.uk>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <6f09197a-d266-aa00-47b8-dd3deede59c9@codethink.co.uk>
Date: Thu, 10 Oct 2019 08:54:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191009121447.31017-1-ben.dooks@codethink.co.uk>
Content-Language: en-GB
X-Mailman-Approved-At: Fri, 11 Oct 2019 06:48:21 +0000
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDkvMTAvMjAxOSAxMzoxNCwgQmVuIERvb2tzIHdyb3RlOgo+IFRoZSBkcm1fc2NoZWRfZmVu
Y2Vfb3BzX3tzY2hlZHVsZWQsZmluaXNoZWR9IGFyZSBub3QgZXhwb3J0ZWQKPiBmcm9tIHRoZSBm
aWxlIHNvIG1ha2UgdGhlbSBzdGF0aWMgdG8gYXZvaWQgdGhlIGZvbGxvd2luZwo+IHdhcm5pbmdz
IGZyb20gc3BhcnNlOgo+IAo+IGRyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfZmVuY2Uu
YzoxMzE6Mjg6IHdhcm5pbmc6IHN5bWJvbCAnZHJtX3NjaGVkX2ZlbmNlX29wc19zY2hlZHVsZWQn
IHdhcyBub3QgZGVjbGFyZWQuIFNob3VsZCBpdCBiZSBzdGF0aWM/Cj4gZHJpdmVycy9ncHUvZHJt
L3NjaGVkdWxlci9zY2hlZF9mZW5jZS5jOjEzNzoyODogd2FybmluZzogc3ltYm9sICdkcm1fc2No
ZWRfZmVuY2Vfb3BzX2ZpbmlzaGVkJyB3YXMgbm90IGRlY2xhcmVkLiBTaG91bGQgaXQgYmUgc3Rh
dGljPwo+IAo+IFNpZ25lZC1vZmYtYnk6IEJlbiBEb29rcyA8YmVuLmRvb2tzQGNvZGV0aGluay5j
by51az4KCklmIGl0IGlzIHVzZWZ1bCBJIGNhbiBnZXQgdGhlc2UgaW50byBhIHB1YmxpYyBnaXQg
cmVwbyBhbmQgc2VuZAphIHB1bGwgcmVxdWVzdC4KCi0tIApCZW4gRG9va3MJCQkJaHR0cDovL3d3
dy5jb2RldGhpbmsuY28udWsvClNlbmlvciBFbmdpbmVlcgkJCQlDb2RldGhpbmsgLSBQcm92aWRp
bmcgR2VuaXVzCgpodHRwczovL3d3dy5jb2RldGhpbmsuY28udWsvcHJpdmFjeS5odG1sCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
