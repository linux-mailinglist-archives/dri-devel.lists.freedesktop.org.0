Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE101141A2
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2019 14:39:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA0476E115;
	Thu,  5 Dec 2019 13:39:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA2876E115
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 13:39:17 +0000 (UTC)
Received: by mail-qv1-xf41.google.com with SMTP id i3so1266188qvv.7
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2019 05:39:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XaigWdmI5xq4FMs2av8bkHyApZcxhq6LpPhTp6nGvME=;
 b=qu7UStyJr4YH00I3oql3o6e6MhAONyFWm0k/dFZ5DNmTCmIN35fdj8O+VpHmFZy99C
 sIReY26nsHPZkfjPeMorEbRkC11BnOpc4kc65geTxwwL+hRbUXAzybM0pdEXamV76D6k
 nEiUWOq2R0iowya897rnAQOL9V45N6Z2fg43c3XBLhBb2twooAn+JAt4uxeKriRlGm8T
 bvFCPypjElvvc5zWb7dTSfBvWGaPdnYJIerqJHHUFsCN1iRamuG/RroDqRFOMhnCWolh
 KJ+xejwE1qA9mi5JndU5dUGJ6LfwH9eJW9337k332Ko1yKLYMWGhqLFr88CMYP9/K4nl
 Ka0g==
X-Gm-Message-State: APjAAAUPM6rXR3YdWfcgyoTSLAZP1+VQv7omdrfd8Rz/VHOVjfTUH5IS
 aP+7klfE2/vVQ3XZqq5E1xAtGrInMp88YBN3zohYvBCBNjE=
X-Google-Smtp-Source: APXvYqxuFQ5+PLjy6NSb4LHSuBJR8bKMcu7Z5ND+z/oh/bYLknG6yt36p5znDqIpMcXkfF2pvyP+tGo0cWrrwjtH9N4=
X-Received: by 2002:a05:6214:245:: with SMTP id
 k5mr7437942qvt.182.1575553156646; 
 Thu, 05 Dec 2019 05:39:16 -0800 (PST)
MIME-Version: 1.0
References: <20191204114732.28514-1-mihail.atanassov@arm.com>
 <20191204114732.28514-28-mihail.atanassov@arm.com>
