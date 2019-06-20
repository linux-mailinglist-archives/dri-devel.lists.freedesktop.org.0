Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EEB4CEB3
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2019 15:32:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 814866E431;
	Thu, 20 Jun 2019 13:32:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECAC66E431
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 13:32:01 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id u8so3203550wmm.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 06:32:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=s4mJvF/EBCi9urzBjDVk6HyByyO2EXSJJe+w8Mr6PqE=;
 b=YedoJCrEzwVa1ijdQSzRxI3bA9TokWWbJnVpsddf4NuebV+JJjgY9GBGoOjBYcDzo2
 5qCKP89WOyE5zZbhjYOjehNvFVYIODVUGr13ABIxXQnbRjYOnCQN8KQCzNElPYvs+HsW
 QdTcIPsnCzjwvZb9+LsjpErhTSqCCNyNlXP+Y+HZJrVwWlIrM7bWde+NPFIPXogcfCVT
 SEI1HUF9cnkhV/oA8A8pgMC6WbG/dMYBleiKIhaio4DjeVHbdTyRfJM3IU96lNy8PHPU
 mJrTHLxghIvhlo/X6V5EU+bvZvKp0QlB0T+8yHXpUBuccPFuqPrZHK4iitlkHH2MjETg
 Jj2A==
X-Gm-Message-State: APjAAAWilTTQZhztRh/MJr+O76QYIpNVkhpvO8OrrNXRXug3lIzyznjq
 w4pYj0q3CRCqOs0L+0RXMUT+MQ==
X-Google-Smtp-Source: APXvYqyZ+XwqzkDzsOqDlRPJBWJqgVr7mKBJlSUjoZoLBHrCLh8eDBez55m86Gy5WHroG5f6vyKnPA==
X-Received: by 2002:a1c:cb0c:: with SMTP id b12mr2974917wmg.93.1561037520557; 
 Thu, 20 Jun 2019 06:32:00 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.googlemail.com with ESMTPSA id l19sm2782480wmj.33.2019.06.20.06.31.59
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 Jun 2019 06:31:59 -0700 (PDT)
Subject: Re: [PATCH v1] backlight: Don't build support by default
To: Marc Gonzalez <marc.w.gonzalez@free.fr>, Lee Jones
 <lee.jones@linaro.org>, Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
