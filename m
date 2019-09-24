Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B555BBD22E
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 20:56:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11BC56EADA;
	Tue, 24 Sep 2019 18:56:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADAF16EAE8
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2019 18:56:26 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6C89921848
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2019 18:56:26 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id y189so2910268qkc.3
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2019 11:56:26 -0700 (PDT)
X-Gm-Message-State: APjAAAX9GVso1+wNKbsCa2hLomNHJoii/qcXYfvmZ2IIivYWFNxBq7/m
 /yVTz2g/Z8238oYdbYAOO2IeHDZqGMFz71zKPg==
X-Google-Smtp-Source: APXvYqzgGJQAxwg29kI1BAufWxuS/v+zfPqBzGSeDOF57xsu58JMb98Gap3AA0MrWWA5pI6TPglIXyu9nnpsuaZGoBk=
X-Received: by 2002:a05:620a:549:: with SMTP id
 o9mr4215400qko.223.1569351385602; 
 Tue, 24 Sep 2019 11:56:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190923134449.22326-1-aford173@gmail.com>
 <20190923134449.22326-2-aford173@gmail.com>
In-Reply-To: <20190923134449.22326-2-aford173@gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 24 Sep 2019 13:56:14 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJB54aTWNxh+FsEOBRFEWXBi6WZE3pzqo+LJWM781v-PQ@mail.gmail.com>
Message-ID: <CAL_JsqJB54aTWNxh+FsEOBRFEWXBi6WZE3pzqo+LJWM781v-PQ@mail.gmail.com>
Subject: Re: [PATCH V2 2/3] dt-bindings: Add Logic PD Type 28 display panel
To: Adam Ford <aford173@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1569351386;
 bh=LSnxNkAK4K1j/IzwlV7DqnevZGMvr4ZQeIMxCU8J5vQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=tFN0/Q3HSpKyaXRS1ezEo/lWr3qRUDs/uDBOZ0JD5QKSQwx6572O13z/K2D64zcEk
 DLSyWNnDZgsD95DB5ZqPoXEfDReQiNObo9wmkZ0QGcvJHHs/KNSDVlQgkX4YCqLqsy
 Y1oAm6zkblqjwIwRCXs3k4IWGlVBmr37CG6SMiQQ=
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, adam.ford@logicpd.com,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 linux-omap <linux-omap@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgMjMsIDIwMTkgYXQgODo0NSBBTSBBZGFtIEZvcmQgPGFmb3JkMTczQGdtYWls
LmNvbT4gd3JvdGU6Cj4KPiBUaGlzIHBhdGNoIGFkZHMgZG9jdW1lbnRhdGlvbiBvZiBkZXZpY2Ug
dHJlZSBiaW5kaW5ncyBmb3IgdGhlIFdWR0EgcGFuZWwKPiBMb2dpYyBQRCBUeXBlIDI4IGRpc3Bs
YXkuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBZGFtIEZvcmQgPGFmb3JkMTczQGdtYWlsLmNvbT4KPiAt
LS0KPiBWMjogIFVzZSBZQU1MIGluc3RlYWQgb2YgVFhUIGZvciBiaW5kaW5nCgpGYWlscyB0byBi
dWlsZCB3aXRoICdtYWtlIGR0X2JpbmRpbmdfY2hlY2snOgoKaHR0cHM6Ly9wYXRjaHdvcmsub3ps
YWJzLm9yZy9wYXRjaC8xMTY2MDU3LwoKTG9va3MgbGlrZSBhIHRhYiBjaGFyYWN0ZXIgdXNlZCBw
ZXJoYXBzLgoKUm9iCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
