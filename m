Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E04E4104FA0
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 10:49:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32ADD6EC6A;
	Thu, 21 Nov 2019 09:49:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A02B66EC6A
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 09:49:30 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id b11so2943679wmb.5
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 01:49:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=mQ72QGAuONoaD06OtAUFQjjkbWWipmAJdNTyvJOj0zw=;
 b=d3/7RbDaEAIz3rLGl4y4qcGixhbTgtF0WOjmxKl5jo4sLg8UKXjV2hyH3NO6pGobnJ
 Kp5DvGyMaDPsdQEv13aqdKKFqyYlt2rWevLhTAb+52YZxrLpwlXtWXisiIkustYxEdz8
 WieE+8CZ8dn3YPqwMVjzbMoQaMruxHvyl45cY65A1HTnU6p7o2pfNs5Aq08iCMRmYEVI
 qz8E8sX0QerSy7B5nevpveGJmc9xHBKpVzjkR3vfaPoN50fcqfjHNHL1zpGY62jqXPQn
 NC8b9k6k8sMpK9hiX3g7isa8ssY/w10NwPbsOuYM5M50xgEOgS8cMm/7qWXZRZlBSIuh
 KVPA==
X-Gm-Message-State: APjAAAXJqeapeI2UMZjwllHDx/CRZxnW8Vw3h17RCAqan+N6xadLVmxe
 HC9fV/2OS7q9XbeCW1FdxDZbbw==
X-Google-Smtp-Source: APXvYqyWLlsZIl/sVzGpMq0amP0tId4NYVfLQK9FPM7iZRvYtQmGILYlVx6PgqxtGP5+7WicEJmtgw==
X-Received: by 2002:a05:600c:2295:: with SMTP id
 21mr8289518wmf.85.1574329769158; 
 Thu, 21 Nov 2019 01:49:29 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id r25sm2269227wmh.6.2019.11.21.01.49.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2019 01:49:28 -0800 (PST)
Date: Thu, 21 Nov 2019 10:49:26 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>,
 Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH v4 6/6] drm/komeda: Expose side_by_side by sysfs/config_id
Message-ID: <20191121094926.GC6236@phenom.ffwll.local>
Mail-Followup-To: "james qian wang (Arm Technology China)"
 <james.qian.wang@arm.com>, 
 Dave Airlie <airlied@gmail.com>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 Brian Starkey <Brian.Starkey@arm.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>, nd <nd@arm.com>,
 "Oscar Zhang (Arm Technology China)" <Oscar.Zhang@arm.com>,
 "Tiannan Zhu (Arm Technology China)" <Tiannan.Zhu@arm.com>,
 "Jonathan Chai (Arm Technology China)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin (Arm Technology China)" <Julien.Yin@arm.com>,
 "Channing Chen (Arm Technology China)" <Channing.Chen@arm.com>,
 "Thomas Sun (Arm Technology China)" <thomas.Sun@arm.com>,
 "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>,
 Ben Davis <Ben.Davis@arm.com>
References: <20191121071205.27511-1-james.qian.wang@arm.com>
 <20191121071205.27511-7-james.qian.wang@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191121071205.27511-7-james.qian.wang@arm.com>
X-Operating-System: Linux phenom 5.3.0-1-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=mQ72QGAuONoaD06OtAUFQjjkbWWipmAJdNTyvJOj0zw=;
 b=Lc7VSrvSOKjJsQGNVMBoNqty9LZdG+eGBss036j1dc+dtCkIbLCBYS6Xu3Mzr+uCCH
 U+4PvmPM16zC4t743caJWje5/YOdFcChk7BIoVIYbt63eDeTa1Z5ySkg1GDMk1iEXph6
 MkdejZkPZ14Xqv4Kx6WhConq/x7/9mS8EN1U4=
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
Cc: Mihail Atanassov <Mihail.Atanassov@arm.com>,
 "Oscar Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>,
 "Tiannan Zhu \(Arm Technology China\)" <Tiannan.Zhu@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "Channing Chen \(Arm Technology China\)" <Channing.Chen@arm.com>,
 Ben Davis <Ben.Davis@arm.com>,
 "Thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>, nd <nd@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMjEsIDIwMTkgYXQgMDc6MTI6NTVBTSArMDAwMCwgamFtZXMgcWlhbiB3YW5n
