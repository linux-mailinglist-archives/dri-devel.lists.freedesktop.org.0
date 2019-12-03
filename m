Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F601102D1
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 17:47:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 513688972C;
	Tue,  3 Dec 2019 16:47:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E92698972C
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 16:47:37 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id g1so4424292qtj.6
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2019 08:47:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kpLW4+KBKC6+++fy2CkOyNZVdF+06Q7ITsR6tw96vos=;
 b=DmjqWZVdawQUAMaDk2/JZSR+msH6KhKzz6KrB8YUWPPaOIzpB3I49hPaSJtREz6eZv
 RwxDv2d3ER7sYTK1ApNUoXYJ5ce/oesu/Lv/8Ej1WpLBPMbFxK6JucNjG2gt1cbku9Li
 7TBVKRpkiKfKYaPbzrkKHsOZVi6FVEt1QcLGCiaj6ElTx+43YNxf5x7n3IG2VSAdjett
 vIhmKkWuBKXZnWRYcR4MQrMl3q1f58fglo/ULYUOtMDP/Tkq6YYER8pCK6eaYHJNHeaz
 ZjmFqUCh1o+PyjDW2zCTz+nGQv7RBR5d6tKggUvQVS7CoTxeSvqhn9hk3eLROTvTH9w7
 F1Vg==
X-Gm-Message-State: APjAAAXOV1ObLsQj+uOFDOV4j8SbXgvGmI2V3gy/cmJA2gn6pGoSKDDr
 5QJ4qADrb8JJAsR2bJdnLRRWPQ2rJalm8eKHYgRtNw==
X-Google-Smtp-Source: APXvYqxYAfVYzcBQqzY8M6/6NJdEMGC/11QBvfJGgQcOPTqmt53UtXeQCKjQYt5E9An2PS+idDwqh4H1BlqSqvSseYo=
X-Received: by 2002:ac8:6651:: with SMTP id j17mr6016484qtp.115.1575391657081; 
 Tue, 03 Dec 2019 08:47:37 -0800 (PST)
MIME-Version: 1.0
References: <20191119125805.4266-1-benjamin.gaignard@st.com>
 <f6f32b4d8d8e271953f887c50793f9d64d48e7b3.camel@intel.com>
 <6ad4ff49-240b-a665-d229-20e177fa6b2f@st.com>
In-Reply-To: <6ad4ff49-240b-a665-d229-20e177fa6b2f@st.com>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Tue, 3 Dec 2019 17:47:26 +0100
Message-ID: <CA+M3ks4b222JuwrmujLrTwXZJC-aE0mo9B+fNg-9NgH7X8=y3w@mail.gmail.com>
Subject: Re: [PATCH] drm/crtc-helper: drm_connector_get_single_encoder
 prototype is missing
To: Benjamin GAIGNARD <benjamin.gaignard@st.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kpLW4+KBKC6+++fy2CkOyNZVdF+06Q7ITsR6tw96vos=;
 b=CdzFujSTmuuhIBF3/5QBVwnMq1Ebiw0TNuO1H0GryrK2l/e5ltTktcxhdb6RkWuKH3
 9BXU1wGN+OdXCmwRMLRWLqYZV0mkKmq5ot4Ji4TkUeeIsPb2Pr8/i5F3s2Dub0AALgUu
 d5BIJ++q3ZZJXCgxHONBHfAhaK0+oxD49cJAUctFMAV6ThnxyVsDLRfIjdtRPNBtuOIE
 XgfUCejJD4NjewxHKzIfGugOaisG2af1+iDIZVB8d+V9E6+TY1fWNRIdm1KJ6yggCeAA
 B/Dm2uvZzGE8Du3MkNZrmv72+RkU7xs6P1mrrXhaKqQtQZxj13iW62ezC/fFHMwafepD
 LyqQ==
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Souza,
 Jose" <jose.souza@intel.com>, "sean@poorly.run" <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TGUgbWVyLiAyMCBub3YuIDIwMTkgw6AgMDA6MjgsIEJlbmphbWluIEdBSUdOQVJECjxiZW5qYW1p
