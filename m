Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD5C1D2BEF
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 11:56:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B6866EB1C;
	Thu, 14 May 2020 09:56:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com
 [IPv6:2607:f8b0:4864:20::943])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29A066EB1C
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 09:56:08 +0000 (UTC)
Received: by mail-ua1-x943.google.com with SMTP id 36so896884uaf.9
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 02:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=iy43TXlu/kla0baWIeJrAEC2zft4yT+Ol3lQzqlWcWw=;
 b=JjBTeITaoyPE7Kb7IqV7SGaxN6fqSP3iqOPgJIi5zp8J9f+GOUIvBB00dG1/TydBPD
 fumiqoIHUKp9GNCx0XGa3YteNWCwwK8ITe6rsnj3qrqy82LYbkd1+MHQJ/PepNB7a6Wr
 0A01z1sNzxCLTiE2vYp1zHp/YlY1iMSHqodeg9G+pzFwXut3puv9oynuTUoZPgYaqSiV
 dqpE1jPw0H72U3ky90horlEVfORBSrgTYcEuJDj+x8qobdbskGJs+ALYCTX0Fr/XM1S4
 dHHBIkfVyzX0N5ywhaO1MXTwP2aoUjB9gkFkq5fy1WX3j8wXgjKnI9M5zhK2DngO95c0
 6sew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iy43TXlu/kla0baWIeJrAEC2zft4yT+Ol3lQzqlWcWw=;
 b=MxSm49WXKA9gnAs4rR0avKyLV6TkFWDRcRvkJwGysrYvHeZCqxCNJC5wB/siIQxrf0
 vvAjRA0FM5K4Qu/uxt2QqtxK1U1OJo/rPJE/4FVDS3x1h/mOv9qtVOFVGM2zF1JaLGH7
 YoiHKrxoFVRB6PIv7hdvnfZwsZWp7z9s2Jaz7ngGvyq8KzFRkXgQz/8pcBtMNsG+swQy
 6XSZe0eiNLXDvfj1cPFVVNyP8MvJ2mqAfwnms4tpjJIw0bAwI3cMiPEZf928PJQfFMkE
 ZrZp3ZKx7JOU8TLXnlTeFOEhbeRbzA9qAavgPpRNF5XIHzmuylz7m+VRJegvo0JLfMIq
 sHRw==
X-Gm-Message-State: AOAM530FRxq+iC8qPu7M+iCzuZNbsljnKfCmIS7XjC2hQsQo0rUco2CU
 JdjAjoEcSLWA+f1GmWlZ2+LEYkQu+PRZINVCXZE=
X-Google-Smtp-Source: ABdhPJwpZTwyM7Tv3eeDi2G29QV6cc+HnDBAB8WHLSBynKsjl1uoWJR0xppsGHZEOViThWFKKGMmHTAd0ZpYMFFE0pE=
X-Received: by 2002:ab0:b93:: with SMTP id c19mr3269039uak.69.1589450167167;
 Thu, 14 May 2020 02:56:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200221173313.510235-1-hdegoede@redhat.com>
 <20200221173313.510235-2-hdegoede@redhat.com>
 <CACvgo51i8_Xyp4=RVfcft9FsasMh4G9ze1jrc0Mg8ObOZCHn5g@mail.gmail.com>
 <20200430145250.GX6112@intel.com>
 <a596b05a-a434-56c7-b3c6-ab070df2f00f@redhat.com>
In-Reply-To: <a596b05a-a434-56c7-b3c6-ab070df2f00f@redhat.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Thu, 14 May 2020 10:53:23 +0100
Message-ID: <CACvgo504dhBMO4fq9MEO8Et5AH0-+Hj00t92mjPEex6o8WRuwg@mail.gmail.com>
Subject: Re: [PATCH resend] drm: Add DRM_MODE_TYPE_USERDEF flag to probed
 modes matching a video= argument
