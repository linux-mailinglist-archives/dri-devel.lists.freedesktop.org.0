Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E50732B529B
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 21:32:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 022FD6EA81;
	Mon, 16 Nov 2020 20:32:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 097156EA81;
 Mon, 16 Nov 2020 20:32:45 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id p19so646960wmg.0;
 Mon, 16 Nov 2020 12:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tvjObB+QSH10nKAdT+mgUH1fEbKyTz7cFdjI3x4Mh38=;
 b=Z5rUMDq107kdOxeQ9oudvz6w92/u0jvTalftxFkTkOsX816vk7IC2nuwkVym9s16+B
 dISyj0lbJh21VRYzOvLjCrCYYvF+wxxwZcgPbmmOeJZRTW41SWJH7KQuwlaL7PSTwDQb
 jorjF3om74hVfAJt6Ud7dwcLybESn7zNkHOmZgY72b8VJCMmxl5j9BhxUoBXxExelPG6
 8zTDwed30dtPgfJd3PKo4k4rMUmDOyTjJR9CP+CxG7eGG2t6i4Zyx1pDZAgqTurjTPG3
 dJR4XSOtxdmrRlhmDZ1IlKPwCRCHvoBG+s46Nl7pC8ZD4INGVmvqs4mBI4HsXoZ5KG7H
 ylrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tvjObB+QSH10nKAdT+mgUH1fEbKyTz7cFdjI3x4Mh38=;
 b=ql3QRRGdCDv4lzeHPnUMCXYV2LIRRv8aRgu/jOzeC3hQuUiLKsdhXvRNox5Bi3n2xt
 Uvrc13x1Ul+U67FhTTX4ec3AtvsV297r12ZhDiSzLHyQHmVn22SkcWK+Wmpg4TXGKEhu
 HIn5s1K6zQHJCDuZ+/gAOc40+urZ/4SeMvqJKCh9z+eYmyWC7e+92JDuGPfy+ZVAJwL0
 KAJgj88gtgo3As73SaTnuykRzWUKygQy0ISZCEd9FLdLs0KBRDB0S2kcGk8GoSm5mq+F
 2HnZN0k+a9CdIbMnard9ledevOtic6utrUdjZDcwUDLsqwn30JBQdvkt65uJNB7TsXAH
 f/4A==
X-Gm-Message-State: AOAM531EQSZh7B62WApOU++Tbd+kcv6q/uqGH2dU4imxSwaHHmZRpJ81
 6ttHlguEqinxe+rak0OO7EEM6Y5EDKTfyAzi41k=
X-Google-Smtp-Source: ABdhPJx91wm13SHnc9OKeMbG/rgExYVLjFNtsfjpB43JlyH7VsoFOOOVdSDQnex+m4quboH/8kdpgJGkqg94FGU2JQQ=
X-Received: by 2002:a1c:1c3:: with SMTP id 186mr665693wmb.39.1605558763784;
 Mon, 16 Nov 2020 12:32:43 -0800 (PST)
MIME-Version: 1.0
References: <20201116173700.1830487-1-lee.jones@linaro.org>
 <20201116173700.1830487-37-lee.jones@linaro.org>
In-Reply-To: <20201116173700.1830487-37-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 16 Nov 2020 15:32:32 -0500
Message-ID: <CADnq5_PyE+j1YaDX5FBU4cbUqvGt63GsSXW_RvQZXD0Y_6HFiw@mail.gmail.com>
Subject: Re: [PATCH 36/43] drm/radeon/evergreen: Move 'cik_*()'s prototypes to
 shared header
