Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 088784B2C4
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 09:11:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 974D16E2D1;
	Wed, 19 Jun 2019 07:11:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47FCA6E294;
 Wed, 19 Jun 2019 05:48:31 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id 83so8987437pgg.8;
 Tue, 18 Jun 2019 22:48:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vRg33IzeZ7gCOlL1rfll5ZpLs+PXtNmVRt29cMs9Ajc=;
 b=FDgihRoNAxvckI3p2vashzxpRjdFqwVcLqj4xmZefvmaaLyfVteNw7aOmRev5gNqka
 8v59SP3oAIlgSo8lUdV8ikCvpLk8mhj1aQ7q3RSKf27DDy8RuGjFddpiw2tiQIg6dJsw
 zwL+SzOL/uRAx11VQvdyEIJ4lG06otJ0yKr61uByyjZiid7UymMPDBKEAap7Uvvdmisp
 FCJS06bm0a4b/Vi1i+JVY1N/psl8mstQjP0zX/Uo7CmXJYP2zdAqTDfHPJvkOQrgDkTM
 gO7qGdF9JJOYKLIHggeZi/pBcr+U/XWGjUfXYBwJIuPUrNHvn6rDIZ2DXWoPsfw4OQWq
 o+Cg==
X-Gm-Message-State: APjAAAWQ3tmU6HYIMVf/+2kt/QO3TEcEgyE0Npg6TGcOkjZlpSMZqqBR
 otAKN/Pl0sPNPsWNmBhGgVY=
X-Google-Smtp-Source: APXvYqxIrkvJkpuuCUfCLmGtf+uSzSyTMm722+WFRYk41A34FHPZZZZLFplSLkkrVJXx+p9f7yrzNA==
X-Received: by 2002:a63:ca0f:: with SMTP id n15mr5914157pgi.197.1560923310824; 
 Tue, 18 Jun 2019 22:48:30 -0700 (PDT)
Received: from localhost ([175.223.10.253])
 by smtp.gmail.com with ESMTPSA id y21sm13843971pfe.172.2019.06.18.22.48.29
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 18 Jun 2019 22:48:30 -0700 (PDT)
Date: Wed, 19 Jun 2019 14:48:26 +0900
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: nouveau: DRM: GPU lockup - switching to software fbcon
Message-ID: <20190619054826.GA2059@jagdpanzerIV>
References: <20190614024957.GA9645@jagdpanzerIV>
 <20190619050811.GA15221@jagdpanzerIV>
 <CAKb7UvhdN=RUdfrnWswT4ANK5UwPcM-upDP85=84zsCF+a5-bg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKb7UvhdN=RUdfrnWswT4ANK5UwPcM-upDP85=84zsCF+a5-bg@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Approved-At: Wed, 19 Jun 2019 07:10:14 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=vRg33IzeZ7gCOlL1rfll5ZpLs+PXtNmVRt29cMs9Ajc=;
 b=jvlEAYgQ6zuc/XSMlLEyWt5CEKHcyEO5ngn7/7JaxQxZarajMzxweS/Q/5RU6m6ja0
 b/MLx3TAsLCqLAkLlrPn0+bzP+c9BHhgIttJIPg6kU8Tbn6GAQ0IBI3b4Nh3dmaLZzsS
 YhwE7j1sl/UqisvUCFuolR8siBYAtY3W9VkavTzO6uOWq/dvbHvZfPGHQ4tZPHDamSj2
 FUMpdfQbRL5RO01O90pBewn74uFHOzqwo1Lw+qLEYpb8r3skVKi+oYMq7QFBZ4IHSfJI
 8nF059Gxn3zgoE+Vx2RPD1fiMRg/dlU++1m4QemPqEUCunBdQUBu2ne9B9orpj19d82J
 gaww==
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
Cc: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gKDA2LzE5LzE5IDAxOjIwKSwgSWxpYSBNaXJraW4gd3JvdGU6Cj4gT24gV2VkLCBKdW4gMTks
IDIwMTkgYXQgMTowOCBBTSBTZXJnZXkgU2Vub3poYXRza3kKPiA8c2VyZ2V5LnNlbm96aGF0c2t5
LndvcmtAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiAoMDYvMTQvMTkgMTE6NTApLCBTZXJn
ZXkgU2Vub3poYXRza3kgd3JvdGU6Cj4gPiA+IGRtZXNnCj4gPiA+Cj4gPiA+ICBub3V2ZWF1IDAw
MDA6MDE6MDAuMDogRFJNOiBHUFUgbG9ja3VwIC0gc3dpdGNoaW5nIHRvIHNvZnR3YXJlIGZiY29u
Cj4gPiA+ICBub3V2ZWF1IDAwMDA6MDE6MDAuMDogZmlmbzogU0NIRURfRVJST1IgMGEgW0NUWFNX
X1RJTUVPVVRdCj4gPiA+ICBub3V2ZWF1IDAwMDA6MDE6MDAuMDogZmlmbzogcnVubGlzdCAwOiBz
Y2hlZHVsZWQgZm9yIHJlY292ZXJ5Cj4gPiA+ICBub3V2ZWF1IDAwMDA6MDE6MDAuMDogZmlmbzog
Y2hhbm5lbCA1OiBraWxsZWQKPiA+ID4gIG5vdXZlYXUgMDAwMDowMTowMC4wOiBmaWZvOiBlbmdp
bmUgNjogc2NoZWR1bGVkIGZvciByZWNvdmVyeQo+ID4gPiAgbm91dmVhdSAwMDAwOjAxOjAwLjA6
IGZpZm86IGVuZ2luZSAwOiBzY2hlZHVsZWQgZm9yIHJlY292ZXJ5Cj4gPiA+ICBub3V2ZWF1IDAw
MDA6MDE6MDAuMDogZmlyZWZveFs0NzZdOiBjaGFubmVsIDUga2lsbGVkIQo+ID4gPiAgbm91dmVh
dSAwMDAwOjAxOjAwLjA6IGZpcmVmb3hbNDc2XTogZmFpbGVkIHRvIGlkbGUgY2hhbm5lbCA1IFtm
aXJlZm94WzQ3Nl1dCj4gPiA+Cj4gPiA+IEl0IGxvY2t1cHMgc2V2ZXJhbCB0aW1lcyBhIGRheS4g
VHdpY2UgaW4ganVzdCBvbmUgaG91ciB0b2RheS4KPiA+ID4gQ2FuIHdlIGZpeCB0aGlzPwo+ID4K
PiA+IFVudXNhYmxlCj4gCj4gQXJlIHlvdSB1c2luZyBhIEdUWCA2NjAgYnkgYW55IGNoYW5jZT8g
WW91J3ZlIHByb3ZpZGVkIHJhdGhlciBtaW5pbWFsCj4gc3lzdGVtIGluZm8uCgowMTowMC4wIFZH
QSBjb21wYXRpYmxlIGNvbnRyb2xsZXI6IE5WSURJQSBDb3Jwb3JhdGlvbiBHSzIwOEIgW0dlRm9y
Y2UgR1QgNzMwXSAocmV2IGExKQoKCS1zcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
