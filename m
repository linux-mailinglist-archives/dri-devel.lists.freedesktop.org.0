Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFCC2ED320
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 16:01:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 261DC89D46;
	Thu,  7 Jan 2021 15:01:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87D396E48B
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 15:01:12 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id f132so7594943oib.12
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jan 2021 07:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PTysexsxSqJC29Vb8h7mLBT6ZsCECBHe6cdxRU8J9Lg=;
 b=CsR2Sqa7eNvmW4EhoN5JHJdeAKcrE4wLidwXmNZq351BZ0L/ugmXY5enq05gk+gaPj
 FrfDNYbmu7plSI2OZVhHAfwnRjNq+awDFiaBartZsCHEgE8I+2QORG7PaEZC6YBZNWGc
 1JQuoq9Jaq+16oaP3GNwDtqQ4Ck9CEDebUiTwwoZbp/Sj4dNuAvI+m3DKen4vg4F8qLT
 Iv75daCGiKKmR+O+oIW1UL6DtX6ZqcDLuyI8XwK16/ebfa0UDBYe1OTcO/0E8ow7Ljiu
 m0C+qbqN78u9XDrPqITzT0+e8+qFsdbJyyl461FyP2MexLu8+X474dmGETNDwQ8Lk4VE
 cnhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PTysexsxSqJC29Vb8h7mLBT6ZsCECBHe6cdxRU8J9Lg=;
 b=G0eDiH8CE6zHj1kdYo4lWyWv+WyP6/Top4+5ozPGXTepOb7BqlYFgQ4RLAS6XD8fAx
 70GTSUJEBhFRIQAvBI6iiIZOmKztiaqXFtwour+dIbGQZzUkbKH0hxvKdOZRqmPHP9OL
 qGE8bZAScU9WYwc7a2qcz3cqicfnTBAJqwkJNLhOS+BS119eepaMxZaQu6e74OXdRk1+
 X+K5kKFOpFt+RRhT9GaxVwW2+picdCgIYXoQ4XeGK2LfrQWMqbuE+rsc8sZatrGVeY2R
 ut+FsVyoCBz5ful3xHLRI5ZvLPS8oc/TftyaGe9NP1VepH3icM5lxfLBg0/0qGhQjQrt
 4qjA==
X-Gm-Message-State: AOAM530bCjfObAdIam8Os7dNrYaBr4JXtDhINQEvtlthJb0bqxYcgOLF
 pmKOlu10uNrVKTwxro4qP/H1Bdzd/rj/8UtVDU+AJasj
X-Google-Smtp-Source: ABdhPJycWuV3z1T3Lh0lLd1EAyJ95vAwErlWhYxfsKouHJY+prmO7WrCetM+/maFU75iGi0/eaMrrkPRNRpeRYBcUW4=
X-Received: by 2002:aca:6202:: with SMTP id w2mr6393683oib.5.1610031671860;
 Thu, 07 Jan 2021 07:01:11 -0800 (PST)
MIME-Version: 1.0
References: <20200621020703.864-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200621020703.864-2-laurent.pinchart+renesas@ideasonboard.com>
 <1e5f7ae2-8b41-dcda-4306-7751e8fbf02b@amd.com>
 <20200622092933.GY20149@phenom.ffwll.local>
 <20200717022716.GA1845@pendragon.ideasonboard.com>
 <843d7b34-418d-991b-d1d9-0ad5089d20a4@amd.com>
 <X9ltvZIEHjiYoLVp@pendragon.ideasonboard.com>
 <MN2PR12MB4488A356AC7AF9FD844F0F89F7C50@MN2PR12MB4488.namprd12.prod.outlook.com>
 <X9ooRDIL3vu6VfRS@kroah.com>
