Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBFAA2756
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2019 21:34:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8386E6E0E4;
	Thu, 29 Aug 2019 19:34:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E29B26E0E4;
 Thu, 29 Aug 2019 19:34:10 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id z11so4615505wrt.4;
 Thu, 29 Aug 2019 12:34:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1N34gYdPkLLIbcKdQcv3uxi03Ss8fXakN9zb/moLnxI=;
 b=O5kKszWTyDYJ4HdQNK43CHvlcrNgIfWXsjuNTl9bk2vNbLFaFzTZUmxgye6b5ZtaCe
 ejTqshbyR3L6B70cMhJk3C30xCnwvz8bZUWVeG8E9puXP1VzlpIIDkeZHF6NUZxShmwF
 maAwaPKydRuEptm9F1aQMtlDjTRbjYyK8IQWROIzsD3wlaaKT/dZqTDEchfLTMAsHAtx
 MfxdcSomfX5ErASdi86hmM64rTsX1WG/JOAdaRAy/5BjuXMP6thEmHKFPUSV/HfMxHZN
 4MiVDizusJrLNvu7hM/a4mIx2adKX4/WsNu43/uNHqBBJ7Y8j68WDCqTMzRszD3gjjDM
 rMUg==
X-Gm-Message-State: APjAAAWzUSx+f9EHy8M/j4FH9cE3ZPIIEtg0kTGYFUy87o+GSgfglWCU
 l0zJgQlNFeym/kmiGa3abcaml/VeXxceFT9Uncc=
X-Google-Smtp-Source: APXvYqxwrZ1u6ImHf0Gv2qJniEPZ65qswfArl+sDFyODzyrCZfIoTrALnNDQahxpCTYCVXFFxc0vUIISpRxnPjczFyU=
X-Received: by 2002:adf:e286:: with SMTP id v6mr13468104wri.4.1567107249413;
 Thu, 29 Aug 2019 12:34:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190829114806.7dc21753@endymion>