bi5nYWlnbmFyZEBzdC5jb20+IGEgw6ljcml0IDoKPgo+Cj4gT24gMTEvMTkvMTkgNzo1MyBQTSwg
U291emEsIEpvc2Ugd3JvdGU6Cj4gPiBPbiBUdWUsIDIwMTktMTEtMTkgYXQgMTM6NTggKzAxMDAs
IEJlbmphbWluIEdhaWduYXJkIHdyb3RlOgo+ID4+IEluY2x1ZGUgZHJtX2NydGNfaGVscGVyX2lu
dGVybmFsLmggdG8gcHJvdmlkZQo+ID4+IGRybV9jb25uZWN0b3JfZ2V0X3NpbmdsZV9lbmNvZGVy
Cj4gPj4gcHJvdG90eXBlLgo+ID4+Cj4gPj4gRml4ZXM6IGE5MjQ2MmQ2YmY0OTMgKCJkcm0vY29u
bmVjdG9yOiBTaGFyZSB3aXRoIG5vbi1hdG9taWMgZHJpdmVycwo+ID4+IHRoZSBmdW5jdGlvbiB0
byBnZXQgdGhlIHNpbmdsZSBlbmNvZGVyIikKPiA+IGRybV9jb25uZWN0b3JfZ2V0X3NpbmdsZV9l
bmNvZGVyKCkgaXMgaW1wbGVtZW50ZWQgYmVmb3JlIHRoZSB1c2UgaW4KPiA+IHRoaXMgZmlsZSBz
byBpdCBpcyBub3QgYnJva2VuLCBubyBuZWVkIG9mIGEgZml4ZXMgdGFnLgo+ID4KPiA+IFJldmll
d2VkLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4KPgo+
IEkgd2lsbCByZW1vdmUgZml4ZSB0YWcgYmVmb3JlIHB1c2ggaXQuCj4KPiBUaGFua3MsCj4KPiBC
ZW5qYW1pbgoKQXBwbGllZCBvbiBkcm0tbWlzYy1uZXh0IHdpdGggb3V0IEZpeGVzIHRhZy4KVGhh
bmtzIGZvciB0aGUgcmV2aWV3LgoKQmVuamFtaW4KCj4KPiA+Cj4gPj4gQ2M6IEpvc8OpIFJvYmVy
dG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwuY29tPgo+ID4+Cj4gPj4gU2lnbmVkLW9mZi1i
eTogQmVuamFtaW4gR2FpZ25hcmQgPGJlbmphbWluLmdhaWduYXJkQHN0LmNvbT4KPiA+PiAtLS0K
PiA+PiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fY3J0Y19oZWxwZXIuYyB8IDIgKysKPiA+PiAgIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiA+Pgo+ID4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vZHJtX2NydGNfaGVscGVyLmMKPiA+PiBiL2RyaXZlcnMvZ3B1L2RybS9kcm1f
Y3J0Y19oZWxwZXIuYwo+ID4+IGluZGV4IDQ5OWIwNWFhY2NmYy4uOTNhNGVlYzQyOWU4IDEwMDY0
NAo+ID4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY3J0Y19oZWxwZXIuYwo+ID4+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9kcm1fY3J0Y19oZWxwZXIuYwo+ID4+IEBAIC00OCw2ICs0OCw4IEBA
Cj4gPj4gICAjaW5jbHVkZSA8ZHJtL2RybV9wcmludC5oPgo+ID4+ICAgI2luY2x1ZGUgPGRybS9k
cm1fdmJsYW5rLmg+Cj4gPj4KPiA+PiArI2luY2x1ZGUgImRybV9jcnRjX2hlbHBlcl9pbnRlcm5h
bC5oIgo+ID4+ICsKPiA+PiAgIC8qKgo+ID4+ICAgICogRE9DOiBvdmVydmlldwo+ID4+ICAgICoK
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
