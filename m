Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2425D61B10
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 09:12:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 603A689B00;
	Mon,  8 Jul 2019 07:12:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69BDF8992E
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 05:04:22 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id u124so7364892vsu.2
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Jul 2019 22:04:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Div9/ExPBXeNPwe6gkanRSA20V8261vIipkTc2adVjM=;
 b=HsXLj94dWfR7XhpNnWlQ1DbHSkNpPSos8uxwDQkW8p/9CFiGhaHD66Q7S77S0F5qIh
 hq2pDKgFkTlMlxKgc8tjH/yLDNWsMD8FXJQHU57Eo9Rv+dcsA2YqdcCIDcgCqIp+7qw3
 +X8wBlbv1Mxnn8L2bdZ/KHUWZtvCYh8Aom+3Z7q1ZBoRxBDGu6H8xsNcmoKy4RB/BLTM
 O/mmzNF4TPMCDcTcfFQ2KLoPJRI54Z46DRK0ot6ni56o6WPnvCeYI/d98n6rlGD4VHDK
 CwWgrP3DEe8XhdDn9AlKzbr8Muy3pcvnpdoYUOj1sAYjJkOmBMxWUGBoSn6NOy7DhPSF
 OeCw==
X-Gm-Message-State: APjAAAX1Clmp31Is/q6ZvQl5Gr0RNNjtJBWHIBqQXcLCQ1hnIR+g0kEU
 mHSsHFK4YhEvt0ABGAo5Z29MaOeJ5COECGLS6K2k8w==
X-Google-Smtp-Source: APXvYqzKI5qNNsiRKRIHZBN2EiiQYggki+EnjIVPY+3PoX163CFHFiFOgVyx1S9hteBUIbxFauiJMzT56Q8PxxERB2o=
X-Received: by 2002:a67:f7cd:: with SMTP id a13mr6748465vsp.163.1562562261162; 
 Sun, 07 Jul 2019 22:04:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190705042623.129541-1-cychiang@chromium.org>
 <20190705042623.129541-2-cychiang@chromium.org>
 <CA+Px+wXtmf9dQQP7ywPLp7Qbbvqau=WnO3qhZ8+qmbJD1gjx+A@mail.gmail.com>
 <20190705121240.GA20625@sirena.org.uk>
In-Reply-To: <20190705121240.GA20625@sirena.org.uk>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Mon, 8 Jul 2019 13:03:53 +0800
Message-ID: <CAFv8NwLP-hUBW8FZW5kooaggeNRG7LAEd2pd_-70YBrVMY-+CQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] ASoC: hdmi-codec: Add an op to set callback function
 for plug event
To: Mark Brown <broonie@kernel.org>
X-Mailman-Approved-At: Mon, 08 Jul 2019 07:11:53 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Div9/ExPBXeNPwe6gkanRSA20V8261vIipkTc2adVjM=;
 b=Kr9xgzIgvJODL4j4Tar0NRNKMTIXggQEPJlw7ZTjjNYm575FxLii/NRilTRRlb5wa9
 BWu/yi/4QHA/SF4dJDPdiho9Fx9QFL7y+FAMY/c8IVi1NMs8YVjKbGVOIrjJYJzX4EsW
 nPrzbFSUsGbfcqx1g1C4zlpLeDlnrse6Nv5Vg=
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
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Doug Anderson <dianders@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Takashi Iwai <tiwai@suse.com>,
 tzungbi@chromium.org, Jaroslav Kysela <perex@perex.cz>,
 Hans Verkuil <hverkuil@xs4all.nl>, Tzung-Bi Shih <tzungbi@google.com>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-rockchip@lists.infradead.org, Dylan Reid <dgreid@chromium.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgNSwgMjAxOSBhdCA4OjEyIFBNIE1hcmsgQnJvd24gPGJyb29uaWVAa2VybmVs
Lm9yZz4gd3JvdGU6Cj4KPiBPbiBGcmksIEp1bCAwNSwgMjAxOSBhdCAwMzowODozN1BNICswODAw
LCBUenVuZy1CaSBTaGloIHdyb3RlOgo+ID4gT24gRnJpLCBKdWwgNSwgMjAxOSBhdCAxMjoyNiBQ
TSBDaGVuZy1ZaSBDaGlhbmcgPGN5Y2hpYW5nQGNocm9taXVtLm9yZz4gd3JvdGU6Cj4KPiA+ID4g
K3R5cGVkZWYgdm9pZCAoKmhkbWlfY29kZWNfcGx1Z2dlZF9jYikoc3RydWN0IHBsYXRmb3JtX2Rl
dmljZSAqZGV2LAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJv
b2wgcGx1Z2dlZCk7Cj4gPiA+ICsKPgo+ID4gVGhlIGNhbGxiYWNrIHByb3RvdHlwZSBpcyAid2Vp
cmQiIGJ5IHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UuICBJcyBpdAo+ID4gcG9zc2libGUgdG8gaGF2
aW5nIHNuZF9zb2NfY29tcG9uZW50IGluc3RlYWQgb2YgcGxhdGZvcm1fZGV2aWNlPwo+Cj4gT3Ig
aWYgaXQncyBnb3QgdG8gYmUgYSBkZXZpY2Ugd2h5IG5vdCBqdXN0IGEgZ2VuZXJpYyBkZXZpY2Ug
c28KPiB3ZSdyZSBub3QgdGllZCB0byBhIHBhcnRpY3VsYXIgYnVzIGhlcmU/CgpNeSBpbnRlbnRp
b24gd2FzIHRvIGludm9rZSB0aGUgY2FsbCBpbiBkdy1oZG1pLmMgbGlrZSB0aGlzOgoKICAgIGhk
bWktPnBsdWdnZWRfY2IoaGRtaS0+YXVkaW8sCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcmVzdWx0ID09IGNvbm5lY3Rvcl9zdGF0dXNfY29ubmVjdGVkKTsKCkhlcmUgaGRtaS0+
YXVkaW8gaXMgYSBwbGF0Zm9ybV9kZXZpY2UuCkkgdGhpbmsgZHctaGRtaSBjYW4gbm90IGdldCAg
c25kX3NvY19jb21wb25lbnQgZWFzaWx5LgpJIGNhbiB1c2UgYSBnZW5lcmljIGRldmljZSBoZXJl
IHNvIHRoZSBvcHMgaXMgbW9yZSBnZW5lcmFsLgpUaGUgY2FsbGluZyB3aWxsIGJlIGxpa2UKICAg
IGhkbWktPnBsdWdnZWRfY2IoJmhkbWktPmF1ZGlvLT5kZXYsCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcmVzdWx0ID09IGNvbm5lY3Rvcl9zdGF0dXNfY29ubmVjdGVkKTsKSSB3
aWxsIHVwZGF0ZSB0aGlzIGluIHYyLgpUaGFua3MhCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
