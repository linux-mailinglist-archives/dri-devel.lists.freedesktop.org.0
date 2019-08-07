Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE81785BCD
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 09:46:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EF226E793;
	Thu,  8 Aug 2019 07:46:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F2216E749
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 17:44:40 +0000 (UTC)
Received: from mail-pl1-f200.google.com ([209.85.214.200])
 by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.76) (envelope-from <kai.heng.feng@canonical.com>)
 id 1hvPzK-0006QJ-O8
 for dri-devel@lists.freedesktop.org; Wed, 07 Aug 2019 17:44:38 +0000
Received: by mail-pl1-f200.google.com with SMTP id q11so53192578pll.22
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Aug 2019 10:44:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=36m4ZV+EDZBauWhmbVgsGcG+yyAWwpaN1oKQZhgxKsQ=;
 b=obUvhSezSZZS/whYlperG/xsZvPJaum9kbUJAmlbGWyCp9INdq8bRkJY72mzSxbGHt
 m50sTs8hG26JMQKmvm64+20AQ3CTxF9bsf4iQiBheQ90SU16lWw3hfMjKaAfvKlxRdvP
 hM0tRvgCwiBHJfW2VcZjhzwLrMGiOAJ4OZFaCHGVxezky9AQ8x4FkgHzX1lPUILsyrOM
 1CLMyn/BEHY0PPYl2LMvE5RD+mY3Onu56viGN4Zu0J5SL+akFwie5fqmj08euqABE+el
 lNZzSUfOtHmpVzo5X1CmEeNiJm7qFPzaJ0D1BPZ+HgL4ra3KtL0OxTT1l1hmT74/y8g/
 dFPQ==
X-Gm-Message-State: APjAAAWyf9b+rB/iH7iP8IqV4orpPYeKzUcB2YvFzXTS/wTF9npeHpiS
 WY2W+Bfx5cX+SQx35hTmQcilRPFbyy+8iA39/ifydRey3cPIDopWrLaqkDSLTE+B5whDorKCpyT
 T+GjC0l7z6H6PXHvfIr5/UyogYgGXtGSz1BKyPDBGH0akqA==
X-Received: by 2002:a63:3ec7:: with SMTP id l190mr8941775pga.334.1565199876733; 
 Wed, 07 Aug 2019 10:44:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzAjVzGaAHfi+Mx2RTAQF7DNZsnlHvJfIlucW5Pg3kOmc2JcioCuJG8VO3dWYSsyDV3OFW6Hg==
X-Received: by 2002:a63:3ec7:: with SMTP id l190mr8941755pga.334.1565199876307; 
 Wed, 07 Aug 2019 10:44:36 -0700 (PDT)
Received: from 2001-b011-380f-37d3-744a-8654-5394-196d.dynamic-ip6.hinet.net
 (2001-b011-380f-37d3-744a-8654-5394-196d.dynamic-ip6.hinet.net.
 [2001:b011:380f:37d3:744a:8654:5394:196d])
 by smtp.gmail.com with ESMTPSA id 81sm140348480pfx.111.2019.08.07.10.44.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 10:44:35 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [Regression] "drm/amdgpu: enable gfxoff again on raven series
 (v2)"
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <MN2PR12MB330979BAFF5BCC758258D54CECD40@MN2PR12MB3309.namprd12.prod.outlook.com>
Date: Thu, 8 Aug 2019 01:44:32 +0800
Message-Id: <624BFB8F-B586-492E-BEA6-4B138DAEC831@canonical.com>
References: <3EB0E920-31D7-4C91-A360-DBFB4417AC2F@canonical.com>
 <MN2PR12MB330979BAFF5BCC758258D54CECD40@MN2PR12MB3309.namprd12.prod.outlook.com>
