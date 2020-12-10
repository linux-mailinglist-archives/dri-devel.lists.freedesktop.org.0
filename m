Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D192D6441
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 18:59:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 536646EA8C;
	Thu, 10 Dec 2020 17:59:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 158226E952
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 17:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607623188;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=miPlyEGKFxoGa24ryNqCASQdc5deGGtvievJU2IZNcA=;
 b=U8YFkJGLzGxOVy2gG2pBCORGsYZgenYBOcC0pQZ25jqEkLeSbRxsOytFQumez6raed5WEn
 MUUtDJ6E7WNU0vjodz7UhgVdW+9Aafmqa0g46KgR8xJSD5BDYhEOshM7mu8viPyGcFgJ5T
 kLkBle+hILIeoOB03eR5zXZ1YOqsSe0=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435--eRR7dPzP--S_Q-vR56Ksw-1; Thu, 10 Dec 2020 12:59:46 -0500
X-MC-Unique: -eRR7dPzP--S_Q-vR56Ksw-1
Received: by mail-qt1-f200.google.com with SMTP id j1so4532220qtd.13
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 09:59:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=miPlyEGKFxoGa24ryNqCASQdc5deGGtvievJU2IZNcA=;
 b=P/m3YVIF4D81kM321be5qx9ldriPOWOZ+0UsZgtneIwiKeVUPkliL8Z4X7QS2NGw/A
 qBwj6Pnrg/UYZ1zX4O5YxQTkGdK7N8DwqHzK7s2kE0dYBG82LsjOvvTgGPs29qB8II5L
 F1Qf+BZTCG60wlcCYce5TU7htGNVuE6lWEMGMVxdydJGEQ6T6GC/Tj4L8UMlY1Qb4QzE
 OF4an9VeZ2sDPQWsVZFb4Hh/VNNisiXJ1Wu4sspKqU0HFMuwGmKRoIUIvu1RhgvwvMUx
 Kaj2nhtqOy8xinPNqJBG7TzKO9hcsgDwNv17/1f3dNPXJvZ+Ht2LoSUAJPq1LAdrc6UA
 MUBg==
X-Gm-Message-State: AOAM5328luwfRZ7role/BOlP9wMguBkPPVvq66XclsLEtfqpHplKN7CK
 n2oS2pxZKbMXYg/3/HNXCDPILmowOD2sCidAm8mEO2fC18GZckQ1lVmPuny3w4PoQzjeY0RAL++
 CqXTyTS3b1CgUWXfsYIPjqBvW5gbt
X-Received: by 2002:aed:3051:: with SMTP id 75mr10549236qte.64.1607623185870; 
 Thu, 10 Dec 2020 09:59:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxxejh2Gr5HYiB6KfMBmbtZVRZHA4dnV4LUHU7T3+dXsaBxb5lrxub5RIB9FoNV4l/s8tTX7w==
X-Received: by 2002:aed:3051:: with SMTP id 75mr10549123qte.64.1607623184645; 
 Thu, 10 Dec 2020 09:59:44 -0800 (PST)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id z8sm3851407qti.22.2020.12.10.09.59.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 09:59:43 -0800 (PST)
Message-ID: <c4726b0adb72bbc9f740f05c22af1c6b9401a8e1.camel@redhat.com>
Subject: Re: [PATCH 2/7] Revert "ACPI / OSI: Add OEM _OSI string to enable
 NVidia HDMI audio"
From: Lyude Paul <lyude@redhat.com>
To: Karol Herbst <kherbst@redhat.com>, linux-kernel@vger.kernel.org, 
 linux-acpi@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org
Date: Thu, 10 Dec 2020 12:59:42 -0500
In-Reply-To: <20190814213118.28473-3-kherbst@redhat.com>
References: <20190814213118.28473-1-kherbst@redhat.com>
 <20190814213118.28473-3-kherbst@redhat.com>
