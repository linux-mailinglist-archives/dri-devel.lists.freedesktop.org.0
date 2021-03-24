Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FD5347447
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 10:14:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F9326E974;
	Wed, 24 Mar 2021 09:14:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C4F66E974
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 09:14:36 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id b9so23647184wrt.8
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 02:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=4rN1YksKNQ6jMnv83wrys0vsQCA6pM1XeLstkQR9zSk=;
 b=aaEalBsXBstsM7Ugh18M+hl8k/wTbYlQwQ6ihztFCEL9SFffFl/IlB3eU6LSKJs1k4
 GjK340N7lCr3K0iNQ2HLCSKfu9qwSSS5Mp8zQ/OAzufhpBV6bxJQJuLmIMW602QW0Z0i
 CTqj7hTA4262C48pcQPTWxgvKGSQ1LQgks/73S/V10RAeBK5hHJhx7ZbxahrIHGsK5bU
 crb2aPqZrt9ArMgFvNEf6/iL2Ia25u/EldQEsOKbOrKgyMUfulRjc6gCETsPm62Fki99
 ayEXOIgKaYa4YohjIIoMQ+HavVGjkXvTiQCd0/ZohrHC0rsOqSu+B+oZ12+Csh5u+2CE
 xVgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=4rN1YksKNQ6jMnv83wrys0vsQCA6pM1XeLstkQR9zSk=;
 b=TzxUHZuY5w/6Z9QIVbc9M+jMNMu8eVyp8mxfjGNZOzM8U6rmKtgjc02q/kjkx9RFXb
 HHsU+lheu+TsbRVkUlsKTPPWGVxyQmdRqoANK2Qry4W6XjkLhlBrEX7X1M0J0066C00t
 VXoXuOG5jvn4XDtKctBEU8nClLpPkuZ5JoX6ptZFwbrwD202eu9+JircWVX+IyBOlmb3
 /NuzI3j6iVERF0A0ocFoeKLw4+BoLJsFu1EM804g6rGxVLjbrN6UT/NUfz4dvlxqLCH7
 MKSqizGmy6uRif7dxtCXcBHuut+OUiUhlnEXmLXj6pJfLwibN97BXXu98UzxKwf2clS+
 AAhQ==
X-Gm-Message-State: AOAM531aqPTo0wMOQN7rKfcIFGc8q5YcVxWk6TwwdSRRSrdvWsjHH7zF
 R9ijnhqtxEl2gIq1nJ6pEpilbw==
X-Google-Smtp-Source: ABdhPJwiwVGAQSOrEM4tqzstTbRBmqfvaxH3KFKNSYNSQI1y++GJvlZicb7puOlrOD6JdzLf3utu9Q==
X-Received: by 2002:adf:e8c9:: with SMTP id k9mr2327816wrn.315.1616577275230; 
 Wed, 24 Mar 2021 02:14:35 -0700 (PDT)
Received: from dell ([91.110.221.180])
 by smtp.gmail.com with ESMTPSA id n1sm2536565wro.36.2021.03.24.02.14.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 02:14:34 -0700 (PDT)
Date: Wed, 24 Mar 2021 09:14:32 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/2] video: backlight: qcom-wled: Add PMI8994 compatible
Message-ID: <20210324091432.GC2916463@dell>
References: <20210228124106.135812-1-konrad.dybcio@somainline.org>
 <20210228124106.135812-2-konrad.dybcio@somainline.org>
 <20210322161810.biagj2qro66rv4gt@maple.lan>
 <20210323083935.GF2916463@dell>
 <CAMuHMdUamD4rAY1Sn-3Fb9Xf1B9g0FY0Pob8rAFsFR0ZcNZ0rw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdUamD4rAY1Sn-3Fb9Xf1B9g0FY0Pob8rAFsFR0ZcNZ0rw@mail.gmail.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Kiran Gunda <kgunda@codeaurora.org>, Jingoo Han <jingoohan1@gmail.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Andy Gross <agross@kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, martin.botka@somainline.org,
 ~postmarketos/upstreaming@lists.sr.ht, Pavel Machek <pavel@ucw.cz>,
 angelogioacchino.delregno@somainline.org, marijn.suijten@somainline.org,
 phone-devel@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-leds <linux-leds@vger.kernel.org>, Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyNCBNYXIgMjAyMSwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOgoKPiBIaSBMZWUs
Cj4gCj4gT24gVHVlLCBNYXIgMjMsIDIwMjEgYXQgOTo0MCBBTSBMZWUgSm9uZXMgPGxlZS5qb25l
c0BsaW5hcm8ub3JnPiB3cm90ZToKPiA+IE9uIE1vbiwgMjIgTWFyIDIwMjEsIERhbmllbCBUaG9t
cHNvbiB3cm90ZToKPiA+ID4gT24gU3VuLCBGZWIgMjgsIDIwMjEgYXQgMDE6NDE6MDVQTSArMDEw
MCwgS29ucmFkIER5YmNpbyB3cm90ZToKPiA+ID4gPiBBZGQgYSBjb21wYXRpYmxlIGZvciBQTUk4
OTk0IFdMRUQuIEl0IHVzZXMgdGhlIFY0IG9mIFdMRUQgSVAuCj4gPiA+ID4KPiA+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBLb25yYWQgRHliY2lvIDxrb25yYWQuZHliY2lvQHNvbWFpbmxpbmUub3JnPgo+
ID4gPgo+ID4gPiBSZXZpZXdlZC1ieTogRGFuaWVsIFRob21wc29uIDxkYW5pZWwudGhvbXBzb25A
bGluYXJvLm9yZz4KPiA+Cj4gPiBXaHkgYXJlIHlvdSBSZXZpZXdpbmcvQWNraW5nIGEgcGF0Y2gg
dGhhdCB3YXMgYXBwbGllZCBvbiB0aGUgMTB0aD8KPiAKPiBPbmx5IDEyIGRheXMgbGF0ZXI/IT8K
PiAKPiBJdCdzIG5vdCB1bmNvbW1vbiB0byByZWNlaXZlIGFja3MgZm9yIHBhdGNoZXMgYWZ0ZXIg
dGhleSBoYXZlIGJlZW4KPiBhcHBsaWVkIHVwc3RyZWFtLiBCdXQgaXQgaXMgaWYgdGhlIHBhdGNo
IHdhcyBhcHBsaWVkIDEwIHllYXJzIGFuZCA5Cj4gbW9udGhzIGFnbyEKPiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9saW51eC1tNjhrL0Y1NTEzQUU5MkE1QTEwNDdBQzJGOTFBRUJCOTIwMjY4MDI4
OENCQkEzOTgzQEUySzctTVMyLmRzLnN0cmF0aC5hYy51ay8KClRoYXQgdHJ1bHkgaXMgbmV4dCBs
ZXZlbCEgOikKCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KU2VuaW9yIFRlY2huaWNhbCBMZWFk
IC0gRGV2ZWxvcGVyIFNlcnZpY2VzCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJl
IGZvciBBcm0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
