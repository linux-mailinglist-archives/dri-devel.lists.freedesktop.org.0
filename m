Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 429CB3251CB
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 15:58:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 889846E188;
	Thu, 25 Feb 2021 14:58:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9145B6E1B2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Feb 2021 14:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=WcjXd4OF0djPDUFVtvVeDIyYimXmqHL7XHs56sCVr80=; 
 b=SYF4sYrj/vYSCWWAek4NBnQN/R/lvApD1Q0+drAv+3nvR+AvA/bG85/xyWQ03yetZG6542ltPfhEdKQzQKE0pUoeP7ewtOD0O4Ikeef+Ub0xVGJoMxEDCokVMCwMD2c4n99FtacoOI87U6fn1yQi9wwUjnJVfSmXs6HgfhFpEousWXHSHz4RNXY8X2r3mih0GczItPpwwCoYZLyWfLaMPbKm+mxBRaY0tBFiikP/3s9IhXBVXCxIPvT2KZ0ctUDGPRL3JYmGxgDsFaGnDXezRQD2Gt3Q536lNFtj8LorVgVfG0wKrbr0h29AP88eHNs/ocMIYidJsE5VwSq8IaXCUg==;
Received: from lneuilly-657-1-8-171.w81-250.abo.wanadoo.fr ([81.250.147.171]
 helo=localhost) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1lFI4y-0003gU-I9; Thu, 25 Feb 2021 15:57:24 +0100
From: Neil Roberts <nroberts@igalia.com>
To: Dan Carpenter <dan.carpenter@oracle.com>, Eric Anholt
 <eric@anholt.duckdns.org>
Subject: Re: [PATCH RESEND] drm/vc4: Fix an error code vc4_create_object()
In-Reply-To: <20210225144210.GA2222@kadam>
References: <20210225144210.GA2222@kadam>
Date: Thu, 25 Feb 2021 15:57:14 +0100
Message-ID: <875z2gci0l.fsf@yahoo.co.uk>
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPiB3cml0ZXM6Cgo+IFRoZSB2
YzRfY3JlYXRlX29iamVjdCgpIG5lZWRzIHRvIHJldHVybiBOVUxMIG9uIGVycm9yLCBub3QgZXJy
b3IKPiBwb2ludGVycy4gIElmIGl0IHJldHVybnMgYW4gZXJyb3IgcG9pbnRlciB0aGVuIHRoYXQg
d2lsbCBsZWFkIHRvIGFuCj4gT29wcyBpbiB0aGUgY2FsbGVycy4gIEZvcnR1bmF0ZWx5LCBpbiBj
dXJyZW50IGtlcm5lbHMgc21hbGwgYWxsb2NhdGlvbnMKPiBhbHdheXMgc3VjY2VkIHNvIHRoaXMg
d2lsbCBuZXZlciBoYXBwZW4uCj4KPiBGaXhlczogYzgyNmE2ZTEwNjQ0ICgiZHJtL3ZjNDogQWRk
IGEgQk8gY2FjaGUuIikKPiBTaWduZWQtb2ZmLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVu
dGVyQG9yYWNsZS5jb20+Cj4gLS0tCj4gSSBzZW50IHRoaXMgcGF0Y2ggbGFzdCBKdW5lIGJ1dCBp
dCB3YXMgbmV2ZXIgYXBwbGllZC4KPgo+ICBkcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9iby5jIHwg
MiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9iby5jIGIvZHJpdmVycy9ncHUv
ZHJtL3ZjNC92YzRfYm8uYwo+IGluZGV4IDcyZDMwZDkwYjg1NmMuLjBhZjI0NmE1NjA5Y2EgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfYm8uYwo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS92YzQvdmM0X2JvLmMKPiBAQCAtMzg5LDcgKzM4OSw3IEBAIHN0cnVjdCBkcm1fZ2Vt
X29iamVjdCAqdmM0X2NyZWF0ZV9vYmplY3Qoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgc2l6ZV90
IHNpemUpCj4gIAo+ICAJYm8gPSBremFsbG9jKHNpemVvZigqYm8pLCBHRlBfS0VSTkVMKTsKPiAg
CWlmICghYm8pCj4gLQkJcmV0dXJuIEVSUl9QVFIoLUVOT01FTSk7Cj4gKwkJcmV0dXJuIE5VTEw7
CgpUaGlzIGNoYW5nZSBsb29rcyByaWdodCB0byBtZS4gRm9yIHJlZmVyZW5jZSwgdGhlIGNvZGUg
dGhhdCBjYWxscyBpdApsb29rcyBsaWtlIHRoaXM6CgoJaWYgKGRybS0+ZHJpdmVyLT5nZW1fY3Jl
YXRlX29iamVjdCkKCQlnZW1fb2JqID0gZHJtLT5kcml2ZXItPmdlbV9jcmVhdGVfb2JqZWN0KGRy
bSwgc2l6ZSk7CiAgICAgICAgLyog4oCmICovCglpZiAoIWdlbV9vYmopCgkJcmV0dXJuIEVSUl9Q
VFIoLUVOT01FTSk7CgpSZXZpZXdlZC1ieTogTmVpbCBSb2JlcnRzIDxucm9iZXJ0c0BpZ2FsaWEu
Y29tPgoKUmVnYXJkcywKLSBOZWlsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