Organization: Red Hat
User-Agent: Evolution 3.38.1 (3.38.1-1.fc33)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Reply-To: lyude@redhat.com
Cc: Dave Airlie <airlied@redhat.com>, Alex Hung <alex.hung@canonical.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIGJ1bXBpbmcgdGhlIGRpc2N1c3Npb24gYWdhaW4gaGVyZSBiZWNhdXNlIHdlIGp1c3QgcmFu
IGludG8gdGhpcyBhZ2FpbiwgYXMgd2UKanVzdCBoYWQgYSBsYXB0b3AgT0VNIHRyeSB0byBmaXgg
YW5vdGhlciBpc3N1ZSBieSBhZGRpbmcgYW4gT1NJIGNoZWNrIGZvciB0aGVzZQpzdHJpbmdzIGlu
c3RlYWQgb2YgaGVscGluZyB1cyBmaXggdGhlIGlzc3VlIGluIG5vdXZlYXUuIE5vdGUgYXMgIHdl
bGwgdGhlIGlzc3VlCkknbSByZWZlcnJpbmcgdG8gaXMgZW50aXJlbHkgaW5kZXBlbmRlbnQgb2Yg
cnVudGltZSBEMywgc28gd2UganVzdCBnb3QgcnVudGltZQpEMyBicm9rZW4gYWdhaW4gYmVjYXVz
ZSBvZiB0aGVzZSBoYWNrcy4KCldoeSBoYXNuJ3QgdGhpcyBwYXRjaCBiZWVuIGFjY2VwdGVkIGlu
dG8gdGhlIGtlcm5lbD8gVGhlc2Ugd2VyZSBhZGRlZCB3aXRob3V0CmFueSBzb3J0IG9mIGRpc2N1
c3Npb24gd2l0aCBub3V2ZWF1IGRldmVsb3BlcnMsIGFuZCBub3V2ZWF1IGlzIHRoZSBjYW5vbmlj
YWwKbnZpZGlhIGRyaXZlciBpbiB0aGUgTGludXgga2VybmVsLiBUaGVzZSBzdHJpbmdzIHNob3Vs
ZG4ndCBiZSBoZXJlIHdpdGhvdXQKZGlzY3Vzc2lvbiB3aXRoIHRoZSByZWxldmFudCBkcml2ZXIg
bWFpbnRhaW5lcnMsIGFuZCBuZWVkIHRvIGJlIHJlbW92ZWQuCgpPbiBXZWQsIDIwMTktMDgtMTQg
YXQgMjM6MzEgKzAyMDAsIEthcm9sIEhlcmJzdCB3cm90ZToKPiBUaGlzIHJldmVydHMgY29tbWl0
IDg4NzUzMmNhN2NhNTlmY2YwNTQ3YTc5MjExNzU2NzkxMTI4MDMwYTMuCj4gCj4gV2UgaGF2ZSBh
IGJldHRlciBzb2x1dGlvbiBmb3IgdGhpczogYjUxNmVhNTg2ZDcxNwo+IAo+IEFuZCBzYW1lIGFz
IHdpdGggdGhlIGxhc3QgY29tbWl0OiAiTlZpZGlhIExpbnV4IGRyaXZlciIgdGhhdCdzIE5vdXZl
YXUsIGFueQo+IG91dCBvZiB0cmVlIGRyaXZlciBkb2VzIF9ub3RfIG1hdHRlci4gQW5kIHdpdGgg
Tm91dmVhdSBhbGwgb2YgdGhpcyB3b3JrcyBldmVuCj4gdGhvdWdoIGl0IHJlcXVpcmVkIGEgcHJv
cGVyIGZpeCBmaXJzdCwgYnV0IHdlIGhhdmUgdGhhdCBub3cuCj4gCj4gU2lnbmVkLW9mZi1ieTog
S2Fyb2wgSGVyYnN0IDxraGVyYnN0QHJlZGhhdC5jb20+Cj4gQ0M6IEFsZXggSHVuZyA8YWxleC5o
dW5nQGNhbm9uaWNhbC5jb20+Cj4gQ0M6IFJhZmFlbCBKLiBXeXNvY2tpIDxyYWZhZWwuai53eXNv
Y2tpQGludGVsLmNvbT4KPiBDQzogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KPiBD
QzogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KPiBDQzogQmVuIFNrZWdncyA8YnNrZWdn
c0ByZWRoYXQuY29tPgo+IC0tLQo+IMKgZHJpdmVycy9hY3BpL29zaS5jIHwgOCAtLS0tLS0tLQo+
IMKgMSBmaWxlIGNoYW5nZWQsIDggZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvYWNwaS9vc2kuYyBiL2RyaXZlcnMvYWNwaS9vc2kuYwo+IGluZGV4IDliMjBhYzRkNzlhMC4u
NTZjYzk1YjZiNzI0IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvYWNwaS9vc2kuYwo+ICsrKyBiL2Ry
aXZlcnMvYWNwaS9vc2kuYwo+IEBAIC01MywxNCArNTMsNiBAQCBvc2lfc2V0dXBfZW50cmllc1tP
U0lfU1RSSU5HX0VOVFJJRVNfTUFYXSBfX2luaXRkYXRhID0gewo+IMKgwqDCoMKgwqDCoMKgwqAg
KiBiZSByZW1vdmVkIGlmIGJvdGggbmV3IGFuZCBvbGQgZ3JhcGhpY3MgY2FyZHMgYXJlIHN1cHBv
cnRlZC4KPiDCoMKgwqDCoMKgwqDCoMKgICovCj4gwqDCoMKgwqDCoMKgwqDCoHsiTGludXgtRGVs
bC1WaWRlbyIsIHRydWV9LAo+IC3CoMKgwqDCoMKgwqDCoC8qCj4gLcKgwqDCoMKgwqDCoMKgICog
TGludXgtTGVub3ZvLU5WLUhETUktQXVkaW8gaXMgdXNlZCBieSBCSU9TIHRvIHBvd2VyIG9uIE5W
aWRpYSdzCj4gSERNSQo+IC3CoMKgwqDCoMKgwqDCoCAqIGF1ZGlvIGRldmljZSB3aGljaCBpcyB0
dXJuZWQgb2ZmIGZvciBwb3dlci1zYXZpbmcgaW4gV2luZG93cyBPUy4KPiAtwqDCoMKgwqDCoMKg
wqAgKiBUaGlzIHBvd2VyIG1hbmFnZW1lbnQgZmVhdHVyZSBvYnNlcnZlZCBvbiBzb21lIExlbm92
byBUaGlua3BhZAo+IC3CoMKgwqDCoMKgwqDCoCAqIHN5c3RlbXMgd2hpY2ggd2lsbCBub3QgYmUg
YWJsZSB0byBvdXRwdXQgYXVkaW8gdmlhIEhETUkgd2l0aG91dAo+IC3CoMKgwqDCoMKgwqDCoCAq
IGEgQklPUyB3b3JrYXJvdW5kLgo+IC3CoMKgwqDCoMKgwqDCoCAqLwo+IC3CoMKgwqDCoMKgwqDC
oHsiTGludXgtTGVub3ZvLU5WLUhETUktQXVkaW8iLCB0cnVlfSwKPiDCoH07Cj4gwqAKPiDCoHN0
YXRpYyB1MzIgYWNwaV9vc2lfaGFuZGxlcihhY3BpX3N0cmluZyBpbnRlcmZhY2UsIHUzMiBzdXBw
b3J0ZWQpCgotLSAKU2luY2VyZWx5LAogICBMeXVkZSBQYXVsIChzaGUvaGVyKQogICBTb2Z0d2Fy
ZSBFbmdpbmVlciBhdCBSZWQgSGF0CiAgIApOb3RlOiBJIGRlYWwgd2l0aCBhIGxvdCBvZiBlbWFp
bHMgYW5kIGhhdmUgYSBsb3Qgb2YgYnVncyBvbiBteSBwbGF0ZS4gSWYgeW91J3ZlCmFza2VkIG1l
IGEgcXVlc3Rpb24sIGFyZSB3YWl0aW5nIGZvciBhIHJldmlldy9tZXJnZSBvbiBhIHBhdGNoLCBl
dGMuIGFuZCBJCmhhdmVuJ3QgcmVzcG9uZGVkIGluIGEgd2hpbGUsIHBsZWFzZSBmZWVsIGZyZWUg
dG8gc2VuZCBtZSBhbm90aGVyIGVtYWlsIHRvIGNoZWNrCm9uIG15IHN0YXR1cy4gSSBkb24ndCBi
aXRlIQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
