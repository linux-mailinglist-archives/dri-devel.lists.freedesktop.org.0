Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22AD7210863
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 11:40:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 369316E875;
	Wed,  1 Jul 2020 09:40:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5B6C6E875
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 09:40:30 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 17so22482272wmo.1
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jul 2020 02:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=BJJG2wzmcKcgzP90icVewmydLccbwxcTMMfa0F7nTzo=;
 b=NnectWHJuD3FhHSx4SRvC2kNtMOy35yn5XwYCtWMKfyy1SaDQ2RuUeoTuAAM5yAQw9
 ytOxyOADQaC0BG39AhM/iqLsa5xVrhShGzXzfxErBWAYkPzHQHfo+9hZhQ7B912TbKDt
 PMKGrj8pQuLLo3poUMpsFREzzjHY7ZK8PvKvZqpg0eklAdfx2lSfBQQRjcf8/pfCh9Mr
 ypLCF7Uz5TWQHmoQWa3cGoboEa5XaJ0mzvpPho2ohIgEJes6sMT+ib3vAlylP4s8uDcM
 Izru9M6dyiQf3DZj0TEjrYH1l/8A/wejLh9P4G3T71DKGdQiUAAgmmpAXayWSn85JzRs
 UvgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=BJJG2wzmcKcgzP90icVewmydLccbwxcTMMfa0F7nTzo=;
 b=nk3V9JckjmAwGdlG1/k5TmXS8pzBJHJalzdM6xHaDSi/YRBwKztjw/x98j3CP1BUjl
 soFIj8FcBvl2j1yxKEnVc1Bprd6+LQzGED3qnIJU14322mbWCZJgLzIlZDnRzsT7a0CD
 j9wv40V6kUhm/RtK+ne32olwczzNimOcI+Blfj0BYLmomrRC9m3VnEYTSV/trjLfCg9J
 jN5Wo7gIpufaZ6J4pcabHPNoTl372Nfs3GNI14cbfN3jJM9XccupDEzmxRLZ2+04Mne7
 Wb2ifs+tHD7WwAqNBsQFFPHXbKRjTJoPQkoCQFwDU5NipM5rOM1fhIi5W8c2lcCFchn/
 bZLw==
X-Gm-Message-State: AOAM5311ePZYKultnhKTTua5/GbuNMAqVpvHMLfM/fQLKMZF61e/SxZ0
 SrJQGBZ6OIuQUhHhlhA1VTiy1w==
X-Google-Smtp-Source: ABdhPJzEJe7Xzk3yHb+4KodW3SQLukXoK/fytASJcrYjv29v9kNZv1Dt+jBYS1+GOZimHf3zn8lgfg==
X-Received: by 2002:a1c:2044:: with SMTP id g65mr28205339wmg.16.1593596429408; 
 Wed, 01 Jul 2020 02:40:29 -0700 (PDT)
Received: from dell ([2.27.35.144])
 by smtp.gmail.com with ESMTPSA id v20sm6193735wmh.26.2020.07.01.02.40.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2020 02:40:28 -0700 (PDT)
Date: Wed, 1 Jul 2020 10:40:26 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] backlight: sky81452: Privatize platform data
Message-ID: <20200701094026.GA1179328@dell>
References: <20200626203742.336780-1-linus.walleij@linaro.org>
 <20200626203742.336780-2-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200626203742.336780-2-linus.walleij@linaro.org>
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
Cc: Jingoo Han <jingoohan1@gmail.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Gyungoh Yoo <jack.yoo@skyworksinc.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyNiBKdW4gMjAyMCwgTGludXMgV2FsbGVpaiB3cm90ZToKCj4gVGhlIG9ubHkgd2F5
IHRoZSBwbGF0Zm9ybSBkYXRhIGZvciB0aGUgU0tZODE0NTIgZXZlciBnZXRzIHBvcHVsYXRlZAo+
IGlzIHRocm91Z2ggdGhlIGRldmljZSB0cmVlLgo+IAo+IFRoZSBNRkQgZGV2aWNlIGlzIGJvdGhl
cmVkIHdpdGggdGhpcyBmb3Igbm8gcmVhc29uIGF0IGFsbC4gSnVzdAo+IGFsbG9jYXRlIHRoZSBw
bGF0Zm9ybSBkYXRhIGluIHRoZSBkcml2ZXIgYW5kIGJlIGhhcHB5Lgo+IAo+IENjOiBHeXVuZ29o
IFlvbyA8amFjay55b29Ac2t5d29ya3NpbmMuY29tPgo+IFNpZ25lZC1vZmYtYnk6IExpbnVzIFdh
bGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KPiAtLS0KPiAgZHJpdmVycy9tZmQvc2t5
ODE0NTIuYyAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgLQo+ICBkcml2ZXJzL3ZpZGVvL2Jh
Y2tsaWdodC9za3k4MTQ1Mi1iYWNrbGlnaHQuYyAgfCAzNCArKysrKysrKysrKysrLS0tLQo+ICBp
bmNsdWRlL2xpbnV4L21mZC9za3k4MTQ1Mi5oICAgICAgICAgICAgICAgICAgfCAgMiAtCj4gIC4u
Li9saW51eC9wbGF0Zm9ybV9kYXRhL3NreTgxNDUyLWJhY2tsaWdodC5oICB8IDM3IC0tLS0tLS0t
LS0tLS0tLS0tLS0KPiAgNCBmaWxlcyBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspLCA0OCBkZWxl
dGlvbnMoLSkKPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvbGludXgvcGxhdGZvcm1fZGF0
YS9za3k4MTQ1Mi1iYWNrbGlnaHQuaAoKQXBwbGllZCwgdGhhbmtzLgoKLS0gCkxlZSBKb25lcyBb
5p2O55C85pavXQpTZW5pb3IgVGVjaG5pY2FsIExlYWQgLSBEZXZlbG9wZXIgU2VydmljZXMKTGlu
YXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFybSBTb0NzCkZvbGxvdyBMaW5h
cm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
