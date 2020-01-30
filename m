Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8F214E95C
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2020 09:04:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 021A86FA9E;
	Fri, 31 Jan 2020 08:04:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from plasma4.jpberlin.de (plasma4.jpberlin.de [80.241.57.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59B586E8A0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2020 17:06:59 +0000 (UTC)
Received: from hefe.heinlein-support.de (hefe.heinlein-support.de
 [91.198.250.172])
 by plasma.jpberlin.de (Postfix) with ESMTP id 47168BD4BB;
 Thu, 30 Jan 2020 18:06:55 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from plasma.jpberlin.de ([91.198.250.140])
 by hefe.heinlein-support.de (hefe.heinlein-support.de [91.198.250.172])
 (amavisd-new, port 10030)
 with ESMTP id UBTBrdYcflV3; Thu, 30 Jan 2020 18:06:51 +0100 (CET)
Received: from webmail.opensynergy.com (unknown [217.66.60.5])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (Client CN "webmail.opensynergy.com",
 Issuer "GeoTrust EV RSA CA 2018" (not verified))
 (Authenticated sender: opensynergy@jpberlin.de)
 by plasma.jpberlin.de (Postfix) with ESMTPSA id 830E4BD2AD;
 Thu, 30 Jan 2020 18:06:51 +0100 (CET)
Received: from [10.51.0.40] (10.25.255.1) by MXS01.open-synergy.com
 (10.25.10.17) with Microsoft SMTP Server (TLS) id 14.3.468.0; Thu, 30 Jan
 2020 18:06:49 +0100
Subject: Re: [PATCH libdrm RESEND 1/2] xf86drm: generalize the device
 subsystem type parsing code
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
References: <20200129183543.30023-1-Mikhail.Golubev@opensynergy.com>
 <b3dc6b40-7541-1d36-45e1-97677a379533@daenzer.net>
From: Mikhail Golubev <mikhail.golubev@opensynergy.com>
Message-ID: <55138954-1352-e3a4-bbbb-146659bd8da8@opensynergy.com>
Date: Thu, 30 Jan 2020 12:06:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <b3dc6b40-7541-1d36-45e1-97677a379533@daenzer.net>
Content-Language: en-US
X-Originating-IP: [10.25.255.1]
X-Mailman-Approved-At: Fri, 31 Jan 2020 08:04:00 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: vasyl.vavrychuk@opensynergy.com, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTWljaGVsIQoKVGhhbmtzIGZvciByZXBseS4KRGlkIGNyZWF0ZSB0aGUgbWVyZ2UgcmVxdWVz
dCBoZXJlOgpodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvbWVzYS9kcm0vbWVyZ2VfcmVx
dWVzdHMvNDMKCkJSLApNaWtoYWlsLgoKT24gMS8zMC8yMCA0OjI3IFBNLCBNaWNoZWwgRMOkbnpl
ciB3cm90ZToKPiAKPiBIaSBNaWtoYWlsLAo+IAo+IAo+IHRoYW5rcyBmb3IgdGhlIHBhdGNoZXMu
Cj4gCj4gUGxlYXNlIGNyZWF0ZSBhIG1lcmdlIHJlcXVlc3QgYnkgY2xpY2tpbmcgdGhlICJGb3Jr
IiBidXR0b24gb24KPiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvbWVzYS9kcm0sIHB1
c2hpbmcgdGhlIHR3byBjb21taXRzIHRvIGEKPiBuZXcgYnJhbmNoIGluIHRoZSBuZXdseSBjcmVh
dGVkIHJlcG9zaXRvcnksIGFuZCBvcGVuaW5nIHRoZSBVUkwgaW4gdGhlCj4gImdpdCBwdXNoIiBv
dXRwdXQuCj4gCj4gVGhhbmtzLAo+IAo+IAoKLS0gCk1pa2hhaWwgR29sdWJldgpTZW5pb3IgU29m
dHdhcmUgRW5naW5lZXIKCk9wZW5TeW5lcmd5IEdtYkgKUm90aGVyc3RyLiAyMCwgMTAyNDUgQmVy
bGluCgpUZWxlZm9uOiArNDkgKDMwKSA2MCA5OCA1NCAwIC0gOTAzCkVNYWlsOiAgIG1pa2hhaWwu
Z29sdWJldkBvcGVuc3luZXJneS5jb20KCnd3dy5vcGVuc3luZXJneS5jb20KCkhhbmRlbHNyZWdp
c3Rlci9Db21tZXJjaWFsIFJlZ2lzdHJ5OiBBbXRzZ2VyaWNodCBDaGFybG90dGVuYnVyZywgSFJC
IDEwODYxNkIKR2VzY2jDpGZ0c2bDvGhyZXIvTWFuYWdpbmcgRGlyZWN0b3I6IFJlZ2lzIEFkamFt
YWgKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
