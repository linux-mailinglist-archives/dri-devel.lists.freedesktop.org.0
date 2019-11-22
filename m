Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B874107741
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2019 19:24:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C9BF6F54E;
	Fri, 22 Nov 2019 18:24:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B35416F547;
 Fri, 22 Nov 2019 18:24:14 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id t1so9770558wrv.4;
 Fri, 22 Nov 2019 10:24:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EUebLe9HHF+JBDPm1PDOzLXkVPJUxFB6cAl/yRm/mOg=;
 b=JzKNI72k6SN3w9HgliDDzynaTEBVnZr8+tt2lg8U8jcCJ4+ZrMfGMICFXpMAPv9bhr
 kmzoylzmK2umdEi17DtbwLhaRD1k9FAvIEmfrk8B+RNem8yevlTlzov8d9HW8/h17QIX
 J4GMW0M8roXkaWq2B2oXS/VCcXDgY7CAXbl3A+o9jnBT2vwsU/PPv52MDSSwWvTYJOHB
 I0vd1paKxc+wRo9FnJj2B0CL2koUEeWXBGGeHJU9ehtD7BwQVTSFTQrwtvFI/U8Y2yMx
 ZmNSkYu6irQTOk4KdzIJPhZuZuwo613dv49v+Lasp/Xp1QOylfXGpkWQCqa8qsUnBDcD
 XG5A==
X-Gm-Message-State: APjAAAU24RHjV/2LNuS36Z7pVPBniHIkvyF/C+LYmvr/00N8qHvXYHuT
 JT4rRCP9Wu3nTavzIDYq32QC/BMPcss8cQ6ao50=
X-Google-Smtp-Source: APXvYqzX9fUGNo37XOhv8jBVKMnVD0YvB1dG4I8v4K3X02lHaSjhwjYsWxgzLxMQbwc8wnDLxckveiqk6h41Yu54vbM=
X-Received: by 2002:adf:9d87:: with SMTP id p7mr18982651wre.11.1574447053295; 
 Fri, 22 Nov 2019 10:24:13 -0800 (PST)
MIME-Version: 1.0
References: <1574394172-18216-1-git-send-email-zhengbin13@huawei.com>
In-Reply-To: <1574394172-18216-1-git-send-email-zhengbin13@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 22 Nov 2019 13:24:01 -0500
Message-ID: <CADnq5_NpbWYTG_1OzO7r6ioziQngQTKtQErsd5MWNjzRNFNKRA@mail.gmail.com>
Subject: Re: [PATCH 0/2] drm/amd: Use ARRAY_SIZE
To: zhengbin <zhengbin13@huawei.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=EUebLe9HHF+JBDPm1PDOzLXkVPJUxFB6cAl/yRm/mOg=;
 b=pJCRi8aqJv83LGeUettHYF73eSj6241WALue3yKd0tOGjLZoYs6Inpwmqgf1qjhAaW
 3KOCouv/R1eZW0l5Xj329X9pmBzWr39uPiyJogK2Cfnitbf/x9pt4fHMVG/LVLQbZ5Iq
 zK6F/3GIRHL7YYofaoAY/BaY75AtcUdzn0INgYMpWlYNHCHqNgRLks5nz1NRXZk0ZFFR
 MS/Mov0NYOCsihdzan/0skarO/sLXAtEBuGmrnzXoeSSscJCVu1C81z4UDTbR3ztGs2x
 Yg72DD9LD6k4o3njaChqmLQ05fVPqkufgujzyA+RQEzhJFaqOwlo2aJVtIvB793oWQz3
 XBjg==
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
Cc: Dave Airlie <airlied@linux.ie>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, "Quan, Evan" <evan.quan@amd.com>,
 Rex Zhu <rex.zhu@amd.com>, Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZCB0aGUgc2VyaWVzLiAgVGhhbmtzIQoKQWxleAoKT24gRnJpLCBOb3YgMjIsIDIwMTkg
YXQgNDowMSBBTSB6aGVuZ2JpbiA8emhlbmdiaW4xM0BodWF3ZWkuY29tPiB3cm90ZToKPgo+IHpo
ZW5nYmluICgyKToKPiAgIGRybS9hbWQvcG93ZXJwbGF5OiBVc2UgQVJSQVlfU0laRSBmb3Igc211
N19wcm9maWxpbmcKPiAgIGRybS9hbWRncHU6IFVzZSBBUlJBWV9TSVpFIGZvciBzb3Nfb2xkX3Zl
cnNpb25zCj4KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvcHNwX3YzXzEuYyAgICAgICAg
ICAgIHwgMiArLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci9zbXU3X2h3
bWdyLmMgfCAyICstCj4gIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQo+Cj4gLS0KPiAyLjcuNAo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
