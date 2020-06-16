Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A791FC72D
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 09:26:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 430776E503;
	Wed, 17 Jun 2020 07:26:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CE2D6E8C1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 13:56:45 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id i27so23623101ljb.12
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 06:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PS/HoxcWaI8mWZ7gB9+dY98FWzRMtZgjXEzoehTh0Ew=;
 b=pAGImOj5/FyFG7cuoImMCNenbaRAmkeTotTDDzfPVZVbJM1K88K4JP6jm6dvadYcZy
 mPZC5kmnXbfscwKku7+Z/gM8b+ZSJgtl6d5voJZ0Po5uBt7VtwYQT48DoFwslLPdj+YH
 4JDzN8UsAam8lv/hY4H3SxlNVNpDUPPgtwxAVnwub6sRM1AFM5csEXv/pxUY64fgUerI
 f7hxolJj/ulFB9UCFpSVWlOtCyUFTNkAL+4rRN99AmoaF0Mt9LdK2Uw/u1drRDmLQ2rF
 rpMrSnktgUkzbFMa5/pB95loMH7fVddBJvQX5t3myVpCdi/GPT89SsHtTWFylKuqIoUM
 ff2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PS/HoxcWaI8mWZ7gB9+dY98FWzRMtZgjXEzoehTh0Ew=;
 b=Az/KVE5+GG+LDIRd41E1TRkJAa/zRUGhTdM2PaWmaXsvsyQ8setA+4gkaiJpfBfqth
 DUuAstS6IlQZaw6SlLuDlc/0cWpaYLaS9XY7cnupJymYkw+hhsYhbGqINYZwfU+Xmzdc
 Us0DjOCEbhEWrsfAdIZziq89AGrBHWqNuJfQdt8DXCujdDDVG8GK19uI2U6UqZQVvNoJ
 Z57xZUPgo0a2lr0FBW0ZoZji8S65ujRa5jOsleXtLYMLX21Gzn2mGngg5cC7dCBQyl5A
 hFI09LXiSzDXJYzKER84C+Qr4QsWZeCFGcbi5RCJIOtETONaG7PLhY1SM+RKRWgxAs4r
 +Cww==
X-Gm-Message-State: AOAM530osa3P0LR2LTo1ZxuT9oRsUUefkP33lu2jgeeRV2cm5u4/OGxn
 Ka/amRdFMFMXaFyF3/sLLrk=
X-Google-Smtp-Source: ABdhPJwzAbeBz96CnSD3eXpvoUY0onr46lm/vCHg1gRZHDpRKM99xRKWswjoFbC3ypLhP+eFpq26lA==
X-Received: by 2002:a2e:8601:: with SMTP id a1mr1404322lji.255.1592315803565; 
 Tue, 16 Jun 2020 06:56:43 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.googlemail.com with ESMTPSA id 80sm4401198ljf.85.2020.06.16.06.56.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2020 06:56:42 -0700 (PDT)
Subject: Re: [PATCH v7 1/6] of_graph: add of_graph_get_local_port()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20200614172234.8856-1-digetx@gmail.com>
 <20200614172234.8856-2-digetx@gmail.com>
 <20200616012111.GE1629@pendragon.ideasonboard.com>
 <20200616012513.GF1629@pendragon.ideasonboard.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <8b7c6395-edd8-cecd-7004-e9f3f22d61f2@gmail.com>
