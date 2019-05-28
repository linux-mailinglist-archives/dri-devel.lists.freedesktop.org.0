Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BAB2CC70
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 18:46:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 344666E265;
	Tue, 28 May 2019 16:46:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2BB06E265
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 16:46:44 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id D23D680437;
 Tue, 28 May 2019 18:46:42 +0200 (CEST)
Date: Tue, 28 May 2019 18:46:41 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v3 00/10] R-Car DU: LVDS dual-link mode support
Message-ID: <20190528164641.GC9610@ravnborg.org>
References: <20190528141234.15425-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190528141234.15425-1-laurent.pinchart+renesas@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=fUZH0H9BHeJfuQvbNTQA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudC4KCk5pY2Ugc2VyaWVzIHdpdGggc21hbGwgYW5kIHdlbGwgZGVzY3JpYmVkIHBh
dGNoZXMuCgo+IE9uIFR1ZSwgTWF5IDI4LCAyMDE5IGF0IDA1OjEyOjI0UE0gKzAzMDAsIExhdXJl
bnQgUGluY2hhcnQgd3JvdGU6Cj4+IEhlbGxvIGV2ZXJ5Ym9keSwKPj4gCj4+IFRoaXMgcGF0Y2gg
c2VyaWVzIGltcGxlbWVudHMgc3VwcG9ydCBmb3IgTFZEUyBkdWFsLWxpbmsgbW9kZSBpbiB0aGUK
Pj4gUi1DYXIgRFUgYW5kIFItQ2FyIExWRFMgZW5jb2RlciBkcml2ZXJzLCBhbmQgd2VsbCBhcyBp
biB0aGUgdGhjNjNsdmQxMDI0Cj4+IExWRFMgZGVjb2RlciBkcml2ZXIuCgpQYXRjaGVzIGxvb2tz
IGdvb2QuCldpdGggbXkgZmV3IGNvbW1lbnRzIGFkZHJlc3NlZDoKQWNrZWQtYnk6IFNhbSBSYXZu
Ym9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KCihEbyBub3QgZmVlbCB0b28gY29uZmlkZW50IGluIGFs
bCB0aGUgc3R1ZmYsIHItYiBzZWVtcyB0byBnaXZlIG1lIHRvbwptdWNoIGNyZWRpdCBmb3Igc3Bl
bmRpbmcgbGVzcyB0aGFuIGhhbGYgYW4gaG91ciByZWFkaW5nIHRoZSBwYXRjaGVzKS4KCglTYW0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
