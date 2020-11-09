Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A382AC1EA
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 18:18:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5272689B42;
	Mon,  9 Nov 2020 17:18:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E05F889B42
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 17:18:01 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id j7so2289074wrp.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Nov 2020 09:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=pupQObYmQEtHTXVN7G7VurpDOLGGYw2zG5xqU4Y7meA=;
 b=Rgu23x6Wa5spdDHboUtOo7j/CazI9cyGc5s5MjjvOIiGx49lA7jsVIybw8c9300iEl
 IHbNRpcF/glLYizIlMVmP73hLsvF7kiqYx+WlSCwJkiT4BwVDFBOLKFmQtl6XpPBHbjS
 6vW2c66R3+hEMIe2mRWcg8mvI+LPkyqQzex245p9wJGAnTWuHBb95AUrr9b6cxYB/2wU
 jrdwFa8Zy1PNeRg4cf8GZr/+sfnVRtOHVzoeSl6EvtNWdQLjFwE+4WuUTrZjK1NAqtGx
 vOmdXnMP+gxGR3v4EdZJ6zuEqbMqDdsQnoiM7xFUAiQPYpjH+/P1XkmmU5jxvKKgUcC0
 TG/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=pupQObYmQEtHTXVN7G7VurpDOLGGYw2zG5xqU4Y7meA=;
 b=KQk0wfe/30BFc7xSCWtgBfrcbmLA6EeoMIYxkvoAfxcQwlN7d0e8JZmJmeiLSkzlja
 FXfkgZbWbWhimKxexl/JOsfy9F6MgsxfkgZaj5I8DlB6mPATMEmWlG98kpXG70VzryEx
 sp+si8EDOOKQd7GtXgOgrF4p380Nrm30jOkol5sRfujvZQtfFAt3R88kpyFPQCfECF8M
 qvcwgwM+xT2sSAWcmQYiB2cDD8grMhxfErOHqIdAuutzJZF7rpgSFxEQu4shF2+RDFQl
 YwkT12PRdoPC7j94jUJ/VufKDrTmW7ePOj71IsYwzBhUYl+al/KqZKE3zMKeJLWPtwXA
 LzHg==
X-Gm-Message-State: AOAM5326kb8nrE3dRXe25wiZ6mUzk3dIDt4vLcw+M/m3C+550NgDWpKe
 tQdp9wcTOACg6Fg6fl6r0dDZgA==
X-Google-Smtp-Source: ABdhPJxVpcnhhKw4+HYsJ4c7hCat9vFVLF5ci5YzUbDbVnH7wGQHjAINH4wGbFi2Tru601OdJ/MOCg==
X-Received: by 2002:a5d:4ac1:: with SMTP id y1mr19713270wrs.27.1604942280560; 
 Mon, 09 Nov 2020 09:18:00 -0800 (PST)
Received: from dell ([91.110.221.180])
 by smtp.gmail.com with ESMTPSA id n123sm55069wmn.38.2020.11.09.09.17.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 09:17:59 -0800 (PST)
Date: Mon, 9 Nov 2020 17:17:56 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 14/19] gpu: drm: selftests: test-drm_dp_mst_helper: Place
 'struct drm_dp_sideband_msg_req_body' onto the heap
