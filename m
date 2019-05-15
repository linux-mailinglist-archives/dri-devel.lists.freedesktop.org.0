Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 298741EA7C
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 10:54:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68D80892E0;
	Wed, 15 May 2019 08:54:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64AB9892E0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2019 08:54:55 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id b8so3004551edm.11
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2019 01:54:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=6+CZSCHvNviIpRd/fqbrau7o7yPC56jx4SShf5CdeyU=;
 b=nz6bzS4MecoOs8f+E41wkM5miFEXL4j7h4NMWEro2jhHEy5/xaBe4X0CEyHG0SlLYa
 zriE8ysJyqaeSYwb4WenqK0iE9MUnw0tbaVOVLLcbWZ4oY8/lN5zqlKlqThiQvrpkpVf
 EFt+f5pl6R7wsafqd2RxD/d35nZt7TKtG10cyoigKm4zFCUaOyIMSHAZCHsDSceMYUZM
 4uxBDv+rcomosk8bo4hgHItkwWHtyLgba7K3Y444tIQmTMB3SJOfbh31LC9YxF8p3RbO
 MDxHjKjx/S64jAF8UVg9KiAvBKUevNBOwAfzmh0dOCNRpiTAjbyXhYWNmhD2yOEgORm9
 TxmQ==
X-Gm-Message-State: APjAAAV5f+QQEyu0pKRagrZxMT5Fg8Jk1FT9eKGZGWk2bJfvsh6bZsIW
 KOMFJbMz84KYrRZEDcYxo5u1RA==
X-Google-Smtp-Source: APXvYqyMTcqpECPxAs9le0ugXV2TWuJFUBHFRpxoQ8MgzN//GKcXWaJC05ok+MjWjW7AKJsTQdB8xg==
X-Received: by 2002:a05:6402:6d2:: with SMTP id
 n18mr42327009edy.122.1557910494023; 
 Wed, 15 May 2019 01:54:54 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id z17sm584488edb.48.2019.05.15.01.54.53
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 15 May 2019 01:54:53 -0700 (PDT)
Date: Wed, 15 May 2019 10:54:50 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: Preparation for unpinned DMA-buf handling
Message-ID: <20190515085450.GE17751@phenom.ffwll.local>
References: <20190514140515.35566-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190514140515.35566-1-christian.koenig@amd.com>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=6+CZSCHvNviIpRd/fqbrau7o7yPC56jx4SShf5CdeyU=;
 b=S6nZi9pVl/njRmtc4rGRJwcQmOZGlrAiKxa8/oo2EvYk+N/Ar1znar3TMTclulGBl0
 DgiLrJquz90a130JOf8eBO0kuehGRiL41sdqRzS3dfNTKmPSJ4XxJLShaq4tV6btXtuT
 A/VWd0001+GCWAPltwhZYvcNeymPZ1IWEueDE=
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMTQsIDIwMTkgYXQgMDQ6MDU6MTNQTSArMDIwMCwgQ2hyaXN0aWFuIEvDtm5p
ZyB3cm90ZToKPiBIaSBEYW5pZWwsCj4gCj4gc2luY2Ugd2UgYXJlIG5vdCBtb3ZpbmcgZm9yd2Fy
ZCB3aXRoIHRoaXMgSSd2ZSBzZXBhcmF0ZWQgdGhlIGNoYW5nZSBvdXQgb2YgdGhlIGxhcmdlciBw
YXRjaHNldC4KPiAKPiBBbnkgb2JqZWN0aW9ucyB0byB0aGlzIG5vdz8gSXQncyBiYXNpY2FsbHkg
YSAxOjEgbW92ZSBvZiB0aGUgZnVuY3Rpb25hbGl0eSBmcm9tIERSTSB0byBETUEtYnVmLgoKRm9y
IG15IGJpZyBwaWN0dXJlIHVuZGVyc3RhbmRpbmcsIGFuZCBiZWNhdXNlIEkgc3BvdHRlZCBpbiB0
aGUgbGF0ZXN0IHJvY20KcmVsZWFzZSB0aGF0IGFwcGFyZW50bHkgdGhlIGZhbmN5IGludGVyY29u
bmVjdCBpcyBub3cgc3VwcG9ydC4gSSBsb29rZWQKYXJvdW5kIGEgYml0IGluIHVwc3RyZWFtIGFu
ZCBiYXNpYyB4Z21pIHN1cHBvcnQgc2VlbXMgdG8gYmUgdGhlcmUgYWxyZWFkeSwKYnV0IEkgaGF2
ZW4ndCBzZWVuIGFueXRoaW5nIHRoYXQgbG9va3MgbGlrZSB4Z21pIGJ1ZmZlciBzaGFyaW5nIGlz
IHRoZXJlCmFscmVhZHk/IE1pc3Npbmcgc29tZXRoaW5nLCBvciBhbSBJIGxvb2tpbmcgYXQgdGhl
IHdyb25nIHRoaW5nICh4Z21pIHNlZW1zCnRvIGJlIHRoZSBlbmdpbmVlcmluZyBuYW1lIGZvciB0
aGF0IGZhbmN5IGludGVyY29ubmVjdCBhdCBsZWFzdCkuCgpGb3IgdGhlIGJpZyBwbGFuIEkndmUg
c2VlbiB0aGUgZHluYW1pYyBkbWEtYnVmIGFuZCBwMnAgc3R1ZmYsIEkgdGhpbmsgaXQnZApiZSBn
b29kIGlmIHdlIGFsc28gbWFrZSBzdXJlIHhnbWkgYW5kIHJlbGF0ZWQgdGhpbmdzIGludGVncmF0
ZSBzb21ld2hhdApuZWF0bHkuIE9mYyB4Z21pIHJlcXVpcmVzIHRoYXQgd2UgdXBjYXN0IHRoZSBk
bWFfYnVmX2F0dGFjaG1lbnQgdG8Kc29tZXRoaWduIGRyaXZlciBzcGVjaWZpYyAoSSBkb24ndCB0
aGluayB3ZSBzaG91bGQgbWFrZSB0aGF0IGdlbmVyaWMsIGJ1dAptYXliZSBKZXJvbWUgaGFzIGRp
ZmZlcmVudCBpZGVhcyB3aXRoIEhNTSkuIFF1ZXN0aW9uIEkgaGF2ZSBpcyBob3cgbXVjaCBvZgp0
aGUgbWFwL3VubWFwL2ludmFsaWlkYXRlIGFuZCBwYXNzaW5nIHNnIHRhYmxlcyBhcm91bmQgd2Ug
Y2FuIHJldXNlIGZvcgp0aGlzLgoKSWYgeW91IGhhdmUgcGF0Y2hlcy9wb2ludGVycyB3b3VsZCBi
ZSByZWFsbHkgaW50ZXJzdGluZyB0byByZWFkIHRoZW0gYQpiaXQuCi1EYW5pZWwKLS0gCkRhbmll
bCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9n
LmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