In-Reply-To: <X9ooRDIL3vu6VfRS@kroah.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 7 Jan 2021 10:01:00 -0500
Message-ID: <CADnq5_Ngd6A4-RMvXX7oofLLayK9YBm1+7-GakDrjtoBtnXW2w@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm: uapi: Use SPDX in DRM drivers uAPI headers
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>, Thierry Reding <thierry.reding@gmail.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Gerd Hoffmann <kraxel@redhat.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, Thomas Gleixner <tglx@linutronix.de>,
 Sean Paul <sean@poorly.run>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBEZWMgMTYsIDIwMjAgYXQgMTA6MzAgQU0gR3JlZyBLcm9haC1IYXJ0bWFuCjxncmVn
a2hAbGludXhmb3VuZGF0aW9uLm9yZz4gd3JvdGU6Cj4KPiBPbiBXZWQsIERlYyAxNiwgMjAyMCBh
dCAwMjo1MjoyNVBNICswMDAwLCBEZXVjaGVyLCBBbGV4YW5kZXIgd3JvdGU6Cj4gPiBbQU1EIFB1
YmxpYyBVc2VdCj4gPgo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+ID4gPiBGcm9t
OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Cj4g
PiA+IFNlbnQ6IFR1ZXNkYXksIERlY2VtYmVyIDE1LCAyMDIwIDk6MTUgUE0KPiA+ID4gVG86IEtv
ZW5pZywgQ2hyaXN0aWFuIDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+Cj4gPiA+IENjOiBEYW5p
ZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+OyBMYXVyZW50IFBpbmNoYXJ0Cj4gPiA+IDxsYXVy
ZW50LnBpbmNoYXJ0K3JlbmVzYXNAaWRlYXNvbmJvYXJkLmNvbT47IGRyaS0KPiA+ID4gZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBEYXZlIEFpcmxpZSA8YWlybGllZEBnbWFpbC5jb20+OyBH
cmVnIEtyb2FoLQo+ID4gPiBIYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz47IFRo
b21hcyBHbGVpeG5lcgo+ID4gPiA8dGdseEBsaW51dHJvbml4LmRlPjsgRGV1Y2hlciwgQWxleGFu
ZGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPjsKPiA+ID4gUm9iIENsYXJrIDxyb2JkY2xh
cmtAZ21haWwuY29tPjsgU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+OyBCZW4KPiA+ID4gU2tl
Z2dzIDxic2tlZ2dzQHJlZGhhdC5jb20+OyBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNv
bT47Cj4gPiA+IFRoaWVycnkgUmVkaW5nIDx0aGllcnJ5LnJlZGluZ0BnbWFpbC5jb20+OyBFcmlj
IEFuaG9sdCA8ZXJpY0BhbmhvbHQubmV0PjsKPiA+ID4gVk13YXJlIEdyYXBoaWNzIDxsaW51eC1n
cmFwaGljcy1tYWludGFpbmVyQHZtd2FyZS5jb20+OyBUaG9tYXMKPiA+ID4gSGVsbHN0cm9tIDx0
aGVsbHN0cm9tQHZtd2FyZS5jb20+Cj4gPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMi8zXSBkcm06
IHVhcGk6IFVzZSBTUERYIGluIERSTSBkcml2ZXJzIHVBUEkgaGVhZGVycwo+ID4gPgo+ID4gPiBI
aSBDaHJpc3RpYW4sCj4gPiA+Cj4gPiA+IE9uIEZyaSwgSnVsIDE3LCAyMDIwIGF0IDA0OjA1OjQy
UE0gKzAyMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gPiA+ID4gQW0gMTcuMDcuMjAgdW0g
MDQ6Mjcgc2NocmllYiBMYXVyZW50IFBpbmNoYXJ0Ogo+ID4gPiA+ID4gT24gTW9uLCBKdW4gMjIs
IDIwMjAgYXQgMTE6Mjk6MzNBTSArMDIwMCwgRGFuaWVsIFZldHRlciB3cm90ZToKPiA+ID4gPiA+
PiBPbiBNb24sIEp1biAyMiwgMjAyMCBhdCAwOTo1ODo0NEFNICswMjAwLCBDaHJpc3RpYW4gS8O2
bmlnIHdyb3RlOgo+ID4gPiA+ID4+PiBBbSAyMS4wNi4yMCB1bSAwNDowNyBzY2hyaWViIExhdXJl
bnQgUGluY2hhcnQ6Cj4gPiA+ID4gPj4+PiBNb3N0IG9mIHRoZSBEUk0gZHJpdmVycyB1QVBJIGhl
YWRlcnMgYXJlIGxpY2Vuc2VkIHVuZGVyIHRoZSBNSVQKPiA+ID4gPiA+Pj4+IGxpY2Vuc2UsIGFu
ZCBjYXJyeSBjb3BpZXMgb2YgdGhlIGxpY2Vuc2Ugd2l0aCBzbGlnaHQgdmFyaWF0aW9ucy4KPiA+
ID4gPiA+Pj4+IFJlcGxhY2UgdGhlbSB3aXRoIFNQRFggaGVhZGVycy4KPiA+ID4gPiA+Pj4gTXkg
cGVyc29uYWwgb3BpbmlvbiBpcyB0aGF0IHRoaXMgaXMgYSByZWFsbHkgZ29vZCBpZGVhLCBidXQg
bXkKPiA+ID4gPiA+Pj4gcHJvZmVzc2lvbmFsIGlzIHRoYXQgd2UgbmVlZCB0aGUgYWNrbm93bGVk
Z21lbnQgZnJvbSBvdXIgbGVnYWwKPiA+ID4gZGVwYXJ0bWVudCBmb3IgdGhpcy4KPiA+ID4gPiA+
PiBJIHRoaW5rIG9mZmljaWFsIGFjayBmcm9tIGFtZCBvbiBmaXJzdCBwYXRjaCwgZXNwZWNpYWxs
eSB0aGUgLnJzdAo+ID4gPiA+ID4+IHNuaXBwZXQsIHdvdWxkIGJlIHJlYWxseSBnb29kIGluZGVl
ZC4KPiA+ID4gPiA+IEFueSB1cGRhdGUgb24gdGhpcyBvbmUgPwo+ID4gPiA+Cj4gPiA+ID4gU29y
cnkgdG90YWxseSBmb3Jnb3QgdG8gZm9yd2FyZCB0aGlzIGJlY2F1c2UgSSB3YXMgd2FpdGluZyBm
b3Igc3BsaXQKPiA+ID4gPiB1cCBwYXRjaGVzLgo+ID4gPiA+Cj4gPiA+ID4gR29pbmcgdG8gZG8g
c28gcmlnaHQgbm93Lgo+ID4gPgo+ID4gPiBIYXMgdGhlcmUgYmVlbiBhbnkgdXBkYXRlID8gOi0p
Cj4gPgo+ID4gQU1EIGxlZ2FsIHJlcXVpcmVzIHRoZSBmdWxsIGxpY2Vuc2UuCj4KPiBVbSwgd2hh
dD8gIFBsZWFzZSBsZXQgbWUgdGFsayB0byB0aGVtIGFib3V0IHRoaXMsIGl0J3Mgbm90IG9rIGZv
ciBvbmUKPiBpbmRpdmlkdWFsIGNvbXBhbnksIG91dCBvZiA0NTArLCB0byBzb21laG93IGRlY2lk
ZSB0byBkbyBzb21ldGhpbmcKPiBkaWZmZXJlbnQuCj4KPiBQbGVhc2UgcHV0IHlvdXIgbGF3eWVy
cyBpbiBjb250YWN0IHdpdGggbWUgYW5kIEkgd2lsbCBoYXZlIHRoZW0gZGlzY3Vzcwo+IGl0IHdp
dGggdGhlIHByb3BlciBsYXd5ZXJzIG9uIG91ciBzaWRlLgoKQWZ0ZXIgbW9yZSBkaXNjdXNzaW9u
LCB0aGUgbGF3eWVycyBoYXZlIGFsbG93ZWQgdXMgdG8gdXNlIHRoZSBTUERYIGxpY2Vuc2VzIG5v
dy4KCkFsZXgKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
