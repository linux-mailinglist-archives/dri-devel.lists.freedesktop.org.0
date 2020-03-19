Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 423F518B1B7
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 11:51:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E0D56E27F;
	Thu, 19 Mar 2020 10:51:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65F0F6E137
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 10:51:33 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id w10so2261073wrm.4
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 03:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=/RXi4E6N2BrHZ7nZPIDPshoq9XlJz4tXbLpi7SJ8rvk=;
 b=IrUTJak5anMDl/TSTYtpbGyjX4cb7wbtHeGdMjFolrQW9YexSz8k7vzEZWaX/wqjvI
 khTEPPcieXiAUCVnMFn1T6l9EWkt7TvY4115BOHxoH6tefXDxZG+6eOUInXUN/N2+S6E
 2pvbfpU2ujUz1BD2achNsFhbTamXb+kQrrUVI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=/RXi4E6N2BrHZ7nZPIDPshoq9XlJz4tXbLpi7SJ8rvk=;
 b=YOGsZNJbz2I6skFJTQJk7K3qm0P8e9KdXEfs6J4mQKWiddgx5W8YE19loQ0s2Pytmm
 6R8Jo4q4we5HVpeuk/mkzSBxSS1nAtuSvpGRje/QeYHuw6JjPrD4buMk/kc40LdAuHks
 WrYQ5DhJZehQg7c7mNMNUnDalA+JkmcmRPq8UxHaUs7hfGUHaTn5ysft1Gc5lsNI1Szt
 wyveX+EcweV04/XX4+MjoKBkNnERwYelMSP9UYSMSZhbnSdZNK9/1w/PVJxFLk0nifZY
 PBweqzN5Gn+XFu2TwUulURd3DKlfTz2lwj9kSiXyoP01svDMw5AlhMTBECbOVPIZVxgu
 lxMA==
X-Gm-Message-State: ANhLgQ2C2PH+IkHvoTROtooeMRRPlYsxv3WGj+p1VrD5lCjT0mMhoUU6
 Vkm1xB8xMDFhtGTtsN+OkpLy8g==
X-Google-Smtp-Source: ADFU+vvUA2QcRpbnGKfFXs6t1PT7JukCMEhlBYJupowdhcJ7r9ZnCkaEdec3wJdJloK5j9a2Av8QAQ==
X-Received: by 2002:adf:e9c4:: with SMTP id l4mr3483827wrn.421.1584615091968; 
 Thu, 19 Mar 2020 03:51:31 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v10sm2555208wml.44.2020.03.19.03.51.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2020 03:51:31 -0700 (PDT)
Date: Thu, 19 Mar 2020 11:51:29 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>
Subject: Re: Plumbing explicit synchronization through the Linux ecosystem
Message-ID: <20200319105129.GF2363188@phenom.ffwll.local>
References: <CAOFGe94jy2VYDPbkMW8ZuNdAeM+HS8sM1OAYFGd9JKc1V7PVOQ@mail.gmail.com>
 <CAAxE2A4q9sZDz8vSLAvT0HH4BGukf8Ug68eqSV1ojqrm_5uFFg@mail.gmail.com>
 <170e13edbb0.27ad.c6988b7ea6112e3e892765a0d4287e0c@jlekstrand.net>
 <CAAxE2A6hMs2Ngd4zEv+hEJnEUKmPDuXmeWUaUU-4YCTRHNzr1w@mail.gmail.com>
 <e470a1d0-cf91-5811-d280-322e005888a8@daenzer.net>
 <CAAxE2A5D2HaqjS52jymMbwOUEsaXG_cMeeA9_esqaC54-52Kgw@mail.gmail.com>
 <ea771b02-b74b-2a89-e55c-2977d641558d@daenzer.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ea771b02-b74b-2a89-e55c-2977d641558d@daenzer.net>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: Marek =?utf-8?B?T2zFocOhaw==?= <maraeo@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, xorg-devel <xorg-devel@lists.x.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "wayland-devel @ lists . freedesktop . org"
 <wayland-devel@lists.freedesktop.org>,
 Discussion of the development of and with GStreamer
 <gstreamer-devel@lists.freedesktop.org>, Jason Ekstrand <jason@jlekstrand.net>,
 ML mesa-dev <mesa-dev@lists.freedesktop.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXIgMTcsIDIwMjAgYXQgMTE6MDE6NTdBTSArMDEwMCwgTWljaGVsIETDpG56ZXIg
