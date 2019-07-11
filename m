Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E992C6502E
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2019 04:35:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9696B89B51;
	Thu, 11 Jul 2019 02:35:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 765E089B51
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2019 02:35:53 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id k20so9175670ios.10
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 19:35:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C1FC0kkhG8SE4KxZI9/vd1vvZYlqKizf2ehICOMyQFw=;
 b=D++Xc0nqIYHTkpjpr+ICLXvXbKcoAv0SnNA+MAGMHetOP++/qQGREtnQP5L+EjU4es
 cfTnwpNbZqWzmUhZABenACmxUi6zKnTzxXgeXSWGfy7Alk4WlIKYNZPIa2nteMOYKxQy
 A6lbm1FQaigucKgoPQpjW0IDEHqlg2keDm8KeIZoxLt6jvsoYV4eTH7r9WxuvO8A2fbz
 3isFqtKL97VsOPsccauNdnii6vd4uVJhvwrq7P7NTmDlogtrJ3DeuYSyK3AinWaeaZRd
 YHjDz05f47lk45qWIZ6tPqMq81k83rNsDn6oZv9nNL0yUMZcPgKptP/NpADXFi5pVRtd
 AG/w==
X-Gm-Message-State: APjAAAVoz4Uwz99ONMTO02Bsh4PJnlziERYLq4Z4Vw0piSb3yYVTE0Dd
 I4NLuRQ4ftMIMLJ2o/AfPYfPqXVO0JQRxDlfnWU=
X-Google-Smtp-Source: APXvYqySOQ0NQmFWxVA1kPgmyB8lKtJqH6UcCGrrUDZnNcuPCHHrmvDjUvwMLLqlPMPNkYUmdbrvZzQlXxg4BT1y+pw=
X-Received: by 2002:a5d:8e08:: with SMTP id e8mr1665361iod.139.1562812552660; 
 Wed, 10 Jul 2019 19:35:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190702141903.1131-1-kraxel@redhat.com>
 <20190702141903.1131-9-kraxel@redhat.com>
 <CAPaKu7QP=A2kV_kqcT20Pmc831HviaBJN1RpOFoa=V1g6SmE_g@mail.gmail.com>
 <20190704112534.v7icsuverf7wrbjq@sirius.home.kraxel.org>
 <CAPaKu7SQS5USJf0Y+K41tuRA=4qZJf5CnTu9EqAPZvz+GJCP2w@mail.gmail.com>
