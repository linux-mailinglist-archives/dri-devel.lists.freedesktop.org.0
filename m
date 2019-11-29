Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B11EA10D7D6
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2019 16:24:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09B096E92C;
	Fri, 29 Nov 2019 15:24:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96AB26E930
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 15:24:28 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id i12so35564291wrn.11
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 07:24:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=HZxTVlwR9S+LHDcDnd3r+LpNXkrw15HFfQVXjG7J9/E=;
 b=WNdAdXLmh2J4Pzd71SGBMU9mlaS5Agzksl6FhWUnyM2MH916FZVdU4bfKtH2y6nNyZ
 RQR0mz+gi//U36TTDBsgNi+uL75w8SxqDWHWmCtgXGZNdi/qU90QOnGvvtMh+rdbSveJ
 5I6bvg69wclVIx0tRPftQ3bSMZNIaEOXTdnV2ZkXf3HB8BVvAbv0c0X6pnSJscSKp8qe
 UcQPnMuud1ZwYwQsMVjPZytKdBbwQgPKWQaXurZgZ/+bBC5ofkoL1xHJC2a/L+IcthPQ
 II6rUfH+36gSUlU1I+FY6fE03HRc7ADnzWxW5C4fXfK78aaATZWJhuHkhfsK5n+eDTU1
 VfsQ==
X-Gm-Message-State: APjAAAUPPJwvcHELAdJFozp+nlgx1euxBV3yCRRZh/jsbQDsfsErFuac
 3WQFMmtELfOFpnTzaXDKQVNdMg==
X-Google-Smtp-Source: APXvYqwGU0CdNMNQU6hbCMvLZUJQQoMbyV6IyjQC0/iMA89Z39aGV++Py6TWgBu+WbtfhNBIMHmCqw==
X-Received: by 2002:a5d:66cf:: with SMTP id k15mr54298695wrw.38.1575041067222; 
 Fri, 29 Nov 2019 07:24:27 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id t1sm5538037wma.43.2019.11.29.07.24.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Nov 2019 07:24:25 -0800 (PST)
Date: Fri, 29 Nov 2019 16:24:24 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v2 14/14] auxdisplay: constify fb ops
Message-ID: <20191129152424.GG624164@phenom.ffwll.local>
References: <cover.1575022735.git.jani.nikula@intel.com>
 <94a33cf0a587e803bcadcf80e8152eac9b196f34.1575022735.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <94a33cf0a587e803bcadcf80e8152eac9b196f34.1575022735.git.jani.nikula@intel.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=HZxTVlwR9S+LHDcDnd3r+LpNXkrw15HFfQVXjG7J9/E=;
 b=Yh5TTeBbDxmHyDVsUFzNoO+GyiDsMJHi236XMedRdwvw9iBXjsDT1ume7QEsbMHoRW
 z72BCDapANcOkUwKIO+h2t4pzNCXs7KOBk7shGlo+m1jdUMSPP+p7D/jCXACtUVa57zE
 QgN5gru4OfPkhEOUWa/052MVuk9GozTbmq770=
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
Cc: Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>,
 linux-fbdev@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Robin van der Gracht <robin@protonic.nl>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMjksIDIwMTkgYXQgMTI6Mjk6NDRQTSArMDIwMCwgSmFuaSBOaWt1bGEgd3Jv
dGU6Cj4gTm93IHRoYXQgdGhlIGZib3BzIG1lbWJlciBvZiBzdHJ1Y3QgZmJfaW5mbyBpcyBjb25z
dCwgd2UgY2FuIHN0YXJ0Cj4gbWFraW5nIHRoZSBvcHMgY29uc3QgYXMgd2VsbC4KPiAKPiBDYzog
TWlndWVsIE9qZWRhIFNhbmRvbmlzIDxtaWd1ZWwub2plZGEuc2FuZG9uaXNAZ21haWwuY29tPgo+
IENjOiBSb2JpbiB2YW4gZGVyIEdyYWNodCA8cm9iaW5AcHJvdG9uaWMubmw+Cj4gU2lnbmVkLW9m
Zi1ieTogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4KPiAtLS0KPiAgZHJpdmVy
cy9hdXhkaXNwbGF5L2NmYWcxMjg2NGJmYi5jIHwgMiArLQo+ICBkcml2ZXJzL2F1eGRpc3BsYXkv
aHQxNmszMy5jICAgICAgfCAyICstCj4gIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2F1eGRpc3BsYXkvY2Zh
ZzEyODY0YmZiLmMgYi9kcml2ZXJzL2F1eGRpc3BsYXkvY2ZhZzEyODY0YmZiLmMKPiBpbmRleCA0
MDc0ODg2YjdiYzguLjIwMDIyOTFhYjMzOCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2F1eGRpc3Bs
YXkvY2ZhZzEyODY0YmZiLmMKPiArKysgYi9kcml2ZXJzL2F1eGRpc3BsYXkvY2ZhZzEyODY0YmZi
LmMKCk9oLCBhbm90aGVyIGRpc3BsYXkgc3Vic3lzdGVtPyBJbnRyaWd1aW5nIC4uLgoKUmV2aWV3
ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cgo+IEBAIC01Nyw3
ICs1Nyw3IEBAIHN0YXRpYyBpbnQgY2ZhZzEyODY0YmZiX21tYXAoc3RydWN0IGZiX2luZm8gKmlu
Zm8sIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQo+ICAJcmV0dXJuIHZtX21hcF9wYWdlc196
ZXJvKHZtYSwgJnBhZ2VzLCAxKTsKPiAgfQo+ICAKPiAtc3RhdGljIHN0cnVjdCBmYl9vcHMgY2Zh
ZzEyODY0YmZiX29wcyA9IHsKPiArc3RhdGljIGNvbnN0IHN0cnVjdCBmYl9vcHMgY2ZhZzEyODY0
YmZiX29wcyA9IHsKPiAgCS5vd25lciA9IFRISVNfTU9EVUxFLAo+ICAJLmZiX3JlYWQgPSBmYl9z
eXNfcmVhZCwKPiAgCS5mYl93cml0ZSA9IGZiX3N5c193cml0ZSwKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9hdXhkaXNwbGF5L2h0MTZrMzMuYyBiL2RyaXZlcnMvYXV4ZGlzcGxheS9odDE2azMzLmMK
PiBpbmRleCBhMmZjZGU1ODJlMmEuLmQ5NTFkNTRiMjZmNSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2F1eGRpc3BsYXkvaHQxNmszMy5jCj4gKysrIGIvZHJpdmVycy9hdXhkaXNwbGF5L2h0MTZrMzMu
Ywo+IEBAIC0yMjgsNyArMjI4LDcgQEAgc3RhdGljIGludCBodDE2azMzX21tYXAoc3RydWN0IGZi
X2luZm8gKmluZm8sIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQo+ICAJcmV0dXJuIHZtX21h
cF9wYWdlc196ZXJvKHZtYSwgJnBhZ2VzLCAxKTsKPiAgfQo+ICAKPiAtc3RhdGljIHN0cnVjdCBm
Yl9vcHMgaHQxNmszM19mYl9vcHMgPSB7Cj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZmJfb3BzIGh0
MTZrMzNfZmJfb3BzID0gewo+ICAJLm93bmVyID0gVEhJU19NT0RVTEUsCj4gIAkuZmJfcmVhZCA9
IGZiX3N5c19yZWFkLAo+ICAJLmZiX3dyaXRlID0gZmJfc3lzX3dyaXRlLAo+IC0tIAo+IDIuMjAu
MQo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4g
ZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9u
Cmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
