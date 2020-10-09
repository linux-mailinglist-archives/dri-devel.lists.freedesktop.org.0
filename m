Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE25D288D45
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 17:48:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50EA26ECFB;
	Fri,  9 Oct 2020 15:48:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B88116ECFB
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 15:48:19 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id l15so9247634wmh.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Oct 2020 08:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SiUqWjeMSV8Q6JIps2SGwGtv8+TmVeri6fe3aZqTkSQ=;
 b=ZlVheQfJYpXZ8sZy+mkXKAnBXWlfF9fm1T6XJgcay0MBm5lyaye94halCuO3U0//2e
 oUC+LdZcni5dwcdloL1MkM3I15qN73SzqiGGb6FU5W3n00dHB/2HUXA0YVmu0FGbKOuz
 Zs6qceD0MFfNu/e+RdMwzbbvKuOJYZPyVl2NGhUcGmNyALMkkoenS6ER2O2ulXzz9GIT
 i2e3HPotO3KXYwO9tri+QuBH0c7hnFU/xRHQN4XtLIlXY9l3SVuMCdDTIjFHgeagOn97
 78SYM60qFsKsR9lap4ctFf12oEuEu2NueMrgvTJCl4UHiuFmnSGj8B0sgRk8EM2yfiH1
 aQ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SiUqWjeMSV8Q6JIps2SGwGtv8+TmVeri6fe3aZqTkSQ=;
 b=HtdFltT+wmWEsqFTD1B29U1uVPK7xNZ885VXFqnFBqw3b7SQO6SjGl3BYI1LSKrUTa
 p0LXEX6VdoH/paHi6XmfYzmTkx/SU/N5neSoyR52+/BvMsz3ciVIHvKIdyCX2NRLwnSc
 X2VTdjk9Vo3E0AnOeupN7OvBvEJ5VeI9nCvJLitkSGR8ayAvmsv2J21pEnGmLqGj44rN
 /yX5wnt9sfy8y4Oi4WLsSkd8zWcKs9DqsNR4xQuewGAJRrlE6CHQ6vgWK0CqSgEyhPCu
 R/BmYpUYPM6i62VbX6MUcSI2svpV+oMD5Toi8mlyznZmMuGq3nmSqSHsMTFoxyyf8NNj
 RrVQ==
X-Gm-Message-State: AOAM530pRb2WI14nkKoALeluRF4m8wRpubH78SSzQ7v2ArjYxTQJYWTX
 7B6Mdj9uaT02jiA9sne+W24eW5B6e+W7uYDixBU=
X-Google-Smtp-Source: ABdhPJy4U1ybkA28ISg7XfCTvAJr4ErfGsgv8D6vM3Z+O2v2FC26boIhBxCCGl5Aw6VMCEIeRmtEJFBRrLM+WzSkd2U=
X-Received: by 2002:a7b:c7d5:: with SMTP id z21mr10600296wmk.73.1602258498332; 
 Fri, 09 Oct 2020 08:48:18 -0700 (PDT)
MIME-Version: 1.0
References: <20201008181606.460499-1-sandy.8925@gmail.com>
 <c11f3758-9b41-412a-85b1-258d47c776c6@suse.de>
 <7227878e-28f7-a008-4bd5-fa7f64d371da@suse.de>
 <24ac81e5-d163-0fb6-2d94-1da7c1a87974@gmail.com>
 <e4e69435-baf6-265d-6a17-d624ee6e2300@suse.de>
