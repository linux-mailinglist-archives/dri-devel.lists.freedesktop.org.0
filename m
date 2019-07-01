Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB65B5B742
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2019 10:53:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE96C89E2A;
	Mon,  1 Jul 2019 08:53:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F05789E2A
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2019 08:53:10 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id m29so13823583qtu.1
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jul 2019 01:53:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yEydmtnCDiKOYKSAVEGulQp1MLxqt3sZi6sZBX94kKY=;
 b=e04BnvdX5yW2kndu1m7AcsnBYIgkqzyaom9Ip2Djp/2BA/8pmg+7UELxY5Vw4pZ57q
 CwDnKHrK9FCW33q9odNjJowP4GT1hTUdc0KsohibwsXX2DbJSow5292X5iAtyOg35c3Y
 Dq/1qqPF8XK63o1RoINGsODNQ+AXwDwc+vg2LENY1nBPgAmhPxpjvElnzfzn82GGdtY4
 3zqWJzjN0IkOtDsmyffzaXeqpt+xg2hjR8M3wkB2dleagQjqtg+AaO0bAcOPScoXMIQo
 00bg4W+iFPO9Cuu+cHqtmXihNWU3n9tuhygdybCXPV4pirSBfl/Je0C91TkicIqYgPqq
 D5ug==
X-Gm-Message-State: APjAAAV9tHbvaKajnKTKcdLlorVELq2HBhUR3qDvVGFJwnKHmeCqxRwl
 6fXNQofV96daur4OZT8HD91GxxSkBPzw41GW4s9Qlw==
X-Google-Smtp-Source: APXvYqy/mrvToBYfrETzRYxgV9TqtLA6Mw+WkpF6Pa31jr/E+2o2Ywn0MkpkLw7P7SBwy/yCgsgpwdQg+ZMoi4bZLWs=
X-Received: by 2002:ac8:3301:: with SMTP id t1mr19458961qta.209.1561971189535; 
 Mon, 01 Jul 2019 01:53:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190630061922.7254-1-sam@ravnborg.org>
 <20190630061922.7254-4-sam@ravnborg.org>
