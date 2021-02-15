Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3339D31C3FE
	for <lists+dri-devel@lfdr.de>; Mon, 15 Feb 2021 23:24:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 544F16E934;
	Mon, 15 Feb 2021 22:24:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB65F6E0DF
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 20:39:28 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id v3so5714766qtw.4
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 12:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=izMPWC9xzdGUwutm2Q6mM8UrXkyQ+i4Rd0btbUUbmuE=;
 b=Qt0K1XUEVhzGGmGW9DPr+ZslPovr8CzYvRlVZE6qa5zt86N4A6SmndrbogZUwOO3Rt
 TTxPfxPpmSBrXu9xKVJq7pZpe4Wl6COfBzooWrSSYg+9FrV7melBNwwcmELOvVLX8PQH
 G6gR5DAFvW3LRvW8BMnuRS/Fc3+v10M4GMCNsjLDwrXu/fG0nWelO/ujXQWE/NFH6sGY
 2kK4sQioDdTzWquAZrlDhFU4gDOZpGNZvVPYMFHaUic5i9uJo5REqwTQm9XtOf84CDmn
 iVGtl52LvSHafrOhRfg2DVIictloHr3dVciOJv3vyyoeSIXlJzGymZhO4ZvUJ7vePLCj
 pImg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=izMPWC9xzdGUwutm2Q6mM8UrXkyQ+i4Rd0btbUUbmuE=;
 b=CGmBANfQf2Ps4i14LTap8j3Gej0YrAHQJ4s3/V9Evud9LeYUYaugkCqx9e8GUEjmgp
 s4qeMkWwFnT/2+KF8nptYhS6aeIaZgH62j/zLXdDznkGdYLPoM+t8admW0M1yieQ47aB
 q32aNVPeWg3Igtdda9HVOUgNh4TIduEmiz33GQZhbxfO6PUYS12KPzLmW/g7tlPINDNp
 Hh+0jL55iNbNpqrfsuqL3zZXFM8W4lbeO3cVixare77STLC/WPn8rUsNOyX/XzHX+bsR
 hNwMd8GFp/qPIMIFsRlte7a1n2794+/JAanYvM8LEVcSb/7amJK/ppR6zFHlANPutqVj
 v7Uw==
X-Gm-Message-State: AOAM531ZFMge6IPmTLV04kGfBRa+PwXwHvNhO4s59Gjc4OXyIG9POou3
 Cs+DK/OzeZEvr/xNTSC22C9vxw==
X-Google-Smtp-Source: ABdhPJxWqkD3hf4mY/GDpcC4EsRa6i2RiBg3HXU3ro5LrIrS77GYinDVNo+FQ5vbq0WTSCZrhq389g==
X-Received: by 2002:ac8:7456:: with SMTP id h22mr15833673qtr.297.1613421567977; 
 Mon, 15 Feb 2021 12:39:27 -0800 (PST)
Received: from nicolas-tpx395.lan (173-246-12-168.qc.cable.ebox.net.
 [173.246.12.168])
 by smtp.gmail.com with ESMTPSA id i5sm13131110qkg.32.2021.02.15.12.39.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 12:39:27 -0800 (PST)
Message-ID: <cdb508e49eb1439f4e4c327d2a6738f219e04bf8.camel@ndufresne.ca>
Subject: Re: DMA-buf and uncached system memory
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 linux-media <linux-media@vger.kernel.org>, dri-devel
 <dri-devel@lists.freedesktop.org>,  linaro-mm-sig@lists.linaro.org, lkml
 <linux-kernel@vger.kernel.org>
