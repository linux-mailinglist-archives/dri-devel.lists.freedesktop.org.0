Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D93DD14489
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 08:42:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39C4C891FD;
	Mon,  6 May 2019 06:42:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BCC8891CB
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 06:42:49 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id q10so10059553ljc.6
 for <dri-devel@lists.freedesktop.org>; Sun, 05 May 2019 23:42:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kczJA0awqdoA0ORNL2OLUesgvZQuju/puNenMWJZnJs=;
 b=IRL2aTSIi7OFmAkpiZJY09rIRercBFhOm+2kiuAgDE4WHXivAbc3LiU3OG5yzlCRoq
 ND5sOfiUP4Ra/Z/CUGK3SAFwoCZsZzd/Ijv7mjPVjFGHjhhPc6cC9B/KNs9zJ6tItcdb
 9aHt6w4feE0LlKIDMaZG4SwLkCzbTo9gQjY1ZfL5CY0xt6E4AHpHCdPazSYEINQcGn0V
 QJb7/E4frUSLm1eWXS2WpM72m/r+jfAHpqSCu4DN5o3ImZBfSuT1OOVLz/lhwfOQrKxx
 PHio++5pbroXPvPWE8Dhil1OjwoQCDQW9aeV/uqahc8uPfO0wws7pAUWBj6capbjq0Lg
 YibQ==
X-Gm-Message-State: APjAAAV+rC5n0hMGQZbzz7lumVvDFrEWytAIXYySP0bYmwba9lRtHg69
 JimVXtPxxZzFPsOXHDb5/u6IUnm4Ism4YK48oYiv0g==
X-Google-Smtp-Source: APXvYqzECzkqvuxznKULj5aWJNaUw2MEkVcg4fgbtysnQxn5pELNdiFkFl5c+9+UvZ55+uPDQ5wZRCiIcbF2LmUHVLU=
X-Received: by 2002:a2e:988e:: with SMTP id b14mr12222773ljj.126.1557124967799; 
 Sun, 05 May 2019 23:42:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190505130413.32253-1-masneyb@onstation.org>
In-Reply-To: <20190505130413.32253-1-masneyb@onstation.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 6 May 2019 08:42:36 +0200
Message-ID: <CACRpkda=JTfKC4z=1Gmt1BE5adwd8XGZ4ERTgapWX_BN9TFESw@mail.gmail.com>
Subject: Re: [PATCH RFC 0/6] ARM: qcom: initial Nexus 5 display support
To: Brian Masney <masneyb@onstation.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=kczJA0awqdoA0ORNL2OLUesgvZQuju/puNenMWJZnJs=;
 b=hBHK5Dj/+/9RsrxgVMPxDHF5voi9VNs/bZnK1MrhfA5lRcvYi8EcaPEpzJJoRFgcWH
 FQJflnlMcwe2e3kkppMG1fo6drZtZRQbBnksEnmbh8gH5QOEXbW3b7XQQtbYxwgxhnp9
 Rce783IBgTTRdV/F6GubWOA84+TIGZ7/FsRSHGJGDfg+xZwAFPIr/eU11xaaQkKSowP1
 Vu5qbCwMJFJgVAb0efR3AzhWlvTxfwe7CNjYhJdNu0MRABXOI0ogu2gYN1ZHd47DXKFV
 wid9EQsKj70NWtlibFyZO0c3pO813bWgyW++V7EGfh6TrgVPItwvH25k9VonTp6uzApT
 6sVA==
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
Cc: Sean Paul <sean@poorly.run>, Dave Airlie <airlied@linux.ie>,
 MSM <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBNYXkgNSwgMjAxOSBhdCAzOjA0IFBNIEJyaWFuIE1hc25leSA8bWFzbmV5YkBvbnN0
