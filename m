Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BAAA18B29B
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 12:52:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DE186EA05;
	Thu, 19 Mar 2020 11:52:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B87C06EA05
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 11:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584618738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DnZwtwPpShieOlN6E+sS7MIkzJo1csTHTK03X53XHOQ=;
 b=SqKcTPq4WRVrCJyg7ZvDJhrLhrSieIpaQPkuz52vmOkWojEOT65IcQEaaTc/0qmAqdL949
 wdErUhK4Kjqe6dVVeuSCtLsizsbO+QgM8RP27MsmwIrGVjCQPMJINC0ZIphbfilSYycLAm
 FvoKFIgdeYOo1r9Vr3oP5ijBWC7e4kg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-MAnXHWLeNhCzM6NzOVpEqQ-1; Thu, 19 Mar 2020 07:52:17 -0400
X-MC-Unique: MAnXHWLeNhCzM6NzOVpEqQ-1
Received: by mail-wr1-f71.google.com with SMTP id g4so880006wrv.12
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 04:52:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bSqCQIa8dKo0aksyBTyBrFu56A/ZrdPwygcYMEJzAjY=;
 b=I+2IzpLJYZBUTBCs8CqQRQr75ZYv1R/03M5QDt0enIJriW+pJpuFucZTliuKOJuPOv
 VY+Bl5OvY1cg5tGfs+CVVE5kB6UwoODhCTZS/foIocJ6eERdP74XYQXXs2etBnsm6M2M
 zmJFvG/WTBK7nPt8oX4aphOr9ZktJBm0kIxllEhMH3zQ7zid+XxbxpAxvKSdbfWvzm/M
 17dJPHI7fX6IVaAyl5NwG2p2grwfVz8OQyEK3NiBkoZk3QH7zhe+3fOVO8oyIX2Z9r4F
 +HDLN2VG09KRbwd1BuqUCS7nsOQB+FomPGJP1MxUE/s99pSCuvWWy+1vP96RnA4eUIK2
 jzoA==
X-Gm-Message-State: ANhLgQ15/3p3huANkYIbecvY6W9p8hu83FOD8wnUfCdxoHf5+DtNeEng
 exIlIRqEyaZUkAGOr2VkYHsvDobFUmE2CcKhARvXwtHVbvdsS0h9vjjkzi0DXMpZLDXDxB1mU1H
 MDtKBPE4R0NyLIbqsyluBxVrHb5pd
X-Received: by 2002:a5d:55cf:: with SMTP id i15mr3753663wrw.321.1584618735783; 
 Thu, 19 Mar 2020 04:52:15 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vt2duUv1xYk/2DH9vnEWuo0RQG9g7HcoZqRDI3AoUDp+cEYsi0ljhJ5NNZuU4rn5pSLpATINg==
X-Received: by 2002:a5d:55cf:: with SMTP id i15mr3753643wrw.321.1584618735480; 
 Thu, 19 Mar 2020 04:52:15 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-fc7e-fd47-85c1-1ab3.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:fc7e:fd47:85c1:1ab3])
 by smtp.gmail.com with ESMTPSA id p15sm3061136wro.68.2020.03.19.04.52.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Mar 2020 04:52:14 -0700 (PDT)
Subject: Re: Atomic KMS API lacks the ability to set cursor hot-spot
 coordinates
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Simon Ser <contact@emersion.fr>
References: <9d86bbe4-70cf-273d-4d61-aec06011d441@redhat.com>
 <ADrBkiVj05c2ZYEz46BNJrrChY-PCxme8HOeHHGOLjIR5XpBZoyIY5aUnSfXCm0wrYr0-Iuh80vnZqmRQ_jZaslv2Q2P7N6q5yCG0AeWovU=@emersion.fr>
 <5c9f7c0e-e225-dfbf-f5bf-cb1c1cc4ac08@redhat.com>
 <iUavRfIpwgaFwGrZtIM7seVfRwrvb2QVXC0KLN5wXLT7t_kX04NYFj2T5r0awLNPbIx2rO3UUO0BYH_HX1jMtJTQzBjInkghkF7WxkzxrII=@emersion.fr>
 <e0c0cb57-8a37-f70e-045f-3243411cbf03@daenzer.net>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <8db6e079-c88a-6b11-b77b-337059a139ba@redhat.com>
