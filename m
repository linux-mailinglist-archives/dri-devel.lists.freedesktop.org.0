Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C6ADBE85
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 09:38:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2A1B6EAD4;
	Fri, 18 Oct 2019 07:38:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F36C6EAD4
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 07:38:39 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id p4so5058469wrm.8
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 00:38:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=dSeQpsX1lWyhJjjqgCnSOVYN/QoRMRw+pYlbFd08lMw=;
 b=dBcIvkmmB15Y8M1/uyj69D9MGlkN1pzuysUtZtIclqRdzWw6+hSWsrwhb4EKb+tuEY
 etSKFcA5U6M6vhagSM9dkozmNjzhwx/24OtaDdyR+h1r74Lroqs22FSAjwG+5dK03cNC
 FCm9D1va+ZxogDqMhOj0yfXwVGpgZ8RQjjaBRMUvVYgK/jmA2vbRL1w2DmS1hOxm85da
 DhF5mpy45TabzW03YkQPXjuc1YYcyu+2BeDWzAGHxcAvpXbnn98oGgkN8pIBPu0vfme8
 r9Bt82TTMom1W/3b5mLRq/QdHdfCk9QUpBywS4RkUokW+0StaSV3tgqPmnodiBPSk6zg
 8+LQ==
X-Gm-Message-State: APjAAAVS/WsPod4JdVsPDJG/fjYzl0GvBkzIVJbRQJLCTEN7Pm0oO9N+
 ihe+jFPmKfUvGqKKT3dX9tqMgg==
X-Google-Smtp-Source: APXvYqyMG++9BlE+2Kvq0zYfc9v90AGN3ajctmqk/j3JHgJFv9ZF19h9kZYjj54VOjc0kFu8V8CcXg==
X-Received: by 2002:adf:ed84:: with SMTP id c4mr6235302wro.333.1571384317887; 
 Fri, 18 Oct 2019 00:38:37 -0700 (PDT)
Received: from dell ([95.149.164.47])
 by smtp.gmail.com with ESMTPSA id 36sm5585697wrp.30.2019.10.18.00.38.37
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 18 Oct 2019 00:38:37 -0700 (PDT)
Date: Fri, 18 Oct 2019 08:38:35 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH 29/34] backlight/jornada720: Use CONFIG_PREEMPTION
Message-ID: <20191018073835.GU4365@dell>
References: <20191015191821.11479-1-bigeasy@linutronix.de>
 <20191015191821.11479-30-bigeasy@linutronix.de>
 <20191017113707.lsjwlhi6b4ittcpe@holly.lan>
 <20191017132324.GP4365@dell>
 <20191017132846.ojsh27celyl76dlx@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191017132846.ojsh27celyl76dlx@linutronix.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=dSeQpsX1lWyhJjjqgCnSOVYN/QoRMRw+pYlbFd08lMw=;
 b=hz3XrSB+KBpqUPLDKyw2Jxr41b1CEp+1/qVyRxUWVhXQ2yO3pcwZzRTc/RmcOuftAe
 JDBdUygHnnCUA5eOUl15iri/Q+pJwjNj8QpABl/LDSDeAgJpmMZHz+yGbcIXyfe2T2rZ
 FdvN77qt6r5RmRuiTi8yBUPRt0a5xjswyuHdWiBKGCTG+oN1++x4EHZ0rAVV+SFC9hs6
 UDxdd63AtrdBw+WdHn1Vt/5QnsArLFY/nkfXoHP1FgeOnU37SLfzYzzzlHSa1ZHOSYSi
 ztfjgTFwRkHM3MohnmPFb+9aAdSDakwj2NKY9LhRrbQ4q9QibxP+9iEtqyGG4Bho2xcJ
 y52g==
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
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 tglx@linutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAxNyBPY3QgMjAxOSwgU2ViYXN0aWFuIEFuZHJ6ZWogU2lld2lvciB3cm90ZToKCj4g
T24gMjAxOS0xMC0xNyAxNDoyMzoyNCBbKzAxMDBdLCBMZWUgSm9uZXMgd3JvdGU6Cj4gPiBTbyB3
aGF0IGFyZSB0aGUgT1AncyBleHBlY3RhdGlvbnMgaW4gdGhhdCByZWdhcmQ/ICBJIHNlZSB0aGlz
IGlzIGEKPiA+IGxhcmdlIHNldCBhbmQgSSBhbSBvbmx5IHByaXZ5IHRvIHRoaXMgcGF0Y2gsIHRo
dXMgbGFjayB3aWRlcgo+ID4gdmlzaWJpbGl0eS4gIERvZXMgdGhpcyBwYXRjaCBkZXBlbmQgb24g
b3RoZXJzLCBvciBpcyBpdCBpbmRlcGVuZGVudD8KPiA+IEknbSBoYXBweSB0byB0YWtlIGl0LCBi
dXQgd2lzaCB0byBhdm9pZCBiaXNlY3RhYmlsaXR5IGlzc3VlcyBpbiB0aGUKPiA+IG5leHQgcmVs
ZWFzZSBrZXJuZWwuCj4gCj4gSXQgaXMgaW5kZXBlbmRlbnQsIHlvdSBjYW4gYXBwbHkgaXQgdG8g
eW91ciAtbmV4dCBicmFuY2guIEFsbAo+IGRlcGVuZGVuY2llcyBhcmUgbWVyZ2VkLgo+IAo+IFNl
YmFzdGlhbgoKV29uZGVyZnVsLiAgVGhhbmtzIGZvciB0aGUgaW5mby4KCi0tIApMZWUgSm9uZXMg
W+adjueQvOaWr10KTGluYXJvIFNlcnZpY2VzIFRlY2huaWNhbCBMZWFkCkxpbmFyby5vcmcg4pSC
IE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9v
ayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
