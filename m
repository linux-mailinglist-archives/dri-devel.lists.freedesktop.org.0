Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9E2345B21
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 10:42:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 828256E87E;
	Tue, 23 Mar 2021 09:42:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B98056E882
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 09:42:34 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id kt15so16489916ejb.12
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 02:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=RJI1ZulJI/N1c2SHSzXG2bAltLew6mzjF/sjYCXcM5o=;
 b=JUN66A/8cTYU/eCzY1rGy5pu3Ui6LtQGLfl6KYjMr29YoVG/cdEJDdLL3Rx7rc5i2l
 QtXpb4pWe9w0bC1DCL7OK/oYYh+mOMk9IAxiy2bA4M8WH+Njssh46rgJrBNVNOhpAKIV
 VMXATaJV4nZUAxzKlMh2F06xFz+zdQwrb2BJv2VNWWIbB0utRYUhknkLfmbQSr7VGycf
 1w3WosdRggV3OYeQOERJdI4dNRjvCEwSlEAUsSGgeCWWyRWjEOHRCUDdNu3dO4GPwUGi
 TIW0ZgHSwC5mRhD3CUAVE533pNm9bdOIDFmJiagr5hE/VViE+ajDPRfkOJZh7hdjpZk/
 L/Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=RJI1ZulJI/N1c2SHSzXG2bAltLew6mzjF/sjYCXcM5o=;
 b=TJ7a5RAN4B0vWS6kPr41PSotB7yTjfrUZVqT9xCBJkU+1VeUkrY0toQ6CQ9Z+cDFCu
 aYgAfOupqM08V4KMmh9O6w0Yu39NJW4ifrgpQcgsk9PhoJy6XvNHp5vAVPto0gnWtobt
 cMCRXDF+9fbQvGPNGAJAqvH+V0Sq1fBMSm8Q/AObgfjLvUXV+JNnBz6fo+xZJquyp/u6
 7qtkeM3W7m0Qc6ozdT0xNDI2pf5dGV2+733YYnQfjrHgCY2q6kbpR+7bfEgQAd1tEaTO
 +6+D+ycLHdLCtK7sSpt83BytU7nLHui6LTLjppvHMzz7lqBhblcrFO1YfrhCFTkacImc
 tHzQ==
X-Gm-Message-State: AOAM5301HBZVaL2S3c7k603N9kFFD8lyxP8cBn7q5x7z7MzNlMD45PRY
 B32n9qapll9IslfWDTP2Kzouyw==
X-Google-Smtp-Source: ABdhPJxpkafTXkKvGJHA7aA0u50WutkG/PVWSHFxm9DTViiMH8PsMPRMvCNLbKu9rHqMZj1o5whwtg==
X-Received: by 2002:a17:906:ca50:: with SMTP id
 jx16mr4131927ejb.72.1616492553383; 
 Tue, 23 Mar 2021 02:42:33 -0700 (PDT)
Received: from dell ([91.110.221.180])
 by smtp.gmail.com with ESMTPSA id g11sm12635053edt.35.2021.03.23.02.42.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 02:42:32 -0700 (PDT)
Date: Tue, 23 Mar 2021 09:42:29 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH 2/2] video: backlight: qcom-wled: Add PMI8994 compatible
Message-ID: <20210323094229.GU2916463@dell>
References: <20210228124106.135812-1-konrad.dybcio@somainline.org>
 <20210228124106.135812-2-konrad.dybcio@somainline.org>
 <20210322161810.biagj2qro66rv4gt@maple.lan>
 <20210323083935.GF2916463@dell>
 <20210323093540.dqrhjlvr6oza3hvt@maple.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210323093540.dqrhjlvr6oza3hvt@maple.lan>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Kiran Gunda <kgunda@codeaurora.org>, Jingoo Han <jingoohan1@gmail.com>,
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Andy Gross <agross@kernel.org>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
 Pavel Machek <pavel@ucw.cz>, angelogioacchino.delregno@somainline.org,
 marijn.suijten@somainline.org, phone-devel@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
 Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMyBNYXIgMjAyMSwgRGFuaWVsIFRob21wc29uIHdyb3RlOgoKPiBPbiBUdWUsIE1h
