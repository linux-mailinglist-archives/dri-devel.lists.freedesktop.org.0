Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 093488DBFD
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 19:35:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5489E6E7A0;
	Wed, 14 Aug 2019 17:35:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 316626E7A0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 17:35:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 2E6703FC2F;
 Wed, 14 Aug 2019 19:35:51 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qo-7viajMQUS; Wed, 14 Aug 2019 19:35:50 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 9A37B3FA96;
 Wed, 14 Aug 2019 19:35:49 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 18B6D3601BA;
 Wed, 14 Aug 2019 19:35:49 +0200 (CEST)
Subject: Re: [git pull] vmwgfx-next
To: airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org
References: <20190814073152.3120-1-thomas@shipmail.org>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas@shipmail.org>
Organization: VMware Inc.
Message-ID: <7c51e197-c80a-136c-c893-2db8c96c0904@shipmail.org>
Date: Wed, 14 Aug 2019 19:35:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190814073152.3120-1-thomas@shipmail.org>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1565804149; bh=EQuN1L7ortvOv3+mr8iq8VWzu4Vy2RAmcIjFX8SQISQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=lnbxV4yp1aX9cQMXaUY+ZqBBJ53WwKzSPgTZW5J8Tuyv4YYtk42TmxxFtG8+++Rb8
 WHkRRTukb9yQi8pJjEXO3aApSoB4aSn376nD0iJeIjkHsvYWF0f8ecwrIs/05C+PvJ
 renPU2SBiwhQFcRU9SWPxQRKugOsHB/+oVQGg0qI=
X-Mailman-Original-Authentication-Results: pio-pvt-msa2.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=lnbxV4yp; 
 dkim-atps=neutral
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
Cc: pv-drivers@vmware.com, linux-graphics-maintainer@vmware.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOC8xNC8xOSA5OjMxIEFNLCBUaG9tYXMgSGVsbHN0csO2bSAoVk13YXJlKSB3cm90ZToKPiBG
cm9tOiBUaG9tYXMgSGVsbHN0cm9tIChWTXdhcmUpIDx0aG9tYXNAc2hpcG1haWwub3JnPgo+Cj4g
RGF2ZSwgRGFuaWVsCj4KPiBBIGNvdXBsZSBvZiBpbmRlcGVuZGVudCBwYXRjaGVzIGV4dHJhY3Rl
ZCBmcm9tIHRoZSA1LjMgcHVsbCByZXF1ZXN0LCBmaXhlZCBmb3IKPiBtZXJnZSBjb25mbGljdHMu
Cj4KSG1tLiBKdXN0IG5vdGVkIGFuIHVudXNlZCB2YXJpYWJsZSByZXN1bHRpbmcgZnJvbSBvbmUg
b2YgdGhlIGNvbW1pdHMuIApQbGVhc2UgaWdub3JlIHRoaXMgZm9yIG5vdywgYW5kIEknbGwgZG8g
YSBxdWljayByZXNwaW4uCgovVGhvbWFzCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
