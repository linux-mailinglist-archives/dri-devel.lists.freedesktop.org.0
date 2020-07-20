Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37FA4225BC0
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jul 2020 11:36:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 943456E2B4;
	Mon, 20 Jul 2020 09:36:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36A606E2B4
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 09:36:06 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id q5so17117220wru.6
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 02:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=zd3hMZ6jTMVpvEqLVZwEN55R94PoroeJHFEcHCEFqVQ=;
 b=kTBBVlsC9e43rf09etp8fCt18Y3wM0WlVE5CwPvXkNHO2U4nUHW4UZ67UA9ckbRY33
 TnSE0eP0Zthv72OZWg8OZ5FI9VF80Ctv4yb0QT/+s2vJUCPYEPYl8IgxUFIxtO61pXzS
 mM/+YActrKyhNVy/5SEC4JLG3KUkTOopSiOYVda/q16drbWQJ3KM99jOyXVoS5d+XlNg
 hV1rSkIf943RqBKh7q0QojJdfGt2vk3CWXUKByU7OGBfSxaXLQKDaViD2TNyr4ZJO2js
 iBdb0w1YxreRKEsvi4vuL5tvG+Vk2psa8N/bZHmrhy+CBbcXdc59kNMRQz6rdGOPT8qr
 TYxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=zd3hMZ6jTMVpvEqLVZwEN55R94PoroeJHFEcHCEFqVQ=;
 b=UZM3Rl7ztub/59LqDD0ryEMsLcKE87R7DRyzA7H6SLdevtgjA+iihM0V2Y/Is3OOq2
 UIAKdOOxUtawfdq1Reuy/rhzj3NrGbXYl0Gx5AiKU81itCcCZIxg/0vW5qtfzk5uGdIf
 5d/rOBwAxlMMem+SczZ6Cyl+zWHrjBZ3wSrZA1d6M2okBYYMvsS5aw9DKHhhBwawpi0d
 A29swi2ZJyDAVw/vUbjAdon9sGRLsZOc90CO62dS33qL2EfUGepOqEt4+lrrdvaZM1dO
 5w4XX2fVNYdgLmx4faJqWeaNmHmrgoxLX/YK1bVMPeGDaP5paUj0FLTGWVS9xhftxxcX
 B/+w==
X-Gm-Message-State: AOAM531KYqEYrn1UBG86yFDt5LazJW3C+j2b73Own44in5Qcu/ZS8JEn
 O/Cmgybf3cGZakJLCLdOOzswxBhO79E=
X-Google-Smtp-Source: ABdhPJynB4npHFycjyW7pEMsYdT+xIjEXcJnZnCF1NpojzzkoEJrVaNiN9teoC2u+pkXJtweZXlzbQ==
X-Received: by 2002:adf:dd83:: with SMTP id x3mr23265244wrl.292.1595237764811; 
 Mon, 20 Jul 2020 02:36:04 -0700 (PDT)
Received: from dell ([2.27.167.94])
 by smtp.gmail.com with ESMTPSA id k14sm30904848wrn.76.2020.07.20.02.36.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 02:36:04 -0700 (PDT)
Date: Mon, 20 Jul 2020 10:36:01 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v5 0/19] backlight: backlight updates
Message-ID: <20200720093601.GA3368211@dell>
References: <20200719080743.8560-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200719080743.8560-1-sam@ravnborg.org>
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

