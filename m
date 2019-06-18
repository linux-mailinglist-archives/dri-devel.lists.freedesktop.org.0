Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB1549BAF
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 10:05:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F147189ECB;
	Tue, 18 Jun 2019 08:05:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 559 seconds by postgrey-1.36 at gabe;
 Tue, 18 Jun 2019 08:05:51 UTC
Received: from mail-40132.protonmail.ch (mail-40132.protonmail.ch
 [185.70.40.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB9AB89ECB
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 08:05:51 +0000 (UTC)
Date: Tue, 18 Jun 2019 07:56:23 +0000
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH V2 4/5] drm/vkms: Use index instead of 0 in possible crtc
Message-ID: <innWfwO1f7V6XAA8IXBBqGMw-4_upKRtjsPG8kg19Pl9b2Hf3Bd4V20Ow7GWhfzNUmij1uVwMuHbOp3zGderuXZGhunI0y_-khuFTOStOkI=@emersion.fr>
In-Reply-To: <971da2ede86d11357e6822409bef23cb03869f83.1560820888.git.rodrigosiqueiramelo@gmail.com>
References: <cover.1560820888.git.rodrigosiqueiramelo@gmail.com>
 <971da2ede86d11357e6822409bef23cb03869f83.1560820888.git.rodrigosiqueiramelo@gmail.com>
Feedback-ID: FsVprHBOgyvh0T8bxcZ0CmvJCosWkwVUg658e_lOUQMnA9qynD8O1lGeniuBDfPSkDAUuhiKfOIXUZBfarMyvA==:Ext:ProtonMail
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF autolearn=ham
 autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.protonmail.ch
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=emersion.fr; s=protonmail; t=1560844590;
 bh=65+C5sAXGkplAKNqz3BotihBJoYXAbxTNdDd1KqjmRE=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=1frkddWpR0JAY/Er2JfvjKlZaSHep3xNbjE2bbyJOmTSax2cQ4zUjsM5uRiQv/ko8
 yhICsZpgfYdaUE9RpT4lR5CaVgT+7v6weB+5KcgZdCpnG9kyaYyYbd2WYNmVIHyf7p
 Vfjyqlcze/zi10KFLp7sogZGq/PedWoKAU7FqqnM=
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW50ZXJlc3RpbmdseSwgZXZlbiB3aXRoIHRoZSBwcmV2aW91cyBjb2RlLCBwb3NzaWJsZV9jcnRj
cz0xIHdhcwpleHBvc2VkIHRvIHVzZXJzcGFjZSBbMV0uIEkgdGhpbmsgdGhpcyBpcyBiZWNhdXNl
IG9mIGEgc2FmZWd1YXJkIGluCmRybV9jcnRjX2luaXRfd2l0aF9wbGFuZXMgKGRybV9jcnRjLmM6
Mjg0KSB3aGljaCBzZXRzIHRoZSBwcmltYXJ5IGFuZApjdXJzb3IgcGxhbmUncyBwb3NzaWJsZV9j
cnRjcyB0byB0aGUgZmlyc3QgQ1JUQyBpZiB6ZXJvLgoKSWYgd2Ugd2FudCB0byB3YXJuIG9uIHBv
c3NpYmxlX2NydGNzPTAsIHdlIHNob3VsZCBwcm9iYWJseSByZW1vdmUgdGhpcwpzYWZlZ3VhcmQu
IENoZWNraW5nIGZpcnN0IHdoZXRoZXIgdGhpcyBzYWZlZ3VhcmQgaXMgdXNlZCBieSBhbnkgZHJp
dmVyCmlzIHByb2JhYmx5IGEgZ29vZCBpZGVhLgoKWzFdOiBodHRwczovL2RybWRiLmVtZXJzaW9u
LmZyL2RldmljZXMvZjIxOGQxMjQyNzE0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
