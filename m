Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88210765A2
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 14:25:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 381DB6ED2E;
	Fri, 26 Jul 2019 12:25:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BEAA6ED2E
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 12:25:13 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 7024E804B4;
 Fri, 26 Jul 2019 14:25:11 +0200 (CEST)
Date: Fri, 26 Jul 2019 14:25:10 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Josef Lusticky <josef@lusticky.cz>, Daniel Vetter <daniel@ffwll.ch>
Subject: Controllers with several interface options - one or more drivers?
Message-ID: <20190726122510.GA14341@ravnborg.org>
References: <20190304125033.28841-1-josef@lusticky.cz>
 <20190708145618.26031-1-josef@lusticky.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190708145618.26031-1-josef@lusticky.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=wt4kVBOfN0H4b_kmb9MA:9 a=CjuIK1q_8ugA:10 a=Z5ABNNGmrOfJ6cZ5bIyy:22
 a=UDnyf2zBuKT2w-IlGP_r:22
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSm9zZWYsIERhbmllbCBldCBhbC4KClRoZSBkcml2ZXIgdGhhdCB0cmlnZ2VyZWQgdGhpcyBy
ZXBseSBpcyBhIGRyaXZlciB0aGF0IGFkZHMgcGFyYWxsZWwKc3VwcG9ydCB0byBpbGk5MzQxIGlu
IGEgZGVkaWNhdGVkIHBhbmVsIGRyaXZlci4KVGhlIGlzc3VlIGhlcmUgaXMgdGhhdCB3ZSBhbHJl
YWR5IGhhdmUgYSB0aW55IGRyaXZlciB0aGF0IHN1cHBvcnRzIHRoZQppbGk5MzQxIGNvbnRyb2xs
ZXIgLSBidXQgd2l0aCBhIHNsaWdodGx5IGRpZmZlcmVudCBjb25maWd1cmF0aW9uLgoKVGhlIGls
aTkzNDEgc3VwcG9ydHMgc2V2ZXJhbCBpbnRlcmZhY2VzIC0gZnJvbSB0aGUgZGF0YXNoZWV0Ogog
ICAgIklMSTkzNDEgc3VwcG9ydHMgcGFyYWxsZWwgOC0vOS0vMTYtLzE4LWJpdCBkYXRhIGJ1cwog
ICAgIE1DVSBpbnRlcmZhY2UsIDYtLzE2LS8xOC1iaXQgZGF0YSBidXMgUkdCIGludGVyZmFjZSBh
bmQKICAgICAzLS80LWxpbmUgc2VyaWFsIHBlcmlwaGVyYWwgaW50ZXJmYWNlIChTUEkpIgoKTm9y
YWxmIC0gaW4gYW5vdGhlciBtYWlsIGV4cGxhaW5lZDoKIgpUaGUgTUlQSSBBbGxpYW5jZSBoYXMg
bG90cyBvZiBzdGFuZGFyZHMgc29tZSB3cnQuIGRpc3BsYXkgY29udHJvbGxlcgppbnRlcmZhY2Vz
OgotIE1JUEkgREJJIC0gRGlzcGxheSBCdXMgSW50ZXJmYWNlICh1c2VkIGZvciBjb21tYW5kcyBh
bmQgb3B0aW9uYWxseSBwaXhlbHMpCi0gTUlQSSBEUEkgLSBEaXNwbGF5IFBpeGVsIEludGVyZmFj
ZSAoYWxzbyBjYWxsZWQgUkdCIGludGVyZmFjZSBvcgpET1RDTEsgaW50ZXJmYWNlKQotIE1JUEkg
RFNJIC0gRGlzcGxheSBTZXJpYWwgSW50ZXJmYWNlIChjb21tYW5kcyBhbmQgcGl4ZWxzKQoKVGhl
IGlsaTkzNDEgc3VwcG9ydHMgYm90aCBNSVBJIERCSSBhbmQgRFBJLgoiCgpNSVBJIERQSSAtIGlz
IGEgZ29vZCBmaXQgZm9yIGEgZHJtX3BhbmVsIGRyaXZlci4KTUlQSSBEQkkgLSByZXF1aXJlcyBh
IGZ1bGwgZGlzcGxheSBjb250cm9sbGVyIGRyaXZlci4KClRoZXJlIGFyZSBtYW55IG90aGVyIGV4
YW1wbGVzIG9mIGRyaXZlciBTb0MgdGhhdCBpbiB0aGUgc2FtZSB3YXkKY2FuIGJlIHNlZW4gb25s
eSBhcyBhIHBhbmVsIG9yIGFzIGEgZnVsbCBkaXNwbGF5IGNvbnRyb2xsZXIgZHJpdmVyLgoKVGhl
IG9wZW4gcXVlc3Rpb24gaGVyZSBpcyBpZiB3ZSBzaG91bGQgdHJ5IHRvIHN1cHBvcnQgYm90aCBj
YXNlcyBpbiB0aGUKc2FtZSBkcml2ZXIgLyBmaWxlLiBPciBzaGFsbCB3ZSBpbXBsbWVudCB0d28g
ZGlmZmVyZW50IGRyaXZlcnMuCk9uZSBmb3IgdGhlIHBhbmVsIHVzZS1jYXNlLiBBbmQgb25lIGZv
ciB0aGUgZGlzcGxheSBjb250cm9sbGVyIHVzZWNhc2U/CgpOb3Qgc3VyZSAtIHNvIGFza2luZyBm
b3IgZmVlZGJhY2suCgoJU2FtCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
