Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E426290AD
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 08:04:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 995946E08C;
	Fri, 24 May 2019 06:03:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E028B6E08C
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 06:03:58 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id B767860DB6; Fri, 24 May 2019 06:03:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
 version=3.4.0
Received: from [10.131.117.43]
 (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: rnayak@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id CA5026063A;
 Fri, 24 May 2019 06:03:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CA5026063A
Subject: Re: [RFC v2 00/11] DVFS in the OPP core
To: Viresh Kumar <viresh.kumar@linaro.org>
References: <20190320094918.20234-1-rnayak@codeaurora.org>
 <20190521062248.ogjetb2rwtqekflx@vireshk-i7>
From: Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <85dbc630-f526-c06f-8a8b-9bbc3b794693@codeaurora.org>
Date: Fri, 24 May 2019 11:33:52 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190521062248.ogjetb2rwtqekflx@vireshk-i7>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1558677838;
 bh=+LXeINwGo6CiisA+JrfBkpcV33DtSDYcwasClLqFltM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=WtaCR2+wyWWFjJzU9+IBN0PVFNR69TJTy4vvAyk+MUIWQoA6bLptg7h6mGWmvgSYC
 ceLZ777Tzuy2Vfg1oiS6jsaRdeMMBSozslhkgH9uA3OjPW/L2iqMfhWCfqhoBEh3TL
 vBuirdXrib/G+OD5P4nw7QuflaX7JS6fFb70beys=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1558677838;
 bh=+LXeINwGo6CiisA+JrfBkpcV33DtSDYcwasClLqFltM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=WtaCR2+wyWWFjJzU9+IBN0PVFNR69TJTy4vvAyk+MUIWQoA6bLptg7h6mGWmvgSYC
 ceLZ777Tzuy2Vfg1oiS6jsaRdeMMBSozslhkgH9uA3OjPW/L2iqMfhWCfqhoBEh3TL
 vBuirdXrib/G+OD5P4nw7QuflaX7JS6fFb70beys=
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none)
 header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none
 smtp.mailfrom=rnayak@codeaurora.org
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
Cc: ulf.hansson@linaro.org, dianders@chromium.org, vincent.guittot@linaro.org,
 linux-scsi@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, rafael@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org, swboyd@chromium.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDUvMjEvMjAxOSAxMTo1MiBBTSwgVmlyZXNoIEt1bWFyIHdyb3RlOgo+IE9uIDIwLTAzLTE5
LCAxNToxOSwgUmFqZW5kcmEgTmF5YWsgd3JvdGU6Cj4+IFRoaXMgaXMgYSB2MiBvZiB0aGUgUkZD
IHBvc3RlZCBlYXJsaWVyIGJ5IFN0ZXBoZW4gQm95ZCBbMV0KPj4KPj4gQXMgcGFydCBvZiB2MiBJ
IHN0aWxsIGZvbGxvdyB0aGUgc2FtZSBhcHByb2FjaCBvZiBkZXZfcG1fb3BwX3NldF9yYXRlKCkK
Pj4gQVBJIHVzaW5nIGNsayBmcmFtZXdvcmsgdG8gcm91bmQgdGhlIGZyZXF1ZW5jeSBwYXNzZWQg
YW5kIG1ha2luZyBpdAo+PiBhY2NlcHQgMCBhcyBhIHZhbGlkIGZyZXF1ZW5jeSBpbmRpY2F0aW5n
IHRoZSBmcmVxdWVuY3kgaXNuJ3QgcmVxdWlyZWQKPj4gYW55bW9yZS4gSXQganVzdCBoYXMgYSBm
ZXcgbW9yZSBkcml2ZXJzIGNvbnZlcnRlZCB0byB1c2UgdGhpcyBhcHByb2FjaAo+PiBsaWtlIGRz
aS9kcHUgYW5kIHVmcy4KPj4gdWZzIGRlbW9uc3RyYXRlcyB0aGUgY2FzZSBvZiBoYXZpbmcgdG8g
aGFuZGxlIG11bHRpcGxlIHBvd2VyIGRvbWFpbnMsIG9uZQo+PiBvZiB3aGljaCBpcyBzY2FsYWJs
ZS4KPj4KPj4gVGhlIHBhdGNoZXMgYXJlIGJhc2VkIG9uIDUuMS1yYzEgYW5kIGRlcGVuZCBvbiBz
b21lIHVmcyBmaXhlcyBJIHBvc3RlZAo+PiBlYXJsaWVyIFsyXSBhbmQgYSBEVCBwYXRjaCB0byBp
bmNsdWRlIHRoZSBycG1wZCBoZWFkZXIgWzNdCj4+Cj4+IFsxXSBodHRwczovL2xrbWwub3JnL2xr
bWwvMjAxOS8xLzI4LzIwODYKPj4gWzJdIGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDE5LzMvOC83
MAo+PiBbM10gaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMTkvMy8yMC8xMjAKPiAKPiBIaSBSYWpl
bmRyYSwKPiAKPiBJIGFtIGluY2xpbmVkIHRvIGFwcGx5L3B1c2ggdGhpcyBzZXJpZXMgZm9yIDUu
My1yYzEsIHdpbGwgaXQgYmUKPiBwb3NzaWJsZSBmb3IgeW91IHRvIHNwZW5kIHNvbWUgdGltZSBv
biB0aGlzIGF0IHByaW9yaXR5ID8KCkhleSBWaXJlc2gsIEkgd2FzIG9uIHZhY2F0aW9uLCBqdXN0
IGdvdCBiYWNrLiBJIHdpbGwgcmVmcmVzaCB0aGlzIHNlcmllcwphbmQgYWRkcmVzcyB5b3VyIHBy
ZXZpb3VzIGZlZWRiYWNrLCBJIGhhdmVuJ3QgcmVjZWl2ZWQgbXVjaCBmZWVkYmFjayBmb3IgdGhl
CmRyaXZlciBjaGFuZ2VzIDovIGJ1dCB3ZSBjYW4gYXRsZWFzdCByZXZpZXcgYW5kIGdldCB0aGUg
T1BQIGxheWVyIGNoYW5nZXMKZmluYWxpemVkLiB0aGFua3MuCgotLSAKUVVBTENPTU0gSU5ESUEs
IG9uIGJlaGFsZiBvZiBRdWFsY29tbSBJbm5vdmF0aW9uIENlbnRlciwgSW5jLiBpcyBhIG1lbWJl
cgpvZiBDb2RlIEF1cm9yYSBGb3J1bSwgaG9zdGVkIGJ5IFRoZSBMaW51eCBGb3VuZGF0aW9uCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
