Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFDAF8CF9
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 11:39:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 537626E2BE;
	Tue, 12 Nov 2019 10:39:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA6A86E2BE
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 10:39:27 +0000 (UTC)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-ipLjLvO2Mn-PYVDz0GbErw-1; Tue, 12 Nov 2019 05:39:25 -0500
Received: by mail-wm1-f70.google.com with SMTP id d140so1216519wmd.1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 02:39:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WY/dD7jJqCMema34s8VSNTTglXv9bWnmZfWcrXHnRIE=;
 b=s4Ul2LDAPcQO52oJi6/PKgBTcNaTj+zVBcLwEatKeLx0mdVQ2hjIlBum813aqy6JAz
 rllejMTZVxxGPFem6fr2IfgBx1hN7wOwnDHy2w8SPd+tjpWNoe6i7QaDAasm/mTrKLEd
 mTOM5RZ5Hn5lRbwMJFM6DcqkOEyT3X+RywJO3Q4OlpP9uuehBuIDeAFj0JToJhlbmV3H
 UnvtGf440uTcXy+hiADrbZJsiO2LvmT9RTIu2rwc1XBWkYO/XXvKQYgXb6weMNRMEJ37
 sTkN3AZglUPkbq2aVE1RCy0WybR8t+SN2CLb05xDTISbWaFBAWynMOZxVuFC83UU8jhW
 sYnA==
X-Gm-Message-State: APjAAAWUZBG97Lp+Zqh/kEQF0NF+QyMTXSesei2+VyPlIzaM72I+im0c
 9j1P0hTlRNRn+uxTJDNKkGZgrb6Ox9uzWpN3Zayxw27JNrWe0lu77UNHVUzfJwYFdoBvtYELsz1
 bHgGDUSu8CaW31A/lvLKCVj3VtDwL
X-Received: by 2002:a5d:6104:: with SMTP id v4mr23795483wrt.36.1573555164501; 
 Tue, 12 Nov 2019 02:39:24 -0800 (PST)
X-Google-Smtp-Source: APXvYqye2lpQvGH/RnPZgaaE4xx3Y77yTmtOraKHUQgGQuKudVLVU9mmq2ZWkoskyjFRgokRjj1umw==
X-Received: by 2002:a5d:6104:: with SMTP id v4mr23795460wrt.36.1573555164314; 
 Tue, 12 Nov 2019 02:39:24 -0800 (PST)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl.
 [84.106.84.65])
 by smtp.gmail.com with ESMTPSA id z189sm2936181wmc.25.2019.11.12.02.39.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Nov 2019 02:39:23 -0800 (PST)
Subject: Re: [PATCH 10/12] drm/modes: parse_cmdline: Remove some unnecessary
 code
To: Daniel Vetter <daniel@ffwll.ch>
References: <20191110154101.26486-1-hdegoede@redhat.com>
 <20191110154101.26486-11-hdegoede@redhat.com>
 <20191112094455.GG23790@phenom.ffwll.local>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <3d14cdb1-d5a5-e569-489a-e8c0aa8a1df6@redhat.com>
Date: Tue, 12 Nov 2019 11:39:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191112094455.GG23790@phenom.ffwll.local>
Content-Language: en-US
X-MC-Unique: ipLjLvO2Mn-PYVDz0GbErw-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1573555167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mKRpus6jOaTPB51RjBTEz1a5LwDbzOQyCOS1qqEqdks=;
 b=bqKYiJrjCGUFKKcUvcpCJrNHllzsyp9Y2M0JVNJcOhEKl3xZn5/Re6o3/u5CrfLtXPwZBR
 NIRoJzRtOLxgCeV+YUe/RbC1NgViXxg5lVllYteHw8ntq9pVXDFhz1K9ypjf4PXPLwhnFP
 65us4mxshy4inEI4mo0Ub3u7GP5Y4Ac=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?Q?Mathieu_Alexandre-T=c3=a9treault?= <alexandretm@amotus.ca>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiAxMi0xMS0yMDE5IDEwOjQ0LCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+IE9uIFN1biwg
