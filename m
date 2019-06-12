Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD10F41DFD
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 09:43:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36C4589356;
	Wed, 12 Jun 2019 07:43:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
 [209.85.167.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71A8E89356
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 07:43:27 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id b11so11279566lfa.5
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 00:43:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RGbRj2wYsEmztwHw3Pn5AYv2PzA45B/YLiXGtuotTKs=;
 b=cw2zbKZkaueBje/2WD/78BJL0O/1M8Pu3pW2hVzPm6C5n7TF1nmya3HOmFM4E1MK4A
 wOwPjVyj45M1WmaHVheNEbx6dMVfJwApHesHHHE1dtyjcj7fDJP1cqNUb0ou0qSoxU/I
 sjiL57JPihi+O9mG1rlZS6wvYFm6CXgoV1Daw0ZOeuA2jhn6dwQd8ctAWUjysIsvV0vX
 Tp+RIP68hay66BSS+YVuF531l9WaP0e2fwyv1rykh3gtjp01pjPnDZcGRuRq01Ai8WjF
 H46BkhJvxFegLBMYSFj/UNP0dEoWH3JvTR39TYy2dVyMIa8OAZ7nK27wq7u30w0BDXZF
 2sew==
X-Gm-Message-State: APjAAAXbJ+hKbeKppU5gJpgb2mgr4S96yVOeconq2d+EpwWR1J+oea9t
 tMfdKjn3Xtrb84+56J9QkBVMvx5HtgAm/DibhTI=
X-Google-Smtp-Source: APXvYqxq5md2jQfgVOiyRA4y5E2ZNyXbmM8b5Y9O3ZBQ3tX8KoUwiYzSoIDJH1MeAjdTlMBIWRbEc4WtaVcO388mSNE=
X-Received: by 2002:ac2:5467:: with SMTP id e7mr16915356lfn.23.1560325405807; 
 Wed, 12 Jun 2019 00:43:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
 <20190606142220.1392-7-jacopo+renesas@jmondi.org>
In-Reply-To: <20190606142220.1392-7-jacopo+renesas@jmondi.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Jun 2019 09:43:13 +0200
Message-ID: <CAMuHMdWUFDurgWmJgoKZYUxzJFwwK03F0Eca1SEDPk_o65iSwg@mail.gmail.com>
Subject: Re: [PATCH 06/20] clk: renesas: r8a77965: Add CMM clocks
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
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
Cc: muroya@ksk.co.jp, VenkataRajesh.Kalakodima@in.bosch.com,
 David Airlie <airlied@linux.ie>, Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gNiwgMjAxOSBhdCA0OjIyIFBNIEphY29wbyBNb25kaSA8amFjb3BvK3JlbmVz
YXNAam1vbmRpLm9yZz4gd3JvdGU6Cj4gQWRkIGNsb2NrIGRlZmluaXRpb25zIGZvciBDTU0gdW5p
dHMgb24gUmVuZXNhcyBSLUNhciBHZW4zIE0zLU4uCj4KPiBTaWduZWQtb2ZmLWJ5OiBKYWNvcG8g
TW9uZGkgPGphY29wbytyZW5lc2FzQGptb25kaS5vcmc+CgpSZXZpZXdlZC1ieTogR2VlcnQgVXl0
dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4KaS5lLiB3aWxsIHF1ZXVlIGluIGNs
ay1yZW5lc2FzLWZvci12NS4zLgoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAg
ICAgICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2Yg
TGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNv
bnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2Vy
LiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFt
bWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIC0tIExpbnVzIFRvcnZhbGRzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
