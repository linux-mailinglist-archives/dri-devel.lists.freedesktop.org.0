Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDDC3314C
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2019 15:42:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CEAD89257;
	Mon,  3 Jun 2019 13:42:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE52A89257
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 13:42:31 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id z23so1123785ote.13
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jun 2019 06:42:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EwHpI70H+I68V/L8EafGpmhnZN/O7BlRYYW78Y1Qlrc=;
 b=Per9hHntvmgVz6g3qxQK2S7pjsTGVb+JA0w2DrXtkFwWlXoD8vLPt0P52l/2oktJlR
 7vdxBVoa3mVbkuJk7T2+p8GQ4HM32msqHCsT72hS40faJ1lNTT/VV4cxsJPD1Va4ZqR9
 GcDQZMEMXXmllWrxVQNTK/YjpP8GgBl2A2yj3wUGzm1xEHu9DiivPUikmX59ynkx289s
 GPcbqZaFNOT5NkPRmqukza8YZHGGPND1KbcWQIiugt4jQY14C4gXMMrR7xfV08Tm7CKN
 QddaigOJ1rgCO0AiurzZO5gzDs612sM7mfFaKPm8svAPOSPv0scHp4DjtqqiS8u+Fwrk
 52cg==
X-Gm-Message-State: APjAAAUNIzF0KQ69+iaLMIZFU1tKpCJPWgLlLnABeNut4kr6xekewSfW
 v7U9WT/SHk0f1wCWzIoq2bkr7zd+IS7lonFWleLmG0JZ
X-Google-Smtp-Source: APXvYqwkvucnSkld88pQMkehMQDeT577Z6yq5giyXo8IcGk2KWg63i2bM/rVPVKKbHUBH0D+N0DVdx/oa4FIlI2s8No=
X-Received: by 2002:a9d:7395:: with SMTP id j21mr1297917otk.204.1559569350894; 
 Mon, 03 Jun 2019 06:42:30 -0700 (PDT)
MIME-Version: 1.0
References: <96fb4e89-2721-90bb-ce76-69667c2cf78a@st.com>
 <2a6c0803-b386-c8cc-78f8-26faa230ac44@tronnes.org>
 <CAKMK7uH=Lo+Ewc6UpjF_pEPB+O0NR4VOeDtM1mdpoAdV4HR6xQ@mail.gmail.com>
 <e6985208-b386-d522-e433-91d8013eb531@st.com>
