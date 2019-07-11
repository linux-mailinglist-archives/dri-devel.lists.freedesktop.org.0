Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E56C765A8E
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2019 17:36:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6CDD6E179;
	Thu, 11 Jul 2019 15:36:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc42.google.com (mail-yw1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9AFE6E179
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2019 15:36:35 +0000 (UTC)
Received: by mail-yw1-xc42.google.com with SMTP id i138so4074594ywg.8
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2019 08:36:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=UvUn/wkfaXiP74FDFKjzk4qqjcEA2JFgRR8kCXFBibc=;
 b=gcbIhovyZPQmNzWEWPwSVqU+0s8D0tr6rFNoLM1u+PSIf+p6B/lwmWS5Xf6lZnqkrG
 XtEm7YBV8/cUls2QAcw8Mugat/O/QqBrougl+ngHr6S12AebS0FTCVR54tQZI0vYJu1w
 9BaDt22BiQMo8UqlYIMF5tJIeEZs82FtzxgUcP2Ijcvyj7wkIkFmubD1Is2hr6d2vCNz
 qyVZd4BbWYIfYzknlL9OVX27CVWkmi/Vkifcm+zvvdq0Y5e404YlxU0eVds7VXCSTv1p
 NBy77+tvE+RGwymSdrFmG6BMtrPwGngymdBnYUV73kUh0PZ8u32lu/CkSudLv+yspGXT
 vIdQ==
X-Gm-Message-State: APjAAAVGqEsUY6GtYQP5ok0BtooMHF9ySvlchUlQadi3uMrgDaYiQW4a
 pu5GNm3qjF+HP+ySHT9/qLBeYw==
X-Google-Smtp-Source: APXvYqyY7PDmcxBypqEYIpPa0U3mhgsST5ptTxYv33CjHcnvb+TrT5VAGGjQkL7TjznwkkvIuwpIDQ==
X-Received: by 2002:a81:aa50:: with SMTP id z16mr2376159ywk.278.1562859394919; 
 Thu, 11 Jul 2019 08:36:34 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id d7sm1480305ywh.14.2019.07.11.08.36.34
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 11 Jul 2019 08:36:34 -0700 (PDT)
Date: Thu, 11 Jul 2019 11:36:34 -0400
From: Sean Paul <sean@poorly.run>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 2/5] drm/dsc: Fix bogus cpu_to_be16() usage
Message-ID: <20190711153634.GD136584@art_vandelay>
References: <20190710125143.9965-1-ville.syrjala@linux.intel.com>
 <20190710125143.9965-2-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190710125143.9965-2-ville.syrjala@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=UvUn/wkfaXiP74FDFKjzk4qqjcEA2JFgRR8kCXFBibc=;
 b=QP9K3RhQXZ3eA+KcagHEtCLz0JpArDUN/VoUCN16QbM76kQDp8UxV1N7cbr531G9U6
 L5IqE0tGqppLhmJKuTJY5eqbWhq4ZfV5Ftdz2EzXARhErhRz2zTjfSsLesh/iaNUBqsm
 86ySop++MfRBSHNVjO8yZB2bjQJO0rIf97RMacXTvsx5r1fe6+ynbh4S1sp7AMv6xhOP
 KjLhNhtjoTXTIAMsDk1LiMxbWCbtRl7Hw1GGxQ+2DpOe1YUDKJXQC2NP85yCKvgkaj0S
 XLo2mHJ4hUgMEcBwIwI6e25jFWX2eoJY8xWx1jGvPS+MKf3wIcOt5IHTKSGZG04hIbAL
 fDJA==
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
Cc: Manasi Navare <manasi.d.navare@intel.com>,
 David Francis <David.Francis@amd.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMTAsIDIwMTkgYXQgMDM6NTE6NDBQTSArMDMwMCwgVmlsbGUgU3lyamFsYSB3