Date: Tue, 16 Jun 2020 16:56:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200616012513.GF1629@pendragon.ideasonboard.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 17 Jun 2020 07:26:02 +0000
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
Cc: devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 linux-tegra@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTYuMDYuMjAyMCAwNDoyNSwgTGF1cmVudCBQaW5jaGFydCDQv9C40YjQtdGCOgo+IE9uIFR1ZSwg
SnVuIDE2LCAyMDIwIGF0IDA0OjIxOjEyQU0gKzAzMDAsIExhdXJlbnQgUGluY2hhcnQgd3JvdGU6
Cj4+IEhpIERtaXRyeSwKPj4KPj4gVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guCj4+Cj4+IE9uIFN1
biwgSnVuIDE0LCAyMDIwIGF0IDA4OjIyOjI5UE0gKzAzMDAsIERtaXRyeSBPc2lwZW5rbyB3cm90
ZToKPj4+IEluIHNvbWUgY2FzZSwgbGlrZSBhIERSTSBkaXNwbGF5IGNvZGUgZm9yIGV4YW1wbGUs
IGl0J3MgdXNlZnVsIHRvIHNpbGVudGx5Cj4+PiBjaGVjayB3aGV0aGVyIHBvcnQgbm9kZSBleGlz
dHMgYXQgYWxsIGluIGEgZGV2aWNlLXRyZWUgYmVmb3JlIHByb2NlZWRpbmcKPj4+IHdpdGggcGFy
c2luZyB0aGUgZ3JhcGguCj4+Pgo+Pj4gVGhpcyBwYXRjaCBhZGRzIG9mX2dyYXBoX2dldF9sb2Nh
bF9wb3J0KCkgd2hpY2ggcmV0dXJucyBwb2ludGVyIHRvIGEgbG9jYWwKPj4+IHBvcnQgbm9kZSwg
b3IgTlVMTCBpZiBncmFwaCBpc24ndCBzcGVjaWZpZWQgaW4gYSBkZXZpY2UtdHJlZSBmb3IgYSBn
aXZlbgo+Pj4gZGV2aWNlIG5vZGUuCj4+Pgo+Pj4gUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxy
b2JoQGtlcm5lbC5vcmc+Cj4+PiBSZXZpZXdlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJv
cmcub3JnPgo+Pj4gU2lnbmVkLW9mZi1ieTogRG1pdHJ5IE9zaXBlbmtvIDxkaWdldHhAZ21haWwu
Y29tPgo+Pj4gLS0tCj4+PiAgZHJpdmVycy9vZi9wcm9wZXJ0eS5jICAgIHwgMzIgKysrKysrKysr
KysrKysrKysrKysrKystLS0tLS0tLS0KPj4+ICBpbmNsdWRlL2xpbnV4L29mX2dyYXBoLmggfCAg
NyArKysrKysrCj4+PiAgMiBmaWxlcyBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspLCA5IGRlbGV0
aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL29mL3Byb3BlcnR5LmMgYi9kcml2
ZXJzL29mL3Byb3BlcnR5LmMKPj4+IGluZGV4IDFmMjA4NmY0ZTdjZS4uMDVjNWY2MTliOGJiIDEw
MDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9vZi9wcm9wZXJ0eS5jCj4+PiArKysgYi9kcml2ZXJzL29m
L3Byb3BlcnR5LmMKPj4+IEBAIC02MDgsMTUgKzYwOCw3IEBAIHN0cnVjdCBkZXZpY2Vfbm9kZSAq
b2ZfZ3JhcGhfZ2V0X25leHRfZW5kcG9pbnQoY29uc3Qgc3RydWN0IGRldmljZV9ub2RlICpwYXJl
bnQsCj4+PiAgCSAqIHBhcmVudCBwb3J0IG5vZGUuCj4+PiAgCSAqLwo+Pj4gIAlpZiAoIXByZXYp
IHsKPj4+IC0JCXN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZTsKPj4+IC0KPj4+IC0JCW5vZGUgPSBv
Zl9nZXRfY2hpbGRfYnlfbmFtZShwYXJlbnQsICJwb3J0cyIpOwo+Pj4gLQkJaWYgKG5vZGUpCj4+
PiAtCQkJcGFyZW50ID0gbm9kZTsKPj4+IC0KPj4+IC0JCXBvcnQgPSBvZl9nZXRfY2hpbGRfYnlf
bmFtZShwYXJlbnQsICJwb3J0Iik7Cj4+PiAtCQlvZl9ub2RlX3B1dChub2RlKTsKPj4+IC0KPj4+
ICsJCXBvcnQgPSBvZl9ncmFwaF9nZXRfbG9jYWxfcG9ydChwYXJlbnQpOwo+Pj4gIAkJaWYgKCFw
b3J0KSB7Cj4+PiAgCQkJcHJfZXJyKCJncmFwaDogbm8gcG9ydCBub2RlIGZvdW5kIGluICVwT0Zc
biIsIHBhcmVudCk7Cj4+PiAgCQkJcmV0dXJuIE5VTEw7Cj4+PiBAQCAtNzY1LDYgKzc1NywyOCBA
QCBzdHJ1Y3QgZGV2aWNlX25vZGUgKm9mX2dyYXBoX2dldF9yZW1vdGVfcG9ydChjb25zdCBzdHJ1
Y3QgZGV2aWNlX25vZGUgKm5vZGUpCj4+PiAgfQo+Pj4gIEVYUE9SVF9TWU1CT0wob2ZfZ3JhcGhf
Z2V0X3JlbW90ZV9wb3J0KTsKPj4+ICAKPj4+ICsvKioKPj4+ICsgKiBvZl9ncmFwaF9nZXRfbG9j
YWxfcG9ydCgpIC0gZ2V0IGxvY2FsIHBvcnQgbm9kZQo+Pj4gKyAqIEBub2RlOiBwb2ludGVyIHRv
IGEgbG9jYWwgZW5kcG9pbnQgZGV2aWNlX25vZGUKPj4+ICsgKgo+Pj4gKyAqIFJldHVybjogRmly
c3QgbG9jYWwgcG9ydCBub2RlIGFzc29jaWF0ZWQgd2l0aCBsb2NhbCBlbmRwb2ludCBub2RlIGxp
bmtlZAo+Pj4gKyAqCSAgIHRvIEBub2RlLiBVc2Ugb2Zfbm9kZV9wdXQoKSBvbiBpdCB3aGVuIGRv
bmUuCj4+PiArICovCj4+PiArc3RydWN0IGRldmljZV9ub2RlICpvZl9ncmFwaF9nZXRfbG9jYWxf
cG9ydChjb25zdCBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUpCj4gCj4gSSBmb3Jnb3QgdG8gbWVu
dGlvbiB0aGF0LCBnaXZlbiB0aGF0IHRoZXJlIGNvdWxkIGJlIG11bHRpcGxlICdwb3J0Jwo+IG5v
ZGVzLCB0aGlzIGZ1bmN0aW9uIHdvdWxkIGJlIGJldHRlciBuYW1lZAo+IG9mX2dyYXBoX2dldF9m
aXJzdF9sb2NhbF9wb3J0KCkuICdmaXJzdCcgaGVyZSB3b3VsZCByZWZlciB0byB0aGUgbm9kZXMK
PiBvcmRlciBpbiB0aGUgZGV2aWNlIHRyZWUsIHdoaWNoIEkgYmVsaWV2ZSBtYXkgbm90IG1hdGNo
IHRoZSBwb3J0IG51bWJlci4KPiBGb3IgaW5zdGFuY2UsIGluIHRoZSBmb2xsb3dpbmcgY2FzZQo+
IAo+IAlwb3J0cyB7Cj4gCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKPiAJCSNzaXplLWNlbGxzID0g
PDE+Owo+IAkJcG9ydEAxIHsKPiAJCQlyZWcgPSA8MT47Cj4gCQl9Owo+IAkJcG9ydEAwIHsKPiAJ
CQlyZWcgPSA8MD47Cj4gCQl9Owo+IAl9Owo+IAo+IHRoZSBmdW5jdGlvbiB3b3VsZCBJIGJlbGll
dmUgcmV0dXJuIHBvcnRAMS4gSXQgbWF5IGJlIGEgZ29vZCBpZGVhIHRvCj4gZXhwbGFpbiB0aGlz
IGluIHRoZSBkb2N1bWVudGF0aW9uLgoKSGVsbG8gTGF1cmVudCwKCkl0J3MgY29ycmVjdCB0aGF0
IHRoZSBwb3J0QDEgd2lsbCBiZSByZXR1cm5lZCBpbiB5b3VycyBleGFtcGxlLgoKSSdsbCBpbXBy
b3ZlIHRoZSBkb2MgYW5kIHRoZSBmdW5jdGlvbidzIG5hbWUgaW4gdGhlIG5leHQgcmV2aXNpb24s
IHRoYW5rCnlvdSBmb3IgdGhlIHN1Z2dlc3Rpb25zIQoKPiBEZXBlbmRpbmcgb24gaG93IHlvdSB1
c2UgdGhpcwo+IGZ1bmN0aW9uLCBpZiB5b3VyIG9ubHkgdXNlIGNhc2UgaXMgdG8gdGVzdCBmb3Ig
dGhlIHByZXNlbmNlIG9mIHBvcnQKPiBub2RlcywgaXQgbWF5IGJlIGJlc3QgdG8gcmV0dXJuIGEg
Ym9vbCBhbmQgbmFtZSBpdCBvZl9ncmFwaF9oYXNfcG9ydCgpCj4gb3Igc29tZXRoaW5nIHNpbWls
YXIuCj4gCj4+PiArewo+Pj4gKwlzdHJ1Y3QgZGV2aWNlX25vZGUgKnBvcnRzLCAqcG9ydDsKPj4+
ICsKPj4+ICsJcG9ydHMgPSBvZl9nZXRfY2hpbGRfYnlfbmFtZShub2RlLCAicG9ydHMiKTsKPj4+
ICsJaWYgKHBvcnRzKQo+Pj4gKwkJbm9kZSA9IHBvcnRzOwo+Pj4gKwo+Pj4gKwlwb3J0ID0gb2Zf
Z2V0X2NoaWxkX2J5X25hbWUobm9kZSwgInBvcnQiKTsKPj4+ICsJb2Zfbm9kZV9wdXQocG9ydHMp
Owo+Pj4gKwo+Pj4gKwlyZXR1cm4gcG9ydDsKPj4KPj4gVGhlIGltcGxlbWVudGF0aW9uIGRvZXNu
J3Qgc2VlbSB0byBtYXRjaCB0aGUgZG9jdW1lbnRhdGlvbi4gSWYgbm9kZSBpcyBhCj4+IHBvaW50
ZXIgdG8gYW4gZW5kcG9pbnQsIGl0IHNob3VsZCBub3QgaGF2ZSBhbnkgcG9ydHMgY2hpbGQuCgpS
aWdodCwgSSdsbCByZXdvcmQgdGhlIGRvYyBpbiB2OC4gVGhpcyBmdW5jdGlvbiBkb2Vzbid0IGRp
ZmZlcmVudGlhdGUKYmV0d2VlbiBzdGFydCAvIGVuZCBwb2ludHMuIEl0J3MgdXAgdG8gYSB1c2Vy
IG9mIHRoaXMgZnVuY3Rpb24gdG8gY2hlY2sKd2hldGhlciBub2RlIGlzIGVuZHBvaW50IG9yIHNv
bWV0aGluZyBlbHNlIGlmIG5lZWRlZC4KClRoYW5rIHlvdSB2ZXJ5IG11Y2ggZm9yIHRoZSBjb21t
ZW50cyEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
