Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E0E216D0
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2019 12:14:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DA89898C4;
	Fri, 17 May 2019 10:14:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25667898C4
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2019 10:14:12 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id a39so7354455qtk.2
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2019 03:14:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zJAY/Pv8Q8rCNwC0Vbgeg982L/4wPTYgnNPmTbKhmDg=;
 b=Clb9QLk29ng8nVe1Z+b1GmTFqwwU0KLhVi4FQCBDKLmPMsmWqnRrF8agB2S5krOnxR
 AUeveeKUh1MaWl77vfx/4lRgwBxqMMWILtNx9wixMKVMBPHTvFW6PdQEGxh0xslG1TPg
 A/Nsmfnd0iB2aGbRL6ddDszZ8UNzeMAuOWVo9ROXi0gI4BqdLazqrWAB2PMmlaiWxXiO
 8Nx+Q/LLGJv6IimvpKmCxXo+cGncongprU9x55Nubpo1QdgDYIrQ+W2b0VfYjppJ8GHD
 lH/Ukpsc7c8FtIktiT/XZaRJ5gjy3OfKPcgS7/g1OX6wp0N1xlGpN5BF9Zg50SHpcM71
 srfg==
X-Gm-Message-State: APjAAAV8i6TsNFRkrOcY9NT7Yfl+mnJ/zVT3qVEbH01TZa/PG4UDywlj
 am6ifNKWREpbvXubaZdBPiTKXJCa2mmsip8BrfLHNQ==
X-Google-Smtp-Source: APXvYqz6mT2feKlh8y8KJBFeHaGvmta1tNVLx2J144g2NFmA84lEkdM2Ca/94epR0ewDk42GFLZtxmPXuKFrJ6HDE+g=
X-Received: by 2002:ac8:104:: with SMTP id e4mr47527750qtg.234.1558088051122; 
 Fri, 17 May 2019 03:14:11 -0700 (PDT)
MIME-Version: 1.0
References: <1557826556-10079-1-git-send-email-yannick.fertre@st.com>
 <1557826556-10079-2-git-send-email-yannick.fertre@st.com>
In-Reply-To: <1557826556-10079-2-git-send-email-yannick.fertre@st.com>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Fri, 17 May 2019 12:14:00 +0200
Message-ID: <CA+M3ks66kdeCEEzRj9B41YTQQkod5f5p9EgpjUZvnj=q36ak4Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: display: stm32: add supply property
 to DSI controller
To: =?UTF-8?Q?Yannick_Fertr=C3=A9?= <yannick.fertre@st.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zJAY/Pv8Q8rCNwC0Vbgeg982L/4wPTYgnNPmTbKhmDg=;
 b=iomWStGl4iQbx8eysPjAozeB43WumfOwhPB77ZRRDGP/507Zl7PX1Gq7HJ1rJ9Eqlb
 HVJX7hCf6FtmuB82mMUTRb8z4gsMdsm94Bbwk5jKY74u28in3UC3C09azGNKeHNLNEdx
 Se7hyfP11juO1tqPdhboIE+k9wGUduPUC10mzjhJNBokCoUG/NZQhuCkGfOpdUziIQQQ
 XKiTGp25+uJ4xLUhWMDsE+fLqb+x/gbwNLg5CIT7WmhGSPIyHAFycNQ7EzPClNwB7Qwl
 BDtPhmPCodYbrRNYKxnLv7c06tdvUwlx5lKIbVBmg89br/GeOX+lAuwsbf8kxt8W01sd
 gZww==
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
Cc: David Airlie <airlied@linux.ie>, Philippe Cornu <philippe.cornu@st.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Benjamin Gaignard <benjamin.gaignard@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TGUgbWFyLiAxNCBtYWkgMjAxOSDDoCAxMTozNiwgWWFubmljayBGZXJ0csOpIDx5YW5uaWNrLmZl
cnRyZUBzdC5jb20+IGEgw6ljcml0IDoKPgo+IFRoaXMgcGF0Y2ggYWRkcyBkb2N1bWVudGF0aW9u
IG9mIGEgbmV3IHByb3BlcnR5IHBoeS1kc2ktc3VwcGx5IHRvIHRoZQo+IFNUTTMyIERTSSBjb250
cm9sbGVyLgo+Cj4gU2lnbmVkLW9mZi1ieTogWWFubmljayBGZXJ0csOpIDx5YW5uaWNrLmZlcnRy
ZUBzdC5jb20+Cj4gUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4g
UmV2aWV3ZWQtYnk6IFBoaWxpcHBlIENvcm51IDxwaGlsaXBwZS5jb3JudUBzdC5jb20+CgpBcHBs
aWVkIG9uIGRybS1taXNjLW5leHQsCgpUaGFua3MsCkJlbmphbWluCgo+IC0tLQo+ICBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9zdCxzdG0zMi1sdGRjLnR4dCB8IDMg
KysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9zdCxzdG0zMi1sdGRjLnR4
dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3N0LHN0bTMyLWx0
ZGMudHh0Cj4gaW5kZXggM2ViMWI0OC4uNjBjNTRkYSAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9zdCxzdG0zMi1sdGRjLnR4dAo+ICsrKyBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3N0LHN0bTMyLWx0ZGMu
dHh0Cj4gQEAgLTQwLDYgKzQwLDggQEAgTWFuZGF0b3J5IG5vZGVzIHNwZWNpZmljIHRvIFNUTTMy
IERTSToKPiAgLSBwYW5lbCBvciBicmlkZ2Ugbm9kZTogQSBub2RlIGNvbnRhaW5pbmcgdGhlIHBh
bmVsIG9yIGJyaWRnZSBkZXNjcmlwdGlvbiBhcwo+ICAgIGRvY3VtZW50ZWQgaW4gWzZdLgo+ICAg
IC0gcG9ydDogcGFuZWwgb3IgYnJpZGdlIHBvcnQgbm9kZSwgY29ubmVjdGVkIHRvIHRoZSBEU0kg
b3V0cHV0IHBvcnQgKHBvcnRAMSkuCj4gK09wdGlvbmFsIHByb3BlcnRpZXM6Cj4gKy0gcGh5LWRz
aS1zdXBwbHk6IHBoYW5kbGUgb2YgdGhlIHJlZ3VsYXRvciB0aGF0IHByb3ZpZGVzIHRoZSBzdXBw
bHkgdm9sdGFnZS4KPgo+ICBOb3RlOiBZb3UgY2FuIGZpbmQgbW9yZSBkb2N1bWVudGF0aW9uIGlu
IHRoZSBmb2xsb3dpbmcgcmVmZXJlbmNlcwo+ICBbMV0gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Nsb2NrL2Nsb2NrLWJpbmRpbmdzLnR4dAo+IEBAIC0xMDEsNiArMTAzLDcgQEAg
RXhhbXBsZSAyOiBEU0kgcGFuZWwKPiAgICAgICAgICAgICAgICAgICAgICAgICBjbG9jay1uYW1l
cyA9ICJwY2xrIiwgInJlZiI7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgcmVzZXRzID0gPCZy
Y2MgU1RNMzJGNF9BUEIyX1JFU0VUKERTSSk+Owo+ICAgICAgICAgICAgICAgICAgICAgICAgIHJl
c2V0LW5hbWVzID0gImFwYiI7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgcGh5LWRzaS1zdXBw
bHkgPSA8JnJlZzE4PjsKPgo+ICAgICAgICAgICAgICAgICAgICAgICAgIHBvcnRzIHsKPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Owo+IC0tCj4g
Mi43LjQKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
