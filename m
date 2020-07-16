Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D080122268A
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jul 2020 17:09:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB5326EC6C;
	Thu, 16 Jul 2020 15:09:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41F606EC6C
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 15:09:27 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id o8so10618938wmh.4
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 08:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=wfTVEgJCM3Mx2ShOcrbGhi57eh5VniqIcsBsFPVxDMQ=;
 b=JIsaQgcOlfc1snytddMtZoMFDfykhaeqOlXeq1BdwR7CE0s3ZN1P7PART5hVNyrINm
 J4lJuTBjyirv5Vk34La3RjIatruJtd5YCU1nqKG9stWPQjYuQEzH881BV16vzYPK2Dea
 5qy30/h3s7mt5hyCdPcjhM2+sVSQBJN9JZEj4+WGmiuzLLjxBg2FmL9w31SvMo+0v0gQ
 uDlHdi3eeGEntYEDDabA+hvWlsEtCSFhjHCwoSNXIuVEyVu+3UUwuAsHbf9gRSqajAFp
 y2E9F2ieus6X6FgL4sv0Q9V12aGYccH/0nw7kQ1opDF6eIVoJ+/YNwnfdEhsSifamBRL
 YgnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=wfTVEgJCM3Mx2ShOcrbGhi57eh5VniqIcsBsFPVxDMQ=;
 b=dVadKddEi6ITvRdDshePd11X+Rt9CH9EGU3Wt16bZClDwZahT3GEWrJQEDiXjiGCuW
 kiD5hg+PrdsStlVYh8BAblKaft0Ev3hnjm5Zl6TayH8EO6q/PSLMOfThSzxQ5o9lbZaT
 21Ck+Tt5ZDxmSlKZwcWK9ofYjZ97k4Srz2rkuJwgNgAgPAUcOSv3z7rQEU6SnoVbMWKP
 wAxEXzkroOIO0EzXiue+DP5qZwSKJlFqbKF/J2BBtFOPDzc+lk7D5pMeCtfjDNn0aaBa
 dxxE+cp6LgkYIEfnyINX/mEB6D8Ed1EigVuhox5aJaEt0sCGvfWwnN4jGLALqfOOG64S
 MnMA==
X-Gm-Message-State: AOAM532CgIw1gjrzM1HrfJOPkqCNm8OyEYXYHaHWA8GHrYoaRe77+EUS
 mGHcUA4BPrX3808Wdp5f7DWghA==
X-Google-Smtp-Source: ABdhPJwJtZ75Fe6xQKoWPm0JZoQfZmxBLgKksLYrLabK8E2UskeVzYq5S2vTJLxmhzHmqHakCWeJRA==
X-Received: by 2002:a1c:7416:: with SMTP id p22mr4787367wmc.32.1594912165892; 
 Thu, 16 Jul 2020 08:09:25 -0700 (PDT)
Received: from dell ([2.31.163.61])
 by smtp.gmail.com with ESMTPSA id 33sm10400383wri.16.2020.07.16.08.09.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 08:09:25 -0700 (PDT)
Date: Thu, 16 Jul 2020 16:09:23 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v4 05/20] backlight: improve backlight_device documentation
Message-ID: <20200716150923.GY3165313@dell>
References: <20200703184546.144664-1-sam@ravnborg.org>
 <20200703184546.144664-6-sam@ravnborg.org>
 <20200716143941.GS3165313@dell>
 <20200716150021.GA1936267@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200716150021.GA1936267@ravnborg.org>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>, linux-pwm@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-arm-msm@vger.kernel.org,
 Support Opensource <support.opensource@diasemi.com>,
 Jingoo Han <jingoohan1@gmail.com>, Emil Velikov <emil.l.velikov@gmail.com>,
 Andy Gross <agross@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 patches@opensource.cirrus.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAxNiBKdWwgMjAyMCwgU2FtIFJhdm5ib3JnIHdyb3RlOgoKPiBIaSBMZWUuCj4gCj4g
