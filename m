Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CA4265618
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 02:38:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 864626E279;
	Fri, 11 Sep 2020 00:38:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C3A26E279
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Sep 2020 00:38:03 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id 67so5303604pgd.12
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 17:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=tqqRVNrzf1AQcqrs6J04avCqKmk3OWyRsBZ/DhleQgc=;
 b=C2T7WqzNaX8KxuX40ALkhOOjSlu1MtQcpgYMZsaaje2tU3v2vSQo4HggCe8sgl+/Dk
 toPr2AJbcLQq+uv4CvdJRHuEli9uUg+qJGF3mOJNw56YvfzfZyrtDnoOQ8uhofCw/AF7
 DLfLv/AaZYmzGyzALyXqobyWOxPxTgE+R7YPdCY1Obl/l33zizXeYmAnIpSpiYmfqmXf
 bbrJ37cKuofe8fQENI8Nrc6U5UG18Iotz+mtOsK4TTi0cZU0zRh9ex/ZNhfhHy06OmAB
 opQntd32KPezscGfSm7ThESO1D72CjWAfbdxq8AC7nPJGhH1lbF/VEdQMb0PIMWYU7cA
 7WWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=tqqRVNrzf1AQcqrs6J04avCqKmk3OWyRsBZ/DhleQgc=;
 b=RlDqW64d8A40CssPDEvz/LvlquKTksRFBDBBEMTv/IiKIR49is8VNziwmFo8/aKZ0O
 ryYBOc+B4YWsoWnUyuKDanjzAHvJU7kdW/xzL2lkMPCgBnXRdnLbF1uAsr32YOK5BCsy
 j2KUiow0vTZDB40hMCct6GAh4V4iVaUEbCE2KoDv+mYOHnutw0J2CnVWZK53LPaKHL/Y
 jIeIbxmeZxNERhYvlb/Sj3RBkhQOsp3KZMUJdI7zp6YyHTmZxFmYHGGG4YCBplB9HXir
 KNSp0fgJHt9o9d6zkqkadHWGHrvSOas1S6Hn6Pz4aerwbcsqOOjg6QArP9JkWfBVbOS9
 65Lw==
X-Gm-Message-State: AOAM531plVkSljhMOKS/rHVwoQPagxaogIOO0HQC3zhUZx+A0COfLDnX
 +L/tlryWRIc4hL/2Wamxytk=
X-Google-Smtp-Source: ABdhPJy6Z0AIYbNVnQgBhvQCxX+DrkSJeYFGNTFtQVALuwFwIJoZHOy9YvPJ9w5iRKjL/6jii69NHw==
X-Received: by 2002:a17:902:8c91:b029:d1:9be4:7fe6 with SMTP id
 t17-20020a1709028c91b02900d19be47fe6mr1087815plo.33.1599784682732; 
 Thu, 10 Sep 2020 17:38:02 -0700 (PDT)
Received: from arch ([2601:600:827f:1330:b9f9:b38f:2295:b49c])
 by smtp.gmail.com with ESMTPSA id q24sm245462pfs.206.2020.09.10.17.38.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 17:38:01 -0700 (PDT)
Message-ID: <121f5f8df1e56294ade98f08a943b9fbb514c5e0.camel@gmail.com>
Subject: Re: [RFC PATCH 1/2] drm/hyperv: Add DRM driver for hyperv synthetic
 video  device
From: Deepak Rawat <drawat.floss@gmail.com>
To: "Tang, Shaofeng" <shaofeng.tang@intel.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Date: Thu, 10 Sep 2020 17:38:00 -0700
In-Reply-To: <SN6PR11MB2558D831991447B9B5C8E646E2270@SN6PR11MB2558.namprd11.prod.outlook.com>
References: <SN6PR11MB2558D831991447B9B5C8E646E2270@SN6PR11MB2558.namprd11.prod.outlook.com>
User-Agent: Evolution 3.36.5 
MIME-Version: 1.0
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
Cc: "Huang, Yuanjun" <yuanjun.huang@intel.com>, "Jiang,
 Fei" <fei.jiang@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIwLTA5LTEwIGF0IDA4OjE5ICswMDAwLCBUYW5nLCBTaGFvZmVuZyB3cm90ZToK
PiBIaSBEZWVwYWssCj4gIAo+IERvIHlvdSBoYXZlIGEgbmV3IHZlcnNpb24gb2YgdGhpcyBwYXRj
aCBub3c/Cj4gSSB0YWtlIGEgdHJ5IHdpdGggaXQuIGFuZCBtZWV0IHNvbWUgdHlwbyBhbmQg4oCc
aW5jb21wYXRpYmxlIHBvaW50ZXLigJ0KPiBlcnJvci4KPiBJZiB5b3UgaGF2ZSBhIG5ldyB2ZXJz
aW9uLCBjb3VsZCB5b3Ugc2hhcmUgaXQgd2l0aCB1cz8KPiAKCkhpIFNoYW9mZW5nLAoKSXQgc2Vl
bXMgeW91IGFyZSBydW5uaW5nIHRoaXMgd2l0aCBnZW4gMiBWTSwgSSBoYXZlIGEgcGF0Y2ggdG8g
c3VwcG9ydApnZW4gMiBWTSdzIGF0IGh0dHBzOi8vZ2l0aHViLmNvbS9kZWVwYWstcmF3YXQvbGlu
dXguZ2l0IGJyYW5jaCBoeXBlcnZfdAppbnkuCgpJZiB5b3Ugc3RpbGwgcnVuIGludG8gZXJyb3Ig
YWZ0ZXIgYXBwbHlpbmcgZ2VuMiBwYXRjaCwgZmVlbCBmcmVlIHRvCnJlYWNoIG91dCB3aXRoIGRl
dGFpbHMuCgpEZWVwYWsKCj4gIAo+IEJSLCBTaGFvZmVuZwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
