Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A28051FEC19
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jun 2020 09:17:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 568A86EA9A;
	Thu, 18 Jun 2020 07:17:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F4796E93F
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 16:27:22 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id i8so1697761lfo.4
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 09:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tBdtd4BbSytzH+yn8Qia+tXk6Gs+WeAHP5EfpLtwsp8=;
 b=X9G2VFwG+kypTS6e33cyAimN3ATS28yZLc7+RSukAtDpY5QYY5eBQglww7MLPaD83h
 rIjriWkglL5vxCbr9qVzPqpgVokj4HScFR3NLVbSnJXCLhoTuTj9hjZnei3VFIo0eqdT
 LDdAFXSb1RyMLiZvwWwcKSt7m2G/hqSM8WsK1nQImL+Lgc8EdmrtI9Zvmo64XBYkLspo
 xTE3pCfFLaIOAqBCJsNxj7FNwkdMsZrASXddwxBKlVreXyld5TyYvyUtvfvplsRnZEIe
 tKAUpR/W47SCAZ205IDRQmsy0dVteCso6LPZyUvfG+rAVyFXWxHSUIjXfKdtl+GpzcdF
 gceg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tBdtd4BbSytzH+yn8Qia+tXk6Gs+WeAHP5EfpLtwsp8=;
 b=RYaQsQMEFuH4bFP1YWOQF8pGYMYpZ3q+JwQJvUatkKwnhVFaAIyH8RY/lFwBDxXIrq
 PUE64y6H1Gbp5aGS4b3IP5bjkEYc/4rQD2R2apqA0+/zdsHGO9H40xlzVZzeVFfxMlBt
 wP5mDOd/73fjGgNVWXI3QzkGbej8JkKm8VyWeADt7w/02gfEewJPFwaI+x4QeszVBRSr
 KEP5juvsnlKjd2zx4cBmM0GOiCHbNkPAZ9pJrNzZAM9U2dfBJRZ5CxggIfCDdgCT/Iwh
 DuvjwSGjNSC3tZhV3k6LfnVEondrjc/HckVMGphOfZ7AiBzB9012MIVaGL//dkkVBYqY
 zAFw==
X-Gm-Message-State: AOAM533578GPVIgOrJA+UJpsBvhBR+Ir1Vh0yJe582fJ1MhhctbdHT6Y
 f/LrmV8rrhitt6x2UOvSv+3DU4j0
X-Google-Smtp-Source: ABdhPJzdlve8SscpxQ5lGHRdQw8g0xXtnEZx4khfcDzoIbDFkaI6tCr5C/kFsj24d1QGCa4B73gq5w==
X-Received: by 2002:a19:8389:: with SMTP id f131mr4963732lfd.16.1592411240453; 
 Wed, 17 Jun 2020 09:27:20 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.googlemail.com with ESMTPSA id b25sm66852ljo.16.2020.06.17.09.27.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jun 2020 09:27:19 -0700 (PDT)
Subject: Re: [PATCH v2 0/5] 180 degrees rotation support for NVIDIA Tegra DRM
To: Daniel Stone <daniel@fooishbar.org>
References: <20200614200121.14147-1-digetx@gmail.com>
 <CACvgo51QuXMgWhFk4C=3rGvUZDX1_W0RZtVb5RtRPiHTpMebWQ@mail.gmail.com>
 <8f789ef5-bebf-c869-784d-afda70fc1fb8@gmail.com>
 <CACvgo50oSMbgXw1vHwVT4hhGe6g3YzKQEohCLJdfDq+0UaN1jw@mail.gmail.com>
 <646b3f37-0f72-7f3b-388f-f71dbcdd5c84@gmail.com>
 <CACvgo50BFH5qsPyWx9a1aZ4k5bzjSN-3KTU0BvnZ-nG-hfzKOQ@mail.gmail.com>
 <fe845434-cbf6-29d4-eeb6-8868d628fd04@gmail.com>
 <CAPj87rPwwHWtYpuZfiTMyELvr3D+UAY8CVnH3v6+Lo1-UMRRVA@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <36496bd6-b18a-de97-1afb-f2f8aeb3feaf@gmail.com>