In-Reply-To: <e6985208-b386-d522-e433-91d8013eb531@st.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Mon, 3 Jun 2019 15:42:14 +0200
Message-ID: <CAKMK7uG5ZLBqW5cQw6rsy8Lhm2avVpVsDRe3zsrcDFa=y7qpfA@mail.gmail.com>
Subject: Re: drm_gem_dumb_map_offset patch
To: Pierre Yves MORDRET <pierre-yves.mordret@st.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=EwHpI70H+I68V/L8EafGpmhnZN/O7BlRYYW78Y1Qlrc=;
 b=KJo5q+/roRgQKKpI4STyKtxMjzp5ja6/s5ZfqzhI480vwrw2eTvQl8dO7ATTeDuI0j
 uvT+pRNncTQz+x04xs6WD3ZYwSYZK+435gbcZQEsScnSvGKwGYzPTG5NR64FOYUXmrgK
 ahnc2ZuucThzWtt0SOjGSnWrK/2M8r4C+8MIs=
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMywgMjAxOSBhdCAyOjI1IFBNIFBpZXJyZSBZdmVzIE1PUkRSRVQKPHBpZXJy
ZS15dmVzLm1vcmRyZXRAc3QuY29tPiB3cm90ZToKPgo+IEhpIGFsbCwKPgo+IE1hbnkgdGhhbmtz
IGZvciB5b3VyIHZhbHVhYmxlIHN1cHBvcnQgYW5kIGFuc3dlcnMuCj4KPiBTaW5jZSBEdW1iIG1t
YXAgaXMgZm9yIGJ1ZmZlciBjcmVhdGVkIHVzaW5nIGR1bWJfY3JlYXRlIGlvY3RsIHdlIHdvbid0
IHVzZSBpdAo+IGFueW1vcmUuIEluIHBsYWNlIGEgbW1hcC91bW1hcCBpcyBjYWxsZWQgd2l0aCBE
TUEgQnVmIEZELgo+IEFmdGVyIHNvbWUgdGVzdHMgaXQgc2VlbXMgd29ya2luZyBpbiBvdXIgc2lk
ZS4KClBsZWFzZSBub3RlIHRoYXQgd2l0aCBkbWEtYnVmIHlvdSBuZWVkIHRvIGNhbGwgdGhlIGJl
Z2luL2VuZCBjcHUKYWNjZXNzIGlvY3RsLCBvciBkZXBlbmRpbmcgdXBvbiBkcml2ZXIvcGxhdGZv
cm0gdGhlIG1tYXAgYWNjZXNzIG1pZ2h0CmJlIGluY29oZXJlbnQuCi1EYW5pZWwKCj4KPiBNYW55
IHRoYW5rcyBhZ2Fpbi4KPiBSZWdhcmRzLgo+Cj4gT24gNS8zMS8xOSAxOjM2IFBNLCBEYW5pZWwg
VmV0dGVyIHdyb3RlOgo+ID4gT24gRnJpLCBNYXkgMzEsIDIwMTkgYXQgMToyOCBQTSBOb3JhbGYg
VHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4gd3JvdGU6Cj4gPj4KPiA+PiBIaSwKPiA+Pgo+
ID4+IFthZGQgRGFuaWVsIFZldHRlcl0KPiA+PiBbY2MgZHJpLWRldmVsXQo+ID4+Cj4gPj4gRGVu
IDI5LjA1LjIwMTkgMTUuMDksIHNrcmV2IFBpZXJyZSBZdmVzIE1PUkRSRVQ6Cj4gPj4+IEhlbGxv
IE5vcmFsZiwKPiA+Pj4KPiA+Pj4gU29ycnkgZm9yIGJvdGhlcmluZyB5b3Ugd2l0aCBxdWVzdGlv
biBidXQgSSBuZWVkIHRvIGJldHRlciB1bmRlcnN0YW5kIHRoZQo+ID4+PiByYXRpb25hbCBhYm91
dCBhIHBhdGNoIHlvdSBkaWQgaW4gRFJNL0dFTS4KPiA+Pj4KPiA+Pj4gRmlyc3Qgb2YgYWxsLCBs
ZXQgbWUgaW50cm9kdWNlIG15c2VsZi4KPiA+Pj4gSSdtIGN1cnJlbnRseSBlbXBsb3llZSB0byBT
VE1pY3JvZWxlY3Ryb25pY3MgY29tcGFueSBhbmQgaW4gY2hhcmdlIG9mIEdQVQo+ID4+PiBpbnRl
Z3JhdGlvbiB3aXRoaW4gU1RNMzIgTVBVIChDb3J0ZXggQTcgKyBDb3J0ZXggTTQpCj4gPj4+Cj4g
Pj4+IE9uIENvcnRleCBBNyBpcyBydW5uaW5nIGEgTGludXggS2VybmVsIDQuMTkgYXMgZm9yIHRv
ZGF5Lgo+ID4+Pgo+ID4+PiBXZSBjYW1lIGFjcm9zcyBzb21lIHRyb3VibGUgd2hlbiB3ZSBzd2l0
Y2ggZnJvbSBLZXJuZWwgNC4xNCB0byA0LjE5IGZvciBHUFUKPiA+Pj4gc3RhY2suIE9uIGF1Z3Vz
dCB5b3Ugc3VibWl0IHRoaXMgY29tbWl0IDoKPiA+Pj4KPiA+Pj4gICAgICAgOTAzNzhlNTg5MTky
ODU2MzdhYTBmMDYzYzA0YmEwYzY0NDlkOThiMQo+ID4+PiAgICAgICAgICAgZHJtL2dlbTogZHJt
X2dlbV9kdW1iX21hcF9vZmZzZXQoKTogcmVqZWN0IGRtYS1idWYKPiA+Pj4KPiA+Pj4gICAgICAg
ICAgIFJlamVjdCBtYXBwaW5nIGFuIGltcG9ydGVkIGRtYS1idWYgc2luY2UgaXMncyBhbiBpbnZh
bGlkIHVzZS1jYXNlLgo+ID4+Pgo+ID4+PiBJbiBVc2VybGFuZCBHUFUgc3RhY2sgd2UgaGF2ZSBz
dWNoIHN0YXRlbWVudHMgOgo+ID4+PiAgICBib19tYXBfZmQKPiA+Pj4gICAgICAgIERSTV9JT0NU
TF9NT0RFX01BUF9EVU1CCj4gPj4+ICAgICAgICBtbWFwIChvZmZzZXQpCj4gPj4+Cj4gPj4+IFdp
dGggdGhlIHBhdGNoIGFib3ZlLCBpb2N0bCByZXR1cm5zIGFuIGVycm9yIEVJTlZBTCBhbmQgcHJl
dmVudHMgdGhlIG5tYXAuCj4gPj4+IEFzIGZvciB0b2RheSB3ZSByZXZlcnQgdGhpcyBwYXRjaCBh
bmQgaXQgd29ya3MgZmluZSBpbiBvdXIgZW5kLgo+ID4KPiA+IExpbmsgdG8gc291cmNlIGNvZGUg
d291bGQgYmUgZ29vZC4KPiA+Cj4gPj4+IFRodXMgdGhlIHF1ZXN0aW9ucyBhcmUgOgo+ID4+PiAg
LSB3aGF0IGlzIHRoZSByYXRpb25hbCBiZWhpbmQgdGhpcyBmaXggPwo+ID4+PiAgLSBXaGF0IHdl
IGRvaW5nIHdyb25nIHRoaXMgc2l0dWF0aW9uID8KPiA+Pj4gIC0gV2hhdCBkbyB3ZSBuZWVkIGlu
IHN1Y2ggc2l0dWF0aW9uID8KPiA+Pj4KPiA+Pgo+ID4+IEkgbmVlZCB0byBwYXNzIHRob3NlIG9u
IHRvIERhbmllbCBWZXR0ZXIgKERSTSBtYWludGFpbmVyKSBzaW5jZSBoZQo+ID4+IHdhbnRlZCB0
aGUgY2hhbmdlLiBUaGUgZGV0YWlscyB3ZXJlIG5ldmVyIGNsZWFyIHRvIG1lLgo+ID4+IFNvbWUg
b2YgdGhlIGRpc2N1c3Npb24gaXMgaGVyZToKPiA+PiBodHRwczovL3BhdGNod29yay5mcmVlZGVz
a3RvcC5vcmcvcGF0Y2gvMTcyMjQyLwo+ID4KPiA+IER1bWIgbW1hcCBpcyBmb3IgYnVmZmVyIGNy
ZWF0ZWQgdXNpbmcgZHVtYl9jcmVhdGUgaW9jdGwsIGFuZCBub3RoaW5nCj4gPiBlbHNlLiBBbnl0
aGluZyBlbHNlIHJlYWxseSBoYXMgYXQgYmVzdCB1bmRlZmluZWQgYmVoYXZpb3VyLiBFLmcuIGZv
cgo+ID4gZG1hLWJ1ZiB5b3UgcmVhbGx5IG5lZWQgdG8gY2FsbCB0aGUgYmVnaW4vZW5kX2NwdV9h
Y2Nlc3MgaW9jdGwsIGFuZAo+ID4gZHVtYiBidWZmZXJzIHNpbXBseSBoYXZlIG5vIHByb3Zpc2lv
biBmb3IgdGhhdC4gSGVuY2Ugd2h5IHdlIGNhbid0Cj4gPiBzdXBwb3J0IHRoaXMgaW4gZ2VuZXJh
bC4KPiA+Cj4gPiBUaGFua3MsIERhbmllbAo+ID4KCgoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdh
cmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCis0MSAoMCkgNzkgMzY1IDU3IDQ4IC0gaHR0
cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