In-Reply-To: <20191204114732.28514-28-mihail.atanassov@arm.com>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Thu, 5 Dec 2019 14:39:05 +0100
Message-ID: <CA+M3ks74aJH1EComQ24i6NeDftGHg-LPZ9VH7vje4W=a13-yDw@mail.gmail.com>
Subject: Re: [PATCH v2 27/28] drm/sti: Use drm_bridge_init()
To: Mihail Atanassov <Mihail.Atanassov@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XaigWdmI5xq4FMs2av8bkHyApZcxhq6LpPhTp6nGvME=;
 b=qRip7lOe3VRoTQ5FrwB0ZAGTGfT3s2hC9Kwn8x+da+8QHekxs2p6zJb0qerM0C4XoI
 YmTncNTrmx7HvHtgXwNUc3OilnVyEfxeX0Au0SeOoviDgNU5Y4GC87adAO/cfKzDbqha
 Et96WB1sz1po9iR1PfmTnngi1xE9kQx9fPRfJckNu6V5vGfWRCie3uyxbSo6vS0Ok4QB
 jY64W1kePPIAcZTE3niVcJCwUvMqTu7gwU3If3Gigb+W2UTUpFQG4neCCOclNjUBFanB
 PamNmjH/VH6PEg5ni+Xxb+Dgjk2PmQsbOJ5Z3AADJacmAHvRA1sWpv1YYkvCZZkRBm/c
 5OkQ==
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
Cc: David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 nd <nd@arm.com>, Vincent Abriou <vincent.abriou@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TGUgbWVyLiA0IGTDqWMuIDIwMTkgw6AgMTI6NDgsIE1paGFpbCBBdGFuYXNzb3YKPE1paGFpbC5B
dGFuYXNzb3ZAYXJtLmNvbT4gYSDDqWNyaXQgOgo+Cj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UuCj4K
PiB2MjoKPiAgLSBBbHNvIGFwcGx5IGRybV9icmlkZ2VfaW5pdCgpIGluIHN0aV9oZG1pLmMgYW5k
IHN0aV9oZGEuYyAoU2FtLAo+ICAgIEJlbmphbWluKQo+Cj4gU2lnbmVkLW9mZi1ieTogTWloYWls
IEF0YW5hc3NvdiA8bWloYWlsLmF0YW5hc3NvdkBhcm0uY29tPgoKUmV2aWV3ZWQtYnk6IEJlbmph
bWluIEdhaWduYXJkIDxiZW5qYW1pbi5nYWlnbmFyZEBsaW5hcm8ub3JnPgoKPiAtLS0KPiAgZHJp
dmVycy9ncHUvZHJtL3N0aS9zdGlfZHZvLmMgIHwgNCArLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9z
dGkvc3RpX2hkYS5jICB8IDMgKy0tCj4gIGRyaXZlcnMvZ3B1L2RybS9zdGkvc3RpX2hkbWkuYyB8
IDMgKy0tCj4gIDMgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygt
KQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zdGkvc3RpX2R2by5jIGIvZHJpdmVy
cy9ncHUvZHJtL3N0aS9zdGlfZHZvLmMKPiBpbmRleCA2ODI4OWIwYjA2M2EuLjIwYTM5NTZiMzNi
YyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vc3RpL3N0aV9kdm8uYwo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9zdGkvc3RpX2R2by5jCj4gQEAgLTQ2Miw5ICs0NjIsNyBAQCBzdGF0aWMg
aW50IHN0aV9kdm9fYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2UgKm1hc3Rl
ciwgdm9pZCAqZGF0YSkKPiAgICAgICAgIGlmICghYnJpZGdlKQo+ICAgICAgICAgICAgICAgICBy
ZXR1cm4gLUVOT01FTTsKPgo+IC0gICAgICAgYnJpZGdlLT5kcml2ZXJfcHJpdmF0ZSA9IGR2bzsK
PiAtICAgICAgIGJyaWRnZS0+ZnVuY3MgPSAmc3RpX2R2b19icmlkZ2VfZnVuY3M7Cj4gLSAgICAg
ICBicmlkZ2UtPm9mX25vZGUgPSBkdm8tPmRldi5vZl9ub2RlOwo+ICsgICAgICAgZHJtX2JyaWRn
ZV9pbml0KGJyaWRnZSwgJmR2by0+ZGV2LCAmc3RpX2R2b19icmlkZ2VfZnVuY3MsIE5VTEwsIGR2
byk7Cj4gICAgICAgICBkcm1fYnJpZGdlX2FkZChicmlkZ2UpOwo+Cj4gICAgICAgICBlcnIgPSBk
cm1fYnJpZGdlX2F0dGFjaChlbmNvZGVyLCBicmlkZ2UsIE5VTEwpOwo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vc3RpL3N0aV9oZGEuYyBiL2RyaXZlcnMvZ3B1L2RybS9zdGkvc3RpX2hk
YS5jCj4gaW5kZXggOGY3YmYzMzgxNWZkLi5jNzI5NmUzNTRhMzQgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3N0aS9zdGlfaGRhLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vc3RpL3N0
aV9oZGEuYwo+IEBAIC02OTksOCArNjk5LDcgQEAgc3RhdGljIGludCBzdGlfaGRhX2JpbmQoc3Ry
dWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlICptYXN0ZXIsIHZvaWQgKmRhdGEpCj4gICAg
ICAgICBpZiAoIWJyaWRnZSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07Cj4KPiAt
ICAgICAgIGJyaWRnZS0+ZHJpdmVyX3ByaXZhdGUgPSBoZGE7Cj4gLSAgICAgICBicmlkZ2UtPmZ1
bmNzID0gJnN0aV9oZGFfYnJpZGdlX2Z1bmNzOwo+ICsgICAgICAgZHJtX2JyaWRnZV9pbml0KGJy
aWRnZSwgZGV2LCAmc3RpX2hkYV9icmlkZ2VfZnVuY3MsIE5VTEwsIGhkYSk7Cj4gICAgICAgICBk
cm1fYnJpZGdlX2F0dGFjaChlbmNvZGVyLCBicmlkZ2UsIE5VTEwpOwo+Cj4gICAgICAgICBjb25u
ZWN0b3ItPmVuY29kZXIgPSBlbmNvZGVyOwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
c3RpL3N0aV9oZG1pLmMgYi9kcml2ZXJzL2dwdS9kcm0vc3RpL3N0aV9oZG1pLmMKPiBpbmRleCA4
MTQ1NjBlYWQ0ZTEuLmM5YWUzZTE4ZmE1ZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
c3RpL3N0aV9oZG1pLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vc3RpL3N0aV9oZG1pLmMKPiBA
QCAtMTI3OSw4ICsxMjc5LDcgQEAgc3RhdGljIGludCBzdGlfaGRtaV9iaW5kKHN0cnVjdCBkZXZp
Y2UgKmRldiwgc3RydWN0IGRldmljZSAqbWFzdGVyLCB2b2lkICpkYXRhKQo+ICAgICAgICAgaWYg
KCFicmlkZ2UpCj4gICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+Cj4gLSAgICAgICBi
cmlkZ2UtPmRyaXZlcl9wcml2YXRlID0gaGRtaTsKPiAtICAgICAgIGJyaWRnZS0+ZnVuY3MgPSAm
c3RpX2hkbWlfYnJpZGdlX2Z1bmNzOwo+ICsgICAgICAgZHJtX2JyaWRnZV9pbml0KGJyaWRnZSwg
ZGV2LCAmc3RpX2hkbWlfYnJpZGdlX2Z1bmNzLCBOVUxMLCBoZG1pKTsKPiAgICAgICAgIGRybV9i
cmlkZ2VfYXR0YWNoKGVuY29kZXIsIGJyaWRnZSwgTlVMTCk7Cj4KPiAgICAgICAgIGNvbm5lY3Rv
ci0+ZW5jb2RlciA9IGVuY29kZXI7Cj4gLS0KPiAyLjIzLjAKPgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
