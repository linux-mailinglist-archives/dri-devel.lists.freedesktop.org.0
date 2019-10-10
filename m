Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62627D2BA4
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 15:45:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4218A6E277;
	Thu, 10 Oct 2019 13:45:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EBBF6E277
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 13:45:49 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id v38so5509615edm.7
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 06:45:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=m/eFFXn0vur3dPmxW/iwC62E4sqoVqpwELmzMg990o4=;
 b=k/ZoVnonaG96A66Cpo8cEO36paxeKjsa/2O82G8q3Vlk9tBG+zxPjabOphZEYWSFI1
 COu7gg42kkCvevXayA6XQGSkA8EeT28HV2xpvFFs4NU3QVxOWgmUTc5p64y4h5SzhEgi
 Rp2JYTxTqIgueDYwAm63pxDiHKCA7EpOREZP2Uim5YQc71mQ3mm4LNUdENL9HtLbkL0K
 f3Yi7Pl2X0+Sz/VJUTOBoyPAqakZEeAqdjyPaShi1X7hPjYNpMQUblw+YmkqJuXqq35P
 1kaX7XyGkcTPyzkiBrDt4xudCMLZNpRNvvQFCHQ0QsBeGCb2MOtH7WALg6VpT4U0d3po
 9lXg==
X-Gm-Message-State: APjAAAWeGI0h8hd2PGqyVm5APLO5ekjzArB01zJJpzXXiE1KH1S1Dnjy
 yOFWYogxa3b89CRbpHDslOV5Ug==
X-Google-Smtp-Source: APXvYqyuWp2Bw2sOuzsNu3Opsr6/6mUt7Z18v3AUK3CH32gupRxBQK38MTAyggaQcsUO8idYoi/bvQ==
X-Received: by 2002:a17:906:6d89:: with SMTP id
 h9mr7954865ejt.169.1570715148116; 
 Thu, 10 Oct 2019 06:45:48 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id q2sm923864edh.41.2019.10.10.06.45.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 06:45:47 -0700 (PDT)
Date: Thu, 10 Oct 2019 15:45:45 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: YueHaibing <yuehaibing@huawei.com>
Subject: Re: [PATCH -next] drm/vkms: Remove duplicated include from vkms_drv.c
Message-ID: <20191010134545.GZ16989@phenom.ffwll.local>
Mail-Followup-To: YueHaibing <yuehaibing@huawei.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20191010115213.115706-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191010115213.115706-1-yuehaibing@huawei.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=m/eFFXn0vur3dPmxW/iwC62E4sqoVqpwELmzMg990o4=;
 b=SzGg1Snpvro/ax8XbsReNLXCcQ7xMcVrZVaTG+BtPXx0xM09HqnNEaPaf187SrkLA5
 1tCRCyg04PdbAjuHlRlEdiQ9FdDWRXihCtDYZCKcOiocErL1waORxcIx+qP0wjlWt0x9
 JdgBsOo3wevXUV/HA2mxbAtugYD/3OGXFhWRk=
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMTAsIDIwMTkgYXQgMTE6NTI6MTNBTSArMDAwMCwgWXVlSGFpYmluZyB3cm90
ZToKPiBSZW1vdmUgZHVwbGljYXRlZCBpbmNsdWRlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFl1ZUhh
aWJpbmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNvbT4KCkFwcGxpZWQsIHRoYW5rcy4KLURhbmllbAoK
PiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19kcnYuYyB8IDEgLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
dmttcy92a21zX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19kcnYuYwo+IGluZGV4
IDU0NzAzNDYzZDk2Ni4uZDFmZTE0NGFhMjg5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS92a21zL3ZrbXNfZHJ2LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdmttcy92a21zX2Rydi5j
Cj4gQEAgLTE5LDcgKzE5LDYgQEAKPiAgI2luY2x1ZGUgPGRybS9kcm1fZHJ2Lmg+Cj4gICNpbmNs
dWRlIDxkcm0vZHJtX2ZiX2hlbHBlci5oPgo+ICAjaW5jbHVkZSA8ZHJtL2RybV9maWxlLmg+Cj4g
LSNpbmNsdWRlIDxkcm0vZHJtX2dlbS5oPgo+ICAjaW5jbHVkZSA8ZHJtL2RybV9nZW1fZnJhbWVi
dWZmZXJfaGVscGVyLmg+Cj4gICNpbmNsdWRlIDxkcm0vZHJtX2lvY3RsLmg+Cj4gICNpbmNsdWRl
IDxkcm0vZHJtX3Byb2JlX2hlbHBlci5oPgo+IAo+IAo+IAo+IAo+IAoKLS0gCkRhbmllbCBWZXR0
ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xs
LmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
