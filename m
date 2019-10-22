Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D81D9E0218
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 12:31:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66D836E5B4;
	Tue, 22 Oct 2019 10:31:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 742086E5B4
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 10:31:42 +0000 (UTC)
Received: from pendragon.ideasonboard.com (143.121.2.93.rev.sfr.net
 [93.2.121.143])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DA97A56A;
 Tue, 22 Oct 2019 12:31:40 +0200 (CEST)
Date: Tue, 22 Oct 2019 13:31:35 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
Subject: [GIT PULL FOR v5.5 - 2nd try] R-Car DU CMM support
Message-ID: <20191022103135.GC4756@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1571740301;
 bh=rf5vNOyMSgmCLzHIq4bYaNynVRPyiXtqfXV1AROu1BE=;
 h=Date:From:To:Subject:From;
 b=aL0tF9+KjT3z/DS5LPLWN92S53MIcblfqlOnGksFhG4ViqnnesHvBNWTJasZIUqw5
 2sfdyGN6T9Qoga4cboeUG9coc3ITxofCN9ET0+fPmeBQEubRhv+bU1T5hg8hI6NE01
 B3AHgztkG2mxMJJDDp+WxNkeHdhSCWrAZ98VIssQ=
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

SGkgRGF2ZSwKClNlY29uZCBhdHRlbXB0LgoKVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNv
bW1pdCBmMWI0YTkyMTdlZmQ2MWQwYjg0YzZkYzQwNDU5NmM4NTE5ZmY2ZjU5OgoKICBNZXJnZSB0
YWcgJ2R1LW5leHQtMjAxOTEwMTYnIG9mIGdpdDovL2xpbnV4dHYub3JnL3BpbmNoYXJ0bC9tZWRp
YSBpbnRvIGRybS1uZXh0ICgyMDE5LTEwLTIyIDE1OjA0OjA3ICsxMDAwKQoKYXJlIGF2YWlsYWJs
ZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6CgogIGdpdDovL2xpbnV4dHYub3JnL3BpbmNoYXJ0
bC9tZWRpYS5naXQgdGFncy9kdS1uZXh0LTIwMTkxMDIyCgpmb3IgeW91IHRvIGZldGNoIGNoYW5n
ZXMgdXAgdG8gYWFkMTU1MmYxZGVmZDNhNTMzNGNkNGIyNTczZmFlOTk2M2Q0ZGI1NzoKCiAgZHJt
OiByY2FyLWR1OiBjcnRjOiBSZWdpc3RlciBHQU1NQV9MVVQgcHJvcGVydGllcyAoMjAxOS0xMC0y
MiAxMzoyMToxOCArMDMwMCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KLSBSLUNhciBEVSBDb2xvciBNYW5hZ2VtZW50IE1v
ZHVsZSBzdXBwb3J0CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCkphY29wbyBNb25kaSAoNik6CiAgICAgIGR0LWJpbmRpbmdz
OiBkaXNwbGF5OiByZW5lc2FzLGNtbTogQWRkIFItQ2FyIENNTSBkb2N1bWVudGF0aW9uCiAgICAg
IGR0LWJpbmRpbmdzOiBkaXNwbGF5LCByZW5lc2FzLGR1OiBEb2N1bWVudCBjbW1zIHByb3BlcnR5
CiAgICAgIGRybTogcmNhci1kdTogQWRkIHN1cHBvcnQgZm9yIENNTQogICAgICBkcm06IHJjYXIt
ZHU6IGttczogSW5pdGlhbGl6ZSBDTU0gaW5zdGFuY2VzCiAgICAgIGRybTogcmNhci1kdTogY3J0
YzogQ29udHJvbCBDTU0gb3BlcmF0aW9ucwogICAgICBkcm06IHJjYXItZHU6IGNydGM6IFJlZ2lz
dGVyIEdBTU1BX0xVVCBwcm9wZXJ0aWVzCgogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9yZW5lc2FzLGNtbS55YW1sICAgfCAgNjcgKysrKysrKwogLi4uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9yZW5lc2FzLGR1LnR4dCAgICAgfCAgIDUgKwogZHJpdmVycy9ncHUvZHJtL3Jj
YXItZHUvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgfCAgIDcgKwogZHJpdmVycy9ncHUvZHJt
L3JjYXItZHUvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgfCAgIDEgKwogZHJpdmVycy9ncHUv
ZHJtL3JjYXItZHUvcmNhcl9jbW0uYyAgICAgICAgICAgICAgICAgfCAyMTcgKysrKysrKysrKysr
KysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2NtbS5oICAgICAgICAgICAg
ICAgICB8ICA1OCArKysrKysKIGRyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfY3J0Yy5j
ICAgICAgICAgICAgIHwgIDcxICsrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJf
ZHVfY3J0Yy5oICAgICAgICAgICAgIHwgICAyICsKIGRyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3Jj
YXJfZHVfZHJ2LmggICAgICAgICAgICAgIHwgICAyICsKIGRyaXZlcnMvZ3B1L2RybS9yY2FyLWR1
L3JjYXJfZHVfZ3JvdXAuYyAgICAgICAgICAgIHwgIDEwICsKIGRyaXZlcnMvZ3B1L2RybS9yY2Fy
LWR1L3JjYXJfZHVfZ3JvdXAuaCAgICAgICAgICAgIHwgICAyICsKIGRyaXZlcnMvZ3B1L2RybS9y
Y2FyLWR1L3JjYXJfZHVfa21zLmMgICAgICAgICAgICAgIHwgIDc2ICsrKysrKysrCiBkcml2ZXJz
L2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X3JlZ3MuaCAgICAgICAgICAgICB8ICAgNSArCiAxMyBm
aWxlcyBjaGFuZ2VkLCA1MjMgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JlbmVzYXMsY21tLnlhbWwKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2NtbS5jCiBjcmVh
dGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9jbW0uaAoKLS0gClJl
Z2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
