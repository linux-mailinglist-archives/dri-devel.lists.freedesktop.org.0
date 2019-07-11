Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF5366758
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2019 09:01:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BEEF6E2D5;
	Fri, 12 Jul 2019 07:00:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A4CD6E162
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2019 16:42:45 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id i18so3197039pgl.11
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2019 09:42:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=18XBM/Uxq1n8M6vF5U0L1qdSxRCs/oAYuJM9KehE1vY=;
 b=b0il8J0BFvGfDGpB890MUqBgURlsemX48YA/FkbDCABguv0WercYxUvzrwq7uG856W
 LeqjolUrX+e9zX+J1Ht4Wx3aDuiVMN9wFM8nQJEtYvsXFxoRmZQOv61npSwhXGFRyjQ5
 CmszwWgEx1iqwRi0MrXBEIkkfOxMR+144LFFW+bB1kxjH2XL4ora7AwDhC3+YiYzSiEh
 I7RmNBUs6cJ5g2ZCHqj6y/XKG71RYYqgFyPEY9r3mNOCEEQBkhOdpazkQCc4cNHqJm6E
 KBg5ft+n5wQaVCm0Q3pyaVBANyJsvz306eMB6xaBuvf7vDNHOl5SjUEPWnghfyY5Uidd
 Km4w==
X-Gm-Message-State: APjAAAWaQQTm7m6lm++xBKq1im1bnINi3U3RIQv+2Nk87mu6Fk99MJmv
 /pSxlEmhCd2hqpSLWkgcsLKH3Wa47WY=
X-Google-Smtp-Source: APXvYqwVsFsXq2rVTXBYSQQYx/k0XvZbO/pX70yjpkzK17qL7aRhtOd1lp6eZ7oTP7Mfl7gpZQsU0Q==
X-Received: by 2002:a17:90a:35e5:: with SMTP id
 r92mr6039610pjb.34.1562863364249; 
 Thu, 11 Jul 2019 09:42:44 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id e5sm8999607pfd.56.2019.07.11.09.42.42
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 11 Jul 2019 09:42:43 -0700 (PDT)
Date: Thu, 11 Jul 2019 09:43:53 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: use dev name for debugfs
Message-ID: <20190711164353.GS7234@tuxbook-pro>
References: <20190706203105.7810-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190706203105.7810-1-robdclark@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Approved-At: Fri, 12 Jul 2019 07:00:44 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=18XBM/Uxq1n8M6vF5U0L1qdSxRCs/oAYuJM9KehE1vY=;
 b=WyJV15NvacCmw+Xd8p6fSr2QmTKFTkIPgRPTnZFpABHqBbr/ObqoSn/va4KydoVGts
 A04oaT1qsZEhIYSmx6gk8/9H6VN5YZvuqoqlDhS4VXRn7ok6tU6TutCcOb0oSSLs09uU
 f5OMuRdn2KtEku2O4akOsSASylLhEmfT6fyMt+0WzJxeKqys4FuZxcnahZEuxCMr5Osp
 bkg7YBrKoNyHq5+uvEiN1NnoU8Q1YgvPlIbkD3ya8VAkrJ1i438gvKPwbsvFVFkSR+nU
 Tfs9s0bfWyQm/Mx5WL1LYqgQzvhYCd21W6/XY/8ARYh025bJ9gU7MSe3nfVGeYrKIDcx
 X6Eg==
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0IDA2IEp1bCAxMzozMSBQRFQgMjAxOSwgUm9iIENsYXJrIHdyb3RlOgoKPiBGcm9tOiBS
b2IgQ2xhcmsgPHJvYmRjbGFya0BjaHJvbWl1bS5vcmc+Cj4gCj4gVGhpcyBzaG91bGQgYmUgbW9y
ZSBmdXR1cmUtcHJvb2YgaWYgd2UgZXZlciBlbmNvdW50ZXIgYSBkZXZpY2Ugd2l0aCB0d28KPiBv
ZiB0aGVzZSBicmlkZ2VzLgo+IAo+IFN1Z2dlc3RlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1
cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFJvYiBDbGFy
ayA8cm9iZGNsYXJrQGNocm9taXVtLm9yZz4KClJldmlld2VkLWJ5OiBCam9ybiBBbmRlcnNzb24g
PGJqb3JuLmFuZGVyc3NvbkBsaW5hcm8ub3JnPgoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS90aS1zbjY1ZHNpODYuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvdGktc242NWRzaTg2LmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXNuNjVkc2k4Ni5j
Cj4gaW5kZXggYzhmYjQ1ZTdiMDZkLi45ZjRmZjg4ZDRhMTAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS90aS1zbjY1ZHNpODYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9i
cmlkZ2UvdGktc242NWRzaTg2LmMKPiBAQCAtMjA0LDcgKzIwNCw3IEBAIERFRklORV9TSE9XX0FU
VFJJQlVURShzdGF0dXMpOwo+ICAKPiAgc3RhdGljIHZvaWQgdGlfc25fZGVidWdmc19pbml0KHN0
cnVjdCB0aV9zbl9icmlkZ2UgKnBkYXRhKQo+ICB7Cj4gLQlwZGF0YS0+ZGVidWdmcyA9IGRlYnVn
ZnNfY3JlYXRlX2RpcigidGlfc242NWRzaTg2IiwgTlVMTCk7Cj4gKwlwZGF0YS0+ZGVidWdmcyA9
IGRlYnVnZnNfY3JlYXRlX2RpcihkZXZfbmFtZShwZGF0YS0+ZGV2KSwgTlVMTCk7Cj4gIAo+ICAJ
ZGVidWdmc19jcmVhdGVfZmlsZSgic3RhdHVzIiwgMDYwMCwgcGRhdGEtPmRlYnVnZnMsIHBkYXRh
LAo+ICAJCQkmc3RhdHVzX2ZvcHMpOwo+IC0tIAo+IDIuMjAuMQo+IApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
