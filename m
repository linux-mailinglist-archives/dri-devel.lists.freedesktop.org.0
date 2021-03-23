Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBD03468A4
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 20:13:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA0916E936;
	Tue, 23 Mar 2021 19:13:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A87936E90C
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 19:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616526817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=moVtMHqWhBdSJw/BDPL2PYHlBhhecud60xtcsIZXoTM=;
 b=ClXDuCVYS2RgtnVdSBuWEy8CoxuNzxu1jfjIdEW1KHjTcS+LRmcRssLTxR0xDIfY4EXxgd
 lFQHnzYue5HnOVHkGlnhmB1qfAWI+sboyn3JIIMyFN+H32d0sZEV8OHazKGiqSRy/AORcu
 6i5G4tNcc7M5zl8j9ogzZWQf/E8lYWQ=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-MxIk9smmOAWr-EpqArGOIQ-1; Tue, 23 Mar 2021 15:13:35 -0400
X-MC-Unique: MxIk9smmOAWr-EpqArGOIQ-1
Received: by mail-ej1-f72.google.com with SMTP id a22so1495076ejx.10
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 12:13:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=moVtMHqWhBdSJw/BDPL2PYHlBhhecud60xtcsIZXoTM=;
 b=DVASqU75weNFOx42+VVPlNZbjG9PZ6iGtzeTW8I9c7NeN3BYl+6OrQcWjbN5DUEpSH
 2i71M6YaCYEc2i4pzeqOTw+KOUOArZrZZ6eSYjyZHyC9cdefudM1x97j0JRzoJYjUjZS
 kI1HcqoUvLJBeUuvG/SZGHJJ270vN9lA3tN3BH8Xggi/aBCnp34gNaDKMvCw1eq74xyH
 dNI50gxqDifcxjFwnIMe3h5S4f3ipyhWE8aQOtrxDEPVP6LpSgHtuSCODjVfBg72/PyH
 vqGNNv9DV8Gj6Hxmdb42xfC4eM80lbd+uoO9zCpswowndaIyCqEDejqUCiNuUPwTB42v
 Vktw==
X-Gm-Message-State: AOAM531FFEw4gL7KxeB7NwgaN67OUlRR86ciQKGIKEUOxQaDoDwvqHvX
 flTryxLMkfU6g1l7mCTrvk7KBi5V4vfqszwMzsOZQ2LPeZ6Z2FlVZxxkYgjBXSvfklChyOuknLL
 nB/P2YpNlh4rxpV+KpJJTs/l3oJMjT0vOD/IjikAhWMQMiSQzTZQvrM0TOS0Yacd1bXQ8axtw+T
 6EG4X4
X-Received: by 2002:a17:906:d8d3:: with SMTP id
 re19mr6423678ejb.440.1616526813735; 
 Tue, 23 Mar 2021 12:13:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz1mEbMTlQd5w/ba7ktPFg+YmjX/PuDMcKZZtevBsJhF24fxXU+KDlnIl5NblxjHmtFDgGpZA==
X-Received: by 2002:a17:906:d8d3:: with SMTP id
 re19mr6423652ejb.440.1616526813324; 
 Tue, 23 Mar 2021 12:13:33 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id f9sm13412370eds.41.2021.03.23.12.13.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Mar 2021 12:13:32 -0700 (PDT)
Subject: Re: [Intel-gfx] [PATCH] drm/i915/display/vlv_dsi: Do no shut down
 displays on reboot if a DSI panel is used
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20210301154347.50052-1-hdegoede@redhat.com>
 <8d882647-bab3-dfc3-70ad-4f1910dcb5af@redhat.com>
 <YFkDYzN0NJ3Co8bT@intel.com> <YFkFH2uAR+6mNONZ@intel.com>
 <c1beb028-9f9d-ad3e-9a06-2685ca36a8d4@redhat.com>
 <YFkQigJmpLRJWxzb@intel.com>
 <8a127f0c-ba08-3471-88f4-ef0aa281cd7b@redhat.com>
 <YFoqvIf3sU0CUe5X@intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <f769c3d7-49d2-5350-0d5a-990463643724@redhat.com>
