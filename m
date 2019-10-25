Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C581E5444
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 21:22:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C92FE6EB5F;
	Fri, 25 Oct 2019 19:22:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6175D6EB5F;
 Fri, 25 Oct 2019 19:22:45 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id n7so3336562wmc.3;
 Fri, 25 Oct 2019 12:22:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ONdJaD+Bko4M9q05H7rLbK8ydzxyE4q+FendoDuboxU=;
 b=aAp+CvW9topTSaphibNLt8XKAmW3flX7U0P4Jq7n8QduN89EHFjKDyF6y0Yvw34r99
 9NIdYLKfGADsJxa9A05QNg9n7xClBdmt1WVTXSmnezWuauwLiYl6e5lOxzvSPgd9Ucbu
 oWPRBLTP/5VZVAJxKA1ZRK1LNZAMYpmVBXlTGFOhftyXXUQAr6AK3g3AmJd0Z9DgBKaX
 7WWSPkQrPCk6i4u7X9FrHme5o9G7eLnhuZnO4c+Ai6bXAvNdQpk+/8hoZmUF/47Pjz21
 Y3+X3LJdNTYfje9RpQHdJ3UGpU6DifvOc6Y0ewg1GWT8KNaBdAT8QtnrBJtDJX40XxIi
 +SXw==
X-Gm-Message-State: APjAAAWZ4m7+EMT0Eyaz7r9vDm62XQO6Lqy3TLZ/W+elwpHqoIPIjUYX
 0CVlYDg9OeUS4Lvf57KKhcyv5Ls6xMQ3wYr7CYs=
X-Google-Smtp-Source: APXvYqwRv2/iWy/fTGJpjOGuyEoghj6/BcbdM2Z5bEz8jJLxdknf1fD8L9wYYYjuszJyRc5rN8V3iF64UUqAQW73Yo4=
X-Received: by 2002:a1c:2008:: with SMTP id g8mr4569469wmg.34.1572031363694;
 Fri, 25 Oct 2019 12:22:43 -0700 (PDT)
MIME-Version: 1.0
References: <1571455431-104881-1-git-send-email-chenwandun@huawei.com>
In-Reply-To: <1571455431-104881-1-git-send-email-chenwandun@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 25 Oct 2019 15:22:31 -0400
Message-ID: <CADnq5_NiuOrH48a9qscT60kzhcSCgmRF8dmBj4Ga9Lkh_L1+4w@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: remove gcc warning
 Wunused-but-set-variable
To: Chen Wandun <chenwandun@huawei.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=ONdJaD+Bko4M9q05H7rLbK8ydzxyE4q+FendoDuboxU=;
 b=uX/O7oxqqh7F4O9wnJBwUlX/CUtM9dn/fvRUDEU5S4QgaxgaeuLIQL1qo0Sn2bfYQn
 +/frRViCfkeBSick98mDdTsVlgnxWhRgt0rg1TKvdBIj9XZHKR+DuC+Udnm9PdmPBZvm
 CSR11UVhOaOCQtTnLyILGcvXJjvARnpcgBQbgVhG3ATjwVwEsgFxW3ps0nDjnryeFXS7
 UHSE2gTXXJTAXzJlLW6Ne4SGkyUzO/NgbhUt26vyBstyphO9uBeH394CTVGU4F4Nkl77
 OPuLp6ScT0+KhydYku6a7MApIQ+c9yGF6XQ7zNWo6RYYGoVfDbKbBiHhZfAasZPaMsl+
 M/vA==
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
Cc: Thomas Lim <Thomas.Lim@amd.com>, "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>,
 David Francis <David.Francis@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Cheng,
 Tony" <Tony.Cheng@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 abdoulaye.berthe@amd.com, "Deucher, Alexander" <alexander.deucher@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBPY3QgMTksIDIwMTkgYXQgODowNyBQTSBDaGVuIFdhbmR1biA8Y2hlbndhbmR1bkBo
