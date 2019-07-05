Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 651E86022A
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 10:30:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEC7A6E423;
	Fri,  5 Jul 2019 08:30:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C44C76E423
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 08:30:26 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id w20so7527166edd.2
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jul 2019 01:30:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=QbM44vAJoF7F4CJFe8D/rdMDdvpEwrpfX/ASCNMAqXA=;
 b=Czd8A1XL1QmD10KE+KhR+MwdDZFxtmGF/cozVQ2s9Cnhp57lo+N12xzCaHttkK6PBl
 6xitd2RniLg7LxDNb6T0IvbmhiY+5QJrLx5KMChlfMjdBfHghP7zXG8eP4CNTPOaC/2B
 8rscCA4/3JXDnMFzYB7Q/cxOzS2G47BBHh9+37lQJ83XiCKrki51ah0NEMa4nR0VLY7q
 bXyXJlD8wh8sSSHTW7VyNM0N4Q8JUWU/WYgFFTGMLLDg5ZhJ4Y+EWM9321LI8c8t1ekk
 dJNKACp6heoCcIkYiqWsC/v8U2S27sX+gu5ABCgeB0JBU29VogyxUE+cGmPPeDIYNgMd
 JCiw==
X-Gm-Message-State: APjAAAUyACS5luVfNWbs+jO95hN3eptYqYMtKLELWht30zin/L54qQPV
 jA2qravm7UVL4EM9VLIE40nepg==
X-Google-Smtp-Source: APXvYqwxQTfCTwjg1Nv3JLxxlgEvpmawVRx0vKkBJIxGnG7RJ1+MqMHZ1WkVfQw3vC+4ikaheGDsmw==
X-Received: by 2002:a17:906:ce21:: with SMTP id
 sd1mr2339496ejb.189.1562315425410; 
 Fri, 05 Jul 2019 01:30:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id j16sm481089ejq.66.2019.07.05.01.30.23
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 05 Jul 2019 01:30:24 -0700 (PDT)
Date: Fri, 5 Jul 2019 10:30:22 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Cheng-Yi Chiang <cychiang@chromium.org>
Subject: Re: [PATCH 0/4] Add HDMI jack support on RK3288
Message-ID: <20190705083022.GM15868@phenom.ffwll.local>
Mail-Followup-To: Cheng-Yi Chiang <cychiang@chromium.org>,
 linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
 Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Heiko Stuebner <heiko@sntech.de>,
 dianders@chromium.org, dgreid@chromium.org, tzungbi@chromium.org,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20190705042623.129541-1-cychiang@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190705042623.129541-1-cychiang@chromium.org>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=QbM44vAJoF7F4CJFe8D/rdMDdvpEwrpfX/ASCNMAqXA=;
 b=AI94tmMhDWpYtJmSG9OE2YtmGF4jgP603p1zLogEX94WNdxqWXxqEwxrlkap0wV7Yl
 ZZRrsbZx4mmXa6AJ4tYAh2jqBqJjFu9u5l/agQqdcx6lc9fHqFA0EU/eN4baePIRYs0K
 ZXYrsPW7Y5tzH4uUsUdwjuKhodl8pkaIRj+10=
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
Cc: alsa-devel@alsa-project.org, dianders@chromium.org,
 Liam Girdwood <lgirdwood@gmail.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Takashi Iwai <tiwai@suse.com>,
 tzungbi@chromium.org, linux-kernel@vger.kernel.org,
 Hans Verkuil <hverkuil@xs4all.nl>, Russell King <rmk+kernel@armlinux.org.uk>,
 Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-rockchip@lists.infradead.org, dgreid@chromium.org,
 Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMDUsIDIwMTkgYXQgMTI6MjY6MTlQTSArMDgwMCwgQ2hlbmctWWkgQ2hpYW5n
