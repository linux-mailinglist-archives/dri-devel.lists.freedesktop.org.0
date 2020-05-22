Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E64EB1DF658
	for <lists+dri-devel@lfdr.de>; Sat, 23 May 2020 11:34:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C5AA6E91B;
	Sat, 23 May 2020 09:33:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A38F06E0CD
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 15:37:58 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id s10so5171876pgm.0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 08:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=+fdIAJRjmy/rRR+RCbZVMEUtca3wMVBf5rN50QMs3So=;
 b=of6/20nR4qUZHgnavujGqmJRI1sCVIF8UQic9SqHgWtJ6xKMPVtzRsFzCtVpXSjYWZ
 Ky7pYD/Wws7A57tCGkRyQYXfdainh/VVp4nem55oyyuqIxHzQRM0C0Bq7aCM79Px3P6O
 s4qJ0iGWyMY8DfmDJxdmT514qEQBx9moXcxPeSj22Iw0rqcOKu5Ad41EEIi0oZN0tZKX
 h71o6hsLvzLZLkU0h8HxbRDQZ3/bM4tYYtvNo49QzoxQ9w5d2HBMD5ERA+hYbAueQD28
 r65WU58ZSNYdriAz6HFBk+Z8qA8iHxeAvK7cpfUB93lcnc5FWwc00qnmwDFg8uuGromN
 rhVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+fdIAJRjmy/rRR+RCbZVMEUtca3wMVBf5rN50QMs3So=;
 b=sM06xxZf6djQ93C+HUDufELh/c6/7nm/wcjs0ji/lIuZUefaEW3a0lsgQdTiEctsyi
 ynNpfce/zuoYPmzj9dj7VV/REjnBPwGjWuqLTkYWSwCSuQ3B3EY6+uK9s6JZ3anf4Yz7
 9Nsp6u37++eO+v8JqjK7XNMgnPVtyK0yqL3+i179XAG4QDUfjiOZRZcBB/was+M1zbko
 GKqxTBzwl4jYN+B/pPKu8JcvGi/r7gI0ubNTjANihVjpQd/jjU7kldxzYuOrZ4ZnHADf
 l22XtedgchzLRU4K7YIXuXib0kMnL32aTv681XH4LFbSf8CDye2jLt7aPk3TeLlru1fi
 ZkgQ==
X-Gm-Message-State: AOAM5339/zezi8UPcLV31w+Wl9i2nr/eVfvFL354iY5sire9bSlL5NmN
 Z5L3CsSE9rbdUlzEk0/5O8E=
X-Google-Smtp-Source: ABdhPJw7osy8VN0SR5WZS9ScPFqC3cP54TjG/bI/cqK0VsExF/NxvIMn/kzCXpkqssM0ilra1PLL8A==
X-Received: by 2002:a62:80ca:: with SMTP id j193mr4242287pfd.41.1590161877344; 
 Fri, 22 May 2020 08:37:57 -0700 (PDT)
Received: from [10.230.188.43] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id h4sm8086838pje.29.2020.05.22.08.37.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 May 2020 08:37:56 -0700 (PDT)
Subject: Re: [PATCH v4 5/5] mtd: rawnand: brcmnand: support v2.1-v2.2
 controllers
To: =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
 computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20200522072525.3919332-1-noltari@gmail.com>
 <20200522121524.4161539-1-noltari@gmail.com>
 <20200522121524.4161539-6-noltari@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <47f870ef-55d8-54b3-97df-2bdab8f1d77c@gmail.com>
Date: Fri, 22 May 2020 08:37:54 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200522121524.4161539-6-noltari@gmail.com>
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
IHYyLjE6IHRlc3RlZCBvbiBOZXRnZWFyIERHTkQzNzAwdjEgKEJDTTYzNjgpCj4gdjIuMjogdGVz
dGVkIG9uIE5ldGdlYXIgREdORDM3MDB2MiAoQkNNNjM2MikKPiAKPiBTaWduZWQtb2ZmLWJ5OiDD
gWx2YXJvIEZlcm7DoW5kZXogUm9qYXMgPG5vbHRhcmlAZ21haWwuY29tPgoKQWNrZWQtYnk6IEZs
b3JpYW4gRmFpbmVsbGkgPGYuZmFpbmVsbGlAZ21haWwuY29tPgotLSAKRmxvcmlhbgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
