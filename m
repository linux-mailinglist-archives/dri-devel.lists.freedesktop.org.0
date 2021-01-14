Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE7C2F6EEB
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 00:27:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F1046E05D;
	Thu, 14 Jan 2021 23:27:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2AF46E05D
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 23:27:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 668CE23AAA
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 23:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610666840;
 bh=4Zj3Wl9MmezHCv26E0/LT5ibGDbwFsMqnirwMOVtjqE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=aBLoFuP9S4Nc3XrlPFcxpWS2vWovEqXQd9fxBf6JZfHE2hegibJmRABAh+PPF7RLr
 73MX39xJBmv973lJK2GoCa78CI7e7G04MIaff7ut6UhF0nf7DXAlQp6HjQtzcLRfPf
 qcKkvU09liZCmxbEsjeFf/3FIG+og4y4FNILMH6O3Azz0G2n6fx34/CS4Ifp+IRf8P
 GlSwRBKhSCKwj6xECjsMMrWT7dC3mTU2EJcd+cX61/zSv/Bf6Jedjx7HfcjCJeaHMw
 qHg4v4Gty8N54mrBohg1Eb9qnSlVTgZ9PnbsE1nflAsGuiMaKbYb5ZnqU4rge2ElDP
 RpGeHwhRWfojA==
Received: by mail-ej1-f53.google.com with SMTP id w1so10690403ejf.11
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 15:27:20 -0800 (PST)
X-Gm-Message-State: AOAM530WdU7LFmWoucpjcLbNcX/G+K8yyNWa8OOxk8CSFTeQyxmMeUuq
 MzcfAGyRzBtFteARqiVoAhRNqHzQPuH5UFvpUQ==
X-Google-Smtp-Source: ABdhPJwT7znQYQKLZ+6Sn6y2n9e+stArAY5GAuMtoUClRK/SPi6pP38lZV6DIyg4QRGopg8Iq3NUruuIGHT/VFxhO+Y=
X-Received: by 2002:a17:906:fb1a:: with SMTP id
 lz26mr6911340ejb.194.1610666838951; 
 Thu, 14 Jan 2021 15:27:18 -0800 (PST)
MIME-Version: 1.0
References: <1609989081-29353-1-git-send-email-yongqiang.niu@mediatek.com>
 <1609989081-29353-6-git-send-email-yongqiang.niu@mediatek.com>
 <CAAOTY__Ox7jxLxQvm_mvAqEedj48=grH0Mao7xZ5bLuABZNeMQ@mail.gmail.com>