In-Reply-To: <CAPaKu7SQS5USJf0Y+K41tuRA=4qZJf5CnTu9EqAPZvz+GJCP2w@mail.gmail.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Wed, 10 Jul 2019 19:35:41 -0700
Message-ID: <CAPaKu7RQo8T81iGtPbtgmv7WtV-uDO9+BsT3vMd=iggZ0Q_Yew@mail.gmail.com>
Subject: Re: [PATCH v6 08/18] drm/virtio: rework virtio_gpu_execbuffer_ioctl
 fencing
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=C1FC0kkhG8SE4KxZI9/vd1vvZYlqKizf2ehICOMyQFw=;
 b=gZuX85ZCmj/43wOQW8QDrAr8gsP1kGWGDwQXP7ruMAHyiaKt3g7NjtaA+MEVdHmPOT
 wKDPWmEBpa83TiEvIwO+ugF++ClLRUvAzQLBP51kB4e6VSC6Snkjk3d4n8a6/wkm9/Ra
 D7155hJwNevtJn/VruKCuIazOesSrERBBV8vHwGFFkNSHxznLmqbfHO6yEdsHe98bC30
 T7PKRJ7+sCT5Xa2XQQwi9kRh5LcipaXeyRjPVyu6OVHm/E8NeQJY6UH3Mv4YtROKhPbf
 uYVC+T7pV39I8wXcfcxdqZB0y5IdoQR5bzuyil6Rc7DsmYrELvsBAixhWonuRgUpjKBt
 FjYg==
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdWwgNCwgMjAxOSBhdCAxMTo0NiBBTSBDaGlhLUkgV3UgPG9sdmFmZmVAZ21haWwu
Y29tPiB3cm90ZToKPgo+IE9uIFRodSwgSnVsIDQsIDIwMTkgYXQgNDoyNSBBTSBHZXJkIEhvZmZt
YW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPgo+ID4gICBIaSwKPiA+Cj4gPiA+ID4g
ICAgICAgICBpZiAoZmVuY2UpCj4gPiA+ID4gICAgICAgICAgICAgICAgIHZpcnRpb19ncHVfZmVu
Y2VfZW1pdCh2Z2RldiwgaGRyLCBmZW5jZSk7Cj4gPiA+ID4gKyAgICAgICBpZiAodmJ1Zi0+b2Jq
cykgewo+ID4gPiA+ICsgICAgICAgICAgICAgICB2aXJ0aW9fZ3B1X2FycmF5X2FkZF9mZW5jZSh2
YnVmLT5vYmpzLCAmZmVuY2UtPmYpOwo+ID4gPiA+ICsgICAgICAgICAgICAgICB2aXJ0aW9fZ3B1
X2FycmF5X3VubG9ja19yZXN2KHZidWYtPm9ianMpOwo+ID4gPiA+ICsgICAgICAgfQo+ID4gPiBU
aGlzIGlzIHdpdGggdGhlIHNwaW5sb2NrIGhlbGQuICBNYXliZSB3ZSBzaG91bGQgbW92ZSB0aGUK
PiA+ID4gdmlydGlvX2dwdV9hcnJheV91bmxvY2tfcmVzdiBjYWxsIG91dCBvZiB0aGUgY3JpdGlj
YWwgc2VjdGlvbi4KPiA+Cj4gPiBUaGF0IHdvdWxkIGJyaW5nIGJhY2sgdGhlIHJhY2UgLi4uCj4g
UmlnaHQuLi4KPiA+Cj4gPiA+IEkgYW0gYWN0dWFsbHkgbW9yZSBjb25jZXJuZWQgYWJvdXQgdmly
dGlvX2dwdV9hcnJheV9hZGRfZmVuY2UsIGJ1dCBpdAo+ID4gPiBpcyBhbHNvIGhhcmRlciB0byBt
b3ZlLiAgU2hvdWxkIHdlIGFkZCBhIGtyZWYgdG8gdGhlIG9iamVjdCBhcnJheT8KPiA+Cj4gPiBZ
ZXAsIHJlZmNvdW50aW5nIHdvdWxkIGJlIHRoZSBvdGhlciB3YXkgdG8gZml4IHRoZSByYWNlLgo+
ID4KPiA+ID4gVGhpcyBib3RoZXJzIG1lIGJlY2F1c2UgSSByZWNlbnRseSByYW4gaW50byBhIENQ
VS1ib3VuZCBnYW1lIHdpdGggdmVyeQo+ID4gPiBiYWQgbG9jayBjb250ZW50aW9uIGhlcmUuCj4g
Pgo+ID4gSG1tLiAgQW55IGNsdWUgd2hlcmUgdGhpcyBjb21lcyBmcm9tPyAgTXVsdGlwbGUgdGhy
ZWFkcyBjb21wZXRpbmcgZm9yCj4gPiB2aXJ0aW8gYnVmZmVycyBJIGd1ZXNzPyAgTWF5YmUgd2Ug
c2hvdWxkIGhhdmUgbGFyZ2VyIHZpcnRxdWV1ZXM/Cj4gVGhlIGdhbWUgd2FzIHNpbmdsZS10aHJl
YWRlZC4gIEkgZ3Vlc3MgaXQgd2FzIHRoZSBnYW1lIGFuZCBYb3JnCj4gY29tcGV0aW5nIGZvciB2
aXJ0aW8gYnVmZmVycy4gIFRoYXQgd2FzIGFsc28gb24gYW4gb2xkZXIga2VybmVsCj4gd2l0aG91
dCBleHBsaWNpdCBmZW5jZXMuICBUaGUgdXNlcnNwYWNlIGhhZCB0byBjcmVhdGUgZHVtbXkgcmVz
b3VyY2VzCj4gZnJlcXVlbnRseSB0byBkbyBWSVJUSU9fSU9DVExfUkVTT1VSQ0VfV0FJVC4KPgo+
IEkgdGhpbmsgdGhpcyBpcyBmaW5lIGZvciBub3cgYXMgZmFyIGFzIEkgYW0gY29uY2VybmVkLiAg
SSBjYW4gbG9vawo+IGludG8gdGhpcyBtb3JlIGNsb3NlbHkgYWZ0ZXIgdGhpcyBzZXJpZXMgbGFu
ZHMuCkl0IHdhcyB2aXJ0aW9fZ3B1X2RlcXVldWVfY3RybF9mdW5jIHdobyB3YW50ZWQgdG8gZ3Jh
YiB0aGUgbG9jayB0bwpoYW5kbGUgdGhlIHJlc3BvbnNlcy4gIEkgc2VudCBhIHBhdGNoIGZvciBp
dAoKICBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzYzNTI5LwoKPgo+
Cj4gPgo+ID4gY2hlZXJzLAo+ID4gICBHZXJkCj4gPgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
