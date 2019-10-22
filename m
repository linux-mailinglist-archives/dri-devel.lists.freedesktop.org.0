Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEC9E0043
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 11:05:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42AAA6E4A5;
	Tue, 22 Oct 2019 09:05:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 948C26E4A5
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 09:05:37 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id a11so1028138wra.6
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 02:05:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=i9cWg6hkC3Jwd63HaaPFghAt5dBBQDhYdlHJZBLH9+s=;
 b=bNhddou0hkiE74mbda8ckFDb+VYoCq8veieeWVm3iemgywISVhk6CS7yBosjKdBH7k
 htk9AtcruBGwlE2VGfsKzLiFqVWCHWQ91t7J9Dbna/25ndtEXYg3HKf9HMtlP0+lXvnK
 6+zlEKzGHkSraLcAhHqh1jQf8vEU3lPFiP2sjUE0Qd4QVPJaNAAckylRplmAojBatsy7
 NODBW0jeTLW3pmIpBxrhXnljNb51WoNs7PJ6RzC0gMAb4LY4KQ1wlNXPVYv3CvO8nani
 /strrvOc0cclWjL19KRCE4sBEQ3GRcHAmBHPLjMH4Ps1o1YP/tQVhUpYlEdKnjLB7Bex
 T9+Q==
X-Gm-Message-State: APjAAAUv+a1tLLH0FjKMRH2noQ0WliEpGRm6O+sql/Cc1js/8MABpYey
 +qX9AMO8+NAcSwfru0es88e5mg==
X-Google-Smtp-Source: APXvYqzpbMbxT2yU70Z+fHkQQr9yWCG0/09XbqcMbnTOZqVwPDK93hJ38k/7uXKowUqTJaukb4eMTg==
X-Received: by 2002:adf:f4cb:: with SMTP id h11mr2679088wrp.260.1571735136188; 
 Tue, 22 Oct 2019 02:05:36 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id s21sm20815085wrb.31.2019.10.22.02.05.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2019 02:05:35 -0700 (PDT)
Date: Tue, 22 Oct 2019 11:05:33 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH] drm/virtio: print a single line with device features
Message-ID: <20191022090533.GB11828@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20191018113832.5460-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191018113832.5460-1-kraxel@redhat.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=i9cWg6hkC3Jwd63HaaPFghAt5dBBQDhYdlHJZBLH9+s=;
 b=lKVMMF8g8YiYTjlh2fqJFDY3PXwKTV+YIsCC2A+Y7rv0/syyGNnigyxwTKYIJjrBgK
 +SydfOo9H8S9CQJnwAGQRgvNvyWYVdxsGV0uvnJa2h22JPjrjwPocmjxVAHK3w663hHQ
 bI7kCLc9VTBs/oElUMSqxYs7bHKplYJbhethI=
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMTgsIDIwMTkgYXQgMDE6Mzg6MzJQTSArMDIwMCwgR2VyZCBIb2ZmbWFubiB3
cm90ZToKPiBTaWduZWQtb2ZmLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4K
PiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2ttcy5jIHwgOSArKysrLS0t
LS0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2ttcy5jIGIvZHJp
dmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2ttcy5jCj4gaW5kZXggMGIzY2RiMGQ4M2IwLi4y
ZjU3NzNlNDM1NTcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1
X2ttcy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2ttcy5jCj4gQEAg
LTE1NSwxNiArMTU1LDE1IEBAIGludCB2aXJ0aW9fZ3B1X2luaXQoc3RydWN0IGRybV9kZXZpY2Ug
KmRldikKPiAgI2lmZGVmIF9fTElUVExFX0VORElBTgo+ICAJaWYgKHZpcnRpb19oYXNfZmVhdHVy
ZSh2Z2Rldi0+dmRldiwgVklSVElPX0dQVV9GX1ZJUkdMKSkKPiAgCQl2Z2Rldi0+aGFzX3Zpcmds
XzNkID0gdHJ1ZTsKPiAtCURSTV9JTkZPKCJ2aXJnbCAzZCBhY2NlbGVyYXRpb24gJXNcbiIsCj4g
LQkJIHZnZGV2LT5oYXNfdmlyZ2xfM2QgPyAiZW5hYmxlZCIgOiAibm90IHN1cHBvcnRlZCBieSBo
b3N0Iik7Cj4gLSNlbHNlCj4gLQlEUk1fSU5GTygidmlyZ2wgM2QgYWNjZWxlcmF0aW9uIG5vdCBz
dXBwb3J0ZWQgYnkgZ3Vlc3RcbiIpOwo+ICAjZW5kaWYKPiAgCWlmICh2aXJ0aW9faGFzX2ZlYXR1
cmUodmdkZXYtPnZkZXYsIFZJUlRJT19HUFVfRl9FRElEKSkgewo+ICAJCXZnZGV2LT5oYXNfZWRp
ZCA9IHRydWU7Cj4gLQkJRFJNX0lORk8oIkVESUQgc3VwcG9ydCBhdmFpbGFibGUuXG4iKTsKPiAg
CX0KPiAgCj4gKwlEUk1fSU5GTygiZmVhdHVyZXM6ICVjdmlyZ2wgJWNlZGlkXG4iLAo+ICsJCSB2
Z2Rldi0+aGFzX3ZpcmdsXzNkID8gJysnIDogJy0nLAo+ICsJCSB2Z2Rldi0+aGFzX2VkaWQgICAg
ID8gJysnIDogJy0nKTsKCk1heWJlIHdlIHNob3VsZCBtb3ZlIHRoZSB2YXJpb3VzIHllc25vL29u
b2ZmL2VuYWJsZWRkaXNhYmxlZCBoZWxwZXJzIGZyb20KaTkxNV91dGlscy5oIHRvIGRybV91dGls
cy5oIGFuZCB1c2UgdGhlbSBtb3JlIHdpZGVseT8KCkFueXdheSBSZXZpZXdlZC1ieTogRGFuaWVs
IFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPiArCj4gIAlyZXQgPSB2aXJ0aW9fZmlu
ZF92cXModmdkZXYtPnZkZXYsIDIsIHZxcywgY2FsbGJhY2tzLCBuYW1lcywgTlVMTCk7Cj4gIAlp
ZiAocmV0KSB7Cj4gIAkJRFJNX0VSUk9SKCJmYWlsZWQgdG8gZmluZCB2aXJ0IHF1ZXVlc1xuIik7
Cj4gLS0gCj4gMi4xOC4xCj4gCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwg
SW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
