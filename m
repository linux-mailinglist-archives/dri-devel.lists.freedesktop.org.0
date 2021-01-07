Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 893632ECBF9
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 09:53:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B0F96E41D;
	Thu,  7 Jan 2021 08:53:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay-us1.mymailcheap.com (relay-us1.mymailcheap.com
 [51.81.35.219])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB4E789811
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 04:46:08 +0000 (UTC)
Received: from relay5.mymailcheap.com (relay5.mymailcheap.com [159.100.241.64])
 by relay-us1.mymailcheap.com (Postfix) with ESMTPS id 596D120F15
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 04:46:07 +0000 (UTC)
Received: from relay4.mymailcheap.com (relay4.mymailcheap.com [137.74.80.156])
 by relay5.mymailcheap.com (Postfix) with ESMTPS id 2C9962008F
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 04:46:04 +0000 (UTC)
Received: from filter2.mymailcheap.com (filter2.mymailcheap.com
 [91.134.140.82])
 by relay4.mymailcheap.com (Postfix) with ESMTPS id C55E33F1D0;
 Thu,  7 Jan 2021 05:46:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by filter2.mymailcheap.com (Postfix) with ESMTP id 93F492A7E5;
 Thu,  7 Jan 2021 05:46:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
 s=default; t=1609994761;
 bh=8unyk0aOxyvIXZOJPusmERGg+i43rMAKH28AqjQ7mUY=;
 h=Date:In-Reply-To:References:Subject:To:CC:From:From;
 b=tWG5DTHu16/GMSadEHWNO/lgoT9fzvzO4cYUEXp5Tvv4aTy9tVDas9RESuCa3EgyI
 g+EtosfDBEG8Nm3Z4/xZrYw7+Vk82TVV7SdOJ+gbDMA0WLpj9RClDJVTkHv9mFKQMq
 74tltlvR96q9kIsGXVkVBHUET9RxtGDBgWeXkXOY=
X-Virus-Scanned: Debian amavisd-new at filter2.mymailcheap.com
Received: from filter2.mymailcheap.com ([127.0.0.1])
 by localhost (filter2.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 075XNDlJ-52U; Thu,  7 Jan 2021 05:46:00 +0100 (CET)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by filter2.mymailcheap.com (Postfix) with ESMTPS;
 Thu,  7 Jan 2021 05:46:00 +0100 (CET)
Received: from [148.251.23.173] (ml.mymailcheap.com [148.251.23.173])
 by mail20.mymailcheap.com (Postfix) with ESMTP id 934AD4228E;
 Thu,  7 Jan 2021 04:45:59 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com; dkim=pass (1024-bit key;
 unprotected) header.d=aosc.io header.i=@aosc.io header.b="HdmdzN6t"; 
 dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [192.168.1.235] (unknown [59.41.161.221])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail20.mymailcheap.com (Postfix) with ESMTPSA id 231964228E;
 Thu,  7 Jan 2021 04:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
 t=1609994755; bh=8unyk0aOxyvIXZOJPusmERGg+i43rMAKH28AqjQ7mUY=;
 h=Date:In-Reply-To:References:Subject:To:CC:From:From;
 b=HdmdzN6tQ8OtkUpQeXMIGEF1zUavlVlWiiL1vh+Nh/HP5Yr+NlGVvEWwOMLiA1Pf0
 h4X4EAACCeCOyW0fafpJqRj4JpypRauSVDoNn90Ssl3y2UKPWLwgnpfb6hRTBYA50G
 W/6NnxPy5O2Zhl70TRDATe3EEmawivqOjiPlC5Kk=
Date: Thu, 07 Jan 2021 12:00:21 +0800
User-Agent: K-9 Mail for Android
In-Reply-To: <CAMty3ZCkEb9g5t6Hs5DN5yHXYvDhymriYqqV+6DZiC+Qb645ww@mail.gmail.com>
References: <20201128125257.1626588-1-icenowy@aosc.io>
 <CAMty3ZCkEb9g5t6Hs5DN5yHXYvDhymriYqqV+6DZiC+Qb645ww@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH] drm/panel: feiyang-fy07024di26a30d: cleanup if panel
 attaching failed
