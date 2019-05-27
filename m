Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 878B72B5C5
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 14:53:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EB4E89F27;
	Mon, 27 May 2019 12:53:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B99989F27;
 Mon, 27 May 2019 12:53:32 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id s17so16859714wru.3;
 Mon, 27 May 2019 05:53:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=XJD9DMnFVybhQ2zg+Wyuank+9P6FW14i+tTJPn+rMic=;
 b=hk1318dg0lEEKNu4wId0tKIE4kiLTZtbuh2u/VEWCUwzTa/7xkTYozPto56oSQa1Di
 ZpKmET0bebcruI/PB3DOlp5apCMnnrDtrfYRmATE86INBsCrfN810bW/0KVtVKsvYHmj
 tnLVpguTKvKrbLW9hE0Zj6MXVrl5ktpCErXO7CocyCRsK80JwFOsWHnb2iz68KDlCsKH
 tOh+1NmsBm+WLjgM2KutyCUOi1xKkIZYD3ssz7vipqF+jxtqObqULEsvc77zKK8TsZ9W
 he+EV8BHtb1GN50EyU7RxbJm3yNrHrXFZPWgr9ig2LoHlncH49BMV2gJ1YKYECZUX81a
 ijbg==
X-Gm-Message-State: APjAAAW93+Ltx5gdz7Liq9voCx+R7EcoKXZ0vpB87C1RM35leRkPQdRi
 oF4N/wA9mVaOWqFusChi/3M=
X-Google-Smtp-Source: APXvYqzHF0pQ97eKfeapdtYAFw5icwBEU5SJWUxYWS3WCpmA7VZHjUJgXjrHHe9D11tsuMvrkhjDPQ==
X-Received: by 2002:adf:eeca:: with SMTP id a10mr342922wrp.266.1558961610714; 
 Mon, 27 May 2019 05:53:30 -0700 (PDT)
