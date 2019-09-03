Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC88FA72C7
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 20:50:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45D6C897DC;
	Tue,  3 Sep 2019 18:50:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C14BA897D7;
 Tue,  3 Sep 2019 18:50:17 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id g17so17008273qkk.8;
 Tue, 03 Sep 2019 11:50:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=BDfBshMUzfkMYDP3YH1WRh6hiP2fR1TX24dTioUhIbQ=;
 b=aCnhELhKap4n/qAbYopAHS3TbeA/gAV+AfUKfMsWrmwjXkUGzGkARYRPjf/by2iE+n
 K4JZD+emxFBsKzwtRl9J2ID3xk3OUGal7DlTPHVkiy4qbBNRt5QleivesnkBi/VKzl8i
 0GxcLl0m20oCoj41+ZP7rlofKasloL3gd88nIr76hzq3lYmtVCFq8udNZuOkAYXDDZPO
 YRK0wWSmqLcsLeg88KzuJ5VmPKw+YmzJB868jFlANtuGKW1GTtnVfoS5AzmP5uuF8vLZ
 jCuzRR+8CwQkz6+/C/RFGAu75oC7cAmrgSGmgdCw+7sJ8/uuq9lYupkVlh4z7YEB/laE
 6YOA==
X-Gm-Message-State: APjAAAWHBOCzGw0qrfPjqKvY0xqsUCK3qh0OGPcCzbn9OWIqmL13k/M3
 fBlv0KT0fY5WfRuEhHbK3go=
X-Google-Smtp-Source: APXvYqzGfq/TdcKTRHxQF8pThh2LVU84/6JBMpDTx3YojkrUVzDJuWf5SwH5C2Mz7xoaMt6ezZ9P7g==
X-Received: by 2002:a37:4dc5:: with SMTP id
 a188mr37144637qkb.206.1567536616471; 
 Tue, 03 Sep 2019 11:50:16 -0700 (PDT)
Received: from localhost ([2620:10d:c091:500::3:33b1])
 by smtp.gmail.com with ESMTPSA id z200sm5004754qkb.5.2019.09.03.11.50.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 03 Sep 2019 11:50:15 -0700 (PDT)
Date: Tue, 3 Sep 2019 11:50:13 -0700
From: Tejun Heo <tj@kernel.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH RFC v4 00/16] new cgroup controller for gpu/drm subsystem
Message-ID: <20190903185013.GI2263813@devbig004.ftw2.facebook.com>
References: <20190829060533.32315-1-Kenny.Ho@amd.com>
 <20190831042857.GD2263813@devbig004.ftw2.facebook.com>
 <20190903075550.GJ2112@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190903075550.GJ2112@phenom.ffwll.local>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=BDfBshMUzfkMYDP3YH1WRh6hiP2fR1TX24dTioUhIbQ=;
 b=NTSOQalIWGHMGNYP1d6ExwLAx6waOaiYDBcu+w1BHywazlCdIQhI0AlWRcLAb6lUY8
 W+kJWm2FvgFeCuzwaChDW69mva1GopmVd/jb/S65qOqf9t6BGHejfki1udqvY8AXLC7t
 a9D+Wad3HFd2GytQiMK+SLv3joJoF4F1T2Kmn97gv//vKLs0HMCF12FEE7UArVD5to+X
 8yWEGsmpcVGudEZvAiDtIT3OmnPV1ACvpGxI/b7phHe6icTpIgQxSKUC6Ia0PTr+eeIG
 emZNWocZOvntlJOiyfY3anzcUDsDEOdDPx5rj4MB7RWFUYe59BG+pJ9ulroB5diOXyHn
 t6cg==
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
Cc: Kenny Ho <Kenny.Ho@amd.com>, felix.kuehling@amd.com, jsparks@cray.com,
 amd-gfx@lists.freedesktop.org, lkaplan@cray.com, y2kenny@gmail.com,
 dri-devel@lists.freedesktop.org, joseph.greathouse@amd.com,
 alexander.deucher@amd.com, cgroups@vger.kernel.org, christian.koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8sIERhbmllbC4KCk9uIFR1ZSwgU2VwIDAzLCAyMDE5IGF0IDA5OjU1OjUwQU0gKzAyMDAs
IERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gPiAqIFdoaWxlIGJyZWFraW5nIHVwIGFuZCBhcHBseWlu
ZyBjb250cm9sIHRvIGRpZmZlcmVudCB0eXBlcyBvZgo+ID4gICBpbnRlcm5hbCBvYmplY3RzIG1h
eSBzZWVtIGF0dHJhY3RpdmUgdG8gZm9sa3Mgd2hvIHdvcmsgZGF5IGluIGFuZAo+ID4gICBkYXkg
b3V0IHdpdGggdGhlIHN1YnN5c3RlbSwgdGhleSBhcmVuJ3QgYWxsIHRoYXQgdXNlZnVsIHRvIHVz
ZXJzIGFuZAo+ID4gICB0aGUgc2lsb2VkIGNvbnRyb2xzIGFyZSBsaWtlbHkgdG8gbWFrZSB0aGUg
d2hvbGUgbWVjaGFuaXNtIGEgbG90Cj4gPiAgIGxlc3MgdXNlZnVsLiAgV2UgaGFkIHRoZSBzYW1l
IHByb2JsZW0gd2l0aCBjZ3JvdXAxIG1lbWNnIC0gcHV0dGluZwo+ID4gICBjb250cm9sIG9mIGRp
ZmZlcmVudCB1c2VzIG9mIG1lbW9yeSB1bmRlciBzZXBhcmF0ZSBrbm9icy4gIEl0IG1hZGUKPiA+
ICAgdGhlIHdob2xlIHRoaW5nIHByZXR0eSB1c2VsZXNzLiAgZS5nLiBpZiB5b3UgY29uc3RyYWlu
IGFsbCBrbm9icwo+ID4gICB0aWdodCBlbm91Z2ggdG8gY29udHJvbCB0aGUgb3ZlcmFsbCB1c2Fn
ZSwgb3ZlcmFsbCB1dGlsaXphdGlvbgo+ID4gICBzdWZmZXJzLCBidXQgaWYgeW91IGRvbid0LCB5
b3UgcmVhbGx5IGRvbid0IGhhdmUgY29udHJvbCBvdmVyIGFjdHVhbAo+ID4gICB1c2FnZS4gIEZv
ciBtZW1jZywgd2hhdCBoYXMgdG8gYmUgYWxsb2NhdGVkIGFuZCBjb250cm9sbGVkIGlzCj4gPiAg
IHBoeXNpY2FsIG1lbW9yeSwgbm8gbWF0dGVyIGhvdyB0aGV5J3JlIHVzZWQuICBJdCdzIG5vdCBs
aWtlIHlvdSBjYW4KPiA+ICAgZ28gYnV5IG1vcmUgInNvY2tldCIgbWVtb3J5LiAgQXQgbGVhc3Qg
ZnJvbSB0aGUgbG9va3Mgb2YgaXQsIEknbQo+ID4gICBhZnJhaWQgZ3B1IGNvbnRyb2xsZXIgaXMg
cmVwZWF0aW5nIHRoZSBzYW1lIG1pc3Rha2VzLgo+IAo+IFdlIGRvIGhhdmUgcXVpdGUgYSBwaWxl
IG9mIGRpZmZlcmVudCBtZW1vcmllcyBhbmQgcmFuZ2VzLCBzbyBJIGRvbid0Cj4gdGhpbmt0IHdl
J3JlIGRvaW5nIHRoZSBzYW1lIG1pc3Rha2UgaGVyZS4gQnV0IGl0IGlzIG1heWJlIGEgYml0IHRv
bwoKSSBzZWUuICBPbmUgdGhpbmcgd2hpY2ggY2F1Z2h0IG15IGV5ZXMgd2FzIHRoZSBzeXN0ZW0g
bWVtb3J5IGNvbnRyb2wuClNob3VsZG4ndCB0aGF0IGJlIGNvbnRyb2xsZWQgYnkgbWVtY2c/ICBJ
cyB0aGVyZSBzb21ldGhpbmcgc3BlY2lhbAphYm91dCBzeXN0ZW0gbWVtb3J5IHVzZWQgYnkgZ3B1
cz8KCj4gY29tcGxpY2F0ZWQsIGFuZCBleHBvc2VzIHN0dWZmIHRoYXQgbW9zdCB1c2VycyByZWFs
bHkgZG9uJ3QgY2FyZSBhYm91dC4KCkNvdWxkIGJlIGZyb20gbWUgbm90IGtub3dpbmcgbXVjaCBh
Ym91dCBncHVzIGJ1dCBkZWZpbml0ZWx5IGxvb2tzIHRvbwpjb21wbGV4IHRvIG1lLiAgSSBkb24n
dCBzZWUgaG93IHVzZXJzIHdvdWxkIGJlIGFibGUgdG8gYWxsb2F0ZSwgdnJhbSwKc3lzdGVtIG1l
bW9yeSBhbmQgR0FSVCB3aXRoIHJlYXNvbmFibGUgYWNjdXJhY3kuICBtZW1jZyBvbiBjZ3JvdXAy
CmRlYWxzIHdpdGgganVzdCBzaW5nbGUgbnVtYmVyIGFuZCB0aGF0J3MgYWxyZWFkeSBwbGVudHkg
Y2hhbGxlbmdpbmcuCgpUaGFua3MuCgotLSAKdGVqdW4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
