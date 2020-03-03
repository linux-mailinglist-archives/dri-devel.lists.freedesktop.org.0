Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 272EB1770F3
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 09:21:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA6E56E4EA;
	Tue,  3 Mar 2020 08:21:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 480166E4EA
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 08:21:39 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id v19so2137055ote.8
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2020 00:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GUKiYpi9FYS09yZZU0VyVoSg4aODr62keM14BQquORs=;
 b=iTWHWXN1cBYaPALi8BmMvDHdDzP0pKeUtHzIMaZWEkPiFOOdEMBDcTNEIqY961Mb8h
 LbLyoMlq1lKaFpSLXNK3VlkxsJ5KXgQhZaXfV5s4O24srTrobcEMWdltxWq0MqlNjLW1
 IgAJ+fkveUQq17XOSt7mVFTzXwRn4y6SiVqHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GUKiYpi9FYS09yZZU0VyVoSg4aODr62keM14BQquORs=;
 b=VZsaeqx2Y6w5LWPCyZmyD6+21vSs6j+kuTgLKKVCKT+bQjsQgSB7rX9WKEajnhLVMw
 mDmrhOrnIdltUuM4kv3gqo0n/wYix9YEV1xH3CSwVSCpw9hS8MiM3xL/kuFo6mrQmWZx
 7Mf06MbrWAOwsu1EwtlDAQ4HwIsU/6FwraVAZMwE7Ncrlb2LBKh7A27RCEOfSqvyWKZ1
 87/i59xWpytTqCJE0se0WghfXa5t7vXrVgM3STr1h/pwL/hUCwYwvFZly8wV+Ry28TQT
 JPEfsKvnkii8+6/RmtHAtyfWwrCH1N+RgFTZpBZ3ItRIZnoPutYd9hO1dnYiJyUSvSqB
 tM+Q==
X-Gm-Message-State: ANhLgQ2CvCwczHRzi7amW45cn+uAaENyAJ2UKwC7ywsWSZ+3A6HFrkld
 pVc/iEngqGZVEhUy9gAAdHyoVLzrjFausNmIjad1Gg==
X-Google-Smtp-Source: ADFU+vsWv/xGzR65hrkCy9io6KB5BpW2YoarmWrhIlXJBLbFY6jxN/402N6iCd/Q1ExpqXqPKFR3bzRtUMOm2cVQ7N8=
X-Received: by 2002:a9d:6256:: with SMTP id i22mr676037otk.106.1583223698573; 
 Tue, 03 Mar 2020 00:21:38 -0800 (PST)
MIME-Version: 1.0
References: <20200220062229.68762-1-keescook@chromium.org>
 <202003022038.07A611E@keescook>