dWF3ZWkuY29tPiB3cm90ZToKPgo+IEZyb206IENoZW53YW5kdW4gPGNoZW53YW5kdW5AaHVhd2Vp
LmNvbT4KPgo+IGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2F1eC5jOiBJ
biBmdW5jdGlvbiBkY2VfYXV4X2NvbmZpZ3VyZV90aW1lb3V0Ogo+IGRyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9kY2UvZGNlX2F1eC5jOiB3YXJuaW5nOiB2YXJpYWJsZSB0aW1lb3V0IHNl
dCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCj4KPiBTaWduZWQtb2Zm
LWJ5OiBDaGVud2FuZHVuIDxjaGVud2FuZHVuQGh1YXdlaS5jb20+CgpBcHBsaWVkLiAgVGhhbmtz
IQoKQWxleAoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2Vf
YXV4LmMgfCA1IC0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGRlbGV0aW9ucygtKQo+Cj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2F1eC5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfYXV4LmMKPiBpbmRleCA5NzZi
ZDQ5Li43MzlmOGUyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kY2UvZGNlX2F1eC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Rj
ZS9kY2VfYXV4LmMKPiBAQCAtNDMyLDcgKzQzMiw2IEBAIHN0YXRpYyBib29sIGRjZV9hdXhfY29u
ZmlndXJlX3RpbWVvdXQoc3RydWN0IGRkY19zZXJ2aWNlICpkZGMsCj4gIHsKPiAgICAgICAgIHVp
bnQzMl90IG11bHRpcGxpZXIgPSAwOwo+ICAgICAgICAgdWludDMyX3QgbGVuZ3RoID0gMDsKPiAt
ICAgICAgIHVpbnQzMl90IHRpbWVvdXQgPSAwOwo+ICAgICAgICAgc3RydWN0IGRkYyAqZGRjX3Bp
biA9IGRkYy0+ZGRjX3BpbjsKPiAgICAgICAgIHN0cnVjdCBkY2VfYXV4ICphdXhfZW5naW5lID0g
ZGRjLT5jdHgtPmRjLT5yZXNfcG9vbC0+ZW5naW5lc1tkZGNfcGluLT5waW5fZGF0YS0+ZW5dOwo+
ICAgICAgICAgc3RydWN0IGF1eF9lbmdpbmVfZGNlMTEwICphdXgxMTAgPSBGUk9NX0FVWF9FTkdJ
TkUoYXV4X2VuZ2luZSk7Cj4gQEAgLTQ0NiwyNSArNDQ1LDIxIEBAIHN0YXRpYyBib29sIGRjZV9h
dXhfY29uZmlndXJlX3RpbWVvdXQoc3RydWN0IGRkY19zZXJ2aWNlICpkZGMsCj4gICAgICAgICAg
ICAgICAgIGxlbmd0aCA9IHRpbWVvdXRfaW5fdXMvVElNRV9PVVRfTVVMVElQTElFUl84Owo+ICAg
ICAgICAgICAgICAgICBpZiAodGltZW91dF9pbl91cyAlIFRJTUVfT1VUX01VTFRJUExJRVJfOCAh
PSAwKQo+ICAgICAgICAgICAgICAgICAgICAgICAgIGxlbmd0aCsrOwo+IC0gICAgICAgICAgICAg
ICB0aW1lb3V0ID0gbGVuZ3RoICogVElNRV9PVVRfTVVMVElQTElFUl84Owo+ICAgICAgICAgfSBl
bHNlIGlmICh0aW1lb3V0X2luX3VzIDw9IDIgKiBUSU1FX09VVF9JTkNSRU1FTlQpIHsKPiAgICAg
ICAgICAgICAgICAgbXVsdGlwbGllciA9IDE7Cj4gICAgICAgICAgICAgICAgIGxlbmd0aCA9IHRp
bWVvdXRfaW5fdXMvVElNRV9PVVRfTVVMVElQTElFUl8xNjsKPiAgICAgICAgICAgICAgICAgaWYg
KHRpbWVvdXRfaW5fdXMgJSBUSU1FX09VVF9NVUxUSVBMSUVSXzE2ICE9IDApCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgbGVuZ3RoKys7Cj4gLSAgICAgICAgICAgICAgIHRpbWVvdXQgPSBsZW5n
dGggKiBUSU1FX09VVF9NVUxUSVBMSUVSXzE2Owo+ICAgICAgICAgfSBlbHNlIGlmICh0aW1lb3V0
X2luX3VzIDw9IDQgKiBUSU1FX09VVF9JTkNSRU1FTlQpIHsKPiAgICAgICAgICAgICAgICAgbXVs
dGlwbGllciA9IDI7Cj4gICAgICAgICAgICAgICAgIGxlbmd0aCA9IHRpbWVvdXRfaW5fdXMvVElN
RV9PVVRfTVVMVElQTElFUl8zMjsKPiAgICAgICAgICAgICAgICAgaWYgKHRpbWVvdXRfaW5fdXMg
JSBUSU1FX09VVF9NVUxUSVBMSUVSXzMyICE9IDApCj4gICAgICAgICAgICAgICAgICAgICAgICAg
bGVuZ3RoKys7Cj4gLSAgICAgICAgICAgICAgIHRpbWVvdXQgPSBsZW5ndGggKiBUSU1FX09VVF9N
VUxUSVBMSUVSXzMyOwo+ICAgICAgICAgfSBlbHNlIGlmICh0aW1lb3V0X2luX3VzID4gNCAqIFRJ
TUVfT1VUX0lOQ1JFTUVOVCkgewo+ICAgICAgICAgICAgICAgICBtdWx0aXBsaWVyID0gMzsKPiAg
ICAgICAgICAgICAgICAgbGVuZ3RoID0gdGltZW91dF9pbl91cy9USU1FX09VVF9NVUxUSVBMSUVS
XzY0Owo+ICAgICAgICAgICAgICAgICBpZiAodGltZW91dF9pbl91cyAlIFRJTUVfT1VUX01VTFRJ
UExJRVJfNjQgIT0gMCkKPiAgICAgICAgICAgICAgICAgICAgICAgICBsZW5ndGgrKzsKPiAtICAg
ICAgICAgICAgICAgdGltZW91dCA9IGxlbmd0aCAqIFRJTUVfT1VUX01VTFRJUExJRVJfNjQ7Cj4g
ICAgICAgICB9Cj4KPiAgICAgICAgIGxlbmd0aCA9IChsZW5ndGggPCBNQVhfVElNRU9VVF9MRU5H
VEgpID8gbGVuZ3RoIDogTUFYX1RJTUVPVVRfTEVOR1RIOwo+IC0tCj4gMi43LjQKPgo+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1h
aWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
