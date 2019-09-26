Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 060ECBF4DA
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2019 16:15:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4A496ED59;
	Thu, 26 Sep 2019 14:15:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5192C6ED59
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 14:15:15 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C8015222C6
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 14:15:14 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id c21so2981254qtj.12
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 07:15:14 -0700 (PDT)
X-Gm-Message-State: APjAAAVK4hjFZp9mon5j3prw+837uaGruTcejafmGMEYE/hpnQUj3fDm
 C+IpRmAVsbobbPgu7RXWwPmU4ykicW5aQd+ZQw==
X-Google-Smtp-Source: APXvYqwIMIe5OEpAgQT8ClcMlHD627oH2q+knkeerrGnhKgwkBYias9cnbzPSO8cBDCsspBtxFeoksLM+M7YJRGk9HM=
X-Received: by 2002:a0c:fa49:: with SMTP id k9mr2880504qvo.72.1569507313951;
 Thu, 26 Sep 2019 07:15:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190925235544.11524-1-laurent.pinchart@ideasonboard.com>
 <20190925235544.11524-2-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20190925235544.11524-2-laurent.pinchart@ideasonboard.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 26 Sep 2019 09:15:01 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL7-33B4CaEX0r5V7PhX9EnghxNfcbZNLT4yo+FLeCOCA@mail.gmail.com>
Message-ID: <CAL_JsqL7-33B4CaEX0r5V7PhX9EnghxNfcbZNLT4yo+FLeCOCA@mail.gmail.com>
Subject: Re: [PATCH v9 1/4] dt-bindings: display: xlnx: Add ZynqMP DP
 subsystem bindings
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1569507314;
 bh=syFB0s8Z9+UBGBqrI+vXSPb73kAHmkg+VCZHK6EDWk4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=DpE+lMxmAkejkULP2WYcECnvDCLbMsCbcl0ESFTtWGdhXQ1xABq8KZlq3mBG764Gz
 sJOBkq7MdBBTnBsXE+mQovDaX+cKNpIIIAZA772lwu65G4i31k+s3Q/gJh4VM2iGWp
 6ahrtGVgks6X60SQjQzCrYOcnMzn9/RHrlt/KDwI=
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
Cc: devicetree@vger.kernel.org, Hyun Kwon <hyun.kwon@xilinx.com>,
 Michal Simek <michal.simek@xilinx.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Satish Kumar Nagireddy <SATISHNA@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgMjUsIDIwMTkgYXQgNjo1NiBQTSBMYXVyZW50IFBpbmNoYXJ0CjxsYXVyZW50
LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+IHdyb3RlOgo+Cj4gRnJvbTogSHl1biBLd29uIDxo
eXVuLmt3b25AeGlsaW54LmNvbT4KPgo+IFRoZSBiaW5kaW5ncyBkZXNjcmliZSB0aGUgWnlucU1Q
IERQIHN1YnN5c3RlbS4gVGhleSBkb24ndCBzdXBwb3J0IHRoZQo+IGludGVyZmFjZSB3aXRoIHRo
ZSBwcm9ncmFtbWFibGUgbG9naWMgKEZQR0EpIG9yIGF1ZGlvIHlldC4KPgo+IFNpZ25lZC1vZmYt
Ynk6IEh5dW4gS3dvbiA8aHl1bi5rd29uQHhpbGlueC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogTGF1
cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgo+IC0tLQo+
IENoYW5nZXMgc2luY2Ugdjg6Cj4KPiAtIENvbnZlcnQgdG8geWFtbAo+IC0gUmVuYW1lIGFjbGsg
dG8gZHBfYXBiX2NsawoKL2J1aWxkcy9yb2JoZXJyaW5nL2xpbnV4LWR0LXJldmlldy9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS94bG54L3hsbngsenlucW1wLWRwc3Vi
LmV4YW1wbGUuZHQueWFtbDoKZGlzcGxheUBmZDRhMDAwMDogY2xvY2stbmFtZXM6MjogJ2RwX3Z0
Y19waXhlbF9jbGtfaW4nIHdhcyBleHBlY3RlZApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
