Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCD11FC755
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 09:27:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 461DF6EAC8;
	Wed, 17 Jun 2020 07:26:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0123C6E1F8
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 21:25:41 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id c12so12635914lfc.10
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 14:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hVdt6AXODFboWYabzNYMUEMNfFhxWDLJgJNzupuDcUc=;
 b=pGXke/vHvJbeYRKgVgjKaAGVVWlGt2Zlyo2sdvyXiMnK0Z2k8tgv2lOmK3fZQ5hdsI
 U4DNuVOz26tSkoxV4Ag5qMiLAyX4PcDc4Kwb+qmh37FoEIuz6kLdjs8xZeQW/TddmCaz
 VqubvdibZYToYvyAx2s73doWSZTWfyqCWWYxynDtbAS/kceU1iF/iPq7spKDD1F++TR2
 tqpVmFBKfTyiWTJJWSfSty29m2Cw2Zu8zCGrgWv27paZjVfmqoLuj6ecp79wYKFE5Rsq
 raFGS92UaPIIwTD9+eOyMB8H1nWKgBqT5eZR53OC+oCM6hXIibX60d5YZN4fE8H1M/1P
 hXRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hVdt6AXODFboWYabzNYMUEMNfFhxWDLJgJNzupuDcUc=;
 b=OQLcY38VGzDsfFDGrG9ThJVIYG6NwlDgAHbfFnf0CEg974xw2mL48NWpQhO0rt5Rdg
 6IIXj0IsLHatFItxL9t+tG4bmw7a/6R3DDacYOhCUHt/q+jqBpMiTEPiE74XzJFmwngC
 v73HVnDpxNHkjKT7dJxOpD+D41/YA6/GCTMyVuYc2UNQMkyevjyEGB2xDDaEl9DVjGkb
 QXMumkCrblswLalFJTrpPaTlLZYNp3cqkO7RuVPXn/COjYPs0E5J2RmlCcz1TuT36/1t
 He9CYtHJu59stx19ZTbUMgl3P1ETfyQPTov0y7nU3/2Ogx7eDO8S19Fod0v+5fiuDfag
 6Mkw==
X-Gm-Message-State: AOAM5313yX+ilRFUw4yzrMTQNNTpgY55k8Lt/l7GgksMmpBz4O/DXWfh
 Igc3DzvSkbe6gWnoFLd6052tturq
X-Google-Smtp-Source: ABdhPJxJ16gTDiEqo2xtKJxQd/8rm2iOA6GJb7n/d5HI200HY+0KKnM4psUU1+k67xApqZgL9p/Cqg==
X-Received: by 2002:ac2:544b:: with SMTP id d11mr2714926lfn.157.1592342739859; 
 Tue, 16 Jun 2020 14:25:39 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.googlemail.com with ESMTPSA id 11sm1336289lfz.78.2020.06.16.14.25.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2020 14:25:39 -0700 (PDT)
Subject: Re: [PATCH v2 0/5] 180 degrees rotation support for NVIDIA Tegra DRM
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20200614200121.14147-1-digetx@gmail.com>
 <CACvgo51QuXMgWhFk4C=3rGvUZDX1_W0RZtVb5RtRPiHTpMebWQ@mail.gmail.com>
 <8f789ef5-bebf-c869-784d-afda70fc1fb8@gmail.com>
 <CACvgo50oSMbgXw1vHwVT4hhGe6g3YzKQEohCLJdfDq+0UaN1jw@mail.gmail.com>
 <646b3f37-0f72-7f3b-388f-f71dbcdd5c84@gmail.com>
 <20200616174558.GA913@pendragon.ideasonboard.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <2862a842-322e-34d6-6826-3b3352f98230@gmail.com>
Date: Wed, 17 Jun 2020 00:25:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200616174558.GA913@pendragon.ideasonboard.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 17 Jun 2020 07:26:03 +0000
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
 Emil Velikov <emil.l.velikov@gmail.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-tegra@vger.kernel.org,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTYuMDYuMjAyMCAyMDo0NSwgTGF1cmVudCBQaW5jaGFydCDQv9C40YjQtdGCOgo+IE9uIFR1ZSwg
