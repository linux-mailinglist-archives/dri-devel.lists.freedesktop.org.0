Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4654C45CCF
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 14:27:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FD57897FB;
	Fri, 14 Jun 2019 12:27:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 794D9897FB
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 12:27:48 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id h10so2237716ljg.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 05:27:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k0QRDXLHUntxOov7zrayFNvinwKPTFOzvVDJZpJssAo=;
 b=cNhU6ZHPtUTl8h1nGb1bB0Ukd+GUBlwudoyOw9sv4bpqf7y9ilq+qrNNLgD6PWlY7/
 Hp6GYCC2HzrgQxhPWmBLTGzutUdPs28mLz/tZjxM9oTr7+/tcGQgJiPjSX3IGV+U2/NM
 7DFGwETsa01H5uaxouJw9FWvCM2YO0SDik7RLr9RwODEb0zoGSTmPqyyBy8XuEFC55DE
 Y8nyHIzzlPWMmo60kDY8mtV56snrAJuh/DcZFvx/fGkGp7HSKcWEaVhOWDxu/Au/WmNo
 VwBKutrQ6A+w7lCQknhMC2ubnv8kyE2jlRsVzrkdOgE+LHfEJjD98noewCkwQ6Uh08xs
 D5Kg==
X-Gm-Message-State: APjAAAW3Pni0QVUyskqJcjdrB8lBRoYsW4Lan3qjyAHq1WrB+NxbnVKq
 MlWtiqJRahuJ8FuxX9gGEFu7gbPAoOgSOgLUr4M=
X-Google-Smtp-Source: APXvYqzbXK8JHzAnv53oPJ62nUc83fkXffrgUkMyteZ/yr3Rwt4+r4Pzv7+Y+xrxdQ/u+mSg5m5FhnmjOv3EoYULcas=
X-Received: by 2002:a2e:63c4:: with SMTP id s65mr40810611lje.211.1560515266728; 
 Fri, 14 Jun 2019 05:27:46 -0700 (PDT)
MIME-Version: 1.0
References: <1560513063-24995-1-git-send-email-robert.chiras@nxp.com>
 <1560513063-24995-3-git-send-email-robert.chiras@nxp.com>
In-Reply-To: <1560513063-24995-3-git-send-email-robert.chiras@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 14 Jun 2019 09:27:49 -0300
Message-ID: <CAOMZO5BAborMvk=4cgreWKX6rJjK-237me98dM1dDV53oUnExQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/panel: Add support for Raydium RM67191 panel
 driver