Tm92IDEwLCAyMDE5IGF0IDA0OjQwOjU5UE0gKzAxMDAsIEhhbnMgZGUgR29lZGUgd3JvdGU6Cj4+
IFJlbW92ZSAyIGJpdHMgb2YgZGVhZC1jb2RlOgo+Pgo+PiAxKSBkcm1fbW9kZV9wYXJzZV9jb21t
YW5kX2xpbmVfZm9yX2Nvbm5lY3RvcigpIGFsd2F5cyBnZXRzIGNhbGxlZCB3aXRoIGEKPj4gemVy
by1lZCBkcm1fY21kbGluZV9tb2RlIHN0cnVjdCBhbmQgYXNzdW1lcyBzbyBpbiBtb3N0IHBsYWNl
cywgc28gdGhlcmUgaXMKPj4gbm8gcmVhc29uIHRvIHNldCBtb2RlLT5zcGVjaWZpZWQgdG8gZmFs
c2UgaWYgbm8gbW9kZV9vcHRpb24gaXMgcHJlc2VudC4KPj4KPiAKPiBIbSBJJ2Qga2VlcCB0aGF0
IHBhcnQsIGp1c3QgZm9yIHNhZmV0eS4gSXQncyBub3QgcmVhbGx5IGEgcGVyZm9ybWFuY2UKPiBj
cml0aWNhbCBwYXRoIHJlYWxseSAuLi4KCkJ1dCB3ZSBkbyBub3QgZXhwbGljaXRseSBzZXQgYnBw
X3NwZWNpZmllZCBvciByZWZyZXNoX3NwZWNpZmllZCB0byBmYWxzZQpldmVyLiBTbyB0aGlzIGlz
IGluY29uc2lzdGVudCwgd2hpY2ggYnVncyBtZSA6KQoKQWx0ZXJuYXRpdmUgcHJvcG9zYWw6IEFk
ZCBhbiBleHBsaWNpdCBtZW1zZXQoLi4uLCAwLCAuLi4pIGF0IHRoZSB0b3Agb2YKdGhlIGZ1bmN0
aW9uIHRvIG1ha2Ugc3VyZSB0aGF0IHdlIGNsZWFyIGV2ZXJ5dGhpbmcgYW5kIG5vdCBqdXN0IDEg
b2YKdGhlIDMgc3BlY2lmaWVkIGZsYWdzLgoKUmVnYXJkcywKCkhhbnMKCgoKCj4gLURhbmllbAo+
IAo+PiAyKSBmYl9nZXRfb3B0aW9ucygpIHdpbGwgcmV0dXJuIGZiX21vZGVfb3B0aW9uIGlmIG5v
IHZpZGVvPTxjb25uZWN0b3ItbmFtZT4KPj4gYXJndW1lbnQgaXMgcHJlc2VudCBvbiB0aGUga2Vy
bmVsIGNvbW1hbmRsaW5lLCBzbyB0aGVyZSBpcyBubyBuZWVkIHRvIGFsc28KPj4gZG8gdGhpcyBp
biBkcm1fbW9kZV9wYXJzZV9jb21tYW5kX2xpbmVfZm9yX2Nvbm5lY3RvcigpIGFzIG91ciBvbmx5
IGNhbGxlcgo+PiB1c2VzIGZiX2dldF9vcHRpb25zKCkgdG8gZ2V0IHRoZSBtb2RlX29wdGlvbiBh
cmd1bWVudC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVk
aGF0LmNvbT4KPj4gLS0tCj4+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rlcy5jIHwgNyAtLS0t
LS0tCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDcgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVzLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVz
LmMKPj4gaW5kZXggMTE5ZmVkN2FiODE1Li4wYmYzY2I4YzA4ZmYgMTAwNjQ0Cj4+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fbW9kZXMuYwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX21v
ZGVzLmMKPj4gQEAgLTE3NDcsMTUgKzE3NDcsOCBAQCBib29sIGRybV9tb2RlX3BhcnNlX2NvbW1h
bmRfbGluZV9mb3JfY29ubmVjdG9yKGNvbnN0IGNoYXIgKm1vZGVfb3B0aW9uLAo+PiAgIAo+PiAg
IAltb2RlLT5wYW5lbF9vcmllbnRhdGlvbiA9IERSTV9NT0RFX1BBTkVMX09SSUVOVEFUSU9OX1VO
S05PV047Cj4+ICAgCj4+IC0jaWZkZWYgQ09ORklHX0ZCCj4+ICAgCWlmICghbW9kZV9vcHRpb24p
Cj4+IC0JCW1vZGVfb3B0aW9uID0gZmJfbW9kZV9vcHRpb247Cj4+IC0jZW5kaWYKPj4gLQo+PiAt
CWlmICghbW9kZV9vcHRpb24pIHsKPj4gLQkJbW9kZS0+c3BlY2lmaWVkID0gZmFsc2U7Cj4+ICAg
CQlyZXR1cm4gZmFsc2U7Cj4+IC0JfQo+PiAgIAo+PiAgIAluYW1lID0gbW9kZV9vcHRpb247Cj4+
ICAgCj4+IC0tIAo+PiAyLjIzLjAKPj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+PiBkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
