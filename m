Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50425B9887
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 22:39:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC0656FDCF;
	Fri, 20 Sep 2019 20:39:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E48F36FB8E
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2019 10:14:43 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id r9so5843096edl.10
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2019 03:14:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Hjasgk/DjD1JUROz7kXE34h90cVJHQtVcYSmt8ORqnM=;
 b=Ismj8UwkTpCychC8Q3Ui6toZ7fLWEyp5H5qVCfwhd9HyIxXI9oUwdaLiV/TDtKedUF
 6fE2QTmDS5wx3y7vR1H2UeNERrCWtVjG+uPvJPajjUCIYf0+StT8LTc0LNx501bL4q1t
 V7NWYn0UfgUHV3Qo9HRZmWkqyCavaO4pc9rXSYp+OKaEnUnX2kG0EWOjS1hNemhpf9BR
 vUDdKZYFeh3OFel9rDUZPVA6CDiXJps3BEdNlZFeQ4veJfCMc8nnI7Bw5JyswQlTSCvf
 B3wlm1T75qhS77Q1BVShSgAG29JPg0Q0HNkQn+r6407JyHytcRK4ZJWNCle0pla1EBDf
 W51Q==
X-Gm-Message-State: APjAAAWHdhSc25owlw8mjMcnixwQZPueBKz6ECE/CD1Mr3VD1lHzWIID
 OqEpcjBGA8kDMglMpt2SE/BmEagS93PJ5W9sg/x/LZ+ZKQY=
X-Google-Smtp-Source: APXvYqx8/++XVqD15cX3Ink+XcYzh//k998D/dsHETYlNmGKbJTJGg9//ytq/CjW59OyR93N3bNTu/MA1/bWhfBmyZs=
X-Received: by 2002:a17:906:4c4c:: with SMTP id
 d12mr18325248ejw.174.1568974482036; 
 Fri, 20 Sep 2019 03:14:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190918110541.38124-1-roman.stratiienko@globallogic.com>
 <9229663.7SG9YZCNdo@jernej-laptop> <20190920062020.zyt5ng6cxtu6muye@gilmour>
