Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 670022F66A4
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 18:06:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 266056E0FB;
	Thu, 14 Jan 2021 17:06:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3AEE6E03E;
 Thu, 14 Jan 2021 17:06:08 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id a109so5851923otc.1;
 Thu, 14 Jan 2021 09:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ssuwm5geZ6avPsQABGpir+jMcKxJQOkzJqc/fGTa4j0=;
 b=vGjwCEmiDqj01desICX/fCkLT7uffyYwfgLvgAZKFbZiIVtqeS+vfY4HOoClGo/fDs
 WCdeGo5kz15jut2PHHzt6riva9ddYbgprKSy98pCIf5V3cR1vdzM1jmcTCBzRuwRpFRn
 Z4ONbFKb/suIUvG8BiXj+RpKWtFH/mfNSsa9pUoxCqm0obH21c9HyRqHxHdQ69EwNc6n
 VC4vF2nKcX5OyoxaNhfTY0+rnBfIvj+fY6GbbxLOfuRh6QRLgwTI80gD/qjBHb0rLpFC
 NTULDoSO2GJbFNSg3rAwVeDYe0tnwg5xk56rN/Xz5CoB8ibkJNsDRFbmbIfZaMlZBVZk
 N9xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ssuwm5geZ6avPsQABGpir+jMcKxJQOkzJqc/fGTa4j0=;
 b=PXhJWm2DUDq031MEpSVmHAcrfNdSBSEnWckwTXOPzBlhS1OUmd9OmIFKxEUzy8ctlY
 MUG0sA48yz+OaZtbWiKMvcPBl5bDTN+RgV34QnH1Dk0RvPHkHV8p7E4Q8EULmT8tgisG
 y3CM+85TsJJLOo+vDuMs9wj4jFoJcvNW4F4D/qdfnq01pKGA5wk30tn17OQF/+h01qBW
 DCwJ8D1kam0oM/fa1XsyjPWFWHDkpxFXZFVx5qx7QS33+Mm1v6A2oeynFV7jhOS01FTb
 80twfwBU97j/9x9qzqJXiVgSqLoB4m0DbviTJvUHZVXTrIgKjj4nK823/JrawVP2vE+s
 GG8g==
X-Gm-Message-State: AOAM533apKsvTcQHQZTPBCFsl6AMIFAzqlV63LBOiKZsiGBhg5/GnzOJ
 sNilU1Fok0RJb9WiPVFBe2jbpnh9OGFpGQOn++8=
X-Google-Smtp-Source: ABdhPJyb9XIR5l58CoU8oUzP0D7Jskp6KZ4We+iu6vQHk7LdiQd7dLVurjs2uHDUrD24xuURiOdG73ldLAMxUlxPnno=
X-Received: by 2002:a05:6830:1b7b:: with SMTP id
 d27mr5438999ote.132.1610643968152; 
 Thu, 14 Jan 2021 09:06:08 -0800 (PST)
MIME-Version: 1.0
References: <20210113080752.1003793-1-lee.jones@linaro.org>
 <20210113080752.1003793-5-lee.jones@linaro.org>
