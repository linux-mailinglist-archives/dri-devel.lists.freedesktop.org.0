Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 736BD26BDFB
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 09:30:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 042BD6E2FF;
	Wed, 16 Sep 2020 07:30:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 417D56E2FF
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 07:30:36 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id gr14so8930876ejb.1
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 00:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7RIGf9h6dDPWyLZTLeTzeO7hVWN+gA8tHzVpWF0AEcw=;
 b=i4MQpVGDrUnRJ8PbaSizdYCQl87PGP2D0ndZdHXIgE3DSTlqg7UvNH7Pg5Kykvwm3B
 mHAT1yDmZqrCn7Kdk68FmwBmBAnmkcw6ICZr0n5xxU0HNUbYi9sZfOODr5m6Ic6x2DTu
 VGtM5E99mFvQ+DlxHub5Ai2tqckX9bUZetP8ftqgyGLs5y8Nvd3JmkmSRX58ReHCQiQ3
 +GV8cR3Khsi39s8ui4cTYQG1cAPtypY5A1AvCDvL/01IgJ7SC7CrAVih9NoU3Mf34oTM
 G8O3J5ZjhsdRpfykYj7MhPTG+te3imGP1fK8cZKy+8dqB2EUdSmD59hrX03WO5R+/FDD
 KRQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7RIGf9h6dDPWyLZTLeTzeO7hVWN+gA8tHzVpWF0AEcw=;
 b=DbU5JWiksES4EJ7Y0YgRJDvfqSBFR+LoSXq2TKo7VpSHDaVjH3t2NRoe3BeYeSctqU
 2D/Qsybd5McicBj5DMH1dWWocE8XMwssDzczR8xsrQJX0yPRgXTuzOvAxNXCo2oog0Wx
 nxefe63HCPVdmj9BPqlC2Iw1Buw0OyAO6SdGhq/Q8FuvXF72xHX+2ml53rbjRk3o4Oo9
 iaZNbjx9nxfHg4jP5/l1nWHKszpAZp1z7URL3bxAazBNF8hCHyLuAR0PCM1GvUqZPIAw
 imheDi1sPXidnBTuXyYv18hiuun48b6uhTa3vmBTf2L6dQh/7ooPQZZb9fO1IDaMstUV
 1LDw==
X-Gm-Message-State: AOAM530mbrkm59MJLhwn0GgQ1nlgF6fttt1YPcVTDexi46ywx3KXIqXC
 uchOBDqunTOy+AVRJIG6PoUp8+Fn47JyAwLLQy12oO7R
X-Google-Smtp-Source: ABdhPJxBVelfQNggKV6XtOr3xDk6aA2uMUlUPgXwASgRLQbNEdMt6+RvZ1LaR0pCOgAAz3I/lEF8VYHC9Wd96LoVY1w=
X-Received: by 2002:a17:906:2b83:: with SMTP id
 m3mr6228181ejg.456.1600241433828; 
 Wed, 16 Sep 2020 00:30:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9txcrHC77Quj6ufUHn0FD1-7b4YKO2MWFZGwJy8Tmj1i7g@mail.gmail.com>
 <6b59373e-c4e0-76b5-ffa7-d4bb954a1ffb@gmail.com>
 <CAPM=9tzXsGqnbkUH30vUHd7zyenCNj=ikVjx6P1qWq9dx0jiEg@mail.gmail.com>
 <CAPM=9tySxEnV+1q=hyu4c5tSX35ZJr6TBKwfnUkQZbuw=XkrLA@mail.gmail.com>
 <85097575-b713-095d-7c09-9e4d02f5fbda@shipmail.org>
 <fb34ccb6-56b6-319f-5a25-05af658b593a@amd.com>
