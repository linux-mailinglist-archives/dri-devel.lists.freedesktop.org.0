Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0671780AFB
	for <lists+dri-devel@lfdr.de>; Sun,  4 Aug 2019 14:39:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4A5889EAE;
	Sun,  4 Aug 2019 12:39:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B21BD89EAE
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Aug 2019 12:39:11 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3E851F85;
 Sun,  4 Aug 2019 14:39:10 +0200 (CEST)
Date: Sun, 4 Aug 2019 15:39:09 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH 2/2] drm/omap: dmm_tiler: Remove the
 dma_async_issue_pending() call
Message-ID: <20190804123909.GG4984@pendragon.ideasonboard.com>
References: <20190731094233.13890-1-peter.ujfalusi@ti.com>
 <20190731094233.13890-3-peter.ujfalusi@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190731094233.13890-3-peter.ujfalusi@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1564922350;
 bh=vqfUF948pQJ+Ht8VA1aLY67yl0LZPvsM3F6faXcuyPk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=by1GXRiC+TPUmRHArzPHIohDDtbPYk7CHsK1DUYRqKMR8RXy8Aftph80lRbuvlI8L
 0zxOLdkLNQ9c3BsqS3MjUam7iVyF3NhIHyryOJ18BMX/VhRDyHI8lvei5ZUmkBYSSD
 p+3b9snAj5Yx8jq5lw+HBZou2qYvdc2208L9wL8g=
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
Cc: airlied@linux.ie, jsarha@ti.com, tomi.valkeinen@ti.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUGV0ZXIsCgpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4KCk9uIFdlZCwgSnVsIDMxLCAyMDE5
IGF0IDEyOjQyOjMzUE0gKzAzMDAsIFBldGVyIFVqZmFsdXNpIHdyb3RlOgo+IGRtYV9zeW5jX3dh
aXQoKSBpcyBjYWxsaW5nIGl0IHNvIG5vIG5lZWQgdG8gY2FsbCBpdCBpbiB0aGUgZHJpdmVyLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IFBldGVyIFVqZmFsdXNpIDxwZXRlci51amZhbHVzaUB0aS5jb20+
CgpSZXZpZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29u
Ym9hcmQuY29tPgoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9kbW1fdGls
ZXIuYyB8IDEgLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2RtbV90aWxlci5jIGIvZHJpdmVycy9n
cHUvZHJtL29tYXBkcm0vb21hcF9kbW1fdGlsZXIuYwo+IGluZGV4IDc3NzI4ZWFhMWE2Zi4uNDJl
YzUxYmI3YjFiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZG1t
X3RpbGVyLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2RtbV90aWxlci5j
Cj4gQEAgLTk4LDcgKzk4LDYgQEAgc3RhdGljIGludCBkbW1fZG1hX2NvcHkoc3RydWN0IGRtbSAq
ZG1tLCBkbWFfYWRkcl90IHNyYywgZG1hX2FkZHJfdCBkc3QpCj4gIAkJcmV0dXJuIC1FSU87Cj4g
IAl9Cj4gIAo+IC0JZG1hX2FzeW5jX2lzc3VlX3BlbmRpbmcoZG1tLT53YV9kbWFfY2hhbik7Cj4g
IAlzdGF0dXMgPSBkbWFfc3luY193YWl0KGRtbS0+d2FfZG1hX2NoYW4sIGNvb2tpZSk7Cj4gIAlp
ZiAoc3RhdHVzICE9IERNQV9DT01QTEVURSkKPiAgCQlkZXZfZXJyKGRtbS0+ZGV2LCAiaTg3OCB3
YSBETUEgY29weSBmYWlsdXJlXG4iKTsKCi0tIApSZWdhcmRzLAoKTGF1cmVudCBQaW5jaGFydApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
