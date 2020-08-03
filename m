Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1EA23A019
	for <lists+dri-devel@lfdr.de>; Mon,  3 Aug 2020 09:13:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03EA56E20F;
	Mon,  3 Aug 2020 07:13:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 942FD6E20F
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Aug 2020 07:13:11 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id l4so37440522ejd.13
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Aug 2020 00:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0tCypFa5nH4dX6/DxhvF+6Kg9G/1gIvxA6YWz0+vHk0=;
 b=sAIWgR5y3LVCQAHtUz0fZ+NO/Rgdrpfrt2MMnDbQRcedFyj+9ANgB408Rg5omDQ/dA
 cH7C5N/IfCT0JmLhZDF/rdAYKAyzdaLnc0Z7a6ANuyZ8zVcU5KfAPQDgptBJb8PFH8i0
 P8TXM0W2QNK8WB61oZZSrjxVM0stnQosDFAYG7WvGchOMX3q9to+qfqzKyPHJ880OzaT
 jiLlEJFXQlzt6B6kxwHZPuupv4JCjWl0eGqt+OjL8V2NYtrq70A33iuFZKzGXth3XGRF
 qCq8JesfSt5U414dXt359un+n7R6Mfmqc6NpF104+nm5a8CesHafPwkdg3pkdeIV74DS
 ANmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0tCypFa5nH4dX6/DxhvF+6Kg9G/1gIvxA6YWz0+vHk0=;
 b=pe8NmK9slOmMKvJiBRgHspEXIFnxYH06EDTjxQnJfqixin6lmfMyHTorgIDRqs4zsC
 9hXxoNhhfhq5jBbV3WVFoZOcCLfPwZLgX9LMBo4qDEwXSQB+plBUfzyABNy+8HqAZNmE
 ClZ6J2tFPEm4y+AoTQPHGe1pCGRL5u7g5RJOcVA8X3NZwXBO67jNisPyCYDIQx/61lyG
 VQIEAnzBdhqn9m9V0AKX5OWlLMcJnKjkaINQXs5iqcIqSZHcGdP2xkscGUcagMP8NWSX
 gvbdtsDjg6ly1glyDaiuHYnlc90aZ9JqBx9mkAZjQRSa/rs8uMdYL309LkJ7JzT7c/Dm
 KsJg==
X-Gm-Message-State: AOAM530BQmYE4BPq0EbrHucQughBnSLU6X3KsrebK762hxpHs7kcvYza
 zM9bIEIhWVPIdVJ1uS4Q0DcOCY3uceu1h14yLjw=
X-Google-Smtp-Source: ABdhPJygTvEfKPlvyANbNnMrbbrTjM91k9nC9maJVEUMYyAa1knGViLmhUywzmbGx+UYmrtxkLh8FlDsKG4xAIiK6ss=
X-Received: by 2002:a17:906:13d8:: with SMTP id
 g24mr14836247ejc.317.1596438790084; 
 Mon, 03 Aug 2020 00:13:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200731040520.3701599-1-airlied@gmail.com>
 <e4a040b5-8033-1f1d-7dbc-02341c0927e9@amd.com>