References: <70bd61f9-8fc5-75b1-9f32-7a5826ce6b48@free.fr>
From: Daniel Thompson <daniel.thompson@linaro.org>
Message-ID: <7958bf6a-5c2e-1330-1800-f9dbce3c01c6@linaro.org>
Date: Thu, 20 Jun 2019 14:31:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <70bd61f9-8fc5-75b1-9f32-7a5826ce6b48@free.fr>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=s4mJvF/EBCi9urzBjDVk6HyByyO2EXSJJe+w8Mr6PqE=;
 b=fcQ2LGsvLhMHenQaR0fPJrheg/Ke4ddcB5Wu7YfIryVJUo9ToV0DrbYLLy5uEKt+Te
 2eAlQZaWMnmihwnpB4DJYMLeVliQetctkognWmabqg2/bsj8vtTQ3Wdrk+/7DO4VmNG3
 idw+XcIFBhIqZqB++Mw/O8IMVCpYutg5pJSVKzdMLiLzmItHKlz0b8OfrR7rtZ9kG3B0
 PKKZxH1aruGECIB8MkZB2p8I+nWXXn5inX9QgpLCSUp9zSeHDaxhypHI8x4Pe1hjvwhw
 vzzKpP408bHesT24rsySd1QPusV0TiHkwQeIkwFsr0iPxO7OVyk0/rcCLNTy7QcBcnmw
 lOEQ==
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
Cc: fbdev <linux-fbdev@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTIvMDYvMjAxOSAxNDoyNywgTWFyYyBHb256YWxleiB3cm90ZToKPiBiMjBjNTI0OWFhNmEg
KCJiYWNrbGlnaHQ6IEZpeCBjb21waWxlIGVycm9yIGlmIENPTkZJR19GQiBpcyB1bnNldCIpCj4g
YWRkZWQgJ2RlZmF1bHQgbScgZm9yIEJBQ0tMSUdIVF9DTEFTU19ERVZJQ0UgYW5kIExDRF9DTEFT
U19ERVZJQ0UuCgpJdCB0b29rIG1lIHNvbWUgbGl0dGxlIHdoaWxlIHVudGlsIEkgcmVhbGl6ZWQg
dGhpcyBwYXRjaCBpcyBmcm9tIDIwMDUgCndoaWNoIGV4cGxhaW5zIHdoeSBJIGNvdWxkbid0IGZp
bmQgaXQgaW4gdGhlIG1vZGVybiBnaXQgcmVwbyEKCgo+IExldCdzIGdvIGJhY2sgdG8gbm90IGJ1
aWxkaW5nIHN1cHBvcnQgYnkgZGVmYXVsdC4KCkF0IGZpcnN0IGdsYW5jZSBkaXNhYmxpbmcgdGhp
cyBieSBkZWZhdWx0IGxvb2tzIGxpa2UgaXQgd291bGQgY2F1c2Ugc29tZSAKZXhpc3RpbmcgZGVm
Y29uZmlnIGZpbGVzIHRvIGRpc2FibGUgdXNlZnVsIGRyaXZlcnMuCgpGb3IgYmFja2xpZ2h0IEkg
dGhpbmsgdGhpcyBpc24ndCB0cnVlIChiZWNhdXNlIGJvdGggRFJNIGFuZCBGQl9CQUNLTElHSFQg
CmhhdmUgYSAic2VsZWN0IiBvbiBCQUNLTElHSFRfQ0xBU1NfREVWSUNFKS4KCkhvd2V2ZXIgZm9y
IExDRCBpdCBpcyBub3QgbmVhcmx5IGFzIGNsZWFyIGN1dC4gQ29tbWl0IG1lc3NhZ2UgbmVlZHMg
dG8gCmV4cGxhaW4gd2h5IHRoaXMgd29uJ3QgY2F1c2UgdW5hY2NlcHRhYmxlIHByb2JsZW1zIGZv
ciBleGlzdGlubmcgCmRlZmNvbmZpZyBmaWxlcy4KCgpEYW5pZWwuCgoKCgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IE1hcmMgR29uemFsZXogPG1hcmMudy5nb256YWxlekBmcmVlLmZyPgo+IC0tLQo+ICAg
ZHJpdmVycy92aWRlby9iYWNrbGlnaHQvS2NvbmZpZyB8IDIgLS0KPiAgIDEgZmlsZSBjaGFuZ2Vk
LCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdo
dC9LY29uZmlnIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvS2NvbmZpZwo+IGluZGV4IDhiMDgx
ZDYxNzczZS4uNDA2NzZiZTJlNDZhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmlkZW8vYmFja2xp
Z2h0L0tjb25maWcKPiArKysgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9LY29uZmlnCj4gQEAg
LTEwLDcgKzEwLDYgQEAgbWVudSAiQmFja2xpZ2h0ICYgTENEIGRldmljZSBzdXBwb3J0Igo+ICAg
Iwo+ICAgY29uZmlnIExDRF9DTEFTU19ERVZJQ0UKPiAgICAgICAgICAgdHJpc3RhdGUgIkxvd2xl
dmVsIExDRCBjb250cm9scyIKPiAtCWRlZmF1bHQgbQo+ICAgCWhlbHAKPiAgIAkgIFRoaXMgZnJh
bWV3b3JrIGFkZHMgc3VwcG9ydCBmb3IgbG93LWxldmVsIGNvbnRyb2wgb2YgTENELgo+ICAgCSAg
U29tZSBmcmFtZWJ1ZmZlciBkZXZpY2VzIGNvbm5lY3QgdG8gcGxhdGZvcm0tc3BlY2lmaWMgTENE
IG1vZHVsZXMKPiBAQCAtMTQzLDcgKzE0Miw2IEBAIGVuZGlmICMgTENEX0NMQVNTX0RFVklDRQo+
ICAgIwo+ICAgY29uZmlnIEJBQ0tMSUdIVF9DTEFTU19ERVZJQ0UKPiAgICAgICAgICAgdHJpc3Rh
dGUgIkxvd2xldmVsIEJhY2tsaWdodCBjb250cm9scyIKPiAtCWRlZmF1bHQgbQo+ICAgCWhlbHAK
PiAgIAkgIFRoaXMgZnJhbWV3b3JrIGFkZHMgc3VwcG9ydCBmb3IgbG93LWxldmVsIGNvbnRyb2wg
b2YgdGhlIExDRAo+ICAgICAgICAgICAgIGJhY2tsaWdodC4gVGhpcyBpbmNsdWRlcyBzdXBwb3J0
IGZvciBicmlnaHRuZXNzIGFuZCBwb3dlci4KPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