cm90ZToKPiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwu
Y29tPgo+IAo+IF9fYmUxNiA9IGNwdV90b19iZTE2KF9fYmUxNikgaXMgbm9uc2Vuc2UuIERvIGl0
IHJpZ2h0Lgo+IAo+IC4uL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHNjLmM6MjE4OjUzOiB3YXJuaW5n
OiBpbmNvcnJlY3QgdHlwZSBpbiBhc3NpZ25tZW50IChkaWZmZXJlbnQgYmFzZSB0eXBlcykKPiAu
Li9kcml2ZXJzL2dwdS9kcm0vZHJtX2RzYy5jOjIxODo1MzogICAgZXhwZWN0ZWQgcmVzdHJpY3Rl
ZCBfX2JlMTYKPiAuLi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RzYy5jOjIxODo1MzogICAgZ290IGlu
dAo+IC4uL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHNjLmM6MjI1OjI1OiB3YXJuaW5nOiBjYXN0IGZy
b20gcmVzdHJpY3RlZCBfX2JlMTYKPiAuLi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RzYy5jOjIyNToy
NTogd2FybmluZzogaW5jb3JyZWN0IHR5cGUgaW4gYXJndW1lbnQgMSAoZGlmZmVyZW50IGJhc2Ug
dHlwZXMpCj4gLi4vZHJpdmVycy9ncHUvZHJtL2RybV9kc2MuYzoyMjU6MjU6ICAgIGV4cGVjdGVk
IHVuc2lnbmVkIHNob3J0IFt1c2VydHlwZV0gdmFsCj4gLi4vZHJpdmVycy9ncHUvZHJtL2RybV9k
c2MuYzoyMjU6MjU6ICAgIGdvdCByZXN0cmljdGVkIF9fYmUxNgo+IC4uL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZHNjLmM6MjI1OjI1OiB3YXJuaW5nOiBjYXN0IGZyb20gcmVzdHJpY3RlZCBfX2JlMTYK
PiAuLi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RzYy5jOjIyNToyNTogd2FybmluZzogY2FzdCBmcm9t
IHJlc3RyaWN0ZWQgX19iZTE2Cj4gCj4gQ2M6IE1hbmFzaSBOYXZhcmUgPG1hbmFzaS5kLm5hdmFy
ZUBpbnRlbC5jb20+Cj4gQ2M6IERhdmlkIEZyYW5jaXMgPERhdmlkLkZyYW5jaXNAYW1kLmNvbT4K
PiBTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50
ZWwuY29tPgoKUmV2aWV3ZWQtYnk6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPgoKPiAtLS0K
PiAgZHJpdmVycy9ncHUvZHJtL2RybV9kc2MuYyB8IDEyICsrKysrLS0tLS0tLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RzYy5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kc2MuYwo+
IGluZGV4IDc3ZjRlNWFlNDE5Ny4uZjJmYzQ3ZjEyM2QyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9kcm1fZHNjLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RzYy5jCj4gQEAg
LTIxNiwxMyArMjE2LDExIEBAIHZvaWQgZHJtX2RzY19wcHNfcGF5bG9hZF9wYWNrKHN0cnVjdCBk
cm1fZHNjX3BpY3R1cmVfcGFyYW1ldGVyX3NldCAqcHBzX3BheWxvYWQsCj4gIAkgKi8KPiAgCWZv
ciAoaSA9IDA7IGkgPCBEU0NfTlVNX0JVRl9SQU5HRVM7IGkrKykgewo+ICAJCXBwc19wYXlsb2Fk
LT5yY19yYW5nZV9wYXJhbWV0ZXJzW2ldID0KPiAtCQkJKChkc2NfY2ZnLT5yY19yYW5nZV9wYXJh
bXNbaV0ucmFuZ2VfbWluX3FwIDw8Cj4gLQkJCSAgRFNDX1BQU19SQ19SQU5HRV9NSU5RUF9TSElG
VCkgfAo+IC0JCQkgKGRzY19jZmctPnJjX3JhbmdlX3BhcmFtc1tpXS5yYW5nZV9tYXhfcXAgPDwK
PiAtCQkJICBEU0NfUFBTX1JDX1JBTkdFX01BWFFQX1NISUZUKSB8Cj4gLQkJCSAoZHNjX2NmZy0+
cmNfcmFuZ2VfcGFyYW1zW2ldLnJhbmdlX2JwZ19vZmZzZXQpKTsKPiAtCQlwcHNfcGF5bG9hZC0+
cmNfcmFuZ2VfcGFyYW1ldGVyc1tpXSA9Cj4gLQkJCWNwdV90b19iZTE2KHBwc19wYXlsb2FkLT5y
Y19yYW5nZV9wYXJhbWV0ZXJzW2ldKTsKPiArCQkJY3B1X3RvX2JlMTYoKGRzY19jZmctPnJjX3Jh
bmdlX3BhcmFtc1tpXS5yYW5nZV9taW5fcXAgPDwKPiArCQkJCSAgICAgRFNDX1BQU19SQ19SQU5H
RV9NSU5RUF9TSElGVCkgfAo+ICsJCQkJICAgIChkc2NfY2ZnLT5yY19yYW5nZV9wYXJhbXNbaV0u
cmFuZ2VfbWF4X3FwIDw8Cj4gKwkJCQkgICAgIERTQ19QUFNfUkNfUkFOR0VfTUFYUVBfU0hJRlQp
IHwKPiArCQkJCSAgICAoZHNjX2NmZy0+cmNfcmFuZ2VfcGFyYW1zW2ldLnJhbmdlX2JwZ19vZmZz
ZXQpKTsKPiAgCX0KPiAgCj4gIAkvKiBQUFMgODggKi8KPiAtLSAKPiAyLjIxLjAKPiAKPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKCi0tIApTZWFu
IFBhdWwsIFNvZnR3YXJlIEVuZ2luZWVyLCBHb29nbGUgLyBDaHJvbWl1bSBPUwpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
