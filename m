Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD31347A7A
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 09:13:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45D918916A;
	Mon, 17 Jun 2019 07:13:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9939089113
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jun 2019 17:42:55 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id r7so4366539pfl.3
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jun 2019 10:42:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=VO7zaCyhtYCv5/pYPEOpaqTuj9RzI+pPqxayb3u5KrQ=;
 b=H1OlilqOKudS1P35P3++QPvyZqcq8DlEpMki4s5A+kOULT7gdich1/5H8RB8c7MlFm
 mQlYVv4+FZ5Idm6jtGzauJ6pyYOnrpYWb6OV+qjpc4rkoT2cndEMrpHjCaSdoJc0vcmn
 5+n04a24qKwHl5KqhMuUllRMaGomIpj1TT0tQhioXfUkmVLWCqHBTjmARmE0Zj8h9k/Y
 F1qhXXlQL9vx8ptM+LHcaM5hRHkyrzyCQboVsFn8JcAYl7QPAHgUQ1yRTIpqAIfFQpFT
 ezLWNVwh9iNWGKDGRYUn5eiSTSABp30AnCA3rSbHDtJyAjNbMOW7TQYbl+aAzF/JBAHI
 8lgA==
X-Gm-Message-State: APjAAAUh8ZQkM1V5exb8gzTLX+aqgcfqtnMMIghkgvAVGwqTS5EyJx6j
 U8kbRWTZUwwmxrFd3X8dOBatlw==
X-Google-Smtp-Source: APXvYqyvq8iUKBGDlzVU0jxWwFc6QWJYExh3pNkXSN2atfAMzIvwO4vh8OKBBUYkG5sVg2kbv5VUcg==
X-Received: by 2002:a17:90b:f0e:: with SMTP id
 br14mr7923991pjb.117.1560706975061; 
 Sun, 16 Jun 2019 10:42:55 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id 12sm8736073pfi.60.2019.06.16.10.42.53
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 16 Jun 2019 10:42:54 -0700 (PDT)
Date: Sun, 16 Jun 2019 10:43:41 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Brian Masney <masneyb@onstation.org>
Subject: Re: [PATCH 1/6] dt-bindings: soc: qcom: add On Chip MEMory (OCMEM)
 bindings
