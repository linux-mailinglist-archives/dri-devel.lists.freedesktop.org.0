Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C1A14DDCB
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2020 16:28:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67A496F9DC;
	Thu, 30 Jan 2020 15:28:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id DAC4F6F9DC
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2020 15:27:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 006222A6046;
 Thu, 30 Jan 2020 16:27:58 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id bAj7I0U2-K6K; Thu, 30 Jan 2020 16:27:58 +0100 (CET)
Received: from thor (252.80.76.83.dynamic.wline.res.cust.swisscom.ch
 [83.76.80.252])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 5DAED2A6045;
 Thu, 30 Jan 2020 16:27:58 +0100 (CET)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.93)
 (envelope-from <michel@daenzer.net>)
 id 1ixBjZ-000De6-Ly; Thu, 30 Jan 2020 16:27:57 +0100
Subject: Re: [PATCH libdrm RESEND 1/2] xf86drm: generalize the device
 subsystem type parsing code
To: Mikhail Golubev <Mikhail.Golubev@opensynergy.com>
References: <20200129183543.30023-1-Mikhail.Golubev@opensynergy.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Message-ID: <b3dc6b40-7541-1d36-45e1-97677a379533@daenzer.net>
Date: Thu, 30 Jan 2020 16:27:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200129183543.30023-1-Mikhail.Golubev@opensynergy.com>
Content-Language: en-CA
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
Cc: vasyl.vavrychuk@opensynergy.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkhpIE1pa2hhaWwsCgoKdGhhbmtzIGZvciB0aGUgcGF0Y2hlcy4KClBsZWFzZSBjcmVhdGUgYSBt
ZXJnZSByZXF1ZXN0IGJ5IGNsaWNraW5nIHRoZSAiRm9yayIgYnV0dG9uIG9uCmh0dHBzOi8vZ2l0
bGFiLmZyZWVkZXNrdG9wLm9yZy9tZXNhL2RybSwgcHVzaGluZyB0aGUgdHdvIGNvbW1pdHMgdG8g
YQpuZXcgYnJhbmNoIGluIHRoZSBuZXdseSBjcmVhdGVkIHJlcG9zaXRvcnksIGFuZCBvcGVuaW5n
IHRoZSBVUkwgaW4gdGhlCiJnaXQgcHVzaCIgb3V0cHV0LgoKVGhhbmtzLAoKCi0tIApFYXJ0aGxp
bmcgTWljaGVsIETDpG56ZXIgICAgICAgICAgICAgICB8ICAgICAgICAgICAgICAgaHR0cHM6Ly9y
ZWRoYXQuY29tCkxpYnJlIHNvZnR3YXJlIGVudGh1c2lhc3QgICAgICAgICAgICAgfCAgICAgICAg
ICAgICBNZXNhIGFuZCBYIGRldmVsb3BlcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
