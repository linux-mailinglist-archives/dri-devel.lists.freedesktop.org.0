Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E77B71FA389
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jun 2020 00:30:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE1076E52E;
	Mon, 15 Jun 2020 22:30:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa41.google.com (mail-vk1-xa41.google.com
 [IPv6:2607:f8b0:4864:20::a41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3F966E52E
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 22:30:10 +0000 (UTC)
Received: by mail-vk1-xa41.google.com with SMTP id u15so4331614vkk.6
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 15:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rpEvl9+AZzZHXUNhYOtOBN1Cia0euR/+OQQwMFjqbXo=;
 b=EZrWU9avSmTrOwBXllhDDMODBVzH65l8k5aNUhbaqaWoKi47mpiTGyycaJKbRHhiMk
 JjyGTxJ9j1gybEjiOi5FMcA67moDtX5wzTchiQcT4QMnOz2NRLTS2qNpdj1NyX0YFu2a
 c7421yxvBXpnB/5b4C9dcUMLia0gSZINQtSz9wvYFXMnhQy3+a/WT/HDbF6G0Dqnsbpd
 r8+/i1JEnSUpQjP/Mx7scH0soh3FYqcJ01A1gV+t799kpHAP62FsK3zMhXF4GIAVW7Rv
 uO1hfODdOQ8/lnT/wIWEa/P/OFjQItWwx0BKWAbSnTXZtRFUi1fhmZMr2ATB7cLDi4fO
 iMJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rpEvl9+AZzZHXUNhYOtOBN1Cia0euR/+OQQwMFjqbXo=;
 b=d5wOd5dMqkNpUJTdROPmPQcol+IhBSlf7D+JbL/SQxsjR7QPKqd1/720yLNMTBhaVV
 9R3ETXgHXGm5IHky1r5KRU3xcY/jay2F/ZGvx5mUtjMhysC4VNB9qraqUt8dVr7n7lcE
 NedyXxwD1N2ZPIu8tG1jvc+d/zDpOL/PEmHMZtHRoUMo3+m0I7nnPtF5nQcgZLBJriAo
 6liJ3jy+zZ40WzFoDWtyvk+w8xggQNBrT94gptEvc70wkMOfLeDPfGbz8TV84ArFwNAX
 wMFW7zBkqbl+9jxWtcNFrYeQ7XO53fOFS9qNtOF5K6+Sxzqqe5WSyZBmCz78F7d9uAOQ
 1T4Q==
X-Gm-Message-State: AOAM531G+gEh3c7xd9edvEpcEHWS9+UyW49xVw1C/BRFVaRRjnduUEJQ
 Hy6zSO8Bsf2hXpHJWACv3XOwW0rMvg/iziwJs8A=
X-Google-Smtp-Source: ABdhPJwlZ736CSyVAz5cSN0v84AJqRxTSjDwcbeB0kNdNx5+26a5GPHmih8UIPJ4PlSyNQ7QirNClwKcrpKoDwxYJGo=
X-Received: by 2002:a1f:9445:: with SMTP id w66mr11075500vkd.22.1592260209977; 
 Mon, 15 Jun 2020 15:30:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200614200121.14147-1-digetx@gmail.com>
In-Reply-To: <20200614200121.14147-1-digetx@gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 15 Jun 2020 23:26:29 +0100
Message-ID: <CACvgo51QuXMgWhFk4C=3rGvUZDX1_W0RZtVb5RtRPiHTpMebWQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] 180 degrees rotation support for NVIDIA Tegra DRM
To: Dmitry Osipenko <digetx@gmail.com>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Derek Basehore <dbasehore@chromium.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-tegra@vger.kernel.org,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRG1pdHJ5LAoKT24gTW9uLCAxNSBKdW4gMjAyMCBhdCAwODoyOCwgRG1pdHJ5IE9zaXBlbmtv
IDxkaWdldHhAZ21haWwuY29tPiB3cm90ZToKPgo+IEhlbGxvIQo+Cj4gVGhpcyBzZXJpZXMgYWRk
cyAxODDCsCBkaXNwbGF5IHBsYW5lIHJvdGF0aW9uIHN1cHBvcnQgdG8gdGhlIE5WSURJQSBUZWdy
YQo+IERSTSBkcml2ZXIgd2hpY2ggaXMgbmVlZGVkIGZvciBkZXZpY2VzIHRoYXQgaGF2ZSBkaXNw
bGF5IHBhbmVsIHBoeXNpY2FsbHkKPiBtb3VudGVkIHVwc2lkZS1kb3duLCBsaWtlIE5leHVzIDcg
dGFibGV0IGRldmljZSBmb3IgZXhhbXBsZSBbMV0uIFNpbmNlCj4gRFJNIHBhbmVsIHJvdGF0aW9u
IGlzIGEgbmV3IHRoaW5nIGZvciBhIHVzZXJzcGFjZSwgY3VycmVudGx5IG9ubHkKPiBPcGVudGVn
cmEgWG9yZyBkcml2ZXIgaGFuZGxlcyB0aGUgcm90YXRlZCBkaXNwbGF5IHBhbmVsIFsyXSwgYnV0
IHRoaXMKPiBpcyBnb29kIGVub3VnaCBmb3IgdGhlIHN0YXJ0Lgo+Cj4gTm90ZSB0aGF0IGxhdGVy
IG9uIGl0IHNob3VsZCBiZSBwb3NzaWJsZSB0byBpbXBsZW1lbnQgYSB0cmFuc3BhcmVudCAxODDC
sAo+IGRpc3BsYXkgcm90YXRpb24gZm9yIFRlZ3JhIERSTSBkcml2ZXIgd2hpY2ggd2lsbCByZW1v
dmUgdGhlIG5lZWQgdG8gaGF2ZQo+IGEgYmxlZWRpbmcgZWRnZSB1c2Vyc3BhY2UgdGhhdCBrbm93
cyBob3cgdG8gcm90YXRlIGRpc3BsYXkgcGxhbmVzIGFuZCBJJ20KPiBzbG93bHkgd29ya2luZyBv
biBpdC4gRm9yIHRoZSBzdGFydGVyIHdlIGNhbiBnbyB3aXRoIHRoZSBtaW5pbWFsIHJvdGF0aW9u
Cj4gc3VwcG9ydCwgc28gaXQncyBub3QgYSBibG9ja2VyLgo+Cj4gVGhpcyBzZXJpZXMgaXMgYmFz
ZWQgb24gdGhlIHdvcmsgdGhhdCB3YXMgbWFkZSBieSBEZXJlayBCYXNlaG9yZSBmb3IgdGhlCj4g
TWVkaWF0ZWsgZHJpdmVyIFszXSwgaGlzIHBhdGNoIGlzIGluY2x1ZGVkIGludG8gdGhpcyBwYXRj
aHNldC4gSSBhZGRlZAo+IG15IHRlc3RlZC1ieSB0YWcgdG8gdGhlIERlcmVrJ3MgcGF0Y2guCj4K
PiBQbGVhc2UgcmV2aWV3IGFuZCBhcHBseSwgdGhhbmtzIGluIGFkdmFuY2UhCj4KPiBbMV0gaHR0
cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2xpbnV4LXRlZ3JhL3BhdGNoLzIwMjAw
NjA3MTU0MzI3LjE4NTg5LTMtZGlnZXR4QGdtYWlsLmNvbS8KPiBbMl0gaHR0cHM6Ly9naXRodWIu
Y29tL2dyYXRlLWRyaXZlci94Zjg2LXZpZGVvLW9wZW50ZWdyYS9jb21taXQvMjhlYjIwYTM5NTli
YmU1YmMzYTNiNjdlNTU5NzcwOTNmZDUxMTRjYQo+IFszXSBodHRwczovL2xrbWwub3JnL2xrbWwv
MjAyMC8zLzUvMTExOQo+Cj4gQ2hhbmdlbG9nOgo+Cj4gdjI6IC0gRHJvcHBlZCAiZHJtL3BhbmVs
OiBTZXQgZGlzcGxheSBpbmZvIGluIHBhbmVsIGF0dGFjaCIgcGF0Y2gsIHdoaWNoCj4gICAgICAg
dHVybmVkIG91dCB0byBiZSBvYnNvbGV0ZSBub3cuCj4KPiAgICAgLSBSZW5hbWVkIHRoZSBjb3Zl
ci1sYXR0ZXIsIGhvcGVmdWxseSB0aGlzIHdpbGwgZml4IHRoZSBib3VuY2luZyBlbWFpbHMuCj4K
PiBEZXJlayBCYXNlaG9yZSAoMSk6Cj4gICBkcm0vcGFuZWw6IEFkZCBoZWxwZXIgZm9yIHJlYWRp
bmcgRFQgcm90YXRpb24KPgo+IERtaXRyeSBPc2lwZW5rbyAoNCk6Cj4gICBkcm0vcGFuZWw6IGx2
ZHM6IFNldCB1cCBwYW5lbCBvcmllbnRhdGlvbgoKSU1ITyBpdCdzIHBlcmZlY3RseSByZWFzb25h
YmxlIHRvIHJlcG9ydCB0aGUgcGFuZWwgb3JpZW50YXRpb24gdG8KdXNlcnNwYWNlLCB3aGljaCBj
YW4gYXBwbHkgcGxhbmUgcm90YXRpb24gYXMgbmVlZGVkLgoKQWx0aG91Z2ggSSBzZWUgdGhhdCB0
aGlzIHNlcmllcywgYWxpa2UgRGVyZWsncywgaGFzIGEgY291cGxlIG9mIGlzc3VlczoKIC0gb25s
eSBhIHNpbmdsZSBwYW5lbCBkcml2ZXIgaXMgdXBkYXRlZAogLSByb3RhdGlvbiBpcyBfbm90XyBs
aXN0ZWQgYXMgc3VwcG9ydGVkIHByb3BlcnR5LCBpbiBzYWlkIHBhbmVsCmRyaXZlciBkZXZpY2Ut
dHJlZSBiaW5kaW5ncwoKTXkgcGVyc29uYWwgaW5jbGluYXRpb24gaXMgdGhhdCB3ZSBzaG91bGQg
YWltIGZvciBhIGNvbXByZWhlbnNpdmUgc29sdXRpb246CiAtIHdpcmUgYWxsIHBhbmVsIGRyaXZl
cnMsIGFzIGN1cnJlbnRseSBkb2N1bWVudGVkIChxdWljayBncmVwIGxpc3QgYmVsb3cpCiAtIGRv
Y3VtZW50IGFuZCB3aXJlLXVwIHRoZSBsdmRzIGFuZCBib2UgcGFuZWxzIC0gYXMgcHJvcG9zZWQg
YnkgeW91CmFuZCBEZXJlayByZXNwZWN0aXZlbHkKCkhUSApFbWlsCgpEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9oaW1heCxoeDgzNTdkLnR4dDoyCkRvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2lsaXRlayxpbGk5MjI1LnR4dDoyCkRvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2lsaXRlayxpbGk5MzQxLnR4dDoy
CkRvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2lsaXRlayxpbGk5NDg2
LnlhbWw6MgpEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tdWx0aS1p
bm5vLG1pMDI4M3F0LnR4dDoyCkRvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L3BhbmVsL3BhbmVsLWNvbW1vbi55YW1sOjIKRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvc2l0cm9uaXgsc3Q3NTg2LnR4dDoxCkRvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L3NpdHJvbml4LHN0NzczNXIueWFtbDoyCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
