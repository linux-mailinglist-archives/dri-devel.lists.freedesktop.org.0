Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 005AE1A0A76
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 11:50:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C94786E808;
	Tue,  7 Apr 2020 09:50:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2A596E808;
 Tue,  7 Apr 2020 09:50:44 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id 65so3154767wrl.1;
 Tue, 07 Apr 2020 02:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=9/VJy4oCIw6mqa52rfQLTQr4ka8JAmQI+AbAZ7K7bHg=;
 b=q/3BwQ2UkQeVmrcFlrzxMwrjRcQOa8UbjgkEHjkOnigvej6bG7fUUq2FPQOnOA5aBV
 Mr9+foTJrS48hMUb3/26j1H+nzTn6n0AVBJ2ZajV1U2rCyYKET1uTuIuV7RUN2tm6RJy
 s78oXyvM8Wnn3P1deADuKOcAQMjSEDke+AD/4oTIPAWxTmvKph4LkyzqYSM5Ih+J6oyN
 K7vLRGSD7vSuJVYHLP0+IgTZxae8e3PzTEt2t+7YE+THtDLmBE0SV/IrMiOwN+Keaqty
 /6Gfn7vK2lpsJE+b1FWRaZ+MfGzp2NdVE/G5/Gq7BO3sjgYKys8geNbbhxGI38aiHBbe
 EfrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=9/VJy4oCIw6mqa52rfQLTQr4ka8JAmQI+AbAZ7K7bHg=;
 b=CJulPmt9vQPgrYjg5WbdokkyihxED3C2R86o8f6p9yBir0LAgfCxERESsFlpldUiuZ
 9lYsIwGIoXv0IL6nVgSIGVaFiwXFTghNJm9OfTZRe8lyM1pEYBheNCHbWJz700E8hMVp
 MzBIKWc0NreKEgGWpG3sD0PwufUiRKMgn4izn6Tf00hV1berB3NZgf6yQ9xESsO1IfjX
 WXxlpe6dEEpQA0xo1sxV1DetdG05OVTyYP1+9MFKxJJynynAHCnECSSMbqsUqjTTNmr5
 GnFoYkeZDfHwwhj+PAG6GHa4aNilONjxpdFClUxJ6tXVc8+F8iXfy91IIWmW+PEdbEGE
 fvng==
X-Gm-Message-State: AGi0PubvHUvur2vV5ZtzE3Uqbcu8npEa6eGVCpy/4w9CSitNGlUDd1o7
 Tnh7H3jrrsXlJxRleZF2mVHjkfWC
X-Google-Smtp-Source: APiQypIcVo/XQYFnjSVjoR3oXKvLjHQDCiTKfLmTG1/EVdmlavO2iDA33pQFNh4p75X5D7ibaqE6EA==
X-Received: by 2002:a5d:42c1:: with SMTP id t1mr1796033wrr.215.1586253043537; 
 Tue, 07 Apr 2020 02:50:43 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id i8sm32175396wrb.41.2020.04.07.02.50.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 Apr 2020 02:50:43 -0700 (PDT)
Subject: Re: [PATCH v2] drm/ttm: clean up
 ttm_trace_dma_map/ttm_trace_dma_unmap (v2)
