Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B0834665B
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 18:30:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F4B86EB84;
	Tue, 23 Mar 2021 17:30:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C8EC6EABF
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 17:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616520598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IaXjku08lJw38Jz4K+oKYtPDWrWwNMciFdk/Pj53xdY=;
 b=aJhZ15oDIg1XyhjmKuGcvzd+3Nf+qETFVJ2t33YWQfe7RLnNiJorO3ycS/wIRpYzLN0fIb
 psTmXBGvjmave+RLZaXb81RBy5amLoE3HPF+VS2/i1vG4itmCE4mmEd7UvWx+mMKinv0IP
 YQrfwSjqiRrZaE+QOIgqfOJiR0aUJIE=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-OOBYHcJRMCCIQC3M7fq-iQ-1; Tue, 23 Mar 2021 13:29:56 -0400
X-MC-Unique: OOBYHcJRMCCIQC3M7fq-iQ-1
Received: by mail-ej1-f71.google.com with SMTP id si4so1379806ejb.23
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 10:29:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IaXjku08lJw38Jz4K+oKYtPDWrWwNMciFdk/Pj53xdY=;
 b=eom/UAI5g/cI0SK9tM2KQ8mKx0nhCNpKEStrHcMgWZK7c0Wj76RHkmaZ+klbtUKK8v
 ZqWbCf6arFteE/7F2pN1Rs7y93sFBpCLuHRNHjmMUF4o7GtQ4WMNQnK0q2ndavk8xesO
 N3g/xcW05/qYB9iczV/7WUUTDZD8G/and30rvVuslQc6za5d1+opWNQ9Y8KbAAmS0948
 GeBpTcqnBvh+gbHk/3qb7UrolbLTfnLz9M8/GQUL1KmwuZDXyncv/wV0uZY6hasztVyX
 j1e1q1KfG9I3MT55quUNkCBhSPaCh1SSC6Tqea3fuMC3SUIKKWlsscP9AE5U7OodPeyA
 Y+2w==
X-Gm-Message-State: AOAM530Lm+2ymNT3L5R25Rqakj4dQBJO1nbQxMBuhwE6YOKxDpySDjOQ
 Pwe84gNAOscLhImeqp0pr74fGZsaGxnoVk6pgr0hZLZIICDIJNQFAxGepvBhlx4Eft4iQ4JaIPb
 Q2mG1WuIxJ08Rux8wJBbk6lspRf/y+hTVYCO9RjtY+HH+pyg4sAMhWtYgxS7vczkaH0PpNqLucu
 t15dv2
X-Received: by 2002:a17:906:aad5:: with SMTP id
 kt21mr5930749ejb.160.1616520594678; 
 Tue, 23 Mar 2021 10:29:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6V1MGNXGV7WxOvZK24w+auH2ASZ5A04Mq8FkpNVUuvcpvJwnbhpBCjqVr1kZMm2UAtFaJYg==
X-Received: by 2002:a17:906:aad5:: with SMTP id
 kt21mr5930717ejb.160.1616520594343; 
 Tue, 23 Mar 2021 10:29:54 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id gz20sm11642989ejc.25.2021.03.23.10.29.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Mar 2021 10:29:53 -0700 (PDT)
Subject: Re: [Intel-gfx] [PATCH] drm/i915/display/vlv_dsi: Do no shut down
 displays on reboot if a DSI panel is used
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20210301154347.50052-1-hdegoede@redhat.com>
 <8d882647-bab3-dfc3-70ad-4f1910dcb5af@redhat.com>
 <YFkDYzN0NJ3Co8bT@intel.com> <YFkFH2uAR+6mNONZ@intel.com>
 <c1beb028-9f9d-ad3e-9a06-2685ca36a8d4@redhat.com>
 <YFkQigJmpLRJWxzb@intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <8a127f0c-ba08-3471-88f4-ef0aa281cd7b@redhat.com>
Date: Tue, 23 Mar 2021 18:29:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YFkQigJmpLRJWxzb@intel.com>
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

