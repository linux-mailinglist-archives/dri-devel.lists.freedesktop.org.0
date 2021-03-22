Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FD5344D6B
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 18:34:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 996356E037;
	Mon, 22 Mar 2021 17:34:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D38216E037
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 17:34:16 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id k10so22664849ejg.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 10:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=itvxu6pseNvAArTXkxBUqpwVqMnWpn85hJGn4Cdpwhg=;
 b=uNTiuiHb//r+7s512XtcPzPyLF04pqLQ3NrFXgaoxYNR2RU0pDoYy1ZNFTfKaRBx3R
 qUpdSxsLmTiozn+u05mEF/2mOns8JJqI3whi5eUsFhPYQd4a/eGXutlrOs1KdMC5vKXZ
 D5NfmKie5T8TXOEpLX3eqXPKF/2ibqi+auQ3HJUAWhdl0PiQcmhIE+gj58H/w7T4dyTb
 KY/Ex9Y+BtG5FhKLOWVluiKYgNltP/jhOs8Abi1ZipK2VPfsg0P3Rx5+52mA6aIxLF5Q
 D+A7SD93d2c23HV9ByoiID4u+zWDyy2KubD1XKv/mr87//jjBOOUc3lGWiUyiBSMvn7b
 dSLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=itvxu6pseNvAArTXkxBUqpwVqMnWpn85hJGn4Cdpwhg=;
 b=DL1qoA9elOMvFXSCN5hK+/3NLsHyozH58QUy+zXntF/RBJmTounVadP5Jf819qLdjG
 nB+y0Fnc2Ld8PI+W2hJWobFkxtjpG/J+QySY5EF+ppzMtbX0C3A2tbwhGS5Bx/IzU979
 C2lrCWwQa2ldsvb1y49/fNoPipdoJ3c2gWuGuJ+TzzBHf+JcVm8FKOkNWSsQLz+Vmvhu
 7w1BxRavcGuPTPEgUEjx84M3hRYM5lvJ17DMqjsaBrcUB6CxS2EcowyuGYpYA5VG/rhd
 Vo6uBWq0rCB5fuzLNfkY3Iwnf7EhTiy4qbg6ZKO6TbWLsjAgBz7LM9tR+fmUDXG4R2wZ
 32PQ==
X-Gm-Message-State: AOAM532nttiIvzCCbt1ew5GVWWMGLftr3ETVnQHbMdyj6+Lc2CesChdH
 SnlKLGaS6jMTVQsH5a6ujPn5Gw==
X-Google-Smtp-Source: ABdhPJw9FtwQ6aO2ECGVnHO58EnkDcEQ+fGQM9CFtqdocU6sXQqPcqwjPD5Dl/pLvT5flLaGRSP8fw==
X-Received: by 2002:a17:906:340d:: with SMTP id
 c13mr934869ejb.29.1616434455577; 
 Mon, 22 Mar 2021 10:34:15 -0700 (PDT)
Received: from dell ([91.110.221.180])
 by smtp.gmail.com with ESMTPSA id n3sm9867573ejj.113.2021.03.22.10.34.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 10:34:15 -0700 (PDT)
Date: Mon, 22 Mar 2021 17:34:13 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Kiran Gunda <kgunda@codeaurora.org>
Subject: Re: [PATCH V5 1/2] backlight: qcom-wled: Fix FSC update issue for
 WLED5
Message-ID: <20210322173413.GC2916463@dell>
References: <1616071180-24493-1-git-send-email-kgunda@codeaurora.org>
 <1616071180-24493-2-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1616071180-24493-2-git-send-email-kgunda@codeaurora.org>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 daniel.thompson@linaro.org, b.zolnierkie@samsung.com, jingoohan1@gmail.com,
 Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 linux-fbdev@vger.kernel.org, robh+dt@kernel.org, jacek.anaszewski@gmail.com,
 pavel@ucw.cz, linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
 linux-leds@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAxOCBNYXIgMjAyMSwgS2lyYW4gR3VuZGEgd3JvdGU6Cgo+IEN1cnJlbnRseSwgZm9y
IFdMRUQ1LCB0aGUgRlNDIChGdWxsIHNjYWxlIGN1cnJlbnQpIHNldHRpbmcgaXMgbm90Cj4gdXBk
YXRlZCBwcm9wZXJseSBkdWUgdG8gZHJpdmVyIHRvZ2dsaW5nIHRoZSB3cm9uZyByZWdpc3RlciBh
ZnRlcgo+IGFuIEZTQyB1cGRhdGUuCj4gCj4gT24gV0xFRDUgd2Ugc2hvdWxkIG9ubHkgdG9nZ2xl
IHRoZSBNT0RfU1lOQyBiaXQgYWZ0ZXIgYSBicmlnaHRuZXNzCj4gdXBkYXRlLiBGb3IgYW4gRlND
IHVwZGF0ZSB3ZSBuZWVkIHRvIHRvZ2dsZSB0aGUgU1lOQyBiaXRzIGluc3RlYWQuCj4gCj4gRml4
IGl0IGJ5IGFkb3B0aW5nIHRoZSBjb21tb24gd2xlZDNfc3luY190b2dnbGUoKSBmb3IgV0xFRDUg
YW5kCj4gaW50cm9kdWNpbmcgbmV3IGNvZGUgdG8gdGhlIGJyaWdodG5lc3MgdXBkYXRlIHBhdGgg
dG8gY29tcGVuc2F0ZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBLaXJhbiBHdW5kYSA8a2d1bmRhQGNv
ZGVhdXJvcmEub3JnPgo+IFJldmlld2VkLWJ5OiBEYW5pZWwgVGhvbXBzb24gPGRhbmllbC50aG9t
cHNvbkBsaW5hcm8ub3JnPgo+IC0tLQo+ICBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9xY29tLXds
ZWQuYyB8IDI1ICsrKysrKysrKysrKysrKysrKystLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDE5
IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpBcHBsaWVkLCB0aGFua3MuCgotLSAKTGVl
IEpvbmVzIFvmnY7nkLzmlq9dClNlbmlvciBUZWNobmljYWwgTGVhZCAtIERldmVsb3BlciBTZXJ2
aWNlcwpMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKRm9s
bG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
