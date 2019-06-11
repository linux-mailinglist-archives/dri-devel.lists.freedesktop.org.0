Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E4741CBB
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 08:54:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B16728926E;
	Wed, 12 Jun 2019 06:53:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D16988FFA
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 14:04:49 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id n5so9968554ioc.7
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 07:04:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lqiV0H/q9eXS4pPY8ifFtwx91fWhcQXdqFfEPZLTdQo=;
 b=tbXKCUrxF9SXxU4gwRub6Fq+JC15dislLPFHtTdiKLimZTtGHKNFmCO/MocudOucDX
 D2FlldRqyv4z44p6vcK9RaHCOKj3WX0UJKC3Dc8Vk5dLztcer4U8HVCe5TrQ4aFe8pVM
 8d7Yn8t1usQsC64W/EUrJL0aytw++trQSibZu6tkgiF91sottQWQy0uCDoL8xTXdNX0Z
 zdlHLS5GJUg/jQLd4tQbHXwtgU55Ny+MwXNuriEqML7Q/wvcMm/8zTaJfIvMSapS1wgz
 KvFP2urO/k6TQMi8zUAS9jz5NG7BumYoXWfQeVWn/FuB3VnDzR/pXFXOmmI2YlYIynpV
 8zhA==
X-Gm-Message-State: APjAAAWs5/CAB40lJpDSerWhwurtdYLmLj6+zVucV6Y5m3V/JOV8yKsb
 iSMsa5dHRCZu1hwJNJuHFfHudcG8Uz2Jjltv2WfECg==
X-Google-Smtp-Source: APXvYqw3LRmAkOB3ftFk4yMEDVpReE2Imm5Cqt58r31GxBysK1n5qJ/Bi+jXKdTRBFe/XTjFGtBUaC60P2Pgde1TZs4=
X-Received: by 2002:a5d:9d83:: with SMTP id 3mr41608629ion.65.1560261888654;
 Tue, 11 Jun 2019 07:04:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190529154635.2659-1-hdegoede@redhat.com>
 <CAKv+Gu8bLcDROFNFfqHaN1Z+EK5bnXMNDSJbBK-pCmq5XP_kBw@mail.gmail.com>
In-Reply-To: <CAKv+Gu8bLcDROFNFfqHaN1Z+EK5bnXMNDSJbBK-pCmq5XP_kBw@mail.gmail.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Tue, 11 Jun 2019 16:04:35 +0200
Message-ID: <CAKv+Gu8w2Vj-AS-cfaB8cms+ZJ7qppS-Du_334_xm51rz0CYsA@mail.gmail.com>
Subject: Re: [PATCH] efifb: BGRT: Add check for new BGRT status field rotation
 bits
To: Hans de Goede <hdegoede@redhat.com>
X-Mailman-Approved-At: Wed, 12 Jun 2019 06:53:42 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=lqiV0H/q9eXS4pPY8ifFtwx91fWhcQXdqFfEPZLTdQo=;
 b=eUtJcz7kMzQNsi51loJSdWD05S0bHEOKf0PxE6aQVntLz281nYy3TJ4EMAOxtpDVL3
 ndf7w5pBzShfAa7NyLIFwXXxOZWNlu8Gyin4oHHZVQsyvb1NnMZxn7CpdITj22zG/IfO
 DCjEqgWRNJMD8DTcAz+GhzuIg+AM8obANPmWyQcSpGUCv+zEroQph640p+cLh/JhS+T1
 Mn4qb9KYmNG8bCplBuq3our6DHBmM9pgKINJ26OzUgcKsg2RPI/mEd5dpqGcxj8ujyIb
 Sn5Ycs32hcDG9W1cK/EjKfa2ql+YFQa+tjjH6Emyt2/nrrDsekbpe3/c5LedxtR9eI84
 ANQA==
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
Cc: linux-efi <linux-efi@vger.kernel.org>,
 "open list:EFIFB FRAMEBUFFER DRIVER" <linux-fbdev@vger.kernel.org>,
 Peter Jones <pjones@redhat.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAxMCBKdW4gMjAxOSBhdCAxNzoxMiwgQXJkIEJpZXNoZXV2ZWwgPGFyZC5iaWVzaGV1
dmVsQGxpbmFyby5vcmc+IHdyb3RlOgo+Cj4gT24gV2VkLCAyOSBNYXkgMjAxOSBhdCAxNzo0Niwg
SGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPgo+ID4gU3RhcnRp
bmcgd2l0aCBBQ1BJIDYuMiBiaXRzIDEgYW5kIDIgb2YgdGhlIEJHUlQgc3RhdHVzIGZpZWxkIGFy
ZSBubyBsb25nZXIKPiA+IHJlc2VydmVkLiBUaGVzZSBiaXRzIGFyZSBub3cgdXNlZCB0byBpbmRp
Y2F0ZSBpZiB0aGUgaW1hZ2UgbmVlZHMgdG8gYmUKPiA+IHJvdGF0ZWQgYmVmb3JlIGJlaW5nIGRp
c3BsYXllZC4KPiA+Cj4gPiBUaGUgZWZpZmIgY29kZSBkb2VzIG5vdCBzdXBwb3J0IHJvdGF0aW5n
IHRoZSBpbWFnZSBiZWZvcmUgY29weWluZyBpdCB0bwo+ID4gdGhlIHNjcmVlbi4KPiA+Cj4gPiBU
aGlzIGNvbW1pdCBhZGRzIGEgY2hlY2sgZm9yIHRoZXNlIG5ldyBiaXRzIGFuZCBpZiB0aGV5IGFy
ZSBzZXQgbGVhdmVzIHRoZQo+ID4gZmIgY29udGVudHMgYXMgaXMgaW5zdGVhZCBvZiB0cnlpbmcg
dG8gdXNlIHRoZSB1bi1yb3RhdGVkIEJHUlQgaW1hZ2UuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTog
SGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4KPgo+IEFja2VkLWJ5OiBBcmQgQmll
c2hldXZlbCA8YXJkLmJpZXNoZXV2ZWxAbGluYXJvLm9yZz4KPgoKQlRXIHNob3VsZCB3ZSBtYWtl
IHN1cmUgdGhhdCB0aGlzIHBhdGNoIGFuZCB0aGUgZWZpLWJncnQgcGF0Y2ggZ2V0Cm1lcmdlZCBh
dCB0aGUgc2FtZSB0aW1lPyBJIGd1ZXNzIHRoZSBuZXQgcmVzdWx0IGlzIGp1c3QgdGhhdCB3ZSBn
ZXQKcmlkIG9mIHNvbWUgZXJyb3IgaW4gdGhlIGxvZywgYnV0IGEgcm90YXRlZCBCTVAgd2lsbCBi
ZSBpZ25vcmVkCm90aGVyd2lzZS4gT3IgaXMgaXQgcmVsZXZhbnQgZm9yIHVzZXJsYW5kIGluIHNv
bWUgb3RoZXIgd2F5PwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
