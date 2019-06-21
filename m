Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFEB4E7AF
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 14:00:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E7896E890;
	Fri, 21 Jun 2019 12:00:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 961D989916;
 Fri, 21 Jun 2019 12:00:55 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id x4so6317528wrt.6;
 Fri, 21 Jun 2019 05:00:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=XLbKFjOHHdNFvBcff3OOBd1B/9iJkQka2vhyBCbci+k=;
 b=dK0n+kgqaVLdZ5ao/9muJgqcs5VGzCrnVkq3xmMLWi4q2EfqM3WOOT3gel02L94UU3
 I0S+PQMEz7tiJJM/j1zkhDqdnrb/LtBunrAFP/Pt9u+fgnNRneJrwNihK96/vnCch483
 EJHBLZGuRlbLKPLrhXb60MfdYuACE3CA7cdDZBZ7cMp3d3Zy1JFuSrriuUwqJo9wOLie
 6oE3jk8Av0Fdk18FreI/WBLS+qm9t2HY2qJzXAP2hcz3smDHb4jz+nP2cUV6Cuqa+TZO
 F/AzWgig0Ju/zX5pSVMBjIsH0UyHz2pZJXQ3p3a6mVMOR5TFf6YSpyyrj7ZfNIZn9yZz
 gEAw==
X-Gm-Message-State: APjAAAX4+EAA2HUvITeGAWfvHiZtg7vDuUnFo7pLgaUqVFD4ug7ZCQIy
 9YoPokYZ3AD54o+EyZbl2pE=
X-Google-Smtp-Source: APXvYqwsI8oKv5PBkc8jr+QHHGEyOCNqyoVOXzA/VgJ6ON/ExJdzEq+blQmb9b3z7Zc1vi9C6yfE4A==
X-Received: by 2002:a5d:4c87:: with SMTP id z7mr7860483wrs.58.1561118454132;
 Fri, 21 Jun 2019 05:00:54 -0700 (PDT)
Received: from arch-x1c3 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id 66sm2365812wma.11.2019.06.21.05.00.53
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 21 Jun 2019 05:00:53 -0700 (PDT)
Date: Fri, 21 Jun 2019 12:58:45 +0100
From: Emil Velikov <emil.l.velikov@gmail.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>
Subject: Re: [PATCH 01/13] drm/amdgpu: introduce and honour DRM_FORCE_AUTH
 workaround
Message-ID: <20190621115845.GC21486@arch-x1c3>
References: <84b3337c-0cdc-44d4-02c6-c56bd729ed47@amd.com>
 <20190620163012.GF1896@arch-x1c3>
 <9cad6e74-4751-0b0a-35d1-e8f0ac4d3efc@amd.com>
 <20190621090953.GZ12905@phenom.ffwll.local>
 <be9f38f5-6bb5-9535-f3d9-bafa83370e0f@amd.com>
 <CAKMK7uE5qO4q3RYNDp22gkMSSJGgz9ChxhuWPYqXO6D1UUvy6Q@mail.gmail.com>
 <20190621102015.GA21486@arch-x1c3>
 <d241fab3-b6f0-d38a-b83f-03b70736b355@amd.com>
 <20190621105347.GB21486@arch-x1c3>
 <338bb519-05f1-cb76-d965-81237f432937@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <338bb519-05f1-cb76-d965-81237f432937@amd.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=XLbKFjOHHdNFvBcff3OOBd1B/9iJkQka2vhyBCbci+k=;
 b=MyMJoXemgNHpSo9O8xmkoBMqJQy1bdtGc5lWm39uJD7MGx7wCTFVG96J40vLW2biac
 bNGPS1A0IQpmfbUZhMAus6lvZ5Cbm+cP4IwENAlK5wtf2I6MS8qh0MLna+nZ4ldG0H7m
 6mpiX6Z+vOwGKwK0xcEd/da82Vxg4lmcXqN05vOa2k5MteF08Sqp0JWhVFdq0I7mlqfk
 XQwjkG2nb5nsIkzc8mDCh2fzoj5/ybDo3Jvn+2JBM6vHImImi1ddddv5mE+uqiubFEdI
 xpzgsbZETPTgQU/I8Vz87gFp8WRYSsIs07lcotGI5NNwYlrZAZFY6gQHH6c2YoPDkBu6
 zWtQ==
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

