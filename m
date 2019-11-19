Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2DAF102B73
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 19:05:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 704B36E8FA;
	Tue, 19 Nov 2019 18:05:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 642F06E249;
 Tue, 19 Nov 2019 18:05:05 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 01B4D21D7F;
 Tue, 19 Nov 2019 18:05:04 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <1574074063-9222-1-git-send-email-kalyan_t@codeaurora.org>
References: <1574074063-9222-1-git-send-email-kalyan_t@codeaurora.org>
Subject: Re: [PATCH v1] msm:disp:dpu1: add support for display for SC7180
 target
From: Stephen Boyd <sboyd@kernel.org>
To: Kalyan Thota <kalyan_t@codeaurora.org>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
User-Agent: alot/0.8.1
Date: Tue, 19 Nov 2019 10:05:03 -0800
Message-Id: <20191119180505.01B4D21D7F@mail.kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1574186705;
 bh=uKTAzFD1mKs+XTRCyqONykLe/ffZgYw8vLohuqeZlGs=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=vDYo9fHI8GWXyEtRT+bkWLWmPmg4iaUjmRHWcwVORt1w0WiCfrut9AApibr277xTa
 wuloefH0EqdfXZrvEJ4QT22efnCknRxQ8RYEsiITGTpGrq3DEjf8UfihRf7bStwrIL
 REp4jFDlG6/9TkK40bbiqVBaQLA9ZH1aSnNMJoXI=
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
Cc: dhar@codeaurora.org, travitej@codeaurora.org, linux-kernel@vger.kernel.org,
 seanpaul@chromium.org, Kalyan Thota <kalyan_t@codeaurora.org>,
 hoegsberg@chromium.org, chandanu@codeaurora.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBLYWx5YW4gVGhvdGEgKDIwMTktMTEtMTggMDI6NDc6NDMpCj4gQWRkIGRpc3BsYXkg
aHcgY2F0YWxvZyBjaGFuZ2VzIGZvciBTQzcxODAgdGFyZ2V0Lgo+IAo+IENoYW5nZXMgaW4gdjE6
Cj4gCj4gMSkgQ29uZmlndXJlIHJlZ2lzdGVyIG9mZnNldHMgYW5kIGNhcGFiaWxpdGllcyBmb3Ig
dGhlCj4gZGlzcGxheSBodyBibG9ja3MuCj4gCj4gVGhpcyBwYXRjaCBoYXMgZGVwZW5kZW5jeSBv
biB0aGUgYmVsb3cgc2VyaWVzCj4gCj4gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRj
aC8xMTI0MzExMS8KPiAKPiBTaWduZWQtb2ZmLWJ5OiBLYWx5YW4gVGhvdGEgPGthbHlhbl90QGNv
ZGVhdXJvcmEub3JnPgo+IFNpZ25lZC1vZmYtYnk6IFNodWJoYXNocmVlIERoYXIgPGRoYXJAY29k
ZWF1cm9yYS5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogUmF2aXRlamEgVGFtYXRhbSA8dHJhdml0ZWpA
Y29kZWF1cm9yYS5vcmc+CgpZb3VyIHNpZ25vZmYgY2hhaW4gbG9va3Mgd3JvbmcuIFByb2JhYmx5
IHNob3VsZCBoYXZlIHNvbWUKQ28tZGV2ZWxvcGVkLWJ5IHRhZ3MgaGVyZSwgYW5kIHRoZW4geW91
ciBTb0Igc2hvdWxkIGJlIGxhc3QuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
