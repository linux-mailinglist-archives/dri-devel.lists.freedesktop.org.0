Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2394253E5C
	for <lists+dri-devel@lfdr.de>; Thu, 27 Aug 2020 08:58:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D7CD6EB30;
	Thu, 27 Aug 2020 06:57:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A33189E86
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 17:11:46 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id m22so3231476ljj.5
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 10:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LFBTd716RTKzMlke2Bib1bgfXmFyBkoFUVEct/Y6DRA=;
 b=YwxjW6+o2vGoYl+vXaN2bUB/cyKaLR3dQi1gfh4LPQA8otX3dHgmEYatnbcAArwz8k
 9n+j/mmo6rJUDbzF3JLsqQeCLxb3FCI4SCVnJDpH4TiOGozKtLeWMLbtKNuqM62j6A3X
 iyiFuo75r95o3jDdltei6yugz0va77EZFEgLFPSZGmLCeTDmFXWgwBqMgSJ0VOkkl8/S
 gkH7wVs8DpZmr0ljmmThlG1ebPZQva8ROeHVoJMGrk8TLoCbH/G8kF1Iq24JFI1K7ktw
 YjPW8XPqVxZzFcEMRZE/nd6wmt5vx4l2Yy56NkpkJNO/ugWHSNxMOQrb/67fLz7C4j3x
 gPOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LFBTd716RTKzMlke2Bib1bgfXmFyBkoFUVEct/Y6DRA=;
 b=KaN7ejueenR3cmlQiX33VmpXJutMTuCaId5QDrOcdtNG7E8JFgbLfRsJUfc+gw7d/G
 2INeHwxYz03UWCcfyPC+29MXGEoqx3sOVVt24M+lChpvIOBJhlBjH6xo+MGhzBOLpoLq
 1oK9sf7KLm5PakDIF/DXWv/iBUV/CRHUh9lDyA1JFSZJVAcKUF0kr6iNh1EjM0HdVVm/
 6e24GnNdicGThkIF4P73+VDWFEx2gOTfvPUk4uW3uTIqbWS5Xc+b6IRN3WZT1NmyiMzO
 RLHsbVOTvHEWKzVi4w2KPjYpr6OrfgNFKAfgMx4wuXn2KLbALfuhqPkOyE79+nrbtmuC
 5cdw==
X-Gm-Message-State: AOAM530g9tZCiNvihQ+zcGF8bQUQ1nrMJDHTrsWNvTH/KrBByAQttte3
 bFFEK6CAQtOb8HOSe2DVKDUWHzG6rC3HmUtxIH0=
X-Google-Smtp-Source: ABdhPJx57uWoraE16kCejHtyOP5BsDGkUiZUrEzS2O4wiHfYgqfvD65l9TiO5QgUwg1e5mx34TP0nMRZLCi7HuxF0L8=
X-Received: by 2002:a2e:321a:: with SMTP id y26mr7157687ljy.388.1598461905380; 
 Wed, 26 Aug 2020 10:11:45 -0700 (PDT)
MIME-Version: 1.0
References: <1595930879-2478-1-git-send-email-kevin3.tang@gmail.com>
 <1595930879-2478-2-git-send-email-kevin3.tang@gmail.com>
 <20200728202732.GB1277651@ravnborg.org>
