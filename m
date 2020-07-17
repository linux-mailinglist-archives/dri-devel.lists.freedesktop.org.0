Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB362237DD
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jul 2020 11:10:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED0B26E0C8;
	Fri, 17 Jul 2020 09:10:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A093B6E0C8
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jul 2020 09:10:29 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id c80so13914255wme.0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jul 2020 02:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=RIrVrjLtwQkL3McUGwUvIB+DN94jC/DLEexvQhe84YU=;
 b=Oat+rg8i3eREhjXd/whtaoFRwxL99mKRwt9AkCnB0C/RJsr759mEe8qgpffcyNXwhG
 39wM8ciPlUx4tVBowm+NAr4Xjo82ghubNT8bHKRqGfdu97LzUEy+6IWkHi4Y5eEwKsqW
 J3BcCuV/p1+VoQPRJOD8bhVAtIUnxxv2Nmy4M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=RIrVrjLtwQkL3McUGwUvIB+DN94jC/DLEexvQhe84YU=;
 b=frLgIneZtc0LRCg2zODA+1JTDYL52BUMQBLoLhYv4Xp1iPonh4kIhQ3nndf3YXJS2t
 +TBR5ZId+OVs18lRVpiq1U8HMqSatCp+tNLIfphVbD0H7nvpe/tacwK7oFFVsmI2UHJE
 KFlYVArhRFN/rKhe1nAeD8z3khdbGrEixhtyroaouzbGb1DMqEPgv4OrtP/SDGFjd8Xt
 kGHwUMsT4Zcy9RSvJg7iEp+XYaQb+fpP8eZIB/516MUYotquSKFbBEkDC+cLh6hWXFpk
 z1r/l8JBlyhPAh1KkV1JMC6HpCosXvD1O9pCK415L3IY2tuUFArqYtdgir1pyA3wgabU
 vRKA==
X-Gm-Message-State: AOAM530kJbniIa6C9aZso/SuOU4iFvzKa0+aUqYFma2DW/usSFl4iHRG
 R71zOgJ2fM8GK+c4aFrYRCP5kg==
X-Google-Smtp-Source: ABdhPJzMR/Nane2DdiBw7mSJD3ueSyM8gA9dJI4WCAq43nH9MbNG5XlLOsgXnYJoYG7mnlR1nH30cA==
X-Received: by 2002:a7b:cc85:: with SMTP id p5mr8072794wma.18.1594977028210;
 Fri, 17 Jul 2020 02:10:28 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u186sm13015061wmu.10.2020.07.17.02.10.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 02:10:27 -0700 (PDT)
Date: Fri, 17 Jul 2020 11:10:25 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: miaoqinglang <miaoqinglang@huawei.com>
Subject: Re: [PATCH -next] drm/komeda: Convert to DEFINE_SHOW_ATTRIBUTE
Message-ID: <20200717091025.GQ3278063@phenom.ffwll.local>
Mail-Followup-To: miaoqinglang <miaoqinglang@huawei.com>,
 "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, nd <nd@arm.com>
References: <20200716090333.13334-1-miaoqinglang@huawei.com>
 <20200717064017.GA76612@jamwan02-TSP300>
 <CAKMK7uEpmhKok9Q3Rrg0v=1p7pv-wpV0Y3-k9GVav+Ad5Z4AkQ@mail.gmail.com>
 <7264de7e-6da4-288d-855d-410b2e05458b@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7264de7e-6da4-288d-855d-410b2e05458b@huawei.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: nd <nd@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMTcsIDIwMjAgYXQgMDQ6MDA6MzZQTSArMDgwMCwgbWlhb3FpbmdsYW5nIHdy