To: Robert Chiras <robert.chiras@nxp.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=k0QRDXLHUntxOov7zrayFNvinwKPTFOzvVDJZpJssAo=;
 b=tXIvJrLTtd0fKEFBWbapSx/XhIgzyWMKMVSi8DJz19bpqqEc9DGRLaV9ZOhF+vXRme
 0NSfsmWlHItyo9ypwszqm49k7rivvv2lMI+VU8Dl7DgUXmVYYecRuGRgs+dXEDfAf7+1
 kY9grNndKXLh8EwpTkJuNIP4OGZ9Gp5GtBZ67G8UQexVZthJBxIvXWcWHpTDaLvKZvNr
 5apddKLqIehHzt+lU4Ycgwq1yU2ZJDV/UCo3noUeAG4n7DLnjzVMWo8gRm5v46jqbHd7
 0LQ65jl2ZCxiGdV+XyNHKZ4Z8pUEUKAxT/JPAq3QW4ITVyFG80Z1ViZIllsdZrJAIwgp
 zA9w==
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iZXJ0LAoKT24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgODo1MiBBTSBSb2JlcnQgQ2hpcmFz
IDxyb2JlcnQuY2hpcmFzQG54cC5jb20+IHdyb3RlOgoKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXJheWRpdW0tcm02NzE5MS5jCj4gQEAgLTAsMCAr
MSw3MzAgQEAKPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKPiArLyoKPiAr
ICogaS5NWCBkcm0gZHJpdmVyIC0gUmF5ZGl1bSBNSVBJLURTSSBwYW5lbCBkcml2ZXIKPiArICoK
PiArICogQ29weXJpZ2h0IChDKSAyMDE3IE5YUAo+ICsgKgo+ICsgKiBUaGlzIHByb2dyYW0gaXMg
ZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yCj4gKyAqIG1vZGlm
eSBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlCj4g
KyAqIGFzIHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIg
dmVyc2lvbiAyCj4gKyAqIG9mIHRoZSBMaWNlbnNlLCBvciAoYXQgeW91ciBvcHRpb24pIGFueSBs
YXRlciB2ZXJzaW9uLgo+ICsgKiBUaGlzIHByb2dyYW0gaXMgZGlzdHJpYnV0ZWQgaW4gdGhlIGhv
cGUgdGhhdCBpdCB3aWxsIGJlIHVzZWZ1bCwKPiArICogYnV0IFdJVEhPVVQgQU5ZIFdBUlJBTlRZ
OyB3aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFudHkgb2YKPiArICogTUVSQ0hBTlRBQklM
SVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgU2VlIHRoZQo+ICsgKiBH
TlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmb3IgbW9yZSBkZXRhaWxzLgoKTm8gbmVlZCBmb3Ig
dGhpcyB0ZXh0IGFzIHlvdSBhcmUgdXNpbmcgU1BEWCB0YWcuCgo+ICtzdGF0aWMgaW50IGNvbG9y
X2Zvcm1hdF9mcm9tX2RzaV9mb3JtYXQoZW51bSBtaXBpX2RzaV9waXhlbF9mb3JtYXQgZm9ybWF0
KQo+ICt7Cj4gKyAgICAgICBzd2l0Y2ggKGZvcm1hdCkgewo+ICsgICAgICAgY2FzZSBNSVBJX0RT
SV9GTVRfUkdCNTY1Ogo+ICsgICAgICAgICAgICAgICByZXR1cm4gMHg1NTsKPiArICAgICAgIGNh
c2UgTUlQSV9EU0lfRk1UX1JHQjY2NjoKPiArICAgICAgIGNhc2UgTUlQSV9EU0lfRk1UX1JHQjY2
Nl9QQUNLRUQ6Cj4gKyAgICAgICAgICAgICAgIHJldHVybiAweDY2Owo+ICsgICAgICAgY2FzZSBN
SVBJX0RTSV9GTVRfUkdCODg4Ogo+ICsgICAgICAgICAgICAgICByZXR1cm4gMHg3NzsKCkNvdWxk
IHlvdSB1c2UgZGVmaW5lcyBmb3IgdGhlc2UgbWFnaWMgMHg1NSwgMHg2NiBhbmQgMHg3NyBudW1i
ZXJzPwoKPiArc3RhdGljIGludCByYWRfcGFuZWxfcHJlcGFyZShzdHJ1Y3QgZHJtX3BhbmVsICpw
YW5lbCkKPiArewo+ICsgICAgICAgc3RydWN0IHJhZF9wYW5lbCAqcmFkID0gdG9fcmFkX3BhbmVs
KHBhbmVsKTsKPiArCj4gKyAgICAgICBpZiAocmFkLT5wcmVwYXJlZCkKPiArICAgICAgICAgICAg
ICAgcmV0dXJuIDA7Cj4gKwo+ICsgICAgICAgaWYgKHJhZC0+cmVzZXQpIHsKPiArICAgICAgICAg
ICAgICAgZ3Bpb2Rfc2V0X3ZhbHVlKHJhZC0+cmVzZXQsIDApOwo+ICsgICAgICAgICAgICAgICB1
c2xlZXBfcmFuZ2UoNTAwMCwgMTAwMDApOwo+ICsgICAgICAgICAgICAgICBncGlvZF9zZXRfdmFs
dWUocmFkLT5yZXNldCwgMSk7Cj4gKyAgICAgICAgICAgICAgIHVzbGVlcF9yYW5nZSgyMDAwMCwg
MjUwMDApOwoKVGhpcyBkb2VzIG5vdCBsb29rIGNvcnJlY3QuCgpUaGUgY29ycmVjdCB3YXkgdG8g
ZG8gYSByZXNldCB3aXRoIGdwaW9kIEFQSSBpczoKCiBncGlvZF9zZXRfdmFsdWUocmFkLT5yZXNl
dCwgMSk7CgpkZWxheQoKZ3Bpb2Rfc2V0X3ZhbHVlKHJhZC0+cmVzZXQsIDApOwoKSSBkb24ndCBo
YXZlIHRoZSBkYXRhc2hlZXQgZm9yIHRoZSBSTTY3MTkxIHBhbmVsLCBidXQgSSBhc3N1bWUgdGhl
CnJlc2V0IEdQSU8gaXMgYWN0aXZlIGxvdy4KClNpbmNlIHlvdSBpbnZlcnRlZCB0aGUgcG9sYXJp
dHkgaW4gdGhlIGR0cyBhbmQgaW5zaWRlIHRoZSBkcml2ZXIsIHlvdQpnb3QgaXQgcmlnaHQgYnkg
YWNjaWRlbnQuCgpZb3UgY291bGQgYWxzbyBjb25zaWRlciB1c2luZyBncGlvZF9zZXRfdmFsdWVf
Y2Fuc2xlZXAoKSB2YXJpYW50Cmluc3RlYWQgYmVjYXVzZSB0aGUgR1BJTyByZXNldCBjb3VsZCBi
ZSBwcm92aWRlZCBieSBhbiBJMkMgR1BJTwpleHBhbmRlciwgZm9yIGV4YW1wbGUuCgpBbHNvLCB3
aGVuIHNsZWVwaW5nIGZvciBtb3JlIHRoYW4gMTBtcywgbXNsZWVwIGlzIGEgYmV0dGVyIGZpdCBh
cyBwZXIKRG9jdW1lbnRhdGlvbi90aW1lcnMvdGltZXJzLWhvd3RvLnR4dC4KCj4gKyAgICAgICBp
ZiAocmFkLT5yZXNldCkgewo+ICsgICAgICAgICAgICAgICBncGlvZF9zZXRfdmFsdWUocmFkLT5y
ZXNldCwgMCk7Cj4gKyAgICAgICAgICAgICAgIHVzbGVlcF9yYW5nZSgxNTAwMCwgMTcwMDApOwo+
ICsgICAgICAgICAgICAgICBncGlvZF9zZXRfdmFsdWUocmFkLT5yZXNldCwgMSk7Cj4gKyAgICAg
ICB9CgpBbm90aGVyIHJlc2V0PwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
