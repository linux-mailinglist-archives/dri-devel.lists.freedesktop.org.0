Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 924AE60261
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 10:41:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA3346E431;
	Fri,  5 Jul 2019 08:41:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5302::9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B5776E35F
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2019 15:34:07 +0000 (UTC)
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzmt2bYDnKIKaws6YXTsc4="
X-RZG-CLASS-ID: mo00
Received: from oxapp01-01.back.ox.d0m.de by smtp-ox.front (RZmta 44.24 AUTH)
 with ESMTPSA id h0a328v64FXe11g
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Thu, 4 Jul 2019 17:33:40 +0200 (CEST)
Date: Thu, 4 Jul 2019 17:33:40 +0200 (CEST)
From: Ulrich Hecht <uli@fpond.eu>
To: Matthias Brugger <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>,
 Matthias Brugger <mbrugger@suse.com>
Message-ID: <100944512.353257.1562254420397@webmail.strato.com>
In-Reply-To: <84d1c444-d6cb-9537-1bf5-b4e736443239@gmail.com>
References: <20181116125449.23581-1-matthias.bgg@kernel.org>
 <20181116125449.23581-9-matthias.bgg@kernel.org>
 <20181116231522.GA18006@bogus>
 <2a23e407-4cd4-2e2b-97a5-4e2bb96846e0@gmail.com>
 <CAL_JsqKJQwfDJbpmwW+oCxiDkSp5+6mG-uoURmCQVEMP_jFOEg@mail.gmail.com>
 <154281878765.88331.10581984256202566195@swboyd.mtv.corp.google.com>
 <458178ac-c0fc-9671-7fc8-ed2d6f61424c@suse.com>
 <154356023767.88331.18401188808548429052@swboyd.mtv.corp.google.com>
 <a229bfc7-683f-5b0d-7b71-54f934de6214@suse.com>
 <1561953318.25914.9.camel@mtksdaap41>
 <84d1c444-d6cb-9537-1bf5-b4e736443239@gmail.com>
Subject: Re: [PATCH v5 08/12] dt-bindings: mediatek: Change the binding for
 mmsys clocks
MIME-Version: 1.0
X-Priority: 3
Importance: Medium
X-Mailer: Open-Xchange Mailer v7.8.4-Rev59
X-Originating-IP: 85.212.144.69
X-Originating-Client: open-xchange-appsuite
X-Mailman-Approved-At: Fri, 05 Jul 2019 08:41:20 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1562254445; 
 s=strato-dkim-0002; d=fpond.eu;
 h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=gou5Zh0HIbQCcM7c2CWEWnJ04+a+qFsD/mEWP+ODjjE=;
 b=ehzqxpvNSrqB9P/AjCQ3tm7X1Y2Phe5S66SM4zB/FPEtTbKz6C1/hRV28bUFNqHRyu
 cOQnE7FtxUQ1sKxKbGjn0982YQdK+LIfI9mTSgF7prkojjqVwnwqE1muX7L6M8SYv+Wn
 KHiBkLDPWL+kYnZcKsecMxwlA9xG+tx+/4xISxZr6TLzIUO0mHV22kHVBIJBOPUymGOj
 ADQ8DLOmTQSEacwoQGbKwbi0XJKqxh6Xvp5XVapMI4CbfIsyUVvSDN3oiDjeZWkBK6Ob
 2V1vQEbhenpbXDCL3xi2j3uOXO5u5Qae9UC9CoUD9PjOoRV5q8PdNrldPS0zh4eXw6R1
 v8Bw==
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
Cc: Mark Rutland <mark.rutland@arm.com>, Sean Wang <Sean.Wang@mediatek.com>,
 devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Sean Wang <sean.wang@kernel.org>,
 Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Chen-Yu Tsai <wens@csie.org>, linux-mediatek@lists.infradead.org,
 Randy Dunlap <rdunlap@infradead.org>, matthias.bgg@kernel.org,
 Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
 linux-clk <linux-clk@vger.kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cj4gT24gSnVseSA0LCAyMDE5IGF0IDExOjA4IEFNIE1hdHRoaWFzIEJydWdnZXIgPG1hdHRoaWFz
LmJnZ0BnbWFpbC5jb20+IHdyb3RlOgo+IFlvdSBhcmUgcmlnaHQsIGl0IHRvb2sgZmFyIHRvbyBs
b25nIGZvciBtZSB0byByZXNwb25kIHdpdGggYSBuZXcgdmVyc2lvbiBvZiB0aGUKPiBzZXJpZXMu
IFRoZSBwcm9ibGVtIEkgZmFjZSBpcywgdGhhdCBJIHVzZSBteSBtdDgxNzMgYmFzZWQgY2hyb21l
Ym9vayBmb3IKPiB0ZXN0aW5nLiBJdCBuZWVkcyBzb21lIGRvd25zdHJlYW0gcGF0Y2hlcyBhbmQg
YnJva2Ugc29tZXdoZXJlIGJldHdlZW4gbXkgbGFzdAo+IGVtYWlsIGFuZCBhIGZldyBtb250aCBh
Z28uCgpJZiB0aGF0IENocm9tZWJvb2sgaXMgYW4gQWNlciBSMTMgYW5kIHlvdSBuZWVkIGEgd29y
a2luZyBrZXJuZWwsIHlvdSBtYXkgd2FudCB0byBoYXZlIGEgbG9vayBhdCBodHRwczovL2dpdGh1
Yi5jb20vdWxpL2tlcm5lbC90cmVlL2VsbS13b3JraW5nLTUuMiAuCgpDVQpVbGkKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
