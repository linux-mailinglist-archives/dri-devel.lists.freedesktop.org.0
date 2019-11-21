Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 537B01059A1
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 19:36:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E25AA6F3DA;
	Thu, 21 Nov 2019 18:36:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22B646E02E;
 Thu, 21 Nov 2019 18:36:13 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id 4so2371709wro.7;
 Thu, 21 Nov 2019 10:36:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RyP+qGIUmMn5Rn4nl7SNznhru/ZMeAhUvNe8YatkcLM=;
 b=fKecbiHJOuB1tZQakJm16bvokhZTqfUMZveAQ2Zl8FEsoqGGFrUNTKNcSUo/6LCYpI
 fXoxFusWu5L+r8ItKYq/e4Uo606SebYxVzxLVQAgG7LVWTfthP8mtvcKpekiKrptELA1
 jj+CleyKW0T8BjK0VTqnrGPcKUqzsB+EQoSlA/UKkXRGD8rosZ0K4kwp5gjjePga4m5G
 a2bqmPtDOf4fS5iF3zZr1ydbcxnfDKavCOFFx+4KIcu1k8hKrsfPQKArMcR6ySqV5Gig
 K+iF0Pg5w9yPtOiTpViZrrU93NFYrWDAi6QBHmCJG/UNpppo37GCeRLNs4LCzCeNroaT
 kF6A==
X-Gm-Message-State: APjAAAUOTDMg0TftspoeWEfJPRhXwP06BwxbRYmZ/la13ph99D9sh9PS
 0luqEqe2jgha/2nnGHGuVxL6k/LsqT1nqhYX8BA=
X-Google-Smtp-Source: APXvYqx+/J7uJEB8/qOWY/tARDfUO9c/oBPdqEv7il+2N7tPOYF+oblOZ/aVb6uvLbT/QMn6oxlgyycRMwXkAVeGBBQ=
X-Received: by 2002:a5d:4a8f:: with SMTP id o15mr3870466wrq.50.1574361371508; 
 Thu, 21 Nov 2019 10:36:11 -0800 (PST)
MIME-Version: 1.0
References: <20191121165401.405845-1-colin.king@canonical.com>
In-Reply-To: <20191121165401.405845-1-colin.king@canonical.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 21 Nov 2019 13:35:59 -0500
Message-ID: <CADnq5_OGNUUvixju5qJf7Q_iYu--LAD3LWhXB4pkQFpjS5HpMQ@mail.gmail.com>
Subject: Re: [PATCH][next] drm/amdgpu: remove redundant assignment to pointer
 write_frame
To: Colin King <colin.king@canonical.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=RyP+qGIUmMn5Rn4nl7SNznhru/ZMeAhUvNe8YatkcLM=;
 b=VRlV/A1K4OZsTJcRAi8KhIOUVK/GwYoaZLIN3+UWtkv3K7BKcGbhQxk/k89/ZbyjwW
 a2HXn80y0CWVHWh+Jc8XhAyTcvkWk13deJaz2Q8h4+O3+81t+D17Ww9J0485El97S8lb
 /y7O1vM77o7uQZMXYyp41sej6+CsV1ZRNaPsirdsnk3nmHTenWy3XoHqg94tyNvrGi8W
 HSzyD5qcZJVO0oWWDa96Lu1emr8Pfs9dezvL0407w0AThUJXQ75RuWEgIA9YKUubaMjM
 /DQdn0eG+2traHwJT3qj4sJ9Qh5rx/lPbX1hUZhVEpoiC09tZ8MisAW0GkaXyT5Tlol5
 6D8g==
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZC4gIHRoYW5rcyEKCkFsZXgKCk9uIFRodSwgTm92IDIxLCAyMDE5IGF0IDExOjU0IEFN
IENvbGluIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBD
b2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgo+Cj4gVGhlIHBvaW50ZXIg
d3JpdGVfZnJhbWUgaXMgYmVpbmcgaW5pdGlhbGl6ZWQgd2l0aCBhIHZhbHVlIHRoYXQgaXMKPiBu
ZXZlciByZWFkIGFuZCBpdCBpcyBiZWluZyB1cGRhdGVkIGxhdGVyIHdpdGggYSBuZXcgdmFsdWUu
IFRoZQo+IGluaXRpYWxpemF0aW9uIGlzIHJlZHVuZGFudCBhbmQgY2FuIGJlIHJlbW92ZWQuCj4K
PiBBZGRyZXNzZXMtQ292ZXJpdHk6ICgiVW51c2VkIHZhbHVlIikKPiBTaWduZWQtb2ZmLWJ5OiBD
b2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgo+IC0tLQo+ICBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9wc3AuYwo+IGluZGV4IDJhOGEwOGFhNmVhZi4uYzAyZjlmZmU1YzZiIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuYwo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuYwo+IEBAIC0xNzI4LDcgKzE3
MjgsNyBAQCBpbnQgcHNwX3JpbmdfY21kX3N1Ym1pdChzdHJ1Y3QgcHNwX2NvbnRleHQgKnBzcCwK
PiAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgaW5kZXgpCj4gIHsKPiAgICAgICAgIHVuc2ln
bmVkIGludCBwc3Bfd3JpdGVfcHRyX3JlZyA9IDA7Cj4gLSAgICAgICBzdHJ1Y3QgcHNwX2dmeF9y
Yl9mcmFtZSAqd3JpdGVfZnJhbWUgPSBwc3AtPmttX3JpbmcucmluZ19tZW07Cj4gKyAgICAgICBz
dHJ1Y3QgcHNwX2dmeF9yYl9mcmFtZSAqd3JpdGVfZnJhbWU7Cj4gICAgICAgICBzdHJ1Y3QgcHNw
X3JpbmcgKnJpbmcgPSAmcHNwLT5rbV9yaW5nOwo+ICAgICAgICAgc3RydWN0IHBzcF9nZnhfcmJf
ZnJhbWUgKnJpbmdfYnVmZmVyX3N0YXJ0ID0gcmluZy0+cmluZ19tZW07Cj4gICAgICAgICBzdHJ1
Y3QgcHNwX2dmeF9yYl9mcmFtZSAqcmluZ19idWZmZXJfZW5kID0gcmluZ19idWZmZXJfc3RhcnQg
Kwo+IC0tCj4gMi4yNC4wCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
