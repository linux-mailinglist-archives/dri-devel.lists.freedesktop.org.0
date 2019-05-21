Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F33D625268
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 16:44:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28DC389402;
	Tue, 21 May 2019 14:44:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7F3D893EF
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 14:44:08 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id e24so29761303edq.6
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 07:44:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=XLgH+ZZ3WKzb7D+qj9bXGmSZGWzbDfZToaeraj7LVV0=;
 b=uOTp0ifY5dPNWOM7rL3vCm55fzwhGuRTukSnyQXL3ggWMjLXACEcAprXdbi/SErA7J
 OPmSe8Vz/9dvzLs/JLnev0wChnW7LRTGNP+JVvGhSOCKgWXHaLEpaBFAGqqHwUCd76kW
 VO72sntxBgmApN2S+wc2JWzK9ybcxP8qohEHyxDYYQkmuFM9gOvnVRXSohJPCJ/Upe5w
 iwy2eDPCXmkmTZ1QJJ/yiT7ByS+iV+wL3hLhW5AKKFGebMfFOn+SbbtdBu17Vg6H8TjF
 l5T98cFA/aTpQBQVh+1qiAAa+Y/lYlGMKY7mf3hNaLXobmcehxHLuw4947VTWUKMGrR7
 q66Q==
X-Gm-Message-State: APjAAAWnHVMY4cwh3+xhZidtzYOoaRY2CGJ4a/PrCL+PWJ3bxNV6G2Cy
 Gbmk158RvqSCESTo2TNTU3gVoQ==
