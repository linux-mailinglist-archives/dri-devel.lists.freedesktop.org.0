Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D10FCE9763
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2019 08:50:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90A6B6E8AC;
	Wed, 30 Oct 2019 07:50:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C28F6E8AC
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 07:50:51 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id s1so1140778wro.0
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 00:50:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=FLPIpnHOBePg/Y6da8w9/WRUoNiVkxQNWcq2DQOe07M=;
 b=FbIjCVyjkyh7ZXtqPw1w89UbG0WrkL0qS/YEvNgLej3DWg1zXALnKdP2CruDX01P+t
 W1RkUllm7soxjy9xgPQxOofRIgwuuWxCuzSJEVv4qzZb+k0iGfv8lh6znh3XnHtH+vEU
 f/naZbebnXxt5dnO2RQhpilhavAANaKF0lGZq572nGI6+JRMJo/AbiuXyiVTS0NeZCn/
 jOy4W1mU2nNvn4I3mIMTxvenHN5Do936brPnEsFsXfqLzc+6ovf4L+VoArud+F/wkepM
 eGKx7zSBLaJ2kPb2l0+7UyLzVNaXkqUbOLkPLUfNZ+fuiBkYtVL2AIqMS7vopY4Z50Oi
 +Erw==
X-Gm-Message-State: APjAAAUVcArnF+PLMWvLwXPQrG3joQYqbYtgYhhXlzQ00G1u0TUdpOdx
 kY0NYc/yr3PEPg6OYwxYbcx3ZQ==
X-Google-Smtp-Source: APXvYqxqLawwSBkqOwElIXw0EitJZw7c5fIQELur6Ziwo9Eowbi50RtGdHxZjDIulp8GE33dkMbA8A==
X-Received: by 2002:a5d:4808:: with SMTP id l8mr22968551wrq.118.1572421849544; 
 Wed, 30 Oct 2019 00:50:49 -0700 (PDT)
Received: from dell ([2.31.163.64])
 by smtp.gmail.com with ESMTPSA id r19sm1929303wrr.47.2019.10.30.00.50.48
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 30 Oct 2019 00:50:49 -0700 (PDT)
Date: Wed, 30 Oct 2019 07:50:47 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [PATCH next] dt-bindings: backlight: lm3630a: fix missing include
Message-ID: <20191030075047.GC4484@dell>
References: <20191029185350.31155-1-andreas@kemnade.info>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191029185350.31155-1-andreas@kemnade.info>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=FLPIpnHOBePg/Y6da8w9/WRUoNiVkxQNWcq2DQOe07M=;
 b=XyPVZBz2kVqf6z+1cIyhTkCY9EFXOZzeQZGpHure5f5izzCxjf1ZVQ6kVBYmm9H1+U
 d/t30k/IvFZWYAj66fXjRzzv6d+hZ/7mVXinYxHIyoMrDgHZnV8vHynTWW4njmDFj9a6
 vEs84X07ky4e9x3e9KtjF1LWqsIFnWK6+82TOscZunOTqiGZeOYVRsNxts9VjEQKa+lt
 FhdpBJnumN6gY9IAN4yvMFF80r4RX3gQFjM1jg9NhL2pXmvBoC3b9DJa8zBtK6RPIeAl
 DqxNx0LhriVy4PCV06zjT9oR0h6QR3/Rd7c6ScnJbVfmiu0iLZnoBeXTiIVq1McqfwwE
 Y6MA==
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>, Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyOSBPY3QgMjAxOSwgQW5kcmVhcyBLZW1uYWRlIHdyb3RlOgoKPiBleGFtcGxlIGZh
aWxlZCB0byBjb21waWxlIGR1ZSB0byB1bmRlZmluZWQgR1BJT19BQ1RJVkVfSElHSAo+IGZpeCB0
aGF0IGJ5IGFkZGluZyB0aGUgbmVlZGVkICNpbmNsdWRlIHRvIHRoZSBleGFtbXBsZQo+IAo+IEZp
eGVzOiBhZTkyMzY1Y2RkNzUgKCJkdC1iaW5kaW5nczogYmFja2xpZ2h0OiBsbTM2MzBhOiBBZGQg
ZW5hYmxlLWdwaW9zIHRvIGRlc2NyaWJlIEhXRU4gcGluIikKPiBTaWduZWQtb2ZmLWJ5OiBBbmRy
ZWFzIEtlbW5hZGUgPGFuZHJlYXNAa2VtbmFkZS5pbmZvPgo+IC0tLQo+ICAuLi4vZGV2aWNldHJl
ZS9iaW5kaW5ncy9sZWRzL2JhY2tsaWdodC9sbTM2MzBhLWJhY2tsaWdodC55YW1sICAgIHwgMSAr
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKQXBwbGllZCwgdGhhbmtzLgoKLS0g
CkxlZSBKb25lcyBb5p2O55C85pavXQpMaW5hcm8gU2VydmljZXMgVGVjaG5pY2FsIExlYWQKTGlu
YXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCkZvbGxvdyBMaW5h
cm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
