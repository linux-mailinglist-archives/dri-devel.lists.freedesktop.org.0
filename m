Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D7ED7570
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 13:46:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1881489725;
	Tue, 15 Oct 2019 11:46:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41C3089725
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 11:46:56 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id y21so19941428wmi.0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 04:46:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=4zelbzKgVDVBwk81v7buJVDFvSf6vHsLsJcsmpqmrPI=;
 b=P5KtCKP2L+srR467Pj4S61hhMF5H1Ik8EihYMz8StoSwRCmCWeWo1XPrkZdcKPZdpT
 1s4mnZIvhIKPWN1UwWiuqxxVob1/xOU7OTCLi0cky+3Q8IfBlG36MctygI/o5IEbUWmY
 NNn10XhFmc8tZ5/fiKQ46LW+ghzsolvdMdvygB9wjDN2/hdYHt+yNJa3btQaeqQ+Hl1s
 zNhSkCXpCeWZ+xP1frX5H7ltcM+v1l54xBhh8N299ZVIMMe48jK/2Ib/yFjDCIqeSN0e
 1DCW/kfKDmqYoBrwyj8et0vMVuCFTjjYcqeIkoBo1vkgZQOggSbO5uCH2iIBq0+4i+R7
 6zVA==
X-Gm-Message-State: APjAAAWhEuiL8Y0RR1wq9J/xiNmO2GwsQ969AbFJvniKyWz0bi/o4JTm
 GJQG+QICdg9ONDS2atMAaSxV7g==
X-Google-Smtp-Source: APXvYqzLnkJN9zRYZ21Y1M8YN4dbJd0EC5sTlVOGdoe+wAXsdl3nXKYGJgtoav7TkFmWi/KS+MDhtg==
X-Received: by 2002:a1c:7c0a:: with SMTP id x10mr19229567wmc.48.1571140014611; 
 Tue, 15 Oct 2019 04:46:54 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id r13sm31730589wrn.0.2019.10.15.04.46.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 15 Oct 2019 04:46:54 -0700 (PDT)
Subject: Re: [PATCH 4/7] drm/meson: plane: add support for AFBC mode for OSD1
 plane
To: Brian Starkey <Brian.Starkey@arm.com>
References: <20191010092526.10419-1-narmstrong@baylibre.com>
 <20191010092526.10419-5-narmstrong@baylibre.com>
 <20191010132601.GA10110@arm.com>
 <44f1771f-d640-f23d-995f-7bfcadd213bc@baylibre.com>
 <20191011084108.i7lfh2d7asfmcdk4@DESKTOP-E1NTVVP.localdomain>
 <c9d4f840-a3da-0f40-3a1c-c4aa522daf0f@baylibre.com>
 <20191011105559.clttghy52wfdmb34@DESKTOP-E1NTVVP.localdomain>
 <d1010021-cbd8-4328-4b21-7481cba5485e@baylibre.com>
 <20191015111812.vl2yabdoncz77xh6@DESKTOP-E1NTVVP.localdomain>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <828ac069-35db-e356-add3-55a2900b4336@baylibre.com>
Date: Tue, 15 Oct 2019 13:46:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191015111812.vl2yabdoncz77xh6@DESKTOP-E1NTVVP.localdomain>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=4zelbzKgVDVBwk81v7buJVDFvSf6vHsLsJcsmpqmrPI=;
 b=VjizehmN0uOxhlOUKSK0mqVotk5XxIUrRgm2wP/aanx6zX6P6gIKLbzQyv/VXAJPhP
 fMdv0/7RvB0kNmmXF5wfAC/eifKbsc/b6DtSR7CLHt/ZBBjBKdVRhrLVPTSAtB/z+pmh
 RJVoowni62uvdQeH855va18w0jm1qSXkcz2AOe9r6ffj+Xe7Cl2PNJOkNIiOI97bvk6P
 fPuX3lfIU6tb2oQW6BVnC0A4eZgRc0UWgGmW03wyBOCv+eXetdoS6bClE/fM16pkm5is
 Qnsf1SL9ROSKvne8a6LkYmQWe95r6nF3iUA94HYOHXEuNUYl4N/COYiT3UnUCpzW4+VJ
 Yflw==
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
Cc: Ayan Halder <Ayan.Halder@arm.com>,
 "khilman@baylibre.com" <khilman@baylibre.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 nd <nd@arm.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTUvMTAvMjAxOSAxMzoxOCwgQnJpYW4gU3RhcmtleSB3cm90ZToKPiBIaSBOZWlsLAo+IAo+