Message-ID: <20201109171756.GA2063125@dell>
References: <20201105144517.1826692-1-lee.jones@linaro.org>
 <20201105144517.1826692-15-lee.jones@linaro.org>
 <20201109151937.GF6112@intel.com> <20201109161258.GX2063125@dell>
 <20201109162015.GH6112@intel.com> <20201109164004.GZ2063125@dell>
 <20201109170324.GJ6112@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201109170324.GJ6112@intel.com>
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
Cc: David Airlie <airlied@linux.ie>, David Francis <David.Francis@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAwOSBOb3YgMjAyMCwgVmlsbGUgU3lyasOkbMOkIHdyb3RlOgoKPiBPbiBNb24sIE5v
diAwOSwgMjAyMCBhdCAwNDo0MDowNFBNICswMDAwLCBMZWUgSm9uZXMgd3JvdGU6Cj4gPiBPbiBN
b24sIDA5IE5vdiAyMDIwLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6Cj4gPiAKPiA+ID4gT24gTW9u
LCBOb3YgMDksIDIwMjAgYXQgMDQ6MTI6NThQTSArMDAwMCwgTGVlIEpvbmVzIHdyb3RlOgo+ID4g
PiA+IE9uIE1vbiwgMDkgTm92IDIwMjAsIFZpbGxlIFN5cmrDpGzDpCB3cm90ZToKPiA+ID4gPiAK
PiA+ID4gPiA+IE9uIFRodSwgTm92IDA1LCAyMDIwIGF0IDAyOjQ1OjEyUE0gKzAwMDAsIExlZSBK
b25lcyB3cm90ZToKPiA+ID4gPiA+ID4gVGhlIHN0YWNrIGlzIHRvbyBmdWxsLgo+ID4gPiA+ID4g
PiAKPiA+ID4gPiA+ID4gRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5p
bmcocyk6Cj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiAgZHJpdmVycy9ncHUvZHJtL3NlbGZ0ZXN0
cy90ZXN0LWRybV9kcF9tc3RfaGVscGVyLmM6IEluIGZ1bmN0aW9uIOKAmHNpZGViYW5kX21zZ19y
ZXFfZW5jb2RlX2RlY29kZeKAmToKPiA+ID4gPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9zZWxmdGVz
dHMvdGVzdC1kcm1fZHBfbXN0X2hlbHBlci5jOjE2MToxOiB3YXJuaW5nOiB0aGUgZnJhbWUgc2l6
ZSBvZiAxMTc2IGJ5dGVzIGlzIGxhcmdlciB0aGFuIDEwMjQgYnl0ZXMgWy1XZnJhbWUtbGFyZ2Vy
LXRoYW49XQo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGll
ZEBsaW51eC5pZT4KPiA+ID4gPiA+ID4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5j
aD4KPiA+ID4gPiA+ID4gQ2M6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+Cj4gPiA+ID4g
PiA+IENjOiBEYXZpZCBGcmFuY2lzIDxEYXZpZC5GcmFuY2lzQGFtZC5jb20+Cj4gPiA+ID4gPiA+
IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiA+ID4gPiA+IFNpZ25lZC1v
ZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Cj4gPiA+ID4gPiA+IC0tLQo+
ID4gPiA+ID4gPiAgLi4uL2RybS9zZWxmdGVzdHMvdGVzdC1kcm1fZHBfbXN0X2hlbHBlci5jICAg
IHwgMjkgKysrKysrKysrKysrLS0tLS0tLQo+ID4gPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDE4
IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zZWxmdGVzdHMvdGVzdC1kcm1fZHBfbXN0X2hl
bHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL3NlbGZ0ZXN0cy90ZXN0LWRybV9kcF9tc3RfaGVscGVy
LmMKPiA+ID4gPiA+ID4gaW5kZXggMWQ2OTZlYzAwMWNmZi4uMGE1Mzk0NTZmNjg2NCAxMDA2NDQK
PiA+ID4gPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3NlbGZ0ZXN0cy90ZXN0LWRybV9kcF9t
c3RfaGVscGVyLmMKPiA+ID4gPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3NlbGZ0ZXN0cy90
ZXN0LWRybV9kcF9tc3RfaGVscGVyLmMKPiA+ID4gPiA+ID4gQEAgLTEyMCw0NCArMTIwLDUxIEBA
IHNpZGViYW5kX21zZ19yZXFfZXF1YWwoY29uc3Qgc3RydWN0IGRybV9kcF9zaWRlYmFuZF9tc2df
cmVxX2JvZHkgKmluLAo+ID4gPiA+ID4gPiAgc3RhdGljIGJvb2wKPiA+ID4gPiA+ID4gIHNpZGVi
YW5kX21zZ19yZXFfZW5jb2RlX2RlY29kZShzdHJ1Y3QgZHJtX2RwX3NpZGViYW5kX21zZ19yZXFf
Ym9keSAqaW4pCj4gPiA+ID4gPiA+ICB7Cj4gPiA+ID4gPiA+IC0Jc3RydWN0IGRybV9kcF9zaWRl
YmFuZF9tc2dfcmVxX2JvZHkgb3V0ID0gezB9Owo+ID4gPiA+ID4gPiArCXN0cnVjdCBkcm1fZHBf
c2lkZWJhbmRfbXNnX3JlcV9ib2R5ICpvdXQ7Cj4gPiA+ID4gPiAKPiA+ID4gPiA+IEhvdyBiaWcg
aXMgaXQ/IEFuZCB3aHkgaXMgaXQgdGhhdCBiaWc/Cj4gPiA+ID4gCj4gPiA+ID4gSXQncyBhIHN0
cnVjdCBvZiBhIHVuaW9uIG9mIHN0cnVjdHMuCj4gPiA+ID4gCj4gPiA+ID4gQW5kIGl0J3MgYWxs
IGFsbG9jYXRlZCBvbiB0aGUgc3RhY2suICBCYWQgbmV3cyEKPiA+ID4gCj4gPiA+IFRoYXQgZG9l
c24ndCBhbnN3ZXIgbXkgcXVlc3Rpb25zLgo+ID4gCj4gPiBJdCBhbnN3ZXJzIHRoZSBzZWNvbmQg
cXVlc3Rpb24uCj4gCj4gTm90IHJlYWxseS4gQSBjb21iaW5hdGlvbiBvZiBzdHJ1Y3RzIGFuZCB1
bmlvbnMgY291bGQgYmUKPiBwcmV0dHkgbXVjaCBhbnkgc2l6ZS4KPiAKPiA+IAo+ID4gVGhlIGFu
c3dlciB0byB0aGUgZmlyc3QgcXVlc3Rpb24geW91IGNhbiBgZ3JlcGAgZm9yIHlvdXJzZWxmLiA7
KQo+IAo+IEkgd291bGQgcmF0aGVyIHJ1biBwYWhvbGUgb24gaXQuIEJ1dCB3aHkgd291bGQgeW91
IHJlcXVpcmUKPiByZXZpZXdlcnMgdG8ganVtcCB0aHJvdWdoIHN1Y2ggZXh0cmEgaG9vcHMgd2hl
biB5b3UgY291bGQKPiBqdXN0IHB1dCB0aGF0IGluZm9ybWF0aW9uIGludG8gdGhlIGNvbW1pdCBt
ZXNzYWdlPyBXaXRoIHRoYXQKPiBhbnlvbmUgY291bGQgcmV2aWV3IHRoaXMgd2l0aG91dCBoYXZp
bmcgdG8gZG8gYSBsb3Qgb2YgZXh0cmEKPiB3b3JrLgoKQmVjYXVzZSB0aGUgZXhhY3QgbnVtYmVy
cyBhcmVuJ3QgYWxsIHRoYXQgcmVsZXZhbnQuCgpCZWZvcmUgdGhlIHBhdGNoIGlzIGFwcGxpZWQs
IHRoZSBsb2NhbCB2YXJpYWJsZXMgdGFrZSB0aGUgZnJhbWUgc2l6ZQpvdmVyIHRoZSBhY2NlcHRl
ZCB0aHJlc2hvbGQuICBUaGUgcGF0Y2ggYnJpbmdzIHRoZSBzaXplIGJhY2sgZG93biB0bwphbiBh
Y2NlcHRlZCBsZXZlbC4KCkknbSBub3QgYWN0dWFsbHkgYXdhcmUgb2YgdGhlIGV4YWN0IG51bWJl
cnMsIGJ1dCB5b3UgY2FuIHNlZSBieSB0YWtpbmcKYSBxdWljayBsb29rIHRoYXQgJ3N0cnVjdCBk
cm1fZHBfc2lkZWJhbmRfbXNnX3JlcV9ib2R5JyBpcyBsYXJnZQplbm91Z2ggdG8gbWFrZSBhIHNp
Z25pZmljYW50IGltcHJvdmVtZW50IG9uY2Ugc2hpZnRlZCBvbnRvIHRoZSBoZWFwLgoKLS0gCkxl
ZSBKb25lcyBb5p2O55C85pavXQpTZW5pb3IgVGVjaG5pY2FsIExlYWQgLSBEZXZlbG9wZXIgU2Vy
dmljZXMKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFybSBTb0NzCkZv
bGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