T24gMjAxOS8wNi8yMSwgS29lbmlnLCBDaHJpc3RpYW4gd3JvdGU6Cj4gQW0gMjEuMDYuMTkgdW0g
MTI6NTMgc2NocmllYiBFbWlsIFZlbGlrb3Y6Cj4gPiBPbiAyMDE5LzA2LzIxLCBLb2VuaWcsIENo
cmlzdGlhbiB3cm90ZToKPiA+PiBbU05JUF0KPiA+PiBXZWxsIHBhcnRpYWxseS4gVGhhdCBSQURW
IGJyb2tlIGlzIHVuZm9ydHVuYXRlLCBidXQgd2UgaGF2ZSBkb25lIHNvIG1hbnkKPiA+PiBjdXN0
b21pemVkIHVzZXJzcGFjZSBzdHVmZiBib3RoIGJhc2VkIG9uIE1lc2EvRERYIGFzIHdlbGwgYXMg
Y2xvc2VkCj4gPj4gc291cmNlIGNvbXBvbmVudHMgdGhhdCBpdCBpcyBqdXN0IGhpZ2hseSBsaWtl
bHkgdGhhdCB3ZSB3b3VsZCBicmVhawo+ID4+IHNvbWV0aGluZyBlbHNlIGFzIHdlbGwuCj4gPj4K
PiA+IEFzIGFuIGVuZ2luZWVyIEkgbGlrZSB0byB3b3JrIHdpdGggdGFuZ2libGVzLiBUaGUgaGln
aGx5IGxpa2VseSBwYXJ0IGlzCj4gPiBwcm9iYWJsZSwgYnV0IGFzIG1lbnRpb25lZCBtdWx0aXBs
ZSB0aW1lcyB0aGUgc2VyaWVzIGFsbG93cyBmb3IgYSBfZGVhZF8KPiA+IHRyaXZpYWwgd2F5IHRv
IGFkZHJlc3MgYW55IHN1Y2ggcHJvYmxlbXMuCj4gCj4gV2VsbCB0byBjbGFyaWZ5IG15IGNvbmNl
cm4gaXMgdGhhdCB0aGlzIHdvbid0IGJlIHNvIHRyaXZpYWwuCj4gCj4gWW91IGltcGxlbWVudGVk
IG9uIHdvcmthcm91bmQgZm9yIG9uZSBzcGVjaWZpYyBjYXNlIGFuZCBpdCBpcyBwZXJmZWN0bHkg
Cj4gcG9zc2libGUgdGhhdCBmb3Igb3RoZXIgY2FzZXMgd2Ugd291bGQgaGF2ZSB0byBjb21wbGV0
ZWx5IHJldmVydCB0aGUgCj4gcmVtb3ZhbCBvZiBEUk1fQVVUSC4KPiAKSSB3b3VsZCBlbmNvdXJh
Z2UgeW91IHRvIHRha2UgYSBjbG9zZXIgbG9vayBhdCBteSBwYXRjaCBhbmQgcG9pbnQgb3V0Cmhv
dyBwYXJjaWN1bGFyIGNhc2VzIGNhbm5vdCBiZSBoYW5kbGVkLgoKPiA+Pj4gSW4gcGFydGljdWxh
ciwgdGhhdCB1c2VyLXNwYWNlIHdpbGwgInJlbW92ZSIgcmVuZGVyIG5vZGVzLgo+ID4+IFllcywg
dGhhdCBpcyBteSBtYWluIGNvbmNlcm4gaGVyZS4gWW91IGJhc2ljYWxseSBtYWtlIHJlbmRlciBu
b2Rlcwo+ID4+IHN1cGVyZmx1b3VzbHkuIFRoYXQgZ2l2ZXMgdXNlcnNwYWNlIGFsbCBsZWdpdGlt
aXphdGlvbiB0byBhbHNvIHJlbW92ZQo+ID4+IHN1cHBvcnQgZm9yIHRoZW0uIFRoYXQgaXMgbm90
IHN0dXBpZCBvciBldmlsIG9yIHdoYXRldmVyLCB1c2Vyc3BhY2UKPiA+PiB3b3VsZCBqdXN0IGZv
bGxvdyB0aGUga2VybmVsIGRlc2lnbi4KPiA+Pgo+ID4gRG8geW91IGhhdmUgYW4gZXhhbXBsZSBv
ZiB1c2Vyc3BhY2UgZG9pbmcgc3VjaCBhbiBleHRyZW1lbHkgc2lsbHkgdGhpbmc/Cj4gPiBJdCBk
b2VzIHNlZW0gbGlrZSBzdXNwZWN0IHlvdSdyZSBhIGNvdXBsZSBvZiBzdGVwcyBiZXlvbmQgb3Zl
cmNhdXRpb3VzLAo+ID4gcGVyaGFwcyByaWdodGZ1bGx5IHNvLiBNYXliZSB5b3UndmUgc2VlbiBz
b21lIGNsb3NlZC1zb3VyY2UgdXNlci1zcGFjZQo+ID4gZ29pbmcgY3Jhenk/IE9yIGFueSBvdGhl
ciBwcm9qZWN0cz8KPiAKPiBUaGUga2V5IHBvaW50IGlzIHRoYXQgSSBkb24ndCB0aGluayB0aGlz
IGlzIHNpbGx5IG9yIHN0cmFuZ2Ugb3IgY3JhenkgYXQgCj4gYWxsLiBTZWUgdGhlIGtlcm5lbCBk
ZWZpbmVzIHRoZSBpbnRlcmZhY2UgdXNlcnNwYWNlIGNhbiBhbmQgc2hvdWxkIHVzZS4KPiAKPiBX
aGVuIHRoZSBrZXJuZWwgZGVmaW5lcyB0aGF0IGV2ZXJ5dGhpbmcgd2lsbCB3b3JrIHdpdGggdGhl
IHByaW1hcnkgbm9kZSAKPiBpdCBpcyBwZXJmZWN0bHkgdmFsaWQgZm9yIHVzZXJzcGFjZSB0byBk
cm9wIHN1cHBvcnQgZm9yIHRoZSByZW5kZXIgbm9kZS4KPiAKPiBJIG1lYW4gd2h5IHNob3VsZCB0
aGV5IGtlZXAgdGhpcz8gSnVzdCBiZWNhdXNlIHdlIHRlbGwgdGhlbSBub3QgdG8gZG8gdGhpcz8K
PiAKRnJvbSB5b3VyIGV4cGVyaWVuc2UsIGRvIHVzZXItc3BhY2UgZGV2ZWxvcGVycyBjYXJlIGFi
b3V0IGRvaW5nIChvcgpnZW5lcmFsbHkgZG8pIHRoZSByaWdodCB0aGluZz8KCkluIGVpdGhlciBj
YXNlLCBhcyBwb2ludGVkIGFscmVhZHkgdGhlIGNhdCBpcyBvdXQgb2YgdGhlIGJhZyAtIGhhcyBi
ZWVuCmZvciB5ZWFycywgYW5kIGlmIGRldmVsb3BlcnMgZGlkIGJlaGF2ZSBhcyB5b3UgZGVzY3Jp
YmUgdGhlbSB0aGV5IHdvdWxkCmhhdmUgInJlbW92ZWQiIHJlbmRlciBub2RlcyBhbHJlYWR5LgoK
PiA+IEluIG90aGVyIHdvcmRzLCBiZWluZyBjYXV0aW91cyBpcyBncmVhdCwgYnV0IHdpdGhvdXQg
cmVmZXJlbmNlcyBvZgo+ID4gbWlzdXNlIGl0J3MgdmVyeSBoYXJkIGZvciBvdGhlcnMgdG8gZHJh
dyB0aGUgZnVsbCBwaWN0dXJlLgo+ID4KPiA+Pj4gSSdtIHJlYWxseSBzYWQgdGhhdCBhbWRncHUg
aW5zaXN0cyBvbiBzdGFuZGluZyBvdXQsIGhvcGUgb25lIGRheSBpdCB3aWxsCj4gPj4+IGNvbnZl
cmdlLiBZZXQgc2luY2UgYWxsIG90aGVyIG1haW50YWluZXJzIGFyZSBvayB3aXRoIHRoZSBzZXJp
ZXMsIEknbGwKPiA+Pj4gc3RhcnQgbWVyZ2luZyBwYXRjaGVzIGluIGEgZmV3IGhvdXJzLiBJJ20g
cmVhbGx5IHNhZCB0aGF0IGFtZGdwdSB3YW50cwo+ID4+PiB0byBzdGFuZCBvdXQsIGhvcGUgaXQg
d2lsbCBjb252ZXJnZSBzb29uZXIgcmF0aGVyIHRoYW4gbGF0ZXIuCj4gPj4+Cj4gPj4+IENocmlz
dGlhbiwgaG93IHdvdWxkIHlvdSBsaWtlIGFtZGdwdSBoYW5kbGVkIC0gd2l0aCBhIHNlcGFyYXRl
IGZsYWcgaW4KPiA+Pj4gdGhlIGRyaXZlciBvciBzaGFsbCB3ZSBzcGVjaWFsIGNhc2UgYW1kZ3B1
IHdpdGhpbiBjb3JlIGRybT8KPiA+PiBObywgSSBhc2sgeW91IHRvIHBsZWFzZSBzdGljayBhcm91
bmQgRFJNX0FVVEggZm9yIGF0IGxlYXN0IGFtZGdwdSBhbmQKPiA+PiByYWRlb24uIEFuZCBOT1Qg
ZW5hYmxlIGFueSByZW5kZXIgbm9kZSBmdW5jdGlvbmFsaXR5IGZvciB0aGVtIG9uIHRoZQo+ID4+
IHByaW1hcnkgbm9kZS4KPiA+Pgo+ID4gTXkgcXVlc3Rpb24gaXMgaG93IGRvIHlvdSB3YW50IHRo
aXMgaGFuZGxlZDoKPiA+ICAgLSBEUk1fUExFQVNFX0ZPUkNFX0FVVEggLSBhZGRlZCB0byBBTURH
UFUvUkFERU9OLCBvcgo+ID4gICAtIGRyaXZlcl9uYW1lID09IGFtZGdwdSwgaW4gY29yZSBEUk0u
Cj4gCj4gSSB3YW50IHRvIGtlZXAgRFJNX0FVVEggaW4gYW1kZ3B1IGFuZCByYWRlb24gZm9yIGF0
IGxlYXN0IHRoZSBuZXh0IDUtMTAgCj4geWVhcnMuCj4gCkJlbGlldmUgd2UncmUgYWxsIGZ1bGx5
IGF3YXJlIG9mIHRoYXQgZmFjdC4gSSdtIGFza2luZyB3aGljaCBfYXBwcm9hY2hfCnlvdSBwcmVm
ZXIuIFRoYXQgc2FpZCwgSSdsbCBzZW5kIGEgbmV3IHBhdGNoL3NlcmllcyBhbmQgd2UnbGwgbml0
cGljayBpdAp0aGVyZS4KClRoYW5rcwotRW1pbApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
