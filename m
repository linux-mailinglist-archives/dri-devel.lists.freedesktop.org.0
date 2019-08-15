Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9F88EA76
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 13:38:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 927196E2D1;
	Thu, 15 Aug 2019 11:38:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 711806E2D0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 11:38:47 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id m24so5066969otp.12
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 04:38:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eA85OT+/g+cLDFha1h9u7JxU8JHAbsUKAA9kQQUjhyI=;
 b=Mz9AV7z+SRVIb5PtBJ4wFOCgQacBLZNPO2jot6AdRiV3X+EA5ZqyY1BRcDsEr2M/CO
 iyWIN4IUX+hWJkrFFqMG6QTC62pM8pTOfouKJRbh1Y49TznuFcw/WDhPHd/A+ORW4EjY
 v4gbQTomkY+e7372ZIy9u0Z4+M6wFc18pZmHoSVqjVX+YH4UsaV7wgr84deS38q9dLX4
 sj5a3owtjOIQuafmzKmE70JzqQjmAI3KJutCTdQlh6ZxURougkzOCF8xv1IkK0tfirLO
 9sVZIBCxaZItT1gh08l22czcNP7bVBovOiyzCj00opVfLo+4npIvhrldNMA1DUVja76d
 7n2g==
X-Gm-Message-State: APjAAAX+GYVW68NYxxHEDQuUCPw49/Kn4NGG/fTO1XEgwalPztY1m9iP
 DxKkbSNMvK9V7KngnXcWaMJzVdg1UICYjkHtCBTmBA==
X-Google-Smtp-Source: APXvYqxCRr3r3xGl8gxpvEZ+x3OUpt/fbOvUNo8/MTZHqwuoruQ5r4GHgISr+j3zeGbJPda9W2VO66cOmErHLK9KHBg=
X-Received: by 2002:a9d:1ca3:: with SMTP id l35mr2901629ota.106.1565869126588; 
 Thu, 15 Aug 2019 04:38:46 -0700 (PDT)
MIME-Version: 1.0
References: <87zhkag9ic.fsf@intel.com>
In-Reply-To: <87zhkag9ic.fsf@intel.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 15 Aug 2019 13:38:35 +0200
Message-ID: <CAKMK7uEiESuGSmLSDFOt0YBDtUAtQNK6oa9v7-1zOVZRt2=DJg@mail.gmail.com>
Subject: Re: [PULL] drm-intel-fixes
To: Jani Nikula <jani.nikula@intel.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=eA85OT+/g+cLDFha1h9u7JxU8JHAbsUKAA9kQQUjhyI=;
 b=it66RIOLcDBGqmAHb0Pv8y7qOow9dMpIGctHLcfH1/HwJW+JdwbUH6CvJ5temGMymW
 7PsetYrLETf491cFW02nnuvOJGINs8pRIaZ0nq3z4YQgf3bwBKUzADV/x4rMWfWSdwje
 6mPnAwicB5l5ahXa/rzBaDkgtkKHcadG7MfCk=
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
Cc: "DRM maintainer tools announcements, discussion,
 and development" <dim-tools@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sean Paul <sean@poorly.run>, intel-gfx <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgOTo0MiBBTSBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFA
