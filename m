Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E736346925
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 20:34:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4C1A6EB39;
	Tue, 23 Mar 2021 19:34:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04DCF6E171
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 19:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616528052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=31oGaPN6WEE+FJRkpXZPYBXBaKtoW/FYH/2rjmBKGQg=;
 b=ZFgwi+O1ZGZj8/9KffhuGfdV/Pe9weAq2yUaZY5L1pY9ZJ1P/LcBVjLsim7YBIurmxEvpu
 Gmd744x8QapGGGYmtgsuY+oKlk7Sm7ulDERr6O+eon00gug2o5UGsmOxQKy4jkqI6K8mHk
 umBNRHEx4GfqTCyHqzGFnCSufQxbH+E=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-Oc9DcBOxPlestqyR0wxY1w-1; Tue, 23 Mar 2021 15:34:08 -0400
X-MC-Unique: Oc9DcBOxPlestqyR0wxY1w-1
Received: by mail-ej1-f71.google.com with SMTP id gn30so1529738ejc.3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 12:34:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=31oGaPN6WEE+FJRkpXZPYBXBaKtoW/FYH/2rjmBKGQg=;
 b=jvbO9GEzPpRLtFHWHuJPXAXKeF6ZSIHS2atmXnjbU3l/h7TOAUxmk46gMa32Yg5vq9
 QAYVXB6s0+WK6aSIxfIMV4J2dK60vLEeAZ8qP5V6RuP8LQSYUxYn4ZrOHHEuUlSoFazl
 42rRG0/FsdO3KGnp5mmUrfvNv4oJrRhKHsJzJp7aIvVxSU5Cr2mD4eS6METmjOZjdbQ7
 m+u7BddQtgUviEZxaI/j0pAgXKWSIo/WHvTyAL6uHX/danBUyd1bk0CjD8K6OEjr4qRI
 74h+K4dbQ2FyTjz60+L1aR1e9Ren9bpbmW/mko5otK0DsJgWbn0xMQrTiuoUE0fhKwca
 aLmw==
X-Gm-Message-State: AOAM530uo3rWmRM5mxJwcwNp/RCHjkR/6zOZvobTR3VyH49Av+i5shF9
 rgA8qBXfAFX96ggy15rSoxUmimaoGPdWZWFAaN4L37VDRwtpW4Z54lFNYuEhlk1mN8kWoqip31b
 o6a4dpIkIA4KuLYvIGgC0/8nCNO6FoUKEf1yktKpXoKNjdH8U39sqEN8IWwAt3jgJ36YTCKO6Fe
 BdwL8c
X-Received: by 2002:a05:6402:32a:: with SMTP id
 q10mr6071107edw.15.1616528047190; 
 Tue, 23 Mar 2021 12:34:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+UsrQGiuU+ygKu3pr1goGJotGBZyaWGB1z0Q7G13wKL79SOdoAZn+LbPZCg00Ag30TobuRQ==
X-Received: by 2002:a05:6402:32a:: with SMTP id
 q10mr6071091edw.15.1616528046940; 
 Tue, 23 Mar 2021 12:34:06 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id gn19sm1248719ejc.4.2021.03.23.12.34.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Mar 2021 12:34:06 -0700 (PDT)
Subject: Re: [Intel-gfx] [PATCH] drm/i915/display/vlv_dsi: Do no shut down
 displays on reboot if a DSI panel is used
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20210301154347.50052-1-hdegoede@redhat.com>
 <8d882647-bab3-dfc3-70ad-4f1910dcb5af@redhat.com>
 <YFkDYzN0NJ3Co8bT@intel.com> <YFkFH2uAR+6mNONZ@intel.com>
 <c1beb028-9f9d-ad3e-9a06-2685ca36a8d4@redhat.com>
 <YFkQigJmpLRJWxzb@intel.com>
 <8a127f0c-ba08-3471-88f4-ef0aa281cd7b@redhat.com>
 <YFoqvIf3sU0CUe5X@intel.com>
 <f769c3d7-49d2-5350-0d5a-990463643724@redhat.com>
