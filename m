Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD94EF1BB
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 01:15:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 474EC6E8BD;
	Tue,  5 Nov 2019 00:15:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 725B66E8BD
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2019 00:15:08 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id o49so26776155qta.7
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Nov 2019 16:15:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=FhaR1pzpDhD8Oj3r3+6NDw11m3VI6XnZi9HpX8QpwHA=;
 b=kvDo0dMB5CCVyyREvITptEULZpG/EJ4hnSFLxkhNl6UQ6Jea5fO42YaLsVyCqHm3zp
 ZfB1pHRCdyJ6Du5CRcKJrmvtYdexekoAc3fbC9erQFktSmKpoRQclyKKG/ZtJa+rC27e
 wuL8f6Jno18bSO98RPe8Pp729R1yOxxy1I+gz5dtrQaasphXC2h/uoy/wnAIAo07astt
 +5B5+Cl2DOjz3du9Cz4MD+XChqvZFTw80MoxLOdSxL3bdLEz1eb51doHO+u+lNJZ/Nom
 7P3YiSC2xrxqqCA0r890CoZtbT48xOBRyGPu+LKyFhcD0T1dDavWKKzVOsWwb94eAdvJ
 CqBg==
X-Gm-Message-State: APjAAAUZmcEAQUFwZgYmhpWq0NcfGgHEpB/ZIT0YqjOCPK79ETBICHMO
 6iIU3JuYmFHT2wN2LgGO1Es=
X-Google-Smtp-Source: APXvYqwH7VS2MjwpNjwcYETIPSxzZVeB9EKxaiZzQwpcyEfRW3GbbAvWA8ohLUEp0gqrzep911LCjQ==
X-Received: by 2002:ac8:5350:: with SMTP id d16mr15380877qto.319.1572912907385; 
 Mon, 04 Nov 2019 16:15:07 -0800 (PST)
Received: from localhost ([2620:10d:c091:500::3:51f8])
 by smtp.gmail.com with ESMTPSA id q17sm14324139qtq.58.2019.11.04.16.15.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 04 Nov 2019 16:15:06 -0800 (PST)
Date: Mon, 4 Nov 2019 16:15:05 -0800
From: Tejun Heo <tj@kernel.org>
To: Brian Welty <brian.welty@intel.com>
Subject: Re: [RFC PATCH] cgroup: Document interface files and rationale for
 DRM controller
Message-ID: <20191105001505.GR3622521@devbig004.ftw2.facebook.com>
References: <20191104220847.23283-1-brian.welty@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191104220847.23283-1-brian.welty@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=FhaR1pzpDhD8Oj3r3+6NDw11m3VI6XnZi9HpX8QpwHA=;
 b=LXCqzYpjO+5foQaI1XMgpMH6xWSPtZXtDolI8drNQXSmzupY2nc7zpsFcu8eon4tPe
 ok5vdlJd0lhZsBx+sG/iEuHWS1e98sf1Sk2SW2Fxu62UULw5yguNpAovUqYDLxQUvoZo
 Ik2HQk2BIFR7JlDnJcQjV5ZvnRo30KN7Bpn2yENPHfMbX32DtoyixXL5BSuCWLUyHFpd
 DcWjEF77eeZp6urqdvt3aDTl1XUa6Zc64ve/56/8mWkAfxSP3e28hsV9LWATFSVTVoZV
 WR9vQgG8Fq2fLhRCx5IqbWoIgmcMd8LImFD1IdooKcHvYCGihLssYULD9hkns+RWy1hY
 uIJA==
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
Cc: Leon Romanovsky <leon@kernel.org>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>, dri-devel@lists.freedesktop.org,
 Kenny Ho <Kenny.Ho@amd.com>, cgroups@vger.kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMDQsIDIwMTkgYXQgMDU6MDg6NDdQTSAtMDUwMCwgQnJpYW4gV2VsdHkgd3Jv
