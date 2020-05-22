Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 756261DF654
	for <lists+dri-devel@lfdr.de>; Sat, 23 May 2020 11:34:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E356D6E3F2;
	Sat, 23 May 2020 09:33:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA3586E071
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 15:35:55 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id q24so5133425pjd.1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 08:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=4wdCNXtLCBDuaQgxslwagJe+zzLi/KwEIVvOHthZ9FA=;
 b=lMXrNEnZwyFHCTIUYQCX/vQQbMMWXZZ1cgsUTzUbv0uzYASdpjz74Pvn9J2lNeo5qG
 n8lAmMitNLS3XU+Dvm7n5dtGv69ZcTeC3prNug0xuG6ziSY31i71mJd7Ikgx3pUTsmOE
 aDR6v3dcWaM+k1kSNXjFyFxEYOTaZlzHm/FlUjmv8RwxSpm9Z0GxEamdrL5S2TaHnPZV
 2oOHVWQ/IEc7Ah9PnMWAj631PZmWyoJP/B1Ykp3ZDLZiGymHyOtaitrAaJcWjCh3Scrw
 f5xN7OMP9j0DWiFn9znf2g82a+qzz2eS19HTz8NbqQOHj+PdxHsJVCH44w2XIs5R0+pl
 eUKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4wdCNXtLCBDuaQgxslwagJe+zzLi/KwEIVvOHthZ9FA=;
 b=HJOCrkyG+HiiseNQNMsE0s59DfJOctkDTIJfbFiqomN5yn+XxDlRiC2zTOFjd9wAX+
 p4BFZClWXTZs1hggig7gxddTcfHF34XWXDWI2THW7hFgaQJYPNGKo2J0IDSdS5WKgvfC
 +NONtbHYM1DivH/YYUaK0/vIazFd0WX++OURL7Yx6oeJslToiogSFHibQ+4eyNqs4Pj0
 m/22te9oMQ+gniwzIumtaObhlmRID/gBOZ0mH4L67Dbk37DeeNGjtGs3otU4dPzdXnhT
 SoqngnLnJzjAQHd0Fj4j0PaFswrvzAh9oOIa3gWAc3Ve9zOwdI7EHLdbLjFZniowp1Hi
 7ggw==
X-Gm-Message-State: AOAM533rLHnLzjev6wEGi4itg8nlCRWHMS8qK8wtIQVUJXeAfQJ/1OYt
 NvDdzYXzTf38ZDmON4Wy2mM=
X-Google-Smtp-Source: ABdhPJw+ak4OzmaMNaX8bIQxwr+3JWDXcjU/+4BS9DgGbPOeh4quf9fS3tuFSWoLUJ5CW0z30QIorg==
X-Received: by 2002:a17:90b:888:: with SMTP id
 bj8mr5154312pjb.148.1590161755506; 
 Fri, 22 May 2020 08:35:55 -0700 (PDT)
Received: from [10.230.188.43] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id t14sm6492463pju.42.2020.05.22.08.35.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 May 2020 08:35:54 -0700 (PDT)
Subject: Re: [PATCH v4 3/5] mtd: rawnand: brcmnand: rename page sizes
To: =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
 computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20200522072525.3919332-1-noltari@gmail.com>
 <20200522121524.4161539-1-noltari@gmail.com>
 <20200522121524.4161539-4-noltari@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <ccfca7bb-a0e7-aa4a-ef3c-a004708e9718@gmail.com>
Date: Fri, 22 May 2020 08:35:52 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200522121524.4161539-4-noltari@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Sat, 23 May 2020 09:33:36 +0000
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiA1LzIyLzIwMjAgNToxNSBBTSwgw4FsdmFybyBGZXJuw6FuZGV6IFJvamFzIHdyb3RlOgo+
IEN1cnJlbnQgcGFnZXMgc2l6ZXMgYXBwbHkgdG8gY29udHJvbGxlcnMgYWZ0ZXIgdjMuNAo+IAo+
IFNpZ25lZC1vZmYtYnk6IMOBbHZhcm8gRmVybsOhbmRleiBSb2phcyA8bm9sdGFyaUBnbWFpbC5j
b20+CgpBY2tlZC1ieTogRmxvcmlhbiBGYWluZWxsaSA8Zi5mYWluZWxsaUBnbWFpbC5jb20+Ci0t
IApGbG9yaWFuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
