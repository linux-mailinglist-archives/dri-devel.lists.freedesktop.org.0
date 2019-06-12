Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D0D4338B
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 09:30:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E110B893A4;
	Thu, 13 Jun 2019 07:28:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30D3B8936B
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 15:37:44 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id n5so511532otk.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 08:37:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RsqihsdTZ7LIE8YaxQnk8MRcA/dl71FO8WO7w9aVH+E=;
 b=R1uw3eKgc8/n9AVR9u7NTdEGAoedaISHAu4+2A88xisLw0tsBrTM2ONXWcM9fO7v42
 cw4pXq8cWw5g0rNra0eEev8m4gR1Ic2MpV54qVzhvA9w64K+bPrVqkdRrf5bgo8rSlAO
 +CHw4nP5WCneR53gNtOwumtrL+QHPxlN6NSw6/bF8XAUrWJkN4FI+mpKkTauL+s6slDm
 VGPTEQNdU8wuG6csEbk8xdhxDmzIRZQrDaU/jpegmKk+l0mlt2Ck1hXZKKxzCJwXba+S
 iIpp4QOEkjmdMsHmLDJ5uAzL9D/t04inQxQVMDui0nKBU1tuGz+qR7vSbibDL2OWflC7
 ARug==
X-Gm-Message-State: APjAAAUC8pu1Nsht99eUpl7gb28TtkEtqVEBwPUQjn/lBMhNH1EKh9ow
 YUpTk8+CgJI4UECLJg2veuSX0AmqmI8YAOqnfITShpND
X-Google-Smtp-Source: APXvYqysNDi7cYWl0383XG0b2CH2z7xBNwGD82byCyBahOesmKpgk+UIpRHv9z4cXy4ZApJD4DWY9ORUUzNEQxEFPtA=
X-Received: by 2002:a05:6830:16:: with SMTP id
 c22mr4208479otp.116.1560353863304; 
 Wed, 12 Jun 2019 08:37:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190611110052.iw6qbw2yvypxus6t@shell.armlinux.org.uk>
 <E1haeXi-0001yZ-FS@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1haeXi-0001yZ-FS@rmk-PC.armlinux.org.uk>
From: Sven Van Asbroeck <thesven73@gmail.com>
Date: Wed, 12 Jun 2019 11:37:32 -0400
Message-ID: <CAGngYiWRXQJWz=rSBbhGtpTRc8ErBr1OCE_Mkne6a2EQjotdbQ@mail.gmail.com>
Subject: Re: [PATCH 09/13] drm/i2c: tda998x: clean up tda998x_configure_audio()
To: Russell King <rmk+kernel@armlinux.org.uk>
X-Mailman-Approved-At: Thu, 13 Jun 2019 07:27:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=RsqihsdTZ7LIE8YaxQnk8MRcA/dl71FO8WO7w9aVH+E=;
 b=dt3CqkpitqmzGnsOXDQ6ZM+hhd8kBxJ13hkTqH8SRRe7IH5dvgDxRon0BPFasHHlUC
 6fSa85lPxKbeFWBIk0dJXWpHd/dXpiw7p1BVR0WUTzVwuSKJBJmM6GwEBdaWcH+5YTwz
 Dy4nGpWpmKWT89AbxU8h7IpILS3jFDwExn39ZzfgKDiZpVYSDR5xVaaD/Foh5ZK7tHE8
 4ci9dpHx9dj18uXK2jX5AukBJghaRNBb1+4zRVNoJRDyociYtjmQYirsEI3TuylUNMW8
 KUL6rzLYRn72eCPzY+v5lJrVXvq+C7MIGVtgE9Zxwi2PDUJagKlTZaMBjNA8mvwZKKhD
 WLeA==
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Mark Brown <broonie@kernel.org>,
 Jyri Sarha <jsarha@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgNzowMiBBTSBSdXNzZWxsIEtpbmcgPHJtaytrZXJuZWxA
YXJtbGludXgub3JnLnVrPiB3cm90ZToKPgo+IHRkYTk5OHhfY29uZmlndXJlX2F1ZGlvKCkgaXMg
Y2FsbGVkIHZpYSBzb21lIHBhdGhzIHdoZXJlIGFuIGVycm9yCj4gcmV0dXJuIGlzIG1lYW5pbmds
ZXNzLCBhbmQgYXMgYSByZXN1bHQgb2YgbW92aW5nIHRoZSBhdWRpbyByb3V0aW5nCj4gY29kZSwg
dGhpcyBmdW5jdGlvbiBubyBsb25nZXIgcmV0dXJucyBhbnkgZXJyb3JzLCBzbyBsZXQncyBtYWtl
IGl0Cj4gdm9pZC4gV2UgY2FuIGFsc28gbWFrZSB0ZGE5OTh4X3dyaXRlX2FpZigpIHJldHVybiB2
b2lkIGFzIHdlbGwuCj4KPiB0ZGE5OTh4X2NvbmZpZ3VyZV9hdWRpbygpIGFsc28gb25seSBldmVy
IG5lZWRzIHRvIHdyaXRlIHRoZSBjdXJyZW50Cj4gYXVkaW8gc2V0dGluZ3MsIHNvIHNpbXBsaWZ5
IHRoZSBjb2RlIGluIHRkYTk5OHhfYXVkaW9faHdfcGFyYW1zKCkKPiBzbyB0aGF0IGNhbiBoYXBw
ZW4uCj4KPiBTaWduZWQtb2ZmLWJ5OiBSdXNzZWxsIEtpbmcgPHJtaytrZXJuZWxAYXJtbGludXgu
b3JnLnVrPgo+IC0tLQoKTml0OgoKK3N0YXRpYyB2b2lkIHRkYTk5OHhfY29uZmlndXJlX2F1ZGlv
KHN0cnVjdCB0ZGE5OTh4X3ByaXYgKnByaXYpCiB7CisgICAgICAgc3RydWN0IHRkYTk5OHhfYXVk
aW9fc2V0dGluZ3MgKnNldHRpbmdzID0gJnByaXYtPmF1ZGlvOwoKc2V0dGluZ3MgY291bGQgYmUg
Y29uc3QgPwoKLXN0YXRpYyBpbnQgdGRhOTk4eF93cml0ZV9haWYoc3RydWN0IHRkYTk5OHhfcHJp
diAqcHJpdiwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgaGRtaV9hdWRpb19p
bmZvZnJhbWUgKmNlYSkKK3N0YXRpYyB2b2lkIHRkYTk5OHhfd3JpdGVfYWlmKHN0cnVjdCB0ZGE5
OTh4X3ByaXYgKnByaXYsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBoZG1p
X2F1ZGlvX2luZm9mcmFtZSAqY2VhKQoKY2VhIGNvdWxkIGJlIGNvbnN0ID8KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