dGU6Cj4gKyAgZ3B1c2V0LnVuaXRzCj4gKyAgZ3B1c2V0LnVuaXRzLmVmZmVjdGl2ZQo+ICsgIGdw
dXNldC51bml0cy5wYXJ0aXRpb24KPiArCj4gKyAgZ3B1c2V0Lm1lbXMKPiArICBncHVzZXQubWVt
cy5lZmZlY3RpdmUKPiArICBncHVzZXQubWVtcy5wYXJ0aXRpb24KPiArCj4gKyAgc2NoZWQubWF4
Cj4gKyAgc2NoZWQuc3RhdHMKPiArICBzY2hlZC53ZWlnaHQKPiArICBzY2hlZC53ZWlnaHQubmlj
ZQo+ICsKPiArICBtZW1vcnkuY3VycmVudAo+ICsgIG1lbW9yeS5ldmVudHMKPiArICBtZW1vcnku
aGlnaAo+ICsgIG1lbW9yeS5sb3cKPiArICBtZW1vcnkubWF4Cj4gKyAgbWVtb3J5Lm1pbgo+ICsg
IG1lbW9yeS5zdGF0Cj4gKyAgbWVtb3J5LnN3YXAuY3VycmVudAo+ICsgIG1lbW9yeS5zd2FwLm1h
eAoKSSBkb24ndCB1bmRlcnN0YW5kIHdoeSBpdCBuZWVkcyB0byByZXBsaWNhdGUgZXNzZW50aWFs
bHkgKmFsbCogdGhlCmludGVyZmFjZXMgdGhhdCBzeXN0ZW0gcmVzb3VyY2VzIGFyZSBpbXBsZW1l
bnRpbmcgZnJvbSB0aGUgZ2V0LWdvLgpTb21lIG9mIHRoZSBhYm92ZSBoYXZlIGludGVyc2VjdGlu
ZyBmdW5jdGlvbmFsaXRpZXMgYW5kIGV4aXN0IG1vcmUgZm9yCmhpc3RvcmljYWwgcmVhc29ucyBh
bmQgSSBmYWlsIHRvIHNlZSBob3cgZGlzdGluY3Rpb25zIGxpa2UgbWluIHZzLiBsb3cKYW5kIGhp
Z2ggdnMuIG1heCB3b3VsZCBtYWtlIHNlbnNlIGZvciBncHVzLiAgQWxzbywgd2h5IHdvdWxkIGl0
IGhhdmUgYQpzZXBhcmF0ZSBzd2FwIGxpbWl0IG9mIGl0cyBvd24/CgpQbGVhc2Ugc3RhcnQgd2l0
aCBzb21ldGhpbmcgc21hbGwgYW5kIGludHVpdGl2ZS4gIEknbSBnb25uYSBuYWNrCmFueXRoaW5n
IHdoaWNoIHNwcmF3bHMgb3V0IGxpa2UgdGhpcy4gIE1vc3QgbGlrZWx5LCB0aGVyZSdzIHN0aWxs
IGEKdG9uIHlvdSBndXlzIG5lZWQgdG8gd29yayB0aHJvdWdoIHRvIHJlYWNoIHRoZSByZXNvdXJj
ZSBtb2RlbCB3aGljaCBpcwphY3R1YWxseSB1c2VmdWwgYW5kIHRyeWluZyB0byBkZWZpbmUgYSBj
b21wcmVoZW5zaXZlIGludGVyZmFjZSB1cGZyb250Cmxpa2UgdGhpcyBpcyBnb25uYSBsb29rIHJl
YWxseSBzaWxseSBhbmQgd2lsbCBiZWNvbWUgYW4gdWdseSBkcmFnIGJ5CnRoZSB0aW1lIHRoZSBw
cm9ibGVtIHNwYWNlIGlzIGFjdHVhbGx5IHVuZGVyc3Rvb2QuCgpJdCBkb2Vzbid0IHNlZW0gbGlr
ZSB0aGlzIGlzIGNvbWluZyB0aHJvdWdoIGJ1dCBjYW4geW91IHBsZWFzZSBzdGFydAp3aXRoIGEg
c2ltcGxlIHdlaWdodCBrbm9iPwoKVGhhbmtzLgoKLS0gCnRlanVuCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