To: Jagan Teki <jagan@amarulasolutions.com>
From: Icenowy Zheng <icenowy@aosc.io>
Message-ID: <C1F366E9-0EDB-4679-BB93-92223F5B8C4A@aosc.io>
X-Rspamd-Server: mail20.mymailcheap.com
X-Spamd-Result: default: False [1.40 / 10.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 ARC_NA(0.00)[]; R_DKIM_ALLOW(0.00)[aosc.io:s=default];
 MID_RHS_MATCH_FROM(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; TAGGED_RCPT(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; DMARC_NA(0.00)[aosc.io];
 R_SPF_SOFTFAIL(0.00)[~all];
 HFILTER_HELO_BAREIP(3.00)[148.251.23.173,1];
 ML_SERVERS(-3.10)[148.251.23.173]; TO_DN_ALL(0.00)[];
 DKIM_TRACE(0.00)[aosc.io:+]; RCPT_COUNT_SEVEN(0.00)[7];
 RECEIVED_SPAMHAUS_PBL(0.00)[59.41.161.221:received];
 RCVD_NO_TLS_LAST(0.10)[]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+];
 ASN(0.00)[asn:24940, ipnet:148.251.0.0/16, country:DE];
 FREEMAIL_CC(0.00)[gmail.com,ravnborg.org,linux.ie,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
 SUSPICIOUS_RECIPS(1.50)[]; RCVD_COUNT_TWO(0.00)[2]
X-Rspamd-Queue-Id: 934AD4228E
X-Mailman-Approved-At: Thu, 07 Jan 2021 08:53:13 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cgrkuo4gMjAyMeW5tDHmnIg25pelIEdNVCswODowMCDkuIvljYg1OjQ3OjIwLCBKYWdhbiBUZWtp
IDxqYWdhbkBhbWFydWxhc29sdXRpb25zLmNvbT4g5YaZ5YiwOgo+T24gU2F0LCBOb3YgMjgsIDIw
MjAgYXQgNjoyMyBQTSBJY2Vub3d5IFpoZW5nIDxpY2Vub3d5QGFvc2MuaW8+IHdyb3RlOgo+Pgo+
PiBBdHRhY2hpbmcgdGhlIHBhbmVsIGNhbiBmYWlsLCBzbyBjbGVhbnVwIHdvcmsgaXMgbmVjZXNz
YXJ5LCBvdGhlcndpc2UKPj4gYSBwb2ludGVyIHRvIGZyZWVkIHN0cnVjdCBkcm1fcGFuZWwqIHdp
bGwgcmVtYWluIGluIGRybV9wYW5lbCBjb2RlLgo+Pgo+PiBEbyB0aGUgY2xlYW51cCBpZiBwYW5l
bCBhdHRhY2hpbmcgZmFpbGVkLgo+Pgo+PiBGaXhlczogNjlkYzY3OGFiYzJiICgiZHJtL3BhbmVs
OiBBZGQgRmVpeWFuZyBGWTA3MDI0REkyNkEzMC1ECj5NSVBJLURTSSBMQ0QgcGFuZWwiKQo+Cj5U
aGUgZmFjdCB0aGF0IHRoaXMgaGFzIGZhaWxlZCB0byBwcm9iZSBkdWUgdG8gcmVjZW50IGNoYW5n
ZXMgaW4KPnN1bjZpX21pcGlfZHNpLmMgSSBkb24ndCBrbm93IGhvdyB0byBwdXQgdGhhdCBpbnRv
IHRoZSBjb21taXQgbWVzc2FnZS4KCkl0J3Mgbm90IHJlbGF0ZWQsIHdlIHNob3VsZG4ndCBhc3N1
bWUgdGhpcyBwYW5lbCBkcml2ZXIgd2lsbCBhbHdheXMKYmUgdXNlZCB3aXRoIHN1bnhpIFNvQ3Mu
CgpJdCdzIGEgcGFuZWwgZHJpdmVyIGJ1ZyB0aGF0IGNhbm5vdCBkZWFsIHdpdGggLUVQUk9CRV9E
RUZFUiB3ZWxsLgoKPj4gU2lnbmVkLW9mZi1ieTogSWNlbm93eSBaaGVuZyA8aWNlbm93eUBhb3Nj
LmlvPgo+PiAtLS0KPgo+UmV2aWV3ZWQtYnk6IEphZ2FuIFRla2kgPGphZ2FuQGFtYXJ1bGFzb2x1
dGlvbnMuY29tPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
