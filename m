Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8198C2C91FB
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 00:06:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56A4B89956;
	Mon, 30 Nov 2020 23:06:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B33889956
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 23:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606777566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6frRBBzQXaMeT/8bnTK/8rFpMmloGyYxD+8Uj5KjWgo=;
 b=E10q+Gqdt2G+Mep6e5faiLjx4GEw0FLg5gZcwee3p9LZt5sO3UA54SiVDTM5N+oZXWuzfQ
 x8Ch5o24eN0wtNLwETfuFeeFDkmg1h7EgB92MElFr+6wweHCIpMVy2o9sxJ7Y/AX00jKGK
 pp4Hs3itxw2yMhNKqTeYQlPw9umKdjk=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-817WC37RM9ySC72Le6J0qg-1; Mon, 30 Nov 2020 18:06:04 -0500
X-MC-Unique: 817WC37RM9ySC72Le6J0qg-1
Received: by mail-qt1-f199.google.com with SMTP id o1so9491072qtp.7
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 15:06:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=6frRBBzQXaMeT/8bnTK/8rFpMmloGyYxD+8Uj5KjWgo=;
 b=m/wGzGKgm071ok9sXzKqdPSPZ8DV2xGEhUlWOHYrLs9a4EABpBJu10rTTRAOvVZlSM
 zZLKJ2mJBE43ecSSPN4m6TgHz6KOehc7YkMjKFwEEzfMrmrbpIXpYUB2YUG5nNzMlqym
 RV4RWDlPASeiy6duk7Tcz65roQWYfADeD83RtRf9hVqfb8WOP+ACzl0vlgjY/y+Wr/Q9
 U4fL9yj40hRuV1EPPKY1gWVpOg1JfoIpfZ6k9NeQLaYo9Bbl43042NOzNn65P4Hn5KrT
 z5yYr1rOm2ab/tHMbYNruVmvqFjhUbvocAOWHQPJxoC0nXJZ7XTbz01waKukxfOnhWL3
 AQSQ==
X-Gm-Message-State: AOAM530Sy5hc7q+ueMdrcVhMlP2hUM1AGV3WrCGuhIQxo03UYuH+sTO5
 RnS68+iCImrX+EOU7Jkv6Wm471HBm40FZAb1tDDFaUmbq4aI36A65qGjsTZp5mfZ8f+/aCBOBXU
 Po852oP32PgKMX/D/DqmaaZc+bnsu
X-Received: by 2002:ac8:46cf:: with SMTP id h15mr23615616qto.99.1606777563004; 
 Mon, 30 Nov 2020 15:06:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyPPVXc2CJiyNmc2S2hfwQESzG7j5pEG12mmoAlT+/dieclhE3Gw6dgwp8JFgE1caYlZzxhpg==
X-Received: by 2002:ac8:46cf:: with SMTP id h15mr23615598qto.99.1606777562748; 
 Mon, 30 Nov 2020 15:06:02 -0800 (PST)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id r89sm16845878qtd.16.2020.11.30.15.06.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 15:06:01 -0800 (PST)
Message-ID: <53161495c2915ad60f749a0917bc606259a78e7c.camel@redhat.com>
Subject: Re: [RFC v2 1/8] drm/i915/dp: Program source OUI on eDP panels
From: Lyude Paul <lyude@redhat.com>
To: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org
Date: Mon, 30 Nov 2020 18:06:00 -0500
In-Reply-To: <87v9dsl7ap.fsf@intel.com>
References: <20200916171855.129511-1-lyude@redhat.com>
 <20200916171855.129511-2-lyude@redhat.com> <87v9dsl7ap.fsf@intel.com>
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
Cc: thaytan@noraisin.net, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Uma Shankar <uma.shankar@intel.com>,
 Sean Paul <seanpaul@chromium.org>,
 =?ISO-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Manasi Navare <manasi.d.navare@intel.com>,
 Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIwLTExLTI2IGF0IDEyOjUxICswMjAwLCBKYW5pIE5pa3VsYSB3cm90ZToKPiBP
