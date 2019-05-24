Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6588729ABE
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 17:15:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ACFF8908D;
	Fri, 24 May 2019 15:15:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF7D96E113;
 Fri, 24 May 2019 15:15:29 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id v22so2354970wml.1;
 Fri, 24 May 2019 08:15:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=6RLj6uBqxlDEHcftopoYqSPMe+HfQgru4Z5e6MMtVTs=;
 b=uS8my1JINolHROmIn5p4HK25RUXeIW444yRDQ4KY2KyoXZ/kNRfaKgiWT3dpZaLQ6n
 efL4BAKR8BXV8Em4uZ2yllkZSCMzfpBGNqYR88XfuthwfWoKca+XQ4Os0FMZHOSl2dSN
 726eSo8Qs/qGVkIHKnPRD3ygYmDksyVwTux1fLtS3vTiSqpXljuqhNOC/2OjO4Xn5Tcn
 T6xMNbqH4B5ybwJNGKmGrz29Cdv5UuXo1ZJzonygcGNnmFlUinjDNgDs+ido9fto9BoJ
 yIcIS0v/L515b85MYeSWRgH+hQbl44etp/LVW8H3KjtwDvCRWJzwS+E52u3DDX4Qe9d0
 Zq/g==
X-Gm-Message-State: APjAAAW+AovkSGmkpZc5aEy8zx2n3Iyt/o7pU9Mb2q4c3BpsQXccO1bO
 O8b5P8B5FH6Qk07wKHaxsf0=
X-Google-Smtp-Source: APXvYqymxeKkirJyIFc2I2IlVno8n9Fn8LzrVjLEwMPqU0z3tf/J04w54AenV7w05+fq7u3H4gN4yA==
X-Received: by 2002:a7b:c317:: with SMTP id k23mr262914wmj.124.1558710928487; 
 Fri, 24 May 2019 08:15:28 -0700 (PDT)
Received: from arch-x1c3 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id h6sm2511261wrm.47.2019.05.24.08.15.27
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 24 May 2019 08:15:27 -0700 (PDT)
Date: Fri, 24 May 2019 16:14:07 +0100
From: Emil Velikov <emil.l.velikov@gmail.com>
To: Ben Skeggs <skeggsb@gmail.com>
Subject: Re: [PATCH 2/2] drm/nouveau: remove open-coded drm_invalid_op()
Message-ID: <20190524151407.GA8938@arch-x1c3>
References: <20190522150219.13913-1-emil.l.velikov@gmail.com>
 <20190522150219.13913-2-emil.l.velikov@gmail.com>
 <CACAvsv5Z7CZOirZrRB=88rCeZt0SvBvdDjbhSpOcfE9JA20hCg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACAvsv5Z7CZOirZrRB=88rCeZt0SvBvdDjbhSpOcfE9JA20hCg@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=6RLj6uBqxlDEHcftopoYqSPMe+HfQgru4Z5e6MMtVTs=;
 b=qIroWhmos+5lK0hIK9RSkOyTFt5hE3Sl22U3NwABg5WModDXhKvR4QcynagMyNk+Co
 XLlHJ9FozUI9ZxMs+EMpja5qrYaj7kbTYnRpO0TYpGoxTtEimqAEnwyhxxeJ4aQ9sOUf
 NeQ54w7sM0bhCSQaXn2B/mgRCIFUUfmA4uCtnyjSmBaBL0p9Hs+WLG2uyB4Qr065/vpE
 jO5T5oC9Y9guaTk3mWYW4qgXgXiLS6enX5daSZQEbotMNKzydZSVQk6ucUvjzajGql5U
 XFUKF3SdbmzN7PW1H9PuL2p8nb5egmKcGv/DWdB97zYjqBjauS0SC2+kYHZMlGUWMkxZ
 3OGA==
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
Cc: nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS8wNS8yMywgQmVuIFNrZWdncyB3cm90ZToKPiBPbiBUaHUsIDIzIE1heSAyMDE5IGF0
IDAxOjAzLCBFbWlsIFZlbGlrb3YgPGVtaWwubC52ZWxpa292QGdtYWlsLmNvbT4gd3JvdGU6Cj4g
Pgo+ID4gRnJvbTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KPiA+
Cj4gPiBDYzogQmVuIFNrZWdncyA8YnNrZWdnc0ByZWRoYXQuY29tPgo+ID4gQ2M6IG5vdXZlYXVA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiBTaWduZWQtb2ZmLWJ5OiBFbWlsIFZlbGlrb3YgPGVt
aWwudmVsaWtvdkBjb2xsYWJvcmEuY29tPgo+IFRoYW5rcyEKPiAKRm9yZ290IHRvIG1lbnRpb24s
IGFueSBvYmplY3Rpb25zIGlmIEkgdGFrZSB0aGlzIHRocm91Z2ggZHJtLW1pc2M/CkknbSBhYm91
dCB0byBzZW5kIGEgbGVuZ3RoeSBzZXJpZXMgd2hpY2ggd2lsbCBjb25mbGljdCB3aXRoIHRoaXMg
cGF0Y2gsCmFsYmVpdCB0cml2aWFsbHkuCgpUaGFua3MKRW1pbApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
