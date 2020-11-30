Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D61B22C9175
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 23:49:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDC87898C2;
	Mon, 30 Nov 2020 22:49:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B325D898C2;
 Mon, 30 Nov 2020 22:49:25 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id y24so13003904otk.3;
 Mon, 30 Nov 2020 14:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bzJwkZIz7kl6fhYUImeAIlsAKf62NSFlF6oC5OffnRw=;
 b=HatqDxz4UFz+rfmzrNA2CN47GpWWN0jcH2jAKj6hlFoKnrNJ5JchjzYzOYlQ4F98Iu
 /y1vrjuPsDdMbUfOgSOhjjkf15NolmEeeeE8kwcIw0UxgNQ5lrSPnbnHw+Z1JR7K3rjU
 4W8RHh8ogH2UfYaDYkE0oaM1alUZq6N3iL2/UTpaEJdX2Objl7WrY9b5RcaUbATGhC53
 msgmLtetVPgjVRYgX9SRvlxuJnGwwlPBFGZh/qXGBpyM01kRbLg9ORdztYCk8W5Sl4Li
 5a733ICe5hl8rYrtsm7L++R1NWC+Dg5kPneiDHL/U5aQMlPxey3dXnYI2GEjBzSdFP+F
 N/wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bzJwkZIz7kl6fhYUImeAIlsAKf62NSFlF6oC5OffnRw=;
 b=qE4qNlkJYA7GYzR0NecP6LC0e6tBPwPeu1fE63pStln9r+cxlqn8rT6JJU1gAvVTqs
 Qnr0EkQmy5MTJaygL38NjhG47b6XlsLxs/uslibEt6ehyuZlazfRXqzV05PtCROoDYht
 O7nfVPBkZHZz1xWjmigrBLwNWz5yJoz22vlduEPch3zfGgcqeEJPYv11aJ2ywHZEOgkL
 UdhyJoy6nSOyXYonHx4y6HTLzC6XvJ70g/RylwYVBP1bQ/WJQExwRlZzdmzjKLV3UfbT
 UKf2hE70Qd7eJ4IiY2yyU0wZqFaK4zLRAd9W/7niZrT4/u5cPEgneFWz6GB76RIXljhi
 ljqw==
X-Gm-Message-State: AOAM532EsfK86a9rGWm5RtPMF/M4U3eNmEtzLQzJSN0qROHOlOzEpcvC
 2eU847mU7TMUBd5Esd76F+Vsl0tTsCHU+aqjK04=
X-Google-Smtp-Source: ABdhPJxa/myszQklUKIl9V0fscEIrdxL5Ryo54OSBNEgXsCa/Tqn04ZVbGs3Dp98BBxFZq6wEAvDl4w+G4/PwZ8UMy4=
X-Received: by 2002:a05:6830:22e4:: with SMTP id
 t4mr19081521otc.23.1606776565150; 
 Mon, 30 Nov 2020 14:49:25 -0800 (PST)
MIME-Version: 1.0
References: <20201124193824.1118741-1-lee.jones@linaro.org>
 <20201124193824.1118741-34-lee.jones@linaro.org>
In-Reply-To: <20201124193824.1118741-34-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 30 Nov 2020 17:49:14 -0500
Message-ID: <CADnq5_PW+aNfEskumWeChATQwvXOOdXVXQRixMvBh3WJhaBekQ@mail.gmail.com>
Subject: Re: [PATCH 33/40] drm/amd/amdgpu/vcn_v3_0: Remove unused variable
 'direct_poll' from 'vcn_v3_0_start_sriov()'
To: Lee Jones <lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMjQsIDIwMjAgYXQgMjo0NSBQTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92M18wLmM6IElu
IGZ1bmN0aW9uIOKAmHZjbl92M18wX3N0YXJ0X3NyaW924oCZOgo+ICBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS92Y25fdjNfMC5jOjEyNDI6Mzogd2FybmluZzogdmFyaWFibGUg4oCYZGlyZWN0
X3BvbGzigJkgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KPgo+
IENjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gQ2M6ICJDaHJp
c3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IENjOiBEYXZpZCBBaXJs
aWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5j
aD4KPiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwo+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVz
QGxpbmFyby5vcmc+CgpBcHBsaWVkLiAgVGhhbmtzIQoKQWxleAoKPiAtLS0KPiAgZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvdmNuX3YzXzAuYyB8IDQgLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwg
NCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS92Y25fdjNfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YzXzAuYwo+IGlu
ZGV4IGM1ZTBhNTMxY2FiYWYuLmUwNWFmNjk2NTE3MjMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvdmNuX3YzXzAuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L3Zjbl92M18wLmMKPiBAQCAtMTIzOCw4ICsxMjM4LDYgQEAgc3RhdGljIGludCB2Y25f
djNfMF9zdGFydF9zcmlvdihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKPiAgICAgICAgICAg
ICAgICAgZGlyZWN0X3d0ID0geyB7MH0gfTsKPiAgICAgICAgIHN0cnVjdCBtbXNjaF92M18wX2Nt
ZF9kaXJlY3RfcmVhZF9tb2RpZnlfd3JpdGUKPiAgICAgICAgICAgICAgICAgZGlyZWN0X3JkX21v
ZF93dCA9IHsgezB9IH07Cj4gLSAgICAgICBzdHJ1Y3QgbW1zY2hfdjNfMF9jbWRfZGlyZWN0X3Bv
bGxpbmcKPiAtICAgICAgICAgICAgICAgZGlyZWN0X3BvbGwgPSB7IHswfSB9Owo+ICAgICAgICAg
c3RydWN0IG1tc2NoX3YzXzBfY21kX2VuZCBlbmQgPSB7IHswfSB9Owo+ICAgICAgICAgc3RydWN0
IG1tc2NoX3YzXzBfaW5pdF9oZWFkZXIgaGVhZGVyOwo+Cj4gQEAgLTEyNDcsOCArMTI0NSw2IEBA
IHN0YXRpYyBpbnQgdmNuX3YzXzBfc3RhcnRfc3Jpb3Yoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYpCj4gICAgICAgICAgICAgICAgIE1NU0NIX0NPTU1BTkRfX0RJUkVDVF9SRUdfV1JJVEU7Cj4g
ICAgICAgICBkaXJlY3RfcmRfbW9kX3d0LmNtZF9oZWFkZXIuY29tbWFuZF90eXBlID0KPiAgICAg
ICAgICAgICAgICAgTU1TQ0hfQ09NTUFORF9fRElSRUNUX1JFR19SRUFEX01PRElGWV9XUklURTsK
PiAtICAgICAgIGRpcmVjdF9wb2xsLmNtZF9oZWFkZXIuY29tbWFuZF90eXBlID0KPiAtICAgICAg
ICAgICAgICAgTU1TQ0hfQ09NTUFORF9fRElSRUNUX1JFR19QT0xMSU5HOwo+ICAgICAgICAgZW5k
LmNtZF9oZWFkZXIuY29tbWFuZF90eXBlID0KPiAgICAgICAgICAgICAgICAgTU1TQ0hfQ09NTUFO
RF9fRU5EOwo+Cj4gLS0KPiAyLjI1LjEKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
