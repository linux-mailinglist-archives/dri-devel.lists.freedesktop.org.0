Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A01942E6C87
	for <lists+dri-devel@lfdr.de>; Tue, 29 Dec 2020 00:32:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAC58892DB;
	Mon, 28 Dec 2020 23:32:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE639892DB
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Dec 2020 23:32:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3A3E422472
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Dec 2020 23:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609198333;
 bh=4zuOP87T+tBs/U4EXSadvydWrwt6Bdq/pnBuDyNsp3I=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=MHDXi03f6vV1G6r6J8eFCqOIkk4cqccxHFFVwin1a+8+kZzWn+BEsSAcrFk3u2n/d
 IV61cDtg8SfC13nFvgcrDj5TQvSvEgBeiooxTnLLWzv6J0IRxUrMOd3djHju93YkuF
 yGwuP3iSRjDdcgwB9OpA9MwRPi6zp4gssF+xUXElj13YzfV2fxqYYKaG5Ut3Pqw+PM
 iIw0zohsbxUniZC76Go+v0RypNxVa5uyZobQ9pvQuKNpqbzA3Tlw1or6YfrL1EdW2D
 H1OgXrkfbC3NLj4nOfZ8qSDCfBDqlzhwkzgI/tq6luEysWVdltiITD4FafGRmMLgud
 uMi1kAUMFexQw==
Received: by mail-ej1-f52.google.com with SMTP id jx16so16086582ejb.10
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Dec 2020 15:32:13 -0800 (PST)
X-Gm-Message-State: AOAM533hzje08JUcHi8sN3z2xkinY/p7onAiMzokK/HTUmnhyg+SHLgK
 BTRRFF0MzV560C+Du4HanQRHucPCnw5XfA9QAA==
X-Google-Smtp-Source: ABdhPJyi7sWe+M1pwp7M/taBxI8fPAUdgCkIwfXdysJx91vWg0TwrvQd0TZnEL+XEJtjyTVXSlFp6eaIJBvkueKMUQw=
X-Received: by 2002:a17:906:fb1a:: with SMTP id
 lz26mr43221179ejb.194.1609198331821; 
 Mon, 28 Dec 2020 15:32:11 -0800 (PST)
