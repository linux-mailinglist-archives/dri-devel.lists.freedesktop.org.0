Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1A62D775B
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 15:04:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CFF36E44F;
	Fri, 11 Dec 2020 14:04:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 654186E44F
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 14:04:51 +0000 (UTC)
X-Gm-Message-State: AOAM5313XYJka7UfoGV8lGd6Lw2h7CxHJrmVXNHF6GLyGcn0cfTTcl/W
 vgQ46/+ZDEKaCgpeVOYOphrqxlJ42HiBSTek2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607695491;
 bh=es6fVWW1Xi0bIgwukRYW6eN8WCU8aY4WzaCmTH11tlM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Cmj8IDjnQExrgq6HqlljhAClfXwNIVIPq+rP2vQkvDiIsh3n0Ao/f79F3NUs3qjJv
 LQt7oPodOq18l0z7InPUWFBEe2dY3oAoF877KDkncLXExOC7ZzgfnPkhJNziHWDcbf
 d+g7AcJeaGVrjogmfWvOT6VQ99OYX52wvmFtlNi7Ui/9MNzlv8FE21f6i8CmH84OIt
 CG9GpTIpsYnxiUtp1ZIekfq0K8PfmgJKrO9lAyxr56DwYu4EjUiIXre3d5VZXxK+Q5
 h8fRXzk7i5W5D4C4EuFuIRhQIvz/dW5EyUfj9udChv9EJkPh4QmJAlPggMxamx7ARN
 9QGeOAPTwp+EQ==
X-Google-Smtp-Source: ABdhPJw5D3l7fxlDhHH3ICdRLnDzMkC5Nxb+eP5iE8M2onyZxtW9cChVThBS7p1VgDwSG8vMR0IP/s6Yg7dy61rQB1Y=
X-Received: by 2002:a05:6402:845:: with SMTP id
 b5mr12134678edz.38.1607695489475; 
 Fri, 11 Dec 2020 06:04:49 -0800 (PST)
