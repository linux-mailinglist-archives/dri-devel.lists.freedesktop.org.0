Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 106E941DF4
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 09:41:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CE9089321;
	Wed, 12 Jun 2019 07:41:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
 [209.85.167.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DF9389321
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 07:41:45 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id z15so8584507lfh.13
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 00:41:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JYIEM0By4Zml2APKo9kMoUOCpHgMMOI9vYqugrTzfJ4=;
 b=pNzUp5E+WyVPMXLMM/IM3CxW1wSja61nsLYAjeXm2KxuomybBWtmjyCXhO7Sfyfay9
 FuricHwLg7wbUCymR6nBjTrJJtW4oO2eN5jphcz2FBYAPkyPnaDWJLG//a1Rl2T6nZd1
 O3Q6r4HSI6p4tVisperSVXvwM14E6sJA60Tvaq5Cme1Yex37CUpDwjev+zfM2Umf0sYg
 bwgySOPT37Hs6trT/gy0Vqp9EwzDJfp2/kJQL2ZWE3H4feCy6oQvjUDbk1Q4YZ+9xruT
 JBSJto3wKZfH+ANkSQgskhnl46MD2YdeWwv9mInty+bMc/hYJ2yChOPCKz6qYBJqTU+z
 SvVA==
X-Gm-Message-State: APjAAAVQXs35JFZ4rSfRmQgxJurdk/b3o+cazSknNV7srmFYeQVDyq6O
 5cDdPkFjtv07TPJ1M1J0NF2IaXFtAzTaQYuv2i0=
X-Google-Smtp-Source: APXvYqxNWO112XoEICin1Gc2AixC1ryiZ2+yQ/6LHGjJqk9DSDbjt602mUpBhRPDAAnQkXNG4MO8aCXhg9mFaxQk8j8=
X-Received: by 2002:a19:4a49:: with SMTP id x70mr2792205lfa.151.1560325303275; 
 Wed, 12 Jun 2019 00:41:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
 <20190606142220.1392-6-jacopo+renesas@jmondi.org>
In-Reply-To: <20190606142220.1392-6-jacopo+renesas@jmondi.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Jun 2019 09:41:29 +0200
Message-ID: <CAMuHMdUGGq7bwb+hPRjxadZodB-PUOQudyJZrrnnPr+XvWk_tA@mail.gmail.com>
Subject: Re: [PATCH 05/20] clk: renesas: r8a7795: Add CMM clocks
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
dHMgb24gUmVuZXNhcyBSLUNhciBHZW4zIEgzLgo+Cj4gU2lnbmVkLW9mZi1ieTogSmFjb3BvIE1v
bmRpIDxqYWNvcG8rcmVuZXNhc0BqbW9uZGkub3JnPgoKUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRl
cmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+CmkuZS4gd2lsbCBxdWV1ZSBpbiBjbGst
cmVuZXNhcy1mb3ItdjUuMy4KCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAg
ICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExp
bnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252
ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4g
QnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1l
ciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAtLSBMaW51cyBUb3J2YWxkcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
