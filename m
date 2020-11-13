Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B87E2B3AE9
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 02:07:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DC5989CE1;
	Mon, 16 Nov 2020 01:07:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A1EC6E51D
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 14:46:21 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id r14so5295543vsa.13
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 06:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Aa2pPBMOldZH+yQGH0UrveON65rZ08/cb06MQFHGa0E=;
 b=oI7Irk60nS8p8IJ9aebTfBT8tKh0VFGTFn4N+jHvPSrvutUGz4HDN9F2eXGWUFLUJO
 pztkL1zvJJMqmmqAU4axiDuUUDb7ZZEfZv/0TZRBLjwcw3/kbFA/Hx96JgrITvvr02pZ
 P9ohzUknb4wDMFPoki9mO18MI2KcxcBOr1dFLBdisyT0QQlXZ092Oz52zVXzS4AIl6nm
 U8S/pCXL5v33Tp7vs3/soInXrThDoA5cbxXaCLXchnNuLPv28h5iBteaaK6ficGI1j82
 XTk7m3rfU//IdaFvmbs97w3+GVYDzQv+iWKbaHXieTVM3M0QznSjPWGv6+xYuZCuLvZr
 7YfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Aa2pPBMOldZH+yQGH0UrveON65rZ08/cb06MQFHGa0E=;
 b=s6OoFsdgPqkZ5mftGq0uWkuydpSGqU1CnIIE1mG+asd8AAjzjZsmifYVNqlXHvJAkX
 08/x8d4jJNXB5rhw+bBlk1kDnLpnPYwTMg/912ms3Rq37rSFMXosdmoseTMvcQuV99P7
 o6Xo2qhPuNcOH4XN/ZjX+PhTd55mOWSuabuidR4g/RAzR+cBTCJA7G5/ugTWxK0Vw3L3
 Cowg5Vx8cnFOUBHaxJtZulB/xK6+4NmWwUWJFlmbVkzimQQ/kwcTaAjZtghqu1J7iVkf
 Et5DSs9Ie6Z44jqTaz4/M2c6xGr/053E1XnYwTymn9wYhf3thwZc0N4erNQBmcfnbgna
 q1+w==
X-Gm-Message-State: AOAM532UzYLyLA5zlDnvo/oRyEcpW1Z8DoWbTY7ppUt0lN473CqT1dAy
 bUAR+9s3g8+jkDU0AW2HWKk2Frun7w2SkooZyHRipQ==
X-Google-Smtp-Source: ABdhPJwkbgKSdaTWhgIsxWjShz+Kw+ub2606C3A/AwjkR07HCOjuCnqip2AUmLV/UBcfKhNInvgSpQVBCTAIPmGnX5w=
X-Received: by 2002:a67:3256:: with SMTP id y83mr1567875vsy.48.1605278780301; 
 Fri, 13 Nov 2020 06:46:20 -0800 (PST)
MIME-Version: 1.0
References: <20201104234427.26477-1-digetx@gmail.com>
 <CAPDyKFr7qTU2RPhA_ZrbCayoTTNUEno1zdmvmv+8HBe-Owrfeg@mail.gmail.com>
 <cd147ab0-1304-a491-7a56-ee6199c02d32@gmail.com>
 <2716c195-083a-112f-f1e5-2f6b7152a4b5@gmail.com>
 <CAPDyKFqUMsH9dCZ=OYqfdLt==+-8NjK9n=S5jGGNXZu6Y9q=2w@mail.gmail.com>
 <1f7e90c4-6134-2e2b-4869-5afbda18ead3@gmail.com>
 <20201112204358.GA1027187@ulmo>
 <25942da9-b527-c0aa-5403-53c9cc34ad93@gmail.com>
In-Reply-To: <25942da9-b527-c0aa-5403-53c9cc34ad93@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 13 Nov 2020 15:45:43 +0100
Message-ID: <CAPDyKFomk7mw7-wpZFPOfT27CEXuCbzRiBoicH5-k7QF_pphVw@mail.gmail.com>
Subject: Re: [PATCH v1 00/30] Introduce core voltage scaling for NVIDIA
 Tegra20/30 SoCs
