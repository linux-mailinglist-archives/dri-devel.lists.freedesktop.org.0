Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4705A51FE
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 10:40:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 434C5899B0;
	Mon,  2 Sep 2019 08:40:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36BFC899B0
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 08:40:28 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id q19so4754807wmc.3
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2019 01:40:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=xl3Ai/AmJFR6ZhTztzr3SBL0HsX+mzfXY2ojYs65AK8=;
 b=HnWyICr/dN3gQ1IAVOHeqtdJqV5rWUoJUsqygnTiIRpi2kBue+DCpiyE9uiS0QWkAW
 tEd6FuRhRTCVZHQq4OnGgBEuYW37giKKvWaP0F2lwhxQr9MYVh3UhwCtbucPZ5h8hSd6
 VAgP6FZqspcPhdpaMhP7DTf/I319rEuryzWYYqre+2RMR8078vdTxT4pOju1wy4ed8vZ
 rQ2YOoCXrMRZ9v/c2UMpOgmX1N14fP8zjrtEJMazniqrrmTQfzCqRojTzyDyIFDrjohw
 EAPaGpUdbrjJo8LUXqMdKwrSf9xPxRUMU1P9pQF9OWCH+fhtvlxbA5DYWgekUdyUYrx5
 58gw==
X-Gm-Message-State: APjAAAVeAoTxmdZyku4aRZEkDu++eXF5d5nitAI0ASCDLFdAcxU6e7Ul
 CGc/+CaYkMMf33HlLx+IsInofjd2dhubjQ==
X-Google-Smtp-Source: APXvYqxQxojiBDTKZPusJic1q3Feb7uYrPchzyphP+/xVK/9HREqN30l5NNGO3CqPCl1x/VhD0itdQ==
X-Received: by 2002:a1c:a383:: with SMTP id m125mr34928752wme.57.1567413626783; 
 Mon, 02 Sep 2019 01:40:26 -0700 (PDT)
Received: from dell ([95.147.198.93])
 by smtp.gmail.com with ESMTPSA id v186sm32753984wmb.5.2019.09.02.01.40.25
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 02 Sep 2019 01:40:26 -0700 (PDT)
Date: Mon, 2 Sep 2019 09:40:24 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH resend] video: backlight: Drop default m for
 {LCD,BACKLIGHT_CLASS_DEVICE}
Message-ID: <20190902084024.GR4804@dell>
References: <20190813115853.30329-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190813115853.30329-1-geert@linux-m68k.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=xl3Ai/AmJFR6ZhTztzr3SBL0HsX+mzfXY2ojYs65AK8=;
 b=GjeWNFh0qzJtRNv2HvHvICds/YkS4LdvROFX4CYEyI+4pLuL3eNmjv3XCtsie8gXNe
 UptA6Vkinbxf2B4m2QNS2dJHMEtorZsE7he4AlyM6kxnQkbxQ1f7tXSrgZUlCujENiiQ
 KbDmM6mjgN1X8aIchZswmgojxyWJM8ZqFivrjFpBFHNiFl0ZK7dp2qGlBzByaJTsVy2O
 z02Ylk8HPjyWcmTuIKetoNU+djS6Hrh5wyc9L0icwNq/d6/cUgz5YMLD9DL24TFF7m0f
 G4YU3dPXlkUJVnHG/Nn0VffzjL7K/0IPs2J4ObsxpAclJ2CtmHwogXVcuk3OqX95oeqZ
 P57g==
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Alexander Shiyan <shc_work@mail.ru>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAxMyBBdWcgMjAxOSwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOgoKPiBXaGVuIHJ1
bm5pbmcgIm1ha2Ugb2xkY29uZmlnIiBvbiBhIC5jb25maWcgd2hlcmUKPiBDT05GSUdfQkFDS0xJ
R0hUX0xDRF9TVVBQT1JUIGlzIG5vdCBzZXQsIHR3byBuZXcgY29uZmlnIG9wdGlvbnMKPiAoIkxv
d2xldmVsIExDRCBjb250cm9scyIgYW5kICJMb3dsZXZlbCBCYWNrbGlnaHQgY29udHJvbHMiKSBh
cHBlYXIsIGJvdGgKPiBkZWZhdWx0aW5nIHRvICJtIi4KPiAKPiBEcm9wIHRoZSAiZGVmYXVsdCBt
IiwgYXMgb3B0aW9ucyBzaG91bGQgZGVmYXVsdCB0byBkaXNhYmxlZCwgYW5kIGJlY2F1c2UKPiBz
ZXZlcmFsIGRyaXZlciBjb25maWcgb3B0aW9ucyBhbHJlYWR5IHNlbGVjdCBMQ0RfQ0xBU1NfREVW
SUNFIG9yCj4gQkFDS0xJR0hUX0NMQVNTX0RFVklDRSB3aGVuIG5lZWRlZC4KPiAKPiBGaXhlczog
OGM1ZGM4ZDlmMTljNzk5MiAoInZpZGVvOiBiYWNrbGlnaHQ6IFJlbW92ZSB1c2VsZXNzIEJBQ0tM
SUdIVF9MQ0RfU1VQUE9SVCBrZXJuZWwgc3ltYm9sIikKPiBTaWduZWQtb2ZmLWJ5OiBHZWVydCBV
eXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPgo+IC0tLQo+ICBkcml2ZXJzL3ZpZGVv
L2JhY2tsaWdodC9LY29uZmlnIHwgMiAtLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMo
LSkKCkFwcGxpZWQsIHRoYW5rcy4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KTGluYXJvIFNl
cnZpY2VzIFRlY2huaWNhbCBMZWFkCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJl
IGZvciBBUk0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
