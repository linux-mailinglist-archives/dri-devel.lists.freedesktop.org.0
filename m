Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAF9FAB88
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 08:57:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E67DF6EC89;
	Wed, 13 Nov 2019 07:56:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D5726E488
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 04:38:21 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id w9so722926wrr.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 20:38:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:date:to:cc:subject:in-reply-to
 :message-id:references:user-agent:mime-version;
 bh=6Rb656liMW5iqgFRm8uCYcs0BBDjpFH5RMQxLc43FYg=;
 b=C+U2JjtRVh3HobMF1VfLOJLiipS42VKQLqRO2A61P5JCRaWBeKDeG9vzVIIJmRCRjv
 Iay8JGcLdln004XqLP7KTLfX21AfPP/ZxLvBPMwErKtji0C6S1vwJZHbTcErhAHB466u
 E1yHIMgqeOIWW8CPPxSjg6l4si5zD3CSPF4UAqmoPE9WfgFodqziHgQVLsQ9NKF259wW
 IJon6/Ge/eaVjlnpm1S8Fk3ZKt2WvrU6Jh2UB9z8IILK0QdyGv7jQ6VgApIt5oIpFecW
 24GJ7nUp+UfyiOpMxsNEnLhxyd2+AwOVlQaHqeeV8YyFNA1wE2F5XdZl3VNbx5LayUco
 +pew==
X-Gm-Message-State: APjAAAU6l3P7QT4YbNCAjwmyOvOVY6oJWd/k8Z+KSheltEKcQtWMjJWv
 RzhBtC5ieIQY2QDlHEmfOOs=
X-Google-Smtp-Source: APXvYqz9J5U4F6/xJm+zDtXlYuJstE1JdYLst91hk210PVFcyd3/3d9oj8mbIs8r/VyDDtSwIAbmOQ==
X-Received: by 2002:adf:c401:: with SMTP id v1mr691909wrf.375.1573619900605;
 Tue, 12 Nov 2019 20:38:20 -0800 (PST)
Received: from wambui.local ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id p4sm1322221wrx.71.2019.11.12.20.38.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2019 20:38:19 -0800 (PST)
From: Wambui Karuga <wambui@karuga.xyz>
X-Google-Original-From: Wambui Karuga <wambui@wambui>
Date: Wed, 13 Nov 2019 07:38:00 +0300 (EAT)
To: Wambui Karuga <wambui.karugax@gmail.com>, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, sean@poorly.run, 
 airlied@linux.ie, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/print: add DRM_DEV_WARN macro
In-Reply-To: <20191112182705.GL23790@phenom.ffwll.local>
Message-ID: <alpine.LNX.2.21.99999.375.1911130736490.2567@wambui>
References: <20191112170909.13733-1-wambui.karugax@gmail.com>
 <20191112182705.GL23790@phenom.ffwll.local>