YXRpb24ub3JnPiB3cm90ZToKCj4gbWRwNV9nZXRfc2Nhbm91dHBvcygpIGFuZCBtZHA1X2dldF92
YmxhbmtfY291bnRlcigpIGJvdGggcmV0dXJuIDAsIHdoaWNoCj4gaXMgY2F1c2luZyB0aGlzIHN0
YWNrIHRyYWNlIHRvIGJlIGR1bXBlZCBpbnRvIHRoZSBzeXN0ZW0gbG9nIHNldmVyYWwKPiB0aW1l
czoKPgo+ICAgICBXQVJOSU5HOiBDUFU6IDAgUElEOiA1IGF0IGRyaXZlcnMvZ3B1L2RybS9kcm1f
YXRvbWljX2hlbHBlci5jOjE0MzAgZHJtX2F0b21pY19oZWxwZXJfd2FpdF9mb3JfdmJsYW5rcy5w
YXJ0LjErMHgyODgvMHgyOTAKPiAgICAgW0NSVEM6NDk6Y3J0Yy0wXSB2Ymxhbmsgd2FpdCB0aW1l
ZCBvdXQKPiAgICAgTW9kdWxlcyBsaW5rZWQgaW46Cj4gICAgIENQVTogMCBQSUQ6IDUgQ29tbTog
a3dvcmtlci8wOjAgTm90IHRhaW50ZWQgNS4xLjAtcmM2LW5leHQtMjAxOTA0MjYtMDAwMDYtZzM1
YzBkMzJhOTZlMS1kaXJ0eSAjMTkxCj4gICAgIEhhcmR3YXJlIG5hbWU6IEdlbmVyaWMgRFQgYmFz
ZWQgc3lzdGVtCj4gICAgIFdvcmtxdWV1ZTogZXZlbnRzIGRlZmVycmVkX3Byb2JlX3dvcmtfZnVu
Ywo+ICAgICBbPGMwMzEyMjljPl0gKHVud2luZF9iYWNrdHJhY2UpIGZyb20gWzxjMDMwZDVhYz5d
IChzaG93X3N0YWNrKzB4MTAvMHgxNCkKPiAgICAgWzxjMDMwZDVhYz5dIChzaG93X3N0YWNrKSBm
cm9tIFs8YzBhYzEzNGM+XSAoZHVtcF9zdGFjaysweDc4LzB4OGMpCj4gICAgIFs8YzBhYzEzNGM+
XSAoZHVtcF9zdGFjaykgZnJvbSBbPGMwMzIxNjYwPl0gKF9fd2Fybi5wYXJ0LjMrMHhiOC8weGQ0
KQo+ICAgICBbPGMwMzIxNjYwPl0gKF9fd2Fybi5wYXJ0LjMpIGZyb20gWzxjMDMyMTZlMD5dICh3
YXJuX3Nsb3dwYXRoX2ZtdCsweDY0LzB4ODgpCj4gICAgIFs8YzAzMjE2ZTA+XSAod2Fybl9zbG93
cGF0aF9mbXQpIGZyb20gWzxjMDc2MWEwYz5dIChkcm1fYXRvbWljX2hlbHBlcl93YWl0X2Zvcl92
YmxhbmtzLnBhcnQuMSsweDI4OC8weDI5MCkKPiAgICAgWzxjMDc2MWEwYz5dIChkcm1fYXRvbWlj
X2hlbHBlcl93YWl0X2Zvcl92YmxhbmtzLnBhcnQuMSkgZnJvbSBbPGMwN2IwYTk4Pl0gKG1kcDVf
Y29tcGxldGVfY29tbWl0KzB4MTQvMHg0MCkKPiAgICAgWzxjMDdiMGE5OD5dIChtZHA1X2NvbXBs
ZXRlX2NvbW1pdCkgZnJvbSBbPGMwN2RkYjgwPl0gKG1zbV9hdG9taWNfY29tbWl0X3RhaWwrMHhh
OC8weDE0MCkKPiAgICAgWzxjMDdkZGI4MD5dIChtc21fYXRvbWljX2NvbW1pdF90YWlsKSBmcm9t
IFs8YzA3NjMzMDQ+XSAoY29tbWl0X3RhaWwrMHg0MC8weDZjKQo+ICAgICBbPGMwNzYzM2Y0Pl0g
KGRybV9hdG9taWNfaGVscGVyX2NvbW1pdCkgZnJvbSBbPGMwNzY2N2YwPl0gKHJlc3RvcmVfZmJk
ZXZfbW9kZV9hdG9taWMrMHgxNjgvMHgxZDQpCgpJIHJlY2VudGx5IG1lcmdlZCB0aGlzIHBhdGNo
OgpodHRwczovL2NnaXQuZnJlZWRlc2t0b3Aub3JnL2RybS9kcm0tbWlzYy9jb21taXQvP2lkPWIz
MTk4YzM4ZjAyZDU0YTVlOTY0MjU4YTIxODBkNTAyYWJlNmVhZjAKCkkgbm90aWNlZCB0aGF0IERT
SSBpcyBzb21ldGltZXMgd2F5IHNsb3dlciB0aGFuIGEgbW9uaXRvciwgZXZlbiAgaW4gSFMgbW9k
ZS4KT24gdGhlIE1DREUgdGhpcyBoYXBwZW5lZCBvbiB0aGUgZmlyc3Qgc2NyZWVuIHVwZGF0ZSwg
d2hpY2ggd2FzIHNsb3dlcgp0aGFuIDUwbXMuCgpDaGVjayBpZiB5b3VyIHZibGFua3MgYXJlIHNp
bXBseSBzbG93LCB0cnkgYnVtcGluZyB0aGlzIHRpbWVvdXQgZXZlbiBoaWdoZXIsCkkgc3BlbnQg
d2Vla3MgZmluZGluZyB0aGlzIGlzc3VlIHdoaWNoIGJvaWxzIGRvd24gdG8gYW4gYXNzdW1wdGlv
biB0aGF0CnRoZSB2Ymxhbmsgd2lsbCBiZSBmaXJlZCBmcm9tIHNvbWV0aGluZyBsaWtlIGEgbW9u
aXRvciBhdCA1MCBvciA2MCBIWgp+MjAgbXMgc28gNTBtcyBzZWVtZWQgbGlrZSBhIGdvb2QgdGlt
ZW91dCBhdCB0aGUgdGltZS4KCk9uIGEgRFNJIGRpc3BsYXkgdGhpcyBpcyBkdWJpb3VzLCBhYnNv
bHV0ZWx5IGluIExQIG1vZGUsIGFuZCBldmVuCmluIEhTIG1vZGUuCgpZb3VycywKTGludXMgV2Fs
bGVpagpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
