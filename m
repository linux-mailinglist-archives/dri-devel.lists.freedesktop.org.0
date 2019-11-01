Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB14EBEFC
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 09:10:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8B746F769;
	Fri,  1 Nov 2019 08:10:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF4186E182
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2019 05:42:39 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 93CCB609DD; Fri,  1 Nov 2019 05:42:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 by smtp.codeaurora.org (Postfix) with ESMTP id D668260A66;
 Fri,  1 Nov 2019 05:42:38 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 01 Nov 2019 11:12:38 +0530
From: kgunda@codeaurora.org
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH V9 1/6] backlight: qcom-wled: Add new properties for
 PMI8998.
In-Reply-To: <20191031085845.GA5700@dell>
References: <1571814423-6535-1-git-send-email-kgunda@codeaurora.org>
 <1571814423-6535-2-git-send-email-kgunda@codeaurora.org>
 <20191031085845.GA5700@dell>
Message-ID: <4b5c264b8d4b47c48bc87ca389041a02@codeaurora.org>
X-Sender: kgunda@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
X-Mailman-Approved-At: Fri, 01 Nov 2019 08:09:55 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1572586959;
 bh=hfIUvKWAJJGAIiPINob40uFW3VATFr4Hy/OOMnNedZ4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QJq/W/+LeemfKfbuQt8carVNB0URGDh3KbVxp+VdHth6cbpLg4YAnp5NwdNlmDGaS
 HD9E4VwrnJNbYy/qP17K3SeclV+MWLu1Nxbtv1K1qPNQ1qrbJfRLtpgZf5lE38kErP
 /DJFNVuUlQW5+mlQ/lTxmYn0RmgyFIdAaQ500YcY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1572586958;
 bh=hfIUvKWAJJGAIiPINob40uFW3VATFr4Hy/OOMnNedZ4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=AJl5A1k2zCnHgvYqAvbQ2tw0xbY7UZ487lMyuth0SXCeWAZy1iQ0A/UYUECO0mtq9
 iL79uI+9ha4SC15D5PMNFY3e0Jy2CVpGZQvyYxUSd31WHzpMILh7xKbf7+8R04AYUN
 CM2CgEzIe78GA80M9YzJSY2+1xt5ZUInUf3uwmh8=
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 daniel.thompson@linaro.org, b.zolnierkie@samsung.com, jingoohan1@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, robh+dt@kernel.org, jacek.anaszewski@gmail.com,
 pavel@ucw.cz, linux-arm-msm@vger.kernel.org,
 linux-arm-msm-owner@vger.kernel.org, linux-leds@vger.kernel.org,
 Dan Murphy <dmurphy@ti.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0xMC0zMSAxNDoyOCwgTGVlIEpvbmVzIHdyb3RlOgo+IE9uIFdlZCwgMjMgT2N0IDIw
MTksIEtpcmFuIEd1bmRhIHdyb3RlOgo+IAo+PiBVcGRhdGUgdGhlIGJpbmRpbmdzIHdpdGggdGhl
IG5ldyBwcm9wZXJ0aWVzIHVzZWQgZm9yCj4+IFBNSTg5OTguCj4+IAo+PiBTaWduZWQtb2ZmLWJ5
OiBLaXJhbiBHdW5kYSA8a2d1bmRhQGNvZGVhdXJvcmEub3JnPgo+PiBSZXZpZXdlZC1ieTogQmpv
cm4gQW5kZXJzc29uIDxiam9ybi5hbmRlcnNzb25AbGluYXJvLm9yZz4KPj4gUmV2aWV3ZWQtYnk6
IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4+IEFja2VkLWJ5OiBEYW5pZWwgVGhvbXBz
b24gPGRhbmllbC50aG9tcHNvbkBsaW5hcm8ub3JnPgo+PiAtLS0KPj4gIC4uLi9iaW5kaW5ncy9s
ZWRzL2JhY2tsaWdodC9xY29tLXdsZWQudHh0ICAgICAgICAgIHwgNzQgCj4+ICsrKysrKysrKysr
KysrKysrKy0tLS0KPj4gIDEgZmlsZSBjaGFuZ2VkLCA2MyBpbnNlcnRpb25zKCspLCAxMSBkZWxl
dGlvbnMoLSkKPiAKPiBUaGlzIHBhdGNoIG5vIGxvbmdlciBhcHBsaWVzLgo+IAo+IEl0IGxvb2tz
IGxpa2UgeW91IGRyb3BwZWQgdGhlIHJlbmFtZSBwYXRjaC4KPiAKPiBQbGVhc2UgcmViYXNlIGFs
bCBvZiB0aGUgcGF0Y2hlcyBpbiB0aGlzIHNldCBvbiB0b3Agb2YgYSByZWxlYXNlZAo+IGNvbW1p
dCBhbmQgcmVzZW5kLgpTdXJlLiBJIHdpbGwgcmVzZW5kIHRoZSBjb21wbGV0ZSBzZXJpZXMgd2l0
aCB0aGUgZHJvcHBlZCBwYXRjaGVzLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
