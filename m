Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A86BDAF647
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2019 09:01:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D1586EA21;
	Wed, 11 Sep 2019 07:01:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89E216E94F;
 Tue, 10 Sep 2019 18:15:51 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id u6so18026508edq.6;
 Tue, 10 Sep 2019 11:15:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language;
 bh=vr9wNAhM9c0yc/na27U5ugXbFrM/MxR/9UjrhSYk90Y=;
 b=XbtUIwDR86gAd8Ilu4N+oZxJAovEF0pD5OqHlA6C/b59NNiVyat8JS1fARMGAKOqmo
 J+LivSbM11uWCNmP5TflY0Fh6U12BWQUaobTFiG7cPCrFJ3ngLsEwqhCsSYQvJpzzIXa
 UPbSaeRpftZIBPsK0xVrdoRp3v85lNVbxNkaPa3Eyevi9wtPGdujVtYUmKsgMToA/Z8B
 rgB5OGUZydScV4lQX8bixO4dQVb0SGRXo4Ip4cwQgKU2BG5I5kQoHCksiao5YfNSdTRX
 cTh5Zqc/+Jk4LFsFX64BjDSvXDN0IPln+FTbLmT8teztANaQyWFq4nsETWUq2v/HBpFs
 XbwA==
X-Gm-Message-State: APjAAAWZiPZuipC5a8rFAaHnGfBV4sGhKKltwsdVsFLHnkXQ3c9FjBAP
 HhaSDb7akHDY56AOLWF634VFzEildf/7MQ==
X-Google-Smtp-Source: APXvYqwikUrAefuXNEtHxA9Cv3joSeqMNyDcw0gX0NulGFsx+wjagoLu7hrs9ywx1aJ22sWQnKogJQ==
X-Received: by 2002:a05:6402:1426:: with SMTP id
 c6mr15984979edx.53.1568139350223; 
 Tue, 10 Sep 2019 11:15:50 -0700 (PDT)
Received: from [192.168.64.105] (ip5f5bf6f8.dynamic.kabel-deutschland.de.
 [95.91.246.248])
 by smtp.gmail.com with ESMTPSA id z65sm3705137ede.86.2019.09.10.11.15.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2019 11:15:49 -0700 (PDT)
Subject: Re: [PATCH v7 0/7] qcom: add OCMEM support
To: Brian Masney <masneyb@onstation.org>, robdclark@gmail.com,
 sean@poorly.run, bjorn.andersson@linaro.org
References: <20190823121637.5861-1-masneyb@onstation.org>
 <20190901214045.GA14321@onstation.org>
From: Gabriel Francisco <frc.gabriel@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=frc.gabriel@gmail.com; keydata=
 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
 1elWpWNKH1LXFmGsIZn9
Message-ID: <2dd1a9db-a321-953d-8a46-23b4a8975570@gmail.com>
Date: Tue, 10 Sep 2019 20:15:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190901214045.GA14321@onstation.org>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 11 Sep 2019 07:01:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=vr9wNAhM9c0yc/na27U5ugXbFrM/MxR/9UjrhSYk90Y=;
 b=bdi2qozviog6c9+5Ze6ug+0JxrkJRiAp7RCPkWAH3N0wVIjH3pURnX+a12cQZv57t/
 LLOWzmv8Vqvg8GeB9HGctvR/R1v9tNpb9UVQiLskEig96be+xfJoQNOXkkOuTeeqly+L
 L2HmpG+QfmRkfNneSwNj648WwscHZKV0AasDHMuviTRXHsDxqlb6YUvEEP1/rjvNm9gc
 30Xd0BuJsmZGfosN6jTO0HJpUYHsgqc5J4Q9V7ZkzTV7veSUFGHN3HNjKbF1zoiTrGVk
 CiFRjCuzBS/RkSO8C+Ss08lQS3vuFwcF1+6q9ZGmobtdP0/B3qLQTXNAKiwFAFJUy3c7
 8Ncw==
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jonathan@marek.ca,
 airlied@linux.ie, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, agross@kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1133918661=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============1133918661==
Content-Type: multipart/alternative;
 boundary="------------7F6CA8B8CC8B88CF290782BB"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------7F6CA8B8CC8B88CF290782BB
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Tested-by: Gabriel Francisco <frc.gabriel@gmail.com>

On 9/1/19 11:40 PM, Brian Masney wrote:
> Hi Rob C / Sean P,
>
> On Fri, Aug 23, 2019 at 05:16:30AM -0700, Brian Masney wrote:
>> This patch series adds support for Qualcomm's On Chip MEMory (OCMEM)
>> that is needed in order to support some a3xx and a4xx-based GPUs
>> upstream. This is based on Rob Clark's patch series that he submitted
>> in October 2015 and I am resubmitting updated patches with his
>> permission. See the individual patches for the changelog.
> I talked to Bjorn in person at the Embedded Linux Conference over a
> week ago about this series. He thinks that this series should go through
> your tree. I assume it's too late for the upcoming merge window, which
> is fine. I just want to make sure that this series gets picked up for
> the following merge window.
>
> I just sent out a fix for a compiler error on MIPS as a separate patch:
> https://lore.kernel.org/lkml/20190901213037.25889-1-masneyb@onstation.org/
>
> Brian
>

--------------7F6CA8B8CC8B88CF290782BB
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <pre class="content"><span class="tested-by">Tested-by: Gabriel Francisco <a class="moz-txt-link-rfc2396E" href="mailto:frc.gabriel@gmail.com">&lt;frc.gabriel@gmail.com&gt;</a></span></pre>
    <div class="moz-cite-prefix">On 9/1/19 11:40 PM, Brian Masney wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:%3C20190901214045.GA14321@onstation.org%3E">
      <pre class="moz-quote-pre" wrap="">Hi Rob C / Sean P,

On Fri, Aug 23, 2019 at 05:16:30AM -0700, Brian Masney wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">This patch series adds support for Qualcomm's On Chip MEMory (OCMEM)
that is needed in order to support some a3xx and a4xx-based GPUs
upstream. This is based on Rob Clark's patch series that he submitted
in October 2015 and I am resubmitting updated patches with his
permission. See the individual patches for the changelog.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I talked to Bjorn in person at the Embedded Linux Conference over a
week ago about this series. He thinks that this series should go through
your tree. I assume it's too late for the upcoming merge window, which
is fine. I just want to make sure that this series gets picked up for
the following merge window.

I just sent out a fix for a compiler error on MIPS as a separate patch:
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/lkml/20190901213037.25889-1-masneyb@onstation.org/">https://lore.kernel.org/lkml/20190901213037.25889-1-masneyb@onstation.org/</a>

Brian

</pre>
    </blockquote>
  </body>
</html>

--------------7F6CA8B8CC8B88CF290782BB--

--===============1133918661==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1133918661==--
