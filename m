Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA9A1F137A
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jun 2020 09:21:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92AF06E486;
	Mon,  8 Jun 2020 07:21:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 233B96E237
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jun 2020 02:44:46 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id g62so10058671qtd.5
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Jun 2020 19:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=FPcz9YafDq1qtXpcZdMPyDLn3kmPXd/6a/ka09XlD6g=;
 b=DbxjgyYPgy+83sEuMM05Ktn+rvL5Sxf9DeHbRxI70b9NTCky2nkoxmnw8LMpSZRt0W
 IjRj5UPV2SfCKZAUXT4NdGo7BT0ivf7MaQA9st1D+6JZnlfWGjIKG/+D3znOsI+ki9x5
 3mUe05daFekaxRjD70QCHU66MwocIMKru9Ci8qG1HbRn4Cy5dJh1rGy1F8uBuETFB3ro
 OPA/KoHHoFjZOMMc7RLDZigkn6vx9i8StX+DbK/LF9wxj3uOlFBJPrC9ynVBSjwhibTR
 TH3CVhFBo10HWh/hzrBbkv3VAOqfbNHoUulbVW/0B+psz+JBIhbYO3FmgHP1VETJOe0N
 G5sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=FPcz9YafDq1qtXpcZdMPyDLn3kmPXd/6a/ka09XlD6g=;
 b=neEPkrdfVlSqDFCLit+C5Go2Sp2F4+r4W0Ea49P1z3B9X0dRK1MbU+ZXGpzi02m7nv
 45qxfFTWSw2o04NgktRP+inLjV5VmjxoKDxpKZi743GYonTah7wkGm3V5RzrxGbyAUDG
 pyGua9OEseOdr3/YsVXtY0e392lMESHfktjzdKapLKWxORLWEnRULMcHdf4CX34tUKTd
 tHPALGKvzxPswq3vNJI/XowR0c8ocJfKqI8NNXJTiZ6YVJi/tYhbV+46WE9/G4FiM1/V
 gB1cY2VmIGKaz6vJI5V/XzTXdtFgVrnCsCLbCVPLoOLAoaJSwX5vSidJtjlc20gyjcW+
 OBtQ==
X-Gm-Message-State: AOAM5312UzteQnyJdzxBWMYDALUGcycfFEzqgRllX5dzGXHQt+9V6XHg
 FC9b083N4rWt1AKhe6gBrdZU+A==
X-Google-Smtp-Source: ABdhPJzOnZMvbGJtixH027fSNPWPdCNG4SDNPkiojoKUt328YLGmo8Pyvi+u4Qv8XubOIu8igVkRGA==
X-Received: by 2002:ac8:4c8d:: with SMTP id j13mr21871617qtv.38.1591584285211; 
 Sun, 07 Jun 2020 19:44:45 -0700 (PDT)
Received: from [192.168.1.183] (pool-71-184-117-43.bstnma.fios.verizon.net.
 [71.184.117.43])
 by smtp.gmail.com with ESMTPSA id v189sm5973771qkb.64.2020.06.07.19.44.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Jun 2020 19:44:44 -0700 (PDT)
From: Qian Cai <cai@lca.pw>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] drm/rcar-du: DRM_RCAR_WRITEBACK depends on DRM
Date: Sun, 7 Jun 2020 22:44:43 -0400
Message-Id: <4E18C3DC-D418-4DEB-AC70-4FB6FCFDB5BD@lca.pw>
References: <20200608020207.GL22208@pendragon.ideasonboard.com>
In-Reply-To: <20200608020207.GL22208@pendragon.ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailer: iPhone Mail (17F80)
X-Mailman-Approved-At: Mon, 08 Jun 2020 07:21:26 +0000
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 kieran.bingham+renesas@ideasonboard.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cgo+IE9uIEp1biA3LCAyMDIwLCBhdCAxMDowMiBQTSwgTGF1cmVudCBQaW5jaGFydCA8bGF1cmVu
dC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPiB3cm90ZToKPiAKPiBIb3cgYWJvdXQgZGVwZW5k
aW5nIG9uIERSTV9SQ0FSX0RVIGluc3RlYWQsIGFzIERSTV9SQ0FSX1dSSVRFQkFDSyBpcwo+IHVz
ZWQgdG8gc2VsZWN0IGNvbXBpbGF0aW9uIG9mIHJjYXJfZHVfd3JpdGViYWNrLmMgdGhhdCBpcyBw
YXJ0IG9mIHRoZQo+IHJjYXItZHUgZHJpdmVyID8KClN1cmUuIEnigJlsbCBzZW5kIGEgdjIuCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
