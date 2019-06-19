Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62EDB4C18D
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 21:32:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7204089AC0;
	Wed, 19 Jun 2019 19:32:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7117D89617
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 19:32:39 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id n11so438632qtl.5
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 12:32:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Q8xLvo4XJRoTTfc8mISFQW+2jt5QOewC/3/eGG/+pT4=;
 b=AJKnJvIIHWBGJgZYFGNJuWW2oDT/6KMVP1g+rbW7m7j3eeOmeKPK2v25KLwd+kqc2W
 xBamoExmZU7O6d9R2NuI1UDVrtk1X/5Il2IaidsL4omFmVvS1a9B2m98lM4xNjTttLNY
 vmKGr6lnVJVjIYSkjuwSx4/G8vvFLXyXL+JiKF8yytpB5JRMQmJ6QX5tDWC5+HxdgDnD
 /caHqqWuRBiwMzGY3WZ4IxpH6abtPs/0L7rMstv4cpjwsvYQsukHrGY9CUZJWii8IaUt
 nEbX+9xdMkZXbghGyEuMJUq0vW7zxF7bQA2BjBiVFsyW7Vr6o++jctB0PchPptk8J6BI
 OFTA==
X-Gm-Message-State: APjAAAV1JVGWYA9jzRhPvDn6I89qriqMw+xwKwi/JiOU3BtGzVLgP4bD
 CKmyO9omqo7Q+0eamZfElCuqUQ==
X-Google-Smtp-Source: APXvYqzU3bqt6aFWYDSsMGOZgac3c+Tf4JmxtpXGKRAm2NxL0BAZ6YpXV50lUEEZqAiZHOjTqqJvGw==
X-Received: by 2002:a05:6214:10c5:: with SMTP id
 r5mr33543633qvs.224.1560972758652; 
 Wed, 19 Jun 2019 12:32:38 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id i22sm11768509qti.30.2019.06.19.12.32.37
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 12:32:37 -0700 (PDT)
Date: Wed, 19 Jun 2019 15:32:37 -0400
From: Sean Paul <sean@poorly.run>
To: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH v2] drm/msm/dsi: Add parentheses to quirks check in
 dsi_phy_hw_v3_0_lane_settings
