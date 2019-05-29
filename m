Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C15DF2E66F
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 22:47:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D1F06E0D8;
	Wed, 29 May 2019 20:47:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F2D26E0D1;
 Wed, 29 May 2019 20:47:26 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id g13so5714974edu.5;
 Wed, 29 May 2019 13:47:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PEb0b1EqOFVao/VpttYj8pRTc5EZTx8yOH2gisVAS1I=;
 b=pMTB4rch0EBE31pxRbbrh0VZaEFdrrmz6C7vOJzGTxYUs+t9QeURKPkDmovPHGYDk5
 n75cgwEuPHrb1LONjBwKus+61ig9AkEHpwvGHRnWI0BzbMZunafq0gkxs8gTZXi7wdGR
 vqoTmw55k8xuVvWjV/+9dpf3alUf7V9gVwfXb66zNmw8F+/TdJmWHdCVx0CXDx6obHy6
 EcB+GLkHFWTW5M1gc6J7Np2DOwsbmBxMuEiukVtlaYRtNOxrCvYp5ROievQXs70puFOP
 NBDZWreSclC6Gj03luOv7mXg5J3cURDunzKuUQUWY8VwjL1/+Ato1Qj+7PVkEY4DcyIe
 AmaA==
X-Gm-Message-State: APjAAAUuldQ3BraN71IOztxHjHBBT4SPkCen/gH9tsXCtnLxFWJUOQ9l
 rcZOFbPOFnfxulvZVSgq9B6hX6tOzwNT/0IcW/c=
X-Google-Smtp-Source: APXvYqx14X0H5f2xOK8QIwCicWxWrh881A89gewt51xGVzujShI/t3Vkxpwk6YpKf2Fkbc5MtE4bMNOJim/O1z9mDhk=
X-Received: by 2002:a17:906:724c:: with SMTP id
 n12mr157037ejk.164.1559162845256; 
 Wed, 29 May 2019 13:47:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190529152022.42799-1-jeffrey.l.hugo@gmail.com>
 <20190529152022.42799-2-jeffrey.l.hugo@gmail.com>
In-Reply-To: <20190529152022.42799-2-jeffrey.l.hugo@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 29 May 2019 13:47:12 -0700
Message-ID: <CAF6AEGuELkPf0KSFK1mBpfjFr27m64NtCZ817pkcf1kGB6vT7A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] a5xx: Define HLSQ_DBG_ECO_CNTL
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=PEb0b1EqOFVao/VpttYj8pRTc5EZTx8yOH2gisVAS1I=;
 b=Et+YWjaIZ8Z6R1kYSWwUvURblSTgQo8QuDL8xhvF2V+tJmeLBpi7vu/dRuvThEj72b
 XlL9YIcGTFeXTw+DUbAqbzGncHo9iPLpSNcpmUvefhrRTPFAzWt2l/1UclfAMWorPLVE
 7inuhdE5vc0eqRX/fT3laeX6jp0uPRkLyOMrARD+fmc60dfNmPMNzX4COnkqyAsjPV+o
 JIHNXUgCNE5xuxRcFxa9nCpiCiMq7bE8uTC5mp0LMS+5r3BsMp/GkTuzfpEviQBc27dm
 nDMCGisXEBJKLUZoDsncrujueOPw7+729wYAdthpXUxm1qFEiH/TXU3Qah2+WU9LVi6f
 oSTQ==
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Marc Gonzalez <marc.w.gonzalez@free.fr>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dGhhbmtzLCBJJ3ZlIHB1c2hlZCB0aGlzIG9uZSB0byBlbnZ5dG9vbHMgdHJlZQoKQlIsCi1SCgpP
biBXZWQsIE1heSAyOSwgMjAxOSBhdCA4OjIwIEFNIEplZmZyZXkgSHVnbyA8amVmZnJleS5sLmh1
Z29AZ21haWwuY29tPiB3cm90ZToKPgo+IC0tLQo+ICBybm5kYi9hZHJlbm8vYTV4eC54bWwgfCAx
ICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4KPiBkaWZmIC0tZ2l0IGEvcm5u
ZGIvYWRyZW5vL2E1eHgueG1sIGIvcm5uZGIvYWRyZW5vL2E1eHgueG1sCj4gaW5kZXggYWU2NTRl
ZWIuLjE2MjAzNTEyIDEwMDY0NAo+IC0tLSBhL3JubmRiL2FkcmVuby9hNXh4LnhtbAo+ICsrKyBi
L3JubmRiL2FkcmVuby9hNXh4LnhtbAo+IEBAIC0xNTIzLDYgKzE1MjMsNyBAQCB4c2k6c2NoZW1h
TG9jYXRpb249Imh0dHA6Ly9ub3V2ZWF1LmZyZWVkZXNrdG9wLm9yZy8gcnVsZXMtbmcueHNkIj4K
Pgo+ICAgICAgICAgPHJlZzMyIG9mZnNldD0iMHgwZTAwIiBuYW1lPSJITFNRX1RJTUVPVVRfVEhS
RVNIT0xEXzAiLz4KPiAgICAgICAgIDxyZWczMiBvZmZzZXQ9IjB4MGUwMSIgbmFtZT0iSExTUV9U
SU1FT1VUX1RIUkVTSE9MRF8xIi8+Cj4gKyAgICAgICA8cmVnMzIgb2Zmc2V0PSIweDBlMDQiIG5h
bWU9IkhMU1FfREJHX0VDT19DTlRMIi8+Cj4gICAgICAgICA8cmVnMzIgb2Zmc2V0PSIweDBlMDUi
IG5hbWU9IkhMU1FfQUREUl9NT0RFX0NOVEwiLz4KPiAgICAgICAgIDxyZWczMiBvZmZzZXQ9IjB4
MGUwNiIgbmFtZT0iSExTUV9NT0RFX0NOVEwiLz4gPCEtLSBhbHdheXMgMDAwMDAwMDE/IC0tPgo+
ICAgICAgICAgPHJlZzMyIG9mZnNldD0iMHgwZTEwIiBuYW1lPSJITFNRX1BFUkZDVFJfSExTUV9T
RUxfMCIgdHlwZT0iYTV4eF9obHNxX3BlcmZjb3VudGVyX3NlbGVjdCIvPgo+IC0tCj4gMi4xNy4x
Cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
