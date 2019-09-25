Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D828EBD98D
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 10:07:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9E506EB38;
	Wed, 25 Sep 2019 08:07:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3F166EB34;
 Wed, 25 Sep 2019 08:07:51 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id m13so4620892ljj.11;
 Wed, 25 Sep 2019 01:07:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4v7Wf+DAshQTd4nYd4IoTH2u1ZWAFQEChs3cLOZfOeA=;
 b=TIzstJrA8AvEpuampUqL+psxwZnMot+mUXYQhCPxm1wqsBMCz9TxtXRfMzMHW8g1xD
 FZ4hTcP0POLxie/OUtQ85hlcy+Mx8Mvyjz5tbqVPreUJd0cao0uDEn5WJ5MNsSHlzScF
 Hxl3cgniLMiBZqKl9iE8T4ScKsy2W5ze8Ac2b4nRnih/2xZfieew0JFzTJvDOLN8cQnZ
 3Iw1Ed5J1tXhth8ugWu+ljSpUBFbTGlmp+1q1gnwj3Ok6GPLHAV1/yig5+bVfXII7nhT
 t4Xk0kx/FMNVM1zthpijRut/3GtdUggwesoMqP9p0qx1vvvA2weUEhz0Fjod+Y37TgCQ
 Qaeg==
X-Gm-Message-State: APjAAAU97xdJV/02K/3GPzJml2a/gDMhXUcWD04HjAt8O6YRRn+Vx4vT
 4wVHTBHILbigN8XswnrqYTc1Fe1efgXbIQv1Gf4=
X-Google-Smtp-Source: APXvYqwNki/fYqV5PzYHTTCNFU7nSYYnXP60Fp50QDTyCM6AWH2Q80CAChGE3qf7Ldq521jpwp3m4i37736qe0MCh3M=
X-Received: by 2002:a2e:3808:: with SMTP id f8mr4879149lja.7.1569398869965;
 Wed, 25 Sep 2019 01:07:49 -0700 (PDT)
MIME-Version: 1.0
References: <20180330204512.16863-1-tiwai@suse.de>
 <20180330204512.16863-2-tiwai@suse.de>
In-Reply-To: <20180330204512.16863-2-tiwai@suse.de>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 25 Sep 2019 18:07:38 +1000
Message-ID: <CAPM=9txseCB_0msp2_WoOAoi0iCRCoLsFgcqppiTyw+tD1Qe8A@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/amdgpu: Add modeset module option
To: Takashi Iwai <tiwai@suse.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=4v7Wf+DAshQTd4nYd4IoTH2u1ZWAFQEChs3cLOZfOeA=;
 b=lbQiXQ3P2AzDWiisQjItcm2A1kNUDC5euZXPrkw6BlrkKToz1CFU8SSxZAg8cRrygL
 VScjxapy4oVIa8AJF3OEtcJv4qY/2W1ld0E1GZevUF1bwh4eUl5n69Q9YZRLb2Vhh2wM
 hg5yYxI9cXozfqQzOCb6F2jBpYdRVEwQVek2/c2gfea6FuK7eR3CvnHNkzAydH3Fnyly
 Mm1b6wcqfBndaATeyD4Mt9bj7yGzuewAMxrQKMwaizPWRIkGPIrfhMYx8M2a+6ZjvLBP
 GmH83ZK3eKENJXp62Di2tNQSV/Xd1r++J4y476jL6n2yD0vNAZuofwVNAJdGTCZ8G/Fr
 Q21g==
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
Cc: David Airlie <airlied@linux.ie>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCAzMSBNYXIgMjAxOCBhdCAwNjo0NSwgVGFrYXNoaSBJd2FpIDx0aXdhaUBzdXNlLmRl
PiB3cm90ZToKPgo+IGFtZGdwdSBkcml2ZXIgbGFja3Mgb2YgbW9kZXNldCBtb2R1bGUgb3B0aW9u
IG90aGVyIGRybSBkcml2ZXJzIHByb3ZpZGUKPiBmb3IgZW5mb3JjaW5nIG9yIGRpc2FibGluZyB0
aGUgZHJpdmVyIGxvYWQuICBJbnRlcmVzdGluZ2x5LCB0aGUKPiBhbWRncHVfbW9kZSB2YXJpYWJs
ZSBkZWNsYXJhdGlvbiBpcyBhbHJlYWR5IGZvdW5kIGluIHRoZSBoZWFkZXIgZmlsZSwKPiBidXQg
dGhlIGFjdHVhbCBpbXBsZW1lbnRhdGlvbiBzZWVtcyB0byBoYXZlIGJlZW4gZm9yZ290dGVuLgo+
Cj4gVGhpcyBwYXRjaCBhZGRzIHRoZSBtaXNzaW5nIHBpZWNlLgoKSSdkIGxpa2UgdG8gbGFuZCB0
aGlzIHBhdGNoLCBJIHJlYWxpc2UgcGVvcGxlIGhhdmUgTkFLZWQgaXQgYnV0IGZvcgpjb25zaXN0
ZW5jeSBhY3Jvc3MgZHJpdmVycyBJJ20gZ29pbmcgdG8gYXNrIHdlIGxhbmQgaXQgb3Igc29tZXRo
aW5nCmxpa2UgaXQuCgpUaGUgbWFpbiB1c2UgY2FzZSBmb3IgdGhpcyBpcyBhY3R1YWxseSB3aGVy
ZSB5b3UgaGF2ZSBhbWRncHUgY3Jhc2hlcwpvbiBsb2FkLCBhbmQgeW91IHdhbnQgdG8gZGVidWcg
dGhlbSwgcGVvcGxlIGJvb3Qgd2l0aCBub21vZGVzZXQgYW5kCnRoZW4gbW9kcHJvYmUgYW1kZ3B1
IG1vZGVzZXQ9MSB0byBnZXQgdGhlIGNyYXNoIGluIGEgcnVubmluZyBzeXN0ZW0uClRoaXMgd29y
a3MgZm9yIG51bWVyb3VzIG90aGVyIGRyaXZlcnMsIEknbSBub3Qgc3VyZSB3aHkgYW1kZ3B1IG5l
ZWRzCnRvIGJlIHRoZSBvZGQgb25lIG91dC4KClJldmlld2VkLWJ5OiBEYXZlIEFpcmxpZSA8YWly
bGllZEByZWRoYXQuY29tPgoKRGF2ZS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
