Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA12C4848
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 09:19:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 013196E8EA;
	Wed,  2 Oct 2019 07:18:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc33.google.com (mail-yw1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 782DE89F31
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2019 16:09:58 +0000 (UTC)
Received: by mail-yw1-xc33.google.com with SMTP id e205so5006889ywc.7
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Oct 2019 09:09:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=rVNHxQBv3COxHhMQfRaJbsiP7eYBEtcANM45F8qCpHU=;
 b=eDCMj3gN2pWVkn+/pedGkvA3lZIvTTmm8R1CcKb+sjXSHH6MORnV3dubELojOiauYY
 f11o4R+G2yfLzGDPC/wkVN38ODH7MWbjgKTR+7L3J24yf/CI7rSDqceMt7eMe+jkEe9v
 25DyYID3Imkjk7Hbr+z2Cqzoad1bgz87mbSFsvpW/K/7nNSmQg20zLIbNDb5J0/rTiTh
 ohCN59zfeDjC7DyndG6HwyNaWtOIFP1lxq+MPrApMWaTkOZMqwdy7Cgf8k4mR2XInKlg
 xXFxRYChcfcSg0tI99pE3reM88lSJo7CdgaFh8Em0QQYDoYM5W3tMwT6kVbwqUKs3Nkh
 dwKw==
X-Gm-Message-State: APjAAAUhZCV8eR100K3FXr/Q9dHnFIWyh17ZA/bRN3AEgFj1IRfV7EhB
 wZuAGm6nLbMCzbnZzfpblQ6BW7pxPC546lejKq9nYw==
X-Google-Smtp-Source: APXvYqzgnRQdx/qCST006QCqgkFgZVE4/eRmlQMSUuu+pBysIW8Hg9MW8MGgOGAs67oGA0G5jKFAN8iyWDE+pSCL1gA=
X-Received: by 2002:a81:3203:: with SMTP id y3mr9566155ywy.217.1569946197092; 
 Tue, 01 Oct 2019 09:09:57 -0700 (PDT)
MIME-Version: 1.0
From: Mat King <mathewk@google.com>
Date: Tue, 1 Oct 2019 10:09:46 -0600
Message-ID: <CAL_quvRknSSVvXN3q_Se0hrziw2oTNS3ENNoeHYhvciCRq9Yww@mail.gmail.com>
Subject: New sysfs interface for privacy screens
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
X-Mailman-Approved-At: Wed, 02 Oct 2019 07:18:31 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=rVNHxQBv3COxHhMQfRaJbsiP7eYBEtcANM45F8qCpHU=;
 b=Mv94PspYigl7q8wmgc5vXgkz1pxWmodiRXjtZIwuZy10JWWm6EQ47KE5CnnD6beSy/
 C6HPagwpcJvUl4IQZHud39oiNOzkrtsFHHy9sl4b2ZbHkbqmQF7u5p7EHbKzfHAbnD+e
 2Od1UHXavtM+a2oUn+EEAFMxAPO288yETwRZ7ZUx1zKLhLuG6u5ubED5csxPuQoCZZjS
 ydiDGMjXRoTf/hTlHnSCr1wD0s0GzX8nw+kVPTNa0slNzuAivsxBZq1DD1QOxKLsdnMR
 wC+35VeZp0POFXyNgX/IEdZgFU20SYRLggZ5TSLl+EmuPqzkwCFNg0ln3KSHbP4+glrm
 8YGA==
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, rafael@kernel.org,
 gregkh@linuxfoundation.org, Ross Zwisler <zwisler@google.com>,
 Jingoo Han <jingoohan1@gmail.com>, Rajat Jain <rajatja@google.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmVzZW5kaW5nIGluIHBsYWluIHRleHQgbW9kZQoKSSBoYXZlIGJlZW4gbG9va2luZyBpbnRvIGFk
ZGluZyBMaW51eCBzdXBwb3J0IGZvciBlbGVjdHJvbmljIHByaXZhY3kKc2NyZWVucyB3aGljaCBp
cyBhIGZlYXR1cmUgb24gc29tZSBuZXcgbGFwdG9wcyB3aGljaCBpcyBidWlsdCBpbnRvIHRoZQpk
aXNwbGF5IGFuZCBhbGxvd3MgdXNlcnMgdG8gdHVybiBpdCBvbiBpbnN0ZWFkIG9mIG5lZWRpbmcg
dG8gdXNlIGEKcGh5c2ljYWwgcHJpdmFjeSBmaWx0ZXIuIEluIGRpc2N1c3Npb25zIHdpdGggbXkg
Y29sbGVhZ3VlcyB0aGUgaWRlYSBvZgp1c2luZyBlaXRoZXIgL3N5cy9jbGFzcy9iYWNrbGlnaHQg
b3IgL3N5cy9jbGFzcy9sZWRzIGJ1dCB0aGlzIG5ldwpmZWF0dXJlIGRvZXMgbm90IHNlZW0gdG8g
cXVpdGUgZml0IGludG8gZWl0aGVyIG9mIHRob3NlIGNsYXNzZXMuCgpJIGFtIHByb3Bvc2luZyBh
ZGRpbmcgYSBjbGFzcyBjYWxsZWQgInByaXZhY3lfc2NyZWVuIiB0byBpbnRlcmZhY2UKd2l0aCB0
aGVzZSBkZXZpY2VzLiBUaGUgaW5pdGlhbCBBUEkgd291bGQgYmUgc2ltcGxlIGp1c3QgYSBzaW5n
bGUKcHJvcGVydHkgY2FsbGVkICJwcml2YWN5X3N0YXRlIiB3aGljaCB3aGVuIHNldCB0byAxIHdv
dWxkIG1lYW4gdGhhdApwcml2YWN5IGlzIGVuYWJsZWQgYW5kIDAgd2hlbiBwcml2YWN5IGlzIGRp
c2FibGVkLgoKQ3VycmVudCBrbm93biB1c2UgY2FzZXMgd2lsbCB1c2UgQUNQSSBfRFNNIGluIG9y
ZGVyIHRvIGludGVyZmFjZSB3aXRoCnRoZSBwcml2YWN5IHNjcmVlbnMsIGJ1dCB0aGlzIGNsYXNz
IHdvdWxkIGFsbG93IGRldmljZSBkcml2ZXIgYXV0aG9ycwp0byB1c2Ugb3RoZXIgaW50ZXJmYWNl
cyBhcyB3ZWxsLgoKRXhhbXBsZToKCiMgZ2V0IHByaXZhY3kgc2NyZWVuIHN0YXRlCmNhdCAvc3lz
L2NsYXNzL3ByaXZhY3lfc2NyZWVuL2Nyb3NfcHJpdmFjeS9wcml2YWN5X3N0YXRlICMgMTogcHJp
dmFjeQplbmFibGVkIDA6IHByaXZhY3kgZGlzYWJsZWQKCiMgc2V0IHByaXZhY3kgZW5hYmxlZApl
Y2hvIDEgPiAvc3lzL2NsYXNzL3ByaXZhY3lfc2NyZWVuL2Nyb3NfcHJpdmFjeS9wcml2YWN5X3N0
YXRlCgogRG9lcyB0aGlzIGFwcHJvYWNoIHNlZW0gdG8gYmUgcmVhc29uYWJsZT8KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