In-Reply-To: <20200728202732.GB1277651@ravnborg.org>
From: Kevin Tang <kevin3.tang@gmail.com>
Date: Thu, 27 Aug 2020 01:11:34 +0800
Message-ID: <CAFPSGXahb7KzsM3iZFjW=JjZAYr0h1vwMx2ROrwR=x8MCchn1Q@mail.gmail.com>
Subject: Re: [PATCH RFC v6 1/6] dt-bindings: display: add Unisoc's drm master
 bindings
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Approved-At: Thu, 27 Aug 2020 06:57:37 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, David Airlie <airlied@linux.ie>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Orson Zhai <orsonzhai@gmail.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPiDkuo4yMDIw5bm0N+aciDI55pel5ZGo5LiJ
IOS4iuWNiDQ6MjflhpnpgZPvvJoKPgo+IEhpIEtldmluCj4KPiBPbiBUdWUsIEp1bCAyOCwgMjAy
MCBhdCAwNjowNzo1NFBNICswODAwLCBLZXZpbiBUYW5nIHdyb3RlOgo+ID4gRnJvbTogS2V2aW4g
VGFuZyA8a2V2aW4udGFuZ0B1bmlzb2MuY29tPgo+ID4KPiA+IFRoZSBVbmlzb2MgRFJNIG1hc3Rl
ciBkZXZpY2UgaXMgYSB2aXJ0dWFsIGRldmljZSBuZWVkZWQgdG8gbGlzdCBhbGwKPiA+IERQVSBk
ZXZpY2VzIG9yIG90aGVyIGRpc3BsYXkgaW50ZXJmYWNlIG5vZGVzIHRoYXQgY29tcHJpc2UgdGhl
Cj4gPiBncmFwaGljcyBzdWJzeXN0ZW0KPiA+Cj4gPiBDYzogT3Jzb24gWmhhaSA8b3Jzb256aGFp
QGdtYWlsLmNvbT4KPiA+IENjOiBDaHVueWFuIFpoYW5nIDx6aGFuZy5seXJhQGdtYWlsLmNvbT4K
PiA+IFNpZ25lZC1vZmYtYnk6IEtldmluIFRhbmcgPGtldmluLnRhbmdAdW5pc29jLmNvbT4KPiA+
IC0tLQo+ID4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvc3ByZC9kcm0ueWFtbCAg
ICAgIHwgMzYgKysrKysrKysrKysrKysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzNiBp
bnNlcnRpb25zKCspCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L3NwcmQvZHJtLnlhbWwKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvc3ByZC9kcm0ueWFtbCBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3NwcmQvZHJtLnlhbWwK
PiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwLi5iNTc5MmMwCj4gPiAt
LS0gL2Rldi9udWxsCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS9zcHJkL2RybS55YW1sCj4gZHJtIHNlZW1zIGxpa2UgYSBzdWItb3B0aW1hbCBuYW1l
Lgo+IEhvdyBhYm91dCB1c2lnbiB0aGUgY29tcGF0aWJsZSBuYW1lICJkaXNwbGF5LXN1YnN5c3Rl
bSIgYXMgaXQgaXMgYSBiaXQKPiBtb3JlIHNwZWNpZmljIChidXQgbm90IGdvb2QpLgpZb3UncmUg
cmlnaHQsIG1heWJlICJzcHJkLGRybS55YW1sIiBvciAic3ByZC1kcm0ueWFtbCIgd2lsbCBiZSBi
ZXR0ZXIKPgo+ID4gQEAgLTAsMCArMSwzNiBAQAo+ID4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZp
ZXI6IEdQTC0yLjAKPgo+IEFueSBjaGFuY2UgdGhpcyBjYW4gYmUgKEdQTC0yLjAtb25seSBPUiBC
U0QtMi1DbGF1c2UpLgo+IEkgbm90aWNlZCB0aGF0IGZvciBleGFtcGxlIGNsb2NrL3NwcmQsc2M5
ODYzYS1jbGsueWFtbCB1c2VzIHRoaXMgbGljZW5zZQo+IHNvIEkgaG9wZSB0aGlzIGlzIE9LLgpJ
IHdpbGwgYWRkIEdQTC0yLjAtb25seSB0byBpdC4KPgo+ID4gKyVZQU1MIDEuMgo+ID4gKy0tLQo+
ID4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvZGlzcGxheS9zcHJkL2RybS55
YW1sIwo+ID4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29y
ZS55YW1sIwo+ID4gKwo+ID4gK3RpdGxlOiBVbmlzb2MgRFJNIG1hc3RlciBkZXZpY2UKPiA+ICsK
PiA+ICttYWludGFpbmVyczoKPiA+ICsgIC0gTWFyayBSdXRsYW5kIDxtYXJrLnJ1dGxhbmRAYXJt
LmNvbT4KPiA+ICsKPiA+ICtkZXNjcmlwdGlvbjogfAo+ID4gKyAgVGhlIFVuaXNvYyBEUk0gbWFz
dGVyIGRldmljZSBpcyBhIHZpcnR1YWwgZGV2aWNlIG5lZWRlZCB0byBsaXN0IGFsbAo+ID4gKyAg
RFBVIGRldmljZXMgb3Igb3RoZXIgZGlzcGxheSBpbnRlcmZhY2Ugbm9kZXMgdGhhdCBjb21wcmlz
ZSB0aGUKPiA+ICsgIGdyYXBoaWNzIHN1YnN5c3RlbS4KPiA+ICsKPiA+ICtwcm9wZXJ0aWVzOgo+
ID4gKyAgY29tcGF0aWJsZToKPiA+ICsgICAgY29uc3Q6IHNwcmQsZGlzcGxheS1zdWJzeXN0ZW0K
PiA+ICsKPiA+ICsgIHBvcnRzOgo+ID4gKyAgICBkZXNjcmlwdGlvbjoKPiA+ICsgICAgICBTaG91
bGQgY29udGFpbiBhIGxpc3Qgb2YgcGhhbmRsZXMgcG9pbnRpbmcgdG8gZGlzcGxheSBpbnRlcmZh
Y2UgcG9ydAo+ID4gKyAgICAgIG9mIERQVSBkZXZpY2VzLgo+IEFkZCB0eXBlIC0gbGlrZSB0aGlz
Ogo+ICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3BoYW5kbGUtYXJyYXkK
Pgo+IFNlZSBmb3IgZXhhbXBsZSBkaXNwbGF5L3JvY2tjaGlwL3JvY2tjaGlwLWRybS55YW1sCj4K
PiBBbnkgc3BlY2lmaWMgcmVhc29uIHdoeSB0aGlzIGlzIG5vdCBhIHBvcnRzIG5vZGUgbGlrZSB1
c2VkIGJ5IG1hbnkgb3RoZXIKPiBkaXNwbGF5IGJpbmRpbmdzPwo+IEluIG90aGVyIHdvcmRzIC0g
SSB0aGluayB0aGlzIGlzIHRvbyBzaW1wbGUuCldlIG9ubHkgc3VwcG9ydCBvbmUgZGlzcGxheSBw
aXBlbGluZSBub3csIG90aGVyIGludGVyZmFjZSwgbGlrZQpEUChEaXNwbGF5UG9ydCksIEhETUku
Li53aWxsIGJlIGFkZCBsYXRlci4uLgoKICBwb3J0czoKICAgICRyZWY6IC9zY2hlbWFzL3R5cGVz
LnlhbWwjL2RlZmluaXRpb25zL3BoYW5kbGUtYXJyYXkKICAgIGRlc2NyaXB0aW9uOiB8CiAgICAg
IFNob3VsZCBjb250YWluIGEgbGlzdCBvZiBwaGFuZGxlcyBwb2ludGluZyB0byBkaXNwbGF5IGlu
dGVyZmFjZSBwb3J0CiAgICAgIG9mIGRwdSBkZXZpY2VzLi4gZHB1IGRlZmluaXRpb25zIGFzIGRl
ZmluZWQgaW4KICAgICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
c3ByZC9zcHJkLGRwdS55YW1sCgoKPgo+ID4gKwo+ID4gK3JlcXVpcmVkOgo+ID4gKyAgLSBjb21w
YXRpYmxlCj4gPiArICAtIHBvcnRzCj4gPiArCj4KPiBBZGQ6Cj4gYWRkaXRpb25hbFByb3BlcnRp
ZXM6IGZhbHNlCj4KPiBzbyB3ZSBjYXRjaCBpZiBvdGhlciBwcm9wZXJ0aWVzIHNuZWFrIGluLgo+
Cj4gPiArZXhhbXBsZXM6Cj4gPiArICAtIHwKPiA+ICsgICAgZGlzcGxheS1zdWJzeXN0ZW0gewo+
ID4gKyAgICAgICAgY29tcGF0aWJsZSA9ICJzcHJkLGRpc3BsYXktc3Vic3lzdGVtIjsKPiA+ICsg
ICAgICAgIHBvcnRzID0gPCZkcHVfb3V0PjsKPiA+ICsgICAgfTsKPiA+ICsKPiA+IC0tCj4gPiAy
LjcuNAo+ID4KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCj4gPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