MIME-Version: 1.0
References: <20201203082445.1342763-1-hsinyi@chromium.org>
In-Reply-To: <20201203082445.1342763-1-hsinyi@chromium.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 11 Dec 2020 22:04:38 +0800
X-Gmail-Original-Message-ID: <CAAOTY__+FHHd6Coa9HDvS_e7Q7dD3gZm7FBbhymOR2w2-i8i4w@mail.gmail.com>
Message-ID: <CAAOTY__+FHHd6Coa9HDvS_e7Q7dD3gZm7FBbhymOR2w2-i8i4w@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: mtk_dpi: Create connector for bridges
To: Hsin-Yi Wang <hsinyi@chromium.org>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEhzaW4tWWk6CgpIc2luLVlpIFdhbmcgPGhzaW55aUBjaHJvbWl1bS5vcmc+IOaWvCAyMDIw
5bm0MTLmnIgz5pelIOmAseWbmyDkuIvljYg0OjI05a+r6YGT77yaCj4KPiBTaW1pbGFyIHRvIGE5
ZDlmZWE3NGJlMiAoImRybS9tZWRpYXRlazogbXRrX2RzaTogQ3JlYXRlIGNvbm5lY3RvciBmb3Ig
YnJpZGdlcyIpOgo+Cj4gVXNlIHRoZSBkcm1fYnJpZGdlX2Nvbm5lY3RvciBoZWxwZXIgdG8gY3Jl
YXRlIGEgY29ubmVjdG9yIGZvciBwaXBlbGluZXMKPiB0aGF0IHVzZSBkcm1fYnJpZGdlLiBUaGlz
IGFsbG93cyBzcGxpdHRpbmcgY29ubmVjdG9yIG9wZXJhdGlvbnMgYWNyb3NzCj4gbXVsdGlwbGUg
YnJpZGdlcyB3aGVuIG5lY2Vzc2FyeSwgaW5zdGVhZCBvZiBoYXZpbmcgdGhlIGxhc3QgYnJpZGdl
IGluCj4gdGhlIGNoYWluIGNyZWF0aW5nIHRoZSBjb25uZWN0b3IgYW5kIGhhbmRsaW5nIGFsbCBj
b25uZWN0b3Igb3BlcmF0aW9ucwo+IGludGVybmFsbHkuCgpSZXZpZXdlZC1ieTogQ2h1bi1LdWFu
ZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cgo+Cj4gU2lnbmVkLW9mZi1ieTogSHNpbi1Z
aSBXYW5nIDxoc2lueWlAY2hyb21pdW0ub3JnPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2RwaS5jIHwgMTMgKysrKysrKysrKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTIg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHBpLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rw
aS5jCj4gaW5kZXggNTJmMTFhNjNhMzMwLi4xODkzNzdlMzQyZmEgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHBpLmMKPiBAQCAtMjAsNiArMjAsNyBAQAo+Cj4gICNpbmNsdWRlIDxkcm0v
ZHJtX2F0b21pY19oZWxwZXIuaD4KPiAgI2luY2x1ZGUgPGRybS9kcm1fYnJpZGdlLmg+Cj4gKyNp
bmNsdWRlIDxkcm0vZHJtX2JyaWRnZV9jb25uZWN0b3IuaD4KPiAgI2luY2x1ZGUgPGRybS9kcm1f
Y3J0Yy5oPgo+ICAjaW5jbHVkZSA8ZHJtL2RybV9vZi5oPgo+ICAjaW5jbHVkZSA8ZHJtL2RybV9z
aW1wbGVfa21zX2hlbHBlci5oPgo+IEBAIC02Niw2ICs2Nyw3IEBAIHN0cnVjdCBtdGtfZHBpIHsK
PiAgICAgICAgIHN0cnVjdCBkcm1fZW5jb2RlciBlbmNvZGVyOwo+ICAgICAgICAgc3RydWN0IGRy
bV9icmlkZ2UgYnJpZGdlOwo+ICAgICAgICAgc3RydWN0IGRybV9icmlkZ2UgKm5leHRfYnJpZGdl
Owo+ICsgICAgICAgc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcjsKPiAgICAgICAgIHZv
aWQgX19pb21lbSAqcmVnczsKPiAgICAgICAgIHN0cnVjdCBkZXZpY2UgKmRldjsKPiAgICAgICAg
IHN0cnVjdCBjbGsgKmVuZ2luZV9jbGs7Cj4gQEAgLTYwMywxMiArNjA1LDIxIEBAIHN0YXRpYyBp
bnQgbXRrX2RwaV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZSAqbWFzdGVy
LCB2b2lkICpkYXRhKQo+Cj4gICAgICAgICBkcGktPmVuY29kZXIucG9zc2libGVfY3J0Y3MgPSBt
dGtfZHJtX2ZpbmRfcG9zc2libGVfY3J0Y19ieV9jb21wKGRybV9kZXYsIGRwaS0+ZGRwX2NvbXAp
Owo+Cj4gLSAgICAgICByZXQgPSBkcm1fYnJpZGdlX2F0dGFjaCgmZHBpLT5lbmNvZGVyLCAmZHBp
LT5icmlkZ2UsIE5VTEwsIDApOwo+ICsgICAgICAgcmV0ID0gZHJtX2JyaWRnZV9hdHRhY2goJmRw
aS0+ZW5jb2RlciwgJmRwaS0+YnJpZGdlLCBOVUxMLAo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgRFJNX0JSSURHRV9BVFRBQ0hfTk9fQ09OTkVDVE9SKTsKPiAgICAgICAgIGlmIChy
ZXQpIHsKPiAgICAgICAgICAgICAgICAgZGV2X2VycihkZXYsICJGYWlsZWQgdG8gYXR0YWNoIGJy
aWRnZTogJWRcbiIsIHJldCk7Cj4gICAgICAgICAgICAgICAgIGdvdG8gZXJyX2NsZWFudXA7Cj4g
ICAgICAgICB9Cj4KPiArICAgICAgIGRwaS0+Y29ubmVjdG9yID0gZHJtX2JyaWRnZV9jb25uZWN0
b3JfaW5pdChkcm1fZGV2LCAmZHBpLT5lbmNvZGVyKTsKPiArICAgICAgIGlmIChJU19FUlIoZHBp
LT5jb25uZWN0b3IpKSB7Cj4gKyAgICAgICAgICAgICAgIGRldl9lcnIoZGV2LCAiVW5hYmxlIHRv
IGNyZWF0ZSBicmlkZ2UgY29ubmVjdG9yXG4iKTsKPiArICAgICAgICAgICAgICAgcmV0ID0gUFRS
X0VSUihkcGktPmNvbm5lY3Rvcik7Cj4gKyAgICAgICAgICAgICAgIGdvdG8gZXJyX2NsZWFudXA7
Cj4gKyAgICAgICB9Cj4gKyAgICAgICBkcm1fY29ubmVjdG9yX2F0dGFjaF9lbmNvZGVyKGRwaS0+
Y29ubmVjdG9yLCAmZHBpLT5lbmNvZGVyKTsKPiArCj4gICAgICAgICBkcGktPmJpdF9udW0gPSBN
VEtfRFBJX09VVF9CSVRfTlVNXzhCSVRTOwo+ICAgICAgICAgZHBpLT5jaGFubmVsX3N3YXAgPSBN
VEtfRFBJX09VVF9DSEFOTkVMX1NXQVBfUkdCOwo+ICAgICAgICAgZHBpLT55Y19tYXAgPSBNVEtf
RFBJX09VVF9ZQ19NQVBfUkdCOwo+IC0tCj4gMi4yOS4yLjU3Ni5nYTNmYzQ0NmQ4NC1nb29nCj4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