Date: Thu, 19 Mar 2020 12:52:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <e0c0cb57-8a37-f70e-045f-3243411cbf03@daenzer.net>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: =?UTF-8?Q?Jonas_=c3=85dahl?= <jadahl@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiAzLzE5LzIwIDEyOjM1IFBNLCBNaWNoZWwgRMOkbnplciB3cm90ZToKPiBPbiAyMDIw
LTAzLTE4IDQ6MjIgcC5tLiwgU2ltb24gU2VyIHdyb3RlOgo+Pj4KPj4+IE9uIDMvMTgvMjAgMzoz
OCBQTSwgU2ltb24gU2VyIHdyb3RlOgo+Pj4+Cj4+Pj4+IDEpIExldHRpbmcgdGhlIFZNLXZpZXdl
ciB3aW5kb3ctc3lzdGVtIGRyYXcgdGhlIGN1cnNvciBhcyBpdCBub3JtYWxseQo+Pj4+PiB3b3Vs
ZCBkcmF3IGl0Lgo+Pj4+Cj4+Pj4gV2h5IGlzIHRoaXMgaW1wb3J0YW50PyBDYW4ndCB0aGUgVk0g
dmlld2VyIGhpZGUgdGhlIGN1cnNvciBhbmQgdXNlIGEKPj4+PiBzdWItc3VyZmFjZSB0byBtYW51
YWxseSBkcmF3IHRoZSBjdXJzb3IgcGxhbmUgY29uZmlndXJlZCBieSB0aGUgZ3Vlc3Q/Cj4+Pgo+
Pj4gQmVjYXVzZSB0aGVuIG1vdmluZyB0aGUgY3Vyc29yIGFzIHNlZW4gYnkgdGhlIHVzZXIgcmVx
dWlyZXMgYSByb3VuZCB0cmlwCj4+PiB0aHJvdWdoIHRoZSBWTSBhbmQgdGhhdCBhZGRzIGxhdGVu
Y3ksIGVzcC4gd2hlbiB0aGUgVk0gdmlld2VyIGlzIHZpZXdpbmcKPj4+IGEgVk0gd2hpY2ggaXMg
cnVubmluZyBzb21ld2hlcmUgZWxzZSBvdmVyIHRoZSBuZXR3b3JrLgo+Pgo+PiBUaGUgdmlkZW8g
b3V0cHV0IGhhcyBsYXRlbmN5IGFueXdheS4KPiAKPiBTb3VuZHMgbGlrZSB5b3UndmUgbmV2ZXIg
dHJpZWQgdGhlIHR3byBkaWZmZXJlbnQgbW9kZXMgeW91cnNlbGY/IDopIElNRQo+IGl0IG1ha2Vz
IGEgYmlnIGRpZmZlcmVuY2UgZXZlbiB3aXRoIGEgbG9jYWwgVk0uIEV2ZW4gdmVyeSBsaXR0bGUg
bGF0ZW5jeQo+IGNhbiBtYWtlIHRoZSBjdXJzb3IgZmVlbCBhd2t3YXJkLCBsaWtlIGl0J3MgYmVp
bmcgaGVsZCBiYWNrIGJ5IGEgcnViYmVyCj4gYmFuZCBvciBzb21ldGhpbmcuCgpSaWdodCBub3Qg
dG8gbWVudGlvbiB0aGF0IHRoZSBsYXRlbmN5IG1heSBiZSB2YXJpYWJsZSwgc28gdGhlIGN1cnNv
cgptb3ZlcyBpbiBhIGppdHRlcnkgZmFzaGlvbiBpbnN0ZWFkIG9mIGhhdmluZyBpdCBtb3ZlIHNt
b290aGx5Cm1hdGNoaW5nIHRoZSBzbW9vdGggd2F5IGEgdXNlciBub3JtYWxseSBtb3ZlcyB0aGUg
bW91c2UuCgpUaGlzIHRvdGFsbHkgd3JlY2tzIGhhbmQtZXllIGNvb3JkaW5hdGlvbiBhbmQgaXMg
anVzdCBwbGFpbiBhd2VmdWxsLgoKUmVnYXJkcywKCkhhbnMKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