Received: from arch-x1c3 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net.
 [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id 67sm19805927wmd.38.2019.05.27.05.53.29
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 27 May 2019 05:53:29 -0700 (PDT)
Date: Mon, 27 May 2019 13:52:05 +0100
From: Emil Velikov <emil.l.velikov@gmail.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>
Subject: Re: [PATCH 01/13] drm/amdgpu: introduce and honour DRM_FORCE_AUTH
 workaround
Message-ID: <20190527125205.GE15067@arch-x1c3>
References: <20190527081741.14235-1-emil.l.velikov@gmail.com>
 <3c9b5688-5e83-f173-00e3-6e139e05d466@amd.com>
 <20190527120554.GB15067@arch-x1c3>
 <6e8cd288-b53f-fa75-f12b-db939eebb23e@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6e8cd288-b53f-fa75-f12b-db939eebb23e@amd.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=XJD9DMnFVybhQ2zg+Wyuank+9P6FW14i+tTJPn+rMic=;
 b=me2E1PGdskWE9idZdKhJ+qiUsj6HBudGPHghwOFU+R1BIVcmVQt60v6q3T+XooArwD
 DvktHOTq0R/tgMlQLY7L1/abW6794ewOw20jxgVwlxF+Ouv5LgFZ3CQQtkPJw7X9sV3+
 5HiZklLly8BwLR5FM4GtOVdZCJZvO4qvnNSgKMTL/xQSd2/xDQdcP1wFhPgqiUhJgQmp
 Io1Qbj4o0kJl29bsesnGhbSiLyc3o6KjVCUfdFhldJ49oQbWf9rzAwwyCBiGE740jISY
 WmEtNdmN1ibiWNc5ASywcFd1Ye5gqSyNmgSva0+PuuMh9vwUDyRMxGM1fmTivUgAU2l9
 AcDA==
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 David Airlie <airlied@linux.ie>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS8wNS8yNywgS29lbmlnLCBDaHJpc3RpYW4gd3JvdGU6Cj4gQW0gMjcuMDUuMTkgdW0g
MTQ6MDUgc2NocmllYiBFbWlsIFZlbGlrb3Y6Cj4gPiBPbiAyMDE5LzA1LzI3LCBLb2VuaWcsIENo
cmlzdGlhbiB3cm90ZToKPiA+PiBBbSAyNy4wNS4xOSB1bSAxMDoxNyBzY2hyaWViIEVtaWwgVmVs
aWtvdjoKPiA+Pj4gRnJvbTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNv
bT4KPiA+Pj4KPiA+Pj4gQ3VycmVudGx5IG9uZSBjYW4gY2lyY3VtdmVudCBEUk1fQVVUSCwgd2hl
biB0aGUgaW9jdGwgaXMgZXhwb3NlZCB2aWEgdGhlCj4gPj4+IHJlbmRlciBub2RlLiBBIHNlZW1p
bmdseSBkZWxpYmVyYXRlIGRlc2lnbiBkZWNpc2lvbi4KPiA+Pj4KPiA+Pj4gSGVuY2Ugd2UgY2Fu
IGRyb3AgdGhlIERSTV9BVVRIIGFsbCB0b2dldGhlciAoZGV0YWlscyBpbiBmb2xsb3ctdXAgcGF0
Y2gpCj4gPj4+IHlldCBub3QgYWxsIHVzZXJzcGFjZSBjaGVja3MgaWYgaXQncyBhdXRoZW50aWNh
dGVkLCBidXQgaW5zdGVhZCB1c2VzCj4gPj4+IHVuY29tbW9uIGFzc3VtcHRpb25zLgo+ID4+Pgo+
ID4+PiBBZnRlciBkYXlzIG9mIGRpZ2dpbmcgdGhyb3VnaCBnaXQgbG9nIGFuZCB0ZXN0aW5nLCBv
bmx5IGEgZWluZ2xlIChhYil1c2UKPiA+Pj4gd2FzIHNwb3R0ZWQgLSB0aGUgTWVzYSBSQURWIGRy
aXZlciwgdXNpbmcgdGhlIEFNREdQVV9JTkZPIGlvY3RsIGFuZAo+ID4+PiBhc3N1bWluZyB0aGF0
IGZhaWx1cmUgaW1wbGllcyBsYWNrIG9mIGF1dGhlbnRpY2F0aW9uLgo+ID4+Pgo+ID4+PiBBZmZl
Y3RlZCB2ZXJzaW9ucyBhcmU6Cj4gPj4+ICAgIC0gdGhlIHdob2xlIDE4LjIueCBzZXJpZXMsIHdo
aWNoIGlzIEVPTAo+ID4+PiAgICAtIHRoZSB3aG9sZSAxOC4zLnggc2VyaWVzLCB3aGljaCBpcyBF
T0wKPiA+Pj4gICAgLSB0aGUgMTkuMC54IHNlcmllcywgcHJpb3IgdG8gMTkuMC40Cj4gPj4gV2Vs
bCB5b3UgY291bGQgaGF2ZSBzYXZlZCB5b3VyIHRpbWUsIGNhdXNlIHRoaXMgaXMgc3RpbGwgYSBO
QUsuCj4gPj4KPiA+IERpZCBJIG1lbnRpb24gdGhhdCBJJ3ZlIHNwZW50IHF1aXRlIGEgYml0IG9m
IHRpbWUgaW4gQU1EVkxLPyBFdmVuIGZpeGVkCj4gPiBhIGJ1ZyB3aGlsZSBJIHdhcyB0aGVyZSA6
LSkKPiAKPiBZZWFoLCB0aGFua3MgZm9yIGRvaW5nIHRoaXMuCj4gCj4gQnV0IHdlIGhhdmUgZG9u
ZSBzbyBtdWNoIHN0dWZmIHdpdGggY3VzdG9tZXJzIHdoaWNoIGNhbid0IGJlIGF1ZGl0ZWQgCj4g
dGhpcyB3YXksIHRoYXQgSSBzdGlsbCBoYXZlIGEgcmVhbGx5IGJhZCBmZWVsaW5nIGFib3V0IHRo
aXMgOi8KPiAKRmFpciBwb2ludCwgSSd2ZSBhbHJlYWR5IHRob3VnaHQgYWJvdXQgdGhvc2UuCgpF
eGFtcGxlIEE6ICBjdXN0b21lciBYLCB1c2luZyBjbG9zZWQgc291cmNlL3ByaXZhdGUgc29mdHdh
cmUgWS4KSW9jdGxzIEEsIEIgYW5kIEMgcmVxdWlyZSB0aGUgb2xkIGJlaGF2aW91ciAtIHNpbXBs
eSBhZGQgRk9SQ0VfQVVUSCB0bwp0aGUgQSBCIEMgYW5kIGNhcnJ5IG9uIGhhcHBpbHkuCgpFeGFt
cGxlIEI6IHRoZSB0ZWFtLCBhcyBhIHdob2xlIHRoaW5rcyB0aGF0IHRoaXMgd2lsbCBiZSBwcm9i
bGVtYXRpYyBmb3IKY3VzdG9tZXIgWCAtIGFkZCBGT1JDRV9BVVRIIHRvIGFsbCBpb2N0bHMgYW5k
IGNhcnJ5IG9uLgoKSSBkbyBzZWUgYW5kIHVuZGVyc3RhbmQgd2h5IGFueW9uZSBjYW4gYmUgaGVz
aXRhbnQgYWJvdXQgdGhlIHNlcmllcy4KCklNSE8gdGhlIGFib3ZlIGV4YW1wbGVzLCBpbGx1c3Ry
YXRlIHF1aXRlIHJlYXNvbmFibGUgY29tcHJvbWlzZSBiZXR3ZWVuCm9wZW4tc291cmNlIGFuZCBj
bG9zZWQtc291cmNlL3ByaXZhdGUgc29sdXRpb25zLgoKRG9uJ3QgeW91IGFncmVlPwoKPiA+PiBG
b3IgdGhlIHJlY29yZDogSSBzdHJvbmdseSB0aGluayB0aGF0IHdlIGRvbid0IHdhbnQgdG8gZXhw
b3NlIGFueSByZW5kZXIKPiA+PiBmdW5jdGlvbmFsaXR5IG9uIHRoZSBwcmltYXJ5IG5vZGUuCj4g
Pj4KPiA+PiBUbyBldmVuIGdvIGEgc3RlcCBmdXJ0aGVyIEkgd291bGQgc2F5IHRoYXQgYXQgbGVh
c3Qgb24gQU1EIGhhcmR3YXJlIHdlCj4gPj4gc2hvdWxkIGNvbXBsZXRlbHkgZGlzYWJsZSBEUkky
IGZvciBvbmUgb2YgdGhlIG5leHQgZ2VuZXJhdGlvbnMuCj4gPj4KPiA+IEl0J3MgZG9hYmxlIGFu
ZCBvdmVyYWxsIHByZXR0eSBuZWF0IGlkZWEuCj4gPgo+ID4gVGhlcmUgaXMgYSBjb25zZXJuIHRo
YXQgdGhpcyBhcHByb2FjaCBtYXkgY2F1c2UgZmFyIG1vcmUgcmVncmVzc2lvbnMKPiA+IHRoYXQg
dGhpcyBzZXJpZXMuIFdlIGFyZSB0YWxraW5nIGFib3V0IHllYXJzIHdvcnRoIG9mIE1lc2EgZHJp
dmVycyAoZXQKPiA+IGFsKSB0aGF0IGRlcGVuZCBvbiByZW5kZXIgZnVuY3Rpb25hbGl0eSBleHBv
c2VkIHZpYSB0aGUgcHJpbWFyeSBub2RlLgo+IAo+IFllYWgsIHRoYXQncyBJJ20gcGVyZmVjdGx5
IGF3YXJlIG9mLiBJdCdzIHRoZSByZWFzb24gd2h5IEkgc2FpZCB3ZSAKPiBzaG91bGQgb25seSBk
byBpdCBmb3IgbmV3IGhhcmR3YXJlIGdlbmVyYXRpb25zLgo+IAo+IEJ1dCBhdCBzb21lIHBvaW50
IEkgdGhpbmsgd2Ugc2hvdWxkIGRvIHRoaXMgYW5kIGdldCByaWQgb2YgCj4gYXV0aGVudGljYXRp
b24vZmxpbmsvRFJJMi8uLi4uCj4gCkZ3aXcgSSBzaGFyZSBhIHNpbWlsYXIgc2VudGltZW50LiBJ
ZiB5b3UndmUgbG9va2VkIHRocm91Z2ggdGhlIHNlcmllcywKdGhpcyBpcyBlZmZlY3RpdmVseSBz
dGVwIDEsIHRvd2FyZHMgbnVraW5nIERSTV9BVVRIIDotKQoKPiA+IEknbSBPSyB3aXRoIHdyaXRp
bmcgdGhlIHBhdGNoZXMsIGJ1dCBpdCdsbCBiZSB1cC10byB0aGUgQU1ER1BVIHRlYW0gdG8KPiA+
IGZvbGxvdy11cCB3aXRoIGFueSByZWdyZXNzaW9ucy4gQXJlIHlvdSBvayB3aXRoIHRoYXQ/Cj4g
Cj4gQXMgbG9uZyBhcyB3ZSBoYXZlIGEgY2hlY2sgbGlrZSBhZGV2LT5mYW1pbHlfaWQgPiAKPiBX
SEFURVZFUl9JU19USEVfQ1VSUkVOVF9MQVRFU1RfVVBTVFJFQU1fSFcsIEkgdGhpbmsgd2UgYXJl
IGZpbmUgd2l0aCB0aGF0Lgo+IAo+IElmIEkgdW5kZXJzdG9vZCBNaWNoZWwgY29ycmVjdGx5IHhm
ODYtdmlkZW8tYW1kZ3B1IHNob3VsZCB3b3JrLCBidXQgCj4gbW9kZXNldCBtaWdodCBicmVhayBh
bmQgbmVlZHMgYSBwYXRjaC4KPiAKVW5sZXNzIEkgaGF2ZSBjb25jcmV0ZSBXSEFURVZFUl9JU19U
SEUuLi4gSSBjYW5ub3QgZG8gbXVjaCBoZXJlIDotKAoKClRoYW5rcwpFbWlsCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
