Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D92D3847
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 06:24:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D1A06EA88;
	Fri, 11 Oct 2019 04:24:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2A086EA88
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2019 04:24:42 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id y3so8402725ljj.6
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 21:24:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=boEWjy7jwAnHitXp2Hz7qEsmPT6nmjrEsxyS7gJFcSA=;
 b=hc5Lc4jjIV4pTJcWXXHOZaOr1+WopgsyS9wiN5F6nIghQZqDTRYodL6ElHZn5Ttxoa
 h8HixLUfkR1x4ldavGFcR+534dUoCt4MAx11OuiqDpMrV/2FyWXcPP9795KHXGV/qzsl
 bXZF2j5yKUMAhthsPuvQ2m9sKvDmST06nHAirJtlqKinyGEXPgSZVP/vpYOf6UTqO3Ss
 eHvSIN6eT28h6xGiGjBRbPduVj1uOjA1GMYuJQzmfr8gXT0b9CunUz/tI9yxI5N4PIK/
 5roTqOI2YjukWlhPl8bUO5ShDiV+XHWdfqkyMxd6yzeYYXwJ2QHdVKJabNvWxg3sdTk8
 LgrQ==
X-Gm-Message-State: APjAAAUjLv0Hq0Mg9viAqj1khY5W6u/NwMqVJNFS+SREYSlutje8P56R
 5FToyNM2jWV81QoxOXL/xZPv6mDDER9K6rzmYrk=
X-Google-Smtp-Source: APXvYqzA5CACv+QqEffHLdAx1BmWlzeS5gyGjSc+DnQabNphJOHXaW2dUkdhRK8UBQU5ubjdQpoSZkx3eZJABxPsOxk=
X-Received: by 2002:a2e:8417:: with SMTP id z23mr8151060ljg.46.1570767881058; 
 Thu, 10 Oct 2019 21:24:41 -0700 (PDT)
MIME-Version: 1.0
References: <1eba1bc0-ba0c-b948-6a3d-51a98f4e5c27@gmail.com>
 <CAPM=9tyivSLW_DUJuZo9XQ8-0DsdCuPxrzqLUC-1u9riihqLSg@mail.gmail.com>
 <eb4fe229-8f8d-baca-7bc5-93bcefa63ed1@amd.com>
 <CADnq5_O0QjK0gecUiO0K6Tm7UVY7aF4uuBcj_uvHPKJBtAyEPQ@mail.gmail.com>
 <20191009074700.ieujxt3ueads2cbt@ahiler-desk1.fi.intel.com>
 <55cad18c-b69f-226c-182e-cdaf743822e3@amd.com>
 <CAPM=9tyYAhYhDKWxthJCVur-7Goqyj4xor6xOUeWjALBdeQjgw@mail.gmail.com>
In-Reply-To: <CAPM=9tyYAhYhDKWxthJCVur-7Goqyj4xor6xOUeWjALBdeQjgw@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 11 Oct 2019 14:24:28 +1000
Message-ID: <CAPM=9tzHc5JsScuh0B_Mgpne387_Q3sXY7FE9RguzjL057L+NQ@mail.gmail.com>
Subject: Re: [pull] ttm drm-fixes-5.4
To: "Koenig, Christian" <Christian.Koenig@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=boEWjy7jwAnHitXp2Hz7qEsmPT6nmjrEsxyS7gJFcSA=;
 b=gyz2d/z4otkG61I3AVtJO3lh8pv/Sfw8480VP0XQp2WpwPBx6IhxTI24fvssaGhv6p
 du9m2Qcqem/Q7ddmGF7MNypD72Nbz5vKLIStyzlIFlGcyyIIk+kxYf1tGM8+rqVSKtXg
 wQE1BEbNJkRBqkKM+BqTjC8zwSZiaQEi6jttfNCnX/zYaWWBcWEsQS5Gz5HZtCHLXS3+
 35ghsvCFDsOgYEMvyB8EqDXw0o0ARTN7vH0U7kYTM5/6yswlu9X1D2/0NOzSDz2OeTWm
 N3Zk5x/+2blN+GotGU4Yvbln4//D/VXHspYM0YhUaSoAlUVSgDyx2QRRNgrMoDMCPJ+L
 j+KA==
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
 Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAxMSBPY3QgMjAxOSBhdCAxNDoyMCwgRGF2ZSBBaXJsaWUgPGFpcmxpZWRAZ21haWwu
