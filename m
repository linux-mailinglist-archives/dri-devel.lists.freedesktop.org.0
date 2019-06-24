Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB64E51870
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 18:23:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76A7389CDF;
	Mon, 24 Jun 2019 16:23:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA22489CDD;
 Mon, 24 Jun 2019 16:23:15 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id A48A660E5D; Mon, 24 Jun 2019 16:23:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
 version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: jcrouse@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 6D56C60741;
 Mon, 24 Jun 2019 16:23:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6D56C60741
Date: Mon, 24 Jun 2019 10:23:09 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH] drm/msm/a3xx: remove TPL1 regs from snapshot
Message-ID: <20190624162309.GE17590@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20190624162008.21744-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190624162008.21744-1-robdclark@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1561393395;
 bh=uk6cBxIXao9iEvJBb+AfcSRpkw/3gQ16yglsIxt1O5Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nH3emTquvUEq8PSMFf8nt3svF7D2My627FyozvoVyj7SiqeRRYZK5ZFOtWmDhFYcx
 2d+C+jTZti3k+BZgloTC7tc6yAD8X4EVSbE03aWvmxKvAvGekHyVGXToqs6lLbb/vJ
 qTyroq0hK6JWJbk8uSj4pfm53YhXpRHedWpA5BG8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1561393392;
 bh=uk6cBxIXao9iEvJBb+AfcSRpkw/3gQ16yglsIxt1O5Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IQ3OES0uHQ2eMiOKfaHI2N8wTAzXLK2Nrw5bmRJmWFmJZCNzOyUz8fQyZF1foeleI
 LtRestFPxritDTCWTvsTAX2hH0IwKKkVl7JOwLE0PvDl2YQoXvsB2j1AOuTLqW3nTd
 6xOrcExMqQnrJb86KdXbsNeQ1zmWdgW5TDxXc2SM=
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none)
 header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none
 smtp.mailfrom=jcrouse@codeaurora.org
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMjQsIDIwMTkgYXQgMDk6MTk6NTRBTSAtMDcwMCwgUm9iIENsYXJrIHdyb3Rl
Ogo+IEZyb206IFJvYiBDbGFyayA8cm9iZGNsYXJrQGNocm9taXVtLm9yZz4KPiAKPiBUaGVzZSBy
ZWdzIGFyZSB3cml0ZS1vbmx5LCBhbmQgdGhlIGh3IHRocm93cyBhIGhpc3N5LWZpdCAoaWUuIHJl
Ym9vdHMpCj4gd2hlbiB3ZSB0cnkgdG8gcmVhZCB0aGVtIGZvciBHUFUgc3RhdGUgc25hcHNob3Qs
IGluIHJlc3BvbnNlIHRvIGEgR1BVCj4gaGFuZy4gIEl0IGlzIHJhdGhlciBpbXBvbGl0ZSB3aGVu
IEdQVSByZWNvdmVyeSB0cmlnZ2VycyBhbiBpbnN0YS0KPiByZWJvb3QsIHNvIGxldHMgcmVtb3Zl
IHRoZSBUUEwxIHJlZ2lzdGVycyBmcm9tIHRoZSBzbmFwc2hvdC4KCk5vdCB0byBtZW50aW9uIHRo
YXQgd3JpdGUgb25seSByZWdpc3RlcnMgYXJlIGluY3JlZGlibHkgdW5pbnRlcmVzdGluZyBmb3Ig
YQpzbmFwc2hvdCA6KQoKUmV2aWV3ZWQtYnk6IEpvcmRhbiBDcm91c2UgPGpjcm91c2VAY29kZWF1
cm9yYS5vcmc+Cgo+IEZpeGVzOiA3MTk4ZTZiMDMxNTUgZHJtL21zbTogYWRkIGEzeHggZ3B1IHN1
cHBvcnQKPiBTaWduZWQtb2ZmLWJ5OiBSb2IgQ2xhcmsgPHJvYmRjbGFya0BjaHJvbWl1bS5vcmc+
Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2EzeHhfZ3B1LmMgfCAyNCArKysr
KysrKysrKy0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyks
IDEzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Fk
cmVuby9hM3h4X2dwdS5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTN4eF9ncHUuYwo+
IGluZGV4IGMzYjRiYzZlNDE1NS4uMTMwNzhjNDk3NWZmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9tc20vYWRyZW5vL2EzeHhfZ3B1LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNt
L2FkcmVuby9hM3h4X2dwdS5jCj4gQEAgLTM5NSwxOSArMzk1LDE3IEBAIHN0YXRpYyBjb25zdCB1
bnNpZ25lZCBpbnQgYTN4eF9yZWdpc3RlcnNbXSA9IHsKPiAgCTB4MjIwMCwgMHgyMjEyLCAweDIy
MTQsIDB4MjIxNywgMHgyMjFhLCAweDIyMWEsIDB4MjI0MCwgMHgyMjdlLAo+ICAJMHgyMjgwLCAw
eDIyOGIsIDB4MjJjMCwgMHgyMmMwLCAweDIyYzQsIDB4MjJjZSwgMHgyMmQwLCAweDIyZDgsCj4g
IAkweDIyZGYsIDB4MjJlNiwgMHgyMmU4LCAweDIyZTksIDB4MjJlYywgMHgyMmVjLCAweDIyZjAs
IDB4MjJmNywKPiAtCTB4MjJmZiwgMHgyMmZmLCAweDIzNDAsIDB4MjM0MywgMHgyMzQ4LCAweDIz
NDksIDB4MjM1MCwgMHgyMzU2LAo+IC0JMHgyMzYwLCAweDIzNjAsIDB4MjQ0MCwgMHgyNDQwLCAw
eDI0NDQsIDB4MjQ0NCwgMHgyNDQ4LCAweDI0NGQsCj4gLQkweDI0NjgsIDB4MjQ2OSwgMHgyNDZj
LCAweDI0NmQsIDB4MjQ3MCwgMHgyNDcwLCAweDI0NzIsIDB4MjQ3MiwKPiAtCTB4MjQ3NCwgMHgy
NDc1LCAweDI0NzksIDB4MjQ3YSwgMHgyNGMwLCAweDI0ZDMsIDB4MjRlNCwgMHgyNGVmLAo+IC0J
MHgyNTAwLCAweDI1MDksIDB4MjUwYywgMHgyNTBjLCAweDI1MGUsIDB4MjUwZSwgMHgyNTEwLCAw
eDI1MTEsCj4gLQkweDI1MTQsIDB4MjUxNSwgMHgyNWU0LCAweDI1ZTQsIDB4MjVlYSwgMHgyNWVh
LCAweDI1ZWMsIDB4MjVlZCwKPiAtCTB4MjVmMCwgMHgyNWYwLCAweDI2MDAsIDB4MjYxMiwgMHgy
NjE0LCAweDI2MTcsIDB4MjYxYSwgMHgyNjFhLAo+IC0JMHgyNjQwLCAweDI2N2UsIDB4MjY4MCwg
MHgyNjhiLCAweDI2YzAsIDB4MjZjMCwgMHgyNmM0LCAweDI2Y2UsCj4gLQkweDI2ZDAsIDB4MjZk
OCwgMHgyNmRmLCAweDI2ZTYsIDB4MjZlOCwgMHgyNmU5LCAweDI2ZWMsIDB4MjZlYywKPiAtCTB4
MjZmMCwgMHgyNmY3LCAweDI2ZmYsIDB4MjZmZiwgMHgyNzQwLCAweDI3NDMsIDB4Mjc0OCwgMHgy
NzQ5LAo+IC0JMHgyNzUwLCAweDI3NTYsIDB4Mjc2MCwgMHgyNzYwLCAweDMwMGMsIDB4MzAwZSwg
MHgzMDFjLCAweDMwMWQsCj4gLQkweDMwMmEsIDB4MzAyYSwgMHgzMDJjLCAweDMwMmQsIDB4MzAz
MCwgMHgzMDMxLCAweDMwMzQsIDB4MzAzNiwKPiAtCTB4MzAzYywgMHgzMDNjLCAweDMwNWUsIDB4
MzA1ZiwKPiArCTB4MjJmZiwgMHgyMmZmLCAweDIzNDAsIDB4MjM0MywgMHgyNDQwLCAweDI0NDAs
IDB4MjQ0NCwgMHgyNDQ0LAo+ICsJMHgyNDQ4LCAweDI0NGQsIDB4MjQ2OCwgMHgyNDY5LCAweDI0
NmMsIDB4MjQ2ZCwgMHgyNDcwLCAweDI0NzAsCj4gKwkweDI0NzIsIDB4MjQ3MiwgMHgyNDc0LCAw
eDI0NzUsIDB4MjQ3OSwgMHgyNDdhLCAweDI0YzAsIDB4MjRkMywKPiArCTB4MjRlNCwgMHgyNGVm
LCAweDI1MDAsIDB4MjUwOSwgMHgyNTBjLCAweDI1MGMsIDB4MjUwZSwgMHgyNTBlLAo+ICsJMHgy
NTEwLCAweDI1MTEsIDB4MjUxNCwgMHgyNTE1LCAweDI1ZTQsIDB4MjVlNCwgMHgyNWVhLCAweDI1
ZWEsCj4gKwkweDI1ZWMsIDB4MjVlZCwgMHgyNWYwLCAweDI1ZjAsIDB4MjYwMCwgMHgyNjEyLCAw
eDI2MTQsIDB4MjYxNywKPiArCTB4MjYxYSwgMHgyNjFhLCAweDI2NDAsIDB4MjY3ZSwgMHgyNjgw
LCAweDI2OGIsIDB4MjZjMCwgMHgyNmMwLAo+ICsJMHgyNmM0LCAweDI2Y2UsIDB4MjZkMCwgMHgy
NmQ4LCAweDI2ZGYsIDB4MjZlNiwgMHgyNmU4LCAweDI2ZTksCj4gKwkweDI2ZWMsIDB4MjZlYywg
MHgyNmYwLCAweDI2ZjcsIDB4MjZmZiwgMHgyNmZmLCAweDI3NDAsIDB4Mjc0MywKPiArCTB4MzAw
YywgMHgzMDBlLCAweDMwMWMsIDB4MzAxZCwgMHgzMDJhLCAweDMwMmEsIDB4MzAyYywgMHgzMDJk
LAo+ICsJMHgzMDMwLCAweDMwMzEsIDB4MzAzNCwgMHgzMDM2LCAweDMwM2MsIDB4MzAzYywgMHgz
MDVlLCAweDMwNWYsCj4gIAl+MCAgIC8qIHNlbnRpbmVsICovCj4gIH07Cj4gIAo+IC0tIAo+IDIu
MjAuMQo+IAoKLS0gClRoZSBRdWFsY29tbSBJbm5vdmF0aW9uIENlbnRlciwgSW5jLiBpcyBhIG1l
bWJlciBvZiBDb2RlIEF1cm9yYSBGb3J1bSwKYSBMaW51eCBGb3VuZGF0aW9uIENvbGxhYm9yYXRp
dmUgUHJvamVjdApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