Date: Mon, 15 Feb 2021 15:39:25 -0500
In-Reply-To: <91ff0bbb-ea3a-2663-3453-dea96ccd6dd8@amd.com>
References: <91ff0bbb-ea3a-2663-3453-dea96ccd6dd8@amd.com>
User-Agent: Evolution 3.38.3 (3.38.3-1.fc33) 
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 15 Feb 2021 22:24:30 +0000
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
Cc: "Sharma, Shashank" <Shashank.Sharma@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TGUgbHVuZGkgMTUgZsOpdnJpZXIgMjAyMSDDoCAwOTo1OCArMDEwMCwgQ2hyaXN0aWFuIEvDtm5p
ZyBhIMOpY3JpdMKgOgo+IEhpIGd1eXMsCj4gCj4gd2UgYXJlIGN1cnJlbnRseSB3b3JraW5nIGFu
IEZyZWVzeW5jIGFuZCBkaXJlY3Qgc2NhbiBvdXQgZnJvbSBzeXN0ZW0gCj4gbWVtb3J5IG9uIEFN
RCBBUFVzIGluIEErQSBsYXB0b3BzLgo+IAo+IE9uIHByb2JsZW0gd2Ugc3R1bWJsZWQgb3ZlciBp
cyB0aGF0IG91ciBkaXNwbGF5IGhhcmR3YXJlIG5lZWRzIHRvIHNjYW4gCj4gb3V0IGZyb20gdW5j
YWNoZWQgc3lzdGVtIG1lbW9yeSBhbmQgd2UgY3VycmVudGx5IGRvbid0IGhhdmUgYSB3YXkgdG8g
Cj4gY29tbXVuaWNhdGUgdGhhdCB0aHJvdWdoIERNQS1idWYuCj4gCj4gRm9yIG91ciBzcGVjaWZp
YyB1c2UgY2FzZSBhdCBoYW5kIHdlIGFyZSBnb2luZyB0byBpbXBsZW1lbnQgc29tZXRoaW5nIAo+
IGRyaXZlciBzcGVjaWZpYywgYnV0IHRoZSBxdWVzdGlvbiBpcyBzaG91bGQgd2UgaGF2ZSBzb21l
dGhpbmcgbW9yZSAKPiBnZW5lcmljIGZvciB0aGlzPwoKSG9wZWZ1bGx5IEknbSBnZXR0aW5nIHRo
aXMgcmlnaHQsIGJ1dCB0aGlzIG1ha2VzIG1lIHRoaW5rIG9mIGEgbG9uZyBzdGFuZGluZwppc3N1
ZSBJJ3ZlIG1ldCB3aXRoIEludGVsIERSTSBhbmQgVVZDIGRyaXZlci4gSWYgSSBsZXQgdGhlIFVW
QyBkcml2ZXIgYWxsb2NhdGUKdGhlIGJ1ZmZlciwgYW5kIGltcG9ydCB0aGUgcmVzdWx0aW5nIERN
QUJ1ZiAoY2FjaGVhYmxlIG1lbW9yeSB3cml0dGVuIHdpdGggYSBjcHUKY29weSBpbiB0aGUga2Vy
bmVsKSBpbnRvIERSTSwgd2UgY2FuIHNlZSBjYWNoZSBhcnRpZmFjdCBiZWluZyBkaXNwbGF5ZWQu
IFdoaWxlCmlmIEkgdXNlIHRoZSBEUk0gZHJpdmVyIG1lbW9yeSAoZHVtYiBidWZmZXIgaW4gdGhh
dCBjYXNlKSBpdCdzIGNsZWFuIGJlY2F1c2UKdGhlcmUgaXMgYSBkcml2ZXIgc3BlY2lmaWMgc29s
dXRpb24gdG8gdGhhdC4KClRoZXJlIGlzIG5vIG9idmlvdXMgd2F5IGZvciB1c2Vyc3BhY2UgYXBw
bGljYXRpb24gdG8ga25vdyB3aGF0J3MgaXMgcmlnaHQvd3JvbmcKd2F5IGFuZCBpbiBmYWN0IGl0
IGZlZWxzIGxpa2UgdGhlIGtlcm5lbCBjb3VsZCBzb2x2ZSB0aGlzIHNvbWVob3cgd2l0aG91dCBo
YXZpbmcKdG8gaW5mb3JtIHVzZXJzcGFjZSAocGVyaGFwcykuCgo+IAo+IEFmdGVyIGFsbCB0aGUg
c3lzdGVtIG1lbW9yeSBhY2Nlc3MgcGF0dGVybiBpcyBhIFBDSWUgZXh0ZW5zaW9uIGFuZCBhcyAK
PiBzdWNoIHNvbWV0aGluZyBnZW5lcmljLgo+IAo+IFJlZ2FyZHMsCj4gQ2hyaXN0aWFuLgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