In-Reply-To: <fb34ccb6-56b6-319f-5a25-05af658b593a@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 16 Sep 2020 17:30:22 +1000
Message-ID: <CAPM=9ty=EwHO_PpxuAS0apOeLPL=sYk1tXo6F=ViEqR00ABTvQ@mail.gmail.com>
Subject: Re: some half-baked ttm ideas
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
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m_=28Intel=29?= <thomas_os@shipmail.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAxNiBTZXAgMjAyMCBhdCAxNjo1OCwgQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFu
LmtvZW5pZ0BhbWQuY29tPiB3cm90ZToKPgo+IEFtIDE2LjA5LjIwIHVtIDA4OjQ0IHNjaHJpZWIg
VGhvbWFzIEhlbGxzdHLDtm0gKEludGVsKToKPiA+Cj4gPiBPbiA5LzE2LzIwIDY6MjggQU0sIERh
dmUgQWlybGllIHdyb3RlOgo+ID4+IE9uIFdlZCwgMTYgU2VwIDIwMjAgYXQgMTQ6MTksIERhdmUg
QWlybGllIDxhaXJsaWVkQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPj4+IE9uIFdlZCwgMTYgU2VwIDIw
MjAgYXQgMDA6MTIsIENocmlzdGlhbiBLw7ZuaWcKPiA+Pj4gPGNrb2VuaWcubGVpY2h0enVtZXJr
ZW5AZ21haWwuY29tPiB3cm90ZToKPiA+Pj4+IEhpIERhdmUsCj4gPj4+Pgo+ID4+Pj4gSSB0aGlu
ayB3ZSBzaG91bGQganVzdCBjb21wbGV0ZWx5IG51a2UgdHRtX3R0X2JpbmQoKSBhbmQKPiA+Pj4+
IHR0bV90dF91bmJpbmQoKQo+ID4+Pj4gYW5kIGFsbCBvZiB0aGF0Lgo+ID4+Pj4KPiA+Pj4+IERy
aXZlcnMgY2FuIHRvIHRoaXMgZnJvbSB0aGVpciBtb3ZlX25vdGlmeSgpIGNhbGxiYWNrIG5vdyBp
bnN0ZWFkLgo+ID4+PiBHb29kIHBsYW4sIEkndmUgcHV0IGEgYnVuY2ggb2YgcmV3b3JrIGludG8g
dGhlIHNhbWUgYnJhbmNoLAo+ID4+Pgo+ID4+PiBodHRwczovL25hbTExLnNhZmVsaW5rcy5wcm90
ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZnaXRodWIuY29tJTJGYWlybGll
ZCUyRmxpbnV4JTJGY29tbWl0cyUyRnR0bS1oYWxmLWJha2VkLWlkZWFzJmFtcDtkYXRhPTAyJTdD
MDElN0NjaHJpc3RpYW4ua29lbmlnJTQwYW1kLmNvbSU3QzNkNmM5YWJmZmE1NTQzYTM4ODEwMDhk
ODVhMGMwMTNjJTdDM2RkODk2MWZlNDg4NGU2MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYz
NzM1ODM1NDkxMjE2MjE2OSZhbXA7c2RhdGE9a2FSMXVDM3lMRiUyRjhBVDFiZ1RwbyUyRjhBbiUy
QjB5eXdIWkJBZlhURCUyRnQlMkJNYjAlM0QmYW1wO3Jlc2VydmVkPTAKPiA+Pj4KPiA+Pj4KPiA+
Pj4gYnV0IEkndmUgZnJpZWQgbXkgYnJhaW4gYSBiaXQsIEknbSBoYXZpbmcgdHJvdWJsZSByZWNv
bmNpbGluZyBtb3ZlCj4gPj4+IG5vdGlmeSBhbmQgdW5iaW5kaW5nIGluIHRoZSByaWdodCBwbGFj
ZXMsIEkgZmVlbCBsaWtlIEknbSBjaXJjbGluZwo+ID4+PiBhcm91bmQgdGhlIGFuc3dlciBidXQg
aGF2ZW4ndCBoaXQgaXQgeWV0Lgo+ID4+IGRybS90dG06IGFkZCB1bmJpbmQgdG8gbW92ZSBub3Rp
ZnkgcGF0aHMuCj4gPj4KPiA+PiBJbiB0aGF0IHRyZWUgaXMgaW5jb3JyZWN0IGFuZCBJIHRoaW5r
IHdoZXJlIHRoaW5ncyBmYWxsIGFwYXJ0LCBzaW5jZQo+ID4+IGlmIHdlIGFyZSBtb3ZpbmcgVFRN
IHRvIFZSQU0gdGhhdCB3aWxsIHVuYmluZCB0aGUgVFRNIG9iamVjdCBmcm9tIHRoZQo+ID4+IEdU
VCBhdCBtb3ZlIG5vdGlmeSB0aW1lIGJlZm9yZSB0aGUgbW92ZSBoYXMgZXhlY3V0ZWQuCj4gPj4K
PiA+PiBJJ20gZmVlbGluZyBhIG1vdmVfY29tcGxldGVfbm90aWZ5IG1pZ2h0IGJlIGFuIGlkZWEs
IGJ1dCBJJ20gd29uZGVyaW5nCj4gPj4gaWYgaXQncyBhIGJhZCBpZGVhLgo+ID4+Cj4gPj4gRGF2
ZS4KPiA+Cj4gPiBJIGRvbid0IGtub3cgaWYgdGhpcyBjb21wbGljYXRlcyB0aGluZ3MgbW9yZSwg
YnV0IG1vdmVfbm90aWZ5IHdhcwo+ID4gb3JpZ2luYWxseSBvbmx5IHRob3VnaHQgdG8gYmUgYW4g
aW52YWxpZGF0aW9uIGNhbGxiYWNrLCBhbmQgd2FzIG5ldmVyCj4gPiBpbnRlbmRlZCB0byBkcml2
ZSBhbnkgb3RoZXIgYWN0aW9ucyBpbiB0aGUgZHJpdmVyIHRoYW4gdG8gaW52YWxpZGF0ZQo+ID4g
dmFyaW91cyBHUFUgYmluZGluZ3MuCj4KPiBBbmQgZXhhY3RseSB0aGF0J3Mgd2hhdCB3ZSBuZWVk
IHRvIGNoYW5nZS4gU2VlIFRUTSBvciBtb3JlIHByZWNpc2VseSB0aGUKPiBldmljdGlvbiBoYW5k
bGluZyBzaG91bGQgb25seSBtYW5hZ2Ugd2hlcmUgYnVmZmVycyBhcmUgbG9jYXRlZCBhbmQKPiBu
b3RpZnkgdGhhdCBkcml2ZXIgdGhhdCBzb21ldGhpbmcgbmVlZHMgdG8gbW92ZS4KPgo+IE1hbmFn
aW5nIHRoZSB3aG9sZSBiaW5kaW5nL3VuYmluZGluZyBhbmQgYWN0dWFsbHkgbW92aW5nIHRoZSBi
dWZmZXIKPiBhcm91bmQgaW5zaWRlIFRUTSB3YXMgYSBiYWQgaWRlYSB0byBiZWdpbiB3aXRoLgo+
Cj4gSW4gb3RoZXIgd29yZHMgd2UgaGF2ZSBkb21haW5zIEEsIEIsIEMuLi4uIGFuZCBtYW5hZ2Ug
d2hpY2ggQk9zIGFyZQo+IGluc2lkZSB0aG9zZSBkb21haW5zIGFuZCBjYW4gYmUgZXZpY3RlZCB3
aGVuIG5lY2Vzc2FyeS4KPgo+IElmIHRoZSBuZWVkIGFyaXNlIHRvIGV2aWN0IHNvbWV0aGluZyB0
aGUgZHJpdmVyIGdldHMgYSBub3RpZmljYXRpb24KPiB3aGljaCBCTyB3YXMgcGlja2VkIGZvciBl
dmljdGlvbiBhbmQgYWN0cyBhY2NvcmRpbmdseS4KPgo+IFRoaXMgbWVhbnMgdGhhdCB0aGUgZXZp
Y3Rpb25fdmFsdWFibGUsIGV2aWN0X2ZsYWcsIG1vdmVfbm90aWZ5LCBiaW5kaW5nLAo+IHVuYmlu
ZGluZyBldGMuLi4gY2FsbGJhY2tzIHNob3VsZCBiZSByZW1vdmVkIGluIHRoZSBsb25nIHRlcm0u
CgpJJ3ZlIHB1c2hlZCBhIGZldyBtb3JlIFdJUCBkaXJlY3Rpb24gY2hhbmdlcyBpbnRvIG15IGJy
YW5jaCBub3csIEkKdGhpbmsgdGhlIGZ1biBiaXQgSSBoYXZlIHRvIGZhY2UgbmV4dCBpcyBzcGxp
dHRpbmcgdGhlCm1vdmVfYWNjZWxfY2xlYW51cCBhbmQgcGlwZWxpbmUgbW92ZSBjbGVhbnVwcy4K
CmJ1dCBJJ2xsIGtlZXAgaW4gbWluZCB0aGUgZ29hbCBvZiB0cnlpbmcgdG8gZ2V0IHRvIGEgY2xl
YW5lciBmaW5pc2hlZCBzb2x1dGlvbi4KCkRhdmUuCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