T24gVGh1LCBKdWwgMTYsIDIwMjAgYXQgMDM6Mzk6NDFQTSArMDEwMCwgTGVlIEpvbmVzIHdyb3Rl
Ogo+ID4gT24gRnJpLCAwMyBKdWwgMjAyMCwgU2FtIFJhdm5ib3JnIHdyb3RlOgo+ID4gCj4gPiA+
IEltcHJvdmUgdGhlIGRvY3VtZW50YXRpb24gZm9yIGJhY2tsaWdodF9kZXZpY2UgYW5kCj4gPiA+
IGFkYXB0IGl0IHRvIGtlcm5lbC1kb2Mgc3R5bGUuCj4gPiA+IAo+ID4gPiBUaGUgdXBkYXRlZCBk
b2N1bWVudGF0aW9uIGlzIG1vcmUgc3RyaWN0IG9uIGhvdyBsb2NraW5nIGlzIHVzZWQuCj4gPiA+
IFdpdGggdGhlIHVwZGF0ZSBuZWl0aGVyIHVwZGF0ZV9sb2NrIG5vciBvcHNfbG9jayBtYXkgYmUg
dXNlZAo+ID4gPiBvdXRzaWRlIHRoZSBiYWNrbGlnaHQgY29yZS4KPiA+ID4gVGhpcyByZXN0cmlj
dGlvbiB3YXMgaW50cm9kdWNlZCB0byBrZWVwIHRoZSBsb2NraW5nIHNpbXBsZQo+ID4gPiBieSBr
ZWVwaW5nIGl0IGluIHRoZSBjb3JlLgo+ID4gPiBJdCB3YXMgdmVyaWZpZWQgdGhhdCB0aGlzIGRv
Y3VtZW50cyB0aGUgY3VycmVudCBzdGF0ZSBieSByZW5hbWluZwo+ID4gPiB1cGRhdGVfbG9jayA9
PiBibF91cGRhdGVfbG9jayBhbmQgb3BzX2xvY2sgPT4gYmxfb3BzX2xvY2suCj4gPiA+IFRoZSBy
ZW5hbWUgZGlkIG5vdCByZXZlYWwgYW55IHVzZXMgb3V0c2lkZSB0aGUgYmFja2xpZ2h0IGNvcmUu
Cj4gPiA+IFRoZSByZW5hbWUgaXMgTk9UIHBhcnQgb2YgdGhpcyBwYXRjaC4KPiA+ID4gCj4gPiA+
IHYzOgo+ID4gPiAgIC0gVXBkYXRlIGNoYW5nZWxvZyB0byBleHBsYWluIGxvY2tpbmcgZGV0YWls
cyAoRGFuaWVsKQo+ID4gPiAKPiA+ID4gdjI6Cj4gPiA+ICAgLSBBZGQgc2hvcnQgaW50cm8gdG8g
YWxsIGZpZWxkcyAoRGFuaWVsKQo+ID4gPiAgIC0gVXBkYXRlZCBkZXNjcmlwdGlvbiBvZiB1cGRh
dGVfbG9jayAoRGFuaWVsKQo+ID4gPiAKPiA+ID4gU2lnbmVkLW9mZi1ieTogU2FtIFJhdm5ib3Jn
IDxzYW1AcmF2bmJvcmcub3JnPgo+ID4gPiBSZXZpZXdlZC1ieTogRW1pbCBWZWxpa292IDxlbWls
LmwudmVsaWtvdkBnbWFpbC5jb20+Cj4gPiA+IENjOiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPgo+ID4gPiBDYzogRGFuaWVsIFRob21wc29uIDxkYW5pZWwudGhvbXBzb25AbGluYXJv
Lm9yZz4KPiA+ID4gQ2M6IEppbmdvbyBIYW4gPGppbmdvb2hhbjFAZ21haWwuY29tPgo+ID4gPiAt
LS0KPiA+ID4gIGluY2x1ZGUvbGludXgvYmFja2xpZ2h0LmggfCA3MiArKysrKysrKysrKysrKysr
KysrKysrKysrKy0tLS0tLS0tLS0tLS0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0OSBpbnNlcnRp
b25zKCspLCAyMyBkZWxldGlvbnMoLSkKPiA+IAo+ID4gU29tZSBvZiB0aGVzZSBkbyBub3QgYXBw
bHkgY2xlYW5seS4KPiA+IAo+ID4gUGxlYXNlIGNvbGxlY3QgdGhlICotYnlzIGFscmVhZHkgcmVj
ZWl2ZWQsIHJlYmFzZSBhbmQgcmVzdWJtaXQuCj4gCj4gV2lsbCBkby4KPiBUaGUgcGF0Y2gtc2V0
IGlzIGJhc2VkIG9uIGRybS1taXNjLW5leHQuIEFyZSB0aGVyZSBhbm90aGVyCj4gdHJlZSB0aGF0
IEkgc2hvdWxkIHVzZT8KCkkgZG9uJ3QgaGF2ZSBhbnl0aGluZyB0byBkbyB3aXRoIHRoYXQgdHJl
ZS4KCkVpdGhlciBCYWNrbGlnaHQgWzBdIG9yIE5leHQgd291bGQgYmUgZmluZS4KClswXSBodHRw
czovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9sZWUvYmFja2xpZ2h0
LmdpdC8KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KU2VuaW9yIFRlY2huaWNhbCBMZWFkIC0g
RGV2ZWxvcGVyIFNlcnZpY2VzCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZv
ciBBcm0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
