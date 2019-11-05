Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0935FEFA2F
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 10:54:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56D6B6E988;
	Tue,  5 Nov 2019 09:54:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57D056E988
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2019 09:54:52 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id l10so20551175wrb.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Nov 2019 01:54:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=4lkA2rQrlE3c13iLY5DiCke6iVHYd8R1JEobAvl/Q18=;
 b=p+XnQN7FMEAjl10tJfFHXzDPgaGW+tkSQmJw/BjmJRmtf7FYfQDf+EL124SUIsDJdA
 6Cbixpm2mwK7hiAnKe/ksfgQk5VSezevW8vRUcK4f4nC0bCQImU21MeXCzz1qOeRBEW8
 cp3koXSYDEXDlzazdKH3idbAiaz6iuQoD4bWPCb/+rx9Ql0Cf/91hT5zmoHZB41Owvy5
 rRTZVIT/SpVz8yvBg7fLz2WEERG4l2qHSKCtasUGDoMUV7U4xDTzOEUS2wzPnWddk+hM
 3hj+CLIt53p1TEgTn65rwN4ndoOYbZRQKC1uQxeOlLmfSJMnIWxTUHIGES7BIofhWF+3
 UneA==
X-Gm-Message-State: APjAAAXCRthSLOlLGgmw8nqsRXfXKL0XbR9a5LvdRB1h6Ie3jQCguv1X
 Ay0pU4Ilz0083Ahdlmhw/EdnLg==
X-Google-Smtp-Source: APXvYqzju/nC/vWjFNtRZrzr8orTxxgcePWZIwuQAOhQqGNjEClxP0kDUvgciaZCVCuVRjwfblLbOQ==
X-Received: by 2002:adf:b1d1:: with SMTP id r17mr27080108wra.201.1572947690929; 
 Tue, 05 Nov 2019 01:54:50 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id l18sm24256200wrn.48.2019.11.05.01.54.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2019 01:54:50 -0800 (PST)
Date: Tue, 5 Nov 2019 10:54:48 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 6/9] drm/ast: Add primary plane
Message-ID: <20191105095448.GA10326@phenom.ffwll.local>
References: <20191028154928.4058-1-tzimmermann@suse.de>
 <20191028154928.4058-7-tzimmermann@suse.de>
 <20191105095102.qjqgh3ghx7tctk43@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191105095102.qjqgh3ghx7tctk43@sirius.home.kraxel.org>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=4lkA2rQrlE3c13iLY5DiCke6iVHYd8R1JEobAvl/Q18=;
 b=ZgMpiHYG8byQ947vz38Uts0rFRcSPLm/pLzt2iLy70ltn5jfpfvhuGL+CifN8qu9Xd
 SJ5tZpGJum93ta+lwa53uf+AL6Ju0uAVh/IPYl/ptnXmYsWAjO2eIHQ6jCT1XIIMtLKa
 s2kvmXumVJBJPz34R+K8s0DJMGZfHqUZ3qg4w=
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, chen@aspeedtech.com,
 dri-devel@lists.freedesktop.org, airlied@redhat.com, sam@ravnborg.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMDUsIDIwMTkgYXQgMTA6NTE6MDJBTSArMDEwMCwgR2VyZCBIb2ZmbWFubiB3
cm90ZToKPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9wbGFuZV9mdW5jcyBhc3RfcHJpbWFy
eV9wbGFuZV9mdW5jcyA9IHsKPiA+ICsJLnVwZGF0ZV9wbGFuZSA9IGRybV9hdG9taWNfaGVscGVy
X3VwZGF0ZV9wbGFuZSwKPiA+ICsJLmRpc2FibGVfcGxhbmUgPSBkcm1fYXRvbWljX2hlbHBlcl9k
aXNhYmxlX3BsYW5lLAo+ID4gKwkuZGVzdHJveSA9IGRybV9wbGFuZV9jbGVhbnVwLAo+ID4gKwku
cmVzZXQgPSBkcm1fYXRvbWljX2hlbHBlcl9wbGFuZV9yZXNldCwKPiA+ICsJLnNldF9wcm9wZXJ0
eSA9IE5VTEwsCj4gPiArCS5hdG9taWNfZHVwbGljYXRlX3N0YXRlID0gZHJtX2F0b21pY19oZWxw
ZXJfcGxhbmVfZHVwbGljYXRlX3N0YXRlLAo+ID4gKwkuYXRvbWljX2Rlc3Ryb3lfc3RhdGUgPSBk
cm1fYXRvbWljX2hlbHBlcl9wbGFuZV9kZXN0cm95X3N0YXRlLAo+ID4gKwkuYXRvbWljX3NldF9w
cm9wZXJ0eSA9IE5VTEwsCj4gPiArCS5hdG9taWNfZ2V0X3Byb3BlcnR5ID0gTlVMTCwKPiAKPiBJ
dCdzIG5vdCBuZWVkZWQgdG8gZXhwbGljaXRseSBzZXQgb3B0aW9uYWwgZnVuY3Rpb24gcG9pbnRl
cnMgdG8gTlVMTC4KClllYWggbGVhdmluZyB0aGVtIG91dCBjb21wbGV0ZWx5IGhlbHBzIGEgbG90
IHdpdGggZ3JlcHBpbmcgb3ZlciBhbGwgdGhlCmRyaXZlcnMgdG8gZmluZCB1c2VycyBvZiBzdHVm
Zi4KLURhbmllbAoKPiAKPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9lbmNvZGVyX2hlbHBl
cl9mdW5jcyBhc3RfZW5jX2hlbHBlcl9mdW5jcyA9IHsKPiA+ICAJLmRwbXMgPSBhc3RfZW5jb2Rl
cl9kcG1zLAo+ID4gIAkucHJlcGFyZSA9IGFzdF9lbmNvZGVyX3ByZXBhcmUsCj4gPiBAQCAtOTc2
LDEwICsxMDQ1LDMzIEBAIHN0YXRpYyB2b2lkIGFzdF9jdXJzb3JfZmluaShzdHJ1Y3QgZHJtX2Rl
dmljZSAqZGV2KQo+ID4gIAo+ID4gIGludCBhc3RfbW9kZV9pbml0KHN0cnVjdCBkcm1fZGV2aWNl
ICpkZXYpCj4gPiAgewo+ID4gKwlzdGF0aWMgY29uc3QgdWludDMyX3QgcHJpbWFyeV9wbGFuZV9m
b3JtYXRzW10gPSB7Cj4gPiArCQlEUk1fRk9STUFUX1hSR0I4ODg4LAo+ID4gKwkJRFJNX0ZPUk1B
VF9SR0I1NjUsCj4gPiArCQlEUk1fRk9STUFUX0M4LAo+ID4gKwl9Owo+IAo+IEknZCBzdWdnZXN0
IHRvIG1vdmUgdGhpcyBvdXQgb2YgdGhlIGZ1bmN0aW9uLgo+IAo+IGNoZWVycywKPiAgIEdlcmQK
PiAKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlv
bgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
