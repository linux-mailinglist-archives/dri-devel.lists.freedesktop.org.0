Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 475A536D2B7
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 08:59:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECB716EAA5;
	Wed, 28 Apr 2021 06:59:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C37176EAA4;
 Wed, 28 Apr 2021 06:59:49 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id h10so72845714edt.13;
 Tue, 27 Apr 2021 23:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=vz8gvrfPui7057I9u7mhs9oOFT7FJnZuQGBjXC6vdW0=;
 b=MaMUzZJvitnNFHp7wvpPxWpItKIzWrwNCWTEWFNDrRqtGr4zpM/UzlotcGETFzKOl9
 Glr3bAhtPzwsmR1BtxwWaZuc/oVu4UaGcEzAlx3z4XrXygeuCo8+E6urPsE9GwfBQU5m
 GZRULIv6GSLA1DZIq7C3+3KQwkMc3BX44d34fLECcRcyc3nn9nngxaXeQ+AVHVRVezwH
 g2dVXe8JjxtxRA0XcFVyGFgb6wzZ2xoJ15lQbCDFowGTqWXl+T1kRd+3Abczw4pMLMVH
 VtqVzQFocqsIb099//1ev1aURfaFvllWEJu7xBgDJQnxwrPLptW/Kxy+u9ibLfZ/TSEW
 YurQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=vz8gvrfPui7057I9u7mhs9oOFT7FJnZuQGBjXC6vdW0=;
 b=P+LjrqYO+Ev6hLCHKaGv/AffaUgDB9SRKTC/dyYrI3mwrSaZsKZu7wtd4WD+aUYA7k
 78uThRNP/WbiULJ4Bbv8r/9X6Di6l55MsaI9wWvwRMROskjZ5qcWmdBa64fy2SocSD/F
 UbDWWzltKOTjg+dYwYu4z7AUGFDSAoat0foXcPgQ/HrtEwUtvuypmQdG01PCkrU6HA2e
 7Rq8XI87qwpQ+mUJiOi16zZV7Kn0dIY5W2IN8kKv/xKvYTV/yKiikyKGXBg1AkWA+iAE
 iEwFaY1rkLFZHCgoaGPVjPnH6WK9KMA4E7ILEm5hBiQiIN6B8LJ0tZkOsfAIU4UFceNK
 NMYA==
X-Gm-Message-State: AOAM5322lzwMCCkEnYBqZb7UwDp4wY7jzPkLj5JlWXzRt75MiqoTIWi5
 s2rVZbmLObl4VGYPYwKlQoWxc+Q15Uk=
X-Google-Smtp-Source: ABdhPJxIS5eApfV5xKNR8pD8BvLpuqi7iK/qFrtoqJ8nWRu0JuS2/mh4BE2HPc2I60zUr6G8gmo0jQ==
X-Received: by 2002:a50:ed0a:: with SMTP id j10mr8911432eds.22.1619593188459; 
 Tue, 27 Apr 2021 23:59:48 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:5565:6656:893b:2618?
 ([2a02:908:1252:fb60:5565:6656:893b:2618])
 by smtp.gmail.com with ESMTPSA id um2sm1332348ejb.4.2021.04.27.23.59.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Apr 2021 23:59:47 -0700 (PDT)
Subject: Re: [Mesa-dev] [RFC] Linux Graphics Next: Explicit fences everywhere
 and no BO fences - initial proposal
To: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 Dave Airlie <airlied@gmail.com>
References: <CAAxE2A4mpapnCE7uw8GNWkaRR4jXeoz9qa9j=9XknjR3yeq3YQ@mail.gmail.com>
 <CAPj87rMn_gabTdZpHGQVa16Log8xFe8fvhcL_WSC6tyOMvmY=w@mail.gmail.com>
 <CAOFGe96c1SxHiUBzapbVFx1h0aOwF=X8hcStVZmrw4OjrrG+Zg@mail.gmail.com>
 <CAPj87rPSW13nxz2n5E+n0JYcwGR3mFWJAG2kYaaoav7A-ZVD2g@mail.gmail.com>
 <CAKMK7uHyTiFWwQWdxVk1am+KoFA9DsTnJ658CAhzBYOyg7AdsA@mail.gmail.com>
 <CAPj87rM=qf78kUvys1irnR8Djh=CLjRdQJt1V4je82-=+yPWYw@mail.gmail.com>
 <CAKMK7uEAu4FgYwN9t9AMCqD2nVbkSRbGP3tST4nY1nKP26+vxA@mail.gmail.com>
 <CAPj87rOfv0w8jF4CO8PUHQXTfq+2GE=BDmRRWjOMkQ0wH3CPAA@mail.gmail.com>
 <CAAxE2A5pJ-D7AFbDJLKPDztr=yzOSDSm=3HrnJOWr3r96_KOQQ@mail.gmail.com>
 <YIfFC3YST0cfzd3l@phenom.ffwll.local>
 <CAAxE2A6APcJBwnbq58HOqc5bkHMsrzpiNnrso85kfBkRowwz+g@mail.gmail.com>
 <fada1543-612d-369e-765c-f90b718c2cfa@gmail.com>
 <CAPM=9tzz2u_qUXU9LMvtH_NDr1_wzunPo7Mt6NkrwAuowWTp7Q@mail.gmail.com>
 <CAAxE2A55Te6DjabYH8ELyfM03x2ZDaLsCsNC4Zqkrq0ExdpeHA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <153487a3-082b-faf7-2a4d-ae15993b2a5d@gmail.com>
