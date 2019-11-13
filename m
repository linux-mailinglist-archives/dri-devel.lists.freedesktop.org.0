Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C91FAFBA
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 12:32:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA9446ECDF;
	Wed, 13 Nov 2019 11:32:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 927EE6ECE2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 11:32:19 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id i10so1937536wrs.7
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 03:32:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=sS3GaEsmYVTT8e7e9aE8xCn5QY0c0oDK5wXddhigAzo=;
 b=VvT2VJLn0F4B891Aa2L/LWv5WCoV0SvEO/gmVHVAIMNmb2/64JZCeh39UIo1svxnZR
 A29Zy63rQ5Jy0uZSvB6A0AfEdpc3DLTre1q/1VbE10hn0wqWWl2q+sqO5rdWQL/W0PmK
 LwgJWcqzq/dcHJxKPvBQWKNGmGRIj/5MQKFyBaBuu0MTfcCnydMTMJugPTuzX13TJHD5
 3/20dQeQoUstAUwvuw/xknMChuc9kglYp6uFic09WXsrVe7CX64AyqjuLfR/xRzOxuPF
 dYDTJTlYFZ1n5s73G0lFOXdEWyYAkccYiv0nLSboEi0HrO3rQpyu9URUQaosF9PYbEV8
 cvhA==
X-Gm-Message-State: APjAAAVExczdLR2wFmtLQKUsRIZaU6SPSkkUwchqTbj4q8sx9iyz3HZb
 LPN3f/aqyi6BNUmC3vVtNClkqw==
X-Google-Smtp-Source: APXvYqznHxf9lTwtcWainnqvBciljEaqd825jlA+LPO+60naLZWLA4kld7qN7etRMPJUI7I//NyhTw==
X-Received: by 2002:adf:e94e:: with SMTP id m14mr2414909wrn.233.1573644738184; 
 Wed, 13 Nov 2019 03:32:18 -0800 (PST)
Received: from dell ([2.27.35.135])
 by smtp.gmail.com with ESMTPSA id o10sm2519246wrq.92.2019.11.13.03.32.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Nov 2019 03:32:17 -0800 (PST)
Date: Wed, 13 Nov 2019 11:32:06 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Colin King <colin.king@canonical.com>
Subject: Re: [PATCH][next] backlight: qcom-wled: fix spelling mistake
 "trigged" -> "triggered"
Message-ID: <20191113113206.GB3285@dell>
References: <20191112093025.98638-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191112093025.98638-1-colin.king@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=sS3GaEsmYVTT8e7e9aE8xCn5QY0c0oDK5wXddhigAzo=;
 b=CYO8M14unOarpyCMrij5/QgQvuSQhghb6lNIxYwEhmTJDfQAfPVC9+D7zTsLxANKmS
 XOhtiJRx+PgD9O/gBnG++DQiXFXLxHrROmodJu9nwj/KRsEGGR/sftjKT7S2uSI+5VLl
 yZe9beW3UNVHVWEbNmNwB8mDKLDxLgYDXytky5cZjStLFR3FjqTa61F3vDNXnNvvHzYe
 76Mtd4Rb98ulGoJENiFUg2nXaB9MM4MH+IALrHn9VUFjNIr1cubho30W9ayKiPYXDCGo
 CssQBKMiFAx8N4DrCpDWlqKhpuZNe4KLEWF3QmcEx3zZjaQK6pN0pOBJYFnXcN7QiGiW
 QAMw==
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
 Jingoo Han <jingoohan1@gmail.com>, kernel-janitors@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAxMiBOb3YgMjAxOSwgQ29saW4gS2luZyB3cm90ZToKCj4gRnJvbTogQ29saW4gSWFu
IEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KPiAKPiBUaGVyZSBpcyBhIHNwZWxsaW5n
IG1pc3Rha2UgaW4gYSBkZXZfZXJyIGVycm9yIG1lc3NhZ2UuIEZpeCBpdC4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgo+IC0tLQo+
ICBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9xY29tLXdsZWQuYyB8IDIgKy0KPiAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpBcHBsaWVkLCB0aGFua3MuCgot
LSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dCkxpbmFybyBTZXJ2aWNlcyBUZWNobmljYWwgTGVhZApM
aW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKRm9sbG93IExp
bmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