To: Hans de Goede <hdegoede@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Daniel Vetter <daniel@ffwll.ch>
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
Cc: Sean Paul <seanpaul@chromium.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSGFucywKCk9uIFRodSwgMzAgQXByIDIwMjAgYXQgMTU6NTUsIEhhbnMgZGUgR29lZGUgPGhk
ZWdvZWRlQHJlZGhhdC5jb20+IHdyb3RlOgo+Cj4gSGksCj4KPiBPbiA0LzMwLzIwIDQ6NTIgUE0s
IFZpbGxlIFN5cmrDpGzDpCB3cm90ZToKPiA+IE9uIFRodSwgQXByIDMwLCAyMDIwIGF0IDAyOjQ3
OjAwUE0gKzAxMDAsIEVtaWwgVmVsaWtvdiB3cm90ZToKPiA+PiBIaSBIYW5zLAo+ID4+Cj4gPj4g
T24gRnJpLCAyMSBGZWIgMjAyMCBhdCAxNzozMywgSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVk
aGF0LmNvbT4gd3JvdGU6Cj4gPj4+Cj4gPj4+IGRybV9oZWxwZXJfcHJvYmVfYWRkX2NtZGxpbmVf
bW9kZSgpIHByZWZlcnMgdXNpbmcgYSBwcm9iZWQgbW9kZSBtYXRjaGluZwo+ID4+PiBhIHZpZGVv
PSBhcmd1bWVudCBvdmVyIGNhbGN1bGF0aW5nIG91ciBvd24gdGltaW5ncyBmb3IgdGhlIHVzZXIg
c3BlY2lmaWVkCj4gPj4+IG1vZGUgdXNpbmcgQ1ZUIG9yIEdURi4KPiA+Pj4KPiA+Pj4gQnV0IHVz
ZXJzcGFjZSBjb2RlIHdoaWNoIGlzIGF1dG8tY29uZmlndXJpbmcgdGhlIG1vZGUgbWF5IHdhbnQg
dG8ga25vdyB0aGF0Cj4gPj4+IHRoZSB1c2VyIGhhcyBzcGVjaWZpZWQgdGhhdCBtb2RlIG9uIHRo
ZSBrZXJuZWwgY29tbWFuZGxpbmUgc28gdGhhdCBpdCBjYW4KPiA+Pj4gcGljayB0aGF0IG1vZGUg
b3ZlciB0aGUgbW9kZSB3aGljaCBpcyBtYXJrZWQgYXMgRFJNX01PREVfVFlQRV9QUkVGRVJSRUQu
Cj4gPj4+Cj4gPj4+IFRoaXMgY29tbWl0IHNldHMgdGhlIERSTV9NT0RFX1RZUEVfVVNFUkRFRiBm
bGFnIG9uIHRoZSBtYXRjaGluZyBtb2RlLCBqdXN0Cj4gPj4+IGFzIHdlIHdvdWxkIGRvIG9uIHRo
ZSB1c2VyLXNwZWNpZmllZCBtb2RlIHdoZW4gbm8gbWF0Y2hpbmcgcHJvYmVkIG1vZGUgaXMKPiA+
Pj4gZm91bmQuCj4gPj4+Cj4gPj4+IFNpZ25lZC1vZmYtYnk6IEhhbnMgZGUgR29lZGUgPGhkZWdv
ZWRlQHJlZGhhdC5jb20+Cj4gPj4KPiA+PiBJIHdhcyBza2ltbWluZyBhcm91bmQgd3J0IFZpbGxl
J3MgY29tcGFjdCBkcm1fZGlzcGxheV9tb2RlIHNlcmllcyBhbmQKPiA+PiBub3RpY2VkIHRoYXQg
dGhpcyBuZXZlciBsYW5kZWQuCj4gPj4KPiA+PiBUaGUgY29tbWl0IGJyaW5ncyBleHRyYSBjb25z
aXN0ZW5jeSB3aGVuIGRlYWxpbmcgd2l0aCB1c2VyIGRlZmluZWQKPiA+PiBtb2RlcywgYW5kIGlz
Ogo+ID4+IFJldmlld2VkLWJ5OiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEu
Y29tPgo+ID4+Cj4gPj4gVmlsbGUgdGhpcyBtYXkgdHJpdmlhbGx5IGNvbmZsaWN0IHdpdGggeW91
ciB3b3JrLiBJIHN1c3BlY3QgeW91IGNhbiBkbwo+ID4+IHRoZSBob25vdXJzLCBhbmQgYXBwbHkg
b24gdG9wIG9mIHlvdXIgc2VyaWVzPwo+ID4+IFRoYXQgaXMgaWYgeW91IGFncmVlIHdpdGggdGhl
IHBhdGNoLgo+ID4KPiA+IFF1aWNrIGdsYW5jZSBhdCB0aGUgb3JpZ2luYWwgdGhyZWFkIHNheXMg
bWF5YmUgdGhlcmUgd2VyZSBzdGlsbCBzb21lCj4gPiB1c2Vyc3BhY2UgaXNzdWVzIHVucmVzb2x2
ZWQ/IE5vdCBzdXJlLgo+Cj4gSUlSQyB0aGUgdGhyZWFkIGVuZGVkIHdpdGggRGFuaWVsIGFncmVl
aW5nIG9uIHRoZSB1c2Vyc3BhY2UgaW50ZXJmYWNlLAo+IGJ1dCBhc2tpbmcgZm9yIHNvbWUgZG9j
cyBhbmQgbWUgcG9pbnRpbmcgb3V0IHRoYXQgdGhlIHBhdGNoIGFscmVhZHkKPiB1cGRhdGVkL2Ns
YXJpZmllZCB0aGUgZXhpc3RpbmcgZG9jcy4gQWZ0ZXIgdGhhdCB0aGluZ3MgZ290IHF1aWV0Lgo+
Cj4gU28gSSBiZWxpZXZlIHRoYXQgdGhpcyBpcyAoc3RpbGwpIHJlYWR5IHRvIGdvIHVwc3RyZWFt
Lgo+CkhhdmluZyByZWFkIHRocm91Z2ggdGhlIGZ1bGwgZGlzY3Vzc2lvbiwgY291cGxlIG9mIHRp
bWVzLCBJIGJlbGlldmUKeW91J3JlIHNwb3Qgb24uCgpEYW5pZWwgcmVxdWVzdGVkIGRvY3VtZW50
YXRpb24sIHdoaWNoIHRoZSBwYXRjaCBwcm92aWRlcy4gSSdkIHNheQpsZXQncyBwb2tlIGhpbSBv
biBJUkMgYSBmZXcgdGltZXMsIGlmIGhlIGRvZXNuJ3Qgb2JqZWN0IGxldCdzIHB1c2ggaXQ/Cgot
RW1pbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