biBXZWQsIDE2IFNlcCAyMDIwLCBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPiB3cm90ZToK
PiA+IFNpbmNlIHdlJ3JlIGFib3V0IHRvIHN0YXJ0IGFkZGluZyBzdXBwb3J0IGZvciBJbnRlbCdz
IG1hZ2ljIEhEUgo+ID4gYmFja2xpZ2h0IGludGVyZmFjZSBvdmVyIERQQ0QsIHdlIG5lZWQgdG8g
ZW5zdXJlIHdlJ3JlIHByb3Blcmx5Cj4gPiBwcm9ncmFtbWluZyB0aGlzIGZpZWxkIHNvIHRoYXQg
SW50ZWwgc3BlY2lmaWMgc2luayBzZXJ2aWNlcyBhcmUgZXhwb3NlZC4KPiA+IE90aGVyd2lzZSwg
MHgzMDAtMHgzZmYgd2lsbCBqdXN0IHJlYWQgemVyb2VzLgo+ID4gCj4gPiBXZSBhbHNvIHRha2Ug
Y2FyZSBub3QgdG8gcmVwcm9ncmFtIHRoZSBzb3VyY2UgT1VJIGlmIGl0IGFscmVhZHkgbWF0Y2hl
cwo+ID4gd2hhdCB3ZSBleHBlY3QuIFRoaXMgaXMganVzdCB0byBiZSBjYXJlZnVsIHNvIHRoYXQg
d2UgZG9uJ3QgYWNjaWRlbnRhbGx5Cj4gPiB0YWtlIHRoZSBwYW5lbCBvdXQgb2YgYW55IGJhY2ts
aWdodCBjb250cm9sIG1vZGVzIHdlIGZvdW5kIGl0IGluLgo+ID4gCj4gPiB2MjoKPiA+ICogQWRk
IGNhcmVmdWwgcGFyYW1ldGVyIHRvIGludGVsX2VkcF9pbml0X3NvdXJjZV9vdWkoKSB0byBhdm9p
ZAo+ID4gwqAgcmUtd3JpdGluZyB0aGUgc291cmNlIE9VSSBpZiBpdCdzIGFscmVhZHkgYmVlbiBz
ZXQgZHVyaW5nIGRyaXZlcgo+ID4gwqAgaW5pdGlhbGl6YXRpb24KPiA+IAo+ID4gU2lnbmVkLW9m
Zi1ieTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KPiA+IENjOiB0aGF5dGFuQG5vcmFp
c2luLm5ldAo+ID4gQ2M6IFZhc2lseSBLaG9ydXpoaWNrIDxhbmFyc291bEBnbWFpbC5jb20+Cj4g
PiAtLS0KPiA+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jIHwgMzMg
KysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gwqAxIGZpbGUgY2hhbmdlZCwgMzMgaW5zZXJ0
aW9ucygrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9kcC5jCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAu
Ywo+ID4gaW5kZXggNGJkMTA0NTZhZDE4OC4uN2RiMmI2YTNjZDUyZSAxMDA2NDQKPiA+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYwo+ID4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jCj4gPiBAQCAtMzQyNCw2ICszNDI0LDI5
IEBAIHZvaWQgaW50ZWxfZHBfc2lua19zZXRfZGVjb21wcmVzc2lvbl9zdGF0ZShzdHJ1Y3QKPiA+
IGludGVsX2RwICppbnRlbF9kcCwKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlbmFibGUgPyAiZW5hYmxlIiA6ICJkaXNhYmxlIik7Cj4g
PiDCoH0KPiA+IMKgCj4gPiArc3RhdGljIHZvaWQKPiA+ICtpbnRlbF9lZHBfaW5pdF9zb3VyY2Vf
b3VpKHN0cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHAsIGJvb2wgY2FyZWZ1bCkKPiA+ICt7Cj4gPiAr
wqDCoMKgwqDCoMKgwqBzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqaTkxNSA9IGRwX3RvX2k5MTUo
aW50ZWxfZHApOwo+ID4gK8KgwqDCoMKgwqDCoMKgdTggb3VpW10gPSB7IDB4MDAsIDB4YWEsIDB4
MDEgfTsKPiAKPiBOaXRwaWNrLCBjb3VsZCBiZSBzdGF0aWMgY29uc3QuCj4gCj4gPiArwqDCoMKg
wqDCoMKgwqB1OCBidWZbM10gPSB7IDAgfTsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoC8qCj4g
PiArwqDCoMKgwqDCoMKgwqAgKiBEdXJpbmcgZHJpdmVyIGluaXQsIHdlIHdhbnQgdG8gYmUgY2Fy
ZWZ1bCBhbmQgYXZvaWQgY2hhbmdpbmcKPiA+IHRoZSBzb3VyY2UgT1VJIGlmIGl0J3MKPiA+ICvC
oMKgwqDCoMKgwqDCoCAqIGFscmVhZHkgc2V0IHRvIHdoYXQgd2Ugd2FudCwgc28gYXMgdG8gYXZv
aWQgY2xlYXJpbmcgYW55IHN0YXRlCj4gPiBieSBhY2NpZGVudAo+ID4gK8KgwqDCoMKgwqDCoMKg
ICovCj4gCj4gRGlkIHlvdSBhY3R1YWxseSBvYnNlcnZlIGFueSBpbGwgYmVoYXZpb3VyIHdpdGgg
dW5jb25kaXRpb25hbGx5IHdyaXRpbmcKPiB0aGUgc291cmNlIE9VST8KPiAKPiBJIG1lYW4gaXQn
cyBlYXN5IHRvIGFkZCB0aGUgImNhcmVmdWwiIG1vZGUgYWZ0ZXJ3YXJkcyBpZiB0aGVyZSBhcmUK
PiBjb25jcmV0ZSBpc3N1ZXMsIGJ1dCBpdCdsbCBiZSBoYXJkIHRvIHJlbW92ZSBiZWNhdXNlIGl0
J2xsIGJlIGEKPiBmdW5jdGlvbmFsIGNoYW5nZSBwb3RlbnRpYWxseSBjYXVzaW5nIHJlZ3Jlc3Np
b25zLgoKSSBoYXZlbid0IHlldCwgYWx0aG91Z2ggSSdsbCBnaXZlIGEgdGVzdCBvbiBzb21lIG9m
IHRoZSBvdGhlciBtYWNoaW5lcyBJJ3ZlCmdvdCBseWluZyBhcm91bmQuCgpGV0lXLCByZWxldmFu
dCBzcGVjIGluZm86CgogICBBIFNpbmsgZGV2aWNlIHRoYXQgZG9lcyBub3Qgc3VwcG9ydCB0aGUg
U291cmNlLWRldmljZSBzcGVjaWZpZWQgYmVoYXZpb3IKICAgc3BlY2lmaWVkIGJ5IHRoZSBvd25l
ciBvZiB0aGUgSUVFRSBPVUkgd3JpdHRlbiB0byBpbiBEUENEIEFkZHJlc3NlcyAwMDMwMGgKICAg
dGhyb3VnaCAwMDMwMmggYXMgYmVpbmcgYXNzb2NpYXRlZCB3aXRoIHRoZSBTb3VyY2UgSWRlbnRp
ZmljYXRpb24gc2hhbGwKICAgQVVYX0FDSyBhbGwgd3JpdGVzLCBidXQgdGFrZSBubyBvdGhlciBh
Y3Rpb24sIGFuZCBzaGFsbCByZXNwb25kIHRvIHJlYWRzCiAgIHdpdGggYW4gQVVYX0FDSyBhbmQg
dGhlIHZhbHVlIDAwaC4KCj4gCj4gPiArwqDCoMKgwqDCoMKgwqBpZiAoY2FyZWZ1bCkgewo+ID4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChkcm1fZHBfZHBjZF9yZWFkKCZpbnRl
bF9kcC0+YXV4LCBEUF9TT1VSQ0VfT1VJLCBidWYsCj4gPiBzaXplb2YoYnVmKSkgPCAwKQo+ID4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkcm1fZXJyKCZp
OTE1LT5kcm0sICJGYWlsZWQgdG8gcmVhZCBzb3VyY2UKPiA+IE9VSVxuIik7Cj4gPiArCj4gPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKG1lbWNtcChvdWksIGJ1Ziwgc2l6ZW9m
KG91aSkpID09IDApCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoHJldHVybjsKPiA+ICvCoMKgwqDCoMKgwqDCoH0KPiA+ICsKPiA+ICvCoMKgwqDCoMKg
wqDCoGlmIChkcm1fZHBfZHBjZF93cml0ZSgmaW50ZWxfZHAtPmF1eCwgRFBfU09VUkNFX09VSSwg
b3VpLAo+ID4gc2l6ZW9mKG91aSkpIDwgMCkKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBkcm1fZXJyKCZpOTE1LT5kcm0sICJGYWlsZWQgdG8gd3JpdGUgc291cmNlIE9VSVxuIik7
Cj4gPiArfQo+ID4gKwo+ID4gwqAvKiBJZiB0aGUgc2luayBzdXBwb3J0cyBpdCwgdHJ5IHRvIHNl
dCB0aGUgcG93ZXIgc3RhdGUgYXBwcm9wcmlhdGVseSAqLwo+ID4gwqB2b2lkIGludGVsX2RwX3Np
bmtfZHBtcyhzdHJ1Y3QgaW50ZWxfZHAgKmludGVsX2RwLCBpbnQgbW9kZSkKPiA+IMKgewo+ID4g
QEAgLTM0NDMsNiArMzQ2NiwxMCBAQCB2b2lkIGludGVsX2RwX3NpbmtfZHBtcyhzdHJ1Y3QgaW50
ZWxfZHAgKmludGVsX2RwLAo+ID4gaW50IG1vZGUpCj4gPiDCoMKgwqDCoMKgwqDCoMKgfSBlbHNl
IHsKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IGludGVsX2xzcGNv
biAqbHNwY29uID0gZHBfdG9fbHNwY29uKGludGVsX2RwKTsKPiA+IMKgCj4gPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgLyogV3JpdGUgdGhlIHNvdXJjZSBPVUkgYXMgZWFybHkgYXMg
cG9zc2libGUgKi8KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoaW50ZWxf
ZHBfaXNfZWRwKGludGVsX2RwKSkKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgaW50ZWxfZWRwX2luaXRfc291cmNlX291aShpbnRlbF9kcCwgZmFsc2Up
Owo+ID4gKwo+IAo+IFRoaXMgaHVuayBjb25mbGljdHMsIHdpbGwgbmVlZCBhIHJlYmFzZS4KPiAK
PiBCUiwKPiBKYW5pLgo+IAo+IAo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAv
Kgo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBXaGVuIHR1cm5pbmcgb24s
IHdlIG5lZWQgdG8gcmV0cnkgZm9yIDFtcyB0byBnaXZlIHRoZQo+ID4gc2luawo+ID4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiB0aW1lIHRvIHdha2UgdXAuCj4gPiBAQCAtNDYw
Nyw2ICs0NjM0LDEyIEBAIGludGVsX2VkcF9pbml0X2RwY2Qoc3RydWN0IGludGVsX2RwICppbnRl
bF9kcCkKPiA+IMKgwqDCoMKgwqDCoMKgwqBpZiAoSU5URUxfR0VOKGRldl9wcml2KSA+PSAxMCB8
fCBJU19HRU1JTklMQUtFKGRldl9wcml2KSkKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgaW50ZWxfZHBfZ2V0X2RzY19zaW5rX2NhcChpbnRlbF9kcCk7Cj4gPiDCoAo+ID4gK8Kg
wqDCoMKgwqDCoMKgLyoKPiA+ICvCoMKgwqDCoMKgwqDCoCAqIElmIG5lZWRlZCwgcHJvZ3JhbSBv
dXIgc291cmNlIE9VSSBzbyB3ZSBjYW4gbWFrZSB2YXJpb3VzIEludGVsLQo+ID4gc3BlY2lmaWMg
QVVYIHNlcnZpY2VzCj4gPiArwqDCoMKgwqDCoMKgwqAgKiBhdmFpbGFibGUgKHN1Y2ggYXMgSERS
IGJhY2tsaWdodCBjb250cm9scykKPiA+ICvCoMKgwqDCoMKgwqDCoCAqLwo+ID4gK8KgwqDCoMKg
wqDCoMKgaW50ZWxfZWRwX2luaXRfc291cmNlX291aShpbnRlbF9kcCwgdHJ1ZSk7Cj4gPiArCj4g
PiDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIHRydWU7Cj4gPiDCoH0KPiAKCi0tIApDaGVlcnMsCiBM
eXVkZSBQYXVsIChzaGUvaGVyKQogU29mdHdhcmUgRW5naW5lZXIgYXQgUmVkIEhhdAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