Date: Wed, 17 Jun 2020 19:27:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAPj87rPwwHWtYpuZfiTMyELvr3D+UAY8CVnH3v6+Lo1-UMRRVA@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 18 Jun 2020 07:17:31 +0000
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
Cc: Sean Paul <sean@poorly.run>, Derek Basehore <dbasehore@chromium.org>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-tegra@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTcuMDYuMjAyMCAxMjozNCwgRGFuaWVsIFN0b25lINC/0LjRiNC10YI6Cj4gSGksCj4gCj4gT24g
VHVlLCAxNiBKdW4gMjAyMCBhdCAyMjoxNiwgRG1pdHJ5IE9zaXBlbmtvIDxkaWdldHhAZ21haWwu
Y29tPiB3cm90ZToKPj4gVGhlIHBhbmVsJ3Mgb3JpZW50YXRpb24gY291bGQgYmUgcGFyc2VkIGJ5
IGFueSBwYW5lbCBkcml2ZXIgYW5kIHRoZW4KPj4gYXNzaWduZWQgYXMgdGhlIGNvbm5lY3Rvcidz
IHByb3BlcnR5IGluIG9yZGVyIHRvIGFsbG93IHVzZXJzcGFjZS9GQi1jb3JlCj4+IHRvIGRlY2lk
ZSB3aGF0IHRvIGRvIHdpdGggdGhlIHJvdGF0ZWQgZGlzcGxheS4gQXBwYXJlbnRseSB1cHN0cmVh
bQo+PiBrZXJuZWwgc3VwcG9ydHMgb25seSB0aGF0IG9uZSBTYW1zdW5nIGRldmljZSB3aGljaCBo
YXMgZGlzcGxheSBwYW5lbAo+PiBtb3VudGVkIHVwc2lkZS1kb3duIGFuZCBpdCBhbHJlYWR5IHVz
ZXMgdGhlIGN1c3RvbSBEVCBwcm9wZXJ0aWVzIGZvcgo+PiBhY2hpZXZpbmcgdGhlIDE4MCByb3Rh
dGlvbi4gU28gSSBkb24ndCBxdWl0ZSBzZWUgYW55IHBhbmVsIGRyaXZlcnMgdGhhdAo+PiBpbnN0
YW50bHkgY291bGQgYmVuZWZpdCBmcm9tIHVzaW5nIHRoZSByb3RhdGlvbiBwcm9wZXJ0eS4gUGVy
aGFwcyBJIGNhbgo+PiBhZGQgdGhlIG9yaWVudGF0aW9uIHN1cHBvcnQgdG8gdGhlIHBhbmVsLXNp
bXBsZSBkcml2ZXIsIGJ1dCB3aWxsIGl0IGJlCj4+IHVzZWZ1bCB0byBhbnlvbmU/Cj4gCj4gWWVz
LCBleHBvc2luZyBpdCB0byB1c2Vyc3BhY2UgaXMgaGVscGZ1bCwgc2luY2UgV2VzdG9uIGF0IGxl
YXN0IHdpbGwKPiBwYXJzZSB0aGUgcHJvcGVydHkgYW5kIHRoZW4gYXBwbHkgdGhlIGNvcnJlY3Qg
dHJhbnNmb3JtOgo+IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy93YXlsYW5kL3dlc3Rv
bi8tL21lcmdlX3JlcXVlc3RzLzMxNQoKSGVsbG8gRGFuaWVsLAoKVGhhbmsgeW91IHZlcnkgbXVj
aCBmb3IgdGhlIHBvaW50ZXIhIEkgbWlzc2VkIHRoYXQgV2VzdG9uIG5vdyB1c2VzIHRoZQpwYW5l
bCdzIG9yaWVudGF0aW9uLiBJIGdhdmUgYSBxdWljayB0ZXN0IHRvIHRoZSByZWNlbnQgV2VzdG9u
IGFuZCBpbmRlZWQKaXQgYXBwbGllcyB0aGUgdHJhbnNmb3JtIGluIGFjY29yZGFuY2UgdG8gdGhl
IGNvbm5lY3RvcidzIG9yaWVudGF0aW9uCnByb3BlcnR5LgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
