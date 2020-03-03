Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A401775B3
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 13:10:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 545166E857;
	Tue,  3 Mar 2020 12:10:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9E2B6E857
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 12:10:38 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id w27so2555655lfc.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2020 04:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tpW45cO33S156IygtSe96y37D0Wq/TrExTXU9M79KQw=;
 b=HsXwAeW+I6atxUcxrtYQPCaCVFiiY8z4qFwcLkwRxBM0Z59xZUZXBekkb1a3m9f6QL
 /dfJZvmmbAqucwx5E1PVQSXDhT4+ZCIrB4ynEtJ4y1lV1Rq8gTnX/jBYKQGr9LXoWoSZ
 lMnIfKT4SHf88l8rwqcBe14V1VTMrw7hcxe0IE6ltSqFvfHqiBBlxXx88hHSPDgBuRJW
 yke/KGaLrhCEb85vNinOiWhCSQQZbvZuTIftEotNSBDWTyIDHs/JNgnlmyxZK626Jy5n
 M4694yuKGXDOvi7UhAFJ3FYq/aMLEmKNkt9XUDIoZ4kk99DIoS57l+jsrGi5AOOndbKG
 u9PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tpW45cO33S156IygtSe96y37D0Wq/TrExTXU9M79KQw=;
 b=uFiJBRUrCcDNFFUViX5/f7sHZ6jH1l2lDR89ZygQXEMO9nysBu9X2/vD9k+Fke2K0F
 a189XLjYRmA+on9+7OqC3c0QSd/Xv4NI7jTNroAPdYiEwmmILTE44s+EUpy2VKh9g0B5
 zND5omCOs76wNqdN3SvoKaimaYjlmJyrfsuSo8NGrhaJjlZHpHrGAc585rhAus6A2hxR
 zfJsV+M2JptsP41wgnzLbw2vu+sW7PG7WoteousVQhVgSaXQ27BwNXieTxeOIN2cTHw3
 El5HHksGMqdq0M/2n0eTjCUo8uxgzNT3MdPuZRC5zlRdHJTHBb0ypzJj60Q4UKxVlYt+
 uplQ==
X-Gm-Message-State: ANhLgQ3STMX3Ny8oeXsLa/aZ6FExSsQ0Gy5kJiOJO0bQ6la5fUt4plg3
 McmsruelSz+hVmzKOBtCHT7Ravm5SSZKK3KmrFfvIjSj
X-Google-Smtp-Source: ADFU+vurE2joVEB6nxvxq5lBYDg2VksM2aqEGU6fC97dnbufpHJZbXr7xBOUI+rOBzi3NjrVJp5/06lg5fItAP2Exn8=
X-Received: by 2002:ac2:4c84:: with SMTP id d4mr2679030lfl.89.1583237437285;
 Tue, 03 Mar 2020 04:10:37 -0800 (PST)
MIME-Version: 1.0
References: <20200302203452.17977-1-ville.syrjala@linux.intel.com>
 <20200302203452.17977-3-ville.syrjala@linux.intel.com>
In-Reply-To: <20200302203452.17977-3-ville.syrjala@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 3 Mar 2020 13:10:26 +0100
Message-ID: <CACRpkdbXrtQ65jgkWNoNQPiZy3sV-xtVGhu-=Kz-Ch5Zz9gmPA@mail.gmail.com>
Subject: Re: [PATCH 02/33] drm/panel-arm-versatile: Fix dotclock
To: Ville Syrjala <ville.syrjala@linux.intel.com>
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
Cc: "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXIgMiwgMjAyMCBhdCA5OjM1IFBNIFZpbGxlIFN5cmphbGEKPHZpbGxlLnN5cmph
bGFAbGludXguaW50ZWwuY29tPiB3cm90ZToKCj4gRnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxs
ZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPgo+IFRoZSBjdXJyZW50bHkgbGlzdGVkIGRvdGNs
b2NrcyBkaXNhZ3JlZSB3aXRoIHRoZSBjdXJyZW50bHkKPiBsaXN0ZWQgdnJlZnJlc2ggcmF0ZXMu
IENoYW5nZSB0aGUgZG90Y2xvY2tzIHRvIG1hdGNoIHRoZSB2cmVmcmVzaC4KPgo+IFNvbWVvbmUg
dGVsbCBtZSB3aGljaCAoaWYgZWl0aGVyKSBvZiB0aGUgZG90Y2xvY2sgb3IgdnJlcmVzaCBpcwo+
IGNvcnJlY3Q/CgpJIGFjdHVhbGx5IGFuc3dlcmVkIHRoaXMgaW4gdGhlIG1haWwgdGhyZWFkIHdo
ZXJlIHJlZnJlc2ggd2FzCmRlbGV0ZWQ6CgpUaGVzZSBkb3RjbG9ja3MgYXJlIGNvcnJlY3QuIERl
bGV0ZSB0aGUgaW5jb3JyZWN0IHZyZWZyZXNoIGluc3RlYWQuCgpTbyBwbGVhc2UgZHJvcCB0aGlz
IHBhdGNoLgoKVGhhbmtzLApMaW51cyBXYWxsZWlqCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
