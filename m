Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 846DDABCDC
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 17:45:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5B176E2F9;
	Fri,  6 Sep 2019 15:45:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D483D6E2F7;
 Fri,  6 Sep 2019 15:45:42 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id f13so6012177qkm.9;
 Fri, 06 Sep 2019 08:45:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=xy4uz+AuS1IIWwhJKMvLPwOAkr/rEBanFq85X7QSE+8=;
 b=l9oR2wRSED6W5oMCY/hwabtht9tzcxVW7WN9TlJ/VMyHwa/IDEVTtTWHP0y9GFpj66
 6drJonc2hhH65NGdGX+n4D9PkRw8CQMf2FrOr3l8P9K5Ezbn6GfMvI+tea8W49+XnnhC
 3PbXN3NIfup3d1h4SEbXS9UXFANOcIuI+J7Uco6riRGh8HQLo5p+Ha/t63hKD/vPmI6y
 Dsx5D1vuZ9VJ80G49yhJQqFccbK36EbOKMoGduyPNsXz5Q2fd+Pq/wevDYUYpKiuKvzK
 M+W7OGMOOQ5vBauRXv2l+Hp7RR2FH79SA7enTekPFJyGgYMU1r1Vvn9RWN/7tnXJe6Wh
 bJ9g==
X-Gm-Message-State: APjAAAV7BG1lAFo/qVkvlnE/VuAGWusEDk42MbZFwd1ACDQ6CeLIC27v
 71MGmsKoZu5jTTic83LtOnc=
X-Google-Smtp-Source: APXvYqx8KMf2Vlev4sBFud5jnvb1R1NiRHF1UeW8ah5SDM6BcGXfoWaOFRH6oquFpZCxlzFS59p4fA==
X-Received: by 2002:a37:a48e:: with SMTP id n136mr9545064qke.223.1567784741768; 
 Fri, 06 Sep 2019 08:45:41 -0700 (PDT)
Received: from localhost ([2620:10d:c091:480::e7cb])
 by smtp.gmail.com with ESMTPSA id s23sm3132385qte.72.2019.09.06.08.45.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 06 Sep 2019 08:45:41 -0700 (PDT)
Date: Fri, 6 Sep 2019 08:45:39 -0700
From: Tejun Heo <tj@kernel.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH RFC v4 00/16] new cgroup controller for gpu/drm subsystem
Message-ID: <20190906154539.GP2263813@devbig004.ftw2.facebook.com>
References: <20190829060533.32315-1-Kenny.Ho@amd.com>
 <20190831042857.GD2263813@devbig004.ftw2.facebook.com>
 <20190903075550.GJ2112@phenom.ffwll.local>
 <20190903185013.GI2263813@devbig004.ftw2.facebook.com>
 <CAKMK7uE5Bj-3cJH895iqnLpwUV+GBDM1Y=n4Z4A3xervMdJKXg@mail.gmail.com>
 <20190906152320.GM2263813@devbig004.ftw2.facebook.com>
 <CAKMK7uEXP7XLFB2aFU6+E0TH_DepFRkfCoKoHwkXtjZRDyhHig@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uEXP7XLFB2aFU6+E0TH_DepFRkfCoKoHwkXtjZRDyhHig@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=xy4uz+AuS1IIWwhJKMvLPwOAkr/rEBanFq85X7QSE+8=;
 b=F+zcOTKWxYuZtqccWWl/FcpG+it/14/xBuwGVjya64FFlWSbVYHszu+0Hwvo0sn3wH
 BsBd4Cd48rXZptQ3cmKX5RdUzkil59G0KXV54/S9MFcoz9pqeh0efKuAJ7Mn77lRt9GP
 Vi0XwK2N21me1BKetYO3e7ID0S0HiAm8PhVulHWZZPivC6BZ+mO4IbMpG42lvGMQp/1h
 p4x15mkd05Q7XrcYsWQX4WGAXbIcaIO7M2KwfTRjFF0EyCY21mKoCYenIVN+mU4XdRaL
 wJuLxGeOIsobZR3kM7JarUs1fFopGPtQG8SgFM1WcmOA/Y1jA/k6jIsiVz9leaV5kV6p
 TJHw==
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
Cc: Kenny Ho <Kenny.Ho@amd.com>, "Kuehling, Felix" <felix.kuehling@amd.com>,
 jsparks@cray.com, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 lkaplan@cray.com, Kenny Ho <y2kenny@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Greathouse,
 Joseph" <joseph.greathouse@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 cgroups@vger.kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8sIERhbmllbC4KCk9uIEZyaSwgU2VwIDA2LCAyMDE5IGF0IDA1OjM0OjE2UE0gKzAyMDAs
IERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gPiBIbW0uLi4gd2hhdCdkIGJlIHRoZSBmdW5kYW1lbnRh
bCBkaWZmZXJlbmNlIGZyb20gc2xhYiBvciBzb2NrZXQgbWVtb3J5Cj4gPiB3aGljaCBhcmUgaGFu
ZGxlZCB0aHJvdWdoIG1lbWNnPyAgSXMgc3lzdGVtIG1lbW9yeSB1c2VkIGJ5IEdQVXMgaGF2ZQo+
ID4gZnVydGhlciBnbG9iYWwgcmVzdHJpY3Rpb25zIGluIGFkZGl0aW9uIHRvIHRoZSBhbW91bnQg
b2YgcGh5c2ljYWwKPiA+IG1lbW9yeSB1c2VkPwo+IAo+IFNvbWV0aW1lcywgYnV0IHRoYXQgd291
bGQgYmUgc3BlY2lmaWMgcmVzb3VyY2VzIChraW5kYSBsaWtlIHZyYW0pLAo+IGUuZy4gQ01BIHJl
Z2lvbnMgdXNlZCBieSBhIGdwdS4gQnV0IHByb2JhYmx5IG5vdCBzb21ldGhpbmcgeW91J2xsIHJ1
bgo+IGluIGEgZGF0YWNlbnRlciBhbmQgd2FudCBjZ3JvdXBzIGZvciAuLi4KPiAKPiBJIGd1ZXNz
IHdlIGNvdWxkIHRyeSB0byBpbnRlZ3JhdGUgd2l0aCB0aGUgbWVtY2cgZ3JvdXAgY29udHJvbGxl
ci4gT25lCj4gdHJvdWJsZSBpcyB0aGF0IGFzaWRlIGZyb20gaTkxNSBtb3N0IGdwdSBkcml2ZXJz
IGRvIG5vdCByZWFsbHkgaGF2ZSBhCj4gZnVsbCBzaHJpbmtlciwgc28gbm90IHN1cmUgaG93IHRo
YXQgd291bGQgYWxsIGludGVncmF0ZS4KClNvLCB3aGlsZSBpdCdkIGdyZWF0IHRvIGhhdmUgc2hy
aW5rZXJzIGluIHRoZSBsb25nZXIgdGVybSwgaXQncyBub3QgYQpzdHJpY3QgcmVxdWlyZW1lbnQg
dG8gYmUgYWNjb3VudGVkIGluIG1lbWNnLiAgSXQgYWxyZWFkeSBhY2NvdW50cyBhCmxvdCBvZiBt
ZW1vcnkgd2hpY2ggaXNuJ3QgcmVjbGFpbWFibGUgKGEgbG90IG9mIHNsYWJzIGFuZCBzb2NrZXQK
YnVmZmVyKS4KCj4gVGhlIG92ZXJhbGwgZ3B1IG1lbW9yeSBjb250cm9sbGVyIHdvdWxkIHN0aWxs
IGJlIG91dHNpZGUgb2YgbWVtY2cgSQo+IHRoaW5rLCBzaW5jZSB0aGF0IHdvdWxkIGluY2x1ZGUg
c3dhcHBlZC1vdXQgZ3B1IG9iamVjdHMsIGFuZCBzdHVmZiBpbgo+IHNwZWNpYWwgbWVtb3J5IHJl
Z2lvbnMgbGlrZSB2cmFtLgoKWWVhaCwgZm9yIHJlc291cmNlcyB3aGljaCBhcmUgb24gdGhlIEdQ
VSBpdHNlbGYgb3IgaGFyZCBsaW1pdGF0aW9ucwphcmlzaW5nIGZyb20gaXQuICBJbiBnZW5lcmFs
LCB3ZSB3YW5uYSBtYWtlIGNncm91cCBjb250cm9sbGVycyBjb250cm9sCnNvbWV0aGluZyByZWFs
IGFuZCBjb25jcmV0ZSBhcyBpbiBwaHlzaWNhbCByZXNvdXJjZXMuCgo+ID4gQXQgdGhlIHN5c3Rl
bSBsZXZlbCwgaXQganVzdCBnZXRzIGZvbGRlZCBpbnRvIGNwdSB0aW1lLCB3aGljaCBpc24ndAo+
ID4gcGVyZmVjdCBidXQgaXMgdXN1YWxseSBhIGdvb2QgZW5vdWdoIGFwcHJveGltYXRpb24gb2Yg
Y29tcHV0ZSByZWxhdGVkCj4gPiBkeW5hbWljIHJlc291cmNlcy4gIENhbiBncHUgZG8gc29tZXRp
bmcgc2ltaWxhciBvciBhdCBsZWFzdCBzdGFydCB3aXRoCj4gPiB0aGF0Pwo+IAo+IFNvIGdlbmVy
YWxseSB0aGVyZSdzIGEgcGlsZSBvZiBlbmdpbmVzLCBvZnRlbiBvZiBkaWZmZXJlbnQgdHlwZSAo
ZS5nLgo+IGFtZCBodyBoYXMgYW4gZW50aXJlIHBpbGUgb2YgY29weSBlbmdpbmVzKSwgd2l0aCBz
b21lIGlsbC1kZWZpbmVkCj4gc2hhcmluZyBjaGFyYXRlcmlzdGljcyBmb3Igc29tZSAob2Z0ZW4g
Y29tcHV0ZS9yZW5kZXIgZW5naW5lcyB1c2UgdGhlCj4gc2FtZSBzaGFkZXIgY29yZXMgdW5kZXJu
ZWF0aCksIGtpbmRhIGxpa2UgaHlwZXJ0aHJlYWRpbmcuIFNvIGF0IHRoYXQKPiBkZXRhaWwgaXQn
cyBhbGwgZXh0cmVtZWx5IGh3IHNwZWNpZmljLCBhbmQgcHJvYmFibHkgdG9vIGhhcmQgdG8KPiBj
b250cm9sIGluIGEgdXNlZnVsIHdheSBmb3IgdXNlcnMuIEFuZCBJJ20gbm90IHN1cmUgd2UgY2Fu
IHJlYWxseSBkbyBhCj4gcmVhc29uYWJsZSBrbm9iIGZvciBvdmVyYWxsIGdwdSB1c2FnZSwgZS5n
LiBpZiB3ZSBpbmNsdWRlIGFsbCB0aGUgY29weQo+IGVuZ2luZXMsIGJ1dCB0aGUgd29ya2xvYWRz
IGFyZSBvbmx5IHJ1bm5pbmcgb24gY29tcHV0ZSBlbmdpbmVzLCB0aGVuCj4geW91IG1pZ2h0IG9u
bHkgZ2V0IDEwJSBvdmVyYWxsIHV0aWxpemF0aW9uIGJ5IGVuZ2luZS10aW1lLiBXaGlsZSB0aGUK
PiBzaGFkZXJzICh3aGljaCBpcyBtb3N0IG9mIHRoZSBjaGlwIGFyZWEvcG93ZXIgY29uc3VtcHRp
b24pIGFyZQo+IGFjdHVhbGx5IGF0IDEwMCUuIE9uIHRvcCwgd2l0aCBtYW55IHVzZXJzcGFjZSBh
cGlzIHRob3NlIGVuZ2luZXMgYXJlCj4gYW4gaW50ZXJuYWwgaW1wbGVtZW50YXRpb24gZGV0YWls
IG9mIGEgbW9yZSBhYnN0cmFjdCBncHUgZGV2aWNlIChlLmcuCj4gb3BlbmdsKSwgYnV0IHdpdGgg
b3RoZXJzLCB0aGlzIGlzIGFsbCBmdWxseSBleHBvc2VkIChsaWtlIHZ1bGthbikuCj4gCj4gUGx1
cyB0aGUga2VybmVsIG5lZWRzIHRvIHVzZSBhdCBsZWFzdCBjb3B5IGVuZ2luZXMgZm9yIHZyYW0g
bWFuYWdlbWVudAo+IGl0c2VsZiwgYW5kIHlvdSByZWFsbHkgY2FuJ3QgdGFrZSB0aGF0IGF3YXku
IEFsdGhvdWdoIEtlbm55IGhlcmUgaGFzCj4gc29tZSBwcm9wb3NhbCBmb3IgYSBzZXBhcmF0ZSBj
Z3JvdXAgcmVzb3VyY2UganVzdCBmb3IgdGhhdC4KPiAKPiBJIGp1c3QgdGhpbmsgaXQncyBhbGwg
YSBiaXQgdG9vIGlsbC1kZWZpbmVkLCBhbmQgd2UgbWlnaHQgYmUgYmV0dGVyCj4gb2ZmIG5haWxp
bmcgdGhlIG1lbW9yeSBzaWRlIGZpcnN0IGFuZCBnZXQgc29tZSByZWFsIHdvcmxkIGV4cGVyaWVu
Y2UKPiBvbiB0aGlzIHN0dWZmLiBGb3IgY29udGV4dCwgdGhlcmUncyBub3QgZXZlbiBhIGNyb3Nz
LWRyaXZlciBzdGFuZGFyZAo+IGZvciBob3cgcHJpb3JpdGllcyBhcmUgaGFuZGxlZCwgdGhhdCdz
IGFsbCBkcml2ZXItc3BlY2lmaWMgaW50ZXJmYWNlcy4KCkkgc2VlLiAgWWVhaCwgZmlndXJpbmcg
aXQgb3V0IGFzIHRoaXMgZGV2ZWxvcHMgbWFrZXMgc2Vuc2UgdG8gbWUuICBPbmUKdGhpbmcgSSB3
YW5uYSByYWlzZSBpcyB0aGF0IGluIGdlbmVyYWwgd2UgZG9uJ3Qgd2FudCB0byBleHBvc2UgZGV2
aWNlCm9yIGltcGxlbWVudGF0aW9uIGRldGFpbHMgaW4gY2dyb3VwIGludGVyZmFjZS4gIFdoYXQg
d2Ugd2FudCBleHByZXNzZWQKdGhlcmUgaXMgdGhlIGludGVudGlvbnMgb2YgdGhlIHVzZXIuICBU
aGUgbW9yZSBpbnRlcm5hbCBkZXRhaWxzIHdlCmV4cG9zZSB0aGUgbW9yZSB3ZSBlbmQgdXAgZ2V0
dGluZyB0aWVkIGRvd24gdG8gdGhlIHNwZWNpZmljCmltcGxlbWVudGF0aW9uIHdoaWNoIHdlIHNo
b3VsZCBhdm9pZCBlc3BlY2lhbGx5IGdpdmVuIHRoZSBlYXJseSBzdGFnZQpvZiBkZXZlbG9wbWVu
dC4KClRoYW5rcy4KCi0tIAp0ZWp1bgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
