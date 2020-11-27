Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDC42C6109
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 09:40:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97FC86E997;
	Fri, 27 Nov 2020 08:40:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43CF86E997
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 08:40:16 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id h19so4076689otr.1
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 00:40:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/D+lVsFpiig9p8Mfv+F/WnI4wKF69UpUHln9lDG06g4=;
 b=MK6trOUoj6Z+WgFzwE8VXa2B3hrNYthdJE5TXpOzs4Wtqjew0Piu4/LhPRlApBeJXK
 7CAGxwFFwz81AD0zQzHbuQxIXNlTxeZrNqnrGWcPm8sq7MSztf9Wh275tUPKLTp1urRo
 JTO/JEFfgo9ZK8bmjZ+NKP6mewwj/mpL6WnF7MhrzLr1Nt2PKiv1RffWanQ0SwGlc4D1
 8s2fzWc+befDXs4gObo6SeeKvJ3KB2BybyrqxIcceSbVB+xGKGOc+4SnKsuzbF7hoPp1
 duaaPDye6GZo3N4Yu9vBmKhCinxu90BCnkiwkVTdqbREBfErW6wtXqOw8MagfCr1wfHq
 GZ3g==
X-Gm-Message-State: AOAM5321kX6ipDraGznWXRhUEQv/MWqsFFwc2kvE3AoPXQwQ8hla96Dv
 HKbtyLRlNt0cPW9f+3Jk+3etNzEY6Zgbhzf45+M=
X-Google-Smtp-Source: ABdhPJy2I/IdfAm6V2ydZbwLB9NPNLYo9PucEpxX/NL/qzuCx8bfpYwJU7BhpITpgvBGwlFRBVNr8EmnqamS0CIYUsg=
X-Received: by 2002:a9d:686:: with SMTP id 6mr4709371otx.107.1606466415531;
 Fri, 27 Nov 2020 00:40:15 -0800 (PST)
MIME-Version: 1.0
References: <20201126165950.2554997-1-u.kleine-koenig@pengutronix.de>
 <20201126165950.2554997-2-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20201126165950.2554997-2-u.kleine-koenig@pengutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Nov 2020 09:40:04 +0100
Message-ID: <CAMuHMdW4J0xA6T4AWqZdo1go1kxWqVSSo5JXQpUAM4yWEpDdOw@mail.gmail.com>
Subject: Re: [PATCH 2/2] powerpc/ps3: make system bus's remove and shutdown
 callbacks return void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
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
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Jaroslav Kysela <perex@perex.cz>, Paul Mackerras <paulus@samba.org>,
 scsi <linux-scsi@vger.kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Alan Stern <stern@rowland.harvard.edu>, Jakub Kicinski <kuba@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, linux-block@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Geoff Levand <geoff@infradead.org>, netdev <netdev@vger.kernel.org>,
 USB list <linux-usb@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Jim Paris <jim@jtan.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVXdlLAoKT24gVGh1LCBOb3YgMjYsIDIwMjAgYXQgNjowMyBQTSBVd2UgS2xlaW5lLUvDtm5p
Zwo8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPiB3cm90ZToKPiBUaGUgZHJpdmVyIGNv
cmUgaWdub3JlcyB0aGUgcmV0dXJuIHZhbHVlIG9mIHN0cnVjdCBkZXZpY2VfZHJpdmVyOjpyZW1v
dmUKPiBiZWNhdXNlIHRoZXJlIGlzIG9ubHkgbGl0dGxlIHRoYXQgY2FuIGJlIGRvbmUuIEZvciB0
aGUgc2h1dGRvd24gY2FsbGJhY2sKPiBpdCdzIHBzM19zeXN0ZW1fYnVzX3NodXRkb3duKCkgd2hp
Y2ggaWdub3JlcyB0aGUgcmV0dXJuIHZhbHVlLgo+Cj4gVG8gc2ltcGxpZnkgdGhlIHF1ZXN0IHRv
IG1ha2Ugc3RydWN0IGRldmljZV9kcml2ZXI6OnJlbW92ZSByZXR1cm4gdm9pZCwKPiBsZXQgc3Ry
dWN0IHBzM19zeXN0ZW1fYnVzX2RyaXZlcjo6cmVtb3ZlIHJldHVybiB2b2lkLCB0b28uIEFsbCB1
c2Vycwo+IGFscmVhZHkgdW5jb25kaXRpb25hbGx5IHJldHVybiAwLCB0aGlzIGNvbW1pdCBtYWtl
cyBpdCBvYnZpb3VzIHRoYXQKPiByZXR1cm5pbmcgYW4gZXJyb3IgY29kZSBpcyBhIGJhZCBpZGVh
IGFuZCBlbnN1cmVzIGZ1dHVyZSB1c2VycyBiZWhhdmUKPiBhY2NvcmRpbmdseS4KPgo+IFNpZ25l
ZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXgu
ZGU+CgpUaGFua3MgZm9yIHlvdXIgcGF0Y2ghCgpSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9l
dmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4KCk5vdGUgdGhhdCB0aGUgc2FtZSBjYW4gYmUgZG9u
ZSBmb3IgcHMzX3Z1YXJ0X3BvcnRfZHJpdmVyLnJlbW92ZSgpLgoKR3J7b2V0amUsZWV0aW5nfXMs
CgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAt
LSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5v
cmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNh
bGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJ
IGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
