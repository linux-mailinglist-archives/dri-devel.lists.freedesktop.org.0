Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB6E345B14
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 10:40:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BA3B6E87C;
	Tue, 23 Mar 2021 09:40:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A63606E87D
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 09:40:46 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id r12so25977797ejr.5
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 02:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=zXs5SbjReTCcPNHIOjgz/S/VxQjjjOm2F5VH26PFX/A=;
 b=vj5G9pjhGIJnSvkO3MxGjzGfY8QUgcgIr8he+j8CuGbyyEfP5EQNfrmrCqoMO2CZZR
 bdckdLSvsCoLrRu48EzAHYo4oxQAXRsUdNra/JouZ1qUvhf0uMbOSV9a8F/maOBLtAGe
 RV8MmfA3GtVVlaVinDJ3S/lzsL0qE8O+YupeIpqcYG0BGXJHE1Cmp6/9QWlQ43zL/NC1
 yqNdlWiaSh5Wv3ibiPp3WlVe3b07LVjSxW+cyyrOQWmSgGZNcN5r0izAQP2icBVact0v
 03lDSR3Wp+6bfpj+WhlvsvC7QM5dX/IjE1uKpWf59cRSsmbH828i6f8T/ahuVCQ1UXlk
 uGJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=zXs5SbjReTCcPNHIOjgz/S/VxQjjjOm2F5VH26PFX/A=;
 b=rsNp2und4F0+uVnd7wdJ0IOQnAclqHoCjrQpF7IhER+of/SZ2ZZ1me3qL7jfxbub+r
 VuIV03uqGEHFHWsKqWcG0uKPRUfddxMsSm3JytYDEGnTLCUgrO/TcNnZCHpkfqoPSkH7
 +pMYpU2rwd0SYJNOStrmEZYTpCbQzpBo1zMmT/Svs0hgIByhJns15WMhk4FrpsiwGDYW
 xFZYluCDmB6AFrmXmERSyFMpRocTccX23HIjmDjNmi4ecZk7R3at5/FNH+GAReW8NkqV
 R7I0P/VPlXLGbua32LWyrTQStHnR94qWVKw3BTx+U5uCp0F26GsS1u/h+lLr5xA/YHD+
 f+zA==
X-Gm-Message-State: AOAM530f7fRzxhC0bk2KY08zQlm67kKMXQpk6NnLXTM1/BOVGlR2+07j
 c84YsDCljPgWB2zUpQhcSLUKiQ==
X-Google-Smtp-Source: ABdhPJwpBn5eyAJHqJLdU0Wab+Ro1IIWRDZ1hGuA1iPJeA/Fp0ww4Ebsg8Pw9LsY5dn4holDmh/FWw==
X-Received: by 2002:a17:906:53d7:: with SMTP id
 p23mr4111539ejo.140.1616492445327; 
 Tue, 23 Mar 2021 02:40:45 -0700 (PDT)
Received: from dell ([91.110.221.180])
 by smtp.gmail.com with ESMTPSA id 90sm12948482edf.31.2021.03.23.02.40.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 02:40:44 -0700 (PDT)
Date: Tue, 23 Mar 2021 09:40:41 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Kiran Gunda <kgunda@codeaurora.org>
Subject: Re: [PATCH V5 2/2] backlight: qcom-wled: Correct the sync_toggle
 sequence
Message-ID: <20210323094041.GT2916463@dell>
References: <1616071180-24493-1-git-send-email-kgunda@codeaurora.org>
 <1616071180-24493-3-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1616071180-24493-3-git-send-email-kgunda@codeaurora.org>
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

T24gVGh1LCAxOCBNYXIgMjAyMSwgS2lyYW4gR3VuZGEgd3JvdGU6Cgo+IEFzIHBlciB0aGUgY3Vy
cmVudCBpbXBsZW1lbnRhdGlvbiwgYWZ0ZXIgRlNDIChGdWxsIFNjYWxlIEN1cnJlbnQpCj4gYW5k
IGJyaWdodG5lc3MgdXBkYXRlIHRoZSBzeW5jIGJpdHMgYXJlIHNldC10aGVuLWNsZWFyZWQuCj4g
QnV0LCB0aGUgRlNDIGFuZCBicmlnaHRuZXNzIHN5bmMgdGFrZXMgcGxhY2Ugd2hlbiB0aGUgc3lu
YyBiaXRzIGFyZQo+IHNldCAoZS5nLiBvbiBhIHJpc2luZyBlZGdlKS4gU28gdGhlIGhhcmR3YXJl
IHRlYW0gcmVjb21tZW5kcyBhCj4gY2xlYXItdGhlbi1zZXQgYXBwcm9hY2ggaW4gb3JkZXIgdG8g
Z3VhcmFudGVlIHN1Y2ggYSB0cmFuc2l0aW9uCj4gcmVnYXJkbGVzcyBvZiB0aGUgcHJldmlvdXMg
cmVnaXN0ZXIgc3RhdGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogS2lyYW4gR3VuZGEgPGtndW5kYUBj
b2RlYXVyb3JhLm9yZz4KPiBSZXZpZXdlZC1ieTogRGFuaWVsIFRob21wc29uIDxkYW5pZWwudGhv
bXBzb25AbGluYXJvLm9yZz4KPiAtLS0KPiAgZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcWNvbS13
bGVkLmMgfCAxMiArKysrKystLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygr
KSwgNiBkZWxldGlvbnMoLSkKCkFwcGxpZWQsIHRoYW5rcy4KCi0tIApMZWUgSm9uZXMgW+adjueQ
vOaWr10KU2VuaW9yIFRlY2huaWNhbCBMZWFkIC0gRGV2ZWxvcGVyIFNlcnZpY2VzCkxpbmFyby5v
cmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBcm0gU29DcwpGb2xsb3cgTGluYXJvOiBG
YWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
