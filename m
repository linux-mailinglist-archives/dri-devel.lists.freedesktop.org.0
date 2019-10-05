Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFD7CC919
	for <lists+dri-devel@lfdr.de>; Sat,  5 Oct 2019 11:27:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 148736E364;
	Sat,  5 Oct 2019 09:27:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10F706E358;
 Sat,  5 Oct 2019 09:27:13 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id n197so18677730iod.9;
 Sat, 05 Oct 2019 02:27:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QHyW/o/CoA0o6FWw7l9fi68BR5FObERbkYSm9Sv/LZw=;
 b=igq1sDraiOMClXG+tSM9eMrjd4tMFxtYcsyaORyjmQRvo/ZEKnj0dWnQZIIT/hmM8N
 +v/rbBLm1AUQpAzO1CKuorq6umESMHM1CX2+VUfjIvpqibIV8X/XEwYNdx4OZ4uy8BeM
 6gxQN1Itz3p1VYqFkCkRY+SmDkPPBJ03HYGeiJLSJD7LCluAfmSmSshmd2h9ifIqhMEV
 ycEoQ73hM3GPB1c2f00/lpCLrO80yaOLzL2l6wUWNhFFMEzy3MxqBPO/9NyjlxkeDcrw
 YIMqy8qHk81Kgj09uZ+sRK0ZM9zIDipRXptLROOk3SuHYKzfkKm/wQSGL7GgzfSSjeuF
 /LPg==
X-Gm-Message-State: APjAAAVkcc/MOb2SEZvLJGbulW2J/AjbDBHIYkUQpLG4DhXgqd+y4vyZ
 +f+G7vG6+Xb/hySQAocnZPbkQ8AvSL3vwKGN2NQ=
X-Google-Smtp-Source: APXvYqxQRPwtXNvynpdhc7a9KaRihoxBJKX/XnRfUFHaIuxyKIaDrrUQrr9erpW1If9gz6B96vY4Vd1TkAjcDaxxel0=
X-Received: by 2002:a92:b74f:: with SMTP id c15mr20296605ilm.43.1570267632433; 
 Sat, 05 Oct 2019 02:27:12 -0700 (PDT)
MIME-Version: 1.0
References: <20191001182927.70448-1-john.stultz@linaro.org>
In-Reply-To: <20191001182927.70448-1-john.stultz@linaro.org>
From: Qiang Yu <yuq825@gmail.com>
Date: Sat, 5 Oct 2019 17:27:01 +0800
Message-ID: <CAKGbVbspHBNtEPGc_RbHdKUyrBTmQADueUSO+U+cFLUPzw0fBQ@mail.gmail.com>
Subject: Re: [PATCH] drm: lima: Add support for multiple reset lines
To: John Stultz <john.stultz@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=QHyW/o/CoA0o6FWw7l9fi68BR5FObERbkYSm9Sv/LZw=;
 b=ak2tssST16lqas6WzZIrsyK+jgUXaCDlXQpgn7BKTHgP1w2V6NpqOX5xgdjS/P4sr9
 6PQcF4bKkyG8WX+CxkwHM+btTcIh+J6GOsitVfYbS+lXF5peV8HqvKxw/aze1onW/KE2
 h/zi9f8GHgQFIJKj9CEPzWBXLzX++ii4kCzSdudTJF8qmuni1mr+yo1fPSD+esg4IfmE
 UStdgicuNNrjQOZ4j+7dgonnE9Drq8GjoseZ32RI0EriULjNR4VHFvqza+iW8scyelKa
 6O5GL9NjwG/FM45FYPANQAvig7MExsI/v4faa/xiZawUNAjCyuRG8ohcnWBaqMvUMQfD
 pQPQ==
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
Cc: lima@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMiwgMjAxOSBhdCAyOjI5IEFNIEpvaG4gU3R1bHR6IDxqb2huLnN0dWx0ekBs
aW5hcm8ub3JnPiB3cm90ZToKPgo+IEZyb206IFBldGVyIEdyaWZmaW4gPHBldGVyLmdyaWZmaW5A
bGluYXJvLm9yZz4KPgo+IFNvbWUgU29DcyBsaWtlIEhpS2V5IGhhdmUgMiByZXNldCBsaW5lcywg
c28gdXBkYXRlCj4gdG8gdXNlIHRoZSBkZXZtX3Jlc2V0X2NvbnRyb2xfYXJyYXlfKiB2YXJpYW50
IG9mIHRoZQo+IEFQSSBzbyB0aGF0IG11bHRpcGxlIHJlc2V0cyBjYW4gYmUgc3BlY2lmaWVkIGlu
IERULgo+Cj4gQ2M6IFFpYW5nIFl1IDx5dXE4MjVAZ21haWwuY29tPgo+IENjOiBEYXZpZCBBaXJs
aWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5j
aD4KPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBsaW1hQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwo+IFNpZ25lZC1vZmYtYnk6IFBldGVyIEdyaWZmaW4gPHBldGVyLmdy
aWZmaW5AbGluYXJvLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBKb2huIFN0dWx0eiA8am9obi5zdHVs
dHpAbGluYXJvLm9yZz4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV9kZXZpY2Uu
YyB8IDMgKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbGltYS9saW1hX2RldmljZS5jIGIv
ZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV9kZXZpY2UuYwo+IGluZGV4IGQ4NmI4ZDgxYTQ4My4u
ZTNlMGNhMTEzODJlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9saW1hL2xpbWFfZGV2
aWNlLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbGltYS9saW1hX2RldmljZS5jCj4gQEAgLTEw
NSw3ICsxMDUsOCBAQCBzdGF0aWMgaW50IGxpbWFfY2xrX2luaXQoc3RydWN0IGxpbWFfZGV2aWNl
ICpkZXYpCj4gICAgICAgICBpZiAoZXJyKQo+ICAgICAgICAgICAgICAgICBnb3RvIGVycm9yX291
dDA7Cj4KPiAtICAgICAgIGRldi0+cmVzZXQgPSBkZXZtX3Jlc2V0X2NvbnRyb2xfZ2V0X29wdGlv
bmFsKGRldi0+ZGV2LCBOVUxMKTsKPiArICAgICAgIGRldi0+cmVzZXQgPSBkZXZtX3Jlc2V0X2Nv
bnRyb2xfYXJyYXlfZ2V0X29wdGlvbmFsX3NoYXJlZChkZXYtPmRldik7Cj4gKwo+ICAgICAgICAg
aWYgKElTX0VSUihkZXYtPnJlc2V0KSkgewo+ICAgICAgICAgICAgICAgICBlcnIgPSBQVFJfRVJS
KGRldi0+cmVzZXQpOwo+ICAgICAgICAgICAgICAgICBpZiAoZXJyICE9IC1FUFJPQkVfREVGRVIp
Cj4gLS0KPiAyLjE3LjEKPgoKTG9va3MgZ29vZCBmb3IgbWUsIHBhdGNoIGlzOgpSZXZpZXdlZC1i
eTogUWlhbmcgWXUgPHl1cTgyNUBnbWFpbC5jb20+CgpJJ2xsIGFwcGx5IGl0IHRvIGRybS1taXNj
LW5leHQuCgpUaGFua3MsClFpYW5nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
