Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D042964D5
	for <lists+dri-devel@lfdr.de>; Thu, 22 Oct 2020 20:50:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FE896F60A;
	Thu, 22 Oct 2020 18:50:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BD7F6F60A
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Oct 2020 18:50:21 +0000 (UTC)
Date: Thu, 22 Oct 2020 18:50:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me; s=protonmail;
 t=1603392619; bh=HrktNmP3CqCIAofs+oFGY+fqsRG74adYrEq7dZmJUyA=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=Wfw31m/X0YFT8W6ilC5nBQV9XTd/XuAGfLJeHsF9t+waGEJi+hvQHbq51Z1yl5Z6i
 MCc35+4ohfFNJ6fe50Coc6Dkg9ejJPH1D7p/eoBiKR3Ixhqnynzr5Z6qBa5wJW/p0X
 9DznILgx1xZeULpCTT9j3rvKI+LHA5ZnWS/257XEzncXEvF5K/JBpEHoZl8NBnHLwI
 oP/GYmSeuRYlSubao8CK82om0WjktPhtlcNk4nQK+MeCMTB9gS3GbhFzjj8KHNnKSw
 palkCCRX6ZIgRDav+y8OPCKDepnbCRZd8XoRblZLSBGiC8hilk/5pyZbIxgbGL44vg
 ANjY292T+SQ1Q==
To: Alex Deucher <alexdeucher@gmail.com>
From: Josh Fuhs <Joshua.Fuhs@pm.me>
Subject: Re: amdgpu: Manual Card Configuration Change
Message-ID: <GgC8qa2cwsqjMRU57ic-nZTX3iT8kjSuufzM0AnjfYINBvR3t0y-rlir8J_YaS5PGtuZv2THf5dQruxBXZL_ySkbg9B-N555-ll3zrOj27o=@pm.me>
In-Reply-To: <CADnq5_PZXmSVardcOL8=-CTeSkT3+eTrKXSHNLWbWzz0q7i0yQ@mail.gmail.com>
References: <-II5uGU2OLUvxeRHxuPIMmnyrFPVyg6pkc2UM16KaQ5f6_kbDJN0se2tfgIf15RJLLKrWZg0niAIgXxr-0V7qBQGR9mPq306qamxuQq9q7M=@pm.me>
 <CADnq5_M+qgk7p92daoUMNN-OaoXKeTWULUQiivGe=V_J4e1oqA@mail.gmail.com>
 <rfi6blr6iZOO9U7GHVXPZVcbAxN21dh52TEK19odIK5sxSI3JiOSKEowBQqN97pJcTkgV8nFzG_d70g9-x1swBX-7kQ-ZqTme73yCbXgIm4=@pm.me>
 <CADnq5_PZXmSVardcOL8=-CTeSkT3+eTrKXSHNLWbWzz0q7i0yQ@mail.gmail.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Josh Fuhs <Joshua.Fuhs@pm.me>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

4oCQ4oCQ4oCQ4oCQ4oCQ4oCQ4oCQIE9yaWdpbmFsIE1lc3NhZ2Ug4oCQ4oCQ4oCQ4oCQ4oCQ4oCQ
4oCQCk9uIFdlZG5lc2RheSwgT2N0b2JlciAyMSwgMjAyMCAyOjQ0IFBNLCBBbGV4IERldWNoZXIg
PGFsZXhkZXVjaGVyQGdtYWlsLmNvbT4gd3JvdGU6Cgo+IE9uIE1vbiwgT2N0IDE5LCAyMDIwIGF0
IDg6NTMgUE0gSm9zaCBGdWhzIEpvc2h1YS5GdWhzQHBtLm1lIHdyb3RlOgo+Cj4gPiBUaGFua3Mu
IEkgdHJpZWQgNS45LjEgYW5kIEkgdGhpbmsgdGhlcmUncyBzdGlsbCBhIHByb2JsZW0sIG9yIGF0
IGxlYXN0IHNvbWV0aGluZyBkaWZmZXJlbnQuCj4gPiBVc2luZyB0aGUgc2FtZSBjb25maWd1cmF0
aW9uIHNjcmlwdCwgSSBub3RpY2VkIHRoYXQgbXkgY2FyZHMgYXJlIHJ1bm5pbmcgYSBsb3QgaG90
dGVyLiBGb3IgZXhhbXBsZSwgaGVyZSdzIHRvdGFsIHBvd2VyIGNvbnN1bXB0aW9uIG9mIGEgdHdv
LWNhcmQgc3lzdGVtIHdpdGggdHdvIGRpZmZlcmVudCBrZXJuZWxzOgo+ID4KPiA+ICAgICA1Ljgu
MTQ6IDQ2MFcKPiA+ICAgICA1LjkuMTogIDU2MCtXCj4gPgo+ID4KPiA+IE1lbW9yeSBhbmQgc3lz
dGVtIGNsb2NrcyBhcmUgaW5pdGlhbGx5IHNldCB0aGUgc2FtZSBvbiBhbGwgY2FyZHMgaW4gYWxs
IGNhc2VzLgo+Cj4gQ2FuIHlvdSBiaXNlY3Q/Cj4KCkkgYXNzdW1lIHRoaXMgbWVhbnMgdXNpbmcg
Z2l0IGJpc2VjdCB0byBuYXJyb3cgZG93biB0aGUgY29tbWl0IHRoYXQgaW50cm9kdWNlZCB0aGUg
ZWZmZWN0LiBJJ20gbm90IHNldCB1cCBmb3Iga2VybmVsIGJ1aWxkcy4gSXMgdGhlcmUgYSBndWlk
ZT8KCkpvc2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
