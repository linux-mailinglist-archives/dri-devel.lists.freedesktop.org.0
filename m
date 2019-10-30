Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25158E9CC9
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2019 14:56:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACEF86E9ED;
	Wed, 30 Oct 2019 13:56:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87EEE6E9ED
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 13:56:54 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id s1so2446729wro.0
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 06:56:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DwVcSXoannBan2m8zWPB7PFI0kJUSthZFWNX18Hm/LQ=;
 b=QdXGI3KdTcgBM0jF4XPVos8VNLehTOrI56ALiLaopUUlulbpwdCruUN48S3XQ7+yKC
 rLTCWPyFhVyhykxTl4SrWJZmauzgz4hvu2tAfqpYpboGROyidjqFHKLoQkOyrGRMHJFS
 K0S/n09IjUYbq0pTbuXlLVAsQRgta6H8c/urd21ylhBjf2QheCsxtI6r8VXsFn25BFAf
 HwG7gkXKFk9U8xjenR2Z+B/9+haNUz6cr99wKedHSR1v6rqsmmiAvXFt2OCfqoN1vth+
 uDSZPnpez8N+oOdvTMDuBZwGea1xmmjXPmclAAqJ384q/fZSSIrLMFdTIDBkPDErIZ1d
 5N7Q==
X-Gm-Message-State: APjAAAVCVhPkDdZWFXYD/EbCTRPHywMXrFOHQm3nmF1dBuxkajaxq07X
 tHdh3F9E9I0uMBaZBswmn8pO8ASAEWqxKODyMA0=
X-Google-Smtp-Source: APXvYqyEugonbjl2q4DWU/AHaJmj/Blp0GlAvoirFuqlE/MSiO8C4JoaW1C/7bETPx1i3Wzdu9TdNu6NLtRVVwtT8gU=
X-Received: by 2002:a5d:6ac3:: with SMTP id u3mr24079wrw.206.1572443813028;
 Wed, 30 Oct 2019 06:56:53 -0700 (PDT)
MIME-Version: 1.0
References: <1572400673-42535-1-git-send-email-zhongjiang@huawei.com>
 <723f11bc-9a65-bce6-9c0f-2ef2dbe7a1db@amd.com>
In-Reply-To: <723f11bc-9a65-bce6-9c0f-2ef2dbe7a1db@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 30 Oct 2019 09:56:40 -0400
Message-ID: <CADnq5_PRfOn1BRJyqT54yKLnmiJxoDaMFwpTOFe=KgQWW0_bDw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: remove redundant null pointer check
 before kfree
To: Harry Wentland <hwentlan@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=DwVcSXoannBan2m8zWPB7PFI0kJUSthZFWNX18Hm/LQ=;
 b=Y/hIlRzunT8W0Xp+WjWPqr78Z2vnSK7uei64oEtx4N+eNc0jemkWFRFCtgjT/jT1r8
 XDd1W9iMqbd0lTmkQLX6U/7HUauSWOUU3l3ZgONqxoqUiV0sc7wfM9XPUoh+/sIN+n83
 En5XSIt1UCBZ6rui4krmtoWgX2/U4Y0Hurw8kpOWcU7GjRu4DJ6KnZj33d+nkW+5Jhch
 dimiw5OGcJx4ukM/iTFVW2eS248VFmsBk8VRVz7gRnY1CVRwmf2nO6Ii8x+hvlqjjlDj
 d5xCYEb33OBjoaPvStBnEBdQ6ddMhTCI1BvAfGIp3P9hYFd8oGLd2eyWB1cSNxpejHnR
 Wnvg==
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>,
 zhong jiang <zhongjiang@huawei.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@linux.ie" <airlied@linux.ie>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMzAsIDIwMTkgYXQgOTozNiBBTSBIYXJyeSBXZW50bGFuZCA8aHdlbnRsYW5A
YW1kLmNvbT4gd3JvdGU6Cj4KPiBPbiAyMDE5LTEwLTI5IDk6NTcgcC5tLiwgemhvbmcgamlhbmcg
d3JvdGU6Cj4gPiBrZnJlZSBoYXMgdGFrZW4gbnVsbCBwb2ludGVyIGludG8gYWNjb3VudC4gaGVu
Y2UgaXQgaXMgc2FmZSB0byByZW1vdmUKPiA+IHRoZSB1bm5lY2Vzc2FyeSBjaGVjay4KPiA+Cj4g
PiBTaWduZWQtb2ZmLWJ5OiB6aG9uZyBqaWFuZyA8emhvbmdqaWFuZ0BodWF3ZWkuY29tPgo+Cj4g
UmV2aWV3ZWQtYnk6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPgo+CgpB
cHBsaWVkLiAgdGhhbmtzIQoKQWxleAoKPiBIYXJyeQo+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvaGRjcC9oZGNwX21zZy5jIHwgNCArLS0tCj4gPiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvaGRjcC9oZGNwX21zZy5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2hkY3AvaGRjcF9tc2cuYwo+ID4gaW5kZXggY2Y2
ZWYzOC4uNmY3MzBiNSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9oZGNwL2hkY3BfbXNnLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9oZGNwL2hkY3BfbXNnLmMKPiA+IEBAIC0xNzQsOSArMTc0LDcgQEAgc3RhdGljIGJvb2wg
aGRtaV8xNF9wcm9jZXNzX3RyYW5zYWN0aW9uKAo+ID4gICAgICAgICAgICAgICAgICAgICAgIGxp
bmstPmN0eCwKPiA+ICAgICAgICAgICAgICAgICAgICAgICBsaW5rLAo+ID4gICAgICAgICAgICAg
ICAgICAgICAgICZpMmNfY29tbWFuZCk7Cj4gPiAtCj4gPiAtICAgICBpZiAoYnVmZikKPiA+IC0g
ICAgICAgICAgICAga2ZyZWUoYnVmZik7Cj4gPiArICAgICBrZnJlZShidWZmKTsKPiA+Cj4gPiAg
ICAgICByZXR1cm4gcmVzdWx0Owo+ID4gIH0KPiA+Cj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
