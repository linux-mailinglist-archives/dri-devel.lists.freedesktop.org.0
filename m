Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 196DAD8A4A
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 09:52:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F7A5891B9;
	Wed, 16 Oct 2019 07:52:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7939D891B9
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 07:52:22 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id 7so1742137wme.1
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 00:52:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=l+eDQw7b9v7Rw46oLorXW5Yed3sU+eig9M618FB+PL4=;
 b=ivwd/VsLKBXS8Wh/wpiszVADn4rtj58XuTiOkrVnmXThcKey12L9RhrQP18mQtOa+1
 xTa4nu1tIDr81SEu+PrtXsQvwoQGB58Qn3BYi+KJKzz//n+vXcRERUcS7EI4WofJgkel
 D5IVifVfKbMI6asrjDJRDvsbegrLyJMw18itEx2hLKZCfzz9R8xE7IATt1gewJgiYTLB
 okoIawjkHgkb9pt8MM5dKAw3TOErCC04QzY52nFYmolK/r32K6hGS4C9PZ7VfeorRHWK
 fnbZHWUvIgKOzhUWP6q8VekpeKqkRo/mwT8RsZObeFGo/QrUa+SpaYxDey/CkBTbX9GV
 odqg==
X-Gm-Message-State: APjAAAW0v2L0BUma96ivywpFq36LPQECj7tfpqDVcZ0TnPT0K3tU9dzT
 zFCqvtqjoX1Kskyign7+p02tTg==
X-Google-Smtp-Source: APXvYqy2R+5UwjDoVktwSQkiSJQLn97WIr2FWHdpPx/CIry4HyNQrzJNEJ4i9wILKyZVVU8qvWRaBA==
X-Received: by 2002:a7b:cf05:: with SMTP id l5mr2044282wmg.119.1571212340927; 
 Wed, 16 Oct 2019 00:52:20 -0700 (PDT)
Received: from dell ([95.149.164.86])
 by smtp.gmail.com with ESMTPSA id l11sm1630442wmh.34.2019.10.16.00.52.20
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 16 Oct 2019 00:52:20 -0700 (PDT)
Date: Wed, 16 Oct 2019 08:52:18 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH v2] backlight: pwm_bl: Don't assign levels table repeatedly
Message-ID: <20191016075218.GB4365@dell>
References: <20191002095541.v2.1.I4f2ede1f55ddd1c72b0303b7fd7f73a782fa33e5@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191002095541.v2.1.I4f2ede1f55ddd1c72b0303b7fd7f73a782fa33e5@changeid>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=l+eDQw7b9v7Rw46oLorXW5Yed3sU+eig9M618FB+PL4=;
 b=Zprs0y8kBPQ3qjTVj/r66c07zEzYHAzGc1PwpC8CEkHTDvqlLmt7M9IKkPG10MDX01
 D861ajFGmQM6HGs3TOMfSMF0Pe83Ip5jRZ55/ycWUp9KZ9IK11efTLb8xGOQhKdgb0wF
 xJjMI/h6Nl++vvudQQmifg+LMHoaMDAbSZKphm54kioxj9bGuPlc+qtMQ+nkiv/iSpel
 EhhAppoZJC+rVWeLFhgJb7pSEBRI7Xr5x3Xjkb+zL6MH+BhLHPhaESB7c8B95pqXhR1N
 q6WBHssNi/PNZA9Jkx8v2UHWiXPdNn7uPZ2K1uQsUWs+xYohzd7Ue5lt8SD9gFiVq90Y
 RpBQ==
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
Cc: linux-pwm@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAwMiBPY3QgMjAxOSwgTWF0dGhpYXMgS2FlaGxja2Ugd3JvdGU6Cgo+IHB3bV9iYWNr
bGlnaHRfcHJvYmUoKSByZS1hc3NpZ25zIHBiLT5sZXZlbHMgZm9yIGV2ZXJ5IGJyaWdodG5lc3MK
PiBsZXZlbC4gVGhpcyBpcyBub3QgbmVlZGVkIGFuZCB3YXMgbGlrZWx5IG5vdCBpbnRlbmRlZCwg
c2luY2UKPiBuZWl0aGVyIHNpZGUgb2YgdGhlIGFzc2lnbm1lbnQgY2hhbmdlcyBkdXJpbmcgdGhl
IGxvb3AuIEFzc2lnbgo+IHRoZSBmaWVsZCBvbmx5IG9uY2UuCj4gCj4gU2lnbmVkLW9mZi1ieTog
TWF0dGhpYXMgS2FlaGxja2UgPG1rYUBjaHJvbWl1bS5vcmc+Cj4gLS0tCj4gCj4gQ2hhbmdlcyBp
biB2MjoKPiAtIHJlbW92ZWQgY3VybHkgYnJhY2VzIGZyb20gZm9yIGxvb3AKPiAKPiAgZHJpdmVy
cy92aWRlby9iYWNrbGlnaHQvcHdtX2JsLmMgfCA3ICsrKy0tLS0KPiAgMSBmaWxlIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCkFwcGxpZWQsIHRoYW5rcy4KCi0tIApM
ZWUgSm9uZXMgW+adjueQvOaWr10KTGluYXJvIFNlcnZpY2VzIFRlY2huaWNhbCBMZWFkCkxpbmFy
by5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwpGb2xsb3cgTGluYXJv
OiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