In-Reply-To: <e4a040b5-8033-1f1d-7dbc-02341c0927e9@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 3 Aug 2020 17:12:58 +1000
Message-ID: <CAPM=9tyqgtP3_CXSc_450X_Uuw5ZdUM1DEfvU3vff9kD5VBrKw@mail.gmail.com>
Subject: Re: [PATCH 00/49] ttm mem manager refactoring.
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Roland Scheidegger <sroland@vmware.com>, Ben Skeggs <bskeggs@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAzMSBKdWwgMjAyMCBhdCAxOToxNywgQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFu
LmtvZW5pZ0BhbWQuY29tPiB3cm90ZToKPgo+IEFtIDMxLjA3LjIwIHVtIDA2OjA0IHNjaHJpZWIg
RGF2ZSBBaXJsaWU6Cj4gPiBJIHN0YXJ0ZWQgcHVsbGluZyBvbiBhIHRocmVhZCwgYW5kIGl0IGxl
ZCBtZSBkb3duIGEgaG9sZS4KPgo+IFdlIG1pZ2h0IHdhbnQgdG8gbWFrZSB0aGF0IGhvbGUgZXZl
biBiaWdnZXIgOikKPgo+IEhvdyBhYm91dCB3ZSByZW5hbWUgdGhlIHR0bV9tZW1fcmVnIGludG8g
dHRtX3Jlc291cmNlIGFuZAo+IHR0bV9tZW1fdHlwZV9tYW5hZ2VyIGludG8gdHRtX3Jlc291cmNl
X21hbmFnZXIuCj4KCmh0dHBzOi8vY2dpdC5mcmVlZGVza3RvcC5vcmcvfmFpcmxpZWQvbGludXgv
bG9nLz9oPXR0bS1yZWZhY3Rvci1tZW0tbWFuYWdlci1yZW5hbWUKCmhhcyB0aGUgc2VyaWVzIHdp
dGggc29tZSBzdHVmZiBtb3ZlZCBhcm91bmQgYnV0IDMgYWRkZWQgcmVuYW1lIHBhdGNoZXMKYXQg
dGhlIGVuZC4KCnR0bV9ib19tYW5hZ2VyIC0+IHR0bV9yYW5nZV9tYW5hZ2VyCnR0bV9tZW1fdHlw
ZV9tYW5hZ2VyIC0+IHR0bV9yZXNvdXJjZV9tYW5hZ2VyCnR0bV9tZW1fcmVnIC0+IHR0bV9yZXNv
dXJjZS4KClRoZSBvbmUgc2xpZ2h0bHkgbWVzc3kgb25lIGlzIHdlIGhhdmUgYSBsb3Qgb2YgdHRt
X21lbV9yZWcgKm1lbQooKm9sZF9tZW0gb3IgKm5ld19tZW0pLgogSSBkaWRuJ3QgdHJ5IGFuZCBy
ZW5hbWUgdGhvc2UsIGJ1dCBJIGNvdWxkIHByb2JhYmx5IGRvIGl0IGlmIHdlCmRlY2lkZWQgaXQg
d2FzIHJlYWxseSBuZWNlc3NhcnkuCgpJJ3ZlIGdvdCB0byBnbyBiYWNrIGFuZCBmb2xkIGluIHNv
bWUgcmV2aWV3IGNvbW1lbnRzIGZyb20gcGVvcGxlIHlldAphbmQgYWRkIHItYnMgSSdsbCB0cnkg
YW5kIGdldCB0byB0aGF0IHRvbW9ycm93LgoKRGF2ZS4KCj4gTmVpdGhlciBhbWRncHUncyBPQS9H
V1MgcmVzb3VyY2VzIG5vciB0aGUgSURzIGluIFZNR0ZYIGFyZSByZWFsbHkgbWVtb3J5Lgo+Cj4g
SW4gdGhlIGxvbmcgdGVybSBJIGFsc28gd2FudCB0byBtb3ZlIHRoZSB3aG9sZSBhZGRyZXNzIGhh
bmRsaW5nIGludG8KPiBlYWNoIGJhY2tlbmQuCj4KPiBHb2luZyB0byBzZW5kIGNvbW1lbnRzIG9u
IHRoZSBpbmRpdmlkdWFsIHBhdGNoZXMgYXMgd2VsbC4KPgo+ID4gVGhpcyBzZXJpZXMgcmVmYWN0
b3JzIHRoZSB0dG0gdHRtX21lbV90eXBlX21hbmFnZXIgb2JqZWN0IGludG8KPiA+IGEgZHJpdmVy
IG93bmVkLCBhbGxvY2F0ZWQsIHN1YmNsYXNzYWVkIG9iamVjdC4KPiA+Cj4gPiBJdCBzdGFydHMg
d2l0aCB0d28gbWlub3IgZml4ZXMgZm9yIHNvbWUgYmFkIGFzc3VtcHRpb25zIGluIHR3byBkcml2
ZXJzLgo+ID4KPiA+IEVuYWJsZXMgYSBuZXcgaW5pdCBwYXRoLCBwb3J0cyBhbGwgdGhlIGRyaXZl
cnMgdG8gdGhlIG5ldyBpbml0Cj4gPiBwYXRoLCBhbmQgY2xlYW5zIHVwIHRoZSBvbGQgaW5pdCBw
YXRoLgo+ID4gRW5hYmxlcyBhIG5ldyB0YWtlZG93biBwYXRoLCBwb3J0cyBhbGwgdGhlIGRyaXZl
cnMgdG8gdGhlIG5ldyB0YWtlZG93bgo+ID4gcGF0aCwgYW5kIGNsZWFucyB1cCB0aGUgb2xkIHRh
a2Vkb3duIHBhdGgKPiA+IFdyYXBzIGFsbCBhY2Nlc3MgdG8gdGhlIG1lbW9yeSBtYW5hZ2VycyBp
biB0aGUgYm9fZGV2aWNlIGluIGEgd3JhcHBlcgo+ID4gYWNyb3NzIGFsbCBkcml2ZXJzLgo+ID4g
TWFrZSBkZWJ1ZyBjYWxsYmFjayBvcHRpb25hbAo+ID4gRW5hYmxlcyBkcml2ZXIgdG8gcHJvdmlk
ZSB0aGVpciBvd24gbWVtIG1hbmFnZXIgb2JqZWN0cwo+ID4gU3ViY2xhc3NlcyB0aGUgb2JqZWN0
cyBpbiBhbGwgZHJpdmVycyBhbmQgbWFrZXMgdGhlbSBpbnRvIGRyaXZlciBvd25lZCBvYmplY3QK
PiA+IERyb3BzIHRoZSBib19kZXZpY2UgYXJyYXlzIG9mIHBvaW50ZXJzLCBhbmQgc29tZSB1bm5l
ZWRlZCBsaW5rcyBhbmQKPiA+IHN0cnVjdCBtZW1iZXJzCj4gPiBDbGVhbnMgdXAgb25lIGFwaS4K
PiA+Cj4gPiBJIHRoaW5rIEknZCBwcm9iYWJseSB3YW50IHRvIG1lcmdlIGFsbCB0aGlzIHZpYSBk
cm0tbWlzYywgc28gaWYgSSBjYW4gY29sbGVjdAo+ID4gYWNrcy9yLWIgZnJvbSBkcml2ZXIgbWFp
bnRhaW5lcnMgdGhhdCB3b3VsZCBiZSBnb29kLgo+ID4KPiA+IFRoaXMgaXMgYWxzbyBiYXNlZCBv
biBDaHJpc2l0YW4ncyB3b3JrIHRvIHJlbW92ZSBpbml0X21lbV90eXBlLCBzbyBpdCB3b24ndAo+
ID4gYXBwbHkgdW50aWwgaGUncyBmaW5pc2hlZCBnZXR0aW5nIGFsbCBvZiB0aGF0IGludG8gZHJt
LW1pc2MuCj4KPiBQcmVwYXJpbmcgdG8gcHVzaCB0aGF0IHRvIGRybS1taXNjLW5leHQganVzdCBu
b3cuCj4KPiBSZWdhcmRzLAo+IENocmlzdGlhbi4KPgo+ID4KPiA+IGh0dHBzOi8vbmFtMTEuc2Fm
ZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwczolMkYlMkZjZ2l0LmZyZWVk
ZXNrdG9wLm9yZyUyRn5haXJsaWVkJTJGbGludXglMkZsb2clMkYlM0ZoJTNEdHRtLXJlZmFjdG9y
LW1lbS1tYW5hZ2VyJmFtcDtkYXRhPTAyJTdDMDElN0NjaHJpc3RpYW4ua29lbmlnJTQwYW1kLmNv
bSU3Q2FhMzI1MTJhY2Y5ZjRiZjQ1NWVmMDhkODM1MDZmOWQyJTdDM2RkODk2MWZlNDg4NGU2MDhl
MTFhODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYzNzMxNzY1MTM2MTMwMjU4MyZhbXA7c2RhdGE9MnNR
dDRBNDhPRGwwTnE0UDIxWUczdlJOZGhrRFpjWnAwWEhrUTkzMFNBSSUzRCZhbXA7cmVzZXJ2ZWQ9
MAo+ID4gaXMgdGhlIHRyZWUgSSd2ZSBidWlsdCB0aGlzIG9uIHRvcCBvZmYsIHNvIGl0J3MgcHJv
YmFibHkgZ29pbmcgdG8gZ2V0IHJlYmFzZWQKPiA+IGJ1dCB0aGUgY29kZSBzaG91bGQgc3RheSBt
b3N0bHkgdGhlIHNhbWUuCj4gPgo+ID4gSSd2ZSBkb25lIHNvbWUgYm9vdCB0ZXN0aW5nIG9uIG5v
dXZlYXUsIGFuZCBJIGhvcGUgdG8gdGVzdCBpdCBvbiB2bXdnZnggYW5kCj4gPiBhbWRncHUgc29v
bi4KPiA+Cj4gPiBEYXZlLgo+ID4KPiA+Cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