Date: Wed, 28 Apr 2021 08:59:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAAxE2A55Te6DjabYH8ELyfM03x2ZDaLsCsNC4Zqkrq0ExdpeHA@mail.gmail.com>
Content-Language: en-US
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
Cc: ML Mesa-dev <mesa-dev@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0718983671=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============0718983671==
Content-Type: multipart/alternative;
 boundary="------------43F2F73D9288E69891373973"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------43F2F73D9288E69891373973
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Dave,

Am 27.04.21 um 21:23 schrieb Marek Olšák:
> Supporting interop with any device is always possible. It depends on 
> which drivers we need to interoperate with and update them. We've 
> already found the path forward for amdgpu. We just need to find out 
> how many other drivers need to be updated and evaluate the 
> cost/benefit aspect.
>
> Marek
>
> On Tue, Apr 27, 2021 at 2:38 PM Dave Airlie <airlied@gmail.com 
> <mailto:airlied@gmail.com>> wrote:
>
>     On Tue, 27 Apr 2021 at 22:06, Christian König
>     <ckoenig.leichtzumerken@gmail.com
>     <mailto:ckoenig.leichtzumerken@gmail.com>> wrote:
>     >
>     > Correct, we wouldn't have synchronization between device with
>     and without user queues any more.
>     >
>     > That could only be a problem for A+I Laptops.
>
>     Since I think you mentioned you'd only be enabling this on newer
>     chipsets, won't it be a problem for A+A where one A is a generation
>     behind the other?
>

Crap, that is a good point as well.

>
>     I'm not really liking where this is going btw, seems like a ill
>     thought out concept, if AMD is really going down the road of designing
>     hw that is currently Linux incompatible, you are going to have to
>     accept a big part of the burden in bringing this support in to more
>     than just amd drivers for upcoming generations of gpu.
>

Well we don't really like that either, but we have no other option as 
far as I can see.

I have a couple of ideas how to handle this in the kernel without 
dma_fences, but it always require more or less changes to all existing 
drivers.

Christian.

>
>     Dave.
>


--------------43F2F73D9288E69891373973
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    Hi Dave,<br>
    <br>
    <div class="moz-cite-prefix">Am 27.04.21 um 21:23 schrieb Marek
      Olšák:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAAxE2A55Te6DjabYH8ELyfM03x2ZDaLsCsNC4Zqkrq0ExdpeHA@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div>Supporting interop with any device is always possible. It
          depends on which drivers we need to interoperate with and
          update them. We've already found the path forward for amdgpu.
          We just need to find out how many other drivers need to be
          updated and evaluate the cost/benefit aspect.<br>
        </div>
        <div><br>
        </div>
        <div>Marek<br>
        </div>
      </div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Tue, Apr 27, 2021 at 2:38
          PM Dave Airlie &lt;<a href="mailto:airlied@gmail.com"
            moz-do-not-send="true">airlied@gmail.com</a>&gt; wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On
          Tue, 27 Apr 2021 at 22:06, Christian König<br>
          &lt;<a href="mailto:ckoenig.leichtzumerken@gmail.com"
            target="_blank" moz-do-not-send="true">ckoenig.leichtzumerken@gmail.com</a>&gt;
          wrote:<br>
          &gt;<br>
          &gt; Correct, we wouldn't have synchronization between device
          with and without user queues any more.<br>
          &gt;<br>
          &gt; That could only be a problem for A+I Laptops.<br>
          <br>
          Since I think you mentioned you'd only be enabling this on
          newer<br>
          chipsets, won't it be a problem for A+A where one A is a
          generation<br>
          behind the other?<br>
        </blockquote>
      </div>
    </blockquote>
    <br>
    Crap, that is a good point as well.<br>
    <br>
    <blockquote type="cite"
cite="mid:CAAxE2A55Te6DjabYH8ELyfM03x2ZDaLsCsNC4Zqkrq0ExdpeHA@mail.gmail.com">
      <div class="gmail_quote">
        <blockquote class="gmail_quote" style="margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
          <br>
          I'm not really liking where this is going btw, seems like a
          ill<br>
          thought out concept, if AMD is really going down the road of
          designing<br>
          hw that is currently Linux incompatible, you are going to have
          to<br>
          accept a big part of the burden in bringing this support in to
          more<br>
          than just amd drivers for upcoming generations of gpu.<br>
        </blockquote>
      </div>
    </blockquote>
    <br>
    Well we don't really like that either, but we have no other option
    as far as I can see.<br>
    <br>
    I have a couple of ideas how to handle this in the kernel without
    dma_fences, but it always require more or less changes to all
    existing drivers.<br>
    <br>
    Christian.<br>
    <br>
    <blockquote type="cite"
cite="mid:CAAxE2A55Te6DjabYH8ELyfM03x2ZDaLsCsNC4Zqkrq0ExdpeHA@mail.gmail.com">
      <div class="gmail_quote">
        <blockquote class="gmail_quote" style="margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
          <br>
          Dave.<br>
        </blockquote>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------43F2F73D9288E69891373973--

--===============0718983671==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0718983671==--