To: Lee Jones <lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMTYsIDIwMjAgYXQgMTI6MzggUE0gTGVlIEpvbmVzIDxsZWUuam9uZXNAbGlu
YXJvLm9yZz4gd3JvdGU6Cj4KPiBGaXhlcyB0aGUgZm9sbG93aW5nIFc9MSBrZXJuZWwgYnVpbGQg
d2FybmluZyhzKToKPgo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2Npay5jOjY0MTM6Njogd2Fy
bmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhjaWtfaW5pdF9jcF9wZ190YWJsZeKA
mSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCj4gIDY0MTMgfCB2b2lkIGNpa19pbml0X2NwX3BnX3Rh
YmxlKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KQo+ICB8IF5+fn5+fn5+fn5+fn5+fn5+fn5+
Cj4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vY2lrLmM6NjY3MDo1OiB3YXJuaW5nOiBubyBwcmV2
aW91cyBwcm90b3R5cGUgZm9yIOKAmGNpa19nZXRfY3NiX3NpemXigJkgWy1XbWlzc2luZy1wcm90
b3R5cGVzXQo+ICA2NjcwIHwgdTMyIGNpa19nZXRfY3NiX3NpemUoc3RydWN0IHJhZGVvbl9kZXZp
Y2UgKnJkZXYpCj4gIHwgXn5+fn5+fn5+fn5+fn5+fgo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9u
L2Npay5jOjY3MDI6Njogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhjaWtf
Z2V0X2NzYl9idWZmZXLigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQo+ICA2NzAyIHwgdm9pZCBj
aWtfZ2V0X2NzYl9idWZmZXIoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYsIHZvbGF0aWxlIHUz
MiAqYnVmZmVyKQo+ICB8IF5+fn5+fn5+fn5+fn5+fn5+fgo+Cj4gQ2M6IEFsZXggRGV1Y2hlciA8
YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiBDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJp
c3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5p
ZT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBhbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cj4gU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KCkFwcGxp
ZWQuICBUaGFua3MhCgpBbGV4CgoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9jaWsu
aCAgICAgICB8IDMgKysrCj4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vZXZlcmdyZWVuLmMgfCA1
ICstLS0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygt
KQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vY2lrLmggYi9kcml2ZXJz
L2dwdS9kcm0vcmFkZW9uL2Npay5oCj4gaW5kZXggNjYzMGI5ZGE5ZTdhYS4uNDIwMjA3ZDE5ZGU1
MiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2Npay5oCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL3JhZGVvbi9jaWsuaAo+IEBAIC0zMCw1ICszMCw4IEBAIHZvaWQgY2lrX2V4
aXRfcmxjX3NhZmVfbW9kZShzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldik7Cj4gIGludCBjaV9t
Y19sb2FkX21pY3JvY29kZShzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldik7Cj4gIHZvaWQgY2lr
X3VwZGF0ZV9jZyhzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldiwgdTMyIGJsb2NrLCBib29sIGVu
YWJsZSk7Cj4gIHUzMiBjaWtfZ3B1X2NoZWNrX3NvZnRfcmVzZXQoc3RydWN0IHJhZGVvbl9kZXZp
Y2UgKnJkZXYpOwo+ICt2b2lkIGNpa19pbml0X2NwX3BnX3RhYmxlKHN0cnVjdCByYWRlb25fZGV2
aWNlICpyZGV2KTsKPiArdTMyIGNpa19nZXRfY3NiX3NpemUoc3RydWN0IHJhZGVvbl9kZXZpY2Ug
KnJkZXYpOwo+ICt2b2lkIGNpa19nZXRfY3NiX2J1ZmZlcihzdHJ1Y3QgcmFkZW9uX2RldmljZSAq
cmRldiwgdm9sYXRpbGUgdTMyICpidWZmZXIpOwo+Cj4gICNlbmRpZiAgICAgICAgICAgICAgICAg
ICAgICAgICAvKiBfX0NJS19IX18gKi8KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Jh
ZGVvbi9ldmVyZ3JlZW4uYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vZXZlcmdyZWVuLmMKPiBp
bmRleCA0NTc1ZTQ0OGU1OWRmLi44ZTllODhiZjFmNDNkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9yYWRlb24vZXZlcmdyZWVuLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9u
L2V2ZXJncmVlbi5jCj4gQEAgLTMxLDYgKzMxLDcgQEAKPgo+ICAjaW5jbHVkZSAiYXRvbS5oIgo+
ICAjaW5jbHVkZSAiYXZpdm9kLmgiCj4gKyNpbmNsdWRlICJjaWsuaCIKPiAgI2luY2x1ZGUgIm5p
LmgiCj4gICNpbmNsdWRlICJydjc3MC5oIgo+ICAjaW5jbHVkZSAiZXZlcmdyZWVuLmgiCj4gQEAg
LTIxNywxMCArMjE4LDYgQEAgc3RhdGljIHZvaWQgZXZlcmdyZWVuX2dwdV9pbml0KHN0cnVjdCBy
YWRlb25fZGV2aWNlICpyZGV2KTsKPiAgdm9pZCBldmVyZ3JlZW5fZmluaShzdHJ1Y3QgcmFkZW9u
X2RldmljZSAqcmRldik7Cj4gIHZvaWQgZXZlcmdyZWVuX3BjaWVfZ2VuMl9lbmFibGUoc3RydWN0
IHJhZGVvbl9kZXZpY2UgKnJkZXYpOwo+ICB2b2lkIGV2ZXJncmVlbl9wcm9ncmFtX2FzcG0oc3Ry
dWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpOwo+IC12b2lkIGNpa19pbml0X2NwX3BnX3RhYmxlKHN0
cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KTsKPiAtCj4gLWV4dGVybiB1MzIgY2lrX2dldF9jc2Jf
c2l6ZShzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldik7Cj4gLWV4dGVybiB2b2lkIGNpa19nZXRf
Y3NiX2J1ZmZlcihzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldiwgdm9sYXRpbGUgdTMyICpidWZm
ZXIpOwo+Cj4gIHN0YXRpYyBjb25zdCB1MzIgZXZlcmdyZWVuX2dvbGRlbl9yZWdpc3RlcnNbXSA9
Cj4gIHsKPiAtLQo+IDIuMjUuMQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
