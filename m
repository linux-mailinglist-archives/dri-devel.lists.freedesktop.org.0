Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 979C11A93F9
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 09:18:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E94536E850;
	Wed, 15 Apr 2020 07:17:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89BC36E595
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 21:32:37 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id g12so8273403wmh.3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 14:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=t5m6M/9+YygcM4K7PMvy/NZ60v8zZsa/xnL9yo9yJ58=;
 b=knESGuyCdcFB6IUeVZwlSQm41whW6aRwkz9x3XwRta1pWEb7kfXl/lvTozWwGiuU6T
 1MhfiKqa/oQbI3l6kemBpiXLxH0sStZE33CVj4sipZgBzYWxUn5nEcr5D6FB/wsFHZCG
 /aRwXhQDUqkj8xgtPXr32A0rxW2nXCL4GJFDo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=t5m6M/9+YygcM4K7PMvy/NZ60v8zZsa/xnL9yo9yJ58=;
 b=dHwtMTwawOMLaojS2zeTzNHCbanxlxmx9YxBvP9FhDj5ZI/ANdX+oPfSZ7soqhqeBn
 +Q+vp0RkNansPdMeDzqdOpIeanfa8YSn15e6axyzKeLqMuezKi0u2JQ+Hr8iRCrHfUxF
 U1CQbmGM+wMqLZdK1KLO6ovBY7fBQrwHmm5BsfV1C3uTFV3q8PoLnAps3CHsDcaZsEC2
 pqcmxx+xJozd5nqOcr/qzrh8MANl7qrXs4d0/CSztEcuCrrYzywWXiJ4VFueS+GSXrnk
 MlRVKchVI4Y/aIu/KwT7ErcDL4FA6DJKXYS1ysF5noBNtBEZeTubhz1hkiYcCVPx12FQ
 n5QA==
X-Gm-Message-State: AGi0PuY7ldSCoQWvJYDSKa26pOdbZXQGVZe3VhrsYwB0Fd07mAkJliRj
 qTTiJRutEgfsJc3KgbFtc2hJX6RF5wVa6ry5VNBNGA==
X-Google-Smtp-Source: APiQypI9rjKKB0RYbteCLC4VAV7bY9ZO0QuxCkN6ifXQN4cR85Hq47ciMy/omqQRLYy5BvobGQ/H/gfFhjGxNKYju/g=
X-Received: by 2002:a1c:f205:: with SMTP id s5mr1771238wmc.101.1586899955742; 
 Tue, 14 Apr 2020 14:32:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200306002112.255361-1-dbasehore@chromium.org>
 <ecbfb5f8-615a-4a88-5dac-de17158125bf@gmail.com>
 <CAGAzgsqpjZxh7PEL_Dy7HrFeFGm7+=F6cL3QG9KmK9CHvDWZ9g@mail.gmail.com>
 <6dc9ef16-9671-6ce8-27e6-aa1f4c009ee2@gmail.com>
