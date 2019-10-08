Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EDECFF47
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 18:52:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CFAB6E873;
	Tue,  8 Oct 2019 16:52:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4604E6E873
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 16:52:01 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 9119B80569;
 Tue,  8 Oct 2019 18:51:56 +0200 (CEST)
Date: Tue, 8 Oct 2019 18:51:54 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v1 0/2]: Finally delete drmP.h
Message-ID: <20191008165154.GA7988@ravnborg.org>
References: <20191007171224.1581-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191007171224.1581-1-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=NK3XpDyz14cDD-FjOBUA:9 a=CjuIK1q_8ugA:10
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
Cc: David Airlie <airlied@linux.ie>, Maxime Ripard <mripard@kernel.org>,
 Ben Skeggs <bskeggs@redhat.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Dariusz Marcinkiewicz <darekm@google.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMDcsIDIwMTkgYXQgMDc6MTI6MjJQTSArMDIwMCwgU2FtIFJhdm5ib3JnIHdy
b3RlOgo+IE9uZSB1c2VyIG9mIGRybVAuaCBzbmVha2VkIGluIGFmdGVyIHRoZSBtZXJnZSB3aW5k
b3cuCj4gRHJvcCB0aGUgdXNlIG9mIGRybVAuaCBhbmQgZGVsZXRlIHRoZSBoZWFkZXIgZmlsZSBm
b3IgZ29vZC4KPiAKPiBTbWFsbCBiYW5kLWFpZCBvbiB0b3Agb2Ygbm90IGdvaW5nIHRvIHhkYyA6
LSkKPiAKPiBCdWlsZCB0ZXN0ZWQgd2l0aCB2YXJpb3VzIGFyY2hpdGVjdHVyZXMgYW5kIGNvbmZp
Z3MuCgpBcHBsaWVkIGFuZCBwdXNoZWQgdG8gZHJtLW1pc2MtbmV4dC4KCglTYW0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
