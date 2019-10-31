Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B84D1EB5D2
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2019 18:09:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F5EF6F3B9;
	Thu, 31 Oct 2019 17:09:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0AF16F3B9
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2019 17:09:32 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id k15so4591467vsp.2
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2019 10:09:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BbJu3UVGxb/D3O3Jaajy2yYceop1LdG6jIZpC2UGdME=;
 b=mXYsUQp25RncxG5ANDJ/WORGrZl2hRWEI1EedgMd1tpjwsX6WplZjahAjqa9vm6Sff
 hXvOiltfvr0dCB7VvtgokohbDF2b+WB60adT9Itylz6h1ylacLFpvFHeD9tpQpdqiwZU
 Y57wCUlZUrQgsFBrlAE11fTvsWtE9Fwugzm7GFytVu03HZg1Ex+9ebOiHyy585nBD3lx
 y6vINsWabZ4dLkH+wUfTZMbXYS7Fh+m2qw2h7u03Q8t7Wl6hY7u8knELSaylMbE9hTMJ
 cJYUTtfqs0N1HICddCHcBX1MfBx6J21NrBquXvrulKywz9LlgFQo05T10C2BtPCg3bPV
 diDg==
X-Gm-Message-State: APjAAAWriYvotxyds7eoqSjY1RkcwosrJiV5N4OeJ1PfBaBdrcwpPo17
 pyOhdT+i1rBmv6LhceQ/QWGPCOHEiMErvn/PST8=
X-Google-Smtp-Source: APXvYqyLkkWgJ7ICTVfMGBOcq4S2OAn5nYpk6VJZW0O94lgZM/BCKp35+LK16Ms8/t5Z7RoL2Vj7T2VyJxX2Oc575EY=
X-Received: by 2002:a67:77d4:: with SMTP id s203mr3435400vsc.118.1572541771757; 
 Thu, 31 Oct 2019 10:09:31 -0700 (PDT)
MIME-Version: 1.0
References: <20191031142633.12460-1-adrian.ratiu@collabora.com>
In-Reply-To: <20191031142633.12460-1-adrian.ratiu@collabora.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Thu, 31 Oct 2019 17:07:36 +0000
Message-ID: <CACvgo50NmofJrCvADOTxJqJqKEWDsy8qD-1B6R356vFMcmdbWA@mail.gmail.com>
Subject: Re: [PATCH 0/4] Genericize DW MIPI DSI bridge and add i.MX 6 driver
To: Adrian Ratiu <adrian.ratiu@collabora.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=BbJu3UVGxb/D3O3Jaajy2yYceop1LdG6jIZpC2UGdME=;
 b=sILgo0ExuXrqJv9wUbE2Tumq0ELe9CBQDKkU77dnmj/RuVa26/zmecu0GpbeZGTHBM
 ePVf1uFkrSYmYYbtLs705cqb8LfV8HUlHunhiFQbAbOik3oQEtW7EJPpasqgTvjQ2TM0
 LIrREjmrFrRvjpBgBmRubuP6d0oRUxDI8Hc32Y4qIlmCaBj2B/JSC+PHwtXGcKgLiWus
 DEKo5bKI89SVAivdVDnQ+wCLFKmAm9oWYDSxKRXcB3/y3uZeqC/7CvcgrGjxfvkSWxoG
 TG6wKMt7wZHp7DAHNEHqrk4ygoaC3HxA8z/wUcmHdZrBvMtS821UR9VsV2r3le3tgedY
 vrJg==
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
Cc: "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 linux-rockchip <linux-rockchip@lists.infradead.org>, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com,
 LAKML <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQWRyaWFuLAoKT24gVGh1LCAzMSBPY3QgMjAxOSBhdCAxNDoyNiwgQWRyaWFuIFJhdGl1IDxh