In-Reply-To: <20190920062020.zyt5ng6cxtu6muye@gilmour>
From: Roman Stratiienko <roman.stratiienko@globallogic.com>
Date: Fri, 20 Sep 2019 13:14:30 +0300
Message-ID: <CAODwZ7sJ9g4fycde5Yk1sRYW6WuNtsgXOf34GJMma0rKMyc0QQ@mail.gmail.com>
Subject: Re: drm/sun4i: Add missing pixel formats to the vi layer
To: Maxime Ripard <mripard@kernel.org>
X-Mailman-Approved-At: Fri, 20 Sep 2019 20:39:51 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=globallogic.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Hjasgk/DjD1JUROz7kXE34h90cVJHQtVcYSmt8ORqnM=;
 b=PoEHNFkOqWu3Zc1DzPXNcCsr139HVIhuZoyA79RX13aymTCwtfWmzKjvn4+iqJpMMo
 ksODwrQNiOmh/ZFF1ueDRyEqnURsCJwzKTHjQaJyvdbhMgYXilesgm1EoF/I3iYI0B7n
 2kvU2/LJXzewYw5ZCgll8CFa1R7UEkyZhqu0CCeoYypP7F9pUu+UcRlharVmLm2OWxgo
 /2s4znvzJsqHW+tT9cs8iUQfpFnWfm47gLPC0vcV2Yc8sdoUbaZJRt0rkbTvx+9cD4Ds
 3hBFbIXYlv/Cf2OMjDtRrFyCGRCxrXTgTWl7fZ8VzE4saleFN9f4xjW9hRfRdoOY0h7w
 raTA==
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
Cc: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@siol.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgMjAsIDIwMTkgYXQgOToyMCBBTSBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gVGh1LCBTZXAgMTksIDIwMTkgYXQgMDg6NTM6MTBQTSAr
MDIwMCwgSmVybmVqIMWga3JhYmVjIHdyb3RlOgo+ID4gRG5lIHNyZWRhLCAxOC4gc2VwdGVtYmVy
IDIwMTkgb2IgMTM6MDU6NDEgQ0VTVCBqZQo+ID4gcm9tYW4uc3RyYXRpaWVua29AZ2xvYmFsbG9n
aWMuY29tIG5hcGlzYWwoYSk6Cj4gPiA+IEZyb206IFJvbWFuIFN0cmF0aWllbmtvIDxyb21hbi5z
dHJhdGlpZW5rb0BnbG9iYWxsb2dpYy5jb20+Cj4gPiA+Cj4gPiA+IEFjY29yZGluZyB0byBBbGx3
aW5uZXIgREUyLjAgU3BlY2lmaWNhdGlvbiBSRVYgMS4wLCB2aSBsYXllciBzdXBwb3J0cyB0aGUK
PiA+ID4gZm9sbG93aW5nIHBpeGVsIGZvcm1hdHM6ICBBQkdSXzg4ODgsIEFSR0JfODg4OCwgQkdS
QV84ODg4LCBSR0JBXzg4ODgKPiA+Cj4gPiBJdCdzIHRydWUgdGhhdCBERTIgVkkgbGF5ZXJzIHN1
cHBvcnQgdGhvc2UgZm9ybWF0cywgYnV0IGl0IHdvdWxkbid0IGNoYW5nZQo+ID4gYW55dGhpbmcg
YmVjYXVzZSBhbHBoYSBibGVuZGluZyBpcyBub3Qgc3VwcG9ydGVkIGJ5IHRob3NlIHBsYW5lcy4g
VGhlc2UKPiA+IGZvcm1hdHMgd2VyZSBkZWxpYmVyYXRlbHkgbGVmdCBvdXQgYmVjYXVzZSB0aGVp
ciBjb3VudGVycGFydHMgd2l0aG91dCBhbHBoYQo+ID4gZXhpc3QsIGZvciBleGFtcGxlIEFCR1I4
ODg4IDwtPiBYQkdSODg4OC4gSXQgd291bGQgYWxzbyBjb25mdXNlIHVzZXIsIHdoaWNoCj4gPiB3
b3VsZCBleHBlY3QgdGhhdCBhbHBoYSBibGVuZGluZyB3b3JrcyBpZiBmb3JtYXQgd2l0aCBhbHBo
YSBjaGFubmVsIGlzCj4gPiBzZWxlY3RlZC4KPgo+IEknbSBub3QgdG9vIGZhbWlsaWFyIHdpdGgg
dGhlIERFMiBjb2RlLCBidXQgd2h5IGlzIGFscGhhIG5vdCB3b3JraW5nCj4gaWYgdGhlIFZJIHBs
YW5lcyBzdXBwb3J0IGZvcm1hdHMgd2l0aCBhbHBoYT8KCkdvb2QgcXVlc3Rpb24uIEl0IG1lbnRp
b25lZCBpbiB0aGUgZGF0YXNoZWV0Cmh0dHBzOi8vbGludXgtc3VueGkub3JnL2ltYWdlcy83Lzdi
L0FsbHdpbm5lcl9ERTIuMF9TcGVjX1YxLjAucGRmCm9uIHBhZ2UgOTU6ICJBbGwgdWkgbGF5ZXJz
JyBhbHBoYSBpcyB1c2VsZXNzIgpBbmQgbXkgZXhwZXJpbWVudHMgcHJvdmVzIGl0LgoKTXkgYXNz
dW1wdGlvbiB0aGF0IHZpIHVzZXMgcG9zdC1wcm9jZXNzaW5nIHRoYXQgY3V0cyBvdXQgYWxwaGEg
dmFsdWVzLgoKPgo+IFRoYW5rcyEKPiBNYXhpbWUKCgoKLS0gCkJlc3QgcmVnYXJkcywKUm9tYW4g
U3RyYXRpaWVua28KR2xvYmFsIExvZ2ljIEluYy4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
