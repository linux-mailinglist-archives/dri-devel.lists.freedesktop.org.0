Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CC5F9899
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 19:27:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB4726EBC0;
	Tue, 12 Nov 2019 18:27:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACAD16EBC0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 18:27:09 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id r10so19685662wrx.3
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 10:27:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=+1crLA0CDKaHQwRJPotAhe5OcKExhLg2j+GgM+2/R+w=;
 b=l9xBRfCTPfn0vQIctaLoi4ifWn8hw29FJl/ZG3T3Ov4jReSn3Kxrp26mI+YKPwOxrs
 AdUIceD5YOOQKz5CJDYvvET/WmTQJ+gT24+cWFxwjlMbw9AfI8NIyeuFPuVw3fOzg6Gt
 7Umd3vfR1pt/wGZ0ZFzj0C0dbOTRw6lnQt5ag7rE51NUanWnr7AXyImkIrAn1FTJiH7c
 UMJUsRJk9vlTgn5MLQdcLr1eUhp7ldqTl9zAm9/NSSCnpQIJDsLNU2qR4U1G9ouxLxSX
 U+RxJVHxd9datV51UNJDicEyuTZsttCWv3iQs27CdAESmjbBC9I9zj1LApiqYKfBw4Gx
 YHZg==
X-Gm-Message-State: APjAAAVPw//56FPHzDcSaN70GqS+y+xeg0tf2o2nMxSuLDtnWpMWrOOn
 wL0bBgO2Kik5TKQal2BJcfG9kg==
X-Google-Smtp-Source: APXvYqwZ7ywdeBuu1gQvv84kaTS38RQgBQlM0G4DKyDzEaNTlWyLXFzRg8XRso2b/Wetke5i+xxMMQ==
X-Received: by 2002:adf:ed4e:: with SMTP id u14mr27912754wro.132.1573583228225; 
 Tue, 12 Nov 2019 10:27:08 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id d202sm3980158wmd.47.2019.11.12.10.27.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2019 10:27:07 -0800 (PST)
Date: Tue, 12 Nov 2019 19:27:05 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Wambui Karuga <wambui.karugax@gmail.com>
Subject: Re: [PATCH] drm/print: add DRM_DEV_WARN macro
Message-ID: <20191112182705.GL23790@phenom.ffwll.local>
Mail-Followup-To: Wambui Karuga <wambui.karugax@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 sean@poorly.run, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20191112170909.13733-1-wambui.karugax@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191112170909.13733-1-wambui.karugax@gmail.com>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=+1crLA0CDKaHQwRJPotAhe5OcKExhLg2j+GgM+2/R+w=;
 b=WOTe4Rk++ZKTe5OkVwhtp2PBDWd64FRPeMbBRl6vaLQK18RMPEdPfYp1O3CW8xOoY9
 Uf6XLg3iOFbWpfV6RgKHYqs+4Q1kv18AyOlSw7nERne80NjZneMrQHdcN76U6zjQI4RW
 baX285iYeAGi75nrGFHBLd22pKNgZQ55b3fSs=
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, sean@poorly.run
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMTIsIDIwMTkgYXQgMDg6MDk6MDlQTSArMDMwMCwgV2FtYnVpIEthcnVnYSB3
cm90ZToKPiBBZGQgdGhlIERSTV9ERVZfV0FSTiBoZWxwZXIgbWFjcm8gZm9yIHByaW50aW5nIHdh
cm5pbmdzCj4gdGhhdCB1c2UgZGV2aWNlIHBvaW50ZXJzIGluIHRoZWlyIGxvZyBvdXRwdXQgZm9y
bWF0Lgo+IERSTV9ERVZfV0FSTiBjYW4gcmVwbGFjZSB0aGUgdXNlIG9mIGRldl93YXJuIGluIHN1
Y2ggY2FzZXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogV2FtYnVpIEthcnVnYSA8d2FtYnVpLmthcnVn
YXhAZ21haWwuY29tPgoKQ2FuIHlvdSBwbHMgaW5jbHVkZSB0aGlzIGluIHRoZSBwYXRjaCB0byBh
ZGQgdGhlIGZpcnN0IHVzZXIgd2l0aCByb2NrY2hpcD8KT3RoZXJ3aXNlIGFsd2F5cyBhIGJpdCBh
d2t3YXJkIHdoZW4gd2UgYWRkIGZ1bmN0aW9ucyB3aXRob3V0IGNhbGxlcnMuCgpsZ3RtIG90aGVy
d2lzZS4KLURhbmllbAoKPiAtLS0KPiAgaW5jbHVkZS9kcm0vZHJtX3ByaW50LmggfCA5ICsrKysr
KysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBh
L2luY2x1ZGUvZHJtL2RybV9wcmludC5oIGIvaW5jbHVkZS9kcm0vZHJtX3ByaW50LmgKPiBpbmRl
eCA1YjgwNDk5OTJjMjQuLjZkZGY5MWMwY2IyOSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2RybS9k
cm1fcHJpbnQuaAo+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9wcmludC5oCj4gQEAgLTMyOSw2ICsz
MjksMTUgQEAgdm9pZCBkcm1fZXJyKGNvbnN0IGNoYXIgKmZvcm1hdCwgLi4uKTsKPiAgI2RlZmlu
ZSBEUk1fV0FSTl9PTkNFKGZtdCwgLi4uKQkJCQkJCVwKPiAgCV9EUk1fUFJJTlRLKF9vbmNlLCBX
QVJOSU5HLCBmbXQsICMjX19WQV9BUkdTX18pCj4gIAo+ICsvKioKPiArICogV2FybmluZyBvdXRw
dXQuCj4gKyAqCj4gKyAqIEBkZXY6IGRldmljZSBwb2ludGVyCj4gKyAqIEBmbXQ6IHByaW50Zigp
IGxpa2UgZm9ybWF0IHN0cmluZy4KPiArICovCj4gKyNkZWZpbmUgRFJNX0RFVl9XQVJOKGRldiwg
Zm10LCAuLi4pCQkJCQlcCj4gKwlkcm1fZGV2X3ByaW50ayhkZXYsIEtFUk5fV0FSTklORywgZm10
LCAjI19fVkFfQVJHU19fKQo+ICsKPiAgLyoqCj4gICAqIEVycm9yIG91dHB1dC4KPiAgICoKPiAt
LSAKPiAyLjE3LjEKPiAKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRl
bCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
