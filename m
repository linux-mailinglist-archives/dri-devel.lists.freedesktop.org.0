Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A92C11DD26E
	for <lists+dri-devel@lfdr.de>; Thu, 21 May 2020 17:55:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A87E26E947;
	Thu, 21 May 2020 15:55:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32CB16E947
 for <dri-devel@lists.freedesktop.org>; Thu, 21 May 2020 15:55:44 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C9C7C2072C
 for <dri-devel@lists.freedesktop.org>; Thu, 21 May 2020 15:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590076544;
 bh=Nwfyrjzw3eHOJz/N8y9KOakdxCd8FqvuJvr/rkzBgQQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=lilzUBMVFh14+1UPTVw9J58DlIQFSqz2emNpx55gubmLpJ17WE7hJbl6sINOFSmgc
 FdBUkXbKtJv45aTgqeeQShTMgUEoLiHczASD4p+3sCqboAAalOSBMbhsBIGZ3h/632
 GFAqwn+tlE+W1xL2Eq1W3UwnqN2ruV45SDscBhPk=
Received: by mail-ej1-f49.google.com with SMTP id s21so9457640ejd.2
 for <dri-devel@lists.freedesktop.org>; Thu, 21 May 2020 08:55:43 -0700 (PDT)
X-Gm-Message-State: AOAM5303annOwfZ5cpEv9hgkqGBW1FXsYX8hfYmAQW8G15Mre+/h0zBp
 XwEXfDFy7hVHd8gebvvmRASHC3pQxSxVk74vRw==
X-Google-Smtp-Source: ABdhPJxRIuX15IPjbuCXCvearEzPPxB5aYhyYlLzyIzznR7ehqGz824vvlNt2bKNL1jahLDGjQPuOJJq0988E4Wy8Qo=
X-Received: by 2002:a17:906:ce36:: with SMTP id
 sd22mr4100770ejb.94.1590076542259; 
 Thu, 21 May 2020 08:55:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAAOTY_8tz9nNbCHFJhk9xX8fm9Jd8ETcdNCQfE31AOjZLpNKog@mail.gmail.com>
 <CAPM=9txm_fdy_+Kg=cdXe5SosbYBoXHtsDWYMFm2WQh1QtC_YQ@mail.gmail.com>
 <CAPM=9tzqQ5G82mSACX5speUF2j-8vz7SrOcj7XLsKCjhe3GT6A@mail.gmail.com>
In-Reply-To: <CAPM=9tzqQ5G82mSACX5speUF2j-8vz7SrOcj7XLsKCjhe3GT6A@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 21 May 2020 23:55:31 +0800
X-Gmail-Original-Message-ID: <CAAOTY__9bnTkQd5VFemrK3bVDMzf6AttssuZgXecO+_t9MMmaA@mail.gmail.com>
Message-ID: <CAAOTY__9bnTkQd5VFemrK3bVDMzf6AttssuZgXecO+_t9MMmaA@mail.gmail.com>
Subject: Re: [GIT PULL v2] mediatek drm next for 5.8
To: Dave Airlie <airlied@gmail.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>,
 David Airlie <airlied@linux.ie>, Bernard Zhao <bernard@vivo.com>,
 YueHaibing <yuehaibing@huawei.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Anand K Mistry <amistry@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIERhdmU6CgpEYXZlIEFpcmxpZSA8YWlybGllZEBnbWFpbC5jb20+IOaWvCAyMDIw5bm0Neac