User-Agent: Alpine 2.21.99999 (LNX 375 2019-10-29)
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 13 Nov 2019 07:55:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=6Rb656liMW5iqgFRm8uCYcs0BBDjpFH5RMQxLc43FYg=;
 b=MZHIdB583lS1DUJ5f2Yk9eJgKd1TaKCH7MP2vBYjr53qWrEglioVmlCfFNu8r/Leix
 joVMrtCtCuIsPrGbtuk5QNiOrtaoqsFXxVBYJQ/Mt212sWIuOTPsS+VZ20l4TiZjnhPC
 lLspqlbgHrQ0Kj7eu+uMZAl2+ogz//tg7iV/sMl9lgHrfj5nQ3N1+E1Tis2y0/q8n9IN
 mTwKjJc9HIV7oMYzWROYF5krcFKCsyh+anaNc0EUs6cAGKECZ1k+LwoN2ukEnAkd5NOb
 q6+ValHnC3ou62E/Gz4TarLDdG2EwhRezd+61L3GoA5m+AeL+a1Gq46Vo1kksZQMtjKg
 eQtg==
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiBUdWUsIDEyIE5vdiAyMDE5LCBEYW5pZWwgVmV0dGVyIHdyb3RlOgoKPiBPbiBUdWUsIE5v
diAxMiwgMjAxOSBhdCAwODowOTowOVBNICswMzAwLCBXYW1idWkgS2FydWdhIHdyb3RlOgo+PiBB
ZGQgdGhlIERSTV9ERVZfV0FSTiBoZWxwZXIgbWFjcm8gZm9yIHByaW50aW5nIHdhcm5pbmdzCj4+
IHRoYXQgdXNlIGRldmljZSBwb2ludGVycyBpbiB0aGVpciBsb2cgb3V0cHV0IGZvcm1hdC4KPj4g
RFJNX0RFVl9XQVJOIGNhbiByZXBsYWNlIHRoZSB1c2Ugb2YgZGV2X3dhcm4gaW4gc3VjaCBjYXNl
cy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogV2FtYnVpIEthcnVnYSA8d2FtYnVpLmthcnVnYXhAZ21h
aWwuY29tPgo+Cj4gQ2FuIHlvdSBwbHMgaW5jbHVkZSB0aGlzIGluIHRoZSBwYXRjaCB0byBhZGQg
dGhlIGZpcnN0IHVzZXIgd2l0aCByb2NrY2hpcD8KPiBPdGhlcndpc2UgYWx3YXlzIGEgYml0IGF3
a3dhcmQgd2hlbiB3ZSBhZGQgZnVuY3Rpb25zIHdpdGhvdXQgY2FsbGVycy4KPgpPa2F5LCBJJ2xs
IHNlbmQgdGhhdCBhcyB3ZWxsLgpUaG91Z2h0IGl0J2QgYmUgYmV0dGVyIHRvIGdldCB0aGlzIGFj
Y2VwdGVkIGZpcnN0LgoKd2FtYnVpCj4gbGd0bSBvdGhlcndpc2UuCj4gLURhbmllbAo+Cj4+IC0t
LQo+PiAgaW5jbHVkZS9kcm0vZHJtX3ByaW50LmggfCA5ICsrKysrKysrKwo+PiAgMSBmaWxlIGNo
YW5nZWQsIDkgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJt
X3ByaW50LmggYi9pbmNsdWRlL2RybS9kcm1fcHJpbnQuaAo+PiBpbmRleCA1YjgwNDk5OTJjMjQu
LjZkZGY5MWMwY2IyOSAxMDA2NDQKPj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX3ByaW50LmgKPj4g
KysrIGIvaW5jbHVkZS9kcm0vZHJtX3ByaW50LmgKPj4gQEAgLTMyOSw2ICszMjksMTUgQEAgdm9p
ZCBkcm1fZXJyKGNvbnN0IGNoYXIgKmZvcm1hdCwgLi4uKTsKPj4gICNkZWZpbmUgRFJNX1dBUk5f
T05DRShmbXQsIC4uLikJCQkJCQlcCj4+ICAJX0RSTV9QUklOVEsoX29uY2UsIFdBUk5JTkcsIGZt
dCwgIyNfX1ZBX0FSR1NfXykKPj4KPj4gKy8qKgo+PiArICogV2FybmluZyBvdXRwdXQuCj4+ICsg
Kgo+PiArICogQGRldjogZGV2aWNlIHBvaW50ZXIKPj4gKyAqIEBmbXQ6IHByaW50ZigpIGxpa2Ug
Zm9ybWF0IHN0cmluZy4KPj4gKyAqLwo+PiArI2RlZmluZSBEUk1fREVWX1dBUk4oZGV2LCBmbXQs
IC4uLikJCQkJCVwKPj4gKwlkcm1fZGV2X3ByaW50ayhkZXYsIEtFUk5fV0FSTklORywgZm10LCAj
I19fVkFfQVJHU19fKQo+PiArCj4+ICAvKioKPj4gICAqIEVycm9yIG91dHB1dC4KPj4gICAqCj4+
IC0tCj4+IDIuMTcuMQo+Pgo+Cj4gLS0gCj4gRGFuaWVsIFZldHRlcgo+IFNvZnR3YXJlIEVuZ2lu
ZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgo+IGh0dHA6Ly9ibG9nLmZmd2xsLmNoCj4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