In-Reply-To: <20190829114806.7dc21753@endymion>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 29 Aug 2019 15:33:57 -0400
Message-ID: <CADnq5_P8sTAQwkFedV=H=H27wt3LWwuB6nYzUuB3NDbFncdyaA@mail.gmail.com>
Subject: Re: Couldn't read Speaker Allocation Data Block/SADs
To: Jean Delvare <jdelvare@suse.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=1N34gYdPkLLIbcKdQcv3uxi03Ss8fXakN9zb/moLnxI=;
 b=X6uiKQcxB/dp07HvOse667mhBzwqY3RQYw2yUBvMhhkzCeXRkK2yYEKhAK0eHx9oZM
 VKt1GFIm3TglmmA+qXQdxwl3Kdrmu/KKr8wK1CdjB6CsSFdNgDbTkDbWInuAeFXmDydH
 iKR+eyxTrsD0ImAoneAfXHpST/aW/ZeNqMAqQJZNr/6FBmLqv4murGQK8+hWj9sWOmGk
 OXxxBV0/1Dm9CGrq9k51/v18JrUtzQcSA/IVed8ghZVMVmUP5cs3RFq4+gKfWY2I+Jj2
 Vn4EWUksIOwJWy6VNlzNGHlg9gTtF7gcjRrTd4rowu7ZOnw/MsGNnddBjMmxDwc+tSxu
 zS0w==
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig=5C?= <christian.koenig@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMjksIDIwMTkgYXQgOToxMSBBTSBKZWFuIERlbHZhcmUgPGpkZWx2YXJlQHN1
c2UuZGU+IHdyb3RlOgo+Cj4gSGkgYWxsLAo+Cj4gU2luY2UgSSBjb25uZWN0ZWQgbXkgRGVsbCBk
aXNwbGF5IG9uIG15IFJhZGVvbiBSNSAyNDAgKE9sYW5kKSBjYXJkIG92ZXIKPiBEaXNwbGF5UG9y
dCBpbnN0ZWFkIG9mIFZHQSwgSSBnZXQgdGhlIGZvbGxvd2luZyBlcnJvciBtZXNzYWdlcyBsb2dn
ZWQgYXQgZXZlcnkgYm9vdDoKPgo+IFtkcm06ZGNlX3Y2XzBfZW5jb2Rlcl9tb2RlX3NldCBbYW1k
Z3B1XV0gKkVSUk9SKiBDb3VsZG4ndCByZWFkIFNwZWFrZXIgQWxsb2NhdGlvbiBEYXRhIEJsb2Nr
OiAtMgo+IFtkcm06ZGNlX3Y2XzBfZW5jb2Rlcl9tb2RlX3NldCBbYW1kZ3B1XV0gKkVSUk9SKiBD
b3VsZG4ndCByZWFkIFNBRHM6IC0yCj4KPiBJIGFsc28gc2VlIHRoZW0gZWFjaCB0aW1lIHRoZSBk
aXNwbGF5IHdha2VzIHVwIGFuZCBhbHNvIG9uIFZUIGNoYW5nZS4KPiBUaGlzIGlzIHdpdGgga2Vy
bmVsIDUuMi45Lgo+Cj4gVGhpcyB3YXMgYWxzbyByZXBvcnRlZCBhcyBidWcgIzEwNzgyNSBieSBQ
YXVsIE1lbnplbDoKPiBodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9p
ZD0xMDc4MjUKPgo+IEVycm9yIC0yIGlzIEVOT0VOVCAoTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9y
eSkuIFRoZSBkcml2ZXIgcXVlcmllcyB0aGUKPiBkaXNwbGF5IGZvciBhdWRpby1yZWxhdGVkIGlu
Zm9ybWF0aW9uLCB3aGlsZSBteSBkaXNwbGF5IGRvZXMgbm90IGhhdmUKPiBzcGVha2VycyBub3Ig
aGVhZHNldCBjb25uZWN0b3IuCj4KPiBJIHN1c3BlY3QgdGhhdCB0aGUgImVycm9yIiBpcyBwcmV0
dHkgbXVjaCBleHBlY3RlZCBpbiB0aGlzIGNhc2UgYW5kIHRoZQo+IGRyaXZlciBpcyBiZWluZyB0
b28gdmVyYm9zZSBhYm91dCBpdC4gRWl0aGVyIHRoZSBjYWxsaW5nIGNvZGUgc2hvdWxkCj4gY29u
c2lkZXIgLUVOT0VOVCBhcyBhIG5vbi1lcnJvciAoMTEgY2FsbGluZyBzaXRlcyB0byBmaXgpLCBv
ciB0aGUKPiBoZWxwZXIgZnVuY3Rpb25zIHNob3VsZCBzaW1wbHkgcmV0dXJuIDAgd2hlbiBubyBh
dWRpby1yZWxhdGVkIGRhdGEgaXMKPiBhdmFpbGFibGUgZnJvbSB0aGUgZGlzcGxheSAoMiBmdW5j
dGlvbnMgdG8gZml4LCBjYWxsaW5nIHNpdGVzIG1heSBoYXZlCj4gdG8gYmUgaW5zcGVjdGVkIHRv
byBhcyBzb21lIHRyZWF0IDAgYXMgYW4gZXJyb3IgdG9vLCB3aGljaCBzZWVtcwo+IGluY29ycmVj
dCB0byBtZSkuCj4KPiBPcHRpb24gMSBzZWVtcyBjbGVhbmVyIHRvIG1lLCBidXQgSSBkb24ndCBr
bm93IGlmIHRoZXJlIGNvdWxkIGJlCj4gbGVnaXRpbWF0ZSByZWFzb25zIHRvIGRpc3Rpbmd1aXNo
IGJldHdlZW4gbm8gYXVkaW8gaW5mb3JtYXRpb24gYmxvY2sKPiBmcm9tIGRpc3BsYXkgYW5kIGVt
cHR5IGF1ZGlvIGluZm9ybWF0aW9uIGZyb20gZGlzcGxheSBpbiB0aGUgZnV0dXJlLgo+Cj4gV2hh
dCBkbyB5b3UgdGhpbms/CgpGZWVsIGZyZWUgdG8gcmVtb3ZlIHRoZSBtZXNzYWdlIG9yIG1ha2Ug
aXQgZGVidWcgb25seS4KClRoYW5rcyEKCkFsZXgKCj4KPiBUaGFua3MsCj4gLS0KPiBKZWFuIERl
bHZhcmUKPiBTVVNFIEwzIFN1cHBvcnQKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4gYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZngKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