iDIw5pelIOmAseS4iSDkuIvljYgxOjQ35a+r6YGT77yaCj4KPiBPbiBXZWQsIDIwIE1heSAyMDIw
IGF0IDE1OjQ0LCBEYXZlIEFpcmxpZSA8YWlybGllZEBnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+
IE9uIE1vbiwgMTggTWF5IDIwMjAgYXQgMTA6MDYsIENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5o
dUBrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4KPiA+ID4gSGksIERhdmUgJiBEYW5pZWw6Cj4gPiA+
Cj4gPiA+IFRoaXMgaW5jbHVkZSBkcGkgcGluIG1vZGUgc3dhcCwgY29uZmlnIG1pcGlfdHggY3Vy
cmVudCBhbmQgaW1wZWRhbmNlLAo+ID4gPiBhbmQgc29tZSBmaXh1cC4gSSBkcm9wIGRybV9icmlk
Z2UgcGF0Y2hlcyBpbiB0aGlzIHZlcnNpb24uCj4gPiA+Cj4gPiA+IFRoZSBmb2xsb3dpbmcgY2hh
bmdlcyBzaW5jZSBjb21taXQgOGYzZDlmMzU0Mjg2NzQ1Yzc1MTM3NGY1ZjFmY2FmZWU2YjNmMzEz
NjoKPiA+ID4gICBMaW51eCA1LjctcmMxICgyMDIwLTA0LTEyIDEyOjM1OjU1IC0wNzAwKQo+ID4g
PiBhcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKPiA+ID4gICBodHRwczov
L2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9jaHVua3VhbmcuaHUvbGlu
dXguZ2l0Cj4gPiA+IHRhZ3MvbWVkaWF0ZWstZHJtLW5leHQtNS44Cj4gPiA+IGZvciB5b3UgdG8g
ZmV0Y2ggY2hhbmdlcyB1cCB0byAwMDdkMjc0YTAxN2JiNGUyZWY3YjkyMmMyZjU0ZjQwY2YyMDcz
NjY0Ogo+ID4KPiA+IERpZCB5b3UgZWRpdCB0aGlzIGJ5IGhhbmQgb3IgcGFzcyBpdCB0aHJvdWdo
IHNvbWUgbWFpbHNlcnZlciB0aGF0Cj4gPiBjaGV3ZWQgaXQgdXAsIEkgaGFkIHRvIHJlY29uc3Ry
dWN0IHRoaXMgcHVsbCBmcm9tIHRoZSBhYm92ZSBiaXRzLCBJJ3ZlCj4gPiBubyBpZGVhIHdoeSBp
dCdzIHNvIG1lc3NlZCB1cCBpbiB0aGUgZmlyc3QgcGxhY2UuCj4KPiBhbmQgd2h5IGRvZXMgaXQg
Y29udGFpbiBhbiB1bmV4cGxhaW5lZCBiYWNrbWVyZ2U/Cj4KPiAgTWVyZ2UgdGFnICd2NS43LW5l
eHQtZHJtLXN0YWJsZScgb2YKPiBzc2g6Ly9naXRvbGl0ZS5rZXJuZWwub3JnL3B1Yi9zY20vbGlu
dXgva2VybmVsL2dpdC9tYXR0aGlhcy5iZ2cvbGludXgKPiBpbnRvIG1lZGlhdGVrLWRybS1uZXh0
Cj4KPiBQbGVhc2UgZG9uJ3QgZXZlciBiYWNrbWVyZ2UgZml4ZXMgaW50byBuZXh0IHB1bGwsIHdp
dGhvdXQgYSBsb25nCj4gZXhwbGFpbmF0aW9uIG9yIGlmIHlvdSByZWFsbHkgbmVlZCBpdCBhc2sg
dXMgZmlyc3QsCj4KPiBQbGVhc2UgcmVzZW5kIHRoaXMgYWdhaW4gY2xlYW5lZCB1cC4KCk9LLCB0
byBtYWtlIHRoaW5ncyBlYXNpZXIsIEkganVzdCByZXNlbmQgYW5kIGNsZWFuZWQgdXAuCklmIG9u
ZSBkYXkgSSBuZWVkIGEgYmFja21lcmdlIGZpeGVzLCBJIHdvdWxkIGFzayB5b3UgZmlyc3QuCgpS
ZWdhcmRzLApDaHVuLUt1YW5nLgoKPgo+IERhdmUuCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
