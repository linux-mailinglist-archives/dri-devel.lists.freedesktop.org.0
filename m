Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD9F5E4E4
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 15:10:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05DCA6E12F;
	Wed,  3 Jul 2019 13:10:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 182346E12D;
 Wed,  3 Jul 2019 13:10:51 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id a10so1655862wrp.9;
 Wed, 03 Jul 2019 06:10:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t7OeAYvyKydJU2oWEpPL+WhenHz/DwewEBajbeZMf5Q=;
 b=fgdx7XJ+fG2mxWxtD0EJ7HsCKvWPom4x+W90XlncPSta6q/23HQ/1SaPwbftpkDgCX
 F7LppRxVDPjS2jnvyvxuvrUqhQXdbe0QEQw3eekRdw7Pi8AwtwvjRAw1LoQzp6877og+
 AFv+iVAQ2I/DT5coezg0zFXQVg4xgAFxopmejYnrr7u84QygkMLBvWuYVDFleQ43UnfH
 3DgFGLWkNoKmh+TUfTzakF6K5+H/0Djdw89Z/RAV16Tp+6aAT46b2ivABa9apfAfBw2A
 EEsATiNSIhzWvUTCJb6c8hAHrsResh8EYVreP8hZin4nMclbeSbmvPfOr69kMMEwqGNt
 mGgg==
X-Gm-Message-State: APjAAAWT2JYEDyTFRYlYWgM/oo9Yi/yTEGPPa+gxoxf8RWhMGsHBUTYp
 wfLVbIEhSaQS3Q4oj4SMaBTsNeNSRuTli4JUW0Gsa3sRo08=
X-Google-Smtp-Source: APXvYqzEQKZRIfqDVowaRJ4mMD6nsegX0QI9ZfZkk4K6BB3Z2Nfz9fgA+4XONOi/ieEe63tiMx3bZg6/yioPOJlE9Os=
X-Received: by 2002:adf:dec3:: with SMTP id i3mr17691541wrn.74.1562159449674; 
 Wed, 03 Jul 2019 06:10:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190703015705.3162-1-alexander.deucher@amd.com>
 <20190703095453.GE15868@phenom.ffwll.local>
In-Reply-To: <20190703095453.GE15868@phenom.ffwll.local>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 3 Jul 2019 09:10:37 -0400
Message-ID: <CADnq5_PC44xY9S3C+s0D4Yx9e3Wsh7TM_-yqe1auRDMWgBZ49g@mail.gmail.com>
Subject: Re: [pull] amdgpu drm-fixes-5.2
To: Daniel Vetter <daniel@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=t7OeAYvyKydJU2oWEpPL+WhenHz/DwewEBajbeZMf5Q=;
 b=a+eLuGyb98FDeFi073T4WCkZrEJEf5behg4FOyZ/5IbE0Opn5hIewMdGEDWN+tlzyK
 1i3fzQunHdrag2yMBww8p5CIyHlv+/n4ipdKPht6+ol9P7jSdWCv/6D1YoKDgQh5/Xqq
 LK7nwuSvTdpoCzdnOXKb9ukjwXW6ODb4wsGolL3X1ESdzu058nEWvDslwaBE3LjqZU8Q
 X+9ZHU7wty/R8IHyuQSm1x+yoLoGGKhRCrrBWbq3oryKP03lqVTU01XfYsxeUfWqQaTk
 meBaojIPlAlWRmpMPLuy9vFWIvrJ5Js8Kf7c2rN97xPUmgnsqRfuUPEufFaERpQ9j4IU
 CcyA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMywgMjAxOSBhdCA1OjU0IEFNIERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZnds
bC5jaD4gd3JvdGU6Cj4KPiBPbiBUdWUsIEp1bCAwMiwgMjAxOSBhdCAwODo1NzowNVBNIC0wNTAw
LCBBbGV4IERldWNoZXIgd3JvdGU6Cj4gPiBIaSBEYXZlLCBEYW5pZWwsCj4gPgo+ID4gMyBmaXhl
cyBhbGwgY2MnZWQgdG8gc3RhYmxlLiAgTm90ZSB0aGF0IGRpbSBjb21wbGFpbnMgYWJvdXQgdGhl
IEZpeGVzIHRhZwo+ID4gaW4gb25lIG9mIHRoZSBwYXRjaGVzLiAgVGhlIHBhdGNoIGhhczoKPiA+
IEZpeGVzOiA5MjE5MzVkYzY0MDQgKCJkcm0vYW1kL3Bvd2VycGxheTogZW5mb3JjZSBkaXNwbGF5
IHJlbGF0ZWQgc2V0dGluZ3Mgb25seSBvbiBuZWVkZWQiKQo+ID4gd2hpbGUgZGltIHJlY29tbWVu
ZHM6Cj4KPiBUaGlzIGlzIHRoZSByaWdodCBmb3JtYXQuCj4KPiA+IEZpeGVzOiBjb21taXQgOTIx
OTM1ZGM2NDA0ICgiZHJtL2FtZC9wb3dlcnBsYXk6IGVuZm9yY2UgZGlzcGxheSByZWxhdGVkIHNl
dHRpbmdzIG9ubHkgb24gbmVlZGVkIikKPgo+IEFkZGluZyBhICJjb21taXQiIGlzIHdyb25nLiBB
bmQgYXQgbGVhc3QgbXkgZGltIGhlcmUgZG9lc24ndCBjb21wbGFpbgo+IGFib3V0IHlvdXIgcHVs
bC4gSG93IGRpZCB5b3UgdGVzdCB0aGlzPwoKZGltIGNoZWNrcGF0Y2ggNjY1ZDZkNGUzMjMxM2E3
OTUyYmIzMzM5NjQ3Zjc0YzNhNmIwZDc4YQoKLTo4OiBFUlJPUjpHSVRfQ09NTUlUX0lEOiBQbGVh
c2UgdXNlIGdpdCBjb21taXQgZGVzY3JpcHRpb24gc3R5bGUKJ2NvbW1pdCA8MTIrIGNoYXJzIG9m
IHNoYTE+ICgiPHRpdGxlIGxpbmU+IiknIC0gaWU6ICdjb21taXQKOTIxOTM1ZGM2NDA0ICgiZHJt
L2FtZC9wb3dlcnBsYXk6IGVuZm9yY2UgZGlzcGxheSByZWxhdGVkIHNldHRpbmdzCm9ubHkgb24g
bmVlZGVkIiknCiM4Ogo5MjE5MzVkYzY0MDQgKCJkcm0vYW1kL3Bvd2VycGxheTogZW5mb3JjZSBk
aXNwbGF5IHJlbGF0ZWQgc2V0dGluZ3MKb25seSBvbiBuZWVkZWQiKQoKQWxleAoKPiAtRGFuaWVs
Cj4KPiA+IEkgZmVlbCBsaWtlIHRoZSBmb3JtZXIgaXMgdGhlIG1vcmUgY29tbW9uIG5vbWVuY2xl
dHVyZSAoYXQgbGVhc3QgaGlzdG9yaWNhbGx5KSwKPiA+IGJ1dCBJJ20gaGFwcHkgdG8gcmVzcGlu
IGlmIHlvdSdkIHByZWZlci4KPiA+Cj4gPiBUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29t
bWl0IDY2NWQ2ZDRlMzIzMTNhNzk1MmJiMzMzOTY0N2Y3NGMzYTZiMGQ3OGE6Cj4gPgo+ID4gICBN
ZXJnZSB0YWcgJ2RybS1taXNjLWZpeGVzLTIwMTktMDYtMjYnIG9mIGdpdDovL2Fub25naXQuZnJl
ZWRlc2t0b3Aub3JnL2RybS9kcm0tbWlzYyBpbnRvIGRybS1maXhlcyAoMjAxOS0wNi0yNyAxMToz
NDo1MiArMTAwMCkKPiA+Cj4gPiBhcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBh
dDoKPiA+Cj4gPiAgIGdpdDovL3Blb3BsZS5mcmVlZGVza3RvcC5vcmcvfmFnZDVmL2xpbnV4IHRh
Z3MvZHJtLWZpeGVzLTUuMi0yMDE5LTA3LTAyCj4gPgo+ID4gZm9yIHlvdSB0byBmZXRjaCBjaGFu
Z2VzIHVwIHRvIDI1ZjA5Zjg1ODgzNWIwZTlhMDYyMTM4MTEwMzExOTBhMTdkOGFiNzg6Cj4gPgo+
ID4gICBkcm0vYW1kZ3B1L2dmeDk6IHVzZSByZXNldCBkZWZhdWx0IGZvciBQQV9TQ19GSUZPX1NJ
WkUgKDIwMTktMDctMDEgMTI6MTY6MjYgLTA1MDApCj4gPgo+ID4gLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gZHJtLWZp
eGVzLTUuMi0yMDE5LTA3LTAyOgo+ID4KPiA+IEZpeGVzIGZvciBzdGFibGUKPiA+Cj4gPiBhbWRn
cHU6Cj4gPiAtIHN0YWJpbGl0eSBmaXggZm9yIGdmeDkKPiA+IC0gcmVncmVzc2lvbiBmaXggZm9y
IEhHIG9uIHNvbWUgcG9sYXJpcyBib2FyZHMKPiA+IC0gY3Jhc2ggZml4IGZvciBzb21lIG5ldyBP
RU0gYm9hcmRzCj4gPgo+ID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gQWxleCBEZXVjaGVyICgxKToKPiA+ICAgICAg
IGRybS9hbWRncHUvZ2Z4OTogdXNlIHJlc2V0IGRlZmF1bHQgZm9yIFBBX1NDX0ZJRk9fU0laRQo+
ID4KPiA+IEV2YW4gUXVhbiAoMSk6Cj4gPiAgICAgICBkcm0vYW1kL3Bvd2VycGxheTogdXNlIGhh
cmR3YXJlIGZhbiBjb250cm9sIGlmIG5vIHBvd2VycGxheSBmYW4gdGFibGUKPiA+Cj4gPiBMeXVk
ZSBQYXVsICgxKToKPiA+ICAgICAgIGRybS9hbWRncHU6IERvbid0IHNraXAgZGlzcGxheSBzZXR0
aW5ncyBpbiBod21ncl9yZXN1bWUoKQo+ID4KPiA+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9nZnhfdjlfMC5jICAgICAgICAgICAgICAgICB8IDE5IC0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+
ICBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci9od21nci5jICAgICAgICAgICB8
ICAyICstCj4gPiAgLi4uL2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3Byb2Nlc3NfcHB0YWJsZXNf
djFfMC5jICAgfCAgNCArKystCj4gPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5j
L2h3bWdyLmggICAgICAgICAgICAgfCAgMSArCj4gPiAgLi4uL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9zbXVtZ3IvcG9sYXJpczEwX3NtdW1nci5jICAgfCAgNCArKysrCj4gPiAgNSBmaWxlcyBjaGFu
Z2VkLCA5IGluc2VydGlvbnMoKyksIDIxIGRlbGV0aW9ucygtKQo+Cj4gLS0KPiBEYW5pZWwgVmV0
dGVyCj4gU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCj4gaHR0cDovL2Jsb2cu
ZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