MIME-Version: 1.0
References: <20201210161050.8460-1-chunkuang.hu@kernel.org>
In-Reply-To: <20201210161050.8460-1-chunkuang.hu@kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 29 Dec 2020 07:32:00 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8vxmAR-RBVhPZdpMRZzUZZ8KBAV2R1rR0FvxhMv22UvQ@mail.gmail.com>
Message-ID: <CAAOTY_8vxmAR-RBVhPZdpMRZzUZZ8KBAV2R1rR0FvxhMv22UvQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] Decouple Mediatek DRM sub driver
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
Cc: David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+IOaWvCAyMDIw5bm0MTLmnIgx
MeaXpSDpgLHkupQg5LiK5Y2IMTI6MTDlr6vpgZPvvJoKPgo+IG10ayBjY29yciBpcyBjb250cm9s
bGVkIGJ5IERSTSBhbmQgTURQIFsxXS4gSW4gb3JkZXIgdG8gc2hhcmUKPiBtdGtfY2NvcnIgZHJp
dmVyIGZvciBEUk0gYW5kIE1EUCwgZGVjb3VwbGUgTWVkaWF0ZWsgRFJNIHN1YiBkcml2ZXIKPiB3
aGljaCBpbmNsdWRlIG10a19jY29yciwgc28gTURQIGNvdWxkIHVzZSB0aGlzIGRlY291cGxlZCBt
dGtfY2NvcnIuCgpGb3IgdGhpcyBzZXJpZXMsIGFwcGxpZWQgdG8gbWVkaWF0ZWstZHJtLW5leHQg
WzFdLgoKWzFdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L2NodW5rdWFuZy5odS9saW51eC5naXQvbG9nLz9oPW1lZGlhdGVrLWRybS1uZXh0CgpSZWdhcmRz
LApDaHVuLUt1YW5nLgoKPgo+IENoYW5nZXMgaW4gdjI6Cj4gMS4gRml4IGlvbW11IGxhcmIgcHJv
YmxlbS4KPiAyLiBCYXNlZCBvbiBtZWRpYXRlay1kcm0tbmV4dC01LjExLTIgWzJdLgo+Cj4gWzFd
IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTExNDA3NTEvCj4gWzJdIGh0dHBz
Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2NodW5rdWFuZy5odS9s
aW51eC5naXQvbG9nLz9oPW1lZGlhdGVrLWRybS1uZXh0LTUuMTEtMgo+Cj4gQ0sgSHUgKDEwKToK
PiAgIGRybS9tZWRpYXRlazogU2VwYXJhdGUgZ2V0dGluZyBsYXJiIGRldmljZSB0byBhIGZ1bmN0
aW9uCj4gICBkcm0vbWVkaWF0ZWs6IE1vdmUgY2xrIGluZm8gZnJvbSBzdHJ1Y3QgbXRrX2RkcF9j
b21wIHRvIHN1YiBkcml2ZXIKPiAgICAgcHJpdmF0ZSBkYXRhCj4gICBkcm0vbWVkaWF0ZWs6IE1v
dmUgcmVncyBpbmZvIGZyb20gc3RydWN0IG10a19kZHBfY29tcCB0byBzdWIgZHJpdmVyCj4gICAg
IHByaXZhdGUgZGF0YQo+ICAgZHJtL21lZGlhdGVrOiBSZW1vdmUgaXJxIGluIHN0cnVjdCBtdGtf
ZGRwX2NvbXAKPiAgIGRybS9tZWRpYXRlazogVXNlIHN0cnVjdCBjbWRxX2NsaWVudF9yZWcgdG8g
Z2F0aGVyIGNtZHEgdmFyaWFibGUKPiAgIGRybS9tZWRpYXRlazogTW92ZSBjbWRxX3JlZyBpbmZv
IGZyb20gc3RydWN0IG10a19kZHBfY29tcCB0byBzdWIKPiAgICAgZHJpdmVyIHByaXZhdGUgZGF0
YQo+ICAgZHJtL21lZGlhdGVrOiBDaGFuZ2Ugc3ViIGRyaXZlciBpbnRlcmZhY2UgZnJvbSBtdGtf
ZGRwX2NvbXAgdG8gZGV2aWNlCj4gICBkcm0vbWVkaWF0ZWs6IFJlZ2lzdGVyIHZibGFuayBjYWxs
YmFjayBmdW5jdGlvbgo+ICAgZHJtL21lZGlhdGVrOiBEUk0gZHJpdmVyIGRpcmVjdGx5IHJlZmVy
IHRvIHN1YiBkcml2ZXIncyBmdW5jdGlvbgo+ICAgZHJtL21lZGlhdGVrOiBNb3ZlIG10a19kZHBf
Y29tcF9pbml0KCkgZnJvbSBzdWIgZHJpdmVyIHRvIERSTSBkcml2ZXIKPgo+IENodW4tS3Vhbmcg
SHUgKDIpOgo+ICAgZHJtL21lZGlhdGVrOiBHZXQgQ01EUSBjbGllbnQgcmVnaXN0ZXIgZm9yIGFs
bCBkZHAgY29tcG9uZW50Cj4gICBkcm0vbWVkaWF0ZWs6IFVzZSBjb3JyZWN0IGRldmljZSBwb2lu
dGVyIHRvIGdldCBDTURRIGNsaWVudCByZWdpc3Rlcgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZGlzcF9jb2xvci5jICAgfCAgODkgKystLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2Rpc3BfZHJ2LmggICAgIHwgIDY5ICsrKysKPiAgZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kaXNwX292bC5jICAgICB8IDIxNyArKysrKy0tLS0tCj4gIGRyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZGlzcF9yZG1hLmMgICAgfCAxNjkgKysrKy0tLS0KPiAgZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYyAgICAgICAgICB8ICA0NCArLQo+ICBkcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMgICAgIHwgIDc1ICsrLS0KPiAgZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5oICAgICB8ICAgMSAtCj4gIGRyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMgfCA0MjkgKysrKysrKysrKysrLS0t
LS0tLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuaCB8IDEw
MCArKystLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYyAgICAgIHwg
IDMwICstCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5oICAgICAgfCAg
IDIgKy0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyAgICAgICAgICB8ICA0
NyArLS0KPiAgMTIgZmlsZXMgY2hhbmdlZCwgNjc2IGluc2VydGlvbnMoKyksIDU5NiBkZWxldGlv
bnMoLSkKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZGlzcF9kcnYuaAo+Cj4gLS0KPiAyLjE3LjEKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