In-Reply-To: <e4e69435-baf6-265d-6a17-d624ee6e2300@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 9 Oct 2020 11:48:07 -0400
Message-ID: <CADnq5_PRx-DOyNWQmLeOEQuDVuvMmYP81MHZZ7FZWTbaQGSHuA@mail.gmail.com>
Subject: Re:
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 Sandeep Raghuraman <sandy.8925@gmail.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgOSwgMjAyMCBhdCAzOjUxIEFNIFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVy
bWFubkBzdXNlLmRlPiB3cm90ZToKPgo+IEhpCj4KPiBBbSAwOS4xMC4yMCB1bSAwOTozOCBzY2hy
aWViIFNhbmRlZXAgUmFnaHVyYW1hbjoKPiA+Cj4gPgo+ID4gT24gMTAvOS8yMCAxMjo0NCBQTSwg
VGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6Cj4gPj4gSGkKPiA+Pgo+ID4+IEFtIDA5LjEwLjIwIHVt
IDA4OjQ3IHNjaHJpZWIgVGhvbWFzIFppbW1lcm1hbm46Cj4gPj4+IE5BQ0sgZm9yIHRoZSBlbnRp
cmUgbGFjayBvZiBhbnkgZm9ybSBvZiBjb21taXQgZGVzY3JpcHRpb24uCj4gPj4KPiA+PiBQbGVh
c2Ugc2VlIHRoZSBkb2N1bWVudGF0aW9uIGF0IFsxXSBvbiBob3cgdG8gZGVzY3JpYmUgdGhlIGNo
YW5nZXMgYW5kCj4gPj4gZ2V0dGluZyB5b3VyIHBhdGNoZXMgbWVyZ2VkLgo+ID4KPiA+IFllcywg
SSB0cmllZCB0byB1c2UgZ2l0IHNlbmQtZW1haWwgdG8gc2VuZCBwYXRjaGVzIHRoaXMgdGltZSwg
YW5kIGl0IHJlc3VsdGVkIGluIHRoaXMgZGlzYXN0ZXIuIEknbGwgc3RpY2sgdG8gc2VuZGluZyB0
aGVtIHRocm91Z2ggVGh1bmRlcmJpcmQuCj4KPiBXaGF0J3MgdGhlIHByb2JsZW0gd2l0aCBzZW5k
LWVtYWlsPwo+Cj4gQSB0eXBpY2FsIGNhbGwgZm9yIHlvdXIgcGF0Y2hzZXQgd291bGQgbG9vayBs
aWtlCj4KPiAgIGdpdCBzZW5kLW1haWwgPHVwc3RyZWFtLWJyYW5jaD4uLi5IRUFEIC0tY292ZXIt
bGV0dGVyIC0tYW5ub3RhdGUKPiAtLXRvPS4uLiAtLWNjPS4uLgo+Cj4gVGhhdCBhbGxvd3MgeW91
IHRvIHdyaXRlIHRoZSBjb3ZlciBsZXR0ZXIgYW5kIGhhdmUgaXQgc2VudCBvdXQuIElJUkMgeW91
Cj4gbmVlZCBvdCBzZXQgJEVESVRPUiB0byB5b3VyIGZhdm9yaXRlIHRleHQgZWRpdG9yOyBhbmQg
Y29uZmlndXJlIHRoZSBTTVRQCj4gc2VydmVyIGluIH4vLmdpdGNvbmZpZywgdW5kZXIgW3NlbmRl
bWFpbF0uCj4KCllvdSBjYW4gYWxzbyBkbyBgZ2l0IGZvcm1hdC1wYXRjaCAtMyAtLWNvdmVyLWxl
dHRlcmAgYW5kIG1hbnVhbGx5IGVkaXQKdGhlIGNvdmVybGV0dGVyIGFzIG5lZWRlZCB0aGVuIHNl
bmQgdGhlbSB3aXRoIGdpdCBzZW5kLWVtYWlsLgoKQWxleAoKPiBCZXN0IHJlZ2FyZHMKPiBUaG9t
YXMKPgo+ID4KPiA+Pgo+ID4+IEJlc3QgcmVnYXJkcwo+ID4+IFRob21hcwo+ID4+Cj4gPj4gWzFd
Cj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4g
ZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+ID4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zwo+ID4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwKPiA+Cj4KPiAtLQo+IFRob21hcyBaaW1tZXJtYW5uCj4gR3JhcGhpY3MgRHJpdmVyIERl
dmVsb3Blcgo+IFNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSAo+IE1heGZlbGRz
dHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQo+IChIUkIgMzY4MDksIEFHIE7DvHJuYmVy
ZykKPiBHZXNjaMOkZnRzZsO8aHJlcjogRmVsaXggSW1lbmTDtnJmZmVyCj4KPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