To: Huang Rui <ray.huang@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <1586250773-31519-1-git-send-email-ray.huang@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <58129925-9bc4-25bb-6f26-69e8362b4c9e@gmail.com>
Date: Tue, 7 Apr 2020 11:50:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1586250773-31519-1-git-send-email-ray.huang@amd.com>
Content-Language: en-US
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
Reply-To: christian.koenig@amd.com
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDcuMDQuMjAgdW0gMTE6MTIgc2NocmllYiBIdWFuZyBSdWk6Cj4gdHRtX3RyYWNlX2RtYV9t
YXAvdHRtX3RyYWNlX2RtYV91bm1hcCBpcyBuZXZlciB1c2VkIGFueW1vcmUuCj4KPiB2MjogcmVt
b3ZlIHRoZSBmaWxlIGNvbXBsZXRlbHkKPgo+IFNpZ25lZC1vZmYtYnk6IEh1YW5nIFJ1aSA8cmF5
Lmh1YW5nQGFtZC5jb20+CgpSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFu
LmtvZW5pZ0BhbWQuY29tPgoKPiAtLS0KPiAgIGluY2x1ZGUvZHJtL3R0bS90dG1fZGVidWcuaCB8
IDMxIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAz
MSBkZWxldGlvbnMoLSkKPiAgIGRlbGV0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2RybS90dG0vdHRt
X2RlYnVnLmgKPgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS90dG0vdHRtX2RlYnVnLmggYi9p
bmNsdWRlL2RybS90dG0vdHRtX2RlYnVnLmgKPiBkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKPiBp
bmRleCBiNWU0NjBmLi4wMDAwMDAwCj4gLS0tIGEvaW5jbHVkZS9kcm0vdHRtL3R0bV9kZWJ1Zy5o
Cj4gKysrIC9kZXYvbnVsbAo+IEBAIC0xLDMxICswLDAgQEAKPiAtLyoqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
Cj4gLSAqCj4gLSAqIENvcHlyaWdodCAoYykgMjAxNyBBZHZhbmNlZCBNaWNybyBEZXZpY2VzLCBJ
bmMuCj4gLSAqIEFsbCBSaWdodHMgUmVzZXJ2ZWQuCj4gLSAqCj4gLSAqIFBlcm1pc3Npb24gaXMg
aGVyZWJ5IGdyYW50ZWQsIGZyZWUgb2YgY2hhcmdlLCB0byBhbnkgcGVyc29uIG9idGFpbmluZyBh
Cj4gLSAqIGNvcHkgb2YgdGhpcyBzb2Z0d2FyZSBhbmQgYXNzb2NpYXRlZCBkb2N1bWVudGF0aW9u
IGZpbGVzICh0aGUKPiAtICogIlNvZnR3YXJlIiksIHRvIGRlYWwgaW4gdGhlIFNvZnR3YXJlIHdp
dGhvdXQgcmVzdHJpY3Rpb24sIGluY2x1ZGluZwo+IC0gKiB3aXRob3V0IGxpbWl0YXRpb24gdGhl
IHJpZ2h0cyB0byB1c2UsIGNvcHksIG1vZGlmeSwgbWVyZ2UsIHB1Ymxpc2gsCj4gLSAqIGRpc3Ry
aWJ1dGUsIHN1YiBsaWNlbnNlLCBhbmQvb3Igc2VsbCBjb3BpZXMgb2YgdGhlIFNvZnR3YXJlLCBh
bmQgdG8KPiAtICogcGVybWl0IHBlcnNvbnMgdG8gd2hvbSB0aGUgU29mdHdhcmUgaXMgZnVybmlz
aGVkIHRvIGRvIHNvLCBzdWJqZWN0IHRvCj4gLSAqIHRoZSBmb2xsb3dpbmcgY29uZGl0aW9uczoK
PiAtICoKPiAtICogVGhlIGFib3ZlIGNvcHlyaWdodCBub3RpY2UgYW5kIHRoaXMgcGVybWlzc2lv
biBub3RpY2UgKGluY2x1ZGluZyB0aGUKPiAtICogbmV4dCBwYXJhZ3JhcGgpIHNoYWxsIGJlIGlu
Y2x1ZGVkIGluIGFsbCBjb3BpZXMgb3Igc3Vic3RhbnRpYWwgcG9ydGlvbnMKPiAtICogb2YgdGhl
IFNvZnR3YXJlLgo+IC0gKgo+IC0gKiBUSEUgU09GVFdBUkUgSVMgUFJPVklERUQgIkFTIElTIiwg
V0lUSE9VVCBXQVJSQU5UWSBPRiBBTlkgS0lORCwgRVhQUkVTUyBPUgo+IC0gKiBJTVBMSUVELCBJ
TkNMVURJTkcgQlVUIE5PVCBMSU1JVEVEIFRPIFRIRSBXQVJSQU5USUVTIE9GIE1FUkNIQU5UQUJJ
TElUWSwKPiAtICogRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UgQU5EIE5PTi1JTkZS
SU5HRU1FTlQuIElOIE5PIEVWRU5UIFNIQUxMCj4gLSAqIFRIRSBDT1BZUklHSFQgSE9MREVSUywg
QVVUSE9SUyBBTkQvT1IgSVRTIFNVUFBMSUVSUyBCRSBMSUFCTEUgRk9SIEFOWSBDTEFJTSwKPiAt
ICogREFNQUdFUyBPUiBPVEhFUiBMSUFCSUxJVFksIFdIRVRIRVIgSU4gQU4gQUNUSU9OIE9GIENP
TlRSQUNULCBUT1JUIE9SCj4gLSAqIE9USEVSV0lTRSwgQVJJU0lORyBGUk9NLCBPVVQgT0YgT1Ig
SU4gQ09OTkVDVElPTiBXSVRIIFRIRSBTT0ZUV0FSRSBPUiBUSEUKPiAtICogVVNFIE9SIE9USEVS
IERFQUxJTkdTIElOIFRIRSBTT0ZUV0FSRS4KPiAtICoKPiAtICoqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqLwo+
IC0vKgo+IC0gKiBBdXRob3JzOiBUb20gU3QgRGVuaXMgPHRvbS5zdGRlbmlzQGFtZC5jb20+Cj4g
LSAqLwo+IC1leHRlcm4gdm9pZCB0dG1fdHJhY2VfZG1hX21hcChzdHJ1Y3QgZGV2aWNlICpkZXYs
IHN0cnVjdCB0dG1fZG1hX3R0ICp0dCk7Cj4gLWV4dGVybiB2b2lkIHR0bV90cmFjZV9kbWFfdW5t
YXAoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgdHRtX2RtYV90dCAqdHQpOwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