In-Reply-To: <20190630061922.7254-4-sam@ravnborg.org>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Mon, 1 Jul 2019 10:52:58 +0200
Message-ID: <CA+M3ks72=1-DBf7sX7oF1u5e0TyS1R_ha4o9oXOu=Y90PyC3og@mail.gmail.com>
Subject: Re: [PATCH v1 03/33] drm/stm: drop use of drmP.h
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yEydmtnCDiKOYKSAVEGulQp1MLxqt3sZi6sZBX94kKY=;
 b=vBNi+IyoW5BtngLeAC6WLbJv2qNSYVGYTBf5aeYr/G9/9f79GCL8+d3YkNK/Vxyn3z
 nKeMteN+qRYhm+8nyzPaKRhG/zc0oTk3ov1KesWQVQRieNvGlEc/csx2JCkaJoiW7FsT
 ISMiIRcZ2NcnspJEqgG8Nm7fO8RSJFPS2ZvP36W/uSjlla4A0wdEJyIAsmTPw+C3rO+w
 toqyODSt9SpwtkVgaOt8Jnf8xnmI4AxL270fPzLdVxSxj9+ZQmud5RGt1kbGEjPaCKaO
 OncydU0P3fRObJlaBo+iMnC8AZ5jel5TfroKOFc9XBmIx0/fJe/YmDyPDqf1ctoduS9q
 fu7Q==
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
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Airlie <airlied@linux.ie>, Philippe Cornu <philippe.cornu@st.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Yannick Fertre <yannick.fertre@st.com>, Vincent Abriou <vincent.abriou@st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Alexandre Torgue <alexandre.torgue@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TGUgZGltLiAzMCBqdWluIDIwMTkgw6AgMDg6MTksIFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3Jn
Lm9yZz4gYSDDqWNyaXQgOgo+Cj4gRHJvcCB1c2Ugb2YgdGhlIGRlcHJlY2F0ZWQgaGVhZGVyIGZp
bGUgZHJtUC5oCj4gZnJvbSB0aGUgc29sZSB1c2VyIGluIHRoZSBzdG0gZHJpdmVyLgo+IFJlcGxh
Y2Ugd2l0aCBuZWNlc3NhcnkgaW5jbHVkZSBmaWxlcy4KCkFwcGxpZWQgb24gZHJtLW1pc2MtbmV4
dC4KClRoYW5rcywKQmVuamFtaW4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBTYW0gUmF2bmJvcmcgPHNh
bUByYXZuYm9yZy5vcmc+Cj4gQ2M6IFlhbm5pY2sgRmVydHJlIDx5YW5uaWNrLmZlcnRyZUBzdC5j
b20+Cj4gQ2M6IFBoaWxpcHBlIENvcm51IDxwaGlsaXBwZS5jb3JudUBzdC5jb20+Cj4gQ2M6IEJl
bmphbWluIEdhaWduYXJkIDxiZW5qYW1pbi5nYWlnbmFyZEBsaW5hcm8ub3JnPgo+IENjOiBWaW5j
ZW50IEFicmlvdSA8dmluY2VudC5hYnJpb3VAc3QuY29tPgo+IENjOiBEYXZpZCBBaXJsaWUgPGFp
cmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBD
YzogTWF4aW1lIENvcXVlbGluIDxtY29xdWVsaW4uc3RtMzJAZ21haWwuY29tPgo+IENjOiBBbGV4
YW5kcmUgVG9yZ3VlIDxhbGV4YW5kcmUudG9yZ3VlQHN0LmNvbT4KPiBDYzogbGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQo+IENjOiBsaW51eC1hcm0ta2VybmVsQGxpc3Rz
LmluZnJhZGVhZC5vcmcKPiBDYzogbGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQo+IENjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKPiAtLS0KPiBU
aGUgbGlzdCBvZiBjYzogd2FzIHRvbyBsYXJnZSB0byBhZGQgYWxsIHJlY2lwaWVudHMgdG8gdGhl
IGNvdmVyIGxldHRlci4KPiBQbGVhc2UgZmluZCBjb3ZlciBsZXR0ZXIgaGVyZToKPiBodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9hcmNoaXZlcy9kcmktZGV2ZWwvMjAxOS1KdW5lL3RocmVh
ZC5odG1sCj4gU2VhcmNoIGZvciAiZHJtOiBkcm9wIHVzZSBvZiBkcm1wLmggaW4gZHJtLW1pc2Mi
Cj4KPiAgICAgICAgIFNhbQo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9zdG0vZHdfbWlwaV9kc2ktc3Rt
LmMgfCAxMCArKysrKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3N0bS9kd19taXBp
X2RzaS1zdG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9zdG0vZHdfbWlwaV9kc2ktc3RtLmMKPiBpbmRl
eCAwYWIzMmZlZTZjMWIuLmEwM2E2NDJjMTQ3YyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vc3RtL2R3X21pcGlfZHNpLXN0bS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3N0bS9kd19t
aXBpX2RzaS1zdG0uYwo+IEBAIC04LDEzICs4LDE3IEBACj4KPiAgI2luY2x1ZGUgPGxpbnV4L2Ns
ay5oPgo+ICAjaW5jbHVkZSA8bGludXgvaW9wb2xsLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9tb2Rf
ZGV2aWNldGFibGUuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgo+ICsjaW5jbHVkZSA8
bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9yZWd1bGF0b3IvY29u
c3VtZXIuaD4KPiAtI2luY2x1ZGUgPGRybS9kcm1QLmg+Cj4gLSNpbmNsdWRlIDxkcm0vZHJtX21p
cGlfZHNpLmg+Cj4gLSNpbmNsdWRlIDxkcm0vYnJpZGdlL2R3X21pcGlfZHNpLmg+Cj4gKwo+ICAj
aW5jbHVkZSA8dmlkZW8vbWlwaV9kaXNwbGF5Lmg+Cj4KPiArI2luY2x1ZGUgPGRybS9icmlkZ2Uv
ZHdfbWlwaV9kc2kuaD4KPiArI2luY2x1ZGUgPGRybS9kcm1fbWlwaV9kc2kuaD4KPiArI2luY2x1
ZGUgPGRybS9kcm1fcHJpbnQuaD4KPiArCj4gICNkZWZpbmUgSFdWRVJfMTMwICAgICAgICAgICAg
ICAgICAgICAgIDB4MzEzMzMwMDAgICAgICAvKiBJUCB2ZXJzaW9uIDEuMzAgKi8KPiAgI2RlZmlu
ZSBIV1ZFUl8xMzEgICAgICAgICAgICAgICAgICAgICAgMHgzMTMzMzEwMCAgICAgIC8qIElQIHZl
cnNpb24gMS4zMSAqLwo+Cj4gLS0KPiAyLjIwLjEKPgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