T24gU3VuLCAxOSBKdWwgMjAyMCwgU2FtIFJhdm5ib3JnIHdyb3RlOgoKPiBIaSBhbGwuCj4gCj4g
Rm9sbG93LXVwIG9uIHY0IC0gd2l0aCBvbmx5IGEgZmV3IGNoYW5nZXMgbGlzdGVkIGJlbG93IGFu
ZAo+IGluIHRoZSBpbmRpdmlkdWFsIHBhdGNoZXMuCj4gVGhhbmtzIGZvciBhbGwgdGhlIHJldmll
d3MgYW5kIHRoZSBmZWVkYmFjayBvbiB0aGUgcGF0Y2hlcyEKPiAKPiBJIGFtIHBsYW5uaW5nIGEg
Zm9sbG93LXVwIG9uIHRoaXMgcGF0Y2hzZXQgdG8gdXBkYXRlIHRoZQo+IGJhY2tsaWdodCBkcml2
ZXJzIGFsbCBvdmVyIHRvIHVzZSBiYWNrbGlnaHRfZ2V0X2JyaWdodG5lc3MoKQo+IGFuZCBiYWNr
bGlnaHRfaXNfYmxhbmsoKSBhcyBhcHByb3ByaWF0ZS4KClsuLi5dCgo+IFNhbSBSYXZuYm9yZyAo
MTkpOgo+ICAgICAgIGJhY2tsaWdodDogcmVmYWN0b3IgZmJfbm90aWZpZXJfY2FsbGJhY2soKQo+
ICAgICAgIGJhY2tsaWdodDogYWRkIGJhY2tsaWdodF9pc19ibGFuaygpCj4gICAgICAgYmFja2xp
Z2h0OiBpbXByb3ZlIGJhY2tsaWdodF9vcHMgZG9jdW1lbnRhdGlvbgo+ICAgICAgIGJhY2tsaWdo
dDogaW1wcm92ZSBiYWNrbGlnaHRfcHJvcGVydGllcyBkb2N1bWVudGF0aW9uCj4gICAgICAgYmFj
a2xpZ2h0OiBpbXByb3ZlIGJhY2tsaWdodF9kZXZpY2UgZG9jdW1lbnRhdGlvbgo+ICAgICAgIGJh
Y2tsaWdodDogZG9jdW1lbnQgaW5saW5lIGZ1bmN0aW9ucyBpbiBiYWNrbGlnaHQuaAo+ICAgICAg
IGJhY2tsaWdodDogZG9jdW1lbnQgZW51bXMgaW4gYmFja2xpZ2h0LmgKPiAgICAgICBiYWNrbGln
aHQ6IHJlbW92ZSB0aGUgdW51c2VkIGJhY2tsaWdodF9ibCBkcml2ZXIKPiAgICAgICBiYWNrbGln
aHQ6IGRyb3AgZXh0ZXJuIGZyb20gcHJvdG90eXBlcwo+ICAgICAgIGJhY2tsaWdodDogYWRkIG92
ZXJ2aWV3IGFuZCB1cGRhdGUgZXhpc3RpbmcgZG9jCj4gICAgICAgYmFja2xpZ2h0OiB3aXJlIHVw
IGtlcm5lbC1kb2MgZG9jdW1lbnRhdGlvbgo+ICAgICAgIGJhY2tsaWdodDogaW50cm9kdWNlIGJh
Y2tsaWdodF9nZXRfYnJpZ2h0bmVzcygpCj4gICAgICAgYmFja2xpZ2h0OiBhczM3MTFfYmw6IHNp
bXBsaWZ5IHVwZGF0ZV9zdGF0dXMKPiAgICAgICBiYWNrbGlnaHQ6IGNyX2JsbGNkOiBpbnRyb2R1
Y2UgZ3Bpby1iYWNrbGlnaHQgc2VtYW50aWNzCj4gICAgICAgYmFja2xpZ2h0OiBncGlvX2JhY2ts
aWdodDogc2ltcGxpZnkgdXBkYXRlX3N0YXR1cygpCj4gICAgICAgYmFja2xpZ2h0OiBqb3JuYWRh
NzIwX2JsOiBpbnRyb2R1Y2UgYmFja2xpZ2h0X2lzX2JsYW5rKCkKPiAgICAgICBiYWNrbGlnaHQ6
IHVzZSBiYWNrbGlnaHRfZ2V0X2JyaWdodG5lc3MoKQo+ICAgICAgIGJhY2tsaWdodDogZHJvcCBi
YWNrbGlnaHRfcHV0KCkKPiAgICAgICBiYWNrbGlnaHQ6IG1ha2Ugb2ZfZmluZF9iYWNrbGlnaHQg
c3RhdGljCgpBbGwgYXBwbGllZCwgYnV0IHRvIGJlIGhvbmVzdCwgdGhhdCB3YXMgcXVpdGUgcGFp
bmZ1bC4KCkEgZmV3IG5vdGVzIGZvciBzdWJzZXF1ZW50IHBhdGNoZXMuCgogLSBFbmFibGUgc3Bl
bGwtY2hlY2tlcnMgaW4geW91ciBlZGl0b3JzCiAgIC0gSSBmaXhlZCB0aGUgaXNzdWVzIHVwIGZv
ciB5b3UgaGVyZSAtIHRoZXJlIHdlcmUgcXVpdGUgYSBmZXchCiAtIFJ1biAuL2NoZWNrcGF0Y2gu
cGwgYmVmb3JlIHN1Ym1pdHRpbmcgLSBoZXJlJ3Mgd2hhdCBJIGZpbmQgdXNlZnVsCiAgICogLmdp
dC9ob29rcy9wb3N0LWNvbW1pdDogaHR0cHM6Ly9wYXN0ZWJpbi51YnVudHUuY29tL3AvV3BQRmQ2
TTJyQi8KIC0gUGxlYXNlIGtlZXAgdGhlIGluLXBhdGNoIGNoYW5nZWxvZyBiZWxvdyB0aGUgJy0t
LScgbGluZSwgc28gdGhhdCBpdAogICBkb2VzIG5vdCBlbmQgdXAgaW4gdGhlIGZpbmFsIGNvbW1p
dCBsb2cKIC0gQ2M6IGxpbmVzICphYm92ZSogdGhlICotYnlzIHBsZWFzZQogLSBDYzogbGluZXMg
ZHJvcHBlZCBmb3IgYW55ICotYnlzIHByb3ZpZGVkCiAtIExpbmVzIHdyYXBwZWQgfjcyIGNoYXJz
IChub3QgNTApCiAtIE9uZSB3aG9sZSBlbXB0eSBsaW5lIHNwYWNpbmcgYmV0d2VlbiBwYXJhZ3Jh
cGhzCiAtIEVuc3VyZSB5b3UgdXNlIHRoZSBmb3JtYXR0aW5nIGV4cGVjdGVkIG9mIHRoZSBzdWJz
eXN0ZW0gLSBpbiB0aGUKICAgY2FzZSBvZiBCYWNrbGlnaHQgaXQnczoKCiAgICAgPHN1YnN5c3Rl
bT46IDxmaWxlPjogU3ViamVjdCBiZWdpbm5pbmcgd2l0aCBhbiB1cHBlci1jYXNlIGNoYXIKCiAg
IEEgYGdpdCBsb2cgLS1vbmVsaW5lIC0tIHN1YnN5c3RlbWAgd291bGQgZ2l2ZSB5b3UgYSBnb29k
IGlkZWEgb2YKICAgd2hhdCdzIGV4cGVjdGVkLgoKLS0gCmxlZSBKb25lcyBb5p2O55C85pavXQpT
ZW5pb3IgVGVjaG5pY2FsIExlYWQgLSBEZXZlbG9wZXIgU2VydmljZXMKTGluYXJvLm9yZyDilIIg
T3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFybSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29r
IHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