b3RlOgo+IAo+IAo+IOWcqCAyMDIwLzcvMTcgMTU6MDYsIERhbmllbCBWZXR0ZXIg5YaZ6YGTOgo+
ID4gT24gRnJpLCBKdWwgMTcsIDIwMjAgYXQgODo0MCBBTSBqYW1lcyBxaWFuIHdhbmcgKEFybSBU
ZWNobm9sb2d5IENoaW5hKQo+ID4gPGphbWVzLnFpYW4ud2FuZ0Bhcm0uY29tPiB3cm90ZToKPiA+
ID4gCj4gPiA+IE9uIFRodSwgSnVsIDE2LCAyMDIwIGF0IDA1OjAzOjMzUE0gKzA4MDAsIFFpbmds
YW5nIE1pYW8gd3JvdGU6Cj4gPiA+ID4gRnJvbTogTGl1IFNoaXhpbiA8bGl1c2hpeGluMkBodWF3
ZWkuY29tPgo+ID4gPiA+IAo+ID4gPiA+IFVzZSBERUZJTkVfU0hPV19BVFRSSUJVVEUgbWFjcm8g
dG8gc2ltcGxpZnkgdGhlIGNvZGUuCj4gPiA+ID4gCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogTGl1
IFNoaXhpbiA8bGl1c2hpeGluMkBodWF3ZWkuY29tPgo+ID4gPiA+IC0tLQo+ID4gPiA+ICAgZHJp
dmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2LmMgfCAxMyArLS0tLS0t
LS0tLS0tCj4gPiA+ID4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEyIGRlbGV0
aW9ucygtKQo+ID4gPiA+IAo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJt
L2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxh
eS9rb21lZGEva29tZWRhX2Rldi5jCj4gPiA+ID4gaW5kZXggMDI0NmIyZTk0Li40YTEwZTZiOWUg
MTAwNjQ0Cj4gPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9r
b21lZGFfZGV2LmMKPiA+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29t
ZWRhL2tvbWVkYV9kZXYuYwo+ID4gPiA+IEBAIC00MSwxOCArNDEsNyBAQCBzdGF0aWMgaW50IGtv
bWVkYV9yZWdpc3Rlcl9zaG93KHN0cnVjdCBzZXFfZmlsZSAqc2YsIHZvaWQgKngpCj4gPiA+ID4g
ICAgICAgIHJldHVybiAwOwo+ID4gPiA+ICAgfQo+ID4gPiA+IAo+ID4gPiA+IC1zdGF0aWMgaW50
IGtvbWVkYV9yZWdpc3Rlcl9vcGVuKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBmaWxlICpm
aWxwKQo+ID4gPiA+IC17Cj4gPiA+ID4gLSAgICAgcmV0dXJuIHNpbmdsZV9vcGVuKGZpbHAsIGtv
bWVkYV9yZWdpc3Rlcl9zaG93LCBpbm9kZS0+aV9wcml2YXRlKTsKPiA+ID4gPiAtfQo+ID4gPiA+
IC0KPiA+ID4gPiAtc3RhdGljIGNvbnN0IHN0cnVjdCBmaWxlX29wZXJhdGlvbnMga29tZWRhX3Jl
Z2lzdGVyX2ZvcHMgPSB7Cj4gPiA+ID4gLSAgICAgLm93bmVyICAgICAgICAgID0gVEhJU19NT0RV
TEUsCj4gPiA+ID4gLSAgICAgLm9wZW4gICAgICAgICAgID0ga29tZWRhX3JlZ2lzdGVyX29wZW4s
Cj4gPiA+ID4gLSAgICAgLnJlYWRfaXRlciAgICAgICAgICAgICAgPSBzZXFfcmVhZF9pdGVyLAo+
ID4gPiA+IC0gICAgIC5sbHNlZWsgICAgICAgICA9IHNlcV9sc2VlaywKPiA+ID4gPiAtICAgICAu
cmVsZWFzZSAgICAgICAgPSBzaW5nbGVfcmVsZWFzZSwKPiA+ID4gPiAtfTsKPiA+ID4gPiArREVG
SU5FX1NIT1dfQVRUUklCVVRFKGtvbWVkYV9yZWdpc3Rlcik7Cj4gPiA+ID4gCj4gPiA+IAo+ID4g
PiBIaSBTaGl4aW4gJiBRaW5nbGFuZwo+ID4gPiAKPiA+ID4gVGhhbmtzIGZvciB5b3VyIHBhdGNo
Lgo+ID4gPiAKPiA+ID4gUmV2aWV3ZWQtYnk6IEphbWVzIFFpYW4gV2FuZyA8amFtZXMucWlhbi53
YW5nQGFybS5jb20+Cj4gPiA+IAo+ID4gPiBTaW5jZSB5b3VyIHBhdGNoIGlzIG5vdCBmb3IgZHJt
LW1pc2MtbmV4dCwgc28gc2VlbXMgYmV0dGVyCj4gPiA+IHRvIGxlYXZlIGl0IHRvIHlvdSB0byBt
ZXJnZSBpdC4gOikKPiA+IAo+ID4gSSBkbyB0aGluayBpdCdzIGZvciBkcm0tbWlzYy1uZXh0LCB3
aGF0IG90aGVyIHRyZWUgd291bGQgaXQgYmUgZm9yPwo+ID4gU29tZSBwZW9wbGUgcHV0IC1uZXh0
IGluIHRoZWlyIHBhdGNoIHRhZyB0byBkaWZmZXJlbnRpYXRlIGZyb20gLWZpeGVzLAo+ID4gc28g
bWFpbnRhaW5lcnMga25vdyB3aGF0IHRvIGRvIHdpdGggdGhlIHBhdGNoLiBJdCdzIGFsc28gbm90
IHBhcnQgb2YgYQo+ID4gc2VyaWVzLCBoZW5jZSBJIHRoaW5rIHRoaXMgaXMgb24geW91IHRvIGFw
cGx5IGl0Lgo+ID4KPiBIaSBKYW1lcyAmIERhbmllbCwKPiAKPiDigItTb3JyeSBJIGRpZG4ndCBt
YWtlIGl0IGNsZWFyIGluIGNvbW1pdCBsb2csIGJ1dCBpdCBkbyBiYXNlZCBvbiBsaW51eC1uZXh0
Lgo+IAo+IOKAi0kgdGhpbmsgdGhlIHJlYXNvbiB3aHkgSmFtZXMgdGhpbmsgaXQncyBub3QgZm9y
IGRybS1taXNjLW5leHQKPiBpcyBjb25mbGljdHMgZXhpc3RzIHdoZW4gdGhpcyBwYXRjaCBiZWlu
ZyBhcHBsaWVkLiBUaGVyZSdzIGNvbmZsaWN0cyBiZWNhdXNlCj4gY29tbWl0IDw0ZDQ5MDFjNmQ3
PiB3aGljaCBzd2l0Y2hlZCBvdmVyIGRpcmVjdCBzZXFfcmVhZCBtZXRob2QgY2FsbHMgdG8KPiBz
ZXFfcmVhZF9pdGVyIHNob3VsZCBhcHBsaWVkIGJlZm9yZSB0aGlzIGNsZWFuLXVwIHBhdGNoKGxp
bmthZ2UgbGlzdGVkIGFzCj4gYmVsb3cpLgo+IAo+IGh0dHBzOi8va2VybmVsLmdvb2dsZXNvdXJj
ZS5jb20vcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L25leHQvbGludXgtbmV4dC8rLzRkNDkwMWM2
ZDc0OGVmYWI4YWFiNmU3ZDI0MDVkYWRhZWQwYmVhNTAKPiAKPiBJIGNhbiBzZW5kIGEgbmV3IHBh
dGNoIGJhc2VkIG9uIG1haW5saW5lIGlmIG5lZWRlZC4KClVoIHllcyB0aGlzIGlzIGFubm95aW5n
LiBXZSdyZSBhdCBmZWF0dXJlIGN1dG9mZiBzbyB0aGlzIHdpbGwgbGlrZWx5IGNhdXNlCmJhZCBj
b25mbGljdHMgbm8gbWF0dGVyIHdoYXQgaWYgd2UgbWVyZ2UgaXQgbm93LCBidXQgdGhlIGNsZWFu
IHNvbHV0aW9uIGlzCnRvIHJlYmFzZSBvbnRvIGRybS1taXNjLW5leHQsIGFuZCB0aGVuIGxldCBt
YWludGFpbmVycyBzb3J0IG91dCB0aGUgbWVzcwp3aXRoIGNvbmZsaWN0cy4gSXQncyBhIHByZXR0
eSBzaW1wbGUgY2hhbmdlIGluIHRoZSBhYm92ZSBwYXRjaCwgc28Kc2hvdWxkbid0IGNhdXNlIHRv
byBtYW55IHRyb3VibGVzLgotRGFuaWVsCgo+IAo+IOKAi1RoYW5rcy4KPiAKPiBRaW5nbGFuZwo+
IAo+IC4KPiAJCj4gPgo+ID4gQ2hlZXJzLCBEYW5pZWwKPiA+IAo+ID4gPiAKPiA+ID4gVGhhbmtz
Cj4gPiA+IEphbWVzCj4gPiA+IAo+ID4gPiA+ICAgI2lmZGVmIENPTkZJR19ERUJVR19GUwo+ID4g
PiA+ICAgc3RhdGljIHZvaWQga29tZWRhX2RlYnVnZnNfaW5pdChzdHJ1Y3Qga29tZWRhX2RldiAq
bWRldikKPiA+ID4gPiAtLQo+ID4gPiA+IDIuMTcuMQo+ID4gPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0
Cj4gPiA+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+ID4gaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKPiA+IAo+ID4gCj4g
PiAKPiAKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3Jh
dGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