IHdyb3RlOgo+IFRoaXMgcGF0Y2ggc2VyaWVzIHN1cHBvcnRzIEhETUkgamFjayByZXBvcnRpbmcg
b24gUkszMjg4LCB3aGljaCB1c2VzCj4gRFJNIGR3LWhkbWkgZHJpdmVyIGFuZCBoZG1pLWNvZGVj
IGNvZGVjIGRyaXZlci4KPiAKPiBUaGUgcHJldmlvdXMgZGlzY3Vzc2lvbiBhYm91dCByZXBvcnRp
bmcgamFjayBzdGF0dXMgdXNpbmcgaGRtaS1ub3RpZmllcgo+IGFuZCBkcm1fYXVkaW9fY29tcG9u
ZW50IGlzIGF0Cj4gCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcGF0Y2h3b3JrL3BhdGNoLzEw
ODMwMjcvCj4gCj4gVGhlIG5ldyBhcHByb2FjaCBpcyB0byB1c2UgYSBjYWxsYmFjayBtZWNoYW5p
c20gdGhhdCBpcwo+IHNwZWNpZmljIHRvIGhkbWktY29kZWMuCgpJIHRoaW5rIHRoaXMgbG9va3Mg
cmVhc29uYWJsZS4gVGhlcmUncyB0aGUgZW50aXJlIHF1ZXN0aW9uIG9mIGdldHRpbmcgcmlkCm9m
IHRoZSBwbGF0Zm9ybV9kZXZpY2UgaW4gaGRtaV9jb2RlYyBhbiByb2xsIG91ciBvd24gZGV2aWNl
cyAoc28gdGhhdCBpdAphbGwgbG9va3MgYSBiaXQgY2xlYW5lciwgbGlrZSBlLmcuIHRoZSBjZWMg
c3R1ZmYgZG9lcykuIEJ1dCB0aGF0IGNhbiBhbHNvCmJlIGRvbmUgaW4gYSBmb2xsb3ctdXAgKGlm
IHlvdSBjYW4gY29udmluY2UgcmV2aWV3ZXJzIG9mIHRoYXQpLgotRGFuaWVsCgo+IENoZW5nLVlp
IENoaWFuZyAoNCk6Cj4gICBBU29DOiBoZG1pLWNvZGVjOiBBZGQgYW4gb3AgdG8gc2V0IGNhbGxi
YWNrIGZ1bmN0aW9uIGZvciBwbHVnIGV2ZW50Cj4gICBkcm06IGJyaWRnZTogZHctaGRtaTogUmVw
b3J0IGNvbm5lY3RvciBzdGF0dXMgdXNpbmcgY2FsbGJhY2sKPiAgIEFTb0M6IHJvY2tjaGlwX21h
eDk4MDkwOiBBZGQgZGFpX2xpbmsgZm9yIEhETUkKPiAgIEFTb0M6IHJvY2tjaGlwX21heDk4MDkw
OiBBZGQgSERNSSBqYWNrIHN1cHBvcnQKPiAKPiAgLi4uL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lz
L2R3LWhkbWktYXVkaW8uaCAgIHwgICAzICsKPiAgLi4uL2RybS9icmlkZ2Uvc3lub3BzeXMvZHct
aGRtaS1pMnMtYXVkaW8uYyAgIHwgIDEwICsrCj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lu
b3BzeXMvZHctaGRtaS5jICAgICB8ICAzMiArKysrLQo+ICBpbmNsdWRlL3NvdW5kL2hkbWktY29k
ZWMuaCAgICAgICAgICAgICAgICAgICAgfCAgMTYgKysrCj4gIHNvdW5kL3NvYy9jb2RlY3MvaGRt
aS1jb2RlYy5jICAgICAgICAgICAgICAgICB8ICA1MiArKysrKysrKwo+ICBzb3VuZC9zb2Mvcm9j
a2NoaXAvcm9ja2NoaXBfbWF4OTgwOTAuYyAgICAgICAgfCAxMTIgKysrKysrKysrKysrKystLS0t
Cj4gIDYgZmlsZXMgY2hhbmdlZCwgMjAxIGluc2VydGlvbnMoKyksIDI0IGRlbGV0aW9ucygtKQo+
IAo+IC0tIAo+IDIuMjIuMC40MTAuZ2Q4ZmRiZTIxYjUtZ29vZwo+IAoKLS0gCkRhbmllbCBWZXR0
ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xs
LmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