Message-ID: <0efc5388-0fd9-94c1-c2e7-50ff00b865f3@redhat.com>
Date: Tue, 23 Mar 2021 20:34:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <f769c3d7-49d2-5350-0d5a-990463643724@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SEksCgpPbiAzLzIzLzIxIDg6MTMgUE0sIEhhbnMgZGUgR29lZGUgd3JvdGU6Cj4gSGksCj4gCj4g
T24gMy8yMy8yMSA2OjUxIFBNLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6Cj4+IE9uIFR1ZSwgTWFy
IDIzLCAyMDIxIGF0IDA2OjI5OjUzUE0gKzAxMDAsIEhhbnMgZGUgR29lZGUgd3JvdGU6Cj4+PiBI
aSwKPj4+Cj4+PiBPbiAzLzIyLzIxIDEwOjQ3IFBNLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6Cj4+
Pj4gT24gTW9uLCBNYXIgMjIsIDIwMjEgYXQgMTA6Mjg6MDZQTSArMDEwMCwgSGFucyBkZSBHb2Vk
ZSB3cm90ZToKPj4+Pj4gSGksCj4+Pj4+Cj4+Pj4+IE9uIDMvMjIvMjEgOTo1OSBQTSwgVmlsbGUg
U3lyasOkbMOkIHdyb3RlOgo+Pj4+Pj4gT24gTW9uLCBNYXIgMjIsIDIwMjEgYXQgMDQ6NTE6NDdQ
TSAtMDQwMCwgUm9kcmlnbyBWaXZpIHdyb3RlOgo+Pj4+Pj4+IE9uIEZyaSwgTWFyIDE5LCAyMDIx
IGF0IDA0OjQ1OjMyUE0gKzAxMDAsIEhhbnMgZGUgR29lZGUgd3JvdGU6Cj4+Pj4+Pj4+IEhpLAo+
Pj4+Pj4+Pgo+Pj4+Pj4+PiBPbiAzLzEvMjEgNDo0MyBQTSwgSGFucyBkZSBHb2VkZSB3cm90ZToK
Pj4+Pj4+Pj4+IEFmdGVyIHRoZSByZWNlbnRseSBhZGRlZCBjb21taXQgZmUwZjFlM2JmZGZlICgi
ZHJtL2k5MTU6IFNodXQgZG93bgo+Pj4+Pj4+Pj4gZGlzcGxheXMgZ3JhY2VmdWxseSBvbiByZWJv
b3QiKSwgdGhlIERTSSBwYW5lbCBvbiBhIENoZXJyeSBUcmFpbCBiYXNlZAo+Pj4+Pj4+Pj4gUHJl
ZGlhIEJhc2ljIHRhYmxldCB3b3VsZCBubyBsb25nZXIgcHJvcGVybHkgbGlnaHQgdXAgYWZ0ZXIg
cmVib290Lgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IFRoZSBiYWNrbGlnaHQgc3RpbGwgdHVybnMgYmFj
ayBvbiBhZnRlciByZWJvb3QsIGJ1dCB0aGUgTENEIHNob3dzIGFuCj4+Pj4+Pj4+PiBhbGwgYmxh
Y2sgZGlzcGxheS4gVGhlIGRpc3BsYXkgaXMgYWxzbyBhbGwgYmxhY2sgZHVyaW5nIHRoZSB0aW1l
IHRoYXQKPj4+Pj4+Pj4+IEVGSSAvIHRoZSBHT1AgaXMgbWFuYWdpbmcgaXQsIHNvIGUuZy4gdGhl
IGdydWIgbWVudSBhbHNvIGlzIG5vdCB2aXNpYmxlLgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IEluIHRo
aXMgc2NlbmFyaW8gdGhlIHBhbmVsIGlzIGluaXRpYWxpemVkIHNvIHRoYXQgaXQgYXBwZWFycyB0
byBiZSB3b3JraW5nCj4+Pj4+Pj4+PiBhbmQgdGhlIGZhc3Rib290IGNvZGUgc2tpcHMgZG9pbmcg
YSBtb2Rlc2V0LiBGb3JjaW5nIGEgbW9kZXNldCBieSBkb2luZyBhCj4+Pj4+Pj4+PiBjaHZ0IHRv
IGEgdGV4dC1jb25zb2xlIG92ZXIgc3NoIGZvbGxvd2VkIGJ5IGVjaG8taW5nIDEgYW5kIHRoZW4g
MCB0bwo+Pj4+Pj4+Pj4gL3N5cy9jbGFzcy9ncmFwaGljcy9mYjAvYmxhbmsgY2F1c2VzIHRoZSBw
YW5lbCB0byB3b3JrIGFnYWluLgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IEFkZCBhIFFVSVJLX1NLSVBf
U0hVVERPV04gcXVpcmsgd2hpY2ggdHVybnMgaTkxNV9kcml2ZXJfc2h1dGRvd24oKSBpbnRvCj4+
Pj4+Pj4+PiBhIG5vLW9wIHdoZW4gc2V0OyBhbmQgc2V0IHRoaXMgb24gdmx2L2NodiBkZXZpY2Vz
IHdoZW4gYSBEU0kgcGFuZWwgaXMKPj4+Pj4+Pj4+IGRldGVjdGVkLCB0byB3b3JrIGFyb3VuZCB0
aGlzLgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IEFkbWl0dGVkbHkgdGhpcyBpcyBhIGJpdCBvZiBhIGJp
ZyBoYW1tZXIsIGJ1dCB0aGVzZSBwbGF0Zm9ybXMgaGF2ZSBiZWVuCj4+Pj4+Pj4+PiBhcm91bmQg
Zm9yIHF1aXRlIHNvbWUgdGltZSBub3cgYW5kIHRoZXkgaGF2ZSBhbHdheXMgd29ya2VkIGZpbmUg
d2l0aG91dAo+Pj4+Pj4+Pj4gdGhlIG5ldyBiZWhhdmlvciB0byBzaHV0ZG93biBldmVyeXRoaW5n
IG9uIHNodXRkb3duL3JlYm9vdC4gVGhpcyBhcHByb2FjaAo+Pj4+Pj4+Pj4gc2ltcGx5IGRpc2Fi
bGVzIHRoZSByZWNlbnRseSBpbnRyb2R1Y2VkIG5ldyBzaHV0ZG93biBiZWhhdmlvciBpbiB0aGlz
Cj4+Pj4+Pj4+PiBzcGVjaWZpYyBjYXNlIHdoZXJlIGl0IGlzIGtub3duIHRvIGNhdXNlIHByb2Js
ZW1zLiBXaGljaCBpcyBhIG5pY2UgYW5kCj4+Pj4+Pj4+PiBzaW1wbGUgd2F5IHRvIGRlYWwgd2l0
aCB0aGlzLgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEhhbnMgZGUgR29lZGUg
PGhkZWdvZWRlQHJlZGhhdC5jb20+Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IFBpbmc/IFNpbmNlIHNlbmRp
bmcgdGhpcyBwYXRjaCBJJ3ZlIGJlZW4gc2VlaW5nIHRoZSBpc3N1ZSBhZGRyZXNzZWQgYnkKPj4+
Pj4+Pj4gdGhpcyBvbiB2YXJpb3VyIG90aGVyIENIVCBiYXNlZCBkZXZpY2VzIHRvby4KPj4+Pj4+
Pj4KPj4+Pj4+Pj4gU28gd2UgaGF2ZSB2YXJpb3VzIGRldmljZXMgc3VmZmVyaW5nIGZyb20gYSBi
bGFjayBzY3JlZW4gYWZ0ZXIgcmVib290Cj4+Pj4+Pj4+IG5vdy4gVGhpcyBpcyBwcmV0dHkgc2Vy
aW91cyB1c2FiaWxpdHkgcmVncmVzc2lvbi4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gQXMgc3VjaCBpdCB3
b3VsZCBiZSBnb29kIHRvIGdldCB0aGlzIHJldmlld2VkLCBvciBhbm90aGVyIGZpeCBwcm9wb3Nl
ZC4KPj4+Pj4+Pgo+Pj4+Pj4+IEZvciB0aGUgcXVpcmtzIHdlIHRyeSB0byBsaW1pdCB0aGVtIHRv
IHZlcnkgc3BlY2lmaWMgdmVuZG9yIGFuZCBtb2RlbCBpZHMsCj4+Pj4+Pj4gc28gSSB3b25kZXIg
aWYgaXQgd291bGQgYmUgcG9zc2libGUgdG8gZ2V0IHRoaXMgaW5mb3JtYXRpb24gaW4gaGVyZSBp
bnN0ZWFkCj4+Pj4+Pj4gdG8gYWxsIHRoZSB2bHYgd2l0aCBkc2kuLi4KPj4+Pj4+Pgo+Pj4+Pj4+
IE9yIGF2b2lkIHRoZSBxdWlyayAiaW5mcmEiIGFuZCBza2lwIHRvIGFsbCB2bHYgd2l0aCBhY3Rp
dmUgZHNpPyEKPj4+Pj4+Pgo+Pj4+Pj4+IEphbmk/Cj4+Pj4+Pj4gVmlsbGU/Cj4+Pj4+Pgo+Pj4+
Pj4gV2UgbmVlZCB0byBmaWd1cmUgb3V0IHdoeSB0aGUgcGFuZWwgZG9lc24ndCBzdGFydCB1cCBh
Z2Fpbi4KPj4+Pj4KPj4+Pj4gTm90ZSBpdCBpcyB0aGUgR09QIHdoaWNoIGZhaWxzIHRvIGxpZ2h0
IGl0IHVwIGFnYWluLiBJIHRoaW5rIHdlIHR1cm4gc29tZXRoaW5nCj4+Pj4+IG9mZiwgd2hpY2gg
YWZ0ZXIgYSBwb3dlci1vbi1yZXNldCBpcyBvbiwgc28gdGhlIEdPUCBleHBlY3RzIGl0IHRvIGJl
IG9uLgo+Pj4+Cj4+Pj4gSG1tLiBEbyBhbnkgb2YgdGhlIHJlYm9vdD13YXJtfGNvbGR8d2hhdGV2
ZXIga25vYnMgbWFrZSBhIGRpZmZlcmVuY2U/Cj4+Pj4gQXJlIHRoZXJlIGFueSBmYXN0IHZzLiBz
bG93IGJvb3Qgc2V0dGluZ3MgaW4gdGhlIEJJT1Mgc2V0dXA/Cj4+Pgo+Pj4gT2ssIHNvIEkgd2Fz
IHJ1bm5pbmcgdGhlIHRlc3RzIHdoaWNoIHlvdSByZXF1ZXN0ZWQgYW5kIGR1cmluZyB0aGlzCj4+
PiBJIG1hbmFnZWQgdG8gZmluZCB0aGUgcmVhbCBwcm9ibGVtLgo+Pj4KPj4+IFdoYXQgaGFwcGVu
cyBvbiByZWJvb3QgaXMgYSByZWFsbHkgcXVpY2sgcGFuZWwgb2ZmL29uIGN5Y2xlIGFuZCB0aGF0
IGlzCj4+PiBjYXVzaW5nIHRoZSBpc3N1ZS4KPj4+Cj4+PiBJIGNhbiByZXByb2R1Y2UgdGhpcyBi
eSBkb2luZzoKPj4+Cj4+PiBjaHZ0IDM7IGVjaG8gMSA+IC9zeXMvY2xhc3MvZ3JhcGhpY3MvZmIw
L2JsYW5rOyBlY2hvIDAgPiAvc3lzL2NsYXNzL2dyYXBoaWNzL2ZiMC9ibGFuawo+Pj4KPj4+IFRo
ZSBwcm9ibGVtIGlzIHRoYXQgd2UncmUgbm90IGhvbm9yaW5nIHBhbmVsX3B3cl9jeWNsZV9kZWxh
eSBiZWNhdXNlCj4+PiBpbnRlbF9kc2lfbXNsZWVwKCkgaXMgYSBuby1vcCBvbiBkZXZpY2VzIHdp
dGggYSBNSVBJLXNlcXVlbmNlcyB2ZXJzaW9uID49IDMsCj4+PiBiZWNhdXNlIHRob3NlIHNlcXVl
bmNlcyBhbHJlYWR5IGNvbnRhaW4gdGhlIG5lY2Vzc2FyeSBkZWxheXMsIGF0IGxlYXN0Cj4+PiBm
b3IgbW9zdCBvZiB0aGUgc3RlcHMgZHVyaW5nIHRoZSBvbi9vZmYgc2VxdWVuY2VzLiBJdCBzZWVt
cyB0aGF0IHRoZQo+Pj4gcHdyLWN5Y2xlIGRlbGF5IGlzIG5vdCBoYW5kbGVkIGJ5IHRob3NlIHYz
KyBzZXF1ZW5jZXMuCj4+Pgo+Pj4gU28gZml4aW5nIHRoaXMgaXMgYXMgc2ltcGxlIGFzIHN3aXRj
aGluZyB0byBhIHJlZ3VsYXIgbXNsZWVwIGZvciB0aGUKPj4+IGludGVsX2RzaS0+cGFuZWxfcHdy
X2N5Y2xlX2RlbGF5Lgo+Pj4KPj4+IE9uY2Ugd2UgZG8gdGhhdCBpdCB3b3VsZCBiZSBnb29kIChm
b3IgZS5nLiBzdXNwZW5kL3Jlc3VtZSBzcGVlZCkgdG8gZml4Ogo+Pj4KPj4+ICAgICAgICAgLyoK
Pj4+ICAgICAgICAgICogRklYTUUgQXMgd2UgZG8gd2l0aCBlRFAsIGp1c3QgbWFrZSBhIG5vdGUg
b2YgdGhlIHRpbWUgaGVyZQo+Pj4gICAgICAgICAgKiBhbmQgcGVyZm9ybSB0aGUgd2FpdCBiZWZv
cmUgdGhlIG5leHQgcGFuZWwgcG93ZXIgb24uCj4+PiAgICAgICAgICAqLwo+Pj4KPj4+IFdoaWNo
IHNpdHMgcmlnaHQgYWJvdmUgdGhhdCBtc2xlZXAuIFNpbmNlIEkgaGF2ZSBhIHJlcHJvZHVjZXIg
bm93IHdoaWNoCj4+PiBzaG93cyB3aGVuIHRoZSBzbGVlcCBpcyB0b28gc2hvcnQsIGl0IHNob3Vs
ZCBub3cgYmUgZWFzeSB0aSBmaXggdGhlIEZJWE1FCj4+PiBhbmQgdGVzdCB0aGF0IHRoZSBmaXgg
d29ya3MuIEknbGwgZG8gdGhpcyBpbiBhIHNlcGFyYXRlIHBhdGNoIGFuZCBzZW5kCj4+PiBhIHBh
dGNoLXNldCB3aXRoIGJvdGggcGF0Y2hlcyByZXBsYWNpbmcgdGhpcyBwYXRjaC4KPj4KPj4gQXdl
c29tZS4gSSdtIHJlYWxseSBoYXBweSB0byBhdm9pZCBhbnkgcXVpcmtzIGFuZCB3aGF0bm90IHNp
bmNlCj4+IHRoZXkgYWx3YXlzIGNvbWUgYmFjayB0byBiaXRlIHlvdSBsYXRlci4gVGhhbmtzIGZv
ciBkaWdnaW5nIGludG8gaXQuCj4+Cj4+IFNwZWFraW5nIG9mIERTSSwgeW91IHdvdWxkbid0IGhh
cHBlbiB0byBoYXZlIG9uZSB0aGVzZSBtYWNoaW5lczoKPj4gaHR0cHM6Ly9naXRsYWIuZnJlZWRl
c2t0b3Aub3JnL2RybS9pbnRlbC8tL2lzc3Vlcy8yNjk4ID8KPiAKPiBTb3JyeSBJIGRvbid0IGhh
dmUgYW55IDEwIiBEZWxsIG1vZGVscyBpbiBteSBjb2xsZWN0aW9uLgoKQnV0IEkgZG8gc2VlIHRo
YXQgdGhlIHJlcG9ydGVyIGlzIGEgRmVkb3JhIHVzZXIuIFNvIEkgY2FuIHByZXAgYSB0ZXN0LWtl
cm5lbAppbiBycG0gZm9ybSBmb3IgaGltIHdpdGggdGhlIHBhdGNoIGFwcGxpZWQsIHdoaWNoIHNo
b3VsZCBtYWtlIGl0IGEgbG90IGVhc2llcgpmb3IgdGhlIHJlcG9ydGVyIHRvIHRlc3QgdGhlIHBh
dGNoLgoKSSdtIGJ1aWxkaW5nIGEgdGVzdC1rZXJuZWwgZm9yIHRoaXMgbm93OgpodHRwczovL2tv
amkuZmVkb3JhcHJvamVjdC5vcmcva29qaS90YXNraW5mbz90YXNrSUQ9NjQ0NDc2MTMKCkknbGwg
dXBkYXRlIHRoZSBpc3N1ZSB3aXRoIGEgbGluayB0byBpdCB3aGVuIHRoZSBidWlsZCBpcyBkb25l
LgoKUmVnYXJkcywKCkhhbnMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