Message-ID: <20190616174341.GP22737@tuxbook-pro>
References: <20190616132930.6942-1-masneyb@onstation.org>
 <20190616132930.6942-2-masneyb@onstation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190616132930.6942-2-masneyb@onstation.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Approved-At: Mon, 17 Jun 2019 07:13:34 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=VO7zaCyhtYCv5/pYPEOpaqTuj9RzI+pPqxayb3u5KrQ=;
 b=E6ypAV7ah+6QPhVC+81/TmriH5kiwIW3yBefIT6/UZalvKxhpZ5qv33YYJG5Ha5pd9
 /+Bb5+4iaqzNqexvspAViIRLQ/2DjzNk17I9h9DaKbIHuN/Mb61q6wgdqPw7o0Oi23KQ
 XLYGKAhfheQYTmD7AWUEuNP219C/tfsBo4+IV9Yd0QzvQOzsXCgqWL4ApGonFglOW1gO
 uIfvQJkW+i4eWuHCQou9gMmjMukpCYUsy4bKOUyFjtnVpPDDiJtc9LKWyKTLnlzKLCvn
 +2/Drz9CSNCdfZLs7iQHwuYespDAW9ThxF56eaHQJp8tLxRDAcyNzWVbyhzc5IvXye2q
 mxVA==
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
Cc: mark.rutland@arm.com, freedreno@lists.freedesktop.org, jonathan@marek.ca,
 devicetree@vger.kernel.org, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, david.brown@linaro.org,
 agross@kernel.org, dri-devel@lists.freedesktop.org, sean@poorly.run
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuIDE2IEp1biAwNjoyOSBQRFQgMjAxOSwgQnJpYW4gTWFzbmV5IHdyb3RlOgoKPiBBZGQg
ZGV2aWNlIHRyZWUgYmluZGluZ3MgZm9yIHRoZSBPbiBDaGlwIE1lbW9yeSAoT0NNRU0pIHRoYXQg
aXMgcHJlc2VudAo+IG9uIHNvbWUgUXVhbGNvbW0gU25hcGRyYWdvbiBTb0NzLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IEJyaWFuIE1hc25leSA8bWFzbmV5YkBvbnN0YXRpb24ub3JnPgo+IC0tLQo+ICAu
Li4vYmluZGluZ3Mvc29jL3Fjb20vcWNvbSxvY21lbS55YW1sICAgICAgICAgfCA2NiArKysrKysr
KysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA2NiBpbnNlcnRpb25zKCspCj4gIGNyZWF0
ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc29jL3Fjb20v
cWNvbSxvY21lbS55YW1sCj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9zb2MvcWNvbS9xY29tLG9jbWVtLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3Mvc29jL3Fjb20vcWNvbSxvY21lbS55YW1sCj4gbmV3IGZpbGUgbW9kZSAx
MDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLjVlM2FlNjMxMWExNgo+IC0tLSAvZGV2L251bGwK
PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc29jL3Fjb20vcWNvbSxv
Y21lbS55YW1sCj4gQEAgLTAsMCArMSw2NiBAQAo+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiAoR1BMLTIuMCBPUiBCU0QtMi1DbGF1c2UpCj4gKyVZQU1MIDEuMgo+ICstLS0KPiArJGlkOiBo
dHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9zb2MvcWNvbS9xY29tLG9jbWVtLnlhbWwjCj4g
KyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+
ICsKPiArdGl0bGU6IE9uIENoaXAgTWVtb3J5IChPQ01FTSkgdGhhdCBpcyBwcmVzZW50IG9uIHNv
bWUgUXVhbGNvbW0gU25hcGRyYWdvbiBTb0NzLgo+ICsKPiArbWFpbnRhaW5lcnM6Cj4gKyAgLSBC
cmlhbiBNYXNuZXkgPG1hc25leWJAb25zdGF0aW9uLm9yZz4KPiArCj4gK2Rlc2NyaXB0aW9uOiB8
Cj4gKyAgVGhlIE9uIENoaXAgTWVtb3J5IChPQ01FTSkgYWxsb2NhdG9yIGFsbG93cyB2YXJpb3Vz
IGNsaWVudHMgdG8gYWxsb2NhdGUgbWVtb3J5Cj4gKyAgZnJvbSBPQ01FTSBiYXNlZCBvbiBwZXJm
b3JtYW5jZSwgbGF0ZW5jeSBhbmQgcG93ZXIgcmVxdWlyZW1lbnRzLiBUaGlzIGlzCj4gKyAgdHlw
aWNhbGx5IHVzZWQgYnkgdGhlIEdQVSwgY2FtZXJhL3ZpZGVvLCBhbmQgYXVkaW8gY29tcG9uZW50
cyBvbiBzb21lCj4gKyAgU25hcGRyYWdvbiBTb0NzLgo+ICsKPiArcHJvcGVydGllczoKPiArICBj
b21wYXRpYmxlOgo+ICsgICAgY29uc3Q6IHFjb20sb2NtZW0tbXNtODk3NAoKcWNvbSxtc204OTc0
LW9jbWVtCgo+ICsKPiArICByZWc6Cj4gKyAgICBpdGVtczoKPiArICAgICAgLSBkZXNjcmlwdGlv
bjogQ29udHJvbCByZWdpc3RlcnMKPiArICAgICAgLSBkZXNjcmlwdGlvbjogT0NNRU0gYWRkcmVz
cyByYW5nZQo+ICsKPiArICByZWctbmFtZXM6Cj4gKyAgICBpdGVtczoKPiArICAgICAgLSBjb25z
dDogb2NtZW1fY3RybF9waHlzaWNhbAo+ICsgICAgICAtIGNvbnN0OiBvY21lbV9waHlzaWNhbAoK
RHJvcCB0aGUgIl9waHlzaWNhbCIgcGFydCwgaXQncyBnaXZlbiBieSB0aGlzIGJlaW5nICJyZWci
LgoKUmVnYXJkcywKQmpvcm4KCj4gKwo+ICsgIGNsb2NrczoKPiArICAgIGl0ZW1zOgo+ICsgICAg
ICAtIGRlc2NyaXB0aW9uOiBDb3JlIGNsb2NrCj4gKyAgICAgIC0gZGVzY3JpcHRpb246IEludGVy
ZmFjZSBjbG9jawo+ICsKPiArICBjbG9jay1uYW1lczoKPiArICAgIGl0ZW1zOgo+ICsgICAgICAt
IGNvbnN0OiBjb3JlCj4gKyAgICAgIC0gY29uc3Q6IGlmYWNlCj4gKwo+ICtyZXF1aXJlZDoKPiAr
ICAtIGNvbXBhdGlibGUKPiArICAtIHJlZwo+ICsgIC0gcmVnLW5hbWVzCj4gKyAgLSBjbG9ja3MK
PiArICAtIGNsb2NrLW5hbWVzCj4gKwo+ICtleGFtcGxlczoKPiArICAtIHwKPiArICAgICAgI2lu
Y2x1ZGUgPGR0LWJpbmRpbmdzL2Nsb2NrL3Fjb20scnBtY2MuaD4KPiArICAgICAgI2luY2x1ZGUg
PGR0LWJpbmRpbmdzL2Nsb2NrL3Fjb20sbW1jYy1tc204OTc0Lmg+Cj4gKwo+ICsgICAgICBvY21l
bTogb2NtZW1AZmRkMDAwMDAgewo+ICsgICAgICAgIGNvbXBhdGlibGUgPSAicWNvbSxvY21lbS1t
c204OTc0IjsKPiArCj4gKyAgICAgICAgcmVnID0gPDB4ZmRkMDAwMDAgMHgyMDAwPiwKPiArICAg
ICAgICAgICAgICAgPDB4ZmVjMDAwMDAgMHgxODAwMDA+Owo+ICsgICAgICAgIHJlZy1uYW1lcyA9
ICJvY21lbV9jdHJsX3BoeXNpY2FsIiwKPiArICAgICAgICAgICAgICAgICAgICAib2NtZW1fcGh5
c2ljYWwiOwo+ICsKPiArICAgICAgICBjbG9ja3MgPSA8JnJwbWNjIFJQTV9TTURfT0NNRU1HWF9D
TEs+LAo+ICsgICAgICAgICAgICAgICAgICA8Jm1tY2MgT0NNRU1DWF9PQ01FTU5PQ19DTEs+Owo+
ICsgICAgICAgIGNsb2NrLW5hbWVzID0gImNvcmUiLAo+ICsgICAgICAgICAgICAgICAgICAgICAg
ImlmYWNlIjsKPiArICAgICAgfTsKPiAtLSAKPiAyLjIwLjEKPiAKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