SGksCgpPbiAzLzIyLzIxIDEwOjQ3IFBNLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6Cj4gT24gTW9u
LCBNYXIgMjIsIDIwMjEgYXQgMTA6Mjg6MDZQTSArMDEwMCwgSGFucyBkZSBHb2VkZSB3cm90ZToK
Pj4gSGksCj4+Cj4+IE9uIDMvMjIvMjEgOTo1OSBQTSwgVmlsbGUgU3lyasOkbMOkIHdyb3RlOgo+
Pj4gT24gTW9uLCBNYXIgMjIsIDIwMjEgYXQgMDQ6NTE6NDdQTSAtMDQwMCwgUm9kcmlnbyBWaXZp
IHdyb3RlOgo+Pj4+IE9uIEZyaSwgTWFyIDE5LCAyMDIxIGF0IDA0OjQ1OjMyUE0gKzAxMDAsIEhh
bnMgZGUgR29lZGUgd3JvdGU6Cj4+Pj4+IEhpLAo+Pj4+Pgo+Pj4+PiBPbiAzLzEvMjEgNDo0MyBQ
TSwgSGFucyBkZSBHb2VkZSB3cm90ZToKPj4+Pj4+IEFmdGVyIHRoZSByZWNlbnRseSBhZGRlZCBj
b21taXQgZmUwZjFlM2JmZGZlICgiZHJtL2k5MTU6IFNodXQgZG93bgo+Pj4+Pj4gZGlzcGxheXMg
Z3JhY2VmdWxseSBvbiByZWJvb3QiKSwgdGhlIERTSSBwYW5lbCBvbiBhIENoZXJyeSBUcmFpbCBi
YXNlZAo+Pj4+Pj4gUHJlZGlhIEJhc2ljIHRhYmxldCB3b3VsZCBubyBsb25nZXIgcHJvcGVybHkg
bGlnaHQgdXAgYWZ0ZXIgcmVib290Lgo+Pj4+Pj4KPj4+Pj4+IFRoZSBiYWNrbGlnaHQgc3RpbGwg
dHVybnMgYmFjayBvbiBhZnRlciByZWJvb3QsIGJ1dCB0aGUgTENEIHNob3dzIGFuCj4+Pj4+PiBh
bGwgYmxhY2sgZGlzcGxheS4gVGhlIGRpc3BsYXkgaXMgYWxzbyBhbGwgYmxhY2sgZHVyaW5nIHRo
ZSB0aW1lIHRoYXQKPj4+Pj4+IEVGSSAvIHRoZSBHT1AgaXMgbWFuYWdpbmcgaXQsIHNvIGUuZy4g
dGhlIGdydWIgbWVudSBhbHNvIGlzIG5vdCB2aXNpYmxlLgo+Pj4+Pj4KPj4+Pj4+IEluIHRoaXMg
c2NlbmFyaW8gdGhlIHBhbmVsIGlzIGluaXRpYWxpemVkIHNvIHRoYXQgaXQgYXBwZWFycyB0byBi
ZSB3b3JraW5nCj4+Pj4+PiBhbmQgdGhlIGZhc3Rib290IGNvZGUgc2tpcHMgZG9pbmcgYSBtb2Rl
c2V0LiBGb3JjaW5nIGEgbW9kZXNldCBieSBkb2luZyBhCj4+Pj4+PiBjaHZ0IHRvIGEgdGV4dC1j
b25zb2xlIG92ZXIgc3NoIGZvbGxvd2VkIGJ5IGVjaG8taW5nIDEgYW5kIHRoZW4gMCB0bwo+Pj4+
Pj4gL3N5cy9jbGFzcy9ncmFwaGljcy9mYjAvYmxhbmsgY2F1c2VzIHRoZSBwYW5lbCB0byB3b3Jr
IGFnYWluLgo+Pj4+Pj4KPj4+Pj4+IEFkZCBhIFFVSVJLX1NLSVBfU0hVVERPV04gcXVpcmsgd2hp
Y2ggdHVybnMgaTkxNV9kcml2ZXJfc2h1dGRvd24oKSBpbnRvCj4+Pj4+PiBhIG5vLW9wIHdoZW4g
c2V0OyBhbmQgc2V0IHRoaXMgb24gdmx2L2NodiBkZXZpY2VzIHdoZW4gYSBEU0kgcGFuZWwgaXMK
Pj4+Pj4+IGRldGVjdGVkLCB0byB3b3JrIGFyb3VuZCB0aGlzLgo+Pj4+Pj4KPj4+Pj4+IEFkbWl0
dGVkbHkgdGhpcyBpcyBhIGJpdCBvZiBhIGJpZyBoYW1tZXIsIGJ1dCB0aGVzZSBwbGF0Zm9ybXMg
aGF2ZSBiZWVuCj4+Pj4+PiBhcm91bmQgZm9yIHF1aXRlIHNvbWUgdGltZSBub3cgYW5kIHRoZXkg
aGF2ZSBhbHdheXMgd29ya2VkIGZpbmUgd2l0aG91dAo+Pj4+Pj4gdGhlIG5ldyBiZWhhdmlvciB0
byBzaHV0ZG93biBldmVyeXRoaW5nIG9uIHNodXRkb3duL3JlYm9vdC4gVGhpcyBhcHByb2FjaAo+
Pj4+Pj4gc2ltcGx5IGRpc2FibGVzIHRoZSByZWNlbnRseSBpbnRyb2R1Y2VkIG5ldyBzaHV0ZG93
biBiZWhhdmlvciBpbiB0aGlzCj4+Pj4+PiBzcGVjaWZpYyBjYXNlIHdoZXJlIGl0IGlzIGtub3du
IHRvIGNhdXNlIHByb2JsZW1zLiBXaGljaCBpcyBhIG5pY2UgYW5kCj4+Pj4+PiBzaW1wbGUgd2F5
IHRvIGRlYWwgd2l0aCB0aGlzLgo+Pj4+Pj4KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEhhbnMgZGUg
R29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+Cj4+Pj4+Cj4+Pj4+IFBpbmc/IFNpbmNlIHNlbmRp
bmcgdGhpcyBwYXRjaCBJJ3ZlIGJlZW4gc2VlaW5nIHRoZSBpc3N1ZSBhZGRyZXNzZWQgYnkKPj4+
Pj4gdGhpcyBvbiB2YXJpb3VyIG90aGVyIENIVCBiYXNlZCBkZXZpY2VzIHRvby4KPj4+Pj4KPj4+
Pj4gU28gd2UgaGF2ZSB2YXJpb3VzIGRldmljZXMgc3VmZmVyaW5nIGZyb20gYSBibGFjayBzY3Jl
ZW4gYWZ0ZXIgcmVib290Cj4+Pj4+IG5vdy4gVGhpcyBpcyBwcmV0dHkgc2VyaW91cyB1c2FiaWxp
dHkgcmVncmVzc2lvbi4KPj4+Pj4KPj4+Pj4gQXMgc3VjaCBpdCB3b3VsZCBiZSBnb29kIHRvIGdl
dCB0aGlzIHJldmlld2VkLCBvciBhbm90aGVyIGZpeCBwcm9wb3NlZC4KPj4+Pgo+Pj4+IEZvciB0
aGUgcXVpcmtzIHdlIHRyeSB0byBsaW1pdCB0aGVtIHRvIHZlcnkgc3BlY2lmaWMgdmVuZG9yIGFu
ZCBtb2RlbCBpZHMsCj4+Pj4gc28gSSB3b25kZXIgaWYgaXQgd291bGQgYmUgcG9zc2libGUgdG8g
Z2V0IHRoaXMgaW5mb3JtYXRpb24gaW4gaGVyZSBpbnN0ZWFkCj4+Pj4gdG8gYWxsIHRoZSB2bHYg
d2l0aCBkc2kuLi4KPj4+Pgo+Pj4+IE9yIGF2b2lkIHRoZSBxdWlyayAiaW5mcmEiIGFuZCBza2lw
IHRvIGFsbCB2bHYgd2l0aCBhY3RpdmUgZHNpPyEKPj4+Pgo+Pj4+IEphbmk/Cj4+Pj4gVmlsbGU/
Cj4+Pgo+Pj4gV2UgbmVlZCB0byBmaWd1cmUgb3V0IHdoeSB0aGUgcGFuZWwgZG9lc24ndCBzdGFy
dCB1cCBhZ2Fpbi4KPj4KPj4gTm90ZSBpdCBpcyB0aGUgR09QIHdoaWNoIGZhaWxzIHRvIGxpZ2h0
IGl0IHVwIGFnYWluLiBJIHRoaW5rIHdlIHR1cm4gc29tZXRoaW5nCj4+IG9mZiwgd2hpY2ggYWZ0
ZXIgYSBwb3dlci1vbi1yZXNldCBpcyBvbiwgc28gdGhlIEdPUCBleHBlY3RzIGl0IHRvIGJlIG9u
Lgo+IAo+IEhtbS4gRG8gYW55IG9mIHRoZSByZWJvb3Q9d2FybXxjb2xkfHdoYXRldmVyIGtub2Jz
IG1ha2UgYSBkaWZmZXJlbmNlPwo+IEFyZSB0aGVyZSBhbnkgZmFzdCB2cy4gc2xvdyBib290IHNl
dHRpbmdzIGluIHRoZSBCSU9TIHNldHVwPwoKT2ssIHNvIEkgd2FzIHJ1bm5pbmcgdGhlIHRlc3Rz
IHdoaWNoIHlvdSByZXF1ZXN0ZWQgYW5kIGR1cmluZyB0aGlzCkkgbWFuYWdlZCB0byBmaW5kIHRo
ZSByZWFsIHByb2JsZW0uCgpXaGF0IGhhcHBlbnMgb24gcmVib290IGlzIGEgcmVhbGx5IHF1aWNr
IHBhbmVsIG9mZi9vbiBjeWNsZSBhbmQgdGhhdCBpcwpjYXVzaW5nIHRoZSBpc3N1ZS4KCkkgY2Fu
IHJlcHJvZHVjZSB0aGlzIGJ5IGRvaW5nOgoKY2h2dCAzOyBlY2hvIDEgPiAvc3lzL2NsYXNzL2dy
YXBoaWNzL2ZiMC9ibGFuazsgZWNobyAwID4gL3N5cy9jbGFzcy9ncmFwaGljcy9mYjAvYmxhbmsK
ClRoZSBwcm9ibGVtIGlzIHRoYXQgd2UncmUgbm90IGhvbm9yaW5nIHBhbmVsX3B3cl9jeWNsZV9k
ZWxheSBiZWNhdXNlCmludGVsX2RzaV9tc2xlZXAoKSBpcyBhIG5vLW9wIG9uIGRldmljZXMgd2l0
aCBhIE1JUEktc2VxdWVuY2VzIHZlcnNpb24gPj0gMywKYmVjYXVzZSB0aG9zZSBzZXF1ZW5jZXMg
YWxyZWFkeSBjb250YWluIHRoZSBuZWNlc3NhcnkgZGVsYXlzLCBhdCBsZWFzdApmb3IgbW9zdCBv
ZiB0aGUgc3RlcHMgZHVyaW5nIHRoZSBvbi9vZmYgc2VxdWVuY2VzLiBJdCBzZWVtcyB0aGF0IHRo
ZQpwd3ItY3ljbGUgZGVsYXkgaXMgbm90IGhhbmRsZWQgYnkgdGhvc2UgdjMrIHNlcXVlbmNlcy4K
ClNvIGZpeGluZyB0aGlzIGlzIGFzIHNpbXBsZSBhcyBzd2l0Y2hpbmcgdG8gYSByZWd1bGFyIG1z
bGVlcCBmb3IgdGhlCmludGVsX2RzaS0+cGFuZWxfcHdyX2N5Y2xlX2RlbGF5LgoKT25jZSB3ZSBk
byB0aGF0IGl0IHdvdWxkIGJlIGdvb2QgKGZvciBlLmcuIHN1c3BlbmQvcmVzdW1lIHNwZWVkKSB0
byBmaXg6CgogICAgICAgIC8qCiAgICAgICAgICogRklYTUUgQXMgd2UgZG8gd2l0aCBlRFAsIGp1
c3QgbWFrZSBhIG5vdGUgb2YgdGhlIHRpbWUgaGVyZQogICAgICAgICAqIGFuZCBwZXJmb3JtIHRo
ZSB3YWl0IGJlZm9yZSB0aGUgbmV4dCBwYW5lbCBwb3dlciBvbi4KICAgICAgICAgKi8KCldoaWNo
IHNpdHMgcmlnaHQgYWJvdmUgdGhhdCBtc2xlZXAuIFNpbmNlIEkgaGF2ZSBhIHJlcHJvZHVjZXIg
bm93IHdoaWNoCnNob3dzIHdoZW4gdGhlIHNsZWVwIGlzIHRvbyBzaG9ydCwgaXQgc2hvdWxkIG5v
dyBiZSBlYXN5IHRpIGZpeCB0aGUgRklYTUUKYW5kIHRlc3QgdGhhdCB0aGUgZml4IHdvcmtzLiBJ
J2xsIGRvIHRoaXMgaW4gYSBzZXBhcmF0ZSBwYXRjaCBhbmQgc2VuZAphIHBhdGNoLXNldCB3aXRo
IGJvdGggcGF0Y2hlcyByZXBsYWNpbmcgdGhpcyBwYXRjaC4KClJlZ2FyZHMsCgpIYW5zCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
