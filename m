Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 543DE29836D
	for <lists+dri-devel@lfdr.de>; Sun, 25 Oct 2020 20:50:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 557A86E077;
	Sun, 25 Oct 2020 19:50:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from abrecht.li (75-128-16-94.static.cable.fcom.ch [94.16.128.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A9A46E077
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 19:50:08 +0000 (UTC)
Received: from mail.abrecht.li (unknown [10.60.1.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by abrecht.li (Postfix) with ESMTPSA id 07C762D97C80;
 Sun, 25 Oct 2020 19:50:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 abrecht.li 07C762D97C80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=danielabrecht.ch;
 s=mail; t=1603655407;
 bh=PaRdtDncjQctbpPZmyB/EJ9QnQtJGJpDpWAKZMtYXN0=; h=From:To:Cc:From;
 b=Qol38rgHn4FlPwrTby887hRnHdZMBf7ooxMEHYxN6wCnorMazmjvaYGhaOIZzAVDx
 h15FcwLpxwjpnVPI+OpvxkFmgjsDL13+rMEh6vH3qyjWoVxvLbZeYcfahd1/DN+u/V
 E6tu0jQS2RuunOaMX168LRq9rsAg+tNcnFFxZuKs=
MIME-Version: 1.0
Date: Sun, 25 Oct 2020 19:50:06 +0000
From: Daniel Abrecht <freedesktop-linux-dri-devel@danielabrecht.ch>
To: =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
Subject: Re: [PATCH] Implement .format_mod_supported in mxsfb
In-Reply-To: <20201025155201.GA25070@bogon.m.sigxcpu.org>
References: <96f62304bad202e4f920d2f4ed62c485@abrecht.li>
 <20201025155201.GA25070@bogon.m.sigxcpu.org>
Message-ID: <ab12646f6ed1979285dc8cdb38933daa@danielabrecht.ch>
X-Sender: freedesktop-linux-dri-devel@danielabrecht.ch
User-Agent: Roundcube Webmail/1.3.15
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
Cc: Marek Vasut <marex@denx.de>, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org, linux-imx@nxp.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgR3VpZG8KCkFtIDIwMjAtMTAtMjUgMTU6NTIsIHNjaHJpZWIgR3VpZG8gR8O8bnRoZXI6Cj4g
U2luY2UgdGhpcyBnb3QgYnJva2VuIGJ5IHRoZSBzd2l0Y2ggYXdheSBmb3IgdGhlIHNpbXBsZSBk
aXNwbGF5Cj4gcGlwZWxpbmUgaGVscGVyIChhZTFlZDAwOTMyODE5MzliODA2NjRhNjg3Njg5ZjEy
NDM2YzBlODc0KSBjb3VsZAo+IHlvdSBhZGQgYSBmaXhlcyB0YWc/Cj4gQ2hlZXJzLAo+ICAtLSBH
dWlkbwoKVGhhbmtzLCBJJ3ZlIHNlbnQgYSB2MiB3aXRoIHRoZSBmaXhlcyB0YWcgYWRkZWQuCgpS
ZWdhcmRzLApEYW5pZWwgQWJyZWNodApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
