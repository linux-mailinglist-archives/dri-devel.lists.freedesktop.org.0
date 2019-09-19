Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F18B8187
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 21:39:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEF5C6FA09;
	Thu, 19 Sep 2019 19:39:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 569666FA09
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 19:39:31 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id b2so4135522otq.10
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 12:39:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DHxXDiF5hdtKPKTkQX4WRmS3Cd5G+7TLqzryUl/7IeY=;
 b=T3K11WlYqd0vHZkYNf3m8/ywt3r5PpQaWMgbeJDQUkfe9lU4JEre8aWhMKm+vx8ub+
 IteOfL4DAv/qAtJKyR8av4w1kkhr30H/dQHup1WU+IFHhZrlX/urRLoxyet60UjL9rkU
 F/tSN6jXCtZ0wFBTcOYhSKjQJmce2Ovm/ahd0zH/rqRWFHk64MFz5xjjo7lFzF9Gox2U
 TdpoVu6Yr4nAa/WyQO5EvYYqqMIAsgOMI72yzBZKCBmnJXN7gOkL+ScBZzCubJoHEl79
 ijp9TAkk5Zl48SpzF0EPiQFo7e1HYwkc7c78ka0/QLkWUXIokBJBHPZJICdMEpso1GAD
 CGIQ==
X-Gm-Message-State: APjAAAXyyVfqg+Qw1v2Sv86BNlG9fkKx8WX69suepesvoLpnkG+JxtjD
 0KzwCLl9zHbfzP6UcdPW7OCTpRqWivq+k6DE64Gfcg==
X-Google-Smtp-Source: APXvYqxYH7Tq3qGDLGbY0Qdqa93vehbCVm59duOytZPHd+ELxzqkMitRNbQp1hYdw4wtsmtCjNDxMbIyHt6fQvNGseI=
X-Received: by 2002:a9d:404:: with SMTP id 4mr8471408otc.204.1568921970639;
 Thu, 19 Sep 2019 12:39:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190919173020.11655-1-mripard@kernel.org>
 <20190919173020.11655-2-mripard@kernel.org>
In-Reply-To: <20190919173020.11655-2-mripard@kernel.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 19 Sep 2019 21:39:19 +0200
Message-ID: <CAKMK7uERdXAKj69isbFi6=tak2U2v1EAmCHO_pCtd_5OQ72d_w@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=5BPATCH_2=2F2=5D_MAINTAINERS=3A_Add_Jernej_=C5=A0krabec_as_?=
 =?UTF-8?Q?a_reviewer_for_DE2?=
To: Maxime Ripard <mripard@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DHxXDiF5hdtKPKTkQX4WRmS3Cd5G+7TLqzryUl/7IeY=;
 b=boezk/+H2FZgBtkdidhJx/xTicuMizVLjMSmXZeQ5h7mC2LocV6o6W8TbvJuhIajzu
 MyEl5Qu81CJ3FBDseqjsrCO+wKG/SAlIOoZfmPjYC75Ww5xvIyWI3QxOLdqb8ee8aEUp
 7zR/lo/gnP/+fOsezvftJsv8UUDiQ1OvFBjF8=
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>, Chen-Yu Tsai <wens@csie.org>,
 Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMTksIDIwMTkgYXQgNzozMCBQTSBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gVGhlIG5ld2VyIEFsbHdpbm5lciBTb0NzIGhhdmUgYSBkaWZm
ZXJlbnQgbGF5ZXJzIGNvbnRyb2xsZXIgdGhhbiB0aGUgb2xkZXIKPiBvbmVzLiBKZXJuZWogd3Jv
dGUgdGhhdCBzdXBwb3J0IGFuZCBoYXMgYmVlbiByZXZpZXdpbmcgcGF0Y2hlcyBmb3IgYSB3aGls
ZQo+IG5vdywgc28gbGV0J3MgbWFrZSBoaW0gYSBmb3JtYWwgcmV2aWV3ZXIuCj4KPiBTaWduZWQt
b2ZmLWJ5OiBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+CgpIYXogY29tbWl0IHJp
Z2h0cyBhbHJlYWR5LCBvciBkbyB3ZSBuZWVkIHRvIGZpeCB0aGF0PwotRGFuaWVsCgo+IC0tLQo+
ICBNQUlOVEFJTkVSUyB8IDkgKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlv
bnMoKykKPgo+IGRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCj4gaW5kZXgg
NTRlMjIyZTFkMGQ2Li5mYWUzMjhmMDZjMTcgMTAwNjQ0Cj4gLS0tIGEvTUFJTlRBSU5FUlMKPiAr
KysgYi9NQUlOVEFJTkVSUwo+IEBAIC01MzYxLDYgKzUzNjEsMTUgQEAgRjogICAgICAgZHJpdmVy
cy9ncHUvZHJtL3N1bjRpLwo+ICBGOiAgICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvc3VueGkvc3VuNGktZHJtLnR4dAo+ICBUOiAgICAgZ2l0IGdpdDovL2Fub25n
aXQuZnJlZWRlc2t0b3Aub3JnL2RybS9kcm0tbWlzYwo+Cj4gK0RSTSBEUklWRVIgRk9SIEFMTFdJ
Tk5FUiBERTIgRU5HSU5FCj4gK006ICAgICBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5v
cmc+Cj4gK006ICAgICBDaGVuLVl1IFRzYWkgPHdlbnNAY3NpZS5vcmc+Cj4gK1I6ICAgICBKZXJu
ZWogxaBrcmFiZWMgPGplcm5lai5za3JhYmVjQHNpb2wubmV0Pgo+ICtMOiAgICAgZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ICtTOiAgICAgU3VwcG9ydGVkCj4gK0Y6ICAgICBkcml2
ZXJzL2dwdS9kcm0vc3VuNGkvc3VuOGkqCj4gK1Q6ICAgICBnaXQgZ2l0Oi8vYW5vbmdpdC5mcmVl
ZGVza3RvcC5vcmcvZHJtL2RybS1taXNjCj4gKwo+ICBEUk0gRFJJVkVSUyBGT1IgQU1MT0dJQyBT
T0NTCj4gIE06ICAgICBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+Cj4g
IEw6ICAgICBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gLS0KPiAyLjIxLjAKPgo+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRl
dmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAoKCgot
LSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KKzQx
ICgwKSA3OSAzNjUgNTcgNDggLSBodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
