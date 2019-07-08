Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 193EF6292B
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 21:18:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DAC489E01;
	Mon,  8 Jul 2019 19:18:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF0A089E01
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 19:18:28 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id p13so18340349wru.10
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2019 12:18:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=nGrlk2FAgU3HWolhTzDQM00gUCgdS+kg6qPh/J+0Qa0=;
 b=ZTKeETC02FDc/LnSDdn1gg2f9BGZFrZ8ZkDM5Kms6vrf0Pxn/icxcRKe3t29Cvurgr
 kOrt0JKe/8N8PIt4kGfZCIi84u2fNPrNLIQ+yi/0xUmOMwBCtsgCrKwbDzLZYQOxqZJg
 UaJ6/FL+W5rpfL/PkSx82FtHMgNp6osxqcXYd7J2qTbNwEtYcmDFkCdwOwjUtJwxerli
 Ki229/2GXt0nxeIJ0xU1TMRtGmSShR1vG8vAm3OdWAg+CoAStrclN2FMhD5PyjsYVbam
 zcbgknapm2YeWm92zEIG6V5Ff+0PdP2Wfk4VMSWKZGsBaQ9xKYONtcr7XhP6a3d2dCc0
 NZbw==
X-Gm-Message-State: APjAAAWJ8qshD2b5wKFeVpv0OC7P1luxf6i99+ym/4mRg24YLdUJVhSi
 4M+dZKZ4ffIoALm/ByPLEuVjrCy/s7w=
X-Google-Smtp-Source: APXvYqx42uW/uNvFMwSpIkF1MZvS1AZNqBzgkrbBQKRJlA7X/La3B0NAXqt5VJnaMt3eHjlG1R7FqQ==
X-Received: by 2002:a5d:4602:: with SMTP id t2mr19971533wrq.38.1562613507513; 
 Mon, 08 Jul 2019 12:18:27 -0700 (PDT)
Received: from localhost (108.78.124.78.rev.sfr.net. [78.124.78.108])
 by smtp.gmail.com with ESMTPSA id c12sm15315428wrd.21.2019.07.08.12.18.26
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 08 Jul 2019 12:18:26 -0700 (PDT)
Date: Mon, 8 Jul 2019 19:17:38 +0000
From: sylvain.bertrand@gmail.com
To: bugzilla-daemon@freedesktop.org
Subject: Re: [Bug 111082] Severe stutter in CS:GO surf servers, despite ~300fps
Message-ID: <20190708191738.GA12350@freedom>
References: <bug-111082-502@http.bugs.freedesktop.org/>
 <bug-111082-502-eKAF2WrvWP@http.bugs.freedesktop.org/>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bug-111082-502-eKAF2WrvWP@http.bugs.freedesktop.org/>
User-Agent: Mutt/ (2018-04-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=nGrlk2FAgU3HWolhTzDQM00gUCgdS+kg6qPh/J+0Qa0=;
 b=tbBeGTM/nlMoeJysFGRaKonBgAEOWoy/awKmd9ALdIYHCA9mZ+euoDwr/oZqvW6tff
 tWMMWtd51LpzKADQGvAzJEKMNhrbE3BC4uVwUjBIjoRC8ByVjLZQEsG3KjocqqH2fZYt
 whyRNboAgrg5Gxzqu9ujzN0t7dhfaxruSiHAqpx4gmPG8bqOKgN2s2iHRd444q5H/ZNw
 pktijAeHaBY2Vj3rk+dzVnoUiX/ByePKcJoWBYto8CCHYVXwhK6RB5bVSYtC8OR8ymNQ
 Cm/N2600WQis2ASDTollFif54Gl+Vr/7S2vKG5Il/eUzMnTVHmI5aIzRsYBUvWHe1dT0
 QJ4g==
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBNeSBDUFUgbG9hZCBpcyBhbHNvIHN1cGVyIGxvdyBhbmQgbmV2ZXIgYWJvdmUgNTAgJSBvbiBh
IHNpbmdsZQo+IGNvcmUuCgpUaGlzIGlzIHRoZSBpc3N1ZTogbG9va3MgbGlrZSBjcHUgY2FwcGlu
ZyBpbiB0aGUgM2QgZW5naW5lLgpCdXQsIHNpbmNlIGNzZ28gM2QgZW5naW5lIGlzIGRpcmVjdDNk
IGRlc2lnbmVkLCB0aGlzIGlzIHdoeSB2dWxrYW4uCgpsaW51eCBjc2dvIGRldnMgYXJlIHRoZSBv
bmVzIHdobyBjYW4gcHJvZmlsZSBwcm9wZXJseSB0aGVpciBnYW1lIGFuZCBmaWd1cmUgb3V0CnRo
ZSBjdWxwcml0LgooY291bGQgYmUgbGludXggbmV0d29ya2luZyByZWxhdGVkIHRvbykuCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