ZHJpYW4ucmF0aXVAY29sbGFib3JhLmNvbT4gd3JvdGU6Cj4KPiBIYXZpbmcgYSBnZW5lcmljIFN5
bm9wc2lzIERlc2lnbldhcmUgTUlQSS1EU0kgaG9zdCBjb250cm9sbGVyIGJyaWRnZQo+IGRyaXZl
ciBpcyBhIHZlcnkgZ29vZCBpZGVhLCBob3dldmVyIHRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9u
IGhhcwo+IGhhcmRjb2RlZCBxdWl0ZSBhIGxvdCBvZiB0aGUgcmVnaXN0ZXIgbGF5b3V0cyB1c2Vk
IGJ5IHRoZSB0d28gc3VwcG9ydGVkCj4gU29DIHZlbmRvcnMsIFNUTSBhbmQgUm9ja2NoaXAsIHdo
aWNoIHVzZSBJUCBjb3JlcyB2MS4zMCBhbmQgdjEuMzEuCj4KPiBUaGlzIG1ha2VzIGl0IGhhcmQg
dG8gc3VwcG9ydCBvdGhlciBTb0MgdmVuZG9ycyBsaWtlIHRoZSBGU0wvTlhQIGkuTVggNgo+IHdo
aWNoIHVzZSBvbGRlciB2MS4wMSBjb3JlcyBvciBmdXR1cmUgdmVyc2lvbnMgYmVjYXVzZSwgYmFz
ZWQgb24gaGlzdG9yeSwKPiBsYXlvdXQgY2hhbmdlcyBzaG91bGQgYWxzbyBiZSBleHBlY3RlZCBp
biBuZXcgRFNJIHZlcnNpb25zIC8gU29Dcy4KPgo+IFRoaXMgcGF0Y2ggc2VyaWVzIGNvbnZlcnRz
IHRoZSBicmlkZ2UgYW5kIHBsYXRmb3JtIGRyaXZlcnMgdG8gYWNjZXNzCj4gcmVnaXN0ZXJzIHZp
YSBnZW5lcmljIHJlZ21hcCBBUElzIGFuZCBhbGxvd3MgZWFjaCBwbGF0Zm9ybSBkcml2ZXIgdG8K
PiBjb25maWd1cmUgaXRzIHJlZ2lzdGVyIGxheW91dCB2aWEgc3RydWN0IHJlZ19maWVsZHMsIHRo
ZW4gYWRkcyBzdXBwb3J0Cj4gZm9yIHRoZSBob3N0IGNvbnRyb2xsZXIgZm91bmQgb24gaS5NWCA2
Lgo+CkhhdmUgeW91IGNvbnNpZGVyZWQga2VlcGluZyB0aGUgZGlmZmVyZW5jZSBpbnRlcm5hbCB0
byB0aGUgZHctbWlwaS1kc2kgZHJpdmVyPwpTYXkgaGF2aW5nIHRoZSBpTVg2IG1vZHVsZSAicmVx
dWVzdCIgdGhlIHYxLjAxIHJlZ21hcCBmcm9tIHRoZSBicmlkZ2UKZHJpdmVyLCB3aGlsZSByb2Nr
Y2hpcC9vdGhlcnMgZG9pbmcgdGhlIGVxdWl2YWxlbnQuCgo+ICAuLi4vYmluZGluZ3MvZGlzcGxh
eS9pbXgvbWlwaS1kc2kudHh0ICAgICAgICAgfCAgNTYgKysKPiAgZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS9zeW5vcHN5cy9kdy1taXBpLWRzaS5jIHwgNTE4ICsrKysrKysrKy0tLS0tLS0tLQo+ICBk
cml2ZXJzL2dwdS9kcm0vaW14L0tjb25maWcgICAgICAgICAgICAgICAgICAgfCAgIDcgKwo+ICBk
cml2ZXJzL2dwdS9kcm0vaW14L01ha2VmaWxlICAgICAgICAgICAgICAgICAgfCAgIDEgKwo+ICBk
cml2ZXJzL2dwdS9kcm0vaW14L2R3X21pcGlfZHNpLWlteC5jICAgICAgICAgfCA1MDIgKysrKysr
KysrKysrKysrKysKPiAgLi4uL2dwdS9kcm0vcm9ja2NoaXAvZHctbWlwaS1kc2ktcm9ja2NoaXAu
YyAgIHwgMTU0ICsrKysrLQo+ICBkcml2ZXJzL2dwdS9kcm0vc3RtL2R3X21pcGlfZHNpLXN0bS5j
ICAgICAgICAgfCAxNjAgKysrKystCj4gIGluY2x1ZGUvZHJtL2JyaWRnZS9kd19taXBpX2RzaS5o
ICAgICAgICAgICAgICB8ICA2MCArLQo+ICA4IGZpbGVzIGNoYW5nZWQsIDExODUgaW5zZXJ0aW9u
cygrKSwgMjczIGRlbGV0aW9ucygtKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvaW14L21pcGktZHNpLnR4dAo+ICBjcmVhdGUg
bW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2lteC9kd19taXBpX2RzaS1pbXguYwo+CgpUaGlz
IHNob3VsZCBtYWtlIHRoZSBkZWx0YSBhIGxvdCBzbWFsbGVyLCBhdm9pZGluZyB0aGUgdW5uZWNl
c3NhcnkKY29weSBvZiByZWdpc3RlciBmaWVsZHMgYW5kIHJlZ21hcC4KUGx1cyBwbHVnZ2luZyBm
dXR1cmUgdXNlcnMgd2lsbCBiZSBkZWFkIHRyaXZpYWwuCgotRW1pbApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
