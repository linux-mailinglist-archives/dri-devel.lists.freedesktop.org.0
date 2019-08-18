Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4DA92109
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 12:14:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DDC7898C8;
	Mon, 19 Aug 2019 10:14:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B50A6E03C
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Aug 2019 15:47:52 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id gn20so4591964plb.2
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Aug 2019 08:47:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=21hbVFGx+8/jzq/lmcXaeMIKxoYnWYEJ5IhsV1Pi6yY=;
 b=tsAm1MRiR23PpScNZGxFl7e4oz1tiWUKlcT3ZlPItBH4g4wpgNTzCo8GfZYzEMpZtv
 P8ZSBGgEwfNCxs7KdLO3WDbWAh4gx2Adaogntd7820ujvj+DhwsADU6Ffc17vXJ4J47k
 8rQE2AiiXFQ2key8Ahvwj5/ubH01TLbHNSy81JpKu7tnrrNUizahG+Z68Wyu0o95RVya
 ASzuYJC/6He71kzBZG4ZLsFUJvkT5WQMpxZHIMowlr7bkZIDyRX+nre6gCn5pGnMyBH/
 cNGHPU9v3NVJr9pVx46mxI1PBR9mAbA5gr83zWhwqFH4k+kuAhBCX3bBWdB+matq+qpB
 +nGw==
X-Gm-Message-State: APjAAAXWdvQ6TPN50JS26GlO5NZ7YEV1CVkoEQC1nyNAal1s7g4CiYrA
 9YeOKFj3bPvdUbCtF96W4EQLZstjCaY=
X-Google-Smtp-Source: APXvYqxgOdbzTuZqpSIsD/XyuwyyQRunnfBKn90nh/nP/SkQAUAIBCmwLO8lnzsg5zvX/QzvXRi7XQ==
X-Received: by 2002:a17:902:bb81:: with SMTP id
 m1mr18764674pls.125.1566143271821; 
 Sun, 18 Aug 2019 08:47:51 -0700 (PDT)
Received: from raspberrypi ([61.83.141.141])
 by smtp.gmail.com with ESMTPSA id 1sm15190534pfx.56.2019.08.18.08.47.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Aug 2019 08:47:51 -0700 (PDT)
Date: Sun, 18 Aug 2019 16:47:44 +0100
From: Sidong Yang <realwakka@gmail.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] drm/arm: drop use of drmP.h
Message-ID: <20190818154744.GA5455@raspberrypi>
References: <20190817074115.19116-1-realwakka@gmail.com>
 <20190817163549.GA15813@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190817163549.GA15813@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Mon, 19 Aug 2019 10:14:48 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=21hbVFGx+8/jzq/lmcXaeMIKxoYnWYEJ5IhsV1Pi6yY=;
 b=L0q9PVawLVsOvBFxUCXFWKikeyH523goWfKtLidRkTAggugmUrJsK8zyriaLtId/nw
 OPjJ8rPg8N5hN4B881wlhRSRhkD30WeNu55zqirfcjB1xgCQvezNytqzkyrZln/6Y/4h
 q1esOQNtQtL53EtbMgc6Zcrwva8ZvVa2HbY2GoHPR7YQ53lSdLO1yyTfaiKAUecYbxrn
 3xAV0cwZrzxTag6dmsTWnzaI/m99RE46jOq1v9PJVoh9y0rMZOrpAluHVNGCgTIpJ+hE
 CsTlHpAZiXqv7LJuYx1e6VMmfY4zRf/rEF3pJl3G24sJK9M45hoEdQYy1MNW7MXSv9WI
 J5JQ==
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
Cc: David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBBdWcgMTcsIDIwMTkgYXQgMDY6MzU6NDlQTSArMDIwMCwgU2FtIFJhdm5ib3JnIHdy
b3RlOgo+IEhpIFNpZG9uZwo+IAo+IE9uIFNhdCwgQXVnIDE3LCAyMDE5IGF0IDA4OjQxOjE1QU0g
KzAxMDAsIFNpZG9uZyBZYW5nIHdyb3RlOgo+ID4gRHJvcCB1c2Ugb2YgZGVwcmVjYXRlZCBkcm1Q
LmggaGVhZGVyIGZpbGUuCj4gPiBSZW1vdmUgZHJtUC5oIGluY2x1ZGVzIGFuZCBhZGQgc29tZSBp
bmNsdWRlIGhlYWRlcnMgZm9yIGZ1bmN0aW9uIG9yCj4gPiBzdHJ1Y3QgdGhhdCB1c2VkIGluIGNv
ZGUuCj4gCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoLgo+IFdlIGFscmVhZHkgaGF2ZSBhIHNpbWls
aWFyIHBhdGNoIGluIGRybS1taXNjLW5leHQsIHRoYXQKPiBkcm9wIHRoZSB1c2Ugb2YgZHJtUC5o
IGZyb20gYXJtIHNvIHRoaXMgcGF0Y2ggaXMgb2Jzb2xldGVkLgo+IAo+IEJ1dCBrZWVwIHVwIHRo
ZSBzcGlyaXQgYW5kIHNlbmQgdXMgb3RoZXIgZ29vZCBzdHVmZi4KPiAKPiAJU2FtCgpIaSBTYW0u
CgpUaGFua3MgZm9yIHJlcGx5LiBJIGZvdW5kIHRoZSBwYXRjaCB0aGF0IHlvdSBzYWlkLgpJJ2xs
IGtlZXAgdXAgYW5kIHRyeSB0byBmaW5kIG90aGVyIGdvb2Qgb25lLgoKU2luY2VyZWx5LCAKU2lk
b25nLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