IChBcm0gVGVjaG5vbG9neSBDaGluYSkgd3JvdGU6Cj4gVGhlcmUgYXJlIHNvbWUgcmVzdHJpY3Rp
b25zIGlmIEhXIHdvcmtzIG9uIHNpZGVfYnlfc2lkZSwgZXhwb3NlIGl0IHZpYQo+IGNvbmZpZ19p
ZCB0byB1c2VyLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphbWVzIFFpYW4gV2FuZyAoQXJtIFRlY2hu
b2xvZ3kgQ2hpbmEpIDxqYW1lcy5xaWFuLndhbmdAYXJtLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9n
cHUvZHJtL2FybS9kaXNwbGF5L2luY2x1ZGUvbWFsaWRwX3Byb2R1Y3QuaCB8IDMgKystCj4gIGRy
aXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5jICAgICAgfCAxICsK
PiAgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2luY2x1ZGUvbWFsaWRwX3By
b2R1Y3QuaCBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9pbmNsdWRlL21hbGlkcF9wcm9k
dWN0LmgKPiBpbmRleCAxMDUzYjExMzUyZWIuLjk2ZTJlNDAxNjI1MCAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkvaW5jbHVkZS9tYWxpZHBfcHJvZHVjdC5oCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2luY2x1ZGUvbWFsaWRwX3Byb2R1Y3QuaAo+
IEBAIC0yNyw3ICsyNyw4IEBAIHVuaW9uIGtvbWVkYV9jb25maWdfaWQgewo+ICAJCQluX3NjYWxl
cnM6MiwgLyogbnVtYmVyIG9mIHNjYWxlcnMgcGVyIHBpcGVsaW5lICovCj4gIAkJCW5fbGF5ZXJz
OjMsIC8qIG51bWJlciBvZiBsYXllcnMgcGVyIHBpcGVsaW5lICovCj4gIAkJCW5fcmljaHM6Mywg
LyogbnVtYmVyIG9mIHJpY2ggbGF5ZXJzIHBlciBwaXBlbGluZSAqLwo+IC0JCQlyZXNlcnZlZF9i
aXRzOjY7Cj4gKwkJCXNpZGVfYnlfc2lkZToxLCAvKiBpZiBIVyB3b3JrcyBvbiBzaWRlX2J5X3Np
ZGUgbW9kZSAqLwo+ICsJCQlyZXNlcnZlZF9iaXRzOjU7Cj4gIAl9Owo+ICAJX191MzIgdmFsdWU7
Cj4gIH07Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEv
a29tZWRhX2Rldi5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFf
ZGV2LmMKPiBpbmRleCBjM2ZhNDgzNWNiOGQuLjRkZDQ2OTlkNGUzZCAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuYwo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5jCj4gQEAgLTgzLDYg
KzgzLDcgQEAgY29uZmlnX2lkX3Nob3coc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNl
X2F0dHJpYnV0ZSAqYXR0ciwgY2hhciAqYnVmKQoKVWgsIHRoaXMgc3lzZnMgZmlsZSBoZXJlIGxv
b2tzIGEgbG90IGxpa2UgdWFwaSBmb3Igc29tZSBjb21wb3NpdG9yIHRvCmRlY2lkZSB3aGF0IHRv
IGRvLiBEbyB5b3UgaGF2ZSB0aGUgdXNlcnNwYWNlIGZvciB0aGlzPwoKQWxzbyBhIGZldyBtb3Jl
IHRob3VnaHRzIG9uIHRoaXM6Ci0gWW91IGNhbid0IGp1c3QgYWRkIG1vcmUgZmllbGRzIHRvIHVh
cGkgc3RydWN0cy4KLSBUaGlzIGRvZXNuJ3QgcmVhbGx5IGZlZWwgbGlrZSBpdCB3YXMgZXZlciBy
ZXZpZXdlZCB0byBmaXQgaW50byBhdG9taWMuCi0gc3lzZnMgc2hvdWxkIGJlIG9uZSB2YWx1ZSBw
ZXIgZmlsZSwgbm90IGEgc21vcmdhc2Jyb2Qgb2YgdGhpbmdzIHN0dWZmZWQKICBpbnRvIGEgYmlu
YXJ5IHN0cnVjdHVyZS4KLURhbmllbAoKPiAgCW1lbXNldCgmY29uZmlnX2lkLCAwLCBzaXplb2Yo
Y29uZmlnX2lkKSk7Cj4gIAo+ICAJY29uZmlnX2lkLm1heF9saW5lX3N6ID0gcGlwZS0+bGF5ZXJz
WzBdLT5oc2l6ZV9pbi5lbmQ7Cj4gKwljb25maWdfaWQuc2lkZV9ieV9zaWRlID0gbWRldi0+c2lk
ZV9ieV9zaWRlOwo+ICAJY29uZmlnX2lkLm5fcGlwZWxpbmVzID0gbWRldi0+bl9waXBlbGluZXM7
Cj4gIAljb25maWdfaWQubl9zY2FsZXJzID0gcGlwZS0+bl9zY2FsZXJzOwo+ICAJY29uZmlnX2lk
Lm5fbGF5ZXJzID0gcGlwZS0+bl9sYXllcnM7Cj4gLS0gCj4gMi4yMC4xCj4gCj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCgotLSAKRGFuaWVsIFZl
dHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3
bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
