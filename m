Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7DDEF1DD
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 01:19:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91A906E8BF;
	Tue,  5 Nov 2019 00:19:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 600646E8BF;
 Tue,  5 Nov 2019 00:19:19 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id w3so12331228edt.2;
 Mon, 04 Nov 2019 16:19:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bPI3xRQSihbuAop68QULfROzLi2EqQlmJiEdDSx7yKE=;
 b=nfxrsfnIgz785qeHTPj2XuxuK/txDzxAkGDvMDP/pmXlgB3xM1Dac9ls9VfTgAQAE0
 +fqyLLSg2opajbQqI45sTMFlhQ1AlsntKLW98RDrG2o+CJ1M47ijU90bYGbYAjBZ5Irj
 i2D97W4UR5OyAgkq/KPcrHPkx+hT2M4R1FN0u9Rc5HEmPwr0uQd8M2xcLjLOVq4NiIZZ
 B0kvxvQI4jsDc1t+P0Od3indOVbfZQd2o1bdziwcuWlKLad+dLyjIAsa1qkDSykJFAUD
 QrbfNwMs8YCZTm48Bb/Lq3ifLGQtJm/y+WXfaOSj/PL7mt/GmAeO9MJj9fNKUmgYU8I6
 JSgA==
X-Gm-Message-State: APjAAAW9cImBWLc8YJI28jtlXFqLEo2EE/mLvXYj4mXAWpiV+XK4CywC
 MWYWTJ5SpWUOWYoJ5dnc+3Yn2CSKvDQ/A1epClk=
X-Google-Smtp-Source: APXvYqy0DLKlSOyi6a3ePnMUiv4rqcXhQw7mqHXXcfvNI578kX1CkWDeon4zEoAY8/o1xG3l5IN+7seHEEwOZvA/oFA=
X-Received: by 2002:a17:906:594f:: with SMTP id
 g15mr11991768ejr.197.1572913157903; 
 Mon, 04 Nov 2019 16:19:17 -0800 (PST)
MIME-Version: 1.0
References: <20191105000129.GA6536@onstation.org>
In-Reply-To: <20191105000129.GA6536@onstation.org>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 4 Nov 2019 16:19:07 -0800
Message-ID: <CAF6AEGv3gs+LFOP3AGthXd4niFb_XYOuwLfEa2G9eb27b1wMMA@mail.gmail.com>
Subject: Re: [Freedreno] drm/msm: 'pp done time out' errors after async commit
 changes
To: Brian Masney <masneyb@onstation.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=bPI3xRQSihbuAop68QULfROzLi2EqQlmJiEdDSx7yKE=;
 b=gXZl+zKzALBpq+fDhPXT21QE8iwzlELC/ZV+jVycXbP2eTy3Uwu9Cl3W7EKqz9kL72
 YUWbOyXIruonjwN/tA2FbXO4O4iTbnWLeeyj+9/WVfHDaQkkoLOadJFaLuRnHSxQXFaR
 jLG6VbxTh7Uc5dbQA9qs2YcOtqg1h4fPLHgg+5uAHe+t2WNBW6cyaEzvneiH5mqw+pmp
 ditee/TqiVtr16jPDzKVLW+eQEFv9i3j1ukyHUKu/w8hW3R9ygtcLrLM1gm9aps7Nbg/
 Xju7iGRjtuXhln40aqbLE71aZBeZYkQ4+h2IxGaqHYzSUfbpUJieafDv/Tcg7EJcdcRO
 GKKA==
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
Cc: Rob Clark <robdclark@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgNCwgMjAxOSBhdCA0OjAxIFBNIEJyaWFuIE1hc25leSA8bWFzbmV5YkBvbnN0
YXRpb24ub3JnPiB3cm90ZToKPgo+IEhleSBSb2IsCj4KPiBTaW5jZSBjb21taXQgMmQ5OWNlZDc4
N2UzICgiZHJtL21zbTogYXN5bmMgY29tbWl0IHN1cHBvcnQiKSwgdGhlIGZyYW1lCj4gYnVmZmVy
IGNvbnNvbGUgb24gbXkgTmV4dXMgNSBiZWdhbiB0aHJvd2luZyB0aGVzZSBlcnJvcnM6Cj4KPiBt
c20gZmQ5MDAwMDAubWRzczogcHAgZG9uZSB0aW1lIG91dCwgbG09MAo+Cj4gVGhlIGRpc3BsYXkg
c3RpbGwgd29ya3MuCj4KPiBJIHNlZSB0aGF0IG1kcDVfZmx1c2hfY29tbWl0KCkgd2FzIGludHJv
ZHVjZWQgaW4gY29tbWl0IDlmNmI2NTY0MmJkMgo+ICgiZHJtL21zbTogYWRkIGttcy0+Zmx1c2hf
Y29tbWl0KCkiKSB3aXRoIGEgVE9ETyBjb21tZW50IGFuZCB0aGUgY29tbWl0Cj4gZGVzY3JpcHRp
b24gbWVudGlvbnMgZmx1c2hpbmcgcmVnaXN0ZXJzLiBJIGFzc3VtZSB0aGF0IHRoaXMgaXMgdGhl
Cj4gcHJvcGVyIGZpeC4gSWYgc28sIGNhbiB5b3UgcG9pbnQgbWUgdG8gd2hlcmUgdGhlc2UgcmVn
aXN0ZXJzIGFyZQo+IGRlZmluZWQgYW5kIEkgY2FuIHdvcmsgb24gdGhlIG1kcDUgaW1wbGVtZW50
YXRpb24uCgpTZWUgbWRwNV9jdGxfY29tbWl0KCksIHdoaWNoIHdyaXRlcyB0aGUgQ1RMX0ZMVVNI
IHJlZ2lzdGVycy4uIHRoZSBpZGVhCndvdWxkIGJlIHRvIGRlZmVyIHdyaXRpbmcgQ1RMX0ZMVVNI
W2N0bF9pZF0gPSBmbHVzaF9tYXNrIHVudGlsCmttcy0+Zmx1c2goKSAod2hpY2ggaGFwcGVucyBm
cm9tIGEgdGltZXIgc2hvcnRseSBiZWZvcmUgdmJsYW5rKS4KCkJ1dCBJIHRoaW5rIHRoZSBhc3lu
YyBmbHVzaCBjYXNlIHNob3VsZCBub3QgY29tZSB1cCB3aXRoIGZiY29uPyAgSXQKd2FzIHJlYWxs
eSBhZGRlZCB0byBjb3BlIHdpdGggaHdjdXJzb3IgdXBkYXRlcyAoYW5kIHVzZXJzcGFjZSB0aGF0
CmFzc3VtZXMgaXQgY2FuIGRvIGFuIHVubGltaXRlZCAjIG9mIGN1cnNvciB1cGRhdGVzIHBlciBm
cmFtZSkuLiB0aGUKaW50ZW50aW9uIHdhcyB0aGF0IG5vdGhpbmcgc2hvdWxkIGNoYW5nZSBpbiB0
aGUgc2VxdWVuY2UgZm9yIG1kcDUgKGJ1dApJIGd1ZXNzIHRoYXQgd2FzIG5vdCB0aGUgY2FzZSku
CgpCUiwKLVIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
