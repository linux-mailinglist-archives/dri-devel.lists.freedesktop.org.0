Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E881B02E5
	for <lists+dri-devel@lfdr.de>; Mon, 20 Apr 2020 09:27:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DFE06E26C;
	Mon, 20 Apr 2020 07:27:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7D7A6E26C
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 07:27:31 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id g13so8750632wrb.8
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 00:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=fLd3utKBUqircZ8XSU/jqQ1o3HOdiOgb+Til4epkr7E=;
 b=Zjs6lkCZP51RU1eaQIhcoO3FB2Z6jXmILC0s2D752dm7NvsQ+tleMbs3JgJ0uCOger
 E/tjxVQyBlWGd8C8KH6qKSy877jK0dOi4ouglmI3EUeSGLveLxJsg2RtwSK7UMdZjCHW
 wFmMR6P5iaO2QXH4ksbOgvB+J3KLMVx+AA8FAPieKGTfyyESTZnp60vvRq2mOL1n6k89
 exxFo80LcTgKlrntlkSIIORBACYyTzHdDPArnuLiOwJFPLXem/gn0Igo6JBXWNAODiUe
 tLRv8q8+adw+2X8p6HhK3S5Eako2xzmyRKxo0WGwjta/t8GubKM8ali0sa3m5En/fezW
 12VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=fLd3utKBUqircZ8XSU/jqQ1o3HOdiOgb+Til4epkr7E=;
 b=m/qW+UhFvnN1nzVBw/ePIfzxmm6EwF2kFbnTf0w0Fy/Rljxu36PDncR+hNYuRcNxhu
 jSj4b09youbrnG1sEyxkElMJLUR9JHz19cGdo1iJNFQ0IINf5FoAMrDey1D+uPnu8W88
 0S1c8M7PAVGrIIj/MXmMtAKiyyzPk6lrqc1YjFUdhbONbaG04huVkgXY1pMNgKnn9UAd
 iVHKADUo3AfwzeTBvGYPjaib462VobQ2Q+PvZOH4387/rq27nbU3kA4KbS/ofjtwTLSo
 ffZx+q/BBbcyxLps7pMdchLlUy5Hp7Gif+qcLP3JVmgiNT8g/hZgFDtuJlaPKB5NK4Ad
 PvWQ==
X-Gm-Message-State: AGi0PuYAXcuuEVdJR/rQBstDU3wmti6BwL6HuoceX1jgX3y5kLu8Ubw/
 kp43km3SO2DDw2wIN/QvFAYDbw==
X-Google-Smtp-Source: APiQypLZ95duN0TVR/SeVUQItXdNoeinc7W1AvPfKzE2PNLYi2bchw8ulFVhIRvX/oUlL+29V+w4Lg==
X-Received: by 2002:a5d:5224:: with SMTP id i4mr17175368wra.1.1587367650264;
 Mon, 20 Apr 2020 00:27:30 -0700 (PDT)
Received: from dell ([95.149.164.107])
 by smtp.gmail.com with ESMTPSA id v16sm188543wml.30.2020.04.20.00.27.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 00:27:29 -0700 (PDT)
Date: Mon, 20 Apr 2020 08:27:27 +0100
From: Lee Jones <lee.jones@linaro.org>
To: kgunda@codeaurora.org
Subject: Re: [PATCH V5 1/4] backlight: qcom-wled: convert the wled bindings
 to .yaml format
Message-ID: <20200420072727.GI3737@dell>
References: <1586274430-28402-1-git-send-email-kgunda@codeaurora.org>
 <1586274430-28402-2-git-send-email-kgunda@codeaurora.org>
 <20200415150904.GA11174@bogus>
 <557e8bd874256271174402b5faba9c90@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <557e8bd874256271174402b5faba9c90@codeaurora.org>
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
Cc: mark.rutland@arm.com, daniel.thompson@linaro.org, b.zolnierkie@samsung.com,
 jingoohan1@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 devicetree@vger.kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz,
 linux-arm-msm@vger.kernel.org,
 Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
 linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAxNyBBcHIgMjAyMCwga2d1bmRhQGNvZGVhdXJvcmEub3JnIHdyb3RlOgoKPiBPbiAy
