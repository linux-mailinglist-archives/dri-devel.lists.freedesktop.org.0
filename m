Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4EAF70A1
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2019 10:25:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BBD66E871;
	Mon, 11 Nov 2019 09:25:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F02046E871
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2019 09:25:52 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id 8so12436731wmo.0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2019 01:25:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=OhCha09COfgKPtZLiOdmeCfAFANdSRBnfQoI436vAFc=;
 b=mJTDCmznsZ/BbYIIJutzqCa5cAGeAF2AwJOvsKctCXnH5HoR599eb2OJjJe5DyJwkU
 cbbTyk15BD0gxkD2lk3alIYk1XV/R4kHKAikaSyWDIZCAtEITnjnpFedfO2BuG5C+XJ6
 WclEVxscbkIw2xCr5s8pV7cbwc3OC0djvD7LmjtyVj5ob4TVB2XaDuxAhK74pOYpneXL
 EecSG0lhhbo50ERoEYnBmfja62yAFcIbc+QIsZUc/U9gZmHNA34+ZcJ4F3aOKrqwBKM8
 v1nKQy/87FHvWRnPCIw+6ydRV263lTW5TmkkqAjMrd4kkvD2HB3BtTkG3Rw+0U7JcOaW
 DlEQ==
X-Gm-Message-State: APjAAAVIJfqnqM62NJDGp+QwMs3slp+lXwLcIxL5wLdc4tAqOPmc8QlD
 B63g7OnsUyyUCW65lJNBshPTaA==
X-Google-Smtp-Source: APXvYqx9qAByoszcpaFD12J1nUjhRfEepvndPETih1nX2g0RiujoIcYX0NEsOgXnWOvGeTz1TgEM2w==
X-Received: by 2002:a1c:6146:: with SMTP id v67mr19985324wmb.102.1573464351581; 
 Mon, 11 Nov 2019 01:25:51 -0800 (PST)
Received: from dell ([95.147.198.88])
 by smtp.gmail.com with ESMTPSA id a5sm15368078wrv.56.2019.11.11.01.25.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2019 01:25:51 -0800 (PST)
Date: Mon, 11 Nov 2019 09:25:43 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Kiran Gunda <kgunda@codeaurora.org>
Subject: Re: [PATCH V10 8/8] backlight: qcom-wled: Add auto string detection
 logic
Message-ID: <20191111092543.GV18902@dell>
References: <1572589624-6095-1-git-send-email-kgunda@codeaurora.org>
 <1572589624-6095-9-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1572589624-6095-9-git-send-email-kgunda@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=OhCha09COfgKPtZLiOdmeCfAFANdSRBnfQoI436vAFc=;
 b=kZPZiQyy9gd/WCmfdT0wc6TN4JLHAvMXmaxLilUQegA2YhfTRSZrmqW7TKLSuPyMDn
 +x8tdXkQ7PW4Br2k0sinujFdrQ7SCrG+PpDq/RZ542MrG9L57mfRQnYkxFm0lbRJ30VI
 uFRc/EUwu7WA2upRC0lelKTE0WBo2EFku5QrFMhqrmseZP5tpMzx71G7sBUu/Tuep6fL
 XLjOFAKVzoLmN+LRE6grlpQ68CMD7HFDTvnFkdZsoY2GQE1KHAzDacRGr3QY2x1ALXNm
 tJH6MLLOlVJgyyU+bOjZ4u35qcxklOqbZnAyB4jRfJdcQJVleJPk6/IahsD0Mt7FdA23
 u+9A==
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 daniel.thompson@linaro.org, b.zolnierkie@samsung.com, jingoohan1@gmail.com,
 Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 linux-fbdev@vger.kernel.org, robh+dt@kernel.org, jacek.anaszewski@gmail.com,
 pavel@ucw.cz, linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAwMSBOb3YgMjAxOSwgS2lyYW4gR3VuZGEgd3JvdGU6Cgo+IFRoZSBhdXRvIHN0cmlu
ZyBkZXRlY3Rpb24gYWxnb3JpdGhtIGNoZWNrcyBpZiB0aGUgY3VycmVudCBXTEVECj4gc2luayBj
b25maWd1cmF0aW9uIGlzIHZhbGlkLiBJdCB0cmllcyBlbmFibGluZyBldmVyeSBzaW5rIGFuZAo+
IGNoZWNrcyBpZiB0aGUgT1ZQIGZhdWx0IGlzIG9ic2VydmVkLiBCYXNlZCBvbiB0aGlzIGluZm9y
bWF0aW9uCj4gaXQgZGV0ZWN0cyBhbmQgZW5hYmxlcyB0aGUgdmFsaWQgc2luayBjb25maWd1cmF0
aW9uLgo+IEF1dG8gY2FsaWJyYXRpb24gd2lsbCBiZSB0cmlnZ2VyZWQgd2hlbiB0aGUgT1ZQIGZh
dWx0IGludGVycnVwdHMKPiBhcmUgc2VlbiBmcmVxdWVudGx5IHRoZXJlYnkgaXQgdHJpZXMgdG8g
Zml4IHRoZSBzaW5rIGNvbmZpZ3VyYXRpb24uCj4gCj4gVGhlIGF1dG8tZGV0ZWN0aW9uIGFsc28g
a2lja3MgaW4gd2hlbiB0aGUgY29ubmVjdGVkIExFRCBzdHJpbmcKPiBvZiB0aGUgZGlzcGxheS1i
YWNrbGlnaHQgbWFsZnVuY3Rpb25zIChiZWNhdXNlIG9mIGRhbWFnZSkgYW5kCj4gcmVxdWlyZXMg
dGhlIGRhbWFnZWQgc3RyaW5nIHRvIGJlIHR1cm5lZCBvZmYgdG8gcHJldmVudCB0aGUKPiBjb21w
bGV0ZSBwYW5lbCBhbmQvb3IgYm9hcmQgZnJvbSBiZWluZyBkYW1hZ2VkLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IEtpcmFuIEd1bmRhIDxrZ3VuZGFAY29kZWF1cm9yYS5vcmc+Cj4gUmV2aWV3ZWQtYnk6
IERhbmllbCBUaG9tcHNvbiA8ZGFuaWVsLnRob21wc29uQGxpbmFyby5vcmc+Cj4gLS0tCj4gIGRy
aXZlcnMvdmlkZW8vYmFja2xpZ2h0L3Fjb20td2xlZC5jIHwgNDAwICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMzk0IGluc2VydGlvbnMoKyks
IDYgZGVsZXRpb25zKC0pCgpBcHBsaWVkLCB0aGFua3MuCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzm
lq9dCkxpbmFybyBTZXJ2aWNlcyBUZWNobmljYWwgTGVhZApMaW5hcm8ub3JnIOKUgiBPcGVuIHNv
dXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0
dGVyIHwgQmxvZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