In-Reply-To: <6dc9ef16-9671-6ce8-27e6-aa1f4c009ee2@gmail.com>
From: "dbasehore ." <dbasehore@chromium.org>
Date: Tue, 14 Apr 2020 14:32:24 -0700
Message-ID: <CAGAzgsrNrq+S+-5KEFVnJn6S5DRn1fKkToD5=KR911T9AOAF-w@mail.gmail.com>
Subject: Re: [PATCH v10 0/2] Panel rotation patches
To: Dmitry Osipenko <digetx@gmail.com>
X-Mailman-Approved-At: Wed, 15 Apr 2020 07:17:53 +0000
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
Cc: David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBcHIgMTQsIDIwMjAgYXQgMjoxOCBQTSBEbWl0cnkgT3NpcGVua28gPGRpZ2V0eEBn
bWFpbC5jb20+IHdyb3RlOgo+Cj4gMTQuMDQuMjAyMCAyMjozMiwgZGJhc2Vob3JlIC4g0L/QuNGI
0LXRgjoKPiA+IEhpIERtaXRyeSwgc29ycnkgZm9yIHRoZSBsYXRlIHJlcGx5Lgo+ID4KPiA+IE9u
IFN1biwgTWFyIDgsIDIwMjAgYXQgMTI6MjUgUE0gRG1pdHJ5IE9zaXBlbmtvIDxkaWdldHhAZ21h
aWwuY29tPiB3cm90ZToKPiA+Pgo+ID4+IDA2LjAzLjIwMjAgMDM6MjEsIERlcmVrIEJhc2Vob3Jl
INC/0LjRiNC10YI6Cj4gPj4+IFRoaXMgYWRkcyB0aGUgcGx1bWJpbmcgZm9yIHJlYWRpbmcgcGFu
ZWwgcm90YXRpb24gZnJvbSB0aGUgZGV2aWNldHJlZQo+ID4+PiBhbmQgc2V0cyB1cCBhZGRpbmcg
YSBwYW5lbCBwcm9wZXJ0eSBmb3IgdGhlIHBhbmVsIG9yaWVudGF0aW9uIG9uCj4gPj4+IE1lZGlh
dGVrIFNvQ3Mgd2hlbiBhIHJvdGF0aW9uIGlzIHByZXNlbnQuCj4gPj4KPiA+PiBIZWxsbyBEZXJl
ayBhbmQgZXZlcnlvbmUsCj4gPj4KPiA+PiBJJ20gbG9va2luZyBhdCBhZGRpbmcgZGlzcGxheSBy
b3RhdGlvbiBzdXBwb3J0IHRvIE5WSURJQSBUZWdyYSBEUk0KPiA+PiBkcml2ZXIgYmVjYXVzZSBz
b21lIGRldmljZXMgaGF2ZSBkaXNwbGF5IHBhbmVsIHBoeXNpY2FsbHkgbW91bnRlZAo+ID4+IHVw
c2lkZS1kb3duLCBhbmQgdGh1cywgZGlzcGxheSBjb250cm9sbGVyJ3Mgc2Nhbi1vdXQgbmVlZHMg
dG8gYmUgcm90YXRlZAo+ID4+IGJ5IDE4MMKwIGluIHRoaXMgY2FzZS4KPiA+Pgo+ID4+IERlcmVr
LCB5b3VycyBwYW5lbC1yb3RhdGlvbiBwYXRjaGVzIGFkZCBzdXBwb3J0IGZvciBhc3NpZ25pbmcg
cGFuZWwncwo+ID4+IG9yaWVudGF0aW9uIHRvIHRoZSBjb25uZWN0b3IsIGJ1dCB0aGVuIG9ubHkg
cHJpbWFyeSBkaXNwbGF5IHBsYW5lCj4gPj4gcmVjZWl2ZXMgcm90YXRpb24gdmFsdWUgaW4gWzFd
LCB3aGlsZSByb3RhdGlvbiBuZWVkcyB0byBiZSBhcHBsaWVkIHRvCj4gPj4gYWxsIGF2YWlsYWJs
ZSBvdmVybGF5L2N1cnNvciBwbGFuZXMgYW5kIHRoaXMgc2hvdWxkIGhhcHBlbiBpbiBvdGhlcgo+
ID4+IHBsYWNlcyB0aGFuIFsxXSBhcyB3ZWxsLgo+ID4KPiA+IFRoaXMgaXMgaW50ZW5kZWQuIFdl
IGRvbid0IGNvcnJlY3QgdGhlIG91dHB1dCBpbiB0aGUga2VybmVsLiBXZQo+ID4gaW5zdGVhZCBy
ZWx5IG9uIG5vdGlmeWluZyB1c2Vyc3BhY2UgdGhhdCB0aGUgcGFuZWwgaXMgcm90YXRlZCwgdGhl
biB3ZQo+ID4gaGFuZGxlIGl0IHRoZXJlLgo+ID4KPiA+Pgo+ID4+IFsxXSBkcm1fY2xpZW50X21v
ZGVzZXRfY29tbWl0X2F0b21pYygpCj4gPj4KPiA+PiBQbGVhc2UgYWxzbyBub3RlIHRoYXQgaW4g
YSBjYXNlIG9mIHRoZSBzY2FuLW91dCByb3RhdGlvbiwgcGxhbmUncwo+ID4+IGNvb3JkaW5hdGVz
IG5lZWQgdG8gYmUgY2hhbmdlZCBpbiBhY2NvcmRhbmNlIHRvIHRoZSBkaXNwbGF5J3Mgcm90YXRp
b24uCj4gPj4KPiA+PiBJIGxvb2tlZCBicmllZmx5IHRocm91Z2ggdGhlIERSTSBjb2RlIGFuZCBt
eSB1bmRlcnN0YW5kaW5nIHRoYXQgdGhlIERSTQo+ID4+IGNvcmUgY3VycmVudGx5IGRvZXNuJ3Qg
c3VwcG9ydCB1c2UtY2FzZSB3aGVyZSBzY2FuLW91dCBuZWVkcyB0byByb3RhdGVkCj4gPj4gYmFz
ZWQgb24gYSBwYW5lbCdzIG9yaWVudGF0aW9uLCBjb3JyZWN0PyBJcyBpdCB0aGUgdXNlLWNhc2Ug
eW91J3JlCj4gPj4gd29ya2luZyBvbiBmb3IgdGhlIE1lZGlhdGVrIGRyaXZlcj8KPiA+Cj4gPiBZ
ZXMsIHdlIHJlbHkgb24gdXNlcnNwYWNlIHRvIHJvdGF0ZSB0aGUgb3V0cHV0LiBUaGUgbWFqb3Ig
cmVhc29uIGZvcgo+ID4gdGhpcyBpcyBiZWNhdXNlIHRoZXJlIG1heSBub3QgYmUgYSAiZnJlZSIg
aGFyZHdhcmUgcm90YXRpb24gdGhhdCBjYW4KPiA+IGJlIGFwcGxpZWQgdG8gdGhlIG92ZXJsYXku
IFNlYW4gUGF1bCBhbmQgb3RoZXJzIGFsc28gcHJlZmVycmVkIHRoYXQKPiA+IHVzZXJzcGFjZSBj
b250cm9sIHdoYXQgaXMgb3V0cHV0IHRvIHRoZSBzY3JlZW4gaW5zdGVhZCBvZiB0aGUga2VybmVs
Cj4gPiB0YWtpbmcgY2FyZSBvZiBpdC4gVGhpcyBjb2RlIGp1c3QgYWRkcyB0aGUgZHJtIHByb3Bl
cnR5IHRvIHRoZSBwYW5lbC4KPiA+Cj4KPiBDb3VsZCB5b3UgcGxlYXNlIGV4cGxhaW4gd2hhdCB0
aGF0IHVzZXJzcGFjZSBpcz8KClRoaXMgd2FzIGFkZGVkIGZvciBDaHJvbWUgT1MsIHdoaWNoIHVz
ZXMgaXRzIG93biBncmFwaGljcyBzdGFjaywKT3pvbmUsIGluc3RlYWQgb2YgWG9yZy4KCj4KPiBB
RkFJSywgdGhpbmdzIGxpa2UgWG9yZyBtb2Rlc2V0dGluZyBkb24ndCBzdXBwb3J0IHRoYXQgb3Jp
ZW50YXRpb24gcHJvcGVydHkuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
