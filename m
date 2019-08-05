Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09990815E4
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 11:50:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA57589D57;
	Mon,  5 Aug 2019 09:50:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 645B689D57
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 09:50:51 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id u3so55502307vsh.6
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2019 02:50:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=05P0k5WPQILYhsTlraZFXXfQIfZBZj+7GhF8LSGKaJc=;
 b=Rzn8Ste5UBY4Ep8yFuvX5hfYJ9FUoibgfvdLUra6tBkdin9kdYukc4CtFNZwCeRZW0
 WD4Ii6bepLIi00ipUrWAqk9ApfTMGjHfxaP/P/e0UiKWjCIczDWDvkO4vcNHqvBE1rLT
 y6Tcm2jxSI8LVei01rRwExAd2XZw/ZwtzBtfHpYjbyi7XpLMQIQbvcWHkWgNSz0mO0Ba
 9LzINpgszBni1SV5Gve9Xm0Vsu0lXCJnHDfnbLdZfpVrRab2f0AJASIExBAq1gkCR/Qp
 6TgTqkg9DBpfP8kM1cYm0JMJWVbXHrzjHKlK0CBUfAwAc1abuQbW8GVNVujpjymLU/UD
 7Bgg==
X-Gm-Message-State: APjAAAWey15YoA7AZilPQfNhP5bIkM9FiGRzn0XiFRtnMBZnKezZK209
 RzaugXHJfbR85FRarDyb9rw/919KvFgml5K21j0=
X-Google-Smtp-Source: APXvYqwQ1ymMSKLp2d8VCV4UqvSdjazJ8nHJJ8qPEvXZDJPPPSFlivVPBANeXQnikUSZFHcQK3U3RY1IvX3taEucY6A=
X-Received: by 2002:a67:9946:: with SMTP id b67mr96073284vse.37.1564998650472; 
 Mon, 05 Aug 2019 02:50:50 -0700 (PDT)
MIME-Version: 1.0
References: <CA+quO7KJTrp_RpFJ8fpv6jCgKNv98uZLpU2sRe_ye-xTG6=4jA@mail.gmail.com>
 <20190730163510.GC14551@arch-x1c3>
 <CA+quO7+kJws7bSJRirFjc5YFROB+oVMJieU-cHnLu4ZLqGNQuA@mail.gmail.com>
In-Reply-To: <CA+quO7+kJws7bSJRirFjc5YFROB+oVMJieU-cHnLu4ZLqGNQuA@mail.gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 5 Aug 2019 10:50:02 +0100
Message-ID: <CACvgo51yfUhdsjvZvX3_H-N+a2zHzRbdX--9RzXJk9Pke1o8hw@mail.gmail.com>
Subject: Re: [PATCH] [v9] drm/panel: Add Boe Himax8279d MIPI-DSI LCD panel
To: Jerry Han <jerry.han.hq@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=05P0k5WPQILYhsTlraZFXXfQIfZBZj+7GhF8LSGKaJc=;
 b=ZJPO0V1EQgTSgBUgA3oO4zS+n1HC5B55Xh9JBkdH9577E6JJ5+sQKJ4NOxeMnEYZe9
 CcXwncNdDHxelk38tmy6EtqzEdX5fPxlWsCxXaQTtuQ/ZJucnebk2EljT9dbeEj4jUaS
 ZaTMsjj67MmFXDoo8jBJtApb7NyuzI3uTDhmV+NYWRg6S12hyb0cI1o5dttdLYx5v8/n
 4GTkAoDU3UurDpe5FMLPLm0SyA6n+o+q6142hpHAinx0NparIgQATQgkFASeTz8RO4FS
 QjwIOK+wfvCEichN2rg+tX+m7vzoT3PmW9zDVVgDG89M8Ipg54pFZWu4BB1n5K2TSNXN
 dJcw==
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
Cc: Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 Jitao Shi <jitao.shi@mediatek.com>, Derek Basehore <dbasehore@chromium.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>, Rock wang <rock_wang@himax.com.cn>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmVycnksCgpPbiBTYXQsIDMgQXVnIDIwMTkgYXQgMDM6MTEsIEplcnJ5IEhhbiA8amVycnku
aGFuLmhxQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBIaSBFbWlsOgo+Cj4gdGhhbmtzIGZvciB5b3Ug
YWR2aWNlLgo+ClBsZWFzZSB1c2UgaW50ZXJsZWF2ZWQgcG9zdGluZyBzdHlsZSAtIHRvcCBwb3N0
aW5nIGlzIGdlbmVyYWxseSBkaXNjb3VyYWdlZC4KU2VlIHRoZSB3aWtpcGVkaWEgYXJ0aWNsZSBm
b3IgZGV0YWlscyBbMV0uIEhlcmUgWzJdIGlzIG5vdyB0byBkbyB0aGF0IGZvciBHbWFpbC4KCj4g
VjE6IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC8yODc0MjUvCj4gVjI6
IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC8yODk4NDMvCj4gVjM6IGh0
dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC8yOTAzOTMvCj4gVjQ6IGh0dHBz
Oi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC8yOTAzOTYvCj4gVjU6IGh0dHBzOi8v
cGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC8yOTExMzEvICAgKG9ubHkgbW9kaWZ5Cj4g
Y29tbWl0IG1lc3NhZ2UgQWRkZWQgY2hhbmdlbG9nLCBubyBmaWxlcyBtb2RpZmllZCkKPiBWNjog
aHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzI5MTY1MC8KPiBWNzogaHR0
cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzI5NDE0MS8KPiBWODogaHR0cHM6
Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzMwMTkyNS8KPiBWOTogaHR0cHM6Ly9w
YXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzMyMDUxNC8KPgpUaGUgZG9jdW1lbnRhdGlv
biBJJ20gcmVmZXJyZWQgdG8gZWFybGllciBzYXlzIFszXToKIk5vIE1JTUUsIG5vIGxpbmtzLCBu
byBjb21wcmVzc2lvbiwgbm8gYXR0YWNobWVudHMuICBKdXN0IHBsYWluIHRleHQiCgpUaGFua3MK
RW1pbAoKWzFdIGh0dHBzOi8vZW4ud2lraXBlZGlhLm9yZy93aWtpL1Bvc3Rpbmdfc3R5bGUKWzJd
IGh0dHBzOi8vc3VwcG9ydC5nb29nbGUuY29tL21haWwvdGhyZWFkLzQwMjIyODA/bXNnaWQ9NDAy
MjcyOApbM10gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQv
dG9ydmFsZHMvbGludXguZ2l0L3RyZWUvRG9jdW1lbnRhdGlvbi9wcm9jZXNzL3N1Ym1pdHRpbmct
cGF0Y2hlcy5yc3Q/aD12NS4zLXJjMyNuMzQwCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