ciAyMywgMjAyMSBhdCAwODozOTozNUFNICswMDAwLCBMZWUgSm9uZXMgd3JvdGU6Cj4gPiBPbiBN
b24sIDIyIE1hciAyMDIxLCBEYW5pZWwgVGhvbXBzb24gd3JvdGU6Cj4gPiAKPiA+ID4gT24gU3Vu
LCBGZWIgMjgsIDIwMjEgYXQgMDE6NDE6MDVQTSArMDEwMCwgS29ucmFkIER5YmNpbyB3cm90ZToK
PiA+ID4gPiBBZGQgYSBjb21wYXRpYmxlIGZvciBQTUk4OTk0IFdMRUQuIEl0IHVzZXMgdGhlIFY0
IG9mIFdMRUQgSVAuCj4gPiA+ID4gCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogS29ucmFkIER5YmNp
byA8a29ucmFkLmR5YmNpb0Bzb21haW5saW5lLm9yZz4KPiA+ID4gCj4gPiA+IFJldmlld2VkLWJ5
OiBEYW5pZWwgVGhvbXBzb24gPGRhbmllbC50aG9tcHNvbkBsaW5hcm8ub3JnPgo+ID4gCj4gPiBX
aHkgYXJlIHlvdSBSZXZpZXdpbmcvQWNraW5nIGEgcGF0Y2ggdGhhdCB3YXMgYXBwbGllZCBvbiB0
aGUgMTB0aD8KPiAKPiBTaW1wbHkgYW4gb3ZlcnNpZ2h0LiBMb29rcyBsaWtlIEkgZm9yZ290IHRv
IHJlbW92ZSBpdCBmcm9tIG15IGJhY2tsb2cKPiB3aGVuIGl0IHdhcyBhcHBsaWVkLgoKSSB3b25k
ZXJlZCBpZiBJJ2QgbWFkZSBhIG1pc3Rha2UuCgpObyBwcm9ibGVtLiAgVGhhbmtzIGZvciB0aGUg
Y2xhcmlmaWNhdGlvbi4KCj4gPiA+ID4gLS0tCj4gPiA+ID4gIGRyaXZlcnMvdmlkZW8vYmFja2xp
Z2h0L3Fjb20td2xlZC5jIHwgMSArCj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKQo+ID4gPiA+IAo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdo
dC9xY29tLXdsZWQuYyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3Fjb20td2xlZC5jCj4gPiA+
ID4gaW5kZXggM2JjNzgwMGViMGE5Li40OTdiOTAzNWE5MDggMTAwNjQ0Cj4gPiA+ID4gLS0tIGEv
ZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcWNvbS13bGVkLmMKPiA+ID4gPiArKysgYi9kcml2ZXJz
L3ZpZGVvL2JhY2tsaWdodC9xY29tLXdsZWQuYwo+ID4gPiA+IEBAIC0xNzA0LDYgKzE3MDQsNyBA
QCBzdGF0aWMgaW50IHdsZWRfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4g
PiA+ID4gIAo+ID4gPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCB3bGVkX21h
dGNoX3RhYmxlW10gPSB7Cj4gPiA+ID4gIAl7IC5jb21wYXRpYmxlID0gInFjb20scG04OTQxLXds
ZWQiLCAuZGF0YSA9ICh2b2lkICopMyB9LAo+ID4gPiA+ICsJeyAuY29tcGF0aWJsZSA9ICJxY29t
LHBtaTg5OTQtd2xlZCIsIC5kYXRhID0gKHZvaWQgKik0IH0sCj4gPiA+ID4gIAl7IC5jb21wYXRp
YmxlID0gInFjb20scG1pODk5OC13bGVkIiwgLmRhdGEgPSAodm9pZCAqKTQgfSwKPiA+ID4gPiAg
CXsgLmNvbXBhdGlibGUgPSAicWNvbSxwbTY2MGwtd2xlZCIsIC5kYXRhID0gKHZvaWQgKik0IH0s
Cj4gPiA+ID4gIAl7IC5jb21wYXRpYmxlID0gInFjb20scG04MTUwbC13bGVkIiwgLmRhdGEgPSAo
dm9pZCAqKTUgfSwKPiA+IAoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpTZW5pb3IgVGVjaG5p
Y2FsIExlYWQgLSBEZXZlbG9wZXIgU2VydmljZXMKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ug
c29mdHdhcmUgZm9yIEFybSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8
IEJsb2cKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