To: Dmitry Osipenko <digetx@gmail.com>
X-Mailman-Approved-At: Mon, 16 Nov 2020 01:07:21 +0000
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
Cc: Peter Chen <Peter.Chen@nxp.com>, DTML <devicetree@vger.kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 driverdevel <devel@driverdev.osuosl.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Alan Stern <stern@rowland.harvard.edu>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 linux-pwm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux USB List <linux-usb@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Peter Geis <pgwipeout@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAxMiBOb3YgMjAyMCBhdCAyMzoxNCwgRG1pdHJ5IE9zaXBlbmtvIDxkaWdldHhAZ21h
aWwuY29tPiB3cm90ZToKPgo+IDEyLjExLjIwMjAgMjM6NDMsIFRoaWVycnkgUmVkaW5nINC/0LjR
iNC10YI6Cj4gPj4gVGhlIGRpZmZlcmVuY2UgaW4gY29tcGFyaXNvbiB0byB1c2luZyB2b2x0YWdl
IHJlZ3VsYXRvciBkaXJlY3RseSBpcwo+ID4+IG1pbmltYWwsIGJhc2ljYWxseSB0aGUgY29yZS1z
dXBwbHkgcGhhbmRsZSBpcyByZXBsYWNlZCBpcyByZXBsYWNlZCB3aXRoCj4gPj4gYSBwb3dlci1k
b21haW4gcGhhbmRsZSBpbiBhIGRldmljZSB0cmVlLgo+ID4gVGhlc2UgbmV3IHBvd2VyLWRvbWFp
biBoYW5kbGVzIHdvdWxkIGhhdmUgdG8gYmUgYWRkZWQgdG8gZGV2aWNlcyB0aGF0Cj4gPiBwb3Rl
bnRpYWxseSBhbHJlYWR5IGhhdmUgYSBwb3dlci1kb21haW4gaGFuZGxlLCByaWdodD8gSXNuJ3Qg
dGhhdCBnb2luZwo+ID4gdG8gY2F1c2UgaXNzdWVzPyBJIHZhZ3VlbHkgcmVjYWxsIHRoYXQgd2Ug
YWxyZWFkeSBoYXZlIG11bHRpcGxlIHBvd2VyCj4gPiBkb21haW5zIGZvciB0aGUgWFVTQiBjb250
cm9sbGVyIGFuZCB3ZSBoYXZlIHRvIGp1bXAgdGhyb3VnaCBleHRyYSBob29wcwo+ID4gdG8gbWFr
ZSB0aGF0IHdvcmsuCj4KPiBJIG1vZGVsZWQgdGhlIGNvcmUgUEQgYXMgYSBwYXJlbnQgb2YgdGhl
IFBNQyBzdWItZG9tYWlucywgd2hpY2gKPiBwcmVzdW1hYmx5IGlzIGEgY29ycmVjdCB3YXkgdG8g
cmVwcmVzZW50IHRoZSBkb21haW5zIHRvcG9sb2d5Lgo+Cj4gaHR0cHM6Ly9naXN0LmdpdGh1Yi5j
b20vZGlnZXR4L2RmZDkyYzdmN2UwYWE2Y2VmMjA0MDNjNDI5ODA4OGQ3CgpUaGF0IGNvdWxkIG1h
a2Ugc2Vuc2UsIGl0IHNlZW1zLgoKQW55d2F5LCB0aGlzIG1hZGUgbWUgcmVhbGl6ZSB0aGF0CmRl
dl9wbV9nZW5wZF9zZXRfcGVyZm9ybWFuY2Vfc3RhdGUoZGV2KSByZXR1cm5zIC1FSU5WQUwsIGlu
IGNhc2UgdGhlCmRldmljZSdzIGdlbnBkIGRvZXNuJ3QgaGF2ZSB0aGUgLT5zZXRfcGVyZm9ybWFu
Y2Vfc3RhdGUoKSBhc3NpZ25lZC4KVGhpcyBtYXkgbm90IGJlIGNvcnJlY3QuIEluc3RlYWQgd2Ug
c2hvdWxkIGxpa2VseSBjb25zaWRlciBhbiBlbXB0eQpjYWxsYmFjayBhcyBva2F5IGFuZCBjb250
aW51ZSB0byB3YWxrIHRoZSB0b3BvbG9neSB1cHdhcmRzIHRvIHRoZQpwYXJlbnQgZG9tYWluLCBl
dGMuCgpKdXN0IHdhbnRlZCB0byBwb2ludCB0aGlzIG91dC4gSSBpbnRlbmQgdG8gcG9zdCBhIHBh
dGNoIGFzIHNvb24gYXMgSQpjYW4gZm9yIHRoaXMuCgpbLi4uXQoKS2luZCByZWdhcmRzClVmZmUK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
