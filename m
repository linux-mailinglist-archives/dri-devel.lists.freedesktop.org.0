Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2DD2225EB
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jul 2020 16:39:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 493286EC67;
	Thu, 16 Jul 2020 14:39:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE5046EC67
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 14:39:45 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id f139so11847887wmf.5
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 07:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=amD6wrTVFFwDbb/9Gfx9BmB+NGg+A9qoz+nxoVL9uN4=;
 b=xRTuTBfasRD7U+3n7RQKolbc3Bc4VHhuoEMK05/P8zvoGyzO5gW8v0aOgRwGxElcyu
 y89eoS5pzHxnGr5bEt0QhudSLUFK8Gup2vFYemqo/fWrMxdjuw5SRyzIAh938yqv2ipN
 gjxH+dr60+qqFEEhsCkw/G5yQ/vcnfsTLZgSu4Z5gmeyRNrY1d1Oa0t8IXw6HIrgcsZi
 GbRAkSFAO10W478H4GClKk84sWLv7J6mbEFZ3hlp3C+i59NmaNLrfnOWJ/rVqzfliV9t
 bXzgj3Y4Bp1CDV9s6TSHLhFgCLIdjDrmCYR1li5djNwJlnra6IxiFU76L2Tpm/rQKti3
 kvlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=amD6wrTVFFwDbb/9Gfx9BmB+NGg+A9qoz+nxoVL9uN4=;
 b=btUFm15tOwpE481jLQ/5vH8p4NqSt6rGLpjlU6Ha5qsVBNPjtckjgunCWvJWfMmDbE
 SIs3IdjcmEWNu76crxvbw4nHrAfN0Yz6RPFw5bGEtwE7LExbMgsJL9Go/sO0KxpwaRw2
 jSKuTUOGlXHLzankER4TeF7a1aRDX8ENs27uJsD78S/ib6Aa7UJsbKLXtV9bb/haK46R
 LSI2X8Lpw6nKifKsf0NK2oN8UyrrqtB1SD1u6iGHgbhgtvKca4koC/GzpxwUif7QrwJk
 r5v87prYRf6Fv31IRoCAuW3y1SRBShfC6p9bSK0NSTHKlEhT1M6B9A/eT/nGyduvD6dN
 x8tA==
X-Gm-Message-State: AOAM531UAXFnuQMB7yy6yPZG25C8ocv56JTfiGwJ1K3T6BoHWbsuYuxq
 ae4dQJhRGC7q64Nj4PXhziXp4Q==
X-Google-Smtp-Source: ABdhPJx3HKsrJ856ANN56k2CwqUedRnP671Th4Ufr3y+385WVcicQxrWUwEWf8EEiJ2bzYG/c3ZNLQ==
X-Received: by 2002:a1c:a557:: with SMTP id o84mr4698422wme.42.1594910384285; 
 Thu, 16 Jul 2020 07:39:44 -0700 (PDT)
Received: from dell ([2.31.163.61])
 by smtp.gmail.com with ESMTPSA id c15sm8830382wme.23.2020.07.16.07.39.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 07:39:43 -0700 (PDT)
Date: Thu, 16 Jul 2020 15:39:41 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v4 05/20] backlight: improve backlight_device documentation
Message-ID: <20200716143941.GS3165313@dell>
References: <20200703184546.144664-1-sam@ravnborg.org>
 <20200703184546.144664-6-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200703184546.144664-6-sam@ravnborg.org>
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

T24gRnJpLCAwMyBKdWwgMjAyMCwgU2FtIFJhdm5ib3JnIHdyb3RlOgoKPiBJbXByb3ZlIHRoZSBk
b2N1bWVudGF0aW9uIGZvciBiYWNrbGlnaHRfZGV2aWNlIGFuZAo+IGFkYXB0IGl0IHRvIGtlcm5l
bC1kb2Mgc3R5bGUuCj4gCj4gVGhlIHVwZGF0ZWQgZG9jdW1lbnRhdGlvbiBpcyBtb3JlIHN0cmlj
dCBvbiBob3cgbG9ja2luZyBpcyB1c2VkLgo+IFdpdGggdGhlIHVwZGF0ZSBuZWl0aGVyIHVwZGF0
ZV9sb2NrIG5vciBvcHNfbG9jayBtYXkgYmUgdXNlZAo+IG91dHNpZGUgdGhlIGJhY2tsaWdodCBj
b3JlLgo+IFRoaXMgcmVzdHJpY3Rpb24gd2FzIGludHJvZHVjZWQgdG8ga2VlcCB0aGUgbG9ja2lu
ZyBzaW1wbGUKPiBieSBrZWVwaW5nIGl0IGluIHRoZSBjb3JlLgo+IEl0IHdhcyB2ZXJpZmllZCB0
aGF0IHRoaXMgZG9jdW1lbnRzIHRoZSBjdXJyZW50IHN0YXRlIGJ5IHJlbmFtaW5nCj4gdXBkYXRl
X2xvY2sgPT4gYmxfdXBkYXRlX2xvY2sgYW5kIG9wc19sb2NrID0+IGJsX29wc19sb2NrLgo+IFRo
ZSByZW5hbWUgZGlkIG5vdCByZXZlYWwgYW55IHVzZXMgb3V0c2lkZSB0aGUgYmFja2xpZ2h0IGNv
cmUuCj4gVGhlIHJlbmFtZSBpcyBOT1QgcGFydCBvZiB0aGlzIHBhdGNoLgo+IAo+IHYzOgo+ICAg
LSBVcGRhdGUgY2hhbmdlbG9nIHRvIGV4cGxhaW4gbG9ja2luZyBkZXRhaWxzIChEYW5pZWwpCj4g
Cj4gdjI6Cj4gICAtIEFkZCBzaG9ydCBpbnRybyB0byBhbGwgZmllbGRzIChEYW5pZWwpCj4gICAt
IFVwZGF0ZWQgZGVzY3JpcHRpb24gb2YgdXBkYXRlX2xvY2sgKERhbmllbCkKPiAKPiBTaWduZWQt
b2ZmLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4gUmV2aWV3ZWQtYnk6IEVt
aWwgVmVsaWtvdiA8ZW1pbC5sLnZlbGlrb3ZAZ21haWwuY29tPgo+IENjOiBMZWUgSm9uZXMgPGxl
ZS5qb25lc0BsaW5hcm8ub3JnPgo+IENjOiBEYW5pZWwgVGhvbXBzb24gPGRhbmllbC50aG9tcHNv
bkBsaW5hcm8ub3JnPgo+IENjOiBKaW5nb28gSGFuIDxqaW5nb29oYW4xQGdtYWlsLmNvbT4KPiAt
LS0KPiAgaW5jbHVkZS9saW51eC9iYWNrbGlnaHQuaCB8IDcyICsrKysrKysrKysrKysrKysrKysr
KysrKysrLS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNDkgaW5zZXJ0aW9ucygrKSwg
MjMgZGVsZXRpb25zKC0pCgpTb21lIG9mIHRoZXNlIGRvIG5vdCBhcHBseSBjbGVhbmx5LgoKUGxl
YXNlIGNvbGxlY3QgdGhlICotYnlzIGFscmVhZHkgcmVjZWl2ZWQsIHJlYmFzZSBhbmQgcmVzdWJt
aXQuCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dClNlbmlvciBUZWNobmljYWwgTGVhZCAtIERl
dmVsb3BlciBTZXJ2aWNlcwpMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3Ig
QXJtIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