X-Google-Smtp-Source: APXvYqx9NvQk2BTxyGaLolRba6i3SGA2qXZ4jG2oVsHrw3JQ+kBgZxMEwv/8IymMkftYpF2VKDWg5A==
X-Received: by 2002:a17:906:619:: with SMTP id
 s25mr38518039ejb.274.1558449847417; 
 Tue, 21 May 2019 07:44:07 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id qq13sm3542513ejb.1.2019.05.21.07.44.06
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 21 May 2019 07:44:06 -0700 (PDT)
Date: Tue, 21 May 2019 16:44:04 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Subject: Re: [PATCH] kernel.h: Add non_block_start/end()
Message-ID: <20190521144404.GO21222@phenom.ffwll.local>
References: <20190521100611.10089-1-daniel.vetter@ffwll.ch>
 <3bab9909-b32a-8cc6-df38-5afc2e7bff69@I-love.SAKURA.ne.jp>
 <20190521105126.GP32329@dhcp22.suse.cz>
 <cb86e2b2-7717-0d48-1fca-eba6cb975e96@i-love.sakura.ne.jp>
 <20190521111151.GS32329@dhcp22.suse.cz>
 <765bdfea-915d-ee86-f885-59b11f4c54db@i-love.sakura.ne.jp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <765bdfea-915d-ee86-f885-59b11f4c54db@i-love.sakura.ne.jp>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=XLgH+ZZ3WKzb7D+qj9bXGmSZGWzbDfZToaeraj7LVV0=;
 b=DdrA2rPQgaozfbj+f15YhReoyJvMpPZKoXRpiKcBgcsFRs7cwRMsaOpnElXm1buqG0
 WOENbWcWvpNiNUNOWd3yHDoVLSzFC7jaOvZ8Qtw2F91+sNSU/eEFObqZyfbAiESxBciw
 vEwHZb1Ayk5DgSHJhvet+z8mCEonT40guPyh0=
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
Cc: Michal Hocko <mhocko@suse.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMjEsIDIwMTkgYXQgMDg6MjQ6NTNQTSArMDkwMCwgVGV0c3VvIEhhbmRhIHdy
b3RlOgo+IE9uIDIwMTkvMDUvMjEgMjA6MTEsIE1pY2hhbCBIb2NrbyB3cm90ZToKPiA+IE9uIFR1
ZSAyMS0wNS0xOSAyMDowNDozNCwgVGV0c3VvIEhhbmRhIHdyb3RlOgo+ID4+IE9uIDIwMTkvMDUv
MjEgMTk6NTEsIE1pY2hhbCBIb2NrbyB3cm90ZToKPiA+Pj4gT24gVHVlIDIxLTA1LTE5IDE5OjQ0
OjAxLCBUZXRzdW8gSGFuZGEgd3JvdGU6Cj4gPj4+PiBPbiAyMDE5LzA1LzIxIDE5OjA2LCBEYW5p
ZWwgVmV0dGVyIHdyb3RlOgo+ID4+Pj4+IEluIHNvbWUgc3BlY2lhbCBjYXNlcyB3ZSBtdXN0IG5v
dCBibG9jaywgYnV0IHRoZXJlJ3Mgbm90IGEKPiA+Pj4+PiBzcGlubG9jaywgcHJlZW1wdC1vZmYs
IGlycXMtb2ZmIG9yIHNpbWlsYXIgY3JpdGljYWwgc2VjdGlvbiBhbHJlYWR5Cj4gPj4+Pj4gdGhh
dCBhcm1zIHRoZSBtaWdodF9zbGVlcCgpIGRlYnVnIGNoZWNrcy4gQWRkIGEgbm9uX2Jsb2NrX3N0
YXJ0L2VuZCgpCj4gPj4+Pj4gcGFpciB0byBhbm5vdGF0ZSB0aGVzZS4KPiA+Pj4+Pgo+ID4+Pj4+
IFRoaXMgd2lsbCBiZSB1c2VkIGluIHRoZSBvb20gcGF0aHMgb2YgbW11LW5vdGlmaWVycywgd2hl
cmUgYmxvY2tpbmcgaXMKPiA+Pj4+PiBub3QgYWxsb3dlZCB0byBtYWtlIHN1cmUgdGhlcmUncyBm
b3J3YXJkIHByb2dyZXNzLiBRdW90aW5nIE1pY2hhbDoKPiA+Pj4+Pgo+ID4+Pj4+ICJUaGUgbm90
aWZpZXIgaXMgY2FsbGVkIGZyb20gcXVpdGUgYSByZXN0cmljdGVkIGNvbnRleHQgLSBvb21fcmVh
cGVyIC0KPiA+Pj4+PiB3aGljaCBzaG91bGRuJ3QgZGVwZW5kIG9uIGFueSBsb2NrcyBvciBzbGVl
cGFibGUgY29uZGl0aW9uYWxzLiBUaGUgY29kZQo+ID4+Pj4+IHNob3VsZCBiZSBzd2lmdCBhcyB3
ZWxsIGJ1dCB3ZSBtb3N0bHkgZG8gY2FyZSBhYm91dCBpdCB0byBtYWtlIGEgZm9yd2FyZAo+ID4+
Pj4+IHByb2dyZXNzLiBDaGVja2luZyBmb3Igc2xlZXBhYmxlIGNvbnRleHQgaXMgdGhlIGJlc3Qg
dGhpbmcgd2UgY291bGQgY29tZQo+ID4+Pj4+IHVwIHdpdGggdGhhdCB3b3VsZCBkZXNjcmliZSB0
aGVzZSBkZW1hbmRzIGF0IGxlYXN0IHBhcnRpYWxseS4iCj4gPj4+Pj4KPiA+Pj4+Cj4gPj4+PiBD
YW4gdGhpcyBiZSBjaGVja2VkIGZvciBPT00gbm90aWZpZXIgYXMgd2VsbD8KPiA+Pj4+Cj4gPj4+
PiAgCWlmICghaXNfbWVtY2dfb29tKG9jKSkgewo+ID4+Pj4gKwkJbm9uX2Jsb2NrX3N0YXJ0KCk7
Cj4gPj4+PiAgCQlibG9ja2luZ19ub3RpZmllcl9jYWxsX2NoYWluKCZvb21fbm90aWZ5X2xpc3Qs
IDAsICZmcmVlZCk7Cj4gPj4+PiArCQlub25fYmxvY2tfZW5kKCk7Cj4gPj4+PiAgCQlpZiAoZnJl
ZWQgPiAwKQo+ID4+Pj4gIAkJCS8qIEdvdCBzb21lIG1lbW9yeSBiYWNrIGluIHRoZSBsYXN0IHNl
Y29uZC4gKi8KPiA+Pj4+ICAJCQlyZXR1cm4gdHJ1ZTsKPiA+Pj4+ICAJfQo+ID4+Pj4KPiA+Pj4+
IEl0IGlzIG5vdCBjbGVhciB3aGV0aGVyIGk5MTUncyBvb21fbm90aWZpZXIgZnVuY3Rpb24gaGFz
IHN1Y2ggZGVwZW5kZW5jeS4KPiA+Pj4KPiA+Pj4gSXQgaXMgbm90IGJ1dCB0aGVuIHdlIHNob3Vs
ZCBiZSB1c2luZyB0aGUgbm9uLWJsb2NraW5nIEFQSSBpZiB0aGlzIGlzCj4gPj4+IGEgcmVhbCBw
cm9ibGVtLiBUaGUgYWJvdmUgY29kZSBqdXN0IGRvZXNuJ3QgbWFrZSBhbnkgc2Vuc2UuIFdlIGhh
dmUgYQo+ID4+PiBibG9ja2luZyBBUEkgY2FsbGVkIGFuZCB3cmFwcGVkIGJ5IG5vbi1ibG9ja2lu
ZyBvbmUuCj4gPj4KPiA+PiBPT00gbm90aWZpZXJzIHNob3VsZCBub3QgZGVwZW5kIG9uIGFueSBs
b2NrcyBvciBzbGVlcGFibGUgY29uZGl0aW9uYWxzLgo+ID4+IElmIHNvbWUgbG9jayBkaXJlY3Rs
eSBvciBpbmRpcmVjdGx5IGRlcGVuZGVkIG9uIF9fR0ZQX0RJUkVDVF9SRUNMQUlNLAo+ID4+IGl0
IHdpbGwgZGVhZGxvY2suIFRodXMsIGRlc3BpdGUgYmxvY2tpbmcgQVBJLCB0aGlzIHNob3VsZCBl
ZmZlY3RpdmVseSBiZQo+ID4+IG5vbi1ibG9ja2luZy4gQWxsIE9PTSBub3RpZmllciB1c2VycyBl
eGNlcHQgaTkxNSBzZWVtcyB0byBiZSBhdG9taWMsIGJ1dAo+ID4+IEkgY2FuJ3QgZXZhbHVhdGUg
aTkxNSBwYXJ0Li4uCj4gPiAKPiA+IFJlYWQgYWdhaW4gd2hhdCBJJ3ZlIHdyaXR0ZW4sIHBsZWFz
ZQo+ID4gCj4gCj4gUXVlc3Rpb24gdG8gRGFuaWVsOiBJcyBpOTE1J3Mgb29tX25vdGlmaWVyIGZ1
bmN0aW9uIGF0b21pYz8KCkl0J3Mgc3VwcG9zZWQgdG8gbm90IGJsb2NrIHRvbyBtdWNoIGF0IGxl
YXN0LCBJIGRvbid0IHRoaW5rIGl0J3MgZW50aXJlbHkKYXRvbWljLiBXYWtpbmcgdXAgdGhlIGRl
dmljZSAod2hpY2ggd2UgbmVlZCB0byB3cml0ZSBzb21lIG9mIHRoZSBwdGVzKQp3aWxsIHRha2Ug
c29tZSB0aW1lIGFuZCBJIHRoaW5rIGFjcXVpcmVzIGEgZmV3IG11dGV4ZXMsIGJ1dCBub3QgMTAw
JSBzdXJlLgoKSWYgeW91IHdhbnQgdG8gc2VlLCBzZW5kIGEgcGF0Y2ggdG8gaW50ZWwtZ2Z4IG0t
bCBhbmQgQ0kgd2lsbCBwaWNrIGl0IHVwCmFuZCB0ZXN0IHdpdGggb3VyIGZhcm0gb2YgbWFjaGlu
ZXMuCi1EYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENv
cnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
