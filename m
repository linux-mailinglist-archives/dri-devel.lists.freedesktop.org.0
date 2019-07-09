Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E03F263C56
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 22:01:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66777897FF;
	Tue,  9 Jul 2019 20:01:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7722C897FF
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 20:01:24 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id f4so30350685ioh.6
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2019 13:01:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=B7/QcW7r5MQOGhPEoQO1LbngGWl8Cp/c3zBrZbGmskM=;
 b=fIRS9N6udDZDLZuvmPz+nG9WjbhQMxa65kEaIkjCO9iByIqaZRlsnreKCK8dloiJc2
 /3iKiTPXsUxiU/+hbDiuZ2YxSSsxL8lRcMY25fzu/fyjyp3XY4kSHRgUGjPzIKUSo1Ty
 mE/+oJ0LOIvvJkH569UAkDSjOpdZFpGg7rUyhUs4PTv1saoL6qZyNC84FIflDEW6vR46
 j13tU0K6Q0dgXvlOL17Jo/d9Db/78YKEglk82knEG2IrlDCzlJZ8adQJSge4/WGmfOkU
 xQhYP2n6S1Uw4TfR1YzRbPpTEKjjhiH9QvLSFbE3GvRzDYLB8mG/4abVUEoAA8YU0JOr
 3lSw==
X-Gm-Message-State: APjAAAVdoXrBcVy95bgxtA5PdHGQ7fQm5h3d2zs41TxBa8gZ70c+C+7C
 WwTQ3+l8bpysK+7lvKxs9Q==
X-Google-Smtp-Source: APXvYqytSsRPVq3GTbSVDnVsku/qIgTDId3MOrt1dloK9TJz1SnYYCUTN2WCuwk38In8AaLhppOnLQ==
X-Received: by 2002:a02:7f15:: with SMTP id r21mr31288185jac.120.1562702483721; 
 Tue, 09 Jul 2019 13:01:23 -0700 (PDT)
Received: from localhost ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id s2sm15525321ioj.8.2019.07.09.13.01.22
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 09 Jul 2019 13:01:23 -0700 (PDT)
Date: Tue, 9 Jul 2019 14:01:21 -0600
From: Rob Herring <robh@kernel.org>
To: Cheng-Yi Chiang <cychiang@chromium.org>
Subject: Re: [PATCH 5/7] ASoC: rockchip: rockchip-max98090: Add node for HDMI
Message-ID: <20190709200121.GA19118@bogus>
References: <20190603043251.226549-1-cychiang@chromium.org>
 <20190603043251.226549-6-cychiang@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190603043251.226549-6-cychiang@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Takashi Iwai <tiwai@suse.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-rockchip@lists.infradead.org, dgreid@chromium.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, tzungbi@chromium.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Russell King <rmk+kernel@armlinux.org.uk>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dianders@chromium.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMDMsIDIwMTkgYXQgMTI6MzI6NDlQTSArMDgwMCwgQ2hlbmctWWkgQ2hpYW5n
IHdyb3RlOgo+IExldCB1c2VyIHNwZWNpZnkgSERNSSBub2RlIHNvIG1hY2hpbmUgZHJpdmVyIGNh
biB1c2UgaXQgdG8gbGV0IGNvZGVjCj4gZHJpdmVyIHJlZ2lzdGVyIGNhbGxiYWNrIG9uIGNvcnJl
Y3QgaGRtaS1ub3RpZmllci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaGVuZy1ZaSBDaGlhbmcgPGN5
Y2hpYW5nQGNocm9taXVtLm9yZz4KPiAtLS0KPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3NvdW5kL3JvY2tjaGlwLW1heDk4MDkwLnR4dCB8IDIgKysKPiAgMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3Mvc291bmQvcm9ja2NoaXAtbWF4OTgwOTAudHh0IGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL3JvY2tjaGlwLW1heDk4MDkwLnR4dAo+IGluZGV4
IGE4MDVhYTk5YWQ3NS4uZGFlNTdjMTQ4NjRlIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9yb2NrY2hpcC1tYXg5ODA5MC50eHQKPiArKysgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQvcm9ja2NoaXAtbWF4OTgwOTAu
dHh0Cj4gQEAgLTcsNiArNyw3IEBAIFJlcXVpcmVkIHByb3BlcnRpZXM6Cj4gICAgY29ubmVjdGVk
IHRvIHRoZSBDT0RFQwo+ICAtIHJvY2tjaGlwLGF1ZGlvLWNvZGVjOiBUaGUgcGhhbmRsZSBvZiB0
aGUgTUFYOTgwOTAgYXVkaW8gY29kZWMKPiAgLSByb2NrY2hpcCxoZWFkc2V0LWNvZGVjOiBUaGUg
cGhhbmRsZSBvZiBFeHQgY2hpcCBmb3IgamFjayBkZXRlY3Rpb24KPiArLSByb2NrY2hpcCxoZG1p
OiBUaGUgcGhhbmRsZSBvZiBIRE1JIG5vZGUgZm9yIEhETUkgamFjayBkZXRlY3Rpb24KPiAgCj4g
IEV4YW1wbGU6Cj4gIAo+IEBAIC0xNiw0ICsxNyw1IEBAIHNvdW5kIHsKPiAgCXJvY2tjaGlwLGky
cy1jb250cm9sbGVyID0gPCZpMnM+Owo+ICAJcm9ja2NoaXAsYXVkaW8tY29kZWMgPSA8Jm1heDk4
MDkwPjsKPiAgCXJvY2tjaGlwLGhlYWRzZXQtY29kZWMgPSA8JmhlYWRzZXRjb2RlYz47Cj4gKwly
b2NrY2hpcCxoZG1pPSA8JmhkbWk+OwoKc3BhY2UgICAgICAgICAgICAgICAgXgoKV2l0aCB0aGF0
LAoKQWNrZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cgo+ICB9Owo+IC0tIAo+
IDIuMjIuMC5yYzEuMjU3LmczMTIwYTE4MjQ0LWdvb2cKPiAKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