In-Reply-To: <CAAOTY__Ox7jxLxQvm_mvAqEedj48=grH0Mao7xZ5bLuABZNeMQ@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 15 Jan 2021 07:27:07 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8psXwmWqKidGKZN05jcNqhq4igNmbbXX2xePYDgwHDDg@mail.gmail.com>
Message-ID: <CAAOTY_8psXwmWqKidGKZN05jcNqhq4igNmbbXX2xePYDgwHDDg@mail.gmail.com>
Subject: Re: [PATCH v9,
 05/11] drm/mediatek: add fifo_size into rdma private data
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIFlvbmdxaWFuZzoKCkNodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPiDm
lrwgMjAyMeW5tDHmnIg35pelIOmAseWbmyDkuIvljYg2OjA15a+r6YGT77yaCj4KPiBIaSwgWW9u
Z3FpYW5nOgo+Cj4gWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+IOaW
vCAyMDIx5bm0MeaciDfml6Ug6YCx5ZubIOS4iuWNiDExOjEy5a+r6YGT77yaCj4gPgo+ID4gR2V0
IHRoZSBmaWZvIHNpemUgZnJvbSBkZXZpY2UgdHJlZQo+ID4gYmVjYXVzZSBlYWNoIHJkbWEgaW4g
dGhlIHNhbWUgU29DIG1heSBoYXZlIGRpZmZlcmVudCBmaWZvIHNpemUKPgo+IFJldmlld2VkLWJ5
OiBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KCkFwcGxpZWQgdG8gbWVk
aWF0ZWstZHJtLW5leHQgWzFdLCB0aGFua3MuCgpbMV0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9w
dWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvY2h1bmt1YW5nLmh1L2xpbnV4LmdpdC9sb2cvP2g9bWVk
aWF0ZWstZHJtLW5leHQKClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+Cj4gPgo+ID4gU2lnbmVkLW9m
Zi1ieTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+Cj4gPiAtLS0K
PiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfcmRtYS5jIHwgMTkgKysrKysr
KysrKysrKysrKysrLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZGlzcF9yZG1hLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfcmRtYS5j
Cj4gPiBpbmRleCBkNDZiOGFlLi44YzY0ZDVjIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kaXNwX3JkbWEuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kaXNwX3JkbWEuYwo+ID4gQEAgLTY0LDYgKzY0LDcgQEAgc3RydWN0IG10a19k
aXNwX3JkbWEgewo+ID4gICAgICAgICBzdHJ1Y3QgbXRrX2RkcF9jb21wICAgICAgICAgICAgIGRk
cF9jb21wOwo+ID4gICAgICAgICBzdHJ1Y3QgZHJtX2NydGMgICAgICAgICAgICAgICAgICpjcnRj
Owo+ID4gICAgICAgICBjb25zdCBzdHJ1Y3QgbXRrX2Rpc3BfcmRtYV9kYXRhICpkYXRhOwo+ID4g
KyAgICAgICB1MzIgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZpZm9fc2l6ZTsKPiA+ICB9
Owo+ID4KPiA+ICBzdGF0aWMgaW5saW5lIHN0cnVjdCBtdGtfZGlzcF9yZG1hICpjb21wX3RvX3Jk
bWEoc3RydWN0IG10a19kZHBfY29tcCAqY29tcCkKPiA+IEBAIC0xMzIsMTIgKzEzMywxOCBAQCBz
dGF0aWMgdm9pZCBtdGtfcmRtYV9jb25maWcoc3RydWN0IG10a19kZHBfY29tcCAqY29tcCwgdW5z
aWduZWQgaW50IHdpZHRoLAo+ID4gICAgICAgICB1bnNpZ25lZCBpbnQgdGhyZXNob2xkOwo+ID4g
ICAgICAgICB1bnNpZ25lZCBpbnQgcmVnOwo+ID4gICAgICAgICBzdHJ1Y3QgbXRrX2Rpc3BfcmRt
YSAqcmRtYSA9IGNvbXBfdG9fcmRtYShjb21wKTsKPiA+ICsgICAgICAgdTMyIHJkbWFfZmlmb19z
aXplOwo+ID4KPiA+ICAgICAgICAgbXRrX2RkcF93cml0ZV9tYXNrKGNtZHFfcGt0LCB3aWR0aCwg
Y29tcCwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgIERJU1BfUkVHX1JETUFfU0laRV9D
T05fMCwgMHhmZmYpOwo+ID4gICAgICAgICBtdGtfZGRwX3dyaXRlX21hc2soY21kcV9wa3QsIGhl
aWdodCwgY29tcCwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgIERJU1BfUkVHX1JETUFf
U0laRV9DT05fMSwgMHhmZmZmZik7Cj4gPgo+ID4gKyAgICAgICBpZiAocmRtYS0+Zmlmb19zaXpl
KQo+ID4gKyAgICAgICAgICAgICAgIHJkbWFfZmlmb19zaXplID0gcmRtYS0+Zmlmb19zaXplOwo+
ID4gKyAgICAgICBlbHNlCj4gPiArICAgICAgICAgICAgICAgcmRtYV9maWZvX3NpemUgPSBSRE1B
X0ZJRk9fU0laRShyZG1hKTsKPiA+ICsKPiA+ICAgICAgICAgLyoKPiA+ICAgICAgICAgICogRW5h
YmxlIEZJRk8gdW5kZXJmbG93IHNpbmNlIERTSSBhbmQgRFBJIGNhbid0IGJlIGJsb2NrZWQuCj4g
PiAgICAgICAgICAqIEtlZXAgdGhlIEZJRk8gcHNldWRvIHNpemUgcmVzZXQgZGVmYXVsdCBvZiA4
IEtpQi4gU2V0IHRoZQo+ID4gQEAgLTE0Niw3ICsxNTMsNyBAQCBzdGF0aWMgdm9pZCBtdGtfcmRt
YV9jb25maWcoc3RydWN0IG10a19kZHBfY29tcCAqY29tcCwgdW5zaWduZWQgaW50IHdpZHRoLAo+
ID4gICAgICAgICAgKi8KPiA+ICAgICAgICAgdGhyZXNob2xkID0gd2lkdGggKiBoZWlnaHQgKiB2
cmVmcmVzaCAqIDQgKiA3IC8gMTAwMDAwMDsKPiA+ICAgICAgICAgcmVnID0gUkRNQV9GSUZPX1VO
REVSRkxPV19FTiB8Cj4gPiAtICAgICAgICAgICAgIFJETUFfRklGT19QU0VVRE9fU0laRShSRE1B
X0ZJRk9fU0laRShyZG1hKSkgfAo+ID4gKyAgICAgICAgICAgICBSRE1BX0ZJRk9fUFNFVURPX1NJ
WkUocmRtYV9maWZvX3NpemUpIHwKPiA+ICAgICAgICAgICAgICAgUkRNQV9PVVRQVVRfVkFMSURf
RklGT19USFJFU0hPTEQodGhyZXNob2xkKTsKPiA+ICAgICAgICAgbXRrX2RkcF93cml0ZShjbWRx
X3BrdCwgcmVnLCBjb21wLCBESVNQX1JFR19SRE1BX0ZJRk9fQ09OKTsKPiA+ICB9Cj4gPiBAQCAt
MjkyLDYgKzI5OSwxNiBAQCBzdGF0aWMgaW50IG10a19kaXNwX3JkbWFfcHJvYmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldikKPiA+ICAgICAgICAgICAgICAgICByZXR1cm4gY29tcF9pZDsK
PiA+ICAgICAgICAgfQo+ID4KPiA+ICsgICAgICAgaWYgKG9mX2ZpbmRfcHJvcGVydHkoZGV2LT5v
Zl9ub2RlLCAibWVkaWF0ZWsscmRtYS1maWZvLXNpemUiLCAmcmV0KSkgewo+ID4gKyAgICAgICAg
ICAgICAgIHJldCA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyKGRldi0+b2Zfbm9kZSwKPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAibWVkaWF0ZWsscmRtYS1maWZv
LXNpemUiLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZw
cml2LT5maWZvX3NpemUpOwo+ID4gKyAgICAgICAgICAgICAgIGlmIChyZXQpIHsKPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgIGRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIGdldCByZG1hIGZpZm8g
c2l6ZVxuIik7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+ID4gKyAg
ICAgICAgICAgICAgIH0KPiA+ICsgICAgICAgfQo+ID4gKwo+ID4gICAgICAgICByZXQgPSBtdGtf
ZGRwX2NvbXBfaW5pdChkZXYsIGRldi0+b2Zfbm9kZSwgJnByaXYtPmRkcF9jb21wLCBjb21wX2lk
LAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmbXRrX2Rpc3BfcmRtYV9mdW5j
cyk7Cj4gPiAgICAgICAgIGlmIChyZXQpIHsKPiA+IC0tCj4gPiAxLjguMS4xLmRpcnR5Cj4gPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gTGludXgt
bWVkaWF0ZWsgbWFpbGluZyBsaXN0Cj4gPiBMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQu
b3JnCj4gPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW1lZGlhdGVrCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