MDIwLTA0LTE1IDIwOjM5LCBSb2IgSGVycmluZyB3cm90ZToKPiA+IE9uIFR1ZSwgQXByIDA3LCAy
MDIwIGF0IDA5OjE3OjA3UE0gKzA1MzAsIEtpcmFuIEd1bmRhIHdyb3RlOgo+ID4gPiBDb252ZXJ0
IHRoZSBxY29tLXdsZWQgYmluZGluZ3MgZnJvbSAudHh0IHRvIC55YW1sIGZvcm1hdC4KPiA+ID4g
QWxzbyByZXBsYWNlIFBNODk0MSB0byBXTEVEMyBhbmQgUE1JODk5OCB0byBXTEVENC4KPiA+ID4g
Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEtpcmFuIEd1bmRhIDxrZ3VuZGFAY29kZWF1cm9yYS5vcmc+
Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IFN1YmJhcmFtYW4gTmFyYXlhbmFtdXJ0aHkgPHN1YmJhcmFt
QGNvZGVhdXJvcmEub3JnPgo+ID4gPiBBY2tlZC1ieTogRGFuaWVsIFRob21wc29uIDxkYW5pZWwu
dGhvbXBzb25AbGluYXJvLm9yZz4KPiA+ID4gLS0tCj4gPiA+ICAuLi4vYmluZGluZ3MvbGVkcy9i
YWNrbGlnaHQvcWNvbS13bGVkLnR4dCAgICAgICAgICB8IDE1NAo+ID4gPiAtLS0tLS0tLS0tLS0t
LS0tCj4gPiA+ICAuLi4vYmluZGluZ3MvbGVkcy9iYWNrbGlnaHQvcWNvbS13bGVkLnlhbWwgICAg
ICAgICB8IDIwMQo+ID4gPiArKysrKysrKysrKysrKysrKysrKysKPiA+ID4gIDIgZmlsZXMgY2hh
bmdlZCwgMjAxIGluc2VydGlvbnMoKyksIDE1NCBkZWxldGlvbnMoLSkKPiA+ID4gIGRlbGV0ZSBt
b2RlIDEwMDY0NAo+ID4gPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbGVkcy9i
YWNrbGlnaHQvcWNvbS13bGVkLnR4dAo+ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0Cj4gPiA+IERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2JhY2tsaWdodC9xY29tLXdsZWQu
eWFtbApbLi4uXQoKPiA+ID4gKyAgICAgICAgaW50ZXJydXB0LW5hbWVzOgo+ID4gPiArICAgICAg
ICAgIGl0ZW1zOgo+ID4gPiArICAgICAgICAgICAgLSBjb25zdDogb3ZwCj4gPiA+ICsgICAgICAg
ICAgICAtIGNvbnN0OiBzaG9ydAo+ID4gCj4gPiBNb3ZlIHRoZXNlIDIgcHJvcHMgdG8gdGhlIG1h
aW4gc2VjdGlvbiBhZGRpbmcgYSAnbWluSXRlbXM6IDEnLiBUaGVuIGp1c3QKPiA+IGRlZmluZSAn
bWluSXRlbXM6IDInIGhlcmUgYW5kICdtYXhJdGVtczogMScgaW4gdGhlICd0aGVuJyBjbGF1c2Uu
Cj4gPiAKPiA+ID4gKwo+ID4gPiArcmVxdWlyZWQ6Cj4gPiA+ICsgIC0gY29tcGF0aWJsZQo+ID4g
PiArICAtIHJlZwo+ID4gPiArICAtIGxhYmVsCj4gPiAKPiA+IEFkZDoKPiA+IAo+ID4gYWRkaXRp
b25hbFByb3BlcnRpZXM6IGZhbHNlCj4gPiAKPiA+ID4gKwo+ID4gPiArZXhhbXBsZXM6Cj4gPiA+
ICsgIC0gfAo+ID4gPiArICAgIGJhY2tsaWdodEBkODAwIHsKPiA+ID4gKyAgICAgICAgY29tcGF0
aWJsZSA9ICJxY29tLHBtODk0MS13bGVkIjsKPiA+ID4gKyAgICAgICAgcmVnID0gPDB4ZDgwMCAw
eDEwMD47Cj4gPiA+ICsgICAgICAgIGxhYmVsID0gImJhY2tsaWdodCI7Cj4gPiA+ICsKPiA+ID4g
KyAgICAgICAgcWNvbSxjcy1vdXQ7Cj4gPiA+ICsgICAgICAgIHFjb20sY3VycmVudC1saW1pdCA9
IDwyMD47Cj4gPiA+ICsgICAgICAgIHFjb20sY3VycmVudC1ib29zdC1saW1pdCA9IDw4MDU+Owo+
ID4gPiArICAgICAgICBxY29tLHN3aXRjaGluZy1mcmVxID0gPDE2MDA+Owo+ID4gPiArICAgICAg
ICBxY29tLG92cCA9IDwyOT47Cj4gPiA+ICsgICAgICAgIHFjb20sbnVtLXN0cmluZ3MgPSA8Mj47
Cj4gPiA+ICsgICAgICAgIHFjb20sZW5hYmxlZC1zdHJpbmdzID0gPDAgMT47Cj4gPiA+ICsgICAg
IH07Cj4gVGhhbmtzIGZvciByZXZpZXdpbmcuIEkgd2lsbCBzdWJtaXQgdGhlIG5leHQgcmV2aXNp
b24gd2l0aCBhbGwgdGhlIGZpeGVzLgoKUGxlYXNlIHRyaW0geW91ciByZXBsaWVzLgoKQWxzbywg
aWYgeW91IGFncmVlIHdpdGggYWxsIG9mIHRoZSByZXZpZXcgY29tbWVudHMsIHRoZXJlIHJlYWxs
eSBpcyBubwpuZWVkIHRvIHJlcGx5IGFuZC9vciB0aGFuayB0aGUgcmV2aWV3ZXIuICBTaW1wbHkg
c3VibWl0IGEgc3Vic2VxdWVudApzZXQgd2l0aCBhIGJ1bXBlZCB2ZXJzaW9uIGluZGljYXRvci4K
Ci0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KTGluYXJvIFNlcnZpY2VzIFRlY2huaWNhbCBMZWFk
CkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwpGb2xsb3cg
TGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