In-Reply-To: <202003022038.07A611E@keescook>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 3 Mar 2020 09:21:26 +0100
Message-ID: <CAKMK7uHRppv==G+Ep4S48dPMKZ9EwZGOt3WwWGXJiv+bXR-0SA@mail.gmail.com>
Subject: Re: [PATCH] drm/edid: Distribute switch variables for initialization
To: Kees Cook <keescook@chromium.org>
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
Cc: David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alexander Potapenko <glider@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXIgMywgMjAyMCBhdCA1OjM5IEFNIEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21p
dW0ub3JnPiB3cm90ZToKPgo+IE9uIFdlZCwgRmViIDE5LCAyMDIwIGF0IDEwOjIyOjI5UE0gLTA4
MDAsIEtlZXMgQ29vayB3cm90ZToKPiA+IFZhcmlhYmxlcyBkZWNsYXJlZCBpbiBhIHN3aXRjaCBz
dGF0ZW1lbnQgYmVmb3JlIGFueSBjYXNlIHN0YXRlbWVudHMKPiA+IGNhbm5vdCBiZSBhdXRvbWF0
aWNhbGx5IGluaXRpYWxpemVkIHdpdGggY29tcGlsZXIgaW5zdHJ1bWVudGF0aW9uIChhcwo+ID4g
dGhleSBhcmUgbm90IHBhcnQgb2YgYW55IGV4ZWN1dGlvbiBmbG93KS4gV2l0aCBHQ0MncyBwcm9w
b3NlZCBhdXRvbWF0aWMKPiA+IHN0YWNrIHZhcmlhYmxlIGluaXRpYWxpemF0aW9uIGZlYXR1cmUs
IHRoaXMgdHJpZ2dlcnMgYSB3YXJuaW5nIChhbmQgdGhleQo+ID4gZG9uJ3QgZ2V0IGluaXRpYWxp
emVkKS4gQ2xhbmcncyBhdXRvbWF0aWMgc3RhY2sgdmFyaWFibGUgaW5pdGlhbGl6YXRpb24KPiA+
ICh2aWEgQ09ORklHX0lOSVRfU1RBQ0tfQUxMPXkpIGRvZXNuJ3QgdGhyb3cgYSB3YXJuaW5nLCBi
dXQgaXQgYWxzbwo+ID4gZG9lc24ndCBpbml0aWFsaXplIHN1Y2ggdmFyaWFibGVzWzFdLiBOb3Rl
IHRoYXQgdGhlc2Ugd2FybmluZ3MgKG9yIHNpbGVudAo+ID4gc2tpcHBpbmcpIGhhcHBlbiBiZWZv
cmUgdGhlIGRlYWQtc3RvcmUgZWxpbWluYXRpb24gb3B0aW1pemF0aW9uIHBoYXNlLAo+ID4gc28g
ZXZlbiB3aGVuIHRoZSBhdXRvbWF0aWMgaW5pdGlhbGl6YXRpb25zIGFyZSBsYXRlciBlbGlkZWQg
aW4gZmF2b3Igb2YKPiA+IGRpcmVjdCBpbml0aWFsaXphdGlvbnMsIHRoZSB3YXJuaW5ncyByZW1h
aW4uCj4gPgo+ID4gVG8gYXZvaWQgdGhlc2UgcHJvYmxlbXMsIG1vdmUgc3VjaCB2YXJpYWJsZXMg
aW50byB0aGUgImNhc2UiIHdoZXJlCj4gPiB0aGV5J3JlIHVzZWQgb3IgbGlmdCB0aGVtIHVwIGlu
dG8gdGhlIG1haW4gZnVuY3Rpb24gYm9keS4KPiA+Cj4gPiBkcml2ZXJzL2dwdS9kcm0vZHJtX2Vk
aWQuYzogSW4gZnVuY3Rpb24g4oCYZHJtX2VkaWRfdG9fZWxk4oCZOgo+ID4gZHJpdmVycy9ncHUv
ZHJtL2RybV9lZGlkLmM6NDM5NTo5OiB3YXJuaW5nOiBzdGF0ZW1lbnQgd2lsbCBuZXZlciBiZSBl
eGVjdXRlZCBbLVdzd2l0Y2gtdW5yZWFjaGFibGVdCj4gPiAgNDM5NSB8ICAgICBpbnQgc2FkX2Nv
dW50Owo+ID4gICAgICAgfCAgICAgICAgIF5+fn5+fn5+fgo+ID4KPiA+IFsxXSBodHRwczovL2J1
Z3MubGx2bS5vcmcvc2hvd19idWcuY2dpP2lkPTQ0OTE2Cj4gPgo+ID4gU2lnbmVkLW9mZi1ieTog
S2VlcyBDb29rIDxrZWVzY29va0BjaHJvbWl1bS5vcmc+Cj4KPiBQaW5nLiBDYW4gc29tZW9uZSBw
aWNrIHRoaXMgdXAsIHBsZWFzZT8KCldoYXRldmVyIHRoZSByZWFzb25zLCBidXQgeW91ciBvcmln
aW5hbCBwYXRjaCBkaWRuJ3QgbWFrZSBpdCB0aHJvdWdoCnRvIGRyaS1kZXZlbC4gQ2FuIHlvdSBw
bHMgcmVzdWJtaXQ/CgpUaGFua3MsIERhbmllbAoKPgo+IFRoYW5rcyEKPgo+IC1LZWVzCj4KPiA+
IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jIHwgICAgNSArKystLQo+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jIGIvZHJpdmVycy9ncHUvZHJtL2Ry
bV9lZGlkLmMKPiA+IGluZGV4IDgwNWZiMDA0YzhlYi4uMjk0MWI2NWI0MjdmIDEwMDY0NAo+ID4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZWRpZC5jCj4gPiBAQCAtNDM5Miw5ICs0MzkyLDkgQEAgc3RhdGljIHZvaWQgZHJtX2Vk
aWRfdG9fZWxkKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsIHN0cnVjdCBlZGlkICpl
ZGlkKQo+ID4gICAgICAgICAgICAgICAgICAgICAgIGRibCA9IGNlYV9kYl9wYXlsb2FkX2xlbihk
Yik7Cj4gPgo+ID4gICAgICAgICAgICAgICAgICAgICAgIHN3aXRjaCAoY2VhX2RiX3RhZyhkYikp
IHsKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludCBzYWRfY291bnQ7Cj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgY2FzZSBBVURJT19CTE9DSzogewo+ID4KPiA+IC0gICAgICAg
ICAgICAgICAgICAgICBjYXNlIEFVRElPX0JMT0NLOgo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgaW50IHNhZF9jb3VudDsKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IC8qIEF1ZGlvIERhdGEgQmxvY2ssIGNvbnRhaW5zIFNBRHMgKi8KPiA+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHNhZF9jb3VudCA9IG1pbihkYmwgLyAzLCAxNSAtIHRvdGFsX3NhZF9j
b3VudCk7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpZiAoc2FkX2NvdW50ID49
IDEpCj4gPiBAQCAtNDQwMiw2ICs0NDAyLDcgQEAgc3RhdGljIHZvaWQgZHJtX2VkaWRfdG9fZWxk
KHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsIHN0cnVjdCBlZGlkICplZGlkKQo+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmRiWzFdLCBzYWRf
Y291bnQgKiAzKTsKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHRvdGFsX3NhZF9j
b3VudCArPSBzYWRfY291bnQ7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBicmVh
azsKPiA+ICsgICAgICAgICAgICAgICAgICAgICB9Cj4gPiAgICAgICAgICAgICAgICAgICAgICAg
Y2FzZSBTUEVBS0VSX0JMT0NLOgo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLyog
U3BlYWtlciBBbGxvY2F0aW9uIERhdGEgQmxvY2sgKi8KPiA+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGlmIChkYmwgPj0gMSkKPiA+Cj4KPiAtLQo+IEtlZXMgQ29vawoKCgotLSAKRGFu
aWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KKzQxICgwKSA3
OSAzNjUgNTcgNDggLSBodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