aW50ZWwuY29tPiB3cm90ZToKPgo+Cj4gSGkgRGF2ZSAmIERhbmllbCAtCj4KPiBPbmUgdXNlIGFm
dGVyIGZyZWUgZml4IGZvciBHVlQuCj4KPiBJdCBkb2Vzbid0IGhhdmUgYSBMaW5rOiB0YWcgYmVj
YXVzZSBkaW0gZG9lc24ndCBjaGVjayB0aGF0IHdoaWxlCj4gYXBwbHlpbmcgdGhlIHB1bGwsIGFu
ZCwgZm9yIHNvbWUgcmVhc29uLCBpdCB3YXMgYWxzbyBub3QgY2hlY2tlZCB3aGVuIEkKPiBwdXNo
ZWQgb3V0IHRoZSBicmFuY2guIFBvc3NpYmx5IGJlY2F1c2UgaXQncyBpbiBhIG1lcmdlPyBBbnl3
YXksIEkgb25seQo+IGdvdCB0aGUgY29tcGxhaW50IHdoZW4gbWFraW5nIHRoZSBwdWxsIHJlcXVl
c3QsIHdoaWNoIGlzIHRvbyBsYXRlLgoKSG0sIHNvdW5kcyBsaWtlIHRoZSBmbGFnIHNldHRpbmdz
IGZvciB0aGUgY2hlY2tlciBhcmUgd3JvbmcsIGZvcgoiZm9yZWlnbiIgdHJlZXMgZGltIGRvZXNu
J3QgaW5zaXN0IG9uIHRoZSBMaW5rOiB0YWcuIFNvIG1heWJlIG5lZWQgdG8KZmxpcCB0aGF0IGFy
b3VuZCB0byBtYXRjaCB3aGF0IHdlIGRvIG9uIHRoZSByZWNlaXZpbmcgZW5kIG9mIGEgcHVsbD8K
LURhbmllbAoKPgo+IGRybS1pbnRlbC1maXhlcy0yMDE5LTA4LTE1Ogo+IGRybS9pOTE1IGZpeGVz
IGZvciB2NS40LXJjNToKPiAtIEdWVCB1c2UtYWZ0ZXItZnJlZSBmaXgKPgo+IEJSLAo+IEphbmku
Cj4KPiBUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IGQ0NTMzMWIwMGRkYjE3OWUy
OTE3NjY2MTcyNTkyNjFjMTEyZGI4NzI6Cj4KPiAgIExpbnV4IDUuMy1yYzQgKDIwMTktMDgtMTEg
MTM6MjY6NDEgLTA3MDApCj4KPiBhcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBh
dDoKPgo+ICAgZ2l0Oi8vYW5vbmdpdC5mcmVlZGVza3RvcC5vcmcvZHJtL2RybS1pbnRlbCB0YWdz
L2RybS1pbnRlbC1maXhlcy0yMDE5LTA4LTE1Cj4KPiBmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMg
dXAgdG8gZGFhMzcyMDBkNDg5MDZkNzFjNjNjZTE3OGJmN2Q0MTBiN2UwNzA4MjoKPgo+ICAgTWVy
Z2UgdGFnICdndnQtZml4ZXMtMjAxOS0wOC0xMycgb2YgaHR0cHM6Ly9naXRodWIuY29tL2ludGVs
L2d2dC1saW51eCBpbnRvIGRybS1pbnRlbC1maXhlcyAoMjAxOS0wOC0xMyAxNjoyNjozNCArMDMw
MCkKPgo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KPiBkcm0vaTkxNSBmaXhlcyBmb3IgdjUuNC1yYzU6Cj4gLSBHVlQgdXNl
LWFmdGVyLWZyZWUgZml4Cj4KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gRGFuIENhcnBlbnRlciAoMSk6Cj4gICAgICAg
ZHJtL2k5MTU6IFVzZSBhZnRlciBmcmVlIGluIGVycm9yIHBhdGggaW4gaW50ZWxfdmdwdV9jcmVh
dGVfd29ya2xvYWQoKQo+Cj4gSmFuaSBOaWt1bGEgKDEpOgo+ICAgICAgIE1lcmdlIHRhZyAnZ3Z0
LWZpeGVzLTIwMTktMDgtMTMnIG9mIGh0dHBzOi8vZ2l0aHViLmNvbS9pbnRlbC9ndnQtbGludXgg
aW50byBkcm0taW50ZWwtZml4ZXMKPgo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvc2NoZWR1
bGVyLmMgfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKPgo+IC0tCj4gSmFuaSBOaWt1bGEsIEludGVsIE9wZW4gU291cmNlIEdyYXBoaWNz
IENlbnRlcgoKCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29y
cG9yYXRpb24KKzQxICgwKSA3OSAzNjUgNTcgNDggLSBodHRwOi8vYmxvZy5mZndsbC5jaApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