To: "Huang, Ray" <Ray.Huang@amd.com>
X-Mailer: Apple Mail (2.3445.104.11)
X-Mailman-Approved-At: Thu, 08 Aug 2019 07:46:20 +0000
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Anthony Wong <anthony.wong@canonical.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"; DelSp="yes"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUmF5LAoKYXQgMDA6MDMsIEh1YW5nLCBSYXkgPFJheS5IdWFuZ0BhbWQuY29tPiB3cm90ZToK
Cj4gTWF5IEkga25vdyB0aGUgYWxsIGZpcm13YXJlIHZlcnNpb24gaW4geW91ciBzeXN0ZW0/Cgoj
IGNhdCBhbWRncHVfZmlybXdhcmVfaW5mbwpWQ0UgZmVhdHVyZSB2ZXJzaW9uOiAwLCBmaXJtd2Fy
ZSB2ZXJzaW9uOiAweDAwMDAwMDAwClVWRCBmZWF0dXJlIHZlcnNpb246IDAsIGZpcm13YXJlIHZl
cnNpb246IDB4MDAwMDAwMDAKTUMgZmVhdHVyZSB2ZXJzaW9uOiAwLCBmaXJtd2FyZSB2ZXJzaW9u
OiAweDAwMDAwMDAwCk1FIGZlYXR1cmUgdmVyc2lvbjogNDAsIGZpcm13YXJlIHZlcnNpb246IDB4
MDAwMDAwOTkKUEZQIGZlYXR1cmUgdmVyc2lvbjogNDAsIGZpcm13YXJlIHZlcnNpb246IDB4MDAw
MDAwYWUKQ0UgZmVhdHVyZSB2ZXJzaW9uOiA0MCwgZmlybXdhcmUgdmVyc2lvbjogMHgwMDAwMDA0
ZApSTEMgZmVhdHVyZSB2ZXJzaW9uOiAxLCBmaXJtd2FyZSB2ZXJzaW9uOiAweDAwMDAwMjEzClJM
QyBTUkxDIGZlYXR1cmUgdmVyc2lvbjogMSwgZmlybXdhcmUgdmVyc2lvbjogMHgwMDAwMDAwMQpS
TEMgU1JMRyBmZWF0dXJlIHZlcnNpb246IDEsIGZpcm13YXJlIHZlcnNpb246IDB4MDAwMDAwMDEK
UkxDIFNSTFMgZmVhdHVyZSB2ZXJzaW9uOiAxLCBmaXJtd2FyZSB2ZXJzaW9uOiAweDAwMDAwMDAx
Ck1FQyBmZWF0dXJlIHZlcnNpb246IDQwLCBmaXJtd2FyZSB2ZXJzaW9uOiAweDAwMDAwMThiCk1F
QzIgZmVhdHVyZSB2ZXJzaW9uOiA0MCwgZmlybXdhcmUgdmVyc2lvbjogMHgwMDAwMDE4YgpTT1Mg
ZmVhdHVyZSB2ZXJzaW9uOiAwLCBmaXJtd2FyZSB2ZXJzaW9uOiAweDAwMDAwMDAwCkFTRCBmZWF0
dXJlIHZlcnNpb246IDAsIGZpcm13YXJlIHZlcnNpb246IDB4MDAxYWQ0ZDQKVEEgWEdNSSBmZWF0
dXJlIHZlcnNpb246IDAsIGZpcm13YXJlIHZlcnNpb246IDB4MDAwMDAwMDAKVEEgUkFTIGZlYXR1
cmUgdmVyc2lvbjogMCwgZmlybXdhcmUgdmVyc2lvbjogMHgwMDAwMDAwMApTTUMgZmVhdHVyZSB2
ZXJzaW9uOiAwLCBmaXJtd2FyZSB2ZXJzaW9uOiAweDAwMDAxZTQ0ClNETUEwIGZlYXR1cmUgdmVy
c2lvbjogNDEsIGZpcm13YXJlIHZlcnNpb246IDB4MDAwMDAwYTkKVkNOIGZlYXR1cmUgdmVyc2lv
bjogMCwgZmlybXdhcmUgdmVyc2lvbjogMHgwMTEwOTAxYwpETUNVIGZlYXR1cmUgdmVyc2lvbjog
MCwgZmlybXdhcmUgdmVyc2lvbjogMHgwMDAwMDAwMApWQklPUyB2ZXJzaW9uOiAxMTMtUkFWRU4t
MTAzCgpLYWktSGVuZwoKPgo+IFRoYW5rcywKPiBSYXkKPgo+IEZyb206IEthaS1IZW5nIEZlbmcg
PGthaS5oZW5nLmZlbmdAY2Fub25pY2FsLmNvbT4KPiBTZW50OiBXZWRuZXNkYXksIEF1Z3VzdCA3
LCAyMDE5IDg6NTAgUE0KPiBUbzogSHVhbmcsIFJheQo+IENjOiBEZXVjaGVyLCBBbGV4YW5kZXI7
IEtvZW5pZywgQ2hyaXN0aWFuOyBaaG91LCBEYXZpZChDaHVuTWluZyk7IGFtZC1nZnggIAo+IGxp
c3Q7IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IExLTUw7IEFudGhvbnkgV29uZwo+
IFN1YmplY3Q6IFtSZWdyZXNzaW9uXSAiZHJtL2FtZGdwdTogZW5hYmxlIGdmeG9mZiBhZ2FpbiBv
biByYXZlbiBzZXJpZXMgIAo+ICh2MikiCj4KPiBIaSwKPgo+IEFmdGVyIGNvbW1pdCAwMDU0NDAw
NjZmOTIgKCJkcm0vYW1kZ3B1OiBlbmFibGUgZ2Z4b2ZmIGFnYWluIG9uIHJhdmVuIHNlcmllcwo+
ICh2MinigJ0pLCBicm93c2VycyBvbiBSYXZlbiBSaWRnZSBzeXN0ZW1zIGNhdXNlIHNlcmlvdXMg
Y29ycnVwdGlvbiBsaWtlIHRoaXM6Cj4gaHR0cHM6Ly9sYXVuY2hwYWRsaWJyYXJpYW4ubmV0LzQz
NjMxOTc3Mi9TY3JlZW5zaG90JTIwZnJvbSUyMDIwMTktMDgtMDclMjAwNC0yMC0zNC5wbmcKPgo+
IEZpcm13YXJlcyBmb3IgUmF2ZW4gUmlkZ2UgaXMgdXAtdG8tZGF0ZS4KPgo+IEthaS1IZW5nCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