IE9uIEZyaSwgT2N0IDExLCAyMDE5IGF0IDAyOjA3OjAxUE0gKzAyMDAsIE5laWwgQXJtc3Ryb25n
IHdyb3RlOgo+PiBPbiAxMS8xMC8yMDE5IDEyOjU2LCBCcmlhbiBTdGFya2V5IHdyb3RlOgo+Pj4g
SGksCj4+Pgo+Pj4gT24gRnJpLCBPY3QgMTEsIDIwMTkgYXQgMTE6MTQ6NDNBTSArMDIwMCwgTmVp
bCBBcm1zdHJvbmcgd3JvdGU6Cj4+Pj4gSGkgQnJpYW4sCj4+Pj4KPj4+PiBPbiAxMS8xMC8yMDE5
IDEwOjQxLCBCcmlhbiBTdGFya2V5IHdyb3RlOgo+Pj4+PiBIaSBOZWlsLAo+Pj4+Pgo+Pj4+PiBP
biBUaHUsIE9jdCAxMCwgMjAxOSBhdCAwMzo0MToxNVBNICswMjAwLCBOZWlsIEFybXN0cm9uZyB3
cm90ZToKPiAKPiBbc25pcF0KPiAKPj4+PiBZb3UnbGwgaGF2ZSB0byB0ZWxsIHVzIGlmIHRoZSBj
bG9zZWQgbGliTWFsaSBoYW5kbGluZyBBRkJDIHdvdWxkIGFjY2VwdAo+Pj4+IEFSR0I4ODg4IGFz
IGZvcm1hdCB0byByZW5kZXIgd2l0aCBBRkJDIGVuYWJsZWQsIGlmIG5vdCB5b3UncmUgcmlnaHQK
Pj4+PiBJJ2xsIGRpc2NhcmQgWFJHQjg4ODgvQVJHQjg4ODggZm9yIEFGQkMgYnVmZmVycyBjb21w
bGV0ZWx5Lgo+Pj4+Cj4+Pj4gQnV0IGl0IHRoZSBsaWJNYWxpIGNob29zZXMgdHQgZ2VuZXJhdGUg
YW4gQVJHQjg4ODggYnVmZmVyIHdoYXRldmVyCj4+Pj4gQVJHQjg4ODgvWFJHQjg4ODgvQUJHUjg4
OC9YQkdSODg4IGlzIGFza2VkLCB0aGVuIG5vIEknbGwga2VlcCBpdCB0aGF0IHdheS4KPj4+Pgo+
Pj4KPj4+IFllYWgsIEknbGwgdHJ5IGFuZCBnZXQgY2xhcml0eSBvbiB0aGlzLiBJdCdzIG5vdCBh
dCBhbGwgY2xlYXIgdG8gbWUKPj4+IGVpdGhlci4gV2hlbiB5b3Ugc2F5ICJhY2NlcHQgQVJHQjg4
ODggYXMgZm9ybWF0IHRvIHJlbmRlciB3aXRoIEFGQkMKPj4+IGVuYWJsZWQiLCB3aGljaCBBUEkg
YXJlIHlvdSByZWZlcnJpbmcgdG8sIGp1c3Qgc28gSSBjYW4gYmUgY2xlYXI/IERvCj4+PiB5b3Ug
aGF2ZSBhbiBleGFtcGxlIG9mIHNvbWUgY29kZSB5b3UncmUgdXNpbmcgdG8gcmVuZGVyIEFGQkMg
d2l0aCB0aGUKPj4+IEdQVSBibG9iPwo+Pgo+PiBMZXQncyB0YWtlIGttc2N1YmUgdXNpbmcgRUdM
IGFuZCBHQk0uCj4+Cj4+IFRoZSBidWZmZXIgaXMgYWxsb2NhdGVkIHVzaW5nIGdibV9zdXJmYWNl
X2NyZWF0ZV93aXRoX21vZGlmaWVycygpLAo+PiBidXQgdGhlIGdibSBpbXBsZW1lbnRhdGlvbiBp
cyB2ZW5kb3Igc3BlY2lmaWVkLgo+Pgo+PiBUaGVuIHRoZSBzdXJmYWNlIGlzIHBhc3NlZCB0byBl
Z2xDcmVhdGVXaW5kb3dTdXJmYWNlKCkuCj4+IFRoZW4gdGhlIGZvcm1hdCBpcyBtYXRjaGVkIHVz
aW5nIGVnbEdldENvbmZpZ0F0dHJpYigpIHdpdGggdGhlCj4+IHJldHVybmVkIGNvbmZpZ3MuCj4+
Cj4+IEhlcmUgc3VwcG9ydCBvbiB0aGUgZ2JtIGFuZCBFR0wgaW1wbGVtZW50YXRpb24uCj4+Cj4g
Cj4gSXMgdGhpcyBhIHVzZS1jYXNlIHRoYXQgd29ya3Mgb24geW91ciBwbGF0Zm9ybSB0b2RheT8K
CkFtbG9naWMgZ2F2ZSBtYSBhIGxpYk1hbGkgZm9yIG1pbmlHQk0gd2l0aCBBRkJDIGVuYWJsZWQs
IGJ1dCBJIGhhdmVuJ3QKYmVlbiBhYmxlIHRvIGVuYWJsZSBBRkJDIHlldC4KCj4gCj4gSSB3ZW50
IGFuZCBhc2tlZCBhcm91bmQuIEFuIEFybSBnYm0gaW1wbGVtZW50YXRpb24gc3VwcG9ydGluZyBB
RkJDCj4gd2lsbCByZWplY3QgQUZCQyBhbGxvY2F0aW9ucyBmb3Igb3JkZXJzIG90aGVyIHRoYW4g
KERSTS1jb252ZW50aW9uKQo+IEJHUi4KCkkgdHJ1c3QgeW91IG9uIHRoaXMgcG9pbnQsIHRoYW5r
cyBmb3IgYXNraW5nIGFyb3VuZC4KCk5laWwKCj4gCj4gVGhhbmtzLAo+IC1Ccmlhbgo+IAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
