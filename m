Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6344BD8AE2
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 10:27:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A16FC6E8F8;
	Wed, 16 Oct 2019 08:27:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E3D86E8F6
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 08:27:21 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id l21so20626882edr.5
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 01:27:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hIVVy6cMJGB/802PPmCv+d212rxtmpqIPcdcqOUFqaw=;
 b=Fq82W8S7NDGfniStBVsM3CadRAcrl0rSvlcwyPJmFyW4PD1LhvdRTatzgHGvfEcaqv
 VYO0irF08DMJ1kt8UDL4eVR8YkzShx9S/wrkt3ojD/GUWF7HmYgnUK5vO2o7hmXf51gg
 g1+BH4TCqiWws4vkd+tpr9/1vkTTUNcnx3INaSFi/WWA7O7eNl4AKWx/znCyMad7JTEw
 BVHFAKX9wW24HV4B0cTaMCCeu13y2GUMtgnIgcAlby1YQp49a3nmZsim9uuvJNIUuJmB
 YCCAeFrxqTmJRYlLObvG248N4B6Tq6gSI3l5oMDbF8J0I0VbxdPN9x6ageCPA5GlvH4t
 57VQ==
X-Gm-Message-State: APjAAAXJTWf9yPF/MU6keV7fJ7nvQD0ssvB7fIazFLJ8a8A/CuySBO84
 xY4/c5rKPpcKMkxNTDAG1FgHb/2nMzBGiA==
X-Google-Smtp-Source: APXvYqzHopTVzN54ZSn7MbvKwd2E2L0i/KdmpmWg2AAmCogjXTAD+l1YXJ6FBWqM4RaS2a4lVzJRBw==
X-Received: by 2002:a17:906:3e41:: with SMTP id
 t1mr16371212eji.103.1571214439718; 
 Wed, 16 Oct 2019 01:27:19 -0700 (PDT)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com.
 [209.85.221.52])
 by smtp.gmail.com with ESMTPSA id f21sm4008574edt.52.2019.10.16.01.27.16
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Oct 2019 01:27:18 -0700 (PDT)
Received: by mail-wr1-f52.google.com with SMTP id n14so26885496wrw.9
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 01:27:16 -0700 (PDT)
X-Received: by 2002:adf:f3c9:: with SMTP id g9mr1541264wrp.7.1571214436369;
 Wed, 16 Oct 2019 01:27:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190912094121.228435-1-tfiga@chromium.org>
 <20190917132305.GV3958@phenom.ffwll.local>
 <CAAFQd5ADmObo1yVnFGaWDU=DHF+tex3tWJxTZLkxv=EdGNNM7A@mail.gmail.com>
 <20191008100328.GN16989@phenom.ffwll.local>
 <CAAFQd5CR2YhyNoSv7=nUhPQ7Nap6n36DrtsCfqS+-iWydAqbNA@mail.gmail.com>
 <20191008150435.GO16989@phenom.ffwll.local>
 <CAAFQd5DhKn_2uSA=1JDSj0H98aT8X9UjxWaTBwZCDfOC7YR5Sg@mail.gmail.com>
 <20191016061201.iinqjcw6trx5qztq@sirius.home.kraxel.org>
In-Reply-To: <20191016061201.iinqjcw6trx5qztq@sirius.home.kraxel.org>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 16 Oct 2019 17:27:04 +0900
X-Gmail-Original-Message-ID: <CAAFQd5B2KRJ4hKuh2rwYvgY+FLzAR-ZqNthz9XrsaPm3v3Rsnw@mail.gmail.com>
Message-ID: <CAAFQd5B2KRJ4hKuh2rwYvgY+FLzAR-ZqNthz9XrsaPm3v3Rsnw@mail.gmail.com>
Subject: Re: [RFC PATCH] drm/virtio: Export resource handles via DMA-buf API
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=hIVVy6cMJGB/802PPmCv+d212rxtmpqIPcdcqOUFqaw=;
 b=VvfuWundF+ym1IvwwPUppv/LB2L6Z21+F3nWhnuESRQu/dDkWkWnxN0HOvt5o37maW
 N782ZuvA6/DkOtFY9J/AVKwZM2Nn7izbDjEItH/mnqH72fr1AqBGLm+iAvRBRvnsyG1Y
 Nx9XjRhpxAQnyGW6SpPO85uINTa/rxfc30qNE=
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
Cc: Zach Reizner <zachr@chromium.org>, David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 Keiichi Watanabe <keiichiw@chromium.org>, stevensd@chromium.org,
 =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
 Pawel Osciak <posciak@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMTYsIDIwMTkgYXQgMzoxMiBQTSBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVk
aGF0LmNvbT4gd3JvdGU6Cj4KPiAgIEhpLAo+Cj4gPiB1cCBsYXRlciB3aGVuIGdpdmVuIGEgYnVm
ZmVyIGluZGV4LiBCdXQgd2Ugd291bGQgc3RpbGwgbmVlZCB0byBtYWtlCj4gPiB0aGUgRE1BLWJ1
ZiBpdHNlbGYgaW1wb3J0YWJsZS4gRm9yIHZpcnRpby1ncHUgSSBndWVzcyB0aGF0IHdvdWxkIG1l
YW4KPiA+IHJldHVybmluZyBhbiBzZ190YWJsZSBiYWNrZWQgYnkgdGhlIHNoYWRvdyBidWZmZXIg
cGFnZXMuCj4KPiBUaGUgdmlydGlvLWdwdSBkcml2ZXIgaW4gZHJtLW1pc2MtbmV4dCBzdXBwb3J0
cyBkbWEtYnVmIGV4cG9ydHMuCgpHb29kIHRvIGtub3csIHRoYW5rcy4KCkJlc3QgcmVnYXJkcywK
VG9tYXN6Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