Message-ID: <20190619193237.GG25413@art_vandelay>
References: <20190619161913.102998-1-natechancellor@gmail.com>
 <20190619191722.25811-1-natechancellor@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190619191722.25811-1-natechancellor@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Q8xLvo4XJRoTTfc8mISFQW+2jt5QOewC/3/eGG/+pT4=;
 b=B9z8cIbBXSAAGkAhVirDOMtI2AzBMC5plss+zth7pSDGUd8N9fhdoqrHLDI55TNEWo
 J+rko0sHildCeJqbg6bCp3MGIDoXOwsg/rbgBJOv3c1wfEkd+bi+IScJ0OhiL9zpHHb9
 wAWbrgvkbeUAcX2j95yUEc/v9QHNS87EBQFlMoAuSmuzRb6bwSS+pc/DkqE7B13Oy6hi
 TsQTcKMNOM9UACJhQ1V9f/ngiiT6q9Cp547tjy5NFEZZrvoJhd0x3mjhDQMlIQ9GhcD/
 URvvNvzGR85eqaveHXUhfgHYlGjrtI4aC8EfeOaOZcMRxCVSwYS5mDseVoNVrwJZrjb6
 TFRw==
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
Cc: Sean Paul <sean@poorly.run>, kbuild test robot <lkp@intel.com>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 clang-built-linux@googlegroups.com, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTksIDIwMTkgYXQgMTI6MTc6MjNQTSAtMDcwMCwgTmF0aGFuIENoYW5jZWxs
b3Igd3JvdGU6Cj4gQ2xhbmcgd2FybnM6Cj4gCj4gZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvcGh5
L2RzaV9waHlfMTBubS5jOjgwOjY6IHdhcm5pbmc6IGxvZ2ljYWwgbm90IGlzCj4gb25seSBhcHBs
aWVkIHRvIHRoZSBsZWZ0IGhhbmQgc2lkZSBvZiB0aGlzIGJpdHdpc2Ugb3BlcmF0b3IKPiBbLVds
b2dpY2FsLW5vdC1wYXJlbnRoZXNlc10KPiAgICAgICAgIGlmICghcGh5LT5jZmctPnF1aXJrcyAm
IFYzXzBfMF8xME5NX09MRF9USU1JTkdTX1FVSVJLKSB7Cj4gICAgICAgICAgICAgXiAgICAgICAg
ICAgICAgICAgfgo+IGRyaXZlcnMvZ3B1L2RybS9tc20vZHNpL3BoeS9kc2lfcGh5XzEwbm0uYzo4
MDo2OiBub3RlOiBhZGQgcGFyZW50aGVzZXMKPiBhZnRlciB0aGUgJyEnIHRvIGV2YWx1YXRlIHRo
ZSBiaXR3aXNlIG9wZXJhdG9yIGZpcnN0Cj4gICAgICAgICBpZiAoIXBoeS0+Y2ZnLT5xdWlya3Mg
JiBWM18wXzBfMTBOTV9PTERfVElNSU5HU19RVUlSSykgewo+ICAgICAgICAgICAgIF4KPiAgICAg
ICAgICAgICAgKCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
KQo+IGRyaXZlcnMvZ3B1L2RybS9tc20vZHNpL3BoeS9kc2lfcGh5XzEwbm0uYzo4MDo2OiBub3Rl
OiBhZGQgcGFyZW50aGVzZXMKPiBhcm91bmQgbGVmdCBoYW5kIHNpZGUgZXhwcmVzc2lvbiB0byBz
aWxlbmNlIHRoaXMgd2FybmluZwo+ICAgICAgICAgaWYgKCFwaHktPmNmZy0+cXVpcmtzICYgVjNf
MF8wXzEwTk1fT0xEX1RJTUlOR1NfUVVJUkspIHsKPiAgICAgICAgICAgICBeCj4gICAgICAgICAg
ICAgKCAgICAgICAgICAgICAgICApCj4gMSB3YXJuaW5nIGdlbmVyYXRlZC4KPiAKPiBBZGQgcGFy
ZW50aGVzZXMgYXJvdW5kIHRoZSBiaXR3aXNlIEFORCBzbyBpdCBpcyBldmFsdWF0ZWQgZmlyc3Qg
dGhlbgo+IG5lZ2F0ZWQuCj4gCj4gRml4ZXM6IDNkYmJmOGYwOWU4MyAoImRybS9tc20vZHNpOiBB
ZGQgb2xkIHRpbWluZ3MgcXVpcmsgZm9yIDEwbm0gcGh5IikKCkhtbSwgc28gaXQgbG9va3MgbGlr
ZSB0aGlzIHBhdGNoIGlzbid0IHVwc3RyZWFtLiBXaGF0IHRyZWUgYXJlIHlvdSBiYXNpbmcgdGhp
cwpvbj8KClNlYW4KCj4gTGluazogaHR0cHM6Ly9naXRodWIuY29tL0NsYW5nQnVpbHRMaW51eC9s
aW51eC9pc3N1ZXMvNTQ3Cj4gUmVwb3J0ZWQtYnk6IGtidWlsZCB0ZXN0IHJvYm90IDxsa3BAaW50
ZWwuY29tPgo+IFJldmlld2VkLWJ5OiBKZWZmcmV5IEh1Z28gPGplZmZyZXkubC5odWdvQGdtYWls
LmNvbT4KPiBSZXZpZXdlZC1ieTogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+Cj4gU2lnbmVk
LW9mZi1ieTogTmF0aGFuIENoYW5jZWxsb3IgPG5hdGVjaGFuY2VsbG9yQGdtYWlsLmNvbT4KPiAt
LS0KPiAKPiB2MSAtPiB2MjoKPiAKPiAqIEZpeCBicm9rZW4gbGluayAodGhhbmtzIHRvIFNlYW4g
Zm9yIHBvaW50aW5nIGl0IG91dCkKPiAqIEFkZCBTZWFuJ3MgcmV2aWV3ZWQtYnkKPiAKPiAgZHJp
dmVycy9ncHUvZHJtL21zbS9kc2kvcGh5L2RzaV9waHlfMTBubS5jIHwgMiArLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvcGh5L2RzaV9waHlfMTBubS5jIGIvZHJpdmVycy9ncHUv
ZHJtL21zbS9kc2kvcGh5L2RzaV9waHlfMTBubS5jCj4gaW5kZXggZWIyODkzN2Y0YjM0Li40NzQw
M2Q0ZjJkMjggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvcGh5L2RzaV9w
aHlfMTBubS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvcGh5L2RzaV9waHlfMTBu
bS5jCj4gQEAgLTc3LDcgKzc3LDcgQEAgc3RhdGljIHZvaWQgZHNpX3BoeV9od192M18wX2xhbmVf
c2V0dGluZ3Moc3RydWN0IG1zbV9kc2lfcGh5ICpwaHkpCj4gIAkJCSAgICAgIHR4X2RjdHJsW2ld
KTsKPiAgCX0KPiAgCj4gLQlpZiAoIXBoeS0+Y2ZnLT5xdWlya3MgJiBWM18wXzBfMTBOTV9PTERf
VElNSU5HU19RVUlSSykgewo+ICsJaWYgKCEocGh5LT5jZmctPnF1aXJrcyAmIFYzXzBfMF8xME5N
X09MRF9USU1JTkdTX1FVSVJLKSkgewo+ICAJCS8qIFRvZ2dsZSBCSVQgMCB0byByZWxlYXNlIGZy
ZWV6ZSBJLzAgKi8KPiAgCQlkc2lfcGh5X3dyaXRlKGxhbmVfYmFzZSArIFJFR19EU0lfMTBubV9Q
SFlfTE5fVFhfRENUUkwoMyksIDB4MDUpOwo+ICAJCWRzaV9waHlfd3JpdGUobGFuZV9iYXNlICsg
UkVHX0RTSV8xMG5tX1BIWV9MTl9UWF9EQ1RSTCgzKSwgMHgwNCk7Cj4gLS0gCj4gMi4yMi4wCj4g
CgotLSAKU2VhbiBQYXVsLCBTb2Z0d2FyZSBFbmdpbmVlciwgR29vZ2xlIC8gQ2hyb21pdW0gT1MK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
