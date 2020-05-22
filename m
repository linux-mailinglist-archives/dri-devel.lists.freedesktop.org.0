Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C7C1DF648
	for <lists+dri-devel@lfdr.de>; Sat, 23 May 2020 11:33:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A280E6E17F;
	Sat, 23 May 2020 09:33:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64F0C6E071
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 15:35:13 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id x11so3539379plv.9
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 08:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=RCkeT00nFyzOKJ0+m+uJ8VynyJ/HzcwB7W5G+s1+HFQ=;
 b=ZyEjGjfVAGpMkGbpvjctw5r6a+y42f6pLVMkAR72nfmVYJWKuLh9Z9LOMiH8gnDaL6
 vfE3cs/dkHcHuHUL7HhadRpLiMHYAz6xRAZVohzb46Wq+PQZICAHpROFPW9MedDUYlqe
 DoDszFn5FVXfwcy0P60SvL3sVk61wulHHvdQ87w02n7mMLbGp8A4P9jRO0LYggtJ5OHN
 mfyGrRdc0IgkDTNjQBk2tZyXon/78PsAAYmpkCxfVpRxUkAAixffymW9Lp+ukAt6J9ny
 HxX+MnhgpXk2o1cN3IJTdbKxof8S7FqiQtKs6sThQVgSfvNM0lZ92FsI6ztavkl3Oz98
 n/zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RCkeT00nFyzOKJ0+m+uJ8VynyJ/HzcwB7W5G+s1+HFQ=;
 b=gTxH5k/dPjaNTBOOMYaIYY6fjgaiA2QCeCHPe/GBwHYIDg0briK6HHuKaqTSeOwx0y
 xrmlNa20lsrJIYs2Oxm/D0b2cs3/REcyRu0/gdmTrYIuxi/eiOS1vDRWwqeUQ6pFqaxk
 5Tc6/prLu1kDX0t7LlewFIVORw9sw18KD7HR+8Uuyi6ovqvalDKBgE48+x4Dzbv8ODWF
 mKfoXqOT8EzhX1QsmMPyMc3otk3uV0ytu06s+MhPS8W0LbjNobvn5DZyOm3Kok+/rs8p
 w6mfDqwDgJbYy6YSrPYVdLFO981Nn86Nwli84xhV2XVg/4dFDK3yqCz9GUA6a5gmDp2p
 52gg==
X-Gm-Message-State: AOAM533nMjSdssR00z8s6plxqwhs7uL55fsZgIkJbZPkYwL2NsmaiONW
 wK/00oaxtt0nY7ZKP8yIkwA=
X-Google-Smtp-Source: ABdhPJyVE7XYQOeWFksysNTqtqAThQuG7jrq6k2DORMDvAlzLJ9FncCFOTiP2lUa+Gfqd6KeUeL6aQ==
X-Received: by 2002:a17:902:868d:: with SMTP id
 g13mr14962098plo.246.1590161712982; 
 Fri, 22 May 2020 08:35:12 -0700 (PDT)
Received: from [10.230.188.43] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id g27sm7545812pfr.51.2020.05.22.08.35.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 May 2020 08:35:12 -0700 (PDT)
Subject: Re: [PATCH v4 2/5] mtd: rawnand: brcmnand: fix CS0 layout
To: =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
 computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20200522072525.3919332-1-noltari@gmail.com>
 <20200522121524.4161539-1-noltari@gmail.com>
 <20200522121524.4161539-3-noltari@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <346c2834-3ed6-4813-7f32-d2dc8bbc4885@gmail.com>
Date: Fri, 22 May 2020 08:35:10 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200522121524.4161539-3-noltari@gmail.com>
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
IE9ubHkgdjMuMy12NS4wIGhhdmUgYSBkaWZmZXJlbnQgQ1MwIGxheW91dC4KPiBDb250cm9sbGVy
cyBiZWZvcmUgdjMuMyB1c2UgdGhlIHNhbWUgbGF5b3V0IGZvciBldmVyeSBDUy4KPiAKPiBGaXhl
czogMjdjNWIxN2NkMWIxICgibXRkOiBuYW5kOiBhZGQgTkFORCBkcml2ZXIgImxpYnJhcnkiIGZv
ciBCcm9hZGNvbSBTVEIgTkFORCBjb250cm9sbGVyIikKPiBTaWduZWQtb2ZmLWJ5OiDDgWx2YXJv
IEZlcm7DoW5kZXogUm9qYXMgPG5vbHRhcmlAZ21haWwuY29tPgoKQWNrZWQtYnk6IEZsb3JpYW4g
RmFpbmVsbGkgPGYuZmFpbmVsbGlAZ21haWwuY29tPgotLSAKRmxvcmlhbgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