Y29tPiB3cm90ZToKPgo+IE9uIFRodSwgMTAgT2N0IDIwMTkgYXQgMjE6NTgsIEtvZW5pZywgQ2hy
aXN0aWFuCj4gPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT4gd3JvdGU6Cj4gPgo+ID4gQW0gMDku
MTAuMTkgdW0gMDk6NDcgc2NocmllYiBBcmthZGl1c3ogSGlsZXI6Cj4gPiA+IE9uIFR1ZSwgT2N0
IDA4LCAyMDE5IGF0IDA5OjEzOjQxQU0gLTA0MDAsIEFsZXggRGV1Y2hlciB3cm90ZToKPiA+ID4+
IE9uIFR1ZSwgT2N0IDgsIDIwMTkgYXQgNDowNCBBTSBLb2VuaWcsIENocmlzdGlhbgo+ID4gPj4g
PENocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT4gd3JvdGU6Cj4gPiA+Pj4gTXkgZ2l0IHZlcnNpb24g
c2hvdWxkIGJlIHJlbGF0aXZlIG5ldywgYnV0IEknbSB1c3VhbGx5IHVzaW5nIHRodW5kZXJiaXJk
Cj4gPiA+Pj4gdG8gc2VuZCBwdWxsIHJlcXVlc3RzIG5vdCBnaXQgaXRzZWxmIHNpbmNlIEkgd2Fu
dCB0byBlZGl0IHRoZSBtZXNzYWdlCj4gPiA+Pj4gYmVmb3JlIHNlbmRpbmcuCj4gPiA+Pj4KPiA+
ID4+PiBIb3cgd291bGQgSSBkbyB0aGlzIGluIGEgd2F5IHBhdGNod29yayBsaWtlcyBpdCB3aXRo
IGdpdD8KPiA+ID4+IEZXSVcsIEkgdXN1YWxseSBnZW5lcmF0ZSB0aGUgZW1haWwgZmlyc3QgYW5k
IHRoZW4gdXNlIGdpdC1zZW5kLWVtYWlsCj4gPiA+PiB0byBhY3R1YWxseSBzZW5kIGl0Lgo+ID4g
Pj4KPiA+ID4+IEFsZXgKPiA+ID4gSGV5LAo+ID4gPgo+ID4gPiBGRE8gcGF0Y2h3b3JrIG1haW50
YWluZXIgaGVyZS4KPiA+ID4KPiA+ID4gSSBoYXZlIHRyaWVkIGZldyB0aGluZ3MgcXVpY2tseSB3
aXRoIG5vIGx1Y2suIFRoZXJlIGlzIHNvbWV0aGluZyBmaXNoeQo+ID4gPiBhYm91dCBGRE8gZGVw
bG95bWVudCBvZiBwYXRjaHdvcmsgLSB5b3UgZW1haWwgd29ya3MganVzdCBmaW5lIG9uIG15Cj4g
PiA+IGRldmVsb3BtZW50IGluc3RhbmNlLgo+ID4gPgo+ID4gPiBJIGhhdmUgY3JlYXRlZCBpc3N1
ZSBmb3IgdGhpczoKPiA+ID4gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3BhdGNod29y
ay1mZG8vcGF0Y2h3b3JrLWZkby9pc3N1ZXMvMjgKPiA+ID4KPiA+ID4gU29ycnkgZm9yIHRoZSBp
bmNvbnZlbmllbmNlLgo+ID4KPiA+IE1heWJlIGl0J3MgdGhlIG5vbi1MYXRpbiBsZXR0ZXIgaW4g
bXkgbGFzdCBuYW1lPyBBbnl3YXkgd2UgbmVlZCB0byBnZXQKPiA+IHRoZSBUVE0gZml4ZXMgdXBz
dHJlYW0gZm9yIDUuNC4KPiA+Cj4gPiBEYXZlL0RhbmllbCBhbnkgb2JqZWN0aW9ucyB0aGF0IEkg
cHVzaCB0aG9zZSBkaXJlY3RseSB0byBkcm0tbWlzYy1maXhlcz8KPgo+IERvbid0IGJvdGhlciwg
SSBjYW4gbWFudWFsbHkgcHJvY2VzcyBpdCwganVzdCB0YWtlcyBhIGJpdCBtb3JlIGVmZm9ydC4K
CkFjdHVhbGx5IGl0IGhhcyBhIHByb2JsZW0sIHlvdSBuZWVkIHRvIFNpZ25lZC1vZmYtYnkgYW55
IGNvbW1pdHMgeW91IHRvdWNoLgoKVGhlIGZpcnN0IHBhdGNoIHNob3VsZCB0byBiZSBjb3JyZWVj
dCBoYXZlIHlvdXIgU29iIGFmdGVyIFRob21hcwpyZXZpZXcgYXMgeW91IHRvdWNoZWQgaXQgbGFz
dCwKdGhlIHNlY29uZCBwYXRjaCBuZWVkcyB5b3VyIFNvYiBzb21ld2hlcmUgaW4gaXQuCgpEYXZl
LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