d3JvdGU6Cj4gT24gMjAyMC0wMy0xNiA3OjMzIHAubS4sIE1hcmVrIE9sxaHDoWsgd3JvdGU6Cj4g
PiBPbiBNb24sIE1hciAxNiwgMjAyMCBhdCA1OjU3IEFNIE1pY2hlbCBEw6RuemVyIDxtaWNoZWxA
ZGFlbnplci5uZXQ+IHdyb3RlOgo+ID4+IE9uIDIwMjAtMDMtMTYgNDo1MCBhLm0uLCBNYXJlayBP
bMWhw6FrIHdyb3RlOgo+ID4+PiBUaGUgc3luY2hyb25pemF0aW9uIHdvcmtzIGJlY2F1c2UgdGhl
IE1lc2EgZHJpdmVyIHdhaXRzIGZvciBpZGxlIChkcmFpbnMKPiA+Pj4gdGhlIEdGWCBwaXBlbGlu
ZSkgYXQgdGhlIGVuZCBvZiBjb21tYW5kIGJ1ZmZlcnMgYW5kIHRoZXJlIGlzIG9ubHkgMQo+ID4+
PiBncmFwaGljcyBxdWV1ZSwgc28gZXZlcnl0aGluZyBpcyBvcmRlcmVkLgo+ID4+Pgo+ID4+PiBU
aGUgR0ZYIHBpcGVsaW5lIHJ1bnMgYXN5bmNocm9ub3VzbHkgdG8gdGhlIGNvbW1hbmQgYnVmZmVy
LCBtZWFuaW5nIHRoZQo+ID4+PiBjb21tYW5kIGJ1ZmZlciBvbmx5IHN0YXJ0cyBkcmF3cyBhbmQg
ZG9lc24ndCB3YWl0IGZvciBjb21wbGV0aW9uLiBJZiB0aGUKPiA+Pj4gTWVzYSBkcml2ZXIgZGlk
bid0IHdhaXQgYXQgdGhlIGVuZCBvZiB0aGUgY29tbWFuZCBidWZmZXIsIHRoZSBjb21tYW5kCj4g
Pj4+IGJ1ZmZlciB3b3VsZCBmaW5pc2ggYW5kIGEgZGlmZmVyZW50IHByb2Nlc3MgY291bGQgc3Rh
cnQgZXhlY3V0aW9uIG9mIGl0cwo+ID4+PiBvd24gY29tbWFuZCBidWZmZXIgd2hpbGUgc2hhZGVy
cyBvZiB0aGUgcHJldmlvdXMgcHJvY2VzcyBhcmUgc3RpbGwKPiA+PiBydW5uaW5nLgo+ID4+Pgo+
ID4+PiBJZiB0aGUgTWVzYSBkcml2ZXIgc3VibWl0cyBhIGNvbW1hbmQgYnVmZmVyIGludGVybmFs
bHkgKGJlY2F1c2UgaXQncwo+ID4+IGZ1bGwpLAo+ID4+PiBpdCBkb2Vzbid0IHdhaXQsIHNvIHRo
ZSBHRlggcGlwZWxpbmUgZG9lc24ndCBub3RpY2UgdGhhdCBhIGNvbW1hbmQgYnVmZmVyCj4gPj4+
IGVuZGVkIGFuZCBhIG5ldyBvbmUgc3RhcnRlZC4KPiA+Pj4KPiA+Pj4gVGhlIHdhaXRpbmcgYXQg
dGhlIGVuZCBvZiBjb21tYW5kIGJ1ZmZlcnMgaGFwcGVucyBvbmx5IHdoZW4gdGhlIGZsdXNoIGlz
Cj4gPj4+IGV4dGVybmFsIChTd2FwIGJ1ZmZlcnMsIGdsRmx1c2gpLgo+ID4+Pgo+ID4+PiBJdCdz
IGEgcGVyZm9ybWFuY2UgcHJvYmxlbSwgYmVjYXVzZSB0aGUgR0ZYIHF1ZXVlIGlzIGJsb2NrZWQg
dW50aWwgdGhlCj4gPj4gR0ZYCj4gPj4+IHBpcGVsaW5lIGlzIGRyYWluZWQgYXQgdGhlIGVuZCBv
ZiBldmVyeSBmcmFtZSBhdCBsZWFzdC4KPiA+Pj4KPiA+Pj4gU28gZXhwbGljaXQgZmVuY2VzIGZv
ciBTd2FwQnVmZmVycyB3b3VsZCBoZWxwLgo+ID4+Cj4gPj4gTm90IHN1cmUgd2hhdCBkaWZmZXJl
bmNlIGl0IHdvdWxkIG1ha2UsIHNpbmNlIHRoZSBzYW1lIHRoaW5nIG5lZWRzIHRvIGJlCj4gPj4g
ZG9uZSBmb3IgZXhwbGljaXQgZmVuY2VzIGFzIHdlbGwsIGRvZXNuJ3QgaXQ/Cj4gPiAKPiA+IE5v
LiBFeHBsaWNpdCBmZW5jZXMgZG9uJ3QgcmVxdWlyZSB1c2Vyc3BhY2UgdG8gd2FpdCBmb3IgaWRs
ZSBpbiB0aGUgY29tbWFuZAo+ID4gYnVmZmVyLiBGZW5jZXMgYXJlIHNpZ25hbGxlZCB3aGVuIHRo
ZSBsYXN0IGRyYXcgaXMgY29tcGxldGUgYW5kIGNhY2hlcyBhcmUKPiA+IGZsdXNoZWQuIEJlZm9y
ZSB0aGF0IGhhcHBlbnMsIGFueSBjb21tYW5kIGJ1ZmZlciB0aGF0IGlzIG5vdCBkZXBlbmRlbnQg
b24KPiA+IHRoZSBmZW5jZSBjYW4gc3RhcnQgZXhlY3V0aW9uLiBUaGVyZSBpcyBuZXZlciBhIG5l
ZWQgZm9yIHRoZSBHUFUgdG8gYmUgaWRsZQo+ID4gaWYgdGhlcmUgaXMgZW5vdWdoIGluZGVwZW5k
ZW50IHdvcmsgdG8gZG8uCj4gCj4gSSBkb24ndCB0aGluayBleHBsaWNpdCBmZW5jZXMgaW4gdGhl
IGNvbnRleHQgb2YgdGhpcyBkaXNjdXNzaW9uIGltcGx5Cj4gdXNpbmcgdGhhdCBkaWZmZXJlbnQg
ZmVuY2Ugc2lnbmFsbGluZyBtZWNoYW5pc20gdGhvdWdoLiBNeSB1bmRlcnN0YW5kaW5nCj4gaXMg
dGhhdCB0aGUgQVBJIHByb3Bvc2VkIGJ5IEphc29uIGFsbG93cyBpbXBsaWNpdCBmZW5jZXMgdG8g
YmUgdXNlZCBhcwo+IGV4cGxpY2l0IG9uZXMgYW5kIHZpY2UgdmVyc2EsIHNvIHByZXN1bWFibHkg
dGhleSBoYXZlIHRvIHVzZSB0aGUgc2FtZQo+IHNpZ25hbGxpbmcgbWVjaGFuaXNtLgo+IAo+IAo+
IEFueXdheSwgbWF5YmUgdGhlIGRpZmZlcmVudCBmZW5jZSBzaWduYWxsaW5nIG1lY2hhbmlzbSB5
b3UgZGVzY3JpYmUKPiBjb3VsZCBiZSB1c2VkIGJ5IHRoZSBhbWRncHUga2VybmVsIGRyaXZlciBp
biBnZW5lcmFsLCB0aGVuIE1lc2EgY291bGQKPiBkcm9wIHRoZSB3YWl0cyBmb3IgaWRsZSBhbmQg
Z2V0IHRoZSBiZW5lZml0cyB3aXRoIGltcGxpY2l0IHN5bmMgYXMgd2VsbD8KClllYWgsIHRoaXMg
aXMgZW50aXJlbHkgYWJvdXQgdGhlIHByb2dyYW1taW5nIG1vZGVsIHZpc2libGUgdG8gdXNlcnNw
YWNlLgpUaGVyZSBzaG91bGRuJ3QgYmUgYW55IGltcGFjdCBvbiB0aGUgZHJpdmVyJ3MgY2hvaWNl
IG9mIGEgdG9wIHZzLiBib3R0b20Kb2YgdGhlIGdwdSBwaXBlbGluZSB1c2VkIGZvciBzeW5jaHJv
bml6YXRpb24sIHRoYXQncyBlbnRpcmVseSB1cCB0byB3aGF0CnlvdSdyZSBody9kcml2ZXIvc2No
ZWR1bGVyIGNhbiBwdWxsIG9mZi4KCkRvaW5nIGEgZnVsbCBnZnggcGlwZWxpbmUgZmx1c2ggZm9y
IHNoYXJlZCBidWZmZXJzLCB3aGVuIHlvdXIgaHcgY2FuIGRvCmJlLCBzb3VuZHMgbGlrZSBhbiBp
c3N1ZSB0byBtZSB0aGF0J3Mgbm90IHJlbGF0ZWQgdG8gdGhpcyBoZXJlIGF0IGFsbC4gSXQKbWln
aHQgYmUgaW50ZXJ0d2luZWQgd2l0aCBhbWRncHUncyBzcGVjaWFsIGludGVycHJldGF0aW9uIG9m
IGRtYV9yZXN2CmZlbmNlcyB0aG91Z2gsIG5vIGlkZWEuIFdlIG1pZ2h0IG5lZWQgdG8gcmV2YW1w
IGFsbCB0aGF0LiBCdXQgZm9yIGEKdXNlcnNwYWNlIGNsaWVudCB0aGF0IGRvZXMgbm90aGluZyBm
YW5jeSAobm8gbXVsdGlwbGUgcmVuZGVyIGJ1ZmZlcgp0YXJnZXRzIGluIG9uZSBibywgb3Igdmsg
c3R5bGUgIkkgd3JpdGUgdG8gZXZlcnl0aGluZyBhbGwgdGhlIHRpbWUsCnBlcmhhcHMiIHN0dWZm
KSB0aGVyZSBzaG91bGQgYmUgMCBwZXJmIGRpZmZlcmVuY2UgYmV0d2VlbiBpbXBsaWNpdCBzeW5j
CnRocm91Z2ggZG1hX3Jlc3YgYW5kIGV4cGxpY2l0IHN5bmMgdGhyb3VnaCBzeW5jX2ZpbGUvc3lu
Y29iai9kbWFfZmVuY2UKZGlyZWN0bHkuCgpJZiB0aGVyZSBpcyBJJ2QgY29uc2lkZXIgdGhhdCBh
IGJpdCBhIGRyaXZlciBidWcuCi1EYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5n
aW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
