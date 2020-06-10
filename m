Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE6A1F62FD
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jun 2020 09:54:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E045B6E8A1;
	Thu, 11 Jun 2020 07:54:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38FAF6E119
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jun 2020 13:16:17 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id w15so1413840lfe.11
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jun 2020 06:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OXsw15cR+ZyosRfP5eToOJ+Kwm4SVk27QffhyUka7K4=;
 b=dklUVQIg0cT3POJq7VrrAhoxRlIBa2SLaAudlZk3GM2eJlmoCjen9saRJxYNj0cAih
 qkpNPi9TdjjWYjgkRYNF1qXExXURZgzmJt7q1qid+R6s8NfOU/wV7jEBciopsf0RRb+P
 VPuz6a8feC10FRIAEMC/mPnPzKO00Lf3b/RV3yehxe5qEd0Dgo2SEk15IxalksGB3elW
 CAZbEP/AzFyfojJ/LxQmtWIlkf563ahMSvjB/RAtxuqmoASw0dTBVQgINEenaYWFiB36
 VmWIND4olOFaOtuODEtSN88BC6VIrwyUSOC93ESyXNBWEvO0VZgqrYNQfGkYM0nMH6QT
 LTdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OXsw15cR+ZyosRfP5eToOJ+Kwm4SVk27QffhyUka7K4=;
 b=TmfMJU/MpcCW67Ae0reO2CwlJKMbxkhRLng+W3Jdr/z/lilzp2Ox4v6EGdsoey/yU4
 Mngz5xLoSiq9FtGf9MgaGpZxm+M3WYb3cS01diEnH/Ak4hO5xY+7/gKdSUEA6JH4yjHP
 rfh+wP7AE5TmrHqnZk+j0sDZzGoTBResYl918AJBHKA+O8j8c7sHQe/FIbPiRJw9ptEO
 Ugp98OUXunTH1rX2X42rJd6MQTvfJEtx2QCh/drbfS0a1nQVHC/xF6FVyd90xvisMl2t
 w5vUCl+hlHcyCtw1a1jcopWrQrBdNoInZDKs0AZuSmaItYlpuqmb9pHM6cRLDVKCNMXO
 dLVQ==
X-Gm-Message-State: AOAM531WQhV+23KOpFZpgmQxF3v78HDBDHLB0JAvheYRdrWFEtl8DLbq
 Yew+twaMemRfbRj4Y25GwG0=
X-Google-Smtp-Source: ABdhPJwAPrv2z4RRmB7XqNuKaIm0bk8kY6kw8F3Rh9nxZRK38Jk0ohshYLm/22qpCPoyJSAwGeImsw==
X-Received: by 2002:ac2:5cd1:: with SMTP id f17mr1631899lfq.4.1591794975611;
 Wed, 10 Jun 2020 06:16:15 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.googlemail.com with ESMTPSA id g12sm5001549ljl.33.2020.06.10.06.16.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jun 2020 06:16:15 -0700 (PDT)
Subject: Re: [PATCH] drm/tegra: Add zpos property for cursor planes
To: Thierry Reding <thierry.reding@gmail.com>
References: <20200610113059.2164132-1-thierry.reding@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ca53d82f-1fd0-b2da-cfbf-7183a977e1d1@gmail.com>
Date: Wed, 10 Jun 2020 16:16:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200610113059.2164132-1-thierry.reding@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 11 Jun 2020 07:54:02 +0000
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTAuMDYuMjAyMCAxNDozMCwgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPiBGcm9tOiBUaGll
cnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgo+IAo+IEFzIG9mIGNvbW1pdCA0ZGM1NTUy
NWIwOTUgKCJkcm06IHBsYW5lOiBWZXJpZnkgdGhhdCBubyBvciBhbGwgcGxhbmVzCj4gaGF2ZSBh
IHpwb3MgcHJvcGVydHkiKSBhIHdhcm5pbmcgaXMgZW1pdHRlZCBpZiB0aGVyZSdzIGEgbWl4IG9m
IHBsYW5lcwo+IHdpdGggYW5kIHdpdGhvdXQgYSB6cG9zIHByb3BlcnR5Lgo+IAo+IE9uIFRlZ3Jh
LCBjdXJzb3IgcGxhbmVzIGFyZSBhbHdheXMgY29tcG9zaXRlZCBvbiB0b3Agb2YgYWxsIG90aGVy
Cj4gcGxhbmVzLCB3aGljaCBpcyB3aHkgdGhleSBuZXZlciBoYWQgYSB6cG9zIHByb3BlcnR5IGF0
dGFjaGVkIHRvIHRoZW0uCj4gSG93ZXZlciwgc2luY2UgdGhlIGNvbXBvc2l0aW9uIG9yZGVyIGlz
IGZpeGVkLCB0aGlzIGlzIHRyaXZpYWwgdG8KPiByZW1lZHkgYnkgc2ltcGx5IGF0dGFjaGluZyBh
biBpbW11dGFibGUgenBvcyBwcm9wZXJ0eSB0byB0aGVtLgo+IAo+IFJlcG9ydGVkLWJ5OiBKb25h
dGhhbiBIdW50ZXIgPGpvbmF0aGFuaEBudmlkaWEuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFRoaWVy
cnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Cj4gLS0tCgpXaGF0IHByb2JsZW0gZG9lcyBp
dCBzb2x2ZT8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
