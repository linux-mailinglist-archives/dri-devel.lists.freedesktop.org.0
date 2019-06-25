Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C2352685
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 10:26:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFF9E6E094;
	Tue, 25 Jun 2019 08:26:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8B836E094
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 08:26:54 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id b11so12014903lfa.5
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 01:26:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kVHhWnDLvxp54p0ZCf93IIcQ0pUeJTPzai6D5SvqhUU=;
 b=PJW4TbXhgY5h4uROeA+3DkHxm0r5ajs68dsZExNuLHikRoVMScqQ2o5o1hOrBL/G41
 txqp6/PhfiJm5x4RAu7MBOQpU+BBmFAG3OJv6fFaskWGvLSngBIQOP8vb6lVcByW1cEn
 CrkK1VEz3j9IabEmQSkOHc0VH1P/Phuq6ayV2EumEqi+OW/3nNhtzloopgyFKXtMlZxz
 JtgLTr+n0dZ2ot6jBtYP53vnl0An1JkpYT69BhKPaBo5tst3/mfiyW0bWss2vJYVITGc
 ZS8gUa8dpB9Al9kruJW78ddAHejGMzyOPTUzvYHlMnHfuhX4HOionVPlHU/R3MGHFojn
 g2Sw==
X-Gm-Message-State: APjAAAVuMVRFx/s4j3OjLeRm7YdsMq/bFJiKi8NC4UPfTGGON3ZAK/d5
 ogM/9IIIsHg4gUktMrk7n1SjvjrurewgZ/mqVfvSAQ==
X-Google-Smtp-Source: APXvYqz5PlZyVZy/nlr5ViEmoOLlNZX/LuhCuxl9zXLQIre7MazQ8oPXy4S78b4Y/RNU5/ZDJwICe+jEltkCW8JxKh4=
X-Received: by 2002:ac2:598d:: with SMTP id w13mr75934082lfn.165.1561451213189; 
 Tue, 25 Jun 2019 01:26:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190624215649.8939-1-robh@kernel.org>
 <20190624215649.8939-11-robh@kernel.org>
 <CACRpkdYKE=zLJhmTeTWYGRCQNt3K8+rNNqsp5UDa2d31GG6Y2g@mail.gmail.com>
 <CAL_Jsq+uCMKhUFgCCK3uUetL9OwokQPaq74GJHQS2VS=UjVH8w@mail.gmail.com>
In-Reply-To: <CAL_Jsq+uCMKhUFgCCK3uUetL9OwokQPaq74GJHQS2VS=UjVH8w@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 25 Jun 2019 10:26:41 +0200
Message-ID: <CACRpkdYnSZibUyhe5D8W259fCJBm05rG0_EmX+uoi=uqbrqEYA@mail.gmail.com>
Subject: Re: [PATCH v2 10/15] dt-bindings: display: Convert tpo,tpg110 panel
 to DT schema
To: Rob Herring <robh@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=kVHhWnDLvxp54p0ZCf93IIcQ0pUeJTPzai6D5SvqhUU=;
 b=ahvbeOrhOMKsGcDJLfK6ZG9vmXqWuw4udju5Y7XpqqW1DUOva4Cags99u5WkqRcspN
 HKsfE6dUhaOpSzrDd4oabGF7NILel7LxJasKXak5hlqyqlquO9bAkMvXc+fIzT8iGem2
 1kPJ/qO1nmQR7V0iv+jqHp25lAGQW6wHSwol51ZC9n1BQNY2gfNpeYGVwbPWcfJ0CMrm
 kObApMSAyf1QxKXJulzk7muEB9h5a4ujPDs55PzIhEppNJXZAJZxirUmFM3sIdka9kTh
 Z5a7P48TRhVwaRzZz7ewu/ahP5ggAFRrr8gzEwwBhK+gPwAJiUj+PhTbIEcJKfa4fYKK
 w0Wg==
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgMTI6NDcgQU0gUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVs
Lm9yZz4gd3JvdGU6Cj4gT24gTW9uLCBKdW4gMjQsIDIwMTkgYXQgNDoxMyBQTSBMaW51cyBXYWxs
ZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+IHdyb3RlOgo+ID4gT24gTW9uLCBKdW4gMjQs
IDIwMTkgYXQgMTE6NTkgUE0gUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4gd3JvdGU6Cj4g
Pgo+ID4gPiBDb252ZXJ0IHRoZSB0cG8sdHBnMTEwIHBhbmVsIGJpbmRpbmcgdG8gRFQgc2NoZW1h
Lgo+ID4gPgo+ID4gPiBDYzogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3Jn
Pgo+ID4gPiBDYzogVGhpZXJyeSBSZWRpbmcgPHRoaWVycnkucmVkaW5nQGdtYWlsLmNvbT4KPiA+
ID4gQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPiA+ID4gQ2M6IE1heGltZSBS
aXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+Cj4gPiA+IENjOiBMYXVyZW50IFBpbmNo
YXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Cj4gPiA+IENjOiBkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiA+IFNpZ25lZC1vZmYtYnk6IFJvYiBIZXJyaW5n
IDxyb2JoQGtlcm5lbC5vcmc+Cj4gPgo+ID4gQXdlc29tZSwgZml4ZWQgdXAgdGhlIE1BSU5BVElO
RVJTIGVudHJ5IGFuZCBhcHBsaWVkIGFuZAo+ID4gcHVzaGVkIGZvciBEUk0gbmV4dCB3aXRoIG15
IFJldmlld2VkLWJ5Lgo+Cj4gWW91IHNob3VsZG4ndCBoYXZlIGJlY2F1c2UgdGhpcyBpcyBkZXBl
bmRlbnQgb24gcGF0Y2ggMiBhbmQKPiBwYW5lbC1jb21tb24ueWFtbC4gU28gbm93ICdtYWtlIGR0
X2JpbmRpbmdfY2hlY2snIGlzIGJyb2tlbi4KCk9vb3BzIGVhc2lseSBoYXBwZW5zIHdoZW4gSSBh
bSBvbmx5IGFkcmVzc2VlIG9uIHRoaXMgcGF0Y2ggYW5kCnRoZXJlIGlzIG5vIG1lbnRpb24gb2Yg
YW55IGRlcGVuZGVuY2llcy4KCkNhbiBJIHNpbXBseSBqdXN0IG1lcmdlIHRoZSBwYW5lbC1jb21t
b24gcGF0Y2ggYXMgd2VsbCBhbmQgd2UKYXJlIGFsbCBoYXBweT8KCkkgY2FuIGFsc28gcGljayB1
cCBtb3JlIHBhbmVsIGJpbmRpbmcgcGF0Y2hlcywgSU1PIHRoZSB5YW1sCmNvbnZlcnNpb25zIGFy
ZSBlc3BlY2lhbGx5IHVuY29udHJvdmVyc2lhbCBhbmQgc2hvdWxkIGhhdmUgbG93CnRocmVzaG9s
ZCBmb3IgbWVyZ2luZy4KCllvdXJzLApMaW51cyBXYWxsZWlqCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