SnVuIDE2LCAyMDIwIGF0IDA4OjIwOjU3UE0gKzAzMDAsIERtaXRyeSBPc2lwZW5rbyB3cm90ZToK
Pj4gMTYuMDYuMjAyMCAxODo0OCwgRW1pbCBWZWxpa292INC/0LjRiNC10YI6Cj4+PiBPbiBUdWUs
IDE2IEp1biAyMDIwIGF0IDEyOjQwLCBEbWl0cnkgT3NpcGVua28gPGRpZ2V0eEBnbWFpbC5jb20+
IHdyb3RlOgo+Pj4+Cj4+Pj4gMTYuMDYuMjAyMCAwMToyNiwgRW1pbCBWZWxpa292INC/0LjRiNC1
0YI6Cj4+Pj4+IEhpIERtaXRyeSwKPj4+Pj4KPj4+Pj4gT24gTW9uLCAxNSBKdW4gMjAyMCBhdCAw
ODoyOCwgRG1pdHJ5IE9zaXBlbmtvIDxkaWdldHhAZ21haWwuY29tPiB3cm90ZToKPj4+Pj4+Cj4+
Pj4+PiBIZWxsbyEKPj4+Pj4+Cj4+Pj4+PiBUaGlzIHNlcmllcyBhZGRzIDE4MMKwIGRpc3BsYXkg
cGxhbmUgcm90YXRpb24gc3VwcG9ydCB0byB0aGUgTlZJRElBIFRlZ3JhCj4+Pj4+PiBEUk0gZHJp
dmVyIHdoaWNoIGlzIG5lZWRlZCBmb3IgZGV2aWNlcyB0aGF0IGhhdmUgZGlzcGxheSBwYW5lbCBw
aHlzaWNhbGx5Cj4+Pj4+PiBtb3VudGVkIHVwc2lkZS1kb3duLCBsaWtlIE5leHVzIDcgdGFibGV0
IGRldmljZSBmb3IgZXhhbXBsZSBbMV0uIFNpbmNlCj4+Pj4+PiBEUk0gcGFuZWwgcm90YXRpb24g
aXMgYSBuZXcgdGhpbmcgZm9yIGEgdXNlcnNwYWNlLCBjdXJyZW50bHkgb25seQo+Pj4+Pj4gT3Bl
bnRlZ3JhIFhvcmcgZHJpdmVyIGhhbmRsZXMgdGhlIHJvdGF0ZWQgZGlzcGxheSBwYW5lbCBbMl0s
IGJ1dCB0aGlzCj4+Pj4+PiBpcyBnb29kIGVub3VnaCBmb3IgdGhlIHN0YXJ0Lgo+Pj4+Pj4KPj4+
Pj4+IE5vdGUgdGhhdCBsYXRlciBvbiBpdCBzaG91bGQgYmUgcG9zc2libGUgdG8gaW1wbGVtZW50
IGEgdHJhbnNwYXJlbnQgMTgwwrAKPj4+Pj4+IGRpc3BsYXkgcm90YXRpb24gZm9yIFRlZ3JhIERS
TSBkcml2ZXIgd2hpY2ggd2lsbCByZW1vdmUgdGhlIG5lZWQgdG8gaGF2ZQo+Pj4+Pj4gYSBibGVl
ZGluZyBlZGdlIHVzZXJzcGFjZSB0aGF0IGtub3dzIGhvdyB0byByb3RhdGUgZGlzcGxheSBwbGFu
ZXMgYW5kIEknbQo+Pj4+Pj4gc2xvd2x5IHdvcmtpbmcgb24gaXQuIEZvciB0aGUgc3RhcnRlciB3
ZSBjYW4gZ28gd2l0aCB0aGUgbWluaW1hbCByb3RhdGlvbgo+Pj4+Pj4gc3VwcG9ydCwgc28gaXQn
cyBub3QgYSBibG9ja2VyLgo+Pj4+Pj4KPj4+Pj4+IFRoaXMgc2VyaWVzIGlzIGJhc2VkIG9uIHRo
ZSB3b3JrIHRoYXQgd2FzIG1hZGUgYnkgRGVyZWsgQmFzZWhvcmUgZm9yIHRoZQo+Pj4+Pj4gTWVk
aWF0ZWsgZHJpdmVyIFszXSwgaGlzIHBhdGNoIGlzIGluY2x1ZGVkIGludG8gdGhpcyBwYXRjaHNl
dC4gSSBhZGRlZAo+Pj4+Pj4gbXkgdGVzdGVkLWJ5IHRhZyB0byB0aGUgRGVyZWsncyBwYXRjaC4K
Pj4+Pj4+Cj4+Pj4+PiBQbGVhc2UgcmV2aWV3IGFuZCBhcHBseSwgdGhhbmtzIGluIGFkdmFuY2Uh
Cj4+Pj4+Pgo+Pj4+Pj4gWzFdIGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9s
aW51eC10ZWdyYS9wYXRjaC8yMDIwMDYwNzE1NDMyNy4xODU4OS0zLWRpZ2V0eEBnbWFpbC5jb20v
Cj4+Pj4+PiBbMl0gaHR0cHM6Ly9naXRodWIuY29tL2dyYXRlLWRyaXZlci94Zjg2LXZpZGVvLW9w
ZW50ZWdyYS9jb21taXQvMjhlYjIwYTM5NTliYmU1YmMzYTNiNjdlNTU5NzcwOTNmZDUxMTRjYQo+
Pj4+Pj4gWzNdIGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDIwLzMvNS8xMTE5Cj4+Pj4+Pgo+Pj4+
Pj4gQ2hhbmdlbG9nOgo+Pj4+Pj4KPj4+Pj4+IHYyOiAtIERyb3BwZWQgImRybS9wYW5lbDogU2V0
IGRpc3BsYXkgaW5mbyBpbiBwYW5lbCBhdHRhY2giIHBhdGNoLCB3aGljaAo+Pj4+Pj4gICAgICAg
dHVybmVkIG91dCB0byBiZSBvYnNvbGV0ZSBub3cuCj4+Pj4+Pgo+Pj4+Pj4gICAgIC0gUmVuYW1l
ZCB0aGUgY292ZXItbGF0dGVyLCBob3BlZnVsbHkgdGhpcyB3aWxsIGZpeCB0aGUgYm91bmNpbmcg
ZW1haWxzLgo+Pj4+Pj4KPj4+Pj4+IERlcmVrIEJhc2Vob3JlICgxKToKPj4+Pj4+ICAgZHJtL3Bh
bmVsOiBBZGQgaGVscGVyIGZvciByZWFkaW5nIERUIHJvdGF0aW9uCj4+Pj4+Pgo+Pj4+Pj4gRG1p
dHJ5IE9zaXBlbmtvICg0KToKPj4+Pj4+ICAgZHJtL3BhbmVsOiBsdmRzOiBTZXQgdXAgcGFuZWwg
b3JpZW50YXRpb24KPj4+Pj4KPj4+Pj4gSU1ITyBpdCdzIHBlcmZlY3RseSByZWFzb25hYmxlIHRv
IHJlcG9ydCB0aGUgcGFuZWwgb3JpZW50YXRpb24gdG8KPj4+Pj4gdXNlcnNwYWNlLCB3aGljaCBj
YW4gYXBwbHkgcGxhbmUgcm90YXRpb24gYXMgbmVlZGVkLgo+Pj4+Pgo+Pj4+PiBBbHRob3VnaCBJ
IHNlZSB0aGF0IHRoaXMgc2VyaWVzLCBhbGlrZSBEZXJlaydzLCBoYXMgYSBjb3VwbGUgb2YgaXNz
dWVzOgo+Pj4+PiAgLSBvbmx5IGEgc2luZ2xlIHBhbmVsIGRyaXZlciBpcyB1cGRhdGVkCj4+Pj4+
ICAtIHJvdGF0aW9uIGlzIF9ub3RfIGxpc3RlZCBhcyBzdXBwb3J0ZWQgcHJvcGVydHksIGluIHNh
aWQgcGFuZWwKPj4+Pj4gZHJpdmVyIGRldmljZS10cmVlIGJpbmRpbmdzCj4+Pj4+Cj4+Pj4+IE15
IHBlcnNvbmFsIGluY2xpbmF0aW9uIGlzIHRoYXQgd2Ugc2hvdWxkIGFpbSBmb3IgYSBjb21wcmVo
ZW5zaXZlIHNvbHV0aW9uOgo+Pj4+PiAgLSB3aXJlIGFsbCBwYW5lbCBkcml2ZXJzLCBhcyBjdXJy
ZW50bHkgZG9jdW1lbnRlZCAocXVpY2sgZ3JlcCBsaXN0IGJlbG93KQo+Pj4+PiAgLSBkb2N1bWVu
dCBhbmQgd2lyZS11cCB0aGUgbHZkcyBhbmQgYm9lIHBhbmVscyAtIGFzIHByb3Bvc2VkIGJ5IHlv
dQo+Pj4+PiBhbmQgRGVyZWsgcmVzcGVjdGl2ZWx5Cj4+Pj4+Cj4+Pj4+IEhUSAo+Pj4+PiBFbWls
Cj4+Pj4+Cj4+Pj4+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2hp
bWF4LGh4ODM1N2QudHh0OjIKPj4+Pj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Rpc3BsYXkvaWxpdGVrLGlsaTkyMjUudHh0OjIKPj4+Pj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvaWxpdGVrLGlsaTkzNDEudHh0OjIKPj4+Pj4gRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvaWxpdGVrLGlsaTk0ODYueWFtbDoyCj4+
Pj4+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L211bHRpLWlubm8s
bWkwMjgzcXQudHh0OjIKPj4+Pj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvcGFuZWwvcGFuZWwtY29tbW9uLnlhbWw6Mgo+Pj4+PiBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9zaXRyb25peCxzdDc1ODYudHh0OjEKPj4+Pj4gRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvc2l0cm9uaXgsc3Q3NzM1ci55YW1s
OjIKPj4+Pgo+Pj4+IFJvdGF0aW9uIGlzIGEgY29tbW9uIERUIHBhbmVsIHByb3BlcnR5IHRoYXQg
aXMgZGVzY3JpYmVkIGluIHRoZQo+Pj4+IHBhbmVsLWNvbW1vbi55YW1sLgo+Pj4gVGhlIHByb3Bl
cnR5IHdhcyBpbnRyb2R1Y2VkIGFsbW9zdCBleGNsdXNpdmVseSBmb3IgdGlueSBkcm0gcGFuZWxz
Lgo+Pj4gVGhvc2Ugb25lcyBhcmUgYSBiaXQgZGlmZmVyZW50IGZyb20gdGhlIHJlc3QgKGluIHBh
bmVsLykgLQo+Pj4gTUlQSS1EQkkvU1BJIHcvbyAobm90IGNvbm5lY3RlZCBhdCBsZWFzdCkgYW4g
YWN0dWFsIEdQVS4KPj4+Cj4+PiBUbyBtYWtlIGl0IGEgYml0IGJldHRlciwgdGhlIHJvdGF0aW9u
IGlzIHNlZW1pbmdseSBwZXJmb3JtZWQgaW4gdGhlCj4+PiB0aW55IGRyaXZlciBpdHNlbGYgb3Vj
aC4KPj4+Cj4+Pj4gVGhpcyBwcm9wZXJ0eSBpcyBzdXBwb3J0ZWQgYnkgYWxsIHBhbmVsIGJpbmRp
bmdzCj4+Pj4gYmVjYXVzZSB0aGVzZSBiaW5kaW5ncyBpbmhlcmVudCB0aGUgY29tbW9uIHByb3Bl
cnRpZXMgZnJvbSB0aGUKPj4+PiBwYW5lbC1jb21tb24ueWFtbC4KPj4+Pgo+Pj4gU2VlbXMgbGlr
ZSB0aGF0IHdhcyBhbiB1bmludGVudGlvbmFsIGNoYW5nZSB3aXRoIHRoZSBjb252ZXJzaW9uIHRv
IFlBTUwuCj4+PiBCZWZvcmVoYW5kIG9ubHkgYSBmZXcgc2VsZWN0ZWQgcGFuZWxzIGhhZCByb3Rh
dGlvbi4gVXBvbiBjbG9zZXIgbG9vayAtCj4+PiBzb21lIHBhbmVscyBkbyBoYXZlIGZvbGxvdy11
cCBmaXhlcywgdG8gcmVtb3ZlL2xpbWl0IHRoZSBpbXBsaWNpdAo+Pj4gaW5jbHVzaW9uLgo+Pgo+
PiBJbnRlcmVzdGluZy4uIG15IHVuZGVyc3RhbmRpbmcgdGhhdCB0aGUgcm90YXRpb24gcHJvcGVy
dHkgaXMgc3VwcG9zZWQgdG8KPj4gYmUgYSBnZW5lcmljIHByb3BlcnR5IHdoaWNoIHJlcHJlc2Vu
dHMgcGh5c2ljYWwgb3JpZW50YXRpb24gb2YgYSBkaXNwbGF5Cj4+IHBhbmVsIGFuZCBoZW5jZSBp
dCBzaG91bGQgYmUgYXBwbGljYWJsZSB0byBhbGwgcGFuZWxzLgo+IAo+IEFkZGluZyBhIGJpdCBt
b3JlIGZvb2QgZm9yIHRob3VnaHRzLCB0aGUgRFQgcm90YXRpb24gcHJvcGVydHkgZm9yIGNhbWVy
YQo+IHNlbnNvciBtb2R1bGVzIGhhcyByZWNlbnRseSBiZWVuIGRvY3VtZW50ZWQgd2l0aCBsb3Rz
IG9mIGRldGFpbHMuIFNlZQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW1lZGlhLzIw
MjAwNTA5MDkwNDU2LjM0OTY0ODEtMy1qYWNvcG9Aam1vbmRpLm9yZy8sCj4gcGFydCBvZiB0aGUg
ZG9jdW1lbnRhdGlvbiBtYXkgYmUgdXNlZnVsIGZvciBwYW5lbHMuCgpUaGFua3MhCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