In-Reply-To: <20210113080752.1003793-5-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 14 Jan 2021 12:05:56 -0500
Message-ID: <CADnq5_PzcLKd9rMZKaF83FKSEp0Y2tcHXHSJYV=qU+PsjXXbrA@mail.gmail.com>
Subject: Re: [PATCH 04/30] drm/amd/display/modules/power/power_helpers:
 Staticify local functions
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
Cc: Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKYW4gMTMsIDIwMjEgYXQgMzowOCBBTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvbW9k
dWxlcy9wb3dlci9wb3dlcl9oZWxwZXJzLmM6MjgxOjY6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHBy
b3RvdHlwZSBmb3Ig4oCYZmlsbF9pcmFtX3ZfMuKAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCj4g
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvbW9kdWxlcy9wb3dlci9wb3dl
cl9oZWxwZXJzLmM6NDU1OjY6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCY
ZmlsbF9pcmFtX3ZfMl8y4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KPiAgZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9tb2R1bGVzL3Bvd2VyL3Bvd2VyX2hlbHBlcnMuYzo2
MDE6Njogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhmaWxsX2lyYW1fdl8y
XzPigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQo+Cj4gQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJy
eS53ZW50bGFuZEBhbWQuY29tPgo+IENjOiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KPiBD
YzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+IENjOiAiQ2hyaXN0
aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBDYzogRGF2aWQgQWlybGll
IDxhaXJsaWVkQGxpbnV4LmllPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+
Cj4gQ2M6IFJvZHJpZ28gU2lxdWVpcmEgPFJvZHJpZ28uU2lxdWVpcmFAYW1kLmNvbT4KPiBDYzog
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwo+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5v
cmc+CgpBcHBsaWVkLiAgVGhhbmtzIQoKQWxleAoKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9tb2R1bGVzL3Bvd2VyL3Bvd2VyX2hlbHBlcnMuYyB8IDYgKysrLS0tCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L21vZHVsZXMvcG93ZXIvcG93ZXJfaGVs
cGVycy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L21vZHVsZXMvcG93ZXIvcG93ZXJf
aGVscGVycy5jCj4gaW5kZXggNGZkOGJjZTk1ZDg0My4uM2Q0YzY2OTMzZjUxOCAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9wb3dlci9wb3dlcl9oZWxw
ZXJzLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9wb3dlci9w
b3dlcl9oZWxwZXJzLmMKPiBAQCAtMjc4LDcgKzI3OCw3IEBAIHN0YXRpYyB2b2lkIGZpbGxfYmFj
a2xpZ2h0X3RyYW5zZm9ybV90YWJsZV92XzJfMihzdHJ1Y3QgZG1jdV9pcmFtX3BhcmFtZXRlcnMg
cGFyCj4gICAgICAgICB9Cj4gIH0KPgo+IC12b2lkIGZpbGxfaXJhbV92XzIoc3RydWN0IGlyYW1f
dGFibGVfdl8yICpyYW1fdGFibGUsIHN0cnVjdCBkbWN1X2lyYW1fcGFyYW1ldGVycyBwYXJhbXMp
Cj4gK3N0YXRpYyB2b2lkIGZpbGxfaXJhbV92XzIoc3RydWN0IGlyYW1fdGFibGVfdl8yICpyYW1f
dGFibGUsIHN0cnVjdCBkbWN1X2lyYW1fcGFyYW1ldGVycyBwYXJhbXMpCj4gIHsKPiAgICAgICAg
IHVuc2lnbmVkIGludCBzZXQgPSBwYXJhbXMuc2V0Owo+Cj4gQEAgLTQ1Miw3ICs0NTIsNyBAQCB2
b2lkIGZpbGxfaXJhbV92XzIoc3RydWN0IGlyYW1fdGFibGVfdl8yICpyYW1fdGFibGUsIHN0cnVj
dCBkbWN1X2lyYW1fcGFyYW1ldGVycwo+ICAgICAgICAgICAgICAgICAgICAgICAgIHBhcmFtcywg
cmFtX3RhYmxlKTsKPiAgfQo+Cj4gLXZvaWQgZmlsbF9pcmFtX3ZfMl8yKHN0cnVjdCBpcmFtX3Rh
YmxlX3ZfMl8yICpyYW1fdGFibGUsIHN0cnVjdCBkbWN1X2lyYW1fcGFyYW1ldGVycyBwYXJhbXMp
Cj4gK3N0YXRpYyB2b2lkIGZpbGxfaXJhbV92XzJfMihzdHJ1Y3QgaXJhbV90YWJsZV92XzJfMiAq
cmFtX3RhYmxlLCBzdHJ1Y3QgZG1jdV9pcmFtX3BhcmFtZXRlcnMgcGFyYW1zKQo+ICB7Cj4gICAg
ICAgICB1bnNpZ25lZCBpbnQgc2V0ID0gcGFyYW1zLnNldDsKPgo+IEBAIC01OTgsNyArNTk4LDcg
QEAgdm9pZCBmaWxsX2lyYW1fdl8yXzIoc3RydWN0IGlyYW1fdGFibGVfdl8yXzIgKnJhbV90YWJs
ZSwgc3RydWN0IGRtY3VfaXJhbV9wYXJhbWUKPiAgICAgICAgICAgICAgICAgICAgICAgICBwYXJh
bXMsIHJhbV90YWJsZSwgdHJ1ZSk7Cj4gIH0KPgo+IC12b2lkIGZpbGxfaXJhbV92XzJfMyhzdHJ1
Y3QgaXJhbV90YWJsZV92XzJfMiAqcmFtX3RhYmxlLCBzdHJ1Y3QgZG1jdV9pcmFtX3BhcmFtZXRl
cnMgcGFyYW1zLCBib29sIGJpZ19lbmRpYW4pCj4gK3N0YXRpYyB2b2lkIGZpbGxfaXJhbV92XzJf
MyhzdHJ1Y3QgaXJhbV90YWJsZV92XzJfMiAqcmFtX3RhYmxlLCBzdHJ1Y3QgZG1jdV9pcmFtX3Bh
cmFtZXRlcnMgcGFyYW1zLCBib29sIGJpZ19lbmRpYW4pCj4gIHsKPiAgICAgICAgIHVuc2lnbmVk
IGludCBpLCBqOwo+ICAgICAgICAgdW5zaWduZWQgaW50IHNldCA9IHBhcmFtcy5zZXQ7Cj4gLS0K
PiAyLjI1LjEKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
