Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFA1474A3
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jun 2019 15:19:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3C7A891AA;
	Sun, 16 Jun 2019 13:19:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37213891AA
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jun 2019 13:19:10 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id u124so4555871vsu.2
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jun 2019 06:19:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8iplv7uQgw/+4xNWf4HBLL9iQcZLe+I+mKeQjpBgPhs=;
 b=gQ8lk2RJA0oTI1Ti23kF316JfSxZpvtACM0MijVV/QfCgpQeMlDBu6AbnKmE6gvWlv
 B1ydALGmN5GAZOWFwGIMno9qbpXgLVgcqrdWfwRZ3L8YuYVo+GnQDqU5gTBbQ7DZMHo/
 +UTVwq1iI3Fqor9Ig0cRJDMA9nDarfz/FOyNTJdQ0T0J39eTt/h5AlLfM0ncIZ37sirQ
 sl8MWFfUR3dUTjE48UhD2zhA8BMUcXqSJM5/srmHcHP7Yg/IoiRnjKL0k4DkK7Zu6FfT
 3rWtbTGY31GO1sM/30q379GWcWjEtPA09yPiftb3tVynZXm8yF0vNNlBddvjEYYivOdf
 FhtQ==
X-Gm-Message-State: APjAAAUWM+LIPwsSuswf+gYstJFhkiImD7UATJyfjQT4Q/Pzn3pOpjIO
 xL9Tu21eX2ZTvlTQ4kma1cC8bUVnf1a87OsaN7ksqg==
X-Google-Smtp-Source: APXvYqwBa1kfXkc5JoMZLb/sCwTp1aGCjn+ekI20lzsVoN5L9xdOk7scruETm6eXzOh9D1GFr+BZbgWr2lmfcC+tdcU=
X-Received: by 2002:a67:7fd8:: with SMTP id a207mr34248367vsd.85.1560691149186; 
 Sun, 16 Jun 2019 06:19:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190602181600.83963-1-zeising@daemonic.se>
 <20190602181600.83963-3-zeising@daemonic.se>
In-Reply-To: <20190602181600.83963-3-zeising@daemonic.se>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Sun, 16 Jun 2019 14:16:59 +0100
Message-ID: <CACvgo52ZrYEq+R4gpLFfMsaGy+uWQ0gPBUA2PVHe=7ihu0rr-g@mail.gmail.com>
Subject: Re: [PATCH libdrm 2/2] meson.build: Fix meson script on FreeBSD
To: Niclas Zeising <zeising@daemonic.se>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=8iplv7uQgw/+4xNWf4HBLL9iQcZLe+I+mKeQjpBgPhs=;
 b=FJPBIC4svbXKtzlZmEUPzG1ckmG63yn8FM39rjacRocP7Ff9T+dqJj/DNDqg0ie2Tc
 dcwBI0HaJESIrmGqc0aTN+Xcu1mJQjaJbjF5Bz+3K0Y65WeRpO51pW9ZF8elIGLSSz9B
 5loxucq063FPCixoWMYoknEbTE/Qg1BQdfvLq32aG4xNmrQ00193K65/6DiTrW+1SneQ
 Gl0/VkAEzL+oI/W/Mgk53th6CoibIFMdAk38m7crQzzzsJYcBluGot7xupcPm5yVsVqv
 5pRX14Q39EmtyfW4Yw4I9xZIjMuVwIsUccg+Q7oGaxlyyndZaLNDXiORWDWUZbE0aIR9
 3uRQ==
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAzIEp1biAyMDE5IGF0IDA4OjQxLCBOaWNsYXMgWmVpc2luZyA8emVpc2luZ0BkYWVt
b25pYy5zZT4gd3JvdGU6Cj4KPiBGcmVlQlNEIHJlcXVpcmVzIHN5cy90eXBlcy5oIGZvciBzeXMv
c3lzY3RsLmgsIGFkZCBpdCBhcyBwYXJ0IG9mIHRoZQo+IGluY2x1ZGVzIHdoZW4gY2hlY2tpbmcg
Zm9yIGhlYWRlcnMuCj4gSW5zdGVhZCBvZiBzcGxpdHRpbmcgb3V0IHRoZSBjaGVjayBmb3Igc3lz
L3N5c2N0bC5oIGZyb20gdGhlIG90aGVyCj4gaGVhZGVyIGNoZWNrcywganVzdCBhZGQgc3lzL3R5
cGVzLmggdG8gYWxsIGhlYWRlciBjaGVja3MuCj4KSWYgaGVhZGVyIFggZGVwZW5kcyBvbiBZLCB0
aGVuIHRoZSBmb3JtZXIgc2hvdWxkIGluY2x1ZGUgWS4KQ2FuIHlvdSBwbGVhc2UgZmlsZSBhIEZy
ZWVCU0QgYnVnPwoKVGhhdCBzYWlkLCB0aGUgd29ya2Fyb3VuZCBpcyBzYWZlLCBzbyBJJ2xsIHNw
bGl0IGl0IG91dCArIGFkZCBhIGNvbW1lbnQuCkknbGwgc2VuZCB2MiBpbiBhIHNlY29uZC4KCj4g
RnJlZUJTRCBkb2Vzbid0IG5vcm1hbGx5IHNoaXAgYmFzaCwgdHJ5IHJlZ3VsYXIgc2ggaW5zdGVh
ZCBpZiB3ZSBjYW4ndAo+IGZpbmQgYmFzaC4KCkFjdHVhbGx5IG5vdCBzdXJlIHdoeSB3ZSdyZSBs
b29raW5nIGZvciBiYXNoLiBUaGUgbG90IHdvcmtzIGZpbmUgd2l0aApiYXNoLCB6c2gsIGRhc2gs
IGtzaCB5b3UtbmFtZSBpdC4KV2lsbCBpbmNsdWRlIHRob3NlIHdpdGggdjIuCgotRW1pbApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