Date: Tue, 23 Mar 2021 20:13:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YFoqvIf3sU0CUe5X@intel.com>
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

SGksCgpPbiAzLzIzLzIxIDY6NTEgUE0sIFZpbGxlIFN5cmrDpGzDpCB3cm90ZToKPiBPbiBUdWUs
IE1hciAyMywgMjAyMSBhdCAwNjoyOTo1M1BNICswMTAwLCBIYW5zIGRlIEdvZWRlIHdyb3RlOgo+
PiBIaSwKPj4KPj4gT24gMy8yMi8yMSAxMDo0NyBQTSwgVmlsbGUgU3lyasOkbMOkIHdyb3RlOgo+
Pj4gT24gTW9uLCBNYXIgMjIsIDIwMjEgYXQgMTA6Mjg6MDZQTSArMDEwMCwgSGFucyBkZSBHb2Vk
ZSB3cm90ZToKPj4+PiBIaSwKPj4+Pgo+Pj4+IE9uIDMvMjIvMjEgOTo1OSBQTSwgVmlsbGUgU3ly
asOkbMOkIHdyb3RlOgo+Pj4+PiBPbiBNb24sIE1hciAyMiwgMjAyMSBhdCAwNDo1MTo0N1BNIC0w
NDAwLCBSb2RyaWdvIFZpdmkgd3JvdGU6Cj4+Pj4+PiBPbiBGcmksIE1hciAxOSwgMjAyMSBhdCAw
NDo0NTozMlBNICswMTAwLCBIYW5zIGRlIEdvZWRlIHdyb3RlOgo+Pj4+Pj4+IEhpLAo+Pj4+Pj4+
Cj4+Pj4+Pj4gT24gMy8xLzIxIDQ6NDMgUE0sIEhhbnMgZGUgR29lZGUgd3JvdGU6Cj4+Pj4+Pj4+
IEFmdGVyIHRoZSByZWNlbnRseSBhZGRlZCBjb21taXQgZmUwZjFlM2JmZGZlICgiZHJtL2k5MTU6
IFNodXQgZG93bgo+Pj4+Pj4+PiBkaXNwbGF5cyBncmFjZWZ1bGx5IG9uIHJlYm9vdCIpLCB0aGUg
RFNJIHBhbmVsIG9uIGEgQ2hlcnJ5IFRyYWlsIGJhc2VkCj4+Pj4+Pj4+IFByZWRpYSBCYXNpYyB0
YWJsZXQgd291bGQgbm8gbG9uZ2VyIHByb3Blcmx5IGxpZ2h0IHVwIGFmdGVyIHJlYm9vdC4KPj4+
Pj4+Pj4KPj4+Pj4+Pj4gVGhlIGJhY2tsaWdodCBzdGlsbCB0dXJucyBiYWNrIG9uIGFmdGVyIHJl
Ym9vdCwgYnV0IHRoZSBMQ0Qgc2hvd3MgYW4KPj4+Pj4+Pj4gYWxsIGJsYWNrIGRpc3BsYXkuIFRo
ZSBkaXNwbGF5IGlzIGFsc28gYWxsIGJsYWNrIGR1cmluZyB0aGUgdGltZSB0aGF0Cj4+Pj4+Pj4+
IEVGSSAvIHRoZSBHT1AgaXMgbWFuYWdpbmcgaXQsIHNvIGUuZy4gdGhlIGdydWIgbWVudSBhbHNv
IGlzIG5vdCB2aXNpYmxlLgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBJbiB0aGlzIHNjZW5hcmlvIHRoZSBw
YW5lbCBpcyBpbml0aWFsaXplZCBzbyB0aGF0IGl0IGFwcGVhcnMgdG8gYmUgd29ya2luZwo+Pj4+
Pj4+PiBhbmQgdGhlIGZhc3Rib290IGNvZGUgc2tpcHMgZG9pbmcgYSBtb2Rlc2V0LiBGb3JjaW5n
IGEgbW9kZXNldCBieSBkb2luZyBhCj4+Pj4+Pj4+IGNodnQgdG8gYSB0ZXh0LWNvbnNvbGUgb3Zl
ciBzc2ggZm9sbG93ZWQgYnkgZWNoby1pbmcgMSBhbmQgdGhlbiAwIHRvCj4+Pj4+Pj4+IC9zeXMv
Y2xhc3MvZ3JhcGhpY3MvZmIwL2JsYW5rIGNhdXNlcyB0aGUgcGFuZWwgdG8gd29yayBhZ2Fpbi4K
Pj4+Pj4+Pj4KPj4+Pj4+Pj4gQWRkIGEgUVVJUktfU0tJUF9TSFVURE9XTiBxdWlyayB3aGljaCB0
dXJucyBpOTE1X2RyaXZlcl9zaHV0ZG93bigpIGludG8KPj4+Pj4+Pj4gYSBuby1vcCB3aGVuIHNl
dDsgYW5kIHNldCB0aGlzIG9uIHZsdi9jaHYgZGV2aWNlcyB3aGVuIGEgRFNJIHBhbmVsIGlzCj4+
Pj4+Pj4+IGRldGVjdGVkLCB0byB3b3JrIGFyb3VuZCB0aGlzLgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBB
ZG1pdHRlZGx5IHRoaXMgaXMgYSBiaXQgb2YgYSBiaWcgaGFtbWVyLCBidXQgdGhlc2UgcGxhdGZv
cm1zIGhhdmUgYmVlbgo+Pj4+Pj4+PiBhcm91bmQgZm9yIHF1aXRlIHNvbWUgdGltZSBub3cgYW5k
IHRoZXkgaGF2ZSBhbHdheXMgd29ya2VkIGZpbmUgd2l0aG91dAo+Pj4+Pj4+PiB0aGUgbmV3IGJl
aGF2aW9yIHRvIHNodXRkb3duIGV2ZXJ5dGhpbmcgb24gc2h1dGRvd24vcmVib290LiBUaGlzIGFw
cHJvYWNoCj4+Pj4+Pj4+IHNpbXBseSBkaXNhYmxlcyB0aGUgcmVjZW50bHkgaW50cm9kdWNlZCBu
ZXcgc2h1dGRvd24gYmVoYXZpb3IgaW4gdGhpcwo+Pj4+Pj4+PiBzcGVjaWZpYyBjYXNlIHdoZXJl
IGl0IGlzIGtub3duIHRvIGNhdXNlIHByb2JsZW1zLiBXaGljaCBpcyBhIG5pY2UgYW5kCj4+Pj4+
Pj4+IHNpbXBsZSB3YXkgdG8gZGVhbCB3aXRoIHRoaXMuCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IFNpZ25l
ZC1vZmYtYnk6IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+Cj4+Pj4+Pj4KPj4+
Pj4+PiBQaW5nPyBTaW5jZSBzZW5kaW5nIHRoaXMgcGF0Y2ggSSd2ZSBiZWVuIHNlZWluZyB0aGUg
aXNzdWUgYWRkcmVzc2VkIGJ5Cj4+Pj4+Pj4gdGhpcyBvbiB2YXJpb3VyIG90aGVyIENIVCBiYXNl
ZCBkZXZpY2VzIHRvby4KPj4+Pj4+Pgo+Pj4+Pj4+IFNvIHdlIGhhdmUgdmFyaW91cyBkZXZpY2Vz
IHN1ZmZlcmluZyBmcm9tIGEgYmxhY2sgc2NyZWVuIGFmdGVyIHJlYm9vdAo+Pj4+Pj4+IG5vdy4g
VGhpcyBpcyBwcmV0dHkgc2VyaW91cyB1c2FiaWxpdHkgcmVncmVzc2lvbi4KPj4+Pj4+Pgo+Pj4+
Pj4+IEFzIHN1Y2ggaXQgd291bGQgYmUgZ29vZCB0byBnZXQgdGhpcyByZXZpZXdlZCwgb3IgYW5v
dGhlciBmaXggcHJvcG9zZWQuCj4+Pj4+Pgo+Pj4+Pj4gRm9yIHRoZSBxdWlya3Mgd2UgdHJ5IHRv
IGxpbWl0IHRoZW0gdG8gdmVyeSBzcGVjaWZpYyB2ZW5kb3IgYW5kIG1vZGVsIGlkcywKPj4+Pj4+
IHNvIEkgd29uZGVyIGlmIGl0IHdvdWxkIGJlIHBvc3NpYmxlIHRvIGdldCB0aGlzIGluZm9ybWF0
aW9uIGluIGhlcmUgaW5zdGVhZAo+Pj4+Pj4gdG8gYWxsIHRoZSB2bHYgd2l0aCBkc2kuLi4KPj4+
Pj4+Cj4+Pj4+PiBPciBhdm9pZCB0aGUgcXVpcmsgImluZnJhIiBhbmQgc2tpcCB0byBhbGwgdmx2
IHdpdGggYWN0aXZlIGRzaT8hCj4+Pj4+Pgo+Pj4+Pj4gSmFuaT8KPj4+Pj4+IFZpbGxlPwo+Pj4+
Pgo+Pj4+PiBXZSBuZWVkIHRvIGZpZ3VyZSBvdXQgd2h5IHRoZSBwYW5lbCBkb2Vzbid0IHN0YXJ0
IHVwIGFnYWluLgo+Pj4+Cj4+Pj4gTm90ZSBpdCBpcyB0aGUgR09QIHdoaWNoIGZhaWxzIHRvIGxp
Z2h0IGl0IHVwIGFnYWluLiBJIHRoaW5rIHdlIHR1cm4gc29tZXRoaW5nCj4+Pj4gb2ZmLCB3aGlj
aCBhZnRlciBhIHBvd2VyLW9uLXJlc2V0IGlzIG9uLCBzbyB0aGUgR09QIGV4cGVjdHMgaXQgdG8g
YmUgb24uCj4+Pgo+Pj4gSG1tLiBEbyBhbnkgb2YgdGhlIHJlYm9vdD13YXJtfGNvbGR8d2hhdGV2
ZXIga25vYnMgbWFrZSBhIGRpZmZlcmVuY2U/Cj4+PiBBcmUgdGhlcmUgYW55IGZhc3QgdnMuIHNs
b3cgYm9vdCBzZXR0aW5ncyBpbiB0aGUgQklPUyBzZXR1cD8KPj4KPj4gT2ssIHNvIEkgd2FzIHJ1
bm5pbmcgdGhlIHRlc3RzIHdoaWNoIHlvdSByZXF1ZXN0ZWQgYW5kIGR1cmluZyB0aGlzCj4+IEkg
bWFuYWdlZCB0byBmaW5kIHRoZSByZWFsIHByb2JsZW0uCj4+Cj4+IFdoYXQgaGFwcGVucyBvbiBy
ZWJvb3QgaXMgYSByZWFsbHkgcXVpY2sgcGFuZWwgb2ZmL29uIGN5Y2xlIGFuZCB0aGF0IGlzCj4+
IGNhdXNpbmcgdGhlIGlzc3VlLgo+Pgo+PiBJIGNhbiByZXByb2R1Y2UgdGhpcyBieSBkb2luZzoK
Pj4KPj4gY2h2dCAzOyBlY2hvIDEgPiAvc3lzL2NsYXNzL2dyYXBoaWNzL2ZiMC9ibGFuazsgZWNo
byAwID4gL3N5cy9jbGFzcy9ncmFwaGljcy9mYjAvYmxhbmsKPj4KPj4gVGhlIHByb2JsZW0gaXMg
dGhhdCB3ZSdyZSBub3QgaG9ub3JpbmcgcGFuZWxfcHdyX2N5Y2xlX2RlbGF5IGJlY2F1c2UKPj4g
aW50ZWxfZHNpX21zbGVlcCgpIGlzIGEgbm8tb3Agb24gZGV2aWNlcyB3aXRoIGEgTUlQSS1zZXF1
ZW5jZXMgdmVyc2lvbiA+PSAzLAo+PiBiZWNhdXNlIHRob3NlIHNlcXVlbmNlcyBhbHJlYWR5IGNv
bnRhaW4gdGhlIG5lY2Vzc2FyeSBkZWxheXMsIGF0IGxlYXN0Cj4+IGZvciBtb3N0IG9mIHRoZSBz
dGVwcyBkdXJpbmcgdGhlIG9uL29mZiBzZXF1ZW5jZXMuIEl0IHNlZW1zIHRoYXQgdGhlCj4+IHB3
ci1jeWNsZSBkZWxheSBpcyBub3QgaGFuZGxlZCBieSB0aG9zZSB2Mysgc2VxdWVuY2VzLgo+Pgo+
PiBTbyBmaXhpbmcgdGhpcyBpcyBhcyBzaW1wbGUgYXMgc3dpdGNoaW5nIHRvIGEgcmVndWxhciBt
c2xlZXAgZm9yIHRoZQo+PiBpbnRlbF9kc2ktPnBhbmVsX3B3cl9jeWNsZV9kZWxheS4KPj4KPj4g
T25jZSB3ZSBkbyB0aGF0IGl0IHdvdWxkIGJlIGdvb2QgKGZvciBlLmcuIHN1c3BlbmQvcmVzdW1l
IHNwZWVkKSB0byBmaXg6Cj4+Cj4+ICAgICAgICAgLyoKPj4gICAgICAgICAgKiBGSVhNRSBBcyB3
ZSBkbyB3aXRoIGVEUCwganVzdCBtYWtlIGEgbm90ZSBvZiB0aGUgdGltZSBoZXJlCj4+ICAgICAg
ICAgICogYW5kIHBlcmZvcm0gdGhlIHdhaXQgYmVmb3JlIHRoZSBuZXh0IHBhbmVsIHBvd2VyIG9u
Lgo+PiAgICAgICAgICAqLwo+Pgo+PiBXaGljaCBzaXRzIHJpZ2h0IGFib3ZlIHRoYXQgbXNsZWVw
LiBTaW5jZSBJIGhhdmUgYSByZXByb2R1Y2VyIG5vdyB3aGljaAo+PiBzaG93cyB3aGVuIHRoZSBz
bGVlcCBpcyB0b28gc2hvcnQsIGl0IHNob3VsZCBub3cgYmUgZWFzeSB0aSBmaXggdGhlIEZJWE1F
Cj4+IGFuZCB0ZXN0IHRoYXQgdGhlIGZpeCB3b3Jrcy4gSSdsbCBkbyB0aGlzIGluIGEgc2VwYXJh
dGUgcGF0Y2ggYW5kIHNlbmQKPj4gYSBwYXRjaC1zZXQgd2l0aCBib3RoIHBhdGNoZXMgcmVwbGFj
aW5nIHRoaXMgcGF0Y2guCj4gCj4gQXdlc29tZS4gSSdtIHJlYWxseSBoYXBweSB0byBhdm9pZCBh
bnkgcXVpcmtzIGFuZCB3aGF0bm90IHNpbmNlCj4gdGhleSBhbHdheXMgY29tZSBiYWNrIHRvIGJp
dGUgeW91IGxhdGVyLiBUaGFua3MgZm9yIGRpZ2dpbmcgaW50byBpdC4KPiAKPiBTcGVha2luZyBv
ZiBEU0ksIHlvdSB3b3VsZG4ndCBoYXBwZW4gdG8gaGF2ZSBvbmUgdGhlc2UgbWFjaGluZXM6Cj4g
aHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9pbnRlbC8tL2lzc3Vlcy8yNjk4ID8K
ClNvcnJ5IEkgZG9uJ3QgaGF2ZSBhbnkgMTAiIERlbGwgbW9kZWxzIGluIG15IGNvbGxlY3Rpb24u
CgpSZWdhcmRzLAoKSGFucwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
